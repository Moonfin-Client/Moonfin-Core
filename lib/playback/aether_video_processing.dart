import '../preference/user_preferences.dart';

Map<String, Object?> aetherVideoProcessingArgs(UserPreferences prefs) => {
  'upscaleLowResolution': prefs.get(UserPreferences.upscaleLowResolutionVideo),
};
