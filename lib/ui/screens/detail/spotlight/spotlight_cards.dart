import 'package:flutter/material.dart';
import 'package:server_core/server_core.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/repositories/tmdb_repository.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/user_preferences.dart';
import '../../../widgets/seerr/seerr_item_status.dart' show seerrItemTabState;
import '../item_detail_screen.dart' show DetailTrackList;
import '../modern/modern_detail_content.dart'
    show
        extraCategoriesOrder,
        getExtraCategory,
        getExtraCategoryLabel,
        studioLogoIndex;
import 'spotlight_images.dart';
import 'widgets/spotlight_modal_grids.dart';
import 'widgets/spotlight_section_modal.dart';

/// The item-level actions a Spotlight summary card's modal content can invoke.
/// Every implementation closes the modal before navigating or starting
/// playback, so the dialog route never ends up orphaned under a pushed page.
class SpotlightCardActions {
  final void Function(AggregatedItem item) openItem;
  final void Function(SeerrDiscoverItem item) openSeerrItem;
  final void Function(String personId) openPerson;
  final void Function(String studioName) openStudio;
  final void Function(Duration position) playFromChapter;
  final void Function(AggregatedItem extra) playExtra;
  final void Function(int index) playTrack;
  final void Function(int index) playPlaylistTrack;
  final FocusNode Function(String trackId) trackFocusNode;

  const SpotlightCardActions({
    required this.openItem,
    required this.openSeerrItem,
    required this.openPerson,
    required this.openStudio,
    required this.playFromChapter,
    required this.playExtra,
    required this.playTrack,
    required this.playPlaylistTrack,
    required this.trackFocusNode,
  });
}

/// One Spotlight summary card: what it shows on the details screen and the
/// sectioned content of the modal it opens.
class SpotlightCardSpec {
  final String id;
  final String title;
  final String subtitle;
  final String? imageUrl;
  final IconData icon;
  final List<SpotlightModalSection> sections;

  const SpotlightCardSpec({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.icon,
    required this.sections,
  });
}

/// A runtime for a card subtitle or the hero's metadata row: "1h 32m", "2h",
/// or "48m".
String spotlightRuntimeLabel(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes % 60;
  if (h > 0) return m > 0 ? '${h}h ${m}m' : '${h}h';
  return '${m}m';
}

/// Builds the Spotlight summary cards for [item] from the view model's
/// current state. Cards whose every section would be empty are omitted, and
/// counts refresh as the view model's lazy loads (episodes, features, similar)
/// fill in, because the caller rebuilds on view-model notifications.
List<SpotlightCardSpec> spotlightCardsFor({
  required ItemDetailViewModel vm,
  required AggregatedItem item,
  required UserPreferences prefs,
  required AppLocalizations l10n,
  required List<StudioCompany> tmdbStudios,
  required SpotlightCardActions actions,
  List<SeerrDiscoverItem> seerrAppearances = const [],
  List<SeerrDiscoverItem> seerrCrewCredits = const [],
  String? fallbackImageUrl,
}) {
  final builder = _SpotlightCardsBuilder(
    vm: vm,
    item: item,
    prefs: prefs,
    l10n: l10n,
    tmdbStudios: tmdbStudios,
    actions: actions,
    seerrAppearances: seerrAppearances,
    seerrCrewCredits: seerrCrewCredits,
    fallbackImageUrl: fallbackImageUrl,
  );
  return builder.build();
}

class _SpotlightCardsBuilder {
  final ItemDetailViewModel vm;
  final AggregatedItem item;
  final UserPreferences prefs;
  final AppLocalizations l10n;
  final List<StudioCompany> tmdbStudios;
  final SpotlightCardActions actions;
  final List<SeerrDiscoverItem> seerrAppearances;
  final List<SeerrDiscoverItem> seerrCrewCredits;
  final String? fallbackImageUrl;

