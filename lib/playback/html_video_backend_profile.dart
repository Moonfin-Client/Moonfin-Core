
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

import 'device_profile_builder.dart';
import 'known_defects.dart';

Map<String, dynamic> buildHtmlVideoBackendDeviceProfile(
  UserPreferences prefs, {
  bool useProgressiveTranscode = false,
}) {
  final maxBitrate = int.tryParse(prefs.get(UserPreferences.maxBitrate));
  final maxResolution = prefs.get(UserPreferences.maxVideoResolution);
  final audioOutputMode = prefs.resolveAudioOutputMode();
  final audioFallbackCodec = prefs.resolveAudioFallbackCodec();
  final audioCapabilityProfile = prefs.detectedAudioCapabilities;

  return DeviceProfileBuilder.build(
    maxBitrateMbps: maxBitrate,
    audioCapabilityProfile: audioCapabilityProfile,
    audioOutputMode: audioOutputMode,
    audioFallbackCodec: audioFallbackCodec,
    ac3PassthroughEnabled: prefs.resolveAc3PassthroughEnabled(),
    eac3PassthroughEnabled: prefs.resolveEac3PassthroughEnabled(),
    eac3JocPassthroughEnabled: prefs.resolveEac3JocPassthroughEnabled(),
    dtsCorePassthroughEnabled: prefs.resolveDtsCorePassthroughEnabled(),
    dtsHdPassthroughEnabled: prefs.resolveDtsHdPassthroughEnabled(),
    trueHdPassthroughEnabled: prefs.resolveTrueHdPassthroughEnabled(),
    trueHdAtmosPassthroughEnabled: prefs.resolveTrueHdAtmosPassthroughEnabled(),
    maxAudioChannels: prefs.resolveMaxAudioChannels(),
    maxResolution: maxResolution,
    pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay),
    assDirectPlay: prefs.get(UserPreferences.assDirectPlay),
    supportsEmbeddedSubtitles: false,
    supportsExternalTextSubtitles: false,
    supportsAvc: PlatformDetection.supportsAvc,
    supportsAvcHigh10: PlatformDetection.supportsAvcHigh10,
    avcMainLevel: PlatformDetection.avcMainLevel,
    avcHigh10Level: PlatformDetection.avcHigh10Level,
    supportsHevc: PlatformDetection.supportsHevc,
    supportsHevcMain10: PlatformDetection.supportsHevcMain10,
    hevcMainLevel: PlatformDetection.hevcMainLevel,
    supportsHevcDolbyVision: PlatformDetection.supportsHevcDolbyVision,
    supportsHevcDolbyVisionEl: PlatformDetection.supportsHevcDolbyVisionEl,
    supportsHevcHdr10: PlatformDetection.supportsHevcHdr10,
    supportsHevcHdr10Plus: PlatformDetection.supportsHevcHdr10Plus,
    supportsAv1: PlatformDetection.supportsAv1,
    supportsAv1Main10: PlatformDetection.supportsAv1Main10,
    supportsAv1DolbyVision: PlatformDetection.supportsAv1DolbyVision,
    supportsAv1Hdr10: PlatformDetection.supportsAv1Hdr10,
    supportsAv1Hdr10Plus: PlatformDetection.supportsAv1Hdr10Plus,
    supportsVc1: PlatformDetection.supportsVc1,
    maxResolutionAvcWidth: PlatformDetection.maxResolutionAvcWidth,
    maxResolutionAvcHeight: PlatformDetection.maxResolutionAvcHeight,
    maxResolutionHevcWidth: PlatformDetection.maxResolutionHevcWidth,
    maxResolutionHevcHeight: PlatformDetection.maxResolutionHevcHeight,
    maxResolutionAv1Width: PlatformDetection.maxResolutionAv1Width,
    maxResolutionAv1Height: PlatformDetection.maxResolutionAv1Height,
    maxResolutionVc1Width: PlatformDetection.maxResolutionVc1Width,
    maxResolutionVc1Height: PlatformDetection.maxResolutionVc1Height,
    supportsDvProfile5: PlatformDetection.supportsDoViProfile5,
    supportsDvProfile7: PlatformDetection.supportsDoViProfile7,
    supportsDvProfile8: PlatformDetection.supportsDoViProfile8,
    knownHevcDoviHdr10PlusBug: PlatformDetection.knownHevcDoviHdr10PlusBug,
    allowDolbyVisionProfile7ElDirectPlay:
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
          behavior: prefs.get(
            UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
          ),
        ),
  );
}
