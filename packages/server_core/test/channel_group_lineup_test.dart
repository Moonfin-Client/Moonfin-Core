import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

Dio fixture(int status, {Object? body}) {
  final dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request, handler) {
        expect(request.method, 'GET');
        expect(request.path, '/Moonfin/LiveTv/ChannelGroups');
        expect(request.queryParameters, isEmpty);
        final response = Response(
          requestOptions: request,
          data: body,
          statusCode: status,
        );
        if (status == 200) {
          handler.resolve(response);
        } else {
          handler.reject(
            DioException.badResponse(
              statusCode: status,
              requestOptions: request,
              response: response,
            ),
          );
        }
      },
    ),
  );
  return dio;
}

void main() {
  test('reads grouped and ungrouped channels in one response', () async {
    final rows = [
      {'Id': 'one', 'Name': 'One', 'groups': ['News']},
      {'Id': 'two', 'Name': 'Two', 'groups': <String>[]},
    ];
    final result = await ChannelGroupLineup.fetch(
      fixture(200, body: {'supported': true, 'channels': rows}),
    );
    expect(result.channels, rows);
    expect(result.groupsByChannelId, {'one': {'News'}});
    final ungrouped = await ChannelGroupLineup.fetch(
      fixture(200, body: {'supported': false, 'channels': [rows.last]}),
    );
    expect(ungrouped.channels, hasLength(1));
    expect(ungrouped.groupsByChannelId, isEmpty);
  });
  test(
    'reads exact labels, removes blanks and preserves partial results',
    () async {
      final result = await ChannelGroupLineup.fetch(
        fixture(
          200,
          body: {
            'supported': true,
            'partial': true,
            'unresolvedChannelIds': ['offline'],
            'channels': [
              {'Id': 'seven', 'Name': 'Seven', 'groups': ['US| SPORTS', 'US|SPORTS', 'Kids', 'Kids', ' ']},
            ],
          },
        ),
      );
      expect(result.groupsByChannelId, {
        'seven': {'US| SPORTS', 'US|SPORTS', 'Kids'},
      });
      expect(result.partial, true);
      expect(result.unresolvedChannelIds, {'offline'});
    },
  );

  test(
    'missing Moonbase falls back while authorization errors are reported',
    () async {
      final missing = await ChannelGroupLineup.fetch(fixture(404));
      expect(missing.channels, isNull);
      expect(missing.endpointAvailable, isFalse);
      for (final status in [401, 403, 503]) {
        await expectLater(
          ChannelGroupLineup.fetch(fixture(status)),
          throwsA(isA<DioException>()),
        );
      }
    },
  );
}
