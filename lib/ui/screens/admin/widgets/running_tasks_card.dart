import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../providers/admin_user_providers.dart';
import 'admin_form_styles.dart';

/// Live view of currently running scheduled tasks with progress bars. Renders
/// nothing when no task is running. Polls while mounted so progress stays fresh.
class RunningTasksCard extends ConsumerStatefulWidget {
  const RunningTasksCard({super.key});

  @override
  ConsumerState<RunningTasksCard> createState() => _RunningTasksCardState();
}

class _RunningTasksCardState extends ConsumerState<RunningTasksCard> {
  Timer? _timer;

  AdminTasksApi get _api => GetIt.instance<MediaServerClient>().adminTasksApi;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      ref.invalidate(adminTasksProvider);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _stop(String id) async {
    final l10n = AppLocalizations.of(context);
    try {
      await _api.stopTask(id);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminTaskStopFailed(describeError(e, l10n)))),
        );
      }
    }
    if (mounted) {
      ref.invalidate(adminTasksProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tasks =
        ref.watch(adminTasksProvider).valueOrNull ?? const <TaskInfo>[];
    final running = tasks
        .where((t) => t.state == 'Running' || t.state == 'Cancelling')
        .toList();
    if (running.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        adminSectionLabel(context, l10n.adminRunningTasks, icon: Icons.autorenew),
        adminGlassGroup(
          context,
          children: [
            for (final task in running)
              _RunningTaskRow(task: task, onStop: () => _stop(task.id)),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _RunningTaskRow extends StatelessWidget {
  final TaskInfo task;
  final VoidCallback onStop;
  const _RunningTaskRow({required this.task, required this.onStop});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isCancelling = task.state == 'Cancelling';
    final pct = task.currentProgressPercentage;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          value: pct != null && !isCancelling ? pct / 100 : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isCancelling
                          ? l10n.adminTaskCancelling
                          : pct != null
                              ? '${pct.toStringAsFixed(0)}%'
                              : '',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            tooltip: l10n.adminTaskStop,
            color: theme.colorScheme.error,
            onPressed: isCancelling ? null : onStop,
          ),
        ],
      ),
    );
  }
}
