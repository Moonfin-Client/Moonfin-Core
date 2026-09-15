import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    testWidgets('detail loading keeps legacy style support without skeletons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: DetailScreenSkeleton(isModern: false)),
        ),
      );
      expect(tester.widget<DetailScreenSkeleton>(find.byType(DetailScreenSkeleton)).isModern, isFalse);
      expect(find.byType(SkeletonBox), findsNothing);
      await tester.pump(const Duration(milliseconds: 600));
      expect(find.byType(SkeletonBox), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
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
}
