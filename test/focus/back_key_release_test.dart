import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/focus/back_key_release.dart';

// Issue #1680: the player popped on Back's key down, and the remote's key up
// then landed on the detail page and closed it as well. The simulator can't
// send Android's Go Back, so these hold Escape, which counts as Back too.

void main() {
  testWidgets('runs right away when no Back is held', (tester) async {
    var ran = 0;
    runAfterBackKeyUp(() => ran++);

    expect(ran, 1);
  });

  testWidgets('waits for a held Back to come up and keeps that key up', (
    tester,
  ) async {
    var ran = 0;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.escape);
    runAfterBackKeyUp(() => ran++);
    expect(ran, 0);

    final handled = await tester.sendKeyUpEvent(LogicalKeyboardKey.escape);

    expect(ran, 1);
    expect(handled, isTrue);
  });

  testWidgets('other keys coming up leave the wait alone', (tester) async {
    var ran = 0;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.escape);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
    runAfterBackKeyUp(() => ran++);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowLeft);
    expect(ran, 0);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.escape);
    expect(ran, 1);
  });

  testWidgets('a cancelled wait never runs or keeps the key up', (
    tester,
  ) async {
    var ran = 0;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.escape);
    runAfterBackKeyUp(() => ran++)();

    final handled = await tester.sendKeyUpEvent(LogicalKeyboardKey.escape);

    expect(ran, 0);
    expect(handled, isFalse);
  });
}
