import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/poster_badge_repository.dart';
import 'package:moonfin/ui/widgets/poster_badge_flags.dart';
import 'package:moonfin/ui/widgets/poster_badges.dart';

Future<void> _pump(WidgetTester tester, PosterBadge badge) => tester.pumpWidget(
  MaterialApp(
    home: Scaffold(
      // No width limit, like the top-left column of a card.
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: PosterBadgeSample(badges: [badge]),
          ),
        ],
      ),
    ),
  ),
);

void main() {
  testWidgets('a label with an icon draws both', (tester) async {
    await _pump(tester, const PosterBadge(label: 'MULTI', color: '#2563EB', icon: 'translate'));
    expect(find.text('MULTI'), findsOneWidget);
    expect(find.byIcon(Icons.translate), findsOneWidget);
  });

  testWidgets('a label with no text is its icon, named for screen readers', (tester) async {
    await _pump(tester, const PosterBadge(label: '', color: '#2563EB', icon: 'surround_sound'));
    expect(find.byType(Text), findsNothing);
    expect(find.bySemanticsLabel('surround sound'), findsOneWidget);
  });

  testWidgets('an icon the app does not know is left out', (tester) async {
    await _pump(tester, const PosterBadge(label: 'VFQ', color: '#2563EB', icon: 'dolby'));
    expect(find.text('VFQ'), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
  });

  testWidgets('a flag stands in for the icon, alone or with text', (tester) async {
    await _pump(tester, const PosterBadge(label: 'VFQ', color: '#2563EB', icon: 'flag-ca'));
    expect(find.text('VFQ'), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);

    await _pump(tester, const PosterBadge(label: '', color: '#2563EB', icon: 'flag-fr'));
    expect(find.byType(Text), findsNothing);
    expect(find.bySemanticsLabel('flag FR'), findsOneWidget);

    await _pump(tester, const PosterBadge(label: 'X', color: '#2563EB', icon: 'flag-zz'));
    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('a flag alone has no pill and is as tall as a text label', (tester) async {
    await _pump(tester, const PosterBadge(label: '4K', color: '#2563EB'));
    final textHeight = tester.getSize(find.byType(PosterBadgeSample)).height;

    await _pump(tester, const PosterBadge(label: '', color: '#2563EB', icon: 'flag-es-ct'));
    expect(tester.getSize(find.byType(PosterBadgeSample)).height, moreOrLessEquals(textHeight, epsilon: 0.01));

    // No padding, so its left edge sits where the other labels start.
    final flag = tester.getTopLeft(find.byType(SvgPicture));
    expect(flag.dx, tester.getTopLeft(find.byType(PosterBadgeSample)).dx);
    expect(find.bySemanticsLabel('flag ES-CT'), findsOneWidget);
  });

  testWidgets('every flag is bundled and draws', (tester) async {
    for (final code in posterBadgeFlags) {
      final file = File('assets/icons/flags/$code.svg');
      expect(file.existsSync(), isTrue, reason: '$code.svg is missing');
      await tester.runAsync(
        () => vg.loadPicture(SvgStringLoader(file.readAsStringSync()), null),
      );
    }
  });
}
