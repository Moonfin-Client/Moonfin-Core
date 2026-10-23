import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';
import 'plex_apis.dart';

const _channelPrefix = 'channel-';
const _airingPrefix = 'airing-';

/// The source standing in for a DVR key on Plex's free channels.
const plexCloudSource = 'plex';

/// Where Plex's free channels and their guide live.
const plexCloudEpg = 'https://epg.provider.plex.tv';

/// The source, a DVR key or [plexCloudSource], and the channel a channel id
/// names.
({String source, String channel})? plexChannelOf(String id) {
  if (!id.startsWith(_channelPrefix)) return null;
  final rest = id.substring(_channelPrefix.length);
  final dash = rest.indexOf('-');
  if (dash < 1) return null;
  return (source: rest.substring(0, dash), channel: rest.substring(dash + 1));
}

/// The source, start time and channel one showing of a program names. A
/// program can air several times, so a showing is what has an id of its own.
({String source, int beginsAt, String channel})? plexAiringOf(String id) {
  if (!id.startsWith(_airingPrefix)) return null;
  final parts = id.substring(_airingPrefix.length).split('-');
  if (parts.length < 3) return null;
  final beginsAt = int.tryParse(parts[1]);
  if (beginsAt == null) return null;
  return (
    source: parts[0],
    beginsAt: beginsAt,
    channel: parts.sublist(2).join('-'),
  );
}

String _channelId(String source, Object? channel) =>
    '$_channelPrefix$source-$channel';

String _iso(int seconds) => DateTime.fromMillisecondsSinceEpoch(
  seconds * 1000,
  isUtc: true,
).toIso8601String();

int _seconds(DateTime time) => time.millisecondsSinceEpoch ~/ 1000;

typedef _Dvr = ({String key, String epg});

/// A scheduled recording and the showing it records.
typedef _Grab = ({Map op, Map<String, dynamic> program});

/// Live TV from the server's own DVRs, each a tuner with its guide, and from
/// Plex's free channels, which plex.tv serves itself.
class PlexLiveTvApi implements LiveTvApi {
  final Dio _dio;

  PlexLiveTvApi(this._dio);

  static final _cloudOptions = Options(
    headers: {'X-Plex-Provider-Version': '7.2'},
  );

  /// The free channels' guide comes one channel at a time, and plex.tv turns
  /// a burst away, so only this many go out at once.
  static const _cloudGuideRequests = 3;

  /// A channel's day of guide is kept this long, so scrolling and refreshing
  /// don't ask plex.tv again.
  static const _cloudGridLife = Duration(minutes: 10);

  Future<List<_Dvr>>? _dvrs;
  Future<List<Map<String, dynamic>>>? _cloudChannels;
  final _cloudGrids = <String, ({DateTime at, Future<List?> items})>{};

  Future<List?> _freeGrid(String channel, String day) {
    final key = '$channel/$day';
    final now = DateTime.now();
    _cloudGrids.removeWhere(
      (_, grid) => now.difference(grid.at) >= _cloudGridLife,
    );
    if (_cloudGrids[key] case final cached?) return cached.items;
    final items = _fetchFreeGrid(channel, day).then((items) {
      if (items == null) _cloudGrids.remove(key);
      return items;
    });
    _cloudGrids[key] = (at: now, items: items);
    return items;
  }

