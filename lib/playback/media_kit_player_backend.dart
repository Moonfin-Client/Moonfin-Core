import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'audio_capability_profile.dart';
import 'device_profile_builder.dart';
import 'known_defects.dart';

class _ParsedMpvConfCacheEntry {
  final DateTime modified;
  final int length;
  final List<(String, String)> entries;

  const _ParsedMpvConfCacheEntry({
    required this.modified,
    required this.length,
    required this.entries,
  });
}

class _MediaKitDeviceProfileCapabilities {
  const _MediaKitDeviceProfileCapabilities({
    required this.supportsAvc,
    required this.supportsAvcHigh10,
    required this.avcMainLevel,
    required this.avcHigh10Level,
    required this.supportsHevc,
    required this.supportsHevcMain10,
    required this.hevcMainLevel,
    required this.supportsHevcDolbyVision,
    required this.supportsHevcDolbyVisionEl,
    required this.supportsHevcHdr10,
    required this.supportsHevcHdr10Plus,
    required this.supportsAv1,
    required this.supportsAv1Main10,
    required this.supportsAv1DolbyVision,
    required this.supportsAv1Hdr10,
    required this.supportsAv1Hdr10Plus,
    required this.supportsVc1,
    required this.maxResolutionAvcWidth,
    required this.maxResolutionAvcHeight,
    required this.maxResolutionHevcWidth,
    required this.maxResolutionHevcHeight,
    required this.maxResolutionAv1Width,
    required this.maxResolutionAv1Height,
    required this.maxResolutionVc1Width,
    required this.maxResolutionVc1Height,
    required this.supportsDvProfile5,
    required this.supportsDvProfile7,
    required this.supportsDvProfile8,
    required this.knownHevcDoviHdr10PlusBug,
  });

  final bool supportsAvc;
  final bool supportsAvcHigh10;
  final int avcMainLevel;
  final int avcHigh10Level;
  final bool supportsHevc;
  final bool supportsHevcMain10;
  final int hevcMainLevel;
  final bool supportsHevcDolbyVision;
  final bool supportsHevcDolbyVisionEl;
  final bool supportsHevcHdr10;
  final bool supportsHevcHdr10Plus;
  final bool supportsAv1;
  final bool supportsAv1Main10;
  final bool supportsAv1DolbyVision;
  final bool supportsAv1Hdr10;
  final bool supportsAv1Hdr10Plus;
  final bool supportsVc1;
  final int maxResolutionAvcWidth;
  final int maxResolutionAvcHeight;
  final int maxResolutionHevcWidth;
  final int maxResolutionHevcHeight;
  final int maxResolutionAv1Width;
  final int maxResolutionAv1Height;
  final int maxResolutionVc1Width;
  final int maxResolutionVc1Height;
  final bool supportsDvProfile5;
  final bool supportsDvProfile7;
  final bool supportsDvProfile8;
  final bool knownHevcDoviHdr10PlusBug;

  static const _k8kWidth = 7680;
  static const _k8kHeight = 4320;
  static const _h264Level52 = 52;
  static const _hevcLevel62 = 183;

  static _MediaKitDeviceProfileCapabilities fromPlatformDetection() {
    return _MediaKitDeviceProfileCapabilities(
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
    );
  }

  static _MediaKitDeviceProfileCapabilities libMpvDefaults({
    required bool allowDolbyVisionProfile7DirectPlay,
  }) {
    return _MediaKitDeviceProfileCapabilities(
      supportsAvc: true,
      supportsAvcHigh10: true,
      avcMainLevel: _h264Level52,
      avcHigh10Level: _h264Level52,
      supportsHevc: true,
      supportsHevcMain10: true,
      hevcMainLevel: _hevcLevel62,
      supportsHevcDolbyVision: true,
      supportsHevcDolbyVisionEl: allowDolbyVisionProfile7DirectPlay,
      supportsHevcHdr10: true,
      supportsHevcHdr10Plus: true,
      supportsAv1: true,
      supportsAv1Main10: true,
      supportsAv1DolbyVision: false,
      supportsAv1Hdr10: true,
      supportsAv1Hdr10Plus: true,
      supportsVc1: true,
      maxResolutionAvcWidth: _k8kWidth,
      maxResolutionAvcHeight: _k8kHeight,
      maxResolutionHevcWidth: _k8kWidth,
      maxResolutionHevcHeight: _k8kHeight,
      maxResolutionAv1Width: _k8kWidth,
      maxResolutionAv1Height: _k8kHeight,
      maxResolutionVc1Width: _k8kWidth,
      maxResolutionVc1Height: _k8kHeight,
      // Force the server to transcode / HDR10-fallback DV P5 on iOS.
      supportsDvProfile5: !PlatformDetection.isIOS,
      supportsDvProfile7: allowDolbyVisionProfile7DirectPlay,
      supportsDvProfile8: true,
      knownHevcDoviHdr10PlusBug: false,
    );
  }
}

class MediaKitPlayerBackend extends PlayerBackend {
  static const Duration _linuxHwdecFirstFrameTimeout = Duration(
    milliseconds: 1500,
  );
  final Player _player;
  final VideoController? _videoController;
  final UserPreferences _prefs;
  final Future<void> Function(int handle)? _onNativeHandleReady;
  final bool _hwDecodingEnabled;
  bool _didNotifyNativeHandle = false;
  bool _didConfigureAppleMobileLibassFont = false;
  Map<String, String>? _appliedAudioPassthroughProperties;
  bool _audioPassthroughApplyInProgress = false;
  bool _audioPassthroughApplyQueued = false;
  bool _isDisposed = false;
  String? _appliedCustomMpvConfPath;
  DateTime? _appliedCustomMpvConfMtime;
  static final Map<String, _ParsedMpvConfCacheEntry> _parsedMpvConfCache =
      <String, _ParsedMpvConfCacheEntry>{};

