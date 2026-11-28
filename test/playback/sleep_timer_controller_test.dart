import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/playback/sleep_timer_controller.dart';
import 'package:playback_core/playback_core.dart';

// The video player's "end of this video" choice has to pause before the
// player's own completion, which autoplays the next episode and cancels the
// timer on the queue change before it could fire.
Map<String, dynamic> _ep(String id, int seconds) => {
  'Id': id,
  'Type': 'Episode',
  'RunTimeTicks': seconds * 10000000,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('endOfItemTargetMs', () {
    test('lands the lead time before the end', () {
      expect(
        SleepTimerController.endOfItemTargetMs(0, 60000),
        60000 - SleepTimerController.endOfItemLeadMs,
      );
    });

    test('refuses when the item is already that close to its end', () {
      expect(SleepTimerController.endOfItemTargetMs(58500, 60000), isNull);
      expect(SleepTimerController.endOfItemTargetMs(0, 0), isNull);
    });
  });

  group('end of item', () {
    late PlaybackManager manager;
    late SleepTimerController sleep;

    setUp(() {
      manager = PlaybackManager();
      sleep = SleepTimerController(manager);
      manager.state.setPlaying(true);
    });

    tearDown(() => sleep.dispose());

    test('pauses at the lead point and reports it once', () async {
      var expiries = 0;
      sleep.onExpired.listen((_) => expiries++);

      sleep.startEndOfItem(currentPositionMs: 10000, totalDurationMs: 60000);
      expect(sleep.mode, SleepTimerMode.endOfItem);
      expect(sleep.remaining, const Duration(milliseconds: 48000));

      manager.state.setPosition(const Duration(milliseconds: 40000));
      await pumpEventQueue();
      expect(sleep.isActive, isTrue);
      expect(expiries, 0);

      manager.state.setPosition(const Duration(milliseconds: 58000));
      await pumpEventQueue();
      expect(sleep.isActive, isFalse);
      expect(expiries, 1);
      expect(sleep.lastActiveMode, SleepTimerMode.endOfItem);
    });

    test('stays off when started inside the lead time', () {
      sleep.startEndOfItem(currentPositionMs: 59000, totalDurationMs: 60000);
      expect(sleep.isActive, isFalse);
    });

    test('more episodes joining the queue leave it running', () async {
      manager.queueService.setQueue([_ep('a', 60)]);
      sleep.startEndOfItem(currentPositionMs: 0, totalDurationMs: 60000);
      manager.queueService.addItems([_ep('b', 60)]);
      await pumpEventQueue();
      expect(sleep.mode, SleepTimerMode.endOfItem);
    });

    test('moving to another item cancels it', () async {
      manager.queueService.setQueue([_ep('a', 60), _ep('b', 60)]);
      sleep.startEndOfItem(currentPositionMs: 0, totalDurationMs: 60000);
      manager.queueService.next();
      await pumpEventQueue();
      expect(sleep.isActive, isFalse);
    });
  });

  group('end of next item', () {
    late PlaybackManager manager;
    late SleepTimerController sleep;
    var expiries = 0;

    setUp(() {
      manager = PlaybackManager();
      sleep = SleepTimerController(manager);
      manager.state.setPlaying(true);
      expiries = 0;
      sleep.onExpired.listen((_) => expiries++);
    });

    tearDown(() => sleep.dispose());

    test('plays through this one and stops before the next one ends',
        () async {
      manager.queueService.setQueue([_ep('a', 60), _ep('b', 120)]);
      expect(sleep.canStopAtEndOfNextItem, isTrue);

      sleep.startEndOfNextItem(currentPositionMs: 10000, totalDurationMs: 60000);
      expect(sleep.mode, SleepTimerMode.endOfNextItem);
      expect(sleep.remaining, const Duration(milliseconds: 168000));

      // The end of the first one passes without a stop.
      manager.state.setPosition(const Duration(milliseconds: 59000));
      await pumpEventQueue();
      expect(sleep.mode, SleepTimerMode.endOfNextItem);
      expect(expiries, 0);

      manager.queueService.next();
      manager.state.setPosition(Duration.zero);
      await pumpEventQueue();
      expect(sleep.mode, SleepTimerMode.endOfItem);

      manager.state.setPosition(const Duration(milliseconds: 60000));
      await pumpEventQueue();
      expect(expiries, 0);

      manager.state.setPosition(const Duration(milliseconds: 118000));
      await pumpEventQueue();
      expect(expiries, 1);
      expect(sleep.isActive, isFalse);
    });

    test('takes the next one\'s length from the player without a runtime',
        () async {
      manager.queueService.setQueue([
        _ep('a', 60),
        {'Id': 'b', 'Type': 'Episode'},
      ]);
      sleep.startEndOfNextItem(currentPositionMs: 0, totalDurationMs: 60000);
      manager.queueService.next();
      await pumpEventQueue();
      manager.state.setDuration(const Duration(seconds: 90));
      await pumpEventQueue();
      expect(sleep.mode, SleepTimerMode.endOfItem);

      manager.state.setPosition(const Duration(milliseconds: 88000));
      await pumpEventQueue();
      expect(expiries, 1);
    });

    test('jumping past the next one cancels it', () async {
      manager.queueService.setQueue([_ep('a', 60), _ep('b', 60), _ep('c', 60)]);
      sleep.startEndOfNextItem(currentPositionMs: 0, totalDurationMs: 60000);
      manager.queueService.jumpTo(2);
      await pumpEventQueue();
      expect(sleep.isActive, isFalse);
      expect(expiries, 0);
    });

    test('works with the app\'s own queue items', () async {
      AggregatedItem episode(String id) => AggregatedItem(
        id: id,
        serverId: 's',
        rawData: {'Id': id, 'Type': 'Episode', 'RunTimeTicks': 600000000},
      );
      manager.queueService.setQueue([episode('s2e15'), episode('s2e16')]);
      expect(sleep.canStopAtEndOfNextItem, isTrue);

      sleep.startEndOfNextItem(currentPositionMs: 0, totalDurationMs: 60000);
      expect(sleep.remaining, const Duration(milliseconds: 118000));
      manager.queueService.next();
      await pumpEventQueue();
      expect(sleep.mode, SleepTimerMode.endOfItem);

      manager.state.setPosition(const Duration(milliseconds: 58000));
      await pumpEventQueue();
      expect(expiries, 1);
    });

    test('repeat-all wrapping to the start is not a next video', () {
      manager.queueService.setQueue([_ep('a', 60), _ep('b', 60)], startIndex: 1);
      manager.queueService.toggleRepeat();
      expect(sleep.canStopAtEndOfNextItem, isFalse);
    });

    test('is not offered with nothing queued next', () {
      manager.queueService.setQueue([_ep('a', 60)]);
      expect(sleep.canStopAtEndOfNextItem, isFalse);
      sleep.startEndOfNextItem(currentPositionMs: 0, totalDurationMs: 60000);
      expect(sleep.isActive, isFalse);
    });
  });

  test('a countdown only runs while something plays', () {
    fakeAsync((async) {
      final manager = PlaybackManager();
      final sleep = SleepTimerController(manager);
      var expired = false;
      sleep.onExpired.listen((_) => expired = true);

      sleep.startDuration(const Duration(seconds: 5));
      async.elapse(const Duration(seconds: 10));
      expect(sleep.remaining, const Duration(seconds: 5));

      manager.state.setPlaying(true);
      async.elapse(const Duration(seconds: 5));
      async.flushMicrotasks();
      expect(expired, isTrue);
      expect(sleep.isActive, isFalse);

      sleep.dispose();
    });
  });
}
