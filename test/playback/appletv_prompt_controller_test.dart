import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/media_segment_service.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/appletv_playback_prompt_controller.dart';

import '../util/media_segment_fakes.dart';

class _FakeCommands implements AppleTvPromptCommands {
  final calls = <String>[];
  bool stillWatchingPresents = true;
  String? lastNextUpTitle;
  String? lastNextUpImageUrl;
  bool? lastNextUpIsMinimal;
  int? lastNextUpTimeoutMs;
  String? lastCountdownStyle;
  String? lastSkipLabel;
  String? lastSkipCountdownStyle;
  int? lastSkipSegmentStartMs;
  int? lastSkipSegmentEndMs;
  Duration? lastSeekTarget;
  String? lastMarkedPlayedId;
  bool suppressAutoNext = false;

  int count(String name) => calls.where((c) => c == name).length;

  @override
  Future<void> showNextUp({
    required String title,
    required String episodeInfo,
    required String imageUrl,
    required bool isMinimal,
    required String countdownStyle,
    required int timeoutMs,
  }) async {
    calls.add('showNextUp');
    lastNextUpTitle = title;
    lastNextUpImageUrl = imageUrl;
    lastNextUpIsMinimal = isMinimal;
    lastNextUpTimeoutMs = timeoutMs;
    lastCountdownStyle = countdownStyle;
  }

  @override
  Future<void> hideNextUp() async => calls.add('hideNextUp');

  @override
  Future<bool> showStillWatching() async {
    calls.add('showStillWatching');
    return stillWatchingPresents;
  }

  @override
  Future<void> showSkipSegment(
    String segmentDisplayName, {
    required String countdownStyle,
    required int segmentStartMs,
    required int segmentEndMs,
  }) async {
    calls.add('showSkipSegment');
    lastSkipLabel = segmentDisplayName;
    lastSkipCountdownStyle = countdownStyle;
    lastSkipSegmentStartMs = segmentStartMs;
    lastSkipSegmentEndMs = segmentEndMs;
  }

  @override
  Future<void> hideSkipSegment() async => calls.add('hideSkipSegment');

  @override
  Future<void> seekTo(Duration position) async {
    calls.add('seekTo');
    lastSeekTarget = position;
  }

  @override
  void pause() => calls.add('pause');

  @override
  void resume() => calls.add('resume');

  @override
  Future<void> advanceNext() async => calls.add('advanceNext');

  @override
  Future<void> exitPlayback() async => calls.add('exitPlayback');

  @override
  void setSuppressAutoNext(bool value) {
    calls.add('setSuppressAutoNext:$value');
    suppressAutoNext = value;
  }

  @override
  void markPlayed(String itemId) {
    calls.add('markPlayed');
    lastMarkedPlayedId = itemId;
  }
}

AppleTvQueueSnapshot _snapshot({
  int currentIndex = 0,
  int length = 3,
  bool hasNext = true,
  String? currentId = 'ep1',
  String? nextId = 'ep2',
  bool nextExists = true,
  bool nextEligible = true,
  bool currentIsPreroll = false,
  String nextTitle = 'Episode 2',
  String nextImageUrl = 'http://image/2',
}) {
  return AppleTvQueueSnapshot(
    currentIndex: currentIndex,
    length: length,
    hasNext: hasNext,
    currentId: currentId,
    nextId: nextId,
    nextExists: nextExists,
    nextEligible: nextEligible,
    currentIsPreroll: currentIsPreroll,
    nextTitle: nextTitle,
    nextEpisodeInfo: 'S1:E2',
    nextImageUrl: nextImageUrl,
  );
}

class _Harness {
  _Harness(this.prefs) {
    controller = AppleTvPlaybackPromptController(
      prefs: prefs,
      commands: commands,
      queueSnapshot: () => snapshot,
      segmentService: () => segmentService,
      now: () => now,
    );
  }

