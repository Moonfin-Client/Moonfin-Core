import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Bridge to the platform's periodic background refresh: the iOS
/// `BGTaskScheduler` app-refresh task or the Android WorkManager job.
///
/// The system decides when (and whether) the task runs; when it does, the
/// native side calls `performRefresh` here with the seconds it is willing to
/// wait and expects a bool. Until [bind] has run, the native side sees
/// "not implemented" and retries, which covers a launch caused by the task
/// itself while Dart is still starting.
class BackgroundRefresh {
  BackgroundRefresh({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel(channelName);

  static const channelName = 'com.moonfin/background_refresh';

  static final instance = BackgroundRefresh();

  final MethodChannel _channel;

  /// Installs [handler] as the answer to `performRefresh`. The handler
  /// receives the time budget iOS granted and returns whether the run
  /// succeeded.
  void bind(Future<bool> Function(Duration budget) handler) {
    _channel.setMethodCallHandler((call) => _handleMethod(call, handler));
  }

  /// Turns the scheduled task on or off. [wifiOnly] lets Android constrain
  /// the job to unmetered networks; iOS applies the preference per transfer
  /// and ignores it here.
  Future<void> configure({required bool enabled, bool wifiOnly = false}) async {
    try {
      await _channel.invokeMethod<void>('configure', {
        'enabled': enabled,
        'wifiOnly': wifiOnly,
      });
    } on MissingPluginException {
      // No native scheduler on this platform: nothing to schedule.
    }
  }

  /// `available`, `denied` (user turned Background App Refresh off for the
  /// app on iOS), `restricted` (iOS parental controls or Low Power Mode
  /// policy; Android background usage restriction) or `unknown` where the
  /// native side is absent.
  Future<String> refreshStatus() async {
    try {
      return await _channel.invokeMethod<String>('refreshStatus') ?? 'unknown';
    } on MissingPluginException {
      return 'unknown';
    }
  }

  Future<dynamic> _handleMethod(
    MethodCall call,
    Future<bool> Function(Duration budget) handler,
  ) async {
    if (call.method != 'performRefresh') {
      throw MissingPluginException('${call.method} is not implemented');
    }
    final args = call.arguments as Map?;
    final budget = Duration(seconds: args?['budgetSeconds'] as int? ?? 0);
    if (budget <= Duration.zero) return false;
    try {
      // Wrapped so a handler that returns a Future<Never> (an async throw)
      // cannot break the timeout's static type.
      return await Future<bool>(() => handler(budget))
          .timeout(budget, onTimeout: () => false);
    } catch (e) {
      debugPrint('[BackgroundRefresh] refresh failed: $e');
      return false;
    }
  }
}
