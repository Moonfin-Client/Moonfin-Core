import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/html_video_backend.dart';
import '../../../playback/media_kit_player_backend.dart';
import '../../../playback/tizen_player_backend.dart';
import 'package:video_player/video_player.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/clock_format.dart';
import '../../../util/subtitle_track_logic.dart';
import '../../../util/play_method_label.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/playback/stream_info_dialog.dart';
import '../../widgets/subtitle_preview.dart';
import 'live_tv_guide_screen.dart';
import '../../screensaver/screensaver_controller.dart';

class LiveTvPlayerScreen extends StatefulWidget {
  final List<GuideChannel> channels;
  final int startIndex;

  const LiveTvPlayerScreen({
    super.key,
    required this.channels,
    required this.startIndex,
  });

  @override
  State<LiveTvPlayerScreen> createState() => _LiveTvPlayerScreenState();
}

class _LiveTvPlayerScreenState extends State<LiveTvPlayerScreen> {
  final _manager = GetIt.instance<PlaybackManager>();
  final MediaKitPlayerBackend? _backend =
      (PlatformDetection.isTizen || PlatformDetection.isAppleTV)
      ? null
      : GetIt.instance<MediaKitPlayerBackend>();
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _screensaverController = GetIt.instance<ScreensaverController>();

  MediaKitPlayerBackend? get _activeMediaKitBackend {
    final backend = _manager.backend;
    return backend is MediaKitPlayerBackend ? backend : null;
  }

  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _manager.backend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  HtmlVideoBackend? get _activeHtmlVideoBackend {
    final backend = _manager.backend;
    return backend is HtmlVideoBackend ? backend : null;
  }

  late int _currentIndex;
  bool _infoVisible = true;
  Timer? _hideTimer;
  bool _isStopping = false;
  bool _didRestoreSystemUiOnExit = false;
  bool _isSwitching = false;
  bool _isGuidePickerOpen = false;
  DateTime? _suppressBackUntil;
  bool _forcedLandscape = true;

  GuideProgram? _currentProgram;
  Timer? _programRefreshTimer;
  StreamSubscription<PlayerBackend>? _backendSub;
  StreamSubscription<bool>? _screensaverPlayingSub;

  final _overlayFocus = FocusNode();
  final _tvPlayPauseFocus = FocusNode(debugLabel: 'LiveTvPlayPause');
  final _tvChannelsFocus = FocusNode(debugLabel: 'LiveTvChannels');
  final _tvPlaybackInfoFocus = FocusNode(debugLabel: 'LiveTvPlaybackInfo');
  // Index of the currently focused OSD control (0=PlayPause, 1=Channels,
  // 2=PlaybackInfo). Tracked explicitly so arrow navigation never depends on
  // FocusManager.primaryFocus matching one of these exact nodes.
  int _focusedControlIndex = 0;
  PlayerState get _state => _manager.state;

  @override
  void initState() {
    super.initState();
    _screensaverController.setPlaybackActive(true);
    _screensaverPlayingSub = _state.playingStream.listen(
      _screensaverController.setPlaybackActive,
    );
    _currentIndex = widget.startIndex;
    _applyPlayerDisplayMode();
    _applySubtitleStyle();
    _backendSub = _manager.backendChangedStream.listen((backend) {
      if (!mounted) return;
      setState(() {});
    });
    _tvPlayPauseFocus.addListener(_onControlFocusChanged);
    _tvChannelsFocus.addListener(_onControlFocusChanged);
    _tvPlaybackInfoFocus.addListener(_onControlFocusChanged);
    _playCurrentChannel();
    _scheduleHide();
    _startProgramRefresh();
  }

  @override
  void dispose() {
    _screensaverPlayingSub?.cancel();
    _screensaverController.setPlaybackActive(false);
    _hideTimer?.cancel();
    _programRefreshTimer?.cancel();
    _backendSub?.cancel();
    _tvPlayPauseFocus.removeListener(_onControlFocusChanged);
    _tvChannelsFocus.removeListener(_onControlFocusChanged);
    _tvPlaybackInfoFocus.removeListener(_onControlFocusChanged);
    _overlayFocus.dispose();
    _tvPlayPauseFocus.dispose();
    _tvChannelsFocus.dispose();
    _tvPlaybackInfoFocus.dispose();
    if (!_isStopping) {
      _manager.stop(userInitiated: false);
    }
    unawaited(_restoreSystemUiForExit());
    super.dispose();
  }

