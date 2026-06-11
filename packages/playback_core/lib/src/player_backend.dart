enum SubtitleRendererMode { native, assOverlay }

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

  int? get activeSubtitleTrackIndex => null;

  Future<int?> getActiveSubtitleTrackIndexAsync() async => null;

  bool get requiresStartupMediaReadyCheck => true;

  bool get nativelyHandlesStartPosition => false;

  bool get canRenderBitmapSubtitles;

  void dispose();
}
