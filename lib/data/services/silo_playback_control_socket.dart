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
    required this._capabilities,
    required this._ticket,
    required this._uri,
    required this._handle,
    required this._clientVersion,
    WebSocketChannel Function(Uri uri, List<String> protocols)? connect,
    @visibleForTesting this.connectTimeout = const Duration(seconds: 15),
    @visibleForTesting this.renewMargin = const Duration(minutes: 1),
    @visibleForTesting this.closeGrace = const Duration(seconds: 5),
    @visibleForTesting this.retryDelay,
  }) : _connect =
           connect ??
           ((uri, protocols) =>
               WebSocketChannel.connect(uri, protocols: protocols)) {
    _lifecycleSub = lifecycle.listen(_onLifecycle);
  }

  /// The socket for [silo]'s playback sessions.
  factory SiloPlaybackControlSocket.forClient(
    SiloMediaServerClient silo, {
    required SiloControlCommandHandler handle,
  }) {
    final api = silo.playbackControlApi;
    return SiloPlaybackControlSocket(
      lifecycle: SiloPlaybackSessions.of(silo).lifecycle,
      capabilities: api.capabilities,
      ticket: (sessionId, installationId) =>
          api.createTicket(sessionId, installationId: installationId),
      uri: api.socketUri,
      handle: handle,
      clientVersion: silo.deviceInfo.appVersion,
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

  final Future<SiloPlaybackControlCapabilities> Function() _capabilities;

  /// A ticket for a session id and installation id.
  final Future<SiloEventsTicket> Function(String, String) _ticket;
  final Uri Function(String) _uri;
  final SiloControlCommandHandler _handle;
  final String _clientVersion;
  final WebSocketChannel Function(Uri, List<String>) _connect;

  /// A server can accept the connection and never answer the upgrade.
  final Duration connectTimeout;

  /// How long before Silo's connection limit the socket is replaced.
  final Duration renewMargin;

  /// How long a closing session waits for a command still running (a stop
  /// leaves the player first) so its result still reaches Silo.
  final Duration closeGrace;

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
  Timer? _retryTimer;
  Timer? _renewTimer;
  int _attempt = 0;
  bool _disposed = false;
  final _running = <Future<void>>{};

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
      if (change.sessionId == _sessionId) return;
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
    if (sessionId == null || installationId == null) return;
    try {
      final capabilities = await _capabilities();
      if (generation != _generation) return;
      if (!capabilities.usable) {
        // An older server, or one with the lane off: nothing to open, and
        // playback goes on as before.
        return;
      }

      final ticket = await _ticket(sessionId, installationId);
      if (generation != _generation) return;

      final channel = _connect(_uri(sessionId), ticket.offeredProtocols);
      _channel = channel;
      await channel.ready.timeout(connectTimeout);
      if (generation != _generation) {
        unawaited(_closeChannel(channel));
        return;
      }
      _attempt = 0;
      _log('Silo playback control connected');
      channel.sink.add(
        jsonEncode({
          'type': 'hello',
          'session_id': sessionId,
          'client': {'name': 'Moonfin', 'version': _clientVersion},
          'capabilities': {'commands': supportedCommands},
        }),
      );
      _channelSub = channel.stream.listen(
        (data) => _onFrame(data, channel, sessionId),
        onError: (Object error) => _dropped(generation, channel, error),
        onDone: () => _dropped(generation, channel),
      );
      _renewTimer?.cancel();
      var renewIn = ticket.maxConnection - renewMargin;
      if (renewIn < const Duration(seconds: 1)) {
        renewIn = const Duration(seconds: 1);
      }
      _renewTimer = Timer(renewIn, () => _reopen(generation));
    } catch (error) {
      if (generation != _generation) return;
      final stale = _channel;
      _channel = null;
      unawaited(_closeChannel(stale));
      if (SiloPlaybackControlApi.isFinalRefusal(error)) {
        // The session is over or isn't this installation's lane: no later
        // ticket would be granted.
        _log('Silo playback control not opened', error);
        return;
      }
      _log('Silo playback control failed, retrying', error);
      _scheduleRetry(generation);
    }
  }

  void _dropped(int generation, WebSocketChannel channel, [Object? error]) {
    if (generation != _generation || !identical(channel, _channel)) return;
    _log('Silo playback control closed, reconnecting', error);
    _channel = null;
    _channelSub = null;
    _renewTimer?.cancel();
    _renewTimer = null;
    unawaited(_closeChannel(channel));
    _scheduleRetry(generation);
  }

  /// Replaces the connection before Silo's limit ends it.
  void _reopen(int generation) {
    if (generation != _generation) return;
    final old = _channel;
    final oldSub = _channelSub;
    _channel = null;
    _channelSub = null;
    unawaited(oldSub?.cancel());
    unawaited(_closeChannel(old));
    unawaited(_open(generation));
  }

  void _scheduleRetry(int generation) {
    if (_disposed || generation != _generation) return;
    final delay =
        retryDelay?.call(_attempt) ??
        Duration(
          milliseconds:
              min(30000, 1000 * (1 << min(_attempt, 5))) +
              Random().nextInt(500),
        );
    _attempt++;
    _retryTimer?.cancel();
    _retryTimer = Timer(delay, () => unawaited(_open(generation)));
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
    if (decoded['type'] != 'command') return;
    final commandId = decoded['command_id'];
    if (commandId is! String || commandId.isEmpty) return;
    if (decoded['session_id'] != sessionId) return;
    final name = decoded['name'];
    final payload = decoded['payload'];
    late final Future<void> run;
    run = _run(
      channel,
      sessionId,
      commandId,
      name is String ? name : '',
      payload is Map ? payload : const {},
    ).whenComplete(() => _running.remove(run));
    _running.add(run);
  }

  Future<void> _run(
    WebSocketChannel channel,
    String sessionId,
    String commandId,
    String name,
    Map payload,
  ) async {
    void reply(String type, String status, [String? error]) {
      try {
        channel.sink.add(
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

  /// Stops following the current session. Commands still running get
  /// [closeGrace] to send their result before the connection closes.
  void _close() {
    _generation++;
    _sessionId = null;
    _installationId = null;
    _retryTimer?.cancel();
    _retryTimer = null;
    _renewTimer?.cancel();
    _renewTimer = null;
    final channel = _channel;
    final sub = _channelSub;
    _channel = null;
    _channelSub = null;
    if (channel == null) return;
    final running = List.of(_running);
    unawaited(() async {
      if (running.isNotEmpty) {
        try {
          await Future.wait(running).timeout(closeGrace);
        } catch (_) {}
      }
      await sub?.cancel();
      await _closeChannel(channel);
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
