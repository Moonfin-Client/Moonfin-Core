import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/offline/connectivity_aware_media_server_client.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../data/services/unified_catalog_query.dart';
import '../../data/services/unified_catalog_service.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/language_codes.dart';
import '../../util/language_matching.dart';
import '../mixins/focus_state_mixin.dart';
import '../screens/detail/item_detail_screen.dart'
    show mediaStreamsForItem, technicalDetailsFor;
import 'choice_dialog_shell.dart';
import 'focus/request_initial_focus.dart';
import 'media_badge.dart';
import 'overlay_sheet.dart';

final _log = Logger();

/// How many servers hold the title; a server with two copies counts once.
int unifiedServerCount(Map<String, dynamic> rawData) =>
    {for (final copy in unifiedCopiesOf(rawData)) copy.serverId}.length;

/// The server-count badge for [item]'s card, or null when only one server
/// has the title.
Widget? unifiedServerCountBadgeFor(AggregatedItem item) {
  final count = unifiedServerCount(item.rawData);
  return count < 2 ? null : UnifiedServerCountBadge(count: count);
}

/// Opens [item] directly when it has a single copy. With several copies it
/// shows the server picker, then calls [open] with the picked copy, or
/// [onDismissed] if the picker is closed without a pick. Neither callback
/// runs if [context] has unmounted in the meantime.
Future<void> openOnPickedServer(
  BuildContext context,
  AggregatedItem item, {
  required void Function(String itemId, String serverId) open,
  VoidCallback? onDismissed,
}) async {
  final copies = unifiedCopiesOf(item.rawData);
  if (copies.length < 2) {
    open(item.id, item.serverId);
    return;
  }
  await pickUnifiedServerThenOpen(
    context,
    title: item.name,
    copies: copies,
    onPicked: (picked) => open(picked.itemId, picked.serverId),
    onDismissed: onDismissed,
  );
}

/// Shows the server picker for [title]. Returns the picked copy, or null if
/// the picker is dismissed.
Future<UnifiedCopy?> showUnifiedServerPicker(
  BuildContext context, {
  required String title,
  required List<UnifiedCopy> copies,
}) => showFocusRestoringDialog<UnifiedCopy>(
  context: context,
  useRootNavigator: false,
  builder: (_) => _ServerPickerDialog(title: title, copies: copies),
);

/// Shows the server picker, then calls [onPicked] with the picked copy, or
/// [onDismissed] if nothing was picked.
Future<void> pickUnifiedServerThenOpen(
  BuildContext context, {
  required String title,
  required List<UnifiedCopy> copies,
  required void Function(UnifiedCopy picked) onPicked,
  VoidCallback? onDismissed,
}) async {
  final picked = await showUnifiedServerPicker(
    context,
    title: title,
    copies: copies,
  );
  if (!context.mounted) return;
  if (picked == null) {
    onDismissed?.call();
    return;
  }
  onPicked(picked);
}

class UnifiedServerCountBadge extends StatelessWidget {
  final int count;

  const UnifiedServerCountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: AppLocalizations.of(context).unifiedServerCountLabel(count),
      child: ExcludeSemantics(
        child: MediaLabelBadge(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.dns),
              const SizedBox(width: 3),
              Text('$count'),
            ],
          ),
        ),
      ),
    );
  }
}

enum _CopyLoadState {
  loading,
  loaded,

  /// The request failed or timed out. The copy stays selectable because the
  /// server may be reachable again by the time it is opened.
  failed,

  /// The server replied 404: it no longer has this copy.
  gone,
}

/// One line describing a copy. Separate lines rather than one string, so a
/// narrow screen doesn't truncate the file size.
class _DetailLine {
  final IconData? icon;
  final String text;

  /// Screen-reader text used instead of [text] when the icon alone carries
  /// part of the meaning.
  final String? semanticsLabel;

  const _DetailLine(this.text, {this.icon, this.semanticsLabel});
}

/// Load state plus the fetched item; the text is built in build() so it
/// follows the current locale.
class _CopyDetails {
  final _CopyLoadState status;

  final AggregatedItem? item;

  const _CopyDetails(this.status, {this.item});
}

