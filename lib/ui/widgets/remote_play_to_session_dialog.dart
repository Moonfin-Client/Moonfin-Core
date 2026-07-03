import 'dart:async';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/cast/cast_service.dart';
import '../../data/services/cast/cast_target.dart';
import '../../l10n/app_localizations.dart';
import 'overlay_sheet.dart';

Future<void> showRemotePlayToSessionDialog(
  BuildContext context, {
  required AggregatedItem item,
  List<AggregatedItem>? queueItems,
  int? startPositionTicks,
  String? mediaSourceId,
  int? audioStreamIndex,
  int? subtitleStreamIndex,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  final castService = GetIt.instance<CastService>();

  final picked = await showFocusRestoringModalBottomSheet<CastTarget>(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (ctx) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.55,
      minChildSize: 0.25,
      maxChildSize: 0.85,
      builder: (_, scrollController) => _CastTargetSheet(
        stream: castService.discoverTargetsStreamed(item),
        scrollController: scrollController,
      ),
    ),
  );

  if (picked == null || !context.mounted) return;

  try {
    await castService.playToTarget(
      picked,
      item: item,
      queueItems: queueItems,
      startPositionTicks: startPositionTicks,
      mediaSourceId: mediaSourceId,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
    if (!context.mounted) return;
    if (picked.kind != CastTargetKind.airPlay) {
      messenger.showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).castingStarted)),
      );
    }
  } catch (e) {
    if (!context.mounted) return;
    messenger.showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).castingFailed(e.toString()))),
    );
  }
}

class _CastTargetSheet extends StatefulWidget {
  final Stream<CastTarget> stream;
  final ScrollController scrollController;

  const _CastTargetSheet({
    required this.stream,
    required this.scrollController,
  });

  @override
  State<_CastTargetSheet> createState() => _CastTargetSheetState();
}

class _CastTargetSheetState extends State<_CastTargetSheet> {
  final _targets = <CastTarget>[];
  StreamSubscription<CastTarget>? _sub;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _sub = widget.stream.listen(
      (target) {
        if (mounted) setState(() => _targets.add(target));
      },
      onDone: () {
        if (mounted) setState(() => _done = true);
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final loading = !_done;

    final Widget body;
    if (loading && _targets.isEmpty) {
      body = _searchingState(theme, l10n);
    } else if (_done && _targets.isEmpty) {
      body = _emptyState(theme, l10n);
    } else {
      final sorted = [..._targets]
        ..sort((a, b) => _kindOrder(a.kind).compareTo(_kindOrder(b.kind)));
      body = ListView.builder(
        controller: widget.scrollController,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        itemCount: sorted.length + (loading ? 1 : 0),
        itemBuilder: (_, index) {
          if (index >= sorted.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }
          return _deviceCard(theme, sorted[index]);
        },
      );
    }

    return SafeArea(
      child: Material(
        color: theme.bottomSheetTheme.backgroundColor ?? theme.colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Row(
                children: [
                  Icon(Icons.cast_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.castRemotePlayback,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (loading)
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }

  Widget _searchingState(ThemeData theme, AppLocalizations l10n) {
    return ListView(
      controller: widget.scrollController,
      children: [
        const SizedBox(height: 48),
        const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 16),
        Center(
          child: Text(
            l10n.castRemotePlayback,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _emptyState(ThemeData theme, AppLocalizations l10n) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb;
    final message = isIOS ? l10n.noRemoteDevicesIos : l10n.noRemoteDevices;
    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(32),
      children: [
        const SizedBox(height: 24),
        Icon(
          Icons.devices_other_rounded,
          size: 48,
          color: theme.colorScheme.outline,
        ),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _deviceCard(ThemeData theme, CastTarget target) {
    final tint = theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: AppRadius.circular(14),
        child: InkWell(
          borderRadius: AppRadius.circular(14),
          onTap: () => Navigator.of(context).pop(target),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(14),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: tint.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _iconForTargetKind(target.kind),
                    color: tint,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        target.title,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (target.subtitle.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          target.subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int _kindOrder(CastTargetKind kind) {
  return switch (kind) {
    CastTargetKind.jellyfinSession => 0,
    CastTargetKind.googleCast => 1,
    CastTargetKind.airPlay => 2,
    CastTargetKind.dlna => 3,
  };
}

IconData _iconForTargetKind(CastTargetKind kind) {
  return switch (kind) {
    CastTargetKind.jellyfinSession => Icons.cast_rounded,
    CastTargetKind.googleCast => Icons.cast_connected_rounded,
    CastTargetKind.airPlay => Icons.airplay_rounded,
    CastTargetKind.dlna => Icons.router_rounded,
  };
}
