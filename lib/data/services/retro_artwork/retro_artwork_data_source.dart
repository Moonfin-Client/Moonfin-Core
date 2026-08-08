import 'dart:async';
import 'dart:collection';

import 'package:server_core/server_core.dart';

import 'retro_artwork_activity_gate.dart';
import 'retro_artwork_cache.dart';
import 'retro_artwork_transport.dart';

/// Selects the artwork protocol once for a particular authenticated server
/// session. A new login, user, token, or server URL deliberately gets a fresh
/// capability lookup even when the [MediaServerClient] object is reused.
class RetroArtworkDataSourceFactory {
  RetroArtworkDataSourceFactory._();

  static final Expando<_CapabilityCacheEntry> _capabilityCache =
      Expando<_CapabilityCacheEntry>('retroArtworkCapabilities');
  static final Set<RetroArtworkDataSource> _activeDataSources =
      <RetroArtworkDataSource>{};

  static void notifyAppResumed() {
    for (final dataSource in List<RetroArtworkDataSource>.of(
      _activeDataSources,
    )) {
      dataSource.onAppResumed();
    }
  }

  static T _track<T extends RetroArtworkDataSource>(T dataSource) {
    _activeDataSources.add(dataSource);
    return dataSource;
  }

  static void _untrack(RetroArtworkDataSource dataSource) {
    _activeDataSources.remove(dataSource);
  }

  static Future<RetroArtworkDataSource?> create({
    required MediaServerClient client,
    required RetroArtworkActivityGate activityGate,
    required RetroArtworkTransport transport,
    Duration priorityDebounce = const Duration(milliseconds: 180),
  }) async {
    final gamesApi = client.gamesApi;
    if (gamesApi == null) return null;

    final capabilities = await _capabilitiesFor(client, gamesApi);
    if (capabilities.supportsManifest && capabilities.supportsVersionedAssets) {
      return _track(
        ManifestArtworkAdapter(
          gamesApi: gamesApi,
          serverIdentity: normalizeRetroArtworkServerIdentity(client.baseUrl),
          activityGate: activityGate,
          transport: transport,
          supportsPriorityHints: capabilities.supportsPriorityHints,
          priorityDebounce: priorityDebounce,
        ),
      );
    }

    return _track(LegacyArtworkAdapter(gamesApi: gamesApi));
  }

  static Future<GameArtworkCapabilities> _capabilitiesFor(
    MediaServerClient client,
    GamesApi gamesApi,
  ) {
    final sessionKey =
        '${client.baseUrl}\u0000${client.userId}\u0000${client.accessToken}';
    final cached = _capabilityCache[client];
    if (cached?.sessionKey == sessionKey) return cached!.capabilities;

    final capabilities = _readCapabilities(gamesApi);
    _capabilityCache[client] = _CapabilityCacheEntry(sessionKey, capabilities);
    return capabilities;
  }

  static Future<GameArtworkCapabilities> _readCapabilities(GamesApi api) async {
    try {
      return await api.getArtworkCapabilities() ??
          const GameArtworkCapabilities();
    } catch (_) {
      // A capability probe must not make established protocol-1 artwork
      // unavailable during a transient server failure.
      return const GameArtworkCapabilities();
    }
  }
}

class _CapabilityCacheEntry {
  const _CapabilityCacheEntry(this.sessionKey, this.capabilities);

  final String sessionKey;
  final Future<GameArtworkCapabilities> capabilities;
}

enum RetroArtworkProtocol { manifest, legacy }

typedef RetroArtworkSnapshotListener = void Function();

/// A renderable image reference. A null value from [imageFor] means artwork
/// is missing or pending, and callers must not create an image provider.
class RetroArtworkImageReference {
  const RetroArtworkImageReference._({this.source, this.legacyUrl})
    : assert(source != null || legacyUrl != null);

  const RetroArtworkImageReference.manifest(RetroArtworkSource source)
    : this._(source: source);

