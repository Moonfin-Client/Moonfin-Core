import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class AppearanceThemeScreen extends StatefulWidget {
  const AppearanceThemeScreen({super.key});

  @override
  State<AppearanceThemeScreen> createState() => _AppearanceThemeScreenState();
}

class _AppearanceThemeScreenState extends State<AppearanceThemeScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.settingsAppearanceTheme),
        ),
        body: ListenableBuilder(
          listenable: prefs,
          builder: (context, _) {
            final selectedBuiltIn = prefs.get(UserPreferences.visualTheme);
            final selectedCustomId = prefs.get(UserPreferences.customThemeId);
            final selectedThemeId = selectedCustomId.isNotEmpty
                ? selectedCustomId
                : AppThemeController.builtInThemeIdFor(selectedBuiltIn);
            final themes = ThemeRegistry.availableThemes.values.toList()
              ..sort((a, b) {
                final aRank = _themeSortRank(a.id);
                final bRank = _themeSortRank(b.id);
                if (aRank != bRank) return aRank.compareTo(bRank);
                return a.displayName.toLowerCase().compareTo(
                  b.displayName.toLowerCase(),
                );
              });

            return RequestInitialFocus(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(20),
                children: [
                  _SectionHeader(l10n.customThemeTitle, topPadding: 0),
                  const SizedBox(height: 4),
                  Text(
                    l10n.customThemeSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.74,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (var i = 0; i < themes.length; i++) ...[
                    _ThemePreviewCard(
                      themeId: themes[i].id,
                      title: _titleForTheme(l10n, themes[i]),
                      subtitle: _subtitleForTheme(l10n, themes[i]),
                      selected: selectedThemeId == themes[i].id,
                      stripes: [
                        themes[i].colors.background,
                        themes[i].colors.surface,
                        themes[i].colors.accent,
                        themes[i].colors.rangeProgress,
                      ],
                    ),
                    if (i != themes.length - 1) const SizedBox(height: 16),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static String _titleForTheme(AppLocalizations l10n, ThemeSpec spec) {
    return switch (spec.id) {
      ThemeRegistry.moonfinId => l10n.themeMoonfin,
      ThemeRegistry.neonPulseId => l10n.themeNeonPulse,
      ThemeRegistry.glassId => l10n.themeGlass,
      ThemeRegistry.eightbitHeroId => l10n.theme8BitHero,
      _ => spec.displayName,
    };
  }

  static String? _subtitleForTheme(AppLocalizations l10n, ThemeSpec spec) {
    return switch (spec.id) {
      ThemeRegistry.moonfinId => l10n.themeMoonfinSubtitle,
      ThemeRegistry.neonPulseId => l10n.themeNeonPulseSubtitle,
      ThemeRegistry.glassId => l10n.themeGlassSubtitle,
      ThemeRegistry.eightbitHeroId => l10n.theme8BitHeroSubtitle,
      _ => spec.description,
    };
  }

  static int _themeSortRank(String id) {
    if (id == ThemeRegistry.moonfinId) return 0;
    if (id == ThemeRegistry.neonPulseId) return 1;
    if (id == ThemeRegistry.glassId) return 2;
    if (id == ThemeRegistry.eightbitHeroId) return 3;
    return 4;
  }
}

class _ThemePreviewCard extends StatefulWidget {
  const _ThemePreviewCard({
    required this.themeId,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.stripes,
  });

  final String themeId;
  final String title;
  final String? subtitle;
  final bool selected;
  final List<Color> stripes;

  @override
  State<_ThemePreviewCard> createState() => _ThemePreviewCardState();
}

class _ThemePreviewCardState extends State<_ThemePreviewCard> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final controller = AppThemeScope.of(context);
    final theme = Theme.of(context);

    final borderTokens = ThemeRegistry.active.borders;

    final borderSide = _focused
        ? borderTokens.focusBorder.copyWith(
            color: AppColorScheme.accent.withValues(alpha: 0.72),
            width: 2.0,
          )
        : (widget.selected
              ? borderTokens.chipBorder.copyWith(
                  color: AppColorScheme.accent,
                  width: 2.0,
                )
              : borderTokens.chipBorder.copyWith(
                  color: theme.colorScheme.outlineVariant,
                  width: 1.0,
                ));

    final shadow = _focused
        ? (borderTokens.focusGlow.isNotEmpty
              ? borderTokens.focusGlow
              : [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.22),
                    blurRadius: 14,
                    spreadRadius: 0.5,
                  ),
                ])
        : null;

    return InkWell(
      autofocus: false,
      borderRadius: AppRadius.circular(18),
      onFocusChange: (f) {
        setState(() => _focused = f);
      },
      onTap: () async {
        await controller.applyThemeById(prefs, widget.themeId);
      },
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.circular(18),
          border: Border.fromBorderSide(borderSide),
          boxShadow: shadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
                  ),
                ),
                if (widget.selected)
                  Icon(Icons.check_circle, color: AppColorScheme.accent),
              ],
            ),
            const SizedBox(height: 6),
            if (widget.subtitle != null) ...[
              Text(
                widget.subtitle!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.74),
                ),
              ),
              const SizedBox(height: 14),
            ] else
              const SizedBox(height: 10),
            ClipRRect(
              borderRadius: AppRadius.circular(14),
              child: SizedBox(
                height: 52,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: widget.stripes),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 28,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColorScheme.scrim.withValues(alpha: 0.28),
                          borderRadius: AppRadius.circular(999),
                          border: Border.fromBorderSide(
                            ThemeRegistry.active.borders.chipBorder.copyWith(
                              color: widget.stripes.last.withValues(alpha: 0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  final double topPadding;
  const _SectionHeader(this.text, {this.topPadding = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, topPadding, 0, 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
