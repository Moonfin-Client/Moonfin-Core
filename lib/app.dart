import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart' show kBackMouseButton, kForwardMouseButton;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';
import 'package:window_manager/window_manager.dart';

import 'data/services/app_update_service.dart';
import 'data/services/cast/cast_service.dart';
import 'data/services/download_service.dart';
import 'data/services/plugin_sync_service.dart';
import 'data/services/topshelf_service.dart';
import 'di/providers.dart';
import 'l10n/app_localizations.dart';
import 'preference/user_preferences.dart';
import 'syncplay/syncplay_manager.dart';
import 'ui/navigation/app_router.dart';
import 'ui/theme/app_theme.dart';
import 'ui/theme/app_theme_controller.dart';
import 'ui/widgets/cast_mini_player.dart';
import 'ui/widgets/mini_audio_player.dart';
import 'ui/widgets/offline_banner.dart';
import 'ui/widgets/app_update_dialog.dart';
import 'ui/widgets/exit_confirmation_dialog.dart';
import 'ui/screensaver/screensaver_controller.dart';
import 'ui/screensaver/screensaver_host.dart';
import 'util/app_distribution.dart';
import 'util/app_exit.dart';
import 'util/focus/dpad_keys.dart';
import 'util/fullscreen_helper.dart';
import 'util/global_shortcut_focus.dart';
import 'util/focus/input_mode_tracker.dart';
import 'util/platform_detection.dart';
import 'ui/widgets/overlay_sheet.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'util/focus/key_event_utils.dart';
import 'ui/widgets/focus/request_initial_focus.dart';

class MoonfinApp extends StatefulWidget {
  const MoonfinApp({super.key});

  @override
  State<MoonfinApp> createState() => _MoonfinAppState();
}

class _MoonfinAppState extends State<MoonfinApp> {
  late final UserPreferences _prefs;
  late final AppThemeController _themeController;
  Locale? _lastResolvedLocale;

  @override
  void initState() {
    super.initState();
    _prefs = GetIt.instance<UserPreferences>();
    _themeController = AppThemeController.fromPreferences(_prefs);
    _lastResolvedLocale = _resolveLocale();
    _prefs.addListener(_syncThemeFromPrefs);
    _prefs.addListener(_syncLocaleFromPrefs);
    if (PlatformDetection.isAppleTV) {
      TopShelfService().startDeepLinkListener(appRouter.go);
    }
  }

  void _syncThemeFromPrefs() {
    _themeController.refreshFromPreferences(_prefs);
  }

  void _syncLocaleFromPrefs() {
    final next = _resolveLocale();
    if (next != _lastResolvedLocale) {
      _lastResolvedLocale = next;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Locale? _resolveLocale() {
    final override = _prefs.get(UserPreferences.languageOverride);
    if (override == 'system') {
      return null;
    }
    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.toLanguageTag() == override || locale.toString() == override) {
        return locale;
      }
    }
    return null;
  }

