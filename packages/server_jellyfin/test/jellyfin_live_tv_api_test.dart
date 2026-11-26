import 'dart:async';

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
  test('the guide retries missing groups per viewer and server, including after a late 404', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://one.test'));
    final late404 = Completer<int>();
    final started = Completer<void>();
    final replies = <FutureOr<int>>[404, 503, 200, 200, 200, late404.future, 200, 200];
    dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) async {
      final next = replies.removeAt(0);
      if (next == late404.future) started.complete();
      final status = await next;
      final response = Response(requestOptions: request, statusCode: status, data: {'supported': true, 'channels': []});
      if (status == 200) return handler.resolve(response);
      handler.reject(DioException.badResponse(statusCode: status, requestOptions: request, response: response));
    }));
    var now = DateTime.utc(2026, 11, 18);
    final api = JellyfinLiveTvApi(dio, now: () => now);
    Future<bool> available(String viewer) async => (await api.getChannelGroups(userId: viewer)).endpointAvailable;
    expect(await available('one'), isFalse);
    expect(await available('one'), isFalse);
    await expectLater(available('two'), throwsA(isA<DioException>()));
    expect(await available('two'), isTrue);
    dio.options.baseUrl = 'https://two.test';
    expect(await available('one'), isTrue);
    now = now.add(const Duration(minutes: 5));
    dio.options.baseUrl = 'https://one.test';
    expect(await available('one'), isTrue);

    final stale = available('one');
    await started.future;
    expect(await available('one'), isTrue);
    late404.complete(404);
    expect(await stale, isFalse);
    expect(await available('one'), isTrue);
    expect(replies, isEmpty);
  });

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

    test('a genre flag with no channel list searches the whole lineup', () async {
      final cap = _Capture();
      final api = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.getGuide(isSports: true);

      expect(cap.last!.method, 'GET');
      expect(cap.last!.queryParameters['IsSports'], true);
      expect(cap.last!.queryParameters.containsKey('ChannelIds'), isFalse);
      // Unset flags must be omitted, not sent as null/false.
      expect(cap.last!.queryParameters.containsKey('IsKids'), isFalse);
      expect(cap.last!.queryParameters.containsKey('IsMovie'), isFalse);
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

    test('settings override the server defaults and keep the program id', () async {
      final cap = _Capture()
        ..defaultsBody = {
          'RecordNewOnly': true,
          'SkipEpisodesInLibrary': false,
          'Days': <String>[],
        };
      final api  = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.createSeriesTimer(
        'program-1',
        settings: {'RecordNewOnly': false, 'SkipEpisodesInLibrary': true},
      );

      expect(cap.all.last.method, 'POST');
      expect(cap.all.last.path, '/LiveTv/SeriesTimers');
      final body = cap.all.last.data as Map<String, dynamic>;
      expect(body['RecordNewOnly'], false);
      expect(body['SkipEpisodesInLibrary'], true);
      expect(body['Days'], <String>[]);
      expect(body['ProgramId'], 'program-1');
    });

    test('reads one series timer from /LiveTv/SeriesTimers/{id}', () async {
      final cap = _Capture();
      final api  = JellyfinLiveTvApi(Dio()..interceptors.add(cap));

      await api.getSeriesTimer('series-1');

      expect(cap.last!.method, 'GET');
      expect(cap.last!.path, '/LiveTv/SeriesTimers/series-1');
    });

    test('updating a series timer posts the given rule unchanged', () async {
      final cap = _Capture();
      final api  = JellyfinLiveTvApi(Dio()..interceptors.add(cap));
      final rule = {'Id': 'series-1', 'Name': 'Show', 'RecordNewOnly': true};

      await api.updateSeriesTimer('series-1', rule);

      expect(cap.last!.method, 'POST');
      expect(cap.last!.path, '/LiveTv/SeriesTimers/series-1');
      expect(cap.last!.data, rule);
    });
  });
}
