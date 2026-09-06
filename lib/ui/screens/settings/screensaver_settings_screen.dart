import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/preference_tiles.dart';
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
  late final PreferenceBinding<bool> _enabledBinding;
  late final PreferenceBinding<ScreensaverBackdrop> _backdropBinding;

  bool _selectorOpen = false;

  @override
  void initState() {
    super.initState();
    final store = GetIt.instance<PreferenceStore>();
    _enabledBinding = PreferenceBinding(
      store,
      UserPreferences.screensaverEnabled,
    );
    _backdropBinding = PreferenceBinding(
      store,
      UserPreferences.screensaverBackdrop,
    );
  }

  @override
  void dispose() {
    _enabledBinding.dispose();
    _backdropBinding.dispose();
    super.dispose();
  }

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
    final result = await _showMultiSelectDialog(
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

  Future<Set<String>?> _showMultiSelectDialog({
    required String title,
    required Map<String, String> items,
    required Set<String> selected,
  }) {
    final l10n = AppLocalizations.of(context);
    final orderedEntries = items.entries.toList()
      ..sort((a, b) => a.value.toLowerCase().compareTo(b.value.toLowerCase()));
    final working = Set<String>.from(selected);

    return showFocusRestoringDialog<Set<String>>(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) {
        var popped = false;
        final closeOnce = createDialogBackCloseHandler(dialogContext);
        return Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: (_, event) {
            if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
            if (event is KeyDownEvent || event is KeyUpEvent) {
              closeOnce();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: FocusScope(
            autofocus: true,
            child: StatefulBuilder(
              builder: (builderContext, setDialogState) =>
                  withCleanSettingsTypography(
                    builderContext,
                    AlertDialog.adaptive(
                      title: Text(title),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setDialogState(
                                      () => working.addAll(items.keys),
                                    );
                                  },
                                  child: Text(l10n.selectAll),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setDialogState(() => working.clear());
                                  },
                                  child: Text(l10n.clear),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView(
                                shrinkWrap: true,
                                children: orderedEntries.asMap().entries.map((entry) {
                                  final i = entry.key;
                                  final e = entry.value;
                                  return TvFocusHighlight(
                                    builder: (ctx, focused) => CheckboxListTile(
                                      autofocus: i == 0,
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: EdgeInsets.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(e.value),
                                      value: working.contains(e.key),
                                      onChanged: (checked) {
                                        setDialogState(() {
                                          if (checked == true) {
                                            working.add(e.key);
                                          } else {
                                            working.remove(e.key);
                                          }
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        adaptiveDialogAction(
                          onPressed: () {
                            if (popped) return;
                            popped = true;
                            Navigator.pop(dialogContext);
                          },
                          child: Text(l10n.cancel),
                        ),
                        FilledButton(
                          onPressed: () {
                            if (popped) return;
                            popped = true;
                            Navigator.pop(dialogContext, working);
                          },
                          child: Text(l10n.save),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        );
      },
    );
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
        body: ListenableBuilder(
          listenable: Listenable.merge([_enabledBinding, _backdropBinding]),
          builder: (context, _) {
            final enabled = _enabledBinding.value;
            final backdrop = _backdropBinding.value;

            return ListView(
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
                        labelOf: (value) => switch (value) {
                          ScreensaverBackdrop.library => l10n.libraryArt,
                          ScreensaverBackdrop.black =>
                            l10n.screensaverBackdropBlack,
                          ScreensaverBackdrop.synthwave =>
                            l10n.screensaverBackdropSynthwave,
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
                        labelOf: (value) => switch (value) {
                          ScreensaverComponent.moonfinLogo =>
                            l10n.screensaverComponentMoonfinLogo,
                          ScreensaverComponent.clock => l10n.clock,
                          ScreensaverComponent.runner =>
                            l10n.screensaverComponentRunner,
                        },
                      ),
                      EnumPreferenceTile<ScreensaverMovement>(
                        preference: UserPreferences.screensaverMovement,
                        title: l10n.screensaverComponentMovement,
                        icon: Icons.animation,
                        labelOf: (value) => switch (value) {
                          ScreensaverMovement.off => l10n.off,
                          ScreensaverMovement.staticCorner =>
                            l10n.clockModeStatic,
                          ScreensaverMovement.bouncing =>
                            l10n.clockModeBouncing,
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
                        leading: Image.asset(
                          'assets/icons/clapperboard.png',
                          width: 24,
                          height: 24,
                          color: AppColorScheme.onSurface,
                          fit: BoxFit.contain,
                        ),
                        title: Text(l10n.sourceLibraries),
                        subtitle: Text(
                          _sourceSubtitle(
                            UserPreferences.screensaverLibraryIds,
                            l10n.noneSelected,
                            l10n,
                          ),
                        ),
                        onTap: _showLibrarySelector,
                      ),
                      _ScreensaverActionTile(
                        leading: const Icon(Icons.collections_bookmark),
                        title: Text(l10n.sourceCollections),
                        subtitle: Text(
                          _sourceSubtitle(
                            UserPreferences.screensaverCollectionIds,
                            l10n.noneSelected,
                            l10n,
                          ),
                        ),
                        onTap: _showCollectionSelector,
                      ),
                      _ScreensaverActionTile(
                        leading: const Icon(Icons.label_off),
                        title: Text(l10n.excludedGenres),
                        subtitle: Text(
                          _sourceSubtitle(
                            UserPreferences.screensaverExcludedGenres,
                            l10n.noneExcluded,
                            l10n,
                          ),
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
            );
          },
        ),
      ),
    );
  }
}

class _ScreensaverActionTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final VoidCallback? onTap;

  const _ScreensaverActionTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      builder: (ctx, _) => ListTile(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        leading: leading,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}
