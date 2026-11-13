import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/unified_server_picker.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../unified_ui_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _ItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => Future.value(<String, dynamic>{
    'Id': invocation.positionalArguments.first,
    'Type': 'Movie',
  });
}

/// A Home card for a movie, with one copy per entry of [servers] when the
/// card comes from the catalog.
AggregatedItem _card(
  String id,
  String name, {
  List<String> servers = const [],
}) =>
    AggregatedItem(
      id: id,
      serverId: servers.firstOrNull ?? 'http://a.test',
      rawData: {
        'Id': id,
        'Name': name,
        'Type': 'Movie',
        'UserData': {'Played': false, 'PlayedPercentage': 40.0},
        if (servers.isNotEmpty)
          unifiedCopiesKey: [
            for (final server in servers)
              UnifiedCopy(
                serverId: server,
                itemId: '$server${id.substring(1)}',
                serverName: 'Server $server',
                played: false,
                positionTicks: 0,
                playedPercentage: null,
                reachable: true,
              ).toJson(),
          ],
      },
    );

/// The cards of a Home row, wired the way Home wires them.
class _Row extends StatelessWidget {
  const _Row(this.items, {this.autoPlay = false});

  final List<AggregatedItem> items;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: LockedFocusRow<AggregatedItem>(
      items: items,
      hubKey: 'row',
      itemExtent: 160,
      height: 320,
      autofocus: true,
      onTap: (_, item) =>
          HomeScreen.openItem(context, item, autoPlay: autoPlay),
      itemBuilder: (context, item, _, isFocused) => MediaCard(
        title: item.name,
        width: 160,
        aspectRatio: 2 / 3,
        playedPercentage: item.playedPercentage,
        bottomLeftBadge: unifiedServerCountBadgeFor(item),
        onTap: () => HomeScreen.openItem(context, item, autoPlay: autoPlay),
      ),
    ),
  );
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final client = _Client();
    when(() => client.itemsApi).thenReturn(_ItemsApi());
    final factory = _Factory();
    when(() => factory.getClientIfExists(any())).thenReturn(client);
    GetIt.instance
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<MediaServerClientFactory>(factory);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  final shared = _card('a1', 'Akundel', servers: ['a', 'b']);
  final single = _card('a2', 'Bantrel');
  final onOne = _card('a3', 'Coswen', servers: ['a']);

  Future<void> open(WidgetTester tester, {bool autoPlay = false}) async {
    tester.view.physicalSize = const Size(1600, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => _Row([shared, single, onOne], autoPlay: autoPlay),
        ),
      ],
      errorBuilder: (_, state) => Scaffold(body: Text('opened ${state.uri}')),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('only a title several servers hold carries the server count '
      'badge', (tester) async {
    await open(tester);

    final badge = find.byType(UnifiedServerCountBadge);
    expect(badge, findsOneWidget);
    expect(
      find.descendant(of: cardFinder('Akundel'), matching: badge),
      findsOneWidget,
    );
    expect(
      find.descendant(of: badge, matching: find.text('2')),
      findsOneWidget,
    );
    expect(unifiedServerCountBadgeFor(single), isNull);
    expect(unifiedServerCountBadgeFor(onOne), isNull);
  });

  testWidgets('a tap on a shared title opens the server picker, then opens '
      'the copy on the server chosen', (tester) async {
    await open(tester);

    await tester.tap(cardFinder('Akundel'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsOneWidget);
    expect(find.textContaining('opened'), findsNothing);

    await tester.tap(inPicker('Server b'));
    await tester.pumpAndSettle();

    expect(find.textContaining('opened /item/b1'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
  });

  testWidgets('a title on one server opens straight away', (tester) async {
    await open(tester);

    await tester.tap(cardFinder('Bantrel'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsNothing);
    expect(find.textContaining('opened /item/a2'), findsOneWidget);
    expect(find.textContaining('serverId=http://a.test'), findsOneWidget);
  });

  testWidgets('a card from the catalog with a single copy opens straight '
      'away', (tester) async {
    await open(tester);

    await tester.tap(cardFinder('Coswen'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsNothing);
    expect(find.textContaining('opened /item/a3'), findsOneWidget);
  });

  testWidgets('a row that plays on select opens the server picker, then '
      'plays from the server chosen', (tester) async {
    await open(tester, autoPlay: true);

    await tester.tap(cardFinder('Akundel'));
    await tester.pumpAndSettle();
    await tester.tap(inPicker('Server a'));
    await tester.pumpAndSettle();

    expect(find.textContaining('opened /item/a1'), findsOneWidget);
    expect(find.textContaining('autoPlay=true'), findsOneWidget);
  });

  group('on a TV', () {
    testWidgets('select on a shared title opens the server picker and opens '
        'the server chosen', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();
      expect(find.text('Select Server'), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
    });

    testWidgets('backing out of the server picker puts focus back on the '
        'row', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);
      final row = FocusManager.instance.primaryFocus!;
      expect(row.context!.findAncestorWidgetOfExactType<_Row>(), isNotNull);

      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();
      expect(find.text('Select Server'), findsOneWidget);
      expect(row.hasPrimaryFocus, isFalse);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      expect(find.text('Select Server'), findsNothing);
      expect(find.textContaining('opened'), findsNothing);
      expect(row.hasPrimaryFocus, isTrue);

      // The row still answers the remote.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();
      expect(find.textContaining('opened /item/a2'), findsOneWidget);
    });
  });
}
