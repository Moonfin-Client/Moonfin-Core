import '../../../data/models/aggregated_item.dart';

/// Whether a detail page borrows its first track's art for the backdrop.
///
/// Only a playlist with no backdrop of its own does. One set through Change
/// Artwork wins over the tracks, like an album's does.
bool usesFirstTrackBackdrop(AggregatedItem item, List<AggregatedItem> tracks) =>
    item.type == 'Playlist' &&
    tracks.isNotEmpty &&
    item.backdropImageTags.isEmpty;

/// The item whose backdrop the detail page for [item] shows.
AggregatedItem backdropTargetFor(
  AggregatedItem item,
  List<AggregatedItem> tracks,
) => usesFirstTrackBackdrop(item, tracks) ? tracks.first : item;
