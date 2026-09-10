import 'dart:async';

import '../data/services/auto_download_service.dart';
import '../preference/user_preferences.dart';
import 'background_refresh.dart';

/// Keeps the platform's background refresh task in step with the
/// auto-download state: scheduled only while the setting is on and at least
/// one series is followed, so the OS never wakes the app for nothing.
class AutoDownloadBackgroundBinding {
  AutoDownloadBackgroundBinding({
    required this.service,
    required this.prefs,
    BackgroundRefresh? refresh,
  }) : _refresh = refresh ?? BackgroundRefresh.instance;

  final AutoDownloadService service;
  final UserPreferences prefs;
  final BackgroundRefresh _refresh;
  StreamSubscription<List<Object?>>? _subscriptionsSub;
  bool _hasSubscriptions = false;
  ({bool enabled, bool wifiOnly})? _lastConfigured;

  void attach() {
    prefs.addListener(_sync);
    _subscriptionsSub = service.watchSubscriptions().listen((subscriptions) {
      _hasSubscriptions = subscriptions.isNotEmpty;
      _sync();
    });
  }

  /// Stops reacting; with [disable] the task is also cancelled, for a
  /// sign-out that leaves nobody to check for.
  void detach({bool disable = false}) {
    prefs.removeListener(_sync);
    _subscriptionsSub?.cancel();
    _subscriptionsSub = null;
    if (disable) {
      _lastConfigured = null;
      unawaited(_refresh.configure(enabled: false));
    }
  }

  void _sync() {
    final enabled =
        _hasSubscriptions &&
        prefs.get(UserPreferences.autoDownloadEnabled) &&
        prefs.get(UserPreferences.autoDownloadBackgroundRefresh);
    final wanted = (
      enabled: enabled,
      // Only meaningful while scheduled; keeps a Wi-Fi toggle from
      // re-cancelling an already cancelled task.
      wifiOnly: enabled && prefs.get(UserPreferences.downloadWifiOnly),
    );
    if (wanted == _lastConfigured) return;
    _lastConfigured = wanted;
    unawaited(
      _refresh.configure(enabled: wanted.enabled, wifiOnly: wanted.wifiOnly),
    );
  }
}
