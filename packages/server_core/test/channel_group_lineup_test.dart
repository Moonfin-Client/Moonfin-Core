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
  test('returns grouped and ungrouped channels', () async {
    final rows = [
      {'Id': 'one', 'Name': 'One', 'groups': ['News']},
      {'Id': 'two', 'Name': 'Two', 'groups': <String>[]},
    ];
    final grouped = await ChannelGroupLineup.fetch(
      fixture(200, body: {'supported': true, 'channels': rows}));
    expect(grouped.channels, rows);
    expect(grouped.groupsByChannelId, {'one': {'News'}});
    final empty = await ChannelGroupLineup.fetch(
      fixture(200, body: {'supported': false, 'channels': [rows.last]}));
    expect(empty.groupsByChannelId, isEmpty);
  });
  test('preserves labels and partial membership', () async {
    final result = await ChannelGroupLineup.fetch(fixture(200, body: {
      'supported': true, 'partial': true, 'unresolvedChannelIds': ['offline'],
      'channels': [{'Id': 'seven', 'Name': 'Seven', 'groups':
        ['US| SPORTS', 'US|SPORTS', 'Kids', 'Kids', ' ']}],
    }));
    expect(result.groupsByChannelId, {'seven': {'US| SPORTS', 'US|SPORTS', 'Kids'}});
    expect(result.partial, isTrue);
    expect(result.unresolvedChannelIds, {'offline'});
  });
  test('missing plugin falls back but errors propagate', () async {
    final missing = await ChannelGroupLineup.fetch(fixture(404));
    expect(missing.endpointAvailable, isFalse);
    for (final code in [401, 403, 503]) {
      await expectLater(ChannelGroupLineup.fetch(fixture(code)), throwsA(isA<DioException>()));
    }
  });
}
