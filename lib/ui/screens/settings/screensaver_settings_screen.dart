import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/multi_select_dialog.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import '../../widgets/settings/settings_section_header.dart';
import 'settings_app_bar.dart';

class ScreensaverSettingsScreen extends StatefulWidget {
  const ScreensaverSettingsScreen({super.key});

  @override
  State<ScreensaverSettingsScreen> createState() =>
      _ScreensaverSettingsScreenState();
}

class _ScreensaverSettingsScreenState extends State<ScreensaverSettingsScreen> {
  static const _collectionFetchLimit = 100;

  final _prefs = GetIt.instance<UserPreferences>();
  bool _selectorOpen = false;

  List<String> _splitCsv(Preference<String> pref) {
    return _prefs.get(pref).split(',').where((s) => s.isNotEmpty).toList();
  }

  void _saveCsv(Preference<String> pref, List<String> values) {
    _prefs.set(pref, values.join(','));
    if (mounted) setState(() {});
  }

  String _sourceSubtitle(
    Preference<String> pref,
    String noneLabel,
    AppLocalizations l10n,
  ) {
    final items = _splitCsv(pref);
    if (items.isEmpty) return noneLabel;
    return l10n.itemsSelected(items.length);
  }

  ({Set<String> listed, Set<String> unlisted, Set<String> stale})
  _reconcileSources({
    required Set<String> stored,
    required Set<String> available,
    required bool truncated,
  }) {
    final missing = stored.difference(available);
    return (
      listed: stored.intersection(available),
      unlisted: truncated ? missing : const <String>{},
      stale: truncated ? const <String>{} : missing,
    );
  }

  Future<void> _pickSources({
    required Preference<String> pref,
    required String title,
    required Map<String, String> options,
    bool truncated = false,
  }) async {
    final split = _reconcileSources(
      stored: _splitCsv(pref).toSet(),
      available: options.keys.toSet(),
      truncated: truncated,
    );
    if (split.stale.isNotEmpty) {
      _saveCsv(pref, split.listed.toList());
    }

    if (!mounted) return;
    final result = await showMultiSelectDialog(
      context: context,
      title: title,
      items: options,
      selected: split.listed,
    );
    if (result != null) {
      _saveCsv(pref, [...result, ...split.unlisted]);
    }
  }

  Future<void> _showLibrarySelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.userViewsApi.getUserViews();
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .where((item) {
            final type = item['CollectionType'] as String?;
            return type == 'movies' || type == 'tvshows' || type == null;
          })
          .toList();

      await _pickSources(
        pref: UserPreferences.screensaverLibraryIds,
        title: l10n.sourceLibraries,
        options: {
          for (final item in items)
            item['Id']?.toString() ?? '':
                item['Name'] as String? ?? l10n.unknown,
        },
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  Future<void> _showCollectionSelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.itemsApi.getItems(
        includeItemTypes: ['BoxSet'],
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        limit: _collectionFetchLimit,
      );
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      await _pickSources(
        pref: UserPreferences.screensaverCollectionIds,
        title: l10n.sourceCollections,
        options: {
          for (final item in items)
            item['Id']?.toString() ?? '':
                item['Name'] as String? ?? l10n.unknown,
        },
        truncated: items.length >= _collectionFetchLimit,
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  Future<void> _showGenreSelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.itemsApi.getGenres(
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      );
      final names = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .map((item) => (item['Name'] as String? ?? '').trim())
          .where((name) => name.isNotEmpty)
          .toSet();

      await _pickSources(
        pref: UserPreferences.screensaverExcludedGenres,
        title: l10n.excludedGenres,
        options: {
          for (final name in names) name: name,
        },
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enabled = _prefs.get(UserPreferences.screensaverEnabled);
    final backdrop = _prefs.get(UserPreferences.screensaverBackdrop);
    final component = _prefs.get(UserPreferences.screensaverComponent);
    final movement = _prefs.get(UserPreferences.screensaverMovement);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.screensaver)),
        body: ListView(
          children: [
            // 1. General Settings
            SettingsSectionHeader(l10n.screensaverGeneralSettings),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.screensaverEnabled,
                  title: l10n.inAppScreensaver,
                  subtitle: l10n.enableBuiltInScreensaver,
                  icon: Icons.wallpaper,
                  onChanged: () => setState(() {}),
                ),
                if (enabled) ...[
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
                ],
              ],
            ),

