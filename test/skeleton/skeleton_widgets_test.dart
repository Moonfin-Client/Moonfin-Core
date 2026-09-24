import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_detail_screen.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_home_row.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_library_grid.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_music_browse.dart';
import 'package:moonfin/ui/widgets/skeleton/skeleton_shimmer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Skeleton UI Widgets', () {
    testWidgets('SkeletonHomeRow renders both classic and modern variants', (tester) async {
      // 1. Classic layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonHomeRow(
              cardWidth: 150,
              imageHeight: 225,
              leadingPadding: 16,
              itemSpacing: 14,
              isModern: false,
              count: 6,
            ),
          ),
        ),
      );

      expect(find.byType(SkeletonHomeRow), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 2. Modern layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonHomeRow(
              cardWidth: 260,
              imageHeight: 390,
              leadingPadding: 32,
              itemSpacing: 18,
              isModern: true,
              count: 6,
            ),
          ),
        ),
      );

      expect(find.byType(SkeletonHomeRow), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);
    });

    testWidgets('DetailScreenSkeleton renders all variants without overflow', (tester) async {
      // 1. Classic layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.classic),
          ),
        ),
      );
      expect(find.byType(DetailScreenSkeleton), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 2. Modern layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.modern),
          ),
        ),
      );
      expect(find.byType(DetailScreenSkeleton), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 3. Spotlight layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.spotlight),
          ),
        ),
      );
      expect(find.byType(DetailScreenSkeleton), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 4. Nouveau layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.nouveau),
          ),
        ),
      );
      expect(find.byType(DetailScreenSkeleton), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 5. Legacy backward compatibility (isModern flag)
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(isModern: false),
          ),
        ),
      );
      expect(find.byType(DetailScreenSkeleton), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);
    });

    testWidgets('SkeletonLibraryGrid renders vertical, horizontal, and song layouts without overflow', (tester) async {
      // 1. Vertical grid layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonLibraryGrid(
              cardWidth: 150,
              aspectRatio: 2 / 3,
            ),
          ),
        ),
      );
      expect(find.byType(SkeletonLibraryGrid), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);

      // 2. Horizontal row layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonLibraryGrid(
              isHorizontal: true,
              cardWidth: 150,
              aspectRatio: 2 / 3,
            ),
          ),
        ),
      );
      expect(find.byType(SkeletonLibraryGrid), findsOneWidget);

      // 3. Audio/Songs list layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonLibraryGrid(
              isSongs: true,
            ),
          ),
        ),
      );
      expect(find.byType(SkeletonLibraryGrid), findsOneWidget);

      // 4. Music browse landing page layout
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonMusicBrowse(),
          ),
        ),
      );
      expect(find.byType(SkeletonMusicBrowse), findsOneWidget);
      expect(find.byType(SkeletonBox), findsWidgets);
    });

    // MaterialApp draws fade transitions of its own for the route, so these
    // count only the ones inside the shimmer.
    Finder shimmerFades() => find.descendant(
      of: find.byType(SkeletonShimmer).first,
      matching: find.byType(FadeTransition),
    );

    testWidgets('a shimmer on its own breathes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonShimmer(child: SkeletonBox(width: 10, height: 10)),
          ),
        ),
      );

      expect(shimmerFades(), findsOneWidget);
    });

    testWidgets('a nested shimmer stands aside', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonShimmer(
              child: SkeletonShimmer(
                child: SkeletonBox(width: 10, height: 10),
              ),
            ),
          ),
        ),
      );

      expect(shimmerFades(), findsOneWidget);
      expect(find.byType(SkeletonBox), findsOneWidget);
    });
  });

  group('DetailScreenSkeleton form factors', () {
    // Every style has to hold its shape on all four, and the portrait cases
    // are the ones most likely to break.
    const surfaces = <String, Size>{
      'phone portrait': Size(390, 844),
      'tablet portrait': Size(820, 1180),
      'desktop landscape': Size(1920, 1080),
      'tv': Size(960, 540),
    };

    for (final entry in surfaces.entries) {
      for (final style in DetailScreenStyle.values) {
        testWidgets('${style.name} skeleton fits a ${entry.key} screen', (
          tester,
        ) async {
          final isTv = entry.key == 'tv';
          if (isTv) {
            PlatformDetection.setTvMode(true);
            addTearDown(() => PlatformDetection.setTvMode(false));
          }
          tester.view.physicalSize = entry.value;
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(
            MaterialApp(home: Scaffold(body: DetailScreenSkeleton(style: style))),
          );
          await tester.pump(const Duration(milliseconds: 100));

          expect(tester.takeException(), isNull);
          expect(find.byType(SkeletonBox), findsWidgets);
        });
      }
    }

    // Classic action buttons are square icon tiles with a label underneath,
    // sized alike and centred as a group. Nothing like the wide play pill and
    // round icons the other styles use.
    for (final entry in <String, List<double>>{
      'wide screen': [1920, 58],
      'phone': [390, 44],
    }.entries) {
      testWidgets('classic centres its action tiles on a ${entry.key}', (
        tester,
      ) async {
        final width = entry.value.first;
        final side = entry.value.last;
        tester.view.physicalSize = Size(width, width > 1000 ? 1080 : 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DetailScreenSkeleton(style: DetailScreenStyle.classic),
            ),
          ),
        );
        await tester.pump(const Duration(milliseconds: 100));

        final boxes = find.byType(SkeletonBox);
        final tiles = [
          for (var i = 0; i < boxes.evaluate().length; i++)
            tester.getRect(boxes.at(i)),
        ].where((r) => (r.width - side).abs() < 0.6 && (r.height - side).abs() < 0.6).toList();

        expect(tiles, hasLength(5));
        final left = tiles.map((r) => r.left).reduce(math.min);
        final right = tiles.map((r) => r.right).reduce(math.max);
        expect((left + right) / 2, closeTo(width / 2, 1.0));
      });
    }

    // Classic is the only style with a poster, and it moves: beside the text
    // on a wide screen, above and centred on a phone.
    testWidgets('classic puts its poster beside the text on a wide screen', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.classic),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      final poster = _posterRect(tester);
      final firstTextBox = tester.getRect(find.byType(SkeletonBox).first);
      expect(poster.left, greaterThan(firstTextBox.right));
    });

    testWidgets('classic stacks its poster above the text on a phone', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DetailScreenSkeleton(style: DetailScreenStyle.classic),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      final poster = _posterRect(tester);
      // 120x180 is the mobile poster, and it's centred rather than flush left.
      expect(poster.width, closeTo(120, 0.5));
      expect(poster.height, closeTo(180, 0.5));
      expect(poster.center.dx, closeTo(390 / 2, 1.0));
    });
  });
}

/// The Classic poster is the tallest box the skeleton draws.
Rect _posterRect(WidgetTester tester) {
  final boxes = find.byType(SkeletonBox);
  final rects = [
    for (var i = 0; i < boxes.evaluate().length; i++) tester.getRect(boxes.at(i)),
  ]..sort((a, b) => b.height.compareTo(a.height));
  return rects.first;
}
