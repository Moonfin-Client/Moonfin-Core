import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_sheet_keeper.dart';

void main() {
  final start = DateTime(2026, 1, 1, 12);
  late TrickplaySheetKeeper keeper;

  setUp(() => keeper = TrickplaySheetKeeper());

  test('allows a sheet that has not failed', () {
    expect(keeper.mayRequest(3, start), isTrue);
  });
  test('refuses a negative index', () {
    expect(keeper.mayRequest(-1, start), isFalse);
  });
  test('holds a failed sheet back until the retry time', () {
    keeper.failed(3, start);
    expect(
      keeper.mayRequest(3, start.add(const Duration(milliseconds: 14999))),
      isFalse,
    );
  });
  test('allows a failed sheet again exactly at the retry time', () {
    keeper.failed(3, start);
    expect(
      keeper.mayRequest(3, start.add(const Duration(seconds: 15))),
      isTrue,
    );
  });
  test('does not hold back other sheets after a failure', () {
    keeper.failed(3, start);
    expect(keeper.mayRequest(4, start), isTrue);
  });
  test('clears a failure when the sheet loads', () {
    keeper.failed(3, start);
    keeper.loaded(3);
    expect(keeper.mayRequest(3, start), isTrue);
  });
  test('keeps holding a failed sheet back when another sheet loads', () {
    keeper.failed(3, start);
    keeper.loaded(4);
    expect(keeper.mayRequest(3, start), isFalse);
  });
  test('forgets every failure on reset', () {
    keeper.failed(3, start);
    keeper.reset();
    expect(keeper.mayRequest(3, start), isTrue);
  });
}
