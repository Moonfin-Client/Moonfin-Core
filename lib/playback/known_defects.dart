import '../preference/preference_constants.dart';
import '../util/platform_detection.dart';

class KnownDefects {
  const KnownDefects._();

  static const Set<String> modelsWithDoViHdr10PlusBug = <String>{
    'AFTKA',
    'AFTKM',
    'AFTKRT',
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
  }) {
    switch (behavior) {
      case DolbyVisionProfile7DirectPlayBehavior.enabled:
        return true;
      case DolbyVisionProfile7DirectPlayBehavior.disabled:
        return false;
      case DolbyVisionProfile7DirectPlayBehavior.auto:
        return PlatformDetection.isDesktop ||
            modelHasDolbyVisionProfile7ElDirectPlayDefault(
              model ?? PlatformDetection.deviceModel,
            );
    }
  }
}