  final UserPreferences prefs;
  final commands = _FakeCommands();
  AppleTvQueueSnapshot snapshot = _snapshot();
  MediaSegmentService? segmentService;
  DateTime now = DateTime(2026, 1, 1);
  late final AppleTvPlaybackPromptController controller;

  void tick({required int remainingMs, int durationMs = 60000}) {
    controller.onPositionTick(
      Duration(milliseconds: durationMs - remainingMs),
      Duration(milliseconds: durationMs),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Next Up trigger thresholds', () {
    test('extended shows at 1000ms remaining and not at 1001ms', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 1001);
      expect(h.commands.count('showNextUp'), 0);

      h.tick(remainingMs: 1000);
      expect(h.commands.count('showNextUp'), 1);
      expect(h.commands.lastNextUpIsMinimal, isFalse);
      expect(h.commands.lastNextUpImageUrl, 'http://image/2');
      expect(h.commands.lastNextUpTimeoutMs, 7000);
    });

    test('minimal shows at 500ms remaining, without an image', () async {
      final prefs = await testPrefs();
      await prefs.set(UserPreferences.nextUpBehavior, NextUpBehavior.minimal);
      final h = _Harness(prefs);

      h.tick(remainingMs: 501);
      expect(h.commands.count('showNextUp'), 0);

      h.tick(remainingMs: 500);
      expect(h.commands.count('showNextUp'), 1);
      expect(h.commands.lastNextUpIsMinimal, isTrue);
      expect(h.commands.lastNextUpImageUrl, isEmpty);
    });

