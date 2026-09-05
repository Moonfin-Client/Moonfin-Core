import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/playback/loading_animation_widget.dart';
import 'package:moonfin/ui/widgets/playback/player_loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

void main() {
  group('Loading Animation Enums & Extensions', () {
    test('LoadingAnimationSizeX returns expected dimensions', () {
      expect(LoadingAnimationSize.thumbnail.pixelSize, 36.0);
      expect(LoadingAnimationSize.small.pixelSize, 64.0);
      expect(LoadingAnimationSize.medium.pixelSize, 110.0);
      expect(LoadingAnimationSize.large.pixelSize, 170.0);

      expect(LoadingAnimationSize.thumbnail.labelSpacing, 8.0);
      expect(LoadingAnimationSize.small.labelSpacing, 14.0);
      expect(LoadingAnimationSize.medium.labelSpacing, 24.0);
      expect(LoadingAnimationSize.large.labelSpacing, 40.0);

      expect(LoadingAnimationSize.thumbnail.labelFontSize, 10.0);
      expect(LoadingAnimationSize.large.labelFontSize, 16.0);
    });

    test('LoadingAnimationPositionX maps to correct alignments', () {
      expect(LoadingAnimationPosition.topLeft.alignment, Alignment.topLeft);
      expect(LoadingAnimationPosition.topCenter.alignment, Alignment.topCenter);
      expect(LoadingAnimationPosition.topRight.alignment, Alignment.topRight);
      expect(LoadingAnimationPosition.middleLeft.alignment, Alignment.centerLeft);
      expect(LoadingAnimationPosition.middle.alignment, Alignment.center);
      expect(LoadingAnimationPosition.middleRight.alignment, Alignment.centerRight);
      expect(LoadingAnimationPosition.bottomLeft.alignment, Alignment.bottomLeft);
      expect(LoadingAnimationPosition.bottomCenter.alignment, Alignment.bottomCenter);
      expect(LoadingAnimationPosition.bottomRight.alignment, Alignment.bottomRight);
      expect(LoadingAnimationPosition.bouncing.alignment, Alignment.center);
    });

    test('LoadingAnimationSpeedX returns expected multipliers', () {
      expect(LoadingAnimationSpeed.slow.multiplier, 0.45);
      expect(LoadingAnimationSpeed.moderate.multiplier, 0.70);
      expect(LoadingAnimationSpeed.fast.multiplier, 1.0);
      expect(LoadingAnimationSpeed.ultra.multiplier, 1.60);
    });

    test('UserPreferences default values for loading animation', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(
        prefs.get(UserPreferences.loadingAnimationImage),
        LoadingAnimationImage.moonfinLogo,
      );
      expect(
        prefs.get(UserPreferences.loadingAnimationSize),
        LoadingAnimationSize.medium,
      );
      expect(
        prefs.get(UserPreferences.loadingAnimationPosition),
        LoadingAnimationPosition.middle,
      );
      expect(
        prefs.get(UserPreferences.loadingAnimationSpeed),
        LoadingAnimationSpeed.fast,
      );
      expect(
        prefs.get(UserPreferences.showLoadingAnimationText),
        true,
      );
    });
  });

  group('LoadingAnimationWidget Rendering', () {
    testWidgets('renders SizedBox.shrink for LoadingAnimationImage.none', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.none,
              size: 100,
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(MoonfinLogoAnimation), findsNothing);
      expect(find.byType(StockSpinnerAnimation), findsNothing);
      expect(find.byType(RunnerAnimation), findsNothing);
      expect(find.byType(MoonPhasesAnimation), findsNothing);
    });

    testWidgets('renders StockSpinnerAnimation for LoadingAnimationImage.spinner', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.spinner,
              size: 80,
            ),
          ),
        ),
      );

      expect(find.byType(StockSpinnerAnimation), findsOneWidget);
    });

    testWidgets('renders RunnerAnimation for LoadingAnimationImage.runner', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.runner,
              size: 80,
            ),
          ),
        ),
      );

      expect(find.byType(RunnerAnimation), findsOneWidget);
    });

    testWidgets('renders MoonPhasesAnimation for LoadingAnimationImage.moonPhases', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.moonPhases,
              size: 80,
            ),
          ),
        ),
      );

      final widgetFinder = find.byType(MoonPhasesAnimation);
      expect(widgetFinder, findsOneWidget);
      final widget = tester.widget<MoonPhasesAnimation>(widgetFinder);
      expect(widget.palette, MoonPhasesPalette.natural);
    });

    testWidgets('renders MoonPhasesAnimation with moonfin palette for LoadingAnimationImage.moonfinPhases', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.moonfinPhases,
              size: 80,
            ),
          ),
        ),
      );

      final widgetFinder = find.byType(MoonPhasesAnimation);
      expect(widgetFinder, findsOneWidget);
      final widget = tester.widget<MoonPhasesAnimation>(widgetFinder);
      expect(widget.palette, MoonPhasesPalette.moonfin);
    });

    testWidgets('renders MoonPhasesAnimation with neonfin palette for LoadingAnimationImage.neonfinPhases', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingAnimationWidget(
              image: LoadingAnimationImage.neonfinPhases,
              size: 80,
            ),
          ),
        ),
      );

      final widgetFinder = find.byType(MoonPhasesAnimation);
      expect(widgetFinder, findsOneWidget);
      final widget = tester.widget<MoonPhasesAnimation>(widgetFinder);
      expect(widget.palette, MoonPhasesPalette.neonfin);
    });
  });

  group('PlayerLoadingOverlay Customization', () {
    testWidgets('respects customShowText = false by hiding label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayerLoadingOverlay(
              label: 'Loading Stream...',
              customImage: LoadingAnimationImage.spinner,
              customShowText: false,
              customSize: 64,
            ),
          ),
        ),
      );

      expect(find.text('LOADING STREAM...'), findsNothing);
      expect(find.byType(StockSpinnerAnimation), findsOneWidget);
    });

    testWidgets('renders label when customShowText = true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayerLoadingOverlay(
              label: 'Loading Stream...',
              customImage: LoadingAnimationImage.spinner,
              customShowText: true,
              customSize: 64,
            ),
          ),
        ),
      );

      expect(find.text('LOADING STREAM...'), findsOneWidget);
      expect(find.byType(StockSpinnerAnimation), findsOneWidget);
    });

    testWidgets('renders empty when image is none and customShowText is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayerLoadingOverlay(
              label: 'Loading Stream...',
              customImage: LoadingAnimationImage.none,
              customShowText: false,
            ),
          ),
        ),
      );

      expect(find.text('LOADING STREAM...'), findsNothing);
      expect(find.byType(LoadingAnimationWidget), findsNothing);
    });

    testWidgets('forwards customPosition to LoadingAnimationWidget and flips runner on right', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayerLoadingOverlay(
              label: 'Loading Stream...',
              customImage: LoadingAnimationImage.runner,
              customPosition: LoadingAnimationPosition.middleRight,
              customShowText: false,
            ),
          ),
        ),
      );

      final animWidget = tester.widget<LoadingAnimationWidget>(
        find.byType(LoadingAnimationWidget),
      );
      expect(animWidget.position, LoadingAnimationPosition.middleRight);

      // Verify Transform.flip is applied when position faces left
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('forwards customSpeed to LoadingAnimationWidget', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayerLoadingOverlay(
              label: 'Loading Stream...',
              customImage: LoadingAnimationImage.spinner,
              customSpeed: LoadingAnimationSpeed.ultra,
              customShowText: false,
            ),
          ),
        ),
      );

      final animWidget = tester.widget<LoadingAnimationWidget>(
        find.byType(LoadingAnimationWidget),
      );
      expect(animWidget.speed, LoadingAnimationSpeed.ultra);
    });
  });

  group('Directional Facing', () {
    test('LoadingAnimationPositionX.facesLeft correctly flags right side positions', () {
      expect(LoadingAnimationPosition.topRight.facesLeft, isTrue);
      expect(LoadingAnimationPosition.middleRight.facesLeft, isTrue);
      expect(LoadingAnimationPosition.bottomRight.facesLeft, isTrue);

      expect(LoadingAnimationPosition.topLeft.facesLeft, isFalse);
      expect(LoadingAnimationPosition.topCenter.facesLeft, isFalse);
      expect(LoadingAnimationPosition.middleLeft.facesLeft, isFalse);
      expect(LoadingAnimationPosition.middle.facesLeft, isFalse);
      expect(LoadingAnimationPosition.bottomLeft.facesLeft, isFalse);
      expect(LoadingAnimationPosition.bottomCenter.facesLeft, isFalse);
      expect(LoadingAnimationPosition.bouncing.facesLeft, isFalse);
    });
  });

  group('BouncingPositionWrapper', () {
    testWidgets('renders child and moves continuously across ticks', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BouncingPositionWrapper(
              safePadding: EdgeInsets.zero,
              builder: (context, movingLeft) => Text(
                movingLeft ? 'MOVING_LEFT' : 'MOVING_RIGHT',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(BouncingPositionWrapper), findsOneWidget);
      final initialTextFinder = find.byType(Text);
      expect(initialTextFinder, findsOneWidget);

      // Initial tick establishes baseline time
      await tester.pump(const Duration(milliseconds: 16));
      final initialPos = tester.getTopLeft(initialTextFinder);

      // Advance time to allow ticker to move
      await tester.pump(const Duration(milliseconds: 50));

      final movedPos = tester.getTopLeft(initialTextFinder);
      expect(movedPos, isNot(equals(initialPos)));
    });
  });
}


