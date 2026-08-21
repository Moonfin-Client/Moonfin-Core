import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_previews.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Items with no artwork URLs, so every image resolves to the placeholder and
/// nothing touches the network. The layout code runs exactly the same either
/// way, which is what these tests are for.
List<MediaBarSlideItem> _fakeItems() => [
  for (var i = 0; i < 4; i++)
    MediaBarSlideItem(
      itemId: 'item$i',
      serverId: 'server',
      title: 'Sample Title $i',
      overview:
          'A long enough overview to wrap across a couple of lines in '
          'the preview and exercise the text layout paths.',
      officialRating: 'PG-13',
      year: 2020 + i,
      genres: const ['Action', 'Drama'],
      runtime: const Duration(hours: 1, minutes: 52),
      communityRating: 7.8,
    ),
];

const _mediaBarModes = [
  UserPreferences.mediaBarModeMoonfin,
  UserPreferences.mediaBarModeMakd,
  UserPreferences.mediaBarModeBookshelf,
  UserPreferences.mediaBarModeGallery,
  UserPreferences.mediaBarModeBanner,
  UserPreferences.mediaBarModeAya,
  UserPreferences.mediaBarModeOff,
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'http://server',
      'pref_last_user_id': 'user',
    });
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    SetupPreviewData.debugOverride = null;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.unregister<UserPreferences>();
  });

  Future<void> pumpPreview(WidgetTester tester, Widget preview) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Center(child: SizedBox(width: 320, child: preview)),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  }

  for (final layout in [
    InterfaceLayout.tv,
    InterfaceLayout.desktop,
    InterfaceLayout.phone,
  ]) {
    group('$layout', () {
      // The framework verifies the platform override is back to null before
      // tearDown callbacks run, so each test resets it in its own body.
      void setPlatform() {
        debugDefaultTargetPlatformOverride = layout == InterfaceLayout.desktop
            ? TargetPlatform.linux
            : TargetPlatform.android;
        PlatformDetection.setInterfaceLayout(layout);
      }

      testWidgets('live previews lay out with real items', (tester) async {
        setPlatform();
        SetupPreviewData.debugOverride = ValueNotifier(_fakeItems());
        for (final mode in _mediaBarModes) {
          await pumpPreview(tester, mediaBarPreview(mode));
        }
        await pumpPreview(tester, homeRowsPreview(modern: false));
        await pumpPreview(tester, homeRowsPreview(modern: true));
        await pumpPreview(tester, detailStylePreview(modern: false));
        await pumpPreview(tester, detailStylePreview(modern: true));
        debugDefaultTargetPlatformOverride = null;
      });

      testWidgets('an empty library falls back to the drawn stand-ins', (
        tester,
      ) async {
        setPlatform();
        SetupPreviewData.debugOverride = ValueNotifier(const []);
        for (final mode in _mediaBarModes) {
          await pumpPreview(tester, mediaBarPreview(mode));
        }
        await pumpPreview(tester, homeRowsPreview(modern: false));
        await pumpPreview(tester, detailStylePreview(modern: true));
        debugDefaultTargetPlatformOverride = null;
      });
    });
  }
}
