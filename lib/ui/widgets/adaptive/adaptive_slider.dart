import 'package:flutter/cupertino.dart' show CupertinoSlider;
import 'package:flutter/material.dart';

import '../../../util/idiom/app_ui_idiom.dart';

Widget adaptiveSlider({
  required double value,
  required ValueChanged<double>? onChanged,
  ValueChanged<double>? onChangeEnd,
  double min = 0.0,
  double max = 1.0,
  int? divisions,
  String? label,
}) {
  if (AppUiIdiomResolver.isApple) {
    return CupertinoSlider(
      value: value.clamp(min, max),
      onChanged: onChanged,
      onChangeEnd: onChangeEnd,
      min: min,
      max: max,
      divisions: divisions,
    );
  }
  return Slider(
    value: value,
    onChanged: onChanged,
    onChangeEnd: onChangeEnd,
    min: min,
    max: max,
    divisions: divisions,
    label: label,
  );
}
