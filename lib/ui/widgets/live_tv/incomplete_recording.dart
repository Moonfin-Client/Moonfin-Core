import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/incomplete_recordings_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/clock_format.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../adaptive/adaptive_dialog.dart';
import '../marquee_text.dart';
import '../media_badge.dart';
import '../overlay_sheet.dart';
import 'live_tv_recording_icon.dart';

/// Amber, so it reads as a warning next to the watched and favorite badges
/// without looking like the red recording mark.
const _incompleteColor = Color(0xFFE0A33C);
const _incompleteTextColor = Color(0xFF1E1E24);

IncompleteRecordingsService? get _service =>
    GetIt.instance.isRegistered<IncompleteRecordingsService>()
    ? GetIt.instance<IncompleteRecordingsService>()
    : null;

/// True when the signed-in user may change recordings, which Keep as Complete
/// and the Record prompt's second choice both need. The server checks again.
bool canManageLiveTv() {
  if (!GetIt.instance.isRegistered<UserRepository>()) return false;
  return GetIt.instance<UserRepository>().currentUser?.canManageLiveTv ?? false;
}

/// The incomplete state of an item, or null when it is complete, unknown or
/// the server's plugin can't tell.
IncompleteRecording? incompleteRecordingFor(String? itemId) =>
    _service?.stateFor(itemId);

/// The Incomplete badge. The same on every surface that shows a recording, and
/// draws nothing for an item that isn't incomplete.
class IncompleteRecordingBadge extends StatelessWidget {
  final String? itemId;
  final double height;

  /// Applied only when the badge draws, so a complete item keeps its spacing.
  final EdgeInsetsGeometry padding;

  const IncompleteRecordingBadge({
    super.key,
    required this.itemId,
    this.height = 22,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final service = _service;
    if (service == null || itemId == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        if (service.stateFor(itemId) == null) return const SizedBox.shrink();
        return Padding(
          padding: padding,
          child: IncompleteRecordingPill(height: height),
        );
      },
    );
  }
}

/// The badge's look on its own, for places that already know the item is
/// incomplete.
class IncompleteRecordingPill extends StatelessWidget {
  final double height;

  const IncompleteRecordingPill({super.key, this.height = 22});

