import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/genre_grid_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/artwork_fixture.dart';

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
    await GetIt.instance.reset();
    dir.deleteSync(recursive: true);
  });

  Future<void> pumpCard(WidgetTester tester, {int? decodeMaxWidth}) async {
    final png = (await tester.runAsync(() => writeTestPng(dir)))!;
    CachedNetworkImageProvider.defaultCacheManager = FakeArtworkCacheManager(png);
    final genre = GenreCardData(
      id: 'g',
      name: 'Drama',
      itemCount: 3,
      imageUrl: 'http://jellyfin.test/Items/g/Images/Primary',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 300,
          height: 200,
          child: decodeMaxWidth == null
              ? GenreGridCard(genre: genre, onTap: () {})
              : GenreGridCard(
                  genre: genre,
                  onTap: () {},
                  decodeMaxWidth: decodeMaxWidth,
                ),
        ),
      ),
    );
  }

  testWidgets('the artwork decode keeps the 1024 default', (tester) async {
    await pumpCard(tester);
    final image = tester.widget<BoundedNetworkImage>(
      find.byType(BoundedNetworkImage),
    );
    expect(image.maxWidth, 1024);
  });

  testWidgets('a screen can raise the decode ceiling to its request ceiling', (
    tester,
  ) async {
    await pumpCard(tester, decodeMaxWidth: 1202);
    final image = tester.widget<BoundedNetworkImage>(
      find.byType(BoundedNetworkImage),
    );
    expect(image.maxWidth, 1202);
  });
}