  static String _mpvAudioChannelsLayout(int channels) {
    return switch (channels) {
      1 => 'mono',
      2 => 'stereo',
      3 => '2.1',
      4 => '3.1',
      5 => '4.1',
      6 => '5.1',
      7 => '6.1',
      8 => '7.1',
      _ => 'auto',
    };
  }

  static bool _passthroughActive(UserPreferences prefs) {
    return passthroughCodecsFromPreferences(
      audioOutputMode: prefs.resolveAudioOutputMode(),
      ac3PassthroughEnabled: prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: prefs.resolveEac3PassthroughEnabled(),
      eac3JocPassthroughEnabled: prefs.resolveEac3JocPassthroughEnabled(),
      dtsCorePassthroughEnabled: prefs.resolveDtsCorePassthroughEnabled(),
      dtsHdPassthroughEnabled: prefs.resolveDtsHdPassthroughEnabled(),
      dtsXPassthroughEnabled: prefs.resolveDtsXPassthroughEnabled(),
      trueHdPassthroughEnabled: prefs.resolveTrueHdPassthroughEnabled(),
      trueHdAtmosPassthroughEnabled:
          prefs.resolveTrueHdAtmosPassthroughEnabled(),
    ).isNotEmpty;
  }

  bool _isStale = false;
  String? _currentUrl;

  late final Stream<bool> _playingStream = _mergeWithStale<bool>(
    _player.stream.playing,
    () => _isStale ? false : _player.state.playing,
  );

  late final Stream<bool> _bufferingStream = _mergeWithStale<bool>(
    _player.stream.buffering,
    () => _isStale ? false : _player.state.buffering,
  );

  void _updateStaleState() {
    if (!_isStale) return;
    try {
      final playlist = _player.state.playlist;
      if (playlist.index >= 0 && playlist.index < playlist.medias.length) {
        final currentMedia = playlist.medias[playlist.index];
        if (currentMedia.uri == _currentUrl) {
          _isStale = false;
        }
      }
    } catch (_) {}
  }

  Future<String?> _tryNativeGetProperty(Object native, String key) async {
    try {
      final dynamic dyn = native;
      final value = await Future.value(dyn.getProperty(key));
      return value.toString();
    } catch (_) {
      return null;
    }
  }

  List<int> _extractSubtitleTrackIds(String? trackListRaw) {
    if (trackListRaw == null || trackListRaw.isEmpty) return const <int>[];
    try {
      final decoded = jsonDecode(trackListRaw);
      if (decoded is! List) return const <int>[];
      final ids = <int>[];
      for (final item in decoded) {
        if (item is! Map) continue;
        final type = item['type']?.toString();
        if (type != 'sub') continue;
        final idValue = item['id'];
        final parsed = idValue is int
            ? idValue
            : int.tryParse(idValue?.toString() ?? '');
        if (parsed != null && parsed > 0) {
          ids.add(parsed);
        }
      }
      return ids;
    } catch (_) {
      return const <int>[];
    }
  }

  static Future<void> _nativeSetProperty(
    Object native,
    String key,
    String value,
  ) async {
    try {
      final dynamic dyn = native;
      await Future<void>.value(dyn.setProperty(key, value));
    } catch (_) {}
  }

