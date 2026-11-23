import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'log_service.dart';

/// Runs one remote command the way the server's own socket would have
/// delivered it (Jellyfin's `Playstate` and `GeneralCommand` messages), and
/// completes once it has been carried out.
typedef SiloControlCommandHandler = Future<void> Function(
  ServerWebSocketMessage message,
);

/// Silo's playback control socket
/// (`/api/v2/playback/sessions/{id}/control/ws`, `silo.playback-control.v2`).
///
/// Silo sends what it has for one playing session on this lane, not on the
/// events socket: an administrator's message, pause, resume and stop, and a
/// restart notice. Without it the dashboard can't send a message at all, and
/// a pause or stop ends the session once its deadline passes.
///
/// The socket is extra, never something playback waits on. It opens after a
/// Silo session starts playing ([SiloPlaybackSessions.lifecycle]), closes when
/// the session ends, and a server without it, a refused ticket or a dropped
/// connection only means these commands don't arrive.
///
/// Each command is acknowledged at once, run through [SiloControlCommandHandler]
/// (the same handling as a Jellyfin remote), and answered with a result:
/// `completed`, or `rejected` for one Moonfin doesn't run, which also tells
/// Silo not to fall back to ending the session.
class SiloPlaybackControlSocket {
  SiloPlaybackControlSocket({
    required Stream<SiloPlaybackLifecycle> lifecycle,
    SiloPlaybackLifecycle? playingNow,
    required this._capabilities,
    required this._ticket,
    required this._uri,
    required this._handle,
    required this._clientVersion,
    bool Function(String sessionId)? playedHere,
    DateTime? Function()? accessExpiresAt,
    WebSocketChannel Function(Uri uri, List<String> protocols)? connect,
    @visibleForTesting this.connectTimeout = const Duration(seconds: 15),
    @visibleForTesting this.renewMargin = const Duration(minutes: 1),
    @visibleForTesting this.closeGrace = const Duration(seconds: 5),
    @visibleForTesting this.stableAfter = const Duration(seconds: 30),
    @visibleForTesting this.retryDelay,
    @visibleForTesting DateTime Function()? clock,
  }) : _playedHere = playedHere ?? ((_) => true),
       _accessExpiresAt = accessExpiresAt ?? (() => null),
       _clock = clock ?? DateTime.now,
       _connect =
           connect ??
           ((uri, protocols) =>
               WebSocketChannel.connect(uri, protocols: protocols)) {
    _lifecycleSub = lifecycle.listen(_onLifecycle);
    // A session already playing when the socket is made (a sign-in again
    // mid-movie) doesn't announce itself again.
    if (playingNow != null) _onLifecycle(playingNow);
  }

  /// The socket for [silo]'s playback sessions. [playedHere] says whether
  /// the app's own player plays a session: one handed to an external player
  /// gets no lane, so Silo keeps ending it on an admin stop as before.
  factory SiloPlaybackControlSocket.forClient(
    SiloMediaServerClient silo, {
    required SiloControlCommandHandler handle,
    required bool Function(String sessionId) playedHere,
  }) {
    final api = silo.playbackControlApi;
    final sessions = SiloPlaybackSessions.of(silo);
    return SiloPlaybackControlSocket(
      lifecycle: sessions.lifecycle,
      playingNow: sessions.playingNow,
      capabilities: api.capabilities,
      ticket: (sessionId, installationId) =>
          api.createTicket(sessionId, installationId: installationId),
      uri: api.socketUri,
      handle: handle,
      clientVersion: silo.deviceInfo.appVersion,
      playedHere: playedHere,
      // A token Silo gave no lifetime reads as already expiring, which
      // would renew every few seconds: Silo's own close covers it then.
      accessExpiresAt: () {
        final tokens = silo.session.tokens;
        if (tokens == null || tokens.lifetime <= Duration.zero) return null;
        return tokens.expiresAt;
      },
    );
  }

  /// The commands Moonfin runs, announced in the hello.
  static const supportedCommands = [
    'pause',
    'unpause',
    'play_pause',
    'stop',
    'display_message',
    'server_restarting',
    'server_shutting_down',
  ];

  /// Failed connects in a row before the socket gives up on a session (about
  /// four minutes of backoff). A lane that can't open only means its
  /// commands don't arrive, so it isn't worth asking for tickets all movie.
  static const maxAttempts = 10;

