import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/language_codes.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/bottom_nav/bottom_nav_destinations.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'moonbase_install_dialog.dart';
import 'setup_wizard_gate.dart';
import 'setup_wizard_previews.dart';

/// The first thing a new user sees after signing in.
///
/// Three questions about how the app should look, then a screen showing what
/// else is in here. It only ever asks about things it can't work out on its
/// own, and only about things a person can answer by looking.
class SetupWizardScreen extends StatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  State<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends State<SetupWizardScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _gate = GetIt.instance<SetupWizardGate>();

  final _scopeNode = FocusScopeNode(debugLabel: 'setupWizard');
  final _skipNode = FocusNode(debugLabel: 'setupWizardSkip');
  final _nextNode = FocusNode(debugLabel: 'setupWizardNext');

  // Keyed by step and row rather than by "the selected row", because a node
  // tied to the selection gets handed to another widget the moment a press
  // moves it, and focus drops on that press.
  final Map<String, FocusNode> _optionNodes = {};

  // The row the preview is showing, which follows focus rather than the
  // answer so the remote can look at every option before choosing one.
  final Map<SetupStep, int> _focused = {};

  List<SetupStep> _allSteps = const [];

  // The style question comes and goes with the navbar answer. It can only
  // change on the navbar step, which sits before it, so [_index] stays put.
  List<SetupStep> get _steps => visibleSetupSteps(_allSteps, _effectiveNavbar);

  NavbarPosition get _effectiveNavbar =>
      NavigationLayout.sanitizeNavbarPosition(
        _navbar ?? _prefs.get(UserPreferences.navbarPosition),
      );

  int _index = 0;
  bool _ready = false;
  bool _leaving = false;

  // Held rather than written as they are chosen. Each write kicks off a full
  // profile push that the plugin then echoes back, so the answers across the
  // steps become one batch at the end.
  NavbarPosition? _navbar;
  BottomNavbarStyle? _navbarStyle;
  String? _mediaBar;
  HomeRowsStyle? _homeRows;
  DetailScreenStyle? _detailStyle;
  String? _audioLanguage;
  String? _subtitleLanguage;
  SubtitleMode? _subtitleMode;
  bool? _preferDefaultAudioTrack;
  bool _playbackExpanded = false;
  bool _dialogOpen = false;
  bool _offerMoonbase = false;
  bool _moonbaseInstalled = false;

  MediaServerClient? get _client => SetupWizardGate.activeClient();

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void dispose() {
    _scopeNode.dispose();
    _skipNode.dispose();
    _nextNode.dispose();
    for (final node in _optionNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _prepare() async {
    final client = _client;
    if (client == null) {
      _giveUpForNow();
      return;
    }

    final settled = await _gate.waitForSettings(client);
    if (!mounted) return;
    if (!settled) {
      _giveUpForNow();
      return;
    }

    // Kicked off now so the previews carry real artwork by the time the user
    // reaches them. Home shares the same view model, so nothing loads twice.
    unawaited(SetupPreviewData.ensureLoaded());

    final steps = _gate.remainingSteps();
    if (steps.isEmpty) {
      // Everything here was answered on another device. Nothing to show, and
      // nothing to ask again.
      await _gate.markComplete(client);
      _goHome();
      return;
    }

    setState(() {
      _allSteps = steps;
      _ready = true;
      _offerMoonbase =
          GetIt.instance.isRegistered<PluginSyncService>() &&
          !GetIt.instance<PluginSyncService>().pluginAvailable;
    });
    _focusSelection();
  }

  /// Stand down without marking anything done, so a later launch can try again.
  void _giveUpForNow() {
    _gate.deferThisLaunch();
    _goHome();
  }

  void _goHome() {
    if (_leaving || !mounted) return;
    _leaving = true;
    context.go(Destinations.home);
  }

  Future<void> _finish() async {
    final client = _client;
    final navbar = _navbar;

    await _prefs.batchNotifications(() async {
      if (navbar != null) {
        await _prefs.set(UserPreferences.navbarPosition, navbar);
      }
      // A style picked before switching away from Bottom isn't an answer.
      final navbarStyle = _navbarStyle;
      if (navbarStyle != null && _effectiveNavbar == NavbarPosition.bottom) {
        await _prefs.set(UserPreferences.bottomNavbarStyle, navbarStyle);
      }
      final mediaBar = _mediaBar;
      if (mediaBar != null) {
        await _prefs.set(UserPreferences.mediaBarMode, mediaBar);
      }
      final homeRows = _homeRows;
      if (homeRows != null) {
        await _prefs.set(UserPreferences.homeRowsStyle, homeRows);
      }
      final detailStyle = _detailStyle;
      if (detailStyle != null) {
        await _prefs.set(UserPreferences.detailScreenStyle, detailStyle);
      }
      // Mode goes first because changing it can rewrite the subtitle language.
      // With subtitles off the language stays cleared.
      final subtitleMode = _subtitleMode;
      if (subtitleMode != null) {
        await _prefs.set(UserPreferences.subtitleMode, subtitleMode);
      }
      final subtitleLanguage = _subtitleLanguage;
      if (subtitleLanguage != null &&
          _prefs.get(UserPreferences.subtitleMode) != SubtitleMode.none) {
        await _prefs.set(
          UserPreferences.defaultSubtitleLanguage,
          subtitleLanguage,
        );
      }
      final audioLanguage = _audioLanguage;
      if (audioLanguage != null) {
        await _prefs.set(UserPreferences.defaultAudioLanguage, audioLanguage);
      }
      final preferDefaultAudioTrack = _preferDefaultAudioTrack;
      if (preferDefaultAudioTrack != null) {
        await _prefs.set(
          UserPreferences.preferDefaultAudioTrack,
          preferDefaultAudioTrack,
        );
      }
    });

    // The chrome listens on this rather than the preference, so Home comes up
    // with the bar where it was just asked to be.
    if (navbar != null) {
      NavigationLayout.positionNotifier.value =
          NavigationLayout.sanitizeNavbarPosition(navbar);
    }

    if (client != null) await _gate.markComplete(client);
    _goHome();
  }

  /// Leaves without answering anything, and without being asked again.
  ///
  /// Skipping is an answer in its own right: it means stop asking. What it must
  /// not do is write the defaults, which would mark them as deliberate choices
  /// and stop any future device from asking either.
  Future<void> _skip() async {
    final client = _client;
    if (client != null) await _gate.markComplete(client);
    _goHome();
  }

  void _advance() {
    if (_index >= _steps.length - 1) {
      unawaited(_finish());
      return;
    }
    // Costs nothing once artwork is in, and gives a slow server another
    // chance to fill the previews before the next step shows them.
    unawaited(SetupPreviewData.ensureLoaded());
    setState(() => _index++);
    _focusSelection();
  }

  void _goBack() {
    if (_index == 0) return;
    setState(() => _index--);
    _focusSelection();
  }

  FocusNode _optionNode(SetupStep step, int index) => _optionNodes.putIfAbsent(
    '${step.name}:$index',
    () => FocusNode(debugLabel: 'setupOption ${step.name} $index'),
  );

  /// Puts the incoming step's chosen row under the remote. autofocus can't,
  /// because focus is still on the button that opened the step.
  void _focusSelection() {
    if (PlatformDetection.useMobileUi) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_ready) return;
      final step = _steps[_index];
      final options = _optionsFor(step, AppLocalizations.of(context));
      final selected = math.max(0, options.indexWhere((o) => o.selected));
      _focused[step] = selected;
      _optionNode(step, selected).requestFocus();
    });
  }

  /// BACK never leaves the wizard on the first press. It moves to Skip, so the
  /// way out is always something the user chose to press twice.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
    // Android follows this key with a system back once it comes up, which
    // would otherwise reach the PopScope below as a second press and skip.
    if (PlatformDetection.isAndroid &&
        event.logicalKey == LogicalKeyboardKey.goBack) {
      DialogBackSuppressor.markDismissed();
    }
    if (_skipNode.hasFocus) {
      unawaited(_skip());
      return KeyEventResult.handled;
    }
    _skipNode.requestFocus();
    return KeyEventResult.handled;
  }

  /// Keeps the option list one straight line for the remote: its ends lead to
  /// Skip and Next, and Right always means "done here".
  KeyEventResult _onOptionKey(
    KeyEvent event,
    SetupStep step,
    int index,
    int count,
  ) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    final towardNext =
        key == LogicalKeyboardKey.arrowRight ||
        (key == LogicalKeyboardKey.arrowDown &&
            index == count - 1 &&
            step != SetupStep.tour);
    if (towardNext) {
      _nextNode.requestFocus();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp && index == 0) {
      _skipNode.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_skipNode.hasFocus) {
          unawaited(_skip());
          return;
        }
        _skipNode.requestFocus();
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        // Keeps the action row clear of the OS gesture bar on phones.
        body: SafeArea(
          child: FocusScope(
            node: _scopeNode,
            autofocus: true,
            // The route owns the whole screen, so the scope is the trap: there is
            // nothing outside it for focus to travel to, and traversal already
            // stops rather than wrapping at the ends of a row.
            child: Focus(
              onKeyEvent: _onKey,
              canRequestFocus: false,
              skipTraversal: true,
              child: FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: _buildBody(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (!_ready) return const Center(child: CircularProgressIndicator());
    final l10n = AppLocalizations.of(context);
    final step = _steps[_index];
    final options = _optionsFor(step, l10n);
    final selected = math.max(0, options.indexWhere((o) => o.selected));

    if (PlatformDetection.useMobileUi) {
      return _buildPhone(l10n, step, options, selected);
    }
    final focused = (_focused[step] ?? selected).clamp(0, options.length - 1);
    // Laid out at a fixed canvas and scaled to fill the screen, so every screen
    // size gets the same proportions. Desktop gets a roomier canvas since it's
    // read up close. The box is expanded because FittedBox only scales up when
    // its size is forced, and a TV lays the app out larger than the canvas.
    final canvas = PlatformDetection.useLeanbackUi
        ? const Size(960, 540)
        : const Size(1280, 720);
    return SizedBox.expand(
      child: FittedBox(
        child: SizedBox.fromSize(
          size: canvas,
          child: _buildStage(l10n, step, options, focused),
        ),
      ),
    );
  }

  String _questionFor(SetupStep step, AppLocalizations l10n) => switch (step) {
    SetupStep.navbar => l10n.setupNavbarQuestion,
    SetupStep.navbarStyle => l10n.setupNavbarStyleQuestion,
    SetupStep.mediaBar => l10n.setupMediaBarQuestion,
    SetupStep.homeRows => l10n.setupHomeRowsQuestion,
    SetupStep.detailStyle => l10n.setupDetailQuestion,
    SetupStep.tour => l10n.setupTourQuestion,
  };

  /// Where each answer lives in Settings, ending with the setting's own name,
  /// so the user knows where to go to change it later.
  List<String> _settingsPathFor(SetupStep step, AppLocalizations l10n) =>
      switch (step) {
        SetupStep.navbar => [
          l10n.settings,
          l10n.appearance,
          l10n.navigationBar,
          l10n.navigationStyle,
        ],
        SetupStep.navbarStyle => [
          l10n.settings,
          l10n.appearance,
          l10n.navigationBar,
          l10n.bottomNavbarStyle,
        ],
        SetupStep.mediaBar => [
          l10n.settings,
          l10n.appearance,
          l10n.homeScreen,
          l10n.mediaBar,
          l10n.mediaBarMode,
        ],
        SetupStep.homeRows => [
          l10n.settings,
          l10n.appearance,
          l10n.homeScreen,
          l10n.rowsType,
        ],
        SetupStep.detailStyle => [
          l10n.settings,
          l10n.appearance,
          l10n.detailsPage,
          l10n.detailScreenStyle,
        ],
        SetupStep.tour => [
          l10n.settings,
          l10n.appearance,
          l10n.settingsAppearanceTheme,
        ],
      };

  List<String> _languagesPath(AppLocalizations l10n) => [
    l10n.settings,
    l10n.playback,
    '${l10n.audio}, ${l10n.subtitles}',
  ];

  List<_SetupOption> _optionsFor(SetupStep step, AppLocalizations l10n) =>
      switch (step) {
        SetupStep.navbar => _navbarOptions(l10n),
        SetupStep.navbarStyle => _navbarStyleOptions(l10n),
        SetupStep.mediaBar => _mediaBarOptions(l10n),
        SetupStep.homeRows => _homeRowsOptions(l10n),
        SetupStep.detailStyle => _detailStyleOptions(l10n),
        SetupStep.tour => _themeOptions(l10n),
      };

  List<_SetupOption> _navbarOptions(AppLocalizations l10n) {
    // The bottom bar is only offered where the app can actually draw one, so
    // this list is two entries on a TV or desktop and three on a phone.
    final selected = _effectiveNavbar;
    return [
      for (final position in NavigationLayout.availableNavbarPositions)
        _SetupOption(
          label: switch (position) {
            NavbarPosition.top => l10n.topBar,
            NavbarPosition.left => l10n.leftSidebar,
            NavbarPosition.bottom => l10n.bottomBar,
          },
          hint: switch (position) {
            NavbarPosition.top => l10n.setupNavbarTopHint,
            NavbarPosition.left => l10n.setupNavbarLeftHint,
            NavbarPosition.bottom => l10n.setupNavbarBottomHint,
          },
          selected: selected == position,
          preview: () => navbarPreview(position),
          onSelect: () => setState(() => _navbar = position),
        ),
    ];
  }

  List<_SetupOption> _navbarStyleOptions(AppLocalizations l10n) {
    final selected =
        _navbarStyle ?? _prefs.get(UserPreferences.bottomNavbarStyle);
    return [
      for (final style in BottomNavbarStyle.values)
        _SetupOption(
          label: bottomNavbarStyleLabel(l10n, style),
          hint: bottomNavbarStyleHint(l10n, style),
          selected: selected == style,
          preview: () => bottomNavbarStylePreview(style),
          onSelect: () => setState(() => _navbarStyle = style),
        ),
    ];
  }

  List<_SetupOption> _mediaBarOptions(AppLocalizations l10n) {
    final modes = {
      UserPreferences.mediaBarModeMoonfin: (
        l10n.mediaBarModeMoonfin,
        l10n.setupMediaBarMoonfinHint,
      ),
      UserPreferences.mediaBarModeMakd: (
        l10n.mediaBarModeMakd,
        l10n.setupMediaBarMakdHint,
      ),
      UserPreferences.mediaBarModeBookshelf: (
        l10n.mediaBarModeBookshelf,
        l10n.setupMediaBarBookshelfHint,
      ),
      UserPreferences.mediaBarModeGallery: (
        l10n.mediaBarModeGallery,
        l10n.setupMediaBarGalleryHint,
      ),
      UserPreferences.mediaBarModeBanner: (
        l10n.mediaBarModeBanner,
        l10n.setupMediaBarBannerHint,
      ),
      UserPreferences.mediaBarModeAya: (
        l10n.mediaBarModeAya,
        l10n.setupMediaBarAyaHint,
      ),
      UserPreferences.mediaBarModeOff: (
        l10n.mediaBarModeOff,
        l10n.setupMediaBarOffHint,
      ),
    };
    final selected = _mediaBar ?? _prefs.get(UserPreferences.mediaBarMode);
    return [
      for (final MapEntry(key: mode, value: (label, hint)) in modes.entries)
        _SetupOption(
          label: label,
          hint: hint,
          selected: selected == mode,
          preview: () => mediaBarPreview(mode),
          onSelect: () => setState(() => _mediaBar = mode),
        ),
    ];
  }

  List<_SetupOption> _homeRowsOptions(AppLocalizations l10n) {
    final selected = _homeRows ?? _prefs.get(UserPreferences.homeRowsStyle);
    return [
      _SetupOption(
        label: l10n.setupStyleClassic,
        hint: l10n.setupRowsClassicHint,
        selected: selected == HomeRowsStyle.v1,
        preview: () => homeRowsPreview(modern: false),
        onSelect: () => setState(() => _homeRows = HomeRowsStyle.v1),
      ),
      _SetupOption(
        label: l10n.setupStyleModern,
        hint: l10n.setupRowsModernHint,
        selected: selected == HomeRowsStyle.v2,
        preview: () => homeRowsPreview(modern: true),
        onSelect: () => setState(() => _homeRows = HomeRowsStyle.v2),
      ),
    ];
  }

  List<_SetupOption> _detailStyleOptions(AppLocalizations l10n) {
    final styles = {
      DetailScreenStyle.classic: (
        l10n.setupStyleClassic,
        l10n.setupDetailClassicHint,
      ),
      DetailScreenStyle.modern: (
        l10n.setupStyleModern,
        l10n.setupDetailModernHint,
      ),
      DetailScreenStyle.spotlight: (
        l10n.setupStyleSpotlight,
        l10n.setupDetailSpotlightHint,
      ),
      DetailScreenStyle.nouveau: (
        l10n.setupStyleNouveau,
        l10n.setupDetailNouveauHint,
      ),
      DetailScreenStyle.minimalist: (
        l10n.setupStyleMinimalist,
        l10n.setupDetailMinimalistHint,
      ),
      DetailScreenStyle.stage: (
        l10n.setupStyleStage,
        l10n.setupDetailStageHint,
      ),
      DetailScreenStyle.premiere: (
        l10n.setupStylePremiere,
        l10n.setupDetailPremiereHint,
      ),
      DetailScreenStyle.quickLook: (
        l10n.setupStyleQuickLook,
        l10n.setupDetailQuickLookHint,
      ),
      DetailScreenStyle.frost: (
        l10n.setupStyleFrost,
        l10n.setupDetailFrostHint,
      ),
    };
    final selected =
        _detailStyle ?? _prefs.get(UserPreferences.detailScreenStyle);
    return [
      for (final MapEntry(key: style, value: (label, hint)) in styles.entries)
        _SetupOption(
          label: label,
          hint: hint,
          selected: selected == style,
          preview: () => detailStylePreview(style),
          onSelect: () => setState(() => _detailStyle = style),
        ),
    ];
  }

  /// The closing step: pick a look, with the optional playback languages
  /// under it. The preview is Home in whatever look is applied right now.
  List<_SetupOption> _themeOptions(AppLocalizations l10n) {
    final active = _prefs.get(UserPreferences.visualTheme);
    final mediaBar =
        _mediaBar ??
        _prefs.get(UserPreferences.mediaBarMode) ??
        UserPreferences.mediaBarModeMoonfin;
    final more = [
      l10n.setupTourBulletRequests,
      l10n.setupTourBulletSyncPlay,
      l10n.liveTv,
      l10n.setupTourBulletThemes,
      if (!PlatformDetection.useLeanbackUi) l10n.setupTourBulletDownloads,
      l10n.setupTourBulletMore,
    ].join(' · ');
    return [
      for (final theme in VisualThemeId.values)
        _SetupOption(
          label: switch (theme) {
            VisualThemeId.moonfin => l10n.themeMoonfin,
            VisualThemeId.neonPulse => l10n.themeNeonPulse,
            VisualThemeId.glass => l10n.themeGlass,
            VisualThemeId.eightbitHero => l10n.theme8BitHero,
          },
          hint: '${l10n.setupTourMoreHeader}: $more',
          selected: active == theme,
          preview: () => mediaBarPreview(mediaBar),
          swatch: ThemeRegistry.resolveById(
            AppThemeController.builtInThemeIdFor(theme),
          ),
          // Written straight away rather than held back with the rest,
          // because the point is that the wizard restyles around you.
          onSelect: () => unawaited(_applyTheme(theme)),
        ),
    ];
  }

  Future<void> _applyTheme(VisualThemeId theme) async {
    await _prefs.set(UserPreferences.visualTheme, theme);
    if (mounted) setState(() {});
  }

  /// TV and desktop: the question and a straight list of options on the left,
  /// and a large preview of whichever option has focus on the right.
  Widget _buildStage(
    AppLocalizations l10n,
    SetupStep step,
    List<_SetupOption> options,
    int focused,
  ) {
    final onSurface = AppColorScheme.onSurface;
    final path = _settingsPathFor(step, l10n);
    final isLast = _index >= _steps.length - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 32, 48, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (var i = 0; i < _steps.length; i++) ...[
                if (i > 0) const SizedBox(width: 4),
                _ProgressSegment(width: 36, height: 3, state: i - _index),
              ],
              const SizedBox(width: AppSpacing.spaceMd),
              _StepCount(text: l10n.setupStepOf(_index + 1, _steps.length)),
              const SizedBox(width: AppSpacing.spaceMd),
              _SettingChip(label: path.last),
              const Spacer(),
              _SetupTextButton(
                label: l10n.setupSkip,
                focusNode: _skipNode,
                order: 90,
                onPressed: () => unawaited(_skip()),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          _questionFor(step, l10n),
                          style: TextStyle(
                            color: onSurface,
                            fontSize: AppTypography.fontSize2xl,
                            fontWeight: FontWeight.w600,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 18),
                        for (var i = 0; i < options.length; i++) ...[
                          if (i > 0) const SizedBox(height: 3),
                          _OptionRow(
                            // A fresh row per step, or the row in the same
                            // spot keeps showing the last step's focus.
                            key: ValueKey('${step.name}:$i'),
                            order: i,
                            option: options[i],
                            focusNode: _optionNode(step, i),
                            currentLabel: l10n.setupCurrent,
                            onFocused: () => setState(() => _focused[step] = i),
                            onKey: (event) =>
                                _onOptionKey(event, step, i, options.length),
                          ),
                        ],
                        if (step == SetupStep.tour) ...[
                          const SizedBox(height: AppSpacing.spaceMd),
                          _buildPlaybackSection(l10n),
                          const SizedBox(height: AppSpacing.spaceSm),
                          _SettingsPath(segments: _languagesPath(l10n)),
                          if (_offerMoonbase) ...[
                            const SizedBox(height: AppSpacing.spaceMd),
                            _buildMoonbaseRow(l10n),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 44),
                Expanded(
                  child: _StagePreview(option: options[focused], path: path),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _index > 0
                      ? _SetupTextButton(
                          label: l10n.back,
                          order: 91,
                          onPressed: _goBack,
                        )
                      : null,
                ),
              ),
              Expanded(
                child: PlatformDetection.useLeanbackUi
                    ? Text(
                        l10n.setupTvHint,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: onSurface.withValues(alpha: 0.5),
                          fontSize: AppTypography.fontSizeXs,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(
                width: 120,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _SetupPrimaryButton(
                    label: isLast ? l10n.done : l10n.next,
                    order: 93,
                    focusNode: _nextNode,
                    onPressed: _advance,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Phones: the question on top, a phone-sized preview to swipe through, the
  /// options as chips under it, and the actions in reach of a thumb.
  Widget _buildPhone(
    AppLocalizations l10n,
    SetupStep step,
    List<_SetupOption> options,
    int selected,
  ) {
    final onSurface = AppColorScheme.onSurface;
    final path = _settingsPathFor(step, l10n);
    final isLast = _index >= _steps.length - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: AppSpacing.spaceMd),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    spacing: 6,
                    children: [
                      for (var i = 0; i < _steps.length; i++)
                        Expanded(
                          child: _ProgressSegment(height: 4, state: i - _index),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.spaceLg),
                _SetupTextButton(
                  label: l10n.setupSkip,
                  focusNode: _skipNode,
                  order: 90,
                  onPressed: () => unawaited(_skip()),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _StepCount(
                    text: l10n.setupStepOf(_index + 1, _steps.length),
                  ),
                  const SizedBox(width: AppSpacing.spaceSm),
                  Flexible(child: _SettingChip(label: path.last)),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceSm),
              Text(
                _questionFor(step, l10n),
                style: TextStyle(
                  color: onSurface,
                  fontSize: AppTypography.fontSizeXl,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceSm),
              _SettingsPath(segments: path),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: _PreviewCarousel(options: options, selected: selected),
        ),
        const SizedBox(height: 14),
        _ChipStrip(key: ValueKey(step), options: options, selected: selected),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SizedBox(
            height: 36,
            child: Text(
              options[selected].hint,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: onSurface.withValues(alpha: 0.65),
                fontSize: AppTypography.fontSizeXs,
                height: 1.35,
              ),
            ),
          ),
        ),
        if (step == SetupStep.tour)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSpacing.spaceXs,
              children: [
                _buildPlaybackSection(l10n),
                _SettingsPath(segments: _languagesPath(l10n)),
                if (_offerMoonbase) _buildMoonbaseRow(l10n),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, AppSpacing.spaceMd),
          child: Row(
            spacing: AppSpacing.spaceMd,
            children: [
              if (_index > 0)
                SizedBox(
                  width: 96,
                  child: _PhoneButton(
                    label: l10n.back,
                    order: 91,
                    onPressed: _goBack,
                  ),
                ),
              Expanded(
                child: _PhoneButton(
                  label: isLast ? l10n.done : l10n.next,
                  order: 93,
                  filled: true,
                  onPressed: _advance,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// The optional playback languages under the themes. Sign-in has already
  /// filled these in from the server or the device, so it starts folded up
  /// with those answers showing.
  Widget _buildPlaybackSection(AppLocalizations l10n) {
    // The same lists the audio and subtitle settings offer.
    final audioOptions = {
      'auto': l10n.autoServerDefault,
      ...supportedLanguageOptions,
    };
    final subtitleOptions = {'': l10n.none, ...supportedLanguageOptions};
    final audio =
        _audioLanguage ??
        _prefs.get(UserPreferences.defaultAudioLanguage) ??
        'auto';
    final subtitle =
        _subtitleLanguage ??
        _prefs.get(UserPreferences.defaultSubtitleLanguage) ??
        '';
    final mode =
        _subtitleMode ??
        _prefs.get(UserPreferences.subtitleMode) ??
        SubtitleMode.flagged;
    final preferDefaultAudioTrack =
        _preferDefaultAudioTrack ??
        _prefs.get(UserPreferences.preferDefaultAudioTrack) ??
        false;
    // A language the server brought in at sign-in may not be in the list, so
    // it shows as its code, the way the settings show it.
    final audioLabel = audioOptions[audio] ?? audio;
    final subtitleLabel = subtitleOptions[subtitle] ?? subtitle;
    final subtitlesOn = mode != SubtitleMode.none;
    // The same names the subtitle settings use.
    String modeLabel(SubtitleMode mode) => switch (mode) {
      SubtitleMode.flagged => l10n.subtitleModeFlagged,
      SubtitleMode.always => l10n.subtitleModeAlways,
      SubtitleMode.foreign => l10n.subtitleModeForeign,
      SubtitleMode.forced => l10n.subtitleModeForced,
      SubtitleMode.none => l10n.none,
    };

    return _CollapsibleSection(
      order: 10,
      expanded: _playbackExpanded,
      icon: Icons.translate_rounded,
      title: l10n.setupPlaybackLanguages,
      badge: l10n.setupOptional,
      summary: [
        audioLabel,
        if (subtitlesOn) subtitleLabel,
        modeLabel(mode),
      ].join(' · '),
      onToggle: () => setState(() => _playbackExpanded = !_playbackExpanded),
      children: [
        _SettingRow(
          order: 11,
          label: l10n.defaultAudioLanguage,
          trailing: _ChosenValue(audioLabel),
          onPressed: () => _pick(
            title: l10n.defaultAudioLanguage,
            values: audioOptions.keys.toList(),
            current: audio,
            labelOf: (code) => audioOptions[code]!,
            onPicked: (code) => _audioLanguage = code,
          ),
        ),
        _SettingRow(
          order: 12,
          label: l10n.preferDefaultAudioTrack,
          hint: l10n.preferDefaultAudioTrackDescription,
          // The row takes the press and the focus; the switch only shows the
          // state, so it doesn't become a second stop for the remote.
          trailing: ExcludeFocus(
            child: IgnorePointer(
              child: Switch(value: preferDefaultAudioTrack, onChanged: (_) {}),
            ),
          ),
          onPressed: () => setState(
            () => _preferDefaultAudioTrack = !preferDefaultAudioTrack,
          ),
        ),
        // Mode stays above the language so hiding the language doesn't move
        // the focused row.
        _SettingRow(
          order: 13,
          label: l10n.subtitleMode,
          trailing: _ChosenValue(modeLabel(mode)),
          onPressed: () => _pick(
            title: l10n.subtitleMode,
            values: SubtitleMode.values,
            current: mode,
            labelOf: modeLabel,
            subtitleOf: (mode) => switch (mode) {
              SubtitleMode.flagged => l10n.subtitleModeFlaggedDescription,
              SubtitleMode.always => l10n.subtitleModeAlwaysDescription,
              SubtitleMode.foreign => l10n.subtitleModeForeignDescription,
              SubtitleMode.forced => l10n.subtitleModeForcedDescription,
              SubtitleMode.none => l10n.subtitleModeNoneDescription,
            },
            onPicked: (mode) => _subtitleMode = mode,
          ),
        ),
        if (subtitlesOn)
          _SettingRow(
            order: 14,
            label: l10n.defaultSubtitleLanguage,
            trailing: _ChosenValue(subtitleLabel),
            onPressed: () => _pick(
              title: l10n.defaultSubtitleLanguage,
              values: subtitleOptions.keys.toList(),
              current: subtitle,
              labelOf: (code) => subtitleOptions[code]!,
              onPicked: (code) => _subtitleLanguage = code,
            ),
          ),
      ],
    );
  }

  Future<void> _openMoonbase() async {
    final client = _client;
    if (client == null || _moonbaseInstalled || _dialogOpen) return;
    _dialogOpen = true;
    final isAdmin = GetIt.instance.isRegistered<UserRepository>() &&
        (GetIt.instance<UserRepository>().currentUser?.isAdministrator ??
            false);
    final installed = await showMoonbaseDialog(
      context,
      client,
      isAdmin: isAdmin,
    );
    _dialogOpen = false;
    if (installed && mounted) setState(() => _moonbaseInstalled = true);
  }

  Widget _buildMoonbaseRow(AppLocalizations l10n) => _MoonbaseRow(
    order: 20,
    title: l10n.setupMoonbaseTitle,
    hint: _moonbaseInstalled ? l10n.installed : l10n.setupMoonbaseHint,
    installed: _moonbaseInstalled,
    onPressed: () => unawaited(_openMoonbase()),
  );

  Future<void> _pick<T>({
    required String title,
    required List<T> values,
    required T current,
    required String Function(T value) labelOf,
    required ValueChanged<T> onPicked,
    String Function(T value)? subtitleOf,
  }) async {
    if (_dialogOpen) return;
    _dialogOpen = true;
    final result = await showSettingsPicker<T>(
      context,
      title: title,
      values: values,
      current: current,
      labelOf: labelOf,
      subtitleOf: subtitleOf,
    );
    _dialogOpen = false;
    if (!mounted || result == null || result == current) return;
    setState(() => onPicked(result));
  }
}

/// A preview is a picture of a screen, so the remote and the pointer must never
/// land inside it.
Widget _inertPreview(_SetupOption option) => ExcludeSemantics(
  child: ExcludeFocus(
    child: IgnorePointer(child: SetupPreview(child: option.preview())),
  ),
);

class _SetupOption {
  const _SetupOption({
    required this.label,
    required this.hint,
    required this.selected,
    required this.preview,
    required this.onSelect,
    this.swatch,
  });

  final String label;
  final String hint;
  final bool selected;
  final Widget Function() preview;
  final VoidCallback onSelect;
  final ThemeSpec? swatch;
}

/// One step's mark in the progress bar. [state] is the step's distance from
/// the current one: behind is done, zero is here, ahead is still to come.
class _ProgressSegment extends StatelessWidget {
  const _ProgressSegment({
    required this.height,
    required this.state,
    this.width,
  });

  final double? width;
  final double height;
  final int state;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(height / 2),
        color: state < 0
            ? onSurface
            : state == 0
            ? AppColorScheme.accent
            : onSurface.withValues(alpha: 0.18),
      ),
    );
  }
}

class _StepCount extends StatelessWidget {
  const _StepCount({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColorScheme.onSurface.withValues(alpha: 0.6),
        fontSize: AppTypography.fontSizeXs,
      ),
    );
  }
}

class _SettingChip extends StatelessWidget {
  const _SettingChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: onSurface.withValues(alpha: 0.08),
        borderRadius: AppRadius.circular(11),
        border: Border.all(color: onSurface.withValues(alpha: 0.16)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: onSurface,
          fontSize: AppTypography.fontSizeXs,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// The way to an answer in Settings, last segment being the setting itself.
class _SettingsPath extends StatelessWidget {
  const _SettingsPath({required this.segments});

  final List<String> segments;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final style = TextStyle(
      color: onSurface.withValues(alpha: 0.6),
      fontSize: AppTypography.fontSizeXs,
    );
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.spaceXs,
      runSpacing: AppSpacing.space2xs,
      children: [
        Icon(
          Icons.settings_rounded,
          size: 13,
          color: onSurface.withValues(alpha: 0.55),
        ),
        for (var i = 0; i < segments.length; i++) ...[
          if (i > 0)
            Icon(
              Icons.chevron_right_rounded,
              size: 13,
              color: onSurface.withValues(alpha: 0.4),
            ),
          Text(
            segments[i],
            style: i == segments.length - 1
                ? style.copyWith(color: onSurface, fontWeight: FontWeight.w600)
                : style,
          ),
        ],
      ],
    );
  }
}

class _StagePreview extends StatelessWidget {
  const _StagePreview({required this.option, required this.path});

  final _SetupOption option;
  final List<String> path;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The preview gives up height to the caption, never the other way
        // around, so a long translation can't push anything off screen.
        Flexible(
          child: AspectRatio(
            aspectRatio: setupPreviewAspect(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(12),
                border: Border.all(color: onSurface.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: AppColorScheme.scrim.withValues(alpha: 0.5),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circular(11),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 160),
                  child: KeyedSubtree(
                    key: ValueKey(option.label),
                    child: _inertPreview(option),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spaceMd),
        Text(
          option.label,
          style: TextStyle(
            color: onSurface,
            fontSize: AppTypography.fontSizeLg,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.spaceXs),
        Text(
          option.hint,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: onSurface.withValues(alpha: 0.62),
            fontSize: AppTypography.fontSizeSm,
            height: 1.25,
          ),
        ),
        const SizedBox(height: AppSpacing.spaceSm),
        _SettingsPath(segments: path),
      ],
    );
  }
}

/// One row in the TV and desktop option list. Focus fills it, the radio and
/// the "Current" tag mark the answer, so the two never look alike.
class _OptionRow extends StatelessWidget {
  const _OptionRow({
    super.key,
    required this.order,
    required this.option,
    required this.focusNode,
    required this.currentLabel,
    required this.onFocused,
    required this.onKey,
  });

  final int order;
  final _SetupOption option;
  final FocusNode focusNode;
  final String currentLabel;
  final VoidCallback onFocused;
  final KeyEventResult Function(KeyEvent event) onKey;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    final background = AppColorScheme.background;
    final swatch = option.swatch;

    return _Focusable(
      order: order,
      focusNode: focusNode,
      focusOnHover: true,
      onFocused: onFocused,
      onKey: onKey,
      onPressed: option.onSelect,
      builder: (focused) {
        final ink = focused ? background : onSurface;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceMd),
          decoration: BoxDecoration(
            color: focused ? onSurface : Colors.transparent,
            borderRadius: AppRadius.circular(7),
          ),
          child: Row(
            spacing: 9,
            children: [
              Container(
                width: 12,
                height: 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: option.selected
                        ? AppColorScheme.accent
                        : ink.withValues(alpha: focused ? 0.5 : 0.4),
                  ),
                ),
                child: option.selected
                    ? Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorScheme.accent,
                        ),
                      )
                    : null,
              ),
              Expanded(
                child: Text(
                  option.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: focused ? ink : ink.withValues(alpha: 0.82),
                    fontSize: AppTypography.fontSizeSm,
                    fontWeight: focused ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (option.selected)
                Text(
                  currentLabel,
                  style: TextStyle(
                    color: ink.withValues(alpha: focused ? 0.6 : 0.55),
                    fontSize: AppTypography.fontSize2xs,
                  ),
                ),
              if (swatch != null)
                Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: swatch.colors.surface,
                    border: Border.all(color: ink.withValues(alpha: 0.2)),
                  ),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: swatch.colors.accent,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// The phone preview: the chosen option front and center at phone size, its
/// neighbors peeking in from the sides. Swiping or tapping a neighbor picks
/// it.
class _PreviewCarousel extends StatelessWidget {
  const _PreviewCarousel({required this.options, required this.selected});

  final List<_SetupOption> options;
  final int selected;

  static const _gap = 14.0;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        // An open languages panel can squeeze the preview away entirely.
        if (height < 80) return const SizedBox.shrink();
        final width = height * setupPreviewAspect();
        final left = (constraints.maxWidth - width) / 2;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            if (velocity < -150 && selected < options.length - 1) {
              options[selected + 1].onSelect();
            } else if (velocity > 150 && selected > 0) {
              options[selected - 1].onSelect();
            }
          },
          child: Stack(
            children: [
              // The chosen card goes last so it paints over its neighbors.
              for (final i in [selected - 1, selected + 1, selected])
                if (i >= 0 && i < options.length)
                  AnimatedPositioned(
                    key: ValueKey(i),
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    left: left + (i - selected) * (width + _gap),
                    top: 0,
                    width: width,
                    height: height,
                    child: GestureDetector(
                      onTap: i == selected ? null : options[i].onSelect,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 220),
                        opacity: i == selected ? 1 : 0.4,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 220),
                          scale: i == selected ? 1 : 0.9,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: AppRadius.circular(18),
                              border: Border.all(
                                color: i == selected
                                    ? onSurface
                                    : onSurface.withValues(alpha: 0.14),
                                width: i == selected ? 2 : 1,
                              ),
                              boxShadow: i == selected
                                  ? [
                                      BoxShadow(
                                        color: onSurface.withValues(
                                          alpha: 0.18,
                                        ),
                                        blurRadius: 28,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: AppRadius.circular(16),
                              child: _inertPreview(options[i]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

/// The options by name under the phone preview. The chosen chip scrolls to
/// the middle so it never sits off screen.
class _ChipStrip extends StatefulWidget {
  const _ChipStrip({super.key, required this.options, required this.selected});

  final List<_SetupOption> options;
  final int selected;

  @override
  State<_ChipStrip> createState() => _ChipStripState();
}

class _ChipStripState extends State<_ChipStrip> {
  final _keys = <int, GlobalKey>{};

  @override
  void initState() {
    super.initState();
    _reveal(Duration.zero);
  }

  @override
  void didUpdateWidget(_ChipStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      _reveal(const Duration(milliseconds: 220));
    }
  }

  void _reveal(Duration duration) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chip = _keys[widget.selected]?.currentContext;
      if (chip == null) return;
      Scrollable.ensureVisible(chip, alignment: 0.5, duration: duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return SizedBox(
      height: 44,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          spacing: AppSpacing.spaceSm,
          children: [
            for (var i = 0; i < widget.options.length; i++)
              _Focusable(
                key: _keys.putIfAbsent(i, GlobalKey.new),
                order: i,
                onPressed: widget.options[i].onSelect,
                builder: (focused) {
                  final selected = i == widget.selected;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceLg,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? onSurface
                          : onSurface.withValues(alpha: 0.06),
                      borderRadius: AppRadius.circular(22),
                      border: Border.all(
                        color: selected || focused
                            ? onSurface
                            : onSurface.withValues(alpha: 0.16),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6,
                      children: [
                        if (selected)
                          Icon(
                            Icons.check_rounded,
                            size: 16,
                            color: AppColorScheme.background,
                          ),
                        Text(
                          widget.options[i].label,
                          style: TextStyle(
                            color: selected
                                ? AppColorScheme.background
                                : onSurface.withValues(alpha: 0.8),
                            fontSize: AppTypography.fontSizeSm,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// Anything in the wizard a person can land on and press.
///
/// One place for it so the remote, the pointer and the keyboard all behave the
/// same wherever they are, and so focus looks like focus does everywhere else.
class _Focusable extends StatefulWidget {
  const _Focusable({
    super.key,
    required this.order,
    required this.onPressed,
    required this.builder,
    this.focusNode,
    this.focusOnHover = false,
    this.onFocused,
    this.onKey,
  });

  final int order;
  final VoidCallback onPressed;
  final Widget Function(bool focused) builder;
  final FocusNode? focusNode;

  /// Lets a pointer move focus by hovering, so the preview follows a mouse the
  /// way it follows the arrow keys. Needs [focusNode].
  final bool focusOnHover;
  final VoidCallback? onFocused;
  final KeyEventResult Function(KeyEvent event)? onKey;

  @override
  State<_Focusable> createState() => _FocusableState();
}

class _FocusableState extends State<_Focusable> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final node = widget.focusNode;
    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order.toDouble()),
      child: Focus(
        focusNode: node,
        onFocusChange: (value) {
          setState(() => _focused = value);
          if (value) widget.onFocused?.call();
        },
        onKeyEvent: (node, event) {
          final handled = widget.onKey?.call(event);
          if (handled == KeyEventResult.handled) return KeyEventResult.handled;
          if (!isActivateKey(event)) return KeyEventResult.ignored;
          widget.onPressed();
          return KeyEventResult.handled;
        },
        child: MouseRegion(
          onEnter: widget.focusOnHover && node != null
              ? (_) => node.requestFocus()
              : null,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: widget.builder(_focused),
          ),
        ),
      ),
    );
  }
}

/// The box a playback row sits in, lit up while focused.
class _FocusPanel extends StatelessWidget {
  const _FocusPanel({
    required this.focused,
    required this.radius,
    required this.padding,
    required this.child,
  });

  final bool focused;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(radius),
        color: accent.withValues(alpha: focused ? 0.1 : 0.04),
        border: Border.all(
          color: focused ? accent : accent.withValues(alpha: 0.14),
          width: focused ? 2 : 1,
        ),
      ),
      child: child,
    );
  }
}

/// One playback setting: its name, an optional line under it, and its
/// current answer on the right.
class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.order,
    required this.label,
    required this.trailing,
    required this.onPressed,
    this.hint,
  });

  final int order;
  final String label;
  final String? hint;
  final Widget trailing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return _Focusable(
      order: order,
      onPressed: onPressed,
      builder: (focused) => _FocusPanel(
        focused: focused,
        radius: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceLg,
          vertical: AppSpacing.spaceMd,
        ),
        child: Row(
          spacing: AppSpacing.spaceMd,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: accent.withValues(alpha: 0.7),
                      fontSize: AppTypography.fontSizeSm,
                    ),
                  ),
                  if (hint != null)
                    Text(
                      hint!,
                      style: TextStyle(
                        color: accent.withValues(alpha: 0.5),
                        fontSize: AppTypography.fontSizeXs,
                      ),
                    ),
                ],
              ),
            ),
            Flexible(child: trailing),
          ],
        ),
      ),
    );
  }
}

/// The answer on a row that opens a list.
class _ChosenValue extends StatelessWidget {
  const _ChosenValue(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSpacing.spaceSm,
      children: [
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: accent,
              fontSize: AppTypography.fontSizeSm,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Icon(Icons.chevron_right, color: accent.withValues(alpha: 0.55)),
      ],
    );
  }
}

/// A header that shows the current answers while folded, opening downwards
/// into [children] when pressed.
class _CollapsibleSection extends StatelessWidget {
  const _CollapsibleSection({
    required this.order,
    required this.expanded,
    required this.icon,
    required this.title,
    required this.badge,
    required this.summary,
    required this.onToggle,
    required this.children,
  });

  final int order;
  final bool expanded;
  final IconData icon;
  final String title;
  final String badge;
  final String summary;
  final VoidCallback onToggle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.spaceSm,
      children: [
        _Focusable(
          order: order,
          onPressed: onToggle,
          builder: (focused) => _FocusPanel(
            focused: focused,
            radius: 12,
            padding: const EdgeInsets.all(AppSpacing.spaceMd),
            child: Row(
              spacing: AppSpacing.spaceSm,
              children: [
                Icon(icon, size: 18, color: accent),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: title,
                          children: [
                            TextSpan(
                              text: '  $badge',
                              style: TextStyle(
                                color: accent.withValues(alpha: 0.55),
                                fontSize: AppTypography.fontSizeXs,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          color: accent,
                          fontSize: AppTypography.fontSizeSm,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (!expanded)
                        Text(
                          summary,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: accent.withValues(alpha: 0.65),
                            fontSize: AppTypography.fontSizeXs,
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: Icon(
                    Icons.expand_more_rounded,
                    color: accent.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (expanded) ...children,
      ],
    );
  }
}

class _MoonbaseRow extends StatelessWidget {
  const _MoonbaseRow({
    required this.order,
    required this.title,
    required this.hint,
    required this.installed,
    required this.onPressed,
  });

  final int order;
  final String title;
  final String hint;
  final bool installed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return _Focusable(
      order: order,
      onPressed: onPressed,
      builder: (focused) => _FocusPanel(
        focused: focused,
        radius: 12,
        padding: const EdgeInsets.all(AppSpacing.spaceMd),
        child: Row(
          spacing: AppSpacing.spaceSm,
          children: [
            Icon(Icons.dns_rounded, size: 18, color: accent),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: accent,
                      fontSize: AppTypography.fontSizeSm,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    hint,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: accent.withValues(alpha: 0.65),
                      fontSize: AppTypography.fontSizeXs,
                    ),
                  ),
                ],
              ),
            ),
            if (installed)
              Icon(Icons.check_circle_rounded, size: 20, color: accent)
            else
              Icon(Icons.chevron_right, color: accent.withValues(alpha: 0.55)),
          ],
        ),
      ),
    );
  }
}

class _SetupTextButton extends StatelessWidget {
  const _SetupTextButton({
    required this.label,
    required this.order,
    required this.onPressed,
    this.focusNode,
  });

  final String label;
  final int order;
  final VoidCallback onPressed;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return _Focusable(
      order: order,
      focusNode: focusNode,
      onPressed: onPressed,
      builder: (focused) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceSm,
          vertical: AppSpacing.spaceXs,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: focused ? AppColorScheme.onSurface : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(
              alpha: focused ? 1 : 0.62,
            ),
            fontSize: AppTypography.fontSizeSm,
          ),
        ),
      ),
    );
  }
}

