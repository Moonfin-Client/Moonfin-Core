import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/cast/cast_service.dart';
import '../../data/services/cast/cast_target.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../util/error_message.dart';
import '../../util/audio_labels.dart';
import 'overlay_sheet.dart';

class CastMiniPlayer extends StatelessWidget {
  const CastMiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final castService = GetIt.instance<CastService>();
    return ValueListenableBuilder<CastTargetKind?>(
      valueListenable: castService.activeKindNotifier,
      builder: (context, kind, _) => ValueListenableBuilder<AggregatedItem?>(
        valueListenable: castService.castItemNotifier,
        builder: (context, item, _) {
          if (kind == null || item == null) {
            return const SizedBox.shrink();
          }
          return _CastMiniPlayerContent(
            castService: castService,
            kind: kind,
            item: item,
          );
        },
      ),
    );
  }
}

class _CastMiniPlayerContent extends StatefulWidget {
  final CastService castService;
  final CastTargetKind kind;
  final AggregatedItem item;

  const _CastMiniPlayerContent({
    required this.castService,
    required this.kind,
    required this.item,
  });

  @override
  State<_CastMiniPlayerContent> createState() => _CastMiniPlayerContentState();
}

class _CastMiniPlayerContentState extends State<_CastMiniPlayerContent> {
  bool _isSeeking = false;
  double _seekValue = 0;

  CastService get _castService => widget.castService;
  CastTargetKind get _kind => widget.kind;

  @override
  void initState() {
    super.initState();
    _castService.remoteErrorNotifier.addListener(_onRemoteError);
  }

  @override
  void dispose() {
    _castService.remoteErrorNotifier.removeListener(_onRemoteError);
    super.dispose();
  }

