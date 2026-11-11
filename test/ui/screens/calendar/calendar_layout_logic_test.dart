import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/calendar_entry.dart';
import 'package:moonfin/ui/screens/calendar/calendar_agenda_view.dart';
import 'package:moonfin/ui/screens/calendar/calendar_month_screen.dart';

CalendarEntry _entry(String key) => CalendarEntry(
  key: key,
  kind: CalendarEntryKind.episode,
  release: CalendarRelease.airing,
  date: DateTime(2026, 11, 12),
  hasTime: false,
  title: key,
);

void main() {
  group('the entry the pane beside the list shows', () {
    test('is the first one until a row is picked', () {
      final list = [_entry('a'), _entry('b')];
      expect(calendarShownEntry(list, null), same(list.first));
      expect(calendarShownEntry(const [], null), isNull);
    });

    test('stays on the picked one after a reload builds the list again', () {
      final picked = _entry('b');
      final reloaded = [_entry('a'), _entry('b')];
      expect(calendarShownEntry(reloaded, picked), same(reloaded[1]));
    });

    test('falls back to the first one when the picked one is gone', () {
      final list = [_entry('a'), _entry('b')];
      expect(calendarShownEntry(list, _entry('gone')), same(list.first));
    });
  });

  group('the titles a month cell shows', () {
    int count(int entries, double height) => calendarCellTitleCount(
      entries: entries,
      height: height,
      lineHeight: 20,
    );

    test('are two at most, however tall the cell', () {
      expect(count(5, 200), 2);
      expect(count(2, 200), 2);
      expect(count(1, 200), 1);
    });

    test('give a line to the count of the rest in a short cell', () {
      // Room for two lines: both titles when that is all of them, and one
      // title over "+2 more" otherwise.
      expect(count(2, 42), 2);
      expect(count(3, 42), 1);
      // Room for one line: the title when it is alone, the count otherwise.
      expect(count(1, 25), 1);
      expect(count(2, 25), 0);
    });

    test('are none in a cell with no room for a line', () {
      expect(count(1, 10), 0);
      expect(count(0, 200), 0);
    });
  });
}
