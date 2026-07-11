import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

import 'web_playback_capabilities_model.dart';

WebPlaybackCapabilities? _cached;

class _BrowserInfo {
  const _BrowserInfo({
    required this.isSafari,
    required this.isFirefox,
    required this.isChrome,
    required this.isEdgeChromium,
    required this.isWindows,
    required this.isMacOS,
    required this.isIOS,
    required this.isAndroid,
    required this.isMobile,
    required this.browserMajorVersion,
    required this.iOSMajorVersion,
  });

  final bool isSafari;
  final bool isFirefox;
  final bool isChrome;
  final bool isEdgeChromium;
  final bool isWindows;
  final bool isMacOS;
  final bool isIOS;
  final bool isAndroid;
  final bool isMobile;
  final int browserMajorVersion;
  final int iOSMajorVersion;
}

WebPlaybackCapabilities detectWebPlaybackCapabilities() {
  final cached = _cached;
  if (cached != null) {
    return cached;
  }

  try {
    final video = web.HTMLVideoElement();
    final audio = web.HTMLAudioElement();
    final browser = _detectBrowserInfo();

    final supportsAvc = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="avc1.42E01E"',
      'video/mp4; codecs="avc1.42e01e"',
      'video/mp4; codecs="avc1.4D401E"',
      'video/mp4; codecs="avc1.4d401e"',
      'video/mp4; codecs="avc1.640028"',
      'video/mp4; codecs="avc1"',
      'video/mp4',
    ]);
    final supportsAvcHigh10 = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="avc1.6E001E"',
      'video/mp4; codecs="avc1.6e001e"',
    ]);
    final avcMainLevel = _detectAvcMainLevel(video, supportsAvc: supportsAvc);
    final avcHigh10Level = _detectAvcHigh10Level(
      video,
      supportsAvcHigh10: supportsAvcHigh10,
    );

    final supportsHevc = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="hvc1.1.L120"',
      'video/mp4; codecs="hev1.1.L120"',
      'video/mp4; codecs="hvc1.1.0.L120"',
      'video/mp4; codecs="hev1.1.0.L120"',
      'video/mp4; codecs="hvc1.1.6.L93.B0"',
      'video/mp4; codecs="hev1.1.6.L93.B0"',
      'video/mp4; codecs="hvc1"',
      'video/mp4; codecs="hev1"',
    ]);
    final supportsHevcMain10 = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="hvc1.2.4.L123.B0"',
      'video/mp4; codecs="hvc1.2.4.l123.b0"',
      'video/mp4; codecs="hev1.2.4.L123.B0"',
      'video/mp4; codecs="hev1.2.4.l123.b0"',
    ]);
    final hevcMainLevel = _detectHevcMainLevel(
      video,
      supportsHevc: supportsHevc,
    );

    final supportsAv1 = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="av01.0.08M.08"',
      'video/mp4; codecs="av01.0.08m.08"',
      'video/webm; codecs="av01.0.08M.08"',
      'video/webm; codecs="av01.0.08m.08"',
      'video/mp4; codecs="av01"',
    ]);
    final supportsAv1Main10 = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="av01.0.10M.10"',
      'video/mp4; codecs="av01.0.10m.10"',
      'video/webm; codecs="av01.0.10M.10"',
      'video/webm; codecs="av01.0.10m.10"',
    ]);
    final supportsVp8 = _supportsAnyType(video, const <String>[
      'video/webm; codecs="vp8"',
    ]);
    final supportsVp9 = _supportsAnyType(video, const <String>[
      'video/webm; codecs="vp9"',
      'video/mp4; codecs="vp09.00.10.08"',
    ]);

    final supportsVc1 = _supportsAnyType(video, const <String>[
      'video/mp4; codecs="vc-1"',
      'video/mp4; codecs="wmv3"',
      'video/x-ms-wmv; codecs="vc1"',
    ]);

    // Only Safari and iOS WebKit deliver working native HLS. Chromium 142+
    // answers canPlayType affirmatively but black-screens on MPEG-TS
    // segments, and playback goes through hls.js there anyway.
    final canPlayNativeHls = (browser.isSafari || browser.isIOS) &&
        _supportsAnyTypeDirect(video, const <String>[
          'application/x-mpegURL',
          'application/vnd.apple.mpegURL',
        ]);
    final canPlayHls = canPlayNativeHls || _hasMediaSourceSupport();
    final canPlayNativeHlsInFmp4 =
        (browser.isIOS && browser.iOSMajorVersion >= 11) || browser.isMacOS;
    final canDecodeAc3InHls = _supportsAnyTypeDirect(video, const <String>[
      'application/x-mpegurl; codecs="avc1.42E01E, ac-3"',
      'application/vnd.apple.mpegURL; codecs="avc1.42E01E, ac-3"',
    ]);
    final canDecodeMp3InHls = _supportsAnyTypeDirect(video, const <String>[
      'application/x-mpegurl; codecs="avc1.64001E, mp4a.40.34"',
      'application/vnd.apple.mpegURL; codecs="avc1.64001E, mp4a.40.34"',
    ]);
    final canPlayMkv = _detectCanPlayMkv(video, browser: browser);

    final canDecodeAc3 = _supportsAnyType(audio, const <String>[
      'audio/mp4; codecs="ac-3"',
      'audio/mp4; codecs="dac3"',
    ]);
    final canDecodeEac3 = _supportsAnyType(audio, const <String>[
      'audio/mp4; codecs="ec-3"',
      'audio/mp4; codecs="dec3"',
    ]);
    final canDecodeFlac = _supportsAnyType(audio, const <String>[
      'audio/flac',
      'audio/mp4; codecs="flac"',
      'audio/mp4; codecs="fLaC"',
    ]);
    final safariSupportsOpus =
        browser.isSafari &&
        browser.browserMajorVersion >= 17 &&
        _supportsAnyTypeDirect(audio, const <String>[
          'audio/x-caf; codecs="opus"',
        ]);
    final canDecodeOpus =
        _supportsAnyType(audio, const <String>[
          'audio/ogg; codecs="opus"',
          'audio/webm; codecs="opus"',
        ]) ||
        safariSupportsOpus;
    final canDecodeAlac =
        browser.isIOS ||
        (browser.isMacOS && browser.isSafari) ||
        _supportsAnyType(audio, const <String>[
          'audio/mp4; codecs="alac"',
          'audio/x-m4a; codecs="alac"',
        ]);
    final maxPcmChannels = _detectMaxPcmChannels();
    final supportsHdr10 = _supportsHdr10(browser);
    final supportsDolbyVision = _supportsDolbyVision(browser);
    final supportsDvProfile5 =
        supportsDolbyVision &&
        _supportsAnyTypeDirect(video, const <String>[
          'video/mp4; codecs="dvh1.05.06"',
        ]);
    final supportsDvProfile8 =
        supportsDolbyVision &&
        _supportsAnyTypeDirect(video, const <String>[
          'video/mp4; codecs="dvh1.08.06"',
        ]);
    final supportsHevcDolbyVision = supportsDvProfile5 || supportsDvProfile8;
    final supportsAv1DolbyVision =
        supportsDolbyVision &&
        _supportsAnyTypeDirect(video, const <String>[
          'video/mp4; codecs="dav1.10.06"',
        ]);

    final result = WebPlaybackCapabilities(
      supportsAvc: supportsAvc,
      supportsAvcHigh10: supportsAvcHigh10,
      avcMainLevel: avcMainLevel,
      avcHigh10Level: avcHigh10Level,
      supportsHevc: supportsHevc,
      supportsHevcMain10: supportsHevcMain10,
      hevcMainLevel: hevcMainLevel,
      supportsHevcDolbyVision: supportsHevcDolbyVision,
      supportsHevcDolbyVisionEl: false,
      supportsHevcHdr10: supportsHevc && supportsHdr10,
      supportsHevcHdr10Plus: supportsHevc && supportsHdr10,
      supportsAv1: supportsAv1,
      supportsAv1Main10: supportsAv1Main10,
      supportsAv1DolbyVision: supportsAv1DolbyVision,
      supportsAv1Hdr10: supportsAv1 && supportsHdr10,
      supportsAv1Hdr10Plus: supportsAv1 && supportsHdr10,
      supportsVc1: supportsVc1,
      maxResolutionAvcWidth: 0,
      maxResolutionAvcHeight: 0,
      maxResolutionHevcWidth: 0,
      maxResolutionHevcHeight: 0,
      maxResolutionAv1Width: 0,
      maxResolutionAv1Height: 0,
      maxResolutionVc1Width: 0,
      maxResolutionVc1Height: 0,
      supportsDvProfile5: supportsDvProfile5,
      supportsDvProfile7: false,
      supportsDvProfile8: supportsDvProfile8,
      knownHevcDoviHdr10PlusBug: false,
      canDecodeAc3: canDecodeAc3,
      canDecodeEac3: canDecodeEac3,
      canDecodeDts: false,
      canDecodeDtsHd: false,
      canDecodeTrueHd: false,
      canDecodeFlac: canDecodeFlac,
      maxPcmChannels: maxPcmChannels,
      supportsVp8: supportsVp8,
      supportsVp9: supportsVp9,
      canPlayMkv: canPlayMkv,
      canPlayHls: canPlayHls,
      canPlayNativeHls: canPlayNativeHls,
      canPlayNativeHlsInFmp4: canPlayNativeHlsInFmp4,
      canDecodeAc3InHls: canDecodeAc3InHls,
      canDecodeMp3InHls: canDecodeMp3InHls,
      canDecodeOpus: canDecodeOpus,
      canDecodeAlac: canDecodeAlac,
      isSafari: browser.isSafari,
      isFirefox: browser.isFirefox,
      isChrome: browser.isChrome,
      isEdgeChromium: browser.isEdgeChromium,
      isWindows: browser.isWindows,
      isMacOS: browser.isMacOS,
      isIOS: browser.isIOS,
      iOSMajorVersion: browser.iOSMajorVersion,
      isAndroid: browser.isAndroid,
      isMobile: browser.isMobile,
      browserMajorVersion: browser.browserMajorVersion,
      maxStreamingBitrate: 120000000,
    );

    _cached = result;
    return result;
  } catch (_) {
    const result = WebPlaybackCapabilities.conservative;
    _cached = result;
    return result;
  }
}

