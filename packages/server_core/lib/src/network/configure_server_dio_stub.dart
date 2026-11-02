import 'package:dio/dio.dart';

/// The browser owns the connection pool on web, so there is nothing here to
/// set and nothing that can hand out a connection the peer already closed.
void configureServerDio(
  Dio dio, {
  Duration? idleTimeout,
  bool limitRequests = true,
}) {}