  _SpotlightCardsBuilder({
    required this.vm,
    required this.item,
    required this.prefs,
    required this.l10n,
    required this.tmdbStudios,
    required this.actions,
    required this.seerrAppearances,
    required this.seerrCrewCredits,
    required this.fallbackImageUrl,
  });

  ImageApi get _imageApi => vm.imageApi;

  List<SpotlightCardSpec> build() {
    if (vm.isSeerrOnly) {
      return _compact([_peopleCard(), _similarCard()]);
    }
    final cards = switch (item.type) {
      'Series' => [
        _seasonsCard(),
        _peopleCard(),
        _chaptersExtrasCard(),
        _similarCard(),
        _collectionsCard(),
      ],
      'Season' => [
        _episodesCard(l10n.spotlightSeasonsEpisodes),
        _peopleCard(),
        _chaptersExtrasCard(),
        _similarCard(),
      ],
      'Episode' => [
        _episodesCard(l10n.spotlightMoreEpisodes),
        _peopleCard(),
        _chaptersExtrasCard(),
        _similarCard(),
      ],
      'MusicAlbum' || 'AudioBook' || 'Book' => [
        _tracksCard(),
        _similarCard(),
      ],
      'Playlist' => [_playlistCard()],
      'MusicArtist' => [_albumsCard(), _similarCard()],
      'Person' => [_filmographyCard()],
      'BoxSet' => [
        _boxSetItemsCard(),
        _boxSetPeopleCard(),
        _boxSetPlaylistOrderCard(),
      ],
      _ => [
        _peopleCard(),
        _chaptersExtrasCard(),
        _similarCard(),
        _collectionsCard(),
      ],
    };
    return _compact(cards);
  }

  List<SpotlightCardSpec> _compact(List<SpotlightCardSpec?> cards) =>
      cards.whereType<SpotlightCardSpec>().toList();

  // ---------------------------------------------------------------------------
  // Shared section builders

  SpotlightModalSection _peopleSection(
    String title,
    List<Map<String, dynamic>> people,
  ) {
    return SpotlightModalSection(
      title: title,
      count: people.length,
      builder: (context, firstFocusNode) => SpotlightPeopleGridSection(
        people: people,
        imageApi: _imageApi,
        firstFocusNode: firstFocusNode,
        onPersonTap: actions.openPerson,
      ),
    );
  }

  SpotlightModalSection _mediaSection(
    String title,
    List<AggregatedItem> items, {
    double aspectRatio = 2 / 3,
    bool landscapeCells = false,
    ValueChanged<AggregatedItem>? onTap,
  }) {
    return SpotlightModalSection(
      title: title,
      count: items.length,
      builder: (context, firstFocusNode) => SpotlightMediaGridSection(
        items: items,
        imageApi: _imageApi,
        prefs: prefs,
        aspectRatio: aspectRatio,
        landscapeCells: landscapeCells,
        firstFocusNode: firstFocusNode,
        onItemTap: onTap ?? actions.openItem,
      ),
    );
  }

  List<Map<String, dynamic>> _mergedCrew() {
    final Map<String, Map<String, dynamic>> merged = {};
    void add(Map<String, dynamic> person, String fallbackRole) {
      final id = person['Id']?.toString() ?? person['Name']?.toString() ?? '';
      if (id.isEmpty) return;
      final roleStr = person['Role']?.toString().trim();
      final role = (roleStr != null && roleStr.isNotEmpty)
          ? roleStr
          : fallbackRole;
      if (merged.containsKey(id)) {
        (merged[id]!['Roles'] as Set<String>).add(role);
      } else {
        merged[id] = {...person, 'Roles': <String>{role}};
      }
    }

    for (final d in vm.directors) {
      add(d, l10n.director);
    }
    for (final w in vm.writers) {
      add(w, l10n.writer);
    }
    return merged.values
        .map(
          (person) => {
            ...person,
            'Role': (person['Roles'] as Set<String>).join('\n'),
          },
        )
        .toList();
  }

