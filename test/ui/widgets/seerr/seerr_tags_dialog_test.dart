import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_browse_chip.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_tags_dialog.dart';

SeerrMediaDetailState _state({
  List<SeerrGenre> genres = const [],
  List<SeerrKeyword> keywords = const [],
}) => SeerrMediaDetailState(
  movie: SeerrMovieDetails(
    id: 1,
    title: 'Alien',
    genres: genres,
    keywords: keywords,
  ),
);

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

void main() {
  testWidgets('lists each section it has something to show for', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        SeerrTagsDialog(
          state: _state(
            genres: const [SeerrGenre(id: 1, name: 'Horror')],
            keywords: const [SeerrKeyword(id: 2, name: 'space')],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Genres'), findsOneWidget);
    expect(find.text('Horror'), findsOneWidget);
    expect(find.text('Tags'), findsOneWidget);
    expect(find.text('space'), findsOneWidget);

    // This title has no networks, so that heading stays away rather than
    // sitting above an empty row.
    expect(find.text('Networks'), findsNothing);
  });

  testWidgets('gives the first chip a focus node so back out of the close '
      'button lands somewhere', (tester) async {
    await tester.pumpWidget(
      _app(
        SeerrTagsDialog(
          state: _state(
            genres: const [
              SeerrGenre(id: 1, name: 'Horror'),
              SeerrGenre(id: 2, name: 'Sci-Fi'),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final chips = tester
        .widgetList<SeerrBrowseChip>(find.byType(SeerrBrowseChip))
        .toList();

    expect(chips.first.focusNode, isNotNull);
    expect(
      chips.skip(1).every((chip) => chip.focusNode == null),
      isTrue,
      reason: 'only the first chip is the landing spot',
    );
  });

  testWidgets('carries a label for the close button', (tester) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(
      _app(
        SeerrTagsDialog(
          state: _state(genres: const [SeerrGenre(id: 1, name: 'Horror')]),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('Close'), findsAtLeastNWidgets(1));
    semantics.dispose();
  });

  testWidgets('shows nothing but the header when the title has no tags', (
    tester,
  ) async {
    await tester.pumpWidget(_app(SeerrTagsDialog(state: _state())));
    await tester.pumpAndSettle();

    expect(find.byType(SeerrBrowseChip), findsNothing);
    expect(find.text('Genres'), findsNothing);
    expect(find.text('Genres and Tags'), findsOneWidget);
  });
}
