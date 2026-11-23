import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_kept_reads.dart';
import 'silo_events_api.dart';

/// What `GET /playback/sessions/control/capabilities` says about Silo's
/// playback control socket.
class SiloPlaybackControlCapabilities {
  const SiloPlaybackControlCapabilities({
    required this.available,
    required this.allowed,
  });

  factory SiloPlaybackControlCapabilities.fromJson(Map<String, dynamic> json) =>
      SiloPlaybackControlCapabilities(
        available:
            json['available'] == true &&
            json['protocol'] == SiloPlaybackControlApi.protocol,
        allowed: json['allowed'] != false,
      );

  /// Whether the server serves the handshake, in the protocol Moonfin speaks.
  final bool available;

  /// Whether this login may use it.
  final bool allowed;

  bool get usable => available && allowed;
}

/// Silo's playback control socket: the lane one playback session listens on
/// for what the server sends it while it plays (an administrator's message,
/// pause, resume and stop, a restart notice).
///
/// The socket itself is opened by the app (`SiloPlaybackControlSocket`). This
/// class has the HTTP half: whether the server has it, the single-use ticket
/// each handshake presents, and the URL. Not a Moonfin interface.
class SiloPlaybackControlApi {
  SiloPlaybackControlApi(
    this._dio, {
    required String Function() baseUrl,
    DateTime Function()? clock,
  }) : _baseUrl = baseUrl,
       _capabilities = SiloKeptReads(
         lifetime: capabilitiesLifetime,
         clock: clock,
       );

  final Dio _dio;
  final String Function() _baseUrl;

  /// The subprotocol the server selects.
  static const protocol = 'silo.playback-control.v2';

  /// How long [capabilities] reuses an answer. Asked once per playback at
  /// most, so a server that turns the socket on is noticed soon enough.
  static const capabilitiesLifetime = Duration(minutes: 10);

  final SiloKeptReads<String, SiloPlaybackControlCapabilities> _capabilities;

  /// `GET /api/v2/playback/sessions/control/capabilities`. A server older
  /// than the socket answers 404, which reads as not available.
  Future<SiloPlaybackControlCapabilities> capabilities() =>
      _capabilities.get('control', () async {
        try {
          final response = await _dio.get<dynamic>(
            '/api/v2/playback/sessions/control/capabilities',
          );
          final json = asJsonMap(response.data);
          if (json == null) return _unavailable;
          return SiloPlaybackControlCapabilities.fromJson(json);
        } on DioException catch (error) {
          if (error.response?.statusCode == 404) return _unavailable;
          rethrow;
        }
      });

  static const _unavailable = SiloPlaybackControlCapabilities(
    available: false,
    allowed: false,
  );

  /// Forgets the kept capabilities (another profile or login).
  void forget() => _capabilities.forget();

  /// `POST /api/v2/playback/sessions/{sessionId}/control/ws-ticket`: delegates
  /// this login and profile to one handshake for [sessionId], which this
  /// installation started. The ticket has the same shape as the events
  /// socket's. Never reused for a reconnect.
  Future<SiloEventsTicket> createTicket(
    String sessionId, {
    required String installationId,
  }) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/playback/sessions/${Uri.encodeComponent(sessionId)}'
      '/control/ws-ticket',
      data: {'installation_id': installationId},
    );
    final json = asJsonMap(response.data);
    if (json == null) {
      throw const FormatException('Expected a playback control ticket');
    }
    final ticket = SiloEventsTicket.fromJson(json);
    if (ticket.protocol != protocol) {
      throw const FormatException('Silo offered another control protocol');
    }
    return ticket;
  }

  /// Whether a refused ticket means this session's lane can't be opened at
  /// all, so asking again is pointless: the session ended (`410`), it isn't
  /// this login's (`401`, `403`), or another installation holds it (`409`).
  /// A `404` is retried: a server without a durable attempt store answers it
  /// for a live session it hasn't rebuilt yet after a restart. Anything else
  /// (`503` while it rebuilds, no answer) is retried too.
  static bool isFinalRefusal(Object error) {
    if (error is! DioException) return false;
    final status = error.response?.statusCode;
    return status == 401 || status == 403 || status == 409 || status == 410;
  }

  /// The socket's URL for [sessionId], with `ws`/`wss`. No credential goes in
  /// the URL. The port is always written out (see
  /// [SiloEventsApi.socketUri]).
  Uri socketUri(String sessionId) {
    final base = Uri.parse(_baseUrl());
    return base.replace(
      scheme: base.scheme == 'https' ? 'wss' : 'ws',
      port: base.port,
      pathSegments: [
        ...base.pathSegments.where((segment) => segment.isNotEmpty),
        'api',
        'v2',
        'playback',
        'sessions',
        sessionId,
        'control',
        'ws',
      ],
    );
  }
}
