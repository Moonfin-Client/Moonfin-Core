import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/sleep_timer_controller.dart';
import '../adaptive/sf_symbol.dart';
import '../audiobook/audiobook_time.dart';
import '../track_selector_dialog.dart';

/// The fixed lengths offered in the video and Live TV sleep timer menu.
const sleepTimerPresetMinutes = <int>[30, 60];

/// The custom picker moves in these steps and stays between them and
/// [sleepTimerCustomMaxMinutes].
const sleepTimerCustomStepMinutes = 5;
const sleepTimerCustomMaxMinutes = 300;

enum SleepTimerChoiceKind { off, endOfItem, endOfNextItem, minutes, custom }

class SleepTimerChoice {
  const SleepTimerChoice(this.kind, [this.minutes]);

  final SleepTimerChoiceKind kind;
  final int? minutes;
}

/// The rows of the sleep timer menu, top to bottom. "Off" only appears while
/// a timer runs, "end of this video" only where the item has an end, and
/// "end of next video" only when something is queued after it.
List<SleepTimerChoice> sleepTimerChoices({
  required bool active,
  required bool offerEndOfItem,
  bool offerEndOfNextItem = false,
}) => [
  if (active) const SleepTimerChoice(SleepTimerChoiceKind.off),
  if (offerEndOfItem) const SleepTimerChoice(SleepTimerChoiceKind.endOfItem),
  if (offerEndOfNextItem)
    const SleepTimerChoice(SleepTimerChoiceKind.endOfNextItem),
  for (final minutes in sleepTimerPresetMinutes)
    SleepTimerChoice(SleepTimerChoiceKind.minutes, minutes),
  const SleepTimerChoice(SleepTimerChoiceKind.custom),
];

/// The row that matches the running timer, so the menu opens on it. A custom
/// length that happens to equal a preset marks the preset.
int? runningSleepTimerChoice(
  List<SleepTimerChoice> choices,
  SleepTimerController controller,
) {
  switch (controller.mode) {
    case SleepTimerMode.off:
    case SleepTimerMode.endOfChapter:
      return null;
    case SleepTimerMode.endOfItem:
      final i = choices.indexWhere(
        (c) => c.kind == SleepTimerChoiceKind.endOfItem,
      );
      return i >= 0 ? i : null;
    case SleepTimerMode.endOfNextItem:
      final i = choices.indexWhere(
        (c) => c.kind == SleepTimerChoiceKind.endOfNextItem,
      );
      return i >= 0 ? i : null;
    case SleepTimerMode.duration:
      final requested = controller.totalRequested.inMinutes;
      final preset = choices.indexWhere(
        (c) => c.kind == SleepTimerChoiceKind.minutes && c.minutes == requested,
      );
      if (preset >= 0) return preset;
      final custom = choices.indexWhere(
        (c) => c.kind == SleepTimerChoiceKind.custom,
      );
      return custom >= 0 ? custom : null;
  }
}

/// Keeps a custom length on the picker's steps and inside its range.
int clampSleepTimerCustomMinutes(int minutes) {
  final stepped =
      (minutes / sleepTimerCustomStepMinutes).round() *
      sleepTimerCustomStepMinutes;
  return stepped.clamp(sleepTimerCustomStepMinutes, sleepTimerCustomMaxMinutes);
}

