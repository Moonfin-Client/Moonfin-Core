import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';

import '../database/offline_database.dart';
import '../models/aggregated_item.dart';
import '../offline/connectivity_aware_media_server_client.dart';
import '../repositories/multi_server_repository.dart';
import '../repositories/user_views_repository.dart';
import '../utils/bounded_concurrency.dart';
import 'unified_catalog_query.dart';
import 'user_data_sync.dart';

typedef _Account = ({String serverId, String userId});

/// Identifies the stored catalog of one kind (movies or series) of an account.
typedef _SyncStateKey = ({String serverId, String userId, String itemType});

/// What the last sync recorded about one kind of an account's stored catalog.
typedef _SyncState = ({
  /// When the server last confirmed the stored rows, by a check or a full
  /// read.
  DateTime checkedAt,

  /// When every row was last listed again from the server. Null if never.
  DateTime? fullReadAt,

  /// Sum of the server's per-library counts. A title in two libraries counts
  /// twice here but is held once, so never compare this with the rows held.
  int? serverTotal,
});

/// What a sync did to one account's stored catalog.
enum _SyncOutcome {
  unchanged,

  /// The rows were rewritten but hold the same titles.
  rowsRewritten,

  titlesChanged,

  /// The server was not asked: the account needs a full read, and full reads
  /// are deferred.
  deferred,
}

/// The items of a merged library at one moment, filtered and sorted. A grid
/// cuts every page of one load from the same snapshot so the pages agree.
class UnifiedCatalogSnapshot {
  UnifiedCatalogSnapshot._(
    this.items, {
    required this.revision,
    required this.titlesRevision,
  });

  final List<Map<String, dynamic>> items;

  final int revision;

  final int titlesRevision;

  Map<String, dynamic> page({int startIndex = 0, int? limit}) {
    final start = startIndex.clamp(0, items.length);
    final end = limit == null
        ? items.length
        : (start + limit).clamp(0, items.length);
    return {
      'Items': items.sublist(start, end),
      'TotalRecordCount': items.length,
    };
  }
}

/// One kind's titles merged across servers, with the copies behind each.
class _MergedLibrary {
  _MergedLibrary(
    this._groups,
    this._order, {
    required this.mergeRevision,
    required this.activeServerId,
  }) : items = [
         for (final copies in _groups) mergeCatalogCopies(copies, _order),
       ];

  /// The copies of each title, index-aligned with [items].
  final List<List<UnifiedCatalogEntry>> _groups;
  final UnifiedServerOrder _order;
  final List<Map<String, dynamic>> items;
  final int mergeRevision;

  /// The active server when this was merged. Its copies are shown first.
  final String? activeServerId;

  late final Map<UnifiedCopyRef, int> _indexByCopy = {
    for (final (index, copies) in _groups.indexed)
      for (final copy in copies)
        (serverId: copy.serverId, itemId: copy.itemId): index,
  };

  late final Map<String, int> _indexByKey = {
    for (final (index, copies) in _groups.indexed)
      for (final copy in copies)
        for (final key in copy.matchKeys) key: index,
  };

  List<UnifiedCatalogEntry> copiesOf(UnifiedCatalogEntry entry) => [
    for (final index in {
      ?_indexByCopy[(serverId: entry.serverId, itemId: entry.itemId)],
      for (final key in entry.matchKeys) ?_indexByKey[key],
    })
      ..._groups[index],
  ];

  Map<String, dynamic>? itemOf(UnifiedCopyRef copy) {
    final index = _indexByCopy[copy];
    return index == null ? null : items[index];
  }

  /// Swaps in [entry] for the copy with its ids and re-merges that title. The
  /// item is replaced, not mutated, so a snapshot taken earlier is unaffected.
  void replace(UnifiedCatalogEntry entry) {
    final index =
        _indexByCopy[(serverId: entry.serverId, itemId: entry.itemId)];
    if (index == null) return;
    final copies = _groups[index];
    final at = copies.indexWhere(
      (copy) => copy.serverId == entry.serverId && copy.itemId == entry.itemId,
    );
    copies[at] = entry;
    items[index] = mergeCatalogCopies(copies, _order);
  }
}

/// Times a stretch of work so that it can yield to the UI once it has run
/// for as long as one frame allows.
class _FrameBudget {
  _FrameBudget(this._budget);

  final Duration _budget;
  final _watch = Stopwatch()..start();

  bool get isSpent => _watch.elapsed >= _budget;

  Future<void> yieldToUi() async {
    await Future<void>.delayed(Duration.zero);
    _watch.reset();
  }
}

/// What asked for a sync. The order matters: values are compared by index,
/// and a later one does everything an earlier one does and more.
enum _SyncTrigger {
  /// The app started. Works from the counts and ids on disk without loading
  /// entries, and defers full reads on a metered connection.
  appLaunch,

  /// A merged library was opened. Checks, and does the full reads that are
  /// due.
  libraryOpened,

  /// The user asked for it. Does a full read of every server.
  userForced,
}

/// What one walk through the pages of a server library returned.
class _Listing {
  _Listing(
    this.itemsById, {
    required this.total,
    required this.endedShort,
    required this.totalsAgreed,
  });

  final Map<String, Map<String, dynamic>> itemsById;

  /// The last count a page gave, or the number listed when it gave none.
  final int total;

  /// The server returned an empty page before reaching its own count.
  final bool endedShort;

  final bool totalsAgreed;

  /// Whether the library held still during the walk. Pages are requested by
  /// offset, so a title added or removed meanwhile is missed or listed twice.
  bool get isWhole =>
      !endedShort && totalsAgreed && itemsById.length == total;

  bool sameTitlesAs(_Listing other) =>
      itemsById.length == other.itemsById.length &&
      itemsById.keys.every(other.itemsById.containsKey);
}

typedef _AccountRead = ({
  Map<String, UnifiedCatalogEntry> entries,

  /// Null where the server's count and its list could not be reconciled.
  Map<UnifiedLibraryKind, int?> totals,

  bool tookShortListing,
});

class _ShortListing implements Exception {
  const _ShortListing(this.offset, this.total);

  final int offset;
  final int total;

  @override
  String toString() => 'library ended at $offset of the $total it counted';
}

/// The account's stored rows were left as they were for a reason other than
/// its server being unreachable: libraries still changing, a disk failure, a
/// deferred full read.
class _NotSettled implements Exception {
  const _NotSettled(this.reason, {required this.serverAnswered});

  final String reason;

  final bool serverAnswered;

  @override
  String toString() => reason;
}

/// The generation changed while an account's rows were being written.
class _Cancelled implements Exception {
  const _Cancelled();
}

/// The app-wide instance, under a name the constructor's `userDataSync`
/// parameter does not shadow.
final _appUserDataSync = userDataSync;

/// Stores the catalog (movies and series) of every signed-in server on the
/// device and answers the merged libraries from it, so they can be sorted,
/// filtered and deduplicated across servers, including one that is down.
///
/// "Merged libraries" is the user-facing feature, the `Unified*` types
/// implement it, and upstream's `Aggregated*` types are the per-server
/// listing, which does not merge titles.
///
/// A sync brings one account's stored catalog up to date in one of two ways.
/// A check compares each library's count with the last sync and patches the
/// stored rows by id. A full read replaces every row, and is what catches a
/// swapped title, edited metadata and user data changed on another device.
///
/// A copy is one server's instance of a title, so a title that two servers
/// hold has two copies.
///
/// An account's rows are only ever written from what its server itself
/// responded, and never while the device is offline.
class UnifiedCatalogService extends ChangeNotifier {
  UnifiedCatalogService({
    required OfflineDatabase database,
    required this._loadSessions,
    required this._activeServerId,
    this._knownAccounts,
    bool Function()? isOffline,
    bool Function()? isMetered,
    bool Function()? isEnabled,
    DateTime Function()? now,
    UserDataSync? userDataSync,
    this._pageTimeout = const Duration(seconds: 20),
    this._retryDelay = const Duration(seconds: 2),
    this._confirmDelay = const Duration(seconds: 15),
    this._userDataDebounce = const Duration(milliseconds: 300),
    this._userDataRetryDelay = const Duration(seconds: 2),
    this._frameBudget = const Duration(milliseconds: 8),
    this._fullReadInterval = const Duration(hours: 24),
    this._checkInterval = const Duration(seconds: 60),
  }) : _db = database,
       _isOffline = isOffline ?? _never,
       _isMetered = isMetered ?? _never,
       _isEnabled = isEnabled ?? _always,
       _now = now ?? DateTime.now,
       _userDataSync = userDataSync ?? _appUserDataSync {
    _userDataRevisionSeen = _userDataSync.revision;
    _userDataSync.addListener(_onUserDataChanged);
  }

  final OfflineDatabase _db;
  final Future<List<ServerUserSession>> Function() _loadSessions;
  final String? Function() _activeServerId;

  /// Every account the device holds a sign-in for, usable right now or not.
  /// Null leaves [_loadSessions] to say who is signed in.
  final Iterable<_Account> Function()? _knownAccounts;

  /// No network at all. One unreachable server is not this.
  final bool Function() _isOffline;

  final bool Function() _isMetered;

  final bool Function() _isEnabled;
  final DateTime Function() _now;
  final UserDataSync _userDataSync;
  final Duration _pageTimeout;
  final Duration _retryDelay;

  /// Wait before re-reading a server that suddenly lists far fewer titles.
  final Duration _confirmDelay;

  /// How long user data changes are collected before the servers are asked
  /// about them.
  final Duration _userDataDebounce;
  final Duration _userDataRetryDelay;

  /// How long work runs before yielding to a frame. Web has no second isolate
  /// and tvOS runs the database on the UI isolate.
  final Duration _frameBudget;

  final Duration _fullReadInterval;

  final Duration _checkInterval;
  final _logger = Logger();

  static const _pageSize = 300;

  static const _idPageSize = 1000;

  /// Ids per request when entries are fetched by id.
  static const _fetchByIdChunk = 100;

  /// Rows per statement, so a database on the UI isolate can yield between.
  static const _diskChunk = 500;

  /// With more than this share of the stored rows missing, patching would
  /// fetch about as much as a full read, without its safeguards.
  static const _maxMissingShare = 0.3;

