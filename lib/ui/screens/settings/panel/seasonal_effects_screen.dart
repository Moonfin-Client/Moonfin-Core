part of '../settings_side_panel.dart';

class _SeasonalEffectsScreen extends StatelessWidget {
  const _SeasonalEffectsScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.seasonalEffects)),
      body: ListView(
        children: [
          _SectionHeader(l10n.seasonalEffects),
          adaptiveListSection(
            children: [
              StringPickerPreferenceTile(
                preference: UserPreferences.seasonalSurprise,
                title: l10n.settingsSeasonalSurprise,
                icon: Icons.auto_awesome,
                options: {
                  UserPreferences.seasonalNone: l10n.none,
                  UserPreferences.seasonalSnow: l10n.snow,
                  UserPreferences.seasonalChristmas: l10n.seasonalChristmas,
                  UserPreferences.seasonalFireworks: l10n.fireworks,
                  UserPreferences.seasonalConfetti: l10n.confetti,
                  UserPreferences.seasonalPetals: l10n.seasonalPetals,
                  UserPreferences.seasonalFireflies: l10n.seasonalFireflies,
                  UserPreferences.seasonalLeaves: l10n.fallingLeaves,
                  UserPreferences.seasonalHalloween: l10n.seasonalHalloween,
                  UserPreferences.seasonalValentines: l10n.holidayValentines,
                  UserPreferences.seasonalEaster: l10n.holidayEaster,
                  UserPreferences.seasonalPride: l10n.holidayPride,
                  UserPreferences.seasonalLunar: l10n.holidayLunarNewYear,
                  UserPreferences.seasonalDiwali: l10n.holidayDiwali,
                },
              ),
              StringPickerPreferenceTile(
                preference: UserPreferences.seasonalDensity,
                title: l10n.seasonalDensity,
                icon: Icons.grain,
                options: {
                  UserPreferences.seasonalDensityLight:
                      l10n.seasonalDensityLight,
                  UserPreferences.seasonalDensityNormal:
                      l10n.seasonalDensityNormal,
                  UserPreferences.seasonalDensityHeavy:
                      l10n.seasonalDensityHeavy,
                },
              ),
              if (PlatformDetection.isTV || PlatformDetection.isDesktop)
                SwitchPreferenceTile(
                  preference: UserPreferences.seasonalFollower,
                  title: l10n.seasonalFollower,
                  subtitle: PlatformDetection.isTV
                      ? l10n.seasonalFollowerDescription
                      : l10n.seasonalFollowerPointerDescription,
                  icon: Icons.ads_click,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
