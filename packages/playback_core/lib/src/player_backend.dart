enum SubtitleRendererMode { native, assOverlay }

/// A caption track the player found inside the video itself, like the CEA-608
/// captions broadcasters carry in H.264 SEI data.
///
/// Servers don't list these as subtitle streams because nothing declares them
/// ahead of time, so they have no stream index and only exist once the player
/// has read far enough into the stream to find them.
class EmbeddedCaptionTrack {
  const EmbeddedCaptionTrack({
    required this.id,
    required this.label,
    this.language,
  });

  /// Identifies the track to the backend it came from. Only meaningful to that
  /// backend.
  final int id;

  /// What to show in a track menu, like "CC1".
  final String label;

  final String? language;

  /// Reads the caption tracks a platform player reports finding inside the
  /// video, as a list of `{id, label, language}` maps. An entry without a
  /// usable id is dropped rather than offered as a menu row that can't be
  /// selected.
  static List<EmbeddedCaptionTrack> listFromWire(dynamic value) {
    if (value is! List) return const [];
    final tracks = <EmbeddedCaptionTrack>[];
    for (final entry in value) {
      if (entry is! Map) continue;
      final id = entry['id'];
      if (id is! int || id <= 0) continue;
      final label = entry['label']?.toString() ?? '';
      final language = entry['language']?.toString() ?? '';
      tracks.add(
        EmbeddedCaptionTrack(
          id: id,
          label: label.isEmpty ? 'CC$id' : label,
          language: language.isEmpty ? null : language,
        ),
      );
    }
    return List.unmodifiable(tracks);
  }
}

abstract class PlayerBackend {
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  });
  Future<void> resume();
  Future<void> pause();
  Future<void> stop();
  Future<void> seekTo(Duration position);

  Duration get position;
  Duration get duration;
  Duration get buffer;
  bool get isPlaying;
  bool get isBuffering;
  double get playbackSpeed;

  Stream<Duration> get positionStream;
  Stream<Duration> get durationStream;
  Stream<Duration> get bufferStream;
  Stream<bool> get playingStream;
  Stream<bool> get bufferingStream;
  Stream<bool> get completedStream;
  Stream<Map<String, dynamic>>? get errorStream => null;

  Map<String, dynamic> getDeviceProfile({bool useProgressiveTranscode = false});

  Future<void> setPlaybackSpeed(double speed);
  Future<void> setAudioTrack(int index);
  Future<void> setSubtitleTrack(
    int index, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  });
  Future<void> disableSubtitleTrack();
  Future<void> waitForTracksReady();
  Future<void> waitForEmbeddedSubtitleCount(int count);
  Future<void> setVolume(double volume);
  Future<void> setAudioDelay(double seconds);
  Future<void> setSubtitleDelay(double seconds);
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  });
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
  });

  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode);

  bool get supportsRuntimeTrackSelection;

  /// Whether a direct-played source can switch audio tracks in place through
  /// [setAudioTrack]. When true the manager skips the PlaybackInfo round trip
  /// and player rebuild that a re-resolve costs, since every embedded track is
  /// already in the stream.
  bool get supportsDirectPlayAudioSwitch => false;

  int? get activeSubtitleTrackIndex => null;

  Future<int?> getActiveSubtitleTrackIndexAsync() async => null;

  bool get requiresStartupMediaReadyCheck => true;

  bool get nativelyHandlesStartPosition => false;

  /// Whether this backend requests and holds Android audio focus itself, like
  /// media3/ExoPlayer built with handleAudioFocus=true. When true, the Dart
  /// audio_session layer stays out of the way so the two do not fight over focus
  /// and pause each other.
  bool get managesAudioFocus => false;

  bool get canRenderBitmapSubtitles;

  /// Whether the player reads subtitle tracks out of the stream itself. A
  /// browser only shows what it is handed as its own file, so subtitles living
  /// inside the container have to be added the same way an external one is,
  /// even when nothing stripped them from the stream.
  bool get demuxesEmbeddedSubtitles => true;

  /// Caption tracks the player found inside the video, which no server stream
  /// list can describe. Empty on engines that don't decode them.
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks => const [];

  /// Turns on one of [embeddedCaptionTracks]. Turning captions back off goes
  /// through [disableSubtitleTrack], the same as any other subtitle.
  Future<void> setEmbeddedCaptionTrack(int id) async {}

  /// Fires when the player's own track list changes. Captions carried inside
  /// the video turn up part way through playback, so a menu built when the
  /// stream started has to be rebuilt when this fires.
  Stream<void> get tracksChangedStream => const Stream.empty();

  void dispose();
}
