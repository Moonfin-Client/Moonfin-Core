import '../preference/preference_constants.dart';
import '../util/platform_detection.dart';

class KnownDefects {
  const KnownDefects._();

  static const Set<String> modelsWithDoViHdr10PlusBug = <String>{
    'AFTKA', // Amazon Fire TV 4K Max (1st Gen)
    'AFTKM', // Amazon Fire TV 4K (2nd Gen)
    'AFTKRT', // Amazon Fire TV 4K Max (2nd Gen)
    'AFTMM', // Amazon Fire TV 4K (1st Gen)
    'BRAVIA 4K VH22',
  };

  static const Set<String> modelsWithDolbyVisionProfile7ElDirectPlayDefault =
      <String>{
        'AFTKRT',
      };

  static bool get hevcDoviHdr10PlusBug =>
      PlatformDetection.knownHevcDoviHdr10PlusBug ||
      modelHasHevcDoviHdr10PlusBug(PlatformDetection.deviceModel);

  static bool modelHasHevcDoviHdr10PlusBug(String? model) {
    if (model == null) {
      return false;
    }
    return modelsWithDoViHdr10PlusBug.contains(model.trim().toUpperCase());
  }

  static bool modelHasDolbyVisionProfile7ElDirectPlayDefault(String? model) {
    if (model == null) {
      return false;
    }
    return modelsWithDolbyVisionProfile7ElDirectPlayDefault.contains(
      model.trim().toUpperCase(),
    );
  }

  static bool shouldAllowDolbyVisionProfile7ElDirectPlay({
    required DolbyVisionProfile7DirectPlayBehavior behavior,
    String? model,
    bool hasHardwareDolbyVisionDecoder = false,
    bool hasDoviCompat = false,
  }) {
    switch (behavior) {
      case DolbyVisionProfile7DirectPlayBehavior.enabled:
        return true;
      case DolbyVisionProfile7DirectPlayBehavior.disabled:
        return false;
      case DolbyVisionProfile7DirectPlayBehavior.auto:
        // A device with a hardware Dolby Vision decoder can render the P7 base
        // layer, so allow it there even when the EL-specific probe is
        // inconclusive. A player with the DoVi compat chain rewrites or strips
        // the P7 metadata itself, so it always renders the base layer too.
        // Everything else stays gated (P7 transcodes).
        return PlatformDetection.isDesktop ||
            hasDoviCompat ||
            hasHardwareDolbyVisionDecoder ||
            modelHasDolbyVisionProfile7ElDirectPlayDefault(
              model ?? PlatformDetection.deviceModel,
            );
    }
  }
}
