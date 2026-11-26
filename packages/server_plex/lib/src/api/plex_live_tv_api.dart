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
typedef _FreeChannels = Map<String, Map<String, dynamic>>;
typedef _FreeGridKey = ({String station, String gridKey, String day});
typedef _GridReads = Map<_FreeGridKey, Future<List>>;
typedef _CloudGroups = ({
  Map<String, String> genres,
  PromotedChannelGroup? promoted,
});
typedef _Airings = ({
  List<Map<String, dynamic>> items,
  Set<String> failedChannelIds,
});
typedef _AiringsResult = ({
  List<Map<String, dynamic>> items,
  Set<String> failedChannelIds,
  Object? error,
  StackTrace? stack,
});

/// A scheduled recording and the showing it records.
typedef _Grab = ({Map op, Map<String, dynamic> program});

/// Live TV from the server's own DVRs, each a tuner with its guide, and from
/// Plex's free channels, which plex.tv serves itself.
class PlexLiveTvApi implements LiveTvApi, DirectChannelGroupApi {
  final Dio _dio;
  final bool cloudOnly;
  final DateTime Function() _gridCacheNow;

  PlexLiveTvApi(
    this._dio, {
    this.cloudOnly = false,
    DateTime Function() gridCacheNow = DateTime.now,
  }) : _gridCacheNow = gridCacheNow;

  static final _cloudOptions = Options(
    headers: {'X-Plex-Provider-Version': '7.2'},
  );

  static bool _tunerGridForbidden(Object error) =>
      error is DioException &&
      error.response?.statusCode == 403 &&
      error.requestOptions.path.endsWith('/grid');

  static bool _accessDenied(Object error) =>
      error is DioException &&
      (error.response?.statusCode == 401 || error.response?.statusCode == 403);

  /// The free channels' guide comes one channel at a time, and plex.tv turns
  /// a burst away, so only this many go out at once.
  static const _cloudGuideRequests = 3;

  /// A channel's day of guide is kept this long, so scrolling and refreshing
  /// don't ask plex.tv again.
  static const _cloudGridLife = Duration(minutes: 10);

  Future<({List rows, bool incomplete, bool recheckEmpty})>? _dvrs;
  bool _hadDiscoveredDvr = false;
  Map<_Dvr, _Channels> _lastDvrChannels = {};
  int _dvrLineupRequest = 0;
  int _publishedDvrRequest = 0;
  Future<String?>? _favoriteMachineId;
  Future<_FreeChannels>? _cloudChannels;
  _FreeChannels? _lastFreeLineup;
  Future<ChannelGroupLineup>? _lineupRead;
  PromotedChannelGroup? _featuredGroup;
  final _cloudGrids = <_FreeGridKey, ({DateTime at, Future<List> items})>{};
  final _activeGridReads = <_GridReads, Set<String>>{};

  // The Free TV Home hub is independent of channel grids and may be absent on
  // some Plex accounts or regions. Cache its small result, including failures,
  // so revisiting Home doesn't repeatedly hit an unsupported endpoint.
  static const _cloudOnNowLimit = 15;
  static const _cloudOnNowCacheLife = Duration(minutes: 5);
  static const _cloudOnNowTimeout = Duration(seconds: 3);
  DateTime? _cloudOnNowExpiresAt;
  Future<List<Map>>? _cloudOnNowRows;

  Future<List> _freeGrid(_FreeGridKey key) {
    final now = _gridCacheNow();
    _cloudGrids.removeWhere(
      (_, grid) => now.difference(grid.at) >= _cloudGridLife,
    );
    if (_cloudGrids[key] case final cached?) return cached.items;
    late final Future<List> items;
    items = _fetchFreeGrid(key.gridKey, key.day).catchError((Object error) {
      // A timed-out request may have been replaced before its failure.
      if (identical(_cloudGrids[key]?.items, items)) {
        _cloudGrids.remove(key);
      }
      throw error;
    });
    _cloudGrids[key] = (at: now, items: items);
    return items;
  }

  // Expiry only affects reuse. A catalog change or a contradictory grid also
  // invalidates the affected listings in guide requests that are still running.
  void _invalidateGrids(bool Function(_FreeGridKey, Future<List>) invalid) {
    _cloudGrids.removeWhere((key, grid) => invalid(key, grid.items));
    for (final read in _activeGridReads.entries) {
      for (final grid in read.key.entries) {
        if (invalid(grid.key, grid.value)) {
          read.value.add(_channelId(plexCloudSource, grid.key.station));
        }
      }
    }
  }