/// Opens the sleep timer menu for the video or Live TV player and starts,
/// changes or stops the shared timer from the pick. [position] and
/// [duration] are the current item's; leave [duration] null for a stream
/// with no end, such as Live TV.
Future<void> showPlayerSleepTimerMenu(
  BuildContext context, {
  required SleepTimerController controller,
  Duration position = Duration.zero,
  Duration? duration,
}) async {
  final l10n = AppLocalizations.of(context);
  final offerEndOfItem =
      duration != null &&
      SleepTimerController.endOfItemTargetMs(
            position.inMilliseconds,
            duration.inMilliseconds,
          ) !=
          null;
  final choices = sleepTimerChoices(
    active: controller.isActive,
    offerEndOfItem: offerEndOfItem,
    offerEndOfNextItem: duration != null && controller.canStopAtEndOfNextItem,
  );
  final title = controller.isActive
      ? '${l10n.audiobookSleepTimer} · '
            '${l10n.audiobookSleepRemaining(formatAudiobookCompact(controller.remaining))}'
      : l10n.audiobookSleepTimer;

  final picked = await TrackSelectorDialog.show(
    context,
    title: title,
    options: [
      for (final choice in choices)
        TrackOption(
          label: switch (choice.kind) {
            SleepTimerChoiceKind.off => l10n.audiobookSleepOff,
            SleepTimerChoiceKind.endOfItem => l10n.playerSleepEndOfItem,
            SleepTimerChoiceKind.endOfNextItem => l10n.playerSleepEndOfNextItem,
            SleepTimerChoiceKind.minutes => l10n.audiobookSleepMinutes(
              choice.minutes!,
            ),
            SleepTimerChoiceKind.custom => l10n.audiobookSleepCustom,
          },
        ),
    ],
    selectedIndex: runningSleepTimerChoice(choices, controller),
  );
  if (picked == null) return;

  final choice = choices[picked];
  switch (choice.kind) {
    case SleepTimerChoiceKind.off:
      controller.cancel();
    case SleepTimerChoiceKind.endOfItem:
      controller.startEndOfItem(
        currentPositionMs: position.inMilliseconds,
        totalDurationMs: duration!.inMilliseconds,
      );
    case SleepTimerChoiceKind.endOfNextItem:
      controller.startEndOfNextItem(
        currentPositionMs: position.inMilliseconds,
        totalDurationMs: duration!.inMilliseconds,
      );
    case SleepTimerChoiceKind.minutes:
      controller.startDuration(Duration(minutes: choice.minutes!));
    case SleepTimerChoiceKind.custom:
      if (!context.mounted) return;
      final last = controller.lastActiveMode == SleepTimerMode.duration
          ? controller.lastActiveDuration.inMinutes
          : 30;
      final minutes = await showStyledPlayerDialog<int>(
        context,
        title: l10n.audiobookSleepTimer,
        builder: (dialogContext) => _CustomSleepPicker(
          initialMinutes: clampSleepTimerCustomMinutes(last),
          onSet: (value) => Navigator.pop(dialogContext, value),
        ),
      );
      if (minutes != null) {
        controller.startDuration(Duration(minutes: minutes));
      }
  }
}

/// A length picked in steps, laid out like the subtitle delay footer so it
/// works the same with a remote, a pointer or a finger.
class _CustomSleepPicker extends StatefulWidget {
  const _CustomSleepPicker({
    required this.initialMinutes,
    required this.onSet,
  });

  final int initialMinutes;
  final ValueChanged<int> onSet;

  @override
  State<_CustomSleepPicker> createState() => _CustomSleepPickerState();
}

class _CustomSleepPickerState extends State<_CustomSleepPicker> {
  late int _minutes = widget.initialMinutes;

  void _adjust(int delta) {
    final next = clampSleepTimerCustomMinutes(_minutes + delta);
    if (next != _minutes) setState(() => _minutes = next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.audiobookSleepCustom,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: AppTypography.fontSizeSm,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.audiobookSleepMinutes(_minutes),
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontSize: AppTypography.fontSizeMd,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              IconButton(
                onPressed: () => _adjust(-sleepTimerCustomStepMinutes),
                icon: const AdaptiveIcon(
                  Icons.remove_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.playerSleepCustomLess(
                  sleepTimerCustomStepMinutes,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                autofocus: true,
                onPressed: () => widget.onSet(_minutes),
                style: OutlinedButton.styleFrom(
                  side: ThemeRegistry.active.borders.chipBorder,
                ),
                child: Text(
                  l10n.set,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _adjust(sleepTimerCustomStepMinutes),
                icon: const AdaptiveIcon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: l10n.playerSleepCustomMore(
                  sleepTimerCustomStepMinutes,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
