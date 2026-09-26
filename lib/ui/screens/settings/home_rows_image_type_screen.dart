import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../util/home_row_title_localizer.dart';

class HomeRowsImageTypeScreen extends StatefulWidget {
  const HomeRowsImageTypeScreen({super.key});

  @override
  State<HomeRowsImageTypeScreen> createState() =>
      _HomeRowsImageTypeScreenState();
}

class _HomeRowsImageTypeScreenState extends State<HomeRowsImageTypeScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _syncService = GetIt.instance<PluginSyncService>();
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _prefs.addListener(_onPrefsChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    super.dispose();
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _pushSync() async {
    if (!_syncService.pluginAvailable) return;
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;
    final client = GetIt.instance<MediaServerClient>();
    await _syncService.pushSettings(client);
  }


  String _imageTypeLabel(ImageType type, AppLocalizations l10n) =>
      switch (type) {
        ImageType.poster => l10n.posterLabel,
        ImageType.thumb => l10n.thumbnailLabel,
        ImageType.banner => l10n.bannerLabel,
      };

  Future<void> _setPerRowImageType(
    HomeSectionType type,
    ImageType value,
  ) async {
    await _prefs.set(UserPreferences.homeRowImageType(type), value);
    await _pushSync();
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enabledSections =
        _prefs.homeSectionsConfig
            .where(
              (c) =>
                  c.enabled &&
                  c.type != HomeSectionType.none &&
                  c.type != HomeSectionType.mediaBar &&
                  c.type != HomeSectionType.resumeAudio &&
                  c.type != HomeSectionType.libraryButtons,
            )
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.perRowImageType)),
        body: ListView(
          children: [
            SettingsSectionHeader(l10n.images),
            adaptiveListSection(
              children: [
                TvFocusHighlight(
                  builder: (_, _) => ListTile(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    leading: const Icon(Icons.view_stream),
                    title: Text(l10n.perRowSettings),
                  ),
                ),
                for (final section in enabledSections)
                  TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      leading: const Icon(Icons.image_outlined),
                      title: Text(localizeHomeSectionTitle(section.type, l10n)),
                      subtitle: Text(
                        _imageTypeLabel(
                          _prefs.get(
                            UserPreferences.homeRowImageType(section.type),
                          ),
                          l10n,
                        ),
                      ),
                      onTap: () => _showImageTypePicker(
                        context,
                        current: _prefs.get(
                          UserPreferences.homeRowImageType(section.type),
                        ),
                        onSelected: (value) =>
                            _setPerRowImageType(section.type, value),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImageTypePicker(
    BuildContext context, {
    required ImageType current,
    required Future<void> Function(ImageType value) onSelected,
  }) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final values = ImageType.values.toList();
    final selectedIndex = values.indexOf(current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    try {
      final result = await showFocusRestoringDialog<ImageType>(
        context: context,
        useRootNavigator: false,
        builder: (ctx) {
          final closeOnce = createDialogBackCloseHandler(ctx);
          var picked = false;
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
                title: Text(l10n.imageType),
                children: values.asMap().entries.map((entry) {
                  final i = entry.key;
                  final v = entry.value;
                  final selected = v == current;
                  return TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      autofocus: i == autofocusIndex,
                      title: Text(_imageTypeLabel(v, l10n)),
                      trailing: selected ? const Icon(Icons.check) : null,
                      onTap: () {
                        if (picked) return;
                        picked = true;
                        Navigator.pop(ctx, v);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
      if (result != null && result != current) {
        await onSelected(result);
      }
    } finally {
      _pickerOpen = false;
    }
  }
}
