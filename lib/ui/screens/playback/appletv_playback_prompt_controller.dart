import 'dart:async';

import '../../../data/models/media_segment.dart';
import '../../../data/services/media_segment_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';

/// The queue facts the controller needs to make one decision. The host builds
/// a fresh snapshot per call so every decision reads the live queue.
class AppleTvQueueSnapshot {
  const AppleTvQueueSnapshot({
    required this.currentIndex,
    required this.length,
    required this.hasNext,
    this.currentId,
    this.nextId,
    this.nextExists = false,
    this.nextEligible = false,
    this.currentIsPreroll = false,
    this.nextTitle = '',
    this.nextEpisodeInfo = '',
    this.nextImageUrl = '',
  });

  final int currentIndex;
  final int length;
  final bool hasNext;
  final String? currentId;
  final String? nextId;
  final bool nextExists;
  final bool nextEligible;
  final bool currentIsPreroll;
  final String nextTitle;
  final String nextEpisodeInfo;
  final String nextImageUrl;
}

/// Side effects the controller can request. The host wires these to the
/// backend channel, the playback manager, and the exit flow, which keeps the
/// controller itself free of channels and DI so it unit-tests anywhere.
abstract class AppleTvPromptCommands {
  Future<void> showNextUp({
    required String title,
    required String episodeInfo,
    required String imageUrl,
    required bool isMinimal,
    required String countdownStyle,
    required int timeoutMs,
  });

  Future<void> hideNextUp();

  /// Presents the native Still Watching modal. Returns false when the modal
  /// couldn't be presented so the controller can fail open instead of
  /// waiting forever for an answer that can never come.
  Future<bool> showStillWatching();

  /// The segment bounds let the native side render the countdown ring and
  /// timer off its own playback position, matching SkipSegmentOverlay.
  Future<void> showSkipSegment(
    String segmentDisplayName, {
    required String countdownStyle,
    required int segmentStartMs,
    required int segmentEndMs,
  });

  Future<void> hideSkipSegment();

  Future<void> seekTo(Duration position);

  void pause();

  void resume();

  /// Advances via the playback manager, which re-reads the live queue. The
  /// controller never captures a target item, matching the Flutter player.
  Future<void> advanceNext();

  Future<void> exitPlayback();

  void setSuppressAutoNext(bool value);

  void markPlayed(String itemId);
}

/// Drives the native tvOS Next Up card, skip segment button, and Still
/// Watching prompt with the same logic the Flutter video player uses, so the
/// two players behave identically. The native side only renders.
class AppleTvPlaybackPromptController {
  AppleTvPlaybackPromptController({
    required UserPreferences prefs,
    required AppleTvPromptCommands commands,
    required AppleTvQueueSnapshot Function() queueSnapshot,
    required MediaSegmentService? Function() segmentService,
    DateTime Function()? now,
  }) : _prefs = prefs,
       _commands = commands,
       _queueSnapshot = queueSnapshot,
       _segmentService = segmentService,
       _now = now ?? DateTime.now;

  static const _seekPromptSuppressionDuration = Duration(milliseconds: 1200);

  final UserPreferences _prefs;
  final AppleTvPromptCommands _commands;
  final AppleTvQueueSnapshot Function() _queueSnapshot;
  final MediaSegmentService? Function() _segmentService;
  final DateTime Function() _now;

  bool _showNextUp = false;
  bool _nextUpDismissed = false;
  bool _isNextUpAdvancing = false;
  int consecutiveEpisodes = 0;
  DateTime? _suppressSeekPromptsUntil;
  Timer? _nextUpTimer;
  Timer? _skipSegmentAutoHideTimer;
  bool _skipSegmentVisible = false;
  Duration? _skipTo;
  MediaSegmentType? _skipSegmentType;
  Completer<bool>? _stillWatchingCompleter;
  bool _disposed = false;

  void onPositionTick(Duration position, Duration duration) {
    if (_disposed) return;
    _checkSegments(position);
    _checkNextUp(position, duration);
  }

  void _checkNextUp(Duration position, Duration duration) {
    if (!_shouldShowNextUp()) return;

    final behavior = _prefs.get(UserPreferences.nextUpBehavior);
    if (duration <= Duration.zero) return;

    final remaining = duration - position;
    final threshold = behavior == NextUpBehavior.extended
        ? const Duration(seconds: 1)
        : const Duration(milliseconds: 500);

    final activeSegment = _segmentService()?.activeSegment;
    final inOutro = activeSegment?.type == MediaSegmentType.outro;
    if (inOutro && remaining > threshold) {
      return;
    }

    if (remaining <= threshold) {
      _presentNextUp();
    }
  }

  bool _shouldShowNextUp() {
    final behavior = _prefs.get(UserPreferences.nextUpBehavior);
    if (_areSeekPromptsSuppressed() ||
        behavior == NextUpBehavior.disabled ||
        _nextUpDismissed ||
        _showNextUp) {
      return false;
    }

    final snapshot = _queueSnapshot();
    if (snapshot.currentIsPreroll) {
      return false;
    }

    return _hasDistinctNext(snapshot);
  }

