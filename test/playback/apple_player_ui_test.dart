import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cast/cast_target.dart';
import 'package:moonfin/playback/apple_player_ui.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';

void main() {
  test('the native player is opt in', () {
    expect(UserPreferences.applePlayerUi.defaultValue, ApplePlayerUi.flutter);
  });

  test('only iOS and Apple TV can pick the native player', () {
    // Tests run on the host, which is neither, so the answer has to come back
    // false before anything reads the preference.
    expect(useNativeApplePlayer(), isFalse);
    expect(useNativeApplePlayerForRoute(const ValueKey('route')), isFalse);
  });

  group('decideNativeApplePlayer', () {
    bool decide({
      bool offersChoice = true,
      ApplePlayerUi pref = ApplePlayerUi.native,
      CastTargetKind? castKind,
      bool hasCastItem = false,
    }) => decideNativeApplePlayer(
      offersChoice: offersChoice,
      pref: pref,
      castKind: castKind,
      hasCastItem: hasCastItem,
    );

    test('needs a platform with the choice and the native preference', () {
      expect(decide(), isTrue);
      expect(decide(offersChoice: false), isFalse);
      expect(decide(pref: ApplePlayerUi.flutter), isFalse);
    });

    test('an AirPlay route the system picked does not count as casting', () {
      expect(decide(castKind: CastTargetKind.airPlay), isTrue);
    });

    test('an AirPlay session Moonfin started keeps the Flutter player', () {
      expect(
        decide(castKind: CastTargetKind.airPlay, hasCastItem: true),
        isFalse,
      );
    });

    test('every other cast target keeps the Flutter player', () {
      for (final kind in [
        CastTargetKind.googleCast,
        CastTargetKind.dlna,
        CastTargetKind.jellyfinSession,
      ]) {
        expect(decide(castKind: kind), isFalse, reason: kind.name);
      }
    });
  });

  group('ApplePlayerChoiceLatch', () {
    late bool answer;
    late int decisions;
    late ApplePlayerChoiceLatch latch;

    setUp(() {
      answer = true;
      decisions = 0;
      latch = ApplePlayerChoiceLatch(() {
        decisions++;
        return answer;
      });
    });

    test('a route keeps its answer when the inputs change', () {
      const route = ValueKey('a');
      expect(latch.forRoute(route), isTrue);
      answer = false;
      expect(latch.forRoute(route), isTrue);
      expect(latch.current(), isTrue);
      expect(decisions, 1);
    });

    test('a new route decides again', () {
      expect(latch.forRoute(const ValueKey('a')), isTrue);
      answer = false;
      expect(latch.forRoute(const ValueKey('b')), isFalse);
      expect(latch.current(), isFalse);
    });

    test('an old route leaving does not clear the new one', () {
      latch.forRoute(const ValueKey('a'));
      answer = false;
      latch.forRoute(const ValueKey('b'));
      answer = true;
      latch.release(const ValueKey('a'));
      latch.release(null);
      expect(latch.current(), isFalse);
    });

    test('the owning route leaving clears the choice', () {
      latch.forRoute(const ValueKey('a'));
      latch.release(const ValueKey('a'));
      answer = false;
      expect(latch.current(), isFalse);
    });

    test('with no route up the answer is fresh and not kept', () {
      expect(latch.current(), isTrue);
      answer = false;
      expect(latch.current(), isFalse);
      expect(decisions, 2);
    });
  });
}
