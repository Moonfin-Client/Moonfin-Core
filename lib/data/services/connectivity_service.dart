import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState, WidgetsBinding;
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../util/platform_detection.dart';
import 'sync_service.dart';
import 'remove_watched_service.dart';

class ConnectivityService extends ChangeNotifier {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _recheckDebounce;

  /// Startup, a network flip and the retry below can all ask at once, and two
  /// probes would each open a connection and each read the verdict from before
  /// either answered.
  Future<void>? _inFlightProbe;

  /// An unreachable verdict sends every browse call to the downloads catalog,
  /// and nothing else asks again until the network flips, so the verdict is
  /// re-checked on a growing delay for as long as it stands.
  Timer? _retryTimer;
  int _retryAttempt = 0;
  final Duration _retryBase;
  static const _retryCap = Duration(seconds: 30);

  static const _probeAttempts = 2;

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  bool _serverReachable = true;
  bool get serverReachable => _serverReachable;

  bool get canReachServer => _isOnline && _serverReachable;

  /// Whether the reconnect sync (ratings, progress, metadata, then removing
  /// watched downloads) is running.
  bool get isSyncing => _inFlightSync != null;

  /// Whether the only link is mobile data. Read by prefetchers that should
  /// not spend a metered connection on artwork the user may never scroll to.
  /// False until the first probe answers, and false on a link the platform
  /// can't classify, since holding back on a healthy Wi-Fi costs more than
  /// warming a few posters on a plan.
  bool get isCellularOnly => _isCellularOnly;
  bool _isCellularOnly = false;

  /// A server on this device answers with every radio off, so only the ping
  /// decides for it.
  static bool _hasNetwork(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none) || _serverOnDevice();

