import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../data/services/iptv/iptv_backup_service.dart';
import '../../../data/services/iptv/iptv_playlist_error_message.dart';
import '../../../data/services/iptv/iptv_profiles_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/overlay_sheet.dart';
import 'widgets/iptv_login_widgets.dart';

/// IPTV management hub: the playlists with their per playlist tools,
/// TMDB metadata setup, and backup and restore.
class IptvPlaylistsScreen extends StatefulWidget {
  const IptvPlaylistsScreen({super.key});

  @override
  State<IptvPlaylistsScreen> createState() => _IptvPlaylistsScreenState();
}

class _IptvPlaylistsScreenState extends State<IptvPlaylistsScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  final _playlistService = GetIt.instance<PlaylistService>();
  final _preferences = GetIt.instance<UserPreferences>();
  late final _playlists = PlaylistRepository(GetIt.instance<IptvDatabase>());

  List<Playlist> _items = const [];
  bool _loading = true;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _playlistService.addListener(_onServiceChanged);
    _load();
  }

  @override
  void dispose() {
    _playlistService.removeListener(_onServiceChanged);
    super.dispose();
  }

  void _onServiceChanged() {
    if (mounted) _load();
  }

  Future<void> _load() async {
    final items = await _playlists.getAllPlaylists();
    if (!mounted) return;
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String _typeLabel(String sourceType) {
    if (sourceType == PlaylistSourceType.xtreamCodes.name) {
      return _l10n.iptvXtream;
    }
    if (sourceType == PlaylistSourceType.m3uFile.name) {
      return _l10n.iptvM3uFileLabel;
    }
    return _l10n.iptvM3uUrl;
  }

  void _showPlaylistActions(Playlist playlist) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(playlist.name),
        content: Text(
          _typeLabel(playlist.sourceType),
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _refreshPlaylist(playlist);
            },
            child: Text(_l10n.refresh),
          ),
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _showEditDialog(playlist);
            },
            child: Text(_l10n.edit),
          ),
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.push(
                '${Destinations.iptvEditor}?playlistId=${playlist.id}'
                '&name=${Uri.encodeComponent(playlist.name)}',
              );
            },
            child: Text(_l10n.iptvChannelEditor),
          ),
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.push(
                '${Destinations.iptvHealthCheck}?playlistId=${playlist.id}'
                '&name=${Uri.encodeComponent(playlist.name)}',
              );
            },
            child: Text(_l10n.iptvHealthCheck),
          ),
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.push(
                '${Destinations.iptvDuplicates}?playlistId=${playlist.id}'
                '&name=${Uri.encodeComponent(playlist.name)}',
              );
            },
            child: Text(_l10n.iptvFindDuplicates),
          ),
          adaptiveDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _confirmDelete(playlist);
            },
            child: Text(_l10n.delete),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshPlaylist(Playlist playlist) async {
    final l10n = _l10n;
    setState(() => _busy = true);
    try {
      await _playlistService.refreshPlaylist(playlist.id);
      homeRefreshBus.requestNowOrAfterNavigation();
      // The service catches its own failures and keeps them on error.
      final error = _playlistService.error;
      _snack(
        error == null
            ? l10n.iptvPlaylistRefreshed(playlist.name)
            : l10n.iptvRefreshFailed(iptvPlaylistErrorMessage(l10n, error)),
      );
    } catch (e) {
      _snack(l10n.iptvRefreshFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _showEditDialog(Playlist playlist) {
    // The field still reads the controller while the dialog animates out, so
    // it's left to the garbage collector instead of being disposed on pop.
    final nameController = TextEditingController(text: playlist.name);
    final epgController = TextEditingController(text: playlist.epgUrl ?? '');
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(_l10n.iptvEditPlaylist),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlassField(
              controller: nameController,
              label: _l10n.name,
              icon: Icons.bookmark_outline,
            ),
            const SizedBox(height: 14),
            GlassField(
              controller: epgController,
              label: _l10n.iptvEpgUrlOptional,
              icon: Icons.calendar_today_outlined,
              keyboardType: TextInputType.url,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final epg = epgController.text.trim();
              Navigator.of(dialogContext).pop();
              await _playlistService.updatePlaylist(
                id: playlist.id,
                name: name.isEmpty ? null : name,
                epgUrl: epg,
              );
            },
            child: Text(_l10n.save),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(Playlist playlist) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(_l10n.iptvDeleteConfirmTitle(playlist.name)),
        content: Text(_l10n.iptvDeletePlaylistBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              final message = _l10n.iptvPlaylistDeleted(playlist.name);
              Navigator.of(dialogContext).pop();
              await _playlistService.deletePlaylist(playlist.id);
              homeRefreshBus.requestNowOrAfterNavigation();
              _snack(message);
            },
            child: Text(_l10n.delete),
          ),
        ],
      ),
    );
  }

  void _showTmdbDialog() {
    // The field still reads the controller while the dialog animates out, so
    // it's left to the garbage collector instead of being disposed on pop.
    final controller = TextEditingController(
      text: _preferences.get(UserPreferences.tmdbApiKey),
    );
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(_l10n.iptvTmdbApiKeyTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_l10n.iptvTmdbExplainer, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 16),
            GlassField(
              controller: controller,
              label: _l10n.iptvApiKey,
              icon: Icons.vpn_key_outlined,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              final key = controller.text.trim();
              Navigator.of(dialogContext).pop();
              await _preferences.set(UserPreferences.tmdbApiKey, key);
              if (mounted) setState(() {});
            },
            child: Text(_l10n.save),
          ),
        ],
      ),
    );
  }

  IptvBackupService _backupService() => IptvBackupService(
    db: GetIt.instance<IptvDatabase>(),
    playlistService: _playlistService,
    profilesService: GetIt.instance<IptvProfilesService>(),
    credentials: GetIt.instance<IptvCredentialStore>(),
  );

  Future<void> _exportBackup() async {
    final l10n = _l10n;
    setState(() => _busy = true);
    try {
      final json = await _backupService().exportBackup();
      if (!mounted) return;
      // The picker writes the file itself, since Android hands back a content
      // URI that File can't open.
      final path = await FilePicker.saveFile(
        dialogTitle: l10n.iptvSaveBackupTitle,
        fileName: 'iptv-backup.json',
        bytes: utf8.encode(json),
      );
      if (path == null) return;
      _snack(l10n.iptvBackupSaved);
    } catch (e) {
      _snack(l10n.iptvBackupFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restoreBackup() async {
    final l10n = _l10n;
    // The bytes work on every platform, where web has no file path.
    final result = await FilePicker.pickFiles(
      dialogTitle: l10n.iptvSelectBackupTitle,
      withData: true,
    );
    final bytes = result?.files.single.bytes;
    if (bytes == null || !mounted) return;
    setState(() => _busy = true);
    try {
      final summary = await _backupService().restoreBackup(
        utf8.decode(bytes, allowMalformed: true),
      );
      homeRefreshBus.requestNowOrAfterNavigation();
      await _load();
      final counts = l10n.iptvRestoredCounts(
        summary.playlistsRestored,
        summary.profilesRestored,
        summary.favoritesRestored,
        summary.progressRestored,
      );
      _snack(
        summary.warnings.isEmpty
            ? counts
            : l10n.iptvRestoredSkipped(counts, summary.warnings.join(', ')),
      );
    } on FormatException catch (e) {
      _snack(e.message);
    } catch (e) {
      _snack(l10n.iptvRestoreFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tmdbConfigured = _preferences
        .get(UserPreferences.tmdbApiKey)
        .trim()
        .isNotEmpty;
    final dim = AppColorScheme.onSurface.withValues(alpha: 0.6);

    return Scaffold(
      appBar: AppBar(title: Text(_l10n.iptvTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Destinations.iptvSetup),
        icon: const Icon(Icons.add),
        label: Text(_l10n.iptvAddPlaylist),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.only(bottom: 88),
              children: [
                if (_busy || _playlistService.isLoading)
                  const LinearProgressIndicator(),
                _sectionHeader(_l10n.playlists),
                if (_items.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _l10n.iptvNoPlaylistsYet,
                      style: TextStyle(color: dim),
                    ),
                  ),
                for (var i = 0; i < _items.length; i++)
                  ListTile(
                    autofocus: i == 0,
                    leading: const Icon(Icons.playlist_play),
                    title: Text(_items[i].name),
                    subtitle: Text(_typeLabel(_items[i].sourceType)),
                    onTap: _busy ? null : () => _showPlaylistActions(_items[i]),
                  ),
                _sectionHeader(_l10n.iptvMetadataSection),
                ListTile(
                  leading: const Icon(Icons.movie_filter_outlined),
                  title: Text(_l10n.iptvTmdbTileTitle),
                  subtitle: Text(
                    tmdbConfigured
                        ? _l10n.iptvConfigured
                        : _l10n.iptvNotConfigured,
                    style: TextStyle(color: dim),
                  ),
                  onTap: _showTmdbDialog,
                ),
                // Apple TV has no file picker to save or open a backup with.
                if (!PlatformDetection.isAppleTV) ...[
                  _sectionHeader(_l10n.iptvBackupSection),
                  ListTile(
                    leading: const Icon(Icons.upload_file_outlined),
                    title: Text(_l10n.iptvExportBackup),
                    subtitle: Text(
                      _l10n.iptvExportBackupSubtitle,
                      style: TextStyle(color: dim),
                    ),
                    onTap: _busy ? null : _exportBackup,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_backup_restore),
                    title: Text(_l10n.iptvRestoreBackup),
                    onTap: _busy ? null : _restoreBackup,
                  ),
                ],
              ],
            ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColorScheme.accent,
        ),
      ),
    );
  }
}
