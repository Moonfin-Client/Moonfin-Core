import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_live_tv_api.dart';
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
  group('JellyfinLiveTvApi.getGuide /LiveTv/Programs transport', () {
    test('small channel list → GET with comma-joined ChannelIds string', () async {
      final cap = _Capture();
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(channelIds: ['a', 'b', 'c']);

      expect(cap.last!.method, 'GET');
      expect(cap.last!.path, '/LiveTv/Programs');
      expect(cap.last!.queryParameters['ChannelIds'], 'a,b,c');
    });

    test('large channel list → POST with ChannelIds as a JSON array', () async {
      // >1800 chars of joined ids forces the POST path. 60 × 36-char ids ≈ 2.2k.
      final ids = List.generate(
        60,
        (i) => '0000000000000000000000000000${i.toString().padLeft(8, '0')}',
      );
      final cap = _Capture();
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(channelIds: ids);

      expect(cap.last!.method, 'POST');
      expect(cap.last!.path, '/LiveTv/Programs');
      final body = cap.last!.data as Map<String, dynamic>;
      // Must be a real list (Vec<Uuid> on remux), NOT a comma-joined string.
      expect(body['ChannelIds'], isA<List<String>>());
      expect((body['ChannelIds'] as List).length, 60);
    });

    test('forwards EnableImages/EnableUserData to keep the payload small', () async {
      final cap = _Capture();
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

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