  @override
  Widget build(BuildContext context) {
    final label = AppLocalizations.of(context).incompleteRecording;
    return Semantics(
      label: label,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: height * 0.3),
        decoration: BoxDecoration(
          color: _incompleteColor,
          borderRadius: AppRadius.circular(height / 2),
          border: Border.all(color: _incompleteTextColor, width: 1.5),
          boxShadow: kMediaBadgeShadow,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.content_cut_rounded,
              size: height * 0.55,
              color: _incompleteTextColor,
            ),
            SizedBox(width: height * 0.15),
            Text(
              label,
              style: TextStyle(
                color: _incompleteTextColor,
                fontSize: height * 0.5,
                fontWeight: FontWeight.bold,
                height: 1.1,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _clock(DateTime time) => formatClockTime(
  time,
  use24Hour:
      GetIt.instance.isRegistered<UserPreferences>() &&
      GetIt.instance<UserPreferences>().get(UserPreferences.use24HourClock),
);

/// "Thu 8:00 PM", in the user's clock format.
String formatShowingTime(BuildContext context, DateTime time) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  return '${DateFormat.E(locale).format(time)} ${_clock(time)}';
}

/// The one-line status under an incomplete recording's title, such as
/// "Incomplete · 23 of 37 min · Complete showing scheduled Thu 8:00 PM".
String incompleteRecordingLine(
  BuildContext context,
  IncompleteRecording state,
) {
  final l10n = AppLocalizations.of(context);
  final parts = [
    l10n.incompleteRecording,
    l10n.incompleteRecordingMinutes(
      state.recordedMinutes,
      state.expectedMinutes,
    ),
    switch (state.status) {
      CompleteShowingStatus.scheduled when state.scheduledStart != null =>
        l10n.completeShowingScheduled(
          formatShowingTime(context, state.scheduledStart!),
        ),
      CompleteShowingStatus.recorded when state.recordedAt != null =>
        l10n.completeCopyRecorded(
          formatShowingTime(context, state.recordedAt!),
        ),
      CompleteShowingStatus.notFound => l10n.noCompleteShowingFound,
      _ => null,
    },
  ];
  return parts.whereType<String>().join(' · ');
}

/// The detail screen's status line. Draws nothing for an item that isn't
/// incomplete.
class IncompleteRecordingDetailLine extends StatelessWidget {
  final String itemId;
  final TextAlign? textAlign;

  const IncompleteRecordingDetailLine({
    super.key,
    required this.itemId,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final service = _service;
    if (service == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        final state = service.stateFor(itemId);
        if (state == null) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            incompleteRecordingLine(context, state),
            textAlign: textAlign,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _incompleteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}

/// Keep as Complete for one item, with a snackbar either way.
Future<void> keepRecordingAsComplete(
  BuildContext context,
  String itemId,
) async {
  final service = _service;
  if (service == null) return;
  final l10n = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.maybeOf(context);
  final ok = await service.dismiss(itemId);
  messenger?.showSnackBar(
    SnackBar(
      content: Text(ok ? l10n.keptAsComplete : l10n.unableToKeepAsComplete),
    ),
  );
}

/// How long after a program's start pressing Record still counts as on time.
const recordPromptGrace = Duration(minutes: 1);

/// Whether pressing Record on a program should offer to also record a
/// complete showing later: it has already started, it has season and episode
/// numbers to find the same episode by, and the user may manage recordings.
bool offersCompleteShowing({
  required DateTime programStart,
  required DateTime now,
  required int? season,
  required int? episode,
  required bool supported,
  required bool canManage,
}) {
  return supported &&
      canManage &&
      season != null &&
      episode != null &&
      now.isAfter(programStart.add(recordPromptGrace));
}

/// [offersCompleteShowing] for a guide program's raw item.
bool offersCompleteShowingFor(
  Map<String, dynamic> program,
  DateTime programStart, {
  DateTime? now,
}) {
  return offersCompleteShowing(
    programStart: programStart,
    now: now ?? DateTime.now(),
    season: (program['ParentIndexNumber'] as num?)?.toInt(),
    episode: (program['IndexNumber'] as num?)?.toInt(),
    supported: _service?.supported ?? false,
    canManage: canManageLiveTv(),
  );
}

enum RecordPromptChoice {
  alsoRecordLaterShowing,
  justRecordNow,
  justRecordLater,
}

/// The airing the user pressed Record on, as the Record prompt shows it.
class RecordPromptAiring {
  final DateTime start;
  final DateTime? end;
  final String channel;
  final String description;
  final int? season;
  final int? episode;

  const RecordPromptAiring({
    required this.start,
    this.end,
    this.channel = '',
    this.description = '',
    this.season,
    this.episode,
  });

  /// Reads a guide program's raw item. Guide items carry only the channel's
  /// id, so the caller passes the channel's number and name when it has them.
  factory RecordPromptAiring.fromProgram(
    Map<String, dynamic> program,
    DateTime start, {
    String? channel,
  }) => RecordPromptAiring(
    start: start,
    end: parseServerDate(program['EndDate'])?.toLocal(),
    channel:
        channel ??
        recordPromptChannel(program['ChannelNumber'], program['ChannelName']),
    description: (program['Overview'] as String?)?.trim() ?? '',
    season: (program['ParentIndexNumber'] as num?)?.toInt(),
    episode: (program['IndexNumber'] as num?)?.toInt(),
  );
}

/// "16.1 WPTODT": a channel's number and name, skipping whichever is missing.
String recordPromptChannel(Object? number, Object? name) => [number, name]
    .whereType<Object>()
    .map((part) => part.toString().trim())
    .where((part) => part.isNotEmpty)
    .join(' ');

/// When a later showing airs, as the Record prompt's button names it: a time
/// today, Tomorrow, a weekday within the week, otherwise a short date.
String laterShowingWhen(BuildContext context, DateTime start, {DateTime? now}) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  final from = DateUtils.dateOnly(now ?? DateTime.now());
  // Rounded so a daylight saving change doesn't shorten a day to 23 hours.
  final days = (DateUtils.dateOnly(start).difference(from).inHours / 24)
      .round();
  if (days <= 0) return _clock(start);
  if (days == 1) return AppLocalizations.of(context).recordPromptTomorrow;
  if (days < 7) return DateFormat.EEEE(locale).format(start);
  return DateFormat.MMMd(locale).format(start);
}

/// Whether two program descriptions say different things, ignoring case and
/// spacing. A missing description proves nothing either way.
bool descriptionsDiffer(String a, String b) {
  String normalized(String text) =>
      text.trim().replaceAll(RegExp(r'\s+'), ' ').toLowerCase();
  final left = normalized(a);
  final right = normalized(b);
  return left.isNotEmpty && right.isNotEmpty && left != right;
}

/// Asks whether to also record a later showing of a program that has already
/// started, showing the airing now and the later one as labelled cards so it
/// is clear which is which. Back records nothing and returns null.
Future<RecordPromptChoice?> showRecordPrompt({
  required BuildContext context,
  required String programName,
  required RecordPromptAiring airing,
  SuggestedShowing? suggestion,
  bool searchForCompleteShowing = true,
}) {
  final l10n = AppLocalizations.of(context);
  final locale = Localizations.localeOf(context).toLanguageTag();
  final now = DateTime.now();
  final uncertain = suggestion != null && !searchForCompleteShowing;
  final differ =
      suggestion != null &&
      descriptionsDiffer(airing.description, suggestion.description);
  final cautious = uncertain || differ;
  final elapsed = now.difference(airing.start);
  final length = airing.end?.difference(airing.start);
  final defaultFocusNode = FocusNode(debugLabel: 'RecordPromptDefault');
  var focusRequested = false;

  return showFocusRestoringDialog<RecordPromptChoice>(
    context: context,
    builder: (dialogContext) {
      if (!focusRequested) {
        focusRequested = true;
        // On TV a navigator observer focuses a new route's first focusable
        // after autofocus resolves, so the default choice takes it back here.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (defaultFocusNode.context?.mounted == true) {
            defaultFocusNode.requestFocus();
          }
        });
      }
      void choose(RecordPromptChoice choice) =>
          Navigator.of(dialogContext).pop(choice);

      final nowCard = _ShowingCard(
        label: l10n.recordPromptNow,
        when: [
          '${formatShowingTime(context, airing.start)}'
              '${airing.end == null ? '' : ' – ${_clock(airing.end!)}'}',
          if (airing.channel.isNotEmpty) airing.channel,
        ].join(' · '),
        progress: length == null || length.inSeconds <= 0
            ? null
            : (elapsed.inSeconds / length.inSeconds).clamp(0.0, 1.0),
        progressLabel: l10n.recordPromptAired(elapsed.inMinutes),
        description: airing.description,
      );
      final laterChannel = suggestion == null
          ? ''
          : recordPromptChannel(
              suggestion.channelNumber,
              suggestion.channelName,
            );
      final notes = [
        if (uncertain)
          _PromptNote(
            icon: Icons.warning_amber_rounded,
            text: l10n.recordPromptUncertainMatch,
            color: _incompleteColor,
          ),
        if (differ)
          _PromptNote(
            icon: Icons.compare_arrows_rounded,
            text: l10n.recordPromptDescriptionsDiffer,
            color: _incompleteColor,
          ),
        if (suggestion != null &&
            !cautious &&
            airing.season != null &&
            airing.episode != null)
          _PromptNote(
            icon: Icons.check_circle_outline_rounded,
            text: l10n.recordPromptSameEpisode(airing.season!, airing.episode!),
            color: Colors.white70,
          ),
      ];
      final laterCard = suggestion == null
          ? null
          : _ShowingCard(
              label: l10n.recordPromptLater,
              when: [
                '${DateFormat.MMMEd(locale).format(suggestion.start)} · '
                    '${_clock(suggestion.start)}',
                if (laterChannel.isNotEmpty) laterChannel,
              ].join(' · '),
              description: suggestion.description,
              // Beside the label, in the guide's recording red, so it reads as
              // a fact about this showing rather than a note to act on.
              status: suggestion.alreadyScheduled
                  ? l10n.recordPromptAlreadyScheduled
                  : null,
            );
      // The notes and the question sit under the cards, outside anything that
      // scrolls: a remote can't scroll dialog content, and a caution about the
      // match must never be out of reach.
      final pinned = [
        for (final note in notes) ...[const SizedBox(height: 10), note],
        const SizedBox(height: 18),
        // The decision, so it reads a size up from the details above it.
        Text(
          suggestion == null
              ? l10n.recordPromptSearchLater
              : l10n.recordPromptAlsoRecordLater,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ];

      final details = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.recordPromptStarted(
              elapsed.inMinutes < 1 ? 1 : elapsed.inMinutes,
            ),
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          nowCard,
          if (laterCard != null) ...[const SizedBox(height: 10), laterCard],
        ],
      );
      final title = Text(
        l10n.recordPromptTitle(programName),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
      // The UI scale setting only scales text, so the dialog widens with it to
      // keep its layout, up to the screen's width.
      final textScale = MediaQuery.textScalerOf(dialogContext).scale(1);
      // AlertDialog sizes itself by its content's intrinsic width, which the
      // marquee can't report, so the content gets a fixed width that still
      // fits a phone (the dialog's insets plus its content padding).
      final content = AppUiIdiomResolver.isApple
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [details, ...pinned],
            )
          : SizedBox(
              width: (MediaQuery.sizeOf(dialogContext).width - 128).clamp(
                0.0,
                680.0 * textScale,
              ),
              // The cards scroll and the notes and question stay above the
              // buttons, scrolling too only on a screen too short for them.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: SingleChildScrollView(child: details)),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(dialogContext).height / 3,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pinned,
                      ),
                    ),
                  ),
                ],
              ),
            );
      final actions = [
        adaptiveDialogAction(
          focusNode: cautious ? defaultFocusNode : null,
          autofocus: cautious,
          isDefault: cautious,
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(RecordPromptChoice.justRecordNow),
          child: Text(l10n.recordNowOnly),
        ),
        adaptiveDialogAction(
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(RecordPromptChoice.justRecordLater),
          child: Text(
            suggestion == null
                ? l10n.recordLaterShowingOnly
                : l10n.recordOnlyLater(
                    laterShowingWhen(context, suggestion.start, now: now),
                  ),
          ),
        ),
        adaptiveDialogAction(
          focusNode: cautious ? null : defaultFocusNode,
          autofocus: !cautious,
          isDefault: !cautious,
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(RecordPromptChoice.alsoRecordLaterShowing),
          child: Text(
            suggestion == null
                ? l10n.recordNowAndLater
                : l10n.recordNowAnd(
                    laterShowingWhen(context, suggestion.start, now: now),
                  ),
          ),
        ),
      ];
      return AppUiIdiomResolver.isApple
          ? CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions,
            )
          : AlertDialog(
              // Wide enough on a TV for all three choices on one row.
              constraints: BoxConstraints(maxWidth: 760 * textScale),
              title: title,
              content: content,
              actions: actions,
            );
    },
  ).whenComplete(defaultFocusNode.dispose);
}