  GuideChannel get _currentChannel => widget.channels[_currentIndex];

  Future<void> _playCurrentChannel() async {
    final channel = _currentChannel;
    final item = AggregatedItem(
      id: channel.id,
      serverId: _client.baseUrl,
      rawData: channel.rawData,
    );
    final allowDirect = _prefs.get(UserPreferences.liveTvDirectPlayEnabled);
    try {
      await _manager.playItems(
        [item],
        enableDirectPlay: allowDirect,
        enableDirectStream: allowDirect,
        // Keep transcoding available as a fallback so a failed direct-play of
        // the upstream URL recovers to the server transcode instead of erroring.
        enableTranscoding: true,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).failedToPlayChannel(channel.name),
            ),
          ),
        );
      }
      return;
    }
    _fetchCurrentProgram();
  }

  Future<void> _switchChannel(int newIndex) async {
    if (_isSwitching) return;
    _isSwitching = true;
    try {
      setState(() {
        _currentIndex = newIndex;
        _currentProgram = null;
        _infoVisible = true;
      });
      await _playCurrentChannel();
      _scheduleHide();
    } finally {
      _isSwitching = false;
    }
  }

  Future<void> _fetchCurrentProgram() async {
    final channelId = _currentChannel.id;
    try {
      final now = DateTime.now();
      final response = await _client.liveTvApi.getGuide(
        startDate: now.subtract(const Duration(minutes: 30)),
        endDate: now.add(const Duration(hours: 3)),
        channelIds: [channelId],
        fields: 'Overview',
        enableTotalRecordCount: false,
        userId: _client.userId,
      );
      final items = (response['Items'] as List?) ?? [];
      if (items.isEmpty || !mounted) return;

      Map<String, dynamic>? selected;
      DateTime? selectedStart;
      DateTime? selectedEnd;
      for (final item in items) {
        final raw = item as Map<String, dynamic>;
        final startStr = raw['StartDate']?.toString();
        final endStr = raw['EndDate']?.toString();
        if (startStr == null || endStr == null) continue;
        final start = DateTime.tryParse(startStr)?.toLocal();
        final end = DateTime.tryParse(endStr)?.toLocal();
        if (start == null || end == null) continue;

        selected ??= raw;
        selectedStart ??= start;
        selectedEnd ??= end;
        if (!now.isBefore(start) && now.isBefore(end)) {
          selected = raw;
          selectedStart = start;
          selectedEnd = end;
          break;
        }
      }

      if (selected == null || selectedStart == null || selectedEnd == null) {
        return;
      }

      final selectedMap = selected;
      final selectedProgramStart = selectedStart;
      final selectedProgramEnd = selectedEnd;

      setState(() {
        _currentProgram = GuideProgram(
          id: selectedMap['Id']?.toString() ?? '',
          channelId: channelId,
          name: selectedMap['Name']?.toString() ?? '',
          startDate: selectedProgramStart,
          endDate: selectedProgramEnd,
          overview: selectedMap['Overview'] as String?,
          episodeTitle: selectedMap['EpisodeTitle'] as String?,
          isMovie: selectedMap['IsMovie'] == true,
          isSeries: selectedMap['IsSeries'] == true,
          isSports: selectedMap['IsSports'] == true,
          isNews: selectedMap['IsNews'] == true,
          isKids: selectedMap['IsKids'] == true,
          isPremiere: selectedMap['IsPremiere'] == true,
          hasTimer: selectedMap['TimerId'] != null,
          rawData: selectedMap,
        );
      });
    } catch (_) {}
  }

  void _startProgramRefresh() {
    _programRefreshTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _fetchCurrentProgram(),
    );
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      if (_isOverlayInteractionActive) {
        _scheduleHide();
        return;
      }
      setState(() => _infoVisible = false);
      if (PlatformDetection.isTV) {
        _overlayFocus.requestFocus();
      }
    });
  }

  bool get _isOverlayInteractionActive {
    if (_isGuidePickerOpen) return true;
    if (!PlatformDetection.isTV) return false;
    return _tvPlayPauseFocus.hasFocus ||
        _tvChannelsFocus.hasFocus ||
        _tvPlaybackInfoFocus.hasFocus;
  }

  void _onControlFocusChanged() {
    if (!mounted || !PlatformDetection.isTV) return;
    if (_tvPlayPauseFocus.hasFocus) {
      _focusedControlIndex = 0;
    } else if (_tvChannelsFocus.hasFocus) {
      _focusedControlIndex = 1;
    } else if (_tvPlaybackInfoFocus.hasFocus) {
      _focusedControlIndex = 2;
    }
    if (_tvPlayPauseFocus.hasFocus || _tvChannelsFocus.hasFocus) {
      _hideTimer?.cancel();
      if (!_infoVisible) {
        setState(() => _infoVisible = true);
      }
      return;
    }

    if (_infoVisible) {
      _scheduleHide();
    }
  }

  bool get _isBackNavigationSuppressed {
    final until = _suppressBackUntil;
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  void _suppressBackNavigation([
    Duration duration = const Duration(milliseconds: 700),
  ]) {
    _suppressBackUntil = DateTime.now().add(duration);
  }

  void _showInfo() {
    setState(() => _infoVisible = true);
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_infoVisible) return;
        _tvPlayPauseFocus.requestFocus();
      });
    }
    _scheduleHide();
  }

  void _toggleInfo() {
    if (_infoVisible) {
      _hideTimer?.cancel();
      setState(() => _infoVisible = false);
      if (PlatformDetection.isTV) {
        _overlayFocus.requestFocus();
      }
    } else {
      _showInfo();
    }
  }

  void _togglePlayback() {
    _state.isPlaying ? _manager.pause() : _manager.resume();
    _scheduleHide();
  }

  void _toggleOrientationLock() {
    setState(() => _forcedLandscape = !_forcedLandscape);
    _applyPlayerDisplayMode();
  }

  void _applyPlayerDisplayMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (_forcedLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      return;
    }

    SystemChrome.setPreferredOrientations([]);
  }

  Future<void> _applyGuideDisplayMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([]);
  }

  void _showPlaybackInfo() {
    final l10n = AppLocalizations.of(context);
    final streamInfoSections = _buildLiveTvStreamInfoSections();
    unawaited(
      showStreamInfoDialog(
        context: context,
        title: l10n.playbackInformation,
        streamInfoSections: streamInfoSections,
      ),
    );
    _showInfo();
  }

  List<Map<String, dynamic>> _buildLiveTvStreamInfoSections() {
    final l10n = AppLocalizations.of(context);
    final resolution = _manager.currentResolution;
    final streamPlayMethod = resolution?.playMethod;
    final playMethod = playbackMethodLabel(
      l10n: l10n,
      playMethod: streamPlayMethod,
      transcodingReasons: resolution?.transcodingReasons ?? const <String>[],
    );
    final backendLabel = _activeMedia3Backend != null
        ? 'Media3 (ExoPlayer)'
        : 'Media Kit (MPV)';
    final channelLabel = _currentChannel.number == null
        ? _currentChannel.name
        : '${_currentChannel.number} ${_currentChannel.name}';
    final duration = _state.duration;
    final durationLabel = duration > Duration.zero
        ? _formatDurationLabel(duration)
        : 'Live';
    final streams = resolution?.mediaStreams ?? const <Map<String, dynamic>>[];

    Map<String, dynamic>? pickStream(String type, int? preferredIndex) {
      if (preferredIndex != null && preferredIndex >= 0) {
        final preferred = streams
            .where((s) => s['Type'] == type)
            .firstWhere(
              (s) => s['Index'] == preferredIndex,
              orElse: () => const <String, dynamic>{},
            );
        if (preferred.isNotEmpty) {
          return preferred;
        }
      }
      return streams
              .where((s) => s['Type'] == type && s['IsDefault'] == true)
              .firstOrNull ??
          streams.where((s) => s['Type'] == type).firstOrNull;
    }

    final videoStream = streams.where((s) => s['Type'] == 'Video').firstOrNull;
    final audioStream = pickStream('Audio', _manager.audioStreamIndex);
    final subtitleStream = _manager.subtitleStreamIndex == -1
        ? null
        : pickStream('Subtitle', _manager.subtitleStreamIndex);

    Map<String, dynamic> row(String label, String value, {bool highlight = false}) {
      return {'label': label, 'value': value, 'highlight': highlight};
    }

    final sections = <Map<String, dynamic>>[];

    void addSection(String title, List<Map<String, dynamic>> rows) {
      if (rows.isEmpty) return;
      sections.add({'title': title, 'rows': rows});
    }

    final playbackRows = <Map<String, dynamic>>[
      row('Channel', channelLabel, highlight: true),
      if (_currentProgram?.name.isNotEmpty == true)
        row('Program', _currentProgram!.name),
      row(l10n.playMethod, playMethod, highlight: true),
      if (resolution != null &&
          streamPlayMethod == StreamPlayMethod.transcode &&
          resolution.transcodingReasons.isNotEmpty)
        row(
          l10n.transcodeReasons,
          resolution.transcodingReasons
              .map((r) => r.replaceAllMapped(RegExp(r'(?<=[a-z])(?=[A-Z])'), (_) => ' '))
              .join(', '),
        ),
      row(l10n.player, backendLabel),
      row(
        l10n.container,
        (() {
          final container = (resolution?.container ?? '').trim().toUpperCase();
          return container.isEmpty ? l10n.unknown : container;
        })(),
      ),
      row('Playing', _state.isPlaying ? 'Yes' : 'No'),
      row('Buffering', _state.isBuffering ? 'Yes' : 'No'),
      row('Position', _formatDurationLabel(_state.position)),
      row('Duration', durationLabel),
    ];
    addSection(l10n.playback, playbackRows);

    if (videoStream != null) {
      final fps = videoStream['RealFrameRate'] as num?;
      final width = videoStream['Width'];
      final height = videoStream['Height'];
      final videoRows = <Map<String, dynamic>>[
        row(
          l10n.resolution,
          '${width ?? '?'}x${height ?? '?'}${fps != null ? ' @ ${fps.round()}fps' : ''}',
        ),
        row(l10n.hdr, _getHdrType(videoStream)),
        row(l10n.codec, _formatVideoCodec(videoStream)),
        if (videoStream['BitRate'] != null)
          row(l10n.videoBitrate, _formatBitrate(videoStream['BitRate'] as int?)),
      ];
      addSection(l10n.video, videoRows);
    }

    if (audioStream != null) {
      final audioRows = <Map<String, dynamic>>[
        row(
          l10n.track,
          audioStream['DisplayTitle'] as String? ??
              audioStream['Language'] as String? ??
              l10n.unknown,
        ),
        row(l10n.codec, _formatAudioCodec(audioStream)),
        row(l10n.channels, _formatChannels(audioStream['Channels'] as int?)),
        if (audioStream['BitRate'] != null)
          row(l10n.audioBitrate, _formatBitrate(audioStream['BitRate'] as int?)),
        if (audioStream['SampleRate'] != null)
          row(
            l10n.sampleRate,
            '${((audioStream['SampleRate'] as num) / 1000).toStringAsFixed(1)} kHz',
          ),
      ];
      addSection(l10n.audio, audioRows);
    }

    if (subtitleStream != null) {
      final subtitleRows = <Map<String, dynamic>>[
        row(
          l10n.track,
          subtitleStream['DisplayTitle'] as String? ??
              subtitleStream['Language'] as String? ??
              l10n.unknown,
        ),
        row(
          l10n.format,
          ((subtitleStream['Codec'] as String?) ?? l10n.unknown).toUpperCase(),
        ),
        row(
          l10n.type,
          subtitleStream['IsExternal'] == true ? l10n.external : l10n.embedded,
        ),
      ];
      addSection(l10n.subtitles, subtitleRows);
    }

    return sections;
  }

  String _formatBitrate(int? bitrate) {
    final l10n = AppLocalizations.of(context);
    if (bitrate == null || bitrate <= 0) {
      return l10n.unknown;
    }
    return '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';
  }

  String _formatVideoCodec(Map<String, dynamic> stream) {
    final codec = ((stream['Codec'] as String?) ?? '').trim().toUpperCase();
    final profile = ((stream['Profile'] as String?) ?? '').trim();
    if (codec.isEmpty) {
      return AppLocalizations.of(context).unknown;
    }
    if (profile.isEmpty) {
      return codec;
    }
    return '$codec $profile';
  }

  String _formatAudioCodec(Map<String, dynamic> stream) {
    final codec = ((stream['Codec'] as String?) ?? '').trim().toUpperCase();
    if (codec.isNotEmpty) {
      return codec;
    }
    return AppLocalizations.of(context).unknown;
  }

  String _formatChannels(int? channels) {
    final l10n = AppLocalizations.of(context);
    if (channels == null) return l10n.unknown;
    return switch (channels) {
      8 => '7.1',
      6 => '5.1',
      2 => l10n.stereo,
      1 => l10n.mono,
      _ => l10n.channelsCount(channels),
    };
  }

  String _getHdrType(Map<String, dynamic> stream) {
    final rangeType = stream['VideoRangeType'] as String? ?? '';
    if (rangeType.contains('DOVI') || rangeType.contains('DoVi')) {
      return 'Dolby Vision';
    }
    if (rangeType.contains('HDR10Plus') || rangeType.contains('HDR10+')) {
      return 'HDR10+';
    }
    if (rangeType.contains('HDR10') || rangeType.contains('HDR')) {
      return 'HDR10';
    }
    if (rangeType.contains('HLG')) {
      return 'HLG';
    }
    final range = stream['VideoRange'] as String?;
    if (range == 'HDR') {
      return 'HDR';
    }
    return 'SDR';
  }

  Future<void> _showChannelPicker() async {
    _hideTimer?.cancel();
    _suppressBackNavigation();
    if (!_isGuidePickerOpen) {
      setState(() => _isGuidePickerOpen = true);
    }

    await _applyGuideDisplayMode();
    if (!mounted) return;

    String? selectedChannelId;
    try {
      selectedChannelId = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (context) => LiveTvGuideScreen(
            miniPlayerMode: true,
            currentChannel: _currentChannel,
          ),
        ),
      );
    } finally {
      if (mounted) {
        _applyPlayerDisplayMode();
      }
      if (mounted && _isGuidePickerOpen) {
        setState(() => _isGuidePickerOpen = false);
      }
      _suppressBackNavigation();
    }

    if (!mounted) return;

    if (selectedChannelId != null && selectedChannelId != _currentChannel.id) {
      final selectedIndex = widget.channels.indexWhere(
        (channel) => channel.id == selectedChannelId,
      );
      if (selectedIndex >= 0) {
        await _switchChannel(selectedIndex);
        return;
      }
    }

    if (_infoVisible) {
      _scheduleHide();
      if (PlatformDetection.isTV) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !_infoVisible) return;
          _tvChannelsFocus.requestFocus();
        });
      }
    }
  }

  Future<void> _exitPlayback() async {
    if (_isStopping) return;
    _isStopping = true;
    await _manager.stop(userInitiated: false);
    await _restoreSystemUiForExit();
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _restoreSystemUiForExit() async {
    if (_didRestoreSystemUiOnExit) return;
    _didRestoreSystemUiOnExit = true;
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([]);
  }

  void _applySubtitleStyle() {
    final backend = _manager.backend;
    if (backend == null) return;
    unawaited(
      backend.configureSubtitleStyle(
        textColor: _prefs.get(UserPreferences.subtitlesTextColor),
        backgroundColor: _prefs.get(UserPreferences.subtitlesBackgroundColor),
        strokeColor: _prefs.get(UserPreferences.subtitleTextStrokeColor),
        fontSize: _prefs.get(UserPreferences.subtitlesTextSize),
        fontWeight: _prefs.get(UserPreferences.subtitlesTextWeight),
        verticalOffset: _prefs.get(UserPreferences.subtitlesOffsetPosition),
      ),
    );
  }

  SubtitleViewConfiguration _buildSubtitleConfig() {
    final textColor = Color(_prefs.get(UserPreferences.subtitlesTextColor));
    final bgColor = Color(_prefs.get(UserPreferences.subtitlesBackgroundColor));
    final strokeColor = Color(
      _prefs.get(UserPreferences.subtitleTextStrokeColor),
    );
    final prefSize = _prefs.get(UserPreferences.subtitlesTextSize);
    final fontWeight = _prefs.get(UserPreferences.subtitlesTextWeight);
    final offset = _prefs.get(UserPreferences.subtitlesOffsetPosition);

    final baseSize = PlatformDetection.useMobileUi ? 40.0 : 32.0;
    final fontSize = (prefSize / 24.0) * baseSize;
    final basePadding = PlatformDetection.useMobileUi ? 16.0 : 24.0;
    final bottomPadding =
        basePadding + (offset * MediaQuery.sizeOf(context).height * 0.5);

    final strokeShadows = subtitleStrokeShadows(strokeColor, fontSize);

    final activeIndex = _manager.subtitleStreamIndex;
    bool isAssOrPgs = false;
    if (activeIndex != null && activeIndex >= 0) {
      final mediaStreams = _manager.currentResolution?.mediaStreams;
      if (mediaStreams != null) {
        final activeStream = mediaStreams.firstWhere(
          (s) => s['Index'] == activeIndex,
          orElse: () => const <String, dynamic>{},
        );
        final codec = activeStream['Codec'] as String?;
        isAssOrPgs = shouldRenderSubtitleNatively(codec);
      }
    }

    return SubtitleViewConfiguration(
      visible: PlatformDetection.isDesktop ? false : !isAssOrPgs,
      style: TextStyle(
        inherit: false,
        height: 1.4,
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight >= 700 ? FontWeight.bold : FontWeight.normal,
        backgroundColor: bgColor,
        fontFamilyFallback: const ['Roboto', 'Noto Sans', 'Arial'],
        shadows: strokeShadows,
      ),
      textAlign: TextAlign.center,
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, bottomPadding),
    );
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowUp:
      case LogicalKeyboardKey.arrowDown:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      case LogicalKeyboardKey.select:
      case LogicalKeyboardKey.enter:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }

        if (PlatformDetection.isTV &&
            FocusManager.instance.primaryFocus == _tvChannelsFocus) {
          unawaited(_showChannelPicker());
          return KeyEventResult.handled;
        }

        _togglePlayback();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowLeft:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          _moveControlFocus(-1);
          return KeyEventResult.handled;
        }
        _showInfo();
        return KeyEventResult.handled;
      case LogicalKeyboardKey.arrowRight:
        if (!_infoVisible) {
          _showInfo();
          return KeyEventResult.handled;
        }
        if (PlatformDetection.isTV) {
          _moveControlFocus(1);
          return KeyEventResult.handled;
        }
        _showInfo();
        return KeyEventResult.handled;
      default:
        return KeyEventResult.ignored;
    }
  }

  void _moveControlFocus(int delta) {
    final order = [_tvPlayPauseFocus, _tvChannelsFocus, _tvPlaybackInfoFocus];
    _focusedControlIndex =
        (_focusedControlIndex + delta).clamp(0, order.length - 1);
    order[_focusedControlIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isGuidePickerOpen || _isBackNavigationSuppressed) return;
        _exitPlayback();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Focus(
          focusNode: _overlayFocus,
          autofocus: true,
          onKeyEvent: _handleKeyEvent,
          child: GestureDetector(
            onTap: PlatformDetection.isTV ? null : _toggleInfo,
            behavior: HitTestBehavior.opaque,
            child: MouseRegion(
              cursor: PlatformDetection.useDesktopUi && !_infoVisible
                  ? SystemMouseCursors.none
                  : SystemMouseCursors.basic,
              onHover: (_) {
                if (PlatformDetection.useDesktopUi) {
                  if (_infoVisible) {
                    _scheduleHide();
                  } else {
                    _showInfo();
                  }
                }
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildVideoSurface(),
                  _buildBufferingIndicator(),
                  if (_infoVisible) ...[
                    _buildTopOverlay(),
                    _buildBottomOverlay(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSurface() {
    if (PlatformDetection.isTizen) {
      return _buildTizenVideoSurface();
    }

    final prefersMedia3 =
        _prefs.get(UserPreferences.playbackEnginePreference) ==
        PlaybackEnginePreference.media3;
    final prewarmMedia3 = _manager.backend == null && prefersMedia3;
    if (_activeMedia3Backend != null || prewarmMedia3) {
      return const Positioned.fill(child: Media3VideoView(fill: Colors.black));
    }

    final htmlBackend = _activeHtmlVideoBackend;
    if (htmlBackend != null) {
      return Positioned.fill(child: htmlBackend.buildView(fit: BoxFit.contain));
    }

    final mediaKitBackend = _activeMediaKitBackend ?? _backend;
    if (mediaKitBackend == null) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    final size = MediaQuery.sizeOf(context);
    if (PlatformDetection.useNativeVideoSurface) {
      return Positioned.fill(
        child: NativeVideoView(
          player: mediaKitBackend.player,
          fill: Colors.black,
          videoOutput: 'gpu',
          hardwareDecodingEnabled: _prefs.get(UserPreferences.hardwareDecoding),
        ),
      );
    }

    final controller = mediaKitBackend.videoController;
    if (controller == null) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }

    return Positioned.fill(
      child: Video(
        controller: controller,
        controls: NoVideoControls,
        width: size.width,
        height: size.height,
        fit: BoxFit.contain,
        fill: Colors.black,
        pauseUponEnteringBackgroundMode: false,
        subtitleViewConfiguration: _buildSubtitleConfig(),
      ),
    );
  }

  Widget _buildTizenVideoSurface() {
    final backend = _manager.backend;
    if (backend is! TizenPlayerBackend) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    final controller = backend.controller;
    if (controller == null || !controller.value.isInitialized) {
      return const Positioned.fill(child: ColoredBox(color: Colors.black));
    }
    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black,
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }

  Widget _buildBufferingIndicator() {
    return StreamBuilder<bool>(
      stream: _state.bufferingStream,
      initialData: _state.isBuffering,
      builder: (context, snap) {
        if (snap.data != true) return const SizedBox.shrink();
        return Center(
          child: CircularProgressIndicator(color: AppColorScheme.accent),
        );
      },
    );
  }

  Widget _buildTopOverlay() {
    final padding = MediaQuery.of(context).padding;
    final channel = _currentChannel;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: padding.top + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
          bottom: AppSpacing.spaceMd,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            if (!PlatformDetection.useLeanbackUi)
              IconButton(
                onPressed: _exitPlayback,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            const SizedBox(width: AppSpacing.spaceSm),
            if (channel.number != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColorScheme.accent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  channel.number!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeMd,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.spaceMd),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    channel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppTypography.fontSizeLg,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (_currentProgram != null)
                    Text(
                      _currentProgram!.name,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: AppTypography.fontSizeSm,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (_currentProgram?.hasTimer == true)
              const Padding(
                padding: EdgeInsets.only(left: AppSpacing.spaceSm),
                child: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomOverlay() {
    final padding = MediaQuery.of(context).padding;
    final program = _currentProgram;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          bottom: padding.bottom + AppSpacing.spaceSm,
          left: AppSpacing.spaceLg,
          right: AppSpacing.spaceLg,
          top: AppSpacing.spaceMd,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (program?.episodeTitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.spaceXs),
                child: Text(
                  program!.episodeTitle!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: AppTypography.fontSizeSm,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            _buildTimelineSection(),
            _buildPlaybackControlsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaybackControlsRow() {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.spaceSm),
      child: Row(
        children: [
          StreamBuilder<bool>(
            stream: _state.playingStream,
            initialData: _state.isPlaying,
            builder: (context, snap) {
              final isPlaying = snap.data ?? _state.isPlaying;
              return _buildOverlayControlButton(
                focusNode: PlatformDetection.isTV ? _tvPlayPauseFocus : null,
                icon: isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                tooltip: isPlaying ? l10n.pause : l10n.play,
                onPressed: _togglePlayback,
              );
            },
          ),
          const SizedBox(width: AppSpacing.spaceSm),
          _buildOverlayControlButton(
            focusNode: PlatformDetection.isTV ? _tvChannelsFocus : null,
            icon: Icons.list_rounded,
            tooltip: l10n.channels,
            onPressed: () => unawaited(_showChannelPicker()),
          ),
          if (PlatformDetection.isMobile) ...[
            const SizedBox(width: AppSpacing.spaceSm),
            _buildOverlayControlButton(
              icon: _forcedLandscape
                  ? Icons.screen_lock_landscape_outlined
                  : Icons.screen_rotation_outlined,
              tooltip: _forcedLandscape
                  ? l10n.playerTooltipUnlockOrientation
                  : l10n.playerTooltipLockLandscape,
              onPressed: _toggleOrientationLock,
            ),
          ],
          const SizedBox(width: AppSpacing.spaceSm),
          _buildOverlayControlButton(
            focusNode: PlatformDetection.isTV ? _tvPlaybackInfoFocus : null,
            icon: Icons.info_outline_rounded,
            tooltip: l10n.playbackInformation,
            onPressed: _showPlaybackInfo,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTimelineSection() {
    return StreamBuilder<Duration>(
      stream: _state.positionStream,
      initialData: _state.position,
      builder: (context, positionSnap) {
        return StreamBuilder<Duration>(
          stream: _state.durationStream,
          initialData: _state.duration,
          builder: (context, durationSnap) {
            final program = _currentProgram;
            double? progress;
            String leftLabel;
            String rightLabel;

            if (program != null) {
              final now = DateTime.now();
              progress = program.progressAt(now).clamp(0.0, 1.0);
              leftLabel = _formatTime(program.startDate);
              rightLabel = _formatTime(program.endDate);
            } else {
              final position = positionSnap.data ?? Duration.zero;
              final duration = durationSnap.data ?? Duration.zero;
              if (duration > Duration.zero) {
                progress =
                    (position.inMilliseconds / duration.inMilliseconds).clamp(
                      0.0,
                      1.0,
                    );
                leftLabel = _formatDurationLabel(position);
                rightLabel = _formatDurationLabel(duration);
              } else {
                progress = null;
                leftLabel = _formatTime(DateTime.now());
                rightLabel = 'LIVE';
              }
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation(AppColorScheme.accent),
                    minHeight: 3,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceXs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      leftLabel,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: AppTypography.fontSizeXs,
                      ),
                    ),
                    Text(
                      rightLabel,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: AppTypography.fontSizeXs,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatDurationLabel(Duration value) {
    final totalSeconds = value.inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildOverlayControlButton({
    FocusNode? focusNode,
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    if (PlatformDetection.isTV) {
      return _LiveTvRoundControlButton(
        focusNode: focusNode,
        onPressed: onPressed,
        tooltip: tooltip,
        icon: icon,
      );
    }

    return IconButton(
      focusNode: focusNode,
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white.withValues(alpha: 0.14),
        minimumSize: const Size(44, 44),
        padding: const EdgeInsets.all(8),
        shape: const CircleBorder(),
      ),
      icon: Icon(icon, size: 22),
    );
  }

  String _formatTime(DateTime dt) {
    return formatClockTime(
      dt,
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
  }
}

class _LiveTvRoundControlButton extends StatefulWidget {
  final FocusNode? focusNode;
  final VoidCallback onPressed;
  final String tooltip;
  final IconData icon;

  const _LiveTvRoundControlButton({
    required this.onPressed,
    required this.tooltip,
    required this.icon,
    this.focusNode,
  });

  @override
  State<_LiveTvRoundControlButton> createState() =>
      _LiveTvRoundControlButtonState();
}

class _LiveTvRoundControlButtonState extends State<_LiveTvRoundControlButton> {
  late FocusNode _effectiveFocusNode;
  bool _ownsNode = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _effectiveFocusNode = widget.focusNode!;
    } else {
      _effectiveFocusNode = FocusNode();
      _ownsNode = true;
    }
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _LiveTvRoundControlButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode == widget.focusNode) return;

    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsNode) {
      _effectiveFocusNode.dispose();
      _ownsNode = false;
    }

    if (widget.focusNode != null) {
      _effectiveFocusNode = widget.focusNode!;
    } else {
      _effectiveFocusNode = FocusNode();
      _ownsNode = true;
    }
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsNode) {
      _effectiveFocusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    final hasFocus = _effectiveFocusNode.hasFocus;
    if (_focused != hasFocus) {
      setState(() => _focused = hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = ThemeRegistry.active.borders.focusBorder.color;
    return Focus(
      focusNode: _effectiveFocusNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          // The outer Focus is the single focus target for this button; a
          // focusable InkWell would add a second, invisible focus node that
          // breaks the OSD's manual arrow navigation.
          canRequestFocus: false,
          customBorder: const CircleBorder(),
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _focused
                  ? AppColorScheme.accent.withValues(alpha: 0.30)
                  : Colors.white.withValues(alpha: 0.14),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.focusBorder.copyWith(
                  color: _focused
                      ? focusColor
                      : Colors.white.withValues(alpha: 0.10),
                  width: _focused ? 2 : 1,
                ),
              ),
            ),
            child: Icon(widget.icon, size: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
