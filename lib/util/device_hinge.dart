import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'platform_detection.dart';

/// How far a folding phone is open. The iOS runner sends these by name, so
/// its strings in HingeBridge follow any rename here.
enum HingeStatus { unknown, closed, partiallyOpen, fullyOpen }

/// A folding iPhone's hinge, reported by the iOS runner. Every other device
/// stays [HingeStatus.unknown].
class DeviceHinge {
  DeviceHinge._();

  static const _channel = MethodChannel('com.moonfin/hinge');
  static final _statusByName = HingeStatus.values.asNameMap();
  static final _status = ValueNotifier<HingeStatus>(HingeStatus.unknown);

  static ValueListenable<HingeStatus> get status => _status;

  @visibleForTesting
  static set debugStatus(HingeStatus value) => _status.value = value;

  /// The gap left over the crease between the two halves of a split layout.
  static const creaseGap = 16.0;

  static void init() {
    if (kIsWeb || !PlatformDetection.isIOS) return;
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'statusChanged') _applyStatusName(call.arguments);
    });
    // The runner may have sent a status before this handler was set.
    _channel
        .invokeMethod<Object?>('getStatus')
        .then(_applyStatusName)
        // A runner built without the bridge has nothing to answer with.
        .onError<MissingPluginException>((_, _) {});
  }

  static void _applyStatusName(Object? name) {
    _status.value = _statusByName[name] ?? HingeStatus.unknown;
  }

  /// Whether the phone stands half open like a laptop: the upper half is the
  /// screen and the lower half lies flat under the hands. A [State] that asks
  /// mixes in [HingeAware] to rebuild when the answer changes.
  static bool isLaptopPosture(BuildContext context) =>
      laptopFoldY(context) != null;

  /// How far down the screen the fold runs while the phone stands half open
  /// like a laptop, and null otherwise. The fold crosses the middle of the
  /// upright screen.
  static double? laptopFoldY(BuildContext context) {
    if (_status.value != HingeStatus.partiallyOpen) return null;
    final size = MediaQuery.sizeOf(context);
    return size.height > size.width ? size.height / 2 : null;
  }

  /// Lays [upper] out above the fold and [lower] below it. [topOffset] is how
  /// far down the screen this widget starts.
  static Widget splitAtFold(
    BuildContext context, {
    required double topOffset,
    required Widget upper,
    required Widget lower,
  }) {
    final fold = MediaQuery.sizeOf(context).height / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: (fold - topOffset - creaseGap / 2).clamp(
            0.0,
            double.infinity,
          ),
          child: upper,
        ),
        const SizedBox(height: creaseGap),
        Expanded(child: lower),
      ],
    );
  }
}

/// Rebuilds a [State] when the hinge opens, closes or stops half way.
mixin HingeAware<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    DeviceHinge.status.addListener(_onHingeChanged);
  }

  @override
  void dispose() {
    DeviceHinge.status.removeListener(_onHingeChanged);
    super.dispose();
  }

  /// Called before the rebuild when the hinge status changes.
  @protected
  void didChangeHinge() {}

  void _onHingeChanged() {
    didChangeHinge();
    setState(() {});
  }
}
