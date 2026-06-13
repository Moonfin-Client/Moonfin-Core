import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';

class AppearanceThemeScreen extends StatelessWidget {
  const AppearanceThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.settingsAppearanceTheme)),
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

            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  l10n.settingsAppearanceThemeSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.74),
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
      _ => spec.displayName,
    };
  }

  static String? _subtitleForTheme(AppLocalizations l10n, ThemeSpec spec) {
    return switch (spec.id) {
      ThemeRegistry.moonfinId => l10n.themeMoonfinSubtitle,
      ThemeRegistry.neonPulseId => l10n.themeNeonPulseSubtitle,
      ThemeRegistry.glassId => l10n.themeGlassSubtitle,
      _ => null,
    };
  }

  static int _themeSortRank(String id) {
    if (id == ThemeRegistry.moonfinId) return 0;
    if (id == ThemeRegistry.neonPulseId) return 1;
    if (id == ThemeRegistry.glassId) return 2;
    return 3;
  }
}

class _ThemePreviewCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final controller = AppThemeScope.of(context);
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () async {
        await controller.applyThemeById(prefs, themeId);
      },
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder.copyWith(
              color: selected
                  ? AppColorScheme.accent
                  : theme.colorScheme.outlineVariant,
              width: selected ? 2 : 1,
            ),
          ),
          boxShadow: selected ? ThemeRegistry.active.borders.focusGlow : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
                if (selected)
                  Icon(Icons.check_circle, color: AppColorScheme.accent),
              ],
            ),
            const SizedBox(height: 6),
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.74),
                ),
              ),
              const SizedBox(height: 14),
            ] else
              const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                height: 92,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: stripes),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 28,
                        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        decoration: BoxDecoration(
                          color: AppColorScheme.scrim.withValues(alpha: 0.28),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.fromBorderSide(
                            ThemeRegistry.active.borders.chipBorder.copyWith(
                              color: stripes.last.withValues(alpha: 0.8),
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