  /// A server starting up or rescanning lists and counts only part of what it
  /// holds. A drop above this share and above [_maxTrustedDrop], or of every
  /// title held, is not believed until a second read confirms it.
  static const _maxDroppedShare = 0.3;

  static const _maxTrustedDrop = 10;

  /// Past this many, [userDataChangedSince] returns null instead.
  static const _maxUserDataChangesKept = 500;

  /// Matches what [UserDataSync] itself tracks.
  static const _maxMissedUserData = 2000;

  /// SQLite caps how many values one statement can name.
  static const _deleteChunk = 500;
  static const _serverConcurrency = 4;
  static const _maxAttempts = 3;
  static const _userDataChunk = 100;
  static const _maxUserDataRetries = 2;
  static const _deepEquality = DeepCollectionEquality();

  // What the grid shows and sorts on, plus what matches a title across servers.
  static const _fields =
      'PrimaryImageAspectRatio,SortName,Type,UserData,CommunityRating,CriticRating,OfficialRating,RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,Genres,Studios,ProviderIds,DateCreated,PremiereDate,Status,OriginalTitle';
  static const _imageTypes = 'Primary,Backdrop,Thumb,Banner';

  final Map<_Account, Map<String, UnifiedCatalogEntry>> _entries = {};
  final Map<_SyncStateKey, _SyncState> _syncStates = {};

  /// Servers that could not be asked on their last try.
  final Set<String> _unreachableServers = {};

  /// Servers whose last try ended in [_NotSettled].
  final Set<String> _unsettledServers = {};
  final Set<String> _syncingServers = {};

  /// The sessions the last load or sync resolved: the accounts being merged.
  List<ServerUserSession> _activeSessions = const [];

  /// User data reported per item id while an account's full read runs. The
  /// read may have fetched those items earlier, so it reapplies these.
  final Map<_Account, Map<String, Map<String, dynamic>>> _userDataDuringRead =
      {};

  /// Item ids [removeCopy] dropped while an account's full read runs, taken
  /// out of what the read brings.
  final Map<_Account, Set<String>> _removedDuringRead = {};

  /// The same for an account's count check, kept apart so a check and a full
  /// read can't end each other's tracking.
  final Map<_Account, Set<String>> _removedDuringCheck = {};

  /// Bumped when an account's rows are written while not in memory, so
  /// [_loadAccount] can tell its read was overtaken.
  final Map<_Account, int> _diskWrites = {};

  /// Item ids whose user data changed while some account's entries weren't
  /// in memory to look them up in. Queued once those entries are loaded.
  final Set<String> _missedUserDataIds = {};

  /// Bumped when the signed-in accounts change, so work for the old ones stops.
  int _generation = 0;

  bool _loaded = false;

  /// Set by [ensureLoaded]. Entries are kept in memory only while true.
  bool _entriesWanted = false;
  bool _disposed = false;
  Future<void>? _loading;
  Future<void>? _statesLoading;
  Future<void>? _runningSync;
  _SyncTrigger _runningSyncTrigger = _SyncTrigger.appLaunch;
  Future<void>? _queuedSync;
  _SyncTrigger _queuedSyncTrigger = _SyncTrigger.appLaunch;

  /// Whether the last sync put off a full read because the connection was
  /// metered.
  bool _fullReadsDeferred = false;

  /// The launch check of this session. Cleared when it left a server
  /// unsettled, so that [syncOnLaunch] runs it again.
  Future<void>? _sessionCheck;

  /// The accounts the last disk prune kept. An unchanged set skips the next
  /// prune.
  Set<_Account>? _prunedFor;

  int _rowsDecoded = 0;
  int _session = 0;
  int _revision = 0;
  int _titlesRevision = 0;

  /// Bumped on any change other than to user data alone.
  int _mergeRevision = 0;
  final Map<UnifiedLibraryKind, _MergedLibrary> _mergedLibraries = {};
  ({Map<String, String> spellings, int mergeRevision})? _genreSpellingsCache;

  /// Copies whose user data changed, with the [revision] of each change.
  /// Complete for changes after [_userDataChangesSinceRevision].
  final Map<UnifiedCopyRef, int> _userDataChanges = {};
  int _userDataChangesSinceRevision = 0;

  int _userDataRevisionSeen = 0;

  /// Copies whose user data is to be asked of their server, each with the
  /// number of retries already made.
  final Map<UnifiedCopyRef, int> _userDataQueue = {};
  Timer? _userDataTimer;

  /// Bumped by every [reset], so a screen can tell its accounts changed.
  int get session => _session;

  /// Bumped on any change: titles, user data, or which servers answer.
  int get revision => _revision;

  /// Bumped only when titles change. A user data change leaves it alone.
  int get titlesRevision => _titlesRevision;

  bool get isSyncing => _syncingServers.isNotEmpty;

  @visibleForTesting
  int get rowsDecoded => _rowsDecoded;

  /// [upToDate] counts the servers whose last try settled their stored
  /// catalog and that aren't syncing now.
  ({int upToDate, int total}) get serverCounts => (
    upToDate: _activeSessions
        .where(
          (s) =>
              _hasBeenSynced(s) &&
              !_unreachableServers.contains(s.server.id) &&
              !_unsettledServers.contains(s.server.id) &&
              !_syncingServers.contains(s.server.id),
        )
        .length,
    total: _activeSessions.length,
  );

  /// Servers that failed their last try and aren't being asked again now.
  int get unreachableServerCount => _activeSessions
      .where(
        (s) =>
            _unreachableServers.contains(s.server.id) &&
            !_syncingServers.contains(s.server.id),
      )
      .length;

  bool hasTitles(UnifiedLibraryKind kind) =>
      _mergedLibrary(kind).items.isNotEmpty;

  static bool _never() => false;

  static bool _always() => true;

  static _Account _accountOf(ServerUserSession session) =>
      (serverId: session.server.id, userId: session.userId);

  static _SyncStateKey _syncStateKey(
    _Account account,
    UnifiedLibraryKind kind,
  ) => (
    serverId: account.serverId,
    userId: account.userId,
    itemType: kind.itemType,
  );

  static bool _sameAccounts(
    List<ServerUserSession> a,
    List<ServerUserSession> b,
  ) => const ListEquality<_Account>().equals(
    [for (final session in a) _accountOf(session)],
    [for (final session in b) _accountOf(session)],
  );

  bool _hasBeenSynced(ServerUserSession session) =>
      UnifiedLibraryKind.values.every(
        (kind) =>
            _syncStates.containsKey(_syncStateKey(_accountOf(session), kind)),
      );

  /// Whether [reset] or [dispose] ran after [generation] was read, so the work
  /// started under it must stop.
  bool _isStale(int generation) => generation != _generation;

  /// Forgets everything in memory. Called when the signed-in accounts change.
  /// Rows on disk stay for every account the device still holds a sign-in for.
  void reset() {
    _generation++;
    _session++;
    _entries.clear();
    _syncStates.clear();
    _unreachableServers.clear();
    _unsettledServers.clear();
    _syncingServers.clear();
    _userDataDuringRead.clear();
    _removedDuringRead.clear();
    _removedDuringCheck.clear();
    _userDataQueue.clear();
    _userDataTimer?.cancel();
    _userDataTimer = null;
    _activeSessions = const [];
    _loaded = false;
    _entriesWanted = false;
    _loading = null;
    _statesLoading = null;
    _runningSync = null;
    _queuedSync = null;
    _sessionCheck = null;
    _fullReadsDeferred = false;
    _markChanged(titles: true);
    unawaited(pruneStored());
  }

  /// Forgets every stored catalog and deletes them all from disk, for when
  /// merged libraries are turned off. Never throws.
  Future<void> clear() async {
    reset();
    _prunedFor = null;
    try {
      await _db.transaction(() async {
        await _db.delete(_db.catalogEntries).go();
        await _db.delete(_db.catalogSyncStates).go();
      });
    } catch (e) {
      _logger.w('UnifiedCatalog: stored catalogs not deleted: $e');
    }
  }

  /// [userDataOf] marks a change to only those copies' user data, which the
  /// merged lists already hold. Anything else rebuilds them.
  void _markChanged({bool titles = false, List<UnifiedCopyRef>? userDataOf}) {
    _revision++;
    if (titles) _titlesRevision++;
    if (userDataOf == null ||
        _userDataChanges.length + userDataOf.length > _maxUserDataChangesKept) {
      if (userDataOf == null) _mergeRevision++;
      _userDataChanges.clear();
      _userDataChangesSinceRevision = _revision;
    } else {
      for (final copy in userDataOf) {
        _userDataChanges[copy] = _revision;
      }
    }
    if (!_disposed) notifyListeners();
  }

