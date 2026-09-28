import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show DesktopUiScale;
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

const _title =
    'Speedrun To Redemption - Hazbin Hotel, Erika Henningsen, Blake Roman';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    final manager = _FakePlaybackManager();
    manager.queueService.setQueue([
      AggregatedItem(
        id: 'song',
        serverId: 's1',
        rawData: const {
          'Id': 'song',
          'Type': 'Audio',
          'Name': 'Speedrun To Redemption',
          'Artists': ['Hazbin Hotel', 'Erika Henningsen', 'Blake Roman'],
        },
      ),
    ]);
    GetIt.instance
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<PlaybackManager>(manager)
      ..registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpBar(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: TopMusicBar())),
    );
  }

  // MarqueeText holds a pause timer while it waits to scroll, and the test
  // binding fails on a timer left running.
  Future<void> unmount(WidgetTester tester) =>
      tester.pumpWidget(const SizedBox());

  testWidgets('a long title is capped and scrolls on desktop', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pumpBar(tester);

    final marquee = find.byType(MarqueeText);
    expect(tester.widget<MarqueeText>(marquee).text, _title);
    expect(tester.getSize(marquee).width, 280);
    await unmount(tester);
  });

  testWidgets('the cap grows with the UI scale', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await prefs.set(
      UserPreferences.desktopUiScale,
      DesktopUiScale.extraLarge,
    );
    await pumpBar(tester);

    expect(
      tester.getSize(find.byType(MarqueeText)).width,
      closeTo(364, 0.001),
    );
    await unmount(tester);
  });

  testWidgets('a phone keeps the ellipsized title', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await pumpBar(tester);

    expect(find.byType(MarqueeText), findsNothing);
    expect(
      tester.widget<Text>(find.text(_title)).overflow,
      TextOverflow.ellipsis,
    );
  });
}
