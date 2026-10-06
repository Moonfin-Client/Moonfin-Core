import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../data/services/plugin_sync_service.dart';
import '../l10n/app_localizations.dart';
import 'button_layout.dart';
import 'preference_constants.dart';
import 'user_preferences.dart';

const _classic = DetailScreenStyle.classic;
const _modern = DetailScreenStyle.modern;
const _spotlight = DetailScreenStyle.spotlight;
const _nouveau = DetailScreenStyle.nouveau;
const _minimalist = DetailScreenStyle.minimalist;

/// Where a [DetailSection] sits on the settings screen.
enum DetailSectionGroup { header, sections, seerr, person, collection, other }

/// A part of the Details screen a user can switch off. Each style draws only
/// some of these, in its own way: the cast is a row on Classic, a tab on
/// Modern, a card on Spotlight and a rail on Nouveau, and one switch covers
/// every one of them.
///
/// Ids are what gets stored, so renaming one brings back whatever the user had
/// hidden with it.
enum DetailSection {
  logo('logo', Icons.branding_watermark_outlined, DetailSectionGroup.header, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
    _minimalist,
  }),
  tagline('tagline', Icons.format_quote, DetailSectionGroup.header, {
    _classic,
    _modern,
    _spotlight,
  }),
  poster('poster', Icons.image_outlined, DetailSectionGroup.header, {_classic}),
  versionBadge(
    'versionBadge',
    Icons.video_file_outlined,
    DetailSectionGroup.header,
    {_modern, _spotlight},
  ),
  upNext('upNext', Icons.skip_next_outlined, DetailSectionGroup.header, {
    _classic,
    _modern,
  }),
  lyrics('lyrics', Icons.lyrics, DetailSectionGroup.header, {_classic}),
  cast('cast', Icons.people_outline, DetailSectionGroup.sections, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  crew('crew', Icons.movie_creation_outlined, DetailSectionGroup.sections, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  studios('studios', Icons.business_outlined, DetailSectionGroup.sections, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  chapters('chapters', Icons.bookmarks_outlined, DetailSectionGroup.sections, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  extras('extras', Icons.video_library_outlined, DetailSectionGroup.sections, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  collections(
    'collections',
    Icons.collections_bookmark_outlined,
    DetailSectionGroup.sections,
    {_classic, _modern, _spotlight},
  ),
  moreLikeThis(
    'moreLikeThis',
    Icons.recommend_outlined,
    DetailSectionGroup.sections,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  moreEpisodes(
    'moreEpisodes',
    Icons.view_list_outlined,
    DetailSectionGroup.sections,
    {_classic, _modern, _spotlight},
  ),
  mediaInfo('mediaInfo', Icons.info_outline, DetailSectionGroup.sections, {
    _modern,
    _nouveau,
    _spotlight,
  }),
  seerrGenresTags(
    'seerrGenresTags',
    Icons.sell_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  seerrStats('seerrStats', Icons.bar_chart, DetailSectionGroup.seerr, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  seerrRecommendations(
    'seerrRecommendations',
    Icons.auto_awesome_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  seerrSimilar(
    'seerrSimilar',
    Icons.grid_view_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  seerrCollection(
    'seerrCollection',
    Icons.collections_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight},
  ),
  seerrPersonAppearances(
    'seerrPersonAppearances',
    Icons.theaters_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  seerrPersonCrew(
    'seerrPersonCrew',
    Icons.engineering_outlined,
    DetailSectionGroup.seerr,
    {_classic, _modern, _spotlight, _nouveau},
  ),
  biography('biography', Icons.article_outlined, DetailSectionGroup.person, {
    _classic,
    _modern,
    _spotlight,
    _nouveau,
  }),
  birthplace('birthplace', Icons.place_outlined, DetailSectionGroup.person, {
    _classic,
    _modern,
    _nouveau,
  }),
  guestAppearances(
    'guestAppearances',
    Icons.person_add_alt_outlined,
    DetailSectionGroup.person,
    {_classic, _nouveau},
  ),
  musicVideos(
    'musicVideos',
    Icons.music_video_outlined,
    DetailSectionGroup.person,
    {_classic, _nouveau},
  ),
  playlistOrder(
    'playlistOrder',
    Icons.format_list_numbered,
    DetailSectionGroup.collection,
    {_modern, _spotlight, _nouveau},
  ),
  bookGenres('bookGenres', Icons.category_outlined, DetailSectionGroup.other, {
    _classic,
  }),
  photoExif('photoExif', Icons.camera_alt_outlined, DetailSectionGroup.other, {
    _classic,
  });

  const DetailSection(this.id, this.icon, this.group, this.styles);

  final String id;
  final IconData icon;
  final DetailSectionGroup group;

  /// The styles that draw this section themselves.
  final Set<DetailScreenStyle> styles;

  /// Whether picking [style] can put this section on screen. Minimalist only
  /// draws video pages and hands every other page to Spotlight, so it also
  /// shows whatever Spotlight does.
  bool isAvailableIn(DetailScreenStyle style) =>
      styles.contains(style) ||
      (style == DetailScreenStyle.minimalist &&
          styles.contains(DetailScreenStyle.spotlight));

  /// Whether this device and server can show it at all.
  bool get isOffered => switch (group) {
    DetailSectionGroup.seerr =>
      GetIt.instance.isRegistered<PluginSyncService>() &&
          GetIt.instance<PluginSyncService>().seerrAvailable,
    _ => true,
  };

  String label(AppLocalizations l10n) => switch (this) {
    DetailSection.logo => l10n.detailSectionLogo,
    DetailSection.tagline => l10n.detailSectionTagline,
    DetailSection.poster => l10n.detailSectionPoster,
    DetailSection.versionBadge => l10n.detailSectionVersionBadge,
    DetailSection.upNext => l10n.detailSectionUpNext,
    DetailSection.lyrics => l10n.detailSectionLyrics,
    DetailSection.cast => l10n.detailSectionCast,
    DetailSection.crew => l10n.detailSectionCrew,
    DetailSection.studios => l10n.detailSectionStudios,
    DetailSection.chapters => l10n.detailSectionChapters,
    DetailSection.extras => l10n.detailSectionExtras,
    DetailSection.collections => l10n.detailSectionCollections,
    DetailSection.moreLikeThis => l10n.detailSectionMoreLikeThis,
    DetailSection.moreEpisodes => l10n.detailSectionMoreEpisodes,
    DetailSection.mediaInfo => l10n.detailSectionMediaInfo,
    DetailSection.seerrGenresTags => l10n.detailSectionSeerrGenresTags,
    DetailSection.seerrStats => l10n.detailSectionSeerrStats,
    DetailSection.seerrRecommendations =>
      l10n.detailSectionSeerrRecommendations,
    DetailSection.seerrSimilar => l10n.detailSectionSeerrSimilar,
    DetailSection.seerrCollection => l10n.detailSectionSeerrCollection,
    DetailSection.seerrPersonAppearances =>
      l10n.detailSectionSeerrPersonAppearances,
    DetailSection.seerrPersonCrew => l10n.detailSectionSeerrPersonCrew,
    DetailSection.biography => l10n.detailSectionBiography,
    DetailSection.birthplace => l10n.detailSectionBirthplace,
    DetailSection.guestAppearances => l10n.detailSectionGuestAppearances,
    DetailSection.musicVideos => l10n.detailSectionMusicVideos,
    DetailSection.playlistOrder => l10n.detailSectionPlaylistOrder,
    DetailSection.bookGenres => l10n.detailSectionBookGenres,
    DetailSection.photoExif => l10n.detailSectionPhotoExif,
  };

  String? subtitle(AppLocalizations l10n) => switch (this) {
    DetailSection.logo => l10n.detailSectionLogoSubtitle,
    DetailSection.cast => l10n.detailSectionCastSubtitle,
    DetailSection.moreLikeThis => l10n.detailSectionMoreLikeThisSubtitle,
    DetailSection.moreEpisodes => l10n.detailSectionMoreEpisodesSubtitle,
    DetailSection.mediaInfo => l10n.detailSectionMediaInfoSubtitle,
    DetailSection.seerrPersonAppearances ||
    DetailSection.seerrPersonCrew => l10n.detailSectionPersonPagesSubtitle,
    _ => null,
  };
}

/// Which [DetailSection]s the Details screen draws, read once per build.
@immutable
class DetailSectionVisibility {
  const DetailSectionVisibility(this._hidden);

  factory DetailSectionVisibility.of(UserPreferences prefs) =>
      DetailSectionVisibility(detailSectionLayout.hidden(prefs));

  /// Everything on, for callers with no preferences to read.
  static const all = DetailSectionVisibility({});

  final Set<String> _hidden;

  bool shows(DetailSection section) => !_hidden.contains(section.id);

  @override
  bool operator ==(Object other) =>
      other is DetailSectionVisibility && setEquals(other._hidden, _hidden);

  @override
  int get hashCode => Object.hashAllUnordered(_hidden);
}

/// The hidden Details screen sections, kept per kind of device like the
/// metadata row. There's no order: each style lays its sections out itself.
final detailSectionLayout = ButtonLayout(
  hiddenTv: UserPreferences.hiddenDetailSectionsTv,
  hiddenMobile: UserPreferences.hiddenDetailSectionsMobile,
  hiddenDesktop: UserPreferences.hiddenDetailSectionsDesktop,
);