bool _supportsAnyType(web.HTMLMediaElement media, List<String> mimeTypes) {
  for (final mimeType in mimeTypes) {
    if (_isTypeSupportedByMse(mimeType)) {
      return true;
    }

    try {
      final verdict = media.canPlayType(mimeType);
      if (_isProbablyOrMaybe(verdict)) {
        return true;
      }
    } catch (_) {}
  }

  return false;
}

bool _supportsAnyTypeDirect(
  web.HTMLMediaElement media,
  List<String> mimeTypes,
) {
  for (final mimeType in mimeTypes) {
    try {
      final verdict = media.canPlayType(mimeType);
      if (_isProbablyOrMaybe(verdict)) {
        return true;
      }
    } catch (_) {}
  }

  return false;
}

bool _isTypeSupportedByMse(String mimeType) {
  try {
    return web.MediaSource.isTypeSupported(mimeType);
  } catch (_) {
    return false;
  }
}

bool _hasMediaSourceSupport() {
  try {
    return web.window.getProperty('MediaSource'.toJS) != null;
  } catch (_) {
    return false;
  }
}

_BrowserInfo _detectBrowserInfo() {
  final userAgent = web.window.navigator.userAgent.toLowerCase();
  final maxTouchPoints = web.window.navigator.maxTouchPoints;

  final isEdgeChromium =
      userAgent.contains('edg/') ||
      userAgent.contains('edga/') ||
      userAgent.contains('edgios/');
  final isFirefox = userAgent.contains('firefox/');
  final isChrome =
      !isEdgeChromium &&
      userAgent.contains('chrome/') &&
      !userAgent.contains('opr/');

  var isSafari =
      !isChrome &&
      !isEdgeChromium &&
      userAgent.contains('safari/') &&
      !isFirefox;

  final isWindows = userAgent.contains('windows');
  final isAndroid = userAgent.contains('android');
  var isMacOS = userAgent.contains('mac os x');

  final isIphone = userAgent.contains('iphone');
  var isIpad = userAgent.contains('ipad');
  final isIpod = userAgent.contains('ipod');

  if (isMacOS && !isIphone && !isIpad && !isIpod && maxTouchPoints > 1) {
    isIpad = true;
  }

  final isIOS = isIphone || isIpad || isIpod;
  if (isIOS && !isSafari && userAgent.contains('applewebkit')) {
    isSafari = true;
  }

  if (isIOS) {
    isMacOS = false;
  }

  final isMobile =
      userAgent.contains('mobi') ||
      isIOS ||
      isAndroid ||
      userAgent.contains('tablet');

  final browserMajorVersion = _detectBrowserMajorVersion(
    userAgent: userAgent,
    isSafari: isSafari,
    isFirefox: isFirefox,
    isChrome: isChrome,
    isEdgeChromium: isEdgeChromium,
  );

  final iOSMajorVersion = isIOS ? _detectIOSMajorVersion(userAgent) : 0;

  return _BrowserInfo(
    isSafari: isSafari,
    isFirefox: isFirefox,
    isChrome: isChrome,
    isEdgeChromium: isEdgeChromium,
    isWindows: isWindows,
    isMacOS: isMacOS,
    isIOS: isIOS,
    isAndroid: isAndroid,
    isMobile: isMobile,
    browserMajorVersion: browserMajorVersion,
    iOSMajorVersion: iOSMajorVersion,
  );
}

