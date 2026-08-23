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

  List<MediaSegment> get segments => _segments;
  MediaSegment? get activeSegment => _activeSegment;

  MediaSegmentService(this._client, this._featureDetector, this._prefs);

  bool get isSupported => _featureDetector.supportsSkipSegments;

  Future<void> loadSegments(String itemId) async {
    _segments = [];
    _activeSegment = null;
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
  }

  Map<MediaSegmentType, MediaSegmentAction> get actionMap =>
      parseMediaSegmentActions(_prefs.get(UserPreferences.mediaSegmentActions));

  SegmentCheckResult checkPosition(Duration position) {
    if (_segments.isEmpty) return SegmentCheckResult.none;

    for (final segment in _segments) {
      if (position >= segment.start && position < segment.end) {
        final action = actionMap[segment.type] ?? MediaSegmentAction.nothing;

        if (_activeSegment?.id == segment.id) {
          if (action == MediaSegmentAction.askToSkip) {
            return SegmentCheckResult(
              action: MediaSegmentAction.askToSkip,
              segment: segment,
              skipTo: segment.end,
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
          return SegmentCheckResult(
            action: MediaSegmentAction.skip,
            segment: segment,
            skipTo: segment.end,
          );
        }
        return SegmentCheckResult(
          action: MediaSegmentAction.askToSkip,
          segment: segment,
          skipTo: segment.end,
        );
      }
    }

    _activeSegment = null;
    return SegmentCheckResult.none;
  }
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
