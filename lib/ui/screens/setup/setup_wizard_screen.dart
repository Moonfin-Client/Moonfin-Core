import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../theme/app_theme_controller.dart';
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

  List<SetupStep> _steps = const [];
  int _index = 0;
  bool _ready = false;
  bool _leaving = false;
  bool _advancing = true;

  // Held rather than written as they are chosen. Each write kicks off a full
  // profile push that the plugin then echoes back, so four of them across four
  // screens becomes one batch at the end.
  String? _mediaBar;
  HomeRowsStyle? _homeRows;
  DetailScreenStyle? _detailStyle;

  MediaServerClient? get _client {
    try {
      return GetIt.instance<MediaServerClientFactory>().getActiveClient();
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void dispose() {
    _scopeNode.dispose();
    _skipNode.dispose();
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
      _steps = steps;
      _ready = true;
    });
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

    await _prefs.batchNotifications(() async {
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
    });

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
    setState(() {
      _advancing = true;
      _index++;
    });
  }

  void _goBack() {
    if (_index == 0) return;
    setState(() {
      _advancing = false;
      _index--;
    });
  }

  /// BACK never leaves the wizard on the first press. It moves to Skip, so the
  /// way out is always something the user chose to press twice.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
    if (_skipNode.hasFocus) {
      unawaited(_skip());
      return KeyEventResult.handled;
    }
    _skipNode.requestFocus();
    return KeyEventResult.handled;
  }

  double get _maxWidth {
    if (PlatformDetection.useLeanbackUi) return 1680;
    if (PlatformDetection.useMobileUi) return 460;
    return 1480;
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
        body: FocusScope(
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
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: _maxWidth),
                  child: _buildSurface(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSurface(BuildContext context) {
    final isMobile = PlatformDetection.useMobileUi;
    final radius = AppRadius.circular(isMobile ? 22 : 28);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.spaceSm : AppSpacing.spaceXl,
        vertical: isMobile ? AppSpacing.spaceSm : AppSpacing.spaceXl,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColorScheme.background.withValues(alpha: 0.97),
                AppColorScheme.surface.withValues(alpha: 0.96),
              ],
            ),
            borderRadius: radius,
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.chipBorder.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.22),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColorScheme.scrim.withValues(alpha: 0.35),
                blurRadius: isMobile ? 24 : 40,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(
            isMobile ? AppSpacing.spaceLg : AppSpacing.space2xl,
          ),
          child: _ready
              ? _buildStep(context)
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final step = _steps[_index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopBar(context, l10n),
        SizedBox(
          height: PlatformDetection.useMobileUi
              ? AppSpacing.spaceMd
              : AppSpacing.spaceXl,
        ),
        Text(
          _questionFor(step, l10n),
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: PlatformDetection.useMobileUi
                ? AppTypography.fontSizeLg
                : AppTypography.fontSize2xl,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 260),
            switchInCurve: Curves.easeOutCubic,
            transitionBuilder: (child, animation) {
              final offset = Tween<Offset>(
                begin: Offset(_advancing ? 0.06 : -0.06, 0),
                end: Offset.zero,
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: offset, child: child),
              );
            },
            child: KeyedSubtree(
              key: ValueKey(step),
              child: Center(child: _buildStepBody(context, step, l10n)),
            ),
          ),
        ),
        _buildActions(context, l10n),
      ],
    );
  }

  Widget _buildTopBar(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Row(
          spacing: AppSpacing.spaceSm,
          children: [
            for (var i = 0; i < _steps.length; i++)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == _index
                      ? AppColorScheme.onSurface
                      : AppColorScheme.onSurface.withValues(alpha: 0.24),
                ),
              ),
          ],
        ),
        const Spacer(),
        _SetupTextButton(
          label: l10n.setupSkip,
          focusNode: _skipNode,
          order: 90,
          onPressed: () => unawaited(_skip()),
        ),
      ],
    );
  }

  String _questionFor(SetupStep step, AppLocalizations l10n) => switch (step) {
    SetupStep.mediaBar => l10n.setupMediaBarQuestion,
    SetupStep.homeRows => l10n.setupHomeRowsQuestion,
    SetupStep.detailStyle => l10n.setupDetailQuestion,
    SetupStep.tour => l10n.setupTourQuestion,
  };

  Widget _buildStepBody(
    BuildContext context,
    SetupStep step,
    AppLocalizations l10n,
  ) => switch (step) {
    SetupStep.mediaBar => _buildMediaBarStep(l10n),
    SetupStep.homeRows => _buildHomeRowsStep(l10n),
    SetupStep.detailStyle => _buildDetailStyleStep(l10n),
    SetupStep.tour => _SetupTourStep(prefs: _prefs),
  };

  Widget _buildMediaBarStep(AppLocalizations l10n) {
    const modes = [
      UserPreferences.mediaBarModeMoonfin,
      UserPreferences.mediaBarModeMakd,
      UserPreferences.mediaBarModeBookshelf,
      UserPreferences.mediaBarModeGallery,
      UserPreferences.mediaBarModeBanner,
      UserPreferences.mediaBarModeAya,
      UserPreferences.mediaBarModeOff,
    ];
    final labels = {
      UserPreferences.mediaBarModeMoonfin: l10n.mediaBarModeMoonfin,
      UserPreferences.mediaBarModeMakd: l10n.mediaBarModeMakd,
      UserPreferences.mediaBarModeBookshelf: l10n.mediaBarModeBookshelf,
      UserPreferences.mediaBarModeGallery: l10n.mediaBarModeGallery,
      UserPreferences.mediaBarModeBanner: l10n.mediaBarModeBanner,
      UserPreferences.mediaBarModeAya: l10n.mediaBarModeAya,
      UserPreferences.mediaBarModeOff: l10n.mediaBarModeOff,
    };
    final selected = _mediaBar ?? _prefs.get(UserPreferences.mediaBarMode);

    return _OptionLayout(
      // A remote only moves along one row comfortably, so leanback fits every
      // style on a single line and lets the card width shrink to suit.
      columns: PlatformDetection.useMobileUi
          ? 2
          : (PlatformDetection.useLeanbackUi ? modes.length : 4),
      children: [
        for (var i = 0; i < modes.length; i++)
          _OptionCard(
            order: i,
            label: labels[modes[i]] ?? modes[i],
            selected: selected == modes[i],
            autofocus: selected == modes[i],
            preview: SetupPreview(child: mediaBarPreview(modes[i])),
            onPressed: () => setState(() => _mediaBar = modes[i]),
          ),
      ],
    );
  }

  Widget _buildHomeRowsStep(AppLocalizations l10n) {
    final selected = _homeRows ?? _prefs.get(UserPreferences.homeRowsStyle);
    return _OptionLayout(
      columns: PlatformDetection.useMobileUi ? 1 : 2,
      children: [
        _OptionCard(
          order: 0,
          label: l10n.setupStyleClassic,
          hint: l10n.setupRowsClassicHint,
          selected: selected == HomeRowsStyle.v1,
          autofocus: selected == HomeRowsStyle.v1,
          preview: SetupPreview(child: homeRowsPreview(modern: false)),
          onPressed: () => setState(() => _homeRows = HomeRowsStyle.v1),
        ),
        _OptionCard(
          order: 1,
          label: l10n.setupStyleModern,
          hint: l10n.setupRowsModernHint,
          selected: selected == HomeRowsStyle.v2,
          autofocus: selected == HomeRowsStyle.v2,
          preview: SetupPreview(child: homeRowsPreview(modern: true)),
          onPressed: () => setState(() => _homeRows = HomeRowsStyle.v2),
        ),
      ],
    );
  }

  Widget _buildDetailStyleStep(AppLocalizations l10n) {
    final selected =
        _detailStyle ?? _prefs.get(UserPreferences.detailScreenStyle);
    return _OptionLayout(
      columns: PlatformDetection.useMobileUi ? 1 : 2,
      children: [
        _OptionCard(
          order: 0,
          label: l10n.setupStyleClassic,
          hint: l10n.setupDetailClassicHint,
          selected: selected == DetailScreenStyle.classic,
          autofocus: selected == DetailScreenStyle.classic,
          preview: SetupPreview(child: detailStylePreview(modern: false)),
          onPressed: () =>
              setState(() => _detailStyle = DetailScreenStyle.classic),
        ),
        _OptionCard(
          order: 1,
          label: l10n.setupStyleModern,
          hint: l10n.setupDetailModernHint,
          selected: selected == DetailScreenStyle.modern,
          autofocus: selected == DetailScreenStyle.modern,
          preview: SetupPreview(child: detailStylePreview(modern: true)),
          onPressed: () =>
              setState(() => _detailStyle = DetailScreenStyle.modern),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context, AppLocalizations l10n) {
    final isLast = _index >= _steps.length - 1;
    return Row(
      children: [
        if (_index > 0)
          _SetupTextButton(label: l10n.back, order: 91, onPressed: _goBack),
        const Spacer(),
        _SetupPrimaryButton(
          label: isLast ? l10n.done : l10n.next,
          order: 93,
          onPressed: _advance,
        ),
      ],
    );
  }
}

/// Lays the option cards out at the width the space allows, keeping them the
/// dominant thing on screen rather than thumbnails under a heading.
class _OptionLayout extends StatelessWidget {
  const _OptionLayout({required this.columns, required this.children});

  final int columns;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (columns == 1) {
      return SingleChildScrollView(
        child: Column(spacing: AppSpacing.spaceMd, children: children),
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final gaps = AppSpacing.spaceMd * (columns - 1);
        final width = ((constraints.maxWidth - gaps) / columns).clamp(
          120.0,
          420.0,
        );
        return SingleChildScrollView(
          child: Wrap(
            spacing: AppSpacing.spaceMd,
            runSpacing: AppSpacing.spaceMd,
            alignment: WrapAlignment.center,
            children: [
              for (final child in children)
                SizedBox(width: width, child: child),
            ],
          ),
        );
      },
    );
  }
}

/// Anything in the wizard a person can land on and press.
///
/// One place for it so the remote, the pointer and the keyboard all behave the
/// same wherever they are, and so focus looks like focus does everywhere else.
class _Focusable extends StatefulWidget {
  const _Focusable({
    required this.order,
    required this.onPressed,
    required this.builder,
    this.focusNode,
    this.autofocus = false,
  });

  final int order;
  final VoidCallback onPressed;
  final Widget Function(bool focused) builder;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<_Focusable> createState() => _FocusableState();
}

class _FocusableState extends State<_Focusable> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order.toDouble()),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onFocusChange: (value) => setState(() => _focused = value),
        onKeyEvent: (node, event) {
          if (!isActivateKey(event)) return KeyEventResult.ignored;
          widget.onPressed();
          return KeyEventResult.handled;
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: widget.builder(_focused),
        ),
      ),
    );
  }
}