  final Future<SiloPlaybackControlCapabilities> Function() _capabilities;

  /// A ticket for a session id and installation id.
  final Future<SiloEventsTicket> Function(String, String) _ticket;
  final Uri Function(String) _uri;
  final SiloControlCommandHandler _handle;
  final String _clientVersion;
  final bool Function(String) _playedHere;

  /// When the access token expires. Silo ends a connection then, whatever
  /// the ticket's limit, so the socket is renewed before it.
  final DateTime? Function() _accessExpiresAt;
  final DateTime Function() _clock;
  final WebSocketChannel Function(Uri, List<String>) _connect;

  /// A server can accept the connection and never answer the upgrade.
  final Duration connectTimeout;

  /// How long before Silo's connection limit the socket is replaced.
  final Duration renewMargin;

  /// How long a connection that is let go waits for a command still running
  /// on it (a stop leaves the player first), so its result reaches Silo.
  final Duration closeGrace;

  /// How long a connection has to stay up before the backoff starts over. A
  /// server that accepts and closes at once still backs off.
  final Duration stableAfter;

  /// Overrides the backoff, in tests.
  final Duration Function(int attempt)? retryDelay;

  final _logger = Logger();
  late final StreamSubscription<SiloPlaybackLifecycle> _lifecycleSub;

  String? _sessionId;
  String? _installationId;

  /// Bumped whenever the session changes or the socket is closed, so work
  /// started for an earlier one stops when it comes back.
  int _generation = 0;
  WebSocketChannel? _channel;
  StreamSubscription? _channelSub;
  Timer? _stableTimer;
  Timer? _retryTimer;
  Timer? _renewTimer;
  int _attempt = 0;
  bool _renewing = false;

  /// Set once [maxAttempts] connects failed. The session's next replan gives
  /// the lane another try.
  bool _gaveUp = false;
  bool _disposed = false;
  final _running = <WebSocketChannel, Set<Future<void>>>{};

  /// The session the socket follows, in tests.
  @visibleForTesting
  String? get sessionId => _sessionId;

  /// Whether a connection is open, in tests.
  @visibleForTesting
  bool get connected => _channel != null;

  void _onLifecycle(SiloPlaybackLifecycle change) {
    if (_disposed) return;
    if (change.playing) {
      // A replan of the session playing now keeps its lane.
      if (change.sessionId == _sessionId) {
        if (_gaveUp) {
          _gaveUp = false;
          _attempt = 0;
          if (_channel != null) {
            _renew(_generation);
          } else {
            unawaited(_open(_generation));
          }
        }
        return;
      }
      // A session handed to an external player leaves the lane alone.
      if (!_playedHere(change.sessionId)) return;
      _close();
      _sessionId = change.sessionId;
      _installationId = change.installationId;
      _attempt = 0;
      unawaited(_open(_generation));
    } else if (change.sessionId == _sessionId) {
      _close();
    }
  }

  Future<void> _open(int generation) async {
    final sessionId = _sessionId;
    final installationId = _installationId;
    WebSocketChannel? opened;
    try {
      if (sessionId == null || installationId == null) return;
      final capabilities = await _capabilities();
      if (generation != _generation) return;
      if (!capabilities.usable) {
        // An older server, or one with the lane off: nothing to open, and
        // playback goes on as before.
        return;
      }

      final ticket = await _ticket(sessionId, installationId);
      if (generation != _generation) return;

      final channel = opened = _connect(
        _uri(sessionId),
        ticket.offeredProtocols,
      );
      await channel.ready.timeout(connectTimeout);
      if (generation != _generation) {
        unawaited(_closeChannel(channel));
        return;
      }
      channel.sink.add(
        jsonEncode({
          'type': 'hello',
          'session_id': sessionId,
          'client': {'name': 'Moonfin', 'version': _clientVersion},
          'capabilities': {'commands': supportedCommands},
        }),
      );

      // A renewal opens the new connection before letting the old one go,
      // so the lane is never empty; Silo hands it to the newest, and answers
      // to commands still running go there.
      final previous = _channel;
      final previousSub = _channelSub;
      // A renewal every token lifetime would fill the network log.
      if (previous == null) _log('Silo playback control connected');
      _channel = channel;
      _stableTimer?.cancel();
      _stableTimer = Timer(stableAfter, () {
        if (identical(channel, _channel)) _attempt = 0;
      });
      _channelSub = channel.stream.listen(
        (data) => _onFrame(data, channel, sessionId),
        onError: (Object error) => _dropped(generation, channel, error),
        onDone: () => _dropped(generation, channel),
      );
      if (previous != null) _retire(previous, previousSub);
      _scheduleRenewal(generation, ticket.maxConnection);
    } catch (error) {
      unawaited(_closeChannel(opened));
      if (generation != _generation) return;
      if (SiloPlaybackControlApi.isFinalRefusal(error)) {
        // The session is over or isn't this installation's lane: no later
        // ticket would be granted.
        _log('Silo playback control not opened', error);
        return;
      }
      _log('Silo playback control failed, retrying', error);
      // A failed renewal tries again while the old connection still holds.
      _scheduleRetry(generation, renew: _channel != null);
    } finally {
      if (generation == _generation) _renewing = false;
    }
  }

