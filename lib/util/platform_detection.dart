import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformDetection {
  const PlatformDetection._();

  static const double _mobileFormFactorBreakpoint = 600;

  /// True when compiled for Tizen (Samsung TV). Set via
  /// `--dart-define=MOONFIN_TIZEN=true` in build-tizen.sh. Tizen is Linux-based
  /// and reports as [TargetPlatform.linux] to the framework, so this
  /// compile-time flag is the source of truth and must take precedence over the
  /// OS-derived getters below (otherwise Tizen would take the desktop/libmpv
  /// path). It const-folds to `false` on every other build, so the `!isTizen`
  /// guards below add no runtime cost elsewhere.
  static const bool isTizen = bool.fromEnvironment('MOONFIN_TIZEN');

  static bool get isAndroid =>
      !kIsWeb && !isTizen && defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS =>
      !kIsWeb && !isTizen && defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isMacOS =>
      !kIsWeb && !isTizen && defaultTargetPlatform == TargetPlatform.macOS;
  static bool get isWindows =>
      !kIsWeb && !isTizen && defaultTargetPlatform == TargetPlatform.windows;
  static bool get isLinux =>
      !kIsWeb && !isTizen && defaultTargetPlatform == TargetPlatform.linux;
  static bool get isWeb => kIsWeb;

  static String get linuxSessionType => '';

  static String get pathSeparator => isWindows ? '\\' : '/';

  static bool get isLinuxWayland => linuxSessionType == 'wayland';
  static bool get isLinuxX11 => linuxSessionType == 'x11';

  static bool get isMobile => (isAndroid || isIOS) && !_isTv;
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  // Tizen runs only on Samsung TVs, so it is always a 10-foot/leanback device.
  static bool get isTV => _isTv || isTizen;
  static bool _isTv = false;
  static void setTvMode(bool value) => _isTv = value;

  static final Set<String> _displayHdrTypes = <String>{};
  static final Map<String, dynamic> _mediaCodecCapabilities = <String, dynamic>{};
  static final Map<String, dynamic> _audioCapabilities = <String, dynamic>{};
  static bool _hasDolbyVisionCodecCapabilities = false;
  static bool _supportsDoViProfile5 = false;
  static bool _supportsDoViProfile7 = false;
  static bool _supportsDoViProfile8 = false;

  static bool get supportsAnyHdr => _displayHdrTypes.isNotEmpty;
  static bool get supportsDolbyVision =>
      _displayHdrTypes.contains('DOLBY_VISION');
  static bool get supportsHdr10 =>
      _displayHdrTypes.contains('HDR10') ||
      _displayHdrTypes.contains('HDR10_PLUS');
  static bool get supportsHdr10PlusDisplay =>
      _displayHdrTypes.contains('HDR10_PLUS');

  static bool get hasDolbyVisionCodecCapabilities =>
      _hasDolbyVisionCodecCapabilities;
  static bool get supportsDoViProfile5 => _supportsDoViProfile5;
  static bool get supportsDoViProfile7 => _supportsDoViProfile7;
  static bool get supportsDoViProfile8 => _supportsDoViProfile8;

  static bool get hasAudioCapabilities => _audioCapabilities.isNotEmpty;
  static Map<String, dynamic> get audioCapabilitiesSnapshot =>
      Map<String, dynamic>.from(_audioCapabilities);
  static bool get supportsAc3Audio => _audioCapabilityBool('supportsAc3');
  static bool get supportsDtsAudio => _audioCapabilityBool('supportsDts');
  static bool get supportsTrueHdAudio => _audioCapabilityBool('supportsTrueHd');
  static bool get supportsEac3Audio => _audioCapabilityBool('canPassthroughEac3');
  static bool get supportsDtsHdAudio => _audioCapabilityBool('canPassthroughDtsHd');
  static bool get supportsDtsXAudio => _audioCapabilityBool('canPassthroughDtsX');
  static bool get supportsEac3JocAudio =>
      _audioCapabilityBool('canPassthroughEac3Joc');
  static bool get supportsTrueHdJocAudio =>
      _audioCapabilityBool('canPassthroughTrueHdJoc');
  static int get maxPcmChannelsAudio => _audioCapabilityInt('maxPcmChannels');
  static String get activeAudioRouteType =>
      _audioCapabilityString('activeRouteType') ?? 'other';
  static bool get routeSupportsHdAudio =>
      _audioCapabilityBool('routeSupportsHdAudio');

  static bool get supportsAvc => _capabilityBool('supportsAvc');
  static bool get supportsAvcHigh10 => _capabilityBool('supportsAvcHigh10');
  static int get avcMainLevel => _capabilityInt('avcMainLevel');
  static int get avcHigh10Level => _capabilityInt('avcHigh10Level');

  static bool get supportsHevc => _capabilityBool('supportsHevc');
  static bool get supportsHevcMain10 => _capabilityBool('supportsHevcMain10');
  static int get hevcMainLevel => _capabilityInt('hevcMainLevel');
  static int get hevcMain10Level => _capabilityInt('hevcMain10Level');
  static bool get supportsHevcDolbyVision =>
      _capabilityBool('supportsHevcDolbyVision');
  static bool get supportsHevcDolbyVisionEl =>
      _capabilityBool('supportsHevcDolbyVisionEl');
  static bool get supportsHevcHdr10 => _capabilityBool('supportsHevcHdr10');
  static bool get supportsHevcHdr10Plus =>
      _capabilityBool('supportsHevcHdr10Plus');

  static bool get supportsAv1 => _capabilityBool('supportsAv1');
  static bool get supportsAv1Main10 => _capabilityBool('supportsAv1Main10');
  static bool get supportsAv1DolbyVision =>
      _capabilityBool('supportsAv1DolbyVision');
  static bool get supportsAv1Hdr10 => _capabilityBool('supportsAv1Hdr10');
  static bool get supportsAv1Hdr10Plus =>
      _capabilityBool('supportsAv1Hdr10Plus');

  static bool get supportsVc1 => _capabilityBool('supportsVc1');

  static int get maxResolutionAvcWidth =>
      _resolutionInt('maxResolutionAvc', 'width');
  static int get maxResolutionAvcHeight =>
      _resolutionInt('maxResolutionAvc', 'height');
  static int get maxResolutionHevcWidth =>
      _resolutionInt('maxResolutionHevc', 'width');
  static int get maxResolutionHevcHeight =>
      _resolutionInt('maxResolutionHevc', 'height');
  static int get maxResolutionAv1Width =>
      _resolutionInt('maxResolutionAv1', 'width');
  static int get maxResolutionAv1Height =>
      _resolutionInt('maxResolutionAv1', 'height');
  static int get maxResolutionVc1Width =>
      _resolutionInt('maxResolutionVc1', 'width');
  static int get maxResolutionVc1Height =>
      _resolutionInt('maxResolutionVc1', 'height');

  static Size? maxResolutionFor(String codec) {
    final normalized = codec.trim().toLowerCase();
    int width;
    int height;
    switch (normalized) {
      case 'h264':
      case 'avc':
        width = maxResolutionAvcWidth;
        height = maxResolutionAvcHeight;
      case 'hevc':
      case 'h265':
        width = maxResolutionHevcWidth;
        height = maxResolutionHevcHeight;
      case 'av1':
        width = maxResolutionAv1Width;
        height = maxResolutionAv1Height;
      case 'vc1':
        width = maxResolutionVc1Width;
        height = maxResolutionVc1Height;
      default:
        return null;
    }

    if (width <= 0 || height <= 0) {
      return null;
    }

    return Size(width.toDouble(), height.toDouble());
  }

  static bool get knownHevcDoviHdr10PlusBug =>
      _capabilityBool('knownHevcDoviHdr10PlusBug');

  static String? get deviceModel => _capabilityString('deviceModel');
  static String? get deviceBoard => _capabilityString('deviceBoard');
  static String? get deviceHardware => _capabilityString('deviceHardware');
  static String? get deviceSocModel => _capabilityString('deviceSocModel');

  static void setDisplayHdrTypes(Iterable<String>? values) {
    _displayHdrTypes
      ..clear()
      ..addAll(
        (values ?? const <String>[])
            .map((value) => value.trim().toUpperCase())
            .where((value) => value.isNotEmpty),
      );
  }

  static void setMediaCodecCapabilities(Map<String, dynamic>? values) {
    _mediaCodecCapabilities
      ..clear()
      ..addAll(values ?? const <String, dynamic>{});

    _hasDolbyVisionCodecCapabilities = _mediaCodecCapabilities.isNotEmpty;
    _supportsDoViProfile5 = _capabilityBool('supportsDvP5');
    _supportsDoViProfile7 = _capabilityBool('supportsDvP7');
    _supportsDoViProfile8 = _capabilityBool('supportsDvP8');
  }

  static void setDolbyVisionCodecCapabilities(Map<String, bool>? values) {
    if (values == null) {
      setMediaCodecCapabilities(null);
      return;
    }

    final merged = Map<String, dynamic>.from(_mediaCodecCapabilities)
      ..addAll(values);
    setMediaCodecCapabilities(merged);
  }

  static void setAudioCapabilities(Map<String, dynamic>? values) {
    _audioCapabilities
      ..clear()
      ..addAll(values ?? const <String, dynamic>{});
  }

  static bool _capabilityBool(String key) {
    return _asBool(_mediaCodecCapabilities[key]);
  }

  static bool _audioCapabilityBool(String key) {
    return _asBool(_audioCapabilities[key]);
  }

  static int _audioCapabilityInt(String key) {
    final value = _audioCapabilities[key];
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static String? _audioCapabilityString(String key) {
    final value = _audioCapabilities[key];
    final text = value?.toString().trim();
    if (text == null || text.isEmpty || text.toLowerCase() == 'null') {
      return null;
    }
    return text;
  }

  static bool _asBool(Object? value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      return normalized == 'true' || normalized == '1';
    }
    return false;
  }

  static int _capabilityInt(String key) {
    final value = _mediaCodecCapabilities[key];
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static String? _capabilityString(String key) {
    final value = _mediaCodecCapabilities[key];
    final text = value?.toString().trim();
    if (text == null || text.isEmpty || text.toLowerCase() == 'null') {
      return null;
    }
    return text;
  }

  static int _resolutionInt(String key, String field) {
    final dynamic raw = _mediaCodecCapabilities[key];
    if (raw is Map) {
      final dynamic value = raw[field];
      if (value is int) return value;
      if (value is num) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static Size? get _screenLogicalSize {
    final view = WidgetsBinding.instance.platformDispatcher.implicitView;
    if (view == null) return null;
    final pixelRatio = view.devicePixelRatio == 0 ? 1.0 : view.devicePixelRatio;
    return view.physicalSize / pixelRatio;
  }

  static bool get _isMobilePlatformSignal {
    if (isAndroid || isIOS) return true;
    if (kIsWeb) {
      return defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS;
    }
    return false;
  }

  static bool get _hasMobileFormFactor {
    if (defaultTargetPlatform == TargetPlatform.iOS) return true;
    final size = _screenLogicalSize;
    if (size == null) return _isMobilePlatformSignal;
    if (size.shortestSide <= 0) return _isMobilePlatformSignal;
    return size.shortestSide < _mobileFormFactorBreakpoint;
  }

  /// Whether to use a 10-foot (lean-back) UI optimized for remote control.
  static bool get useLeanbackUi => isTV;
  static bool get useDesktopUi => !_hasMobileFormFactor && !isTV;
  static bool get useMobileUi => _hasMobileFormFactor && !isTV;

  static bool get useNativeVideoSurface => isAndroid && isTV;
}
