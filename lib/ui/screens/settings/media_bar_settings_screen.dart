import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class MediaBarSettingsScreen extends StatefulWidget {
  const MediaBarSettingsScreen({super.key});

  @override
  State<MediaBarSettingsScreen> createState() => _MediaBarSettingsScreenState();
}

class _MediaBarSettingsScreenState extends State<MediaBarSettingsScreen> {
  final _store = GetIt.instance<PreferenceStore>();
  static const _validAutoAdvanceIntervals = <int>{5000, 10000, 15000, 30000};
  bool _selectorOpen = false;

  @override
  void initState() {
    super.initState();
    final current = _store.get(UserPreferences.mediaBarMode);
    final normalized = UserPreferences.normalizeMediaBarMode(current);
    if (current != normalized) {
      _store.set(UserPreferences.mediaBarMode, normalized);
    }
    final currentInterval = _store.get(UserPreferences.mediaBarIntervalMs);
    if (!_validAutoAdvanceIntervals.contains(currentInterval)) {
      _store.set(UserPreferences.mediaBarIntervalMs, 10000);
    }
  }

  List<String> _splitCsv(Preference<String> pref) {
    return _store.get(pref).split(',').where((s) => s.isNotEmpty).toList();
  }

  void _saveCsv(Preference<String> pref, List<String> values) {
    _store.set(pref, values.join(','));
    _pushSync();
    setState(() {});
  }

  void _pushSync() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  Future<void> _showLibrarySelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();
    final selected = _splitCsv(UserPreferences.mediaBarLibraryIds).toSet();