  void _scheduleRenewal(int generation, Duration maxConnection) {
    _renewTimer?.cancel();
    _renewTimer = Timer(
      renewalDelay(
        maxConnection: maxConnection,
        accessExpiresAt: _accessExpiresAt(),
        now: _clock(),
        margin: renewMargin,
      ),
      () => _renew(generation),
    );
  }

  /// When a connection opened [now] is renewed: [margin] before the ticket's
  /// limit or the access token's expiry, whichever comes first, and not
  /// sooner than five seconds.
  @visibleForTesting
  static Duration renewalDelay({
    required Duration maxConnection,
    required DateTime? accessExpiresAt,
    required DateTime now,
    required Duration margin,
  }) {
    var delay = maxConnection - margin;
    if (accessExpiresAt != null) {
      final untilExpiry = accessExpiresAt.difference(now) - margin;
      if (untilExpiry < delay) delay = untilExpiry;
    }
    const floor = Duration(seconds: 5);
    return delay < floor ? floor : delay;
  }

  /// Renews the connection now, in tests.
  @visibleForTesting
  void renewNow() {
    _renewTimer?.cancel();
    _renew(_generation);
  }

  void _dropped(int generation, WebSocketChannel channel, [Object? error]) {
    if (generation != _generation || !identical(channel, _channel)) return;
    _channel = null;
    _channelSub = null;
    _renewTimer?.cancel();
    _renewTimer = null;
    _stableTimer?.cancel();
    _stableTimer = null;
    _retire(channel, null);
    // A renewal on its way brings the next connection, or retries itself.
    if (_renewing) return;
    _log('Silo playback control closed, reconnecting', error);
    _scheduleRetry(generation);
  }

  /// Replaces the connection before Silo's limit ends it, keeping the old one
  /// until the new one is up.
  void _renew(int generation) {
    _renewTimer = null;
    if (generation != _generation || _renewing) return;
    _renewing = true;
    unawaited(_open(generation));
  }

  void _scheduleRetry(int generation, {bool renew = false}) {
    if (_disposed || generation != _generation) return;
    if (_attempt >= maxAttempts) {
      _gaveUp = true;
      _log('Silo playback control given up for this session');
      return;
    }
    final delay =
        retryDelay?.call(_attempt) ??
        Duration(
          milliseconds:
              min(30000, 1000 * (1 << min(_attempt, 5))) +
              Random().nextInt(500),
        );
    _attempt++;
    _retryTimer?.cancel();
    _retryTimer = Timer(
      delay,
      renew ? () => _renew(generation) : () => unawaited(_open(generation)),
    );
  }

  void _onFrame(dynamic data, WebSocketChannel channel, String sessionId) {
    if (data is! String) return;
    final Object? decoded;
    try {
      decoded = jsonDecode(data);
    } catch (_) {
      return;
    }
    if (decoded is! Map) return;
    // A command for a session that is over (its connection still closing)
    // must not reach whatever plays now. One on the old connection of a
    // renewal is still this session's.
    if (sessionId != _sessionId) return;
    if (decoded['type'] != 'command') return;
    final commandId = decoded['command_id'];
    if (commandId is! String || commandId.isEmpty) return;
    if (decoded['session_id'] != sessionId) return;
    final name = decoded['name'];
    final payload = decoded['payload'];
    late final Future<void> run;
    run =
        _run(
          channel,
          sessionId,
          commandId,
          name is String ? name : '',
          payload is Map ? payload : const {},
        ).whenComplete(() {
          final running = _running[channel];
          running?.remove(run);
          if (running != null && running.isEmpty) _running.remove(channel);
        });
    (_running[channel] ??= {}).add(run);
  }

