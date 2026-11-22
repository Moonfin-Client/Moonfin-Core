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
typedef _Channels = List<Map<String, dynamic>>;
typedef _CloudGroups = ({
  Map<String, String> genres,
  PromotedChannelGroup? promoted,
});
typedef _Airings = ({
  List<Map<String, dynamic>> items,
  Set<String> failedChannelIds,
});

/// A scheduled recording and the showing it records.
typedef _Grab = ({Map op, Map<String, dynamic> program});

/// Live TV from the server's own DVRs, each a tuner with its guide, and from
/// Plex's free channels, which plex.tv serves itself.
class PlexLiveTvApi implements LiveTvApi, DirectChannelGroupApi {
  final Dio _dio;
  final bool cloudOnly;

  PlexLiveTvApi(this._dio, {this.cloudOnly = false});

  static final _cloudOptions = Options(
    headers: {'X-Plex-Provider-Version': '7.2'},
  );

  static bool _accessDenied(Object error) =>
      error is DioException &&
      (error.response?.statusCode == 401 || error.response?.statusCode == 403);

  /// The free channels' guide comes one channel at a time, and plex.tv turns
  /// a burst away, so only this many go out at once.
  static const _cloudGuideRequests = 3;

  /// A channel's day of guide is kept this long, so scrolling and refreshing
  /// don't ask plex.tv again.
  static const _cloudGridLife = Duration(minutes: 10);

  Future<List<_Dvr>>? _dvrs;
  Future<String?>? _favoriteMachineId;
  Future<List<Map<String, dynamic>>>? _cloudChannels;
  Future<_CloudGroups>? _cloudGroups;
  final _cloudGrids = <String, ({DateTime at, Future<List> items})>{};

  // The Free TV Home hub is independent of channel grids and may be absent on
  // some Plex accounts or regions. Cache its small result, including failures,
  // so revisiting Home doesn't repeatedly hit an unsupported endpoint.
  static const _cloudOnNowLimit = 15;
  static const _cloudOnNowCacheLife = Duration(minutes: 5);
  static const _cloudOnNowTimeout = Duration(seconds: 3);
  DateTime? _cloudOnNowFetchedAt;
  Future<List<Map<String, dynamic>>>? _cloudOnNow;

  Future<List> _freeGrid(String channel, String day) {
    final key = '$channel/$day';
    final now = DateTime.now();
    _cloudGrids.removeWhere(
      (_, grid) => now.difference(grid.at) >= _cloudGridLife,
    );
    if (_cloudGrids[key] case final cached?) return cached.items;
    late final Future<List> items;
    items = _fetchFreeGrid(channel, day).catchError((Object error) {
      // A timed-out request may have been replaced before its failure.
      if (identical(_cloudGrids[key]?.items, items)) {
        _cloudGrids.remove(key);
      }
      throw error;
    });
    _cloudGrids[key] = (at: now, items: items);
    return items;
  }

