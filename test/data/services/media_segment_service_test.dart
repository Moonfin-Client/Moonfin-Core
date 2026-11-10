import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/data/services/media_segment_service.dart';
import 'package:moonfin/preference/user_preferences.dart';

import '../../util/media_segment_fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;

  setUp(() async {
    prefs = await testPrefs();
  });

  Future<MediaSegmentService> service(
    List<Map<String, dynamic>> segments, {
    String actions = 'intro:skip,outro:skip',
  }) async {
    await prefs.set(UserPreferences.mediaSegmentActions, actions);
    return segmentServiceWith(prefs, segments);
  }

  // An intro ending at 90.0004s, so that a landing on 90.000s is still inside.
  final intro = segmentJson(
    id: 'intro',
    type: 'Intro',
    startMs: 5000,
    endTicks: 900004000,
  );

  group('MediaSegmentService auto-skip', () {
    test('skips to the first whole millisecond past the segment', () async {
      final svc = await service([intro]);
      final result = svc.checkPosition(const Duration(seconds: 5));
      expect(result.shouldSkip, isTrue);
      expect(result.skipTo, const Duration(milliseconds: 90001));
    });

    test('does not skip again when the seek lands short of the end', () async {
      final svc = await service([intro]);
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      // The seek landed a frame short, still inside the segment.
      expect(svc.checkPosition(const Duration(seconds: 90)).isNone, isTrue);
      // Playback moves on, then a group seek puts us back on that landing.
      expect(
        svc.checkPosition(const Duration(milliseconds: 90500)).isNone,
        isTrue,
      );
      expect(svc.checkPosition(const Duration(seconds: 90)).isNone, isTrue);
    });

    test('a seek into the middle of a skipped segment plays it', () async {
      final svc = await service([intro]);
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 120)).isNone, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 40)).isNone, isTrue);
    });

    test('a rewind to or before the start arms the skip again', () async {
      final svc = await service([intro]);
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 120)).isNone, isTrue);
      // Restart from the start of the segment itself.
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 120)).isNone, isTrue);
      // Rewind to before it and play into it.
      expect(svc.checkPosition(const Duration(seconds: 2)).isNone, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 6)).shouldSkip, isTrue);
    });

    test('each segment is tracked on its own', () async {
      final outro = segmentJson(
        id: 'outro',
        type: 'Outro',
        startMs: 1200000,
        endMs: 1260000,
      );
      final svc = await service([intro, outro]);
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      expect(svc.checkPosition(const Duration(seconds: 90)).isNone, isTrue);
      final result = svc.checkPosition(const Duration(seconds: 1200));
      expect(result.shouldSkip, isTrue);
      expect(result.segment?.type, MediaSegmentType.outro);
      expect(svc.checkPosition(const Duration(seconds: 1259)).isNone, isTrue);
    });

    test('reloading the item forgets what was skipped', () async {
      final svc = await service([intro]);
      expect(svc.checkPosition(const Duration(seconds: 5)).shouldSkip, isTrue);
      await svc.loadSegments('ep1');
      expect(svc.checkPosition(const Duration(seconds: 40)).shouldSkip, isTrue);
    });

    test('ask-to-skip prompts are unaffected', () async {
      final svc = await service([intro], actions: 'intro:askToSkip');
      final first = svc.checkPosition(const Duration(seconds: 5));
      expect(first.shouldAsk, isTrue);
      expect(first.isNew, isTrue);
      final again = svc.checkPosition(const Duration(seconds: 6));
      expect(again.shouldAsk, isTrue);
      expect(again.isNew, isFalse);
      expect(svc.checkPosition(const Duration(seconds: 120)).isNone, isTrue);
      // Coming back into it prompts afresh, as before.
      expect(svc.checkPosition(const Duration(seconds: 40)).isNew, isTrue);
    });
  });

  test('a skip into the last second lands a second before the end', () {
    const duration = Duration(minutes: 40);
    expect(
      skipLandingBeforeEnd(duration, duration),
      duration - const Duration(seconds: 1),
    );
    expect(
      skipLandingBeforeEnd(duration + const Duration(seconds: 5), duration),
      duration - const Duration(seconds: 1),
    );
    const early = Duration(minutes: 39);
    expect(skipLandingBeforeEnd(early, duration), early);
    expect(skipLandingBeforeEnd(duration, Duration.zero), duration);
  });
}
