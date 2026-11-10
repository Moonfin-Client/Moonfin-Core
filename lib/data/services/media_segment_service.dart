import 'dart:async';

import 'package:server_core/server_core.dart';

import '../models/media_segment.dart';
import '../utils/media_segment_actions.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

class MediaSegmentService {
  final MediaServerClient _client;
  final FeatureDetector _featureDetector;
  final UserPreferences _prefs;

  List<MediaSegment> _segments = [];
  MediaSegment? _activeSegment;

  /// Segments already skipped automatically, until playback is seen at or
  /// before their start again.
  ///
  /// A skip is a seek to the segment's end, and most players land a frame
  /// short of a seek target, which is still inside the segment. That landing
  /// looks like a fresh entry once a sample past the end has reset
  /// [_activeSegment]. Under SyncPlay every client lands there at once, and
  /// each one that re-fired asked the group to skip again, which made
  /// everyone land there again: an endless loop of group seeks. Skipping a
  /// segment once, until a real rewind to its start, cannot loop.
  final Set<MediaSegment> _autoSkipped = <MediaSegment>{};

  List<MediaSegment> get segments => _segments;
  MediaSegment? get activeSegment => _activeSegment;

  MediaSegmentService(this._client, this._featureDetector, this._prefs);

  bool get isSupported => _featureDetector.supportsSkipSegments;

  Future<void> loadSegments(String itemId) async {
    _segments = [];
    _activeSegment = null;
    _autoSkipped.clear();
    if (!isSupported) return;

    try {
      final raw = await _client.itemsApi.getMediaSegments(itemId);
      _segments = raw.map((e) => MediaSegment.fromJson(e)).toList();
    } catch (_) {
      _segments = [];
    }
  }

  void clear() {
    _segments = [];
    _activeSegment = null;
    _autoSkipped.clear();
  }

  Map<MediaSegmentType, MediaSegmentAction> get actionMap =>
      parseMediaSegmentActions(_prefs.get(UserPreferences.mediaSegmentActions));

  SegmentCheckResult checkPosition(Duration position) {
    if (_segments.isEmpty) return SegmentCheckResult.none;

    // Back at or before the start is a rewind into the segment on purpose,
    // so it is armed again. A landing just short of its end is not.
    _autoSkipped.removeWhere((segment) => position <= segment.start);

    for (final segment in _segments) {
      if (position >= segment.start && position < segment.end) {
        final action = actionMap[segment.type] ?? MediaSegmentAction.nothing;
        // Seeks travel as whole milliseconds; a truncated end would still be
        // inside the segment.
        final skipTo = Duration(
          milliseconds: (segment.end.inMicroseconds + 999) ~/ 1000,
        );

        if (_activeSegment?.id == segment.id) {
          if (action == MediaSegmentAction.askToSkip) {
            return SegmentCheckResult(
              action: MediaSegmentAction.askToSkip,
              segment: segment,
              skipTo: skipTo,
              isNew: false,
            );
          }
          return SegmentCheckResult.none;
        }

        _activeSegment = segment;
        if (action == MediaSegmentAction.nothing) {
          return SegmentCheckResult.none;
        }

        final minDuration = action == MediaSegmentAction.skip
            ? const Duration(seconds: 1)
            : const Duration(seconds: 3);
        if (segment.duration < minDuration) {
          return SegmentCheckResult.none;
        }

        if (action == MediaSegmentAction.skip) {
          if (!_autoSkipped.add(segment)) return SegmentCheckResult.none;
          return SegmentCheckResult(
            action: MediaSegmentAction.skip,
            segment: segment,
            skipTo: skipTo,
          );
        }
        return SegmentCheckResult(
          action: MediaSegmentAction.askToSkip,
          segment: segment,
          skipTo: skipTo,
        );
      }
    }

    _activeSegment = null;
    return SegmentCheckResult.none;
  }
}

/// AetherEngine plays video on Apple platforms and parks a seek into the last
/// half second as paused without ever reporting the end, so a skip that would
/// land there stops a second short instead.
Duration skipLandingBeforeEnd(Duration target, Duration duration) {
  final latest = duration - const Duration(seconds: 1);
  return latest > Duration.zero && target > latest ? latest : target;
}

class SegmentCheckResult {
  final MediaSegmentAction action;
  final MediaSegment? segment;
  final Duration? skipTo;
  final bool isNew;

  const SegmentCheckResult({
    this.action = MediaSegmentAction.nothing,
    this.segment,
    this.skipTo,
    this.isNew = true,
  });

  static const none = SegmentCheckResult();

  bool get shouldSkip => action == MediaSegmentAction.skip;
  bool get shouldAsk => action == MediaSegmentAction.askToSkip;
  bool get isNone => action == MediaSegmentAction.nothing;
}
