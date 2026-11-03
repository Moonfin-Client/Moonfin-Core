import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// What `GET /events/capabilities` says about Silo's realtime socket.
class SiloEventsCapabilities {
  const SiloEventsCapabilities({
    required this.state,
    required this.allowed,
    required this.channels,
    required this.declaredChannels,
  });

  factory SiloEventsCapabilities.fromJson(Map<String, dynamic> json) =>
      SiloEventsCapabilities(
        state: json['state'] as String? ?? '',
        allowed: json['allowed'] == true,
        channels: [
          for (final channel in json['channels'] as List? ?? const [])
            if (channel is String) channel,
        ],
        declaredChannels: json['declared_channels'] == true,
      );

  /// `available`, `disabled`, `not_configured` or `unsupported`.
  final String state;

  /// Whether this login may use the socket at all.
  final bool allowed;

  /// Every client channel the server knows, whatever the caller's role. The
  /// hello frame says which this connection may actually follow.
  final List<String> channels;

  /// Whether channels can be chosen on the URL (`?channels=`) instead of with
  /// a subscribe frame.
  final bool declaredChannels;

  bool get available => state == 'available' && allowed;
}

/// One handshake's credential from `POST /events/ws-ticket`.
class SiloEventsTicket {
  const SiloEventsTicket({
    required this.ticket,
    required this.expiresIn,
    required this.maxConnection,
    required this.protocol,
  });

  factory SiloEventsTicket.fromJson(Map<String, dynamic> json) {
    final ticket = json['ticket'];
    final protocol = json['protocol'];
    if (ticket is! String || ticket.isEmpty || protocol is! String) {
      throw const FormatException('Silo sent no events socket ticket');
    }
    final expiresIn = json['expires_in'];
    final maxSeconds = json['max_connection_seconds'];
    return SiloEventsTicket(
      ticket: ticket,
      expiresIn: Duration(seconds: expiresIn is num ? expiresIn.toInt() : 0),
      maxConnection: Duration(
        seconds: maxSeconds is num ? maxSeconds.toInt() : 300,
      ),
      protocol: protocol,
    );
  }

  /// Single use. Never logged and never put in the URL.
  final String ticket;

  /// How soon the handshake must use it (at most 30 s).
  final Duration expiresIn;

  /// How long Silo keeps the connection open (five minutes, or less when the
  /// access token expires sooner).
  final Duration maxConnection;

  /// The message protocol the server will select (`silo.events.v2`).
  final String protocol;

  /// The subprotocols to offer, in this order: the protocol, then the
  /// ticket. Silo selects only the first.
  List<String> get offeredProtocols => [protocol, 'silo.ticket.$ticket'];
}

/// The close code Silo ends a connection with when the access it was opened
/// under changed (`access_changed`).
const siloEventsAccessChangedCloseCode = 4001;

/// The `ServerEventMessage` type the app's Silo socket passes on when Silo
/// says the login's access changed (libraries, rating limits, permissions,
/// role): what the account may see has to be read again.
const siloAccessChangedEvent = 'SiloAccessChanged';

/// One frame from the events socket. Silo sends `hello`, `subscribed`,
/// `snapshot`, `event`, `error` and `access_changed`. Anything else is
/// [type] with nothing else filled in, and is ignored.
class SiloEventFrame {
  const SiloEventFrame({
    required this.type,
    this.channel,
    this.event,
    this.eventId,
    this.data,
    this.requiredAction,
    this.channels = const [],
    this.rejected = const [],
    this.code,
    this.message,
  });

