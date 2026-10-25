import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../widgets/admin_form_styles.dart';

class AdminBackupsScreen extends StatefulWidget {
  const AdminBackupsScreen({super.key});

  @override
  State<AdminBackupsScreen> createState() => _AdminBackupsScreenState();
}

/// How often a restore checks whether the server is back up. Kept short so
/// a quick restore doesn't leave the page stuck.
const _restorePollInterval = Duration(seconds: 10);

class _AdminBackupsScreenState extends State<AdminBackupsScreen> {
  bool _loading = true;
  String? _error;
  List<Map<String, dynamic>> _backups = const [];

  /// Set while a create or restore runs, and the page shows it instead of the
  /// list.
  ({String title, String text})? _progress;

  MediaServerClient get _client => GetIt.instance<MediaServerClient>();
  AdminBackupApi get _api => _client.adminBackupApi;

  @override
  void initState() {
    super.initState();
    _loadBackups();
  }

  Future<void> _loadBackups() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final backups = await _api.getBackups();
      backups.sort((a, b) {
        final ad = _backupDate(a);
        final bd = _backupDate(b);
        if (ad == null && bd == null) return 0;
        if (ad == null) return 1;
        if (bd == null) return -1;
        return bd.compareTo(ad);
      });
      if (!mounted) return;
      setState(() {
        _backups = backups;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        // GET /Backup only 404s on a server without the backup API.
        _error = e is DioException && e.response?.statusCode == 404
            ? l10n.adminBackupsNotAvailable
            : describeError(e, l10n);
        _loading = false;
      });
    }
  }

  /// Restore and Manifest answer 404 when the archive is gone.
  String _archiveError(Object error) {
    final l10n = AppLocalizations.of(context);
    if (error is DioException && error.response?.statusCode == 404) {
      return l10n.adminBackupArchiveNotFound;
    }
    return describeError(error, l10n);
  }

  String _backupPath(Map<String, dynamic> item) =>
      item['Path']?.toString() ?? '';

  String _backupName(Map<String, dynamic> item) {
    final path = _backupPath(item);
    if (path.isEmpty) return AppLocalizations.of(context).adminUnnamedBackup;
    final normalized = path.replaceAll('\\', '/');
    return normalized.substring(normalized.lastIndexOf('/') + 1);
  }

  DateTime? _backupDate(Map<String, dynamic> item) {
    return parseServerDate(item['DateCreated']);
  }

  String _formatDate(DateTime? date) {
    if (date == null) return AppLocalizations.of(context).adminUnknownDate;
    final local = date.toLocal();
    return '${local.year}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')} '
        '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

  void _snack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<Map<String, dynamic>?> _promptBackupOptions() {
    final l10n = AppLocalizations.of(context);
    var metadata = false;
    var subtitles = false;
    var trickplay = false;
    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog.adaptive(
          title: Text(l10n.adminBackupOptionsTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.adminBackupDisclaimer),
              const SizedBox(height: 8),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.adminBackupDatabase),
                subtitle: Text(l10n.adminBackupDatabaseAlways),
                value: true,
                onChanged: null,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.adminBackupMetadata),
                value: metadata,
                onChanged: (v) => setLocal(() => metadata = v ?? false),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.adminBackupSubtitles),
                value: subtitles,
                onChanged: (v) => setLocal(() => subtitles = v ?? false),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.adminBackupTrickplay),
                value: trickplay,
                onChanged: (v) => setLocal(() => trickplay = v ?? false),
              ),
            ],
          ),
          actions: [
            adaptiveDialogAction(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, {
                'Metadata': metadata,
                'Subtitles': subtitles,
                'Trickplay': trickplay,
              }),
              child: Text(l10n.create),
            ),
          ],
        ),
      ),
    );
  }

  /// Names of the visible scheduled tasks that aren't idle. A failed lookup
  /// skips the warning rather than blocking the backup.
  Future<List<String>> _runningTasks() async {
    try {
      final tasks = await _client.adminTasksApi.getTasks(isHidden: false);
      return [
        for (final task in tasks)
          if (task['State'] != null && task['State'] != 'Idle')
            task['Name']?.toString() ?? '',
      ];
    } catch (_) {
      return const [];
    }
  }

  Future<bool> _confirmRunningTasks(List<String> names) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.adminBackupTasksWarningTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.adminBackupTasksWarning),
            const SizedBox(height: 8),
            for (final name in names) Text('- $name'),
          ],
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: AppColorScheme.recordingScheduled,
            ),
            child: Text(l10n.create),
          ),
        ],
      ),
    );
    return confirmed == true;
  }

  Future<void> _createBackup() async {
    if (_progress != null) return;
    final options = await _promptBackupOptions();
    if (options == null || !mounted) return;
    final running = await _runningTasks();
    if (!mounted) return;
    if (running.isNotEmpty && !await _confirmRunningTasks(running)) return;
    if (!mounted) return;

    final l10n = AppLocalizations.of(context);
    setState(() => _progress = (
      title: l10n.adminCreatingBackup,
      text: l10n.adminBackupDisclaimer,
    ));
    try {
      await _api.createBackup(options);
      if (!mounted) return;
      setState(() => _progress = null);
      _snack(l10n.adminBackupCreated);
      await _loadBackups();
    } catch (e) {
      if (!mounted) return;
      setState(() => _progress = null);
      _snack(l10n.adminBackupCreateFailed(describeError(e, l10n)));
    }
  }

  Future<void> _viewManifest(Map<String, dynamic> backup) async {
    final l10n = AppLocalizations.of(context);
    final path = _backupPath(backup);
    if (path.isEmpty) {
      _snack(l10n.adminBackupPathMissing);
      return;
    }

    try {
      final manifest = await _api.getBackupManifest(path);
      if (!mounted) return;
      final pretty = const JsonEncoder.withIndent('  ').convert(manifest);
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog.adaptive(
          title: Text(l10n.adminBackupManifest(_backupName(backup))),
          content: SizedBox(
            width: (MediaQuery.sizeOf(ctx).width - 32).clamp(280.0, 640.0),
            child: SingleChildScrollView(
              child: SelectableText(
                pretty,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
          ),
          actions: [
            adaptiveDialogAction(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.close),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      _snack(l10n.adminManifestLoadFailed(_archiveError(e)));
    }
  }

  Future<bool> _confirmStep(String message, String confirmLabel) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.adminConfirmRestore),
        content: Text(message),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
    return confirmed == true;
  }

  Future<void> _restoreBackup(Map<String, dynamic> backup) async {
    final l10n = AppLocalizations.of(context);
    final path = _backupPath(backup);
    if (path.isEmpty) {
      _snack(l10n.adminBackupPathMissing);
      return;
    }

    for (final message in [
      l10n.adminRestoreWarning1,
      l10n.adminRestoreWarning2,
      l10n.adminRestoreWarning3,
    ]) {
      if (!await _confirmStep(message, l10n.continueAction) || !mounted) {
        return;
      }
    }
    if (!await _confirmStep(
          l10n.adminRestoreConfirmMessage(_backupName(backup)),
          l10n.restore,
        ) ||
        !mounted) {
      return;
    }

    setState(() => _progress = (
      title: l10n.adminRestoringBackup,
      text: _backupName(backup),
    ));
    try {
      await _api.restoreBackup(path);
    } catch (e) {
      if (!mounted) return;
      setState(() => _progress = null);
      _snack(l10n.adminRestoreFailed(_archiveError(e)));
      return;
    }
    if (!mounted) return;

    // The server stops itself half a second after answering, restores, then
    // starts again, so wait for it to come back.
    setState(() => _progress = (
      title: l10n.adminRestoreInProgress,
      text: l10n.adminRestoreWaitingForServer,
    ));
    while (true) {
      await Future<void>.delayed(_restorePollInterval);
      if (!mounted) return;
      try {
        await _client.systemApi.getPublicSystemInfo();
        break;
      } catch (_) {
        // Still down.
      }
    }
    if (!mounted) return;
    setState(() => _progress = null);
    _snack(l10n.adminRestoreSucceeded);
    await _loadBackups();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final progress = _progress;
    if (progress != null) return _buildProgress(progress.title, progress.text);

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminBackupsLoadFailed,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonal(onPressed: _loadBackups, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.55);
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomSafe + 40),
      children: [
        Row(
          children: [
            Expanded(
              child: adminScreenHeader(
                context,
                title: l10n.adminBackupsTitle,
                subtitle: l10n.adminBackupsHelp,
                icon: Icons.backup_outlined,
              ),
            ),
            IconButton(
              tooltip: l10n.refresh,
              onPressed: _loadBackups,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton.icon(
            onPressed: _createBackup,
            icon: const Icon(Icons.add),
            label: Text(l10n.adminCreateBackup),
          ),
        ),
        const SizedBox(height: AppSpacing.spaceLg),
        if (_backups.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceXl),
            child: Center(
              child: Text(l10n.adminNoBackups, style: TextStyle(color: muted)),
            ),
          )
        else
          adminGlassGroup(
            context,
            children: [
              for (final backup in _backups)
                ListTile(
                  leading: Icon(Icons.archive_outlined,
                      color: AppColorScheme.accent),
                  title: Text(_formatDate(_backupDate(backup))),
                  subtitle: Text(
                    _backupPath(backup),
                    style: TextStyle(fontSize: 12, color: muted),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) => value == 'restore'
                        ? _restoreBackup(backup)
                        : _viewManifest(backup),
                    itemBuilder: (ctx) => [
                      PopupMenuItem(
                        value: 'manifest',
                        child: Text(l10n.adminViewDetails),
                      ),
                      PopupMenuItem(
                        value: 'restore',
                        child: Text(l10n.restore),
                      ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildProgress(String title, String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceXl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              const LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