  bool _hasDistinctNext(AppleTvQueueSnapshot snapshot) {
    if (!snapshot.hasNext) {
      return false;
    }

    // Repeat-all wraparound counts as no real next episode for Next Up.
    if (snapshot.currentIndex < 0 ||
        snapshot.currentIndex >= snapshot.length - 1) {
      return false;
    }

    if (!snapshot.nextExists) {
      return false;
    }

    if (!snapshot.nextEligible) {
      return false;
    }

    final currentId = snapshot.currentId;
    final nextId = snapshot.nextId;
    if (currentId != null && nextId != null && currentId == nextId) {
      return false;
    }

    return true;
  }

  void _presentNextUp() {
    if (!_shouldShowNextUp()) return;

    final snapshot = _queueSnapshot();
    if (!_hasDistinctNext(snapshot)) return;

    final behavior = _prefs.get(UserPreferences.nextUpBehavior);
    final isMinimal = behavior == NextUpBehavior.minimal;
    final timeoutMs = _prefs.get(UserPreferences.nextUpTimeout);

    _commands.setSuppressAutoNext(true);
    _showNextUp = true;
    _clearSkipSegment();
    unawaited(
      _commands.showNextUp(
        title: snapshot.nextTitle,
        episodeInfo: snapshot.nextEpisodeInfo,
        imageUrl: isMinimal ? '' : snapshot.nextImageUrl,
        isMinimal: isMinimal,
        countdownStyle: _prefs.get(UserPreferences.mediaSegmentCountdown).name,
        timeoutMs: timeoutMs,
      ),
    );

    _nextUpTimer?.cancel();
    if (timeoutMs > 0) {
      _nextUpTimer = Timer(Duration(milliseconds: timeoutMs), () {
        if (_disposed || !_showNextUp) return;
        if (_prefs.get(UserPreferences.autoplayNextEpisode)) {
          unawaited(handleNextUpPlay());
        } else {
          handleNextUpCancel();
        }
      });
    }
  }

  Future<void> handleNextUpPlay() async {
    if (_isNextUpAdvancing || _disposed) return;
    if (!_hasDistinctNext(_queueSnapshot())) {
      handleNextUpCancel();
      return;
    }
    _isNextUpAdvancing = true;
    _nextUpTimer?.cancel();
    _showNextUp = false;
    unawaited(_commands.hideNextUp());
    try {
      final proceed = await _checkStillWatching();
      if (!proceed || _disposed) return;
      await _commands.advanceNext();
    } finally {
      _isNextUpAdvancing = false;
    }
  }

  void handleNextUpDismiss() {
    if (_disposed) return;
    _commands.setSuppressAutoNext(false);
    _nextUpTimer?.cancel();
    _showNextUp = false;
    _nextUpDismissed = true;
    unawaited(_commands.hideNextUp());
  }

  void handleNextUpCancel() {
    if (_disposed) return;
    _nextUpTimer?.cancel();
    _showNextUp = false;
    _nextUpDismissed = true;
    unawaited(_commands.hideNextUp());
    unawaited(_commands.exitPlayback());
  }

  /// A viewer reaching for the remote has answered the prompt's question.
  void _noteViewerActivity() => consecutiveEpisodes = 0;

  /// Returns true when the advance may proceed. Playback is paused before the
  /// prompt shows and the queue never advances until the user answers, so the
  /// next episode can never start playing under the modal.
  Future<bool> _checkStillWatching() async {
    final behavior = _prefs.get(UserPreferences.stillWatchingBehavior);
    if (behavior == StillWatchingBehavior.disabled) return true;
    if (consecutiveEpisodes < behavior.episodes) return true;

    _commands.pause();
    final presented = await _commands.showStillWatching();
    if (_disposed) return false;
    if (!presented) {
      // The modal couldn't present (something else was on screen). Fail
      // open: keep playing and keep the counter so the prompt retries after
      // the next episode.
      _commands.resume();
      return true;
    }

    final completer = Completer<bool>();
    _stillWatchingCompleter = completer;
    final shouldContinue = await completer.future;
    _stillWatchingCompleter = null;
    if (_disposed) return false;

    if (shouldContinue) {
      consecutiveEpisodes = 0;
      _commands.resume();
      return true;
    }
    unawaited(_commands.exitPlayback());
    return false;
  }

