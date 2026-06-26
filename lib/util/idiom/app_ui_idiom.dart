import '../platform_detection.dart';

enum AppUiIdiom { iosMobile, macDesktop, tvosLeanback, material }

enum InterfaceStyle { automatic, apple, material }

class AppUiIdiomResolver {
  AppUiIdiomResolver._();

  static InterfaceStyle _style = InterfaceStyle.automatic;
  static AppUiIdiom _current = _resolve(InterfaceStyle.automatic);
  static AppUiIdiom get current => _current;

  static void setOverride(InterfaceStyle style) {
    _style = style;
    _current = _resolve(style);
  }

  static AppUiIdiom _resolve(InterfaceStyle style) {
    switch (style) {
      case InterfaceStyle.material:
        return AppUiIdiom.material;
      case InterfaceStyle.apple:
        return _appleIdiom();
      case InterfaceStyle.automatic:
        return _automaticIdiom();
    }
  }

  static AppUiIdiom _automaticIdiom() {
    if (PlatformDetection.isAppleTV) return AppUiIdiom.tvosLeanback;
    if (PlatformDetection.isMacOS) return AppUiIdiom.macDesktop;
    if (PlatformDetection.isIOS) return AppUiIdiom.iosMobile;
    return AppUiIdiom.material;
  }

  static AppUiIdiom _appleIdiom() {
    if (PlatformDetection.isAppleTV) return AppUiIdiom.tvosLeanback;
    if (PlatformDetection.isMacOS) return AppUiIdiom.macDesktop;
    if (PlatformDetection.isIOS) return AppUiIdiom.iosMobile;
    return PlatformDetection.useMobileUi
        ? AppUiIdiom.iosMobile
        : AppUiIdiom.macDesktop;
  }

  static bool get isApple =>
      _current == AppUiIdiom.iosMobile || _current == AppUiIdiom.macDesktop;

  static bool get appleTvStyle =>
      PlatformDetection.isAppleTV && _style == InterfaceStyle.apple;
}