  /// Null when plex.tv wouldn't answer, after waiting out a few 429s.
  Future<List?> _fetchFreeGrid(String channel, String day) async {
    for (var attempt = 0; ; attempt++) {
      try {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/grid',
          queryParameters: {
            'channelGridKey': channel.split('-').last,
            'date': day,
          },
          options: _cloudOptions,
        );
        return (response.data?['MediaContainer'] as Map?)?['Metadata'] as List?;
      } on DioException catch (e) {
        if (e.response?.statusCode != 429 || attempt == 3) return null;
        await Future<void>.delayed(Duration(seconds: 1 << attempt));
      }
    }
  }

  Future<T> _cached<T>(
    Future<T>? Function() read,
    void Function(Future<T>?) write,
    Future<T> Function() load,
  ) {
    final cached = read();
    if (cached != null) return cached;
    final loading = load().catchError((Object e) {
      write(null);
      throw e;
    });
    write(loading);
    return loading;
  }

  Future<List<_Dvr>> _dvrList() =>
      _cached(() => _dvrs, (f) => _dvrs = f, () async {
        final container = await plexContainer(_dio, '/livetv/dvrs');
        return [
          for (final dvr in container['Dvr'] as List? ?? const [])
            if (dvr is Map && dvr['epgIdentifier'] is String)
              (key: '${dvr['key']}', epg: dvr['epgIdentifier'] as String),
        ];
      });

  Future<List<Map<String, dynamic>>> _dvrChannels() async {
    final channels = <Map<String, dynamic>>[];
    for (final dvr in await _dvrList()) {
      final lineup = await plexContainer(
        _dio,
        '/${dvr.epg}/lineups/dvr/channels',
      );
      for (final channel in lineup['Channel'] as List? ?? const []) {
        if (channel is Map) {
          channels.add(
            _channel(dvr.key, channel, number: '${channel['vcn'] ?? ''}'),
          );
        }
      }
    }
    return channels;
  }

  /// Every free channel carries the same placeholder number, so they go
  /// without one and sort by name after the tuner's numbered channels.
  Future<List<Map<String, dynamic>>> _freeChannels() =>
      _cached(() => _cloudChannels, (f) => _cloudChannels = f, () async {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/lineups/plex/channels',
          options: _cloudOptions,
        );
        final container = response.data?['MediaContainer'] as Map?;
        return [
          for (final channel in container?['Channel'] as List? ?? const [])
            if (channel is Map && channel['drm'] != true)
              _channel(plexCloudSource, channel),
        ];
      });

  static Map<String, dynamic> _channel(
    String source,
    Map channel, {
    String? number,
  }) => {
    'Id': _channelId(source, channel['id']),
    'Name': channel['title'] ?? channel['callSign'],
    'Type': 'TvChannel',
    if (number != null && number.isNotEmpty) 'ChannelNumber': number,
    'ImageTags': {
      if (channel['thumb'] case final String thumb) 'Primary': thumb,
    },
    'UserData': {'IsFavorite': false},
  };

  /// One source failing, like plex.tv being unreachable, still leaves the
  /// other's channels.
  Future<List<Map<String, dynamic>>> _allChannels() async {
    final results = await Future.wait([
      _dvrChannels().catchError((_) => <Map<String, dynamic>>[]),
      _freeChannels().catchError((_) => <Map<String, dynamic>>[]),
    ]);
    return [...results[0], ...results[1]];
  }

  /// Every showing on the server's DVRs between [start] and [end], with the
  /// guide entry it belongs to.
  Future<List<({_Dvr dvr, Map item, Map media})>> _dvrGrid(
    DateTime start,
    DateTime end,
  ) async {
    final showings = <({_Dvr dvr, Map item, Map media})>[];
    for (final dvr in await _dvrList()) {
      final grid = await plexContainer(_dio, '/${dvr.epg}/grid', {
        'type': '1,4',
        'beginsAt<': _seconds(end),
        'endsAt>': _seconds(start),
      });
      for (final item in grid['Metadata'] as List? ?? const []) {
        if (item is! Map) continue;
        for (final media in item['Media'] as List? ?? const []) {
          if (media is Map) showings.add((dvr: dvr, item: item, media: media));
        }
      }
    }
    return showings;
  }

  static Map<String, dynamic>? _dvrProgram(_Dvr dvr, Map item, Map media) {
    final program = _program(
      dvr.key,
      media['channelIdentifier'],
      item,
      media,
      channelName: media['channelTitle'],
    );
    // Plex files every XMLTV program without an episode number as a movie.
    if (program != null && dvr.epg.startsWith('tv.plex.providers.epg.xmltv')) {
      program['IsMovie'] = false;
    }
    return program;
  }

  Future<List<Map>> _scheduled() async {
    final container = await plexContainer(
      _dio,
      '/media/subscriptions/scheduled',
    );
    return [
      for (final op in container['MediaGrabOperation'] as List? ?? const [])
        if (op is Map) op,
    ];
  }

  /// The server's upcoming and running recordings.
  Future<List<_Grab>> _grabs() async {
    final dvrs = await _dvrList();
    final grabs = <_Grab>[];
    for (final op in await _scheduled()) {
      final dvr = dvrs.where((d) => d.epg == op['provider']).firstOrNull;
      final item = op['Metadata'];
      if (dvr == null || item is! Map) continue;
      final media = (item['Media'] as List?)?.elementAtOrNull(
        op['mediaIndex'] as int? ?? 0,
      );
      if (media is! Map) continue;
      if (_dvrProgram(dvr, item, media) case final program?) {
        grabs.add((op: op, program: program));
      }
    }
    return grabs;
  }

  static String? _seriesOf(Map op) =>
      (op['Metadata'] as Map?)?['grandparentSubscriptionID']?.toString();

  /// The DVR showings between [start] and [end] as programs, with any
  /// recording set for them.
  Future<List<Map<String, dynamic>>> _dvrAirings(
    DateTime start,
    DateTime end, {
    Set<String>? channelIds,
  }) async {
    final grabs = _grabs().catchError((_) => <_Grab>[]);
    final showings = await _dvrGrid(start, end);
    final scheduled = {
      for (final grab in await grabs)
        if (grab.op['status'] != 'error') grab.program['Id']: grab.op,
    };
    final programs = <Map<String, dynamic>>[];
    for (final showing in showings) {
      final program = _dvrProgram(showing.dvr, showing.item, showing.media);
      if (program == null) continue;
      if (channelIds != null && !channelIds.contains(program['ChannelId'])) {
        continue;
      }
      if (scheduled[program['Id']] case final op?) {
        program['TimerId'] = op['id'];
        if (_seriesOf(op) case final series?) {
          program['SeriesTimerId'] = series;
        }
      }
      programs.add(program);
    }
    return programs;
  }

  /// The free channels' guide answers one channel and one UTC day at a time.
  Future<List<Map<String, dynamic>>> _freeAirings(
    DateTime start,
    DateTime end,
    List<String> channels,
  ) async {
    final first = start.toUtc();
    final days = {
      for (
        var day = DateTime.utc(first.year, first.month, first.day);
        !day.isAfter(end.toUtc());
        day = day.add(const Duration(days: 1))
      )
        day.toIso8601String().substring(0, 10),
    };
    final requests = [
      for (final channel in channels)
        for (final day in days) (channel: channel, day: day),
    ];
    final from = _seconds(start);
    final to = _seconds(end);
    final programs = <Map<String, dynamic>>[];
    for (var i = 0; i < requests.length; i += _cloudGuideRequests) {
      final batch = requests.skip(i).take(_cloudGuideRequests);
      final grids = await Future.wait([
        for (final request in batch)
          _freeGrid(
            request.channel,
            request.day,
          ).then((items) => (channel: request.channel, items: items)),
      ]);
      for (final grid in grids) {
        for (final item in grid.items ?? const []) {
          if (item is! Map) continue;
          for (final media in item['Media'] as List? ?? const []) {
            if (media is! Map) continue;
            final program = _program(
              plexCloudSource,
              grid.channel,
              item,
              media,
            );
            if (program != null &&
                media['endsAt'] as int > from &&
                media['beginsAt'] as int < to) {
              programs.add(program);
            }
          }
        }
      }
    }
    return programs;
  }

  static Map<String, dynamic>? _program(
    String source,
    Object? channel,
    Map item,
    Map media, {
    Object? channelName,
  }) {
    final beginsAt = media['beginsAt'];
    final endsAt = media['endsAt'];
    if (beginsAt is! int || endsAt is! int || channel == null) return null;
    final episode = item['type'] == 'episode';
    return {
      'Id': '$_airingPrefix$source-$beginsAt-$channel',
      'Type': 'Program',
      'ChannelId': _channelId(source, channel),
      'ChannelName': ?channelName,
      'Name': episode ? item['grandparentTitle'] : item['title'],
      if (episode) 'EpisodeTitle': item['title'],
      'Overview': ?item['summary'],
      'StartDate': _iso(beginsAt),
      'EndDate': _iso(endsAt),
      'RunTimeTicks': (endsAt - beginsAt) * 10000000,
      'IsMovie': item['type'] == 'movie',
      'IsSeries': episode,
      'IsPremiere': media['premiere'] == '1' || media['premiere'] == true,
      if (episode) 'ParentIndexNumber': ?item['parentIndex'],
      if (episode) 'IndexNumber': ?item['index'],
      'ImageTags': {
        if (item['thumb'] case final String thumb) 'Primary': thumb,
      },
    };
  }

  Future<List<Map<String, dynamic>>> _airings(
    DateTime start,
    DateTime end, {
    List<String>? channelIds,
  }) async {
    final free = [
      for (final id in channelIds ?? const <String>[])
        if (plexChannelOf(id) case (source: plexCloudSource, :final channel))
          channel,
    ];
    final results = await Future.wait([
      if (channelIds == null || channelIds.length > free.length)
        _dvrAirings(
          start,
          end,
          channelIds: channelIds?.toSet(),
        ).catchError((_) => <Map<String, dynamic>>[]),
      if (free.isNotEmpty) _freeAirings(start, end, free),
    ]);
    return [for (final programs in results) ...programs]..sort(
      (a, b) => (a['StartDate'] as String).compareTo(b['StartDate'] as String),
    );
  }

  @override
  Future<Map<String, dynamic>> getChannels({
    int? startIndex,
    int? limit,
    String? sortBy,
    String? sortOrder,
    String? fields,
    bool? enableTotalRecordCount,
    String? userId,
  }) async {
    final channels = await _allChannels();
    final start = (startIndex ?? 0).clamp(0, channels.length);
    final end = limit == null
        ? channels.length
        : (start + limit).clamp(start, channels.length);
    return plexItemsResult(
      channels.sublist(start, end),
      total: channels.length,
      startIndex: start,
    );
  }

  @override
  Future<Map<String, dynamic>> getGuide({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? channelIds,
    bool? isMovie,
    bool? isSeries,
    bool? isSports,
    bool? isNews,
    bool? isKids,
    String? fields,
    bool? enableTotalRecordCount,
    bool? enableImages,
    bool? enableUserData,
    String? userId,
  }) async {
    final start = startDate ?? DateTime.now();
    return plexItemsResult(
      await _airings(
        start,
        endDate ?? start.add(const Duration(hours: 3)),
        channelIds: channelIds,
      ),
    );
  }

  /// What's on the tuner right now. The free channels would take a guide
  /// request each, so they're left out.
  @override
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  }) async {
    final now = DateTime.now();
    final programs = await _dvrAirings(now, now);
    return plexItemsResult(
      limit == null ? programs : programs.take(limit).toList(),
    );
  }

  @override
  Future<Map<String, dynamic>> getProgram(
    String programId, {
    String? userId,
  }) async {
    final airing = plexAiringOf(programId);
    if (airing == null) throw ArgumentError.value(programId, 'programId');
    final start = DateTime.fromMillisecondsSinceEpoch(
      airing.beginsAt * 1000,
      isUtc: true,
    );
    final programs = await _airings(
      start,
      start.add(const Duration(seconds: 1)),
      channelIds: [_channelId(airing.source, airing.channel)],
    );
    return programs.firstWhere(
      (p) => p['Id'] == programId,
      orElse: () => throw StateError('No program $programId'),
    );
  }

  /// Finished recordings land in the DVR's library like anything else.
  @override
  Future<Map<String, dynamic>> getRecordings({
    int? limit,
    String? fields,
    bool? enableImages,
    bool? isSeries,
    bool? isMovie,
    bool? isSports,
    bool? isKids,
  }) async => plexItemsResult([]);

  @override
  Future<Map<String, dynamic>> getTimers() async => plexItemsResult([
    for (final grab in await _grabs())
      {
        'Id': grab.op['id'],
        'Type': 'Timer',
        'ProgramId': grab.program['Id'],
        'ChannelId': grab.program['ChannelId'],
        'ChannelName': grab.program['ChannelName'],
        'Name': grab.program['Name'],
        'StartDate': grab.program['StartDate'],
        'EndDate': grab.program['EndDate'],
        'SeriesTimerId': ?_seriesOf(grab.op),
        'Status': switch (grab.op['status']) {
          'scheduled' => 'New',
          'error' => 'Error',
          _ => 'InProgress',
        },
        'ProgramInfo': grab.program,
      },
  ]);

  @override
  Future<Map<String, dynamic>> getSeriesTimers() async {
    final container = await plexContainer(_dio, '/media/subscriptions');
    return plexItemsResult([
      for (final rule in container['MediaSubscription'] as List? ?? const [])
        if (rule is Map && rule['type'] == 2)
          {
            'Id': '${rule['key']}',
            'Type': 'SeriesTimer',
            'Name': (rule['Directory'] as Map?)?['title'],
            'RecordAnyChannel': !(rule['Setting'] as List? ?? const []).any(
              (s) => s is Map && s['id'] == 'lineupChannel' && s['value'] != '',
            ),
          },
    ]);
  }

  @override
  Future<void> createTimer(String programId) => _record(programId);

  @override
  Future<void> createSeriesTimer(
    String programId, {
    Map<String, dynamic>? settings,
  }) => _record(programId, series: true, prefs: _seriesPrefs(settings));

  /// Plex has no setting for episodes already recorded, so a rule reads back
  /// as skipping them, the choice a new recording starts on.
  @override
  Future<Map<String, dynamic>> getSeriesTimer(String seriesTimerId) async {
    final container = await plexContainer(
      _dio,
      '/media/subscriptions/$seriesTimerId',
    );
    final rule = (container['MediaSubscription'] as List?)?.firstOrNull;
    if (rule is! Map) throw StateError('No Plex series rule $seriesTimerId');
    return {
      'RecordNewOnly': (rule['Setting'] as List? ?? const []).any(
        (s) =>
            s is Map && s['id'] == 'onlyNewAirings' && '${s['value']}' == '1',
      ),
      'SkipEpisodesInLibrary': true,
    };
  }

  @override
  Future<void> updateSeriesTimer(
    String seriesTimerId,
    Map<String, dynamic> seriesTimer,
  ) => _dio.put<void>(
    '/media/subscriptions/$seriesTimerId',
    queryParameters: _seriesPrefs(seriesTimer),
  );

  /// Repeats are the only part of which showings a series takes that Plex
  /// lets a rule choose.
  static Map<String, Object> _seriesPrefs(Map<String, dynamic>? settings) => {
    if (settings?['RecordNewOnly'] case final bool newOnly)
      'prefs[onlyNewAirings]': newOnly ? 1 : 0,
  };

  /// Subscribes to the showing the way Plex's own apps do, from the template
  /// the server offers for it. A one-off is held to that channel and time, or
  /// Plex would take whichever airing comes first. [prefs] replace the
  /// template's own settings.
  Future<void> _record(
    String programId, {
    bool series = false,
    Map<String, Object> prefs = const {},
  }) async {
    final airing = plexAiringOf(programId);
    if (airing == null || airing.source == plexCloudSource) {
      throw UnsupportedError("Plex's free channels can't be recorded");
    }
    final at = DateTime.fromMillisecondsSinceEpoch(
      airing.beginsAt * 1000,
      isUtc: true,
    );
    final showing = (await _dvrGrid(at, at)).firstWhere(
      (s) =>
          s.dvr.key == airing.source &&
          s.media['beginsAt'] == airing.beginsAt &&
          '${s.media['channelIdentifier']}' == airing.channel,
      orElse: () => throw StateError('No program $programId'),
    );
    final template = await plexContainer(
      _dio,
      '/media/subscriptions/template',
      {'guid': showing.item['guid']},
    );
    final subscription = [
      for (final t in template['SubscriptionTemplate'] as List? ?? const [])
        for (final s in (t as Map)['MediaSubscription'] as List? ?? const [])
          if (s is Map && (s['type'] == 2) == series) s,
    ].firstOrNull;
    if (subscription == null) {
      throw UnsupportedError("Plex can't record $programId that way");
    }
    await _dio.post<void>(
      '/media/subscriptions?${subscription['parameters']}',
      queryParameters: {
        'targetLibrarySectionID': subscription['targetLibrarySectionID'],
        'targetSectionLocationID': subscription['targetSectionLocationID'],
        'includeGrabs': 1,
        'type': subscription['type'],
        for (final setting in subscription['Setting'] as List? ?? const [])
          if (setting is Map) 'prefs[${setting['id']}]': setting['value'],
        ...prefs,
        if (!series) ...{
          'prefs[lineupChannel]': airing.channel,
          'prefs[startTimeslot]': airing.beginsAt,
        },
      },
    );
  }

  /// A one-off recording is a subscription of its own, so it goes with it.
  /// One showing of a series only drops that showing. The schedule screens
  /// cancel by the showing's id, so that finds its recording too.
  @override
  Future<void> cancelTimer(String timerId) async {
    final grab = (await _grabs())
        .where((g) => g.op['id'] == timerId || g.program['Id'] == timerId)
        .firstOrNull;
    final subscription = grab == null || _seriesOf(grab.op) != null
        ? null
        : grab.op['mediaSubscriptionID'];
    await _dio.delete<void>(
      subscription == null
          ? '/media/grabbers/operations/${grab?.op['id'] ?? timerId}'
          : '/media/subscriptions/$subscription',
    );
  }

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) =>
      _dio.delete<void>('/media/subscriptions/$seriesTimerId');
}
