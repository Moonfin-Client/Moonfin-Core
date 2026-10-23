import 'package:dio/dio.dart';
import 'package:server_plex/src/api/plex_live_tv_api.dart';
import 'package:server_plex/src/api/plex_playback_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.answer);

  final Object? Function(RequestOptions options) answer;
  final requests = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requests.add(options);
    handler.resolve(Response(requestOptions: options, data: answer(options)));
  }
}

// One program showing on two channels, as the XMLTV guide lists it.
const _teletubbies = {
  'type': 'episode',
  'title': 'Episode 5',
  'grandparentTitle': 'Teletubbies',
  'summary': 'The Teletubbies learn gymnastics.',
  'index': 5,
  'parentIndex': 3,
  'Media': [
    {
      'beginsAt': 1792699380,
      'endsAt': 1792703040,
      'channelIdentifier': '4',
      'channelTitle': '4 USA Teletubbies',
      'premiere': '1',
      'onAir': true,
    },
    {
      'beginsAt': 1792710000,
      'endsAt': 1792713660,
      'channelIdentifier': '9',
      'channelTitle': '9 USA Barney',
    },
  ],
};

(Dio, _FakeServer) _server() {
  final server = _FakeServer(
    (options) => switch (options.uri.path) {
      '/livetv/dvrs' => {
        'MediaContainer': {
          'Dvr': [
            {'key': '2', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:2'},
          ],
        },
      },
      '/tv.plex.providers.epg.xmltv:2/lineups/dvr/channels' => {
        'MediaContainer': {
          'Channel': [
            {
              'id': '4',
              'vcn': '4',
              'title': 'USA Teletubbies',
              'thumb': 'http://dispatcharr/logos/4',
            },
          ],
        },
      },
      '/lineups/plex/channels' => {
        'MediaContainer': {
          'Channel': [
            {
              'id': 'abc-66635fc0',
              'vcn': '000',
              'title': 'CW Forever',
              'thumb': 'https://provider-static.plex.tv/cw.png',
            },
            {'id': 'locked-1', 'title': 'Locked', 'drm': true},
          ],
        },
      },
      '/tv.plex.providers.epg.xmltv:2/grid' => {
        'MediaContainer': {
          'Metadata': [
            _teletubbies,
            {
              'type': 'movie',
              'title': 'SuperKitties',
              'Media': [
                {
                  'beginsAt': 1792703040,
                  'endsAt': 1792704540,
                  'channelIdentifier': '4',
                },
              ],
            },
          ],
        },
      },
      '/media/subscriptions/scheduled' => {
        'MediaContainer': {
          'MediaGrabOperation': [
            {
              'id': 'once',
              'mediaSubscriptionID': 7,
              'mediaIndex': 0,
              'status': 'scheduled',
              'provider': 'tv.plex.providers.epg.xmltv:2',
              'Metadata': _teletubbies,
            },
            {
              'id': 'weekly',
              'mediaSubscriptionID': 8,
              'mediaIndex': 1,
              'status': 'inprogress',
              'provider': 'tv.plex.providers.epg.xmltv:2',
              'Metadata': {..._teletubbies, 'grandparentSubscriptionID': '8'},
            },
          ],
        },
      },
      '/media/subscriptions/template' => {
        'MediaContainer': {
          'SubscriptionTemplate': [
            {
              'MediaSubscription': [
                {
                  'type': 4,
                  'parameters': 'hints%5Btype%5D=4',
                  'targetLibrarySectionID': 2,
                  'targetSectionLocationID': 3,
                  'Setting': [
                    {'id': 'recordPartials', 'value': 'true'},
                    {'id': 'lineupChannel', 'value': ''},
                  ],
                },
                {
                  'type': 2,
                  'parameters': 'hints%5Btype%5D=2',
                  'Setting': [
                    {'id': 'onlyNewAirings', 'value': '1'},
                  ],
                },
              ],
            },
          ],
        },
      },
      '/media/subscriptions/8' => {
        'MediaContainer': {
          'MediaSubscription': [
            {
              'key': '8',
              'type': 2,
              'Setting': [
                {'id': 'onlyNewAirings', 'value': '1'},
              ],
            },
          ],
        },
      },
      '/livetv/dvrs/2/channels/4/tune' => {
        'MediaContainer': {
          'MediaSubscription': [
            {
              'MediaGrabOperation': [
                {
                  'Metadata': {
                    'key': '/livetv/sessions/f00d',
                    'ratingKey': '12345',
                  },
                },
              ],
            },
          ],
        },
      },
      '/grid' => {
        'MediaContainer': {
          'Metadata': [
            {
              'type': 'movie',
              'title': 'Law Abiding Citizen',
              'Media': [
                {'beginsAt': 1792699200, 'endsAt': 1792706400},
                {'beginsAt': 1792800000, 'endsAt': 1792807200},
              ],
            },
          ],
        },
      },
      _ => {'MediaContainer': <String, dynamic>{}},
    },
  );
  return (Dio()..interceptors.add(server), server);
}

void main() {
  test('channel and showing ids come apart again', () {
    expect(plexChannelOf('channel-2-4'), (source: '2', channel: '4'));
    expect(plexChannelOf('channel-plex-abc-66635fc0'), (
      source: 'plex',
      channel: 'abc-66635fc0',
    ));
    expect(plexChannelOf('1715'), isNull);
    expect(plexAiringOf('airing-plex-1792699380-abc-66635fc0'), (
      source: 'plex',
      beginsAt: 1792699380,
      channel: 'abc-66635fc0',
    ));
  });

  test(
    "the tuner's channels come first, numbered, then the free ones",
    () async {
      final (dio, _) = _server();
      final result = await PlexLiveTvApi(dio).getChannels();

      final channels = (result['Items'] as List).cast<Map>();
      expect(channels.map((c) => c['Id']), [
        'channel-2-4',
        'channel-plex-abc-66635fc0',
      ]);
      expect(channels.first, containsPair('ChannelNumber', '4'));
      expect(channels.first['Type'], 'TvChannel');
      expect(channels.last.containsKey('ChannelNumber'), isFalse);
      expect(result['TotalRecordCount'], 2);
    },
  );

  test('every showing of a program is a program of its own', () async {
    final (dio, server) = _server();
    final result = await PlexLiveTvApi(dio).getGuide(
      startDate: DateTime.utc(2026, 10, 22),
      endDate: DateTime.utc(2026, 10, 23),
      channelIds: ['channel-2-4'],
    );

    final programs = (result['Items'] as List).cast<Map>();
    expect(programs, hasLength(2));
    expect(
      programs.first,
      allOf(
        containsPair('Id', 'airing-2-1792699380-4'),
        containsPair('ChannelId', 'channel-2-4'),
        containsPair('Name', 'Teletubbies'),
        containsPair('EpisodeTitle', 'Episode 5'),
        containsPair('IsPremiere', true),
        containsPair('IndexNumber', 5),
        containsPair('StartDate', '2026-10-22T20:03:00.000Z'),
      ),
    );
    expect(programs.first['TimerId'], 'once');
    expect(
      programs.last,
      allOf(
        containsPair('Name', 'SuperKitties'),
        containsPair('IsMovie', false),
      ),
    );
    expect(programs.last.containsKey('TimerId'), isFalse);
    final grid = server.requests.singleWhere(
      (r) => r.uri.path.endsWith('/grid'),
    );
    expect(grid.queryParameters['type'], '1,4');
  });

  test('recording one showing holds it to its channel and time', () async {
    final (dio, server) = _server();
    await PlexLiveTvApi(dio).createTimer('airing-2-1792699380-4');

    final post = server.requests.singleWhere((r) => r.method == 'POST');
    expect(post.uri.path, '/media/subscriptions');
    expect(post.uri.query, startsWith('hints%5Btype%5D=4&'));
    expect(
      post.uri.queryParameters,
      allOf(
        containsPair('type', '4'),
        containsPair('targetLibrarySectionID', '2'),
        containsPair('prefs[recordPartials]', 'true'),
        containsPair('prefs[lineupChannel]', '4'),
        containsPair('prefs[startTimeslot]', '1792699380'),
      ),
    );
  });

  test('a series rule takes repeats or not, and can be changed', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);

    await api.createSeriesTimer(
      'airing-2-1792699380-4',
      settings: {'RecordNewOnly': false, 'SkipEpisodesInLibrary': true},
    );
    final rule = await api.getSeriesTimer('8');
    await api.updateSeriesTimer('8', {...rule, 'RecordNewOnly': false});

    final post = server.requests.singleWhere((r) => r.method == 'POST');
    expect(
      post.uri.queryParameters,
      allOf(
        containsPair('type', '2'),
        containsPair('prefs[onlyNewAirings]', '0'),
      ),
    );
    expect(rule, containsPair('RecordNewOnly', true));
    final put = server.requests.singleWhere((r) => r.method == 'PUT');
    expect(put.uri.path, '/media/subscriptions/8');
    expect(put.uri.queryParameters, {'prefs[onlyNewAirings]': '0'});
  });

  test('scheduled showings are timers, and each cancels its own way', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);

    final timers = ((await api.getTimers())['Items'] as List).cast<Map>();
    expect(
      timers.first,
      allOf(
        containsPair('Id', 'once'),
        containsPair('ProgramId', 'airing-2-1792699380-4'),
        containsPair('Status', 'New'),
      ),
    );
    expect(timers.first.containsKey('SeriesTimerId'), isFalse);
    expect(
      timers.last,
      allOf(
        containsPair('ProgramId', 'airing-2-1792710000-9'),
        containsPair('SeriesTimerId', '8'),
        containsPair('Status', 'InProgress'),
      ),
    );

    await api.cancelTimer('once');
    await api.cancelTimer('airing-2-1792710000-9');
    expect(
      server.requests.where((r) => r.method == 'DELETE').map((r) => r.uri.path),
      ['/media/subscriptions/7', '/media/grabbers/operations/weekly'],
    );
  });

  test('a free channel only asks plex.tv for showings in the window', () async {
    final (dio, server) = _server();
    final result = await PlexLiveTvApi(dio).getGuide(
      startDate: DateTime.utc(2026, 10, 22, 20).toLocal(),
      endDate: DateTime.utc(2026, 10, 22, 22).toLocal(),
      channelIds: ['channel-plex-abc-66635fc0'],
    );

    final programs = (result['Items'] as List).cast<Map>();
    expect(programs.map((p) => p['Id']), [
      'airing-plex-1792699200-abc-66635fc0',
    ]);
    final grid = server.requests.single;
    expect(grid.uri.path, '/grid');
    expect(grid.queryParameters['date'], '2026-10-22');
  });

  test('a free channel plays straight from plex.tv', () async {
    final (dio, server) = _server();
    final info = await PlexPlaybackApi(dio, const {
      'X-Plex-Product': 'Moonfin',
    }).getPlaybackInfo('channel-plex-abc-66635fc0');

    final source = (info['MediaSources'] as List).single as Map;
    expect(
      source['TranscodingUrl'],
      startsWith(
        'https://epg.provider.plex.tv/library/parts/abc-66635fc0.m3u8?',
      ),
    );
    expect(source['SupportsDirectPlay'], isFalse);
    expect(server.requests, isEmpty);
  });

  test('a tuner channel is tuned, decided, then streamed', () async {
    final (dio, server) = _server();
    final api = PlexPlaybackApi(dio, const {'X-Plex-Product': 'Moonfin'});
    final info = await api.getPlaybackInfo('channel-2-4');

    expect(server.requests.map((r) => r.uri.path), [
      '/livetv/dvrs/2/channels/4/tune',
      '/video/:/transcode/universal/decision',
    ]);
    final source = (info['MediaSources'] as List).single as Map;
    final start = Uri.parse(source['TranscodingUrl'] as String);
    expect(start.path, '/video/:/transcode/universal/start.m3u8');
    expect(start.queryParameters['path'], '/livetv/sessions/f00d');
    expect(start.queryParameters['session'], info['PlaySessionId']);

    await api.reportPlaybackProgress({
      'ItemId': 'channel-2-4',
      'PlaySessionId': info['PlaySessionId'],
      'PositionTicks': 300000000,
    });
    expect(
      server.requests.last.uri.queryParameters,
      allOf(
        containsPair('ratingKey', '12345'),
        containsPair('key', '/livetv/sessions/f00d'),
        containsPair('time', '30000'),
      ),
    );
  });

  test('only a cap a broadcast could pass reaches a tuner stream', () async {
    Future<Map<String, String>> startFor(int bitrate) async {
      final (dio, _) = _server();
      final info = await PlexPlaybackApi(dio, const {}).getPlaybackInfo(
        'channel-2-4',
        requestBody: {'MaxStreamingBitrate': bitrate},
      );
      final source = (info['MediaSources'] as List).single as Map;
      return Uri.parse(source['TranscodingUrl'] as String).queryParameters;
    }

    expect((await startFor(120000000)).containsKey('maxVideoBitrate'), isFalse);
    expect((await startFor(8000000))['maxVideoBitrate'], '8000');
  });
}
