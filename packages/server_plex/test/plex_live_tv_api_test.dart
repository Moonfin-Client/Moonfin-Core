import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_plex/src/api/plex_live_tv_api.dart';
import 'package:server_plex/src/api/plex_playback_api.dart';
import 'package:test/test.dart';

class _FakeServer extends Interceptor {
  _FakeServer(this.answer);

  final Object? Function(RequestOptions options) answer;
  final requests = <RequestOptions>[];
  bool Function(RequestOptions)? failWhen;
  int? Function()? failureStatus;
  final replies = <String, Object? Function(RequestOptions)>{};

  void fail(String path, int? status) {
    failWhen = (r) => r.uri.path == path;
    failureStatus = () => status;
  }

  int reads(String path) => requests.where((r) => r.uri.path == path).length;

  Map<String, dynamic>? tunerReply;
  Map<String, dynamic>? discoveryReply;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (failWhen?.call(options) == true) {
      final code = failureStatus?.call();
      handler.reject(DioException(
        requestOptions: options,
        type: code == null
            ? DioExceptionType.connectionError
            : DioExceptionType.badResponse,
        response: code == null
            ? null
            : Response(requestOptions: options, statusCode: code),
      ));
      return;
    }
    requests.add(options);
    final reply = options.uri.path.startsWith('/tv.plex.providers.epg.xmltv:2/')
        ? tunerReply
        : null;
    final discovery = options.uri.path == '/livetv/dvrs' ? discoveryReply : null;
    handler.resolve(Response(requestOptions: options, data: replies[options.uri.path]?.call(options) ?? discovery ?? reply ?? answer(options)));
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

(Dio, _FakeServer) _server({
  bool secondDvr = false,
  bool liveDvr = false,
  bool malformedDvrGrid = false,
  String Function()? machineId,
}) {
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final server = _FakeServer(
    (options) => switch (options.uri.path) {
      '/identity' => {
        'MediaContainer': {'machineIdentifier': machineId?.call() ?? 'pms-machine-1'},
      },
      '/livetv/dvrs' => {
        'MediaContainer': {
          'Dvr': [
            {'key': '2', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:2'},
            if (secondDvr)
              {'key': '3', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:3'},
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
      '/tv.plex.providers.epg.xmltv:3/lineups/dvr/channels' => {
        'MediaContainer': {'Channel': [{'id': '7', 'title': 'Station Seven'}]},
      },
      '/lineups/plex/channels' || '/lineups/plex/channels/featured' => {
        'MediaContainer': {
          'Channel': [
            {
              'id': 'abc-66635fc0',
              'gridKey': 'provider-42',
              'vcn': '000',
              'title': 'CW Forever',
              'genreRatingKeys': [8, '7', 'blank', 'unknown'],
              'thumb': 'https://provider-static.plex.tv/cw.png',
            },
            // Present in All Channels, but deliberately absent from Featured.
            if (options.uri.path == '/lineups/plex/channels')
              {'id': 'news-extra', 'title': 'News Extra'},
            {'id': 'locked-1', 'title': 'Locked', 'drm': true},
          ],
        },
      },
      '/tv.plex.providers.epg.xmltv:2/grid' => {
        'MediaContainer': {
          'Metadata': malformedDvrGrid ? <String, dynamic>{} : liveDvr ? [
            {'title': 'Malformed listing', 'Media': {}},
            {..._teletubbies, 'Media': [
              for (final offset in [-3600, 0, 7200])
                {'channelIdentifier': '4', 'beginsAt': now + offset - 60,
                 'endsAt': now + offset + 60},
            ]},
          ] : [
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
      '/' => {
        'MediaProvider': {
          'Feature': [
            {
              'type': 'grid',
              'GridChannelFilter': [
                {'genreRatingKey': 7.0, 'title': ' News '},
                {'genreRatingKey': '8', 'title': 'Movies'},
                {'genreRatingKey': 'blank', 'title': '   '},
              ],
              'PromotedGridChannelFilter': [
                {'key': '/lineups/plex/channels/featured', 'title': 'Featured'},
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
      '/hubs/sections/home/whatsOnNow' => {
        'MediaContainer': {
          'Hub': [
            {
              'Metadata': [
                {
                  'type': 'episode',
                  'title': 'Episode 2',
                  'grandparentTitle': 'Free TV show',
                  'Media': [
                    {'beginsAt': now - 60, 'endsAt': now + 3600,
                     'channelIdentifier': 'abc-66635fc0'},
                  ],
                },
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

Map<String, dynamic> _channels(List<Object?> rows, {int? size}) =>
    {'MediaContainer': {'Channel': rows, 'size': ?size}};

Map<String, dynamic> _schedule(String title, List<Map<String, dynamic>> airings) =>
    {'MediaContainer': {'Metadata': [{'title': title, 'Media': airings}]}};

const _airing = {'beginsAt': 1792699200, 'endsAt': 1792706400};

Matcher _httpError(int status) =>
    throwsA(isA<DioException>().having((e) => e.response?.statusCode, 'status', status));

extension on PlexLiveTvApi {
  Future<Map<String, dynamic>> testGuide([List<String>? ids]) => getGuide(
    startDate: DateTime.utc(2026, 10, 22),
    endDate: DateTime.utc(2026, 10, 23),
    channelIds: ids,
  );
}

void main() {
  const free = 'channel-plex-abc-66635fc0';
  const extra = 'channel-plex-news-extra';
  const tuner = 'channel-2-4';
  const other = 'channel-3-9';

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
        'channel-plex-news-extra',
      ]);
      expect(channels.first, containsPair('ChannelNumber', '4'));
      expect(channels.first['Type'], 'TvChannel');
      expect(channels.first['PlexFavoriteSource'],
          'server://pms-machine-1/tv.plex.providers.epg.xmltv:2');
      expect(channels.first['PlexFavoriteId'], '4');
      expect(channels.last.containsKey('PlexFavoriteSource'), isFalse);
      expect(channels.last.containsKey('ChannelNumber'), isFalse);
      expect(result['TotalRecordCount'], 3);
    },
  );

  test('a delayed channel read uses the DVR provider discovered by a newer guide', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);
    final started = Completer<void>();
    final release = Completer<void>();
    dio.interceptors.insert(0, InterceptorsWrapper(onRequest: (request, handler) async {
      if (request.path.endsWith('/lineups/dvr/channels') && !started.isCompleted) {
        started.complete();
        await release.future;
      }
      handler.next(request);
    }));
    final browse = api.getChannels();
    await started.future;
    server.discoveryReply = {'MediaContainer': {'Dvr': [
      {'key': '2', 'epgIdentifier': 'replacement'},
    ]}};
    server.replies['/replacement/lineups/dvr/channels'] = (_) => _channels([{'id': '4', 'title': 'Replacement'}]);
    final newer = (await api.getChannelGroups()).channels!.first;
    expect(newer['PlexFavoriteSource'], 'server://pms-machine-1/replacement');
    release.complete();
    expect((await browse)['Items'].first, newer);
  });

  test('replacing a PMS or losing contact with it cannot bind favorites to an old tuner', () async {
    var machine = 'first';
    final (dio, server) = _server(secondDvr: true, machineId: () => machine);
    final api = PlexLiveTvApi(dio);
    Future<Map> refresh() async => (await api.getChannelGroups()).channels!.first;
    final original = await refresh();
    expect(original['PlexFavoriteSource'], 'server://first/tv.plex.providers.epg.xmltv:2');
    server.fail('/livetv/dvrs', 503);
    expect(await refresh(), original);

    machine = 'replacement';
    final cached = await refresh();
    expect(cached['Id'], tuner);
    expect(cached.keys, isNot(contains('PlexFavoriteSource')));
    expect(cached.keys, isNot(contains('PlexFavoriteId')));
    server.failWhen = (r) => r.path == '/livetv/dvrs' || r.path == '/identity';
    expect((await refresh()).containsKey('PlexFavoriteSource'), isFalse);

    server.fail('/tv.plex.providers.epg.xmltv:3/lineups/dvr/channels', 503);
    final lineup = await api.getChannelGroups();
    const verified = 'server://replacement/tv.plex.providers.epg.xmltv:2';
    expect(lineup.channels!.first['PlexFavoriteSource'], verified);
    final retained = lineup.channels!.singleWhere((row) => row['Id'] == 'channel-3-7');
    expect(retained.containsKey('PlexFavoriteSource'), isFalse);
    final reads = server.reads('/identity');
    await api.getChannels();
    expect(server.reads('/identity'), reads);
    server.fail('/identity', 503);
    expect((await refresh()).containsKey('PlexFavoriteSource'), isFalse);
    server.failWhen = null;
    expect((await api.getChannels())['Items'].first['PlexFavoriteSource'], verified);
  });

  test('browsing a cached DVR distinguishes incomplete discovery from a removed tuner', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);
    final healthy = await api.getChannelGroups();
    Future<List> browse() async => [for (final row in (await api.getChannels())['Items'] as List) row['Id']];
    for (final container in <Map<String, dynamic>?>[
      null, {'size': 1}, {'size': 1, 'Dvr': [{}]},
      {'Dvr': [{'epgIdentifier': 'tuner'}]}, {'Dvr': [{'key': '2', 'epgIdentifier': ' '}]},
    ]) {
      server.discoveryReply = {if (container != null) 'MediaContainer': container};
      final partial = await api.getChannelGroups();
      expect(partial.channels, healthy.channels);
      expect(partial.sources, healthy.sources);
      expect(partial.partial, isTrue);
      expect(partial.unresolvedChannelIds, {tuner});
    }
    server.discoveryReply = {'MediaContainer': {'Dvr': [{}, {'key': 2, 'epgIdentifier': 'tv.plex.providers.epg.xmltv:2'}]}};
    final cold = await PlexLiveTvApi(dio).getChannelGroups();
    expect(cold.partial, isTrue);
    expect(cold.channels, healthy.channels);

    for (final empty in <Map<String, dynamic>>[{}, {'size': 0}, {'Dvr': []}]) {
      server.discoveryReply = null;
      await api.getChannelGroups();
      server.discoveryReply = {'MediaContainer': empty};
      final lineup = await api.getChannelGroups();
      expect(lineup.partial, empty.isEmpty);
      expect(lineup.groupsByChannelId.containsKey(tuner), empty.isEmpty);
      if (empty.isNotEmpty) expect(lineup.sources, isEmpty);
      server.discoveryReply = null;
      final reads = server.reads('/livetv/dvrs');
      expect((await browse()).contains(tuner), empty.isEmpty);
      await browse();
      expect(server.reads('/livetv/dvrs') - reads, empty.isEmpty ? 1 : 0);
    }
    await api.getChannelGroups();
    server.discoveryReply = {'MediaContainer': <String, dynamic>{}};
    await api.getChannelGroups();
    server.fail('/livetv/dvrs', 503);
    expect(await browse(), contains(tuner));
    server.failWhen = null;
    final reads = server.reads('/livetv/dvrs');
    expect(await browse(), isNot(contains(tuner)));
    expect(await browse(), isNot(contains(tuner)));
    expect(server.reads('/livetv/dvrs') - reads, 1);
  });

  test('incomplete discovery marks only unresolved tuner schedules for retry', () async {
    final (dio, server) = _server(secondDvr: true);
    final api = PlexLiveTvApi(dio);
    const missing = 'channel-2-4', empty = 'channel-3-7', free = 'channel-plex-abc-66635fc0';
    final guide = api.testGuide;
    await api.getChannelGroups();
    server.discoveryReply = {'MediaContainer': {'Dvr': [
      {'key': '2'}, {'key': '3', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:3'},
    ]}};
    expect((await api.getChannelGroups()).unresolvedChannelIds, {missing});
    server.discoveryReply = {'MediaContainer': {'size': 2, 'Dvr': [
      {'key': '3', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:3'},
    ]}};
    final shortened = await api.getChannelGroups();
    expect(shortened.partial, isTrue);
    expect(shortened.unresolvedChannelIds, {missing});
    expect(shortened.groupsByChannelId, contains(missing));
    final mixed = await guide([missing, empty, free]);
    expect(mixed['FailedChannelIds'], [missing]);
    expect((mixed['Items'] as List).map((row) => row['ChannelId']).toSet(), {free});
    expect((await guide())['FailedChannelIds'], [missing]);
    expect((await guide([empty])).containsKey('FailedChannelIds'), isFalse);
    server.discoveryReply = null;
    final recovered = await guide([missing]);
    expect(recovered.containsKey('FailedChannelIds'), isFalse);
    expect((recovered['Items'] as List).first['ChannelId'], missing);
  });

  test('a missing tuner envelope is retryable and a valid empty one is complete', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);
    final healthy = await api.getChannelGroups();
    Future<Map<String, dynamic>> guide() => api.testGuide([tuner, free]);

    server.tunerReply = {'MediaContainer': {'Metadata': [{'Media': 'invalid'}]}};
    final mixed = await guide();
    expect(mixed['FailedChannelIds'], ['channel-2-4']);
    expect((mixed['Items'] as List).map((row) => row['ChannelId']).toSet(), {'channel-plex-abc-66635fc0'});
    expect((await api.testGuide(['channel-2-4']))['FailedChannelIds'], ['channel-2-4']);
    server.tunerReply = {};
    final partial = await api.getChannelGroups();
    expect(partial.partial, isTrue);
    expect(partial.sources, healthy.sources);
    expect((await guide())['FailedChannelIds'], ['channel-2-4']);

    for (final invalid in [
      {'Channel': [null]},
      {'Channel': [{'id': '5'}, {'id': ' '}]},
      {'size': 1},
    ]) {
      server.tunerReply = {'MediaContainer': invalid};
      final malformed = await api.getChannelGroups();
      expect(malformed.partial, isTrue);
      expect(malformed.channels, healthy.channels);
      expect(malformed.unresolvedChannelIds, {'channel-2-4'});
    }
    server.failWhen = (r) => r.uri.path.endsWith('/lineups/dvr/channels');
    server.failureStatus = () => 503;
    expect((await api.getChannelGroups()).channels, healthy.channels);
    server.failWhen = null;

    server.tunerReply = {'MediaContainer': {'size': '2', 'Channel': [{'id': '5'}]}};
    final shortened = await api.getChannelGroups();
    expect(shortened.partial, isTrue);
    expect(shortened.unresolvedChannelIds, {'channel-2-4'});
    expect(shortened.groupsByChannelId.keys, containsAll(['channel-2-4', 'channel-2-5']));
    final cold = await PlexLiveTvApi(dio).getChannelGroups();
    expect(cold.partial, isTrue);
    expect(cold.groupsByChannelId, contains('channel-2-5'));

    server.tunerReply = {'MediaContainer': {'size': 0, 'Channel': []}};
    final empty = await api.getChannelGroups();
    expect(empty.partial, isFalse);
    expect(empty.sources, isEmpty);
    expect((await guide()).containsKey('FailedChannelIds'), isFalse);
  });

  for (final (path, denied, healthy, program) in [
    ('/tv.plex.providers.epg.xmltv:3/grid', [other], [tuner, free], 'airing-3-1792699380-9'),
    ('/grid', [free], [tuner, extra], 'airing-plex-1792699200-abc-66635fc0'),
    ('/livetv/dvrs', [tuner, 'channel-2-9'], [free], null),
    ('/lineups/plex/channels', [free, extra], [tuner], null),
  ]) {
    test('guide scopes a 403 from $path and propagates a 401', () async {
      final (dio, server) = _server(secondDvr: true);
      final api = PlexLiveTvApi(dio);
      bool affected(RequestOptions r) => r.uri.path == path &&
          (path != '/grid' || r.queryParameters['channelGridKey'] == 'provider-42');
      var failedReads = 0;
      server.failWhen = (r) {
        if (!affected(r)) return false;
        failedReads++;
        return true;
      };
      server.failureStatus = () => 403;
      for (final station in healthy) {
        final partial = await api.testGuide([station, ...denied]);
        expect(partial['FailedChannelIds'], unorderedEquals(denied));
        expect((partial['Items'] as List).map((p) => p['ChannelId']).toSet(), {station});
      }
      if (path.endsWith(':3/grid')) {
        final before = failedReads;
        expect((await api.testGuide([tuner])).containsKey('FailedChannelIds'), isFalse);
        expect(failedReads, before);
      }
      if (program == null) {
        if (path == '/lineups/plex/channels') {
          expect(server.requests.where((r) => r.uri.path == '/grid'), isEmpty);
        }
        await expectLater(api.testGuide(denied), _httpError(403));
      } else {
        final partial = await api.testGuide(denied);
        expect(partial['Items'], isEmpty);
        expect(partial['FailedChannelIds'], denied);
        await expectLater(api.getProgram(program), _httpError(403));
      }
      server.failureStatus = () => 401;
      if (path == '/livetv/dvrs') await expectLater(api.getChannelGroups(), _httpError(401));
      await expectLater(api.testGuide([...healthy, ...denied]), _httpError(401));
      server.failWhen = null;
      final recovered = await api.testGuide([...healthy, ...denied]);
      expect(recovered.containsKey('FailedChannelIds'), isFalse);
      expect((recovered['Items'] as List).map((p) => p['ChannelId']), containsAll(healthy));
      if (path == '/lineups/plex/channels' || path == '/livetv/dvrs') {
        expect((recovered['Items'] as List).map((p) => p['ChannelId']), containsAll(denied));
      }
    });
  }

  for (final catalogDenied in [true, false]) {
    test('mixed guide failure preserves the scope of a denial (catalog: $catalogDenied)', () async {
      final (dio, server) = _server(secondDvr: true);
      server.failWhen = (request) {
        final path = request.uri.path;
        final forbidden = path == (catalogDenied ? '/lineups/plex/channels' : '/tv.plex.providers.epg.xmltv:3/grid');
        server.failureStatus = () => forbidden ? 403 : 503;
        return forbidden || path.endsWith('/grid');
      };
      final result = PlexLiveTvApi(dio).testGuide(catalogDenied ? [tuner, free, extra] : [other, free]);
      if (catalogDenied) {
        await expectLater(result, _httpError(403));
      } else {
        expect((await result)['FailedChannelIds'], unorderedEquals([other, free]));
      }
    });
  }

  test('opening the guide during a genre outage keeps sources and loads Featured after recovery', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);
    server.fail('/', 503);
    final incomplete = await api.getChannelGroups();
    expect(incomplete.channels, hasLength(3));
    expect(incomplete.partial, isTrue);
    expect(incomplete.unresolvedChannelIds, {free, extra});
    expect(incomplete.groupsByChannelId[tuner], {'source:dvr'});
    expect(incomplete.groupsByChannelId[free], {'source:plexFreeTv'});
    server.failWhen = null;
    final lineup = await api.getChannelGroups();
    expect(lineup.partial, isFalse);
    expect(lineup.unresolvedChannelIds, isNull);
    expect(lineup.groupsByChannelId, {
      'channel-2-4': {'source:dvr'},
      'channel-plex-abc-66635fc0': {'source:plexFreeTv', 'Movies', 'News'},
      'channel-plex-news-extra': {'source:plexFreeTv'},
    });
    final promoted = lineup.promoted!;
    final before = server.requests.length;
    expect((await api.getChannelGroups()).promoted, same(promoted));
    final cloud = server.requests.skip(before).where(
      (r) => r.uri.host == 'epg.provider.plex.tv',
    );
    expect(cloud.map((r) => r.uri.path), [
      '/lineups/plex/channels', '/',
    ]);
    await promoted.refresh(DateTime.now);
    expect(promoted.channelIds, {'channel-plex-abc-66635fc0'});
    expect(promoted.channelIds, isNot(contains('channel-plex-news-extra')));
    expect(server.requests.last.uri.path, '/lineups/plex/channels/featured');
    expect(server.requests.last.headers['X-Plex-Provider-Version'], '7.2');
  });

  test('full lineup refresh picks up new Free TV channels and genres', () async {
    var name = 'Sports';
    final server = _FakeServer((request) => switch (request.uri.path) {
      '/lineups/plex/channels' => {'MediaContainer': {'Channel': [
        {'id': name, 'title': name, 'genreRatingKeys': ['genre']},
      ]}},
      '/' => {'MediaProvider': {'Feature': [
        {'type': 'grid', 'GridChannelFilter': [
          {'genreRatingKey': 'genre', 'title': name},
        ]},
      ]}},
      _ => throw StateError('Unexpected request ${request.uri.path}'),
    });
    final api = PlexLiveTvApi(Dio()..interceptors.add(server), cloudOnly: true);
    await api.getChannelGroups();
    name = 'News';
    final (lineup, concurrent) = await (api.getChannelGroups(), api.getChannelGroups()).wait;
    expect(concurrent, same(lineup));
    expect(lineup.groupsByChannelId, {'channel-plex-News': {'News'}});
    expect((await api.getChannels())['Items'], lineup.channels);
    expect(server.requests, hasLength(4));

    server.fail('/lineups/plex/channels', 503);
    for (var attempt = 0; attempt < 2; attempt++) {
      final stale = await api.getChannelGroups();
      expect(stale.channels, lineup.channels);
      expect(stale.partial, isTrue);
      expect(stale.unresolvedChannelIds, isNull);
    }
    server.failWhen = null;
    name = 'Movies';
    final recovered = (await api.getChannels())['Items'] as List;
    expect(recovered.single['Id'], 'channel-plex-Movies');
  });

  test('tuner errors preserve healthy sources until discovery confirms removal', () async {
    final (dio, server) = _server(secondDvr: true);
    final api = PlexLiveTvApi(dio);
    final healthy = await api.getChannelGroups();
    server.tunerReply = {'MediaContainer': {'Channel': [{'id': '5', 'title': 'New station'}]}};
    server.failWhen = (r) => r.uri.path.endsWith(':3/lineups/dvr/channels');
    for (final status in [503, 404]) {
      server.failureStatus = () => status;
      final partial = await api.getChannelGroups();
      expect(partial.partial, isTrue);
      expect(partial.sources, healthy.sources);
      expect(partial.unresolvedChannelIds, {'channel-3-7'});
      expect(partial.groupsByChannelId.keys, containsAll(['channel-2-5', 'channel-3-7', free]));
      expect(partial.groupsByChannelId, isNot(contains(tuner)));
      expect((await api.getChannels())['Items'], partial.channels);
    }
    server.discoveryReply = {'MediaContainer': {'Dvr': [
      {'key': '2', 'epgIdentifier': 'tv.plex.providers.epg.xmltv:2'},
    ]}};
    expect((await api.getChannels())['Items'].map((c) => c['Id']), isNot(contains('channel-3-7')));
    server.discoveryReply = null;
    server.failWhen = null;
    expect((await api.getChannelGroups()).partial, isFalse);
    server.failWhen = (r) => r.uri.path.endsWith(':3/lineups/dvr/channels');
    server.failureStatus = () => 403;
    final denied = await api.getChannelGroups();
    expect(denied.partial, isFalse);
    expect(denied.groupsByChannelId['channel-2-5'], {'source:dvr'});
    expect(denied.groupsByChannelId, isNot(contains('channel-3-7')));
    server.failureStatus = () => 503;
    expect((await api.getChannelGroups()).unresolvedChannelIds, isEmpty);
  });

  for (final cloudOnly in [true, false]) {
    test('Free TV keeps the last complete lineup until zero is confirmed (cloudOnly=$cloudOnly)', () async {
      final (dio, server) = _server();
      List<Object?> rows = [{'id': 'news'}, {'id': 'film'}, {'id': 'locked', 'drm': true}];
      var size = rows.length;
      server.replies['/lineups/plex/channels'] = (_) => _channels(rows, size: size);
      final api = PlexLiveTvApi(dio, cloudOnly: cloudOnly);
      final healthy = await api.getChannelGroups();
      final dvrIds = [if (!cloudOnly) 'channel-2-4'];
      expect(healthy.groupsByChannelId.keys, unorderedEquals([...dvrIds, 'channel-plex-news', 'channel-plex-film']));

      for (final (reported, stations) in <(int, List<Object?>)>[
        (3, [{'id': 'news'}]), (3, []), (1, [{}]), (1, [null]), (1, [{'id': []}]),
        (2, [{'id': 'replacement'}, {'id': ' '}]),
      ]) {
        size = reported;
        rows = stations;
        final partial = await api.getChannelGroups();
        expect(partial.partial, isTrue);
        expect(partial.channels, healthy.channels);
        expect((await api.getChannels())['Items'], healthy.channels);
      }

      rows = [{'id': 42}, {'id': 'locked', 'drm': true}];
      size = rows.length;
      final recovered = (await api.getChannels())['Items'] as List;
      expect(recovered.map((c) => c['Id']), unorderedEquals([...dvrIds, 'channel-plex-42']));
      rows = [];
      size = 0;
      final empty = await api.getChannelGroups();
      expect(empty.partial, isFalse);
      expect(empty.groupsByChannelId.keys, unorderedEquals(dvrIds));
      expect((await api.getChannels())['Items'].length, dvrIds.length);
    });
  }

  test('cloud-only lineup failures propagate while Plex DVRs remain usable', () async {
    final (dio, server) = _server();
    server.failWhen = (request) => request.uri.path == '/lineups/plex/channels';

    final cloud = PlexLiveTvApi(dio, cloudOnly: true);
    final cloudFailure = isA<DioException>().having(
      (error) => error.type,
      'Free TV connection failure',
      DioExceptionType.connectionError,
    );
    await expectLater(cloud.getChannelGroups(), throwsA(cloudFailure));
    await expectLater(cloud.getChannels(), throwsA(cloudFailure));
    expect(server.requests, isEmpty);

    final serverWithDvr = PlexLiveTvApi(dio);
    final lineup = await serverWithDvr.getChannelGroups();
    expect(lineup.channels?.map((channel) => channel['Id']), ['channel-2-4']);
    expect(lineup.partial, isTrue);
    expect(lineup.unresolvedChannelIds, isNull);
    expect(lineup.groupsByChannelId, {
      'channel-2-4': {'source:dvr'},
    });
    expect(lineup.sources.map((source) => source.groupId), ['source:dvr']);
  });

  test('Plex On Now uses a cached hub after the DVR lineup', () async {
    const hubPath = '/hubs/sections/home/whatsOnNow';
    final (dio, server) = _server(liveDvr: true);
    final cloud = PlexLiveTvApi(dio, cloudOnly: true);
    final free = (await cloud.getRecommendedPrograms(limit: 15))['Items'] as List;
    expect(free, hasLength(1));
    expect(free.single['ChannelId'], 'channel-plex-abc-66635fc0');
    expect(free.single['Name'], 'Free TV show');
    await cloud.getRecommendedPrograms(limit: 15);
    expect(server.reads(hubPath), 1);
    expect(server.requests.any((r) => r.uri.path == '/grid'), isFalse);

    final dvr = PlexLiveTvApi(dio);
    expect((await dvr.getRecommendedPrograms(limit: 1))['Items'], hasLength(1));
    expect(server.reads(hubPath), 1);
    // Past and future repeats of the DVR show must leave room for Free TV.
    final combined = (await dvr.getRecommendedPrograms(limit: 2))['Items'] as List;
    expect(combined.map((item) => item['ChannelId']), [
      'channel-2-4', 'channel-plex-abc-66635fc0',
    ]);
  });

  test('On Now prefers exact channel references and skips ambiguous suffixes', () async {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var refreshedLineup = false;
    final references = {
      'Shared grid only': {'channelGridKey': 'shared-grid'},
      'East news': {'channelGridKey': 'shared-grid'},
      'Exact ID': {'channelIdentifier': 'east'},
      'Retired station': {'channelId': {'id': 'retired-west', 'gridKey': 'west-grid'}},
      'Conflicting short ID': {'channelIdentifier': 'south', 'channelGridKey': 'west-grid'},
      'West broadcast': {'channelGridKey': 'west-grid'},
      'Nested grid key': {'channelId': {'id': '', 'gridKey': 'north-grid'}},
      'Unique suffix': {'channelId': 'south'},
      'Ambiguous suffix': {'channelId': 'shared'},
    };
    final server = _FakeServer((options) => {
      'MediaContainer': options.uri.path == '/lineups/plex/channels'
          ? {'Channel': [
              for (final id in ['city-east', 'east', 'city-south', 'a-shared', 'b-shared'])
                {'id': id, 'title': id},
              {'id': 'west-news', 'gridKey': 'shared-grid'},
              {'id': 'east-news', 'gridKey': refreshedLineup ? 'east-grid' : 'shared-grid'},
              {'id': 'city-west', 'gridKey': refreshedLineup ? 'north-grid' : 'west-grid'},
              {'id': 'city-north', 'gridKey': refreshedLineup ? 'west-grid' : 'north-grid'},
            ]}
          : {'Metadata': [
              for (final entry in references.entries)
                {'title': entry.key, 'type': 'movie',
                 if (entry.key == 'East news') 'channelIdentifier': 'east-news',
                 'Media': [
                  {...entry.value, 'beginsAt': now - 60, 'endsAt': now + 60},
                ]},
            ]},
    });
    final api = PlexLiveTvApi(Dio()..interceptors.add(server), cloudOnly: true);
    final items = (await api.getRecommendedPrograms(limit: 10))['Items'] as List;
    expect({for (final item in items) item['Name']: item['ChannelId']}, {
      'East news': 'channel-plex-east-news',
      'Exact ID': 'channel-plex-east',
      'West broadcast': 'channel-plex-city-west',
      'Nested grid key': 'channel-plex-city-north',
      'Unique suffix': 'channel-plex-city-south',
    });

    await api.getChannelGroups();
    await api.getRecommendedPrograms();
    expect(server.requests.where((r) => r.uri.path.endsWith('/whatsOnNow')), hasLength(1));

    refreshedLineup = true;
    references['North broadcast'] = references.remove('West broadcast')!;
    await api.getChannelGroups();
    final refreshed = (await api.getRecommendedPrograms())['Items'] as List;
    expect({for (final item in refreshed) item['Name']: item['ChannelId']}, {
      'Shared grid only': 'channel-plex-west-news',
      'East news': 'channel-plex-east-news',
      'Exact ID': 'channel-plex-east',
      'North broadcast': 'channel-plex-city-north',
      'Nested grid key': 'channel-plex-city-west',
      'Unique suffix': 'channel-plex-city-south',
    });
    expect(server.requests.where((r) => r.uri.path.endsWith('/whatsOnNow')), hasLength(2));
    final pms = PlexLiveTvApi(Dio()..interceptors.add(server));
    await pms.getChannels();
    server.fail('/lineups/plex/channels', 503);
    await pms.getChannelGroups();
    final duringOutage = (await pms.getRecommendedPrograms())['Items'] as List;
    expect(duringOutage.map((row) => row['Name']), ['East news', 'Exact ID']);
  });

  test('a fresh Home hub rechecks aliases and uses exact station IDs directly', () async {
    var owner = 'west';
    final reference = <String, dynamic>{'channelIdentifier': 'west'};
    final server = _FakeServer((r) {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      if (r.uri.path == '/lineups/plex/channels') {
        return {'MediaContainer': {'Channel': [for (final id in ['west', 'north'])
            {'id': id, if (id == owner) 'gridKey': 'moving-key'}]}};
      }
      final title = '$owner broadcast';
      if (reference.containsKey('channelGridKey')) owner = 'north';
      return {'MediaContainer': {'Metadata': [{'title': title, 'Media': [
              {...reference, 'beginsAt': now - 60, 'endsAt': now + 2},
          ]}]}};
    });
    final api = PlexLiveTvApi(Dio()..interceptors.add(server), cloudOnly: true);
    await api.getChannels();
    Future<Map> onNow() async =>
        ((await api.getRecommendedPrograms())['Items'] as List).single as Map;
    final first = await onNow();
    expect(first['ChannelId'], 'channel-plex-west');
    expect(server.reads('/lineups/plex/channels'), 1);
    reference..clear()..['channelGridKey'] = 'moving-key';
    await Future<void>.delayed(DateTime.parse(first['EndDate']).difference(DateTime.now()));
    final refreshed = await Future.wait([onNow(), onNow()]);
    expect(refreshed.map((row) => row['ChannelId']), everyElement('channel-plex-north'));
    expect(refreshed.map((row) => row['Name']), everyElement('north broadcast'));
    expect(server.requests.where((r) => r.uri.path.endsWith('/whatsOnNow')), hasLength(3));
  });

  test('On Now retains programs from healthy sources and propagates session errors', () async {
    const grid = '/tv.plex.providers.epg.xmltv:2/grid';
    for (final (path, status, expected) in <(String, int?, String?)>[
      ('/hubs/sections/home/whatsOnNow', 404, tuner),
      (grid, null, free), (grid, 403, free), (grid, 503, free),
      (grid, 401, null), ('/livetv/dvrs', 403, null),
    ]) {
      final (dio, server) = _server(liveDvr: true);
      server.fail(path, status);
      final result = PlexLiveTvApi(dio).getRecommendedPrograms(limit: 4);
      if (expected == null) {
        await expectLater(result, _httpError(status!));
      } else {
        expect(((await result)['Items'] as List).map((p) => p['ChannelId']), [expected]);
      }
    }
    final (dio, _) = _server(malformedDvrGrid: true);
    final result = await PlexLiveTvApi(dio).getRecommendedPrograms();
    expect((result['Items'] as List).map((p) => p['ChannelId']), [free]);
  });

  test('Home shows a tuner outage when Free TV has nothing airing and recovers on retry', () async {
    final (dio, server) = _server(liveDvr: true);
    final api = PlexLiveTvApi(dio);
    Future<List> onNow() async => (await api.getRecommendedPrograms(limit: 1))['Items'] as List;
    server.replies['/lineups/plex/channels'] = (_) => _channels([], size: 0);
    expect(await onNow(), hasLength(1));
    server.fail('/tv.plex.providers.epg.xmltv:2/grid', 503);
    await expectLater(onNow(), throwsA(isA<DioException>()
        .having((e) => e.response?.statusCode, 'status', 503)
        .having((e) => e.requestOptions.uri.path, 'path', endsWith(':2/grid'))));
    server.failWhen = null;
    expect(await onNow(), hasLength(1));
    server.tunerReply = {'MediaContainer': {'Metadata': {}}};
    await expectLater(onNow(), throwsA(isA<TypeError>()));
    server.tunerReply = {};
    await expectLater(onNow(), throwsFormatException);
    server.tunerReply = {'MediaContainer': {'Metadata': []}};
    expect(await onNow(), isEmpty);
  });

  test('recording from the guide targets the selected channel, showing and time', () async {
    final (dio, server) = _server(secondDvr: true);
    final api = PlexLiveTvApi(dio);
    var otherGridReads = 0;
    server.failWhen = (request) {
      if (request.uri.path != '/tv.plex.providers.epg.xmltv:3/grid') return false;
      otherGridReads++;
      return true;
    };
    server.failureStatus = () => 403;
    final result = await api.testGuide([tuner]);
    final programs = (result['Items'] as List).cast<Map>();
    expect(programs, hasLength(2));
    final selected = programs.first;
    final expected = {
      'Id': 'airing-2-1792699380-4', 'ChannelId': tuner, 'Name': 'Teletubbies',
      'EpisodeTitle': 'Episode 5', 'IsPremiere': true, 'IndexNumber': 5,
      'StartDate': '2026-10-22T20:03:00.000Z', 'TimerId': 'once',
    };
    for (final field in expected.entries) {
      expect(selected, containsPair(field.key, field.value));
    }
    expect(programs.last['Name'], 'SuperKitties');
    expect(programs.last['IsMovie'], isFalse);
    expect(programs.last.containsKey('TimerId'), isFalse);
    final grid = server.requests.singleWhere((r) => r.uri.path.endsWith('/grid'));
    expect(grid.queryParameters['type'], '1,4');

    final bounded = await api.getGuide(
      startDate: DateTime.utc(2026, 10, 22, 21, 4), endDate: DateTime.utc(2026, 10, 22, 23),
      channelIds: [tuner, 'channel-2-9'],
    );
    expect((bounded['Items'] as List).map((item) => item['Name']), ['SuperKitties']);
    await api.createTimer(selected['Id']);
    final post = server.requests.singleWhere((r) => r.method == 'POST');
    expect(post.uri.path, '/media/subscriptions');
    expect(post.uri.query, startsWith('hints%5Btype%5D=4&'));
    expect(post.uri.queryParameters, allOf(
      containsPair('type', '4'), containsPair('targetLibrarySectionID', '2'),
      containsPair('prefs[recordPartials]', 'true'), containsPair('prefs[lineupChannel]', '4'),
      containsPair('prefs[startTimeslot]', '1792699380'),
    ));
    expect(otherGridReads, 0);
  });

  test('manage a series rule and cancel individual scheduled showings', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio);
    await api.createSeriesTimer('airing-2-1792699380-4',
        settings: {'RecordNewOnly': false, 'SkipEpisodesInLibrary': true});
    final post = server.requests.singleWhere((r) => r.method == 'POST');
    expect(post.uri.queryParameters['type'], '2');
    expect(post.uri.queryParameters['prefs[onlyNewAirings]'], '0');
    final rule = await api.getSeriesTimer('8');
    expect(rule['RecordNewOnly'], isTrue);
    await api.updateSeriesTimer('8', {...rule, 'RecordNewOnly': false});
    final put = server.requests.singleWhere((r) => r.method == 'PUT');
    expect(put.uri.path, '/media/subscriptions/8');
    expect(put.uri.queryParameters, {'prefs[onlyNewAirings]': '0'});

    final timers = ((await api.getTimers())['Items'] as List).cast<Map>();
    expect((timers.first['Id'], timers.first['ProgramId'], timers.first['Status']),
        ('once', 'airing-2-1792699380-4', 'New'));
    expect(timers.first.containsKey('SeriesTimerId'), isFalse);
    expect((timers.last['ProgramId'], timers.last['SeriesTimerId'], timers.last['Status']),
        ('airing-2-1792710000-9', '8', 'InProgress'));
    await api.cancelTimer(timers.first['Id']);
    await api.cancelTimer(timers.last['ProgramId']);
    expect(server.requests.where((r) => r.method == 'DELETE').map((r) => r.uri.path),
        ['/media/subscriptions/7', '/media/grabbers/operations/weekly']);
  });

  test('a missing Free TV program list is retryable until Plex confirms zero', () async {
    final grid = <String, dynamic>{'size': 1};
    final (dio, server) = _server();
    server.replies['/grid'] = (_) => {'MediaContainer': grid};
    final api = PlexLiveTvApi(dio, cloudOnly: true);
    Future<Map<String, dynamic>> guide() => api.testGuide([free]);
    await expectLater(guide(), throwsFormatException);
    grid.clear();
    await expectLater(guide(), throwsFormatException);
    grid['size'] = 0;
    expect((await guide())['Items'], isEmpty);
    expect((await guide())['Items'], isEmpty);
    expect(server.reads('/grid'), 3);
  });

  test('Free TV guide and program details share the published grid key', () async {
    final (dio, server) = _server();
    final api = PlexLiveTvApi(dio, cloudOnly: true);
    final result = await api.getGuide(
      startDate: DateTime.utc(2026, 10, 22, 20).toLocal(),
      endDate: DateTime.utc(2026, 10, 22, 22).toLocal(),
      channelIds: ['channel-plex-abc-66635fc0'],
    );

    final programs = (result['Items'] as List).cast<Map>();
    expect(programs.map((p) => p['Id']), [
      'airing-plex-1792699200-abc-66635fc0',
    ]);
    expect((await api.getProgram(programs.single['Id']))['Name'], 'Law Abiding Citizen');
    expect(server.requests.map((r) => r.uri.path), ['/lineups/plex/channels', '/grid']);
    expect(server.requests.last.queryParameters, {
      'date': '2026-10-22', 'channelGridKey': 'provider-42',
    });

    server.fail('/lineups/plex/channels', 503);
    expect((await api.getChannelGroups()).partial, isTrue);
    expect((await api.getProgram(programs.single['Id']))['Name'], 'Law Abiding Citizen');
    expect(server.reads('/grid'), 1);

    final offline = PlexLiveTvApi(dio);
    await offline.getProgram('airing-plex-1792699200-abc-66635fc0');
    expect(server.requests.last.queryParameters['channelGridKey'], '66635fc0');

    server.failureStatus = () => 403;
    await expectLater(api.getChannelGroups(), throwsA(isA<DioException>()));
    await expectLater(api.getProgram(programs.single['Id']), throwsA(isA<DioException>()));
  });

  test('a later guide batch can expire a cached grid without losing its listings', () async {
    var now = DateTime.utc(2026, 10, 22, 12);
    const stations = ['a', 'b', 'c', 'd'];
    final (dio, server) = _server();
    server.replies['/lineups/plex/channels'] = (_) => _channels([for (final id in stations) {'id': id}]);
    server.replies['/grid'] = (r) {
      final station = r.queryParameters['channelGridKey'];
      if (station == 'c') now = now.add(const Duration(minutes: 2));
      return _schedule('Show $station', [_airing]);
    };
    final api = PlexLiveTvApi(dio, cloudOnly: true, gridCacheNow: () => now);
    Future<Map> guide(List<String> ids) => api.testGuide([for (final id in ids) 'channel-plex-$id']);
    await guide(['a']);
    now = now.add(const Duration(minutes: 9));
    final result = await guide(stations);
    expect((result['Items'] as List).map((item) => item['Name']), unorderedEquals(
      [for (final id in stations) 'Show $id'],
    ));
    expect(result['FailedChannelIds'], isNull);
    await guide(['a']);
    expect(server.requests.where((r) => r.uri.path == '/grid')
        .map((r) => r.queryParameters['channelGridKey']), ['a', 'b', 'c', 'd', 'a']);
  });

  test('a guide refresh during station reassignment drops the stale grid and caches each new schedule', () async {
    final started = Completer<void>(), release = Completer<void>();
    final (dio, server) = _server();
    var owner = 'west';
    server.replies['/lineups/plex/channels'] = (_) => _channels([
      for (final id in ['west', 'north']) {'id': id, 'gridKey': id == owner ? 'shared' : 'other'},
    ]);
    server.replies['/grid'] = (r) => _schedule(
        r.queryParameters['channelGridKey'] == 'shared' ? '$owner show' : 'Other show', [_airing]);
    dio.interceptors.insert(0, InterceptorsWrapper(onRequest: (r, handler) async {
      if (r.uri.path == '/grid' && !started.isCompleted) {
        started.complete();
        await release.future;
      }
      handler.next(r);
    }));
    final api = PlexLiveTvApi(dio, cloudOnly: true);
    Future<Map> guide(String station) => api.testGuide(['channel-plex-$station']);
    final pending = guide('west');
    await started.future;
    owner = 'north';
    await api.getChannelGroups();
    release.complete();
    final stale = await pending;
    expect(stale['Items'], isEmpty);
    expect(stale['FailedChannelIds'], ['channel-plex-west']);
    for (final station in ['west', 'north']) {
      final result = await guide(station);
      final item = (result['Items'] as List).single;
      expect(item['ChannelId'], 'channel-plex-$station');
      expect(item['Name'], station == owner ? 'north show' : 'Other show');
      final reads = server.reads('/grid');
      expect((await guide(station))['Items'], result['Items']);
      expect(server.reads('/grid'), reads);
    }
  });

  test('a conflicting grid station during a catalog outage is retryable', () async {
    const channel = free;
    final (dio, server) = _server();
    final media = <String, dynamic>{..._airing, 'channelIdentifier': 'news-extra'};
    server.replies['/grid'] = (_) => _schedule('News', [media, {'beginsAt': 1792699200}]);
    final api = PlexLiveTvApi(dio);
    await api.getChannels();
    server.fail('/lineups/plex/channels', 503);
    expect((await api.getChannelGroups()).partial, isTrue);
    Future<Map> guide() => api.testGuide([channel]);
    final failed = await guide();
    expect(failed['Items'], isEmpty);
    expect(failed['FailedChannelIds'], [channel]);
    server.failWhen = null;
    media['channelIdentifier'] = {'id': channel};
    final recovered = await guide();
    expect((recovered['Items'] as List).single['ChannelId'], channel);
    expect(recovered.containsKey('FailedChannelIds'), isFalse);
    expect(server.reads('/grid'), 2);
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
