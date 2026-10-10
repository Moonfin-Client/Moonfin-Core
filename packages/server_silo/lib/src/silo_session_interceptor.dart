import 'package:dio/dio.dart';

import 'silo_session.dart';

/// Keeps a Silo session's access token fresh around every request.
///
/// Before a request it refreshes a token that is about to expire. When an
/// authenticated request comes back `401`, it refreshes once and replays that
/// request once. Requests flagged [siloNoRefreshExtra] (sign-in, refresh, PIN
/// checks, device sign-in) are never replayed.
///
/// Each request is stamped with the session's [SiloSession.identity] when it
/// is first sent. A request that waited on a refresh is only sent, and a
/// failed request is only refreshed and replayed, while that identity is
/// still current, so a reply that arrives after a sign-out,
/// sign-in or profile switch fails instead of being retried as the new user.
///
/// Refreshes go out on [_authDio], a client without this interceptor: sending
/// them through [_dio] would re-enter this interceptor mid-request. Replays go
/// through [_dio] so they pick up the new token from the header interceptor.
class SiloSessionInterceptor extends Interceptor {
  SiloSessionInterceptor(this._dio, this._authDio, this._session);

  final Dio _dio;
  final Dio _authDio;
  final SiloSession _session;

  static const _retriedExtra = 'silo.retried';
  static const _identityExtra = 'silo.identity';

  bool _isCurrent(RequestOptions options) =>
      options.extra[_identityExtra] == _session.identity;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // A replay keeps the stamp of its first attempt.
    options.extra.putIfAbsent(_identityExtra, () => _session.identity);
    if (options.extra[_retriedExtra] == true && !_isCurrent(options)) {
      return handler.reject(_identityChanged(options));
    }
    final skip = options.extra[siloNoRefreshExtra] == true ||
        options.extra[siloNoAuthExtra] == true;
    if (!skip && _session.needsRefresh) {
      await _session.refresh(_authDio);
      // The login or profile may have changed while this request waited;
      // sending it now would act as whoever took over.
      if (!_isCurrent(options)) {
        return handler.reject(_identityChanged(options));
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final eligible = options.extra[siloNoRefreshExtra] != true &&
        options.extra[siloNoAuthExtra] != true &&
        options.extra[_retriedExtra] != true &&
        options.headers['Authorization'] != null &&
        _isCurrent(options) &&
        _session.canRefresh &&
        isSiloRefreshableAuthError(err);
    if (!eligible) return handler.next(err);

    final sentToken = options.headers['Authorization'];
    // Another request may already have refreshed while this one was in flight.
    final alreadyFresh = _session.accessToken != null &&
        sentToken != 'Bearer ${_session.accessToken}';
    final refreshed = alreadyFresh || await _session.refresh(_authDio);
    if (!refreshed || !_isCurrent(options)) return handler.next(err);

    try {
      options.extra[_retriedExtra] = true;
      options.headers.remove('Authorization');
      final response = await _dio.fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  static DioException _identityChanged(RequestOptions options) => DioException(
        requestOptions: options,
        type: DioExceptionType.cancel,
        error: 'The Silo login or profile changed before this request was '
            'sent',
      );
}
