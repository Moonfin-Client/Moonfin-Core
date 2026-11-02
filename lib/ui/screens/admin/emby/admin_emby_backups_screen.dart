import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../navigation/destinations.dart';
import '../../../util/error_message.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../plugins/admin_plugin_detail_screen.dart';
import '../widgets/admin_form_styles.dart';
import '../widgets/premiere_note.dart';

const _backupTaskKey = 'EmbyServerBackup';

/// The plugin's settings page, where its backup folder is set.
const _settingsPage = 'embybackup';

/// The backup task is hidden, so the live task feed doesn't carry it and a
/// running backup is checked on instead.
const _backupPollInterval = Duration(seconds: 2);

/// Emby's backups, which come from its Backup & Restore plugin: one full
/// backup and any number of database-only ones.
class AdminEmbyBackupsScreen extends StatefulWidget {
  const AdminEmbyBackupsScreen({super.key});

  @override
  State<AdminEmbyBackupsScreen> createState() => _AdminEmbyBackupsScreenState();
}

class _AdminEmbyBackupsScreenState extends State<AdminEmbyBackupsScreen> {
  bool _loading = true;
  bool _notInstalled = false;
  bool _backingUp = false;
  bool _restoring = false;
  String? _error;
  Map<String, dynamic> _info = const {};
  TaskInfo? _task;