  const RetroArtworkImageReference.legacy(String legacyUrl)
    : this._(legacyUrl: legacyUrl);

  final RetroArtworkSource? source;
  final String? legacyUrl;

  bool get isManifest => source != null;
}

/// Current server state for the one system owned by a screen.
class RetroArtworkSystemSnapshot {
  RetroArtworkSystemSnapshot({
    required this.libraryId,
    required this.systemId,
    required this.generation,
    Map<String, Map<String, GameArtworkDescriptor>> descriptors = const {},
    Map<String, Map<String, RetroArtworkImageReference>> images = const {},
  }) : _descriptors = _freeze(descriptors),
       _images = _freeze(images);

  final String libraryId;
  final String systemId;
  final String? generation;
  final Map<String, Map<String, GameArtworkDescriptor>> _descriptors;
  final Map<String, Map<String, RetroArtworkImageReference>> _images;

  GameArtworkDescriptor? descriptorFor(String gameId, String role) =>
      _descriptors[gameId]?[role];

  RetroArtworkImageReference? imageFor(
    String gameId, {
    String role = 'boxart',
  }) => _images[gameId]?[role];

  List<GameArtworkPriorityItem> pendingPriorityItems(
    Iterable<String> orderedGameIds, {
    required Iterable<String> roles,
  }) {
    final items = <GameArtworkPriorityItem>[];
    final seenGames = <String>{};
    for (final gameId in orderedGameIds) {
      if (!seenGames.add(gameId)) continue;
      final descriptors = _descriptors[gameId];
      if (descriptors == null) continue;
      final pendingRoles = <String>[
        for (final role in roles)
          if (descriptors[role]?.state == 'pending') role,
      ];
      if (pendingRoles.isNotEmpty) {
        items.add(GameArtworkPriorityItem(gameId: gameId, roles: pendingRoles));
      }
    }
    return items;
  }

  static Map<String, Map<String, T>> _freeze<T>(
    Map<String, Map<String, T>> value,
  ) => Map<String, Map<String, T>>.unmodifiable({
    for (final entry in value.entries)
      entry.key: Map<String, T>.unmodifiable(entry.value),
  });
}

/// The screen-owned surface shared by manifest and legacy artwork protocols.
abstract interface class RetroArtworkDataSource {
  RetroArtworkProtocol get protocol;
  RetroArtworkSystemSnapshot? get snapshot;

  void addSnapshotListener(RetroArtworkSnapshotListener listener);
  void removeSnapshotListener(RetroArtworkSnapshotListener listener);

  /// Fetches only [systemId]'s manifest. Legacy returns an empty snapshot and
  /// never contacts a manifest endpoint.
  Future<RetroArtworkSystemSnapshot> refreshSystem({
    required String libraryId,
    required String systemId,
  });

  RetroArtworkImageReference? imageFor(String gameId, {String role = 'boxart'});

  /// Gives the manifest protocol one ordered, generation-bound chance to
  /// promote pending artifacts in the active row band. Legacy is a no-op.
  Future<void> submitActiveBandPriority(
    Iterable<String> orderedGameIds, {
    Iterable<String> roles = const <String>['boxart'],
    int? planGeneration,
  });

  /// The UI reports image outcomes here because ImageProvider does not expose
  /// its HTTP status to the adapter automatically. Protocol-1 suppresses 404s
  /// for the screen's lifetime and retries transient failures only at the
  /// lifecycle boundaries below; protocol-2 grants one bounded, backed-off
  /// retry per descriptor revision and then latches the same way.
  void reportImageFailure(
    String gameId, {
    String role = 'boxart',
    int? statusCode,
  });

  void reportImageLoaded(String gameId, {String role = 'boxart'});

  /// Transient failures become eligible for another attempt at these
  /// explicit lifecycle boundaries. Beyond its single bounded retry,
  /// protocol-2 state remains owned by its manifest refresh.
  void onRouteCovered();
  void onRouteReentered();
  void onAppResumed();
  void dispose();
}

