import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/rating_display.dart';

Widget _app(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  testWidgets('a personal rating leads the row without any picker setup',
      (tester) async {
    await tester.pumpWidget(
      _app(
        const RatingsRow(
          ratings: {},
          communityRating: 7.8,
          personalRating: 9.0,
        ),
      ),
    );

    expect(find.text('9.0'), findsOneWidget);
    expect(find.text('7.8'), findsOneWidget);
    final personal = tester.getTopLeft(find.text('9.0'));
    final community = tester.getTopLeft(find.text('7.8'));
    expect(personal.dx, lessThan(community.dx));
  });

  testWidgets('an unrated item renders no personal slot', (tester) async {
    await tester.pumpWidget(
      _app(const RatingsRow(ratings: {}, communityRating: 7.8)),
    );

    expect(find.text('7.8'), findsOneWidget);
    expect(find.text('My Rating'), findsNothing);
  });

  testWidgets(
      'with the extra ratings picker active the personal slot needs enabling',
      (tester) async {
    await tester.pumpWidget(
      _app(
        const RatingsRow(
          ratings: {},
          personalRating: 9.0,
          enableAdditionalRatings: true,
          enabledRatings: 'stars,imdb',
        ),
      ),
    );
    expect(find.text('9.0'), findsNothing);

    await tester.pumpWidget(
      _app(
        const RatingsRow(
          ratings: {},
          personalRating: 9.0,
          enableAdditionalRatings: true,
          enabledRatings: 'personal,stars,imdb',
        ),
      ),
    );
    expect(find.text('9.0'), findsOneWidget);
  });
}
