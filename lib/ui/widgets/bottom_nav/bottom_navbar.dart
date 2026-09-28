import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/bottom_nav_tabs.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import 'bottom_mini_player.dart';
import 'bottom_nav_controller.dart';
import 'bottom_nav_destinations.dart';
import 'bottom_nav_metrics.dart';
import 'bottom_nav_model.dart';
import 'bottom_nav_tab.dart';
import 'bottom_nav_theme.dart';
import 'dock_bar.dart';
import 'libraries_sheet.dart';
import 'split_bar.dart';
import 'strip_bar.dart';
import 'you_hub_sheet.dart';

/// How much of the bottom of the screen the bottom navbar covers, for content
/// that scrolls underneath it. Only present while the bottom navbar is.
class BottomNavInsetScope extends InheritedWidget {
  final double height;

  const BottomNavInsetScope({
    super.key,
    required this.height,
    required super.child,
  });

  static double? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<BottomNavInsetScope>()
      ?.height;

  @override
  bool updateShouldNotify(BottomNavInsetScope oldWidget) =>
      height != oldWidget.height;
}

/// Bottom padding for a scrollable that may run under the bottom navbar:
/// [fallback] where there is no bar, otherwise enough to clear it.
double bottomNavContentPadding(BuildContext context, double fallback) {
  final inset = BottomNavInsetScope.maybeOf(context);
  if (inset == null) return fallback;
  final clear = inset + 16;
  return clear > fallback ? clear : fallback;
}

/// Builds [builder] with [bottomNavContentPadding] read where the scrollable
/// actually sits. Screens often build their lists from their own context,
/// which is above the layout that provides the inset.
class BottomNavPadded extends StatelessWidget {
  final double fallback;
  final Widget Function(BuildContext context, double bottom) builder;

  const BottomNavPadded({
    super.key,
    required this.fallback,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) =>
      builder(context, bottomNavContentPadding(context, fallback));
}

class BottomNavbar extends StatefulWidget {
  final String? activeRoute;

  /// False while the screen hides its navigation chrome. The tabs go and the
  /// mini player stays.
  final bool chromeVisible;

  /// Drawn above the bar, like the download progress strip.
  final Widget? header;

  /// Whether Split is shrunk down while the user scrolls. The other styles
  /// ignore it.
  final ValueListenable<bool>? minimized;

  /// Asks the layout to bring a minimised Split back.
  final VoidCallback? onExpand;

  const BottomNavbar({
    super.key,
    this.activeRoute,
    this.chromeVisible = true,
    this.header,
    this.minimized,
    this.onExpand,
  });

  /// Room the bar takes along the bottom of the screen, system inset and mini
  /// player included.
  static double heightFor(
    BuildContext context, {
    BottomNavbarStyle? style,
    bool? miniPlayer,
  }) {
    return BottomNavMetrics.heightFor(
      style ??
          GetIt.instance<UserPreferences>().get(
            UserPreferences.bottomNavbarStyle,
          ),
      bottomInset: MediaQuery.paddingOf(context).bottom,
      miniPlayer: miniPlayer ?? bottomMiniPlayerHasTrack(),
    );
  }

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // Every screen builds its own bar, so a tab's screen opens with a bar that
  // has never seen the previous tab. Starting its indicator where the last
  // bar left it lets it spring across instead of just appearing.
  static String? _lastActiveId;
  bool _settled = false;