  // ---------------------------------------------------------------------------
  // Cards

  SpotlightCardSpec? _peopleCard() {
    final cast = vm.actors;
    final crew = _mergedCrew();
    final studios = item.studios;
    if (cast.isEmpty && crew.isEmpty && studios.isEmpty) return null;

    final peopleCount = {
      ...cast.map((p) => p['Id']?.toString() ?? p['Name'].toString()),
      ...crew.map((p) => p['Id']?.toString() ?? p['Name'].toString()),
    }.length;
    final subtitle = [
      if (peopleCount > 0) l10n.spotlightPeopleCount(peopleCount),
      if (studios.isNotEmpty) l10n.spotlightStudiosCount(studios.length),
    ].join(' · ');

    return SpotlightCardSpec(
      id: 'people',
      title: l10n.spotlightCastCrewStudios,
      subtitle: subtitle,
      imageUrl: fallbackImageUrl,
      icon: Icons.people_outline,
      sections: [
        if (cast.isNotEmpty) _peopleSection(l10n.castMembers, cast),
        if (crew.isNotEmpty) _peopleSection(l10n.crewSection, crew),
        if (studios.isNotEmpty) _studiosSection(),
      ],
    );
  }

  SpotlightCardSpec? _chaptersExtrasCard() {
    final chapters = item.chapters;
    final extras = vm.features;
    if (chapters.isEmpty && extras.isEmpty) return null;

    final subtitle = [
      if (chapters.isNotEmpty) l10n.spotlightChaptersCount(chapters.length),
      if (extras.isNotEmpty) l10n.spotlightExtrasCount(extras.length),
    ].join(' · ');

    final byCategory = <String, List<AggregatedItem>>{};
    for (final extra in extras) {
      byCategory.putIfAbsent(getExtraCategory(extra), () => []).add(extra);
    }

    return SpotlightCardSpec(
      id: 'chapters_extras',
      title: l10n.spotlightChaptersExtras,
      subtitle: subtitle,
      imageUrl:
          _firstChapterImage() ??
          (extras.isNotEmpty
              ? spotlightLandscapeImageUrl(
                  _imageApi,
                  extras.first,
                  fallbackUrl: fallbackImageUrl,
                )
              : null) ??
          fallbackImageUrl,
      icon: Icons.video_library_outlined,
      sections: [
        if (chapters.isNotEmpty)
          SpotlightModalSection(
            title: l10n.chapters,
            count: chapters.length,
            builder: (context, firstFocusNode) => SpotlightChaptersGridSection(
              item: item,
              imageApi: _imageApi,
              firstFocusNode: firstFocusNode,
              onChapterTap: actions.playFromChapter,
            ),
          ),
        for (final category in extraCategoriesOrder)
          if (byCategory.containsKey(category))
            _mediaSection(
              getExtraCategoryLabel(category, l10n),
              byCategory[category]!,
              aspectRatio: 16 / 9,
              landscapeCells: true,
              onTap: actions.playExtra,
            ),
      ],
    );
  }

  SpotlightModalSection _studiosSection() {
    return SpotlightModalSection(
      title: l10n.studios,
      count: item.studios.length,
      builder: (context, firstFocusNode) => SpotlightStudiosGridSection(
        studios: item.studios,
        logoIndex: studioLogoIndex(tmdbStudios),
        firstFocusNode: firstFocusNode,
        onStudioTap: actions.openStudio,
      ),
    );
  }

  SpotlightModalSection _seerrSection(
    String title,
    List<SeerrDiscoverItem> items, {
    bool showCredit = false,
  }) {
    return SpotlightModalSection(
      title: title,
      count: items.length,
      builder: (context, firstFocusNode) => SpotlightSeerrGridSection(
        items: items,
        prefs: prefs,
        firstFocusNode: firstFocusNode,
        showCredit: showCredit,
        onItemTap: actions.openSeerrItem,
      ),
    );
  }