    test('countdown style comes from the media segment countdown pref',
        () async {
      final prefs = await testPrefs();
      await prefs.set(
        UserPreferences.mediaSegmentCountdown,
        MediaSegmentCountdown.timer,
      );
      final h = _Harness(prefs);

      h.tick(remainingMs: 800);
      expect(h.commands.lastCountdownStyle, 'timer');
    });
  });

  group('Next Up show guards', () {
    test('disabled behavior never shows', () async {
      final prefs = await testPrefs();
      await prefs.set(UserPreferences.nextUpBehavior, NextUpBehavior.disabled);
      final h = _Harness(prefs);

      h.tick(remainingMs: 100);
      expect(h.commands.count('showNextUp'), 0);
    });

    test('dismissed stays hidden for the rest of the episode', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      h.controller.handleNextUpDismiss();
      h.tick(remainingMs: 800);
      expect(h.commands.count('showNextUp'), 1);
    });

    test('already visible card does not re-show', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      h.tick(remainingMs: 800);
      expect(h.commands.count('showNextUp'), 1);
    });

    test('preroll, missing next, wraparound, same id, and ineligible next '
        'all block the card', () async {
      final cases = <AppleTvQueueSnapshot>[
        _snapshot(currentIsPreroll: true),
        _snapshot(hasNext: false),
        _snapshot(nextExists: false),
        _snapshot(currentIndex: 2, length: 3),
        _snapshot(currentId: 'ep1', nextId: 'ep1'),
        _snapshot(nextEligible: false),
      ];
      for (final snapshot in cases) {
        final h = _Harness(await testPrefs());
        h.snapshot = snapshot;
        h.tick(remainingMs: 100);
        expect(
          h.commands.count('showNextUp'),
          0,
          reason: 'snapshot should have blocked the card',
        );
      }
    });
  });

  group('suppressAutoNext lifecycle', () {
    test('set on present, cleared on dismiss', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      expect(h.commands.suppressAutoNext, isTrue);

      h.controller.handleNextUpDismiss();
      expect(h.commands.suppressAutoNext, isFalse);
    });

    test('cleared on queue change along with card state', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      expect(h.commands.suppressAutoNext, isTrue);

      h.controller.onQueueChanged();
      expect(h.commands.suppressAutoNext, isFalse);
      expect(h.commands.count('hideNextUp'), greaterThan(0));
    });
  });

  group('countdown timeout', () {
    test('autoplay on advances after the configured timeout', () async {
      final prefs = await testPrefs();
      final h = _Harness(prefs);

      fakeAsync((async) {
        h.tick(remainingMs: 900);
        async.elapse(const Duration(milliseconds: 6999));
        async.flushMicrotasks();
        expect(h.commands.count('advanceNext'), 0);

        async.elapse(const Duration(milliseconds: 1));
        async.flushMicrotasks();
        expect(h.commands.count('advanceNext'), 1);
      });
    });

    test('autoplay off exits playback on timeout', () async {
      final prefs = await testPrefs();
      await prefs.set(UserPreferences.autoplayNextEpisode, false);
      final h = _Harness(prefs);

      fakeAsync((async) {
        h.tick(remainingMs: 900);
        async.elapse(const Duration(milliseconds: 7000));
        async.flushMicrotasks();
        expect(h.commands.count('advanceNext'), 0);
        expect(h.commands.count('exitPlayback'), 1);
      });
    });

    test('timeout of zero never fires a timer', () async {
      final prefs = await testPrefs();
      await prefs.set(UserPreferences.nextUpTimeout, 0);
      final h = _Harness(prefs);

      fakeAsync((async) {
        h.tick(remainingMs: 900);
        async.elapse(const Duration(minutes: 5));
        async.flushMicrotasks();
        expect(h.commands.count('advanceNext'), 0);
        expect(h.commands.count('exitPlayback'), 0);
      });
    });
  });

  group('play and cancel paths', () {
    test('play hides the card and advances through the live queue', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      await h.controller.handleNextUpPlay();

      expect(h.commands.count('hideNextUp'), greaterThan(0));
      expect(h.commands.count('advanceNext'), 1);
    });

    test('play falls back to cancel when the next item disappeared', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      h.snapshot = _snapshot(hasNext: false);
      await h.controller.handleNextUpPlay();

      expect(h.commands.count('advanceNext'), 0);
      expect(h.commands.count('exitPlayback'), 1);
    });

    test('rapid double play advances once', () async {
      final h = _Harness(await testPrefs());
      await h.prefs.set(
        UserPreferences.stillWatchingBehavior,
        StillWatchingBehavior.short_,
      );
      h.controller.consecutiveEpisodes = 2;

      h.tick(remainingMs: 900);
      final first = h.controller.handleNextUpPlay();
      final second = h.controller.handleNextUpPlay();
      await Future<void>.delayed(Duration.zero);
      h.controller.resolveStillWatching(shouldContinue: true);
      await first;
      await second;

      expect(h.commands.count('advanceNext'), 1);
    });

    test('cancel exits playback', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      h.controller.handleNextUpCancel();

      expect(h.commands.count('exitPlayback'), 1);
    });
  });

  group('Still Watching', () {
    Future<_Harness> harnessAtThreshold() async {
      final prefs = await testPrefs();
      await prefs.set(
        UserPreferences.stillWatchingBehavior,
        StillWatchingBehavior.short_,
      );
      final h = _Harness(prefs);
      h.controller.consecutiveEpisodes = 2;
      return h;
    }

    test('pauses before the prompt and never advances until answered',
        () async {
      final h = await harnessAtThreshold();

      h.tick(remainingMs: 900);
      final play = h.controller.handleNextUpPlay();
      await Future<void>.delayed(Duration.zero);

      expect(h.commands.calls.indexOf('pause'), isNonNegative);
      expect(
        h.commands.calls.indexOf('pause'),
        lessThan(h.commands.calls.indexOf('showStillWatching')),
      );
      expect(h.commands.count('advanceNext'), 0);

      h.controller.resolveStillWatching(shouldContinue: true);
      await play;

      expect(h.commands.count('resume'), 1);
      expect(h.commands.count('advanceNext'), 1);
      expect(h.controller.consecutiveEpisodes, 0);
    });

    test('stop exits without advancing', () async {
      final h = await harnessAtThreshold();

      h.tick(remainingMs: 900);
      final play = h.controller.handleNextUpPlay();
      await Future<void>.delayed(Duration.zero);

      h.controller.resolveStillWatching(shouldContinue: false);
      await play;

      expect(h.commands.count('advanceNext'), 0);
      expect(h.commands.count('resume'), 0);
      expect(h.commands.count('exitPlayback'), 1);
    });

    test('below the episode threshold no prompt shows', () async {
      final prefs = await testPrefs();
      await prefs.set(
        UserPreferences.stillWatchingBehavior,
        StillWatchingBehavior.short_,
      );
      final h = _Harness(prefs);
      h.controller.consecutiveEpisodes = 1;

      h.tick(remainingMs: 900);
      await h.controller.handleNextUpPlay();

      expect(h.commands.count('showStillWatching'), 0);
      expect(h.commands.count('advanceNext'), 1);
    });

    test('fails open when the modal cannot present, keeping the counter',
        () async {
      final h = await harnessAtThreshold();
      h.commands.stillWatchingPresents = false;

      h.tick(remainingMs: 900);
      await h.controller.handleNextUpPlay();

      expect(h.commands.count('resume'), 1);
      expect(h.commands.count('advanceNext'), 1);
      expect(h.controller.consecutiveEpisodes, 2);
    });

    test('counter increments on queue change and resets only on continue',
        () async {
      final h = _Harness(await testPrefs());

      h.controller.onQueueChanged();
      h.controller.onQueueChanged();
      expect(h.controller.consecutiveEpisodes, 2);
    });

    test('dispose during a pending prompt neither resumes nor advances',
        () async {
      final h = await harnessAtThreshold();

      h.tick(remainingMs: 900);
      final play = h.controller.handleNextUpPlay();
      await Future<void>.delayed(Duration.zero);

      h.controller.dispose();
      await play;

      expect(h.commands.count('advanceNext'), 0);
      expect(h.commands.count('resume'), 0);
      expect(h.commands.count('exitPlayback'), 0);
    });
  });

  group('Still Watching activity reset', () {
    test('seeking says the viewer is awake', () async {
      final h = _Harness(await testPrefs());
      h.controller.consecutiveEpisodes = 2;

      h.controller.onUserSeeked();

      expect(h.controller.consecutiveEpisodes, 0);
    });

    test('skipping a segment says the viewer is awake', () async {
      final h = _Harness(await testPrefs());
      h.controller.consecutiveEpisodes = 2;

      h.controller.handleSkipSegment();

      expect(h.controller.consecutiveEpisodes, 0);
    });

    test('an episode that plays itself out still counts', () async {
      final h = _Harness(await testPrefs());

      h.controller.onQueueChanged();
      h.controller.onQueueChanged();

      expect(h.controller.consecutiveEpisodes, 2);
    });
  });

  group('seek suppression', () {
    test('a seek hides the card, clears suppressAutoNext, and blocks a '
        're-show for 1200ms', () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      expect(h.commands.suppressAutoNext, isTrue);

      h.controller.onUserSeeked();
      expect(h.commands.suppressAutoNext, isFalse);
      expect(h.commands.count('hideNextUp'), greaterThan(0));

      h.now = h.now.add(const Duration(milliseconds: 1199));
      h.tick(remainingMs: 900);
      expect(h.commands.count('showNextUp'), 1);

      h.now = h.now.add(const Duration(milliseconds: 2));
      h.tick(remainingMs: 900);
      expect(h.commands.count('showNextUp'), 2);
    });
  });

  group('stale card regression', () {
    test('queue change hides the card and the next episode presents fresh',
        () async {
      final h = _Harness(await testPrefs());

      h.tick(remainingMs: 900);
      expect(h.commands.lastNextUpTitle, 'Episode 2');

      h.controller.onQueueChanged();
      expect(h.commands.count('hideNextUp'), greaterThan(0));

      h.snapshot = _snapshot(
        currentIndex: 1,
        currentId: 'ep2',
        nextId: 'ep3',
        nextTitle: 'Episode 3',
      );
      h.tick(remainingMs: 900);
      expect(h.commands.count('showNextUp'), 2);
      expect(h.commands.lastNextUpTitle, 'Episode 3');
    });
  });

  group('media segments', () {
    test('an ask intro shows the button and leaving the segment hides it',
        () async {
      final prefs = await testPrefs();
      final h = _Harness(prefs);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(id: 's1', type: 'Intro', startMs: 5000, endMs: 65000),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 6000),
        const Duration(minutes: 40),
      );
      expect(h.commands.count('showSkipSegment'), 1);
      expect(h.commands.lastSkipLabel, 'Intro');
      expect(h.commands.lastSkipCountdownStyle, isNotEmpty);
      expect(h.commands.lastSkipSegmentStartMs, 5000);
      expect(h.commands.lastSkipSegmentEndMs, 65000);

      h.controller.onPositionTick(
        const Duration(milliseconds: 66000),
        const Duration(minutes: 40),
      );
      expect(h.commands.count('hideSkipSegment'), greaterThan(0));
    });

    test('an auto-skip intro seeks to the segment end', () async {
      final prefs = await testPrefs();
      await prefs.set(
        UserPreferences.mediaSegmentActions,
        'intro:skip,outro:askToSkip',
      );
      final h = _Harness(prefs);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(id: 's1', type: 'Intro', startMs: 5000, endMs: 65000),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 6000),
        const Duration(minutes: 40),
      );
      expect(h.commands.count('seekTo'), 1);
      expect(h.commands.lastSeekTarget, const Duration(milliseconds: 65000));
      expect(h.commands.count('showSkipSegment'), 0);
    });

    test('skipping an outro marks the item played and seeks', () async {
      final prefs = await testPrefs();
      final h = _Harness(prefs);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(
          id: 's1',
          type: 'Outro',
          startMs: 2300000,
          endMs: 2380000,
        ),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 2310000),
        const Duration(milliseconds: 2400000),
      );
      expect(h.commands.count('showSkipSegment'), 1);

      h.controller.handleSkipSegment();
      expect(h.commands.count('markPlayed'), 1);
      expect(h.commands.lastMarkedPlayedId, 'ep1');
      expect(h.commands.lastSeekTarget, const Duration(milliseconds: 2380000));
    });

    test('skipping an outro with no next item exits playback', () async {
      final prefs = await testPrefs();
      final h = _Harness(prefs);
      h.snapshot = _snapshot(hasNext: false);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(
          id: 's1',
          type: 'Outro',
          startMs: 2300000,
          endMs: 2380000,
        ),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 2310000),
        const Duration(milliseconds: 2400000),
      );
      h.controller.handleSkipSegment();

      expect(h.commands.count('markPlayed'), 1);
      expect(h.commands.count('exitPlayback'), 1);
      expect(h.commands.count('advanceNext'), 0);
    });

    test('replace outro with next up presents the card instead of skipping',
        () async {
      final prefs = await testPrefs();
      await prefs.set(UserPreferences.replaceSkipOutroWithNextUp, true);
      final h = _Harness(prefs);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(
          id: 's1',
          type: 'Outro',
          startMs: 2300000,
          endMs: 2380000,
        ),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 2310000),
        const Duration(milliseconds: 2400000),
      );

      expect(h.commands.count('showSkipSegment'), 0);
      expect(h.commands.count('showNextUp'), 1);
    });

    test('outro deferral holds the card until the end threshold', () async {
      final prefs = await testPrefs();
      final h = _Harness(prefs);
      h.segmentService = await segmentServiceWith(prefs, [
        segmentJson(
          id: 's1',
          type: 'Outro',
          startMs: 2300000,
          endMs: 2400000,
        ),
      ]);

      h.controller.onPositionTick(
        const Duration(milliseconds: 2310000),
        const Duration(milliseconds: 2400000),
      );
      expect(h.commands.count('showNextUp'), 0);

      h.controller.onPositionTick(
        const Duration(milliseconds: 2399200),
        const Duration(milliseconds: 2400000),
      );
      expect(h.commands.count('showNextUp'), 1);
    });
  });
}