    try {
      final response = await client.userViewsApi.getUserViews();
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .where((item) {
            final type = item['CollectionType'] as String?;
            return type == 'movies' || type == 'tvshows' || type == null;
          })
          .toList();

      final availableIds = items.map((i) => i['Id'] as String).toSet();
      final pruned = selected.intersection(availableIds);
      if (pruned.length != selected.length) {
        _saveCsv(UserPreferences.mediaBarLibraryIds, pruned.toList());
      }

      if (!mounted) return;
      final result = await _showMultiSelectDialog(
        title: l10n.sourceLibraries,
        items: {
          for (final item in items)
            item['Id'] as String: item['Name'] as String? ?? l10n.unknown,
        },
        selected: pruned,
      );
      if (result != null) {
        _saveCsv(UserPreferences.mediaBarLibraryIds, result.toList());
      }
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
    final selected = _splitCsv(UserPreferences.mediaBarCollectionIds).toSet();

    try {
      final response = await client.itemsApi.getItems(
        includeItemTypes: ['BoxSet'],
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 200,
      );
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      final availableIds = items.map((i) => i['Id'] as String).toSet();
      final pruned = selected.intersection(availableIds);
      if (pruned.length != selected.length) {
        _saveCsv(UserPreferences.mediaBarCollectionIds, pruned.toList());
      }

      if (!mounted) return;
      final result = await _showMultiSelectDialog(
        title: l10n.sourceCollections,
        items: {
          for (final item in items)
            item['Id'] as String: item['Name'] as String? ?? l10n.unknown,
        },
        selected: pruned,
      );
      if (result != null) {
        _saveCsv(UserPreferences.mediaBarCollectionIds, result.toList());
      }
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
    final selected = _splitCsv(UserPreferences.mediaBarExcludedGenres).toSet();

    try {
      final response = await client.itemsApi.getGenres(
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      );
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      final names =
          items
              .map((item) => (item['Name'] as String? ?? '').trim())
              .where((name) => name.isNotEmpty)
              .toSet()
              .toList()
            ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

      final available = names.toSet();
      final pruned = selected.intersection(available);
      if (pruned.length != selected.length) {
        _saveCsv(UserPreferences.mediaBarExcludedGenres, pruned.toList());
      }

      if (!mounted) return;
      final result = await _showMultiSelectDialog(
        title: l10n.excludedGenres,
        items: {for (final name in names) name: name},
        selected: pruned,
      );
      if (result != null) {
        _saveCsv(UserPreferences.mediaBarExcludedGenres, result.toList());
      }
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
      builder: (ctx) {
        final closeOnce = createDialogBackCloseHandler(ctx);
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
              builder: (ctx, setDialogState) => withCleanSettingsTypography(
                ctx,
                AlertDialog(
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
                            children: orderedEntries.map((e) {
                              return CheckboxListTile(
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
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(l10n.cancel),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(ctx, working),
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

  String _sourceSubtitle(
    Preference<String> pref,
    String noneLabel,
    AppLocalizations l10n,
  ) {
    final items = _splitCsv(pref);
    if (items.isEmpty) return noneLabel;
    return l10n.itemsSelected(items.length);
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.mediaBar)),
        body: ListView(
          children: [
            StringPickerPreferenceTile(
              preference: UserPreferences.mediaBarMode,
              title: l10n.mediaBarMode,
              description: l10n.mediaBarModeDescription,
              icon: Icons.featured_play_list,
              options: {
                UserPreferences.mediaBarModeMoonfin: l10n.mediaBarModeMoonfin,
                UserPreferences.mediaBarModeMakd: l10n.mediaBarModeMakd,
                UserPreferences.mediaBarModeOff: l10n.mediaBarModeOff,
              },
              onChanged: _pushSync,
            ),
            _MediaBarContentTypePickerTile(onChanged: _pushSync),
            _MediaBarItemCountPickerTile(onChanged: _pushSync),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                l10n.mediaSources,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFamily: kCleanSettingsFontFamily,
                ),
              ),
            ),
            _MediaBarActionTile(
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
                  UserPreferences.mediaBarLibraryIds,
                  l10n.allLibraries,
                  l10n,
                ),
              ),
              onTap: _showLibrarySelector,
            ),
            _MediaBarActionTile(
              leading: const Icon(Icons.collections_bookmark),
              title: Text(l10n.sourceCollections),
              subtitle: Text(
                _sourceSubtitle(
                  UserPreferences.mediaBarCollectionIds,
                  l10n.noneSelected,
                  l10n,
                ),
              ),
              onTap: _showCollectionSelector,
            ),
            _MediaBarActionTile(
              leading: const Icon(Icons.label_off),
              title: Text(l10n.excludedGenres),
              subtitle: Text(
                _sourceSubtitle(
                  UserPreferences.mediaBarExcludedGenres,
                  l10n.noneExcluded,
                  l10n,
                ),
              ),
              onTap: _showGenreSelector,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                l10n.behavior,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFamily: kCleanSettingsFontFamily,
                ),
              ),
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.mediaBarAutoAdvance,
              title: l10n.autoAdvance,
              subtitle: l10n.autoAdvanceSlides,
              icon: Icons.skip_next,
            ),
            IntPickerPreferenceTile(
              preference: UserPreferences.mediaBarIntervalMs,
              title: l10n.autoAdvanceInterval,
              icon: Icons.timer,
              options: {
                5000: l10n.fiveSeconds,
                10000: l10n.tenSeconds,
                15000: l10n.fifteenSeconds,
                30000: l10n.thirtySeconds,
              },
              onChanged: _pushSync,
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaBarContentTypePickerTile extends StatefulWidget {
  final VoidCallback? onChanged;

  const _MediaBarContentTypePickerTile({this.onChanged});

  @override
  State<_MediaBarContentTypePickerTile> createState() =>
      _MediaBarContentTypePickerTileState();
}

class _MediaBarContentTypePickerTileState
    extends State<_MediaBarContentTypePickerTile> {
  static const _validKeys = <String>{'both', 'movies', 'tvshows'};

  late final PreferenceBinding<String> _binding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.mediaBarContentType,
    );
    final normalized = _normalize(_binding.value);
    if (normalized != _binding.value) {
      _binding.value = normalized;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.onChanged?.call();
      });
    }
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  String _normalize(String key) => _validKeys.contains(key) ? key : 'both';

  String _labelOf(String key, AppLocalizations l10n) => switch (key) {
    'both' => l10n.moviesAndTvShows,
    'movies' => l10n.moviesOnly,
    'tvshows' => l10n.tvShowsOnly,
    _ => key,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<String>(
      valueListenable: _binding,
      builder: (context, value, _) {
        final normalized = _normalize(value);
        if (normalized != value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            if (_binding.value != normalized) {
              _binding.value = normalized;
              widget.onChanged?.call();
            }
          });
        }
        return TvFocusHighlight(
          builder: (ctx, _) => ListTile(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            leading: const Icon(Icons.category),
            title: Text(l10n.contentType),
            subtitle: Text(_labelOf(normalized, l10n)),
            onTap: () => _showPicker(context, normalized),
          ),
        );
      },
    );
  }