  SpotlightCardSpec? _similarCard() {
    final similar = vm.similar;
    final seerrState = seerrItemTabState(vm);
    final seerrRecommendations =
        seerrState?.recommendations ?? const <SeerrDiscoverItem>[];
    final seerrSimilar = seerrState?.similar ?? const <SeerrDiscoverItem>[];
    if (similar.isEmpty &&
        seerrRecommendations.isEmpty &&
        seerrSimilar.isEmpty) {
      return null;
    }
    final imageUrl = similar.isNotEmpty
        ? spotlightLandscapeImageUrl(
            _imageApi,
            similar.first,
            fallbackUrl: fallbackImageUrl,
          )
        : (_firstSeerrBackdrop(
                seerrRecommendations.isNotEmpty
                    ? seerrRecommendations
                    : seerrSimilar,
              ) ??
            fallbackImageUrl);
    // Named for where the list actually came from. The recommendation source
    // preference only applies to movies and series, and even then the view
    // model falls back to Jellyfin's own similar items when the chosen
    // source has nothing, so the preference alone would mislabel those.
    final librarySectionTitle = switch (vm.similarSource) {
      SimilarSource.jellyfin => l10n.similar,
      SimilarSource.moonfin => l10n.recommendationSystemMoonfin,
      SimilarSource.tmdb => l10n.recommendationSystemTmdb,
    };
    return SpotlightCardSpec(
      id: 'similar',
      title: l10n.recommendations,
      subtitle: l10n.spotlightTitlesCount(
        similar.length + seerrRecommendations.length + seerrSimilar.length,
      ),
      imageUrl: imageUrl ?? fallbackImageUrl,
      icon: Icons.auto_awesome_outlined,
      sections: [
        if (similar.isNotEmpty) _mediaSection(librarySectionTitle, similar),
        if (seerrRecommendations.isNotEmpty)
          _seerrSection(
            l10n.spotlightRecommendationsSeerr,
            seerrRecommendations,
          ),
        if (seerrSimilar.isNotEmpty)
          _seerrSection(
            similar.isEmpty ? l10n.similar : l10n.spotlightSimilarSeerr,
            seerrSimilar,
          ),
      ],
    );
  }

  SpotlightCardSpec? _collectionsCard() {
    final collections = vm.parentCollections;
    if (collections.isEmpty) return null;
    final imageUrl = _firstCollectionImage(collections) ?? fallbackImageUrl;
    final showMissing = prefs.get(
      UserPreferences.seerrShowMissingCollectionItems,
    );
    return SpotlightCardSpec(
      id: 'collections',
      title: l10n.spotlightCollectionsCard,
      subtitle: l10n.spotlightCollectionsCount(collections.length),
      imageUrl: imageUrl,
      icon: Icons.collections_bookmark_outlined,
      sections: [
        for (final collection in collections)
          _mediaSection(collection.name, [
            collection.boxSetItem,
            ...(showMissing ? collection.itemsWithMissing : collection.items),
          ]),
      ],
    );
  }

  SpotlightCardSpec? _seasonsCard() {
    final seasons = vm.seasons;
    if (seasons.isEmpty) return null;
    final episodeCount = vm.seriesEpisodes.isNotEmpty
        ? vm.seriesEpisodes.length
        : (item.recursiveItemCount ?? 0);
    final subtitle = [
      l10n.spotlightSeasonsCount(seasons.length),
      if (episodeCount > 0) l10n.spotlightEpisodesCount(episodeCount),
    ].join(' · ');
    return SpotlightCardSpec(
      id: 'seasons',
      title: l10n.spotlightSeasonsEpisodes,
      subtitle: subtitle,
      imageUrl:
          _firstEpisodeThumb([
            if (vm.nextUp != null) vm.nextUp!,
            ...vm.seriesEpisodes,
          ]) ??
          fallbackImageUrl,
      icon: Icons.video_collection_outlined,
      sections: [_mediaSection(l10n.seasons, seasons)],
    );
  }