class _SetupPrimaryButton extends StatelessWidget {
  const _SetupPrimaryButton({
    required this.label,
    required this.order,
    required this.onPressed,
    this.focusNode,
  });

  final String label;
  final int order;
  final VoidCallback onPressed;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return _Focusable(
      order: order,
      focusNode: focusNode,
      onPressed: onPressed,
      builder: (focused) => AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceXl,
          vertical: AppSpacing.spaceSm,
        ),
        decoration: BoxDecoration(
          color: AppColorScheme.accent,
          borderRadius: AppRadius.circular(8),
          boxShadow: focused
              ? [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.5),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ]
              : null,
          border: Border.all(
            color: focused ? AppColorScheme.onSurface : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColorScheme.onAccent,
            fontSize: AppTypography.fontSizeSm,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Back and Next on a phone, tall enough for a thumb, with Next filling the
/// rest of the row.
class _PhoneButton extends StatelessWidget {
  const _PhoneButton({
    required this.label,
    required this.order,
    required this.onPressed,
    this.filled = false,
  });

  final String label;
  final int order;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return _Focusable(
      order: order,
      onPressed: onPressed,
      builder: (focused) => AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColorScheme.accent : null,
          borderRadius: AppRadius.circular(12),
          border: Border.all(
            color: filled
                ? (focused ? onSurface : Colors.transparent)
                : onSurface.withValues(alpha: focused ? 0.7 : 0.28),
            width: filled ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? AppColorScheme.onAccent : onSurface,
            fontSize: AppTypography.fontSizeMd,
            fontWeight: filled ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
