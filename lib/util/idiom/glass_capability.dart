import 'package:flutter/foundation.dart' show kIsWeb;

import '../platform_detection.dart';
import 'app_ui_idiom.dart';

enum GlassTier { liquid, frost, solid }

class GlassCapability {
  GlassCapability._();

  static GlassTier resolve() {
    if (kIsWeb) return GlassTier.solid;
    if (!AppUiIdiomResolver.isApple) return GlassTier.solid;
    if (PlatformDetection.isAppleTV) return GlassTier.frost;
    if ((PlatformDetection.isIOS || PlatformDetection.isMacOS) &&
        PlatformDetection.osMajor >= 26) {
      return GlassTier.liquid;
    }
    return GlassTier.frost;
  }
}
