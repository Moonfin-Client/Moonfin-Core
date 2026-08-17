/// AVC Level 4.1 (1080p), the decode floor every Android device running this
/// app clears.
const int avcFloorLevel = 41;

/// Whether an Android MediaCodec probe result reports no usable H264 support.
/// A cold-start probe can race codec enumeration and come back this way, and
/// every Android device that reaches this code plays H264, so such a result
/// is a transient failure, not a real capability.
bool codecCapsLookDegenerate(Map<String, dynamic> caps) {
  final supportsAvc = caps['supportsAvc'] == true;
  final avcMainLevel = caps['avcMainLevel'];
  return !supportsAvc || avcMainLevel is! int || avcMainLevel <= 0;
}

/// Whether a probe result that cleared the AVC check still reports no HEVC.
/// The same enumeration race can drop only part of the codec list, and a
/// result like this ships as it is because devices without an HEVC decoder
/// really exist. It is grounds to probe again in the background, never to
/// invent a decoder, so a wrong guess costs a few probes rather than a
/// stream the device cant play.
bool codecCapsLookIncomplete(Map<String, dynamic> caps) {
  return caps['supportsHevc'] != true;
}

/// Repairs a degenerate probe result so the device profile still advertises
/// H264. Without this the profile carries no h264 codec profiles at all, the
/// server receives `h264-profile=none`, no encoder it owns can match the
/// client profile list, and every transcode segment returns HTTP 500. A
/// needless transcode is recoverable, an unplayable stream is not.
///
/// Only the AVC fields are filled in, so the repair can't claim decoding the
/// device lacks, and everything else the probe reported is left untouched.
Map<String, dynamic> withAvcFloor(Map<String, dynamic> caps) {
  return <String, dynamic>{
    ...caps,
    'supportsAvc': true,
    'avcMainLevel': avcFloorLevel,
  };
}