  /// For progress only: leaves the revisions alone so nobody re-merges.
  void _notifyProgress() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _generation++;
    _userDataSync.removeListener(_onUserDataChanged);
    _userDataTimer?.cancel();
    super.dispose();
  }

  /// The signed-in accounts, each on its [onlineClientOf] client. While
  /// offline the app's own clients respond with the downloaded items only,
  /// and storing that response would delete most of the stored catalog.
  Future<List<ServerUserSession>> _resolveSessions() async => [
    for (final session in MultiServerRepository.sessionsIfMergeable(
      await _loadSessions(),
      minServers: 1,
    ))
      ServerUserSession(
        server: session.server,
        userId: session.userId,
        client: onlineClientOf(session.client),
      ),
  ];

  /// Loads the signed-in accounts' stored catalogs from disk. Safe to call
  /// repeatedly.
  Future<void> ensureLoaded() {
    _entriesWanted = true;
    return _loading ??= _loadOnce(_generation, withEntries: true);
  }

  /// How long a screen waits for the load before showing what it has.
  static const loadGrace = Duration(seconds: 1);

  /// As [ensureLoaded], with false for a load that failed.
  Future<bool> tryEnsureLoaded() async {
    try {
      await ensureLoaded();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Reads only the sync states, no entries: enough for a check.
  Future<void> _ensureStatesLoaded() =>
      _loading ??
      (_statesLoading ??= _loadOnce(_generation, withEntries: false));

  Future<void> _loadOnce(int generation, {required bool withEntries}) async {
    void clearInFlight() {
      if (_isStale(generation)) return;
      if (withEntries) {
        _loading = null;
      } else {
        _statesLoading = null;
      }
    }

    try {
      await _load(generation, withEntries: withEntries);
    } catch (_) {
      // Don't cache the failure, or every later caller gets it.
      clearInFlight();
      rethrow;
    }
    // Nor an empty list, which may be a session store that isn't ready.
    if (!_isStale(generation) && _activeSessions.isEmpty) clearInFlight();
  }

  Future<void> _load(int generation, {required bool withEntries}) async {
    final sessions = await _resolveSessions();
    if (_isStale(generation)) return;
    final sessionsChanged = !_sameAccounts(_activeSessions, sessions);
    _activeSessions = sessions;

    var loadedAny = false;
    try {
      if (withEntries) {
        for (final session in sessions) {
          loadedAny = await _loadAccount(session, generation) || loadedAny;
          if (_isStale(generation)) return;
        }
      }

      final states = await _db.select(_db.catalogSyncStates).get();
      if (_isStale(generation)) return;
      for (final state in states) {
        // A sync that finished meanwhile recorded something newer.
        _syncStates.putIfAbsent(
          (
            serverId: state.serverId,
            userId: state.userId,
            itemType: state.kind,
          ),
          () => (
            checkedAt: state.lastSyncedAt,
            fullReadAt: state.lastFullSyncAt,
            serverTotal: state.serverTotal,
          ),
        );
      }
    } catch (_) {
      // [_activeSessions] did change, whatever failed afterwards.
      if (!_isStale(generation) && (sessionsChanged || loadedAny)) {
        _markChanged(titles: true);
      }
      rethrow;
    }
    // A repeat load that still finds nobody has nothing new to report.
    final changed =
        !_loaded || (withEntries ? sessions.isNotEmpty : sessionsChanged);
    _loaded = true;
    if (withEntries &&
        sessions.every((s) => _entries.containsKey(_accountOf(s)))) {
      _missedUserDataIds.clear();
    }
    if (changed) _markChanged(titles: true);
  }

  /// Returns whether it read anything.
  Future<bool> _loadAccount(ServerUserSession session, int generation) async {
    final account = _accountOf(session);
    if (_entries.containsKey(account)) return false;

    final budget = _FrameBudget(_frameBudget);
    while (true) {
      final writesBefore = _diskWrites[account] ?? 0;
      final entries = <String, UnifiedCatalogEntry>{};
      String? after;
      while (true) {
        final from = after;
        final rows =
            await (_db.select(_db.catalogEntries)
                  ..where(
                    (t) =>
                        t.serverId.equals(account.serverId) &
                        t.userId.equals(account.userId) &
                        (from == null
                            ? const Constant(true)
                            : t.itemId.isBiggerThanValue(from)),
                  )
                  ..orderBy([(t) => OrderingTerm(expression: t.itemId)])
                  ..limit(_diskChunk))
                .get();
        if (_isStale(generation)) return false;
        // A sync that finished while this was reading holds newer entries.
        if (_entries.containsKey(account)) return false;

        for (final row in rows) {
          _rowsDecoded++;
          try {
            final raw = jsonDecode(row.metadataJson);
            if (raw is Map<String, dynamic>) {
              entries[row.itemId] = UnifiedCatalogEntry(
                serverId: row.serverId,
                itemId: row.itemId,
                itemType: row.kind,
                raw: raw,
              );
            }
          } catch (_) {}
          if (budget.isSpent) {
            await budget.yieldToUi();
            if (_isStale(generation)) return false;
          }
        }
        if (rows.length < _diskChunk) break;
        after = rows.last.itemId;
      }
      if (_entries.containsKey(account)) return false;
      // Rows were written during the read, so it mixes old and new.
      if ((_diskWrites[account] ?? 0) != writesBefore) continue;

      _entries[account] = entries;
      for (final itemId in _missedUserDataIds) {
        if (entries.containsKey(itemId)) {
          _userDataQueue[(serverId: account.serverId, itemId: itemId)] = 0;
        }
      }
      _scheduleUserDataFlush(_userDataDebounce);
      return true;
    }
  }

  void _noteDiskWrite(_Account account) {
    if (_entries.containsKey(account)) return;
    _diskWrites[account] = (_diskWrites[account] ?? 0) + 1;
  }

  Future<Map<UnifiedLibraryKind, Set<String>>> _heldIds(
    _Account account,
  ) async {
    final held = <UnifiedLibraryKind, Set<String>>{
      for (final kind in UnifiedLibraryKind.values) kind: {},
    };
    final entries = _entries[account];
    if (entries != null) {
      for (final entry in entries.values) {
        held[UnifiedLibraryKind.fromItemType(entry.itemType)]?.add(
          entry.itemId,
        );
      }
      return held;
    }
    try {
      final table = _db.catalogEntries;
      final rows =
          await (_db.selectOnly(table)
                ..addColumns([table.itemId, table.kind])
                ..where(
                  table.serverId.equals(account.serverId) &
                      table.userId.equals(account.userId),
                ))
              .get();
      for (final row in rows) {
        held[UnifiedLibraryKind.fromItemType(row.read(table.kind))]?.add(
          row.read(table.itemId)!,
        );
      }
    } catch (e) {
      throw _NotSettled(
        'its stored catalog was not read: $e',
        serverAnswered: false,
      );
    }
    return held;
  }

  /// A time after now means the clock moved back, so it counts as older.
  bool _isOlderThan(DateTime? at, Duration limit) {
    if (at == null) return true;
    final age = _now().difference(at);
    return age.isNegative || age >= limit;
  }

  bool _isCheckDue(ServerUserSession session) => UnifiedLibraryKind.values.any(
    (kind) => _isOlderThan(
      _syncStates[_syncStateKey(_accountOf(session), kind)]?.checkedAt,
      _checkInterval,
    ),
  );

  bool _needsFullRead(ServerUserSession session) =>
      UnifiedLibraryKind.values.any(
        (kind) => _isOlderThan(
          _syncStates[_syncStateKey(_accountOf(session), kind)]?.fullReadAt,
          _fullReadInterval,
        ),
      );

  /// Checks the servers once per [reset], without loading entries, and again
  /// on each call until every server has settled. Defers full reads while the
  /// connection is metered. Never throws.
  Future<void> syncOnLaunch() {
    // Called again whenever the accounts change, which is what leaves rows on
    // disk without an account.
    unawaited(pruneStored());
    return _sessionCheck ??= _checkOncePerSession(_generation);
  }

  Future<void> _checkOncePerSession(int generation) async {
    final ran = await _sync(_SyncTrigger.appLaunch);
    if (_isStale(generation)) return;
    final settled =
        ran &&
        _activeSessions.isNotEmpty &&
        _isEnabled() &&
        !_isOffline() &&
        !_fullReadsDeferred &&
        !_activeSessions.any(
          (s) =>
              _unreachableServers.contains(s.server.id) ||
              _unsettledServers.contains(s.server.id),
        );
    if (!settled) _sessionCheck = null;
  }

  /// Brings every server's stored catalog up to date: skips one confirmed
  /// within [_checkInterval], otherwise checks, and does a full read where
  /// needed. Never throws: a server that can't be asked keeps the rows it had.
  Future<void> syncNow() => _sync(_SyncTrigger.libraryOpened);

  /// A full read of every server, unless the device is offline.
  Future<void> forceFullRead() => _sync(_SyncTrigger.userForced);

  /// Whether the sync ran to its end, not whether every server answered.
  Future<bool> _sync(_SyncTrigger trigger) async {
    try {
      // A reset during the load starts over for the new accounts. Syncing
      // before their sync states are loaded would treat every account as
      // never read and give each a full read.
      int generation;
      do {
        generation = _generation;
        await (trigger == _SyncTrigger.appLaunch
            ? _ensureStatesLoaded()
            : ensureLoaded());
      } while (_isStale(generation));
      await _joinOrQueueSync(trigger);
      return true;
    } catch (e) {
      _logger.w('UnifiedCatalog: sync failed: $e');
      return false;
    }
  }

  /// Callers share the running sync. A caller whose [_SyncTrigger] asks for
  /// more than the running sync does queues one sync to run after it.
  Future<void> _joinOrQueueSync(_SyncTrigger trigger) {
    final running = _runningSync;
    if (running == null) return _startSync(trigger);
    if (trigger.index <= _runningSyncTrigger.index) return running;

    final queued = _queuedSync;
    if (queued != null) {
      if (trigger.index > _queuedSyncTrigger.index) {
        _queuedSyncTrigger = trigger;
      }
      return queued;
    }
    _queuedSyncTrigger = trigger;
    return _queuedSync = _syncAfter(running, _generation);
  }

  Future<void> _syncAfter(Future<void> running, int generation) async {
    try {
      await running;
    } catch (_) {}
    if (_isStale(generation)) return;
    _queuedSync = null;
    await _joinOrQueueSync(_queuedSyncTrigger);
  }

  Future<void> _startSync(_SyncTrigger trigger) {
    late final Future<void> run;
    run = _runSync(_generation, trigger).whenComplete(() {
      // After a reset [_runningSync] may already belong to a newer run.
      if (identical(_runningSync, run)) _runningSync = null;
    });
    _runningSyncTrigger = trigger;
    return _runningSync = run;
  }

  Future<void> _runSync(int generation, _SyncTrigger trigger) async {
    if (_isOffline() || !_isEnabled()) return;
    final sessions = await _resolveSessions();
    if (_isStale(generation)) return;
    // May be a session store that isn't ready, which must not empty the disk.
    if (sessions.isEmpty) return;

    final sessionsChanged = !_sameAccounts(_activeSessions, sessions);
    _activeSessions = sessions;
    var loadedAny = false;
    final bool pruned;
    try {
      // Accounts that signed in since the entries were loaded.
      if (_entriesWanted) {
        for (final session in sessions) {
          loadedAny = await _loadAccount(session, generation) || loadedAny;
          if (_isStale(generation)) return;
        }
      }
      pruned = await _prune(sessions);
    } catch (_) {
      if (!_isStale(generation) && (sessionsChanged || loadedAny)) {
        _markChanged(titles: true);
      }
      rethrow;
    }
    if (_isStale(generation)) return;

    final forced = trigger == _SyncTrigger.userForced;
    // A full read is megabytes, too much to spend unasked while metered.
    final allowFullRead = trigger != _SyncTrigger.appLaunch || !_isMetered();
    // Still put off for a server checked too recently to be asked again.
    _fullReadsDeferred = !allowFullRead && sessions.any(_needsFullRead);
    final due = [
      for (final session in sessions)
        // A full read put off while metered doesn't wait for the next check.
        if (forced ||
            _isCheckDue(session) ||
            (allowFullRead && _needsFullRead(session)))
          session,
    ];
    _syncingServers.addAll(due.map((session) => session.server.id));
    if (sessionsChanged || loadedAny || pruned) {
      _markChanged(titles: true);
    } else if (due.isNotEmpty) {
      _notifyProgress();
    }
    if (due.isEmpty) return;

    await mapBounded<ServerUserSession, void>(due, _serverConcurrency, (
      session,
    ) async {
      final serverId = session.server.id;
      final wasUnreachable = _unreachableServers.contains(serverId);
      var outcome = _SyncOutcome.unchanged;
      try {
        outcome = await _bringUpToDate(
          session,
          generation,
          forced: forced,
          allowFullRead: allowFullRead,
        );
        if (!_isStale(generation) && outcome != _SyncOutcome.deferred) {
          _unreachableServers.remove(serverId);
          _unsettledServers.remove(serverId);
        }
      } on _NotSettled catch (e) {
        _logger.w('UnifiedCatalog: ${session.server.name} left as it was: $e');
        if (!_isStale(generation)) {
          _unsettledServers.add(serverId);
          if (e.serverAnswered) _unreachableServers.remove(serverId);
        }
      } catch (e) {
        _logger.w('UnifiedCatalog: ${session.server.name} not read: $e');
        // Going offline part way fails the rest, which says nothing of the
        // server.
        if (!_isStale(generation) && !_isOffline()) {
          _unreachableServers.add(serverId);
        }
      }
      if (_isStale(generation)) return;
      _syncingServers.remove(serverId);
      // Which servers answer decides which copy of a shared title is shown,
      // so a change there changes the merged list too.
      if (outcome == _SyncOutcome.rowsRewritten ||
          outcome == _SyncOutcome.titlesChanged ||
          wasUnreachable != _unreachableServers.contains(serverId)) {
        _markChanged(titles: outcome == _SyncOutcome.titlesChanged);
      } else {
        _notifyProgress();
      }
    });
  }

  /// Checks [session]'s stored catalog, or does a full read when one is due
  /// or the check can't patch it. Without [allowFullRead] a full read is
  /// deferred.
  Future<_SyncOutcome> _bringUpToDate(
    ServerUserSession session,
    int generation, {
    required bool forced,
    required bool allowFullRead,
  }) async {
    final needsFullRead = forced || _needsFullRead(session);
    if (needsFullRead) {
      if (allowFullRead) return _fullRead(session, generation);
      _fullReadsDeferred = true;
      // Nothing is stored yet, so there is nothing to check either.
      if (!_hasBeenSynced(session)) return _SyncOutcome.deferred;
    }
    final checked = await _checkSession(session, generation);
    if (checked != null || _isStale(generation)) {
      return checked ?? _SyncOutcome.unchanged;
    }
    if (!allowFullRead) {
      _fullReadsDeferred = true;
      throw const _NotSettled(
        'it has to be read whole, which waits while the connection is metered',
        serverAnswered: true,
      );
    }
    return _fullRead(session, generation);
  }

  /// Drops the entries of accounts not in [sessions] from memory, and returns
  /// whether any were held. Also prunes the disk, see [_pruneDisk]: an account
  /// missing from [sessions] may only have an unreadable token this once, so
  /// its rows stay on disk for as long as the device holds its sign-in.
  Future<bool> _prune(List<ServerUserSession> sessions) async {
    final inUse = {for (final session in sessions) _accountOf(session)};
    final before = _entries.length;
    _entries.removeWhere((account, _) => !inUse.contains(account));
    final droppedAny = _entries.length != before;
    await _pruneDisk(inUse);
    return droppedAny;
  }

  /// Deletes from disk the rows of accounts the device no longer holds a
  /// sign-in for. Never throws.
  Future<void> pruneStored() async {
    if (_knownAccounts == null) return;
    try {
      await _pruneDisk({
        for (final session in _activeSessions) _accountOf(session),
      });
    } catch (e) {
      _logger.w('UnifiedCatalog: signed-out accounts not deleted: $e');
    }
  }

  Future<void> _pruneDisk(Set<_Account> inUse) async {
    final Set<_Account> keep;
    try {
      keep = {...inUse, ...?_knownAccounts?.call()};
    } catch (e) {
      // Who else is signed in can't be told, so nobody's rows are deleted.
      _logger.w('UnifiedCatalog: stored accounts not read: $e');
      return;
    }
    // Only this service writes these tables, and only for accounts it kept,
    // so an unchanged [keep] leaves nothing new on disk to look for.
    if (const SetEquality<_Account>().equals(_prunedFor, keep)) return;

    final orphaned = await _db.transaction(() async {
      final stored = <_Account>{};
      final states = _db.catalogSyncStates;
      for (final row in await (_db.selectOnly(
        states,
        distinct: true,
      )..addColumns([states.serverId, states.userId])).get()) {
        stored.add((
          serverId: row.read(states.serverId)!,
          userId: row.read(states.userId)!,
        ));
      }
      final entries = _db.catalogEntries;
      for (final row in await (_db.selectOnly(
        entries,
        distinct: true,
      )..addColumns([entries.serverId, entries.userId])).get()) {
        stored.add((
          serverId: row.read(entries.serverId)!,
          userId: row.read(entries.userId)!,
        ));
      }
      final orphaned = stored.difference(keep);
      for (final account in orphaned) {
        await (_db.delete(entries)..where(
              (t) =>
                  t.serverId.equals(account.serverId) &
                  t.userId.equals(account.userId),
            ))
            .go();
        await (_db.delete(states)..where(
              (t) =>
                  t.serverId.equals(account.serverId) &
                  t.userId.equals(account.userId),
            ))
            .go();
      }
      return orphaned;
    });
    for (final account in orphaned) {
      _syncStates.removeWhere(
        (key, _) =>
            key.serverId == account.serverId && key.userId == account.userId,
      );
    }
    _prunedFor = keep;
  }

  /// Whether the server answered with a refusal that asking again won't change.
  static bool _isRefusal(Object error) {
    if (error is! DioException) return false;
    final status = error.response?.statusCode;
    return status != null &&
        status >= 400 &&
        status < 500 &&
        status != 408 &&
        status != 429;
  }

  Future<T> _withRetries<T>(Future<T> Function() request) async {
    for (var attempt = 1; ; attempt++) {
      try {
        return await request().timeout(_pageTimeout);
      } catch (e) {
        if (attempt >= _maxAttempts || _isRefusal(e)) rethrow;
        await Future<void>.delayed(_retryDelay * attempt);
      }
    }
  }

  static List<dynamic> _listOf(Map<String, dynamic> response, String key) {
    final value = response[key];
    return value is List ? value : const [];
  }

  /// Some servers send the count as text.
  static int? _countOf(Object? value) {
    if (value is int) return value;
    if (value is num && value.isFinite) return value.toInt();
    if (value is String) return int.tryParse(value.trim());
    return null;
  }

  /// [value] as a map with string keys, or null when it isn't a map.
  static Map<String, dynamic>? _stringKeyedMapOf(Object? value) {
    if (value is Map<String, dynamic>) return value;
    if (value is! Map) return null;
    try {
      return {
        for (final entry in value.entries) entry.key.toString(): entry.value,
      };
    } catch (_) {
      return null;
    }
  }

  /// A full read of one account, swapped in at the end. A failure part way
  /// throws before anything is replaced, so the last good rows stay.
  Future<_SyncOutcome> _fullRead(
    ServerUserSession session,
    int generation,
  ) async {
    final account = _accountOf(session);
    final patches = _userDataDuringRead[account] = {};
    final removedDuringRead = _removedDuringRead[account] = {};
    final applied = <String>{};
    try {
      return await _fullReadAndStore(
        session,
        generation,
        patches,
        removedDuringRead,
        applied,
      );
    } catch (_) {
      // The read held these patches back from disk and now won't write them.
      if (!_isStale(generation)) {
        unawaited(_persistUserData(account, {...applied, ...patches.keys}));
      }
      rethrow;
    } finally {
      if (identical(_userDataDuringRead[account], patches)) {
        _userDataDuringRead.remove(account);
      }
      if (identical(_removedDuringRead[account], removedDuringRead)) {
        _removedDuringRead.remove(account);
      }
    }
  }

  Future<_SyncOutcome> _fullReadAndStore(
    ServerUserSession session,
    int generation,
    Map<String, Map<String, dynamic>> patches,
    Set<String> removedDuringRead,
    Set<String> applied,
  ) async {
    final account = _accountOf(session);
    var read = await _readAccount(session, generation);
    if (read == null) return _SyncOutcome.unchanged;
    if (await _needsConfirming(account, read)) {
      // See [_maxDroppedShare]. Only a second read saying the same is believed.
      final first = read;
      await Future<void>.delayed(_confirmDelay);
      if (_isStale(generation)) return _SyncOutcome.unchanged;
      read = await _readAccount(session, generation);
      if (read == null) return _SyncOutcome.unchanged;
      if (await _needsConfirming(account, read) && !_sameRead(first, read)) {
        throw const _NotSettled(
          'its libraries are still changing',
          serverAnswered: true,
        );
      }
    }
    if (_isStale(generation)) return _SyncOutcome.unchanged;
    final fetched = read.entries;
    final totals = Map.of(read.totals);

    void applyPatches() {
      for (final MapEntry(key: itemId, value: userData) in patches.entries) {
        final entry = fetched[itemId];
        if (entry != null) fetched[itemId] = entry.withUserData(userData);
        applied.add(itemId);
      }
      patches.clear();
    }

    // Ids removed after the read listed them. The server's count still
    // includes them, so that count is discarded instead of stored.
    final subtracted = <String>{};
    void subtractRemoved() {
      for (final itemId in removedDuringRead.difference(subtracted)) {
        subtracted.add(itemId);
        final entry = fetched.remove(itemId);
        if (entry == null) continue;
        final kind = UnifiedLibraryKind.fromItemType(entry.itemType);
        if (kind != null) totals[kind] = null;
      }
    }

    applyPatches();
    subtractRemoved();
    final held = _entries[account];
    // Entries not in memory can't be compared, so they count as changed.
    var titlesChanged = held == null || held.length != fetched.length;
    final rows = <CatalogEntriesCompanion>[];
    final budget = _FrameBudget(_frameBudget);
    for (final entry in fetched.values) {
      rows.add(
        CatalogEntriesCompanion.insert(
          serverId: account.serverId,
          userId: account.userId,
          itemId: entry.itemId,
          kind: entry.itemType,
          metadataJson: jsonEncode(entry.raw),
        ),
      );
      titlesChanged =
          titlesChanged ||
          !_sameExceptUserData(held?[entry.itemId]?.raw, entry.raw);
      if (budget.isSpent) {
        await budget.yieldToUi();
        if (_isStale(generation)) return _SyncOutcome.unchanged;
      }
    }

    final readAt = _now();
    try {
      // One transaction, so the disk holds the old rows or the new ones,
      // never a mix.
      await _db.transaction(() async {
        await (_db.delete(_db.catalogEntries)..where(
              (t) =>
                  t.serverId.equals(account.serverId) &
                  t.userId.equals(account.userId),
            ))
            .go();
        for (final chunk in rows.slices(_diskChunk)) {
          await _db.batch((batch) {
            batch.insertAll(
              _db.catalogEntries,
              chunk,
              mode: InsertMode.insertOrReplace,
            );
          });
          if (budget.isSpent) {
            await budget.yieldToUi();
            if (_isStale(generation)) throw const _Cancelled();
          }
        }
        await _db.batch((batch) {
          batch.insertAll(_db.catalogSyncStates, [
            for (final kind in UnifiedLibraryKind.values)
              CatalogSyncStatesCompanion.insert(
                serverId: account.serverId,
                userId: account.userId,
                kind: kind.itemType,
                lastSyncedAt: readAt,
                itemCount: Value(
                  fetched.values
                      .where((e) => e.itemType == kind.itemType)
                      .length,
                ),
                serverTotal: Value(totals[kind]),
                lastFullSyncAt: Value(readAt),
              ),
          ], mode: InsertMode.insertOrReplace);
        });
      });
    } on _Cancelled {
      return _SyncOutcome.unchanged;
    } catch (e) {
      throw _NotSettled(
        'its stored catalog was not saved: $e',
        serverAnswered: true,
      );
    }
    if (_isStale(generation)) return _SyncOutcome.unchanged;

    final lateIds = patches.keys.toList();
    applyPatches();
    final lateRemoved = removedDuringRead.difference(subtracted);
    subtractRemoved();
    if (_entriesWanted || _entries.containsKey(account)) {
      _entries[account] = fetched;
    } else {
      // Not kept in memory. A load reading the old rows starts over.
      _noteDiskWrite(account);
    }
    for (final kind in UnifiedLibraryKind.values) {
      _syncStates[_syncStateKey(account, kind)] = (
        checkedAt: readAt,
        fullReadAt: readAt,
        serverTotal: totals[kind],
      );
    }
    if (lateIds.isNotEmpty) unawaited(_persistUserData(account, lateIds));
    // The transaction inserted these after they had been deleted.
    if (lateRemoved.isNotEmpty) unawaited(_deleteRows(account, lateRemoved));
    return titlesChanged
        ? _SyncOutcome.titlesChanged
        : _SyncOutcome.rowsRewritten;
  }

  static bool _isSuspectDrop({required int held, required int dropped}) {
    if (dropped == 0) return false;
    if (dropped == held) return true;
    return dropped > _maxTrustedDrop && dropped > held * _maxDroppedShare;
  }

  /// Whether [read] needs a second read before it replaces the stored rows:
  /// it is a suspect drop, or drops a title on the word of a short listing.
  Future<bool> _needsConfirming(_Account account, _AccountRead read) async {
    final held = await _heldIds(account);
    return UnifiedLibraryKind.values.any((kind) {
      final ids = held[kind]!;
      if (ids.isEmpty) return false;
      final dropped = ids.where((id) => !read.entries.containsKey(id)).length;
      return _isSuspectDrop(held: ids.length, dropped: dropped) ||
          (read.tookShortListing && dropped > 0);
    });
  }

  static bool _sameRead(_AccountRead a, _AccountRead b) =>
      const MapEquality<UnifiedLibraryKind, int?>().equals(
        a.totals,
        b.totals,
      ) &&
      a.entries.length == b.entries.length &&
      a.entries.keys.every(b.entries.containsKey);

  /// Whether two raw items are equal once their user data is left aside.
  static bool _sameExceptUserData(
    Map<String, dynamic>? a,
    Map<String, dynamic> b,
  ) {
    if (a == null || a.length != b.length) return false;
    for (final MapEntry(:key, :value) in a.entries) {
      if (key == 'UserData') continue;
      if (!b.containsKey(key) || !_deepEquality.equals(value, b[key])) {
        return false;
      }
    }
    return true;
  }

  Future<Map<UnifiedLibraryKind, List<String>>> _librariesByKind(
    MediaServerClient client,
  ) async {
    final views = await _withRetries(() => loadVisibleUserViews(client));
    final libraries = <UnifiedLibraryKind, List<String>>{
      for (final kind in UnifiedLibraryKind.values) kind: [],
    };
    for (final view in _listOf(views, 'Items')) {
      if (view is! Map) continue;
      final kind = UnifiedLibraryKind.fromCollectionType(
        view['CollectionType']?.toString(),
      );
      final id = view['Id']?.toString();
      if (kind != null && id != null && id.isNotEmpty) libraries[kind]!.add(id);
    }
    return libraries;
  }

  /// Pages through one library once. Null when the generation changed.
  Future<_Listing?> _walkLibrary(
    MediaServerClient client,
    UnifiedLibraryKind kind,
    String libraryId,
    int generation, {
    required bool idsOnly,
  }) async {
    final pageSize = idsOnly ? _idPageSize : _pageSize;
    final itemsById = <String, Map<String, dynamic>>{};
    int? total;
    var totalsAgreed = true;
    var startIndex = 0;
    while (true) {
      final offset = startIndex;
      final Map<String, dynamic> response;
      try {
        response = await _withRetries(() async {
          final page = await client.itemsApi.getItems(
            parentId: libraryId,
            includeItemTypes: [kind.itemType],
            recursive: true,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            startIndex: offset,
            limit: pageSize,
            fields: idsOnly ? null : _fields,
            enableImageTypes: idsOnly ? null : _imageTypes,
            imageTypeLimit: idsOnly ? null : 1,
            enableTotalRecordCount: true,
            enableUserData: idsOnly ? false : null,
            enableImages: idsOnly ? false : null,
          );
          // An empty page before the count is reached is usually the server
          // giving up, so it is retried like a failed request.
          final count = _countOf(page['TotalRecordCount']);
          if (_listOf(page, 'Items').isEmpty &&
              count != null &&
              offset < count) {
            throw _ShortListing(offset, count);
          }
          return page;
        });
      } on _ShortListing catch (e) {
        if (_isStale(generation)) return null;
        return _Listing(
          itemsById,
          total: e.total,
          endedShort: true,
          totalsAgreed: totalsAgreed,
        );
      }
      if (_isStale(generation)) return null;
      final items = _listOf(response, 'Items');
      for (final item in items) {
        final raw = _stringKeyedMapOf(item);
        final id = raw?['Id']?.toString();
        if (raw != null && id != null && id.isNotEmpty) {
          itemsById.putIfAbsent(id, () => raw);
        }
      }
      startIndex += items.length;
      final count = _countOf(response['TotalRecordCount']);
      if (count != null) {
        if (total != null && total != count) totalsAgreed = false;
        total = count;
      }
      if (items.isEmpty ||
          (count != null ? startIndex >= count : items.length < pageSize)) {
        return _Listing(
          itemsById,
          total: total ?? itemsById.length,
          endedShort: false,
          totalsAgreed: totalsAgreed,
        );
      }
    }
  }

  /// One library in full with the server's count. Null when the generation
  /// changed. A walk that isn't whole is repeated once, and two walks listing
  /// the same titles are accepted whatever the count says, or a server with a
  /// wrong count would never be read. Throws when the second ends short
  /// without matching the first.
  Future<({_Listing listing, int? total, bool endedShort})?> _readLibrary(
    MediaServerClient client,
    UnifiedLibraryKind kind,
    String libraryId,
    int generation,
  ) async {
    final first = await _walkLibrary(
      client,
      kind,
      libraryId,
      generation,
      idsOnly: false,
    );
    if (first == null) return null;
    if (first.isWhole) {
      return (listing: first, total: first.total, endedShort: false);
    }

    final second = await _walkLibrary(
      client,
      kind,
      libraryId,
      generation,
      idsOnly: false,
    );
    if (second == null) return null;
    if (second.isWhole || second.sameTitlesAs(first)) {
      return (
        listing: second,
        total: second.total,
        endedShort: second.endedShort,
      );
    }
    if (second.endedShort) {
      throw StateError(
        'library ended at ${second.itemsById.length} of the ${second.total} it '
        'counted',
      );
    }
    // Still changing. With no count recorded, the next check lists the ids
    // and settles what was missed.
    return (listing: second, total: null, endedShort: false);
  }

  UnifiedCatalogEntry? _toEntry(
    String serverId,
    UnifiedLibraryKind kind,
    Map<String, dynamic> raw,
  ) {
    final id = raw['Id']?.toString();
    if (id == null || id.isEmpty) return null;
    return UnifiedCatalogEntry(
      serverId: serverId,
      itemId: id,
      itemType: kind.itemType,
      // Readers expect a String id, and not every server sends one.
      raw: raw['Id'] is String ? raw : {...raw, 'Id': id},
    );
  }

  /// Null when the generation changed.
  Future<_AccountRead?> _readAccount(
    ServerUserSession session,
    int generation,
  ) async {
    final client = session.client;
    final libraries = await _librariesByKind(client);

    // A title in two of the server's libraries is kept once.
    final fetched = <String, UnifiedCatalogEntry>{};
    final totals = <UnifiedLibraryKind, int?>{};
    var tookShortListing = false;
    for (final kind in UnifiedLibraryKind.values) {
      int? total = 0;
      for (final libraryId in libraries[kind]!) {
        final read = await _readLibrary(client, kind, libraryId, generation);
        if (read == null) return null;
        for (final raw in read.listing.itemsById.values) {
          final entry = _toEntry(session.server.id, kind, raw);
          if (entry != null) fetched.putIfAbsent(entry.itemId, () => entry);
        }
        tookShortListing = tookShortListing || read.endedShort;
        final counted = read.total;
        total = total == null || counted == null ? null : total + counted;
      }
      totals[kind] = total;
    }
    return (
      entries: fetched,
      totals: totals,
      tookShortListing: tookShortListing,
    );
  }

  /// Compares the server's counts with the last sync and patches the stored
  /// rows by id where they differ. Null means they can't be patched and need
  /// a full read. Throws, before changing anything, when the server can't be
  /// asked.
  Future<_SyncOutcome?> _checkSession(
    ServerUserSession session,
    int generation,
  ) async {
    final account = _accountOf(session);
    final removedDuringCheck = _removedDuringCheck[account] = {};
    final userDataRevision = _userDataSync.revision;
    try {
      return await _checkAndStore(
        session,
        generation,
        removedDuringCheck,
        userDataRevision,
      );
    } finally {
      if (identical(_removedDuringCheck[account], removedDuringCheck)) {
        _removedDuringCheck.remove(account);
      }
    }
  }

  Future<_SyncOutcome?> _checkAndStore(
    ServerUserSession session,
    int generation,
    Set<String> removedDuringCheck,
    int userDataRevision,
  ) async {
    final account = _accountOf(session);
    final client = session.client;
    final libraries = await _librariesByKind(client);
    if (_isStale(generation)) return _SyncOutcome.unchanged;

    final totals = <UnifiedLibraryKind, int>{};
    final heldAfter = <UnifiedLibraryKind, int>{};
    final droppedIds = <String>{};
    final addedEntries = <UnifiedCatalogEntry>[];
    Map<UnifiedLibraryKind, Set<String>>? heldIds;
    for (final kind in UnifiedLibraryKind.values) {
      final counted = await _countServerItems(client, kind, libraries[kind]!);
      if (_isStale(generation)) return _SyncOutcome.unchanged;
      if (counted == null) return null;
      if (counted == _syncStates[_syncStateKey(account, kind)]?.serverTotal) {
        continue;
      }

      final listed = <String>{};
      var total = 0;
      for (final libraryId in libraries[kind]!) {
        var listing = await _walkLibrary(
          client,
          kind,
          libraryId,
          generation,
          idsOnly: true,
        );
        if (listing != null && !listing.isWhole) {
          listing = await _walkLibrary(
            client,
            kind,
            libraryId,
            generation,
            idsOnly: true,
          );
        }
        if (listing == null) return _SyncOutcome.unchanged;
        // Titles are deleted on the word of this list, so one that isn't
        // whole is not acted on.
        if (!listing.isWhole) return null;
        listed.addAll(listing.itemsById.keys);
        total += listing.total;
      }

      final held = (heldIds ??= await _heldIds(account))[kind]!;
      if (_isStale(generation)) return _SyncOutcome.unchanged;
      final missingIds = listed.difference(held);
      final droppedOfKind = held.difference(listed);
      // See [_maxDroppedShare]. The full read asks twice before believing it.
      if (_isSuspectDrop(held: held.length, dropped: droppedOfKind.length)) {
        return null;
      }
      if (missingIds.length > held.length * _maxMissingShare) return null;

      final fetched = await _fetchEntries(
        session,
        kind,
        missingIds,
        generation,
      );
      if (fetched == null) return _SyncOutcome.unchanged;
      // A title listed a moment ago that the server won't hand over.
      if (fetched.length != missingIds.length) return null;

      totals[kind] = total;
      heldAfter[kind] = held.length - droppedOfKind.length + fetched.length;
      droppedIds.addAll(droppedOfKind);
      addedEntries.addAll(fetched);
    }
    return _storeCheckResult(
      account,
      generation,
      totals: totals,
      heldAfter: heldAfter,
      droppedIds: droppedIds,
      addedEntries: addedEntries,
      heldIds: heldIds ?? const {},
      removedDuringCheck: removedDuringCheck,
      userDataRevision: userDataRevision,
    );
  }

  Future<int?> _countServerItems(
    MediaServerClient client,
    UnifiedLibraryKind kind,
    List<String> libraryIds,
  ) async {
    var sum = 0;
    for (final libraryId in libraryIds) {
      final response = await _withRetries(
        () => client.itemsApi.getItems(
          parentId: libraryId,
          includeItemTypes: [kind.itemType],
          recursive: true,
          limit: 1,
          enableTotalRecordCount: true,
          enableUserData: false,
          enableImages: false,
        ),
      );
      final total = _countOf(response['TotalRecordCount']);
      if (total == null) return null;
      sum += total;
    }
    return sum;
  }

  /// Null when the generation changed. An id the server doesn't return is
  /// left out for the caller to notice.
  Future<List<UnifiedCatalogEntry>?> _fetchEntries(
    ServerUserSession session,
    UnifiedLibraryKind kind,
    Set<String> ids,
    int generation,
  ) async {
    final entries = <String, UnifiedCatalogEntry>{};
    for (final chunk in ids.toList().slices(_fetchByIdChunk)) {
      final response = await _withRetries(
        () => session.client.itemsApi.getItems(
          ids: chunk,
          fields: _fields,
          enableImageTypes: _imageTypes,
          imageTypeLimit: 1,
          recursive: true,
          limit: chunk.length,
          enableTotalRecordCount: false,
        ),
      );
      if (_isStale(generation)) return null;
      for (final item in _listOf(response, 'Items')) {
        final raw = _stringKeyedMapOf(item);
        if (raw == null) continue;
        final entry = _toEntry(session.server.id, kind, raw);
        if (entry != null && ids.contains(entry.itemId)) {
          entries[entry.itemId] = entry;
        }
      }
    }
    return entries.values.toList();
  }

  /// Writes what a check found: deletes [droppedIds] and inserts
  /// [addedEntries]. [heldAfter] is the row count per kind afterwards. Never
  /// rewrites a row already held, so unlike a full read it needs no
  /// [_userDataDuringRead]. A title [removeCopy] dropped since the check began
  /// is left out, and user data reported since [userDataRevision] for an
  /// added title is asked for again, as it came after the fetch. [heldIds] is
  /// what [heldAfter] was counted from.
  Future<_SyncOutcome> _storeCheckResult(
    _Account account,
    int generation, {
    required Map<UnifiedLibraryKind, int> totals,
    required Map<UnifiedLibraryKind, int> heldAfter,
    required Set<String> droppedIds,
    required List<UnifiedCatalogEntry> addedEntries,
    required Map<UnifiedLibraryKind, Set<String>> heldIds,
    required Set<String> removedDuringCheck,
    required int userDataRevision,
  }) async {
    // The server's count still holds a title removed here, so it is
    // forgotten and the next check lists the ids again.
    final forgottenTotals = <UnifiedLibraryKind>{};
    if (removedDuringCheck.isNotEmpty) {
      heldAfter = {...heldAfter};
      void forget(UnifiedLibraryKind? kind) {
        if (kind == null || !heldAfter.containsKey(kind)) return;
        heldAfter[kind] = heldAfter[kind]! - 1;
        forgottenTotals.add(kind);
      }

      for (final entry in addedEntries) {
        if (removedDuringCheck.contains(entry.itemId)) {
          forget(UnifiedLibraryKind.fromItemType(entry.itemType));
        }
      }
      // A title held when its ids were read is still counted in [heldAfter],
      // unless the server's list dropped it too. Additions are never held.
      for (final itemId in removedDuringCheck) {
        if (droppedIds.contains(itemId)) continue;
        for (final kind in totals.keys) {
          if (heldIds[kind]?.contains(itemId) ?? false) forget(kind);
        }
      }
      addedEntries = [
        for (final entry in addedEntries)
          if (!removedDuringCheck.contains(entry.itemId)) entry,
      ];
    }
    final checkedAt = _now();
    try {
      await _db.transaction(() async {
        for (final chunk in droppedIds.toList().slices(_deleteChunk)) {
          await (_db.delete(_db.catalogEntries)..where(
                (t) =>
                    t.serverId.equals(account.serverId) &
                    t.userId.equals(account.userId) &
                    t.itemId.isIn(chunk),
              ))
              .go();
        }
        await _db.batch((batch) {
          batch.insertAll(_db.catalogEntries, [
            for (final entry in addedEntries)
              CatalogEntriesCompanion.insert(
                serverId: account.serverId,
                userId: account.userId,
                itemId: entry.itemId,
                kind: entry.itemType,
                metadataJson: jsonEncode(entry.raw),
              ),
          ], mode: InsertMode.insertOrReplace);
          for (final kind in UnifiedLibraryKind.values) {
            final total = totals[kind];
            batch.update(
              _db.catalogSyncStates,
              CatalogSyncStatesCompanion(
                lastSyncedAt: Value(checkedAt),
                serverTotal: forgottenTotals.contains(kind)
                    ? const Value(null)
                    : total == null
                    ? const Value.absent()
                    : Value(total),
                itemCount: total == null
                    ? const Value.absent()
                    : Value(heldAfter[kind] ?? 0),
              ),
              where: (t) =>
                  t.serverId.equals(account.serverId) &
                  t.userId.equals(account.userId) &
                  t.kind.equals(kind.itemType),
            );
          }
        });
      });
    } catch (e) {
      throw _NotSettled(
        'its stored catalog was not saved: $e',
        serverAnswered: true,
      );
    }
    if (_isStale(generation)) return _SyncOutcome.unchanged;

    var titlesChanged = addedEntries.isNotEmpty;
    final entries = _entries[account];
    if (entries == null) {
      if (droppedIds.isNotEmpty || addedEntries.isNotEmpty) {
        _noteDiskWrite(account);
      }
      titlesChanged = titlesChanged || droppedIds.isNotEmpty;
    } else {
      for (final itemId in droppedIds) {
        titlesChanged = entries.remove(itemId) != null || titlesChanged;
      }
      for (final entry in addedEntries) {
        // Removed while the rows were being written.
        if (removedDuringCheck.contains(entry.itemId)) continue;
        entries[entry.itemId] = entry;
      }
      // These weren't in [entries] when [_onUserDataChanged] looked.
      final changed = _userDataSync.changedSince(userDataRevision).toSet();
      for (final entry in addedEntries) {
        if (!changed.contains(entry.itemId) ||
            !entries.containsKey(entry.itemId)) {
          continue;
        }
        _userDataQueue[(serverId: account.serverId, itemId: entry.itemId)] = 0;
      }
      _scheduleUserDataFlush(_userDataDebounce);
    }
    for (final kind in UnifiedLibraryKind.values) {
      final key = _syncStateKey(account, kind);
      final state = _syncStates[key];
      if (state == null) continue;
      _syncStates[key] = (
        checkedAt: checkedAt,
        fullReadAt: state.fullReadAt,
        serverTotal: forgottenTotals.contains(kind)
            ? null
            : totals[kind] ?? state.serverTotal,
      );
    }
    return titlesChanged ? _SyncOutcome.titlesChanged : _SyncOutcome.unchanged;
  }

  /// Read from the stored counts alone, so it doesn't need [ensureLoaded].
  Future<Set<UnifiedLibraryKind>> kindsHeldBy(String serverId) async {
    final userIds = [
      for (final session in await _resolveSessions())
        if (session.server.id == serverId) session.userId,
    ];
    if (userIds.isEmpty) return const {};
    final states =
        await (_db.select(_db.catalogSyncStates)..where(
              (t) =>
                  t.serverId.equals(serverId) &
                  t.userId.isIn(userIds) &
                  t.itemCount.isBiggerThanValue(0),
            ))
            .get();
    return {
      for (final kind in UnifiedLibraryKind.values)
        if (states.any((state) => state.kind == kind.itemType)) kind,
    };
  }

  /// Decides which copy of a shared title is shown: the active server's first.
  List<UnifiedServerInfo> _serversByPreference(String? activeServerId) => [
    for (final session in [
      ..._activeSessions.where((s) => s.server.id == activeServerId),
      ..._activeSessions.where((s) => s.server.id != activeServerId),
    ])
      UnifiedServerInfo(
        id: session.server.id,
        name: session.server.name,
        reachable: !_unreachableServers.contains(session.server.id),
      ),
  ];

  /// Cached: merging is too slow to repeat per page or user data change.
  _MergedLibrary _mergedLibrary(UnifiedLibraryKind kind) {
    final activeServerId = _activeServerId();
    final cached = _mergedLibraries[kind];
    if (cached != null &&
        cached.mergeRevision == _mergeRevision &&
        cached.activeServerId == activeServerId) {
      return cached;
    }
    final order = UnifiedServerOrder(_serversByPreference(activeServerId));
    return _mergedLibraries[kind] = _MergedLibrary(
      groupCatalogEntries(
        _entries.values.expand((entries) => entries.values),
        itemType: kind.itemType,
        order: order,
      ),
      order,
      mergeRevision: _mergeRevision,
      activeServerId: activeServerId,
    );
  }

  /// Titles never merge across kinds, so several kinds are concatenated.
  List<Map<String, dynamic>> _mergedItems(Iterable<UnifiedLibraryKind> kinds) =>
      kinds.length == 1
      ? _mergedLibrary(kinds.single).items
      : [for (final kind in kinds) ..._mergedLibrary(kind).items];

  /// [query]'s results as they stand now, for a caller that pages.
  UnifiedCatalogSnapshot snapshot(
    UnifiedLibraryKind kind,
    UnifiedCatalogQuery query, {
    Random? random,
  }) => snapshotOf([kind], query, random: random);

  /// [snapshot] over several [kinds] in one list, sorted and paged as one.
  UnifiedCatalogSnapshot snapshotOf(
    Iterable<UnifiedLibraryKind> kinds,
    UnifiedCatalogQuery query, {
    Random? random,
  }) => UnifiedCatalogSnapshot._(
    filterAndSortCatalog(_mergedItems(kinds), query, random: random),
    revision: _revision,
    titlesRevision: _titlesRevision,
  );

  /// Reads the catalog afresh on each call. To page, hold a [snapshot].
  Map<String, dynamic> query(
    UnifiedLibraryKind kind,
    UnifiedCatalogQuery query, {
    int startIndex = 0,
    int? limit,
    Random? random,
  }) => snapshot(
    kind,
    query,
    random: random,
  ).page(startIndex: startIndex, limit: limit);

  /// The merged item that [serverId]'s copy [itemId] belongs to, or null when
  /// that copy isn't held.
  Map<String, dynamic>? currentItem(
    UnifiedLibraryKind kind,
    String serverId,
    String itemId,
  ) => _mergedLibrary(kind).itemOf((serverId: serverId, itemId: itemId));

  /// Every copy held of [entry]'s title, [entry]'s own included when held.
  /// Empty until [ensureLoaded] has run.
  List<UnifiedCatalogEntry> copiesOf(UnifiedCatalogEntry entry) {
    final kind = UnifiedLibraryKind.fromItemType(entry.itemType);
    return kind == null ? const [] : _mergedLibrary(kind).copiesOf(entry);
  }

  bool isReachable(String serverId) => !_unreachableServers.contains(serverId);

  /// The copies whose user data is all that changed after [revision], or null
  /// when more did and every item has to be looked at again.
  Set<UnifiedCopyRef>? userDataChangedSince(int revision) {
    if (revision < _userDataChangesSinceRevision) return null;
    return {
      for (final MapEntry(key: copy, value: changedAt)
          in _userDataChanges.entries)
        if (changedAt > revision) copy,
    };
  }

  QueryFilterValues facets(
    UnifiedLibraryKind kind, {
    bool Function(Map<String, dynamic> item)? where,
  }) => facetsOf([kind], where: where);

  QueryFilterValues facetsOf(
    Iterable<UnifiedLibraryKind> kinds, {
    bool Function(Map<String, dynamic> item)? where,
  }) {
    final items = _mergedItems(kinds);
    return catalogFacets(
      where == null ? items : items.where(where),
      genreSpellings: _genreSpellings(),
    );
  }

  /// Each genre as the first server holding it writes it, by [genreNameKey].
  /// Cached like the merged lists: it reads every entry, and a change to a
  /// genre or to the order of the servers rebuilds those too.
  Map<String, String> _genreSpellings() {
    final cached = _genreSpellingsCache;
    if (cached != null && cached.mergeRevision == _mergeRevision) {
      return cached.spellings;
    }
    final spellings = <String, String>{};
    for (final session in _activeSessions) {
      for (final entry in _entries[_accountOf(session)]?.values ??
              const <UnifiedCatalogEntry>[]) {
        final genres = entry.raw['Genres'];
        if (genres is! List) continue;
        for (final genre in genres) {
          final name = genre?.toString().trim() ?? '';
          if (name.isNotEmpty) {
            spellings.putIfAbsent(genreNameKey(name), () => name);
          }
        }
      }
    }
    _genreSpellingsCache = (
      spellings: spellings,
      mergeRevision: _mergeRevision,
    );
    return spellings;
  }

  /// The genres of [kinds], same names folded into one.
  List<UnifiedGenre> genres(Iterable<UnifiedLibraryKind> kinds) =>
      catalogGenres(_mergedItems(kinds), spellings: _genreSpellings());

  /// A change is published under the item id alone, and servers can hand out
  /// the same ids, so each server holding that id is asked what it has.
  void _onUserDataChanged() {
    if (_disposed) return;
    final seen = _userDataRevisionSeen;
    _userDataRevisionSeen = _userDataSync.revision;
    final changed = _userDataSync.changedSince(seen);
    for (final itemId in changed) {
      for (final MapEntry(key: account, value: entries) in _entries.entries) {
        if (entries.containsKey(itemId)) {
          _userDataQueue[(serverId: account.serverId, itemId: itemId)] = 0;
        }
      }
    }
    if (!_loaded ||
        _activeSessions.any((s) => !_entries.containsKey(_accountOf(s)))) {
      _missedUserDataIds.addAll(changed);
      while (_missedUserDataIds.length > _maxMissedUserData) {
        _missedUserDataIds.remove(_missedUserDataIds.first);
      }
    }
    _scheduleUserDataFlush(_userDataDebounce);
  }

  void _scheduleUserDataFlush(Duration delay) {
    if (_userDataQueue.isEmpty) return;
    _userDataTimer ??= Timer(delay, () {
      _userDataTimer = null;
      unawaited(_flushUserData());
    });
  }

  Future<void> _flushUserData() async {
    final generation = _generation;
    final asked = Map.of(_userDataQueue);
    _userDataQueue.clear();
    await refreshUserData(asked.keys);
    if (_isStale(generation)) return;

    // A change can be published before the server has recorded it, and the
    // server then responds with the old user data. Retry each copy until
    // its own entry carries the change.
    for (final MapEntry(key: copy, value: retries) in asked.entries) {
      if (retries >= _maxUserDataRetries ||
          _userDataAlreadyApplied(copy)) {
        continue;
      }
      _userDataQueue.putIfAbsent(copy, () => retries + 1);
    }
    _scheduleUserDataFlush(_userDataRetryDelay);
  }

  /// Whether [copy]'s held entry already carries the change that
  /// [UserDataSync] published under its id: applying the change to it alters
  /// nothing. Another server's entry under the same id doesn't count; it can
  /// be up to date while this one is still waiting for its server.
  bool _userDataAlreadyApplied(UnifiedCopyRef copy) {
    for (final MapEntry(key: account, value: entries) in _entries.entries) {
      if (account.serverId != copy.serverId) continue;
      final entry = entries[copy.itemId];
      if (entry == null) continue;
      final item = AggregatedItem(
        id: copy.itemId,
        serverId: entry.serverId,
        rawData: entry.raw,
      );
      if (!identical(_userDataSync.apply(item), item)) return false;
    }
    // Also when the copy is no longer held: there is nothing left to refresh.
    return true;
  }

  /// Asks each server for the user data of its own [copies] and applies it.
  /// A server that can't be asked keeps what it had.
  Future<void> refreshUserData(Iterable<UnifiedCopyRef> copies) async {
    if (_isOffline()) return;
    final byServer = <String, Set<String>>{};
    for (final copy in copies) {
      byServer.putIfAbsent(copy.serverId, () => {}).add(copy.itemId);
    }
    final generation = _generation;
    await Future.wait([
      for (final session in _activeSessions)
        if (byServer[session.server.id] case final ids?)
          _refreshServerUserData(session, ids.toList(), generation),
    ]);
  }

  /// Refreshes the series behind [itemIds]. A watched episode is published
  /// under its own id and its season's, never the series that counts it; ids a
  /// server holds a copy under are left to [_onUserDataChanged]. False when a
  /// server couldn't be asked, so the caller can try again later.
  Future<bool> refreshSeriesOf(Iterable<String> itemIds) async {
    final ids = {
      for (final id in itemIds)
        if (id.isNotEmpty) id,
    };
    if (ids.isEmpty) return true;
    if (!_loaded || _isOffline()) return false;
    final generation = _generation;
    final results = await Future.wait([
      for (final session in _activeSessions)
        _refreshSeriesOf(session, ids, generation),
    ]);
    return results.every((complete) => complete);
  }

  Future<bool> _refreshSeriesOf(
    ServerUserSession session,
    Set<String> itemIds,
    int generation,
  ) async {
    final entries = _entries[_accountOf(session)];
    if (entries == null) return true;
    final asked = [
      for (final id in itemIds)
        if (!entries.containsKey(id)) id,
    ];
    final series = <String>{};
    var complete = true;
    for (final chunk in asked.slices(_userDataChunk)) {
      try {
        final response = await session.client.itemsApi
            .getItems(
              ids: chunk,
              recursive: true,
              limit: chunk.length,
              enableTotalRecordCount: false,
              enableUserData: false,
              enableImages: false,
            )
            .timeout(_pageTimeout);
        if (_isStale(generation)) return false;
        for (final raw in _listOf(response, 'Items')) {
          if (raw is! Map) continue;
          final seriesId = raw['SeriesId']?.toString();
          if (seriesId != null && entries.containsKey(seriesId)) {
            series.add(seriesId);
          }
        }
      } catch (e) {
        _logger.w(
          'UnifiedCatalog: watched series of ${session.server.name} not '
          'found: $e',
        );
        complete = false;
      }
    }
    if (series.isEmpty) return complete;
    final refreshed = await _refreshServerUserData(
      session,
      series.toList(),
      generation,
    );
    return refreshed && complete;
  }

  Future<bool> _refreshServerUserData(
    ServerUserSession session,
    List<String> ids,
    int generation,
  ) async {
    var complete = true;
    for (var start = 0; start < ids.length; start += _userDataChunk) {
      final chunk = ids.sublist(start, min(start + _userDataChunk, ids.length));
      try {
        final response = await session.client.itemsApi
            .getItems(
              ids: chunk,
              fields: 'UserData',
              recursive: true,
              limit: chunk.length,
              enableTotalRecordCount: false,
            )
            .timeout(_pageTimeout);
        if (_isStale(generation)) return false;
        final userDataById = <String, Map<String, dynamic>>{};
        for (final raw in _listOf(response, 'Items')) {
          if (raw is! Map) continue;
          final id = raw['Id']?.toString();
          final userData = _stringKeyedMapOf(raw['UserData']);
          if (id == null || id.isEmpty || userData == null) continue;
          userDataById[id] = userData;
        }
        applyUserData(session.server.id, userDataById);
      } catch (e) {
        _logger.w(
          'UnifiedCatalog: watched state of ${session.server.name} not read: $e',
        );
        complete = false;
      }
    }
    return complete;
  }

  /// Applies [serverId]'s user data to its own copy, by item id. Another
  /// server's item under the same id is left alone.
  void applyUserData(
    String serverId,
    Map<String, Map<String, dynamic>> userDataByItemId,
  ) {
    final changed = <UnifiedCopyRef>[];
    for (final MapEntry(key: account, value: entries) in _entries.entries) {
      if (account.serverId != serverId) continue;
      final written = <String>[];
      for (final MapEntry(key: itemId, value: userData)
          in userDataByItemId.entries) {
        final entry = entries[itemId];
        if (entry == null ||
            _deepEquality.equals(entry.raw['UserData'], userData)) {
          continue;
        }
        final patched = entries[itemId] = entry.withUserData(userData);
        _remergeTitleOf(patched);
        written.add(itemId);
        changed.add((serverId: serverId, itemId: itemId));
      }
      if (written.isEmpty) continue;
      final heldForRead = _userDataDuringRead[account];
      if (heldForRead != null) {
        // The full read in flight rewrites every row with the older user data
        // it fetched. It reapplies these first.
        for (final itemId in written) {
          heldForRead[itemId] = userDataByItemId[itemId]!;
        }
      } else {
        unawaited(_persistUserData(account, written));
      }
    }
    if (changed.isNotEmpty) _markChanged(userDataOf: changed);
  }

  /// Merges the title [entry] is a copy of again, in every merged library
  /// that is still current.
  void _remergeTitleOf(UnifiedCatalogEntry entry) {
    for (final merged in _mergedLibraries.values) {
      // A stale one is rebuilt when it is next asked for.
      if (merged.mergeRevision == _mergeRevision) merged.replace(entry);
    }
  }

  Future<void> _persistUserData(
    _Account account,
    Iterable<String> itemIds,
  ) async {
    final entries = [for (final itemId in itemIds) ?_entries[account]?[itemId]];
    if (entries.isEmpty) return;
    try {
      await _db.batch((batch) {
        for (final entry in entries) {
          batch.update(
            _db.catalogEntries,
            CatalogEntriesCompanion(metadataJson: Value(jsonEncode(entry.raw))),
            where: (t) =>
                t.serverId.equals(account.serverId) &
                t.userId.equals(account.userId) &
                t.itemId.equals(entry.itemId),
          );
        }
      });
    } catch (e) {
      _logger.w('UnifiedCatalog: watched state not saved: $e');
    }
  }

  /// Drops one server's copy of a title that the server itself said is gone.
  /// The caller must know the answer came from the server: the app's offline
  /// clients say the same of every title not downloaded. Never throws.
  Future<void> removeCopy(String serverId, String itemId) async {
    if (_isOffline()) return;
    if (!_loaded) {
      // [_activeSessions] isn't populated until the first load.
      try {
        await _ensureStatesLoaded();
      } catch (e) {
        _logger.w('UnifiedCatalog: removed title not deleted: $e');
        return;
      }
    }
    // Only accounts in use. Another profile's rows are left to its own sync.
    final accounts = {
      for (final session in _activeSessions)
        if (session.server.id == serverId) _accountOf(session),
    };
    var removedAny = false;
    for (final account in accounts) {
      final entry = _entries[account]?.remove(itemId);
      _userDataDuringRead[account]?.remove(itemId);
      _removedDuringRead[account]?.add(itemId);
      _removedDuringCheck[account]?.add(itemId);
      if (entry == null) continue;
      removedAny = true;
      _forgetServerTotal(account, entry.itemType);
    }
    if (removedAny) _markChanged(titles: true);
    await Future.wait([
      for (final account in accounts) _deleteRows(account, [itemId]),
    ]);
  }

  /// The server's count included the removed title, so it is forgotten and
  /// the next check lists ids instead of trusting it.
  void _forgetServerTotal(_Account account, String itemType) {
    final key = (
      serverId: account.serverId,
      userId: account.userId,
      itemType: itemType,
    );
    final state = _syncStates[key];
    if (state == null) return;
    _syncStates[key] = (
      checkedAt: state.checkedAt,
      fullReadAt: state.fullReadAt,
      serverTotal: null,
    );
  }

  /// Also adjusts the sync state, in the same transaction. Never throws.
  Future<void> _deleteRows(_Account account, Iterable<String> itemIds) async {
    try {
      final entries = _db.catalogEntries;
      final states = _db.catalogSyncStates;
      final deleted = await _db.transaction(() async {
        final countByItemType = <String, int>{};
        for (final chunk in itemIds.toList().slices(_deleteChunk)) {
          final mine =
              entries.serverId.equals(account.serverId) &
              entries.userId.equals(account.userId) &
              entries.itemId.isIn(chunk);
          final rows =
              await (_db.selectOnly(entries)
                    ..addColumns([entries.kind])
                    ..where(mine))
                  .get();
          for (final row in rows) {
            final itemType = row.read(entries.kind)!;
            countByItemType[itemType] = (countByItemType[itemType] ?? 0) + 1;
          }
          if (rows.isNotEmpty) {
            await (_db.delete(entries)..where((_) => mine)).go();
          }
        }
        for (final MapEntry(key: itemType, value: count)
            in countByItemType.entries) {
          await (_db.update(states)..where(
                (t) =>
                    t.serverId.equals(account.serverId) &
                    t.userId.equals(account.userId) &
                    t.kind.equals(itemType),
              ))
              .write(
                CatalogSyncStatesCompanion.custom(
                  itemCount: states.itemCount - Constant(count),
                  serverTotal: const Constant<int>(null),
                ),
              );
        }
        return countByItemType;
      });
      if (deleted.isEmpty) return;
      _noteDiskWrite(account);
      // A load that read the rows before they were deleted may have finished
      // since, and holds them still.
      final loaded = _entries[account];
      if (loaded != null) {
        var removedAny = false;
        for (final itemId in itemIds) {
          removedAny = loaded.remove(itemId) != null || removedAny;
        }
        if (removedAny) _markChanged(titles: true);
      }
      for (final itemType in deleted.keys) {
        _forgetServerTotal(account, itemType);
      }
    } catch (e) {
      _logger.w('UnifiedCatalog: removed title not deleted: $e');
    }
  }
}
