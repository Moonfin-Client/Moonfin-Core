import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import 'detail_loading.dart';

/// Loading state shared by every detail style and platform.
///
/// Keeps the existing style arguments for callers; the loading state no longer
/// guesses the layout before the item's metadata is available.
class DetailScreenSkeleton extends StatelessWidget {
  final DetailScreenStyle style;
  final UserPreferences? prefs;

  const DetailScreenSkeleton({
    super.key,
    DetailScreenStyle? style,
    this.prefs,
    bool? isModern,
  }) : style =
           style ??
           (isModern != null
               ? (isModern
                     ? DetailScreenStyle.modern
                     : DetailScreenStyle.classic)
               : DetailScreenStyle.modern);

  bool get isModern => style == DetailScreenStyle.modern;

  UserPreferences? get _effectivePrefs =>
      prefs ??
      (GetIt.instance.isRegistered<UserPreferences>()
          ? GetIt.instance<UserPreferences>()
          : null);

  @override
  Widget build(BuildContext context) => DetailLoading(prefs: _effectivePrefs);
}