  SpotlightCardSpec? _episodesCard(String title) {
    final episodes = vm.episodes;
    if (episodes.isEmpty) return null;
    return SpotlightCardSpec(
      id: 'episodes',
      title: title,
      subtitle: l10n.spotlightEpisodesCount(episodes.length),
      imageUrl: _firstEpisodeThumb(episodes) ?? fallbackImageUrl,
      icon: Icons.video_collection_outlined,
      sections: [
        _mediaSection(
          l10n.episodes,
          episodes,
          aspectRatio: 16 / 9,
          landscapeCells: true,
        ),
      ],
    );
  }

  SpotlightCardSpec? _tracksCard() {
    final tracks = vm.tracks;
    if (tracks.isEmpty) return null;
    var totalMs = 0;
    for (final t in tracks) {
      totalMs += t.runtime?.inMilliseconds ?? 0;
    }
    final durationLabel = spotlightRuntimeLabel(
      Duration(milliseconds: totalMs),
    );
    return SpotlightCardSpec(
      id: 'tracks',
      title: l10n.trackList,
      subtitle: [
        l10n.spotlightTracksCount(tracks.length),
        if (totalMs > 0) durationLabel,
      ].join(' · '),
      imageUrl: spotlightItemImageUrl(_imageApi, item) ?? fallbackImageUrl,
      icon: Icons.queue_music,
      sections: [
        SpotlightModalSection(
          title: l10n.trackList,
          count: tracks.length,
          builder: (context, firstFocusNode) => DetailTrackList(
            tracks: tracks,
            imageApi: _imageApi,
            isAudiobook: item.type == 'AudioBook' || item.type == 'Book',
            groupByDisc: item.type == 'MusicAlbum',
            getFocusNode: actions.trackFocusNode,
            onPlayTrack: actions.playTrack,
          ),
        ),
      ],
    );
  }

  SpotlightCardSpec? _playlistCard() {
    final tracks = vm.tracks;
    if (tracks.isEmpty) return null;
    final canManage = vm.canManagePlaylistTracks;
    return SpotlightCardSpec(
      id: 'playlist',
      title: l10n.playlist,
      subtitle: l10n.spotlightItemsCount(tracks.length),
      imageUrl:
          spotlightItemImageUrl(_imageApi, tracks.first) ?? fallbackImageUrl,
      icon: Icons.playlist_play,
      sections: [
        SpotlightModalSection(
          title: l10n.playlist,
          count: tracks.length,
          builder: (context, firstFocusNode) => DetailTrackList(
            tracks: tracks,
            imageApi: _imageApi,
            isPlaylist: true,
            showAlbum: true,
            getFocusNode: actions.trackFocusNode,
            onPlayTrack: actions.playTrack,
            onRemoveFromPlaylist: canManage
                ? (track) => vm.removeTrackFromPlaylist(track)
                : null,
            onMoveUp: canManage
                ? (index) => vm.reorderPlaylistTrack(index, index - 1)
                : null,
            onMoveDown: canManage
                ? (index) => vm.reorderPlaylistTrack(index, index + 1)
                : null,
          ),
        ),
      ],
    );
  }

  SpotlightCardSpec? _albumsCard() {
    final albums = vm.albums;
    if (albums.isEmpty) return null;
    return SpotlightCardSpec(
      id: 'albums',
      title: l10n.albums,
      subtitle: l10n.spotlightAlbumsCount(albums.length),
      imageUrl:
          spotlightItemImageUrl(_imageApi, albums.first) ?? fallbackImageUrl,
      icon: Icons.album_outlined,
      sections: [_mediaSection(l10n.albums, albums, aspectRatio: 1.0)],
    );
  }

