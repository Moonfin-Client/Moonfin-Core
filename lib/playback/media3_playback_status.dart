/// What the native Media3 player decided and is putting out for the current
/// source, for the playback information panel. The server's media streams
/// describe the source as Jellyfin last probed it, which for live TV can be a
/// different programme; this is what is actually playing.
class Media3PlaybackStatus {
  /// The rate the display decision used, in frames per second. For
  /// interlaced video this is the field rate; see [fieldRateApplied].
  double? decisionFrameRate;

  /// Where [decisionFrameRate] came from: `header`, `measured`, `serverReal`,
  /// `serverAverage`, `serverHint` or `none`.
  String? decisionSource;

  /// `progressive`, `interlaced` or `repeated_fields` when the stream's own
  /// headers said so.
  String? scanType;

  bool fieldRateApplied = false;

  /// Whether refresh rate switching is on, and how (`scaleontv` or
  /// `scaleondevice`).
  bool? switchingEnabled;
  String? switchingBehavior;

  /// The display mode the player is holding, when it switched or kept one.
  double? displayRefreshRate;
  int? displayWidth;
  int? displayHeight;

  /// The decoded picture size.
  int? videoWidth;
  int? videoHeight;

  /// The audio track the player opened.
  String? audioEncoding;
  int? audioChannels;
  bool? audioPassthrough;

  /// Live rate corrections applied after the start.
  int corrections = 0;

  /// Applies one native decision as a single status update. Missing or
  /// unrecognized provenance is cleared conservatively.
  void applyRateDecision({
    required double? frameRate,
    required String? source,
    required bool fieldRateApplied,
    required String? scanType,
    bool correction = false,
  }) {
    decisionFrameRate = frameRate;
    decisionSource = source;
    this.fieldRateApplied = fieldRateApplied;
    this.scanType = switch (scanType) {
      'progressive' || 'interlaced' || 'repeated_fields' => scanType,
      _ => null,
    };
    if (correction && frameRate != null) corrections += 1;
  }

  /// The picture rate the decision stands for: the field rate halved when
  /// interlaced video was shown at its field rate.
  double? get pictureFrameRate {
    final rate = decisionFrameRate;
    if (rate == null) return null;
    return fieldRateApplied ? rate / 2 : rate;
  }

  void reset() {
    decisionFrameRate = null;
    decisionSource = null;
    scanType = null;
    fieldRateApplied = false;
    switchingEnabled = null;
    switchingBehavior = null;
    displayRefreshRate = null;
    displayWidth = null;
    displayHeight = null;
    videoWidth = null;
    videoHeight = null;
    audioEncoding = null;
    audioChannels = null;
    audioPassthrough = null;
    corrections = 0;
  }
}
