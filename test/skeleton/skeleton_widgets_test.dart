import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
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
  });
}
