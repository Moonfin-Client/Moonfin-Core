import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';

/// What the request control does for one quality track right now.
enum SeerrRequestActionKind { none, request, requested, cancel }

class SeerrRequestAction {
  final SeerrRequestActionKind kind;
  final String label;

  const SeerrRequestAction(this.kind, this.label);

  static const none = SeerrRequestAction(SeerrRequestActionKind.none, '');
}

/// Works out what the request control offers for one quality track.
///
/// Cancel wins over requested, which wins over request, so a viewer who can
/// take an open request back is always offered that rather than being told
/// something they already know. A partially available series can still be
/// requested, which is how the missing seasons get asked for.
SeerrRequestAction seerrRequestActionFor(
  SeerrQualityStatus q,
  SeerrMediaDetailViewModel vm,
  AppLocalizations l10n,
) {
  final allowed = q.is4k ? vm.canRequest4k : vm.canRequest;
  final canShowRequest = allowed &&
      !q.isFullyAvailable &&
      (!q.hasExistingRequest || q.isPartiallyAvailable);
  final hasOpenRequest = q.activeRequests.isNotEmpty && !q.isFullyAvailable;

  if (hasOpenRequest && q.cancelableRequests.isNotEmpty) {
    return SeerrRequestAction(
      SeerrRequestActionKind.cancel,
      q.is4k ? l10n.cancelRequest4k : l10n.cancelRequest,
    );
  }
  if (hasOpenRequest) {
    return SeerrRequestAction(
      SeerrRequestActionKind.requested,
      q.is4k ? l10n.requested4k : l10n.seerrRequestedStatus,
    );
  }
  if (canShowRequest) {
    return SeerrRequestAction(
      SeerrRequestActionKind.request,
      q.isPartiallyAvailable
          ? (q.is4k ? l10n.requestMore4k : l10n.requestMore)
          : (q.is4k ? l10n.request4k : l10n.request),
    );
  }
  return SeerrRequestAction.none;
}

/// The season numbers a series actually has.
///
/// A provider that splits a run differently, like TVDB for anime, reports its
/// own season numbers, so counting off from one would offer seasons that
/// aren't there and request the wrong ones. The count is only a fallback for a
/// server that sends no season list.
List<int> seerrSeasonNumbersOf(
  List<SeerrSeason> seasons,
  int fallbackCount,
) {
  final reported = seasons
      .where((s) => s.seasonNumber > 0)
      .map((s) => s.seasonNumber)
      .toList();
  if (reported.isNotEmpty) return reported;
  return List.generate(fallbackCount, (i) => i + 1);
}

/// "Requested by Ada", with the quality when it is the 4K track.
String seerrRequestedByLabel(SeerrRequest request, AppLocalizations l10n) {
  final name = l10n.requestedByName(
    request.requestedBy?.bestName ?? l10n.unknown,
  );
  return request.is4k ? '$name · ${l10n.uhd4k}' : name;
}

/// The requests still waiting on someone to approve or decline them.
List<SeerrRequest> seerrPendingRequests(SeerrMediaDetailState state) => state
    .allActiveRequests
    .where((r) => r.status == SeerrRequest.statusPending)
    .toList();

/// Opens a Seerr trailer, in the built-in player for YouTube and by url for
/// anything else.
Future<void> openSeerrTrailer(BuildContext context, SeerrVideo video) async {
  final key = video.key;
  final isYouTube = (video.site ?? '').toLowerCase() == 'youtube';
  if (isYouTube && key != null && key.isNotEmpty) {
    await context.push(Destinations.trailer(videoId: key));
    return;
  }
  var url = video.url;
  if ((url == null || url.isEmpty) && key != null && key.isNotEmpty) {
    url = 'https://www.youtube.com/watch?v=$key';
  }
  if (url == null || url.isEmpty) return;
  await context.push(Destinations.trailer(url: url));
}
