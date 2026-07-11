import 'package:dio/dio.dart';

/// Instant failures in the same DioException shapes callers already handle
/// for network loss, minus the connect-timeout stall.
DioException offlineNotFound(String path) => DioException(
  requestOptions: RequestOptions(path: path),
  response: Response(
    requestOptions: RequestOptions(path: path),
    statusCode: 404,
  ),
  type: DioExceptionType.badResponse,
  message: 'Not available offline',
);

DioException offlineUnavailable(String path) => DioException(
  requestOptions: RequestOptions(path: path),
  type: DioExceptionType.connectionError,
  message: 'Not available offline',
);
