import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_row_card_image.dart';
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

      expect(isHomeRowModern(resumeRow, prefs), isFalse);
      expect(isHomeRowModern(myMediaRow, prefs), isFalse);
      expect(isHomeRowModernMyMediaStatic(myMediaRow, prefs), isFalse);
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

      expect(isHomeRowModern(resumeRow, prefs), isTrue);
      expect(isHomeRowModern(myMediaRow, prefs), isTrue);
      expect(isHomeRowModernMyMediaStatic(myMediaRow, prefs), isFalse);
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
      expect(isHomeRowModern(resumeRow, prefs), isTrue);
      expect(isHomeRowModern(myMediaRow, prefs), isTrue);
      expect(isHomeRowModernMyMediaStatic(myMediaRow, prefs), isTrue);
      expect(isHomeRowModernMyMediaStatic(myMediaSmallRow, prefs), isTrue);
    });
  });
}
