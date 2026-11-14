import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:moonfin/ui/screens/watch_party/silo_watch_party_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _NoPlayback extends Fake implements PlaybackManager {}

/// A server without Moonbase.
class _NoMoonbase implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString('', 404);

  @override
  void close({bool force = false}) {}
}

class _Server extends Fake implements MediaServerClient {
  _Server(this.serverType);

  @override
  final ServerType serverType;
}

class _Pushes extends NavigatorObserver {
  int count = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => count++;
}

void main() {
  late AppLocalizations l10n;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(UserPreferences(store))
      ..registerSingleton<SiloWatchPartyManager>(
        SiloWatchPartyManager(
          _NoPlayback(),
          dio: Dio()..httpClientAdapter = _NoMoonbase(),
        ),
      );
    l10n = lookupAppLocalizations(const Locale('en'));
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  // The settings page sits in the panel's own navigator, in a column beside
  // the preview, as it does in the app.
  Future<(_Pushes, _Pushes)> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final root = _Pushes();
    final panel = _Pushes();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [root],
        home: Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 600,
                child: Navigator(
                  observers: [panel],
                  onGenerateRoute: (_) => MaterialPageRoute<void>(
                    builder: (_) => watchPartySettingsScreenForTesting(),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return (root, panel);
  }

  Future<void> opensFullScreenAndBackReturns(
    WidgetTester tester, {
    required bool tv,
  }) async {
    final (root, panel) = await pump(tester);
    final open = find.text(l10n.settingsOpenGroups);
    await tester.ensureVisible(open);
    await tester.pumpAndSettle();
    if (tv) {
      Focus.of(tester.element(open)).requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    } else {
      await tester.tap(open);
    }
    await tester.pumpAndSettle();

    // Above settings on the app's navigator, filling the window.
    expect(root.count, 2);
    expect(panel.count, 1);
    expect(
      tester.getSize(find.byType(SiloWatchPartyScreen)),
      const Size(1600, 900),
    );

    // Back is one step, to this settings page.
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(SiloWatchPartyScreen), findsNothing);
    expect(open, findsOneWidget);
    if (tv) {
      final focused = FocusManager.instance.primaryFocus?.context;
      expect(focused, isNotNull);
      expect(
        find.descendant(of: find.byWidget(focused!.widget), matching: open),
        findsOneWidget,
      );
    }
  }

  testWidgets('Open Watch Parties fills the window and Back returns to '
      'settings, on desktop', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await opensFullScreenAndBackReturns(tester, tv: false);
  });

  testWidgets('Open Watch Parties fills the screen and Back returns to the '
      'same row, on TV', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await opensFullScreenAndBackReturns(tester, tv: true);
  });

  for (final (type, shown) in [
    (ServerType.jellyfin, true),
    (ServerType.emby, false),
  ]) {
    testWidgets('SyncPlay correction ${shown ? 'shows' : 'is hidden'} on '
        '${type.name}', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      GetIt.instance
        ..unregister<SiloWatchPartyManager>()
        ..registerSingleton<MediaServerClient>(_Server(type));
      await pump(tester);
      await tester.drag(find.byType(ListView), const Offset(0, -3000));
      await tester.pumpAndSettle();
      expect(
        find.text(l10n.settingsSyncplayExtraOffset),
        shown ? findsOneWidget : findsNothing,
      );
    });
  }
}
