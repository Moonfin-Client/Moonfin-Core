import 'package:flutter/material.dart' hide RepeatMode;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/services/cast/cast_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/audio_player_screen.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin/util/platform_detection.dart';

class _Factory extends Fake implements MediaServerClientFactory {}

class _Mutations extends Fake implements ItemMutationRepository {}

class _Manager extends PlaybackManager {
  final transport = <String>[];

  @override
  Future<void> resume() async => transport.add('resume');

  @override
  void toggleShuffle() => transport.add('shuffle');

  @override
  void toggleRepeat() => transport.add('repeat');
}

void main() {
  late _Manager manager;
  late CastService castService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    manager = _Manager();
    castService = CastService(const []);
    GetIt.instance.registerSingleton<PlaybackManager>(manager);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<MediaServerClientFactory>(_Factory());
    GetIt.instance.registerSingleton<CastService>(castService);
    GetIt.instance.registerSingleton<ItemMutationRepository>(_Mutations());
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await castService.dispose();
    manager.dispose();
    await GetIt.instance.reset();
  });

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pump();
  }

  // Every control sits in one dock row, so left and right reach all of them
  // and up and down only move between the dock, the progress bar and the
  // panel.
  testWidgets('the D-pad walks the dock row and returns from the panel', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        routerConfig: GoRouter(
          routes: [
            GoRoute(path: '/', builder: (_, _) => const AudioPlayerScreen()),
          ],
        ),
      ),
    );
    await tester.pump();

    await press(tester, LogicalKeyboardKey.select);
    expect(manager.transport, ['resume'], reason: 'focus starts on play');

    for (var i = 0; i < 5; i++) {
      await press(tester, LogicalKeyboardKey.arrowLeft);
    }
    await press(tester, LogicalKeyboardKey.select);
    expect(manager.transport.last, 'shuffle', reason: 'stops at shuffle');

    // Up twice enters the Up Next panel. With no queue, down leaves it again.
    await press(tester, LogicalKeyboardKey.arrowUp);
    await press(tester, LogicalKeyboardKey.arrowUp);
    await press(tester, LogicalKeyboardKey.arrowDown);
    await press(tester, LogicalKeyboardKey.arrowDown);
    for (var i = 0; i < 4; i++) {
      await press(tester, LogicalKeyboardKey.arrowRight);
    }
    await press(tester, LogicalKeyboardKey.select);
    expect(manager.transport.last, 'repeat');

    // Left inside the panel leaves it for the progress bar without moving
    // along the dock. With no lyrics there's no toggle past Repeat.
    await press(tester, LogicalKeyboardKey.arrowRight);
    await press(tester, LogicalKeyboardKey.arrowUp);
    await press(tester, LogicalKeyboardKey.arrowUp);
    await press(tester, LogicalKeyboardKey.arrowLeft);
    await press(tester, LogicalKeyboardKey.arrowDown);
    for (var i = 0; i < 2; i++) {
      await press(tester, LogicalKeyboardKey.arrowLeft);
    }
    await press(tester, LogicalKeyboardKey.select);

    // Back inside the panel steps out to the progress bar. The app's Back
    // handler asks the interceptor first, so the test calls it directly.
    await press(tester, LogicalKeyboardKey.arrowUp);
    await press(tester, LogicalKeyboardKey.arrowUp);
    expect(InlineBackInterceptor.handleBack(), isTrue);
    await tester.pump();
    expect(InlineBackInterceptor.handleBack(), isFalse);
    await press(tester, LogicalKeyboardKey.arrowDown);
    await press(tester, LogicalKeyboardKey.select);
    expect(manager.transport, [
      'resume',
      'shuffle',
      'repeat',
      'resume',
      'resume',
    ]);

    await tester.pumpWidget(const SizedBox());
  });
}
