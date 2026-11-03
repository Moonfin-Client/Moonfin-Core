import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

// Captured from Silo (sign-in for a user that doesn't exist, and a device id
// with a space).
const _invalidCredentials = {
  'type': 'https://siloserver.org/docs/api/v2/problems/invalid_token',
  'title': 'Invalid token',
  'status': 401,
  'detail': 'Invalid username or password.',
  'instance': 'urn:silo:request:cf091f95c0a40614b41bea2d',
};

const _badDeviceId = {
  'type': 'https://siloserver.org/docs/api/v2/problems/validation_failed',
  'title': 'Validation failed',
  'status': 422,
  'detail': 'The request did not pass validation; see errors.',
  'instance': 'urn:silo:request:55387f3ca275133cff964757',
  'errors': [
    {
      'location': 'header.x-silo-device-id',
      'code': 'invalid',
      'detail':
          "X-Silo-Device-Id must be a single device identifier: letters, "
          "digits, '.', '_', ':' or '-', with no comma or interior whitespace",
    },
  ],
};

class _Adapter implements HttpClientAdapter {
  _Adapter(this.respond);
  final ResponseBody Function(RequestOptions) respond;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => respond(options);

  @override
  void close({bool force = false}) {}
}

ResponseBody _body(
  int status,
  String body, {
  String contentType = 'application/problem+json',
  Map<String, List<String>> headers = const {},
}) => ResponseBody.fromString(
  body,
  status,
  headers: {
    Headers.contentTypeHeader: [contentType],
    ...headers,
  },
);

Dio _dio(ResponseBody Function(RequestOptions) respond) =>
    Dio(BaseOptions(baseUrl: 'https://silo.example'))
      ..httpClientAdapter = _Adapter(respond)
      ..interceptors.add(siloProblemInterceptor());

Future<DioException> _fail(Dio dio) async {
  try {
    await dio.get<dynamic>('/api/v2/anything');
  } on DioException catch (e) {
    return e;
  }
  fail('request should have failed');
}

void main() {
  group('SiloProblem.fromJson', () {
    test('reads a real 401', () {
      final p = SiloProblem.fromJson(_invalidCredentials)!;
      expect(p.code, 'invalid_token');
      expect(p.status, 401);
      expect(p.message, 'Invalid username or password.');
      expect(p.instance, 'urn:silo:request:cf091f95c0a40614b41bea2d');
      expect(p.errors, isEmpty);
    });

    test('reads a real 422 with field errors', () {
      final p = SiloProblem.fromJson(_badDeviceId)!;
      expect(p.code, 'validation_failed');
      expect(p.errors.single.location, 'header.x-silo-device-id');
      expect(p.errors.single.code, 'invalid');
      expect(p.errors.single.detail, startsWith('X-Silo-Device-Id must be'));
    });

    test('decodes a problem sent as text', () {
      final p = SiloProblem.fromJson(jsonEncode(_invalidCredentials));
      expect(p?.code, 'invalid_token');
    });

    test('is null for bodies that are not problems', () {
      expect(SiloProblem.fromJson(null), isNull);
      expect(SiloProblem.fromJson(''), isNull);
      expect(SiloProblem.fromJson('<!doctype html><html></html>'), isNull);
      expect(SiloProblem.fromJson({'items': []}), isNull);
      expect(SiloProblem.fromJson([1, 2]), isNull);
    });

    test('tolerates wrong field types', () {
      final p = SiloProblem.fromJson({
        'title': 'Odd',
        'status': '500',
        'detail': 7,
        'errors': [
          'x',
          {'code': 1, 'location': 'body.a'},
        ],
      })!;
      expect(p.status, isNull);
      expect(p.detail, isNull);
      expect(p.message, 'Odd');
      expect(p.code, isNull);
      expect(p.errors.single.location, 'body.a');
      expect(p.errors.single.code, isNull);
    });

    test('code is the last segment of type', () {
      expect(
        const SiloProblem(
          type: 'https://siloserver.org/docs/api/v2/problems/session_expired/',
        ).code,
        'session_expired',
      );
      expect(const SiloProblem(type: 'plain_code').code, 'plain_code');
    });

    test('reads as one line', () {
      expect(
        SiloProblem.fromJson(_invalidCredentials).toString(),
        'Silo 401 invalid_token: Invalid username or password.',
      );
      expect(
        SiloProblem.fromJson(_badDeviceId).toString(),
        startsWith(
          'Silo 422 validation_failed: The request did not pass validation; '
          'see errors. [header.x-silo-device-id invalid: X-Silo-Device-Id',
        ),
      );
    });
  });

  group('siloProblemInterceptor', () {
    test('attaches the problem to the error', () async {
      final e = await _fail(
        _dio((_) => _body(401, jsonEncode(_invalidCredentials))),
      );
      expect(e.response?.statusCode, 401);
      expect(e.error, isA<SiloProblem>());
      expect(
        e.message,
        'Silo 401 invalid_token: Invalid username or password.',
      );
      expect(SiloProblem.codeOf(e), 'invalid_token');
    });

    test('works when the problem is served as text/plain', () async {
      final e = await _fail(
        _dio(
          (_) => _body(
            422,
            jsonEncode(_badDeviceId),
            contentType: 'text/plain; charset=utf-8',
          ),
        ),
      );
      expect(SiloProblem.codeOf(e), 'validation_failed');
      expect(SiloProblem.of(e)!.errors, hasLength(1));
    });

    test('leaves other failures alone', () async {
      final html = await _fail(
        _dio(
          (_) =>
              _body(502, '<html>Bad gateway</html>', contentType: 'text/html'),
        ),
      );
      expect(html.error, isNot(isA<SiloProblem>()));
      expect(SiloProblem.of(html), isNull);

      final network = await _fail(
        _dio(
          (o) => throw DioException.connectionError(
            requestOptions: o,
            reason: 'refused',
          ),
        ),
      );
      expect(network.type, DioExceptionType.connectionError);
      expect(SiloProblem.of(network), isNull);
    });
  });

  group('SiloProblem.retryAfter', () {
    Future<DioException> withRetryAfter(String? value) => _fail(
      _dio(
        (_) => _body(
          503,
          jsonEncode({'type': 'x/dependency_unavailable', 'status': 503}),
          headers: value == null
              ? const {}
              : {
                  'retry-after': [value],
                },
        ),
      ),
    );

    test('reads seconds', () async {
      expect(
        SiloProblem.retryAfter(await withRetryAfter('120')),
        const Duration(minutes: 2),
      );
    });

    test('reads an HTTP date', () async {
      final e = await withRetryAfter('Tue, 13 Oct 2026 23:55:30 GMT');
      expect(
        SiloProblem.retryAfter(e, now: DateTime.utc(2026, 10, 13, 23, 55)),
        const Duration(seconds: 30),
      );
      expect(
        SiloProblem.retryAfter(e, now: DateTime.utc(2026, 10, 14)),
        Duration.zero,
      );
    });

    test('is null when missing or unreadable', () async {
      expect(SiloProblem.retryAfter(await withRetryAfter(null)), isNull);
      expect(SiloProblem.retryAfter(await withRetryAfter('soon')), isNull);
    });
  });
}