int _detectBrowserMajorVersion({
  required String userAgent,
  required bool isSafari,
  required bool isFirefox,
  required bool isChrome,
  required bool isEdgeChromium,
}) {
  if (isEdgeChromium) {
    return _parseVersionMajor(userAgent, RegExp(r'edg(?:a|ios)?\/(\d+)'));
  }
  if (isFirefox) {
    return _parseVersionMajor(userAgent, RegExp(r'firefox\/(\d+)'));
  }
  if (isChrome) {
    return _parseVersionMajor(userAgent, RegExp(r'chrome\/(\d+)'));
  }
  if (isSafari) {
    return _parseVersionMajor(userAgent, RegExp(r'version\/(\d+)'));
  }
  return 0;
}

int _detectIOSMajorVersion(String userAgent) {
  final osVersion = RegExp(r'os (\d+)_').firstMatch(userAgent);
  if (osVersion != null) {
    return int.tryParse(osVersion.group(1) ?? '') ?? 0;
  }

  final version = RegExp(r'version\/(\d+)').firstMatch(userAgent);
  if (version != null) {
    return int.tryParse(version.group(1) ?? '') ?? 0;
  }

  return 0;
}

int _parseVersionMajor(String input, RegExp pattern) {
  final match = pattern.firstMatch(input);
  if (match == null) {
    return 0;
  }
  return int.tryParse(match.group(1) ?? '') ?? 0;
}

