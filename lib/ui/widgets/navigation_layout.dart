import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import '../../util/overlay_color_palette.dart';
import 'download_progress_bar.dart';
import 'left_sidebar.dart';
import 'mobile_bottom_nav_bar.dart';
import 'top_toolbar.dart';

import 'dart:async';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import '../../data/models/aggregated_item.dart';
import '../../util/focus/dpad_keys.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';

class NavigationLayout extends StatefulWidget {
  final String? activeRoute;
  final Widget child;
  final bool showBackButton;
  final bool showNavigationChrome;

  /// Keep the top toolbar fixed instead of letting it translate away as the
  /// content scrolls. No effect off-TV, where the toolbar is already fixed.
  final bool pinTopToolbar;

  static bool get allowBottomNavbar =>
      PlatformDetection.useMobileUi && !PlatformDetection.isWeb;

  static List<NavbarPosition> get availableNavbarPositions => <NavbarPosition>[
    NavbarPosition.top,
    NavbarPosition.left,
    if (allowBottomNavbar) NavbarPosition.bottom,
  ];

  static NavbarPosition sanitizeNavbarPosition(NavbarPosition position) {
    if (position == NavbarPosition.bottom && !allowBottomNavbar) {
      return NavbarPosition.top;
    }
    return position;
  }