  /// Failed requests throw, so the guide can retry instead of caching a blank.
  Future<List> _fetchFreeGrid(String channel, String day) async {
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
        final container = response.data?['MediaContainer'];
        if (container is! Map) {
          throw const FormatException('Invalid Plex Free TV grid response');
        }
        final metadata = container['Metadata'];
        if (metadata == null) return const [];
        if (metadata is! List) {
          throw const FormatException('Invalid Plex Free TV grid metadata');
        }
        return metadata;
      } on DioException catch (e) {
        if (e.response?.statusCode != 429 || attempt == 3) rethrow;
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

  Future<List<_Dvr>> _dvrList() => cloudOnly
      ? Future.value(<_Dvr>[])
      : _cached(() => _dvrs, (f) => _dvrs = f, () async {
        final container = await plexContainer(_dio, '/livetv/dvrs');
        return [
          for (final dvr in container['Dvr'] as List? ?? const [])
            if (dvr is Map && dvr['epgIdentifier'] is String)
              (key: '${dvr['key']}', epg: dvr['epgIdentifier'] as String),
        ];
      });

  // Plex Cloud favorites use machine+provider, not Moonfin's DVR key.
  Future<String?> _machineIdForFavorites() async {
    Future<String?> load() async {
      try {
        // Optional favorite metadata must not stall the DVR lineup.
        final identity = await plexContainer(
          _dio,
          '/identity',
        ).timeout(const Duration(seconds: 3));
        final machine = identity['machineIdentifier'];
        return machine is String && machine.isNotEmpty ? machine : null;
      } catch (_) {
        return null;
      }
    }

    final machine = await (_favoriteMachineId ??= load());
    if (machine == null) _favoriteMachineId = null;
    return machine;
  }

  Future<List<Map<String, dynamic>>> _dvrChannels() async {
    final dvrs = await _dvrList();
    if (dvrs.isEmpty) return [];
    // Fetch optional favorite metadata while the DVR lineups are loading.
    final machineIdFuture = _machineIdForFavorites();
    final channels = <({String key, String epg, Map channel})>[];
    for (final dvr in dvrs) {
      try {
        final lineup = await plexContainer(
          _dio,
          '/' + dvr.epg + '/lineups/dvr/channels',
        );
        for (final channel in lineup['Channel'] as List? ?? const []) {
          if (channel is Map) {
            channels.add((key: dvr.key, epg: dvr.epg, channel: channel));
          }
        }
      } catch (error) {
        if (_accessDenied(error)) rethrow;
        // One unavailable tuner must not hide the other DVRs.
      }
    }
    final machineId = await machineIdFuture;
    return [
      for (final entry in channels)
        _channel(
          entry.key,
          entry.channel,
          number: (entry.channel['vcn'] ?? '').toString(),
          favoriteSource: machineId == null
              ? null
              : 'server://' + machineId + '/' + entry.epg,
        ),
    ];
  }

  /// Every free channel carries the same placeholder number, so they go
  /// without one and sort by name after the tuner's numbered channels.
  Future<List<Map<String, dynamic>>> _freeChannels() =>
      _cached(() => _cloudChannels, (f) => _cloudChannels = f, () async {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/lineups/plex/channels',
          options: _cloudOptions,
        );
        final container = response.data?['MediaContainer'];
        if (container is! Map) {
          throw const FormatException('Invalid Plex Free TV lineup');
        }
        final channels = container['Channel'];
        if (channels is! List &&
            (channels != null || container['size'] != 0)) {
          throw const FormatException('Invalid Plex Free TV lineup channels');
        }
        return [
          for (final channel in channels is List ? channels : const [])
            if (channel is Map && channel['drm'] != true)
              _channel(plexCloudSource, channel),
        ];
      });

  static Map<String, dynamic> _channel(
    String source,
    Map channel, {
    String? number,
    String? favoriteSource,
  }) => {
    'Id': _channelId(source, channel['id']),
    'Name': channel['title'] ?? channel['callSign'],
    'Type': 'TvChannel',
    if (source == plexCloudSource && channel['gridKey'] is String)
      'PlexGridKey': channel['gridKey'],
    if (favoriteSource != null && channel['id'] != null) ...{
      'PlexFavoriteSource': favoriteSource,
      'PlexFavoriteId': '${channel['id']}',
    },
    if (source == plexCloudSource && channel['genreRatingKeys'] is List)
      'genreRatingKeys': channel['genreRatingKeys'],
    if (number != null && number.isNotEmpty) 'ChannelNumber': number,
    'ImageTags': {
      if (channel['thumb'] case final String thumb) 'Primary': thumb,
    },
    'UserData': {'IsFavorite': false},
  };

  /// One source failing, like plex.tv being unreachable, still leaves the
  /// other's channels.
  Future<(_Channels, _Channels)> _channelSources() async {
    // Future.wait preserves the original DioException (including 401/403)
    // rather than wrapping failures in ParallelWaitError as record .wait does.
    final results = await Future.wait<_Channels>([
      _dvrChannels().catchError((_) => <Map<String, dynamic>>[]),
      // A failed Cloud-only lineup is an error, not an empty channel list.
      cloudOnly
          ? _freeChannels()
          : _freeChannels().catchError((_) => <Map<String, dynamic>>[]),
    ]);
    return (results[0], results[1]);
  }

  static const _featuredPath = '/lineups/plex/channels/featured';