  /// Failed requests throw, so the guide can retry instead of caching a blank.
  Future<List> _fetchFreeGrid(String gridKey, String day) async {
    for (var attempt = 0; ; attempt++) {
      try {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/grid',
          queryParameters: {
            'channelGridKey': gridKey,
            'date': day,
          },
          options: _cloudOptions,
        );
        final container = response.data?['MediaContainer'];
        if (container is! Map) {
          throw const FormatException('Invalid Plex Free TV grid response');
        }
        final metadata = container['Metadata'];
        final size = container['size'];
        if (metadata == null && (size == 0 || size == '0')) return const [];
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
    late final Future<T> loading;
    loading = load().catchError((Object e) {
      if (identical(read(), loading)) write(null);
      throw e;
    });
    write(loading);
    return loading;
  }

  Future<List<_Dvr>> _dvrList({void Function()? onIncomplete}) async {
    if (cloudOnly) return [];
    final read = _cached(() => _dvrs, (f) => _dvrs = f, () async {
      // A rediscovered tuner at the same address can belong to another PMS.
      _favoriteMachineId = null;
      final container = await _dvrContainer('/livetv/dvrs');
      final rows = container['Dvr'] as List? ?? const [];
      final size = container['size'];
      final incomplete = size != null && int.tryParse('$size') != rows.length;
      if (rows.isEmpty && incomplete) {
        throw const FormatException('Missing Plex DVR list');
      }
      // Keep known tuners through one ambiguous empty reply, until discovery confirms removal.
      final recheckEmpty = _hadDiscoveredDvr && !container.containsKey('Dvr') && !container.containsKey('size');
      return (rows: rows, incomplete: incomplete, recheckEmpty: recheckEmpty);
    });
    final (:rows, :incomplete, :recheckEmpty) = await read;
    final dvrs = <_Dvr>[];
    for (final row in rows.whereType<Map>()) {
      final key = row['key'], epg = row['epgIdentifier'];
      if ((key is int || (key is String && key.trim().isNotEmpty)) &&
          epg is String && epg.trim().isNotEmpty) {
        dvrs.add((key: '$key', epg: epg));
      }
    }
    final invalidRows = incomplete || dvrs.length != rows.length;
    if (identical(read, _dvrs)) {
      if (invalidRows || recheckEmpty) _dvrs = null;
      if (!invalidRows || dvrs.isNotEmpty) _hadDiscoveredDvr = dvrs.isNotEmpty;
    }
    if (invalidRows || recheckEmpty) onIncomplete?.call();
    return dvrs;
  }

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

    final lookup = _favoriteMachineId ??= load();
    final machine = await lookup;
    if (!identical(lookup, _favoriteMachineId)) return null;
    if (machine == null) _favoriteMachineId = null;
    return machine;
  }

  // A timeout or server failure cannot establish whether channels still exist.
  static bool _temporaryLineupFailure(Object error) {
    final status = error is DioException ? error.response?.statusCode : null;
    return status == null || status == 408 || status == 429 || status >= 500;
  }

  Future<Map<String, dynamic>> _dvrContainer(
    String path, [
    Map<String, dynamic>? query,
  ]) async {
    final response = await _dio.get<Map<String, dynamic>>(path, queryParameters: query);
    final container = response.data?['MediaContainer'];
    if (container is Map<String, dynamic>) return container;
    throw FormatException('Missing or invalid MediaContainer at $path');
  }

