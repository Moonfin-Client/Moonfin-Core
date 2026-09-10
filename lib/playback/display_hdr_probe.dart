import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../data/services/log_service.dart';
import '../util/platform_detection.dart';
import 'device_capability_cache.dart';

/// What a display snapshot is allowed to conclude.
enum DisplayHdrVerdict {
  /// The display named HDR formats. Nothing else has to line up for this to
  /// be believed, since no absent display invents formats.
  reportsHdr,

  /// A display was demonstrably attached, powered and answering, and still
  /// named no HDR format. Only this counts as a real SDR panel.
  provenSdr,

  /// Nothing can be concluded. Whatever was detected before stands.
  cannotAnswer,
}

/// The facts the native probe reported about the attached display.
///
/// The reason this is facts rather than a list of HDR formats: a box that
/// boots before its TV or AVR is awake answers with no formats, which reads
/// identically to a real SDR panel. Treating those alike is what let a
/// sleeping AVR erase a Dolby Vision TV's capabilities for the rest of the
/// session.
class DisplayHdrSnapshot {
  const DisplayHdrSnapshot({
    required this.types,
    this.present = false,
    this.valid = false,
    this.state = 'unknown',
    this.answered = false,
    this.supportedModeCount = 0,
    this.sinkId,
    this.sinkConnection,
    this.modeTypes = const <String>[],
    this.displayCount = 0,
    this.sdkInt = 0,
    this.trigger = 'pull',
  });

  /// A reply from a native side that only knows how to return the format
  /// list. Carries no supporting facts, so it can raise capabilities but can
  /// never prove a panel is SDR.
  factory DisplayHdrSnapshot.fromTypes(
    List<String> types, {
    String trigger = 'pull',
  }) {
    return DisplayHdrSnapshot(types: types, trigger: trigger);
  }

  factory DisplayHdrSnapshot.fromMap(Map<String, dynamic> raw) {
    return DisplayHdrSnapshot(
      types: (raw['types'] as List<dynamic>? ?? const <dynamic>[])
          .map((value) => value.toString())
          .toList(growable: false),
      present: raw['present'] == true,
      valid: raw['valid'] == true,
      state: raw['state']?.toString() ?? 'unknown',
      answered: raw['answered'] == true,
      supportedModeCount: (raw['supportedModeCount'] as num?)?.toInt() ?? 0,
      sinkId: raw['sinkId']?.toString(),
      sinkConnection: raw['sinkConnection']?.toString(),
      modeTypes: (raw['modeTypes'] as List<dynamic>? ?? const <dynamic>[])
          .map((value) => value.toString())
          .toList(growable: false),
      displayCount: (raw['displayCount'] as num?)?.toInt() ?? 0,
      sdkInt: (raw['sdkInt'] as num?)?.toInt() ?? 0,
      trigger: raw['trigger']?.toString() ?? 'pull',
    );
  }

  final List<String> types;
  final bool present;
  final bool valid;
  final String state;
  final bool answered;
  final int supportedModeCount;
  final String? sinkId;
  final String? sinkConnection;

  /// What the active output mode carries, purely diagnostic. A Dolby Vision
  /// TV parked in an SDR mode reports empty here while [types] stays full,
  /// which is why the per-mode API never gets a vote in the verdict.
  final List<String> modeTypes;

  final int displayCount;
  final int sdkInt;
  final String trigger;

  /// Whether a real sink identified itself, which is the part that separates
  /// a genuinely attached SDR TV from a box shouting into a dark HDMI port.
  ///
  /// Display state alone won't do it. Plenty of boxes report a powered-on
  /// nominal display with nothing plugged in, which is exactly the state the
  /// reported device was in. EDID identity is the honest signal, and where
  /// that is not available the mode list stands in: a real panel advertises
  /// several, a placeholder advertises one.
  bool get sinkEnumerated =>
      sdkInt >= 31 ? sinkId != null : supportedModeCount > 1;

  DisplayHdrVerdict get verdict {
    if (types.isNotEmpty) return DisplayHdrVerdict.reportsHdr;
    if (present && valid && state == 'on' && answered && sinkEnumerated) {
      return DisplayHdrVerdict.provenSdr;
    }
    return DisplayHdrVerdict.cannotAnswer;
  }

  String describe() =>
      'trigger=$trigger verdict=${verdict.name} types=$types '
      'present=$present valid=$valid state=$state answered=$answered '
      'sink=${sinkId ?? 'none'}/${sinkConnection ?? 'unknown'} '
      'modes=$supportedModeCount modeTypes=$modeTypes '
      'displays=$displayCount sdk=$sdkInt';
}

/// Front-end for the native display HDR probe on Android TV.
///
/// Two jobs. It reads the display's HDR support without mistaking silence for
/// an answer, and it keeps listening afterwards so a TV or AVR that wakes up
/// long after launch restores capabilities without an app restart.
class DisplayHdrProbe {
  DisplayHdrProbe._();

  static const _methodChannel = MethodChannel('org.moonfin.androidtv/platform');
  static const _eventChannel = EventChannel(
    'org.moonfin.androidtv/displayCapabilitiesEvents',
  );

  static StreamSubscription<dynamic>? _subscription;

  static bool get isSupported =>
      PlatformDetection.isAndroid && PlatformDetection.isTV;