/// Protocol-2 adapter. It maps role-keyed descriptors but only creates a
/// transport source for a ready descriptor, never for pending or missing art.
class ManifestArtworkAdapter implements RetroArtworkDataSource {
  ManifestArtworkAdapter({
    required GamesApi gamesApi,
    required String serverIdentity,
    required RetroArtworkActivityGate activityGate,
    required RetroArtworkTransport transport,
    required bool supportsPriorityHints,
    this.priorityDebounce = const Duration(milliseconds: 180),
    this.imageRetryBackoff = const Duration(milliseconds: 750),
  }) : _gamesApi = gamesApi,
       _serverIdentity = serverIdentity,
       _activityGate = activityGate,
       _transport = transport,
       _supportsPriorityHints = supportsPriorityHints {
    _activityGate.addListener(_onActivityChanged);
  }

  final GamesApi _gamesApi;
  final String _serverIdentity;
  final RetroArtworkActivityGate _activityGate;
  final RetroArtworkTransport _transport;
  final bool _supportsPriorityHints;
  final Duration priorityDebounce;

  /// A transient image-transfer failure (HTTP blip, not a pending/missing
  /// descriptor) gets exactly one retry after this backoff. The manifest's
  /// own refresh/retry metadata still owns everything past that single
  /// attempt — see the comment in [_submitPriority].
  final Duration imageRetryBackoff;

  @override
  RetroArtworkProtocol get protocol => RetroArtworkProtocol.manifest;

  @override
  RetroArtworkSystemSnapshot? get snapshot => _snapshot;

  RetroArtworkSystemSnapshot? _snapshot;
  Timer? _refreshTimer;
  Timer? _priorityTimer;
  bool _disposed = false;
  bool _routeCovered = false;
  bool _resumeRefreshScheduled = false;
  int _refreshEpoch = 0;
  int _priorityEpoch = 0;
  int? _priorityPlanGeneration;
  bool _priorityDrainActive = false;
  _QueuedArtworkPriority? _activePriority;
  final Queue<_QueuedArtworkPriority> _priorityQueue =
      Queue<_QueuedArtworkPriority>();
  final Object _manifestRequestOwner = Object();
  final Object _priorityRequestOwner = Object();
  final Set<RetroArtworkSnapshotListener> _listeners =
      <RetroArtworkSnapshotListener>{};

  /// Images currently withheld from [imageFor] while their single bounded
  /// retry is in flight, keyed by `gameId\x00role`. Withholding (rather than
  /// re-emitting an equal [RetroArtworkSource]) is what actually makes the
  /// consumer widget restart the transfer: an unchanged descriptor maps to a
  /// value-equal source, so a plain rebuild would not otherwise be noticed.
  final Set<String> _withheldImages = <String>{};

  /// Counts the bounded retry spent per image key so a second failure on the
  /// same descriptor revision latches instead of retrying again.
  final Map<String, int> _imageRetryAttempts = <String, int>{};
  final Map<String, Timer> _imageRetryTimers = <String, Timer>{};

  @override
  void addSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.add(listener);

  @override
  void removeSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.remove(listener);