  Future<_Channels> _dvrChannels({void Function(_Channels)? onUnavailable}) async {
    final request = ++_dvrLineupRequest;
    final next = <_Dvr, _Channels>{};
    try {
      var incomplete = false;
      var dvrs = const <_Dvr>[];
      try {
        dvrs = await _dvrList(onIncomplete: () => incomplete = true);
      } catch (error) {
        if (!_temporaryLineupFailure(error)) rethrow;
        // All cached tuners are unresolved. Recheck their server before reusing favorites.
        incomplete = true;
      }
      final hasDvrRows = dvrs.isNotEmpty || (incomplete && _lastDvrChannels.isNotEmpty);
      final machineIdFuture = hasDvrRows ? _machineIdForFavorites() : null;
      Future<_Channels> retainedChannels(_Dvr dvr) async {
        final rows = _lastDvrChannels[dvr] ?? [];
        if (rows.isEmpty || machineIdFuture == null) return rows;
        final machine = await machineIdFuture;
        final source = machine == null ? null : 'server://$machine/${dvr.epg}';
        return [
          for (final row in rows)
            if (row['PlexFavoriteSource'] == null || row['PlexFavoriteSource'] == source) row
            else Map.of(row)..remove('PlexFavoriteSource')..remove('PlexFavoriteId'),
        ];
      }
      if (incomplete) {
        final found = {for (final dvr in dvrs) dvr.key};
        for (final dvr in _lastDvrChannels.keys.where((dvr) => !found.contains(dvr.key))) {
          next[dvr] = await retainedChannels(dvr);
        }
        onUnavailable?.call(next.values.expand((rows) => rows).toList());
      }
      for (final dvr in dvrs) {
        try {
          final lineup = await _dvrContainer('/${dvr.epg}/lineups/dvr/channels');
          final rows = (lineup['Channel'] as List? ?? const []).cast<Map>();
          final size = lineup['size'];
          final machineId = await machineIdFuture;
          final channels = rows.map((channel) {
            final id = channel['id'];
            if (id is! int && (id is! String || id.trim().isEmpty)) {
              throw const FormatException('Invalid Plex tuner channel ID');
            }
            return _channel(
              dvr.key,
              channel,
              number: (channel['vcn'] ?? '').toString(),
              favoriteSource: machineId == null ? null : 'server://$machineId/${dvr.epg}',
            );
          }).toList();
          if (size != null && int.tryParse('$size') != rows.length) {
            final found = {for (final channel in channels) channel['Id']};
            final missing = (await retainedChannels(dvr)).where((c) => !found.contains(c['Id'])).toList();
            onUnavailable?.call(missing);
            channels.addAll(missing);
          }
          next[dvr] = channels;
        } catch (error) {
          final status = error is DioException ? error.response?.statusCode : null;
          if (status == 401) rethrow;
          // Discovery still advertised this tuner. Recheck it on the next read.
          if (status == 404 && request == _dvrLineupRequest) _dvrs = null;
          if (status == 404 || _temporaryLineupFailure(error)) {
            final retained = await retainedChannels(dvr);
            next[dvr] = retained;
            onUnavailable?.call(retained);
          }
        }
      }
    } catch (error) {
      if (request > _publishedDvrRequest) {
        _lastDvrChannels = {};
        _publishedDvrRequest = request;
      }
      if (error is DioException && error.response?.statusCode == 401) rethrow;
      return [];
    }
    // An older channel read can finish after a full guide refresh.
    if (request > _publishedDvrRequest) {
      _lastDvrChannels = next;
      _publishedDvrRequest = request;
    }
    return next.values.expand((rows) => rows).toList();
  }

  /// Every free channel carries the same placeholder number, so they go
  /// without one and sort by name after the tuner's numbered channels.
  Future<_FreeChannels> _freeChannels() async {
    final read = _cached(
      () => _cloudChannels,
      (f) => _cloudChannels = f,
      () async {
        final response = await _dio.get<Map<String, dynamic>>(
          '$plexCloudEpg/lineups/plex/channels',
          options: _cloudOptions,
        );
        final container = response.data?['MediaContainer'];
        if (container is! Map) {
          throw const FormatException('Invalid Plex Free TV lineup');
        }
        final channels = container['Channel'];
        final size = container['size'];
        final zero = size == 0 || size == '0';
        if (channels is List && size != null && int.tryParse('$size') != channels.length) {
          throw const FormatException('Free TV channel count does not match the lineup');
        }
        if (channels is! List && (channels != null || !zero)) {
          throw const FormatException('Invalid Plex Free TV lineup channels');
        }
        final lineup = <String, Map<String, dynamic>>{};
        for (final channel in channels is List ? channels : const []) {
          if (channel is! Map) throw const FormatException('Invalid Free TV channel');
          final id = channel['id'];
          if (id is! int && (id is! String || id.trim().isEmpty)) {
            throw const FormatException('Invalid Free TV channel ID');
          }
          if (channel['drm'] != true) {
            lineup[_channelId(plexCloudSource, id)] = _channel(plexCloudSource, channel);
          }
        }
        return lineup;
      },
    );
    final _FreeChannels lineup;
    try {
      lineup = await read;
    } on DioException catch (error) {
      if (_accessDenied(error) && _cloudChannels == null) {
        _lastFreeLineup = null;
        _cloudOnNowRows = null;
        _invalidateGrids((_, _) => true);
      }
      rethrow;
    }
    if (!identical(read, _cloudChannels)) return _freeChannels();
    final previous = _lastFreeLineup;
    if (identical(previous, lineup)) return lineup;
    if (previous != null && !_sameStationMapping(previous, lineup)) {
      _cloudOnNowRows = null;
    }
    _invalidateGrids((key, _) {
      final station = lineup[_channelId(plexCloudSource, key.station)];
      return station == null || (station['PlexGridKey'] ?? key.station.split('-').last) != key.gridKey;
    });
    return _lastFreeLineup = lineup;
  }

