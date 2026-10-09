part of '../settings_side_panel.dart';

class _GeneralScreen extends StatefulWidget {
  const _GeneralScreen();

  @override
  State<_GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<_GeneralScreen> {
  final _generalScope = FocusScopeNode(
    debugLabel: 'GeneralSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _generalScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomPad =
        (PlatformDetection.isTV ? 96.0 : 24.0) +
        MediaQuery.paddingOf(context).bottom;

    final Map<String, String> langOptions = {
      'system': l10n.systemLanguageDefault,
    };
    final sortedLocales = List<Locale>.from(AppLocalizations.supportedLocales);
    sortedLocales.sort((a, b) {
      final nameA = kLocaleDisplayNames[a.toLanguageTag()] ?? a.toLanguageTag();
      final nameB = kLocaleDisplayNames[b.toLanguageTag()] ?? b.toLanguageTag();
      return nameA.toLowerCase().compareTo(nameB.toLowerCase());
    });
    for (final locale in sortedLocales) {
      final tag = locale.toLanguageTag();
      langOptions[tag] = kLocaleDisplayNames[tag] ?? locale.toString();
    }

    final showSiriSensitivity =
        GamepadNavigationScope.isConfigurable && PlatformDetection.isAppleTV;
    final showInput =
        PlatformDetection.isTV ||
        showSiriSensitivity ||
        PlatformDetection.useDesktopUi;

    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.general)),
      body: FocusScope(
        node: _generalScope,
        autofocus: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            _SectionHeader(l10n.settingsLanguageSection),
            adaptiveListSection(
              children: [
                StringPickerPreferenceTile(
                  preference: UserPreferences.languageOverride,
                  title: l10n.interfaceLanguage,
                  icon: Icons.language,
                  options: langOptions,
                ),
              ],
            ),
            _SectionHeader(l10n.clock),
            adaptiveListSection(
              children: [
                EnumPreferenceTile<ClockBehavior>(
                  preference: UserPreferences.clockBehavior,
                  title: l10n.clockDisplay,
                  icon: Icons.access_time,
                  labelOf: (v) => switch (v) {
                    ClockBehavior.always => l10n.always,
                    ClockBehavior.inMenus => l10n.inMenus,
                    ClockBehavior.never => l10n.never,
                  },
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.use24HourClock,
                  title: l10n.settingsTwentyFourHourClock,
                  subtitle: l10n.settingsTwentyFourHourClockSubtitle,
                  icon: Icons.schedule,
                ),
              ],
            ),
            if (showInput) ...[
              _SectionHeader(l10n.settingsInputSection),
              adaptiveListSection(
                children: [
                  if (PlatformDetection.isTV)
                    SwitchPreferenceTile(
                      preference: UserPreferences.preferSystemImeKeyboard,
                      title: l10n.keyboardPreferSystemIme,
                      subtitle: l10n.keyboardPreferSystemImeDescription,
                      icon: Icons.keyboard_alt_outlined,
                    ),
                  if (showSiriSensitivity)
                    EnumPreferenceTile<SiriRemoteSwipeSensitivity>(
                      preference: UserPreferences.siriRemoteSwipeSensitivity,
                      title: l10n.siriRemoteSwipeSensitivity,
                      description: l10n.siriRemoteSwipeSensitivityDescription,
                      icon: Icons.swipe,
                      labelOf: (v) => switch (v) {
                        SiriRemoteSwipeSensitivity.low => l10n.settingsLow,
                        SiriRemoteSwipeSensitivity.medium => l10n.medium,
                        SiriRemoteSwipeSensitivity.high => l10n.settingsHigh,
                      },
                    ),
                  if (PlatformDetection.useDesktopUi)
                    SliderPreferenceTile(
                      preference: UserPreferences.desktopScrollSensitivity,
                      title: l10n.scrollSensitivity,
                      description: l10n.scrollSensitivitySubtitle,
                      icon: Icons.mouse,
                      min: 50,
                      max: 300,
                      divisions: 25,
                      labelOf: (v) => '${(v / 100).toStringAsFixed(1)}x',
                      onChangeEnd: _pushPersonalizationSync,
                    ),
                ],
              ),
            ],
            if (!PlatformDetection.isWeb) ...[
              _SectionHeader(l10n.behavior),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.confirmExit,
                    title: l10n.confirmExit,
                    subtitle: l10n.showConfirmationBeforeExiting,
                    icon: Icons.exit_to_app,
                  ),
                ],
              ),
            ],
            if (PlatformDetection.isAndroid) ...[
              _SectionHeader(l10n.performanceMode),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<DevicePerformanceMode>(
                    preference: UserPreferences.performanceMode,
                    title: l10n.performanceMode,
                    description: l10n.performanceModeSubtitle,
                    icon: Icons.speed_outlined,
                    labelOf: (v) => switch (v) {
                      DevicePerformanceMode.auto => l10n.performanceModeAuto,
                      DevicePerformanceMode.standard =>
                        l10n.performanceModeStandard,
                      DevicePerformanceMode.reduced =>
                        l10n.performanceModeReduced,
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
