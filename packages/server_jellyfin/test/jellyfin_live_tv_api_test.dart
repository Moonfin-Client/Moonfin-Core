import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_live_tv_api.dart';
import 'package:test/test.dart';

class _Capture extends Interceptor {
  final List<RequestOptions> all = [];

  /// What the defaults call answers with. Leaving it null fails that call,
  /// which is the path where a timer falls back to a bare program id.
  Object? defaultsBody;

  RequestOptions? get last => all.isEmpty ? null : all.last;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    all.add(options);
    if (options.path == '/LiveTv/Timers/Defaults') {
      final body = defaultsBody;
      if (body == null) {
        h.reject(DioException(requestOptions: options));
        return;
      }
      h.resolve(
        Response(requestOptions: options, statusCode: 200, data: body),
      );
      return;
    }
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

  group('JellyfinLiveTvApi series timers', () {
    test('posts the server defaults to /LiveTv/SeriesTimers', () async {
      final cap = _Capture()
        ..defaultsBody = {'RecordNewOnly': true, 'Days': <String>[]};
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.createSeriesTimer('program-1');

      expect(cap.all.first.method, 'GET');
      expect(cap.all.first.path, '/LiveTv/Timers/Defaults');
      expect(cap.all.first.queryParameters['ProgramId'], 'program-1');

      expect(cap.all.last.method, 'POST');
      expect(cap.all.last.path, '/LiveTv/SeriesTimers');
      final body = cap.all.last.data as Map<String, dynamic>;
      expect(body['RecordNewOnly'], true);
      expect(body['ProgramId'], 'program-1');
    });

    test('an episode timer still goes to /LiveTv/Timers', () async {
      final cap = _Capture()..defaultsBody = <String, dynamic>{};
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.createTimer('program-1');

      expect(cap.all.last.path, '/LiveTv/Timers');
    });

    test('a server that refuses defaults still gets the program id', () async {
      final cap = _Capture();
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.createSeriesTimer('program-1');

      expect(cap.all.last.path, '/LiveTv/SeriesTimers');
      expect(cap.all.last.data, {'ProgramId': 'program-1'});
    });
  });
}
