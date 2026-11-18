import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

class _Offline extends Mock implements OfflineRepository {}

class _Playback extends Mock implements PlaybackManager {}

class _Queue extends Mock implements QueueService {}

// Hovering grows a button to show its label. On the last button of a line
// that growth does not fit, so the row wrapped it onto the next line, out from
// under the pointer, and it shrank and wrapped back, over and over.
void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final sync = _Sync();
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final seerrPrefs = _SeerrPrefs();
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    final users = _Users();
    when(() => users.currentUserStream).thenAnswer((_) => const Stream.empty());
    GetIt.instance.registerSingleton<UserRepository>(users);

    final offline = _Offline();
    when(() => offline.getItem(any())).thenAnswer((_) async => null);
    GetIt.instance.registerSingleton<OfflineRepository>(offline);

    final queue = _Queue();
    final playback = _Playback();
    when(() => playback.queueService).thenReturn(queue);
    GetIt.instance.registerSingleton<PlaybackManager>(playback);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpRow(WidgetTester tester, double width) async {
    final vm = _ViewModel();
    when(() => vm.item).thenReturn(
      AggregatedItem(
        id: 'movie-1',
        serverId: 'server-1',
        rawData: const {'Id': 'movie-1', 'Type': 'Movie'},
      ),
    );
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.supportsPersonalRating).thenReturn(false);
    when(() => vm.actionsSettled).thenReturn(true);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: width,
              child: DetailActionButtons(
                viewModel: vm,
                itemId: 'movie-1',
                onSelectedMediaSourceChanged: (_) {},
                modernStyle: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('hovering the last button of a line does not move it', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    // Wide enough that every button rests on one line to learn where the last
    // one ends, then just wide enough for that and no more.
    await pumpRow(tester, 1200);
    final buttons = find.descendant(
      of: find.byType(DetailActionButtons),
      matching: find.byType(MouseRegion),
    );
    final last = buttons.evaluate().length - 1;
    final rest = tester.getRect(buttons.at(last));
    final restingTop = rest.top;
    final restingRight = rest.right;

    await pumpRow(tester, restingRight + 20);
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.getRect(buttons.at(last)).top, restingTop);

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(tester.getCenter(buttons.at(last)));

    // Frame by frame, because the bug is a button that keeps changing line.
    for (var frame = 0; frame < 12; frame++) {
      await tester.pump(const Duration(milliseconds: 50));
      expect(
        tester.getRect(buttons.at(last)).top,
        restingTop,
        reason: 'frame $frame',
      );
    }

    // The label it would have grown to show is in a tooltip.
    final tooltip = tester.widget<Tooltip>(find.byType(Tooltip).last);
    expect(find.text(tooltip.message!), findsOneWidget);
  });

  testWidgets('focus grows a button in place, so it still animates', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await pumpRow(tester, 1200);
    // Play takes focus a frame or two in, so it settles before another button
    // is focused.
    await tester.pump(const Duration(milliseconds: 100));
    final circle = find
        .descendant(
          of: find.byType(DetailActionButtons),
          matching: find.byType(AnimatedContainer),
        )
        .last;
    final state = tester.state(circle);
    final restingWidth = tester.getSize(circle).width;

    Focus.of(tester.element(circle)).requestFocus();
    await tester.pump();
    expect(tester.state(circle), same(state));

    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.getSize(circle).width, greaterThan(restingWidth));
  });
}
