import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/mediabar/banner_media_bar.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends ChangeNotifier implements MediaBarViewModel {
  _ViewModel(this.item);

  final MediaBarSlideItem item;

  @override
  List<MediaBarSlideItem> get items => [item];

  @override
  MediaBarState get state => MediaBarReady([item]);

  @override
  Map<String, double> ratingsFor(String itemId) => const {};

  @override
  Future<void> ensureRatings(String itemId) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Issue #1265: the Banner bar shows an item's banner art where it has one,
// leaving off the title it already carries.
void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.mediaBarAutoAdvance, false);
  });

  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  Future<void> pumpBar(WidgetTester tester, MediaBarSlideItem item) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: BannerMediaBar(
            viewModel: _ViewModel(item),
            prefs: prefs,
            height: 240,
            onOpen: (_) {},
            onPlay: (_) {},
          ),
        ),
      ),
    );
  }

  Iterable<String> imageUrls(WidgetTester tester) => tester
      .widgetList<BoundedNetworkImage>(find.byType(BoundedNetworkImage))
      .map((image) => image.imageUrl);

  const withBanner = MediaBarSlideItem(
    itemId: 'show',
    serverId: 'server',
    title: 'The Show',
    year: 2020,
    backdropUrl: 'http://server/backdrop',
    bannerUrl: 'http://server/banner',
  );

  testWidgets('a banner replaces the backdrop and the title on desktop', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pumpBar(tester, withBanner);

    expect(imageUrls(tester), ['http://server/banner', 'http://server/banner']);
    final whole = tester
        .widgetList<BoundedNetworkImage>(find.byType(BoundedNetworkImage))
        .where((image) => image.blurSigma == 0);
    expect(whole.single.fit, BoxFit.contain);
    expect(find.text('The Show'), findsNothing);
    expect(find.text('2020'), findsOneWidget);
  });

  testWidgets('an item without a banner keeps its backdrop and title', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pumpBar(
      tester,
      const MediaBarSlideItem(
        itemId: 'film',
        serverId: 'server',
        title: 'The Film',
        backdropUrl: 'http://server/backdrop',
      ),
    );

    expect(imageUrls(tester), ['http://server/backdrop']);
    expect(find.text('The Film'), findsOneWidget);
  });

  testWidgets('a phone keeps the backdrop even when there is a banner', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.bottom);
    await pumpBar(tester, withBanner);

    expect(imageUrls(tester), ['http://server/backdrop']);
    expect(find.text('The Show'), findsOneWidget);
  });
}
