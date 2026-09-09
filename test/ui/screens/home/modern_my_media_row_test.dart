import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<UserPreferences> createPreferences({
    HomeRowsStyle style = HomeRowsStyle.v2,
    bool modernCardsOnMyMedia = true,
  }) async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'pref_home_rows_style': style.name,
      'pref_modern_cards_my_media': modernCardsOnMyMedia,
    });
    final store = PreferenceStore();
    await store.init();
    return UserPreferences(store);
  }

  group('Modern My Media cards row behavior', () {
    test('all rows are not modern when Classic layout is active', () async {
      final prefs = await createPreferences(
        style: HomeRowsStyle.v1,
        modernCardsOnMyMedia: true,
      );

      const resumeRow = HomeRow(
        id: 'resume',
        title: 'Continue Watching',
        rowType: HomeRowType.resume,
      );
      const myMediaRow = HomeRow(
        id: 'libraryTiles',
        title: 'My Media',
        rowType: HomeRowType.libraryTiles,
      );

      expect(HomeScreen.isRowModern(resumeRow, prefs), isFalse);
      expect(HomeScreen.isRowModern(myMediaRow, prefs), isFalse);
      expect(HomeScreen.isModernMyMediaStatic(myMediaRow, prefs), isFalse);
    });

    test('My Media row uses modern layout with expansion when toggle is enabled in Modern style', () async {
      final prefs = await createPreferences(
        style: HomeRowsStyle.v2,
        modernCardsOnMyMedia: true,
      );

      const resumeRow = HomeRow(
        id: 'resume',
        title: 'Continue Watching',
        rowType: HomeRowType.resume,
      );
      const myMediaRow = HomeRow(
        id: 'libraryTiles',
        title: 'My Media',
        rowType: HomeRowType.libraryTiles,
      );

      expect(HomeScreen.isRowModern(resumeRow, prefs), isTrue);
      expect(HomeScreen.isRowModern(myMediaRow, prefs), isTrue);
      expect(HomeScreen.isModernMyMediaStatic(myMediaRow, prefs), isFalse);
    });

    test('My Media row remains in modern layout with static mirrored thumbnails when toggle is disabled in Modern style', () async {
      final prefs = await createPreferences(
        style: HomeRowsStyle.v2,
        modernCardsOnMyMedia: false,
      );

      const resumeRow = HomeRow(
        id: 'resume',
        title: 'Continue Watching',
        rowType: HomeRowType.resume,
      );
      const myMediaRow = HomeRow(
        id: 'libraryTiles',
        title: 'My Media',
        rowType: HomeRowType.libraryTiles,
      );
      const myMediaSmallRow = HomeRow(
        id: 'libraryTilesSmall',
        title: 'My Media',
        rowType: HomeRowType.libraryTilesSmall,
      );

      // Sizing stays in modern engine to mirror the expanded thumbnail dimensions of the next rows
      expect(HomeScreen.isRowModern(resumeRow, prefs), isTrue);
      expect(HomeScreen.isRowModern(myMediaRow, prefs), isTrue);
      expect(HomeScreen.isModernMyMediaStatic(myMediaRow, prefs), isTrue);
      expect(HomeScreen.isModernMyMediaStatic(myMediaSmallRow, prefs), isTrue);
    });
  });
}