  static final positionNotifier = ValueNotifier<NavbarPosition?>(
    sanitizeNavbarPosition(
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition),
    ),
  );

  static final focusNavbarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusNavbarAvatarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusContentFromNavbarNotifier = ValueNotifier<VoidCallback?>(
    null,
  );
  static final focusDetailsPlayButtonNotifier = ValueNotifier<FocusNode?>(null);

  /// True while a media-bar trailer is playing; the toolbar and sidebar fade
  /// out on TV. Focusing chrome cancels the trailer, which fades them back in.
  static final trailerImmersiveNotifier = ValueNotifier<bool>(false);

  const NavigationLayout({
    super.key,
    this.activeRoute,
    required this.child,
    this.showBackButton = false,
    this.showNavigationChrome = true,
    this.pinTopToolbar = false,
  });

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> with WidgetsBindingObserver {
  final _prefs = GetIt.instance<UserPreferences>();
  final _contentFocusNode = FocusNode(debugLabel: 'NavigationContent');
  final ValueNotifier<double> _toolbarScrollOffset = ValueNotifier<double>(0.0);
  late NavbarPosition _position;
  final _playbackManager = GetIt.instance<PlaybackManager>();
  StreamSubscription? _playSub;
  StreamSubscription? _queueSub;

  @override
  void initState() {
    super.initState();
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    _position = NavigationLayout.sanitizeNavbarPosition(storedPosition);
    if (_position != storedPosition) {
      _prefs.set(UserPreferences.navbarPosition, _position);
    }
    WidgetsBinding.instance.addObserver(this);
    NavigationLayout.positionNotifier.addListener(_onPositionNotified);
    // The top toolbar grows to host the embedded music bar; rebuild so the
    // content inset tracks that height when playback starts or stops.
    _playSub = _playbackManager.state.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
    _queueSub = _playbackManager.queueService.queueChangedStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    NavigationLayout.positionNotifier.removeListener(_onPositionNotified);
    WidgetsBinding.instance.removeObserver(this);
    _playSub?.cancel();
    _queueSub?.cancel();
    _contentFocusNode.dispose();
    _toolbarScrollOffset.dispose();
    super.dispose();
  }

  void _onPositionNotified() {
    final pos = NavigationLayout.positionNotifier.value;
    if (pos != null && pos != _position && mounted) {
      final normalized = NavigationLayout.sanitizeNavbarPosition(pos);
      if (normalized != pos) {
        NavigationLayout.positionNotifier.value = normalized;
      }
      if (_prefs.get(UserPreferences.navbarPosition) != normalized) {
        _prefs.set(UserPreferences.navbarPosition, normalized);
      }
      if (normalized != _position) {
        setState(() => _position = normalized);
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshPosition();
  }

  void _refreshPosition() {
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    final pos = NavigationLayout.sanitizeNavbarPosition(storedPosition);
    if (storedPosition != pos) {
      _prefs.set(UserPreferences.navbarPosition, pos);
      NavigationLayout.positionNotifier.value = pos;
    }
    if (pos != _position && mounted) setState(() => _position = pos);
  }

  @override
  Widget build(BuildContext context) {
    final layout = switch (_position) {
      NavbarPosition.left => _buildSidebar(),
      NavbarPosition.top => _buildToolbar(),
      NavbarPosition.bottom =>
        NavigationLayout.allowBottomNavbar ? _buildBottomBar() : _buildToolbar(),
    };
    // Grouping only pays off when the tier draws real backdrop blurs, the
    // sheen tier never does.
    return AppColorScheme.isGlass && GlassSettings.blursBackdrop
        ? BackdropGroup(child: layout)
        : layout;
  }

  Widget _buildBottomBar() {
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: content),
            const DownloadProgressBar(),
            const BottomMusicBar(),
            AnimatedOpacity(
              opacity: widget.showNavigationChrome ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: !widget.showNavigationChrome,
                child: MobileBottomNavBar(activeRoute: widget.activeRoute),
              ),
            ),
          ],
        ),
        if (widget.showBackButton)
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: _buildFloatingBackButton(),
            ),
          ),
      ],
    );
  }

  Widget _buildToolbar() {
    final translateWithScroll = PlatformDetection.isTV && !widget.pinTopToolbar;
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );
    final toolbar = ValueListenableBuilder<bool>(
      valueListenable: NavigationLayout.trailerImmersiveNotifier,
      builder: (context, trailerImmersive, child) {
        final show = widget.showNavigationChrome &&
            !(trailerImmersive && PlatformDetection.isTV);
        return AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: IgnorePointer(
            ignoring: !show,
            child: child,
          ),
        );
      },
      child: TopToolbar(
        activeRoute: widget.activeRoute,
        showBackButton: widget.showBackButton,
        contentFocusNode: _contentFocusNode,
      ),
    );
    final maxTranslate = TopToolbar.heightFor(context);
    final body = translateWithScroll
        ? NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.axis != Axis.vertical) return false;
              final px = n.metrics.pixels.clamp(0.0, double.infinity);
              if ((px - _toolbarScrollOffset.value).abs() > 0.5) {
                _toolbarScrollOffset.value = px;
              }
              return false;
            },
            child: content,
          )
        : content;
    final musicExtra = TopToolbar.musicBarExtraHeight();
    final insetBody = (widget.pinTopToolbar && musicExtra > 0)
        ? Padding(padding: EdgeInsets.only(top: musicExtra), child: body)
        : body;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: insetBody),
              if (translateWithScroll)
                ValueListenableBuilder<double>(
                  valueListenable: _toolbarScrollOffset,
                  builder: (_, offset, child) {
                    final translate = widget.showNavigationChrome
                        ? offset.clamp(0.0, maxTranslate)
                        : maxTranslate;
                    return Positioned(
                      left: 0,
                      right: 0,
                      top: -translate,
                      child: IgnorePointer(
                        ignoring: !widget.showNavigationChrome || translate >= maxTranslate,
                        child: child!,
                      ),
                    );
                  },
                  child: toolbar,
                )
              else
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: toolbar,
                ),
              if (widget.showBackButton &&
                  !PlatformDetection.isTV &&
                  !widget.showNavigationChrome)
                Positioned(
                  top: 16,
                  left: 16,
                  child: SafeArea(child: _buildFloatingBackButton()),
                ),
            ],
          ),
        ),
        const DownloadProgressBar(),
      ],
    );
  }

  Widget _buildSidebar() {
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );

    final sidebar = ValueListenableBuilder<bool>(
      valueListenable: NavigationLayout.trailerImmersiveNotifier,
      builder: (context, trailerImmersive, child) {
        final show = widget.showNavigationChrome &&
            !(trailerImmersive && PlatformDetection.isTV);
        return AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: IgnorePointer(
            ignoring: !show,
            child: child,
          ),
        );
      },
      child: LeftSidebar(
        activeRoute: widget.activeRoute,
        contentFocusNode: _contentFocusNode,
        showBackButton: widget.showBackButton,
      ),
    );

    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: content),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: sidebar,
                ),
                if (widget.showBackButton && !PlatformDetection.isTV)
                  Positioned(
                    top: 16,
                    left: 88,
                    child: _buildFloatingBackButton(),
                  ),
              ],
            ),
          ),
          const DownloadProgressBar(),
        ],
      );
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: content),
              Positioned.fill(
                child: sidebar,
              ),
            ],
          ),
        ),
        const DownloadProgressBar(),
      ],
    );
  }

  Widget _buildFloatingBackButton() {
    final overlayColor = OverlayColorPalette.resolveColor(
      _prefs.get(UserPreferences.navbarColor),
    );
    final opacity = _prefs.get(UserPreferences.navbarOpacity) / 100.0;
    final backgroundColor = ThemeRegistry.active.transparentNavbarSurface
        ? Colors.transparent
        : overlayColor.withValues(alpha: opacity);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.popOrHome(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BottomMusicBar extends StatefulWidget {
  const BottomMusicBar({super.key});

  @override
  State<BottomMusicBar> createState() => _BottomMusicBarState();
}

class _BottomMusicBarState extends State<BottomMusicBar> {
  final _manager = GetIt.instance<PlaybackManager>();
  StreamSubscription? _playSub;
  StreamSubscription? _queueSub;

  @override
  void initState() {
    super.initState();
    _playSub = _manager.state.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
    _queueSub = _manager.queueService.queueChangedStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _playSub?.cancel();
    _queueSub?.cancel();
    super.dispose();
  }

  AggregatedItem? get _currentItem {
    final raw = _manager.queueService.currentItem;
    return raw is AggregatedItem ? raw : null;
  }

  Widget _buildBarButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Focus(
      onKeyEvent: (node, event) {
        if (isActivateKey(event)) {
          onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Builder(
        builder: (context) {
          final focused = Focus.of(context).hasFocus;
          return GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 90),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: focused
                    ? AppColorScheme.onSurface
                    : Colors.transparent,
              ),
              child: Icon(
                icon,
                size: 20,
                color: focused ? AppColorScheme.surface : AppColorScheme.onSurface,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = _currentItem;
    if (item == null || !item.isAudioLike) {
      return const SizedBox.shrink();
    }

    final isPlaying = _manager.state.isPlaying;
    final artist = item.artists.isNotEmpty
        ? item.artists.join(', ')
        : item.albumArtist ?? '';
    final displayText = artist.isNotEmpty ? '${item.name} - $artist' : item.name;

    return FocusTraversalGroup(
      child: GlassSurface(
        cornerRadius: 0,
        reinforced: true,
        fallbackColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: SizedBox(
          height: 38,
          child: Row(
            children: [
              Icon(
                Icons.music_note,
                size: 16,
                color: AppColorScheme.accent,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: () => appRouter.push(Destinations.audioPlayer),
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: AppColorScheme.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildBarButton(
                    icon: Icons.skip_previous,
                    onPressed: _manager.previous,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: isPlaying ? Icons.pause : Icons.play_arrow,
                    onPressed: isPlaying ? _manager.pause : _manager.resume,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: Icons.skip_next,
                    onPressed: _manager.next,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: Icons.stop,
                    onPressed: () => unawaited(_manager.stop(userInitiated: true)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
