import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import 'device_profile_builder.dart';

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

class MediaKitPlayerBackend implements PlayerBackend {
  static const Duration _linuxHwdecFirstFrameTimeout = Duration(seconds: 4);
  final Player _player;
  final VideoController _videoController;
  final UserPreferences _prefs;
  final Future<void> Function(int handle)? _onNativeHandleReady;
  final bool _hwDecodingEnabled;
  bool _didNotifyNativeHandle = false;
  bool _didConfigureAppleMobileLibassFont = false;
  String? _appliedCustomMpvConfPath;
  DateTime? _appliedCustomMpvConfMtime;
  static final Map<String, _ParsedMpvConfCacheEntry> _parsedMpvConfCache =
      <String, _ParsedMpvConfCacheEntry>{};

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
        final parsed = idValue is int ? idValue : int.tryParse(idValue?.toString() ?? '');
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
      PlatformDetection.isDesktop || PlatformDetection.isAndroid || PlatformDetection.isIOS;

  MediaKitPlayerBackend._(
    this._player,
    this._videoController,
    this._prefs,
    this._onNativeHandleReady,
    this._hwDecodingEnabled,
  );

  factory MediaKitPlayerBackend(
    UserPreferences prefs, {
    Future<void> Function(int handle)? onNativeHandleReady,
  }) {
    final hwDecodingEnabled = prefs.get(UserPreferences.hardwareDecoding);
    // Android: null → AndroidVideoController getDefaultHwdec() (mediacodec-copy).
    final String? hwdec = hwDecodingEnabled
        ? (PlatformDetection.isAndroid
              ? null
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
    final platform = player.platform;
    if (platform is NativePlayer) {
      _nativeSetProperty(platform, 'network-timeout', '120');
      if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
        // Prefer AudioTrack + preloaded scaletempo2 for stable TV speed changes.
        _nativeSetProperty(platform, 'ao', 'audiotrack');
        _nativeSetProperty(platform, 'af', 'scaletempo2');
      }
      if (PlatformDetection.isIOS || PlatformDetection.isAndroid) {
        _nativeSetProperty(platform, 'tone-mapping', 'auto');
      }
    }
    final controller = VideoController(
      player,
      configuration: VideoControllerConfiguration(hwdec: hwdec),
    );
    return MediaKitPlayerBackend._(
      player,
      controller,
      prefs,
      onNativeHandleReady,
      hwDecodingEnabled,
    );
  }

  @override
  bool get canRenderBitmapSubtitles =>
      PlatformDetection.isDesktop || PlatformDetection.isAndroid;

  VideoController get videoController => _videoController;

  @override
  Map<String, dynamic> getDeviceProfile({bool useProgressiveTranscode = false}) {
    final maxBitrate = int.tryParse(_prefs.get(UserPreferences.maxBitrate));
    final ac3Enabled = _prefs.get(UserPreferences.ac3Enabled);
    final maxResolution = _prefs.get(UserPreferences.maxVideoResolution);

    return DeviceProfileBuilder.build(
      maxBitrateMbps: maxBitrate,
      ac3Enabled: ac3Enabled,
      maxResolution: maxResolution,
      pgsDirectPlay: _prefs.get(UserPreferences.pgsDirectPlay),
      assDirectPlay: _prefs.get(UserPreferences.assDirectPlay),
    );
  }

  @override
  Future<void> play(dynamic mediaItem, {Duration startPosition = Duration.zero}) async {
    final url = mediaItem as String;
    await _notifyNativeHandleReady();
    await _configureAppleMobileLibassFont();
    await _applyCustomMpvConfIfEnabled();
    await _applyAssOverrideMode();
    final media = Media(url);
    final openPaused = startPosition > Duration.zero;
    await _player.open(media, play: !openPaused);
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
      await _videoController.waitUntilFirstFrameRendered
          .timeout(_linuxHwdecFirstFrameTimeout);
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
      final unsafeAdvanced = _prefs.get(UserPreferences.customMpvConfUnsafeAdvanced);

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

  static const List<String> _deniedMpvPrefixes = [
    'script-',
    'ipc-',
  ];

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
      final fontsDirectory =
          Directory('${supportDirectory.path}/moonfin-subfonts');
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
  Duration get position => _player.state.position;

  @override
  Duration get duration => _player.state.duration;

  @override
  Duration get buffer => _player.state.buffer;

  @override
  bool get isPlaying => _player.state.playing;

  @override
  bool get isBuffering => _player.state.buffering;

  @override
  double get playbackSpeed => _player.state.rate;

  @override
  Stream<Duration> get positionStream => _player.stream.position;

  @override
  Stream<Duration> get durationStream => _player.stream.duration;

  @override
  Stream<Duration> get bufferStream => _player.stream.buffer;

  @override
  Stream<bool> get playingStream => _player.stream.playing;

  @override
  Stream<bool> get bufferingStream => _player.stream.buffering;

  @override
  Stream<bool> get completedStream => _player.stream.completed;

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      try {
        final native = _player.platform as NativePlayer;
        final speedValue = speed.toString();
        final setOk = await _tryNativeSetProperty(native, 'speed', speedValue);
        if (!setOk) {
          await _tryNativeCommand(native, ['set_property', 'speed', speedValue]);
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
        if (t.id == id) { match = t; break; }
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
  Future<void> setSubtitleTrack(int mpvTrackId, {bool isBitmapSubtitle = false}) async {
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
    if (_player.state.tracks.audio.isNotEmpty) {
      return;
    }
    try {
      final tracks = await _player.stream.tracks
          .firstWhere((t) => t.audio.isNotEmpty)
          .timeout(const Duration(seconds: 5));
      if (tracks.audio.isEmpty) return;
    } catch (_) {}
  }

  @override
  Future<void> waitForEmbeddedSubtitleCount(int count) async {
    if (count <= 0) return;
    if (_player.state.tracks.subtitle.length >= count) {
      return;
    }
    try {
      final tracks = await _player.stream.tracks
          .firstWhere((t) => t.subtitle.length >= count)
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
        await _nativeSetProperty(native, 'sub-color', _argbToMpvColor(textColor));
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

  @override
  void dispose() {
    _player.dispose();
  }
}
