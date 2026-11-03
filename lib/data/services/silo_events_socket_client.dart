part of 'socket_handler.dart';

/// Silo's realtime socket (`/api/v2/events/ws`), on the same reconnect, close
/// and logging machinery as Jellyfin's and Emby's.
///
/// What differs is the handshake and the connection's life:
///
/// - Silo takes no token on the URL. Every connect first asks for a
///   single-use ticket (`POST /events/ws-ticket`, through the Silo client so
///   it carries the login and profile and can refresh a token that is due),
///   then offers the subprotocols `silo.events.v2` and `silo.ticket.<ticket>`.
/// - The channels are declared on the URL (`?channels=user_state,catalog`),
///   so no subscribe frame is owed. A server that still asks for one gets it.
/// - Silo ends every connection after five minutes, so the socket renews
///   itself shortly before that with a fresh ticket.
/// - A server that has the socket off (`GET /events/capabilities`) gets no
///   connection at all.
/// - When Silo says the login's access changed (an `access_changed` frame,
///   close code 4001), the Silo client forgets what the old access decided,
///   the app hears [siloAccessChangedEvent], and the socket reconnects at
///   once with a ticket under the new access.
///
/// Event and snapshot frames are gathered for a moment and handed to
/// [SiloEventsTranslator], which turns them into the `UserDataChanged` and
/// `LibraryChanged` messages Jellyfin and Emby send.
class SiloEventsSocketClient extends _ReconnectingWebSocketClient {
  SiloEventsSocketClient(
    MediaServerClient client, {
    super.connectTimeout,
    @visibleForTesting this.renewMargin = const Duration(seconds: 15),
  }) : super(client, 'Silo') {
    _ownChanges = siloClientOf(client)?.ownUserDataChanges.listen(
      _onOwnChange,
    );
  }

  /// This client's own stopped playback, which Silo's socket doesn't
  /// announce.
  StreamSubscription<String>? _ownChanges;

  /// Passed on as the `user_state.changed` Silo would have sent, so the
  /// item is read back and the lists holding it repaint, as for a change
  /// made on the web. Works whether or not the socket is connected.
  void _onOwnChange(String itemId) {
    final silo = _silo;
    if (_disposed || silo == null) return;
    _pending.add(
      SiloEventFrame(
        type: 'event',
        channel: 'user_state',
        event: 'user_state.changed',
        data: {
          'profile_id': silo.profileId,
          'content_id': itemId,
          'change': 'progress',
        },
      ),
    );
    _batchTimer ??= Timer(_batchWindow, _flush);
  }

  /// How long before Silo's limit the connection is renewed: enough for a
  /// ticket and a handshake, so the old socket is replaced before Silo closes
  /// it.
  final Duration renewMargin;

  Timer? _renewTimer;
  Duration? _maxConnection;
  bool _renewing = false;

  /// Read once per client: whether the server has the socket on. Asked again
  /// after a failure or an answer of "off", on the next connect.
  SiloEventsCapabilities? _capabilities;

  /// How long frames are gathered before they are translated. A change on
  /// the web often arrives as several events at once (a season marked
  /// watched is one per episode), and each item is read back once.
  static const _batchWindow = Duration(milliseconds: 300);

  final _pending = <SiloEventFrame>[];

  /// Set by an `access_changed` frame until the close that follows it.
  bool _accessChanged = false;
  Timer? _batchTimer;
  SiloEventsTranslator? _translator;

  SiloMediaServerClient? get _silo => siloClientOf(client);

  /// Silo connects through [openChannel], so there's no plain URL.
  @override
  Uri? buildUri() => null;

  @override
  Future<WebSocketChannel?> openChannel() async {
    final silo = _silo;
    if (silo == null || silo.accessToken == null) return null;
    final events = silo.eventsApi;

    final capabilities = _capabilities ??= await events.capabilities();
    if (!capabilities.available) {
      _capabilities = null;
      logLifecycle(
        'Silo events socket is off on this server '
        '(${capabilities.state}${capabilities.allowed ? '' : ', not allowed'})',
      );
      return null;
    }

    final opening = _disconnects;
    final SiloEventsTicket ticket;
    try {
      ticket = _renewalTicket ?? await events.createTicket();
      _renewalTicket = null;
    } on DioException catch (e) {
      // The profile's PIN proof no longer verifies (a PIN set or changed on
      // the profile since sign-in). Every ticket would be refused the
      // same way until the profile is unlocked again, so stop asking.
      if (e.error case SiloProblem(code: 'profile_verification_required')) {
        logFailure('Silo events socket stopped: the profile needs its PIN', e);
        return null;
      }
      rethrow;
    }
    // Called off while the ticket was on its way: open nothing.
    if (_disposed || opening != _disconnects) return null;
    _maxConnection = ticket.maxConnection;
    return WebSocketChannel.connect(
      events.socketUri(),
      protocols: ticket.offeredProtocols,
    );
  }