  @override
  void dispose() {
    _prefs.removeListener(_syncThemeFromPrefs);
    _prefs.removeListener(_syncLocaleFromPrefs);
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AppThemeScope(
        controller: _themeController,
        child: AnimatedBuilder(
          animation: _themeController,
          builder: (context, _) {
            return MaterialApp.router(
              onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
              theme: AppTheme.buildTheme(_themeController.activeSpec),
              routerConfig: appRouter,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _lastResolvedLocale,
              localeResolutionCallback: (locale, supportedLocales) {
                // Prefer exact match (language + country/script)
                for (final supported in supportedLocales) {
                  if (supported == locale) {
                    return supported;
                  }
                }
                // Fall back to language-only match
                for (final supported in supportedLocales) {
                  if (supported.languageCode == locale?.languageCode) {
                    return supported;
                  }
                }
                return const Locale('en');
              },
              builder: (context, child) {
                var path =
                    appRouter.routerDelegate.currentConfiguration.uri.path;
                try {
                  path = GoRouterState.of(context).uri.path;
                } catch (_) {}

                final hidePlayer =
                    path.startsWith('/player/') ||
                    path == '/live-tv/player' ||
                    path == '/' ||
                    path == '/server-select' ||
                    path == '/server' ||
                    path == '/login';

                final overlay = Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) {
                        final Widget shell = Column(
                          children: [
                            const OfflineBanner(),
                            Expanded(
                              child: _ConnectivityListener(
                                child: child ?? const SizedBox.shrink(),
                              ),
                            ),
                            if (!hidePlayer)
                              const RepaintBoundary(child: MiniAudioPlayer()),
                            if (!hidePlayer)
                              const RepaintBoundary(child: CastMiniPlayer()),
                          ],
                        );
                        final glass = AppColorScheme.isGlass;
                        final Widget content =
                            (glass || PlatformDetection.isTV)
                            ? Stack(
                                fit: StackFit.expand,
                                children: [
                                  if (glass)
                                    Positioned.fill(
                                      child: GlassBackdrop(
                                        animated: !PlatformDetection.isTV,
                                      ),
                                    ),
                                  shell,
                                  if (PlatformDetection.isTV)
                                    const ScreensaverHost(),
                                ],
                              )
                            : shell;
                        return InputModeTracker(
                          child: _GlobalShortcutScope(
                            child: Material(
                              type: MaterialType.transparency,
                              child: content,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );

                final mainChild = PlatformDetection.isAppleTV
                    ? _TvUiScale(child: overlay)
                    : overlay;

                return ListenableBuilder(
                  listenable: _prefs,
                  builder: (context, _) {
                    final scale =
                        _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
                    final systemScale =
                        MediaQuery.textScalerOf(context).scale(1.0);
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: TextScaler.linear(scale * systemScale),
                      ),
                      child: mainChild,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _GlobalShortcutScope extends StatefulWidget {
  final Widget child;

  const _GlobalShortcutScope({required this.child});

  @override
  State<_GlobalShortcutScope> createState() => _GlobalShortcutScopeState();
}

class _GlobalShortcutScopeState extends State<_GlobalShortcutScope>
    with WindowListener, WidgetsBindingObserver {
  static const _maxRouteHistoryEntries = 200;
  static const _mouseThumbNavDebounce = Duration(milliseconds: 180);

  final FocusNode _focusNode = FocusNode(debugLabel: 'GlobalShortcutScope');
  final ScreensaverController _screensaverController =
      GetIt.instance<ScreensaverController>();
  final bool _trackMouseThumbHistory = PlatformDetection.isDesktop || kIsWeb;
  final List<String> _routeHistory = [];
  late final KeyEventCallback _hardwareKeyHandler;
  Timer? _geometrySaveTimer;
  int _routeHistoryIndex = -1;
  DateTime? _lastMouseThumbNavAt;
  String? _pendingRouteHistoryLocation;
  bool _exitDialogShowing = false;

  @override
  void initState() {
    super.initState();
    globalShortcutFocusNode = _focusNode;
    _hardwareKeyHandler = _onHardwareKeyEvent;
    HardwareKeyboard.instance.addHandler(_hardwareKeyHandler);
    if (_trackMouseThumbHistory) {
      appRouter.routerDelegate.addListener(_onRouterStateChanged);
      _onRouterStateChanged();
    }
    WidgetsBinding.instance.addObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.addListener(this);
    }
  }

  String _currentRouteLocation() {
    return appRouter.routerDelegate.currentConfiguration.uri.toString();
  }

  void _onRouterStateChanged() {
    final location = _currentRouteLocation();
    if (_pendingRouteHistoryLocation != null) {
      final expected = _pendingRouteHistoryLocation!;
      _pendingRouteHistoryLocation = null;
      if (location == expected) {
        return;
      }
    }

    if (_routeHistoryIndex >= 0 &&
        _routeHistoryIndex < _routeHistory.length &&
        _routeHistory[_routeHistoryIndex] == location) {
      return;
    }

    if (_routeHistory.isEmpty) {
      _routeHistory.add(location);
      _routeHistoryIndex = 0;
      return;
    }

    final previousIndex = _routeHistoryIndex - 1;
    if (previousIndex >= 0 && _routeHistory[previousIndex] == location) {
      _routeHistoryIndex = previousIndex;
      return;
    }

    final nextIndex = _routeHistoryIndex + 1;
    if (nextIndex < _routeHistory.length &&
        _routeHistory[nextIndex] == location) {
      _routeHistoryIndex = nextIndex;
      return;
    }

    if (_routeHistoryIndex < _routeHistory.length - 1) {
      _routeHistory.removeRange(_routeHistoryIndex + 1, _routeHistory.length);
    }

    _routeHistory.add(location);
    _routeHistoryIndex = _routeHistory.length - 1;
    if (_routeHistory.length > _maxRouteHistoryEntries) {
      final overflow = _routeHistory.length - _maxRouteHistoryEntries;
      _routeHistory.removeRange(0, overflow);
      _routeHistoryIndex -= overflow;
    }
  }

  bool _canRouteHistoryForward() {
    return _routeHistoryIndex >= 0 && _routeHistoryIndex < _routeHistory.length - 1;
  }

  void _navigateRouteHistory(int delta) {
    final next = _routeHistoryIndex + delta;
    if (next < 0 || next >= _routeHistory.length) {
      return;
    }
    _routeHistoryIndex = next;
    final target = _routeHistory[next];
    _pendingRouteHistoryLocation = target;
    appRouter.go(target);
  }

  bool _hasPagelessRouteOnTop(NavigatorState navigatorState) {
    var hasPagelessRouteOnTop = false;
    navigatorState.popUntil((route) {
      hasPagelessRouteOnTop = route.settings is! Page;
      return true;
    });
    return hasPagelessRouteOnTop;
  }

  bool _handleMouseBackNavigation() {
    if (_isPlayerRoute()) {
      return false;
    }

    if (OverlaySheetController.closeTopSheet()) {
      return true;
    }

    final navigatorState = appRouter.routerDelegate.navigatorKey.currentState;
    if (navigatorState != null && _hasPagelessRouteOnTop(navigatorState)) {
      unawaited(navigatorState.maybePop());
      return true;
    }

    if (appRouter.canPop()) {
      appRouter.pop();
      return true;
    }

    if (!_exitDialogShowing) {
      _exitDialogShowing = true;
      unawaited(_showExitConfirmation());
      return true;
    }

    return false;
  }

  bool _handleMouseForwardNavigation() {
    if (_isPlayerRoute()) {
      return false;
    }

    if (_canRouteHistoryForward()) {
      _navigateRouteHistory(1);
      return true;
    }

    return false;
  }

  bool _canHandleMouseThumbNavigation() {
    if (_pendingRouteHistoryLocation != null) {
      return false;
    }

    final now = DateTime.now();
    if (_lastMouseThumbNavAt != null &&
        now.difference(_lastMouseThumbNavAt!) < _mouseThumbNavDebounce) {
      return false;
    }

    _lastMouseThumbNavAt = now;
    return true;
  }

  void _onPointerDown(PointerDownEvent event) {
    if (PlatformDetection.isTV) {
      _screensaverController.notifyInteraction();
    }
    if (!_trackMouseThumbHistory) {
      return;
    }

    final isBackPressed = (event.buttons & kBackMouseButton) != 0;
    final isForwardPressed = (event.buttons & kForwardMouseButton) != 0;
    if (isBackPressed == isForwardPressed) {
      return;
    }
    if (!_canHandleMouseThumbNavigation()) {
      return;
    }

    if (isBackPressed) {
      _handleMouseBackNavigation();
      return;
    }
    if (isForwardPressed) {
      _handleMouseForwardNavigation();
      return;
    }
  }

  @override
  Future<bool> didPopRoute() async {
    if (PlatformDetection.isTV && _screensaverController.dismissIfVisible()) {
      return true;
    }
    if (DialogBackSuppressor.consume()) return true;
    if (OverlaySheetController.closeTopSheet()) return true;
    if (_isPlayerRoute()) return false;
    final navigatorState = appRouter.routerDelegate.navigatorKey.currentState;
    if (navigatorState == null) return false;
    if (_hasPagelessRouteOnTop(navigatorState)) {
      await navigatorState.maybePop();
      return true;
    }
    if (!appRouter.canPop()) {
      if (!_exitDialogShowing) {
        _exitDialogShowing = true;
        unawaited(_showExitConfirmation());
      }
      return true;
    }
    return false;
  }

  bool _isPlayerRoute() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    return path.startsWith('/player/') || path == '/live-tv/player';
  }

  bool _isHomeRoute() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    return path == '/home';
  }

  bool _isEditingText() {
    final focusContext = FocusManager.instance.primaryFocus?.context;
    if (focusContext == null) return false;
    return focusContext.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  bool _onHardwareKeyEvent(KeyEvent event) {
    if (PlatformDetection.isTV &&
        _screensaverController.handleKeyEvent(event)) {
      return true;
    }
    if (event is! KeyDownEvent) {
      return false;
    }

    final key = event.logicalKey;
    final keys = HardwareKeyboard.instance.logicalKeysPressed;
    final ctrlPressed =
        keys.contains(LogicalKeyboardKey.controlLeft) ||
        keys.contains(LogicalKeyboardKey.controlRight);

    final isBackspace = key == LogicalKeyboardKey.backspace;
    if (key.isBackKey) {
      if (isBackspace && _isEditingText()) {
        return false;
      }
      if (OverlaySheetController.closeTopSheet()) {
        return true;
      }
      if (_isPlayerRoute()) {
        return false;
      }
      if (appRouter.canPop()) {
        // On Android the system also delivers popRoute via MethodChannel for the
        // system back button (goBack). For other back-like keys (escape, browserBack),
        // we must manually pop in Flutter even on Android.
        if (PlatformDetection.isAndroid && key == LogicalKeyboardKey.goBack) {
          return true;
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          appRouter.pop();
        });
      } else if (!_exitDialogShowing) {
        if (PlatformDetection.isAndroid && key == LogicalKeyboardKey.goBack) {
          return true;
        }
        _exitDialogShowing = true;
        unawaited(_showExitConfirmation());
      }
      return true;
    }

    if (PlatformDetection.useDesktopUi && key == LogicalKeyboardKey.f11) {
      unawaited(FullscreenHelper.toggle());
      return true;
    }

    if (PlatformDetection.isDesktop &&
        ctrlPressed &&
        key == LogicalKeyboardKey.keyQ) {
      unawaited(windowManager.close());
      return true;
    }

    return false;
  }

  Future<void> _showExitConfirmation() async {
    try {
      final shouldConfirm = GetIt.instance<UserPreferences>().get(
        UserPreferences.confirmExit,
      );
      if (!shouldConfirm) {
        await AppExit.closeApp();
        return;
      }
      final navContext = appRouter.routerDelegate.navigatorKey.currentContext;
      if (navContext == null || !navContext.mounted) {
        return;
      }
      await showExitConfirmationDialog(navContext);
    } catch (_) {
    } finally {
      _exitDialogShowing = false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final paused = state != AppLifecycleState.resumed;
    _screensaverController.activityPaused = paused;
    _maybePausePlaybackForBackground(state);
  }

  void _maybePausePlaybackForBackground(AppLifecycleState state) {
    if (!PlatformDetection.isTV) return;
    final isBackground = state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached;
    if (!isBackground) return;
    if (!GetIt.instance.isRegistered<PlaybackArbiter>()) return;
    final arbiter = GetIt.instance<PlaybackArbiter>();
    if (arbiter.pipActive) return;
    if (GetIt.instance.isRegistered<CastService>() &&
        GetIt.instance<CastService>().activeKind != null) {
      return;
    }
    unawaited(arbiter.pauseForBackground());
  }

  @override
  void dispose() {
    _geometrySaveTimer?.cancel();
    if (PlatformDetection.isDesktop) {
      windowManager.removeListener(this);
    }
    if (_trackMouseThumbHistory) {
      appRouter.routerDelegate.removeListener(_onRouterStateChanged);
    }
    WidgetsBinding.instance.removeObserver(this);
    HardwareKeyboard.instance.removeHandler(_hardwareKeyHandler);
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _saveWindowGeometry() async {
    try {
      final isFullScreen = await FullscreenHelper.isFullscreen();
      if (isFullScreen) return;
      final size = await windowManager.getSize();
      final pos = await windowManager.getPosition();
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(UserPreferences.windowWidth, size.width);
      await prefs.set(UserPreferences.windowHeight, size.height);
      await prefs.set(UserPreferences.windowX, pos.dx);
      await prefs.set(UserPreferences.windowY, pos.dy);
    } catch (_) {}
  }

  void _scheduleSaveGeometry() {
    _geometrySaveTimer?.cancel();
    _geometrySaveTimer = Timer(const Duration(milliseconds: 500), () {
      _saveWindowGeometry();
    });
  }

  @override
  void onWindowEvent(String eventName) {
    if (eventName == 'move' ||
        eventName == 'resize' ||
        eventName == 'moved' ||
        eventName == 'resized') {
      _scheduleSaveGeometry();
    }
  }

  @override
  void onWindowFocus() {
    if (_isPlayerRoute()) return;
    if (_isHomeRoute()) return;
    if (FocusManager.instance.primaryFocus == null && !_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.select) {
      final targetContext =
          FocusManager.instance.primaryFocus?.context ?? context;
      final activated = Actions.maybeInvoke(
        targetContext,
        const ActivateIntent(),
      );
      return activated == null
          ? KeyEventResult.ignored
          : KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: Focus(
        autofocus: !kIsWeb,
        focusNode: _focusNode,
        onKeyEvent: _onKeyEvent,
        child: widget.child,
      ),
    );
  }
}

class _ConnectivityListener extends ConsumerStatefulWidget {
  final Widget child;
  const _ConnectivityListener({required this.child});

  @override
  ConsumerState<_ConnectivityListener> createState() =>
      _ConnectivityListenerState();
}

class _ConnectivityListenerState extends ConsumerState<_ConnectivityListener>
    with WidgetsBindingObserver {
  bool? _wasOnline;
  bool _didScheduleUpdateCheck = false;
  StreamSubscription<SyncPlayUiEvent>? _syncPlayEventsSub;
  StreamSubscription<String>? _downloadErrorSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleDesktopUpdateCheck();
    ref.read(syncPlayRuntimeCoordinatorProvider);
    final manager = ref.read(syncPlayManagerProvider);
    _syncPlayEventsSub = manager.uiEvents.listen(_handleSyncPlayEvent);
    if (GetIt.instance.isRegistered<PluginSyncService>()) {
      GetIt.instance<PluginSyncService>().onAdminMessage = _handleAdminMessage;
    }
    if (GetIt.instance.isRegistered<DownloadService>()) {
      _downloadErrorSub = GetIt.instance<DownloadService>().errors.listen(
        _handleDownloadError,
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _syncPlayEventsSub?.cancel();
    _downloadErrorSub?.cancel();
    if (GetIt.instance.isRegistered<PluginSyncService>()) {
      GetIt.instance<PluginSyncService>().onAdminMessage = null;
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final coordinator = ref.read(syncPlayRuntimeCoordinatorProvider);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      coordinator.appDidEnterBackground();
    } else if (state == AppLifecycleState.resumed) {
      coordinator.appDidBecomeActive();
    }
  }

  void _scheduleDesktopUpdateCheck() {
    if (!AppDistribution.supportsInAppUpdates || _didScheduleUpdateCheck) {
      return;
    }

    _didScheduleUpdateCheck = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(_runDesktopUpdateCheck());
    });
  }

  void _handleSyncPlayEvent(SyncPlayUiEvent event) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    switch (event) {
      case SyncPlayUserJoinedEvent(:final userName):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.syncPlayUserJoinedGroup(userName)),
            duration: const Duration(seconds: 3),
          ),
        );
      case SyncPlayUserLeftEvent(:final userName):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.syncPlayUserLeftGroup(userName)),
            duration: const Duration(seconds: 3),
          ),
        );
      case SyncPlayLibraryAccessDeniedEvent():
        final navContext =
            appRouter.routerDelegate.navigatorKey.currentContext ?? context;
        showDialog<void>(
          context: navContext,
          builder: (ctx) => AlertDialog(
            icon: const Icon(Icons.lock_outline_rounded),
            title: Text(l10n.syncPlayAccessDeniedTitle),
            content: Text(l10n.syncPlayAccessDeniedMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(l10n.ok),
              ),
            ],
          ),
        );
    }
  }

