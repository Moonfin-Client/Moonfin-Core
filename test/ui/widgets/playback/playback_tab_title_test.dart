import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/playback/playback_tab_title.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  late PlaybackManager manager;
  late List<String> tabTitles;

  setUp(() {
    manager = PlaybackManager();
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
  });

  tearDown(() async {
    manager.dispose();
    await GetIt.instance.reset();
  });

  Future<void> pumpApp(WidgetTester tester) async {
    tabTitles = [];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'SystemChrome.setApplicationSwitcherDescription') {
          tabTitles.add((call.arguments as Map)['label'] as String);
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        builder: (context, child) => PlaybackTabTitle(child: child!),
        home: const SizedBox(),
      ),
    );
  }

  Future<void> play(WidgetTester tester, Map<String, dynamic> item) async {
    manager.queueService.setQueue([
      AggregatedItem(id: item['Id'], serverId: 'server', rawData: item),
    ]);
    manager.state.setPlaying(true);
    await tester.pumpAndSettle();
  }

  testWidgets('the tab shows the app name while nothing plays', (tester) async {
    await pumpApp(tester);

    expect(tabTitles.last, 'Moonfin');
  });

  testWidgets('the tab is named after the film that is playing', (
    tester,
  ) async {
    await pumpApp(tester);
    await play(tester, {'Id': 'film', 'Name': 'Hamilton', 'Type': 'Movie'});

    expect(tabTitles.last, 'Hamilton - Moonfin');
  });

  testWidgets('an episode carries its series name', (tester) async {
    await pumpApp(tester);
    await play(tester, {
      'Id': 'ep',
      'Name': 'Good News About Hell',
      'Type': 'Episode',
      'SeriesName': 'Severance',
    });

    expect(tabTitles.last, 'Severance - Good News About Hell - Moonfin');
  });

  testWidgets('the app name comes back once playback stops', (tester) async {
    await pumpApp(tester);
    await play(tester, {'Id': 'film', 'Name': 'Hamilton', 'Type': 'Movie'});

    manager.state.setPlaying(false);
    await tester.pumpAndSettle();

    expect(tabTitles.last, 'Moonfin');
  });
}