  @override
  void onConnected() {
    _renewalSnapshots = _renewing;
    _renewTimer?.cancel();
    final limit = _maxConnection;
    if (limit == null) return;
    var due = limit - renewMargin;
    if (due < const Duration(seconds: 1)) due = const Duration(seconds: 1);
    _renewTimer = Timer(due, _renew);
  }

  /// Replaces the connection before Silo's limit ends it. A connect closes
  /// the old socket first and opens a new one with a fresh ticket.
  void _renew() {
    _renewTimer = null;
    _renewing = true;
    unawaited(() async {
      try {
        // The ticket first, while the old connection still delivers: the
        // switch-over is then only the new handshake.
        _renewalTicket = await _silo?.eventsApi.createTicket();
      } catch (_) {
        // The connect asks again, and reports a failure as usual.
      }
      await connect();
    }().whenComplete(() {
      _renewing = false;
      _renewalTicket = null;
    }));
  }

  /// A ticket fetched before a renewal closes the old connection.
  SiloEventsTicket? _renewalTicket;

  /// Set on a connection that replaced the previous one on schedule. Its
  /// snapshots are dropped: the old connection was live until a moment
  /// before, so nothing was missed, and passing them on would make every
  /// list the Silo client keeps be read again every five minutes.
  bool _renewalSnapshots = false;

  /// A renewal every five minutes would fill the network log with
  /// "connected" lines, so only failures are logged while renewing.
  @override
  void logLifecycle(String message) {
    if (_renewing) return;
    super.logLifecycle(message);
  }

  @override
  void handleMessage(dynamic data) {
    final frame = SiloEventFrame.parse(data);
    if (frame == null) return;
    switch (frame.type) {
      case 'hello':
        // A declaration that took nothing leaves a subscribe frame owed, and
        // Silo closes a connection that doesn't send one within seconds.
        if (frame.requiredAction == 'subscribe') {
          channel?.sink.add(
            jsonEncode({
              'type': 'subscribe',
              'channels': SiloEventsApi.followedChannels,
            }),
          );
        }
      case 'subscribed':
        if (frame.rejected.isNotEmpty) {
          logLifecycle(
            'Silo events socket refused channels: ${frame.rejected.join(', ')}',
          );
        }
      case 'access_changed':
        // Silo closes with 4001 right after. [onServerClosed] acts on either.
        _accessChanged = true;
      case 'error':
        warn(
          'Silo events socket error',
          '${frame.code ?? 'unknown'}: ${frame.message ?? ''}',
        );
      case 'snapshot' when _renewalSnapshots:
        return;
      case 'event' || 'snapshot':
        _pending.add(frame);
        _batchTimer ??= Timer(_batchWindow, _flush);
      default:
    }
  }

  Future<void> _flush() async {
    _batchTimer = null;
    final silo = _silo;
    if (_pending.isEmpty || silo == null) return;
    final frames = List.of(_pending);
    _pending.clear();
    final translator = _translator ??= SiloEventsTranslator(silo);
    final messages = await translator.translate(frames);
    if (_disposed) return;
    messages.forEach(emit);
  }

  @override
  bool onServerClosed(int? closeCode) {
    final changed =
        _accessChanged || closeCode == siloEventsAccessChangedCloseCode;
    _accessChanged = false;
    if (!changed) return false;
    logLifecycle('Silo says this login\'s access changed');
    final silo = _silo;
    if (silo != null) {
      silo.userViewsApi.invalidateCache();
      (silo.usersApi as SiloUsersApi).forgetAccount();
      silo.itemsApi.noteCatalogChanged();
    }
    if (!_disposed) {
      emit(const ServerEventMessage(type: siloAccessChangedEvent));
    }
    // No backoff: Silo expects a new connection at once, and the new ticket
    // carries the new access, so the socket doesn't close again for it.
    return true;
  }

  /// Silo takes nothing but a subscribe frame on this socket, and Jellyfin's
  /// and Emby's feeds (`SessionsStart` and the like) mean nothing to it.
  @override
  void send(String messageType, [Object? data]) {}

  @override
  Future<void> disconnect() {
    _renewTimer?.cancel();
    _renewTimer = null;
    return super.disconnect();
  }

  /// Frames already received are still passed on when the socket is renewed
  /// or drops. Only a dispose (sign-out, another server) drops them.
  @override
  void dispose() {
    unawaited(_ownChanges?.cancel());
    _ownChanges = null;
    _batchTimer?.cancel();
    _batchTimer = null;
    _pending.clear();
    super.dispose();
  }
}
