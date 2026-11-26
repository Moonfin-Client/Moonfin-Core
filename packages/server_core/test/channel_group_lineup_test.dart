import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

Dio fixture(int status, {Object? body}) => Dio()
  ..interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
    expect(request.path, '/Moonfin/LiveTv/ChannelGroups');
    final response = Response(requestOptions: request, data: body, statusCode: status);
    if (status == 200) {
      handler.resolve(response);
    } else {
      handler.reject(DioException.badResponse(
          statusCode: status, requestOptions: request, response: response));
    }
  }));

void main() {
  test('a partial import keeps visible channels and exact group names for the guide', () async {
    final rows = [
      {'Id': 'one', 'Name': 'One', 'ChannelNumber': 7, 'groups': ['US| SPORTS', 'US|SPORTS', 'Kids', 'Kids', ' ']},
      {'Id': 'two', 'Name': 'Two', 'ChannelNumber': '7.1', 'groups': <String>[]},
    ];
    final grouped = await ChannelGroupLineup.fetch(fixture(200, body: {
      'supported': true, 'partial': true, 'unresolvedChannelIds': ['offline'], 'channels': rows,
    }));
    expect(grouped.channels!.map((c) => c['Id']), ['one', 'two']);
    expect(grouped.channels!.first.containsKey('ChannelNumber'), isFalse);
    expect(grouped.channels!.last, rows.last);
    expect(grouped.groupsByChannelId, {'one': {'US| SPORTS', 'US|SPORTS', 'Kids'}});
    expect(grouped.partial, isTrue);
    expect(grouped.unresolvedChannelIds, {'offline'});

    final unsupported = await ChannelGroupLineup.fetch(fixture(200, body: {'supported': false, 'channels': [rows.last]}));
    expect(unsupported.groupsByChannelId, isEmpty);
  });

  test('missing plugin falls back but errors propagate', () async {
    final missing = await ChannelGroupLineup.fetch(fixture(404));
    expect(missing.endpointAvailable, isFalse);
    for (final code in [401, 403, 503]) {
      await expectLater(ChannelGroupLineup.fetch(fixture(code)), throwsA(isA<DioException>()));
    }
  });
}
