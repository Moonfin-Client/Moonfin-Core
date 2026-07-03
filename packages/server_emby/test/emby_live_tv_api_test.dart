import 'package:dio/dio.dart';
import 'package:server_emby/src/api/emby_live_tv_api.dart';
import 'package:test/test.dart';

class _Capture extends Interceptor {
  RequestOptions? last;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    last = options;
    h.resolve(
      Response(
        requestOptions: options,
        statusCode: 200,
        data: {'Items': <dynamic>[], 'TotalRecordCount': 0},
      ),
    );
  }
}

void main() {
  group('EmbyLiveTvApi.getGuide /LiveTv/Programs transport', () {
    test('small channel list → GET with comma-joined ChannelIds string', () async {
      final cap = _Capture();
      final api = EmbyLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(channelIds: ['a', 'b', 'c']);

      expect(cap.last!.method, 'GET');
      expect(cap.last!.path, '/LiveTv/Programs');
      expect(cap.last!.queryParameters['ChannelIds'], 'a,b,c');
    });

    test('large channel list → POST with ChannelIds as a JSON array', () async {
      final ids = List.generate(
        60,
        (i) => '0000000000000000000000000000${i.toString().padLeft(8, '0')}',
      );
      final cap = _Capture();
      final api = EmbyLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(channelIds: ids);

      expect(cap.last!.method, 'POST');
      expect(cap.last!.path, '/LiveTv/Programs');
      final body = cap.last!.data as Map<String, dynamic>;
      expect(body['ChannelIds'], isA<List<String>>());
      expect((body['ChannelIds'] as List).length, 60);
    });

    test('forwards EnableImages/EnableUserData to keep the payload small', () async {
      final cap = _Capture();
      final api = EmbyLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(
        channelIds: ['a', 'b'],
        enableImages: false,
        enableUserData: false,
      );

      expect(cap.last!.method, 'GET');
      expect(cap.last!.queryParameters['EnableImages'], false);
      expect(cap.last!.queryParameters['EnableUserData'], false);
    });
  });
}
