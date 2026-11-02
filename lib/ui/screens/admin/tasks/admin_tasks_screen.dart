import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../navigation/destinations.dart';
import '../providers/admin_user_providers.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../widgets/activity_log_ui.dart';
import '../widgets/admin_form_styles.dart';

/// A run time in the short units the activity page uses, e.g. "2h 5m".
String taskDurationText(Duration d, AppLocalizations l10n) {
  final seconds = l10n.adminDurationSecondsShort('${d.inSeconds.remainder(60)}');
  if (d.inHours > 0) {
    return '${l10n.adminActivityHoursShort(d.inHours)} '
        '${l10n.adminActivityMinutesShort(d.inMinutes.remainder(60))}';
  }
  if (d.inMinutes > 0) {
    return '${l10n.adminActivityMinutesShort(d.inMinutes)} $seconds';
  }
  return seconds;
}

/// The words added after the last run for a run that didn't complete, null
/// for a completed one.
String? taskResultSuffix(String status, AppLocalizations l10n) =>
    switch (status) {
      'Failed' => l10n.adminTaskResultFailed,
      'Cancelled' => l10n.adminTaskResultCancelled,
      'Aborted' => l10n.adminTaskResultAborted,
      _ => null,
    };

class AdminTasksScreen extends ConsumerStatefulWidget {
  const AdminTasksScreen({super.key});

  @override
  ConsumerState<AdminTasksScreen> createState() => _AdminTasksScreenState();
}

class _AdminTasksScreenState extends ConsumerState<AdminTasksScreen> {
  String? _categoryFilter;

  AdminTasksApi get _api =>
      GetIt.instance<MediaServerClient>().adminTasksApi;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tasksAsync = ref.watch(adminTasksProvider);

    return tasksAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminTasksLoadFailed(describeError(error, l10n))),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref.invalidate(adminTasksProvider),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
      data: (tasks) {
        final grouped = <String, List<TaskInfo>>{};
        for (final task in tasks) {
          final category = task.category;
          if (category == null) continue;
          grouped.putIfAbsent(category, () => []).add(task);
        }
        final categories = grouped.keys.toList()..sort();
        final visibleCategories = _categoryFilter == null
            ? categories
            : categories.where((category) => category == _categoryFilter).toList();

        if (categories.isEmpty) {
          return Center(child: Text(l10n.adminTasksEmpty));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: adminScreenHeader(
                context,
                title: l10n.adminDrawerScheduledTasks,
                icon: Icons.schedule,
              ),
            ),
            // Scrolls instead of wrapping: plugin categories can fill a phone screen.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 8,
                children: [
                  FilterChip(
                    label: Text(l10n.all),
                    selected: _categoryFilter == null,
                    onSelected: (_) => setState(() => _categoryFilter = null),
                  ),
                  ...categories.map(
                    (category) => FilterChip(
                      label: Text(category),
                      selected: _categoryFilter == category,
                      onSelected: (_) => setState(() {
                        _categoryFilter = _categoryFilter == category ? null : category;
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: visibleCategories.isEmpty
                  ? Center(child: Text(l10n.adminTasksNoFilterMatch))
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                      itemCount: visibleCategories.length,
                      itemBuilder: (context, index) {
                        final category = visibleCategories[index];
                        final categoryTasks = grouped[category]!;
                        return _CategorySection(
                          category: category,
                          tasks: categoryTasks,
                          onStart: _startTask,
                          onStop: _stopTask,
                          onTap: (task) =>
                              context.push(Destinations.adminTask(task.id)),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _startTask(String taskId) async {
    try {
      await _api.startTask(taskId);
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.adminTaskStartFailed(describeError(e, l10n)))));
      }
    }
  }

  Future<void> _stopTask(String taskId) async {
    try {
      await _api.stopTask(taskId);
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.adminTaskStopFailed(describeError(e, l10n)))));
      }
    }
  }
}

class _CategorySection extends StatelessWidget {
  final String category;
  final List<TaskInfo> tasks;
  final Future<void> Function(String taskId) onStart;
  final Future<void> Function(String taskId) onStop;
  final void Function(TaskInfo task) onTap;

  const _CategorySection({
    required this.category,
    required this.tasks,
    required this.onStart,
    required this.onStop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return adminSection(
      context,
      title: category,
      icon: Icons.folder_outlined,
      children: [
        for (final task in tasks)
          _TaskRow(
            task: task,
            onStart: () => onStart(task.id),
            onStop: () => onStop(task.id),
            onTap: () => onTap(task),
          ),
      ],
    );
  }
}

class _TaskRow extends StatelessWidget {
  final TaskInfo task;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onTap;

  const _TaskRow({
    required this.task,
    required this.onStart,
    required this.onStop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isRunning = task.state == 'Running';
    final isCancelling = task.state == 'Cancelling';
    final result = task.lastExecutionResult;

    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 36,
        height: 36,
        child: Center(child: _buildLeading(theme)),
      ),
      title: Text(task.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRunning || isCancelling) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: task.currentProgressPercentage != null
                        ? task.currentProgressPercentage! / 100
                        : null,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  isCancelling
                      ? l10n.adminTaskCancelling
                      : task.currentProgressPercentage != null
                          ? '${task.currentProgressPercentage!.toStringAsFixed(0)}%'
                          : l10n.adminTaskRunning,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ] else if (result != null) ...[
            const SizedBox(height: 2),
            Text.rich(
              TextSpan(
                text: l10n.adminTaskLastRan(
                  activityTimeAgo(result.endTime, l10n, compact: false),
                  taskDurationText(
                    result.endTime.difference(result.startTime),
                    l10n,
                  ),
                ),
                children: [
                  if (taskResultSuffix(result.status, l10n) case final suffix?)
                    TextSpan(
                      text: ' ($suffix)',
                      style: TextStyle(color: _resultColor(result.status, theme)),
                    ),
                ],
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ] else
            Text(
              l10n.adminTaskNeverRun,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
      trailing: isRunning || isCancelling
          ? IconButton(
              icon: const Icon(Icons.stop),
              tooltip: l10n.adminTaskStop,
              onPressed: isCancelling ? null : onStop,
            )
          : IconButton(
              icon: const Icon(Icons.play_arrow),
              tooltip: l10n.adminTaskRun,
              onPressed: onStart,
            ),
    );
  }

  Widget _buildLeading(ThemeData theme) {
    if (task.state == 'Running') {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    if (task.state == 'Cancelling') {
      return Icon(Icons.stop_circle_outlined,
          color: AppColorScheme.recordingScheduled, size: 22);
    }
    final result = task.lastExecutionResult;
    if (result == null) {
      return Icon(Icons.schedule,
          color: theme.colorScheme.onSurfaceVariant, size: 22);
    }
    return Icon(
      _resultIcon(result.status),
      color: _resultColor(result.status, theme),
      size: 22,
    );
  }

  IconData _resultIcon(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle;
      case 'Failed':
        return Icons.error;
      case 'Cancelled':
      case 'Aborted':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  Color _resultColor(String status, ThemeData theme) {
    switch (status) {
      case 'Completed':
        return AppColorScheme.statusAvailable;
      case 'Failed':
        return theme.colorScheme.error;
      case 'Cancelled':
      case 'Aborted':
        return AppColorScheme.recordingScheduled;
      default:
        return theme.colorScheme.onSurfaceVariant;
    }
  }
}
