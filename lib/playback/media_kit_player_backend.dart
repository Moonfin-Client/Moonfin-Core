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
import '../util/auto_hdr_switcher.dart';
import '../util/platform_detection.dart';
import 'device_profile_builder.dart';
import 'hdr_output_controller.dart';
import 'known_defects.dart';
import 'server_transcode_capabilities.dart';

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

  /// Owns the decision about native HDR output and the window it needs.
  /// Public so the playback info sheet can report what actually happened.
  final HdrOutputController hdrOutput = HdrOutputController();

  bool _didNotifyNativeHandle = false;
  bool _didConfigureAppleMobileLibassFont = false;
  bool _didConfigureAndroidLibassFonts = false;
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
    return passthroughCodecsFromSet(
      prefs.resolvedPassthroughCodecs(),
      downmixToStereo: prefs.get(UserPreferences.downmixToStereo),
    ).isNotEmpty;
  }

  bool _isStale = false;
  String? _currentUrl;

  // The viewer asked for no subtitles. Held here so the deferred visibility
  // pass can tell a fresh source apart from a choice it must not undo.
  bool _subtitlesDisabled = false;

  // Captions mpv found inside the video, cached from the async track-list
  // property so the sync getter can serve them. An EmbeddedCaptionTrack id is
  // a 1-based position into [_ccTrackSids], which holds the real mpv sids.
  List<EmbeddedCaptionTrack> _embeddedCaptionTracks = const [];
  List<int> _ccTrackSids = const [];
  StreamSubscription<dynamic>? _ccTracksSub;
  final _tracksChangedController = StreamController<void>.broadcast();

  /// What mpv reported decoding for the file `play()` last opened, or null
  /// until it has. Kept here rather than read from `Player.state.videoParams`
  /// because media_kit never clears that on `open` - it only pushes an empty
  /// event down the stream - so straight after opening the next title the
  /// state still describes the previous one.
  VideoParams? _decodedVideoParams;
  StreamSubscription<VideoParams>? _videoParamsSub;

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
      // media_kit stringifies an unset property as '' or the literal 'null';
      // every caller wants that as null.
      final text = value.toString();
      if (text.isEmpty || text == 'null') return null;
      return text;
    } catch (_) {
      return null;
    }
  }

  /// A track entry from mpv's `track-list` property, in list order.
  /// [externalFilename] is the URL/path a sub-added external track was
  /// loaded from (null for demuxed embedded tracks).
  static List<
    ({
      int id,
      bool external,
      String? externalFilename,
      String codec,
      String? title,
      String? lang,
    })
  >
  _extractTrackEntries(String? trackListRaw, {required String type}) {
    if (trackListRaw == null || trackListRaw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(trackListRaw);
      if (decoded is! List) return const [];
      final entries =
          <
            ({
              int id,
              bool external,
              String? externalFilename,
              String codec,
              String? title,
              String? lang,
            })
          >[];
      for (final item in decoded) {
        if (item is! Map) continue;
        if (item['type']?.toString() != type) continue;
        final idValue = item['id'];
        final parsed = idValue is int
            ? idValue
            : int.tryParse(idValue?.toString() ?? '');
        if (parsed == null || parsed <= 0) continue;
        entries.add((
          id: parsed,
          external: item['external'] == true,
          externalFilename: item['external-filename']?.toString(),
          codec: item['codec']?.toString() ?? '',
          title: item['title']?.toString(),
          lang: item['lang']?.toString(),
        ));
      }
      return entries;
    } catch (_) {
      return const [];
    }
  }

  /// True for the subtitle track mpv creates from the CEA-608/708 captions a
  /// broadcaster carries inside the video (see `sub-create-cc-track`). These
  /// have no server stream to map to, so every place that lines mpv's track
  /// list up against the server's must skip them.
  static bool _isClosedCaptionCodec(String codec) {
    final c = codec.toLowerCase();
    return c == 'eia_608' || c == 'eia_708' || c == 'cea708' || c == 'cea_708';
  }

  // Whether an mpv external track was sub-added from the requested URL. mpv can
  // re-encode the URL it reports in `external-filename`, so an exact compare
  // misses. Jellyfin external subtitle URLs carry the unique subtitle stream
  // index in the path, so a decoded-path match still identifies the sub.
  static bool _externalFilenameMatches(
    String? mpvFilename,
    String requestedUrl,
  ) {
    if (mpvFilename == null || mpvFilename.isEmpty) return false;
    if (mpvFilename == requestedUrl) return true;
    final a = Uri.tryParse(mpvFilename);
    final b = Uri.tryParse(requestedUrl);
    if (a == null || b == null) return false;
    return Uri.decodeFull(a.path) == Uri.decodeFull(b.path);
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
      PlatformDetection.isAndroid || PlatformDetection.isIOS;

  // libass needs a font with CJK glyphs bundled or Asian subtitles show as
  // tofu. The family name has to match the font's internal name.
  static const String _libassFontAsset = 'assets/fonts/NotoSansCJK-Regular.otf';
  static const String _libassFontFamily = 'Noto Sans CJK SC';

  static bool get _useNativeSurface => PlatformDetection.useNativeVideoSurface;

  MediaKitPlayerBackend._(
    this._player,
    this._videoController,
    this._prefs,
    this._onNativeHandleReady,
    this._hwDecodingEnabled,
  ) {
    _prefs.addListener(_onPreferencesChanged);
    _ccTracksSub = _player.stream.tracks.listen(
      (_) => unawaited(_refreshEmbeddedCaptionTracks()),
    );
    _videoParamsSub = _player.stream.videoParams.listen(_onVideoParams);
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
            ? _libassFontAsset
            : null,
        libassAndroidFontName: PlatformDetection.isAndroid
            ? _libassFontFamily
            : null,
      ),
    );
    unawaited(player.setPlaylistMode(PlaylistMode.none));
    final platform = player.platform;
    if (platform is NativePlayer) {
      // A connection that died while playback sat paused is only noticed when
      // the resumed read blocks and times out, and the reconnect options can't
      // re-open the stream until the read gives up, so this bounds how long a
      // resume can sit frozen.
      _nativeSetProperty(platform, 'network-timeout', '20');
      // mpv stops reading ahead at 150MiB, which a high bitrate remux burns
      // through in seconds, so bursty networks stutter. A larger demuxer
      // budget keeps a real runway on desktop, but a filled 256MiB cache on
      // top of decode buffers can get the app killed on phones and TV boxes,
      // so those stay at the mpv default.
      if (!PlatformDetection.isAndroid && !PlatformDetection.isIOS) {
        _nativeSetProperty(platform, 'demuxer-max-bytes', '256MiB');
      }
      _nativeSetProperty(
        platform,
        'stream-lavf-o',
        'reconnect=1,reconnect_on_network_error=1,reconnect_on_http_error=5xx,'
            'reconnect_streamed=1,reconnect_delay_max=5',
      );
      // Surface the CEA-608/708 captions broadcasters carry inside the video
      // as an mpv subtitle track. It only appears once caption data is seen,
      // and every server-index mapping in this file skips it by codec.
      _nativeSetProperty(platform, 'sub-create-cc-track', 'yes');

      final maxChannels = prefs.get(UserPreferences.maxAudioChannels);
      // An explicit downmix wins over any channel cap. Passthrough streams
      // skip the mpv mixer entirely, so they stay unaffected.
      final audioChannelsLayout = prefs.get(UserPreferences.downmixToStereo)
          ? 'stereo'
          : (maxChannels == 0 || _passthroughActive(prefs))
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
      PlatformDetection.isDesktop ||
      PlatformDetection.isAndroid ||
      PlatformDetection.isIOS;

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
    final audioCapabilityProfile = _prefs.detectedAudioCapabilities;

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      audioCapabilityProfile: audioCapabilityProfile,
      audioFallbackCodec: _prefs.resolveAudioFallbackCodec(),
      ac3PassthroughEnabled: _prefs.resolveAc3PassthroughEnabled(),
      eac3PassthroughEnabled: _prefs.resolveEac3PassthroughEnabled(),
      dtsCorePassthroughEnabled: _prefs.resolveDtsCorePassthroughEnabled(),
      trueHdPassthroughEnabled: _prefs.resolveTrueHdPassthroughEnabled(),
      transcodeUnsupportedAudio: _prefs.resolveServerTranscodeUnsupportedAudio(),
      maxAudioChannels: _prefs.resolveMaxAudioChannels(),
      downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
      // mpv decodes all advertised audio codecs in software and downmixes
      // locally, so stereo routes never need a server-side audio transcode.
      universalAudioDecode: true,
      // The Android libmpv is built without the TrueHD and MLP decoders. The
      // Windows and Linux builds have them.
      playerDecodesTrueHd: !PlatformDetection.isAndroid,
      maxResolution: maxResolution,
      pgsDirectPlay:
          _prefs.get(UserPreferences.pgsDirectPlay) && canRenderBitmapSubtitles,
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
      supportsAvc: capabilities.supportsAvc,
      supportsAvcHigh10: capabilities.supportsAvcHigh10,
      avcMainLevel: capabilities.avcMainLevel,
      avcHigh10Level: capabilities.avcHigh10Level,
      supportsHevc: capabilities.supportsHevc,
      supportsHevcMain10: capabilities.supportsHevcMain10,
      transcodeHevcAllowed: serverAllowsHevcTranscode(),
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
    final autoPlay = payload['autoPlay'] != false;
    final url = mediaItem is String
        ? mediaItem
        : payload['url']?.toString() ?? '';
    if (url.isEmpty) return;

    _currentUrl = url;
    _isStale = true;
    _embeddedCaptionTracks = const [];
    _ccTrackSids = const [];

    await _notifyNativeHandleReady();
    await _configureAppleMobileLibassFont();
    await _configureAndroidLibassFonts();
    await _applyAudioPassthroughOptions();
    await _applyCustomMpvConfIfEnabled();
    await _applyAssOverrideMode();

    if (_player.platform is NativePlayer) {
      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'sid', 'auto');
      await _nativeSetProperty(native, 'secondary-sid', 'no');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      // PlayerConfiguration(libass: false) initializes mpv with sub-ass=no,
      // which strips ASS styling on desktop, so always turn it back on.
      await _nativeSetProperty(native, 'sub-ass', 'yes');
    }

    final media = Media(url);
    final openPaused = !autoPlay || startPosition > Duration.zero;
    // Whatever mpv reported for the previous title must not answer for this
    // one; the listener repopulates it once this file is loaded.
    _decodedVideoParams = null;
    await _player.open(media, play: !openPaused);
    _updateStaleState();
    await _applyLinuxHwdecFallbackIfNeeded(media, openPaused: openPaused);
    if (!_useLibass) {
      _enableNativeSubtitleRendering();
    }
    await _maybeEngageNativeHdr();
  }

  /// Gives mpv its own D3D11 window when the content is HDR and the display is
  /// already in HDR mode, so the stream reaches the screen untouched instead
  /// of being flattened into media_kit's 8-bit texture.
  ///
  /// Runs after `open`, because the decision needs `video-params`, which only
  /// exist once a file is loaded.
  Future<void> _maybeEngageNativeHdr() async {
    if (!PlatformDetection.supportsNativeHdrWindow) return;
    final native = _player.platform;
    if (native is! NativePlayer) return;
    // The controller answers every cheap gate - engaged, failed, no
    // presenter, preference off - before it invokes either callback, so the
    // video-params wait below is never paid on an audio track: music and
    // audiobooks share this singleton but never mount a presenter.
    await hdrOutput.maybeEngage(
      preferenceEnabled: _prefs.get(UserPreferences.nativeHdrOutput),
      isHdrContent: _isHdrContent,
      displayInHdrMode: AutoHdrSwitcher.isDisplayHdrEnabled,
      engageMpv: (handle) => _handOverToNativeWindow(native, handle),
    );
  }

  /// Tracks what mpv decoded, and reopens the HDR decision when the facts it
  /// depends on arrive after it was made.
  ///
  /// The decision runs at two fixed moments - the tail of `play()` and the
  /// presenting screen's mount - and waits a bounded time for mpv's
  /// `video-params`. A 4K remux over the network regularly takes longer than
  /// that to demux and decode its first frame, and when it does the wait
  /// times out, the title is filed as SDR, and nothing would ever ask again.
  /// mpv reporting PQ or HLG for the current file is the moment the question
  /// can actually be answered, so that is when it is asked again. Cheap when
  /// nothing changed: the controller refuses without a presenter, and an
  /// engaged, failed or disabled session is not revisited.
  void _onVideoParams(VideoParams params) {
    final loaded = params.gamma != null || params.primaries != null;
    _decodedVideoParams = loaded ? params : null;
    if (!loaded || !PlatformDetection.supportsNativeHdrWindow) return;
    if (!hdrOutput.status.value.isRevisitable) return;
    if (!isHdrVideoParams(gamma: params.gamma, primaries: params.primaries)) {
      return;
    }
    unawaited(_maybeEngageNativeHdr());
  }

  /// Re-runs the engagement decision for the presenting screen.
  ///
  /// `play()` usually runs before the video player screen has mounted, and
  /// engagement is refused without a presenter - so the screen calls this
  /// once it exists. No-ops when already engaged, failed, or disabled.
  ///
  /// Claims by identity - see [HdrOutputController.presenter].
  Future<void> ensureNativeHdrForPresenter(Object presenter) {
    hdrOutput.presenter = presenter;
    return _maybeEngageNativeHdr();
  }

  /// Hands the native HDR path back when the presenting screen goes away.
  ///
  /// mpv returns to media_kit's texture output, subtitles are re-asserted
  /// across the vo swap, the native window is destroyed (which also reverts
  /// the DWM composition), and the controller forgets the session - Live TV
  /// and the mini player share this singleton and can only render the
  /// texture, so leaving mpv on a window nothing presents would black them
  /// out for the rest of the process.
  Future<void> releaseNativeHdrPresenter(Object presenter) async {
    // A release from a screen that already handed over is not a release.
    if (!identical(hdrOutput.presenter, presenter)) return;
    // Same lifetime as the native path: the overlay must not follow mpv into
    // Live TV or the mini player.
    await _hideMpvStats();
    hdrOutput.presenter = null;
    _renegotiateSettleTimer?.cancel();
    _renegotiateSettleTimer = null;
    // A leftover deadline would make the next real trigger look covered.
    _renegotiateDue = null;
    _renegotiatePending = false;
    // A crossing that lands after this point must not re-arm the timer.
    hdrOutput.window.onMonitorChanged = null;
    if (hdrOutput.isEngaged) {
      // Forgetting the session first flips isEngaged, which is what an
      // in-flight renegotiation checks between its awaits - so it aborts
      // instead of writing vo=gpu-next straight over the restore below.
      hdrOutput.reset();
      // And wait the cycle out (bounded) so the property writes cannot
      // interleave even if it was already past its last check.
      for (var i = 0; i < 40 && _renegotiating; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      final native = _player.platform;
      if (native is NativePlayer) {
        final sid = await _tryNativeGetProperty(native, 'sid');
        await _restoreTexturePath(native, sid: sid);
      }
    }
    // Unconditional, and outside the engaged branch: a failed renegotiation
    // leaves the window up with status=failed, and skipping this would leave
    // the runner composited transparent for the rest of the process.
    await hdrOutput.window.destroy();
  }

  /// What this display is actually receiving right now, as opposed to what
  /// the session negotiated at engage time.
  ///
  /// The two can differ: drag the window onto an SDR monitor mid-playback and
  /// the screen shows SDR while the session stays engaged. The monitor's own
  /// HDR state is the authority - whichever side does the conversion, an SDR
  /// display is not showing HDR - and mpv's `target-params`, its account of
  /// the output target after every conversion, refines it where available.
  ///
  /// Null when there is nothing to say (not engaged, no native player), so
  /// callers can fall back to the session-level status.
  Future<bool?> isCurrentOutputHdr() async {
    if (!hdrOutput.isEngaged) return null;
    final native = _player.platform;
    if (native is! NativePlayer) return null;
    final (displayHdr, outputtingHdr) = await _readHdrOutputState(native);
    if (displayHdr == false) return false;
    if (displayHdr == null) return null;
    return outputtingHdr ?? true;
  }

  /// Whether this libmpv build ships the `stats` script. Verified on the
  /// Windows DLL (LuaJIT + stats.lua); Linux distro builds and the Android
  /// libs probably do too, but stay off until checked on a device.
  bool get supportsMpvStats => PlatformDetection.isWindows;

  /// Whether mpv's built-in statistics overlay is showing.
  bool _mpvStatsVisible = false;
  bool get mpvStatsVisible => _mpvStatsVisible;

  /// Toggles mpv's own statistics overlay (mpv's Shift+I). It draws inside
  /// mpv's output, so it works on the native HDR window and the texture path.
  ///
  /// media_kit starts mpv with `osd-level=0`, which hides the OSD the stats
  /// script draws with, so the level is raised only while the overlay is up.
  Future<void> toggleMpvStats() async {
    final native = _player.platform;
    if (native is! NativePlayer || !supportsMpvStats) return;
    final show = !_mpvStatsVisible;
    if (show) {
      await _nativeSetProperty(native, 'osd-level', '1');
    }
    final ok = await _tryNativeCommand(native, [
      'script-binding',
      'stats/display-stats-toggle',
    ]);
    if (ok) {
      _mpvStatsVisible = show;
    }
    if (!_mpvStatsVisible) {
      await _nativeSetProperty(native, 'osd-level', '0');
    }
  }

  Future<void> _hideMpvStats() async {
    if (_mpvStatsVisible) {
      await toggleMpvStats();
    }
  }

  /// The two halves of "is HDR really reaching the screen": the monitor's own
  /// state, and what mpv actually negotiated - each null when it could not be
  /// read. Kept separate because the two consumers need different shapes: the
  /// info row collapses them with the display as authority, while the
  /// monitor-crossing skip compares them for equality and must skip only when
  /// both are known. Independent reads, so they run together.
  Future<(bool?, bool?)> _readHdrOutputState(NativePlayer native) async {
    final (displayHdr, gamma) = await (
      AutoHdrSwitcher.displayHdrState(),
      _tryNativeGetProperty(native, 'target-params/gamma'),
    ).wait;
    final bool? outputtingHdr = gamma == null
        ? null
        // primaries deliberately null: wide gamut alone is not HDR output.
        : isHdrVideoParams(gamma: gamma, primaries: null);
    return (displayHdr, outputtingHdr);
  }

  /// What mpv actually decoded, rather than what the server claimed.
  ///
  /// media_kit already observes `video-params` and pushes it into
  /// [Player.stream.videoParams], so this waits on that stream rather than
  /// polling properties over FFI. It reacts the moment mpv reports instead of
  /// on a 100 ms granularity, and costs nothing while it waits.
  ///
  /// Only params reported for the current file count - see
  /// [_decodedVideoParams]. The wait is bounded because this is also reached
  /// for audio, where params never come; when a video simply takes longer,
  /// [_onVideoParams] reopens the decision on arrival, so a timeout here is
  /// a deferral rather than a verdict.
  Future<bool> _isHdrContent() async {
    var params = _decodedVideoParams;
    params ??= await _player.stream.videoParams
        .firstWhere((p) => p.gamma != null || p.primaries != null)
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => const VideoParams(),
        );
    return isHdrVideoParams(gamma: params.gamma, primaries: params.primaries);
  }

  /// Points mpv at the native window and switches it to the libplacebo
  /// renderer over D3D11. All of these are settable after `mpv_initialize`,
  /// so this happens mid-session without a second Player.
  Future<bool> _handOverToNativeWindow(NativePlayer native, int handle) async {
    // Swapping the video output tears down mpv's subtitle renderer and drops
    // the active track, so the selection is carried across by hand on every
    // path - re-selecting in the menu would not bring it back.
    String? sid;
    try {
      sid = await _tryNativeGetProperty(native, 'sid');

      // Before the first write: these are process-wide, and Live TV and the
      // mini player go on using them after the native path hands back.
      await _captureNativeRenderState(native);

      await _nativeSetProperty(native, 'wid', handle.toString());
      await _nativeSetProperty(native, 'gpu-api', 'd3d11');
      // Before `vo`, not after: the swapchain colorspace is negotiated at
      // creation. Named rather than a literal because engagement is gated on
      // the display being in HDR mode (HdrOutputController._decide).
      await _applyPassthroughHint(native, displayHdr: true);
      await _nativeSetProperty(native, 'vo', 'gpu-next');
      await _applyDesktopRenderQuality(native);
      // The quality overrides above replace keys a custom mpv.conf may also
      // set, and the conf was applied before this. Re-apply it so the user's
      // values win, which is what the allowlist promised them.
      await _applyCustomMpvConfIfEnabled(force: true);

      // If the renderer refused, `current-vo` still reads as the old one and
      // the window would sit black over the player.
      final vo = await _tryNativeGetProperty(native, 'current-vo');
      if (vo != 'gpu-next') {
        await _restoreTexturePath(native, sid: sid);
        return false;
      }

      await _restoreSubtitleState(native, sid);
      // From here on, a crossing between an HDR and an SDR monitor recreates
      // the renderer: `wid`-mode mpv negotiates the swapchain colorspace only
      // at creation, and a resize does not re-ask.
      hdrOutput.window.onMonitorChanged = () {
        // Trailing-edge debounce: a drag along the boundary between two
        // screens fires a crossing per flip, and each cycle is a full renderer
        // recreation.
        _scheduleDisplayRenegotiation(const Duration(milliseconds: 400));
      };
      return true;
    } catch (_) {
      await _restoreTexturePath(native, sid: sid);
      return false;
    }
  }

  /// Rebuilds mpv's subtitle rendering after the video output was swapped.
  ///
  /// mpv renders subtitles itself in the native window, so they come along
  /// inside it - but only once the renderer exists again. Re-asserting
  /// `sub-ass` and `sub-visibility` brings it back, and [sid] restores the
  /// track that was selected before the swap. Setting `sid` last matters: it
  /// is what actually re-initialises the renderer for that track.
  Future<void> _restoreSubtitleState(NativePlayer native, String? sid) async {
    try {
      // PlayerConfiguration(libass: false) starts mpv with sub-ass=no, and the
      // swap resets it again.
      await _nativeSetProperty(native, 'sub-ass', 'yes');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      if (sid != null && sid != 'no') {
        await _nativeSetProperty(native, 'sid', sid);
      }
    } catch (_) {
      // Subtitles can still be re-picked from the menu; the video path is
      // already up and must not be torn down over this.
    }
  }

  /// Whether a renderer cycle is already under way, so
  /// two cannot overlap.
  bool _renegotiating = false;

  /// A crossing landed while a cycle was running; one more cycle runs after
  /// the current one, against wherever the window ended up.
  bool _renegotiatePending = false;

  /// Debounces renegotiation - see [_scheduleDisplayRenegotiation].
  Timer? _renegotiateSettleTimer;

  /// When the pending [_renegotiateSettleTimer] is due, so a later reason to
  /// renegotiate cannot shorten an earlier one's settle.
  DateTime? _renegotiateDue;

  /// Queues one pass, [delay] from now. Shared by every reason to
  /// renegotiate, and only ever pushes the deadline out: firing on a shorter
  /// delay reads the display before the longer reason's event landed, and a
  /// stale read makes the pass skip itself - a lost cycle, not a late one.
  void _scheduleDisplayRenegotiation(Duration delay) {
    final due = DateTime.now().add(delay);
    final pending = _renegotiateDue;
    if (_renegotiateSettleTimer != null &&
        pending != null &&
        pending.isAfter(due)) {
      return;
    }
    _renegotiateSettleTimer?.cancel();
    _renegotiateDue = due;
    _renegotiateSettleTimer = Timer(delay, () {
      _renegotiateDue = null;
      unawaited(_renegotiateForDisplay());
    });
  }

  /// Re-checks the display after the auto-HDR switcher changed its mode with
  /// no window move. Both directions: a drop to SDR strands mpv on a PQ
  /// swapchain, a rise to HDR is the fact a revisitable "no" was missing.
  ///
  /// Call only when the mode actually moved - a pass costs a display sweep and
  /// an mpv read - and the settle is long because Windows applies mode changes
  /// slowly. A display changed behind the app's back is not covered; that
  /// needs watching, which belongs on the runner's position heartbeat.
  void refreshNativeHdrForDisplayState() {
    if (!hdrOutput.isEngaged && !hdrOutput.status.value.isRevisitable) return;
    _scheduleDisplayRenegotiation(const Duration(milliseconds: 1500));
  }

  /// True while the native renderer is being torn down and recreated for a
  /// renegotiation. In the behind-the-window arrangement the runner is
  /// transparent, so the player screen paints black instead while this is
  /// set - otherwise the desktop shows through the UI until mpv's first frame
  /// lands in the new swapchain.
  final ValueNotifier<bool> nativeRendererCycling = ValueNotifier(false);

  /// Recreates the renderer so the swapchain negotiates against the display
  /// the window is on now. The same vo cycle as engagement, subtitles carried
  /// across the same way.
  Future<void> _renegotiateForDisplay() async {
    if (!hdrOutput.isEngaged) {
      // A revisitable "no" and a display that may have just come up to HDR.
      // The controller re-runs its own gates and settles back if not.
      if (hdrOutput.status.value.isRevisitable) {
        await _maybeEngageNativeHdr();
      }
      return;
    }
    if (_renegotiating) {
      _renegotiatePending = true;
      return;
    }
    final native = _player.platform;
    if (native is! NativePlayer) return;
    _renegotiating = true;
    String? sid;
    try {
      // Only when the answer would change. A crossing between two SDR screens
      // or two HDR screens renegotiates to the same result, and the cycle is
      // a visible blink - skipping it makes those crossings seamless. Skip
      // only when BOTH sides are known: a failed display query mid-topology
      // change must not read as "SDR", and an unreadable mpv output must not
      // read as anything. When in doubt, cycle.
      final (displayHdr, outputtingHdr) = await _readHdrOutputState(native);
      if (displayHdr != null &&
          outputtingHdr != null &&
          outputtingHdr == displayHdr) {
        return;
      }

      // The presenting screen can go away during the reads above; its release
      // restores the texture path, and cycling now would write vo=gpu-next
      // straight over it.
      if (!hdrOutput.isEngaged) return;

      sid = await _tryNativeGetProperty(native, 'sid');
      nativeRendererCycling.value = true;
      await _nativeSetProperty(native, 'vo', 'null');
      await _applyPassthroughHint(native, displayHdr: displayHdr);
      await _nativeSetProperty(native, 'vo', 'gpu-next');
      // The hint is in the mpv.conf allowlist and was just overwritten. The
      // handover re-applies the conf for the same reason.
      await _applyCustomMpvConfIfEnabled(force: true);
      // The renderer can refuse to come back on the new adapter. Without this
      // check vo stays null and the session keeps claiming HDR over a black
      // picture - the same verification the original handover does.
      final vo = await _tryNativeGetProperty(native, 'current-vo');
      if (vo != 'gpu-next') {
        await _restoreTexturePath(native, sid: sid);
        if (hdrOutput.isEngaged) {
          hdrOutput.status.value = HdrOutputStatus.failed;
        }
        return;
      }
      await _restoreSubtitleState(native, sid);
      // current-vo flips as soon as the renderer exists, a little before its
      // first frame is presented; hold the black over that too.
      await Future<void>.delayed(const Duration(milliseconds: 250));
    } catch (_) {
      await _restoreTexturePath(native, sid: sid);
      if (hdrOutput.isEngaged) {
        hdrOutput.status.value = HdrOutputStatus.failed;
      }
    } finally {
      nativeRendererCycling.value = false;
      _renegotiating = false;
      if (_renegotiatePending) {
        _renegotiatePending = false;
        if (hdrOutput.isEngaged) {
          _scheduleDisplayRenegotiation(const Duration(milliseconds: 100));
        }
      }
    }
  }

  /// Puts mpv back on media_kit's render-API output after leaving the native
  /// window - a failed handover, a failed renegotiation, or the presenting
  /// screen going away.
  ///
  /// Must run on every exit path: `vo` has already left `libmpv` and `wid`
  /// points at a window about to be destroyed. The vo swap also drops mpv's
  /// subtitle renderer, so [sid] carries the active track across.
  Future<void> _restoreTexturePath(NativePlayer native, {String? sid}) async {
    try {
      await _nativeSetProperty(native, 'wid', '0');
      // Survives the vo swap, so clear it rather than promise passthrough
      // into media_kit's 8-bit texture.
      await _applyPassthroughHint(native, displayHdr: false);
      await _nativeSetProperty(native, 'vo', 'libmpv');
      // gpu-api and the desktop quality overrides are process-wide. Left
      // behind, one HDR title would pin d3d11 on a context that is the
      // OpenGL render API again, for Live TV and every later SDR title.
      await _restoreNativeRenderState(native);
      await _restoreSubtitleState(native, sid);
    } catch (_) {
      // Nothing further to try; the diagnostics row reports the failure.
    }
  }

  /// Everything the native handover overwrites that outlives it: `gpu-api`
  /// plus the keys [_applyDesktopRenderQuality] replaces.
  static const List<String> _nativeRenderStateKeys = [
    'gpu-api',
    'dither',
    'dither-depth',
    'scale',
    'dscale',
    'cscale',
    'sigmoid-upscaling',
    'hdr-compute-peak',
    'tone-mapping',
  ];

  /// What those keys held before the handover, so handing back puts them back.
  final Map<String, String> _preNativeRenderState = {};

  Future<void> _captureNativeRenderState(NativePlayer native) async {
    _preNativeRenderState.clear();
    for (final key in _nativeRenderStateKeys) {
      final value = await _tryNativeGetProperty(native, key);
      if (value != null) _preNativeRenderState[key] = value;
    }
  }

  Future<void> _restoreNativeRenderState(NativePlayer native) async {
    if (_preNativeRenderState.isEmpty) return;
    final saved = Map<String, String>.from(_preNativeRenderState);
    _preNativeRenderState.clear();
    for (final entry in saved.entries) {
      await _nativeSetProperty(native, entry.key, entry.value);
    }
  }

  /// Whether the hint currently says passthrough, so a failed display query
  /// can hold the last answer instead of guessing.
  bool _passthroughHintOn = false;

  /// The single owner of `target-colorspace-hint`, which suppresses
  /// tone-mapping - right only where the display is in HDR mode. DXGI accepts
  /// G2084 on an SDR swapchain on plenty of drivers, so leaving it on hands PQ
  /// to a display that reads it as sRGB and washes out to white. A null
  /// [displayHdr] is a failed query, not an answer, and holds the last answer.
  ///
  /// Written while `vo` is unset: the swapchain colorspace is negotiated once.
  Future<void> _applyPassthroughHint(
    NativePlayer native, {
    required bool? displayHdr,
  }) async {
    final on = displayHdr ?? _passthroughHintOn;
    _passthroughHintOn = on;
    // mpv 0.40+ defaults the mode to `target`, which adapts to the monitor's
    // EDID and leaves weak-HDR panels dim and double-tone-mapped. `source`
    // passes the stream's own metadata. Older builds ignore the write.
    await _nativeSetProperty(native, 'target-colorspace-hint-mode', 'source');
    await _nativeSetProperty(
      native,
      'target-colorspace-hint',
      on ? 'yes' : 'no',
    );
  }

  /// Undoes the defaults media_kit applies to every native platform.
  ///
  /// It sets `dither=no`, `scale=bilinear`, `dscale=bilinear`,
  /// `hdr-compute-peak=no` and `sigmoid-upscaling=no` regardless of platform.
  /// Those are phone performance choices; on a desktop GPU driving an HDR
  /// display they are all wrong, and `dither=no` alone visibly bands dark
  /// gradients. The caller re-applies any custom mpv.conf afterwards, so a
  /// user who set these keys themselves still wins.
  Future<void> _applyDesktopRenderQuality(NativePlayer native) async {
    await _nativeSetProperty(native, 'dither', 'fruit');
    await _nativeSetProperty(native, 'dither-depth', 'auto');
    await _nativeSetProperty(native, 'scale', 'spline36');
    await _nativeSetProperty(native, 'dscale', 'mitchell');
    await _nativeSetProperty(native, 'cscale', 'spline36');
    await _nativeSetProperty(native, 'sigmoid-upscaling', 'yes');
    // Dynamic peak detection, which is what makes HDR10+ and Dolby Vision
    // dynamic metadata worth anything when tone-mapping down.
    await _nativeSetProperty(native, 'hdr-compute-peak', 'yes');
    await _nativeSetProperty(native, 'tone-mapping', 'bt.2390');
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

  /// Maps the effective passthrough codec set to mpv spdif names. Downmixing
  /// decodes everything locally, so it empties the set.
  static List<String> passthroughCodecsFromSet(
    Set<PassthroughCodec> codecs, {
    required bool downmixToStereo,
  }) {
    if (downmixToStereo) {
      return const <String>[];
    }

    final names = <String>[];
    if (codecs.contains(PassthroughCodec.ac3)) {
      names.add('ac3');
    }
    if (codecs.contains(PassthroughCodec.eac3)) {
      names.add('eac3');
    }
    if (codecs.contains(PassthroughCodec.dtsHd)) {
      names.add('dts-hd');
    } else if (codecs.contains(PassthroughCodec.dtsCore)) {
      names.add('dts');
    }
    if (codecs.contains(PassthroughCodec.trueHd)) {
      names.add('truehd');
    }
    return names;
  }

  @visibleForTesting
  static Map<String, String> passthroughMpvPropertiesFromSet(
    Set<PassthroughCodec> codecs, {
    required bool downmixToStereo,
    required bool includeAudioExclusive,
  }) {
    final names = passthroughCodecsFromSet(
      codecs,
      downmixToStereo: downmixToStereo,
    );

    final properties = <String, String>{'audio-spdif': names.join(',')};
    if (includeAudioExclusive) {
      properties['audio-exclusive'] = names.isNotEmpty ? 'yes' : 'no';
    }
    return properties;
  }

  Future<void> _applyAudioPassthroughOptions() async {
    if (_player.platform is! NativePlayer) {
      return;
    }

    try {
      final native = _player.platform as NativePlayer;
      final properties = passthroughMpvPropertiesFromSet(
        _prefs.resolvedPassthroughCodecs(),
        downmixToStereo: _prefs.get(UserPreferences.downmixToStereo),
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

  /// [force] re-applies even when the same file was applied already. Handing
  /// mpv the native HDR window resets a batch of render options, so the user's
  /// conf has to be laid back over the top; the path/mtime cache would
  /// otherwise skip it and their values would be gone for the session.
  Future<void> _applyCustomMpvConfIfEnabled({bool force = false}) async {
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
      if (!force &&
          _appliedCustomMpvConfPath == path &&
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
    'tone-mapping-mode',
    'gamut-mapping-mode',
    'target-trc',
    'target-prim',
    'target-peak',
    'target-contrast',
    // Tags the swapchain's colorspace, which is what HDR passthrough rides on.
    // Only the contexts that own their swapchain (d3d11, winvk, wayland) act on
    // it, so it is inert on the Flutter texture path and harmless to allow.
    'target-colorspace-hint',
    'target-colorspace-hint-mode',
    'hdr-compute-peak',
    // gpu-api and gpu-context deliberately stay OUT of this list: they belong
    // to the unsafe-advanced tier, and listing them here would bypass that
    // gate on every platform - a wrong gpu-context blacks out all playback.
    'target-inverse-tone-mapping',
    // media_kit initializes every native platform with dither=no, which bands
    // dark gradients on desktop. Let a conf turn it back on.
    'dither',
    'dither-depth',
    'brightness',
    'contrast',
    'saturation',
    'gamma',
    'sharpen',
    'audio-spdif',
    'audio-channels',
    'audio-normalize-downmix',
    'volume-gain',
    'volume-max',
    'replaygain',
    'replaygain-preamp',
    'replaygain-clip',
    'replaygain-fallback',
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
    'gpu-api',
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

      final fontFile = File(
        '${fontsDirectory.path}/${_libassFontAsset.split('/').last}',
      );
      if (!await fontFile.exists()) {
        final data = await rootBundle.load(_libassFontAsset);
        await fontFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      }

      await _copyBundledScriptFonts(fontsDirectory);

      final native = _player.platform as NativePlayer;
      await _nativeSetProperty(native, 'sub-fonts-dir', fontsDirectory.path);
      await _nativeSetProperty(native, 'sub-font', _libassFontFamily);
      await _nativeSetProperty(native, 'sub-ass', 'yes');
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      _didConfigureAppleMobileLibassFont = true;
    } catch (_) {}
  }

  static const String _subtitleFontAssetDir = 'assets/subtitle_fonts';

  Future<void> _copyBundledScriptFonts(Directory fontsDirectory) async {
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final assets = manifest.listAssets().where(
        (asset) => asset.startsWith('$_subtitleFontAssetDir/'),
      );
      for (final asset in assets) {
        final name = asset.split('/').last;
        final target = File('${fontsDirectory.path}/$name');
        if (await target.exists()) continue;
        final data = await rootBundle.load(asset);
        await target.writeAsBytes(data.buffer.asUint8List(), flush: true);
      }
    } catch (_) {}
  }

  static const List<String> _androidScriptFontPrefixes = [
    'NotoNaskhArabic',
    'NotoSansArabic',
    'NotoSansDevanagari',
    'NotoSansBengali',
    'NotoSansTamil',
    'NotoSansTelugu',
    'NotoSansKannada',
    'NotoSansMalayalam',
    'NotoSansGujarati',
    'NotoSansGurmukhi',
    'NotoSansOriya',
    'NotoSansSinhala',
    'NotoSansThai',
    'NotoSansLao',
    'NotoSansKhmer',
    'NotoSansMyanmar',
    'NotoSansHebrew',
    'NotoSansGeorgian',
    'NotoSansArmenian',
    'NotoSansEthiopic',
    'NotoSansSymbols',
    'NotoSansSymbols2',
    'NotoSansMath',
    'NotoMusic',
  ];

  Future<void> _configureAndroidLibassFonts() async {
    if (!PlatformDetection.isAndroid || _didConfigureAndroidLibassFonts) {
      return;
    }
    if (_player.platform is! NativePlayer) return;
    try {
      final native = _player.platform as NativePlayer;
      final fontsDirPath =
          ((await (native as dynamic).getProperty('sub-fonts-dir')) as String)
              .trim();
      if (fontsDirPath.isEmpty) return;
      final fontsDir = Directory(fontsDirPath);
      if (!await fontsDir.exists()) return;

      final systemFonts = Directory('/system/fonts');
      if (!await systemFonts.exists()) return;
      final systemFiles = systemFonts.listSync().whereType<File>().toList();

      for (final prefix in _androidScriptFontPrefixes) {
        final source = _firstScriptFont(systemFiles, prefix);
        if (source == null) continue;
        final name = source.path.split('/').last;
        final target = File('${fontsDir.path}/$name');
        if (await target.exists()) continue;
        await target.writeAsBytes(await source.readAsBytes(), flush: true);
      }
      _didConfigureAndroidLibassFonts = true;
    } catch (_) {}
  }

  // Match by filename prefix, but the following character must not be a digit so
  // "NotoSansSymbols" does not swallow "NotoSansSymbols2".
  static File? _firstScriptFont(List<File> fonts, String prefix) {
    final lowerPrefix = prefix.toLowerCase();
    for (final font in fonts) {
      final name = font.path.split('/').last;
      if (!name.toLowerCase().startsWith(lowerPrefix)) continue;
      if (name.length > prefix.length) {
        final next = name.codeUnitAt(prefix.length);
        if (next >= 0x30 && next <= 0x39) continue;
      }
      return font;
    }
    return null;
  }

  Future<void> _applyAssOverrideMode() async {
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

  // Some errors are just the socket dropping mid-stream, like a connection
  // reset or a broken pipe. The reconnect options quietly re-open the stream
  // and playback keeps going, so we don't want these popping up as a fatal
  // "playback failed". Real trouble reaching the stream (connection refused,
  // timed out, 403/404, a TLS error) reads differently and still gets through.
  static bool _isTransientReconnectError(String message) {
    final lower = message.toLowerCase();
    // ffmpeg's socket read or write dropped mid-stream.
    if (lower.contains('ffurl_read') || lower.contains('ffurl_write')) {
      return true;
    }
    // How most platforms word a dropped connection.
    if (lower.contains('connection reset') ||
        lower.contains('connection abort') ||
        lower.contains('broken pipe')) {
      return true;
    }
    // Windows reports the same drops as hex codes. 0xffffd8ba is WSAECONNRESET
    // (10054) and 0xffffd8bb is WSAECONNABORTED (10053).
    if (lower.contains('0xffffd8ba') || lower.contains('0xffffd8bb')) {
      return true;
    }
    return false;
  }

  @override
  Stream<Map<String, dynamic>>? get errorStream => _player.stream.error
      .where((err) => !_isTransientReconnectError(err))
      .map((err) => <String, dynamic>{'event': 'error', 'message': err});

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
    try {
      final native = _player.platform as NativePlayer;
      // The incoming value is a 1-based position among the stream's audio
      // tracks, not an mpv aid, so resolve it against the live track list
      // like the subtitle path does (aids can have gaps or a shifted origin).
      final trackList = await _tryNativeGetProperty(native, 'track-list');
      final audioEntries = _extractTrackEntries(trackList, type: 'audio');
      if (audioEntries.isNotEmpty && mpvTrackId > audioEntries.length) {
        // The position doesn't exist in this stream (e.g. a stale Jellyfin
        // ordinal against a single-track transcode); selecting a nonexistent
        // aid would mute playback.
        return;
      }
      final aidToApply = audioEntries.isNotEmpty
          ? audioEntries[mpvTrackId - 1].id.toString()
          : mpvTrackId.toString();

      AudioTrack? match;
      for (final t in _player.state.tracks.audio) {
        if (t.id == aidToApply) {
          match = t;
          break;
        }
      }
      if (match != null) {
        await _player.setAudioTrack(match);
      } else {
        await _player.setAudioTrack(AudioTrack(aidToApply, null, null));
      }
      final aidAfter = await _tryNativeGetProperty(native, 'aid');
      if (aidAfter != aidToApply) {
        await _nativeSetProperty(native, 'aid', aidToApply);
      }
    } catch (_) {}
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
      // An active CC track isn't a server-stream selection, so the server
      // menu shows nothing selected, the same as the other backends.
      if (_isCcSid(active.id)) {
        return -1;
      }
      final subtitleTracks = _player.state.tracks.subtitle;
      final playableSubtitleTracks = subtitleTracks
          .where((t) => t.id != 'auto' && t.id != 'no' && !_isCcSid(t.id))
          .toList();
      final idx = playableSubtitleTracks.indexWhere((t) => t.id == active.id);
      if (idx >= 0) {
        return idx + 1;
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<int?> getActiveSubtitleTrackIndexAsync() async =>
      activeSubtitleTrackIndex;

  static void _subtitleDebug(String message) {
    if (kDebugMode) {
      debugPrint('[subtitle_mpv] $message');
    }
  }

  @override
  Future<void> setSubtitleTrack(
    int mpvTrackId, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {
    if (mpvTrackId < 1) return;
    _subtitlesDisabled = false;
    try {
      final native = _player.platform as NativePlayer;
      final trackListBefore = await _tryNativeGetProperty(native, 'track-list');
      // The CC track mpv creates from in-video captions has no server stream,
      // so it must not shift the positions this mapping hands out.
      final subEntries = _extractTrackEntries(
        trackListBefore,
        type: 'sub',
      ).where((e) => !_isClosedCaptionCodec(e.codec)).toList();
      final subtitleIds = subEntries.map((e) => e.id).toList();

      // Resolve the 1-based position to a real mpv sid. External tracks are
      // matched by the URL they were sub-added from, so a scrambled add order
      // (external added before a slow embedded demux finished) can't select
      // the wrong track. Embedded positions count only demuxed tracks for the
      // same reason.
      String? resolvedSid;
      if (isExternalSubtitle && externalSubtitleUrl != null) {
        for (final entry in subEntries) {
          if (entry.external &&
              _externalFilenameMatches(
                entry.externalFilename,
                externalSubtitleUrl,
              )) {
            resolvedSid = entry.id.toString();
            break;
          }
        }
        // If the URL match missed, pick among external tracks only, using the
        // live demuxed embedded count so a miscounted ordinal can't shift into
        // or across embedded tracks.
        if (resolvedSid == null) {
          final liveEmbedded = subEntries.where((e) => !e.external).length;
          final externals = subEntries.where((e) => e.external).toList();
          final externalPos = mpvTrackId - 1 - liveEmbedded;
          if (externalPos >= 0 && externalPos < externals.length) {
            resolvedSid = externals[externalPos].id.toString();
          }
        }
      } else if (!isExternalSubtitle) {
        final embedded = subEntries.where((e) => !e.external).toList();
        if (mpvTrackId <= embedded.length) {
          resolvedSid = embedded[mpvTrackId - 1].id.toString();
        }
      }
      final sidToApply =
          resolvedSid ??
          ((mpvTrackId <= subtitleIds.length)
              ? subtitleIds[mpvTrackId - 1].toString()
              : mpvTrackId.toString());
      final subtitleTracks = _player.state.tracks.subtitle;
      final playableSubtitleTracks = subtitleTracks
          .where((t) => t.id != 'auto' && t.id != 'no' && !_isCcSid(t.id))
          .toList();

      var sidAfter = await _tryNativeGetProperty(native, 'sid');

      SubtitleTrack? target;
      for (final t in playableSubtitleTracks) {
        if (t.id == sidToApply) {
          target = t;
          break;
        }
      }
      target ??= (mpvTrackId <= playableSubtitleTracks.length && mpvTrackId > 0)
          ? playableSubtitleTracks[mpvTrackId - 1]
          : null;
      if (target != null) {
        await _player.setSubtitleTrack(target);
        sidAfter = await _tryNativeGetProperty(native, 'sid');
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

      // Moonfin never shows a Flutter subtitle overlay (media_kit disables its
      // SubtitleView when libass is on, and it stays hidden otherwise), so mpv
      // has to draw every subtitle including plain text like SRT and VTT.
      await _nativeSetProperty(native, 'sub-visibility', 'yes');
      await _nativeSetProperty(native, 'sub-ass', 'yes');
      await _applyAssOverrideMode();
      _subtitleDebug(
        'set track=$mpvTrackId sid_requested=$sidToApply sid_after=$sidAfter '
        'codec=$subtitleCodec external=$isExternalSubtitle '
        'bitmap=$isBitmapSubtitle mpv_sub_tracks=${subtitleIds.length}',
      );
    } catch (e) {
      _subtitleDebug('set track=$mpvTrackId threw: $e');
    }
  }

  /// Re-reads mpv's track list for the CC track it creates once caption data
  /// is seen, which on a live channel can be well after playback began.
  Future<void> _refreshEmbeddedCaptionTracks() async {
    if (_isDisposed) return;
    final platform = _player.platform;
    if (platform is! NativePlayer) return;
    final raw = await _tryNativeGetProperty(platform, 'track-list');
    if (_isDisposed) return;
    final ccEntries = _extractTrackEntries(
      raw,
      type: 'sub',
    ).where((e) => _isClosedCaptionCodec(e.codec)).toList();

    final sids = [for (final e in ccEntries) e.id];
    final changed = !listEquals(sids, _ccTrackSids);
    _ccTrackSids = sids;
    _embeddedCaptionTracks = List.unmodifiable([
      for (var i = 0; i < ccEntries.length; i++)
        EmbeddedCaptionTrack(
          id: i + 1,
          label: (ccEntries[i].title?.isNotEmpty ?? false)
              ? ccEntries[i].title!
              : 'CC${i + 1}',
          language: (ccEntries[i].lang?.isNotEmpty ?? false)
              ? ccEntries[i].lang
              : null,
        ),
    ]);
    if (changed && !_tracksChangedController.isClosed) {
      _tracksChangedController.add(null);
    }
  }

  @override
  List<EmbeddedCaptionTrack> get embeddedCaptionTracks =>
      _embeddedCaptionTracks;

  @override
  Stream<void> get tracksChangedStream => _tracksChangedController.stream;

  @override
  Future<void> setEmbeddedCaptionTrack(int id) async {
    if (id <= 0 || id > _ccTrackSids.length) return;
    _subtitlesDisabled = false;
    final platform = _player.platform;
    if (platform is! NativePlayer) return;
    final sid = _ccTrackSids[id - 1].toString();
    await _nativeSetProperty(platform, 'sid', sid);
    await _nativeSetProperty(platform, 'secondary-sid', 'no');
    await _nativeSetProperty(platform, 'sub-visibility', 'yes');
    await _nativeSetProperty(platform, 'sub-ass', 'yes');
  }

  @override
  Future<void> disableSubtitleTrack() async {
    _subtitlesDisabled = true;
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

  /// Whether an mpv track id (a sid rendered as a string) is the CC track
  /// created from in-video captions.
  bool _isCcSid(String id) => _ccTrackSids.contains(int.tryParse(id));

  // media_kit's track list includes the 'auto' and 'no' pseudo-tracks.
  // Counting them lets waits finish early, so external sub-adds can race
  // the embedded track demux and scramble the sid order. The CC track isn't
  // a server stream either, so it must not satisfy a server-count wait.
  int _realSubtitleTrackCount(List<SubtitleTrack> tracks) => tracks
      .where((t) => t.id != 'auto' && t.id != 'no' && !_isCcSid(t.id))
      .length;

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {
    if (count <= 0) return;
    _updateStaleState();
    if (!_isStale &&
        _realSubtitleTrackCount(_player.state.tracks.subtitle) >= count) {
      return;
    }
    try {
      await _player.stream.tracks
          .firstWhere((t) {
            _updateStaleState();
            return !_isStale && _realSubtitleTrackCount(t.subtitle) >= count;
          })
          .timeout(const Duration(seconds: 5));
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
    _subtitleDebug(
      'sub-add title=$title lang=$language codec=$codec '
      'mpv_sub_tracks=${_realSubtitleTrackCount(_player.state.tracks.subtitle)}',
    );
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
      // Read on the way out rather than on the way in, since the viewer can
      // turn subtitles off while this is still pending.
      if (_subtitlesDisabled) return;
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
    _ccTracksSub?.cancel();
    _videoParamsSub?.cancel();
    _tracksChangedController.close();
    _player.dispose();
  }
}
