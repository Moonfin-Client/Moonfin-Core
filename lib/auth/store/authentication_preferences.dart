import 'dart:convert';

import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../preference/preference_constants.dart';

class AuthenticationPreferences {
  final PreferenceStore _store;

  AuthenticationPreferences(this._store);

  static final autoLoginUserBehavior = EnumPreference(
    key: 'pref_auto_login_behavior',
    defaultValue: UserSelectBehavior.lastUser,
    values: UserSelectBehavior.values,
  );

  static final autoLoginServerId = Preference(
    key: 'pref_auto_login_server_id',
    defaultValue: '',
  );

  static final autoLoginUserId = Preference(
    key: 'pref_auto_login_user_id',
    defaultValue: '',
  );

  static final lastServerId = Preference(
    key: 'pref_last_server_id',
    defaultValue: '',
  );

  static final lastUserId = Preference(
    key: 'pref_last_user_id',
    defaultValue: '',
  );

  static final alwaysAuthenticate = Preference(
    key: 'pref_always_authenticate',
    defaultValue: false,
  );

  static final sortBy = EnumPreference(
    key: 'pref_user_sort_by',
    defaultValue: UserSortBy.lastUsed,
    values: UserSortBy.values,
  );

  /// Managers who chose Don't Ask Again, as "serverId:userId" keys.
  static final householdOfferSuppressed = Preference(
    key: 'pref_household_offer_suppressed',
    defaultValue: '',
  );

  UserSelectBehavior get loginBehavior =>
      _store.get(autoLoginUserBehavior);

  String get savedAutoLoginServerId => _store.get(autoLoginServerId);
  String get savedAutoLoginUserId => _store.get(autoLoginUserId);
  String get savedLastServerId => _store.get(lastServerId);
  String get savedLastUserId => _store.get(lastUserId);
  bool get shouldAlwaysAuthenticate => _store.get(alwaysAuthenticate);
  UserSortBy get userSortBy => _store.get(sortBy);

  Future<void> setLastServerId(String id) =>
      _store.set(lastServerId, id);

  Future<void> setLastUserId(String id) =>
      _store.set(lastUserId, id);

  Future<void> setAutoLogin(String serverId, String userId) async {
    await _store.set(autoLoginServerId, serverId);
    await _store.set(autoLoginUserId, userId);
  }

  Future<void> clearAutoLogin() async {
    await _store.set(autoLoginServerId, '');
    await _store.set(autoLoginUserId, '');
  }

  /// Whether this manager on this server chose not to be offered the rest of
  /// their household again after signing in.
  bool isHouseholdOfferSuppressed(String serverId, String userId) =>
      _householdOfferKeys().contains('$serverId:$userId');

  Future<void> suppressHouseholdOffer(String serverId, String userId) async {
    final keys = _householdOfferKeys()..add('$serverId:$userId');
    await _store.set(householdOfferSuppressed, jsonEncode(keys.toList()));
  }

  Set<String> _householdOfferKeys() {
    final raw = _store.get(householdOfferSuppressed);
    final decoded = raw.isEmpty ? null : jsonDecode(raw);
    return decoded is! List
        ? <String>{}
        : decoded.whereType<String>().toSet();
  }
}

enum UserSortBy {
  lastUsed,
  alphabetical,
}