bool _supportsHdr10(_BrowserInfo browser) {
  if (browser.isSafari &&
      ((browser.isIOS && browser.iOSMajorVersion >= 11) || browser.isMacOS)) {
    return true;
  }
  if (browser.isEdgeChromium && browser.browserMajorVersion >= 121) {
    return true;
  }
  if (browser.isChrome && !browser.isMobile) {
    return true;
  }
  if (browser.isFirefox &&
      browser.isMacOS &&
      browser.browserMajorVersion >= 100) {
    return true;
  }
  return false;
}

bool _supportsDolbyVision(_BrowserInfo browser) {
  return browser.isSafari &&
      ((browser.isIOS && browser.iOSMajorVersion >= 13) || browser.isMacOS);
}

bool _detectCanPlayMkv(
  web.HTMLVideoElement video, {
  required _BrowserInfo browser,
}) {
  if (browser.isFirefox) {
    return false;
  }

  if (_supportsAnyTypeDirect(video, const <String>[
    'video/x-matroska',
    'video/x-mkv',
    'video/mkv',
  ])) {
    return true;
  }

  if (browser.isEdgeChromium && browser.isWindows) {
    return true;
  }

  return false;
}

int _detectAvcMainLevel(
  web.HTMLVideoElement video, {
  required bool supportsAvc,
}) {
  if (!supportsAvc) {
    return 0;
  }

  var level = 42;
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="avc1.640833"',
  ])) {
    level = 51;
  }
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="avc1.640834"',
  ])) {
    level = 52;
  }
  return level;
}

int _detectAvcHigh10Level(
  web.HTMLVideoElement video, {
  required bool supportsAvcHigh10,
}) {
  if (!supportsAvcHigh10) {
    return 0;
  }
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="avc1.6e0033"',
  ])) {
    return 51;
  }
  return 42;
}

int _detectHevcMainLevel(
  web.HTMLVideoElement video, {
  required bool supportsHevc,
}) {
  if (!supportsHevc) {
    return 0;
  }

  var level = 120;
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="hvc1.1.4.L123"',
    'video/mp4; codecs="hev1.1.4.L123"',
    'video/mp4; codecs="hvc1.2.4.L123"',
    'video/mp4; codecs="hev1.2.4.L123"',
  ])) {
    level = 123;
  }
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="hvc1.2.4.L153"',
    'video/mp4; codecs="hev1.2.4.L153"',
  ])) {
    level = 153;
  }
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="hvc1.2.4.L183"',
    'video/mp4; codecs="hev1.2.4.L183"',
  ])) {
    level = 183;
  }
  if (_supportsAnyTypeDirect(video, const <String>[
    'video/mp4; codecs="hvc1.2.4.L186"',
    'video/mp4; codecs="hev1.2.4.L186"',
  ])) {
    level = 186;
  }
  return level;
}

int _detectMaxPcmChannels() {
  try {
    final context = web.AudioContext();
    final maxChannelCount = context.destination.maxChannelCount;
    context.close();
    if (maxChannelCount < 1) {
      return 2;
    }
    return maxChannelCount.clamp(1, 8).toInt();
  } catch (_) {
    return 2;
  }
}

bool _isProbablyOrMaybe(String verdict) {
  final normalized = verdict.trim().toLowerCase();
  return normalized == 'probably' || normalized == 'maybe';
}
