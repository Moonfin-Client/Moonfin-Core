import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/sleep_timer_controller.dart';
import 'package:moonfin/ui/widgets/playback/sleep_timer_menu.dart';
import 'package:playback_core/playback_core.dart';

List<SleepTimerChoiceKind> _kinds(List<SleepTimerChoice> choices) =>
    choices.map((c) => c.kind).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('sleepTimerChoices', () {
    test('a video with no timer running offers its end, presets and custom',
        () {
      final choices = sleepTimerChoices(active: false, offerEndOfItem: true);
      expect(_kinds(choices), [
        SleepTimerChoiceKind.endOfItem,
        for (final _ in sleepTimerPresetMinutes) SleepTimerChoiceKind.minutes,
        SleepTimerChoiceKind.custom,
      ]);
    });

    test('a video with one queued after it offers both ends first', () {
      final choices = sleepTimerChoices(
        active: false,
        offerEndOfItem: true,
        offerEndOfNextItem: true,
      );
      expect(_kinds(choices), [
        SleepTimerChoiceKind.endOfItem,
        SleepTimerChoiceKind.endOfNextItem,
        SleepTimerChoiceKind.minutes,
        SleepTimerChoiceKind.minutes,
        SleepTimerChoiceKind.custom,
      ]);
      expect(choices.where((c) => c.minutes != null).map((c) => c.minutes), [
        30,
        60,
      ]);
    });

    test('Live TV has no end to offer', () {
      final choices = sleepTimerChoices(active: false, offerEndOfItem: false);
      expect(_kinds(choices), isNot(contains(SleepTimerChoiceKind.endOfItem)));
    });

    test('a running timer can be switched off from the top', () {
      final choices = sleepTimerChoices(active: true, offerEndOfItem: true);
      expect(choices.first.kind, SleepTimerChoiceKind.off);
    });
  });

  group('runningSleepTimerChoice', () {
    late SleepTimerController sleep;

    setUp(() => sleep = SleepTimerController(PlaybackManager()));
    tearDown(() => sleep.dispose());

    test('marks nothing while off', () {
      final choices = sleepTimerChoices(active: false, offerEndOfItem: true);
      expect(runningSleepTimerChoice(choices, sleep), isNull);
    });

    test('marks the preset that is running', () {
      sleep.startDuration(const Duration(minutes: 60));
      final choices = sleepTimerChoices(active: true, offerEndOfItem: true);
      final i = runningSleepTimerChoice(choices, sleep)!;
      expect(choices[i].kind, SleepTimerChoiceKind.minutes);
      expect(choices[i].minutes, 60);
    });

    test('marks custom for a length that is not a preset', () {
      sleep.startDuration(const Duration(minutes: 25));
      final choices = sleepTimerChoices(active: true, offerEndOfItem: true);
      final i = runningSleepTimerChoice(choices, sleep)!;
      expect(choices[i].kind, SleepTimerChoiceKind.custom);
    });

    test('marks the end of the next video', () {
      sleep.dispose();
      final manager = PlaybackManager();
      sleep = SleepTimerController(manager);
      manager.queueService.setQueue([
        {'Id': 'a', 'RunTimeTicks': 600000000},
        {'Id': 'b', 'RunTimeTicks': 600000000},
      ]);
      sleep.startEndOfNextItem(currentPositionMs: 0, totalDurationMs: 60000);
      final choices = sleepTimerChoices(
        active: true,
        offerEndOfItem: true,
        offerEndOfNextItem: true,
      );
      final i = runningSleepTimerChoice(choices, sleep)!;
      expect(choices[i].kind, SleepTimerChoiceKind.endOfNextItem);
    });

    test('marks the end of the video', () {
      sleep.startEndOfItem(currentPositionMs: 0, totalDurationMs: 600000);
      final choices = sleepTimerChoices(active: true, offerEndOfItem: true);
      final i = runningSleepTimerChoice(choices, sleep)!;
      expect(choices[i].kind, SleepTimerChoiceKind.endOfItem);
    });
  });

  test('a custom length stays on its steps and inside its range', () {
    expect(clampSleepTimerCustomMinutes(0), sleepTimerCustomStepMinutes);
    expect(clampSleepTimerCustomMinutes(23), 25);
    expect(clampSleepTimerCustomMinutes(9999), sleepTimerCustomMaxMinutes);
  });
}