  /// Resolves a pending Still Watching prompt from the native button events.
  void resolveStillWatching({required bool shouldContinue}) {
    final completer = _stillWatchingCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.complete(shouldContinue);
    }
  }

  void onQueueChanged() {
    if (_disposed) return;
    _commands.setSuppressAutoNext(false);
    consecutiveEpisodes++;
    _nextUpDismissed = false;
    _nextUpTimer?.cancel();
    _showNextUp = false;
    unawaited(_commands.hideNextUp());
    _clearSkipSegment();
  }

  void _checkSegments(Duration position) {
    final service = _segmentService();
    if (service == null) return;

    final result = service.checkPosition(position);
    final replaceSkipOutroWithNextUp = _prefs.get(
      UserPreferences.replaceSkipOutroWithNextUp,
    );

    if (result.shouldSkip && result.skipTo != null) {
      final isOutro = result.segment?.type == MediaSegmentType.outro;
      if (replaceSkipOutroWithNextUp && isOutro && _showNextUp) {
        return;
      }
      if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUp()) {
        unawaited(_commands.seekTo(result.skipTo!));
        _presentNextUp();
        return;
      }
      if (isOutro && !_hasDistinctNext(_queueSnapshot())) {
        unawaited(_commands.exitPlayback());
        return;
      }
      unawaited(_commands.seekTo(result.skipTo!));
      _clearSkipSegment();
      return;
    }

    if (_areSeekPromptsSuppressed()) {
      if (_skipSegmentVisible) {
        _clearSkipSegment();
      }
      return;
    }

    if (result.shouldAsk && result.isNew && result.segment != null) {
      final isOutro = result.segment!.type == MediaSegmentType.outro;
      if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUp()) {
        _presentNextUp();
        return;
      }
      _skipSegmentVisible = true;
      _skipTo = result.skipTo;
      _skipSegmentType = result.segment!.type;
      unawaited(
        _commands.showSkipSegment(
          result.segment!.type.displayName,
          countdownStyle: _prefs
              .get(UserPreferences.mediaSegmentCountdown)
              .name,
          segmentStartMs: result.segment!.start.inMilliseconds,
          segmentEndMs: result.segment!.end.inMilliseconds,
        ),
      );
      final autoHide = _prefs.get(UserPreferences.mediaSegmentAutoHide);
      if (autoHide.seconds > 0) {
        _skipSegmentAutoHideTimer = Timer(
          Duration(seconds: autoHide.seconds),
          () {
            if (_disposed || !_skipSegmentVisible) return;
            _clearSkipSegment();
          },
        );
      }
    } else if (result.isNone && _skipSegmentVisible) {
      _clearSkipSegment();
    }
  }

  void handleSkipSegment() {
    if (_disposed) return;
    _noteViewerActivity();

    final replaceSkipOutroWithNextUp = _prefs.get(
      UserPreferences.replaceSkipOutroWithNextUp,
    );
    final isOutro =
        _skipSegmentType == MediaSegmentType.outro ||
        _segmentService()?.activeSegment?.type == MediaSegmentType.outro;

    if (isOutro) {
      final currentId = _queueSnapshot().currentId;
      if (currentId != null && currentId.isNotEmpty) {
        _commands.markPlayed(currentId);
      }
    }

    if (replaceSkipOutroWithNextUp && isOutro && _shouldShowNextUp()) {
      final skipTo = _skipTo;
      if (skipTo != null) {
        unawaited(_commands.seekTo(skipTo));
      }
      _presentNextUp();
      return;
    }

    if (isOutro && !_hasDistinctNext(_queueSnapshot())) {
      unawaited(_commands.exitPlayback());
      return;
    }

    final skipTo = _skipTo;
    if (skipTo != null) {
      unawaited(_commands.seekTo(skipTo));
    }
    _clearSkipSegment();
  }

  /// Called after any user initiated seek, native or Dart driven, so a jump
  /// through a segment doesn't pop stale prompts.
  void onUserSeeked() {
    if (_disposed) return;
    _noteViewerActivity();

    final until = _now().add(_seekPromptSuppressionDuration);
    final currentUntil = _suppressSeekPromptsUntil;
    if (currentUntil == null || until.isAfter(currentUntil)) {
      _suppressSeekPromptsUntil = until;
    }

    final hadSkipPrompt = _skipSegmentVisible;
    final hadNextUpPrompt = _showNextUp;
    if (!hadSkipPrompt && !hadNextUpPrompt) return;

    if (hadSkipPrompt) {
      _clearSkipSegment();
    }
    if (hadNextUpPrompt) {
      _nextUpTimer?.cancel();
      _showNextUp = false;
      unawaited(_commands.hideNextUp());
      _commands.setSuppressAutoNext(false);
    }
  }

  bool _areSeekPromptsSuppressed() {
    final until = _suppressSeekPromptsUntil;
    if (until == null) return false;
    return _now().isBefore(until);
  }

  void _clearSkipSegmentState() {
    _skipSegmentAutoHideTimer?.cancel();
    _skipSegmentAutoHideTimer = null;
    _skipSegmentVisible = false;
    _skipTo = null;
    _skipSegmentType = null;
  }

  void _clearSkipSegment() {
    _clearSkipSegmentState();
    unawaited(_commands.hideSkipSegment());
  }

  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _nextUpTimer?.cancel();
    _nextUpTimer = null;
    _skipSegmentAutoHideTimer?.cancel();
    _skipSegmentAutoHideTimer = null;
    final completer = _stillWatchingCompleter;
    if (completer != null && !completer.isCompleted) {
      // The awaiting code checks the disposed flag after this resolves, so
      // this neither resumes nor advances anything.
      completer.complete(false);
    }
    _stillWatchingCompleter = null;
  }
}
