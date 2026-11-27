import 'package:dio/dio.dart';

typedef FakeAnswer = ({
  int status,
  Object? data,
  Map<String, List<String>> headers,
});

FakeAnswer reply(
  int status,
  Object? data, {
  Map<String, List<String>> headers = const {},
}) => (status: status, data: data, headers: headers);

FakeAnswer ok(Object? data) => reply(200, data);

/// Answers every request from [answer], which gives either a [reply] or the
/// body of a 200.
class FakeServer extends Interceptor {
  FakeServer(this.answer);

  final Object? Function(RequestOptions options) answer;
  final requests = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requests.add(options);
    final reply = switch (answer(options)) {
      final FakeAnswer reply => reply,
      final data => ok(data),
    };
    handler.resolve(
      Response(
        requestOptions: options,
        statusCode: reply.status,
        data: reply.data,
        headers: Headers.fromMap(reply.headers),
      ),
    );
  }
}

(Dio, FakeServer) fakeDio(Object? Function(RequestOptions options) answer) {
  final server = FakeServer(answer);
  return (Dio()..interceptors.add(server), server);
}
