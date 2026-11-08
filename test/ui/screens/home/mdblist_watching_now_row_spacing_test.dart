import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

void main() {
  testWidgets('MediaCard with cardFocusExpansion anchors AnimatedScale to bottomCenter', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MediaCard(
            title: 'Resident Evil',
            width: 200,
            aspectRatio: 16 / 9,
            showLabel: false,
            cardFocusExpansion: true,
          ),
        ),
      ),
    );

    final animatedScale = tester.widget<AnimatedScale>(find.byType(AnimatedScale));
    expect(
      animatedScale.alignment,
      Alignment.bottomCenter,
      reason: 'Focus expansion must anchor at bottomCenter so growth extends upward into headroom rather than downward into adjacent rows',
    );
  });
}