  MediaServerClient get _client => GetIt.instance<MediaServerClient>();
  EmbyAdminApi get _api => _client.embyAdminApi!;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      // _backupTask never throws, so it can run alongside.
      final pendingTask = _backupTask();
      final info = await _api.getBackupInfo();
      final task = await pendingTask;
      if (!mounted) return;
      setState(() {
        _info = info;
        _task = task;
        _notInstalled = false;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      // The plugin's routes only exist while it's installed.
      final missing = e is DioException && e.response?.statusCode == 404;
      setState(() {
        _notInstalled = missing;
        _error = missing
            ? null
            : describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  /// A failed lookup only hides Back up now.
  Future<TaskInfo?> _backupTask() async {
    try {
      final tasks = await _client.adminTasksApi.getTasks();
      final raw = tasks.where((t) => t['Key'] == _backupTaskKey).firstOrNull;
      return raw == null ? null : TaskInfo.fromJson(raw);
    } catch (_) {
      return null;
    }
  }

  /// Runs the backup task and waits for it, so its result shows here.
  Future<void> _backUp(TaskInfo task) async {
    final l10n = AppLocalizations.of(context);
    setState(() => _backingUp = true);
    try {
      await _client.adminTasksApi.startTask(task.id);
      String state;
      do {
        await Future<void>.delayed(_backupPollInterval);
        if (!mounted) return;
        state = TaskInfo.fromJson(await _client.adminTasksApi.getTask(task.id))
            .state;
      } while (state != 'Idle');
      if (!mounted) return;
      setState(() => _backingUp = false);
      await _load();
    } catch (e) {
      if (!mounted) return;
      setState(() => _backingUp = false);
      _snack(l10n.adminBackupCreateFailed(describeError(e, l10n)));
    }
  }

  Future<void> _restore({
    required String label,
    String? lightBackupName,
  }) async {
    final l10n = AppLocalizations.of(context);
    var restoreServerId = true;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog.adaptive(
          title: Text(l10n.adminConfirmRestore),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.adminEmbyRestoreConfirm(label)),
              const SizedBox(height: 8),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.adminEmbyRestoreServerId),
                subtitle: Text(l10n.adminEmbyRestoreServerIdHelp),
                value: restoreServerId,
                onChanged: (v) => setLocal(() => restoreServerId = v ?? true),
              ),
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
                backgroundColor: Theme.of(ctx).colorScheme.error,
              ),
              child: Text(l10n.restore),
            ),
          ],
        ),
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _restoring = true);
    try {
      await _api.restoreBackup(
        restoreServerId: restoreServerId,
        lightBackupName: lightBackupName,
      );
      if (!mounted) return;
      setState(() => _restoring = false);
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog.adaptive(
          content: Text(l10n.adminEmbyRestoreShuttingDown),
          actions: [
            adaptiveDialogAction(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.ok),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _restoring = false);
      // Without Premiere the plugin answers with its own message.
      _snack(l10n.adminRestoreFailed(describeError(e, l10n)));
    }
  }

  void _snack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  String? _formatDate(Object? raw) {
    final date = parseServerDate(raw)?.toLocal();
    if (date == null) return null;
    String two(int n) => n.toString().padLeft(2, '0');
    return '${date.year}-${two(date.month)}-${two(date.day)} '
        '${two(date.hour)}:${two(date.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_restoring) return _buildRestoring(l10n);
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.adminBackupsLoadFailed,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonal(onPressed: _load, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(
        16,
        20,
        16,
        MediaQuery.paddingOf(context).bottom + 40,
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: adminScreenHeader(
                context,
                title: l10n.adminBackupsTitle,
                subtitle: l10n.adminEmbyBackupsHelp,
                icon: Icons.backup_outlined,
              ),
            ),
            IconButton(
              tooltip: l10n.refresh,
              onPressed: _load,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        PremiereNote(message: (l) => l.adminPremiereNoteBackups),
        if (_notInstalled)
          adminGlassGroup(
            context,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.spaceLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.adminEmbyBackupsNoPlugin),
                    const SizedBox(height: 12),
                    FilledButton.tonal(
                      onPressed: () => context.push(Destinations.adminPlugins),
                      child: Text(l10n.adminDrawerPlugins),
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          ..._buildBackups(context, l10n),
      ],
    );
  }

  List<Widget> _buildBackups(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.55);
    final full = _info['FullBackupInfo'] is Map
        ? (_info['FullBackupInfo'] as Map).cast<String, dynamic>()
        : const <String, dynamic>{};
    final light = [
      for (final backup in _info['LightBackups'] as List? ?? const [])
        if (backup is Map) backup.cast<String, dynamic>(),
    ];
    // The plugin restores only once it holds a full backup, from it or from
    // any database backup.
    final canRestore = full['CanRestore'] == true;
    final fullDate = _formatDate(full['DateCreated']);
    final serverVersion = full['ServerVersion'] as String?;
    final task = _task;
    final result = task?.lastExecutionResult;

    return [
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          if (task != null)
            FilledButton.icon(
              onPressed: _backingUp ? null : () => _backUp(task),
              icon: _backingUp
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.backup_outlined),
              label: Text(l10n.adminEmbyBackupNow),
            ),
          OutlinedButton.icon(
            onPressed: () => openPluginSettingsPage(context, _settingsPage),
            icon: const Icon(Icons.open_in_new),
            label: Text(l10n.adminPluginSettingsPage),
          ),
        ],
      ),
      if (result != null && result.status != 'Completed')
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.spaceMd),
          child: Text(
            l10n.adminBackupCreateFailed(result.errorMessage ?? result.status),
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ),
      const SizedBox(height: AppSpacing.spaceLg),
      adminSectionLabel(
        context,
        l10n.adminEmbyFullBackup,
        icon: Icons.archive_outlined,
      ),
      adminGlassGroup(
        context,
        children: [
          if (fullDate != null || serverVersion != null)
            ListTile(
              title: Text(fullDate ?? '${full['Name'] ?? ''}'),
              subtitle: serverVersion == null
                  ? null
                  : Text(l10n.adminEmbyBackupServerVersion(serverVersion)),
              trailing: canRestore
                  ? TextButton(
                      onPressed: () =>
                          _restore(label: l10n.adminEmbyFullBackup),
                      child: Text(l10n.restore),
                    )
                  : null,
            )
          else
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spaceLg),
              child: Text(l10n.adminNoBackups, style: TextStyle(color: muted)),
            ),
        ],
      ),
      if (light.isNotEmpty) ...[
        adminSectionLabel(
          context,
          l10n.adminEmbyLightBackups,
          icon: Icons.storage_outlined,
        ),
        adminGlassGroup(
          context,
          children: [
            for (final backup in light)
              if (backup['Name'] case final String name)
                ListTile(
                  title: Text(name),
                  subtitle: switch (_formatDate(backup['DateCreated'])) {
                    final date? => Text(date),
                    null => null,
                  },
                  trailing: canRestore
                      ? TextButton(
                          onPressed: () =>
                              _restore(label: name, lightBackupName: name),
                          child: Text(l10n.restore),
                        )
                      : null,
                ),
          ],
        ),
      ],
    ];
  }

  Widget _buildRestoring(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceXl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.adminRestoringBackup,
                style: Theme.of(context).textTheme.titleMedium,
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