  Future<Set<String>> _featuredIds() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$plexCloudEpg$_featuredPath',
      options: _cloudOptions,
    );
    final container = response.data?['MediaContainer'];
    if (container case {'Channel': final List channels}) {
      return {
        for (final channel in channels.whereType<Map>())
          if (channel['drm'] != true && channel['id'] != null)
            _channelId(plexCloudSource, channel['id']),
      };
    }
    // Treat a missing list with a zero count as empty, but reject malformed lists.
    if (container is Map &&
        container['Channel'] == null &&
        container['size'] == 0) {
      return {};
    }
    throw const FormatException('Invalid Plex Featured lineup');
  }

  Future<_CloudGroups> _providerGroups() =>
      _cached(() => _cloudGroups, (f) => _cloudGroups = f, () async {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/',
          options: _cloudOptions,
        ).timeout(const Duration(seconds: 5));
        final provider = response.data?['MediaProvider'];
        if (provider is! Map || provider['Feature'] is! List) {
          throw const FormatException('Invalid Plex provider');
        }
        final genres = <String, String>{};
        PromotedChannelGroup? promoted;
        for (final feature in (provider['Feature'] as List).whereType<Map>()) {
          if (feature['type'] != 'grid') continue;
          for (final filter
              in feature['GridChannelFilter'] as List? ?? const []) {
            if (filter case {
              'genreRatingKey': String key,
              'title': String name,
            } when key.isNotEmpty && name.isNotEmpty) {
              genres[key] = name;
            }
          }
          for (final filter
              in feature['PromotedGridChannelFilter'] as List? ?? const []) {
            if (filter case {
              'key': _featuredPath,
              'title': String name,
            } when name.isNotEmpty) {
              promoted = PromotedChannelGroup(name, _featuredIds);
            }
          }
        }
        return (genres: genres, promoted: promoted);
      });

  @override
  Future<ChannelGroupLineup> getChannelGroups({String? userId}) async {
    final (dvr, free) = await _channelSources();
    if (free.isEmpty) {
      // Keep DVR channels in their own group when Free TV is unavailable.
      return ChannelGroupLineup(
        {
          for (final channel in dvr)
            channel['Id'] as String: {ChannelGroupSource.dvr.groupId},
        },
        channels: dvr,
        sources: dvr.isEmpty ? const [] : const [ChannelGroupSource.dvr],
      );
    }
    // Keep existing groups if the provider metadata is temporarily unavailable.
    var metadataUnavailable = false;
    final catalog = await _providerGroups().onError<Object>((_, _) {
      metadataUnavailable = true;
      return (genres: const <String, String>{}, promoted: null);
    });
    return ChannelGroupLineup(
      {
        for (final channel in dvr)
          channel['Id'] as String: {ChannelGroupSource.dvr.groupId},
        for (final channel in free)
          channel['Id'] as String: {
            if (dvr.isNotEmpty) ChannelGroupSource.plexFreeTv.groupId,
            for (final key in channel['genreRatingKeys'] as List? ?? const [])
              ?catalog.genres[key],
          },
      },
      channels: [...dvr, ...free],
      sources: dvr.isEmpty ? const [] : ChannelGroupSource.values,
      promoted: catalog.promoted,
      partial: metadataUnavailable,
      unresolvedChannelIds: metadataUnavailable
          ? {for (final channel in free) channel['Id'] as String}
          : null,
    );
  }

  /// Every showing on the server's DVRs between [start] and [end], with the
  /// guide entry it belongs to.
  Future<({
    List<({_Dvr dvr, Map item, Map media})> showings,
    Set<String> failedChannelIds,
  })> _dvrGrid(
    DateTime start,
    DateTime end, {
    Set<String>? channelIds,
  }) async {
    final showings = <({_Dvr dvr, Map item, Map media})>[];
    final failedIds = <String>{};
    Object? firstFailure;
    StackTrace? firstFailureStack;
    var succeeded = 0;
    for (final dvr in await _dvrList()) {
      final requested = channelIds == null
          ? null
          : {
              for (final id in channelIds)
                if (plexChannelOf(id)?.source == dvr.key) id,
            };
      if (requested?.isEmpty == true) continue;
      try {
        final grid = await plexContainer(_dio, '/${dvr.epg}/grid', {
          'type': '1,4',
          'beginsAt<': _seconds(end),
          'endsAt>': _seconds(start),
        });
        final fromDvr = <({_Dvr dvr, Map item, Map media})>[];
        for (final item in grid['Metadata'] as List? ?? const []) {
          if (item is! Map) continue;
          for (final media in item['Media'] as List? ?? const []) {
            if (media is Map) fromDvr.add((dvr: dvr, item: item, media: media));
          }
        }
        showings.addAll(fromDvr);
        succeeded++;
      } catch (error, stack) {
        if (_accessDenied(error)) Error.throwWithStackTrace(error, stack);
        failedIds.addAll(requested ?? const <String>{});
        firstFailure ??= error;
        firstFailureStack ??= stack;
      }
    }
    if (succeeded == 0 && firstFailure != null) {
      Error.throwWithStackTrace(firstFailure!, firstFailureStack!);
    }
    return (showings: showings, failedChannelIds: failedIds);
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
  Future<_Airings> _dvrAirings(
    DateTime start,
    DateTime end, {
    Set<String>? channelIds,
  }) async {
    final grabs = _grabs().catchError((_) => <_Grab>[]);
    final grid = await _dvrGrid(start, end, channelIds: channelIds);
    final scheduled = {
      for (final grab in await grabs)
        if (grab.op['status'] != 'error') grab.program['Id']: grab.op,
    };
    final programs = <Map<String, dynamic>>[];
    for (final showing in grid.showings) {
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
    return (items: programs, failedChannelIds: grid.failedChannelIds);
  }

  /// The free channels' guide answers one channel and one UTC day at a time.
  Future<_Airings> _freeAirings(
    DateTime start,
    DateTime end,
    List<String> channels,
  ) async {
    final first = start.toUtc();
    final exclusiveEnd = end.toUtc();
    final days = {
      for (
        var day = DateTime.utc(first.year, first.month, first.day);
        day.isBefore(exclusiveEnd);
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
    final failedChannelIds = <String>{};
    var successfulGrids = 0;
    Object? firstFailure;
    StackTrace? firstFailureStack;
    for (var i = 0; i < requests.length; i += _cloudGuideRequests) {
      final batch = requests.skip(i).take(_cloudGuideRequests);
      final grids = await Future.wait([
        for (final request in batch)
          () async {
            final itemsFuture = _freeGrid(request.channel, request.day);
            try {
              final items = await itemsFuture;
              // Commit a grid's programs only after it decodes completely.
              final decoded = <Map<String, dynamic>>[];
              for (final item in items) {
                if (item is! Map) continue;
                final mediaItems = item['Media'];
                if (mediaItems == null) continue;
                if (mediaItems is! List) {
                  throw const FormatException('Invalid Plex Free TV grid Media');
                }
                for (final media in mediaItems) {
                  if (media is! Map) continue;
                  final program = _program(
                    plexCloudSource,
                    request.channel,
                    item,
                    media,
                  );
                  if (program != null &&
                      media['endsAt'] as int > from &&
                      media['beginsAt'] as int < to) {
                    decoded.add(program);
                  }
                }
              }
              return decoded;
            } catch (error, stack) {
              // Report an expired provider token as an auth failure, not a
              // single-channel outage.
              if (_accessDenied(error)) Error.throwWithStackTrace(error, stack);
              failedChannelIds.add(_channelId(plexCloudSource, request.channel));
              firstFailure ??= error;
              firstFailureStack ??= stack;
              // Drop malformed grids for Retry, unless a newer request already
              // replaced this cache entry.
              final key = request.channel + '/' + request.day;
              if (identical(_cloudGrids[key]?.items, itemsFuture)) {
                _cloudGrids.remove(key);
              }
              return null;
            }
          }(),
      ], eagerError: true);
      for (final grid in grids) {
        if (grid == null) continue;
        successfulGrids++;
        programs.addAll(grid);
      }
    }
    if (successfulGrids == 0 && firstFailure != null) {
      Error.throwWithStackTrace(firstFailure!, firstFailureStack!);
    }
    return (items: programs, failedChannelIds: failedChannelIds);
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

  Future<_Airings> _airings(
    DateTime start,
    DateTime end, {
    List<String>? channelIds,
  }) async {
    // Omitted IDs request all Cloud-only channels; [] remains a no-op.
    final requestedIds = channelIds ??
        (cloudOnly
            ? [
                for (final channel in await _freeChannels())
                  channel['Id'] as String,
              ]
            : const <String>[]);
    final free = [
      for (final id in requestedIds)
        if (plexChannelOf(id) case (source: plexCloudSource, :final channel))
          channel,
    ];
    final freeIds = {
      for (final channel in free) _channelId(plexCloudSource, channel),
    };
    final dvrIds = {
      for (final id in channelIds ?? const <String>[])
        if (!freeIds.contains(id)) id,
    };
    Future<({
      List<Map<String, dynamic>> items,
      Set<String> failedChannelIds,
      Object? error,
      StackTrace? stack,
    })> attempt(
      Future<_Airings> Function() load,
      Set<String> failedOnError,
    ) async {
      try {
        final result = await load();
        return (
          items: result.items,
          failedChannelIds: result.failedChannelIds,
          error: null,
          stack: null,
        );
      } catch (error, stack) {
        // Report authentication failures even if another Plex source loaded.
        if (_accessDenied(error)) Error.throwWithStackTrace(error, stack);
        return (
          items: <Map<String, dynamic>>[],
          failedChannelIds: failedOnError,
          error: error,
          stack: stack,
        );
      }
    }

    final results = await Future.wait([
      if (!cloudOnly && (channelIds == null || channelIds.length > free.length))
        attempt(
          () => _dvrAirings(start, end, channelIds: channelIds?.toSet()),
          dvrIds,
        ),
      if (free.isNotEmpty)
        attempt(() => _freeAirings(start, end, free), freeIds),
    ], eagerError: true);
    // Preserve the healthy source while retaining failed channel IDs for Retry.
    if (results.isNotEmpty && results.every((result) => result.error != null)) {
      final failure = results.first;
      Error.throwWithStackTrace(failure.error!, failure.stack!);
    }
    final programs = [for (final result in results) ...result.items]
      ..sort(
        (a, b) => (a['StartDate'] as String).compareTo(b['StartDate'] as String),
      );
    return (
      items: programs,
      failedChannelIds: {
        for (final result in results) ...result.failedChannelIds,
      },
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
    final (dvr, free) = await _channelSources();
    final channels = [...dvr, ...free];
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
    final airings = await _airings(
      start,
      endDate ?? start.add(const Duration(hours: 3)),
      channelIds: channelIds,
    );
    return {
      ...plexItemsResult(airings.items),
      if (airings.failedChannelIds.isNotEmpty)
        'FailedChannelIds': airings.failedChannelIds.toList(),
    };
  }

  static int? _hubEpochSeconds(Object? value) {
    final seconds = switch (value) {
      int number => number,
      num number => number.toInt(),
      String text => int.tryParse(text),
      _ => null,
    };
    if (seconds == null) return null;
    // Some providers return milliseconds instead of Plex grid seconds.
    return seconds > 100000000000 ? seconds ~/ 1000 : seconds;
  }

  Future<List<Map<String, dynamic>>> _fetchCloudOnNow() async {
    // Plex's Home hub is a bounded alternative to one EPG grid call per
    // channel. This experimental endpoint is not guaranteed to be available.
    final response = await _dio.get<Map<String, dynamic>>(
      '$plexCloudEpg/hubs/sections/home/whatsOnNow',
      queryParameters: {
        'contentDirectoryID': 'home',
        'includeDetails': 1,
        'includeExternalMetadata': 1,
        'includeLibraryPlaylists': 1,
        'includeMeta': 1,
        'includeRecentChannels': 1,
        'includeStations': 1,
        'includeTypeFirst': 1,
        'libraryHubsOnly': 1,
        'X-Plex-Container-Start': 0,
        'X-Plex-Container-Size': _cloudOnNowLimit,
      },
      options: _cloudOptions,
    );
    final container = response.data?['MediaContainer'];
    if (container is! Map) return [];

    // Plex hubs can return Metadata directly or nested inside Hub entries.
    final pending = <Object?>[container];
    final rows = <Map>[];
    for (var i = 0; i < pending.length; i++) {
      final value = pending[i];
      if (value is! Map) continue;
      if (value['Media'] is List) rows.add(value);
      for (final key in ['Hub', 'Metadata', 'Channel', 'Directory']) {
        final child = value[key];
        if (child is List) {
          pending.addAll(child);
        } else if (child is Map) {
          pending.add(child);
        }
      }
    }
    if (rows.isEmpty) return [];

    // Use the canonical IDs that the guide and player can tune. Grid keys
    // can also appear as the trailing portion of a provider channel ID.
    final aliases = <String, String>{};
    for (final channel in await _freeChannels()) {
      final id = plexChannelOf(channel['Id']?.toString() ?? '');
      if (id == null || id.source != plexCloudSource) continue;
      for (final alias in <String?>[
        id.channel,
        id.channel.split('-').last,
        channel['PlexGridKey'] as String?,
      ]) {
        if (alias != null && alias.isNotEmpty) {
          aliases.putIfAbsent(alias, () => id.channel);
        }
      }
    }

    final now = _seconds(DateTime.now());
    final programs = <Map<String, dynamic>>[];
    final usedChannels = <String>{};
    for (final row in rows) {
      final mediaList = row['Media'];
      if (mediaList is! List) continue;
      for (final media in mediaList.whereType<Map>()) {
        final reference = media['channelIdentifier'] ??
            media['channelId'] ??
            media['channelGridKey'] ??
            row['channelIdentifier'] ??
            row['channelId'] ??
            row['channelGridKey'] ??
            row['gridKey'];
        final value = reference is Map
            ? reference['id'] ?? reference['gridKey']
            : reference;
        if (value == null) continue;
        final raw = value.toString();
        final parsed = plexChannelOf(raw);
        final key = parsed?.source == plexCloudSource ? parsed!.channel : raw;
        final channel = aliases[key] ?? aliases[key.split('-').last];
        if (channel == null || usedChannels.contains(channel)) continue;

        final beginsAt = _hubEpochSeconds(
          media['beginsAt'] ?? row['beginsAt'],
        );
        final endsAt = _hubEpochSeconds(media['endsAt'] ?? row['endsAt']);
        if (beginsAt == null ||
            endsAt == null ||
            beginsAt > now ||
            endsAt <= now) {
          continue;
        }
        final mapped = _program(
          plexCloudSource,
          channel,
          row,
          {...media, 'beginsAt': beginsAt, 'endsAt': endsAt},
        );
        if (mapped == null || mapped['Name'] is! String ||
            (mapped['Name'] as String).trim().isEmpty) {
          continue;
        }
        usedChannels.add(channel);
        programs.add(mapped);
        if (programs.length >= _cloudOnNowLimit) return programs;
      }
    }
    return programs;
  }

  Future<List<Map<String, dynamic>>> _freeOnNow() {
    final now = DateTime.now();
    if (_cloudOnNow != null &&
        _cloudOnNowFetchedAt != null &&
        now.difference(_cloudOnNowFetchedAt!) < _cloudOnNowCacheLife) {
      return _cloudOnNow!;
    }
    _cloudOnNowFetchedAt = now;
    return _cloudOnNow = _fetchCloudOnNow()
        .timeout(_cloudOnNowTimeout)
        .catchError((Object _) => <Map<String, dynamic>>[]);
  }

  /// Prefer the user's own DVR channels; Free TV fills the remaining Home
  /// slots. An unavailable Plex hub never discards working DVR programs.
  @override
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  }) async {
    final now = DateTime.now();
    final dvr = <Map<String, dynamic>>[];
    if (!cloudOnly) {
      try {
        dvr.addAll((await _dvrAirings(now, now)).items);
      } on DioException catch (error) {
        if (_accessDenied(error)) rethrow;
        // An unavailable DVR must not prevent loading the Free TV hub.
      }
    }
    final programs = <Map<String, dynamic>>[
      ...(limit == null ? dvr : dvr.take(limit)),
    ];
    final remaining = limit == null
        ? _cloudOnNowLimit
        : (limit - programs.length).clamp(0, _cloudOnNowLimit).toInt();
    if (remaining > 0) {
      programs.addAll((await _freeOnNow()).take(remaining));
    }
    return plexItemsResult(programs);
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
    final airings = await _airings(
      start,
      start.add(const Duration(seconds: 1)),
      channelIds: [_channelId(airing.source, airing.channel)],
    );
    return airings.items.firstWhere(
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
    if (!cloudOnly)
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
    if (cloudOnly) return plexItemsResult([]);
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
    final showing = (await _dvrGrid(at, at)).showings.firstWhere(
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
