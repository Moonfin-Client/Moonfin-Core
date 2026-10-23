import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/incomplete_recordings_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/clock_format.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../adaptive/adaptive_dialog.dart';
import '../media_badge.dart';
import '../overlay_sheet.dart';

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

/// "Thu 8:00 PM", in the user's clock format.
String formatShowingTime(BuildContext context, DateTime time) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  final use24Hour =
      GetIt.instance.isRegistered<UserPreferences>() &&
      GetIt.instance<UserPreferences>().get(UserPreferences.use24HourClock);
  return '${DateFormat.E(locale).format(time)} '
      '${formatClockTime(time, use24Hour: use24Hour)}';
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

enum RecordPromptChoice { alsoRecordLaterShowing, justRecordNow }

/// Asks whether to also record a later showing of a program that has already
/// started. Back records nothing and returns null.
Future<RecordPromptChoice?> showRecordPrompt({
  required BuildContext context,
  required String programName,
  SuggestedShowing? suggestion,
  bool searchForCompleteShowing = true,
}) {
  final l10n = AppLocalizations.of(context);
  final suggestedTime = suggestion == null
      ? null
      : '${DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag()).format(suggestion.start)} · ${formatShowingTime(context, suggestion.start)}';
  final uncertain = suggestion != null && !searchForCompleteShowing;
  final channel = suggestion == null
      ? ''
      : [
          suggestion.channelNumber,
          suggestion.channelName,
        ].whereType<String>().where((part) => part.trim().isNotEmpty).join(' ');
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

      final details = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.recordPromptAlreadyStarted,
            style: const TextStyle(color: Colors.white70),
          ),
          if (suggestion != null) ...[
            const SizedBox(height: 20),
            Text(
              uncertain ? l10n.possibleFutureShowing : l10n.knownFutureShowing,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$suggestedTime${channel.isEmpty ? '' : ' ($channel)'}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              suggestion.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            if (suggestion.description.trim().isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                suggestion.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ],
      );
      final question = Text(
        suggestion == null
            ? l10n.recordCompleteShowingQuestion
            : l10n.recordThisShowingQuestion,
        style: const TextStyle(color: Colors.white),
      );
      final title = Text(
        programName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
      final content = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (AppUiIdiomResolver.isApple)
            details
          else
            Flexible(child: SingleChildScrollView(child: details)),
          const SizedBox(height: 24),
          question,
        ],
      );
      final actions = [
        adaptiveDialogAction(
          focusNode: uncertain ? null : defaultFocusNode,
          autofocus: !uncertain,
          isDefault: !uncertain,
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(RecordPromptChoice.alsoRecordLaterShowing),
          child: Text(l10n.alsoRecordLaterShowing),
        ),
        adaptiveDialogAction(
          focusNode: uncertain ? defaultFocusNode : null,
          autofocus: uncertain,
          isDefault: uncertain,
          focusRingColor: AppColorScheme.accent,
          onPressed: () => choose(RecordPromptChoice.justRecordNow),
          child: Text(l10n.justRecordNow),
        ),
      ];
      return AppUiIdiomResolver.isApple
          ? CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions,
            )
          : AlertDialog(
              constraints: const BoxConstraints(maxWidth: 640),
              title: title,
              content: content,
              actions: actions,
            );
    },
  ).whenComplete(defaultFocusNode.dispose);
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
    final options = await _service!
        .completeShowingOptions(programId)
        .timeout(
          const Duration(seconds: 3),
          onTimeout: () => const CompleteShowingOptions(),
        );
    if (loading.isActive) navigator.removeRoute(loading);
    if (!context.mounted || !(stillValid?.call() ?? true)) {
      return RecordAiringOutcome.cancelled;
    }
    offerSearch = offerSearch || options.canSearch;
    suggestion = options.showing;
  }
  if (offerSearch || suggestion != null) {
    choice = await showRecordPrompt(
      context: context,
      programName: programName,
      suggestion: suggestion,
      searchForCompleteShowing: offerSearch,
    );
    if (choice == null || !context.mounted || !(stillValid?.call() ?? true)) {
      return RecordAiringOutcome.cancelled;
    }
  }

  await createTimer();
  if (choice != RecordPromptChoice.alsoRecordLaterShowing) {
    return RecordAiringOutcome.recorded;
  }
  final scheduled = suggestion != null
      ? await _service?.scheduleSuggestedShowing(programId, suggestion) ?? false
      : await askForLaterShowing(programId);
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
};