/// Fetches every copy's details from its server when the dialog opens, so
/// copies of different quality can be told apart. A copy its server no longer
/// has can't be picked.
class _ServerPickerDialog extends StatefulWidget {
  final String title;
  final List<UnifiedCopy> copies;

  const _ServerPickerDialog({required this.title, required this.copies});

  @override
  State<_ServerPickerDialog> createState() => _ServerPickerDialogState();
}

class _ServerPickerDialogState extends State<_ServerPickerDialog> {
  static const _detailsTimeout = Duration(seconds: 8);
  static const _maxLanguages = 4;

  final Map<String, _CopyDetails> _details = {};

  static String? _copyName(UnifiedCopy copy) {
    final name = copy.name?.trim() ?? '';
    return name.isEmpty ? null : name;
  }

  @override
  void initState() {
    super.initState();
    // Offline nothing can be fetched: mark every copy failed, never gone.
    final offline = shouldUseOfflineCatalog();
    for (final copy in widget.copies) {
      if (offline) {
        _details[copy.key] = const _CopyDetails(_CopyLoadState.failed);
        continue;
      }
      _details[copy.key] = const _CopyDetails(_CopyLoadState.loading);
      // Fetch even from a server that was unreachable last time; it may be
      // back online.
      unawaited(_loadDetails(copy));
    }
  }

  Future<void> _loadDetails(UnifiedCopy copy) async {
    final getIt = GetIt.instance;
    _CopyDetails details;
    try {
      final client = getIt<MediaServerClientFactory>().getClientIfExists(
        copy.serverId,
      );
      if (client == null) {
        details = const _CopyDetails(_CopyLoadState.failed);
      } else {
        // Use the online client: the offline-aware one returns 404 for items
        // that aren't downloaded, which would wrongly mark the copy as gone.
        final raw = await onlineClientOf(client).itemsApi
            .getItem(copy.itemId, fields: 'MediaSources,MediaStreams')
            .timeout(_detailsTimeout);
        details = _CopyDetails(
          _CopyLoadState.loaded,
          item: AggregatedItem(
            id: copy.itemId,
            serverId: copy.serverId,
            rawData: raw,
          ),
        );
      }
    } on DioException catch (e) {
      details = _CopyDetails(
        e.response?.statusCode == 404
            ? _CopyLoadState.gone
            : _CopyLoadState.failed,
      );
    } catch (_) {
      details = const _CopyDetails(_CopyLoadState.failed);
    }
    if (!mounted) return;
    setState(() => _details[copy.key] = details);
    if (details.status == _CopyLoadState.gone) {
      unawaited(_removeFromCatalog(copy));
    }
  }

