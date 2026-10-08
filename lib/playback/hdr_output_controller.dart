import 'package:flutter/foundation.dart';

import 'hdr_video_window.dart';

/// Whether mpv's native window is running and, if not, why - for the playback
/// info sheet.
enum HdrOutputStatus {
  /// Running: mpv presents into its own window, HDR or SDR. Whether HDR is
  /// actually reaching the display is a separate question.
  active,

  /// Undecided (the reset state, also shown while a title loads), or an SDR
  /// title kept on the texture by the `sdrUsesTexturePath` preference.
  contentIsSdr,

  /// The window could not be created, or mpv would not take it. Sticky for
  /// the session, and the texture path carries on.
  failed;

  bool get isActive => this == active;

  /// Whether a later fact may reopen the decision. Only the undecided state:
  /// a failure is settled for the session.
  bool get isRevisitable => this == contentIsSdr;
}

/// Decides whether mpv gets its own window, and owns that window's lifetime.
///
/// Once engaged the decision sticks across items: SDR content in the native
/// window is not a regression - mpv renders it, and with `gpu-next` renders
/// it better than the texture path does. The one exception is the
/// `sdrUsesTexturePath` preference, under which the backend hands an SDR
/// title back to the texture through [reset].
class HdrOutputController {
  /// [window] is injectable so the decision can be tested without a platform
  /// channel - most paths through [maybeEngage] touch it, and those are the
  /// paths worth pinning down.
  HdrOutputController({HdrVideoWindow? window})
    : window = window ?? HdrVideoWindow();

  final HdrVideoWindow window;

  /// What is actually going to the display while [HdrOutputStatus.active].
  ///
  /// Always HDR10: DXGI carries only static HDR10 metadata, so there is no
  /// HDR10+ or Dolby Vision passthrough on Windows for a normal application.
  /// libplacebo applies the dynamic metadata or the RPU and folds the result
  /// into HDR10, which is the best available - not a shortcut.
  static const String activeOutputFormat = 'HDR10 (PQ, BT.2020)';

  /// The single source of truth for engagement; [isEngaged] and [hasFailed]
  /// are views of it.
  ///
  /// A notifier rather than a plain field because engagement finishes
  /// asynchronously at the tail of `play()`, long after the player screen last
  /// built. Without a signal the swap from the texture surface to the native
  /// window would wait for some unrelated setState to happen along, and until
  /// it did mpv would be drawing into a window nothing had claimed - so still
  /// hidden.
  final ValueNotifier<HdrOutputStatus> status = ValueNotifier(
    HdrOutputStatus.contentIsSdr,
  );

  bool get isEngaged => status.value.isActive;

  /// Whether a previous attempt failed. Sticky, so a broken configuration is
  /// not retried on every item.
  bool get hasFailed => status.value == HdrOutputStatus.failed;

  /// Whoever is currently presenting, or null.
  ///
  /// The backend is a process-wide singleton shared with Live TV and the mini
  /// player, which render media_kit's texture and know nothing about the
  /// native window - engaging under them would swap mpv onto a window nothing
  /// ever shows and leave a black picture. Only the video player screen sets
  /// this, and engagement is refused without it - except for a main video
  /// about to open, which [maybeEngage]'s `beforePresenter` lets engage ahead
  /// of its screen.
  ///
  /// Held by identity, for the same reason [HdrVideoWindow] holds its own: the
  /// player screen is rebuilt on route changes and the incoming state mounts
  /// before the outgoing one disposes, so a departing screen must not stand
  /// down a session its successor has already taken over.
  Object? presenter;

  bool get presenterActive => presenter != null;

  /// The decision in flight, or null. One at a time: the sticky flags are
  /// only written after several awaits, so without this two overlapping
  /// `play()` calls could both pass the gates and run the mpv handover
  /// concurrently against the same window.
  Future<int?>? _decision;

  /// Completes once no decision is in flight.
  ///
  /// A release must wait on this before cleaning up. A handover still waiting
  /// on mpv only reports active at its end, so a release in the middle would
  /// see nothing engaged, skip the texture restore and destroy the window -
  /// and the handover would then land on a window that no longer exists,
  /// leaving mpv on `wid` under Live TV and the mini player.
  Future<void> get settled async {
    final decision = _decision;
    if (decision == null) return;
    try {
      await decision;
    } catch (_) {
      // Only the decision being over matters here, not its result.
    }
  }

