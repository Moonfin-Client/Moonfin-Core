import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/book/book_navigation.dart';
import 'book_category_screen.dart';
import 'classic_book_browse_screen.dart';
import 'reading_room_book_screen.dart';

/// A book library in the style picked in Settings, swapped as soon as the
/// setting changes.
class BookLibraryScreen extends StatelessWidget {
  final String libraryId;
  final String? collectionType;

  const BookLibraryScreen({
    super.key,
    required this.libraryId,
    this.collectionType,
  });

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    return ListenableBuilder(
      listenable: prefs,
      builder: (context, _) =>
          switch (prefs.get(UserPreferences.bookLibraryStyle)) {
            BookLibraryStyle.classic => ClassicBookBrowseScreen(
              libraryId: libraryId,
              collectionType: collectionType,
            ),
            BookLibraryStyle.readingRoom => ReadingRoomBookScreen(
              libraryId: libraryId,
              collectionType: collectionType,
            ),
            BookLibraryStyle.bookstore => BookCategoryScreen(
              libraryId: libraryId,
              kind: BookCategoryKind.titles,
              collectionType: collectionType,
              root: true,
            ),
          },
    );
  }
}
