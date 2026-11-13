import 'package:dio/dio.dart';

/// Set on the errors this file fabricates, so callers can tell them from a
/// server's own reply.
const _offlineErrorKey = 'moonfinOfflineAnswer';

/// Whether [error] was made up by the offline catalog rather than sent by a
/// server: its 404 only means the title isn't downloaded.
bool isFabricatedOfflineError(Object? error) =>
    error is DioException && error.requestOptions.extra[_offlineErrorKey] == true;

/// Instant failures in the same DioException shapes callers already handle
/// for network loss, minus the connect-timeout stall.
DioException offlineNotFound(String path) => DioException(
  requestOptions: RequestOptions(path: path, extra: {_offlineErrorKey: true}),
  response: Response(
    requestOptions: RequestOptions(path: path),
    statusCode: 404,
  ),
  type: DioExceptionType.badResponse,
  message: 'Not available offline',
);

DioException offlineUnavailable(String path) => DioException(
  requestOptions: RequestOptions(path: path, extra: {_offlineErrorKey: true}),
  type: DioExceptionType.connectionError,
  message: 'Not available offline',
);
