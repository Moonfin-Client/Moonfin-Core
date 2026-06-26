import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/log_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';

class DiagnosticsSettingsScreen extends StatefulWidget {
  const DiagnosticsSettingsScreen({super.key});

  @override
  State<DiagnosticsSettingsScreen> createState() =>
      _DiagnosticsSettingsScreenState();
}

class _DiagnosticsSettingsScreenState extends State<DiagnosticsSettingsScreen> {
  LogService get _log => GetIt.instance<LogService>();

  bool _uploading = false;
  LogCategory? _filter;

  Future<void> _sendReport() async {
    setState(() => _uploading = true);
    try {
      final fileName = await _log.uploadToServer();
      if (!mounted) return;
      _showSnack(
        fileName == null
            ? 'Report sent to server'
            : 'Report sent to server: $fileName',
      );
    } catch (e) {
      if (!mounted) return;
      _showSnack('Could not send report: $e');
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  Future<void> _copyAll() async {
    await Clipboard.setData(ClipboardData(text: _log.exportText()));
    _showSnack('Logs copied to clipboard');
  }

  Future<void> _copyEntry(LogEntry entry) async {
    await Clipboard.setData(ClipboardData(text: entry.format()));
    _showSnack('Entry copied to clipboard');
  }

  void _clearLogs() {
    _log.clear();
    _showSnack('Logs cleared');
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  bool get _supportsUpload {
    if (!GetIt.instance.isRegistered<MediaServerClientFactory>()) return false;
    try {
      return GetIt.instance<MediaServerClientFactory>()
              .getActiveClient()
              .clientLogApi !=
          null;
    } catch (_) {
      return false;
    }
  }

  Future<void> _pickFilter() async {
    final selected = await showFocusRestoringModalBottomSheet<_FilterChoice>(
      context: context,
      builder: (ctx) => SafeArea(
        child: RadioGroup<LogCategory?>(
          groupValue: _filter,
          onChanged: (value) => Navigator.pop(ctx, _FilterChoice(value)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<LogCategory?>(
                title: const Text('All categories'),
                value: null,
              ),
              for (final category in LogCategory.values)
                RadioListTile<LogCategory?>(
                  title: Text(_categoryLabel(category)),
                  value: category,
                ),
            ],
          ),
        ),
      ),
    );
    if (selected != null && mounted) {
      setState(() => _filter = selected.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(
            context,
            const Text('Diagnostics & Logging'),
          ),
          body: AnimatedBuilder(
            animation: _log,
            builder: (context, _) => _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final enabled = _log.isEnabled;
    final count = _log.entryCount;
    final hasEntries = count > 0;

    final entries = _log.entries
        .where((e) => _filter == null || e.category == _filter)
        .toList()
        .reversed
        .toList();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Section(title: 'Logging'),
              SwitchPreferenceTile(
                preference: UserPreferences.diagnosticLoggingEnabled,
                title: 'Enable diagnostic logging',
                subtitle:
                    'Capture media, Seerr login, network and other '
                    'diagnostics so they can be sent to the server as a report.',
                icon: Icons.bug_report,
              ),
              _Section(
                title: enabled
                    ? 'Reports ($count entries captured)'
                    : 'Reports',
              ),
              _ActionTile(
                icon: Icons.cloud_upload,
                title: 'Send report to server',
                subtitle: _sendSubtitle(enabled),
                enabled:
                    enabled && hasEntries && _supportsUpload && !_uploading,
                trailing: _uploading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: _sendReport,
              ),
              _ActionTile(
                icon: Icons.copy_all,
                title: 'Copy all logs',
                subtitle: 'Copy the full report to the clipboard.',
                enabled: hasEntries,
                onTap: _copyAll,
              ),
              _ActionTile(
                icon: Icons.delete_outline,
                title: 'Clear captured logs',
                subtitle: 'Discard everything in the current buffer.',
                enabled: hasEntries,
                destructive: true,
                onTap: _clearLogs,
              ),
              _Section(
                title: _filter == null
                    ? 'Recent logs'
                    : 'Recent logs (${entries.length} of $count)',
              ),
              _ActionTile(
                icon: Icons.filter_list,
                title: 'Filter',
                subtitle: _filter == null
                    ? 'All categories'
                    : _categoryLabel(_filter!),
                enabled: enabled || hasEntries,
                trailing: const Icon(Icons.expand_more, size: 20),
                onTap: _pickFilter,
              ),
            ],
          ),
        ),
        if (entries.isEmpty)
          SliverToBoxAdapter(child: _buildEmptyState(context, enabled))
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _LogTile(
                entry: entries[index],
                onTap: () => _copyEntry(entries[index]),
              ),
              childCount: entries.length,
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  String _sendSubtitle(bool enabled) {
    if (!enabled) return 'Enable diagnostic logging first.';
    if (!_supportsUpload) {
      return 'The active server does not support report uploads.';
    }
    if (_log.entryCount == 0) return 'No entries captured yet.';
    return 'Upload the captured logs to the active server.';
  }

  Widget _buildEmptyState(BuildContext context, bool enabled) {
    final total = _log.entryCount;
    final filtered = _filter != null && total > 0;

    final IconData icon;
    final String message;
    if (filtered) {
      icon = Icons.filter_list_off;
      message =
          'No ${_categoryLabel(_filter!)} entries. $total captured in other '
          'categories. Tap Filter to change.';
    } else if (enabled) {
      icon = Icons.hourglass_empty;
      message = 'No log entries yet. Reproduce the issue, then send a report.';
    } else {
      icon = Icons.toggle_off_outlined;
      message =
          'Logging is off. Turn it on, reproduce the issue, then send '
          'a report to the server.';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColorScheme.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  static String _categoryLabel(LogCategory category) => switch (category) {
    LogCategory.general => 'General',
    LogCategory.media => 'Media',
    LogCategory.seerr => 'Seerr login',
    LogCategory.network => 'Network',
    LogCategory.auth => 'Authentication',
    LogCategory.playback => 'Playback',
    LogCategory.sync => 'Sync',
  };
}

class _FilterChoice {
  const _FilterChoice(this.value);
  final LogCategory? value;
}

class _Section extends StatelessWidget {
  const _Section({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColorScheme.accent,
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
    this.enabled = true,
    this.destructive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool enabled;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final accent = destructive
        ? AppColorScheme.statusRequested
        : AppColorScheme.accent;

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent && enabled) onTap();
        return KeyEventResult.handled;
      },
      child: TvFocusHighlight(
        builder: (context, focused) {
          final foreground = !enabled
              ? AppColorScheme.onSurface.withValues(alpha: 0.38)
              : focused
              ? AppColors.black.withValues(alpha: 0.87)
              : (destructive ? accent : AppColorScheme.onSurface);
          final iconColor = !enabled
              ? AppColorScheme.onSurface.withValues(alpha: 0.38)
              : focused
              ? AppColors.black.withValues(alpha: 0.7)
              : accent;

          return ListTile(
            enabled: enabled,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            leading: Icon(icon, color: iconColor),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: foreground,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: foreground.withValues(alpha: 0.7),
              ),
            ),
            trailing: trailing,
            onTap: enabled ? onTap : null,
          );
        },
      ),
    );
  }
}

class _LogTile extends StatelessWidget {
  const _LogTile({required this.entry, required this.onTap});

