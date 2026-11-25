import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/folder_browse_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/util/platform_detection.dart';

import 'book_category_test_harness.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = await setUpBookScreens(
      FakeBookLibrary(
        titles: [
          for (var i = 0; i < 12; i++)
            bookTitle('v$i', 'Lesson $i', type: 'Video'),
        ],
      ),
    );
    // The library size is a per-user setting, so it needs someone signed in.
    await prefs.set(UserPreferences.lastServerId, 'server');
    await prefs.set(UserPreferences.lastUserId, 'user-1');
  });

  tearDown(tearDownBookScreens);

  Future<double> cardWidth(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const FolderBrowseScreen(folderId: 'lib-1'),
      ),
    );
    await tester.pumpAndSettle();
    return tester.getSize(find.byType(MediaCard).first).width;
  }

  double thumbWidth(PosterSize size) => size.landscapeHeight * 16 / 9;

  testWidgets('folder cards follow the library Poster Size', (tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    await prefs.set(UserPreferences.libraryPosterSize, PosterSize.small);
    expect(await cardWidth(tester), lessThan(thumbWidth(PosterSize.medium)));

    await prefs.set(UserPreferences.libraryPosterSize, PosterSize.extraLarge);
    expect(
      await cardWidth(tester),
      greaterThanOrEqualTo(thumbWidth(PosterSize.extraLarge)),
    );
  });
}
