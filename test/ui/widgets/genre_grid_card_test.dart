import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/genre_grid_card.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/artwork_fixture.dart';

/// The density TvUiScale hands down on an Apple TV at each output.
const _tv4k = 2.0 * 1920 / 1150;
const _tv1080p = 1.0 * 1920 / 1150;

void main() {
  late Directory dir;

  setUp(() async {
    dir = Directory.systemTemp.createTempSync('genre_card');
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
    dir.deleteSync(recursive: true);
  });

  /// The decode width of a 700 point wide genre card, wide enough that the
  /// ceiling binds at every density here, on a display of [dpr].
  Future<int?> decodeWidth(WidgetTester tester, double dpr) async {
    tester.view.devicePixelRatio = dpr;
    tester.view.physicalSize = Size(1150 * dpr, 647 * dpr);
    addTearDown(tester.view.reset);
    final png = (await tester.runAsync(() => writeTestPng(dir)))!;
    CachedNetworkImageProvider.defaultCacheManager = FakeArtworkCacheManager(png);
    await tester.pumpWidget(
      MaterialApp(
        home: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 700,
            height: 111,
            child: GenreGridCard(
              genre: GenreCardData(
                id: 'g',
                name: 'Drama',
                itemCount: 3,
                imageUrl: 'http://jellyfin.test/Items/g/Images/Primary',
              ),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
    return tester
        .widget<CachedNetworkImage>(find.byType(CachedNetworkImage))
        .memCacheWidth;
  }

  testWidgets('a wide genre card on a 4K TV decodes up to the request ceiling', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    expect(genreCardDecodeMaxWidth(_tv4k), 1202);
    expect(await decodeWidth(tester, _tv4k), 1202);
  });

  testWidgets('a 1080p TV keeps the 1024 decode ceiling', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    expect(genreCardDecodeMaxWidth(_tv1080p), 1024);
    expect(await decodeWidth(tester, _tv1080p), 1024);
  });

  testWidgets('off TV a dense phone keeps the 1024 decode ceiling', (
    tester,
  ) async {
    expect(genreCardDecodeMaxWidth(3.0), 1024);
    expect(await decodeWidth(tester, 3.0), 1024);
  });
}