  Future<void> _run(
    WebSocketChannel channel,
    String sessionId,
    String commandId,
    String name,
    Map payload,
  ) async {
    void reply(String type, String status, [String? error]) {
      // Silo takes answers only from the connection holding the lane, which
      // after a renewal is the new one.
      final current = _channel;
      final target = current != null && sessionId == _sessionId
          ? current
          : channel;
      try {
        target.sink.add(
          jsonEncode({
            'type': type,
            'command_id': commandId,
            'session_id': sessionId,
            'status': status,
            'error': ?error,
          }),
        );
      } catch (_) {}
    }

    final message = commandMessage(name, payload);
    if (message == null) {
      reply('result', 'rejected', 'unsupported');
      return;
    }
    reply('ack', 'accepted');
    try {
      await _handle(message);
      reply('result', 'completed');
    } catch (error) {
      _log('Silo playback command $name failed', error);
      reply('result', 'rejected', 'failed');
    }
  }

  /// The remote message [name] stands for, as Jellyfin's socket would send
  /// it, or null for a command Moonfin doesn't run.
  @visibleForTesting
  static ServerWebSocketMessage? commandMessage(String name, Map payload) {
    String? text(String key) {
      final value = payload[key];
      return value is String && value.trim().isNotEmpty ? value.trim() : null;
    }

    switch (name) {
      case 'pause':
        return const PlaystateMessage(command: 'Pause');
      case 'unpause':
        return const PlaystateMessage(command: 'Unpause');
      case 'play_pause':
        return const PlaystateMessage(command: 'PlayPause');
      case 'stop':
        return const PlaystateMessage(command: 'Stop');
      case 'display_message' || 'server_restarting' || 'server_shutting_down':
        final body = text('message') ?? text('title');
        if (body == null) return null;
        final title = text('message') == null ? null : text('title');
        return GeneralCommandMessage(
          name: 'DisplayMessage',
          arguments: {'Text': body, 'Header': ?title},
        );
      default:
        return null;
    }
  }

  /// Stops following the current session.
  void _close() {
    _generation++;
    _sessionId = null;
    _installationId = null;
    _renewing = false;
    _gaveUp = false;
    _stableTimer?.cancel();
    _stableTimer = null;
    _retryTimer?.cancel();
    _retryTimer = null;
    _renewTimer?.cancel();
    _renewTimer = null;
    final channel = _channel;
    final sub = _channelSub;
    _channel = null;
    _channelSub = null;
    if (channel != null) _retire(channel, sub);
  }

  /// Closes [channel] once the commands still running on it have sent their
  /// result, or after [closeGrace].
  void _retire(WebSocketChannel channel, StreamSubscription? sub) {
    final running = List.of(_running.remove(channel) ?? const <Future<void>>{});
    unawaited(() async {
      if (running.isNotEmpty) {
        try {
          await Future.wait(running).timeout(closeGrace);
        } catch (_) {}
      }
      // Closed before the listener goes, so a frame already on its way is
      // still read.
      await _closeChannel(channel);
      await sub?.cancel();
    }());
  }

  Future<void> _closeChannel(WebSocketChannel? channel) async {
    if (channel == null) return;
    try {
      await channel.sink.close().timeout(const Duration(seconds: 5));
    } catch (_) {}
  }

  void _log(String message, [Object? error]) {
    if (error == null) {
      _logger.i(message);
    } else {
      _logger.w(message, error: error);
    }
    if (!GetIt.instance.isRegistered<LogService>()) return;
    GetIt.instance<LogService>().network(
      message,
      level: error == null ? LogLevel.info : LogLevel.warning,
      error: error,
    );
  }

  void dispose() {
    if (_disposed) return;
    _close();
    _disposed = true;
    unawaited(_lifecycleSub.cancel());
  }
}