/// One pickable layout, shown rather than described.
class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.order,
    required this.label,
    required this.preview,
    required this.selected,
    required this.onPressed,
    this.hint,
    this.autofocus = false,
  });

  final int order;
  final String label;
  final String? hint;
  final Widget preview;
  final bool selected;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = AppColorScheme.onSurface;

    return _Focusable(
      order: order,
      autofocus: autofocus,
      onPressed: onPressed,
      builder: (focused) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.spaceSm,
        children: [
          AnimatedScale(
            scale: focused ? 1.035 : 1,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(10),
                border: Border.all(
                  color: focused
                      ? accent
                      : accent.withValues(alpha: selected ? 0.34 : 0.14),
                  width: focused ? 2 : 1,
                ),
                boxShadow: focused
                    ? [
                        BoxShadow(
                          color: accent.withValues(alpha: 0.34),
                          blurRadius: 22,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circular(10),
                child: preview,
              ),
            ),
          ),
          Row(
            spacing: AppSpacing.spaceXs,
            children: [
              if (selected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent,
                  ),
                ),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? accent : accent.withValues(alpha: 0.7),
                    fontSize: AppTypography.fontSizeSm,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          if (hint != null)
            Text(
              hint!,
              style: TextStyle(
                color: accent.withValues(alpha: 0.55),
                fontSize: AppTypography.fontSizeXs,
                height: 1.3,
              ),
            ),
        ],
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
  });

  final String label;
  final int order;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _Focusable(
      order: order,
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

/// The closing screen: pick a look, then a list of what else lives in
/// Settings. Only the theme writes anything.
class _SetupTourStep extends StatefulWidget {
  const _SetupTourStep({required this.prefs});

  final UserPreferences prefs;

  @override
  State<_SetupTourStep> createState() => _SetupTourStepState();
}

class _SetupTourStepState extends State<_SetupTourStep> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final active = widget.prefs.get(UserPreferences.visualTheme);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.spaceLg,
        children: [
          Text(
            l10n.setupPickALook,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.62),
              fontSize: AppTypography.fontSizeSm,
            ),
          ),
          Wrap(
            spacing: AppSpacing.spaceMd,
            runSpacing: AppSpacing.spaceMd,
            children: [
              for (var i = 0; i < VisualThemeId.values.length; i++)
                _ThemeSwatch(
                  order: i,
                  theme: VisualThemeId.values[i],
                  selected: active == VisualThemeId.values[i],
                  autofocus: active == VisualThemeId.values[i],
                  // Written straight away rather than held back with the
                  // rest, because the point is that the wizard restyles
                  // around you as you move across the row.
                  onPressed: () async {
                    await widget.prefs.set(
                      UserPreferences.visualTheme,
                      VisualThemeId.values[i],
                    );
                    if (mounted) setState(() {});
                  },
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.spaceMd),
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface.withValues(alpha: 0.04),
              borderRadius: AppRadius.circular(12),
              border: Border.all(
                color: AppColorScheme.onSurface.withValues(alpha: 0.14),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.spaceXs,
              children: [
                Row(
                  spacing: AppSpacing.spaceSm,
                  children: [
                    Icon(
                      Icons.settings_rounded,
                      size: 18,
                      color: AppColorScheme.onSurface,
                    ),
                    Text(
                      l10n.setupTourMoreHeader,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: AppTypography.fontSizeSm,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                for (final entry in [
                  l10n.setupTourBulletRequests,
                  l10n.setupTourBulletSyncPlay,
                  l10n.liveTv,
                  l10n.setupTourBulletThemes,
                  if (!PlatformDetection.useLeanbackUi)
                    l10n.setupTourBulletDownloads,
                  l10n.setupTourBulletMore,
                ])
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacing.spaceSm,
                    children: [
                      Text(
                        '\u2022',
                        style: TextStyle(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.65,
                          ),
                          fontSize: AppTypography.fontSizeXs,
                          height: 1.4,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entry,
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.65,
                            ),
                            fontSize: AppTypography.fontSizeXs,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeSwatch extends StatelessWidget {
  const _ThemeSwatch({
    required this.order,
    required this.theme,
    required this.selected,
    required this.autofocus,
    required this.onPressed,
  });

  final int order;
  final VisualThemeId theme;
  final bool selected;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = switch (theme) {
      VisualThemeId.moonfin => l10n.themeMoonfin,
      VisualThemeId.neonPulse => l10n.themeNeonPulse,
      VisualThemeId.glass => l10n.themeGlass,
      VisualThemeId.eightbitHero => l10n.theme8BitHero,
    };
    final spec = ThemeRegistry.resolveById(
      AppThemeController.builtInThemeIdFor(theme),
    );

    return _Focusable(
      order: order,
      autofocus: autofocus,
      onPressed: onPressed,
      builder: (focused) => Column(
        spacing: AppSpacing.spaceXs,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 72,
            height: 44,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [spec.colors.surface, spec.colors.background],
              ),
              borderRadius: AppRadius.circular(8),
              border: Border.all(
                color: focused
                    ? AppColorScheme.onSurface
                    : AppColorScheme.onSurface.withValues(
                        alpha: selected ? 0.4 : 0.16,
                      ),
                width: focused ? 2 : 1,
              ),
              boxShadow: focused
                  ? [
                      BoxShadow(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.3),
                        blurRadius: 18,
                      ),
                    ]
                  : null,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: spec.colors.accent,
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 4,
                    decoration: BoxDecoration(
                      color: spec.colors.onSurface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(
                alpha: selected ? 1 : 0.62,
              ),
              fontSize: AppTypography.fontSizeXs,
            ),
          ),
        ],
      ),
    );
  }
}
