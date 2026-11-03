import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Reads `test/fixtures/<name>` (e.g. `silo/system_info.json`).
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

/// A fake Silo server for tests: answers each request path from [routes]
/// (a response for each path) and records every request so tests can check the
/// headers the client sent. Unknown paths get a Silo-style 404 problem.
class FixtureServer implements HttpClientAdapter {
  FixtureServer(this.routes);

  final Map<String, ResponseBody Function(RequestOptions)> routes;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final route = routes[options.uri.path];
    if (route != null) return route(options);
    return problem(404, 'not_found', 'No route for ${options.uri.path}');
  }

  @override
  void close({bool force = false}) {}

  /// A 200 with a fixture file as the JSON body.
  static ResponseBody Function(RequestOptions) file(String name) =>
      (_) => json(200, fixture(name));

  static ResponseBody json(int status, String body) => ResponseBody.fromString(
    body,
    status,
    headers: {
      Headers.contentTypeHeader: ['application/json'],
    },
  );

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
}
