import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';

void main() {
  testWidgets('Top fades the top half and covers the bottom half across the '
      'whole width', (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 800,
            height: 600,
            child: HomeScreen.topBackdrop(const SizedBox.expand()),
          ),
        ),
      ),
    );

    final halves = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Expanded),
    );
    expect(tester.getRect(halves.at(0)), const Rect.fromLTWH(0, 0, 800, 300));
    expect(tester.getRect(halves.at(1)), const Rect.fromLTWH(0, 300, 800, 300));
  });
}
