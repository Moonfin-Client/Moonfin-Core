import 'dart:async';

import 'package:dio/dio.dart';

/// Retry policy for the small `kind: 'settings'` writes (controller mappings,
/// player assignments) that ride the ordinary media-server HTTP connection.
///
/// Those writes had no retry at all, so a single dropped packet on Wi-Fi lost
/// the edit permanently. They are idempotent whole-document PUTs, which is what
/// makes retrying safe: replaying one cannot append or double-apply anything.

/// Waits before the 2nd, 3rd and 4th attempts. Worst case adds ~4.25s on top of
/// the attempts themselves, which is tolerable because these writes happen in
/// the background of a menu the user is already in.
const List<Duration> defaultSettingsSaveBackoff = [
  Duration(milliseconds: 250),
  Duration(seconds: 1),
  Duration(seconds: 3),
];

/// Whether [error] is worth trying again.
///
/// Only transport-level failures and server-side "try later" responses qualify.
/// A 4xx means the request itself is wrong, so repeating it verbatim would fail
/// identically while delaying the error the user should see. Anything that is
/// not a [DioException] is an unknown, and unknowns are not retried.
bool isTransientTransportFailure(Object error) {
  if (error is! DioException) return false;
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return true;
    case DioExceptionType.badResponse:
      final status = error.response?.statusCode ?? 0;
      return status == 408 || status == 429 || status >= 500;
    case DioExceptionType.cancel:
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return false;
  }
}

/// Runs [attempt], retrying it while [isTransientTransportFailure] holds.
///
/// Rethrows the final failure so callers can still tell the user the write did
/// not land -- retrying quietly and then swallowing the result would be the
/// same silent data loss with extra steps.
///
/// [delay] exists so tests do not wait out the real backoff.
Future<T> retryOnTransientFailure<T>(
  Future<T> Function() attempt, {
  List<Duration> backoff = defaultSettingsSaveBackoff,
  Future<void> Function(Duration)? delay,
}) async {
  final sleep = delay ?? ((Duration d) => Future<void>.delayed(d));
  for (var retries = 0; ; retries++) {
    try {
      return await attempt();
    } catch (error) {
      if (retries >= backoff.length || !isTransientTransportFailure(error)) {
        rethrow;
      }
      await sleep(backoff[retries]);
    }
  }
}
