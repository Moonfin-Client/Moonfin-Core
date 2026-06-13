import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/focus/request_initial_focus.dart';
import 'settings_app_bar.dart';

class ScreensaverSettingsScreen extends StatefulWidget {
  const ScreensaverSettingsScreen({super.key});

  @override
  State<ScreensaverSettingsScreen> createState() =>
      _ScreensaverSettingsScreenState();
}

class _ScreensaverSettingsScreenState extends State<ScreensaverSettingsScreen> {
  late final PreferenceBinding<ScreensaverMode> _modeBinding;

  @override
  void initState() {
    super.initState();
    _modeBinding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.screensaverMode,
    );
  }

  @override
  void dispose() {
    _modeBinding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.screensaver)),
        body: ValueListenableBuilder<ScreensaverMode>(
          valueListenable: _modeBinding,
          builder: (context, mode, _) => ListView(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.screensaverEnabled,
                title: l10n.inAppScreensaver,
                subtitle: l10n.enableBuiltInScreensaver,
                icon: Icons.wallpaper,
              ),
              EnumPreferenceTile<ScreensaverMode>(
                preference: UserPreferences.screensaverMode,
                title: l10n.mode,
                icon: Icons.auto_awesome,
                labelOf: (value) => switch (value) {
                  ScreensaverMode.library => l10n.libraryArt,
                  ScreensaverMode.logo => l10n.logo,
                },
              ),
              EnumPreferenceTile<ScreensaverTimeout>(
                preference: UserPreferences.screensaverTimeout,
                title: l10n.timeout,
                icon: Icons.timer,
                labelOf: (value) => l10n.minutesShort(value.minutes),
              ),
              SliderPreferenceTile(
                preference: UserPreferences.screensaverDimming,
                title: l10n.dimmingLevel,
                icon: Icons.brightness_6,
                min: 0,
                max: 90,
                divisions: 9,
                labelOf: (value) => value == 0 ? l10n.off : '$value%',
              ),
              EnumPreferenceTile<ScreensaverClockMode>(
                preference: UserPreferences.screensaverClockMode,
                title: l10n.showClock,
                description: l10n.displayClockDuringScreensaver,
                icon: Icons.access_time,
                labelOf: (value) => switch (value) {
                  ScreensaverClockMode.off => l10n.off,
                  ScreensaverClockMode.staticCorner => l10n.clockModeStatic,
                  ScreensaverClockMode.bouncing => l10n.clockModeBouncing,
                },
              ),
              if (mode == ScreensaverMode.library) ...[
                StringPickerPreferenceTile(
                  preference: UserPreferences.screensaverMaxAgeRating,
                  title: l10n.maxAgeRating,
                  icon: Icons.shield,
                  options: {
                    'any': l10n.any,
                    '0': l10n.agePlusValue(0),
                    '6': l10n.agePlusValue(6),
                    '12': l10n.agePlusValue(12),
                    '16': l10n.agePlusValue(16),
                    '18': l10n.agePlusValue(18),
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.screensaverRequireRating,
                  title: l10n.requireAgeRating,
                  subtitle: l10n.onlyShowRatedContent,
                  icon: Icons.verified_user,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
