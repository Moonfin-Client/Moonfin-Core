import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/util/silo_failure_message.dart';
import 'package:server_core/server_core.dart';

DioException _failure(
  int status, {
  String? code,
  Map<String, List<String>> headers = const {},
}) {
  final request = RequestOptions(path: '/api/v2/auth/login');
  return DioException(
    requestOptions: request,
    type: DioExceptionType.badResponse,
    response: Response<dynamic>(
      requestOptions: request,
      statusCode: status,
      headers: Headers.fromMap(headers),
      data: code == null
          ? '<html>Too Many Requests</html>'
          : {
              'type': 'https://siloserver.org/docs/api/v2/problems/$code',
              'status': status,
              'detail': 'Silo says no.',
            },
    ),
  );
}

void main() {
  final l10n = lookupAppLocalizations(const Locale('en'));

  group('SiloFailure.of', () {
    test('429 with Retry-After: too many attempts, with the wait', () {
      final failure = SiloFailure.of(
        _failure(429, code: 'rate_limited', headers: {'retry-after': ['42']}),
      );

      expect(failure, isA<SiloTryAgainLater>());
      expect((failure as SiloTryAgainLater).busy, isFalse);
      expect(failure.wait, const Duration(seconds: 42));
      expect(
        failure.message(l10n),
        'Too many attempts. Try again in 42 seconds.',
      );
    });

    test('Retry-After as an HTTP date', () {
      final failure = SiloFailure.of(
        _failure(
          429,
          code: 'rate_limited',
          headers: {'retry-after': ['Mon, 19 Oct 2026 16:05:00 GMT']},
        ),
        now: DateTime.utc(2026, 10, 19, 16),
      );

      expect(
        failure!.message(l10n),
        'Too many attempts. Try again in 5 minutes.',
      );
    });

    test('503 without Retry-After: busy, try later', () {
      final failure = SiloFailure.of(
        _failure(503, code: 'dependency_unavailable'),
      );

      expect(
        failure!.message(l10n),
        'The server is busy or still starting. Try again later.',
      );
    });

    test('503 with Retry-After says how long', () {
      final failure = SiloFailure.of(
        _failure(
          503,
          code: 'dependency_unavailable',
          headers: {'retry-after': ['1']},
        ),
      );

      expect(
        failure!.message(l10n),
        'The server is busy or still starting. Try again in 1 second.',
      );
    });

    test('410 client_upgrade_required and 426 ask to update Moonfin', () {
      for (final error in [
        _failure(410, code: 'client_upgrade_required'),
        _failure(426, code: 'client_upgrade_required'),
        _failure(426),
      ]) {
        final failure = SiloFailure.of(error);
        expect(failure, isA<SiloUpdateRequired>());
        expect(
          failure!.message(l10n),
          'This Silo server needs a newer version of Moonfin. '
          'Update Moonfin to use it.',
        );
      }
    });

    test('a 429 without Silo\'s problem body is not Silo\'s', () {
      expect(SiloFailure.of(_failure(429)), isNull);
    });

    test('other refusals are left to their callers', () {
      expect(SiloFailure.of(_failure(401, code: 'invalid_token')), isNull);
      expect(SiloFailure.of(_failure(410, code: 'session_expired')), isNull);
      expect(SiloFailure.of(_failure(500, code: 'internal_error')), isNull);
    });
  });

  test('an older Silo asks to update Silo', () {
    final failure = SiloUpdateRequired.of(
      const SiloApiUnsupported(apiMajor: 1),
    );

    expect(
      failure.message(l10n),
      'This Silo server is too old for this version of Moonfin. '
      'Update Silo to use it.',
    );
  });

  test('siloWaitText: seconds up to a minute and a half, then minutes', () {
    expect(siloWaitText(const Duration(milliseconds: 200), l10n), '1 second');
    expect(siloWaitText(const Duration(seconds: 90), l10n), '90 seconds');
    expect(siloWaitText(const Duration(seconds: 91), l10n), '2 minutes');
    expect(siloWaitText(const Duration(minutes: 60), l10n), '60 minutes');
  });
}