  final _controller = BottomNavController();
  final _subs = <StreamSubscription>[];
  bool _hasTrack = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
    _hasTrack = bottomMiniPlayerHasTrack();
    final playback = GetIt.instance<PlaybackManager>();
    _subs.addAll([
      playback.state.playingStream.listen((_) => _onPlaybackChanged()),
      playback.queueService.queueChangedStream.listen(
        (_) => _onPlaybackChanged(),
      ),
    ]);
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onPlaybackChanged() {
    final hasTrack = bottomMiniPlayerHasTrack();
    if (hasTrack != _hasTrack && mounted) setState(() => _hasTrack = hasTrack);
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  BottomNavbarStyle get _style => _controller.style;

  void _onTap(BottomNavBarItem item, BottomNavTheme theme) {
    final route = widget.activeRoute ?? '';
    final barHeight = BottomNavbar.heightFor(context, style: _style);
    HapticFeedback.selectionClick();
    switch (item.kind) {
      case BottomNavItemKind.home:
        openBottomNavHome(context, alreadyHome: route == Destinations.home);
      case BottomNavItemKind.tab:
        final tab = item.tab!;
        if (tab == BottomNavTab.libraries) {
          showBottomNavLibrariesSheet(
            context: context,
            controller: _controller,
            theme: theme,
            style: _style,
            barHeight: barHeight,
          );
        } else if (!bottomNavTabMatchesRoute(tab, route)) {
          openBottomNavTab(context, tab);
        }
      case BottomNavItemKind.you:
        showYouHub(
          context: context,
          controller: _controller,
          theme: theme,
          style: _style,
          barHeight: barHeight,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = BottomNavTheme.resolve(context);
    final items = _controller.barItems();
    final views = [
      for (final item in items)
        bottomNavItemView(
          item,
          l10n,
          badge: _controller.unreadMessages,
          avatar: (active, size, color) => BottomNavAvatar(
            imageUrl: _controller.userImageUrl,
            name: _controller.userName,
            size: BottomNavMetrics.avatarSize,
            ring: active ? color : theme.onBar.withValues(alpha: 0.18),
            fallbackColor: theme.onBar,
          ),
        ),
    ];
    final current = activeBarIndex(
      items,
      widget.activeRoute,
      hubOpen: _controller.hubOpen,
    );
    var active = current;
    if (!_settled) {
      final from = items.indexWhere((i) => i.id == _lastActiveId);
      if (current != null && from >= 0 && from != current) {
        active = from;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _settled = true);
        });
      } else {
        _settled = true;
      }
    }
    if (current != null) _lastActiveId = items[current].id;
    final padding = MediaQuery.paddingOf(context);
    final horizontalInset =
        padding.left > padding.right ? padding.left : padding.right;
    final style = _style;

    Widget? player(BottomMiniPlayerVariant variant) => _hasTrack
        ? BottomMiniPlayer(variant: variant, theme: theme)
        : null;

    Widget split(bool minimized) => SplitBarView(
          items: views,
          activeIndex: active,
          theme: theme,
          bottomInset: padding.bottom,
          horizontalInset: horizontalInset,
          tabsVisible: widget.chromeVisible,
          minimized: minimized,
          onExpand: widget.onExpand,
          onTap: (i) => _onTap(items[i], theme),
          searchLabel: l10n.search,
          searchActive: !_controller.hubOpen &&
              widget.activeRoute == Destinations.search,
          onSearch: () {
            HapticFeedback.selectionClick();
            if (widget.activeRoute != Destinations.search) {
              openBottomNavTab(context, BottomNavTab.search);
            }
          },
          miniPlayer: player(BottomMiniPlayerVariant.capsule),
          inlinePlayer: player(BottomMiniPlayerVariant.inline),
        );

    final Widget bar = switch (style) {
      BottomNavbarStyle.dock => DockBarView(
          items: views,
          activeIndex: active,
          theme: theme,
          bottomInset: padding.bottom,
          horizontalInset: horizontalInset,
          tabsVisible: widget.chromeVisible,
          onTap: (i) => _onTap(items[i], theme),
          miniPlayer: player(BottomMiniPlayerVariant.capsule),
        ),
      BottomNavbarStyle.strip => StripBarView(
          items: views,
          activeIndex: active,
          theme: theme,
          bottomInset: padding.bottom,
          horizontalInset: horizontalInset,
          tabsVisible: widget.chromeVisible,
          onTap: (i) => _onTap(items[i], theme),
          miniPlayer: player(BottomMiniPlayerVariant.row),
        ),
      BottomNavbarStyle.split => widget.minimized == null
          ? split(false)
          : ValueListenableBuilder<bool>(
              valueListenable: widget.minimized!,
              builder: (_, minimized, _) => split(minimized),
            ),
    };

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [?widget.header, bar],
    );
  }
}
