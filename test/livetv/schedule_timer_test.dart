import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/viewmodels/recordings_view_model.dart';
import 'package:moonfin/data/viewmodels/schedule_view_model.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

/// A timer as `/LiveTv/Timers` returns it, starting at a local [start]. With a
/// [programId], it carries its program the way Jellyfin does, under its own id.
Map<String, dynamic> _timer(
  String id,
  DateTime start, {
  String? programId,
}) {
  final startDate = start.toUtc().toIso8601String();
  final endDate = start.add(const Duration(hours: 1)).toUtc().toIso8601String();
  return {
    'Id': id,
    'Name': 'Show $id',
    'Status': 'New',
    'StartDate': startDate,
    'EndDate': endDate,
    if (programId != null)
      'ProgramInfo': {
        'Id': programId,
        'Name': 'Show $id',
        'TimerId': id,
        'StartDate': startDate,
        'EndDate': endDate,
        'ImageTags': {'Primary': 'tag'},
      },
  };
}

void main() {
  late _MockClient client;
  late _MockLiveTvApi liveTv;

  void serve(List<Map<String, dynamic>> timers) =>
      when(() => liveTv.getTimers()).thenAnswer((_) async => {'Items': timers});

  setUp(() {
    client = _MockClient();
    liveTv = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTv);
    when(() => liveTv.cancelTimer(any())).thenAnswer((_) async {});
    when(
      () => liveTv.getRecordings(
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImages: any(named: 'enableImages'),
        isSeries: any(named: 'isSeries'),
        isMovie: any(named: 'isMovie'),
        isSports: any(named: 'isSports'),
        isKids: any(named: 'isKids'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[]});
  });

  group('a scheduled recording is cancelled by its timer', () {
    final start = DateTime.now().add(const Duration(hours: 1));

    test('a schedule item keeps its program id and knows its timer', () async {
      serve([_timer('timer-1', start, programId: 'program-1')]);
      final vm = ScheduleViewModel(client);
      await vm.load();

      final item = vm.groups.single.items.single;
      expect(item.id, 'program-1');
      expect(item.timerId, 'timer-1');
      expect(item.imageTags, {'Primary': 'tag'});
    });

    test('cancelling sends the timer id and removes only that timer', () async {
      serve([
        _timer('timer-1', start, programId: 'program-1'),
        _timer('timer-2', start, programId: 'program-2'),
      ]);
      final vm = ScheduleViewModel(client);
      await vm.load();
      vm.setFocusedItem(vm.groups.single.items.first);

      await vm.cancelTimer('timer-1');

      verify(() => liveTv.cancelTimer('timer-1')).called(1);
      expect(vm.groups.single.items.map((i) => i.timerId), ['timer-2']);
      expect(vm.focusedItem, isNull);
    });

    test('a timer without a program uses its own id for both', () async {
      serve([_timer('timer-1', start)]);
      final vm = ScheduleViewModel(client);
      await vm.load();

      final item = vm.groups.single.items.single;
      expect(item.id, 'timer-1');
      expect(item.timerId, 'timer-1');
    });

    test('the Recordings scheduled row knows each timer', () async {
      serve([_timer('timer-1', start, programId: 'program-1')]);
      final vm = RecordingsViewModel(client);
      await vm.refreshScheduled();

      final item = vm.scheduledNext24h.single;
      expect(item.id, 'program-1');
      expect(item.timerId, 'timer-1');
    });
  });

  group('the schedule groups by the local date', () {
    Future<List<String>> labelsAt(DateTime now, List<DateTime> starts) =>
        withClock(Clock.fixed(now), () async {
          serve([
            for (final (i, start) in starts.indexed) _timer('timer-$i', start),
          ]);
          final vm = ScheduleViewModel(client);
          await vm.load();
          return [for (final g in vm.groups) g.dateLabel];
        });

    test('a late evening showing is today, just after midnight tomorrow', () async {
      final labels = await labelsAt(DateTime(2026, 10, 24, 12), [
        DateTime(2026, 10, 24, 20),
        DateTime(2026, 10, 24, 23, 30),
        DateTime(2026, 10, 25, 0, 30),
      ]);

      expect(labels, ['Today', 'Tomorrow']);
    });

    test('tomorrow is still tomorrow across a daylight saving change', () async {
      final labels = await labelsAt(DateTime(2027, 3, 14, 1), [
        DateTime(2027, 3, 15, 20),
      ]);

      expect(labels, ['Tomorrow']);
    });
  });

  test('a timer date the server left unset reads as missing', () {
    final timer = TimerItem.fromJson({
      'Id': 'timer-1',
      'StartDate': '0001-01-01T00:00:00.0000000Z',
      'EndDate': '0001-01-01T00:00:00.0000000Z',
    });

    expect(timer.startDate, isNull);
    expect(timer.endDate, isNull);
  });
}
