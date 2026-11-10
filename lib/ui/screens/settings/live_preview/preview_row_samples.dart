import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart' show MediaServerClient;

import '../../../../data/models/home_row.dart';
import '../../../../data/repositories/multi_server_repository.dart';
import '../../../../data/services/connectivity_service.dart';
import '../../../../data/services/row_data_source.dart';
import '../../../../preference/preference_constants.dart';
import '../../../widgets/settings/settings_preview_scope.dart';

/// One Home row as the preview asks for it: the section and the sort it's
/// drawn with, on the server it would load from.
@immutable
class PreviewRowQuery {
  final HomeSectionType section;
  final LibrarySortBy sortBy;
  final SortDirection sortOrder;
  final bool multiServer;
  final String serverId;

  const PreviewRowQuery({
    required this.section,
    required this.sortBy,
    required this.sortOrder,
    required this.multiServer,
    required this.serverId,
  });

  @override
  bool operator ==(Object other) =>
      other is PreviewRowQuery &&
      other.section == section &&
      other.sortBy == sortBy &&
      other.sortOrder == sortOrder &&
      other.multiServer == multiServer &&
      other.serverId == serverId;

  @override
  int get hashCode =>
      Object.hash(section, sortBy, sortOrder, multiServer, serverId);
}

enum PreviewRowStatus { loading, ready, failed }

/// What came back for a [PreviewRowQuery].
@immutable
class PreviewRowSample {
  final PreviewRowStatus status;

  /// The row as Home would load it, with the empty collections and playlists
  /// Home leaves out already gone. Null until it's ready.
  final HomeRow? row;

  const PreviewRowSample._(this.status, this.row);

  static const loading = PreviewRowSample._(PreviewRowStatus.loading, null);
  static const failed = PreviewRowSample._(PreviewRowStatus.failed, null);

  const PreviewRowSample.ready(HomeRow row)
    : this._(PreviewRowStatus.ready, row);
}

/// The Row Options rows the preview draws, fetched with the sort being
/// looked at and kept, so moving back to a value already seen redraws at
/// once.
///
/// One lives per settings screen, made the first time the preview asks for
/// it, so nothing carries over to another sign-in. The preview only reads it
/// while it builds, and [want] only ever schedules work, so a build never
/// waits on the network.
class PreviewRowSamples extends ChangeNotifier {
  PreviewRowSamples({
    Future<HomeRow> Function(PreviewRowQuery query)? load,
    this.settle = const Duration(milliseconds: 150),
    this.timeout = const Duration(seconds: 8),
  }) : _load = load ?? _loadFromServer;

  static final _byController = Expando<PreviewRowSamples>();

  /// The samples shared by everything drawn for [controller].
  static PreviewRowSamples of(SettingsPreviewController controller) =>
      _byController[controller] ??= PreviewRowSamples();

  /// Puts [samples] in place for [controller], for a test that fakes the
  /// network.
  @visibleForTesting
  static void debugSet(
    SettingsPreviewController controller,
    PreviewRowSamples samples,
  ) => _byController[controller] = samples;

  static const _maxEntries = 16;
  static const _maxInFlight = 3;

  final Future<HomeRow> Function(PreviewRowQuery query) _load;

  /// How long the wanted rows have to stay the same before they're fetched,
  /// so scrubbing through a picker only fetches where it stops.
  final Duration settle;
  final Duration timeout;

  final _cache = <PreviewRowQuery, PreviewRowSample>{};
  final _inFlight = <PreviewRowQuery>{};
  Set<PreviewRowQuery> _wanted = const {};
  Timer? _settleTimer;
  bool _disposed = false;

  /// The server Home loads its own rows from.
  static String get activeServerId =>
      GetIt.instance.isRegistered<MediaServerClient>()
      ? GetIt.instance<MediaServerClient>().baseUrl
      : '';

  /// What has come back for [query], or null when nothing has yet. A row
  /// being fetched reads [PreviewRowSample.loading].
  PreviewRowSample? sampleFor(PreviewRowQuery query) {
    final cached = _cache[query];
    if (cached != null) return cached;
    return _inFlight.contains(query) ? PreviewRowSample.loading : null;
  }

  /// Asks for [rows], dropping whatever was asked for before and hasn't
  /// started. Safe to call from a build: the same request twice does
  /// nothing, and a fetch only starts once the request has held still for
  /// [settle].
  void want(Set<PreviewRowQuery> rows) {
    if (_disposed) return;
    if (setEquals(rows, _wanted)) return;
    _wanted = rows;
    // A row that failed gets one more try each time the request changes,
    // never on its own, so an unreachable server isn't asked in a loop.
    _cache.removeWhere(
      (q, sample) =>
          sample.status == PreviewRowStatus.failed && rows.contains(q),
    );
    _settleTimer?.cancel();
    if (!_hasWork) return;
    _settleTimer = Timer(settle, _pump);
  }

