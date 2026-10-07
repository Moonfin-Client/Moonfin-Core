import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_channel_cell.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_filter_rail.dart';
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_hero_preview.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_layout_profile.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_guide_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPlaybackManager extends Mock implements PlaybackManager {}

class _MockImageApi extends Mock implements ImageApi {}

late DateTime _windowStart;

FocusNode _nodeLabelled(WidgetTester tester, String label) => tester
    .widgetList<Focus>(find.byType(Focus))
    .map((focus) => focus.focusNode)
    .whereType<FocusNode>()
    .firstWhere((node) => node.debugLabel == label);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;
  late _MockImageApi imageApi;
  late List<Map<String, dynamic>> channels;
  late List<Map<String, dynamic>> programs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    _windowStart = guideLeftEdge(DateTime.now());
    channels = [
      for (var i = 0; i < 8; i++)
        <String, dynamic>{
          'Id': 'ch$i',
          'Name': i == 0 ? 'Channel Zero' : 'Channel $i',
          'ChannelNumber': '${100 + i + 1}',
          'ImageTags': <String, dynamic>{'Primary': 'channel-tag'},
          'UserData': <String, dynamic>{'IsFavorite': false},
        },
    ];
    programs = [
      <String, dynamic>{
        'Id': 'p1',
        'ChannelId': 'ch0',
        'Name': 'Airing Now Show',
        'StartDate': _windowStart.toIso8601String(),
        'EndDate': _windowStart
            .add(const Duration(hours: 13))
            .toIso8601String(),
      },
    ];

    final playback = _MockPlaybackManager();
    when(() => playback.backend).thenReturn(null);
    when(() => playback.backendChangedStream)
        .thenAnswer((_) => const Stream<PlayerBackend>.empty());
    GetIt.instance.registerSingleton<PlaybackManager>(playback);

    client = _MockMediaServerClient();
    liveTvApi = _MockLiveTvApi();
    imageApi = _MockImageApi();
    when(() => client.liveTvApi).thenReturn(liveTvApi);
    when(() => client.imageApi).thenReturn(imageApi);
    when(
      () => imageApi.getPrimaryImageUrl(
        any(),
        maxHeight: any(named: 'maxHeight'),
        tag: any(named: 'tag'),
      ),
    ).thenReturn('https://example.test/channel.png');
    when(() => client.userId).thenReturn('user');
    when(
      () => liveTvApi.getChannels(
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((_) async => <String, dynamic>{'Items': channels});
    when(
      () => liveTvApi.getGuide(
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channelIds: any(named: 'channelIds'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImages: any(named: 'enableImages'),
        enableUserData: any(named: 'enableUserData'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((_) async => <String, dynamic>{'Items': programs});

    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<AppLocalizations> pumpGuide(
    WidgetTester tester, {
    Size surface = const Size(900, 700),
    double textScale = 1.0,
  }) async {
    tester.view.physicalSize = surface;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // The interface size setting reaches the guide the way the app hands
        // it down, as a scaler over everything below it.
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: const LiveTvGuideScreen(),
      ),
    );
    await tester.pumpAndSettle();
    return AppLocalizations.of(tester.element(find.byType(LiveTvGuideScreen)));
  }

  testWidgets('the genre rail sits above the hero band', (tester) async {
    await pumpGuide(tester);

    final rail = tester.getRect(find.byType(EpgFilterRail));
    final hero = tester.getRect(find.byType(EpgHeroPreview));

    expect(rail.bottom, lessThanOrEqualTo(hero.top));
  });

  testWidgets('the Now control sits below the hero and above the grid', (
    tester,
  ) async {
    final l10n = await pumpGuide(tester);

    final now = tester.getRect(find.text(l10n.now));
    final hero = tester.getRect(find.byType(EpgHeroPreview));
    final firstRow = tester.getRect(find.byType(EpgChannelCell).first);

    expect(now.top, greaterThanOrEqualTo(hero.bottom));
    expect(now.bottom, lessThanOrEqualTo(firstRow.top));
    expect(
      now.left,
      lessThan(tester.getRect(find.byType(LiveTvGuideScreen)).center.dx),
      reason: 'the window control is left-aligned',
    );
  });

  testWidgets('the window range text moves down with the Now control', (
    tester,
  ) async {
    final l10n = await pumpGuide(tester);

    final range = find.textContaining('–');
    expect(range, findsOneWidget);
    expect(
      tester.getRect(range).top,
      greaterThanOrEqualTo(tester.getRect(find.byType(EpgHeroPreview)).bottom),
    );
    expect(
      tester.getRect(range).center.dy,
      closeTo(tester.getRect(find.text(l10n.now)).center.dy, 8),
    );
  });

  testWidgets('the genre rail scrolls horizontally', (tester) async {
    await pumpGuide(tester);

    final scrollable = tester.widget<Scrollable>(
      find.descendant(
        of: find.byType(EpgFilterRail),
        matching: find.byType(Scrollable),
      ),
    );

    expect(scrollable.axisDirection, AxisDirection.right);
  });

  testWidgets('the hero previews the channel and what it is airing when the '
      'channel column has focus', (tester) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideChannel:0').requestFocus();
    await tester.pumpAndSettle();

    final inHero = find.descendant(
      of: find.byType(EpgHeroPreview),
      matching: find.byType(Text),
    );
    final texts = tester
        .widgetList<Text>(inHero)
        .map((t) => t.data ?? '')
        .toList();

    expect(texts, contains('Channel Zero'));
    expect(texts, contains('Airing Now Show'));
    // The channel number belonged to the removed logo block.
    expect(texts.any((t) => t.contains('101')), isFalse);
    expect(
      find.descendant(
        of: find.byType(EpgHeroPreview),
        matching: find.byType(CachedNetworkImage),
      ),
      findsOneWidget,
    );
  });

  testWidgets('the hero keeps the channel logo when a program cell has focus', (
    tester,
  ) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideProgramRow0:0').requestFocus();
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(EpgHeroPreview),
        matching: find.byType(CachedNetworkImage),
      ),
      findsOneWidget,
    );
  });

  testWidgets('compact landscape chrome leaves five full guide rows visible', (
    tester,
  ) async {
    const surface = Size(960, 540);
    await pumpGuide(tester, surface: surface);

    final rail = tester.getRect(find.byType(EpgFilterRail));
    final hero = tester.getRect(find.byType(EpgHeroPreview));
    final l10n = AppLocalizations.of(
      tester.element(find.byType(LiveTvGuideScreen)),
    );
    final now = tester.getRect(find.text(l10n.now));
    final channelCells = find.byType(EpgChannelCell);
    final area = guideAvailableArea(
      maxWidth: surface.width,
      maxHeight: surface.height,
      landscape: true,
      miniPlayerMode: false,
    );
    final profile = GuideLayoutProfile.fromAvailableArea(
      availableWidth: area.width,
      availableHeight: area.height,
    );

    expect(hero.height, closeTo(EpgHeroPreview.compactHeight, 0.1));
    expect(hero.top - rail.bottom, lessThanOrEqualTo(8));
    expect(now.top - hero.bottom, lessThanOrEqualTo(8));
    expect(channelCells.evaluate().length, greaterThanOrEqualTo(5));

    final fifth = tester.getRect(channelCells.at(4));
    // The parent row reserves one pixel for its bottom divider.
    expect(fifth.height, closeTo(profile.rowHeight - 1, 0.1));
    expect(fifth.bottom, lessThanOrEqualTo(surface.height - 16));
  });

  /// The canvas every television lays out on, and a panel small enough that
  /// the guide has to give something up. It has to hold together on both, and
  /// the canvas is where the row height was derived, so it carries the floor
  /// the derivation was aiming at.
  const tvCanvases = {
    'the television canvas': (surface: Size(1324, 745), rows: 8),
    'a surface below it': (surface: Size(960, 540), rows: 5),
  };

  /// Rows sitting whole inside the screen, which is what a viewer can read
  /// without scrolling.
  int wholeRows(WidgetTester tester) {
    final screen = tester.getRect(find.byType(LiveTvGuideScreen));
    final cells = find.byType(EpgChannelCell);
    var whole = 0;
    for (var i = 0; i < cells.evaluate().length; i++) {
      final row = tester.getRect(cells.at(i));
      if (row.top >= screen.top - 0.5 && row.bottom <= screen.bottom + 0.5) {
        whole++;
      }
    }
    return whole;
  }

  testWidgets('a larger interface size trades guide rows for room to read', (
    tester,
  ) async {
    const canvas = Size(1324, 745);
    await pumpGuide(tester, surface: canvas);
    final regular = wholeRows(tester);

    await pumpGuide(tester, surface: canvas, textScale: 1.3);
    final scaled = wholeRows(tester);

    // A row that held still while its text grew clipped it top and bottom,
    // which an overflow reports here.
    expect(tester.takeException(), isNull);
    expect(scaled, lessThan(regular), reason: 'taller rows mean fewer of them');
    expect(
      scaled,
      greaterThanOrEqualTo(5),
      reason: 'the guide still has to be worth scrolling',
    );
  });

  for (final entry in tvCanvases.entries) {
    testWidgets('the guide fits its chrome on ${entry.key}', (tester) async {
      await pumpGuide(tester, surface: entry.value.surface);

      // An overflow throws in a widget test, so this catches a row or a cell
      // that has outgrown the room the chrome left it.
      expect(tester.takeException(), isNull, reason: entry.key);
      expect(
        wholeRows(tester),
        greaterThanOrEqualTo(entry.value.rows),
        reason: entry.key,
      );
    });
  }

  testWidgets('DOWN from the genre rail descends through the controls row', (
    tester,
  ) async {
    await pumpGuide(tester);

    _nodeLabelled(tester, 'GuideFilter:0').requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'GuideWindowBar:0');

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'GuideChannel:0');
  });

  testWidgets('a clipped rail scrolls the focused chip into view', (
    tester,
  ) async {
    final l10n = await pumpGuide(tester, surface: const Size(600, 700));

    final scrollable = find.descendant(
      of: find.byType(EpgFilterRail),
      matching: find.byType(Scrollable),
    );
    final position = tester.state<ScrollableState>(scrollable).position;
    expect(
      position.maxScrollExtent,
      greaterThan(0),
      reason: 'the chips must overflow for this test to mean anything',
    );

    _nodeLabelled(tester, 'GuideFilter:7').requestFocus();
    await tester.pumpAndSettle();

    expect(position.pixels, greaterThan(0));
    final rail = tester.getRect(find.byType(EpgFilterRail));
    final chip = tester.getRect(find.text(l10n.favorites));
    expect(chip.left, greaterThanOrEqualTo(rail.left - 1));
    expect(chip.right, lessThanOrEqualTo(rail.right + 1));
  });
}
