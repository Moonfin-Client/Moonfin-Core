import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/playlist_sort_filter_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildTestWidget({required Widget child}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  group('PlaylistSortFilterBar Widget Tests', () {
    testWidgets('renders sort and filter pill buttons with default state', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          child: PlaylistSortFilterBar(
            sortBy: LibrarySortBy.playlistOrder,
            sortDirection: SortDirection.ascending,
            onSortChanged: (_) {},
            playedFilter: PlayedStatusFilter.all,
            favoriteOnly: false,
            onFilterChanged: (_, _, _) {},
            onReset: () {},
            totalCount: 10,
            filteredCount: 10,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Sort:'), findsOneWidget);
      expect(find.textContaining('Playlist Order'), findsOneWidget);
      expect(find.textContaining('Filter:'), findsOneWidget);
      expect(find.textContaining('All'), findsOneWidget);
      // Reset button should not be visible when defaults are active
      expect(find.byIcon(Icons.restart_alt_rounded), findsNothing);
    });

    testWidgets('displays reset button and active indicator when sort is non-default', (tester) async {
      bool resetCalled = false;
      final sortNode = FocusNode();

      await tester.pumpWidget(
        buildTestWidget(
          child: PlaylistSortFilterBar(
            sortBy: LibrarySortBy.name,
            sortDirection: SortDirection.ascending,
            onSortChanged: (_) {},
            playedFilter: PlayedStatusFilter.all,
            favoriteOnly: false,
            onFilterChanged: (_, _, _) {},
            onReset: () => resetCalled = true,
            totalCount: 10,
            filteredCount: 10,
            sortFocusNode: sortNode,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Sort: Name'), findsOneWidget);
      expect(find.byIcon(Icons.restart_alt_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.restart_alt_rounded));
      await tester.pumpAndSettle();
      expect(resetCalled, isTrue);
      expect(sortNode.hasFocus, isTrue);
      sortNode.dispose();
    });

    testWidgets('tapping sort pill opens sort dialog and selects new sort', (tester) async {
      (LibrarySortBy, SortDirection)? selectedSort;

      await tester.pumpWidget(
        buildTestWidget(
          child: PlaylistSortFilterBar(
            sortBy: LibrarySortBy.playlistOrder,
            sortDirection: SortDirection.ascending,
            onSortChanged: (s) => selectedSort = s,
            playedFilter: PlayedStatusFilter.all,
            favoriteOnly: false,
            onFilterChanged: (_, _, _) {},
            onReset: () {},
            totalCount: 10,
            filteredCount: 10,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap sort pill
      await tester.tap(find.textContaining('Sort:'));
      await tester.pumpAndSettle();

      // Dialog opens with Sort By title
      expect(find.byType(PlaylistSortDialog), findsOneWidget);
      expect(find.text('Date added'), findsOneWidget);

      // Tap Date added
      await tester.tap(find.text('Date added'));
      await tester.pumpAndSettle();

      // Dialog closes and callback was invoked
      expect(find.byType(PlaylistSortDialog), findsNothing);
      expect(selectedSort, isNotNull);
      expect(selectedSort!.$1, LibrarySortBy.dateAdded);
      expect(selectedSort!.$2, SortDirection.ascending);
    });

    testWidgets('tapping filter pill opens filter dialog and changes filter', (tester) async {
      PlayedStatusFilter? selectedPlayed;
      bool? selectedFav;

      await tester.pumpWidget(
        buildTestWidget(
          child: PlaylistSortFilterBar(
            sortBy: LibrarySortBy.playlistOrder,
            sortDirection: SortDirection.ascending,
            onSortChanged: (_) {},
            playedFilter: PlayedStatusFilter.all,
            favoriteOnly: false,
            onFilterChanged: (p, f, _) {
              selectedPlayed = p;
              selectedFav = f;
            },
            onReset: () {},
            totalCount: 10,
            filteredCount: 10,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap filter pill
      await tester.tap(find.textContaining('Filter:'));
      await tester.pumpAndSettle();

      // Dialog opens with Filters title
      expect(find.byType(PlaylistFilterDialog), findsOneWidget);

      // Tap Unwatched
      expect(find.text('Unwatched'), findsOneWidget);
      await tester.tap(find.text('Unwatched'));
      await tester.pumpAndSettle();

      expect(selectedPlayed, PlayedStatusFilter.unwatched);
      expect(selectedFav, isFalse);

      // Tap Done
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      expect(find.byType(PlaylistFilterDialog), findsNothing);
    });
  });
}