            // 2. Visual Components
            if (enabled) ...[
              SettingsSectionHeader(l10n.screensaverVisualComponents),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<ScreensaverBackdrop>(
                    preference: UserPreferences.screensaverBackdrop,
                    title: l10n.screensaverBackdrop,
                    icon: Icons.auto_awesome,
                    onChanged: () => setState(() {}),
                    labelOf: (value) => switch (value) {
                      ScreensaverBackdrop.library => l10n.libraryArt,
                      ScreensaverBackdrop.black =>
                        l10n.screensaverBackdropBlack,
                      ScreensaverBackdrop.moonfin =>
                        l10n.screensaverBackdropMoonfin,
                      ScreensaverBackdrop.calm =>
                        l10n.screensaverBackdropCalm,
                      ScreensaverBackdrop.neonPulse =>
                        l10n.screensaverBackdropNeonPulse,
                      ScreensaverBackdrop.aurora =>
                        l10n.screensaverBackdropAurora,
                    },
                  ),
                  EnumPreferenceTile<ScreensaverComponent>(
                    preference: UserPreferences.screensaverComponent,
                    title: l10n.screensaverAdditionalComponent,
                    icon: Icons.widgets_outlined,
                    onChanged: () => setState(() {}),
                    labelOf: (value) => switch (value) {
                      ScreensaverComponent.none => l10n.none,
                      ScreensaverComponent.moonfinLogo =>
                        l10n.screensaverComponentMoonfinLogo,
                      ScreensaverComponent.clock => l10n.clock,
                      ScreensaverComponent.runner =>
                        l10n.screensaverComponentRunner,
                    },
                  ),
                  if (component != ScreensaverComponent.none)
                    EnumPreferenceTile<ScreensaverMovement>(
                      preference: UserPreferences.screensaverMovement,
                      title: l10n.screensaverComponentMovement,
                      icon: Icons.speed_rounded,
                      onChanged: () => setState(() {}),
                      labelOf: (value) => switch (value) {
                        ScreensaverMovement.staticCorner =>
                          l10n.clockModeStatic,
                        ScreensaverMovement.slow =>
                          l10n.loadingAnimationSpeedSlow,
                        ScreensaverMovement.moderate =>
                          l10n.loadingAnimationSpeedModerate,
                        ScreensaverMovement.fast =>
                          l10n.loadingAnimationSpeedFast,
                        ScreensaverMovement.ultra =>
                          l10n.loadingAnimationSpeedUltra,
                      },
                    ),
                  if (component != ScreensaverComponent.none)
                    EnumPreferenceTile<ScreensaverSize>(
                      preference: UserPreferences.screensaverSize,
                      title: l10n.screensaverComponentSize,
                      icon: Icons.photo_size_select_actual_outlined,
                      labelOf: (value) => switch (value) {
                        ScreensaverSize.thumbnail =>
                          l10n.loadingAnimationSizeThumbnail,
                        ScreensaverSize.small =>
                          l10n.loadingAnimationSizeSmall,
                        ScreensaverSize.medium =>
                          l10n.loadingAnimationSizeMedium,
                        ScreensaverSize.large =>
                          l10n.loadingAnimationSizeLarge,
                      },
                    ),
                  if (component != ScreensaverComponent.none &&
                      movement == ScreensaverMovement.staticCorner)
                    EnumPreferenceTile<ScreensaverPosition>(
                      preference: UserPreferences.screensaverPosition,
                      title: l10n.screensaverComponentPosition,
                      icon: Icons.grid_view_rounded,
                      labelOf: (value) => switch (value) {
                        ScreensaverPosition.topLeft =>
                          l10n.loadingAnimationPositionTopLeft,
                        ScreensaverPosition.topCenter =>
                          l10n.loadingAnimationPositionTopCenter,
                        ScreensaverPosition.topRight =>
                          l10n.loadingAnimationPositionTopRight,
                        ScreensaverPosition.middleLeft =>
                          l10n.loadingAnimationPositionMiddleLeft,
                        ScreensaverPosition.middle =>
                          l10n.loadingAnimationPositionMiddle,
                        ScreensaverPosition.middleRight =>
                          l10n.loadingAnimationPositionMiddleRight,
                        ScreensaverPosition.bottomLeft =>
                          l10n.loadingAnimationPositionBottomLeft,
                        ScreensaverPosition.bottomCenter =>
                          l10n.loadingAnimationPositionBottomCenter,
                        ScreensaverPosition.bottomRight =>
                          l10n.loadingAnimationPositionBottomRight,
                      },
                    ),
                ],
              ),
            ],

            // 3. Library Content
            if (enabled && backdrop == ScreensaverBackdrop.library) ...[
              SettingsSectionHeader(l10n.screensaverLibraryContent),
              adaptiveListSection(
                children: [
                  StringPickerPreferenceTile(
                    preference: UserPreferences.screensaverContentType,
                    title: l10n.contentType,
                    icon: Icons.category,
                    options: {
                      'both': l10n.moviesAndTvShows,
                      'movies': l10n.moviesOnly,
                      'tvshows': l10n.tvShowsOnly,
                    },
                  ),
                  _ScreensaverActionTile(
                    preference: UserPreferences.screensaverLibraryIds,
                    icon: const ImageIcon(
                      AssetImage('assets/icons/clapperboard.png'),
                    ),
                    title: l10n.sourceLibraries,
                    subtitle: _sourceSubtitle(
                      UserPreferences.screensaverLibraryIds,
                      l10n.screensaverSourceLibrariesDefault,
                      l10n,
                    ),
                    onTap: _showLibrarySelector,
                  ),
                  _ScreensaverActionTile(
                    preference: UserPreferences.screensaverCollectionIds,
                    icon: const Icon(Icons.collections_bookmark),
                    title: l10n.sourceCollections,
                    subtitle: _sourceSubtitle(
                      UserPreferences.screensaverCollectionIds,
                      l10n.noneSelected,
                      l10n,
                    ),
                    onTap: _showCollectionSelector,
                  ),
                  _ScreensaverActionTile(
                    preference: UserPreferences.screensaverExcludedGenres,
                    icon: const Icon(Icons.label_off),
                    title: l10n.excludedGenres,
                    subtitle: _sourceSubtitle(
                      UserPreferences.screensaverExcludedGenres,
                      l10n.noneExcluded,
                      l10n,
                    ),
                    onTap: _showGenreSelector,
                  ),
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
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ScreensaverActionTile extends StatelessWidget {
  final Preference<String> preference;
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ScreensaverActionTile({
    required this.preference,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(
        prefKey: preference.key,
        title: title,
        description: subtitle,
      ),
      child: _buildTile(context),
    );
  }

  Widget _buildTile(BuildContext context) {
    return TvFocusHighlight(
      builder: (ctx, focused) => ListTile(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        leading: buildSettingsLeadingIconShell(
          context,
          icon: icon,
          focused: focused,
          iconColor: focused && settingsTileInvertsOnFocus
              ? AppColors.black.withValues(alpha: 0.54)
              : AppColorScheme.onSurface.withValues(alpha: 0.78),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
