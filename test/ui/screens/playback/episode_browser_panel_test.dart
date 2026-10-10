import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/episode_browser.dart';
import 'package:moonfin/ui/screens/playback/episode_browser_panel.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/sliding_pill_tabs.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ItemsApi implements ItemsApi {
  _ItemsApi(this.seasons);

  final List<Map<String, dynamic>> seasons;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getSeasons) {
      return Future.value(<String, dynamic>{'Items': seasons});
    }
    if (invocation.memberName == #getEpisodes) {
      return Future.value(<String, dynamic>{
        'Items': [
          for (var number = 1; number <= 3; number++)
            {
              'Id': 's2-e$number',
              'Type': 'Episode',
              'Name': 'Chapter $number',
              'Overview': 'What happens in chapter $number.',
              'SeriesId': 'series',
              'ParentIndexNumber': 2,
              'IndexNumber': number,
            },
        ],
      });
    }
    return super.noSuchMethod(invocation);
  }
}

class _Client implements MediaServerClient {
  _Client(List<Map<String, dynamic>> seasons) : items = _ItemsApi(seasons);

  final _ItemsApi items;

  @override
  ItemsApi get itemsApi => items;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ImageApi implements ImageApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

final _playing = AggregatedItem(
  id: 's2-e2',
  serverId: 'srv',
  rawData: {
    'Id': 's2-e2',
    'Type': 'Episode',
    'SeriesId': 'series',
    'SeasonId': 's2',
  },
);

const _twoSeasons = [
  {'Id': 's1', 'Name': 'Season 1', 'IndexNumber': 1},
  {'Id': 's2', 'Name': 'Season 2', 'IndexNumber': 2},
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late List<AggregatedItem> picked;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    picked = [];
  });

  tearDown(() => GetIt.instance.reset());

  Future<EpisodeBrowserController> pump(
    WidgetTester tester, {
    List<Map<String, dynamic>> seasons = _twoSeasons,
  }) async {
    final browser = EpisodeBrowserController(
      client: _Client(seasons),
      playing: _playing,
    );
    addTearDown(browser.dispose);
    browser.open(_playing);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: EpisodeBrowserPanel(
            controller: browser,
            imageApi: _ImageApi(),
            onSelect: picked.add,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return browser;
  }

  testWidgets(
    'lists the open season and hands the remote to the episode that is playing',
    (tester) async {
      await pump(tester);

      expect(find.text('Season 2 · Episode 1'), findsOneWidget);
      expect(find.text('Chapter 3'), findsOneWidget);
      expect(find.text('What happens in chapter 2.'), findsOneWidget);
      expect(FocusManager.instance.primaryFocus?.debugLabel, 'Episode s2-e2');
    },
  );

  testWidgets('offers season tabs only when there is more than one season', (
    tester,
  ) async {
    await pump(tester);
    expect(find.byType(SlidingPillTabs), findsOneWidget);

    await pump(tester, seasons: [_twoSeasons.last]);
    expect(find.byType(SlidingPillTabs), findsNothing);
  });

  testWidgets('hands over the episode chosen by the remote or a tap', (
    tester,
  ) async {
    await pump(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.tap(find.text('Chapter 3'));

    expect(picked.map((episode) => episode.id), ['s2-e2', 's2-e3']);
  });

  testWidgets('leaves the descriptions out when spoilers are hidden', (
    tester,
  ) async {
    await prefs.set(UserPreferences.hideDetailsMediaDescription, true);
    await pump(tester);

    expect(find.text('Chapter 2'), findsOneWidget);
    expect(find.textContaining('What happens'), findsNothing);
  });
}
