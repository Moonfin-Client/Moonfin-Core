import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../preference/user_preferences.dart';

class PreferenceBinding<T> extends ValueNotifier<T> {
  final Preference<T> _preference;

  PreferenceBinding(PreferenceStore store, this._preference) : super(GetIt.instance<UserPreferences>().get(_preference));

  @override
  set value(T newValue) {
    super.value = newValue;
    unawaited(GetIt.instance<UserPreferences>().set(_preference, newValue));
  }

  void reset() {
    value = _preference.defaultValue;
  }
}
