import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';

/// What the request control does for one quality track right now.
enum SeerrRequestActionKind { none, request, requested }

class SeerrRequestAction {
  final SeerrRequestActionKind kind;
  final String label;

  const SeerrRequestAction(this.kind, this.label);

  static const none = SeerrRequestAction(SeerrRequestActionKind.none, '');
}

/// Works out what the request control offers for one quality track.
///
/// Asking wins over being told, so a partially available series with an open
/// request still offers Request More rather than only reporting the request.
/// Taking a request back is a separate control, from [seerrCancelLabelFor],
/// so the two can sit side by side.
///
/// Full availability is only final for a movie or an ended series. A
/// continuing series can always grow another season, so it keeps offering
/// Request More even with every aired season in the library.
///
/// [hasUnrequestedSeasons] says a season is still there for the asking. The
/// track status only describes what was already requested, so on its own it
/// hides the button once any request is open, even for a season nobody has
/// touched. The flag relaxes that one gate and nothing else, since a season
/// left to ask for says nothing about whether the show is complete.
SeerrRequestAction seerrRequestActionFor(
  SeerrQualityStatus q,
  AppLocalizations l10n, {
  required bool allowed,
  bool isTv = false,
  bool isContinuing = false,
  bool hasUnrequestedSeasons = false,
}) {
  final continuingFullyAvailable = isTv && isContinuing && q.isFullyAvailable;
  final seasonsLeftToAsk = isTv && hasUnrequestedSeasons;
  final canShowRequest = allowed &&
      (!q.isFullyAvailable || continuingFullyAvailable) &&
      (!q.hasExistingRequest ||
          q.isPartiallyAvailable ||
          continuingFullyAvailable ||
          seasonsLeftToAsk);
  final hasOpenRequest = q.activeRequests.isNotEmpty &&
      (!q.isFullyAvailable || continuingFullyAvailable);

  if (canShowRequest) {
    return SeerrRequestAction(
      SeerrRequestActionKind.request,
      // Without the existing request test the first ask would read More.
      q.isPartiallyAvailable || continuingFullyAvailable || q.hasExistingRequest
          ? (q.is4k ? l10n.requestMore4k : l10n.requestMore)
          : (q.is4k ? l10n.request4k : l10n.request),
    );
  }
  if (hasOpenRequest) {
    return SeerrRequestAction(
      SeerrRequestActionKind.requested,
      q.is4k ? l10n.requested4k : l10n.seerrRequestedStatus,
    );
  }
  return SeerrRequestAction.none;
}

/// The label for taking this track's open request back, or null when there is
/// nothing the viewer may cancel.
///
/// Not gated on the request permission: someone whose permission was revoked
/// can still take back a request they already made.
String? seerrCancelLabelFor(SeerrQualityStatus q, AppLocalizations l10n) {
  if (q.activeRequests.isEmpty || q.isFullyAvailable) return null;
  if (q.cancelableRequests.isEmpty) return null;
  return q.is4k ? l10n.cancelRequest4k : l10n.cancelRequest;
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