  static bool _serverOnDevice() {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<MediaServerClient>()) return false;
    final host = Uri.tryParse(getIt<MediaServerClient>().baseUrl)?.host ?? '';
    return host == 'localhost' || host == '::1' || host.startsWith('127.');
  }

  static bool _cellularOnly(List<ConnectivityResult> results) {
    final live = results.where((r) => r != ConnectivityResult.none).toList();
    return live.isNotEmpty &&
        live.every((r) => r == ConnectivityResult.mobile);
  }

  /// Whether the initial connectivity check has completed.
  /// Stream events are ignored until this is true to prevent
  /// a false "offline" flash at boot.
  bool _initialCheckDone = false;

  /// Set when a sync was skipped because the app was backgrounded.
  bool _pendingSync = false;

  /// The app server id of the registered client, handed over with it by
  /// [onServerClientReady] so the sync never pairs one server's rows with
  /// another server's client.
  String? _serverId;

  /// The boot-time check, a sign-in and a network flip can all ask for the
  /// sync within a second of each other, and only the progress step guards
  /// itself, so a second chain would repeat the ratings push and the whole
  /// metadata sweep. A request for a client that registered since the running
  /// chain started waits for it and then runs once.
  Future<void>? _inFlightSync;
  MediaServerClient? _inFlightSyncClient;
  bool _syncQueued = false;

  ConnectivityService({
    @visibleForTesting Connectivity? connectivity,
    @visibleForTesting Duration retryBase = const Duration(seconds: 5),
    @visibleForTesting
    Duration entryFollowInterval = const Duration(seconds: 5),
    @visibleForTesting
    Duration entryFollowBudget = const Duration(minutes: 3),
  }) : _connectivity = connectivity ?? Connectivity(),
       _retryBase = retryBase,
       _entryFollowInterval = entryFollowInterval,
       _entryFollowBudget = entryFollowBudget;

  void initialize() {
    if (!PlatformDetection.isAppleTV) {
      _subscription =
          _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    }
    _listenForMoves();
    _checkInitialState();
  }

  Future<void> _checkInitialState() async {
    if (PlatformDetection.isAppleTV) {
      _isOnline = true;
      await _checkServerReachability();
      if (_serverReachable) {
        _triggerSync();
      }
      _initialCheckDone = true;
      notifyListeners();
      return;
    }
    final results = await _connectivity.checkConnectivity();
    _isOnline = _hasNetwork(results);
    _isCellularOnly = _cellularOnly(results);
    if (_isOnline) {
      await _checkServerReachability();
      if (_serverReachable) {
        _triggerSync();
      }
    } else {
      _serverReachable = false;
    }
    _initialCheckDone = true;
    notifyListeners();
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    if (!_initialCheckDone) return;

    final wasOnline = _isOnline;
    final wasReachable = _serverReachable;
    _isOnline = _hasNetwork(results);
    _isCellularOnly = _cellularOnly(results);

    if (!_isOnline) {
      _retryTimer?.cancel();
      if (wasOnline) {
        _serverReachable = false;
        notifyListeners();
      }
      return;
    }

    if (!wasOnline) {
      notifyListeners();
    }

    _recheckDebounce?.cancel();
    _recheckDebounce = Timer(const Duration(seconds: 2), () {
      _checkServerReachability().then((_) {
        if (_serverReachable && !wasReachable) {
          _triggerSync();
        }
      });
    });
  }

  /// Called when the app returns to the foreground. Runs a sync that was
  /// deferred while the app was backgrounded.
  void onAppResumed() {
    if (!_pendingSync) return;
    _pendingSync = false;
    _triggerSync();
  }

  /// Every path that reports the network came back lands here, and that is
  /// the moment a socket part way through its backoff should stop waiting.
  void _nudgeSocket() {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<SessionRepository>()) return;
    getIt<SessionRepository>().onNetworkRegained();
  }

  /// A server client was just registered for [serverId] (session restore,
  /// sign-in, account or server switch). The boot-time check runs before any
  /// client exists and a sign-in brings no reachability edge, so this is the
  /// moment that reconciles progress recorded offline.
  Future<void> onServerClientReady(String serverId) async {
    _listenForMoves();
    _serverId = serverId;
    // The launch check runs before a client exists, so a server on this
    // device is only known now.
    if (!_isOnline && _serverOnDevice()) _isOnline = true;
    if (!_isOnline) return;
    // Straight to the probe rather than recheckNow, which would add a
    // connectivity_plus call on Apple TV, where the service never makes one.
    await _checkServerReachability();
    if (_serverReachable) _triggerSync();
  }

  void _triggerSync() {
    _nudgeSocket();
    // Every network flip lands here, and the full progress and metadata sync
    // keeps the radio and CPU busy on a device nobody is looking at. Defer it
    // until the app is visible again, unless playback is active and progress
    // sync still matters.
    if (!_isForegroundOrPlaying()) {
      _pendingSync = true;
      return;
    }
    _startSyncChain();
  }

  void _startSyncChain() {
    final getIt = GetIt.instance;
    final serverId = _serverId;
    if (serverId == null ||
        !getIt.isRegistered<SyncService>() ||
        !getIt.isRegistered<MediaServerClient>()) {
      ServerLog.network('Progress sync skipped: no server client yet');
      return;
    }
    final syncService = getIt<SyncService>();
    final client = getIt<MediaServerClient>();
    if (_inFlightSync != null) {
      if (!identical(client, _inFlightSyncClient)) _syncQueued = true;
      return;
    }
    _inFlightSyncClient = client;
    // Ratings push first, so the metadata refresh at the end of the chain
    // pulls back items that already carry them.
    _inFlightSync = syncService
        .syncPendingRatings(client, serverId: serverId)
        .then(
          (_) => syncService.syncPlaybackProgress(client, serverId: serverId),
        )
        .then((_) => syncService.refreshMetadata(client, serverId: serverId))
        // Last, so it judges the played state the refresh just pulled in.
        .then((_) async {
          if (!getIt.isRegistered<RemoveWatchedService>()) return;
          await getIt<RemoveWatchedService>().runSafely(
            client,
            serverId: serverId,
          );
        })
        .catchError((Object e) {
          ServerLog.network(
            'Progress sync failed',
            level: ServerLogLevel.warning,
            error: e,
          );
        })
        .whenComplete(() {
          _inFlightSync = null;
          _inFlightSyncClient = null;
          if (_syncQueued) {
            _syncQueued = false;
            _startSyncChain();
          }
        });
  }

  bool _isForegroundOrPlaying() {
    final lifecycle = WidgetsBinding.instance.lifecycleState;
    // A null state means no lifecycle event has arrived yet. On desktop that
    // can last the whole run so it counts as foreground, while on Android it
    // marks a headless engine and counts as background.
    final backgrounded = lifecycle == AppLifecycleState.paused ||
        lifecycle == AppLifecycleState.hidden ||
        lifecycle == AppLifecycleState.detached ||
        (lifecycle == null && PlatformDetection.isAndroid);
    if (!backgrounded) return true;

    final getIt = GetIt.instance;
    return getIt.isRegistered<PlaybackManager>() &&
        getIt<PlaybackManager>().state.isPlaying;
  }

  Future<void> _checkServerReachability() => _inFlightProbe ??=
      _probeCurrentServer().whenComplete(() => _inFlightProbe = null);

  /// A caller that joins a running probe asks about the server and address
  /// of now, so a probe overtaken by a server switch or a move found
  /// elsewhere (a failed request, the player) runs again for what is current.
  Future<void> _probeCurrentServer() async {
    while (!await _probeServer()) {}
  }

  /// Whether the probe's verdict was taken. False when the active server,
  /// its client or its address changed while the pings were out: that
  /// verdict is about something no longer asked for.
  Future<bool> _probeServer() async {
    if (_disposed || !GetIt.instance.isRegistered<MediaServerClient>()) {
      return true;
    }
    // Paired here, as a switch can replace both while the pings wait.
    final client = GetIt.instance<MediaServerClient>();
    final serverId = _serverId;
    var probedUrl = client.baseUrl;
    final wasReachable = _serverReachable;
    var reachable = false;
    // A pooled connection the server already dropped fails exactly like a
    // server that went away, and sending the whole app to the downloads
    // catalog over one of those is worse than asking twice. The failure takes
    // the bad connection with it, so the second try needs no wait in front.
    // Each server type pings its own route (Silo has no /System/Ping), and
    // the client's ping counts a 401 as an answer (see SystemApi.ping).
    for (var attempt = 0; attempt < _probeAttempts && !reachable; attempt++) {
      try {
        reachable = await client.systemApi.ping();
      } catch (_) {
        // Ping shouldn't throw, but a client that does still means no answer.
      }
    }
    if (!reachable &&
        _isOnline &&
        _isCurrent(client, serverId) &&
        await _followEntryAddress(client, serverId)) {
      // The move this probe found itself is the address it now asks.
      probedUrl = client.baseUrl;
      try {
        reachable = await client.systemApi.ping();
      } catch (_) {}
    }
    if (_disposed) return true;
    if (!_isCurrent(client, serverId) || client.baseUrl != probedUrl) {
      return false;
    }
    _serverReachable = reachable;
    if (!_serverReachable && wasReachable) {
      ServerLog.network(
        'Server marked unreachable, every probe failed',
        level: ServerLogLevel.warning,
      );
    }
    if (_serverReachable) {
      if (!wasReachable) ServerLog.network('Server reachable again');
      _retryAttempt = 0;
      _retryTimer?.cancel();
      _retryTimer = null;
    } else if (_isOnline) {
      _scheduleRetry();
    }
    notifyListeners();
    return true;
  }

  /// Whether [client] and [serverId] are still the active pair.
  bool _isCurrent(MediaServerClient client, String? serverId) {
    final getIt = GetIt.instance;
    return serverId == _serverId &&
        getIt.isRegistered<MediaServerClient>() &&
        identical(getIt<MediaServerClient>(), client);
  }

  /// Whether the entry address of [serverId] now redirects to a new address,
  /// which [client], that server's client, then uses. A server added through
  /// a redirect to a dynamic `host:port` (VPN port forwarding behind a stable
  /// name) stops answering when the target moves, and only the entry address
  /// knows where it went.
  Future<bool> _followEntryAddress(
    MediaServerClient client,
    String? serverId,
  ) async {
    _listenForMoves();
    final getIt = GetIt.instance;
    if (serverId == null || !getIt.isRegistered<ServerRepository>()) {
      return false;
    }
    try {
      final moved = await getIt<ServerRepository>().followEntryAddressOf(
        serverId,
      );
      if (moved == null) return false;
      if (client.baseUrl != moved) client.baseUrl = moved;
      ServerLog.network('Server moved, following its entry address');
      return true;
    } catch (_) {
      return false;
    }
  }

  /// The player lost its stream and starts reconnecting, or one of its
  /// server requests stalled on the network. A server that moved
  /// behind its entry address (a VPN reconnect changing the forwarded port)
  /// doesn't flip the device's network, so nothing else would check now.
  ///
  /// The redirect catches up some time after the stream broke (the new port
  /// has to be mapped and published first), so the entry address is asked
  /// every [_entryFollowInterval] while the player reconnects or the server
  /// doesn't answer, for at most [_entryFollowBudget]. Asking it is cheap: the
  /// redirect answers at once, unlike pings to the dead address. Past that
  /// budget it is more likely a real outage, and the reachability check's
  /// slower retries (up to [_retryCap]) keep following it from there, so a
  /// stream restarted later still finds the new address.
  Future<void> onStreamConnectionLost() async {
    final getIt = GetIt.instance;
    if (_disposed || !_isOnline || !getIt.isRegistered<MediaServerClient>()) {
      return;
    }
    if (_followingLostStream) return;
    _followingLostStream = true;
    try {
      final deadline = DateTime.now().add(_entryFollowBudget);
      // Tells a stream that dropped on a server still at its address (it
      // answers) from one that moved, without holding up the first ask.
      unawaited(_checkServerReachability());
      while (true) {
        if (await _followEntryAddress(getIt<MediaServerClient>(), _serverId)) {
          if (!_disposed) await _checkServerReachability();
          return;
        }
        if (_disposed) return;
        await Future<void>.delayed(_entryFollowInterval);
        if (_disposed) return;
        if (!_isOnline || DateTime.now().isAfter(deadline)) break;
        if (!_playerReconnecting() && _serverReachable) return;
        if (!getIt.isRegistered<MediaServerClient>()) return;
      }
      await _checkServerReachability();
    } finally {
      _followingLostStream = false;
    }
  }

  StreamSubscription<ServerMove>? _movedSub;

  /// Starts listening for moves of the active server once the repository
  /// that reports them exists. [initialize] runs before the auth module
  /// registers it, so this is asked again wherever a move can be found.
  void _listenForMoves() {
    if (_movedSub != null) return;
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<ServerRepository>()) return;
    _movedSub = getIt<ServerRepository>().serverMoved.listen(_onServerMoved);
  }

  /// The active server answers on a new address now, found by any ask of its
  /// entry address. Whatever was waiting on the old one hears of it at once:
  /// the reachability state clears and an open stream moves over to it.
  void _onServerMoved(ServerMove move) {
    if (_disposed || move.server.id != _serverId) return;
    unawaited(_checkServerReachability());
    final getIt = GetIt.instance;
    if (getIt.isRegistered<PlaybackManager>()) {
      unawaited(
        getIt<PlaybackManager>().onServerMoved(
          from: move.from,
          to: move.server.address,
        ),
      );
    }
  }

  bool _followingLostStream = false;
  final Duration _entryFollowInterval;
  final Duration _entryFollowBudget;

  /// Whether the player is still trying to get its stream back.
  bool _playerReconnecting() {
    final getIt = GetIt.instance;
    return getIt.isRegistered<PlaybackManager>() &&
        getIt<PlaybackManager>().isReconnecting;
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
    // dispose already cancelled the last one, and a late probe must not
    // start another.
    if (_disposed) return;
    final delay = _retryBase * (1 << _retryAttempt);
    _retryTimer = Timer(delay < _retryCap ? delay : _retryCap, () {
      _retryTimer = null;
      if (!_isOnline || _serverReachable) return;
      if (_retryAttempt < 6) _retryAttempt++;
      _checkServerReachability().then((_) {
        if (_serverReachable) _triggerSync();
      });
    });
  }

  /// Resolves true as soon as the device reports online, or false after
  /// [timeout]. Lets cold-boot startup wait out the Wi-Fi association window
  /// instead of committing to the offline fallback immediately.
  Future<bool> waitForOnline(Duration timeout) async {
    if (_isOnline && _initialCheckDone) return true;
    final completer = Completer<bool>();
    void onChange() {
      if (_isOnline && !completer.isCompleted) {
        completer.complete(true);
      }
    }

    addListener(onChange);
    final timer = Timer(timeout, () {
      if (!completer.isCompleted) completer.complete(_isOnline);
    });
    final result = await completer.future;
    timer.cancel();
    removeListener(onChange);
    return result;
  }

  Future<void> recheckNow() async {
    final results = await _connectivity.checkConnectivity();
    _isOnline = _hasNetwork(results);
    _isCellularOnly = _cellularOnly(results);
    if (_isOnline) {
      await _checkServerReachability();
    } else {
      _retryTimer?.cancel();
      _serverReachable = false;
      notifyListeners();
    }
  }

  bool _disposed = false;

  /// A check that was already under way (one a server move started, say) can
  /// finish after [dispose], and has nobody left to tell.
  @override
  void notifyListeners() {
    if (!_disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _subscription?.cancel();
    _recheckDebounce?.cancel();
    _retryTimer?.cancel();
    _movedSub?.cancel();
    super.dispose();
  }
}