  @override
  Future<RetroArtworkSystemSnapshot> refreshSystem({
    required String libraryId,
    required String systemId,
  }) async {
    final existing = _snapshot;
    final sameSystem =
        existing?.libraryId == libraryId && existing?.systemId == systemId;
    if (_disposed || _routeCovered || !_activityGate.isOpen) {
      return sameSystem
          ? existing!
          : RetroArtworkSystemSnapshot(
              libraryId: libraryId,
              systemId: systemId,
              generation: null,
            );
    }

    final permit = _activityGate.tryAcquire(
      RetroArtworkActivityKind.manifestRefresh,
    );
    if (permit == null) {
      return sameSystem
          ? existing!
          : RetroArtworkSystemSnapshot(
              libraryId: libraryId,
              systemId: systemId,
              generation: null,
            );
    }
    final epoch = ++_refreshEpoch;
    try {
      final GameArtworkManifest? manifest;
      try {
        manifest = await _gamesApi.getArtworkManifest(
          libraryId,
          systemId: systemId,
          knownGeneration: sameSystem ? existing?.generation : null,
          cancellationOwner: _manifestRequestOwner,
        );
      } catch (_) {
        if (_disposed ||
            _routeCovered ||
            epoch != _refreshEpoch ||
            permit.signal.isCancelled ||
            !_activityGate.isOpen) {
          return sameSystem
              ? existing!
              : RetroArtworkSystemSnapshot(
                  libraryId: libraryId,
                  systemId: systemId,
                  generation: null,
                );
        }
        rethrow;
      }
      if (_disposed ||
          permit.signal.isCancelled ||
          !_activityGate.isOpen ||
          epoch != _refreshEpoch) {
        return sameSystem
            ? existing!
            : RetroArtworkSystemSnapshot(
                libraryId: libraryId,
                systemId: systemId,
                generation: null,
              );
      }
      if (manifest != null) {
        final mapped = _mapManifest(libraryId, systemId, manifest);
        if (_snapshot?.generation != mapped.generation) {
          _clearPriorityQueue(cancelActive: true);
        }
        _snapshot = mapped;
        // A fresh manifest carries fresh descriptor revisions, so any bounded
        // retry latch from a previous failure no longer applies.
        _clearImageRetryState();
        _notifySnapshotChanged();
      }
      final current =
          _snapshot ??
          RetroArtworkSystemSnapshot(
            libraryId: libraryId,
            systemId: systemId,
            generation: null,
          );
      _snapshot = current;
      _scheduleManifestRefresh(current);
      return current;
    } finally {
      permit.dispose();
    }
  }

  RetroArtworkSystemSnapshot _mapManifest(
    String libraryId,
    String systemId,
    GameArtworkManifest manifest,
  ) {
    final descriptors = <String, Map<String, GameArtworkDescriptor>>{};
    final images = <String, Map<String, RetroArtworkImageReference>>{};
    for (final entry in manifest.entries) {
      if (entry.gameId.isEmpty) continue;
      descriptors[entry.gameId] = Map<String, GameArtworkDescriptor>.from(
        entry.artwork,
      );
      for (final artwork in entry.artwork.entries) {
        final descriptor = artwork.value;
        if (!descriptor.isRenderable) continue;
        RetroArtworkSource? source;
        try {
          source = RetroArtworkSource.fromDescriptor(
            serverIdentity: _serverIdentity,
            libraryId: libraryId,
            gameId: entry.gameId,
            role: artwork.key,
            descriptor: descriptor,
          );
        } on FormatException {
          source = null;
        }
        if (source == null) continue;
        _transport.adoptSource(source);
        (images[entry.gameId] ??=
                <String, RetroArtworkImageReference>{})[artwork.key] =
            RetroArtworkImageReference.manifest(source);
      }
    }
    return RetroArtworkSystemSnapshot(
      libraryId: libraryId,
      systemId: systemId,
      generation: manifest.generation.isEmpty ? null : manifest.generation,
      descriptors: descriptors,
      images: images,
    );
  }

  @override
  RetroArtworkImageReference? imageFor(
    String gameId, {
    String role = 'boxart',
  }) {
    if (_withheldImages.contains(_imageKey(gameId, role))) return null;
    return _snapshot?.imageFor(gameId, role: role);
  }

  @override
  Future<void> submitActiveBandPriority(
    Iterable<String> orderedGameIds, {
    Iterable<String> roles = const <String>['boxart'],
    int? planGeneration,
  }) {
    if (_disposed ||
        _routeCovered ||
        !_supportsPriorityHints ||
        !_activityGate.isOpen) {
      return Future<void>.value();
    }
    final current = _snapshot;
    if (current == null || current.generation == null) {
      return Future<void>.value();
    }
    if (planGeneration != null && planGeneration != _priorityPlanGeneration) {
      _priorityPlanGeneration = planGeneration;
      _clearPriorityQueue(cancelActive: true);
    }
    final request = _QueuedArtworkPriority(
      List<String>.unmodifiable(orderedGameIds),
      List<String>.unmodifiable(roles),
    );
    _priorityQueue.addLast(request);
    _schedulePriorityDrain();
    return request.completion.future;
  }

