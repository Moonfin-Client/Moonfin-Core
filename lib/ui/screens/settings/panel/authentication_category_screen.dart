part of '../settings_side_panel.dart';

class _AuthenticationCategoryScreen extends StatelessWidget {
  const _AuthenticationCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hideWebOnlyAuthControls = PlatformDetection.isWeb;

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

    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsAccountSecurity)),
      body: ListView(
        children: [
          _SectionHeader(l10n.settingsAuthenticationSection),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<UserSelectBehavior>(
                preference: UserPreferences.autoLoginUserBehavior,
                title: l10n.autoLogin,
                icon: Icons.person,
                labelOf: (v) {
                  if (v == UserSelectBehavior.currentUser) {
                    final session = GetIt.instance<SessionRepository>();
                    // If I'm the auto-login user, just say "Current User"
                    // If someone else is, show their name so it's clear
                    if (session.activeUserIsAutoLoginTarget) {
                      return l10n.currentUser;
                    }
                    return session.autoLoginTargetDisplayName() ??
                        l10n.currentUser;
                  }
                  return switch (v) {
                    UserSelectBehavior.disabled => l10n.disabled,
                    UserSelectBehavior.lastUser => l10n.lastUser,
                    _ => l10n.currentUser,
                  };
                },
                dialogLabelOf: (v) => switch (v) {
                  UserSelectBehavior.disabled => l10n.disabled,
                  UserSelectBehavior.lastUser => l10n.lastUser,
                  UserSelectBehavior.currentUser => l10n.currentUser,
                },
                onChanged: () {
                  final behavior = GetIt.instance<PreferenceStore>().get(
                    UserPreferences.autoLoginUserBehavior,
                  );
                  GetIt.instance<SessionRepository>().applyAutoLoginForBehavior(
                    behavior,
                  );
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.alwaysAuthenticate,
                title: l10n.alwaysAuthenticate,
                subtitle: l10n.requirePasswordWithToken,
                icon: Icons.lock,
              ),
              _TvSettingsListTile(
                autofocus: true,
                leading: const Icon(Icons.pin),
                title: Text(l10n.pinCode),
                subtitle: Text(l10n.requirePinToAccess),
                onTap: () =>
                    context.pushSettingsScreen(const PinCodeSettingsScreen()),
              ),
            ],
          ),
          _SectionHeader(l10n.accountPreferences),
          adaptiveListSection(
            children: [
              StringPickerPreferenceTile(
                preference: UserPreferences.languageOverride,
                title: l10n.interfaceLanguage,
                icon: Icons.language,
                options: langOptions,
              ),
              if (!hideWebOnlyAuthControls)
                EnumPreferenceTile<UserSortBy>(
                  preference: AuthenticationPreferences.sortBy,
                  title: l10n.settingsSortServersBy,
                  icon: Icons.swap_horiz,
                  labelOf: (v) => switch (v) {
                    UserSortBy.lastUsed => l10n.settingsLastUsed,
                    UserSortBy.alphabetical => l10n.settingsAlphabetical,
                  },
                ),
            ],
          ),
          _SectionHeader(l10n.settingsPrivacyAndSafetySection),
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                leading: const Icon(Icons.family_restroom),
                title: Text(l10n.settingsBlockedRatings),
                subtitle: Text(l10n.contentRatingRestrictions),
                onTap: () =>
                    context.pushSettingsScreen(const ParentalSettingsScreen()),
              ),
              if (!hideWebOnlyAuthControls)
                SwitchPreferenceTile(
                  preference: UserPreferences.confirmExit,
                  title: l10n.confirmExit,
                  subtitle: l10n.showConfirmationBeforeExiting,
                  icon: Icons.exit_to_app,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
