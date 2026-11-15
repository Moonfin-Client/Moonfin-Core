import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../auth/store/authentication_store.dart';
import '../../data/models/aggregated_item.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../data/utils/merged_copies.dart';
import '../../l10n/app_localizations.dart';
import '../../util/media_source_summary.dart';
import '../theme/app_theme_controller.dart';
import 'media_badge.dart';
import 'track_selector_dialog.dart';

const _detailsTimeout = Duration(seconds: 4);

// Set while a picker loads its details, so a second press can't stack another.
var _picking = false;

/// The name [serverId] was signed in under, or the id when it's unknown.
String mergedServerName(String serverId) =>
    GetIt.instance<AuthenticationStore>()
        .getServers()
        .where((server) => server.id == serverId)
        .firstOrNull
        ?.name ??
    serverId;

/// Opens [item], first asking which copy when several servers hold it. [open]
/// gets the picked copy, or [item] itself when it has no others.
Future<void> openPickedCopy(
  BuildContext context,
  AggregatedItem item,
  void Function(AggregatedItem copy) open,
) async {
  final copies = copiesOf(item);
  if (copies.length < 2) {
    open(item);
    return;
  }
  if (_picking) return;
  _picking = true;
  try {
    final details = await Future.wait(copies.map(_detailsOf));
    if (!context.mounted) return;
    final l10n = AppLocalizations.of(context);
    final picked = await TrackSelectorDialog.show(
      context,
      title: l10n.selectServer,
      options: [
        for (final (index, copy) in copies.indexed)
          _optionFor(copy, details[index], l10n),
      ],
    );
    if (picked == null || !context.mounted) return;
    open(copies[picked]);
  } finally {
    _picking = false;
  }
}

Future<Map<String, dynamic>?> _detailsOf(AggregatedItem copy) async {
  final client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
    copy.serverId,
  );
  if (client == null) return null;
  try {
    return await client.itemsApi
        .getItem(copy.id, fields: 'MediaSources')
        .timeout(_detailsTimeout);
  } catch (_) {
    return null;
  }
}

TrackOption _optionFor(
  AggregatedItem copy,
  Map<String, dynamic>? details,
  AppLocalizations l10n,
) {
  final shown = details == null
      ? copy
      : AggregatedItem(id: copy.id, serverId: copy.serverId, rawData: details);
  final source = (details?['MediaSources'] as List?)
      ?.whereType<Map>()
      .firstOrNull
      ?.cast<String, dynamic>();
  final streams = source == null ? const [] : mediaSourceStreams(source);
  String? titleOf(String type) =>
      streams
              .where((stream) => stream['Type'] == type)
              .firstOrNull?['DisplayTitle']
          as String?;
  final size = source?['Size'] as num?;
  final summary = [
    ?titleOf('Video'),
    ?titleOf('Audio'),
    if (size != null) ?formatMediaSourceSize(size.toInt()),
  ];
  final percent = shown.playedPercentage;
  return TrackOption(
    label: mergedServerName(copy.serverId),
    subtitle: summary.isEmpty ? null : summary.join(' · '),
    badges: [
      if (details == null)
        l10n.unavailable
      else if (shown.isPlayed)
        l10n.watched
      else if (percent != null && percent > 0)
        l10n.percentCompleted(percent.round()),
    ],
  );
}

/// The badge on a card whose title several servers hold, saying how many.
List<Widget> mergedServerCountOverlays(
  BuildContext context,
  AggregatedItem item,
) {
  final count = serverCountOf(item);
  if (count < 2) return const [];
  return [
    Positioned(
      left: 6,
      bottom: 8,
      child: Semantics(
        label: AppLocalizations.of(context).mergedServerCount(count),
        excludeSemantics: true,
        child: _ServerCountBadge(count: count),
      ),
    ),
  ];
}

class _ServerCountBadge extends StatelessWidget {
  final int count;

  const _ServerCountBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    // The colors come from the active theme, so a theme change has to redraw it.
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    const height = 22.0;
    final fg = AppColorScheme.onBadge;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColorScheme.scrim.withValues(alpha: 0.75),
        borderRadius: AppRadius.circular(height / 2),
        border: Border.all(color: fg, width: 1.5),
        boxShadow: kMediaBadgeShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          Icon(Icons.dns_rounded, size: 12, color: fg),
          Text(
            '$count',
            style: TextStyle(
              color: fg,
              fontSize: 11.5,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