  final LogEntry entry;
  final VoidCallback onTap;

  Color _levelColor() => switch (entry.level) {
    LogLevel.error => AppColorScheme.statusRequested,
    LogLevel.warning => AppColorScheme.statusPending,
    LogLevel.info => AppColorScheme.statusAvailable,
    LogLevel.debug => AppColorScheme.onSurface.withValues(alpha: 0.6),
  };

  @override
  Widget build(BuildContext context) {
    final time = entry.time;
    final hh = time.hour.toString().padLeft(2, '0');
    final mm = time.minute.toString().padLeft(2, '0');
    final ss = time.second.toString().padLeft(2, '0');
    final levelColor = _levelColor();

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) onTap();
        return KeyEventResult.handled;
      },
      child: TvFocusHighlight(
        builder: (context, focused) {
          final textColor = focused
              ? AppColors.black.withValues(alpha: 0.87)
              : AppColorScheme.onSurface;
          return ListTile(
            dense: true,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
            leading: Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: levelColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            title: Text(
              '$hh:$mm:$ss  ${entry.level.label}  ${entry.category.label}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: focused
                    ? AppColors.black.withValues(alpha: 0.7)
                    : levelColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.message,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
                if (entry.error != null)
                  Text(
                    entry.error!,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      color: focused
                          ? AppColors.black.withValues(alpha: 0.7)
                          : AppColorScheme.statusRequested,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
