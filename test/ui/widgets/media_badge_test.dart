import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/theme/app_theme_controller.dart';
import 'package:moonfin/ui/widgets/media_badge.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }

  group('MediaWatchedBadge', () {
    testWidgets('renders check_rounded icon with border and drop shadow', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(const MediaWatchedBadge()));

      expect(find.byIcon(Icons.check_rounded), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.circle);
      expect(decoration.border, isNotNull);
      expect(decoration.border!.top.width, 1.5);
      expect(decoration.boxShadow, equals(kMediaBadgeShadow));
    });

    testWidgets('respects custom size and colors', (tester) async {
      const customColor = Color(0xFF00FF00);
      const customIconColor = Color(0xFF000000);

      await tester.pumpWidget(
        wrap(
          const MediaWatchedBadge(
            size: 32,
            color: customColor,
            iconColor: customIconColor,
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, 32);
      expect(container.constraints?.maxHeight, 32);

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customColor);
      expect(decoration.border!.top.color, customIconColor);

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_rounded));
      expect(icon.color, customIconColor);
      expect(icon.size, greaterThan(15));
    });

    testWidgets('dynamically updates color when theme changes via AppThemeScope', (
      tester,
    ) async {
      final controller = AppThemeController(
        ThemeRegistry.resolveById(ThemeRegistry.neonPulseId),
        VisualThemeId.neonPulse,
        '',
        OledMode.off,
      );

      await tester.pumpWidget(
        AppThemeScope(
          controller: controller,
          child: const MaterialApp(
            home: Scaffold(
              body: Center(child: MediaWatchedBadge()),
            ),
          ),
        ),
      );

      var container = tester.widget<Container>(find.byType(Container));
      var decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFFFF2E92)); // Neon pulse pink

      // Switch active theme to Glass via controller
      controller.setByThemeId(VisualThemeId.glass);
      await tester.pump();

      container = tester.widget<Container>(find.byType(Container));
      decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFF30D158)); // Glass green
    });
  });

  group('MediaUnplayedBadge', () {
    testWidgets('renders formatted count with border and drop shadow', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(const MediaUnplayedBadge(count: 7)));

      expect(find.text('7'), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.borderRadius, isNotNull);
      expect(decoration.border, isNotNull);
      expect(decoration.border!.top.width, 1.5);
      expect(decoration.boxShadow, equals(kMediaBadgeShadow));

      final text = tester.widget<Text>(find.text('7'));
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('clamps counts above 99 to 99+', (tester) async {
      await tester.pumpWidget(wrap(const MediaUnplayedBadge(count: 120)));

      expect(find.text('99+'), findsOneWidget);
    });
  });

  group('MediaFavoriteBadge', () {
    testWidgets('renders favorite_rounded icon with border and drop shadow', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(const MediaFavoriteBadge()));

      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.circle);
      expect(decoration.border, isNotNull);
      expect(decoration.border!.top.width, 1.5);
      expect(decoration.border!.top.color, Colors.white);
      expect(decoration.boxShadow, equals(kMediaBadgeShadow));
    });

    testWidgets('respects custom size and colors', (tester) async {
      const customBg = Color(0xFFFF4081);
      const customHeart = Color(0xFFFFFF00);

      await tester.pumpWidget(
        wrap(
          const MediaFavoriteBadge(
            size: 28,
            color: customBg,
            heartColor: customHeart,
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, 28);
      expect(container.constraints?.maxHeight, 28);

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customBg);
      expect(decoration.border!.top.color, customHeart);

      final icon = tester.widget<Icon>(find.byIcon(Icons.favorite_rounded));
      expect(icon.color, customHeart);
    });
  });
}
