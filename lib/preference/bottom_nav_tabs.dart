import 'user_preferences.dart';

/// Destinations that can be pinned between Home and You on the mobile bottom
/// navbar. The names are the wire format of [UserPreferences.bottomNavbarTabs],
/// so renaming one breaks every synced profile that holds it.
enum BottomNavTab { search, libraries, favorites, genres, liveTv, discover, folders }

const int kMaxPinnedBottomNavTabs = 3;

// Libraries sits second so a user on default settings keeps it on the bar.
const List<BottomNavTab> _autoOrder = [
  BottomNavTab.search,
  BottomNavTab.libraries,
  BottomNavTab.favorites,
  BottomNavTab.liveTv,
  BottomNavTab.discover,
  BottomNavTab.genres,
  BottomNavTab.folders,
];

final Map<String, BottomNavTab> _byName = {
  for (final tab in BottomNavTab.values) tab.name.toLowerCase(): tab,
};

/// Reads a stored pin list. Unknown names, which a newer client may have
/// synced, are dropped along with duplicates and anything past the limit.
List<BottomNavTab> parsePinnedBottomNavTabs(String raw) {
  final pins = <BottomNavTab>[];
  for (final part in raw.split(',')) {
    final tab = _byName[part.trim().toLowerCase()];
    if (tab == null || pins.contains(tab)) continue;
    pins.add(tab);
    if (pins.length == kMaxPinnedBottomNavTabs) break;
  }
  return pins;
}

String serializePinnedBottomNavTabs(Iterable<BottomNavTab> tabs) =>
    tabs.take(kMaxPinnedBottomNavTabs).map((t) => t.name).join(',');

/// Whether [raw] leaves the pins to be picked automatically. A list whose
/// names are all unknown counts, so a profile from a newer client falls back
/// to something sensible instead of an empty bar.
bool isAutomaticBottomNavTabs(String raw) =>
    parsePinnedBottomNavTabs(raw).isEmpty;

/// The settings that decide whether a [BottomNavTab] is on offer at all. Only
/// preferences and plugin state feed it, never loaded data, so the pins and
/// their colours don't shift while libraries are still loading.
class BottomNavTabGates {
  final bool kidsMode;
  final bool showLibraries;
  final bool showFavorites;
  final bool showGenres;
  final bool showLiveTv;
  final bool showSeerr;
  final bool seerrAvailable;
  final bool folderView;

  const BottomNavTabGates({
    this.kidsMode = false,
    this.showLibraries = true,
    this.showFavorites = true,
    this.showGenres = true,
    this.showLiveTv = false,
    this.showSeerr = true,
    this.seerrAvailable = false,
    this.folderView = false,
  });

  factory BottomNavTabGates.fromPreferences(
    UserPreferences prefs, {
    required bool seerrAvailable,
  }) {
    return BottomNavTabGates(
      kidsMode: prefs.get(UserPreferences.kidsModeEnabled),
      showLibraries: prefs.get(UserPreferences.showLibrariesInToolbar),
      showFavorites: prefs.get(UserPreferences.showFavoritesButton),
      showGenres: prefs.get(UserPreferences.showGenresButton),
      showLiveTv: prefs.get(UserPreferences.showLiveTvButton),
      showSeerr: prefs.get(UserPreferences.showSeerrButton),
      seerrAvailable: seerrAvailable,
      folderView: prefs.get(UserPreferences.enableFolderView),
    );
  }

  // Kids Mode drops Libraries (the My Media row stands in), Live TV (its route
  // bounces home) and Seerr.
  bool offers(BottomNavTab tab) => switch (tab) {
        BottomNavTab.search => true,
        BottomNavTab.libraries => !kidsMode && showLibraries,
        BottomNavTab.favorites => showFavorites,
        BottomNavTab.genres => showGenres,
        BottomNavTab.liveTv => !kidsMode && showLiveTv,
        BottomNavTab.discover => !kidsMode && showSeerr && seerrAvailable,
        BottomNavTab.folders => folderView,
      };

  /// The tabs the bar shows between Home and You. Automatic pins follow the
  /// nav button switches without anything being stored. Explicit pins are
  /// only filtered, never topped up, so turning a button off doesn't slip an
  /// unchosen tab onto the bar.
  List<BottomNavTab> resolvePins(String raw) {
    final explicit = parsePinnedBottomNavTabs(raw);
    if (explicit.isNotEmpty) return explicit.where(offers).toList();
    return _autoOrder.where(offers).take(kMaxPinnedBottomNavTabs).toList();
  }
}
