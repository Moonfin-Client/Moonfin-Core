import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/viewmodels/item_detail_view_model.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/seerr_preferences.dart';
import '../seerr_download_progress_bar.dart';
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
      state.similar.isNotEmpty ||
      state.recommendations.isNotEmpty;
  return hasContent ? state : null;
}

/// Season number to Seerr status for a series, empty when Seerr has nothing to
/// say. The HD track, because that is the copy the library holds.
Map<int, int> seerrItemSeasonStatus(ItemDetailViewModel viewModel) {
  final state = _resolved(viewModel);
  return state?.hd.seasonStatus ?? const {};
}

/// The Seerr state of an item with something downloading, or null.
SeerrMediaDetailState? seerrItemDownloads(ItemDetailViewModel viewModel) {
  final state = _resolved(viewModel);
  if (state == null) return null;
  final downloading = state.hdDownload != null || state.download4k != null;
  return downloading ? state : null;
}

/// Progress bars for whatever Radarr or Sonarr is fetching right now, one per
/// quality track. Labelled only when both are running, so the usual single bar
/// stays uncluttered.
class SeerrItemDownloadBars extends StatelessWidget {
  final SeerrMediaDetailState state;

  const SeerrItemDownloadBars({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final hd = state.hdDownload;
    final uhd = state.download4k;
    final both = hd != null && uhd != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hd != null)
          SeerrDownloadProgressBar(
            summary: hd,
            prefixLabel: both ? 'HD' : null,
          ),
        if (uhd != null)
          SeerrDownloadProgressBar(
            summary: uhd,
            prefixLabel: AppLocalizations.of(context).uhd4k,
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