  /// Drops [rows] if they're still all that's wanted, for a preview that's
  /// gone and whose rows nothing else is waiting on.
  void forget(Set<PreviewRowQuery> rows) {
    if (setEquals(rows, _wanted)) want(const {});
  }

  bool get _hasWork =>
      _wanted.any((q) => !_cache.containsKey(q) && !_inFlight.contains(q));

  /// Fills [query] from a row Home already loaded, so the saved values draw
  /// at once instead of waiting on a fetch. Home loads with the saved sort,
  /// so only a query for the saved values may be seeded.
  void seed(PreviewRowQuery query, HomeRow row) {
    if (_cache.containsKey(query) || row.isLoading || row.items.isEmpty) {
      return;
    }
    _store(query, PreviewRowSample.ready(_shown(row)), notify: false);
  }

  void _pump() {
    if (_disposed) return;
    final queue = _wanted.where(
      (q) => !_cache.containsKey(q) && !_inFlight.contains(q),
    );
    for (final query in queue.toList()) {
      if (_inFlight.length >= _maxInFlight) break;
      unawaited(_fetch(query));
    }
  }

  Future<void> _fetch(PreviewRowQuery query) async {
    // Without the server there's nothing to ask, and Home's own check skips
    // a TV, so this one asks on every device.
    if (GetIt.instance.isRegistered<ConnectivityService>() &&
        !GetIt.instance<ConnectivityService>().canReachServer) {
      _store(query, PreviewRowSample.failed);
      return;
    }
    _inFlight.add(query);
    PreviewRowSample result;
    try {
      final row = await _load(query).timeout(timeout);
      result = PreviewRowSample.ready(_shown(row));
    } catch (_) {
      result = PreviewRowSample.failed;
    }
    if (_disposed) return;
    _inFlight.remove(query);
    _store(query, result);
    _pump();
  }

  /// [row] as Home keeps it: the same empty collections and playlists
  /// dropped.
  static HomeRow _shown(HomeRow row) => row.copyWith(
    items: row.items
        .where(
          (item) =>
              !(item.type == 'BoxSet' || item.type == 'Playlist') ||
              (item.childCount != 0 && item.recursiveItemCount != 0),
        )
        .toList(growable: false),
  );

  void _store(
    PreviewRowQuery query,
    PreviewRowSample sample, {
    bool notify = true,
  }) {
    _cache.remove(query);
    _cache[query] = sample;
    // The oldest go first, but never a row on screen, which nothing would
    // fetch again.
    final over = _cache.length - _maxEntries;
    if (over > 0) {
      final spare = _cache.keys.where((q) => !_wanted.contains(q)).toList();
      for (final old in spare.take(over)) {
        _cache.remove(old);
      }
    }
    if (notify) notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _settleTimer?.cancel();
    super.dispose();
  }

  /// The same call Home makes for the section, with the sort passed in
  /// rather than read from the saved settings.
  static Future<HomeRow> _loadFromServer(PreviewRowQuery query) {
    final sortBy = query.sortBy.apiValue;
    final sortOrder = query.sortOrder.apiValue;
    if (query.multiServer &&
        GetIt.instance.isRegistered<MultiServerRepository>()) {
      final repo = GetIt.instance<MultiServerRepository>();
      return switch (query.section) {
        HomeSectionType.audioArtists => repo.getAggregatedAudioArtists(
          sortBy: sortBy,
          sortOrder: sortOrder,
        ),
        HomeSectionType.audioAlbums => repo.getAggregatedAudioAlbums(
          sortBy: sortBy,
          sortOrder: sortOrder,
        ),
        HomeSectionType.audioPlaylists => repo.getAggregatedAudioPlaylists(
          sortBy: sortBy,
          sortOrder: sortOrder,
        ),
        HomeSectionType.collections => repo.getAggregatedCollections(
          sortBy: sortBy,
          sortOrder: sortOrder,
        ),
        _ => throw UnsupportedError('${query.section}'),
      };
    }
    final rows = GetIt.instance<RowDataSource>();
    final serverId = query.serverId;
    return switch (query.section) {
      HomeSectionType.audioArtists => rows.loadAudioArtists(
        serverId,
        sortBy: sortBy,
        sortOrder: sortOrder,
      ),
      HomeSectionType.audioAlbums => rows.loadAudioAlbums(
        serverId,
        sortBy: sortBy,
        sortOrder: sortOrder,
      ),
      HomeSectionType.audioPlaylists => rows.loadAudioPlaylists(
        serverId,
        sortBy: sortBy,
        sortOrder: sortOrder,
      ),
      HomeSectionType.collections => rows.loadCollections(
        serverId,
        sortBy: sortBy,
        sortOrder: sortOrder,
      ),
      _ => throw UnsupportedError('${query.section}'),
    };
  }
}