  void _handleDownloadError(String message) {
    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleAdminMessage(String message) {
    if (!mounted) return;

    final navContext = appRouter.routerDelegate.navigatorKey.currentContext ?? context;
    if (!navContext.mounted) {
      return;
    }

    showFocusRestoringDialog<void>(
      context: navContext,
      barrierDismissible: false,
      builder: (ctx) => _AdminMessageDialog(message: message),
    );
  }

  Future<void> _runDesktopUpdateCheck() async {
    try {
      final update = await GetIt.instance<AppUpdateService>()
          .checkForUpdateIfDue();
      if (!mounted || update == null) {
        return;
      }

      final messenger = ScaffoldMessenger.of(context);
      messenger.clearSnackBars();
      final l10n = AppLocalizations.of(context);
      messenger.showSnackBar(
        SnackBar(
          content: Text(l10n.updateAvailableVersion(update.version)),
          duration: const Duration(seconds: 12),
          action: SnackBarAction(
            label: l10n.download,
            onPressed: () {
              final navContext =
                  appRouter.routerDelegate.navigatorKey.currentContext ??
                  context;
              if (navContext.mounted) {
                showAppUpdateDialog(navContext, update);
              }
            },
          ),
        ),
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(isOnlineProvider);

    if (_wasOnline != null && _wasOnline != isOnline) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isOnline
                  ? 'Back online. Syncing progress...'
                  : 'You are offline.',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
    _wasOnline = isOnline;

    return widget.child;
  }
}

class _AdminMessageDialog extends StatefulWidget {
  final String message;

  const _AdminMessageDialog({required this.message});

  @override
  State<_AdminMessageDialog> createState() => _AdminMessageDialogState();
}

class _AdminMessageDialogState extends State<_AdminMessageDialog> {
  final _okFocusNode = FocusNode(debugLabel: 'AdminMessageOkButton');
  final _dialogScopeNode = FocusScopeNode(debugLabel: 'AdminMessageDialogScope');
  bool _focused = false;

  @override
  void dispose() {
    _okFocusNode.dispose();
    _dialogScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FocusScope(
      node: _dialogScopeNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (!event.isActionable) {
          return KeyEventResult.ignored;
        }

        final key = event.logicalKey;
        if (key.isDirectional) {
          if (!_okFocusNode.hasFocus && _okFocusNode.canRequestFocus) {
            _okFocusNode.requestFocus();
          }
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: RequestInitialFocus(
        targetNode: _okFocusNode,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColorScheme.isGlass
                    ? const Color(0xD90E1117)
                    : AppColorScheme.surface,
                borderRadius: BorderRadius.circular(
                  AppColorScheme.isGlass ? 20 : 16,
                ),
                border: Border.fromBorderSide(
                  AppColorScheme.isGlass
                      ? const BorderSide(color: Color(0x33FFFFFF), width: 1)
                      : ThemeRegistry.active.borders.chipBorder,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.campaign_outlined,
                    size: 40,
                    color: AppColorScheme.accent,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.adminSendMessage,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColorScheme.onSurface,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Focus(
                    focusNode: _okFocusNode,
                    autofocus: true,
                    onFocusChange: (f) => setState(() => _focused = f),
                    onKeyEvent: (node, event) => handleOneShotSelect(event, () {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: _focused
                              ? AppColorScheme.onSurface
                              : AppColorScheme.onSurface.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          l10n.ok,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: _focused ? AppColors.black : AppColorScheme.onSurface,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TvUiScale extends StatelessWidget {
  const _TvUiScale({required this.child});

  final Widget child;

  static const double _targetScale = 1.45;
  static const double _designWidth = 1920 / _targetScale;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final realSize = mq.size;
    if (realSize.width <= 0) {
      return child;
    }
    final scale = realSize.width / _designWidth;
    final logicalSize = Size(realSize.width / scale, realSize.height / scale);
    return FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(
        width: logicalSize.width,
        height: logicalSize.height,
        child: MediaQuery(
          data: mq.copyWith(
            size: logicalSize,
            devicePixelRatio: mq.devicePixelRatio * scale,
          ),
          child: child,
        ),
      ),
    );
  }
}