/// One airing on the Record prompt: a label, when and where it airs, its
/// description, scrolling when it runs past two lines.
class _ShowingCard extends StatelessWidget {
  static const _descriptionStyle = TextStyle(color: Colors.white70);
  static const _descriptionLines = 2;

  final String label;
  final String when;
  final double? progress;
  final String? progressLabel;
  final String description;

  /// Shown beside [label] with the recording mark, such as "Already set to
  /// record".
  final String? status;

  const _ShowingCard({
    required this.label,
    required this.when,
    required this.description,
    this.progress,
    this.progressLabel,
    this.status,
  });

  // The marquee keeps its full height even for one line, so it is used only
  // for a description that doesn't fit.
  Widget _description(BuildContext context, String text) {
    // The Cupertino dialog measures its content and scrolls it, which the
    // marquee can't take part in, so it gets the full text there.
    if (AppUiIdiomResolver.isApple) return Text(text, style: _descriptionStyle);
    // The marquee sizes its lines from the style it is given, so it gets the
    // dialog's full text style, not just the colour.
    final style = DefaultTextStyle.of(context).style.merge(_descriptionStyle);
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: _descriptionLines,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);
        final fits = !painter.didExceedMaxLines;
        painter.dispose();
        return fits
            ? Text(text, style: style)
            : MarqueeText(
                text: text,
                maxLines: _descriptionLines,
                style: style,
                millisPerPixel: kLiveTvDescriptionMarqueeMillisPerPixel,
                pauseDurationMs: 1600,
                showDotSeparator: false,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const accent = Colors.white70;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: AppRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 14,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Not upper-cased in code: that isn't locale-aware.
              Text(
                label,
                style: const TextStyle(
                  color: accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
              if (status != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.event_available_rounded,
                      size: 16,
                      color: LiveTvRecordingIcon.recordColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status!,
                      style: const TextStyle(color: accent, fontSize: 13),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            when,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (progress != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 4,
                      color: accent,
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                ),
                if (progressLabel != null) ...[
                  const SizedBox(width: 10),
                  Text(
                    progressLabel!,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ],
            ),
          ],
          if (description.trim().isNotEmpty) ...[
            const SizedBox(height: 8),
            _description(context, description.trim()),
          ],
        ],
      ),
    );
  }
}