  void _schedulePriorityDrain() {
    if (_priorityDrainActive ||
        _priorityTimer != null ||
        _priorityQueue.isEmpty) {
      return;
    }
    final epoch = _priorityEpoch;
    _priorityTimer = Timer(priorityDebounce, () {
      _priorityTimer = null;
      unawaited(_drainPriority(epoch));
    });
  }

  Future<void> _drainPriority(int epoch) async {
    if (_priorityDrainActive) return;
    _priorityDrainActive = true;
    try {
      while (!_disposed &&
          !_routeCovered &&
          _activityGate.isOpen &&
          epoch == _priorityEpoch &&
          _priorityQueue.isNotEmpty) {
        final request = _priorityQueue.removeFirst();
        _activePriority = request;
        try {
          await _submitPriority(epoch, request.gameIds, request.roles);
        } finally {
          if (identical(_activePriority, request)) {
            _activePriority = null;
          }
          request.complete();
        }
      }
    } finally {
      _priorityDrainActive = false;
      _schedulePriorityDrain();
    }
  }

  Future<void> _submitPriority(
    int epoch,
    List<String> orderedGameIds,
    List<String> roles,
  ) async {
    final current = _snapshot;
    if (_disposed ||
        epoch != _priorityEpoch ||
        _routeCovered ||
        current == null ||
        current.generation == null ||
        !_activityGate.isOpen) {
      return;
    }
    final items = current.pendingPriorityItems(orderedGameIds, roles: roles);
    if (items.isEmpty) return;
    final permit = _activityGate.tryAcquire(
      RetroArtworkActivityKind.priorityCall,
    );
    if (permit == null) return;
    try {
      await _gamesApi.submitArtworkPriority(
        current.libraryId,
        GameArtworkPriorityRequest(
          systemId: current.systemId,
          knownGeneration: current.generation!,
          items: items,
        ),
        cancellationOwner: _priorityRequestOwner,
      );
      // The endpoint has no response state to apply. Checking cancellation
      // still makes late completions observationally inert.
      if (permit.signal.isCancelled || !_activityGate.isOpen) return;
    } catch (_) {
      // Manifest retry/refresh metadata, not blind client retries, controls
      // the next protocol-2 attempt.
    } finally {
      permit.dispose();
    }
  }

  void _scheduleManifestRefresh(RetroArtworkSystemSnapshot current) {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    final delays = <Duration>[];
    for (final game in current._descriptors.values) {
      for (final descriptor in game.values) {
        for (final seconds in <int?>[
          descriptor.retryAfterSeconds,
          descriptor.refreshAfterSeconds,
        ]) {
          if (seconds != null && seconds > 0) {
            delays.add(Duration(seconds: seconds));
          }
        }
      }
    }
    if (delays.isEmpty) return;
    delays.sort((left, right) => left.compareTo(right));
    _refreshTimer = Timer(delays.first, () {
      _refreshTimer = null;
      if (_disposed || _routeCovered || !_activityGate.isOpen) return;
      unawaited(
        refreshSystem(libraryId: current.libraryId, systemId: current.systemId),
      );
    });
  }

  void _onActivityChanged() {
    if (_activityGate.isOpen) {
      if (!_routeCovered) _scheduleResumeRefresh();
      return;
    }
    ++_refreshEpoch;
    _refreshTimer?.cancel();
    _refreshTimer = null;
    _clearPriorityQueue(cancelActive: true);
    _gamesApi.cancelArtworkRequests(cancellationOwner: _manifestRequestOwner);
  }

