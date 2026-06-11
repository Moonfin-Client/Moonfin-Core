import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/user_repository.dart';
import '../../data/models/aggregated_library.dart';
import '../../data/repositories/multi_server_repository.dart';
import '../../data/repositories/user_views_repository.dart';
import '../../data/services/plugin_sync_service.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/seerr_preferences.dart';
import '../../preference/user_preferences.dart';
import '../../util/overlay_color_palette.dart';
import '../navigation/destinations.dart';
import '../navigation/home_refresh_bus.dart';
import '../screens/settings/settings_side_panel.dart';
import '../screens/syncplay/syncplay_screen.dart';
import 'seerr_icons.dart';
import 'settings/settings_panel.dart';
import 'shuffle_overlay.dart';
import 'user_menu_dialog.dart';

const double _kBarHeight = 54.0;
const double _kIconSize = 24.0;
const double _kBarCornerRadius = 16.0;
const double _kBarHorizontalInset = 8.0;
class MobileBottomNavBar extends StatefulWidget {
  final String? activeRoute;

  const MobileBottomNavBar({super.key, this.activeRoute});

  @override
  State<MobileBottomNavBar> createState() => _MobileBottomNavBarState();
}

class _MobileBottomNavBarState extends State<MobileBottomNavBar> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _userRepo = GetIt.instance<UserRepository>();
  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  List<AggregatedLibrary> _libraries = [];
  String? _userImageUrl;
  StreamSubscription? _userSub;

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
    _viewsRepo.addListener(_onViewsChanged);
    GetIt.instance<PluginSyncService>().addListener(_onPrefsChanged);
    _userSub = _userRepo.currentUserStream.listen((_) => _loadUserImage());
    _loadUserImage();
    _loadLibraries();
  }

  @override
  void dispose() {
    try {
      GetIt.instance<PluginSyncService>().removeListener(_onPrefsChanged);
    } catch (_) {}
    _prefs.removeListener(_onPrefsChanged);
    try {
      _viewsRepo.removeListener(_onViewsChanged);
    } catch (_) {}
    _userSub?.cancel();
    super.dispose();
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    _loadLibraries();
    setState(() {});
  }

  void _onViewsChanged() {
    if (!mounted) return;
    _loadLibraries();
  }

  void _loadUserImage() {
    final user = _userRepo.currentUser;
    if (user == null) {
      if (mounted) setState(() => _userImageUrl = null);
      return;
    }
    try {
      final client = GetIt.instance<MediaServerClient>();
      final url = client.imageApi.getUserImageUrl(user.id);
      if (mounted) setState(() => _userImageUrl = url);
    } catch (_) {
      if (mounted) setState(() => _userImageUrl = null);
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

      List<AggregatedLibrary> filtered = libs;
      if (useMultiServer) {
        try {
          final config = await _viewsRepo.getUserConfiguration();
          final excluded = config.myMediaExcludes.toSet();
          if (excluded.isNotEmpty) {
            filtered = libs.where((lib) => !excluded.contains(lib.id)).toList();
          }
        } catch (_) {}
      }

      if (mounted && !_librariesEqual(_libraries, filtered)) {
        setState(() => _libraries = filtered);
      }
    } catch (_) {}
  }

  bool _librariesEqual(List<AggregatedLibrary> a, List<AggregatedLibrary> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) return false;
    }
    return true;
  }

  bool _isActive(String route) => widget.activeRoute == route;

  List<_BottomNavAction> _contentActions(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final actions = <_BottomNavAction>[
      _BottomNavAction(
        icon: Icons.home_rounded,
        label: l10n.home,
        isActive: _isActive(Destinations.home),
        onTap: () {
          if (_isActive(Destinations.home)) {
            requestHomeRefresh();
            return;
          }
          requestHomeRefreshAfterNavigation();
          context.go(Destinations.home);
        },
      ),
      _BottomNavAction(
        icon: Icons.search_rounded,
        label: l10n.search,
        isActive: _isActive(Destinations.search),
        onTap: () {
          if (_isActive(Destinations.search)) return;
          context.navigateTopLevel(Destinations.search);
        },
      ),
    ];

    if (_prefs.get(UserPreferences.showShuffleButton)) {
      actions.add(
        _BottomNavAction(
          icon: Icons.shuffle_rounded,
          label: l10n.shuffle,
          isActive: false,
          onTap: () => showShuffleOverlay(context),
        ),
      );
    }

    if (_prefs.get(UserPreferences.showGenresButton)) {
      actions.add(
        _BottomNavAction(
          iconBuilder: (size, color) => Image.asset(
            'assets/icons/genres.png',
            width: size,
            height: size,
            color: color,
            fit: BoxFit.contain,
          ),
          label: l10n.genres,
          isActive: _isActive(Destinations.allGenres),
          onTap: () {
            if (_isActive(Destinations.allGenres)) return;
            context.navigateTopLevel(Destinations.allGenres);
          },
        ),
      );
    }

    if (_prefs.get(UserPreferences.showFavoritesButton)) {
      actions.add(
        _BottomNavAction(
          icon: Icons.favorite_rounded,
          label: l10n.favorites,
          isActive: _isActive(Destinations.allFavorites),
          onTap: () {
            if (_isActive(Destinations.allFavorites)) return;
            context.navigateTopLevel(Destinations.allFavorites);
          },
        ),
      );
    }

    if (_prefs.get(UserPreferences.enableFolderView)) {
      actions.add(
        _BottomNavAction(
          icon: Icons.folder_rounded,
          label: l10n.folders,
          isActive: _isActive(Destinations.folderView),
          onTap: () {
            if (_isActive(Destinations.folderView)) return;
            context.navigateTopLevel(Destinations.folderView);
          },
        ),
      );
    }

    final showSyncPlay = _prefs.get(UserPreferences.syncPlayEnabled) &&
        _prefs.get(UserPreferences.showSyncPlayButton);
    if (showSyncPlay) {
      actions.add(
        _BottomNavAction(
          icon: Icons.groups_rounded,
          label: l10n.syncPlay,
          isActive: false,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const SyncPlayScreen()),
          ),
        ),
      );
    }

    if (_seerrEnabled()) {
      final seerrPrefs = GetIt.instance<SeerrPreferences>();
      final displayName = seerrPrefs.moonfinDisplayName.trim();
      final label = displayName.isNotEmpty
          ? displayName
          : (seerrPrefs.isSeerrVariant ? l10n.seerr : l10n.jellyseerr);
      actions.add(
        _BottomNavAction(
          iconBuilder: (size, color) => seerrPrefs.isSeerrVariant
              ? SeerrIcon(size: size, color: color)
              : JellyseerrIcon(size: size, color: color),
          label: label,
          isActive: _isActive(Destinations.seerrDiscover),
          onTap: () {
            if (_isActive(Destinations.seerrDiscover)) return;
            context.navigateTopLevel(Destinations.seerrDiscover);
          },
        ),
      );
    }

    final activeRoute = widget.activeRoute ?? '';
    if (_prefs.get(UserPreferences.showLibrariesInToolbar) &&
        _libraries.isNotEmpty) {
      actions.add(
        _BottomNavAction(
          iconBuilder: (size, color) => Image.asset(
            'assets/icons/clapperboard.png',
            width: size,
            height: size,
            color: color,
            fit: BoxFit.contain,
          ),
          label: l10n.libraries,
          isActive: activeRoute.startsWith('/library') ||
              activeRoute.startsWith('/music'),
          onTap: () => _showLibrariesSheet(context),
        ),
      );
    }

    return actions;
  }

  bool _seerrEnabled() {
    try {
      return _prefs.get(UserPreferences.showSeerrButton) &&
          GetIt.instance<PluginSyncService>().seerrAvailable;
    } catch (_) {
      return false;
    }
  }

  _BottomNavAction _settingsAction(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    return _BottomNavAction(
      icon: Icons.settings_rounded,
      label: l10n.settings,
      isActive: false,
      onTap: () => SettingsPanel.open(context, const SettingsSidePanel()),
    );
  }

  void _navigateToLibrary(AggregatedLibrary lib) {
    if (lib.collectionType == 'music') {
      context.navigateTopLevel('/music/${lib.id}');
    } else if (lib.collectionType == 'livetv') {
      context.navigateTopLevel(Destinations.liveTvGuide);
    } else {
      context.navigateTopLevel('/library/${lib.id}');
    }
  }

  Future<void> _showMoreSheet(
    BuildContext context,
    List<_BottomNavAction> overflow,
  ) async {
    final l10n = AppLocalizations.of(context);
    final accent = Theme.of(context).colorScheme.primary;
    final surface = _resolveBarColor(context, forSheet: true);

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return _SheetSurface(
          color: surface,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSheetHandle(),
                _buildUserHeader(sheetContext),
                const Divider(height: 1),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      for (final action in overflow)
                        ListTile(
                          leading: _icon(
                            action,
                            color: action.isActive
                                ? accent
                                : Colors.white.withValues(alpha: 0.85),
                          ),
                          title: Text(
                            action.label,
                            style: TextStyle(
                              color: action.isActive ? accent : Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(sheetContext).pop();
                            action.onTap();
                          },
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: TextButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    child: Text(l10n.close),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showLibrariesSheet(BuildContext context) async {
    final surface = _resolveBarColor(context, forSheet: true);
    final l10n = AppLocalizations.of(context);
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return _SheetSurface(
          color: surface,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSheetHandle(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                  child: Text(
                    l10n.libraries,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 8),
                    children: [
                      for (final lib in _libraries)
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/clapperboard.png',
                            width: 22,
                            height: 22,
                            color: Colors.white.withValues(alpha: 0.85),
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            lib.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(sheetContext).pop();
                            _navigateToLibrary(lib);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSheetHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 6),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildUserHeader(BuildContext sheetContext) {
    final user = _userRepo.currentUser;
    final initial = (user?.name.isNotEmpty == true)
        ? user!.name[0].toUpperCase()
        : '?';
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: ClipOval(
          child: _userImageUrl != null
              ? Image.network(
                  _userImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _avatarFallback(initial),
                )
              : _avatarFallback(initial),
        ),
      ),
      title: Text(
        user?.name ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: Colors.white.withValues(alpha: 0.6),
      ),
      onTap: () {
        Navigator.of(sheetContext).pop();
        showUserMenu(context);
      },
    );
  }

  Widget _avatarFallback(String initial) {
    return Container(
      color: Colors.white.withValues(alpha: 0.1),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _overlayColor() {
    return OverlayColorPalette.resolveColor(
      _prefs.get(UserPreferences.navbarColor),
    );
  }

  double _overlayOpacity() {
    return (_prefs.get(UserPreferences.navbarOpacity) / 100.0)
        .clamp(0.0, 1.0);
  }

  Color _resolveBarColor(BuildContext context, {bool forSheet = false}) {
    final overlay = _overlayColor();
    final opacity = _overlayOpacity();
    final baseColor = overlay.withValues(alpha: opacity);
    if (forSheet) {
      final base = Theme.of(context).colorScheme.surface;
      return Color.alphaBlend(baseColor.withValues(alpha: 0.98), base);
    }
    return baseColor;
  }

  Widget _icon(_BottomNavAction action, {required Color color}) {
    return action.iconBuilder?.call(_kIconSize, color) ??
        Icon(action.icon, size: _kIconSize, color: color);
  }

  Widget _buildTab(BuildContext context, _BottomNavAction action) {
    final accent = Theme.of(context).colorScheme.primary;
    final color = action.isActive ? accent : Colors.white.withValues(alpha: 0.6);
    return Semantics(
      button: true,
      selected: action.isActive,
      label: action.label,
      child: InkResponse(
        onTap: action.onTap,
        radius: 40,
        containedInkWell: true,
        highlightShape: BoxShape.rectangle,
        child: Tooltip(
          message: action.label,
          preferBelow: false,
          child: SizedBox(
            width: 64,
            height: double.infinity,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                width: 56,
                height: 32,
                decoration: BoxDecoration(
                  color: action.isActive
                      ? accent.withValues(alpha: 0.16)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: _icon(action, color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final content = _contentActions(context, l10n);
    final settings = _settingsAction(context, l10n);
    final actions = <_BottomNavAction>[...content, settings];

    const maxInline = 5;
    final List<_BottomNavAction> tabs;
    final bool fill;
    if (actions.length <= maxInline) {
      tabs = actions;
      fill = false;
    } else {
      final primary = actions.take(4).toList();
      final overflow = actions.skip(4).toList();
      tabs = <_BottomNavAction>[
        ...primary,
        _BottomNavAction(
          icon: Icons.more_horiz_rounded,
          label: l10n.more,
          isActive: overflow.any((a) => a.isActive),
          onTap: () => _showMoreSheet(context, overflow),
        ),
      ];
      fill = true;
    }

    final barColor = _resolveBarColor(context);
    final borderAlpha = 0.08 * _overlayOpacity();

    final bar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: _kBarHorizontalInset),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kBarCornerRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: barColor,
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: borderAlpha),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: _kBarHeight,
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisAlignment: fill
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final tab in tabs)
                      fill
                          ? Expanded(child: _buildTab(context, tab))
                          : _buildTab(context, tab),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return bar;
  }
}

class _BottomNavAction {
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavAction({
    this.icon,
    this.iconBuilder,
    required this.label,
    required this.isActive,
    required this.onTap,
  });
}

class _SheetSurface extends StatelessWidget {
  final Color color;
  final Widget child;

  const _SheetSurface({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Material(
        color: color,
        child: child,
      ),
    );
  }
}