  SpotlightCardSpec? _filmographyCard() {
    final movies = vm.filmographyMovies;
    final series = vm.filmographySeries;
    final other = vm.filmography;
    final hasLibrary = movies.isNotEmpty || series.isNotEmpty;
    if (!hasLibrary &&
        other.isEmpty &&
        seerrAppearances.isEmpty &&
        seerrCrewCredits.isEmpty) {
      return null;
    }
    final subtitle = [
      if (movies.isNotEmpty) l10n.spotlightMoviesCount(movies.length),
      if (series.isNotEmpty) l10n.spotlightShowsCount(series.length),
      if (!hasLibrary && other.isNotEmpty)
        l10n.spotlightItemsCount(other.length),
      if (!hasLibrary && other.isEmpty && seerrAppearances.isNotEmpty)
        l10n.spotlightItemsCount(seerrAppearances.length),
    ].join(' · ');
    final imageSource = movies.isNotEmpty
        ? movies.first
        : (series.isNotEmpty
              ? series.first
              : (other.isNotEmpty ? other.first : null));
    final imageUrl = imageSource != null
        ? spotlightItemImageUrl(_imageApi, imageSource)
        : _firstSeerrPoster(seerrAppearances);
    return SpotlightCardSpec(
      id: 'filmography',
      title: l10n.spotlightFilmography,
      subtitle: subtitle,
      imageUrl: imageUrl ?? fallbackImageUrl,
      icon: Icons.movie_outlined,
      sections: [
        if (movies.isNotEmpty) _mediaSection(l10n.movies, movies),
        if (series.isNotEmpty) _mediaSection(l10n.series, series),
        if (seerrAppearances.isNotEmpty)
          _seerrSection(
            l10n.appearancesSeerr,
            seerrAppearances,
            showCredit: true,
          ),
        if (seerrCrewCredits.isNotEmpty)
          _seerrSection(
            l10n.crewContributionsSeerr,
            seerrCrewCredits,
            showCredit: true,
          ),
        if (!hasLibrary &&
            seerrAppearances.isEmpty &&
            seerrCrewCredits.isEmpty &&
            other.isNotEmpty)
          _mediaSection(l10n.appearances, other),
      ],
    );
  }

  String? _firstSeerrPoster(List<SeerrDiscoverItem> items) {
    for (final item in items) {
      final url = spotlightSeerrPosterUrl(item.posterPath);
      if (url != null) return url;
    }
    return null;
  }

  SpotlightCardSpec? _boxSetItemsCard() {
    final libraryItems = vm.collectionItems;
    final showMissing = prefs.get(
      UserPreferences.seerrShowMissingCollectionItems,
    );
    // Slotted in by release date, the same way the parent-collection card
    // orders its own missing titles.
    final items = showMissing
        ? mergeMissingByReleaseOrder(libraryItems, vm.missingCollectionItems)
        : libraryItems;
    if (items.isEmpty) return null;
    final movies = items.where((i) => i.type == 'Movie').toList();
    final series = items.where((i) => i.type == 'Series').toList();
    final rest = items
        .where((i) => i.type != 'Movie' && i.type != 'Series')
        .toList();
    final subtitle = [
      if (movies.isNotEmpty) l10n.spotlightMoviesCount(movies.length),
      if (series.isNotEmpty) l10n.spotlightShowsCount(series.length),
      if (movies.isEmpty && series.isEmpty)
        l10n.spotlightItemsCount(items.length),
    ].join(' · ');
    return SpotlightCardSpec(
      id: 'boxset_items',
      title: l10n.spotlightMoviesAndShows,
      subtitle: subtitle,
      imageUrl:
          _firstItemLandscape(items) ?? fallbackImageUrl,
      icon: Icons.collections_bookmark_outlined,
      sections: [
        if (movies.isNotEmpty) _mediaSection(l10n.movies, movies),
        if (series.isNotEmpty) _mediaSection(l10n.series, series),
        if (rest.isNotEmpty) _mediaSection(l10n.spotlightMoviesAndShows, rest),
      ],
    );
  }