  /// Null for anything that isn't a JSON object with a `type`.
  static SiloEventFrame? parse(Object? raw) {
    final Object? decoded;
    try {
      decoded = raw is String ? jsonDecode(raw) : null;
    } on FormatException {
      return null;
    }
    final json = asJsonMap(decoded);
    final type = json?['type'];
    if (json == null || type is! String) return null;
    List<String> strings(Object? list) => [
      if (list is List)
        for (final entry in list)
          if (entry is String) entry,
    ];
    return SiloEventFrame(
      type: type,
      channel: json['channel'] as String?,
      event: json['event'] as String?,
      eventId: json['event_id'] as String?,
      data: asJsonMap(json['data']),
      requiredAction: json['required_action'] as String?,
      channels: strings(json['channels'] ?? json['available_channels']),
      rejected: [
        for (final entry in json['rejected'] as List? ?? const [])
          if (asJsonMap(entry)?['channel'] case final String channel) channel,
      ],
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  final String type;

  /// `snapshot` and `event`: the channel it belongs to.
  final String? channel;

  /// `event`: its name, such as `user_state.changed`.
  final String? event;

  final String? eventId;

  /// `event`: its payload when it is an object.
  final Map<String, dynamic>? data;

  /// `hello`: `none` when the channels declared on the URL took, `subscribe`
  /// when the connection still owes a subscribe frame.
  final String? requiredAction;

  /// `hello`: the channels this connection may follow. `subscribed`: the
  /// channels it now follows.
  final List<String> channels;

  /// `subscribed`: the channels refused.
  final List<String> rejected;

  /// `error`: Silo's code and text.
  final String? code;
  final String? message;
}

/// Silo's realtime events socket: its capability, its tickets and its URL.
///
/// The socket itself is opened by the app (`SiloEventsSocketClient`). This
/// class has the HTTP half: whether the socket is on, and the single-use
/// ticket each handshake presents. Not a Moonfin interface: Jellyfin and
/// Emby take their token on the socket URL.
class SiloEventsApi {
  SiloEventsApi(this._dio, {required String Function() baseUrl})
    : _baseUrl = baseUrl;

  final Dio _dio;
  final String Function() _baseUrl;

  /// The channels Moonfin follows: the profile's watched state, favorites
  /// and progress (`user_state`) and the libraries' contents (`catalog`).
  static const followedChannels = ['user_state', 'catalog'];

  /// `GET /events/capabilities`. A server without the realtime service still
  /// answers, with `state: not_configured`.
  Future<SiloEventsCapabilities> capabilities() async {
    final response = await _dio.get<dynamic>('/api/v2/events/capabilities');
    final json = asJsonMap(response.data);
    if (json == null) {
      throw const FormatException('Expected events capabilities from Silo');
    }
    return SiloEventsCapabilities.fromJson(json);
  }

  /// `POST /events/ws-ticket`: delegates this login (and its profile) to one
  /// handshake. Naturally idempotent, so the session interceptor may refresh
  /// the token and send it again (Silo asks for that after a role change,
  /// `token_refresh_required`). A ticket is never reused for a reconnect.
  Future<SiloEventsTicket> createTicket() async {
    final response = await _dio.post<dynamic>('/api/v2/events/ws-ticket');
    final json = asJsonMap(response.data);
    if (json == null) {
      throw const FormatException('Expected an events socket ticket from Silo');
    }
    return SiloEventsTicket.fromJson(json);
  }

  /// The socket's URL for [channels]: the server's address with `ws`/`wss`
  /// and `/api/v2/events/ws?channels=…`. Declaring the channels here spares
  /// the subscribe frame and its five-second grace period. No credential goes
  /// in the URL.
  ///
  /// The port is always written out. Dart's `Uri` knows default ports only
  /// for `http` and `https`, so a `wss://host/…` without one reports port 0,
  /// and `dart:io`'s WebSocket connects to exactly that.
  Uri socketUri([Iterable<String> channels = followedChannels]) {
    final base = Uri.parse(_baseUrl());
    final path = base.path.endsWith('/')
        ? base.path.substring(0, base.path.length - 1)
        : base.path;
    return base.replace(
      scheme: base.scheme == 'https' ? 'wss' : 'ws',
      port: base.port,
      path: '$path/api/v2/events/ws',
      query: 'channels=${channels.join(',')}',
    );
  }
}
