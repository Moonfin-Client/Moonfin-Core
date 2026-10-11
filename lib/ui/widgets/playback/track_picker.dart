import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/delay_limits.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../util/remote_subtitle_labels.dart';
import '../../../util/subtitle_appearance_schedule.dart';
import '../progress_snack_bar.dart';
import '../track_selector_dialog.dart';
import 'delay_footer.dart';
import 'track_choices.dart';

/// Runs a change to the player, returning false when it was refused.
typedef PlayerMutation = Future<bool> Function(
  String label,
  FutureOr<void> Function() action,
);

/// The audio and subtitle pickers: the track list, the delay slider under it,
/// and downloading subtitles from the server's providers. The full player and
/// the mini player both open it, so both offer the same thing.
abstract final class TrackPicker {
  /// The delays applied to this playback. Held here rather than by a screen,
  /// so the full player and the mini player show the same values while the
  /// video moves between them.
  static double audioDelay = 0;
  static double subtitleDelay = 0;

  static void resetDelays() {
    audioDelay = 0;
    subtitleDelay = 0;
  }

  static bool canDownloadRemoteSubtitles(AggregatedItem item) {
    final user = GetIt.instance<UserRepository>().currentUser;
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';

    return (user?.canManageSubtitles ?? false) &&
        item.mediaSources.isNotEmpty &&
        item.type != 'Photo' &&
        item.type != 'Book' &&
        !isAudio;
  }

  /// [runMutation] wraps each track change (the full player uses it to keep
  /// one change in flight and hold back navigation meanwhile), and
  /// [onSubtitlesChanged] runs after a subtitle change lands.
  /// [onDialogOpenChanged] reports each dialog opening and closing, for an
  /// opener outside the navigator that the dialog's barrier doesn't cover.
  static Future<void> show(
    BuildContext context, {
    required PlaybackManager manager,
    required bool audio,
    required MediaServerClient Function(AggregatedItem item) clientFor,
    bool useRootNavigator = true,
    PlayerMutation? runMutation,
    VoidCallback? onSubtitlesChanged,
    ValueChanged<bool>? onDialogOpenChanged,
  }) async {
    final l10n = AppLocalizations.of(context);
    final item = manager.queueService.currentItem;
    final canDownloadRemote =
        !audio && item is AggregatedItem && canDownloadRemoteSubtitles(item);
    final mutate = runMutation ?? _runDirectly;

    final choices = await TrackChoices.load(manager, l10n, audio: audio);
    final streams = choices.streams;
    final options = <TrackOption>[
      ...choices.options,
      if (canDownloadRemote)
        TrackOption(
          label: l10n.downloadSubtitlesLabel,
          subtitle: l10n.searchOpenSubtitlesPlugin,
        ),
    ];
    if (!context.mounted) return;

    final backend = manager.backend;
    final delayLimits = delayLimitsFor(backend, audio: audio);
    final result = await _whileOpen(
      onDialogOpenChanged,
      () => TrackSelectorDialog.show(
        context,
        title: audio ? l10n.audioTrack : l10n.subtitleTrack,
        options: options,
        selectedIndex: choices.selectedIndex,
        useRootNavigator: useRootNavigator,
        footer: delayLimits == null
            ? null
            : DelayFooter(
                initialDelay: audio
                    ? audioDelay
                    : backend is Media3PlayerBackend
                    ? backend.subtitleDelaySeconds
                    : subtitleDelay,
                label: audio ? l10n.audioDelay : l10n.subtitleDelay,
                minDelay: delayLimits.$1,
                maxDelay: delayLimits.$2,
                onDelayChanged: (d) =>
                    _applyDelay(manager, audio: audio, delay: d),
                formatDelay: (seconds) => seconds == 0
                    ? l10n.none
                    : '${seconds >= 0 ? '+' : ''}${(seconds * 1000).round()} ms',
              ),
      ),
    );
    if (result == null || !context.mounted) return;
    final streamIndex = choices.streamIndexFor(result);
    if (!audio) {
      if (streamIndex == -1) {
        await mutate('subtitles_off', manager.disableSubtitles);
        onSubtitlesChanged?.call();
        return;
      }
      if (canDownloadRemote && result - 1 == streams.length) {
        await _downloadRemoteSubtitles(
          context,
          manager: manager,
          item: item,
          client: clientFor(item),
          subtitleStreams: streams,
          audioStreams: choices.allStreams
              .where((s) => s['Type'] == 'Audio')
              .toList(),
          mutate: mutate,
          onSubtitlesChanged: onSubtitlesChanged,
          onDialogOpenChanged: onDialogOpenChanged,
        );
        return;
      }
      if (streamIndex != null) {
        await mutate(
          'subtitle_$streamIndex',
          () => manager.changeSubtitleTrack(streamIndex),
        );
        onSubtitlesChanged?.call();
      }
    } else if (streamIndex != null) {
      await mutate(
        'audio_$streamIndex',
        () => manager.changeAudioTrack(streamIndex),
      );
    }
  }