  SpotlightCardSpec? _boxSetPeopleCard() {
    // Aggregate the people of every item in the collection, deduped by id,
    // actors ahead of crew.
    final cast = <String, Map<String, dynamic>>{};
    final crew = <String, Map<String, dynamic>>{};
    for (final child in vm.collectionItems) {
      final people = child.rawData['People'] as List?;
      if (people == null) continue;
      for (final p in people) {
        if (p is! Map) continue;
        final person = Map<String, dynamic>.from(p);
        final id =
            person['Id']?.toString() ?? person['Name']?.toString() ?? '';
        if (id.isEmpty) continue;
        if (person['Type']?.toString() == 'Actor') {
          cast.putIfAbsent(id, () => person);
        } else {
          crew.putIfAbsent(id, () => person);
        }
      }
    }
    final studios = item.studios;
    if (cast.isEmpty && crew.isEmpty && studios.isEmpty) return null;
    final peopleCount = {...cast.keys, ...crew.keys}.length;
    return SpotlightCardSpec(
      id: 'people',
      title: l10n.spotlightCastCrewStudios,
      subtitle: [
        if (peopleCount > 0) l10n.spotlightPeopleCount(peopleCount),
        if (studios.isNotEmpty) l10n.spotlightStudiosCount(studios.length),
      ].join(' · '),
      imageUrl: fallbackImageUrl,
      icon: Icons.people_outline,
      sections: [
        if (cast.isNotEmpty)
          _peopleSection(l10n.castMembers, cast.values.toList()),
        if (crew.isNotEmpty)
          _peopleSection(l10n.crewSection, crew.values.toList()),
        if (studios.isNotEmpty) _studiosSection(),
      ],
    );
  }

  SpotlightCardSpec? _boxSetPlaylistOrderCard() {
    final items = vm.playlistItems;
    if (items.isEmpty) return null;
    return SpotlightCardSpec(
      id: 'playlist_order',
      title: l10n.spotlightPlaylistOrder,
      subtitle: l10n.spotlightItemsCount(items.length),
      imageUrl:
          spotlightLandscapeImageUrl(
            _imageApi,
            items.first,
            fallbackUrl: fallbackImageUrl,
          ),
      icon: Icons.format_list_numbered,
      sections: [
        SpotlightModalSection(
          title: l10n.spotlightPlaylistOrder,
          count: items.length,
          builder: (context, firstFocusNode) => DetailTrackList(
            tracks: items,
            imageApi: _imageApi,
            showAlbum: true,
            getFocusNode: actions.trackFocusNode,
            onPlayTrack: actions.playPlaylistTrack,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Card imagery

  String? _firstItemLandscape(List<AggregatedItem> items) {
    for (final child in items) {
      final url = spotlightLandscapeImageUrl(_imageApi, child);
      if (url != null) return url;
    }
    return null;
  }

  String? _firstSeerrBackdrop(List<SeerrDiscoverItem> items) {
    for (final item in items) {
      final url = spotlightSeerrBackdropUrl(item.backdropPath);
      if (url != null) return url;
    }
    return null;
  }

  String? _firstCollectionImage(List<ParentCollection> collections) {
    for (final col in collections) {
      for (final child in col.items) {
        final url = spotlightLandscapeImageUrl(_imageApi, child);
        if (url != null) return url;
      }
    }
    return null;
  }

  String? _firstChapterImage() {
    final chapters = item.chapters;
    for (var i = 0; i < chapters.length; i++) {
      final chapter = chapters[i];
      final tag = chapter['ImageTag'] as String?;
      if (tag != null) {
        return _imageApi.getChapterImageUrl(
          item.id,
          index: i,
          maxWidth: 480,
          tag: tag,
        );
      }
    }
    return null;
  }

  String? _firstEpisodeThumb(List<AggregatedItem> episodes) {
    for (final episode in episodes) {
      final url = spotlightItemImageUrl(_imageApi, episode);
      if (url != null) return url;
    }
    return null;
  }
}
