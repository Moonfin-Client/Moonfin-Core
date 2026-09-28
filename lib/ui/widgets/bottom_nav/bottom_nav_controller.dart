import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/models/aggregated_library.dart';
import '../../../data/repositories/multi_server_repository.dart';
import '../../../data/repositories/user_views_repository.dart';
import '../../../data/services/library_scope_service.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../data/services/saved_media_presence.dart';
import '../../../data/services/server_messages_service.dart';
import '../../../preference/bottom_nav_tabs.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/game_library.dart';
import '../../../util/live_tv_library.dart';
import '../downloads_nav_slot.dart';
import 'bottom_nav_model.dart';

/// Everything the bottom navbar knows beyond its own layout: which tabs are
/// on offer, the libraries behind the Libraries tab, the signed in user and
/// the unread count. Each bar owns one.
class BottomNavController extends ChangeNotifier {
  BottomNavController() {
    _prefs.addListener(_onPrefsChanged);
    _viewsRepo.addListener(_scheduleLibrariesReload);
    _pluginSync?.addListener(_onPrefsChanged);
    _messages?.addListener(notifyListeners);
    _savedMedia?.addListener(notifyListeners);
    _userSub = _userRepo.currentUserStream.listen((_) {
      _loadUser();
      notifyListeners();
    });
    _signature = _prefsSignature();
    _multiServer = _prefs.get(UserPreferences.enableMultiServerLibraries);
    _loadUser();
    _loadLibraries();
  }

  final _prefs = GetIt.instance<UserPreferences>();
  final _userRepo = GetIt.instance<UserRepository>();
  final _viewsRepo = GetIt.instance<UserViewsRepository>();
  final PluginSyncService? _pluginSync = _maybe<PluginSyncService>();
  final ServerMessagesService? _messages = _maybe<ServerMessagesService>();
  final SavedMediaPresence? _savedMedia = _maybe<SavedMediaPresence>();

  static T? _maybe<T extends Object>() =>
      GetIt.instance.isRegistered<T>() ? GetIt.instance<T>() : null;

  StreamSubscription? _userSub;
  Timer? _librariesReloadDebounce;
  String _signature = '';
  late bool _multiServer;
  bool _disposed = false;

  List<AggregatedLibrary> _libraries = const [];
  String? _userImageUrl;
  String _userName = '';
  bool _hubOpen = false;

  String? get userImageUrl => _userImageUrl;
  String get userName => _userName;

  /// Name of the server the user is signed in to, when it is known.
  String? get serverName {
    try {
      final serverId = _maybe<SessionRepository>()?.activeServerId;
      if (serverId == null) return null;
      for (final server in _maybe<ServerRepository>()?.servers ?? const []) {
        if (server.id == serverId) return server.name;
      }
    } catch (_) {}
    return null;
  }

  bool get hubOpen => _hubOpen;
  set hubOpen(bool value) {
    if (_hubOpen == value) return;
    _hubOpen = value;
    notifyListeners();
  }

  BottomNavbarStyle get style => _prefs.get(UserPreferences.bottomNavbarStyle);
  bool get kidsMode => _prefs.get(UserPreferences.kidsModeEnabled);

  BottomNavTabGates get gates => BottomNavTabGates.fromPreferences(
        _prefs,
        seerrAvailable: _pluginSync?.seerrAvailable ?? false,
      );

  bool get _hasLiveTvLibrary => _libraries.any(isLiveTvLibrary);

  /// The libraries behind the Libraries tab. Live TV drops out of the list
  /// once it has a tab or tile of its own.
  List<AggregatedLibrary> get navLibraries => librariesForNav(
        _libraries,
        gates.offers(BottomNavTab.liveTv) && _hasLiveTvLibrary,
        hideLiveTv: kidsMode,
      );

  /// Offered is decided by settings alone, available also needs the data.
  bool isAvailable(BottomNavTab tab) => switch (tab) {
        BottomNavTab.libraries => navLibraries.isNotEmpty,
        BottomNavTab.liveTv => _hasLiveTvLibrary,
        _ => true,
      };

  List<BottomNavBarItem> barItems() => resolveBarItems(
        gates,
        _prefs.get(UserPreferences.bottomNavbarTabs),
        withoutSearch: style == BottomNavbarStyle.split,
        isAvailable: isAvailable,
      );