  Future<void> _showPicker(BuildContext context, String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final normalizedCurrent = _normalize(current);
    final options = <String, String>{
      'both': l10n.moviesAndTvShows,
      'movies': l10n.moviesOnly,
      'tvshows': l10n.tvShowsOnly,
    };
    final entries = options.entries.toList();
    final selectedIndex = entries.indexWhere((e) => e.key == normalizedCurrent);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;

    try {
      final result = await showFocusRestoringDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (ctx) {
          final closeOnce = createDialogBackCloseHandler(ctx);
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
              child: SimpleDialog(
                title: Text(l10n.contentType),
                children: entries.asMap().entries.map((entry) {
                  final i = entry.key;
                  final e = entry.value;
                  final selected = e.key == normalizedCurrent;
                  return TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      autofocus: i == autofocusIndex,
                      title: Text(e.value),
                      trailing: selected ? const Icon(Icons.check) : null,
                      onTap: () => Navigator.pop(ctx, e.key),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );

      if (!mounted || result == null || result == _binding.value) return;
      _binding.value = result;
      widget.onChanged?.call();
    } finally {
      _pickerOpen = false;
    }
  }
}

class _MediaBarItemCountPickerTile extends StatefulWidget {
  final VoidCallback? onChanged;

  const _MediaBarItemCountPickerTile({this.onChanged});

  @override
  State<_MediaBarItemCountPickerTile> createState() =>
      _MediaBarItemCountPickerTileState();
}

class _MediaBarItemCountPickerTileState
    extends State<_MediaBarItemCountPickerTile> {
  static const _options = <String, String>{
    '5': '5',
    '10': '10',
    '15': '15',
    '20': '20',
  };

  late final PreferenceBinding<String> _binding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.mediaBarItemCount,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<String>(
      valueListenable: _binding,
      builder: (context, value, _) => TvFocusHighlight(
        builder: (ctx, _) => ListTile(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          leading: const Icon(Icons.format_list_numbered),
          title: Text(l10n.itemCount),
          subtitle: Text(_options[value] ?? value),
          onTap: () => _showPicker(context, value),
        ),
      ),
    );
  }

  Future<void> _showPicker(BuildContext context, String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final entries = _options.entries.toList();
    final selectedIndex = entries.indexWhere((e) => e.key == current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    try {
      final result = await showFocusRestoringDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (ctx) {
          final closeOnce = createDialogBackCloseHandler(ctx);
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
              child: SimpleDialog(
                title: Text(l10n.itemCount),
                children: entries.asMap().entries.map((entry) {
                  final i = entry.key;
                  final e = entry.value;
                  final selected = e.key == current;
                  return TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      autofocus: i == autofocusIndex,
                      title: Text(e.value),
                      trailing: selected ? const Icon(Icons.check) : null,
                      onTap: () => Navigator.pop(ctx, e.key),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );

      if (!mounted || result == null || result == _binding.value) return;
      _binding.value = result;
      widget.onChanged?.call();
    } finally {
      _pickerOpen = false;
    }
  }
}

class _MediaBarActionTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final VoidCallback? onTap;

  const _MediaBarActionTile({
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