/// A line under the future showing's card: a caution about the match, or a
/// confirmation.
class _PromptNote extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _PromptNote({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: TextStyle(color: color)),
        ),
      ],
    );
  }
}

/// Asks the plugin for a later showing of a program's episode. False when it
/// couldn't. The plugin joins a repeated request to the open one, so a retry
/// never schedules twice.
Future<bool> askForLaterShowing(String programId) async =>
    await _service?.requestCompleteShowing(programId) ?? false;

enum RecordAiringOutcome {
  /// Back on the prompt: nothing was recorded.
  cancelled,
  recorded,
  recordedWithLaterShowing,

  /// The airing records, but the later showing couldn't be requested.
  recordedLaterShowingFailed,

  /// Only the later showing was asked for, and it will record.
  laterShowingOnly,

  /// Only the later showing was asked for, and it couldn't be requested, so
  /// nothing records.
  laterShowingOnlyFailed,
}

/// The Record workflow for one airing, shared by the guide and the player.
///
/// Offers the prompt when [offersCompleteShowingFor] says so, runs
/// [createTimer] (which throws when the server refuses), and then asks for the
/// later showing if the user chose it. [stillValid] is checked after the
/// prompt, for a screen that may have moved on while it was open.
Future<RecordAiringOutcome> recordAiring({
  required BuildContext context,
  required String programId,
  required String programName,
  required DateTime programStart,
  required Map<String, dynamic> rawProgram,
  required Future<void> Function() createTimer,
  bool Function()? stillValid,
  String? channel,
}) async {
  RecordPromptChoice? choice;
  SuggestedShowing? suggestion;
  var offerSearch = offersCompleteShowingFor(rawProgram, programStart);
  if ((_service?.extendedSupported ?? false) &&
      canManageLiveTv() &&
      DateTime.now().isAfter(programStart.add(recordPromptGrace))) {
    final navigator = Navigator.of(context, rootNavigator: true);
    final loading = DialogRoute<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
    navigator.push(loading);
    CompleteShowingOptions options;
    try {
      options = await _service!
          .completeShowingOptions(programId)
          .timeout(
            const Duration(seconds: 3),
            onTimeout: () => const CompleteShowingOptions(),
          );
    } catch (_) {
      options = const CompleteShowingOptions();
    } finally {
      if (loading.isActive) navigator.removeRoute(loading);
    }
    if (!context.mounted || !(stillValid?.call() ?? true)) {
      return RecordAiringOutcome.cancelled;
    }
    // The server's answer decides how the showing was matched; the guide's
    // own episode numbers are only a fallback when it didn't answer.
    offerSearch = options.answered ? options.canSearch : offerSearch;
    suggestion = options.showing;
  }
  if (offerSearch || suggestion != null) {
    choice = await showRecordPrompt(
      context: context,
      programName: programName,
      airing: RecordPromptAiring.fromProgram(
        rawProgram,
        programStart,
        channel: channel,
      ),
      suggestion: suggestion,
      searchForCompleteShowing: offerSearch,
    );
    if (choice == null || !context.mounted || !(stillValid?.call() ?? true)) {
      return RecordAiringOutcome.cancelled;
    }
  }

  final laterOnly = choice == RecordPromptChoice.justRecordLater;
  if (!laterOnly) {
    await createTimer();
    if (choice != RecordPromptChoice.alsoRecordLaterShowing) {
      return RecordAiringOutcome.recorded;
    }
  }
  final scheduled = suggestion != null
      ? await _service?.scheduleSuggestedShowing(programId, suggestion) ?? false
      : await askForLaterShowing(programId);
  if (laterOnly) {
    return scheduled
        ? RecordAiringOutcome.laterShowingOnly
        : RecordAiringOutcome.laterShowingOnlyFailed;
  }
  return scheduled
      ? RecordAiringOutcome.recordedWithLaterShowing
      : RecordAiringOutcome.recordedLaterShowingFailed;
}

/// The snackbar for a finished [recordAiring], or null after a cancel.
String? recordAiringMessage(
  AppLocalizations l10n,
  RecordAiringOutcome outcome,
) => switch (outcome) {
  RecordAiringOutcome.cancelled => null,
  RecordAiringOutcome.recorded => l10n.programSetToRecord,
  RecordAiringOutcome.recordedWithLaterShowing => l10n.laterShowingRequested,
  RecordAiringOutcome.recordedLaterShowingFailed =>
    l10n.unableToRequestLaterShowing,
  RecordAiringOutcome.laterShowingOnly => l10n.laterShowingOnlyRequested,
  RecordAiringOutcome.laterShowingOnlyFailed =>
    l10n.unableToRequestLaterShowingOnly,
};
