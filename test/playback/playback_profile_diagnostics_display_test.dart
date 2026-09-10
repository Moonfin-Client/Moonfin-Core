import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/audio_capability_profile.dart';
import 'package:moonfin/playback/playback_profile_diagnostics.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';

class _FakeBackend extends Fake implements PlayerBackend {}

Map<String, dynamic>? _log({
  required List<String> transcodingReasons,
  String? clientTranscodeReason,
}) {
  PlaybackProfileDiagnostics.instance.logPlaybackDecision(
    context: PlaybackDecisionContext(
      mediaItem: <String, dynamic>{'Id': 'item-1', 'Name': 'Test Movie'},
      resolution: StreamResolutionResult(
        streamUrl: 'http://server/stream.mkv',
        mediaSourceId: 'source-1',
        playMethod: StreamPlayMethod.transcode,
        container: 'mkv',
        videoRangeType: 'DOVIWithEL',
        transcodingReasons: transcodingReasons,
      ),
      backend: _FakeBackend(),
      deviceProfile: const <String, dynamic>{},
      maxStreamingBitrate: null,
      clientTranscodeReason: clientTranscodeReason,
    ),
    audioCapabilityProfile: AudioCapabilityProfile.fromMap(null),
    deviceAudioCapabilities: const <String, dynamic>{},
    audioSpdifCodecs: const <String>[],
  );
  return PlaybackProfileDiagnostics.instance.lastDecision;
}

void main() {
  tearDown(() {
    PlatformDetection.setDisplayHdrTypes(null);
    PlatformDetection.setMediaCodecCapabilities(null);
  });

  test('a display-caused transcode names itself in the log', () {
    // The issue #1442 shape: the decoder does Dolby Vision, the display
    // says it does not, and the server named no reason because it was this
    // client that refused.
    PlatformDetection.setMediaCodecCapabilities(const <String, dynamic>{
      'supportsHevcDolbyVision': true,
    });
    PlatformDetection.setDisplayHdrTypes(const <String>[]);

    final entry = _log(
      transcodingReasons: const <String>[],
      clientTranscodeReason: 'displayReportsNoHdr',
    );

    expect(entry?['transcodingReasons'], isEmpty);
    expect(entry?['clientTranscodeReason'], 'displayReportsNoHdr');

    final display = entry?['displayHdrCapabilities'] as Map<String, dynamic>?;
    expect(display?['probed'], isTrue);
    expect(display?['dolbyVision'], isFalse);
    expect(display?['hdrTypes'], isEmpty);

    // The contradiction the report has to make visible: the decoder side and
    // the display side disagree, which is the whole diagnosis.
    final decoder = entry?['videoRangeCapabilities'] as Map<String, dynamic>?;
    expect(decoder?['dolbyVision'], isTrue);
  });

  test('a display that was never asked is not reported as SDR', () {
    PlatformDetection.setDisplayHdrTypes(null);
    final entry = _log(transcodingReasons: const <String>[]);
    final display = entry?['displayHdrCapabilities'] as Map<String, dynamic>?;
    expect(display?['probed'], isFalse);
    expect(entry?['clientTranscodeReason'], isNull);
  });

  test('a server-side transcode leaves the client reason empty', () {
    PlatformDetection.setDisplayHdrTypes(const <String>['DOLBY_VISION']);
    final entry = _log(
      transcodingReasons: const <String>['VideoCodecNotSupported'],
    );
    expect(entry?['transcodingReasons'], <String>['VideoCodecNotSupported']);
    expect(entry?['clientTranscodeReason'], isNull);
    final display = entry?['displayHdrCapabilities'] as Map<String, dynamic>?;
    expect(display?['dolbyVision'], isTrue);
  });

  test('the entry survives a json round trip', () {
    // The logger falls back to a placeholder when encoding throws, which would
    // silently hide every field added here.
    PlatformDetection.setDisplayHdrTypes(const <String>['HDR10']);
    final entry = _log(
      transcodingReasons: const <String>[],
      clientTranscodeReason: 'displayLacksHdr10ForFallback',
    );
    final decoded = jsonDecode(jsonEncode(entry)) as Map<String, dynamic>;
    expect(decoded['clientTranscodeReason'], 'displayLacksHdr10ForFallback');
    expect(
      (decoded['displayHdrCapabilities'] as Map<String, dynamic>)['hdrTypes'],
      <String>['HDR10'],
    );
  });
}
