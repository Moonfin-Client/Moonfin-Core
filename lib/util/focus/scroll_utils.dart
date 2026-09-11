import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

Duration get navigationAnimationDuration {
  if (GetIt.I.isRegistered<UserPreferences>()) {
    return GetIt.I<UserPreferences>()
        .get(UserPreferences.navigationAnimationSpeed)
        .duration;
  }
  return NavigationAnimationSpeed.medium.duration;
}

const Curve _kScrollCurve = Curves.easeOut;

void scrollListToIndex(
  ScrollController controller,
  int index, {
  required double itemExtent,
  double leadingPadding = 0,
  bool animate = true,
  Duration? duration,
  Curve curve = _kScrollCurve,
}) {
  if (!controller.hasClients) return;
  final effectiveDuration = duration ?? navigationAnimationDuration;
  final maxOffset = controller.position.maxScrollExtent;
  final target = (index * itemExtent + leadingPadding).clamp(0.0, maxOffset);
  if (animate) {
    controller.animateTo(target, duration: effectiveDuration, curve: curve);
  } else {
    controller.jumpTo(target);
  }
}

double computeAlignmentForBand({
  required double desiredItemTop,
  required double viewportDim,
  required double itemExtent,
}) {
  final denom = viewportDim - itemExtent;
  if (denom <= 0) return 0.0;
  return (desiredItemTop / denom).clamp(0.0, 1.0);
}

void focusItemAndEnsureVisible({
  required bool Function() isMounted,
  required List<FocusNode> focusNodes,
  required int index,
  double alignment = 0.2,
  Duration? duration,
  Curve curve = Curves.easeOut,
}) {
  if (!isMounted() || index < 0 || index >= focusNodes.length) return;
  final node = focusNodes[index];
  final effectiveDuration = duration ?? navigationAnimationDuration;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!isMounted()) return;
    if (!node.hasFocus) {
      node.requestFocus();
    }
    final targetContext = node.context;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: effectiveDuration,
      curve: curve,
      alignment: alignment,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
  });
}