  void _clearPriorityQueue({required bool cancelActive}) {
    ++_priorityEpoch;
    _priorityTimer?.cancel();
    _priorityTimer = null;
    for (final request in _priorityQueue) {
      request.complete();
    }
    _priorityQueue.clear();
    _activePriority?.complete();
    if (cancelActive) {
      _gamesApi.cancelArtworkRequests(cancellationOwner: _priorityRequestOwner);
    }
  }

  void _scheduleResumeRefresh() {
    if (_resumeRefreshScheduled || _disposed || _routeCovered) return;
    final current = _snapshot;
    if (current == null) return;
    _resumeRefreshScheduled = true;
    scheduleMicrotask(() {
      _resumeRefreshScheduled = false;
      if (_disposed || _routeCovered || !_activityGate.isOpen) return;
      unawaited(
        refreshSystem(libraryId: current.libraryId, systemId: current.systemId),
      );
    });
  }

  void _notifySnapshotChanged() {
    for (final listener in List<RetroArtworkSnapshotListener>.of(_listeners)) {
      listener();
    }
  }

  @override
  void reportImageFailure(
    String gameId, {
    String role = 'boxart',
    int? statusCode,
  }) {
    if (_disposed || _routeCovered) return;
    final key = _imageKey(gameId, role);
    final wasNewlyWithheld = _withheldImages.add(key);
    if ((_imageRetryAttempts[key] ?? 0) > 0) {
      // The bounded retry for this descriptor revision is already spent.
      // Manifest retry/refresh metadata, not a second blind client retry,
      // owns recovery from here — see [_submitPriority]. Stay latched
      // (withheld) rather than scheduling another attempt.
      _imageRetryTimers.remove(key)?.cancel();
      if (wasNewlyWithheld) _notifySnapshotChanged();
      return;
    }
    _imageRetryAttempts[key] = 1;
    if (wasNewlyWithheld) _notifySnapshotChanged();
    _imageRetryTimers[key]?.cancel();
    _imageRetryTimers[key] = Timer(imageRetryBackoff, () {
      _imageRetryTimers.remove(key);
      if (_disposed || _routeCovered) return;
      _withheldImages.remove(key);
      _notifySnapshotChanged();
    });
  }

  @override
  void reportImageLoaded(String gameId, {String role = 'boxart'}) {
    _imageRetryAttempts.remove(_imageKey(gameId, role));
  }

  @override
  void onRouteCovered() {
    if (_disposed || _routeCovered) return;
    _routeCovered = true;
    ++_refreshEpoch;
    _refreshTimer?.cancel();
    _refreshTimer = null;
    _clearPriorityQueue(cancelActive: true);
    _gamesApi.cancelArtworkRequests(cancellationOwner: _manifestRequestOwner);
    for (final timer in _imageRetryTimers.values) {
      timer.cancel();
    }
    _imageRetryTimers.clear();
  }

  @override
  void onRouteReentered() {
    _routeCovered = false;
    final hadWithheldImages = _withheldImages.isNotEmpty;
    _clearImageRetryState();
    if (hadWithheldImages) _notifySnapshotChanged();
    if (_activityGate.isOpen) _scheduleResumeRefresh();
  }

  @override
  void onAppResumed() {
    if (!_routeCovered) onRouteReentered();
  }

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    ++_refreshEpoch;
    _refreshTimer?.cancel();
    _clearPriorityQueue(cancelActive: true);
    _gamesApi.cancelArtworkRequests(cancellationOwner: _manifestRequestOwner);
    _activityGate.removeListener(_onActivityChanged);
    _listeners.clear();
    _clearImageRetryState();
    RetroArtworkDataSourceFactory._untrack(this);
  }

  void _clearImageRetryState() {
    if (_imageRetryAttempts.isEmpty &&
        _withheldImages.isEmpty &&
        _imageRetryTimers.isEmpty) {
      return;
    }
    _imageRetryAttempts.clear();
    _withheldImages.clear();
    for (final timer in _imageRetryTimers.values) {
      timer.cancel();
    }
    _imageRetryTimers.clear();
  }

  // NUL separates the parts because it cannot occur in a game id or a role, so no pair of
  // inputs can collide onto one key. Written as an escape, not a literal byte: a raw 0x00 in
  // the source makes git treat this whole file as binary and stop rendering its diffs.
  String _imageKey(String gameId, String role) => '$gameId\u0000$role';
}

