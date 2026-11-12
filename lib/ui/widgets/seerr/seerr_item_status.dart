import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/item_detail_view_model.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/detail_section_layout.dart';
import '../../../preference/seerr_preferences.dart';
import '../seerr_download_progress_bar.dart';
import 'seerr_item_chips.dart';
import 'seerr_stats_card.dart';
import 'seerr_status_pill.dart';

/// The Seerr state worth showing beside a library item's metadata, or null when
/// there is nothing to say. Callers check for null rather than rendering an
/// empty widget, so the padding and separators around it go too.
SeerrMediaDetailState? seerrItemStatus(ItemDetailViewModel viewModel) {
  final state = _resolved(viewModel);
  if (state == null) return null;
  final worthShowing =
      seerrStatusIsNoteworthy(state.hd) || seerrStatusIsNoteworthy(state.uhd);
  return worthShowing ? state : null;
}

/// The Seerr state to build the Seerr tab and rows from, or null when the
/// lookup found nothing to show. Unlike the metadata badge this ignores the
/// request status preference, since the viewer opened the tab to see it.
SeerrMediaDetailState? seerrItemTabState(ItemDetailViewModel viewModel) {
  final state = viewModel.seerr?.state;
  if (state == null || state.tmdbId == 0) return null;
  final hasContent = state.genres.isNotEmpty ||
      state.keywords.isNotEmpty ||
      state.networks.isNotEmpty ||
      state.streamingProviders.isNotEmpty ||
      state.similar.isNotEmpty ||
      state.recommendations.isNotEmpty;
  return hasContent ? state : null;
}

/// The parts of the Seerr block a Details screen draws for one title, the ones
/// with something to show that the viewer left on. Every style reads its Seerr
/// gates from here so what it draws and where focus can go agree.
@immutable
class SeerrDetailPieces {
  const SeerrDetailPieces._({
    required this.chips,
    required this.stats,
    required this.streaming,
    required this.recommendations,
    required this.similar,
    required this.collection,
    this.similarItems = const [],
  });

  static const none = SeerrDetailPieces._(
    chips: false,
    stats: false,
    streaming: false,
    recommendations: false,
    similar: false,
    collection: false,
  );

  /// [state] is what [seerrItemTabState] returned, so a null one shows nothing.
  factory SeerrDetailPieces.resolve(
    SeerrMediaDetailState? state,
    DetailSectionVisibility visibility,
    AppLocalizations l10n,
  ) {
    if (state == null) return none;
    final recommendations =
        visibility.shows(DetailSection.seerrRecommendations) &&
        state.recommendations.isNotEmpty;
    // Seerr's similar titles often repeat its recommendations, and Silo has
    // only the one list for both, so Similar keeps what a shown
    // Recommendations row doesn't.
    final shown = {
      if (recommendations)
        for (final item in state.recommendations) _titleKey(item),
    };
    final similarItems = visibility.shows(DetailSection.seerrSimilar)
        ? [
            for (final item in state.similar)
              if (!shown.contains(_titleKey(item))) item,
          ]
        : const <SeerrDiscoverItem>[];
    return SeerrDetailPieces._(
      chips:
          visibility.shows(DetailSection.seerrGenresTags) &&
          SeerrItemChips.hasContent(state),
      stats:
          visibility.shows(DetailSection.seerrStats) &&
          SeerrStatsCard.hasContent(state, l10n),
      streaming:
          visibility.shows(DetailSection.seerrStreaming) &&
          state.streamingProviders.isNotEmpty,
      recommendations: recommendations,
      similar: similarItems.isNotEmpty,
      similarItems: similarItems,
      collection:
          visibility.shows(DetailSection.seerrCollection) &&
          state.movie?.collection != null,
    );
  }

  final bool chips;
  final bool stats;
  final bool streaming;
  final bool recommendations;
  final bool similar;
  final bool collection;

  /// The Seerr similar titles to draw: those a shown Recommendations row
  /// doesn't already have.
  final List<SeerrDiscoverItem> similarItems;

  static String _titleKey(SeerrDiscoverItem item) =>
      '${item.mediaType}:${item.id}';

  bool get hasAny =>
      chips || stats || streaming || recommendations || similar || collection;
}

/// Season number to Seerr status for a series, empty when Seerr has nothing to
/// say. The HD track, because that is the copy the library holds.
Map<int, int> seerrItemSeasonStatus(ItemDetailViewModel viewModel) {
  final state = _resolved(viewModel);
  return state?.hd.seasonStatus ?? const {};
}

/// The Seerr state of an item with something downloading, or with an approved
/// request the arr hasn't found a release for yet, or null.
SeerrMediaDetailState? seerrItemDownloads(ItemDetailViewModel viewModel) {
  final state = _resolved(viewModel);
  if (state == null) return null;
  final downloading = state.hdDownload != null || state.download4k != null;
  return downloading || state.hd.isNotFoundYet ? state : null;
}

/// Progress bars for whatever Radarr or Sonarr is fetching right now, one per
/// quality track. Labelled only when both are running, so the usual single bar
/// stays uncluttered. An HD track with nothing grabbed yet says so instead.
class SeerrItemDownloadBars extends StatelessWidget {
  final SeerrMediaDetailState state;

  const SeerrItemDownloadBars({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final hd = state.hdDownload;
    final uhd = state.download4k;
    final notFoundYet = hd == null && state.hd.isNotFoundYet;
    final both = (hd != null || notFoundYet) && uhd != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hd != null)
          SeerrDownloadProgressBar(
            summary: hd,
            prefixLabel: both ? 'HD' : null,
            reasonMaxLines: 3,
          )
        else if (notFoundYet)
          SeerrNotFoundYetLabel(prefixLabel: both ? 'HD' : null),
        if (uhd != null)
          SeerrDownloadProgressBar(
            summary: uhd,
            prefixLabel: AppLocalizations.of(context).uhd4k,
            reasonMaxLines: 3,
          ),
      ],
    );
  }
}

/// The item's Seerr state once the lookup has landed and found something, and
/// only while the viewer wants request status shown at all.
SeerrMediaDetailState? _resolved(ItemDetailViewModel viewModel) {
  if (!GetIt.instance<SeerrPreferences>().showRequestStatus) return null;
  final state = viewModel.seerr?.state;
  if (state == null || state.tmdbId == 0) return null;
  return state;
}
