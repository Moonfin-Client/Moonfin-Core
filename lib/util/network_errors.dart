import 'package:dio/dio.dart';

/// Whether [error] is the server being unreachable rather than a bug, so a
/// screen can show its localized connection message instead of the raw
/// exception text.
bool isNetworkException(Object? error) {
  if (error is! DioException) return false;
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.connectionError => true,
    _ => false,
  };
}

/// Whether [error] is the server refusing a sign in outright, which is a 403
/// where a wrong password is a 401.
///
/// Jellyfin only puts the reason in the body when it runs in development and
/// answers "Error processing request." otherwise, so the status is all there is
/// to go on. It covers an access schedule that doesn't allow the current time,
/// a disabled account and a lockout alike.
bool isSignInForbidden(DioException error) =>
    error.response?.statusCode == 403;
