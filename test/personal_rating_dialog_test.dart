import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/widgets/personal_rating_dialog.dart';

Widget _app({
  required FocusNode focusNode,
  required PersonalRatingStyle style,
  int intervals = 11,
  double? rating,
  bool? likes,
  required Future<void> Function(bool) onThumb,
  required Future<void> Function(double) onNumeric,
  required Future<void> Function() onClear,
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Builder(
        builder: (context) => ElevatedButton(
          focusNode: focusNode,
          onPressed: () => PersonalRatingDialog.show(
            context,
            style: style,
            intervals: intervals,
            rating: rating,
            likes: likes,
            onSetThumbRating: onThumb,
            onSetNumericRating: onNumeric,
            onClearRating: onClear,
          ),
          child: const Text('Open'),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('thumbs mode saves a like and restores focus', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    bool? savedLike;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.thumbs,
        onThumb: (likes) async => savedLike = likes,
        onNumeric: (_) async {},
        onClear: () async {},
      ),
    );

    focusNode.requestFocus();
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Like'));
    await tester.pumpAndSettle();

    expect(savedLike, isTrue);
    expect(focusNode.hasFocus, isTrue);
  });

  testWidgets('stars mode saves half-star values', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    double? savedRating;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.stars,
        rating: 9,
        onThumb: (_) async {},
        onNumeric: (rating) async => savedRating = rating,
        onClear: () async {},
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.star_half), findsOneWidget);
    final thirdStar = find.byKey(const ValueKey('personal_rating_star_2'));
    final thirdStarBounds = tester.getRect(thirdStar);
    await tester.tapAt(
      Offset(thirdStarBounds.left + thirdStarBounds.width * 0.25, thirdStarBounds.center.dy),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(savedRating, isNotNull);
    expect(savedRating, 5);
  });

  testWidgets('numeric mode clears an existing rating', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var cleared = false;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.numeric,
        rating: 8,
        likes: true,
        onThumb: (_) async {},
        onNumeric: (_) async {},
        onClear: () async => cleared = true,
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clear rating'));
    await tester.pumpAndSettle();

    expect(cleared, isTrue);
  });

  testWidgets('numeric mode steps down to the previous integer', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.numeric,
        rating: 8,
        onThumb: (_) async {},
        onNumeric: (_) async {},
        onClear: () async {},
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Decrease'));
    await tester.pump();

    expect(find.text('7 / 10'), findsOneWidget);
  });

  testWidgets('cancel button closes dialog without saving', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    double? savedRating;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.numeric,
        rating: 8,
        onThumb: (_) async {},
        onNumeric: (rating) async => savedRating = rating,
        onClear: () async {},
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Increase'));
    await tester.pump();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(savedRating, isNull);
    expect(find.text('Cancel'), findsNothing);
  });

  testWidgets('numeric mode respects 21 and 41 intervals', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    double? savedRating;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.numeric,
        intervals: 41,
        rating: 8,
        onThumb: (_) async {},
        onNumeric: (rating) async => savedRating = rating,
        onClear: () async {},
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Increase'));
    await tester.pump();
    expect(find.text('8.25 / 10'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(savedRating, 8.25);
  });

  testWidgets('stars mode at 21 intervals supports quarter-star taps',
      (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    double? savedRating;

    await tester.pumpWidget(
      _app(
        focusNode: focusNode,
        style: PersonalRatingStyle.stars,
        intervals: 21,
        rating: 4,
        onThumb: (_) async {},
        onNumeric: (rating) async => savedRating = rating,
        onClear: () async {},
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    final thirdStar = find.byKey(const ValueKey('personal_rating_star_2'));
    final bounds = tester.getRect(thirdStar);
    await tester.tapAt(
      Offset(bounds.left + bounds.width * 0.1, bounds.center.dy),
    );
    await tester.pumpAndSettle();
    expect(find.text('2.25 / 5'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(savedRating, 4.5);
  });
}