  static Future<bool> _tryNativeSetProperty(
    Object native,
    String key,
    String value,
  ) async {
    try {
      final dynamic dyn = native;
      await Future<void>.value(dyn.setProperty(key, value));
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> _tryNativeCommand(
    Object native,
    List<String> command,
  ) async {
    try {
      final dynamic dyn = native;
      await Future<void>.value(dyn.command(command));
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> _nativeCommand(
    Object native,
    List<String> command,
  ) async {
    try {
      final dynamic dyn = native;
      await Future<void>.value(dyn.command(command));
    } catch (_) {}
  }

  static bool get _useLibass =>
      PlatformDetection.isDesktop ||
      PlatformDetection.isAndroid ||
      PlatformDetection.isIOS;

  static bool get _useNativeSurface => PlatformDetection.useNativeVideoSurface;

  MediaKitPlayerBackend._(
    this._player,
    this._videoController,
    this._prefs,
    this._onNativeHandleReady,
    this._hwDecodingEnabled,
  ) {
    _prefs.addListener(_onPreferencesChanged);
  }

  factory MediaKitPlayerBackend(
    UserPreferences prefs, {
    Future<void> Function(int handle)? onNativeHandleReady,
  }) {
    final hwDecodingEnabled = prefs.get(UserPreferences.hardwareDecoding);
    final String? hwdec = hwDecodingEnabled
        ? (PlatformDetection.isAndroid && PlatformDetection.isTV
              ? 'auto-copy'
              : (PlatformDetection.isLinux ? 'auto-safe' : null))
        : 'no';

    final player = Player(
      configuration: PlayerConfiguration(
        libass: _useLibass,
        libassAndroidFont: PlatformDetection.isAndroid
            ? 'assets/fonts/NotoSans-Regular.ttf'
            : null,
        libassAndroidFontName: PlatformDetection.isAndroid ? 'Noto Sans' : null,
      ),
    );
    unawaited(player.setPlaylistMode(PlaylistMode.none));
    final platform = player.platform;
    if (platform is NativePlayer) {
      _nativeSetProperty(platform, 'network-timeout', '120');

      final maxChannels = prefs.get(UserPreferences.maxAudioChannels);
      final audioChannelsLayout = (maxChannels == 0 || _passthroughActive(prefs))
          ? (PlatformDetection.isIOS ? 'stereo' : 'auto')
          : _mpvAudioChannelsLayout(maxChannels);
      _nativeSetProperty(platform, 'audio-channels', audioChannelsLayout);

      if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
        // Prefer AudioTrack + preloaded scaletempo2 for stable TV speed changes.
        _nativeSetProperty(platform, 'ao', 'audiotrack');
        _nativeSetProperty(platform, 'af', 'scaletempo2');
        _nativeSetProperty(platform, 'audio-normalize-downmix', 'no');
        _nativeSetProperty(platform, 'audio-fallback-to-null', 'no');
      }
      if (PlatformDetection.isIOS || PlatformDetection.isAndroid) {
        _nativeSetProperty(platform, 'tone-mapping', 'auto');
      }

      if (_useNativeSurface) {
        _nativeSetProperty(platform, 'vo', 'null');
        _nativeSetProperty(
          platform,
          'hwdec',
          hwDecodingEnabled ? 'auto-copy' : 'no',
        );
        _nativeSetProperty(
          platform,
          'hwdec-codecs',
          'h264,hevc,mpeg4,mpeg2video,vp8,vp9,av1',
        );
        _nativeSetProperty(platform, 'vid', 'auto');
        _nativeSetProperty(platform, 'force-window', 'yes');
      }
    }

    VideoController? controller;
    if (_useNativeSurface) {
      player.platform?.isVideoControllerAttached = true;
      if (!(player.platform?.videoControllerCompleter.isCompleted ?? true)) {
        player.platform?.videoControllerCompleter.complete();
      }
    } else {
      controller = VideoController(
        player,
        configuration: VideoControllerConfiguration(
          hwdec: hwdec,
          enableHardwareAcceleration:
              !(PlatformDetection.isIOS &&
                  PlatformDetection.iosMajorVersion >= 26),
        ),
      );
    }

    return MediaKitPlayerBackend._(
      player,
      controller,
      prefs,
      onNativeHandleReady,
      hwDecodingEnabled,
    );
  }

  @override
  bool get supportsRuntimeTrackSelection => true;

  @override
  bool get requiresStartupMediaReadyCheck => true;

  @override
  bool get nativelyHandlesStartPosition => false;

  @override
  bool get canRenderBitmapSubtitles =>
      PlatformDetection.isDesktop || PlatformDetection.isAndroid;

  Player get player => _player;

  VideoController? get videoController => _videoController;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) {
    final maxBitrate = int.tryParse(_prefs.get(UserPreferences.maxBitrate));
    final maxResolution = _prefs.get(UserPreferences.maxVideoResolution);
    final allowDolbyVisionProfile7DirectPlay =
        KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
          behavior: _prefs.get(
            UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
          ),
        );
    final useDetectedPlatformCapabilities =
        PlatformDetection.isAndroid && PlatformDetection.isTV;
    final capabilities = useDetectedPlatformCapabilities
        ? _MediaKitDeviceProfileCapabilities.fromPlatformDetection()
        : _MediaKitDeviceProfileCapabilities.libMpvDefaults(
            allowDolbyVisionProfile7DirectPlay:
                allowDolbyVisionProfile7DirectPlay,
          );
    final audioCapabilityProfile = PlatformDetection.hasAudioCapabilities
        ? AudioCapabilityProfile.fromMap(
            PlatformDetection.audioCapabilitiesSnapshot,
          )
        : PlatformDetection.isIOS
        ? const AudioCapabilityProfile.appleMobile()
        : const AudioCapabilityProfile.optimistic();

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      audioCapabilityProfile: audioCapabilityProfile,
      audioOutputMode: _prefs.resolveAudioOutputMode(),
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      eac3JocPassthroughEnabled: _prefs.resolveEac3JocPassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      dtsHdPassthroughEnabled: _prefs.resolveDtsHdPassthroughEnabled(),
      dtsXPassthroughEnabled: _prefs.resolveDtsXPassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      trueHdAtmosPassthroughEnabled: _prefs
          .resolveTrueHdAtmosPassthroughEnabled(),
      maxAudioChannels: _prefs.resolveMaxAudioChannels(),
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay) && canRenderBitmapSubtitles,
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: capabilities.supportsAvc,
      supportsAvcHigh10: capabilities.supportsAvcHigh10,
      avcMainLevel: capabilities.avcMainLevel,
      avcHigh10Level: capabilities.avcHigh10Level,
      supportsHevc: capabilities.supportsHevc,
      supportsHevcMain10: capabilities.supportsHevcMain10,
      hevcMainLevel: capabilities.hevcMainLevel,
      supportsHevcDolbyVision: capabilities.supportsHevcDolbyVision,
      supportsHevcDolbyVisionEl: capabilities.supportsHevcDolbyVisionEl,
      supportsHevcHdr10: capabilities.supportsHevcHdr10,
      supportsHevcHdr10Plus: capabilities.supportsHevcHdr10Plus,
      supportsAv1: capabilities.supportsAv1,
      supportsAv1Main10: capabilities.supportsAv1Main10,
      supportsAv1DolbyVision: capabilities.supportsAv1DolbyVision,
      supportsAv1Hdr10: capabilities.supportsAv1Hdr10,
      supportsAv1Hdr10Plus: capabilities.supportsAv1Hdr10Plus,
      supportsVc1: capabilities.supportsVc1,
      maxResolutionAvcWidth: capabilities.maxResolutionAvcWidth,
      maxResolutionAvcHeight: capabilities.maxResolutionAvcHeight,
      maxResolutionHevcWidth: capabilities.maxResolutionHevcWidth,
      maxResolutionHevcHeight: capabilities.maxResolutionHevcHeight,
      maxResolutionAv1Width: capabilities.maxResolutionAv1Width,
      maxResolutionAv1Height: capabilities.maxResolutionAv1Height,
      maxResolutionVc1Width: capabilities.maxResolutionVc1Width,
      maxResolutionVc1Height: capabilities.maxResolutionVc1Height,
      supportsDvProfile5: capabilities.supportsDvProfile5,
      supportsDvProfile7: capabilities.supportsDvProfile7,
      supportsDvProfile8: capabilities.supportsDvProfile8,
      knownHevcDoviHdr10PlusBug: capabilities.knownHevcDoviHdr10PlusBug,
      allowDolbyVisionProfile7ElDirectPlay: allowDolbyVisionProfile7DirectPlay,
    );
  }

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    final payload = mediaItem is Map ? mediaItem : const <String, dynamic>{};
    final url = mediaItem is String
        ? mediaItem
        : payload['url']?.toString() ?? '';
    if (url.isEmpty) return;

    _currentUrl = url;
    _isStale = true;

    await _notifyNativeHandleReady();
    await _configureAppleMobileLibassFont();
    await _applyAudioPassthroughOptions();
    await _applyCustomMpvConfIfEnabled();
    await _applyAssOverrideMode();

    if (_player.platform is NativePlayer) {
      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'sid', 'auto');
      await _nativeSetProperty(native, 'secondary-sid', 'no');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      if (_useLibass) {
        await _nativeSetProperty(native, 'sub-ass', 'yes');
      }
    }

    final media = Media(url);
    final openPaused = startPosition > Duration.zero;
    await _player.open(media, play: !openPaused);
    _updateStaleState();
    await _applyLinuxHwdecFallbackIfNeeded(media, openPaused: openPaused);
    if (!_useLibass) {
      _enableNativeSubtitleRendering();
    }
  }

  Future<void> _applyLinuxHwdecFallbackIfNeeded(
    Media media, {
    required bool openPaused,
  }) async {
    if (!PlatformDetection.isLinux || !_hwDecodingEnabled) {
      return;
    }
    if (openPaused) {
      return;
    }
    if (_prefs.get(UserPreferences.customMpvConfEnabled)) {
      return;
    }
    try {
      await _videoController!.waitUntilFirstFrameRendered.timeout(
        _linuxHwdecFirstFrameTimeout,
      );
      return;
    } on TimeoutException {
      var hasVideoTrack = _player.state.tracks.video.isNotEmpty;
      if (!hasVideoTrack) {
        try {
          final tracks = await _player.stream.tracks
              .firstWhere((t) => t.video.isNotEmpty)
              .timeout(const Duration(milliseconds: 800));
          hasVideoTrack = tracks.video.isNotEmpty;
        } catch (_) {}
      }
      if (!hasVideoTrack) {
        return;
      }
      try {
        final native = _player.platform as NativePlayer;
        await _nativeSetProperty(native, 'hwdec', 'no');

        final resumePosition = _player.state.position;
        await _player.open(media, play: false);
        if (resumePosition > Duration.zero) {
          await _player.seek(resumePosition);
        }
        await _player.play();
      } catch (_) {}
    } catch (_) {}
  }

  @visibleForTesting
  static List<String> passthroughCodecsFromPreferences({
    required AudioOutputMode audioOutputMode,
    required bool ac3PassthroughEnabled,
    required bool eac3PassthroughEnabled,
    required bool eac3JocPassthroughEnabled,
    required bool dtsCorePassthroughEnabled,
    required bool dtsHdPassthroughEnabled,
    required bool dtsXPassthroughEnabled,
    required bool trueHdPassthroughEnabled,
    required bool trueHdAtmosPassthroughEnabled,
  }) {
    if (audioOutputMode == AudioOutputMode.forceStereo) {
      return const <String>[];
    }

    final effectiveEac3JocPassthroughEnabled =
        eac3PassthroughEnabled && eac3JocPassthroughEnabled;
    final effectiveDtsHdPassthroughEnabled =
        dtsCorePassthroughEnabled && dtsHdPassthroughEnabled;
    final effectiveDtsXPassthroughEnabled =
        effectiveDtsHdPassthroughEnabled && dtsXPassthroughEnabled;
    final effectiveTrueHdAtmosPassthroughEnabled =
        trueHdPassthroughEnabled && trueHdAtmosPassthroughEnabled;

    final codecs = <String>[];
    if (ac3PassthroughEnabled) {
      codecs.add('ac3');
    }
    if (eac3PassthroughEnabled || effectiveEac3JocPassthroughEnabled) {
      codecs.add('eac3');
    }
    if (effectiveDtsHdPassthroughEnabled || effectiveDtsXPassthroughEnabled) {
      codecs.add('dts-hd');
    } else if (dtsCorePassthroughEnabled) {
      codecs.add('dts');
    }
    if (trueHdPassthroughEnabled || effectiveTrueHdAtmosPassthroughEnabled) {
      codecs.add('truehd');
    }
    return codecs;
  }

  @visibleForTesting
  static Map<String, String> passthroughMpvPropertiesFromPreferences({
    required AudioOutputMode audioOutputMode,
    required bool ac3PassthroughEnabled,
    required bool eac3PassthroughEnabled,
    required bool eac3JocPassthroughEnabled,
    required bool dtsCorePassthroughEnabled,
    required bool dtsHdPassthroughEnabled,
    required bool dtsXPassthroughEnabled,
    required bool trueHdPassthroughEnabled,
    required bool trueHdAtmosPassthroughEnabled,
    required bool includeAudioExclusive,
  }) {
    final codecs = passthroughCodecsFromPreferences(
      audioOutputMode: audioOutputMode,
      ac3PassthroughEnabled: ac3PassthroughEnabled,
      eac3PassthroughEnabled: eac3PassthroughEnabled,
      eac3JocPassthroughEnabled: eac3JocPassthroughEnabled,
      dtsCorePassthroughEnabled: dtsCorePassthroughEnabled,
      dtsHdPassthroughEnabled: dtsHdPassthroughEnabled,
      dtsXPassthroughEnabled: dtsXPassthroughEnabled,
      trueHdPassthroughEnabled: trueHdPassthroughEnabled,
      trueHdAtmosPassthroughEnabled: trueHdAtmosPassthroughEnabled,
    );

    final properties = <String, String>{'audio-spdif': codecs.join(',')};
    if (includeAudioExclusive) {
      properties['audio-exclusive'] = codecs.isNotEmpty ? 'yes' : 'no';
    }
    return properties;
  }

  Future<void> _applyAudioPassthroughOptions() async {
    if (_player.platform is! NativePlayer) {
      return;
    }

    try {
      final native = _player.platform as NativePlayer;
      final properties = passthroughMpvPropertiesFromPreferences(
        audioOutputMode: _prefs.resolveAudioOutputMode(),
        ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
        eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
        eac3JocPassthroughEnabled: _prefs.resolveEac3JocPassthroughEnabled(),
        dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
        dtsHdPassthroughEnabled: _prefs.resolveDtsHdPassthroughEnabled(),
        dtsXPassthroughEnabled: _prefs.resolveDtsXPassthroughEnabled(),
        trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
        trueHdAtmosPassthroughEnabled: _prefs
            .resolveTrueHdAtmosPassthroughEnabled(),
        includeAudioExclusive: PlatformDetection.isDesktop,
      );

      if (mapEquals(_appliedAudioPassthroughProperties, properties)) {
        return;
      }

      var allApplied = true;

      for (final entry in properties.entries) {
        final key = entry.key;
        final value = entry.value;

        final setOk = await _tryNativeSetProperty(native, key, value);
        if (setOk) {
          continue;
        }

        final commandOk = await _tryNativeCommand(native, [
          'set_property',
          key,
          value,
        ]);
        if (!commandOk) {
          allApplied = false;
        }
      }

      if (allApplied) {
        _appliedAudioPassthroughProperties = Map<String, String>.from(
          properties,
        );
      } else {
        _appliedAudioPassthroughProperties = null;
      }
    } catch (_) {}
  }

  void _onPreferencesChanged() {
    if (_isDisposed) {
      return;
    }

    if (_audioPassthroughApplyInProgress) {
      _audioPassthroughApplyQueued = true;
      return;
    }

    _audioPassthroughApplyInProgress = true;
    unawaited(_drainAudioPassthroughApplyQueue());
  }

  Future<void> _drainAudioPassthroughApplyQueue() async {
    try {
      do {
        _audioPassthroughApplyQueued = false;
        await _applyAudioPassthroughOptions();
      } while (_audioPassthroughApplyQueued && !_isDisposed);
    } finally {
      _audioPassthroughApplyInProgress = false;
    }
  }

  Future<void> _applyCustomMpvConfIfEnabled() async {
    if (!PlatformDetection.isDesktop && !PlatformDetection.isAndroid) {
      return;
    }
    if (!_prefs.get(UserPreferences.customMpvConfEnabled)) {
      return;
    }
    if (_player.platform is! NativePlayer) {
      return;
    }

    try {
      final path = await _resolveCustomMpvConfPath();
      if (path == null) {
        return;
      }

      final file = File(path);
      if (!await file.exists()) {
        return;
      }
      final length = await file.length();
      if (length > 256 * 1024) {
        return;
      }

      final stat = await file.stat();
      if (_appliedCustomMpvConfPath == path &&
          _appliedCustomMpvConfMtime == stat.modified) {
        return;
      }

      final parsedEntries = await _loadParsedMpvConf(
        path: path,
        file: file,
        modified: stat.modified,
        length: length,
      );
      final native = _player.platform as NativePlayer;
      final unsafeAdvanced = _prefs.get(
        UserPreferences.customMpvConfUnsafeAdvanced,
      );

      for (final parsed in parsedEntries) {
        final key = parsed.$1;
        final value = parsed.$2;

        if (_deniedMpvKeys.contains(key) ||
            _deniedMpvPrefixes.any((prefix) => key.startsWith(prefix))) {
          continue;
        }
        if (_protectedMpvKeys.contains(key)) {
          continue;
        }
        if (!_isAllowedMpvKey(key, unsafeAdvanced: unsafeAdvanced)) {
          continue;
        }

        try {
          await _nativeSetProperty(native, key, value);
        } catch (_) {}
      }

      _appliedCustomMpvConfPath = path;
      _appliedCustomMpvConfMtime = stat.modified;
    } catch (_) {}
  }

  Future<List<(String, String)>> _loadParsedMpvConf({
    required String path,
    required File file,
    required DateTime modified,
    required int length,
  }) async {
    final cached = _parsedMpvConfCache[path];
    if (cached != null &&
        cached.modified == modified &&
        cached.length == length) {
      return cached.entries;
    }

    final content = await file.readAsString();
    final entries = <(String, String)>[];
    for (final rawLine in content.split('\n')) {
      final parsed = _parseMpvConfLine(rawLine);
      if (parsed != null) {
        entries.add(parsed);
      }
    }

    final immutable = List<(String, String)>.unmodifiable(entries);
    _parsedMpvConfCache[path] = _ParsedMpvConfCacheEntry(
      modified: modified,
      length: length,
      entries: immutable,
    );
    return immutable;
  }

  Future<String?> _resolveCustomMpvConfPath() async {
    final configured = _prefs.get(UserPreferences.customMpvConfPath).trim();
    if (configured.isNotEmpty) {
      return configured;
    }

    try {
      final support = await getApplicationSupportDirectory();
      final candidate = File('${support.path}/mpv.conf');
      if (await candidate.exists()) {
        return candidate.path;
      }
    } catch (_) {}

    try {
      final local = File('${Directory.current.path}/mpv.conf');
      if (await local.exists()) {
        return local.path;
      }
    } catch (_) {}

    return null;
  }

  (String, String)? _parseMpvConfLine(String line) {
    final trimmed = line.trim();
    if (trimmed.isEmpty || trimmed.startsWith('#') || trimmed.startsWith(';')) {
      return null;
    }
    if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
      return null;
    }

    final noComment = _stripInlineComment(trimmed);
    if (noComment.isEmpty) {
      return null;
    }

    var rawKey = '';
    String? rawValue;

    final eq = noComment.indexOf('=');
    if (eq >= 0) {
      rawKey = noComment.substring(0, eq).trim();
      rawValue = noComment.substring(eq + 1).trim();
    } else {
      final ws = noComment.indexOf(RegExp(r'\s+'));
      if (ws < 0) {
        rawKey = noComment;
      } else {
        rawKey = noComment.substring(0, ws).trim();
        rawValue = noComment.substring(ws).trim();
      }
    }

    if (rawKey.isEmpty) {
      return null;
    }

    var key = rawKey.toLowerCase();
    var value = (rawValue == null || rawValue.isEmpty) ? 'yes' : rawValue;

    if (key.startsWith('no-') && (rawValue == null || rawValue.isEmpty)) {
      key = key.substring(3);
      value = 'no';
    }

    return (key, value);
  }

  String _stripInlineComment(String input) {
    var inSingleQuote = false;
    var inDoubleQuote = false;
    for (var i = 0; i < input.length; i++) {
      final ch = input[i];
      if (ch == '"' && !inSingleQuote) {
        inDoubleQuote = !inDoubleQuote;
        continue;
      }
      if (ch == '\'' && !inDoubleQuote) {
        inSingleQuote = !inSingleQuote;
        continue;
      }
      if (!inSingleQuote && !inDoubleQuote && (ch == '#' || ch == ';')) {
        return input.substring(0, i).trimRight();
      }
    }
    return input;
  }

  bool _isAllowedMpvKey(String key, {required bool unsafeAdvanced}) {
    if (_allowedMpvKeys.contains(key) ||
        _allowedMpvPrefixes.any((prefix) => key.startsWith(prefix))) {
      return true;
    }
    if (unsafeAdvanced &&
        (_advancedMpvKeys.contains(key) ||
            _advancedMpvPrefixes.any((prefix) => key.startsWith(prefix)))) {
      return true;
    }
    return false;
  }

  static const Set<String> _protectedMpvKeys = {
    'aid',
    'sid',
    'vid',
    'sub-visibility',
    'sub-ass',
    'sub-ass-override',
    'sub-delay',
    'audio-delay',
    'network-timeout',
    'sub-fonts-dir',
    'sub-font',
  };

  static const Set<String> _deniedMpvKeys = {
    'script',
    'scripts',
    'script-opts',
    'load-scripts',
    'include',
    'profile',
    'input-conf',
  };

  static const List<String> _deniedMpvPrefixes = ['script-', 'ipc-'];

  static const Set<String> _allowedMpvKeys = {
    'scale',
    'cscale',
    'dscale',
    'sigmoid-upscaling',
    'deband',
    'interpolation',
    'tscale',
    'video-sync',
    'tone-mapping',
    'tone-mapping-param',
    'target-trc',
    'brightness',
    'contrast',
    'saturation',
    'gamma',
    'sharpen',
    'audio-spdif',
    'audio-channels',
    'audio-normalize-downmix',
    'deinterlace',
    'keep-open',
  };

  static const List<String> _allowedMpvPrefixes = [
    'deband-',
    'glsl-shader',
    'scale-',
    'cscale-',
    'dscale-',
  ];

  static const Set<String> _advancedMpvKeys = {
    'vo',
    'gpu-context',
    'hwdec',
    'audio-exclusive',
    'vf',
    'af',
    'input-ipc-server',
  };

  static const List<String> _advancedMpvPrefixes = [
    'vd-lavc-',
    'demuxer-',
    'cache-',
  ];

  Future<void> _configureAppleMobileLibassFont() async {
    if (!PlatformDetection.isIOS || _didConfigureAppleMobileLibassFont) {
      return;
    }
    try {
      final supportDirectory = await getApplicationSupportDirectory();
      final fontsDirectory = Directory(
        '${supportDirectory.path}/moonfin-subfonts',
      );
      await fontsDirectory.create(recursive: true);

      final fontFile = File('${fontsDirectory.path}/NotoSans-Regular.ttf');
      if (!await fontFile.exists()) {
        final data = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
        await fontFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      }

      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'sub-fonts-dir', fontsDirectory.path);
      await _nativeSetProperty(native, 'sub-font', 'Noto Sans');
      await _nativeSetProperty(native, 'sub-ass', 'yes');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      _didConfigureAppleMobileLibassFont = true;
    } catch (_) {}
  }

  Future<void> _applyAssOverrideMode() async {
    if (!_useLibass) return;
    try {
      final native = _player.platform as NativePlayer;
      final assEnabled = _prefs.get(UserPreferences.assDirectPlay);
      await _nativeSetProperty(
        native,
        'sub-ass-override',
        assEnabled ? 'no' : 'force',
      );
    } catch (_) {}
  }

  Future<void> _notifyNativeHandleReady() async {
    final onNativeHandleReady = _onNativeHandleReady;
    if (_didNotifyNativeHandle || onNativeHandleReady == null) {
      return;
    }
    if (_player.platform is! NativePlayer) {
      return;
    }
    try {
      final handle = await _player.handle;
      await onNativeHandleReady(handle);
      _didNotifyNativeHandle = true;
    } catch (_) {}
  }

  @override
  Future<void> resume() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    _isStale = true;
    await _player.stop();
  }

  Future<void> setVideoEnabled(bool enabled) async {
    try {
      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'vid', enabled ? 'auto' : 'no');
    } catch (_) {}
  }

  @override
  Future<void> seekTo(Duration position) async {
    await _player.seek(position);
  }

  @override
  Duration get position {
    _updateStaleState();
    return _isStale ? Duration.zero : _player.state.position;
  }

  @override
  Duration get duration {
    _updateStaleState();
    return _isStale ? Duration.zero : _player.state.duration;
  }

  @override
  Duration get buffer {
    _updateStaleState();
    return _isStale ? Duration.zero : _player.state.buffer;
  }

  @override
  bool get isPlaying {
    _updateStaleState();
    return _isStale ? false : _player.state.playing;
  }

  @override
  bool get isBuffering {
    _updateStaleState();
    return _isStale ? false : _player.state.buffering;
  }

  @override
  double get playbackSpeed => _player.state.rate;

  @override
  Stream<Duration> get positionStream => _player.stream.position.map((pos) {
    _updateStaleState();
    return _isStale ? Duration.zero : pos;
  });

  @override
  Stream<Duration> get durationStream => _player.stream.duration.map((dur) {
    _updateStaleState();
    return _isStale ? Duration.zero : dur;
  });

  @override
  Stream<Duration> get bufferStream => _player.stream.buffer.map((buf) {
    _updateStaleState();
    return _isStale ? Duration.zero : buf;
  });

  @override
  Stream<bool> get playingStream => _playingStream;

  @override
  Stream<bool> get bufferingStream => _bufferingStream;

  @override
  Stream<bool> get completedStream => _player.stream.completed.map((completed) {
    _updateStaleState();
    return _isStale ? false : completed;
  });

  @override
  Stream<Map<String, dynamic>>? get errorStream => _player.stream.error.map(
    (err) => <String, dynamic>{'event': 'error', 'message': err},
  );

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      try {
        final native = _player.platform as NativePlayer;
        final speedValue = speed.toString();
        final setOk = await _tryNativeSetProperty(native, 'speed', speedValue);
        if (!setOk) {
          await _tryNativeCommand(native, [
            'set_property',
            'speed',
            speedValue,
          ]);
        }
        return;
      } catch (_) {}
    }
    await _player.setRate(speed);
  }

  @override
  Future<void> setAudioTrack(int mpvTrackId) async {
    if (mpvTrackId < 1) return;
    final id = mpvTrackId.toString();
    try {
      final tracks = _player.state.tracks.audio;
      AudioTrack? match;
      for (final t in tracks) {
        if (t.id == id) {
          match = t;
          break;
        }
      }
      if (match != null) {
        await _player.setAudioTrack(match);
      } else {
        await _player.setAudioTrack(AudioTrack(id, null, null));
      }
    } catch (e) {
      try {
        final native = _player.platform as NativePlayer;
        await _nativeSetProperty(native, 'aid', id);
      } catch (_) {}
    }
  }

  @override
  int? get activeSubtitleTrackIndex {
    if (_player.platform is! NativePlayer) {
      return null;
    }
    try {
      final active = _player.state.track.subtitle;
      if (active.id == 'no') {
        return -1;
      }
      if (active.id == 'auto') {
        return null;
      }
      final subtitleTracks = _player.state.tracks.subtitle;
      final playableSubtitleTracks = subtitleTracks
          .where((t) => t.id != 'auto' && t.id != 'no')
          .toList();
      final idx = playableSubtitleTracks.indexWhere((t) => t.id == active.id);
      if (idx >= 0) {
        return idx + 1;
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<int?> getActiveSubtitleTrackIndexAsync() async => activeSubtitleTrackIndex;


  @override
  Future<void> setSubtitleTrack(
    int mpvTrackId, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {
    if (mpvTrackId < 1) return;
    try {
      final native = _player.platform as NativePlayer;
      final trackListBefore = await _tryNativeGetProperty(native, 'track-list');
      final subtitleIds = _extractSubtitleTrackIds(trackListBefore);
      final sidToApply = (mpvTrackId <= subtitleIds.length)
          ? subtitleIds[mpvTrackId - 1].toString()
          : mpvTrackId.toString();
      final subtitleTracks = _player.state.tracks.subtitle;
      final playableSubtitleTracks = subtitleTracks
          .where((t) => t.id != 'auto' && t.id != 'no')
          .toList();

      var sidAfter = await _tryNativeGetProperty(native, 'sid');

      if (PlatformDetection.isAndroid) {
        SubtitleTrack? target;
        for (final t in playableSubtitleTracks) {
          if (t.id == sidToApply) {
            target = t;
            break;
          }
        }
        target ??=
            (mpvTrackId <= playableSubtitleTracks.length && mpvTrackId > 0)
            ? playableSubtitleTracks[mpvTrackId - 1]
            : null;
        if (target != null) {
          await _player.setSubtitleTrack(target);
          sidAfter = await _tryNativeGetProperty(native, 'sid');
        }
      }

      if (sidAfter != sidToApply) {
        await _nativeSetProperty(native, 'sid', sidToApply);
        sidAfter = await _tryNativeGetProperty(native, 'sid');
      }
      if (sidAfter != sidToApply) {
        await _nativeCommand(native, ['set_property', 'sid', sidToApply]);
        sidAfter = await _tryNativeGetProperty(native, 'sid');
      }

      await _nativeSetProperty(native, 'secondary-sid', 'no');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      if (_useLibass) {
        await _nativeSetProperty(native, 'sub-ass', 'yes');
        await _applyAssOverrideMode();
      }
    } catch (_) {}
  }

  @override
  Future<void> disableSubtitleTrack() async {
    await _player.setSubtitleTrack(SubtitleTrack.no());
    try {
      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'sid', 'no');
      await _nativeSetProperty(native, 'secondary-sid', 'no');
      await _nativeSetProperty(native, 'sub-visibility', 'no');
    } catch (_) {}
  }

  @override
  Future<void> waitForTracksReady() async {
    _updateStaleState();
    if (!_isStale && _player.state.tracks.audio.isNotEmpty) {
      return;
    }
    try {
      final tracks = await _player.stream.tracks
          .firstWhere((t) {
            _updateStaleState();
            return !_isStale && t.audio.isNotEmpty;
          })
          .timeout(const Duration(seconds: 5));
      if (tracks.audio.isEmpty) return;
    } catch (_) {}
  }

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {
    if (count <= 0) return;
    _updateStaleState();
    if (!_isStale && _player.state.tracks.subtitle.length >= count) {
      return;
    }
    try {
      final tracks = await _player.stream.tracks
          .firstWhere((t) {
            _updateStaleState();
            return !_isStale && t.subtitle.length >= count;
          })
          .timeout(const Duration(seconds: 5));
      if (tracks.subtitle.length < count) return;
    } catch (_) {}
  }

  @override
  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume.clamp(0, 100));
  }

  @override
  Future<void> setAudioDelay(double seconds) async {
    final native = _player.platform as NativePlayer;
    await _nativeSetProperty(native, 'audio-delay', seconds.toStringAsFixed(3));
  }

  @override
  Future<void> setSubtitleDelay(double seconds) async {
    final native = _player.platform as NativePlayer;
    await _nativeSetProperty(native, 'sub-delay', seconds.toStringAsFixed(3));
  }

  @override
  Future<void> addExternalSubtitle(
    String url, {
    String? title,
    String? language,
    String? codec,
  }) async {
    final native = _player.platform as NativePlayer;
    await _nativeCommand(native, [
      'sub-add',
      url,
      'auto',
      title ?? 'external',
      language ?? '',
    ]);
  }

  @override
  Future<void> configureSubtitleStyle({
    int? textColor,
    int? backgroundColor,
    int? strokeColor,
    double? fontSize,
    int? fontWeight,
    double? verticalOffset,
  }) async {
    try {
      final native = _player.platform as NativePlayer;
      if (textColor != null) {
        await _nativeSetProperty(
          native,
          'sub-color',
          _argbToMpvColor(textColor),
        );
      }
      if (backgroundColor != null) {
        await _nativeSetProperty(
          native,
          'sub-back-color',
          _argbToMpvColor(backgroundColor),
        );
      }
      if (strokeColor != null) {
        await _nativeSetProperty(
          native,
          'sub-border-color',
          _argbToMpvColor(strokeColor),
        );
        await _nativeSetProperty(native, 'sub-border-size', '2');
      }
      if (fontSize != null) {
        final mpvSize = ((fontSize / 24.0) * 55.0).round().clamp(24, 120);
        await _nativeSetProperty(native, 'sub-font-size', mpvSize.toString());
      }
      if (fontWeight != null && fontWeight >= 700) {
        await _nativeSetProperty(native, 'sub-bold', 'yes');
      }
      if (verticalOffset != null) {
        final marginY = (verticalOffset * 720).round();
        await _nativeSetProperty(native, 'sub-margin-y', marginY.toString());
      }
      await _applyAssOverrideMode();
    } catch (_) {}
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  void _enableNativeSubtitleRendering() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      try {
        final native = _player.platform as NativePlayer;
        await _nativeSetProperty(native, 'sub-visibility', 'yes');
        await _nativeSetProperty(native, 'sub-ass', 'yes');
        await _nativeSetProperty(native, 'sub-ass-override', 'yes');
        await _nativeSetProperty(native, 'sub-forced-events-only', 'no');
      } catch (_) {}
    });
  }

  static String _argbToMpvColor(int argb) {
    // mpv expects #AARRGGBB (alpha first). Emitting #RRGGBBAA causes channels
    // to be reinterpreted (e.g. solid red -> blue).
    final a = (argb >> 24) & 0xFF;
    final r = (argb >> 16) & 0xFF;
    final g = (argb >> 8) & 0xFF;
    final b = argb & 0xFF;
    return '#${a.toRadixString(16).padLeft(2, '0')}'
        '${r.toRadixString(16).padLeft(2, '0')}'
        '${g.toRadixString(16).padLeft(2, '0')}'
        '${b.toRadixString(16).padLeft(2, '0')}';
  }

  Stream<T> _mergeWithStale<T>(Stream<T> source, T Function() getValue) {
    late StreamController<T> controller;
    StreamSubscription<T>? sourceSub;
    StreamSubscription<Playlist>? playlistSub;

    controller = StreamController<T>.broadcast(
      onListen: () {
        void checkAndPush() {
          _updateStaleState();
          if (!controller.isClosed) {
            controller.add(getValue());
          }
        }

        sourceSub = source.listen((_) => checkAndPush());
        playlistSub = _player.stream.playlist.listen((_) => checkAndPush());
        checkAndPush();
      },
      onCancel: () {
        sourceSub?.cancel();
        playlistSub?.cancel();
      },
    );
    return controller.stream;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _prefs.removeListener(_onPreferencesChanged);
    _player.dispose();
  }
}
