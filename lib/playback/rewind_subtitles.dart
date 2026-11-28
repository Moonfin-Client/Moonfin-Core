import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import '../util/playback_track_selection.dart';

/// Brings subtitles up after a short rewind while they're off, and takes them
/// back down once playback reaches the point the rewind started from.
class RewindSubtitles {
  RewindSubtitles(this._manager, this._prefs, {this.onChanged});

  static const _maxRewind = Duration(seconds: 30);

  final PlaybackManager _manager;
  final UserPreferences _prefs;
  final VoidCallback? onChanged;

  Duration? _until;
  bool _rewound = false;

  /// Called for every seek the viewer makes. [preferredIndex] is a track to
  /// try first, like one they turned off a moment ago.
  void onSeek(
    Duration from,
    Duration to, {
    required List<Map<String, dynamic>> streams,
    int? preferredIndex,
  }) {
    _dropIfTakenOver();
    final back = from - to;
    final until = _until;
    if (until != null) {
      if (back > _maxRewind || to >= until) _end();
      return;
    }
    if (back <= Duration.zero || back > _maxRewind) return;
    if (!_prefs.get(UserPreferences.rewindSubtitles)) return;
    if ((_manager.subtitleStreamIndex ?? -1) >= 0) return;
    final index = _pick(streams, preferredIndex);
    if (index == null) return;
    _until = from;
    _rewound = false;
    unawaited(
      _manager.showSubtitleBriefly(index).then((_) => onChanged?.call()),
    );
  }

  void onPosition(Duration position) {
    _dropIfTakenOver();
    final until = _until;
    if (until == null) return;
    // Readings from before the rewind landed can still arrive past the start.
    if (position < until) {
      _rewound = true;
    } else if (_rewound) {
      _end();
    }
  }

  /// For a new item, whose tracks have nothing to do with the last one's.
  void reset() => _until = null;

  // The viewer picked a track or turned subtitles off themselves.
  void _dropIfTakenOver() {
    if (_until != null && !_manager.briefSubtitleShowing) _until = null;
  }

  void _end() {
    _until = null;
    unawaited(_manager.endBriefSubtitle().then((_) => onChanged?.call()));
  }

  int? _pick(List<Map<String, dynamic>> streams, int? preferredIndex) {
    final secondary = _manager.secondarySubtitleStreamIndex;
    final usable = streams.where((s) {
      final index = s['Index'];
      return s['Type'] == 'Subtitle' &&
          index is int &&
          index != secondary &&
          _manager.canShowSubtitleWithoutRestart(index);
    }).toList();
    if (usable.any((s) => s['Index'] == preferredIndex)) return preferredIndex;
    return selectRewindSubtitleIndex(subtitleStreams: usable, prefs: _prefs);
  }
}
