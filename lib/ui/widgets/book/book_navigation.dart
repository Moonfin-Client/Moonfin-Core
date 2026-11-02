import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../adaptive/adaptive_dialog.dart';
import '../navigation_layout.dart';
import '../overlay_sheet.dart';

/// The places a book library's navigation leads, each with its own screen.
enum BookCategoryKind {
  titles,
  series,
  authors,
  genres,
  collections,
  favorites,
  discover;

  static BookCategoryKind? parse(String? name) =>
      values.where((kind) => kind.name == name).firstOrNull;

  String label(AppLocalizations l10n) => switch (this) {
    titles => l10n.titles,
    series => l10n.series,
    authors => l10n.authors,
    genres => l10n.genres,
    collections => l10n.collections,
    favorites => l10n.favorites,
    discover => l10n.discover,
  };

  IconData get icon => switch (this) {
    titles => Icons.library_books_outlined,
    series => Icons.layers_outlined,
    authors => Icons.person_outline_rounded,
    genres => Icons.sell_outlined,
    collections => Icons.collections_bookmark_outlined,
    favorites => Icons.favorite_border_rounded,
    discover => Icons.explore_outlined,
  };
}

/// Opens a title from a book library on its details screen, or the browse
/// page that fits a series, genre, collection or folder.
void openBookLibraryItem(
  BuildContext context,
  AggregatedItem item, {
  required String libraryId,
}) {
  final type = item.type;
  final isFolder = item.rawData['IsFolder'] as bool? ?? false;
  // A series named only by metadata has no folder to open, and an author known
  // only by name has no item.
  if ((type == 'BookSeries' && !isFolder) ||
      (type == 'Person' && item.id == item.name)) {
    context.push(Destinations.searchInLibrary(libraryId, query: item.name));
    return;
  }
  if (type == 'Genre') {
    context.push(
      Destinations.genre(item.name, genreId: item.id, parentId: libraryId),
    );
    return;
  }
  if (type == 'BoxSet') {
    context.push(Destinations.collection(item.id));
    return;
  }
  if (isFolder || type == 'Folder' || type == 'CollectionFolder') {
    context.push(Destinations.folder(item.id, serverId: item.serverId));
    return;
  }
  context.push(Destinations.item(item.id, serverId: item.serverId));
}

/// Opens the reader for a book or comic, and resumes an audiobook through
/// its details screen, which owns playback.
void readOrListenBook(
  BuildContext context,
  AggregatedItem item, {
  required bool isAudiobook,
}) {
  if (isAudiobook) {
    context.push(
      Destinations.item(item.id, serverId: item.serverId, autoPlay: true),
    );
    return;
  }
  if (PlatformDetection.isAppleTV) {
    showBookReadingUnavailableDialog(context);
    return;
  }
  context.push(Destinations.book(item.id, serverId: item.serverId));
}

/// tvOS has no web view for the reader, so opening a book or comic there
/// explains that instead.
Future<void> showBookReadingUnavailableDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return showFocusRestoringDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(l10n.bookReadingUnavailableTitle),
      content: Text(l10n.bookReadingUnavailableMessage),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.of(ctx).pop(),
          isDefault: true,
          autofocus: true,
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

/// Moves D-pad focus up or down a book library's [coordinator] chain from
/// [fromIndex]. Up past the top goes to the navbar.
bool moveBookFocus(RowFocusCoordinator coordinator, int fromIndex, bool isUp) {
  if (coordinator.moveVertical(fromIndex: fromIndex, isUp: isUp)) return true;
  final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
  if (!isUp || focusNavbar == null) return false;
  focusNavbar();
  return true;
}

bool get _sidebarIsLeft =>
    GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) ==
    NavbarPosition.left;

/// Left past a book library's first item, onto the sidebar when there's one.
void focusBookSidebar() {
  if (_sidebarIsLeft) NavigationLayout.focusNavbarNotifier.value?.call();
}

/// The sidebar draws over a wide book library, so its content starts past it.
double get bookSidebarInset =>
    _sidebarIsLeft && !PlatformDetection.useMobileUi ? 52 : 0;

/// Nothing has focus, or it fell back to a scope because the focused node
/// left the tree.
bool get bookFocusIsLost {
  final primary = FocusManager.instance.primaryFocus;
  return primary == null || primary is FocusScopeNode;
}