  static Future<bool> _runDirectly(
    String label,
    FutureOr<void> Function() action,
  ) async {
    await action();
    return true;
  }

  static Future<int?> _whileOpen(
    ValueChanged<bool>? onOpenChanged,
    Future<int?> Function() open,
  ) async {
    onOpenChanged?.call(true);
    try {
      return await open();
    } finally {
      onOpenChanged?.call(false);
    }
  }

  static void _applyDelay(
    PlaybackManager manager, {
    required bool audio,
    required double delay,
  }) {
    if (audio) {
      audioDelay = delay;
      manager.backend?.setAudioDelay(delay);
    } else {
      subtitleDelay = delay;
      manager.backend?.setSubtitleDelay(delay);
    }
  }

  static Future<void> _downloadRemoteSubtitles(
    BuildContext context, {
    required PlaybackManager manager,
    required AggregatedItem item,
    required MediaServerClient client,
    required List<Map<String, dynamic>> subtitleStreams,
    required List<Map<String, dynamic>> audioStreams,
    required PlayerMutation mutate,
    VoidCallback? onSubtitlesChanged,
    ValueChanged<bool>? onDialogOpenChanged,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final language = remoteSubtitleLanguage(subtitleStreams, audioStreams);

    List<Map<String, dynamic>> results;
    try {
      results = await withProgressSnackBar(
        messenger,
        l10n.searchingSubtitles,
        () =>
            client.itemsApi.searchRemoteSubtitles(item.id, language: language),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            remoteSubtitleErrorMessage(error, l10n, action: l10n.search),
          ),
        ),
      );
      return;
    }

    if (!context.mounted) return;
    if (results.isEmpty) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.noRemoteSubtitlesFound(language))),
      );
      return;
    }

    final result = await _whileOpen(
      onDialogOpenChanged,
      () => TrackSelectorDialog.show(
        context,
        title: l10n.downloadSubtitles,
        options: results.map((subtitle) {
          final label =
              subtitle['Name'] as String? ??
              subtitle['Author'] as String? ??
              l10n.subtitles;
          final subtitleText = remoteSubtitleDetails(subtitle, l10n);
          return TrackOption(
            label: label,
            subtitle: subtitleText.isNotEmpty ? subtitleText : null,
            subtitleMaxLines: 2,
            badges: remoteSubtitleFlags(subtitle, l10n),
          );
        }).toList(),
      ),
    );

    if (!context.mounted || result == null || result >= results.length) {
      return;
    }

    final subtitleId = results[result]['Id']?.toString();
    if (subtitleId == null || subtitleId.isEmpty) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.selectedSubtitleInvalid)),
      );
      return;
    }

    final existingIndexes = subtitleStreams
        .map((stream) => stream['Index'] as int?)
        .whereType<int>()
        .toSet();

    try {
      final newStream = await withProgressSnackBar(
        messenger,
        l10n.downloadingSubtitle,
        () async {
          await client.itemsApi.downloadRemoteSubtitle(item.id, subtitleId);
          return awaitNewSubtitleStream(
            client: client,
            item: item,
            existingIndexes: existingIndexes,
            keepGoing: () => context.mounted,
          );
        },
      );
      if (!context.mounted) return;

      if (newStream != null) {
        final streamIndex = newStream['Index'] as int?;
        if (streamIndex != null) {
          unawaited(
            mutate(
              'downloaded_subtitle_$streamIndex',
              () => manager.changeSubtitleTrack(
                streamIndex,
                refreshStreams: true,
              ),
            ).then((_) {
              if (context.mounted) onSubtitlesChanged?.call();
            }),
          );
        }
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              l10n.subtitleDownloadedSelected(
                newStream['DisplayTitle'] as String? ??
                    newStream['Title'] as String? ??
                    newStream['Language'] as String? ??
                    l10n.unknown,
              ),
            ),
          ),
        );
        return;
      }

      messenger.showSnackBar(
        SnackBar(content: Text(l10n.subtitleDownloadedPending)),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            remoteSubtitleErrorMessage(error, l10n, action: l10n.download),
          ),
        ),
      );
    }
  }
}
