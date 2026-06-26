import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/storage_path_service.dart';
import '../../../data/services/theme_store_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';

class ThemeStoreScreen extends StatefulWidget {
  const ThemeStoreScreen({super.key});

  @override
  State<ThemeStoreScreen> createState() => _ThemeStoreScreenState();
}

class _ThemeStoreScreenState extends State<ThemeStoreScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _service = ThemeStoreService(GetIt.instance<StoragePathService>());

  final _refreshFocusNode = FocusNode(debugLabel: 'theme_store_refresh');
  final _firstItemFocusNode = FocusNode(debugLabel: 'theme_store_first_item');

  bool _loading = true;
  bool _loadFailed = false;
  bool _actionsOpen = false;
  String? _busyId;
  List<ThemeStoreCatalogEntry> _catalog = const [];

  @override
  void initState() {
    super.initState();
    unawaited(_loadCatalog());
  }

  @override
  void dispose() {
    _refreshFocusNode.dispose();
    _firstItemFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadCatalog() async {
    setState(() {
      _loading = true;
      _loadFailed = false;
    });
    try {
      final catalog = await _service.fetchCatalog();
      if (!mounted) return;
      setState(() {
        _loading = false;
        _catalog = catalog;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadFailed = true;
      });
    }
  }

  Future<void> _saveTheme(
    ThemeStoreCatalogEntry entry, {
    required bool apply,
  }) async {
    if (_busyId != null) return;
    final l10n = AppLocalizations.of(context);
    setState(() => _busyId = entry.id);
    try {
      final spec = await _service.fetchThemeSpec(entry.file);
      await _service.saveStoreTheme(spec);
      if (apply && mounted) {
        await AppThemeScope.of(context).applyThemeById(_prefs, spec.id);
      }
      if (!mounted) return;
      setState(() => _busyId = null);
      _showMessage(l10n.themeStoreSavedMessage(spec.displayName));
    } catch (_) {
      if (!mounted) return;
      setState(() => _busyId = null);
      _showMessage(l10n.themeStoreInvalidMessage);
    }
  }

  Future<void> _removeTheme(ThemeStoreCatalogEntry entry) async {
    if (_busyId != null) return;
    final l10n = AppLocalizations.of(context);
    final controller = AppThemeScope.of(context);
    final wasCurrent = _prefs.get(UserPreferences.customThemeId) == entry.id;
    setState(() => _busyId = entry.id);
    try {
      await _service.deleteStoreTheme(entry.id);
      if (wasCurrent && mounted) {
        await controller.applyCustomTheme(_prefs, '');
      }
    } catch (_) {}
    if (!mounted) return;
    setState(() => _busyId = null);
    _showMessage(l10n.savedThemesDeletedMessage(entry.displayName));
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _showActions(ThemeStoreCatalogEntry entry, bool saved) async {
    // Guard against a repeated d-pad activation stacking a second dialog.
    if (_actionsOpen) return;
    _actionsOpen = true;
    final l10n = AppLocalizations.of(context);
    final controller = AppThemeScope.of(context);
    final isCurrent = _prefs.get(UserPreferences.customThemeId) == entry.id;
    try {
      await showFocusRestoringDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog.adaptive(
            backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
            title: Text(entry.displayName),
            content: entry.description != null && entry.description!.isNotEmpty
                ? Text(entry.description!)
                : null,
            actions: [
              if (!saved) ...[
                adaptiveDialogAction(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    unawaited(_saveTheme(entry, apply: false));
                  },
                  child: Text(l10n.themeStoreSave),
                ),
                adaptiveDialogAction(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    unawaited(_saveTheme(entry, apply: true));
                  },
                  child: Text(l10n.themeStoreSaveAndApply),
                ),
              ] else ...[
                if (!isCurrent)
                  adaptiveDialogAction(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      unawaited(controller.applyThemeById(_prefs, entry.id));
                    },
                    child: Text(l10n.apply),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    unawaited(_removeTheme(entry));
                  },
                  child: Text(
                    l10n.delete,
                    style: TextStyle(color: AppColorScheme.statusRequested),
                  ),
                ),
              ],
              adaptiveDialogAction(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(l10n.cancel),
              ),
            ],
          );
        },
      );
    } finally {
      _actionsOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final savedIds = _service.savedStoreThemeIds();

    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV
            ? (_catalog.isNotEmpty ? _firstItemFocusNode : _refreshFocusNode)
            : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            Text(l10n.themeStore),
            actions: [
              IconButton(
                focusNode: _refreshFocusNode,
                style: IconButton.styleFrom(
                  focusColor: AppColorScheme.accent.withValues(alpha: 0.18),
                ),
                onPressed: _loading ? null : () => unawaited(_loadCatalog()),
                icon: const Icon(Icons.refresh),
                tooltip: l10n.refresh,
              ),
            ],
          ),
          body: _loading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      l10n.themeStoreDescription,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.74,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_loadFailed)
                      Text(
                        l10n.themeStoreLoadFailed,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.74,
                          ),
                        ),
                      )
                    else if (_catalog.isEmpty)
                      Text(
                        l10n.themeStoreEmpty,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.74,
                          ),
                        ),
                      ),
                    for (final (i, entry) in _catalog.indexed)
                      _buildEntry(
                        context,
                        i,
                        entry,
                        savedIds.contains(entry.id),
                      ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildEntry(
    BuildContext context,
    int index,
    ThemeStoreCatalogEntry entry,
    bool saved,
  ) {
    final l10n = AppLocalizations.of(context);
    final busy = _busyId == entry.id;
    final trailing = busy
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : (saved ? const Icon(Icons.download_done_outlined) : null);

    final subtitle = entry.description != null && entry.description!.isNotEmpty
        ? entry.description!
        : (saved ? l10n.themeStoreSaved : entry.id);

    if (PlatformDetection.isTV) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TvFocusHighlight(
          builder: (context, focused) => ListTile(
            focusNode: index == 0 ? _firstItemFocusNode : null,
            leading: const Icon(Icons.storefront_outlined),
            title: Text(entry.displayName),
            subtitle: Text(subtitle),
            trailing: trailing,
            onTap: busy ? null : () => unawaited(_showActions(entry, saved)),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.storefront_outlined),
          title: Text(entry.displayName),
          subtitle: Text(subtitle),
          trailing: trailing,
          onTap: busy ? null : () => unawaited(_showActions(entry, saved)),
        ),
      ),
    );
  }
}