  void _onRemoteError() {
    final message = _castService.remoteErrorNotifier.value;
    if (message == null || !mounted) return;
    _castService.remoteErrorNotifier.value = null;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).castingFailed(message))),
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  IconData get _kindIcon => switch (_kind) {
        CastTargetKind.googleCast => Icons.cast_connected,
        CastTargetKind.airPlay => Icons.airplay,
        CastTargetKind.dlna => Icons.router,
        CastTargetKind.jellyfinSession => Icons.devices,
      };

  String _kindLabel(AppLocalizations l10n) => switch (_kind) {
        CastTargetKind.googleCast => l10n.castGoogleCast,
        CastTargetKind.airPlay => l10n.castAirPlay,
        CastTargetKind.dlna => l10n.castDlna,
        CastTargetKind.jellyfinSession => l10n.castRemotePlayback,
      };

  Future<void> _doAction(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.castControlFailed(describeError(e, l10n)),
          ),
        ),
      );
    }
  }

  void _onSeekEnd(double value, double maxValue) {
    setState(() => _isSeeking = false);
    if (maxValue <= 0) return;
    final ticks = value.round();
    _doAction(() => _castService.seek(_kind, positionTicks: ticks));
  }

  void _showFullControls() {
    final l10n = AppLocalizations.of(context);
    final stateVal = _castService.remoteStateNotifier.value;
    final positionTicks = _castService.remotePositionNotifier.value;

    showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  l10n.castKindControls(_kindLabel(l10n)),
                  style: TextStyle(color: AppColorScheme.onSurface, fontWeight: FontWeight.w600),
                ),
                subtitle: stateVal != null
                    ? Text(
                        '${stateVal[0].toUpperCase()}${stateVal.substring(1)}'
                        ' · ${_formatDuration(Duration(microseconds: positionTicks ~/ 10))}',
                        style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.54)),
                      )
                    : null,
              ),
              if (_kind != CastTargetKind.airPlay)
                // The level arrives after the sheet is already open for a
                // receiver that has to be asked for it, so the whole tile
                // follows the notifier rather than a value read once here.
                ValueListenableBuilder<double?>(
                  valueListenable: _castService.remoteVolumeNotifier,
                  builder: (context, vol, _) => ListTile(
                    leading: Icon(Icons.volume_up_rounded, color: AppColorScheme.onSurface),
                    title: Text(l10n.castDeviceVolume, style: TextStyle(color: AppColorScheme.onSurface)),
                    subtitle: vol == null
                        ? Text(l10n.castVolumeUnavailable, style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.54)))
                        : SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: AppColorScheme.accent,
                              inactiveTrackColor: AppColorScheme.onSurface.withValues(alpha: 0.24),
                              thumbColor: AppColorScheme.onSurface,
                              overlayColor: AppColorScheme.onSurface.withValues(alpha: 0.24),
                            ),
                            child: Slider(
                              value: vol.clamp(0.0, 1.0),
                              min: 0,
                              max: 1,
                              onChanged: (value) {
                                _castService.remoteVolumeNotifier.value = value;
                                _doAction(
                                  () => _castService.setVolume(_kind, volume: value),
                                );
                              },
                            ),
                          ),
                    trailing: vol == null
                        ? null
                        : Text(
                            '${(vol * 100).round()}%',
                            style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.7)),
                          ),
                  ),
                ),
              ListTile(
                leading: Icon(Icons.play_arrow_rounded, color: AppColorScheme.onSurface),
                title: Text(l10n.play, style: TextStyle(color: AppColorScheme.onSurface)),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _doAction(() => _castService.play(_kind));
                },
              ),
              ListTile(
                leading: Icon(Icons.pause_rounded, color: AppColorScheme.onSurface),
                title: Text(l10n.pause, style: TextStyle(color: AppColorScheme.onSurface)),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _doAction(() => _castService.pause(_kind));
                },
              ),
              ListTile(
                leading: Icon(Icons.stop_rounded, color: AppColorScheme.onSurface),
                title: Text(l10n.castStopKind(_kindLabel(l10n)), style: TextStyle(color: AppColorScheme.onSurface)),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _doAction(() => _castService.stop(_kind));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTrackSelector({required bool audio}) {
    final l10n = AppLocalizations.of(context);
    final item = _castService.castItemNotifier.value;
    if (item == null) return;
    final target = _castService.activeTargetNotifier.value;
    if (target == null) return;

    final allStreams = item.mediaStreams;
    final streamType = audio ? 'Audio' : 'Subtitle';
    final streams = allStreams.where((s) => s['Type'] == streamType).toList();

    final MediaServerClientFactory clientFactory =
        GetIt.instance<MediaServerClientFactory>();
    final MediaServerClient client =
        clientFactory.getClientIfExists(item.serverId) ??
            GetIt.instance<MediaServerClient>();

    showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      isScrollControlled: true,
      builder: (sheetCtx) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.8,
        minChildSize: 0.3,
        expand: false,
        builder: (_, scrollController) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.spaceLg),
                child: Text(
                  audio ? l10n.audioLabel : l10n.subtitlesLabel,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: AppTypography.fontSizeLg,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    ...streams.asMap().entries.map((e) {
                      final stream = e.value;
                      final streamIndex = stream['Index'] as int? ?? e.key;
                      final displayTitle = stream['DisplayTitle'] as String?;
                      final title = stream['Title'] as String?;
                      final language = stream['Language'] as String?;
                      final codec = stream['Codec'] as String?;
                      final codecLabel = audioLabelFromProfileCodec(
                        stream['Profile'] as String?,
                        codec,
                      );
                      final label =
                          displayTitle ?? title ?? language ?? '$streamType ${e.key + 1}';
                      final subtitle = [
                        if (language != null && displayTitle != null) language,
                        ?codecLabel,
                        if (stream['Channels'] != null) '${stream['Channels']}ch',
                      ].join(' · ');

                      return ListTile(
                        title: Text(label, style: TextStyle(color: AppColorScheme.onSurface)),
                        subtitle: subtitle.isNotEmpty
                            ? Text(subtitle,
                            style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.54)))
                            : null,
                        leading: Icon(
                          Icons.radio_button_unchecked,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.38),
                        ),
                        onTap: () {
                          Navigator.pop(sheetCtx);
                          final positionTicks =
                              _castService.remotePositionNotifier.value;
                          _doAction(() async {
                            await client.sessionApi.sendPlayCommand(
                              target.id,
                              playCommand: 'PlayNow',
                              itemIds: [item.id],
                              startPositionTicks: positionTicks,
                              audioStreamIndex: audio ? streamIndex : null,
                              subtitleStreamIndex: !audio ? streamIndex : null,
                            );
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomPad = MediaQuery.of(context).viewPadding.bottom;
    final title = widget.item.name.isNotEmpty ? widget.item.name : _kindLabel(l10n);
    final durationTicks = (widget.item.runTimeTicks ?? 0).toDouble();

    return Dismissible(
      key: ValueKey('cast-mini-player-${_kind.name}-${widget.item.id}'),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        _doAction(() => _castService.stop(_kind));
      },
      child: GestureDetector(
        onTap: _showFullControls,
        child: Material(
          color: AppColorScheme.surface,
          child: Container(
            padding: EdgeInsets.only(bottom: bottomPad),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SeekSliver(
                  castService: _castService,
                  durationTicks: durationTicks,
                  isSeeking: _isSeeking,
                  seekValue: _seekValue,
                  onSeekStart: (v) => setState(() {
                    _isSeeking = true;
                    _seekValue = v;
                  }),
                  onSeekChanged: (v) => setState(() => _seekValue = v),
                  onSeekEnd: (v) => _onSeekEnd(v, durationTicks),
                ),
                SizedBox(
                  height: 56,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Icon(_kindIcon, color: AppColorScheme.onSurface.withValues(alpha: 0.7), size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColorScheme.onSurface,
                              fontSize: AppTypography.fontSizeSm,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ValueListenableBuilder<String?>(
                          valueListenable: _castService.remoteStateNotifier,
                          builder: (context, state, _) {
                            final isPlaying = state == 'playing';
                            return IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                color: AppColorScheme.onSurface,
                              ),
                              onPressed: () => isPlaying
                                  ? _doAction(() => _castService.pause(_kind))
                                  : _doAction(() => _castService.play(_kind)),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.stop_rounded, color: AppColorScheme.onSurface),
                          onPressed: () => _doAction(() => _castService.stop(_kind)),
                        ),
                        if (_kind == CastTargetKind.jellyfinSession) ...[
                          IconButton(
                            icon: Icon(Icons.subtitles_outlined, color: AppColorScheme.onSurface),
                            onPressed: () => _showTrackSelector(audio: false),
                          ),
                          IconButton(
                            icon: Icon(Icons.audiotrack_outlined, color: AppColorScheme.onSurface),
                            onPressed: () => _showTrackSelector(audio: true),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SeekSliver extends StatelessWidget {
  final CastService castService;
  final double durationTicks;
  final bool isSeeking;
  final double seekValue;
  final ValueChanged<double> onSeekStart;
  final ValueChanged<double> onSeekChanged;
  final ValueChanged<double> onSeekEnd;

  const _SeekSliver({
    required this.castService,
    required this.durationTicks,
    required this.isSeeking,
    required this.seekValue,
    required this.onSeekStart,
    required this.onSeekChanged,
    required this.onSeekEnd,
  });

  @override
  Widget build(BuildContext context) {
    if (durationTicks <= 0) {
      return LinearProgressIndicator(
        value: null,
        backgroundColor: AppColorScheme.onSurface.withValues(alpha: 0.12),
        color: AppColorScheme.accent,
        minHeight: 2,
      );
    }

    return ValueListenableBuilder<int>(
      valueListenable: castService.remotePositionNotifier,
      builder: (context, positionTicks, _) {
        final double posValue =
            isSeeking ? seekValue : positionTicks.toDouble();
        final double maxValue = durationTicks;

        return Material(
          type: MaterialType.transparency,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: AppColorScheme.accent,
              inactiveTrackColor: AppColorScheme.onSurface.withValues(alpha: 0.12),
              thumbColor: AppColorScheme.accent,
              overlayColor: AppColorScheme.accent.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: posValue.clamp(0.0, maxValue),
              max: maxValue,
              onChangeStart: onSeekStart,
              onChanged: onSeekChanged,
              onChangeEnd: onSeekEnd,
            ),
          ),
        );
      },
    );
  }
}