  List<BottomNavHubTile> hubTiles() {
    final syncPlay = !kidsMode &&
        _prefs.get(UserPreferences.syncPlayEnabled) &&
        _prefs.get(UserPreferences.showSyncPlayButton);
    return resolveHubTiles(
      gates: gates,
      barItems: barItems(),
      isAvailable: isAvailable,
      savedAvailable:
          DownloadsNavSlot.isOffered() && DownloadsNavSlot.hasSavedMedia(),
      shuffle: _prefs.get(UserPreferences.showShuffleButton),
      syncPlay: syncPlay,
      alsoOnBar: style == BottomNavbarStyle.split
          ? const {BottomNavTab.search}
          : const {},
    );
  }

  /// Whether the You hub lists server messages: the user turned the button on
  /// and the server has something to say.
  bool get messagesVisible =>
      _prefs.get(UserPreferences.showServerMessagesButton) &&
      (_messages?.messages.isNotEmpty ?? false);

  /// Unread count for the avatar and the hub row. Zero while the messages
  /// entry is hidden, so the avatar never nags about something unreachable.
  int get unreadMessages =>
      messagesVisible ? (_messages?.unreadCount ?? 0) : 0;

  // Rebuilding the bar on every preference write in the app would be wasted
  // work, so only the settings the bar reads are compared.
  String _prefsSignature() => [
        _prefs.get(UserPreferences.bottomNavbarStyle).name,
        _prefs.get(UserPreferences.bottomNavbarTabs),
        _prefs.get(UserPreferences.kidsModeEnabled),
        _prefs.get(UserPreferences.showLibrariesInToolbar),
        _prefs.get(UserPreferences.showFavoritesButton),
        _prefs.get(UserPreferences.showGenresButton),
        _prefs.get(UserPreferences.showLiveTvButton),
        _prefs.get(UserPreferences.showSeerrButton),
        _prefs.get(UserPreferences.enableFolderView),
        _prefs.get(UserPreferences.showShuffleButton),
        _prefs.get(UserPreferences.syncPlayEnabled),
        _prefs.get(UserPreferences.showSyncPlayButton),
        _prefs.get(UserPreferences.showServerMessagesButton),
        _prefs.get(UserPreferences.showDownloadsButton),
        _prefs.get(UserPreferences.enableMultiServerLibraries),
        _prefs.get(UserPreferences.navbarColor),
        _prefs.get(UserPreferences.navbarOpacity),
        _pluginSync?.seerrAvailable ?? false,
      ].join('|');

  void _onPrefsChanged() {
    final next = _prefsSignature();
    if (next == _signature) return;
    _signature = next;
    // Only the multi-server switch changes where the libraries come from.
    final multiServer = _prefs.get(UserPreferences.enableMultiServerLibraries);
    if (multiServer != _multiServer) {
      _multiServer = multiServer;
      _scheduleLibrariesReload();
    }
    notifyListeners();
  }

  // Collapses a burst of change notifications, like the settings sync
  // applying a whole profile, into a single library reload.
  void _scheduleLibrariesReload() {
    _librariesReloadDebounce?.cancel();
    _librariesReloadDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!_disposed) _loadLibraries();
    });
  }

  void _loadUser() {
    final user = _userRepo.currentUser;
    _userName = user?.name ?? '';
    if (user == null) {
      _userImageUrl = null;
      return;
    }
    try {
      _userImageUrl = GetIt.instance<MediaServerClient>()
          .imageApi
          .getUserImageUrl(user.id);
    } catch (_) {
      _userImageUrl = null;
    }
  }

  Future<void> _loadLibraries() async {
    try {
      final useMultiServer = _prefs.get(
        UserPreferences.enableMultiServerLibraries,
      );
      final libs = useMultiServer
          ? await GetIt.instance<MultiServerRepository>()
              .getAggregatedLibraries()
          : await _viewsRepo.getUserViews();

      if (GetIt.instance.isRegistered<GameLibraryRegistry>()) {
        unawaited(GetIt.instance<GameLibraryRegistry>().refresh());
      }

      final filtered = useMultiServer
          ? await GetIt.instance<LibraryScopeService>()
              .withoutHiddenLibraries(libs)
          : libs;

      if (_disposed || _sameLibraries(_libraries, filtered)) return;
      _libraries = filtered;
      notifyListeners();
    } catch (_) {}
  }

  static bool _sameLibraries(
    List<AggregatedLibrary> a,
    List<AggregatedLibrary> b,
  ) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) return false;
    }
    return true;
  }

  @override
  void dispose() {
    _disposed = true;
    _prefs.removeListener(_onPrefsChanged);
    try {
      _viewsRepo.removeListener(_scheduleLibrariesReload);
      _pluginSync?.removeListener(_onPrefsChanged);
      _messages?.removeListener(notifyListeners);
      _savedMedia?.removeListener(notifyListeners);
    } catch (_) {}
    _userSub?.cancel();
    _librariesReloadDebounce?.cancel();
    super.dispose();
  }
}