  /// Removes [copy] from the unified catalog right away instead of waiting
  /// for the server's next sync.
  Future<void> _removeFromCatalog(UnifiedCopy copy) async {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<UnifiedCatalogService>()) return;
    try {
      await getIt<UnifiedCatalogService>().removeCopy(
        copy.serverId,
        copy.itemId,
      );
    } catch (e) {
      _log.w('UnifiedServerPicker: deleted copy not removed: $e');
    }
  }

  /// The played percentage of the fetched [item], computed from the resume
  /// position when the server sends no percentage.
  static double? _fetchedPlayedPercentage(AggregatedItem item) {
    if (item.playedPercentage case final percent?) return percent;
    final position = item.playbackPositionTicks ?? 0;
    final runtime = (item.rawData['RunTimeTicks'] as num?)?.toInt() ?? 0;
    if (position <= 0 || runtime <= 0) return null;
    return position / runtime * 100;
  }

  static List<String> _languages(
    List<Map<String, dynamic>> streams,
    String type,
  ) {
    final names = <String>{};
    for (final stream in streams) {
      if (stream['Type'] != type) continue;
      final code = normalizeLanguage(stream['Language']?.toString());
      if (code.isEmpty || code == 'und') continue;
      names.add(kIso6392Languages[toIso3Language(code)] ?? code.toUpperCase());
    }
    return names.take(_maxLanguages).toList();
  }

  static List<_DetailLine> _detailLinesForItem(
    AggregatedItem item,
    AppLocalizations l10n,
  ) {
    final raw = item.rawData;
    if (item.type == 'Series') {
      final seasons = (raw['ChildCount'] as num?)?.toInt();
      final episodes = (raw['RecursiveItemCount'] as num?)?.toInt();
      final counts = [
        if (seasons != null) l10n.spotlightSeasonsCount(seasons),
        if (episodes != null) l10n.spotlightEpisodesCount(episodes),
      ];
      return [if (counts.isNotEmpty) _DetailLine(counts.join(' · '))];
    }
    final source = item.mediaSources.firstOrNull;
    final technical = technicalDetailsFor(item, source);
    final streams = mediaStreamsForItem(item, source);
    final audio = _languages(streams, 'Audio').join(', ');
    final subtitles = _languages(streams, 'Subtitle').join(', ');
    return [
      if (technical.badges.isNotEmpty)
        _DetailLine(technical.badges.join(' · '), icon: Icons.movie_outlined),
      if (audio.isNotEmpty) _DetailLine(audio, icon: Icons.volume_up_outlined),
      if (subtitles.isNotEmpty)
        _DetailLine(
          subtitles,
          icon: Icons.subtitles_outlined,
          semanticsLabel: l10n.unifiedCopySubtitles(subtitles),
        ),
      if (technical.formattedSize case final size?)
        _DetailLine(size, icon: Icons.sd_storage_outlined),
    ];
  }

  /// A fresh reply from the server overrides the reachability recorded in
  /// the catalog.
  bool _isAvailable(UnifiedCopy copy, _CopyDetails details) =>
      switch (details.status) {
        _CopyLoadState.gone => false,
        _CopyLoadState.loaded => true,
        _ => copy.reachable,
      };

  String? _statusLabelFor(
    UnifiedCopy copy,
    _CopyDetails details,
    AppLocalizations l10n,
  ) {
    if (!_isAvailable(copy, details)) return l10n.unavailable;
    final live = details.item;
    if (live?.isPlayed ?? copy.played) return l10n.watched;
    final percent = live == null
        ? copy.playedPercentage
        : _fetchedPlayedPercentage(live);
    if (percent != null && percent > 0 && percent < 100) {
      return NumberFormat.percentPattern(l10n.localeName)
          .format(percent.round().clamp(1, 99) / 100);
    }
    return null;
  }

  List<_DetailLine> _detailLinesFor(
    _CopyDetails details,
    AppLocalizations l10n,
  ) => switch (details.status) {
    _CopyLoadState.loading => [_DetailLine(l10n.unifiedCopyLoadingDetails)],
    _CopyLoadState.failed => [
      _DetailLine(l10n.unifiedCopyDetailsUnavailable),
    ],
    _CopyLoadState.loaded => _detailLinesForItem(details.item!, l10n),
    _CopyLoadState.gone => const [],
  };

  /// D-pad navigation needs one row focused initially.
  Widget _withInitialFocus(int index, Widget tile) =>
      index == 0 ? RequestInitialFocus(child: tile) : tile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final copies = widget.copies;
    final servers = {for (final copy in copies) copy.serverId};
    // Show copy names when one server has several copies (the name is all
    // that distinguishes them) or when servers name the title differently.
    final showNames =
        servers.length < copies.length ||
        {for (final copy in copies) ?_copyName(copy)}.length > 1;

    return ChoiceDialogShell(
      // When every copy is on the same server, the choice is between
      // versions, not servers.
      title: servers.length > 1 ? l10n.selectServer : l10n.selectVersion,
      subtitle: widget.title,
      maxWidth: 520,
      maxHeightFactor: 0.8,
      // Opaque, so the rows' small text stays readable over the page behind.
      surfaceOpacity: 1,
      children: [
        for (final (index, copy) in copies.indexed)
          _withInitialFocus(
            index,
            _buildTile(copy, l10n, showNames: showNames),
          ),
      ],
    );
  }

  Widget _buildTile(
    UnifiedCopy copy,
    AppLocalizations l10n, {
    required bool showNames,
  }) {
    final details =
        _details[copy.key] ?? const _CopyDetails(_CopyLoadState.loading);
    return _ServerCopyTile(
      key: ValueKey(copy.key),
      serverName: copy.serverName,
      copyName: showNames ? _copyName(copy) : null,
      statusLabel: _statusLabelFor(copy, details, l10n),
      details: _detailLinesFor(details, l10n),
      detailsArePlaceholder: details.status != _CopyLoadState.loaded,
      available: _isAvailable(copy, details),
      // A copy the server no longer has would only open an error page.
      onTap: details.status == _CopyLoadState.gone
          ? null
          : () => Navigator.of(context).pop(copy),
    );
  }
}