  /// Back to the undecided state, for when the presenting screen goes away:
  /// the next playback decides afresh instead of inheriting a sticky
  /// engagement nothing can present any more.
  void reset() {
    status.value = HdrOutputStatus.contentIsSdr;
  }

  /// Decides and, if the answer is yes, creates the window.
  ///
  /// Returns the HWND to hand mpv as `wid`, or null to stay on the texture
  /// path. Every title engages, SDR included: mpv then paces frames against
  /// the display itself, which the texture path cannot - there Flutter samples
  /// the texture on its own schedule and motion judders.
  ///
  /// With [sdrUsesTexturePath] only [isHdrContent] engages. That "no" stays
  /// revisitable, so a later HDR title in the session still engages.
  ///
  /// [engageMpv] must return false if mpv refused the handle, so the failure
  /// is recorded rather than leaving a black window on screen.
  ///
  /// [beforePresenter] waives the presenter gate, for a main video about to
  /// open: `play()` usually runs before the player screen mounts, and waiting
  /// for it means the first frames go through the texture and the picture
  /// flashes when mpv moves over. The caller vouches that a player screen is
  /// coming and stands down if none does.
  Future<int?> maybeEngage({
    required bool sdrUsesTexturePath,
    required bool isHdrContent,
    required Future<bool> Function(int handle) engageMpv,
    bool beforePresenter = false,
  }) async {
    if (isEngaged) {
      return window.handle;
    }
    if (hasFailed ||
        _decision != null ||
        (!beforePresenter && !presenterActive)) {
      return null;
    }
    final decision = _decide(
      sdrUsesTexturePath: sdrUsesTexturePath,
      isHdrContent: isHdrContent,
      engageMpv: engageMpv,
    );
    _decision = decision;
    try {
      return await decision;
    } finally {
      _decision = null;
    }
  }

  Future<int?> _decide({
    required bool sdrUsesTexturePath,
    required bool isHdrContent,
    required Future<bool> Function(int handle) engageMpv,
  }) async {
    if (sdrUsesTexturePath && !isHdrContent) {
      status.value = HdrOutputStatus.contentIsSdr;
      return null;
    }

    final handle = await window.create();
    if (handle == null) {
      status.value = HdrOutputStatus.failed;
      return null;
    }

    if (!await engageMpv(handle)) {
      await window.destroy();
      status.value = HdrOutputStatus.failed;
      return null;
    }

    status.value = HdrOutputStatus.active;
    return handle;
  }
}

/// Whether the server's `VideoRangeType` calls the title HDR - the only answer
/// there is before mpv has decoded anything. Dolby Vision with an SDR base
/// layer counts: gpu-next applies the RPU and the result is HDR. Missing or
/// `Unknown` is SDR, which mpv corrects once the file has loaded.
bool isHdrRangeType(String? rangeType) {
  final range = (rangeType ?? '').trim().toUpperCase();
  return range.isNotEmpty && range != 'SDR' && range != 'UNKNOWN';
}

/// Whether what mpv decoded is HDR.
///
/// mpv is the better source than the server's `VideoRangeType`, which can be
/// missing or wrong — what matters is what actually decoded. But it cannot
/// answer for **Dolby Vision Profile 5**: that has no HDR10 base layer and
/// frequently no VUI transfer characteristic, so the picture is IPT and only
/// becomes BT.2020 PQ once libplacebo applies the RPU — which happens under
/// `gpu-next`, which is the very thing being decided. mpv reports a P5 title
/// as SDR right up until it stops being one.
///
/// BT.2020 primaries break that tie: IPT is carried on them, so they are
/// present even when the transfer characteristic is not. Wide-gamut SDR also
/// matches; being wrong there only labels it HDR in the info sheet.
bool isHdrVideoParams({required String? gamma, required String? primaries}) {
  final transfer = gamma?.toLowerCase() ?? '';
  if (transfer == 'pq' || transfer == 'st2084' || transfer == 'hlg') {
    return true;
  }
  return (primaries?.toLowerCase() ?? '').contains('2020');
}
