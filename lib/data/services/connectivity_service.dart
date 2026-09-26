import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState, WidgetsBinding;
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/session_repository.dart';
import '../../util/platform_detection.dart';
import 'sync_service.dart';

class ConnectivityService extends ChangeNotifier {
  final Connectivity _connectivity;
  final Dio _pingDio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    followRedirects: false,
  ));
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

  /// Whether the only link is mobile data. Read by prefetchers that should
  /// not spend a metered connection on artwork the user may never scroll to.
  /// False until the first probe answers, and false on a link the platform
  /// can't classify, since holding back on a healthy Wi-Fi costs more than
  /// warming a few posters on a plan.
  bool get isCellularOnly => _isCellularOnly;
  bool _isCellularOnly = false;

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
  }) : _connectivity = connectivity ?? Connectivity(),
       _retryBase = retryBase {
    configureServerDio(_pingDio);
    _pingDio.interceptors.add(redirectInterceptor(_pingDio));
  }

  void initialize() {
    if (!PlatformDetection.isAppleTV) {
      _subscription =
          _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    }
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
    _isOnline = results.any((r) => r != ConnectivityResult.none);
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
    _isOnline = results.any((r) => r != ConnectivityResult.none);
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
    _serverId = serverId;
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

  Future<void> _checkServerReachability() => _inFlightProbe ??= _probeServer()
      .whenComplete(() => _inFlightProbe = null);

  Future<void> _probeServer() async {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;
    final client = GetIt.instance<MediaServerClient>();
    final wasReachable = _serverReachable;
    Object? failure;
    // A pooled connection the server already dropped fails exactly like a
    // server that went away, and sending the whole app to the downloads
    // catalog over one of those is worse than asking twice. The failure takes
    // the bad connection with it, so the second try needs no wait in front.
    for (var attempt = 0; attempt < _probeAttempts; attempt++) {
      try {
        await _pingDio.get('${client.baseUrl}/System/Ping');
        failure = null;
        break;
      } catch (e) {
        failure = e;
      }
    }
    _serverReachable = failure == null;
    if (!_serverReachable && wasReachable) {
      ServerLog.network(
        'Server marked unreachable, every probe failed',
        level: ServerLogLevel.warning,
        error: failure,
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
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
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
    _isOnline = results.any((r) => r != ConnectivityResult.none);
    _isCellularOnly = _cellularOnly(results);
    if (_isOnline) {
      await _checkServerReachability();
    } else {
      _retryTimer?.cancel();
      _serverReachable = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _recheckDebounce?.cancel();
    _retryTimer?.cancel();
    super.dispose();
  }
}
