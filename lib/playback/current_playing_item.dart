import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';

/// The id of the item the player has open, if any. Servers flip Played near
/// the end of playback, while that file is still in use, so the download
/// rules leave it for their next check.
String? currentPlayingItemId() {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<PlaybackManager>()) return null;
  final current = getIt<PlaybackManager>().queueService.currentItem;
  return current is AggregatedItem ? current.id : null;
}
