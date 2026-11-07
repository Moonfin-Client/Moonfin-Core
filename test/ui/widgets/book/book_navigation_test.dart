import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';

AggregatedItem _item(String type, {bool isFolder = false}) => AggregatedItem(
  id: 'id-1',
  serverId: 'server',
  rawData: {
    'Id': 'id-1',
    'Name': 'Dune',
    'Type': type,
    if (isFolder) 'IsFolder': true,
  },
);

void main() {
  late BuildContext home;

  Future<void> pumpRouter(WidgetTester tester) async {
    Widget shows(GoRouterState state) => Text(state.uri.toString());
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, _) => Builder(
            builder: (context) {
              home = context;
              return const SizedBox.shrink();
            },
          ),
        ),
        GoRoute(path: '/item/:id', builder: (_, state) => shows(state)),
        GoRoute(path: '/player/book/:id', builder: (_, state) => shows(state)),
        GoRoute(path: '/search', builder: (_, state) => shows(state)),
        GoRoute(path: '/folder/:id', builder: (_, state) => shows(state)),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  Future<void> open(WidgetTester tester, AggregatedItem item) async {
    openBookLibraryItem(home, item, libraryId: 'lib-1');
    await tester.pumpAndSettle();
  }

  for (final type in ['Book', 'AudioBook', 'BookSeries']) {
    testWidgets('a $type opens its details', (tester) async {
      await pumpRouter(tester);
      await open(tester, _item(type));

      expect(find.text('/item/id-1?serverId=server&libraryId=lib-1'), findsOneWidget);
    });
  }

  testWidgets('a series folder opens the folder', (tester) async {
    await pumpRouter(tester);
    await open(tester, _item('BookSeries', isFolder: true));

    expect(find.textContaining('/folder/id-1'), findsOneWidget);
  });

  testWidgets('reading opens the reader', (tester) async {
    await pumpRouter(tester);
    readOrListenBook(home, _item('Book'), isAudiobook: false);
    await tester.pumpAndSettle();

    expect(find.text('/player/book/id-1?serverId=server'), findsOneWidget);
  });

  testWidgets('listening resumes from the details screen', (tester) async {
    await pumpRouter(tester);
    readOrListenBook(home, _item('AudioBook'), isAudiobook: true);
    await tester.pumpAndSettle();

    expect(find.textContaining('/item/id-1?'), findsOneWidget);
    expect(find.textContaining('autoPlay=true'), findsOneWidget);
  });

  testWidgets("the Apple TV dialog says why a book won't open", (tester) async {
    await pumpRouter(tester);
    showBookReadingUnavailableDialog(home);
    await tester.pumpAndSettle();

    expect(find.text("Books can't be read on Apple TV"), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text("Books can't be read on Apple TV"), findsNothing);
  });
}
