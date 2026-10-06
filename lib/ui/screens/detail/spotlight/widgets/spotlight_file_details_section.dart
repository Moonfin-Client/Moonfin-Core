import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/detail_playback_info.dart';
import '../../../../../util/detail_track_highlight.dart';
import '../../../../../util/direct_play_reasons_formatter.dart';
import '../../../../../util/media_source_summary.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';

/// Modal section content displaying file information, video/audio/subtitle
/// stream details with expandable track lists, and direct play capability.
class SpotlightFileDetailsSection extends StatefulWidget {
  final AggregatedItem item;
  final Map<String, dynamic> mediaSource;
  final ItemDetailViewModel vm;
  final UserPreferences prefs;
  final FocusNode? firstFocusNode;

  const SpotlightFileDetailsSection({
    super.key,
    required this.item,
    required this.mediaSource,
    required this.vm,
    required this.prefs,
    this.firstFocusNode,
  });

  @override
  State<SpotlightFileDetailsSection> createState() =>
      _SpotlightFileDetailsSectionState();
}

class _SpotlightFileDetailsSectionState
    extends State<SpotlightFileDetailsSection> {
  bool _audioExpanded = false;
  bool _subtitlesExpanded = false;
  bool _loadingPlaybackInfo = false;
  bool _playbackInfoFailed = false;
  PlaybackInfoResult? _playbackInfo;

  final FocusNode _audioShowAllFocusNode = FocusNode(
    debugLabel: 'SpotlightFileDetailsAudioShowAll',
  );
  final FocusNode _subtitleShowAllFocusNode = FocusNode(
    debugLabel: 'SpotlightFileDetailsSubtitleShowAll',
  );
  final FocusNode _directPlayRetryFocusNode = FocusNode(
    debugLabel: 'SpotlightFileDetailsRetry',
  );

  @override
  void initState() {
    super.initState();
    _loadPlaybackInfo();
  }

  @override
  void dispose() {
    _audioShowAllFocusNode.dispose();
    _subtitleShowAllFocusNode.dispose();
    _directPlayRetryFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadPlaybackInfo() async {
    if (_loadingPlaybackInfo) return;
    setState(() {
      _loadingPlaybackInfo = true;
      _playbackInfoFailed = false;
    });

    try {
      final rawStreams = mediaSourceStreams(widget.mediaSource);
      final audioStreams =
          rawStreams.where((s) => s['Type'] == 'Audio').toList();
      final subtitleStreams =
          rawStreams.where((s) => s['Type'] == 'Subtitle').toList();

      final manager =
          GetIt.instance.isRegistered<PlaybackManager>()
              ? GetIt.instance<PlaybackManager>()
              : null;
      final currentQueueItem = manager?.queueService.currentItem;
      final isPlayingThisItem =
          currentQueueItem is AggregatedItem &&
          currentQueueItem.id == widget.item.id;

      final effectiveAudio = highlightedAudioIndex(
        audioStreams: audioStreams,
        seriesId: widget.item.seriesId,
        selectedIndex: widget.vm.selectedAudioIndex,
        activePlaybackIndex:
            isPlayingThisItem ? manager?.audioStreamIndex : null,
      );
      final effectiveSubtitle = highlightedSubtitleIndex(
        subtitleStreams: subtitleStreams,
        audioStreams: audioStreams,
        seriesId: widget.item.seriesId,
        selectedIndex: widget.vm.selectedSubtitleIndex,
        activePlaybackIndex:
            isPlayingThisItem ? manager?.subtitleStreamIndex : null,
        activeAudioIndex: effectiveAudio,
      );

      final parsed = await fetchDetailPlaybackInfo(
        itemId: widget.item.id,
        mediaSourceId: widget.mediaSource['Id']?.toString(),
        audioStreamIndex: widget.vm.selectedAudioIndex ?? effectiveAudio,
        subtitleStreamIndex:
            widget.vm.selectedSubtitleIndex ?? effectiveSubtitle,
      );
      if (mounted) {
        setState(() {
          _loadingPlaybackInfo = false;
          _playbackInfo = parsed;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _loadingPlaybackInfo = false;
          _playbackInfo = null;
          _playbackInfoFailed = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final textTheme = theme.textTheme;

    // File name and Size
    final formattedSize =
        formatMediaSourceSize(widget.mediaSource['Size'] as int? ?? 0) ??
        l10n.unknown;

    final String path = widget.mediaSource['Path'] as String? ?? '';
    final String rawFileName = path.split('/').last.split('\\').last;
    final String fileName = rawFileName.isNotEmpty
        ? rawFileName
        : (widget.mediaSource['Name'] as String? ?? widget.item.name);
    final String container =
        widget.mediaSource['Container']?.toString().toUpperCase() ??
        l10n.unknown;
    final DateTime? addedOn = widget.item.dateCreated?.toLocal();
    final String? addedLabel = addedOn == null
        ? null
        : DateFormat.yMMMd(
            Localizations.localeOf(context).toString(),
          ).format(addedOn);

    // Parse streams
    final rawStreams = mediaSourceStreams(widget.mediaSource);

    final videoStreams = rawStreams.where((s) => s['Type'] == 'Video').toList();
    final audioStreams = rawStreams.where((s) => s['Type'] == 'Audio').toList();
    final subtitleStreams =
        rawStreams.where((s) => s['Type'] == 'Subtitle').toList();

    final videoDetails = videoStreams.isEmpty
        ? const <String>[]
        : videoStreamSummary(videoStreams.first, unknownCodec: l10n.unknown);

    final manager =
        GetIt.instance.isRegistered<PlaybackManager>()
            ? GetIt.instance<PlaybackManager>()
            : null;
    final currentQueueItem = manager?.queueService.currentItem;
    final isPlayingThisItem =
        currentQueueItem is AggregatedItem &&
        currentQueueItem.id == widget.item.id;

    final activeAudioIndex = highlightedAudioIndex(
      audioStreams: audioStreams,
      seriesId: widget.item.seriesId,
      selectedIndex: widget.vm.selectedAudioIndex,
      activePlaybackIndex:
          isPlayingThisItem ? manager?.audioStreamIndex : null,
    );
    final activeSubtitleIndex = highlightedSubtitleIndex(
      subtitleStreams: subtitleStreams,
      audioStreams: audioStreams,
      seriesId: widget.item.seriesId,
      selectedIndex: widget.vm.selectedSubtitleIndex,
      activePlaybackIndex:
          isPlayingThisItem ? manager?.subtitleStreamIndex : null,
      activeAudioIndex: activeAudioIndex,
    );

    final hasAudioButton = audioStreams.length > 2;
    final hasSubtitleButton = subtitleStreams.length > 2;
    final effectiveFirstNode = widget.firstFocusNode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File name details card
        FocusableWrapper(
          focusNode: (!hasAudioButton && !hasSubtitleButton && !_playbackInfoFailed)
              ? effectiveFirstNode
              : null,
          suppressFocusGlow: true,
          disableScale: true,
          borderRadius: 8,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: AppRadius.circular(8),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.fileSizeFormat(formattedSize, container),
                  style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
                if (addedLabel != null)
                  Text(
                    l10n.dateCreatedFormat(addedLabel),
                    style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (videoDetails.isNotEmpty) ...[
          _buildInfoRow(
            l10n.video,
            Text(
              videoDetails.join('  •  '),
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.3,
              ),
            ),
            textTheme,
          ),
          const SizedBox(height: 10),
        ],

        if (audioStreams.isNotEmpty) ...[
          _buildInfoRow(
            l10n.audio,
            Text.rich(
              TextSpan(
                children: [
                  ...((_audioExpanded || audioStreams.length <= 2)
                          ? audioStreams
                          : audioStreams.take(2))
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                        final idx = entry.key;
                        final a = entry.value;
                        final title =
                            a['DisplayTitle'] ??
                            a['Codec']?.toString().toUpperCase();
                        final lang = streamLanguageLabel(
                          a['Language'],
                          unknown: l10n.unknown,
                        );
                        final isDefault =
                            a['IsDefault'] == true
                                ? ' [${l10n.defaultLabel}]'
                                : '';
                        final isSelected = a['Index'] == activeAudioIndex;

                        return [
                          if (idx > 0) const TextSpan(text: '\n'),
                          TextSpan(
                            text: '$title ($lang)$isDefault',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(
                                alpha: isSelected ? 1.0 : 0.7,
                              ),
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              decoration:
                                  isSelected
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                              decorationColor: AppColorScheme.accent,
                              decorationThickness: 1.5,
                              height: 1.3,
                            ),
                          ),
                        ];
                      })
                      .expand((e) => e),
                ],
              ),
            ),
            textTheme,
          ),
          if (hasAudioButton) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 90),
                FocusableWrapper(
                  focusNode: effectiveFirstNode ?? _audioShowAllFocusNode,
                  onSelect:
                      () => setState(() => _audioExpanded = !_audioExpanded),
                  borderRadius: 6,
                  suppressFocusGlow: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Text(
                      _audioExpanded
                          ? l10n.showLess
                          : l10n.showAllAudioTracks(audioStreams.length),
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
        ],

        if (subtitleStreams.isNotEmpty) ...[
          _buildInfoRow(
            l10n.subtitles,
            Text.rich(
              TextSpan(
                children: [
                  ...((_subtitlesExpanded || subtitleStreams.length <= 2)
                          ? subtitleStreams
                          : subtitleStreams.take(2))
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                        final idx = entry.key;
                        final s = entry.value;
                        final title =
                            s['DisplayTitle'] ??
                            s['Codec']?.toString().toUpperCase();
                        final lang = streamLanguageLabel(
                          s['Language'],
                          unknown: l10n.unknown,
                        );
                        final isDefault =
                            s['IsDefault'] == true
                                ? ' [${l10n.defaultLabel}]'
                                : '';
                        final isForced =
                            s['IsForced'] == true ? ' [${l10n.forced}]' : '';
                        final isSelected = s['Index'] == activeSubtitleIndex;

                        return [
                          if (idx > 0) const TextSpan(text: '\n'),
                          TextSpan(
                            text: '$title ($lang)$isDefault$isForced',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(
                                alpha: isSelected ? 1.0 : 0.7,
                              ),
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              decoration:
                                  isSelected
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                              decorationColor: AppColorScheme.accent,
                              decorationThickness: 1.5,
                              height: 1.3,
                            ),
                          ),
                        ];
                      })
                      .expand((e) => e),
                ],
              ),
            ),
            textTheme,
          ),
          if (hasSubtitleButton) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 90),
                FocusableWrapper(
                  focusNode:
                      (!hasAudioButton && effectiveFirstNode != null)
                          ? effectiveFirstNode
                          : _subtitleShowAllFocusNode,
                  onSelect:
                      () => setState(
                        () => _subtitlesExpanded = !_subtitlesExpanded,
                      ),
                  borderRadius: 6,
                  suppressFocusGlow: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Text(
                      _subtitlesExpanded
                          ? l10n.showLess
                          : l10n.showAllSubtitleTracks(subtitleStreams.length),
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
        ],

        const SizedBox(height: 12),
        _buildDirectPlaySection(
          context,
          textTheme,
          l10n,
          activeAudioIndex: activeAudioIndex,
          activeSubtitleIndex: activeSubtitleIndex,
          firstFocusNode:
              (!hasAudioButton && !hasSubtitleButton)
                  ? effectiveFirstNode
                  : null,
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, Widget child, TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }

  Widget _buildDirectPlaySection(
    BuildContext context,
    TextTheme textTheme,
    AppLocalizations l10n, {
    int? activeAudioIndex,
    int? activeSubtitleIndex,
    FocusNode? firstFocusNode,
  }) {
    if (_loadingPlaybackInfo) {
      return Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            l10n.checkingDirectPlay,
            style: textTheme.bodySmall?.copyWith(color: Colors.white54),
          ),
        ],
      );
    }

    if (_playbackInfoFailed) {
      return Row(
        children: [
          Text(
            l10n.directPlayCapabilityLabel,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: Text(
              l10n.failedToLoad,
              style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          FocusableWrapper(
            focusNode: firstFocusNode ?? _directPlayRetryFocusNode,
            onSelect: () => _loadPlaybackInfo(),
            borderRadius: 6,
            suppressFocusGlow: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                l10n.retry,
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (_playbackInfo == null || _playbackInfo!.mediaSources.isEmpty) {
      return const SizedBox.shrink();
    }

    final source = _playbackInfo!.mediaSources.first;

    final manager =
        GetIt.instance.isRegistered<PlaybackManager>()
            ? GetIt.instance<PlaybackManager>()
            : null;
    final profile = manager?.backend?.getDeviceProfile() ?? <String, dynamic>{};
    final bitrate = (profile['MaxStreamingBitrate'] as num?)?.toInt();

    final mediaStreams =
        source.mediaStreams.isNotEmpty
            ? source.mediaStreams
            : mediaSourceStreams(widget.mediaSource);

    final clientDvReason = checkClientDolbyVisionTranscodeReason(
      mediaStreams,
      widget.prefs,
    );

    final canDirectPlay = source.supportsDirectPlay && clientDvReason == null;

    final mediaSourceMap = <String, dynamic>{
      'Container': source.container ?? widget.mediaSource['Container'],
      'Bitrate': source.bitrate ?? widget.mediaSource['Bitrate'],
      'MediaStreams': mediaStreams,
    };

    final reasons =
        !canDirectPlay
            ? buildDirectPlayReasonItems(
              serverReasons: source.transcodingReasons,
              mediaSource: mediaSourceMap,
              deviceProfile: profile,
              prefs: widget.prefs,
              l10n: l10n,
              selectedAudioIndex:
                  widget.vm.selectedAudioIndex ?? activeAudioIndex,
              selectedSubtitleIndex:
                  widget.vm.selectedSubtitleIndex ?? activeSubtitleIndex,
              maxStreamingBitrate: bitrate,
            )
            : const <DirectPlayReasonItem>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.directPlayCapabilityLabel,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              canDirectPlay ? l10n.yes : l10n.no,
              style: textTheme.bodyMedium?.copyWith(
                color:
                    canDirectPlay
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFD32F2F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (!canDirectPlay && reasons.isNotEmpty) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  reasons.map((reason) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '• ${reason.description}',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          if (reason.hint != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 2),
                              child: Text(
                                reason.hint!,
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white54,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
