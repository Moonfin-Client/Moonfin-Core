import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/ui/util/error_message.dart';

final _l10n = AppLocalizationsEn();
final _request = RequestOptions(path: '/Items');

// Spelled out so the test fails if the wording changes, which comparing
// against the l10n getters wouldn't catch.
const _unableToConnect = 'Unable to connect to server';
const _unknownError = 'Unknown error';

DioException _badResponse(int status, [Object? data]) => DioException(
  requestOptions: _request,
  type: DioExceptionType.badResponse,
  response: Response(requestOptions: _request, statusCode: status, data: data),
);

void main() {
  group('describeError', () {
    test('reports timeouts and connection failures as unable to connect', () {
      for (final type in const [
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionError,
        DioExceptionType.badCertificate,
      ]) {
        final error = DioException(requestOptions: _request, type: type);
        expect(describeError(error, _l10n), _unableToConnect, reason: '$type');
      }
      expect(
        describeError(TimeoutException('slow'), _l10n),
        _unableToConnect,
      );
    });

    test('recognizes a socket failure wrapped as an unknown error', () {
      final error = DioException(
        requestOptions: _request,
        error: 'SocketException: No route to host (OS Error: errno = 113)',
      );
      expect(describeError(error, _l10n), _unableToConnect);
    });

    test('prefers the reason the server sent', () {
      final missingName = _badResponse(400, {'message': 'Name is required'});
      expect(describeError(missingName, _l10n), 'Name is required');
      expect(
        describeError(_badResponse(409, {'title': 'Conflict'}), _l10n),
        'Conflict',
      );
      expect(
        describeError(_badResponse(500, 'Library is locked'), _l10n),
        'Library is locked',
      );
    });

    test('falls back to the status when the body has no reason', () {
      expect(
        describeError(_badResponse(502, '<html>Bad Gateway</html>'), _l10n),
        'Server returned HTTP 502',
      );
      expect(
        describeError(_badResponse(403, {'code': 7}), _l10n),
        'Server returned HTTP 403',
      );
    });

    test('shortens a long server reason', () {
      final result = describeError(_badResponse(500, 'x' * 500), _l10n);
      expect(result, '${'x' * 200}...');
    });

    test('never shows a DioException with nothing to go on', () {
      final error = DioException(requestOptions: _request);
      expect(describeError(error, _l10n), _unknownError);
    });

    test('drops the Exception prefix from other errors', () {
      expect(
        describeError(Exception('No results returned.'), _l10n),
        'No results returned.',
      );
      expect(describeError(StateError('bad'), _l10n), 'Bad state: bad');
    });
  });
}
