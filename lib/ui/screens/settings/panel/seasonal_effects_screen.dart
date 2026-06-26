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
          adaptiveListSection(
            children: [
              StringPickerPreferenceTile(
                preference: UserPreferences.seasonalSurprise,
                title: l10n.settingsSeasonalSurprise,
                icon: Icons.auto_awesome,
                options: {
                  'none': l10n.none,
                  'snow': l10n.snow,
                  'fireworks': l10n.fireworks,
                  'confetti': l10n.confetti,
                  'leaves': l10n.fallingLeaves,
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