  /// Queries the native probe once. Falls back to the format-list method when
  /// running against a native side that predates the fact-collecting one,
  /// which keeps self-healing working while giving up the ability to prove a
  /// panel is SDR. That's the safe half to lose.
  static Future<DisplayHdrSnapshot?> query({String trigger = 'pull'}) async {
    if (!isSupported) return null;
    try {
      final raw = await _methodChannel.invokeMethod<Map<dynamic, dynamic>>(
        'displayCapabilities',
        <String, dynamic>{'trigger': trigger},
      );
      if (raw == null) return null;
      return DisplayHdrSnapshot.fromMap(
        raw.map((key, value) => MapEntry(key.toString(), value)),
      );
    } on MissingPluginException {
      return _queryTypesOnly(trigger);
    } catch (_) {
      return null;
    }
  }

  static Future<DisplayHdrSnapshot?> _queryTypesOnly(String trigger) async {
    try {
      final raw = await _methodChannel.invokeMethod<List<dynamic>>(
        'displayHdrTypes',
      );
      if (raw == null) return null;
      return DisplayHdrSnapshot.fromTypes(
        raw.map((value) => value.toString()).toList(growable: false),
        trigger: trigger,
      );
    } catch (_) {
      return null;
    }
  }

  /// Retries with a doubling delay so a launch that raced the HDMI handshake
  /// still lands on a real answer. Stops as soon as one attempt concludes
  /// anything, since a display that answered won't answer differently a
  /// second later.
  static Future<DisplayHdrSnapshot?> queryWithRetry({
    int attempts = 4,
    Duration delay = const Duration(seconds: 2),
    Future<void> Function(Duration)? sleep,
    String trigger = 'retry',
  }) async {
    final wait = sleep ?? (d) => Future<void>.delayed(d);
    DisplayHdrSnapshot? last;
    var next = delay;
    for (var i = 0; i < attempts; i++) {
      await wait(next);
      next *= 2;
      final result = await query(trigger: trigger);
      if (result != null) {
        last = result;
        if (result.verdict != DisplayHdrVerdict.cannotAnswer) return result;
      }
    }
    return last;
  }

  /// Publishes a snapshot to [PlatformDetection] and persists it.
  ///
  /// A snapshot that concluded nothing leaves everything alone. Treating an
  /// unanswerable probe as an SDR panel erases the saved capabilities, and
  /// every Dolby Vision item then transcodes until the app is restarted.
  static void apply(DisplayHdrSnapshot? snapshot) {
    if (snapshot == null) {
      _log('display probe: no result, keeping the last detection');
      return;
    }
    switch (snapshot.verdict) {
      case DisplayHdrVerdict.reportsHdr:
        PlatformDetection.setDisplayHdrTypes(snapshot.types);
        unawaited(_persist(snapshot.types));
      case DisplayHdrVerdict.provenSdr:
        PlatformDetection.setDisplayHdrTypes(const <String>[]);
        unawaited(_persist(const <String>[]));
      case DisplayHdrVerdict.cannotAnswer:
        break;
    }
    _log('display probe: ${snapshot.describe()}');
  }

  /// Records the user's own answer, which outranks any heuristic. Used by the
  /// settings override for the case the probe can't reach: a TV that really
  /// is SDR but never identifies itself over EDID.
  static Future<void> recordUserAssertedSdr() async {
    PlatformDetection.setDisplayHdrTypes(const <String>[]);
    await _persist(const <String>[]);
    _log('display probe: SDR recorded from the user');
  }

  /// The last recorded answer, or null when the display has never been read.
  /// An empty list is a real answer, not the absence of one.
  static Future<List<String>?> seedFromCache() async {
    final record = await DeviceCapabilityCache.readMap(
      DeviceCapabilityCache.displayHdrRecordKey,
    );
    final types = record?['types'];
    if (types is List) {
      return types.map((value) => value.toString()).toList(growable: false);
    }
    // Written by a build that only kept the format list. It couldn't record
    // an SDR verdict, so an empty one there means nothing was ever proven.
    final legacy = await DeviceCapabilityCache.readStringList(
      DeviceCapabilityCache.displayHdrKey,
    );
    if (legacy != null && legacy.isNotEmpty) return legacy;
    return null;
  }

  static Future<void> _persist(List<String> types) async {
    await DeviceCapabilityCache.writeMap(
      DeviceCapabilityCache.displayHdrRecordKey,
      <String, dynamic>{'types': types},
    );
    // Kept in step so a downgrade to a build that reads only the list still
    // finds what it expects.
    if (types.isEmpty) {
      await DeviceCapabilityCache.remove(DeviceCapabilityCache.displayHdrKey);
    } else {
      await DeviceCapabilityCache.writeStringList(
        DeviceCapabilityCache.displayHdrKey,
        types,
      );
    }
  }

  /// Subscribes to native display events so a TV or AVR powered on after
  /// launch restores capabilities in place. Idempotent, and the subscription
  /// lives for the app's lifetime.
  static StreamSubscription<dynamic>? listenForDisplayChanges() {
    if (!isSupported) return null;
    if (_subscription != null) return _subscription;
    _subscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (event is Map) {
        apply(
          DisplayHdrSnapshot.fromMap(
            event.map((key, value) => MapEntry(key.toString(), value)),
          ),
        );
      }
    }, onError: (_) {});
    return _subscription;
  }

  static void _log(String message) {
    if (GetIt.instance.isRegistered<LogService>()) {
      GetIt.instance<LogService>().media(message, level: LogLevel.info);
    }
  }

  /// Drops the cached subscription so a test can wire a fresh one.
  static void resetForTesting() {
    _subscription?.cancel();
    _subscription = null;
  }
}
