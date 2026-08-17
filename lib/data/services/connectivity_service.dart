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
  final Connectivity _connectivity = Connectivity();
  final Dio _pingDio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    followRedirects: false,
  ));
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _recheckDebounce;

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  bool _serverReachable = true;
  bool get serverReachable => _serverReachable;

  bool get canReachServer => _isOnline && _serverReachable;

  /// Whether the initial connectivity check has completed.
  /// Stream events are ignored until this is true to prevent
  /// a false "offline" flash at boot.
  bool _initialCheckDone = false;

  /// Set when a sync was skipped because the app was backgrounded.
  bool _pendingSync = false;

  ConnectivityService() {
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

    if (!_isOnline) {
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
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<SyncService>() ||
        !getIt.isRegistered<MediaServerClient>()) {
      return;
    }
    final syncService = getIt<SyncService>();
    final client = getIt<MediaServerClient>();
    final serverId = getIt.isRegistered<SessionRepository>()
        ? getIt<SessionRepository>().activeServerId
        : null;
    // Ratings push first, so the metadata refresh at the end of the chain
    // pulls back items that already carry them.
    syncService
        .syncPendingRatings(client, serverId: serverId)
        .then((_) => syncService.syncPlaybackProgress(client))
        .then((_) {
          syncService.refreshMetadata(client);
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

  Future<void> _checkServerReachability() async {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;
    final client = GetIt.instance<MediaServerClient>();
    try {
      await _pingDio.get('${client.baseUrl}/System/Ping');
      _serverReachable = true;
    } catch (_) {
      _serverReachable = false;
    }
    notifyListeners();
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
    if (_isOnline) {
      await _checkServerReachability();
    } else {
      _serverReachable = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _recheckDebounce?.cancel();
    super.dispose();
  }
}
