import 'package:flutter/material.dart';

import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
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
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.subtitles)),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                l10n.subtitleStyleDescription,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            StringPickerPreferenceTile(
              preference: UserPreferences.defaultSubtitleLanguage,
              title: l10n.defaultSubtitleLanguage,
              icon: Icons.language,
              options: {
                '': l10n.none,
                'eng': l10n.english,
                'spa': l10n.spanish,
                'fra': l10n.french,
                'deu': l10n.german,
                'ita': l10n.italian,
                'por': l10n.portuguese,
                'jpn': l10n.japanese,
                'kor': l10n.korean,
                'zho': l10n.chinese,
                'rus': l10n.russian,
                'ara': l10n.arabic,
                'hin': l10n.hindi,
                'nld': l10n.dutch,
                'swe': l10n.swedish,
                'nor': l10n.norwegian,
                'dan': l10n.danish,
                'fin': l10n.finnish,
                'pol': l10n.polish,
              },
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.subtitlesDefaultToNone,
              title: l10n.defaultToNoSubtitles,
              subtitle: l10n.turnOffSubtitlesByDefault,
              icon: Icons.subtitles_off,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.preferSdhSubtitles,
              title: l10n.preferSdhSubtitles,
              subtitle: l10n.preferSdhSubtitlesSubtitle,
              icon: Icons.hearing,
            ),
            TvFocusHighlight(
              builder: (context, _) {
                var pushed = false;
                return ListTile(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  leading: const Icon(Icons.style),
                  title: Text(l10n.subtitleCustomization),
                  subtitle: Text(l10n.subtitleCustomizationDescription),
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
            // Embedded-style overrides are only meaningful on Android (Media3).
            if (PlatformDetection.isAndroid) ...[
              SwitchPreferenceTile(
                preference: UserPreferences.subtitlesUseEmbeddedStyles,
                title: l10n.subtitlesUseEmbeddedStyles,
                subtitle: l10n.subtitlesUseEmbeddedStylesSubtitle,
                icon: Icons.format_paint,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.subtitlesUseEmbeddedFontSizes,
                title: l10n.subtitlesUseEmbeddedFontSizes,
                subtitle: l10n.subtitlesUseEmbeddedFontSizesSubtitle,
                icon: Icons.format_size,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