  static bool _sameStationMapping(_FreeChannels a, _FreeChannels b) =>
      a.length == b.length && b.entries.every((entry) {
        final station = a[entry.key];
        return station != null && station['PlexGridKey'] == entry.value['PlexGridKey'];
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
    if (source == plexCloudSource)
      if (channel['gridKey'] case final String key when key.trim().isNotEmpty)
        'PlexGridKey': key.trim(),
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

  Future<_FreeChannels> _freeLineupForBrowse({void Function()? onUnavailable}) async {
    try {
      return await _freeChannels();
    } catch (error) {
      onUnavailable?.call();
      if (cloudOnly) {
        final recoverable = error is FormatException ||
            (error is DioException && error.type != DioExceptionType.cancel &&
                error.type != DioExceptionType.badCertificate && _temporaryLineupFailure(error));
        if (_lastFreeLineup == null || !recoverable) rethrow;
      }
      // Keep the last lineup visible without caching it as a successful retry.
      return _accessDenied(error) ? const {} : _lastFreeLineup ?? const {};
    }
  }

  /// One source failing, like plex.tv being unreachable, still leaves the
  /// other's channels.
  Future<(_Channels Function(), _Channels)> _channelSources({
    void Function(_Channels)? onDvrUnavailable,
    void Function()? onFreeUnavailable,
  }) async {
    final free = _freeLineupForBrowse(onUnavailable: onFreeUnavailable);
    // Future.wait preserves the original DioException (including 401/403)
    // rather than wrapping failures in ParallelWaitError as record .wait does.
    final dvr = _dvrChannels(onUnavailable: onDvrUnavailable);
    final request = _dvrLineupRequest;
    final results = await Future.wait<_Channels>([
      dvr,
      free.then((lineup) => lineup.values.toList()),
    ]);
    // Search and Guide can finish in either order, including while Free TV loads.
    _Channels currentDvr() => request < _publishedDvrRequest
        ? _lastDvrChannels.values.expand((rows) => rows).toList()
        : results[0];
    return (currentDvr, results[1]);
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

  // The provider catalog and channel lineup can encode the same ID differently.
  static String? _genreKey(Object? key) => switch (key) {
    String id when id.isNotEmpty => id,
    double id when id == id.truncateToDouble() => id.toStringAsFixed(0),
    num id => id.toString(),
    _ => null,
  };

  Future<_CloudGroups> _providerGroups() async {
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
        if (filter case {'genreRatingKey': final rawKey, 'title': String title}) {
          final key = _genreKey(rawKey);
          final name = title.trim();
          if (key != null && name.isNotEmpty) genres[key] = name;
        }
      }
      for (final filter
          in feature['PromotedGridChannelFilter'] as List? ?? const []) {
        if (filter case {
          'key': _featuredPath,
          'title': String name,
        } when name.isNotEmpty) {
          promoted = _featuredGroup?.name == name
              ? _featuredGroup
              : PromotedChannelGroup(name, _featuredIds);
        }
      }
    }
    _featuredGroup = promoted;
    return (genres: genres, promoted: promoted);
  }

  @override
  Future<ChannelGroupLineup> getChannelGroups({String? userId}) =>
      _lineupRead ??= _loadLineup().whenComplete(() => _lineupRead = null);

  Future<ChannelGroupLineup> _loadLineup() async {
    // A full guide load refreshes even a successfully cached catalog.
    _cloudChannels = null;
    _dvrs = null;
    Set<String>? unresolvedDvrIds;
    var freeUnavailable = false;
    final (currentDvr, free) = await _channelSources(
      onDvrUnavailable: (rows) => (unresolvedDvrIds ??= {})
          .addAll(rows.map((row) => row['Id'] as String)),
      onFreeUnavailable: () => freeUnavailable = true,
    );
    if (free.isEmpty) {
      final dvr = currentDvr();
      // Keep DVR channels in their own group when Free TV is unavailable.
      return ChannelGroupLineup(
        {
          for (final channel in dvr)
            channel['Id'] as String: {ChannelGroupSource.dvr.groupId},
        },
        channels: dvr,
        sources: dvr.isNotEmpty ? const [ChannelGroupSource.dvr] : const [],
        partial: unresolvedDvrIds != null || freeUnavailable,
        unresolvedChannelIds: freeUnavailable ? null : unresolvedDvrIds,
      );
    }
    // Keep existing groups if the provider metadata is temporarily unavailable.
    var metadataUnavailable = false;
    final catalog = await _providerGroups().onError<Object>((_, _) {
      metadataUnavailable = true;
      return (genres: const <String, String>{}, promoted: _featuredGroup);
    });
    final dvr = currentDvr();
    return ChannelGroupLineup(
      {
        for (final channel in dvr)
          channel['Id'] as String: {ChannelGroupSource.dvr.groupId},
        for (final channel in free)
          channel['Id'] as String: {
            if (dvr.isNotEmpty) ChannelGroupSource.plexFreeTv.groupId,
            for (final key in channel['genreRatingKeys'] as List? ?? const [])
              ?catalog.genres[_genreKey(key)],
          },
      },
      channels: [...dvr, ...free],
      sources: dvr.isNotEmpty ? ChannelGroupSource.values : const [],
      promoted: catalog.promoted,
      partial: metadataUnavailable || unresolvedDvrIds != null || freeUnavailable,
      unresolvedChannelIds: freeUnavailable
          ? null
          : metadataUnavailable
              ? {...?unresolvedDvrIds, for (final channel in free) channel['Id'] as String}
              : unresolvedDvrIds,
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
    bool reportGuideFailures = false,
  }) async {
    final showings = <({_Dvr dvr, Map item, Map media})>[];
    final failedIds = <String>{};
    Object? firstFailure;
    StackTrace? firstFailureStack;
    var succeeded = 0;
    var incomplete = false;
    final dvrs = await _dvrList(onIncomplete: () => incomplete = true);
    if (reportGuideFailures && incomplete) {
      final found = {for (final dvr in dvrs) dvr.key};
      final requested = channelIds ??
          _lastDvrChannels.values.expand((rows) => rows.map((row) => row['Id'] as String));
      for (final id in requested) {
        final source = plexChannelOf(id)?.source;
        if (source != null && source != plexCloudSource && !found.contains(source)) {
          failedIds.add(id);
        }
      }
    }
    for (final dvr in dvrs) {
      final requested = channelIds == null
          ? null
          : {
              for (final id in channelIds)
                if (plexChannelOf(id)?.source == dvr.key) id,
            };
      if (requested?.isEmpty == true) continue;
      try {
        final grid = await _dvrContainer('/${dvr.epg}/grid', {
          'type': '1,4',
          'beginsAt<': _seconds(end),
          'endsAt>': _seconds(start),
        });
        final fromDvr = <({_Dvr dvr, Map item, Map media})>[];
        for (final item in grid['Metadata'] as List? ?? const []) {
          if (item is! Map) continue;
          final airings = item['Media'];
          if (airings is! List) {
            if (reportGuideFailures && airings != null) {
              throw const FormatException('Invalid Plex DVR grid Media');
            }
            continue;
          }
          for (final media in airings) {
            if (media is Map) fromDvr.add((dvr: dvr, item: item, media: media));
          }
        }
        showings.addAll(fromDvr);
        succeeded++;
      } catch (error, stack) {
        if (error is DioException && error.response?.statusCode == 401) rethrow;
        failedIds.addAll(requested ?? const <String>{});
        if (reportGuideFailures && requested != null &&
            (error is FormatException || _tunerGridForbidden(error))) {
          continue;
        }
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

  // Plex can return other showings of a title that matches the grid query.
  static bool _overlapsWindow(Map media, int from, int to) =>
      (media['endsAt'] as int) > from && (media['beginsAt'] as int) < to;

  /// The DVR showings between [start] and [end] as programs, with any
  /// recording set for them.
  Future<_Airings> _dvrAirings(
    DateTime start,
    DateTime end, {
    Set<String>? channelIds,
    bool reportGuideFailures = false,
  }) async {
    final grabs = _grabs().catchError((_) => <_Grab>[]);
    final grid = await _dvrGrid(start, end,
        channelIds: channelIds, reportGuideFailures: reportGuideFailures);
    final scheduled = {
      for (final grab in await grabs)
        if (grab.op['status'] != 'error') grab.program['Id']: grab.op,
    };
    final programs = <Map<String, dynamic>>[];
    final from = _seconds(start);
    final to = _seconds(end);
    for (final showing in grid.showings) {
      final program = _dvrProgram(showing.dvr, showing.item, showing.media);
      if (program == null || !_overlapsWindow(showing.media, from, to)) continue;
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
    List<String> channels, {
    required bool reportGuideFailures,
    required _GridReads gridReads,
  }) async {
    final lineup = await _freeChannels().catchError((Object error) {
      if (_accessDenied(error)) throw error;
      // A known station can still use its guide key while the catalog is down.
      return _lastFreeLineup ?? const <String, Map<String, dynamic>>{};
    });
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
            final id = _channelId(plexCloudSource, request.channel);
            final catalog = _cloudChannels;
            final station = _lastFreeLineup?[id];
            if (lineup.containsKey(id) && station == null) {
              failedChannelIds.add(id);
              return null;
            }
            final gridKey = station?['PlexGridKey'] as String? ??
                request.channel.split('-').last;
            final key = (station: request.channel, gridKey: gridKey, day: request.day);
            final itemsFuture = _freeGrid(key);
            gridReads[key] = itemsFuture;
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
                  final program = _program(plexCloudSource, request.channel, item, media);
                  if (program == null || !_overlapsWindow(media, from, to)) continue;
                  final station = _stationIds(media, item).firstOrNull;
                  if (station != null && station != request.channel) {
                    failedChannelIds.add(id);
                    if (identical(catalog, _cloudChannels)) _cloudChannels = null;
                    _invalidateGrids((k, items) => k == key && identical(items, itemsFuture));
                    continue;
                  }
                  decoded.add(program);
                }
              }
              return decoded;
            } catch (error, stack) {
              failedChannelIds.add(id);
              // Plex can deny one station's grid while other stations are available.
              if (reportGuideFailures &&
                  error is DioException && error.response?.statusCode == 403) {
                return null;
              }
              if (_accessDenied(error)) rethrow;
              firstFailure ??= error;
              firstFailureStack ??= stack;
              // Drop malformed grids for Retry, unless a newer request already
              // replaced this cache entry.
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
    bool reportGuideFailures = false,
  }) async {
    // Omitted IDs request all Cloud-only channels; [] remains a no-op.
    final requestedIds = channelIds ??
        (cloudOnly
            ? (await _freeChannels()).keys.toList()
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
    Future<_AiringsResult> attempt(
      Future<_Airings> Function() load,
      Set<String> failedOnError, {
      bool dvr = false,
    }) async {
      try {
        final result = await load();
        return (
          items: result.items,
          failedChannelIds: result.failedChannelIds,
          error: null,
          stack: null,
        );
      } catch (error, stack) {
        // A 403 from one guide source can leave the other source usable.
        final catalogForbidden = reportGuideFailures &&
            error is DioException && error.response?.statusCode == 403 &&
            (dvr
                ? error.requestOptions.path == '/livetv/dvrs'
                : error.requestOptions.uri.path == '/lineups/plex/channels');
        if (_accessDenied(error) && !(dvr && _tunerGridForbidden(error)) &&
            !catalogForbidden) {
          rethrow;
        }
        return (
          items: <Map<String, dynamic>>[],
          failedChannelIds: failedOnError,
          error: error,
          stack: stack,
        );
      }
    }

    final gridReads = <_FreeGridKey, Future<List>>{};
    final stale = <String>{};
    if (free.isNotEmpty) _activeGridReads[gridReads] = stale;
    final pending = Future.wait([
      if (!cloudOnly && (channelIds == null || channelIds.length > free.length))
        attempt(
          () => _dvrAirings(start, end, channelIds: channelIds?.toSet(),
              reportGuideFailures: reportGuideFailures),
          dvrIds,
          dvr: true,
        ),
      if (free.isNotEmpty)
        attempt(
          () => _freeAirings(start, end, free,
              reportGuideFailures: reportGuideFailures, gridReads: gridReads),
          freeIds,
        ),
    ], eagerError: true);
    final List<_AiringsResult> results;
    try {
      results = await pending;
    } finally {
      _activeGridReads.remove(gridReads);
    }
    // Preserve the healthy source while retaining failed channel IDs for Retry.
    if (results.isNotEmpty && results.every((result) => result.error != null)) {
      final failure = results.firstWhere(
        (result) => _accessDenied(result.error!),
        orElse: () => results.first,
      );
      Error.throwWithStackTrace(failure.error!, failure.stack!);
    }
    final programs = [for (final result in results) ...result.items]
      ..removeWhere((item) => stale.contains(item['ChannelId']))
      ..sort(
        (a, b) => (a['StartDate'] as String).compareTo(b['StartDate'] as String),
      );
    return (
      items: programs,
      failedChannelIds: {
        ...stale,
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
    final (currentDvr, free) = await _channelSources();
    final channels = [...currentDvr(), ...free];
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
      reportGuideFailures: true,
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

  // Plex can identify a station on the showing or its parent programme.
  static Iterable<String> _stationIds(Map media, Map row) sync* {
    for (final entry in [media, row]) {
      for (final field in const ['channelIdentifier', 'channelId', 'channelGridKey', 'gridKey']) {
        final ref = entry[field];
        if (ref is! Map && field != 'channelIdentifier' && field != 'channelId') continue;
        final value = ref is Map ? ref['id'] : ref;
        final id = value?.toString().trim();
        if (id != null && id.isNotEmpty) {
          final parsed = plexChannelOf(id);
          yield parsed?.source == plexCloudSource ? parsed!.channel : id;
        }
      }
    }
  }

  Future<List<Map>> _fetchCloudOnNowRows() async {
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
    return rows;
  }

  static bool _hubNeedsStationMapping(List<Map> rows, _FreeChannels lineup) {
    bool known(String id) => lineup.containsKey(_channelId(plexCloudSource, id));
    for (final row in rows) {
      for (final media in (row['Media'] as List).whereType<Map>()) {
        if (!_stationIds(media, row).any(known)) return true;
      }
    }
    return false;
  }

  List<Map<String, dynamic>> _matchCloudOnNow(
    List<Map> rows,
    _FreeChannels lineup, {
    required bool allowAliases,
  }) {
    final gridKeys = <String, String?>{};
    final suffixes = <String, String?>{};
    void addAlias(Map<String, String?> index, String alias, String station) {
      index.update(
        alias,
        (old) => old == station ? station : null,
        ifAbsent: () => station,
      );
    }

    for (final entry in lineup.entries) {
      final station = plexChannelOf(entry.key)!.channel;
      final suffix = station.split('-').last;
      if (suffix.isNotEmpty) addAlias(suffixes, suffix, station);
      if (entry.value['PlexGridKey'] case final String key) {
        addAlias(gridKeys, key, station);
        addAlias(suffixes, key, station);
      }
    }

    String? matchChannel(Map media, Map row) {
      final stationIds = <String>[];
      String? exact, grid, stationInGridField, suffix;
      void consider(Object? value, {required bool stationId}) {
        final raw = value?.toString().trim();
        if (raw == null || raw.isEmpty) return;
        final parsed = plexChannelOf(raw);
        final key = parsed?.source == plexCloudSource ? parsed!.channel : raw;
        final knownStation = lineup.containsKey(_channelId(plexCloudSource, key));
        if (stationId) {
          stationIds.add(raw);
          if (knownStation) exact ??= key;
        }
        if (gridKeys.containsKey(key)) {
          // A shared guide cannot identify a station by itself.
          grid ??= gridKeys[key];
        } else {
          if (knownStation) stationInGridField ??= key;
          suffix ??= suffixes[key.split('-').last];
        }
      }

      for (final item in [media, row]) {
        for (final field in const [
          'channelIdentifier', 'channelId', 'channelGridKey', 'gridKey',
        ]) {
          final ref = item[field];
          if (ref is Map) {
            consider(ref['id'], stationId: true);
            consider(ref['gridKey'], stationId: false);
          } else {
            consider(ref,
                stationId: field == 'channelIdentifier' || field == 'channelId');
          }
        }
      }
      if (exact != null || !allowAliases) return exact;
      final match = grid ?? stationInGridField ?? suffix;
      if (match == null || stationIds.isEmpty) return match;
      // A guide key can change owners. An explicit short ID must agree with its unique station.
      final shortId = match.split('-').last;
      return suffixes[shortId] == match && stationIds.every((id) => id == shortId)
          ? match : null;
    }

    final now = _seconds(DateTime.now());
    final programs = <Map<String, dynamic>>[];
    final usedChannels = <String>{};
    for (final row in rows) {
      final mediaList = row['Media'];
      if (mediaList is! List) continue;
      for (final media in mediaList.whereType<Map>()) {
        final channel = matchChannel(media, row);
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

  Future<List<Map<String, dynamic>>> _freeOnNow() =>
      _loadFreeOnNow().timeout(_cloudOnNowTimeout).onError<Object>((_, _) => []);

  Future<List<Map<String, dynamic>>> _loadFreeOnNow({bool retry = true}) async {
    var stale = false;
    var lineup = await _freeLineupForBrowse(onUnavailable: () => stale = true);
    var catalog = stale ? null : _cloudChannels;
    if (lineup.isEmpty) return [];
    final now = DateTime.now();
    final expires = _cloudOnNowExpiresAt;
    final fresh = _cloudOnNowRows == null || (expires != null && !now.isBefore(expires));
    if (fresh) {
      _cloudOnNowExpiresAt = now.add(_cloudOnNowCacheLife);
      _cloudOnNowRows = _fetchCloudOnNowRows()
          .timeout(_cloudOnNowTimeout)
          .onError<Object>((_, _) => <Map>[]);
    }

    final cached = _cloudOnNowRows!;
    final rows = await cached;
    if (fresh && identical(cached, _cloudOnNowRows) && catalog != null &&
        identical(catalog, _cloudChannels) && _hubNeedsStationMapping(rows, lineup)) {
      _cloudChannels = null;
      // Concurrent Home reads share this catalog check.
      _cloudOnNowExpiresAt = null;
    }
    if (identical(cached, _cloudOnNowRows) && _cloudOnNowExpiresAt == null) {
      lineup = await _freeLineupForBrowse(onUnavailable: () => stale = true);
      catalog = stale ? null : _cloudChannels;
      if (identical(cached, _cloudOnNowRows)) {
        _cloudOnNowExpiresAt ??= now.add(_cloudOnNowCacheLife);
      }
      if (lineup.isEmpty) return [];
    }
    if (!identical(cached, _cloudOnNowRows)) {
      // The key changed owners. Fetch the programmes again against the new lineup.
      if (retry) return _loadFreeOnNow(retry: false);
      return [];
    }
    // Only a verified lineup can match a program by a reassignable guide key.
    final programs = _matchCloudOnNow(
      rows, lineup, allowAliases: catalog != null && identical(catalog, _cloudChannels),
    );
    for (final program in programs) {
      final end = DateTime.parse(program['EndDate'] as String);
      if (end.isBefore(_cloudOnNowExpiresAt!)) _cloudOnNowExpiresAt = end;
    }
    return programs;
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
    (Object, StackTrace)? tunerFailure;
    if (!cloudOnly) {
      try {
        final airings = await _dvrAirings(now, now.add(const Duration(seconds: 1)));
        dvr.addAll(airings.items);
      } on DioException catch (error, stack) {
        if (_accessDenied(error) && !_tunerGridForbidden(error)) rethrow;
        if (_temporaryLineupFailure(error)) tunerFailure = (error, stack);
      } on TypeError catch (error, stack) {
        tunerFailure = (error, stack);
      } on FormatException catch (error, stack) {
        tunerFailure = (error, stack);
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
      if (programs.isEmpty && tunerFailure != null) {
        Error.throwWithStackTrace(tunerFailure.$1, tunerFailure.$2);
      }
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
    final showing = (await _dvrGrid(
      at,
      at,
      channelIds: {_channelId(airing.source, airing.channel)},
    )).showings.firstWhere(
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
