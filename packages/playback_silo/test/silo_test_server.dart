import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// Answers one request: a response, or a thrown [DioException] for a
/// transport failure.
typedef SiloRoute = ResponseBody Function(RequestOptions request);

/// A fake Silo server for the playback tests: answers each path from
/// [routes] (a list per path is answered in turn, the last one repeated),
/// records every request and its JSON body.
class SiloTestServer implements HttpClientAdapter {
  SiloTestServer(Map<String, Object> routes)
    : routes = {
        for (final e in routes.entries)
          e.key: e.value is List
              ? (e.value as List).cast<SiloRoute>()
              : [e.value as SiloRoute],
      };

  final Map<String, List<SiloRoute>> routes;
  final List<RequestOptions> requests = [];
  final Map<String, int> _answered = {};

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final path = options.uri.path;
    final answers = routes[path];
    if (answers == null) {
      return problem(404, 'not_found', 'No route for $path');
    }
    final n = _answered[path] ?? 0;
    _answered[path] = n + 1;
    return answers[n < answers.length ? n : answers.length - 1](options);
  }

  @override
  void close({bool force = false}) {}

  /// The requests made to [path], in order.
  List<RequestOptions> to(String path) => [
    for (final r in requests)
      if (r.uri.path == path) r,
  ];

  /// The JSON bodies sent to [path], in order.
  List<Map<String, dynamic>> bodies(String path) => [
    for (final r in to(path))
      (r.data is String ? jsonDecode(r.data as String) : r.data)
          as Map<String, dynamic>,
  ];

  static SiloRoute json(Object body, {int status = 200}) =>
      (_) => ResponseBody.fromString(
        body is String ? body : jsonEncode(body),
        status,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );

  /// A fixture of this package (`test/fixtures/<name>`) or, with `silo/`,
  /// of `server_silo`.
  static SiloRoute file(String name, {int status = 200}) =>
      json(fixtureText(name), status: status);

  static ResponseBody problem(int status, String code, String detail) =>
      ResponseBody.fromString(
        jsonEncode({
          'type': 'https://siloserver.org/docs/api/v2/problems/$code',
          'title': code,
          'status': status,
          'detail': detail,
        }),
        status,
        headers: {
          Headers.contentTypeHeader: ['application/problem+json'],
        },
      );

  static SiloRoute problemRoute(int status, String code, String detail) =>
      (_) => problem(status, code, detail);

  /// A request that never got an answer.
  static SiloRoute dropped() =>
      (request) => throw DioException(
        requestOptions: request,
        type: DioExceptionType.connectionError,
        message: 'Connection reset by peer',
      );
}

String fixtureText(String name) => File(
  name.startsWith('silo/')
      ? '../server_silo/test/fixtures/$name'
      : 'test/fixtures/$name',
).readAsStringSync();

Map<String, dynamic> fixtureJson(String name) =>
    jsonDecode(fixtureText(name)) as Map<String, dynamic>;

final siloTestNow = DateTime.utc(2026, 10, 17, 12);

const siloTestDevice = DeviceInfo(
  id: 'device-1',
  name: 'Test Mac',
  appName: 'Moonfin',
  appVersion: '1.9.0',
);

/// A signed-in client acting as profile `p1`.
SiloMediaServerClient siloTestClient(SiloTestServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: siloTestDevice,
        platform: 'macOS',
        httpClientAdapter: server,
        clock: () => siloTestNow,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: siloTestNow.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

/// The Jellyfin-shaped item Moonfin plays, mapped from a `server_silo`
/// fixture (`silo/watch_movie.json`…) the way the app gets it.
Map<String, dynamic> siloTestItem(String fixture) =>
    siloItemToBaseItemDtoForTest(fixtureJson(fixture));

/// [json] (a Silo item) mapped the way the app gets it.
Map<String, dynamic> siloItemToBaseItemDtoForTest(Map<String, dynamic> json) =>
    siloItemToBaseItemDto(
      json,
      images: SiloImageRegistry(() => 'https://silo.example'),
    )!;

const capabilitiesPath = '/api/v2/playback/capabilities';
const startPath = '/api/v2/playback/start';