/// Protocol-1 adapter. It only creates the established Thumb endpoint URLs.
/// Per-screen 404 knowledge is permanent; transient errors become eligible for
/// one retry only when the route re-enters or the app resumes.
class LegacyArtworkAdapter implements RetroArtworkDataSource {
  LegacyArtworkAdapter({required GamesApi gamesApi}) : _gamesApi = gamesApi;

  final GamesApi _gamesApi;
  final Set<String> _missing = <String>{};
  final Set<String> _transientFailures = <String>{};
  bool _routeCovered = false;
  RetroArtworkSystemSnapshot? _snapshot;
  final Set<RetroArtworkSnapshotListener> _listeners =
      <RetroArtworkSnapshotListener>{};

  @override
  void addSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.add(listener);

  @override
  void removeSnapshotListener(RetroArtworkSnapshotListener listener) =>
      _listeners.remove(listener);

  @override
  RetroArtworkProtocol get protocol => RetroArtworkProtocol.legacy;

  @override
  RetroArtworkSystemSnapshot? get snapshot => _snapshot;

  @override
  Future<RetroArtworkSystemSnapshot> refreshSystem({
    required String libraryId,
    required String systemId,
  }) async {
    return _snapshot = RetroArtworkSystemSnapshot(
      libraryId: libraryId,
      systemId: systemId,
      generation: null,
    );
  }

  @override
  RetroArtworkImageReference? imageFor(
    String gameId, {
    String role = 'boxart',
  }) {
    final current = _snapshot;
    if (current == null) return null;
    final key = _key(gameId, role);
    if (_missing.contains(key) || _transientFailures.contains(key)) return null;
    return RetroArtworkImageReference.legacy(
      _gamesApi.thumbUrl(
        libraryId: current.libraryId,
        gameId: gameId,
        kind: role,
      ),
    );
  }

  @override
  Future<void> submitActiveBandPriority(
    Iterable<String> orderedGameIds, {
    Iterable<String> roles = const <String>['boxart'],
    int? planGeneration,
  }) => Future<void>.value();

  @override
  void reportImageFailure(
    String gameId, {
    String role = 'boxart',
    int? statusCode,
  }) {
    final key = _key(gameId, role);
    if (statusCode == 404) {
      _missing.add(key);
      _transientFailures.remove(key);
    } else {
      _transientFailures.add(key);
    }
    _notifySnapshotChanged();
  }

  @override
  void reportImageLoaded(String gameId, {String role = 'boxart'}) {
    _transientFailures.remove(_key(gameId, role));
  }

  @override
  void onRouteCovered() {
    _routeCovered = true;
  }

  @override
  void onRouteReentered() {
    _routeCovered = false;
    if (_transientFailures.isEmpty) return;
    _transientFailures.clear();
    _notifySnapshotChanged();
  }

  @override
  void onAppResumed() {
    if (!_routeCovered) onRouteReentered();
  }

  @override
  void dispose() {
    _missing.clear();
    _transientFailures.clear();
    _snapshot = null;
    _listeners.clear();
    RetroArtworkDataSourceFactory._untrack(this);
  }

  void _notifySnapshotChanged() {
    for (final listener in List<RetroArtworkSnapshotListener>.of(_listeners)) {
      listener();
    }
  }

  String _key(String gameId, String role) => '$gameId\u0000$role';
}

class _QueuedArtworkPriority {
  _QueuedArtworkPriority(this.gameIds, this.roles);

  final List<String> gameIds;
  final List<String> roles;
  final Completer<void> completion = Completer<void>();

  void complete() {
    if (!completion.isCompleted) completion.complete();
  }
}
