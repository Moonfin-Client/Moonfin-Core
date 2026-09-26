import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/language_codes.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';
import 'subtitle_customization_screen.dart';
import '../../widgets/focus/request_initial_focus.dart';

class SubtitleSettingsScreen extends StatelessWidget {
  const SubtitleSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();

    final langOptions = {'': l10n.none, ...supportedLanguageOptions};

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.subtitlePreferences)),
        body: ListenableBuilder(
          listenable: prefs,
          builder: (context, _) {
            final mode = prefs.get(UserPreferences.subtitleMode);
            final showStreamSettings = mode != SubtitleMode.none;

            return ListView(
              padding: const EdgeInsets.only(bottom: 64.0),
              children: [
                SettingsSectionHeader(l10n.general),
                adaptiveListSection(
                  children: [
                    EnumPreferenceTile<SubtitleMode>(
                      preference: UserPreferences.subtitleMode,
                      title: l10n.subtitleMode,
                      icon: Icons.subtitles,
                      labelOf: (v) => switch (v) {
                        SubtitleMode.flagged => l10n.subtitleModeFlagged,
                        SubtitleMode.always => l10n.subtitleModeAlways,
                        SubtitleMode.foreign => l10n.subtitleModeForeign,
                        SubtitleMode.forced => l10n.subtitleModeForced,
                        SubtitleMode.none => l10n.none,
                      },
                      dialogSubtitleOf: (v) => switch (v) {
                        SubtitleMode.flagged =>
                          l10n.subtitleModeFlaggedDescription,
                        SubtitleMode.always =>
                          l10n.subtitleModeAlwaysDescription,
                        SubtitleMode.foreign =>
                          l10n.subtitleModeForeignDescription,
                        SubtitleMode.forced =>
                          l10n.subtitleModeForcedDescription,
                        SubtitleMode.none => l10n.subtitleModeNoneDescription,
                      },
                    ),
                  ],
                ),
                if (showStreamSettings) ...[
                  SettingsSectionHeader(l10n.subtitleStream),
                  adaptiveListSection(
                    children: [
                      StringPickerPreferenceTile(
                        preference: UserPreferences.defaultSubtitleLanguage,
                        title: l10n.defaultSubtitleLanguage,
                        icon: Icons.language,
                        options: langOptions,
                      ),
                      StringPickerPreferenceTile(
                        preference: UserPreferences.fallbackSubtitleLanguage,
                        title: l10n.fallbackSubtitleLanguage,
                        icon: Icons.language,
                        options: langOptions,
                      ),
                      SwitchPreferenceTile(
                        preference: UserPreferences.preferSdhSubtitles,
                        title: l10n.preferSdhSubtitles,
                        subtitle: l10n.preferSdhSubtitlesSubtitle,
                        icon: Icons.hearing,
                      ),
                    ],
                  ),
                  SettingsSectionHeader(l10n.subtitleCustomization),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                    child: Text(
                      l10n.subtitleStyleDescription,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  adaptiveListSection(
                    children: [
                      TvFocusHighlight(
                        builder: (context, focused) {
                          var pushed = false;
                          final iconColor = focused
                              ? AppColors.black.withValues(alpha: 0.54)
                              : (Theme.of(context).iconTheme.color ??
                                    AppColorScheme.onSurface);
                          return ListTile(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            leading: buildSettingsLeadingIconShell(
                              context,
                              icon: const Icon(Icons.style),
                              focused: focused,
                              iconColor: iconColor,
                            ),
                            title: Text(l10n.subtitleCustomization),
                            subtitle: Text(
                              l10n.subtitleCustomizationDescription,
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              if (pushed) return;
                              pushed = true;
                              context.pushSettingsScreen(
                                const SubtitleCustomizationScreen(),
                              );
                            },
                          );
                        },
                      ),
                      if (PlatformDetection.isAndroid) ...[
                        SwitchPreferenceTile(
                          preference:
                              UserPreferences.subtitlesUseEmbeddedStyles,
                          title: l10n.subtitlesUseEmbeddedStyles,
                          subtitle: l10n.subtitlesUseEmbeddedStylesSubtitle,
                          icon: Icons.format_paint,
                        ),
                        SwitchPreferenceTile(
                          preference:
                              UserPreferences.subtitlesUseEmbeddedFontSizes,
                          title: l10n.subtitlesUseEmbeddedFontSizes,
                          subtitle: l10n.subtitlesUseEmbeddedFontSizesSubtitle,
                          icon: Icons.format_size,
                        ),
                      ],
                    ],
                  ),
                  SettingsSectionHeader(l10n.subtitleRendering),
                  adaptiveListSection(
                    children: [
                      SwitchPreferenceTile(
                        preference: UserPreferences.pgsDirectPlay,
                        title: l10n.pgsDirectPlay,
                        subtitle: l10n.directPlayPgsSubtitles,
                        icon: Icons.image,
                      ),
                      SwitchPreferenceTile(
                        preference: UserPreferences.assDirectPlay,
                        title: l10n.assSsaDirectPlay,
                        subtitle: l10n.directPlayAssSsaSubtitles,
                        icon: Icons.text_snippet,
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