class _ServerCopyTile extends StatefulWidget {
  final String serverName;

  /// The server's name for its copy; null when the names don't help tell
  /// rows apart.
  final String? copyName;

  /// "Watched", a played percentage, or "Unavailable"; null when none
  /// applies.
  final String? statusLabel;

  /// Shown in full, never truncated: the dialog scrolls instead.
  final List<_DetailLine> details;

  /// True when [details] holds a placeholder (loading or failed) rather than
  /// fetched details.
  final bool detailsArePlaceholder;
  final bool available;

  /// Null for a copy that can't be opened; the row stays focusable.
  final VoidCallback? onTap;

  const _ServerCopyTile({
    super.key,
    required this.serverName,
    required this.copyName,
    required this.statusLabel,
    required this.details,
    required this.detailsArePlaceholder,
    required this.available,
    required this.onTap,
  });

  @override
  State<_ServerCopyTile> createState() => _ServerCopyTileState();
}

class _ServerCopyTileState extends State<_ServerCopyTile>
    with FocusStateMixin {
  static const _detailsFontSize = 12.0;

  Widget _buildDetailLine(_DetailLine line, Color base) {
    final color = base.withValues(
      alpha: widget.detailsArePlaceholder ? 0.5 : 0.7,
    );
    final text = Text(
      line.text,
      semanticsLabel: line.semanticsLabel,
      style: TextStyle(
        fontSize: _detailsFontSize,
        height: 1.4,
        fontStyle: widget.detailsArePlaceholder
            ? FontStyle.italic
            : FontStyle.normal,
        color: color,
      ),
    );
    final icon = line.icon;
    if (icon == null) return text;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 6),
          child: Icon(icon, size: 13, color: color),
        ),
        Expanded(child: text),
      ],
    );
  }

  /// Server name, optional copy name, then the detail lines.
  Widget _buildTextColumn({
    required Color nameColor,
    required Color base,
    required double detailsLineHeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.serverName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: nameColor,
          ),
        ),
        if (widget.copyName case final copyName?)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              copyName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: base.withValues(alpha: 0.85),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: detailsLineHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final line in widget.details)
                  _buildDetailLine(line, base),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    final showActive = focused || hovered;
    final onSurface = AppColorScheme.onSurface;
    final base = widget.available
        ? onSurface
        : onSurface.withValues(alpha: 0.5);
    final color = showActive && enabled ? focusColor : base;
    // Reserve one line's height so the row doesn't grow when details arrive.
    final detailsLineHeight =
        MediaQuery.textScalerOf(context).scale(_detailsFontSize) * 1.4;

    return Semantics(
      button: true,
      enabled: enabled,
      child: MouseRegion(
        cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: Focus(
          onFocusChange: (f) {
            setFocused(f);
            if (f) {
              Scrollable.ensureVisible(
                context,
                alignment: 0.5,
                duration: const Duration(milliseconds: 120),
              );
            }
          },
          onKeyEvent: (_, event) {
            if (isActivateKey(event)) {
              widget.onTap?.call();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              color: showActive
                  ? focusColor.withValues(alpha: enabled ? 0.12 : 0.06)
                  : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Icon(
                        widget.available ? Icons.dns : Icons.cloud_off,
                        size: 18,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTextColumn(
                        nameColor: color,
                        base: base,
                        detailsLineHeight: detailsLineHeight,
                      ),
                    ),
                    // Outside the text column so a long server name can't
                    // push it off the row, and capped at 40% of the row so a
                    // large text scale can't squeeze the name out either.
                    if (widget.statusLabel case final statusLabel?) ...[
                      const SizedBox(width: 12),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.4,
                        ),
                        child: Text(
                          statusLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: color.withValues(alpha: 0.85),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
