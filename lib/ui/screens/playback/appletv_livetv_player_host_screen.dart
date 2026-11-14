import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../playback/subtitle_style.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/user_data_sync.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../playback/apple_player_ui.dart';
import '../../../playback/native_apple_player_backend.dart';
import '../../../playback/appletv_subtitles.dart';
import '../../../playback/playback_info_sections.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/clock_format.dart';
import '../../../util/platform_detection.dart';
import '../livetv/channel_tune_observer.dart';
import '../livetv/live_tv_guide_screen.dart';
import '../../navigation/destinations.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/live_tv/channel_carousel_overlay.dart';
import '../../widgets/live_tv/incomplete_recording.dart';
import '../../widgets/live_tv/live_tv_recording_dialog.dart';
import 'osd_buttons.dart';

class AppleTvLiveTvPlayerHostScreen extends StatefulWidget {
  final List<GuideChannel> channels;
  final int startIndex;

  const AppleTvLiveTvPlayerHostScreen({
    super.key,
    required this.channels,
    required this.startIndex,
  });

  @override
  State<AppleTvLiveTvPlayerHostScreen> createState() =>
      _AppleTvLiveTvPlayerHostScreenState();
}

class _AppleTvLiveTvPlayerHostScreenState
    extends State<AppleTvLiveTvPlayerHostScreen>
    with WidgetsBindingObserver {
  final _manager = GetIt.instance<PlaybackManager>();
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();
  String? _deviceLabel;

  StreamSubscription<void>? _exitSub;
  StreamSubscription<Map<String, dynamic>>? _actionSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;
  StreamSubscription<bool>? _screensaverPlayingSub;

  (SubtitleStyle, double, double, int)? _lastSubtitleStyle;
  String _lastClickpadPrefs = '';

  late int _currentIndex;
  bool _exiting = false;
  bool _switching = false;
  bool _inGuide = false;
  bool _recordingFlow = false;
  bool _channelIsUp = false;

  /// Holds landscape until the viewer unlocks rotation, like the Flutter player.
  bool _orientationLocked = true;
  StreamSubscription<LiveRecoveryStatus?>? _liveRecoverySub;
  Timer? _schedulePushDebounce;

  /// The live picture while the player is suspended for the guide, which
  /// shows it in its mini player.
  final _guideTexture = ValueNotifier<int?>(null);

  int? _recordingTexture;

  // Captions the player found inside the video, which the server never lists
  // as subtitle streams. The native subtitle menu round-trips a plain index
  // int, so caption rows ride above _ccMenuIndexBase to stay clear of every
  // real server stream index.
  static const _ccMenuIndexBase = 100000;
  int? _captionTrackId;
  bool _captionTrackApplied = false;
  StreamSubscription<void>? _tracksChangedSub;

  GuideProgram? _currentProgram;
  final Map<String, GuideProgram> _nowPlayingByChannel = {};
  final Map<String, String> _logoUrlCache = {};

  /// Holds the lineup's schedule for the header and the channel list, and
  /// refreshes it on a program boundary and once an hour.
  ChannelCarouselPrewarm? _carouselPrewarm;
  AppThemeController? _themeController;
  ScreensaverController? _screensaverController;

  NativeApplePlayerBackend? get _backend {
    try {
      return GetIt.instance<NativeApplePlayerBackend>();
    } catch (_) {
      return null;
    }
  }

  late List<GuideChannel> _syncedChannels;

  void _syncChannels() => _syncedChannels = [
    for (final channel in widget.channels) channel.withSyncedUserData(),
  ];

  GuideChannel get _currentChannel => _syncedChannels[_currentIndex];

  @override
  void initState() {
    super.initState();
    unawaited(playbackDeviceLabel().then((label) => _deviceLabel = label));
    try {
      _screensaverController = GetIt.instance<ScreensaverController>();
    } catch (_) {}
    _screensaverController?.setNativePlayerPresented(true);
    _currentIndex = widget.startIndex;
    _syncChannels();
    userDataSync.addListener(_onChannelUserDataChanged);
    if (PlatformDetection.isIOS) {
      unawaited(_applyOrientationLock());
      // A phone only keeps its screen on while playback is marked active. The
      // television follows the playing stream itself and lets its screensaver
      // run while paused, so this stays on iOS.
      _screensaverPlayingSub = _manager.state.playingStream.listen(
        (playing) => _screensaverController?.setPlaybackActive(playing),
      );
    }
    _exitSub = _backend?.userExitStream.listen((_) => _handleExit());
    _actionSub = _backend?.uiActionStream.listen(_handleUiAction);
    _tracksChangedSub = _backend?.tracksChangedStream.listen(
      (_) => _onPlayerTracksChanged(),
    );
    _bringupSub = _manager.bringupStateStream.listen((state) {
      _pushMetadata();
      if (state.phase == PlaybackBringupPhase.ready) {
        _pushSubtitleStyle(force: true);
      }
      // A failure once the channel is playing means the manager's recovery
      // couldn't save the stream. The tune never sees it.
      if (state.phase == PlaybackBringupPhase.failed &&
          _channelIsUp &&
          !_exiting) {
        _channelIsUp = false;
        _showChannelFailed(_currentChannel.name);
      }
    });
    _lastClickpadPrefs = _clickpadPrefsSnapshot();
    _liveRecoverySub = _manager.liveRecoveryStatusStream.listen((status) {
      if (!mounted) return;
      unawaited(
        _backend?.setReconnecting(
              status == null
                  ? null
                  : AppLocalizations.of(
                      context,
                    ).liveReconnecting(status.attempt, status.maxAttempts),
            ) ??
            Future<void>.value(),
      );
    });
    _prefs.addListener(_onPrefsChanged);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pushSubtitleStyle();
      _pushThemeConfig();
      _playCurrentChannel();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.resumed) {
      unawaited(_carouselPrewarm?.onAppResumed());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppThemeController? controller;
    try {
      controller = AppThemeScope.of(context);
    } catch (_) {
      controller = null;
    }
    if (!identical(controller, _themeController)) {
      _themeController?.removeListener(_onThemeChanged);
      _themeController = controller;
      _themeController?.addListener(_onThemeChanged);
    }
  }

  void _onThemeChanged() => _pushThemeConfig();

  void _pushThemeConfig() {
    final backend = _backend;
    if (backend == null) return;
    unawaited(
      backend.setThemeConfig(
        isGlass: AppColorScheme.isGlass,
        accentARGB: AppColorScheme.accent.toARGB32(),
        surfaceARGB: AppColorScheme.surface.toARGB32(),
        surfaceVariantARGB: AppColorScheme.surfaceVariant.toARGB32(),
        onSurfaceARGB: AppColorScheme.onSurface.toARGB32(),
        rangeProgressARGB: AppColorScheme.rangeProgress.toARGB32(),
        rangeTrackARGB: AppColorScheme.rangeTrack.toARGB32(),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AppleTvLiveTvPlayerHostScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.channels, widget.channels)) _syncChannels();
  }

  @override
  void dispose() {
    userDataSync.removeListener(_onChannelUserDataChanged);
    _exitSub?.cancel();
    _actionSub?.cancel();
    _bringupSub?.cancel();
    _tracksChangedSub?.cancel();
    _screensaverPlayingSub?.cancel();
    _liveRecoverySub?.cancel();
    _schedulePushDebounce?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _carouselPrewarm?.dispose();
    _screensaverController?.setNativePlayerPresented(false);
    _themeController?.removeListener(_onThemeChanged);
    _prefs.removeListener(_onPrefsChanged);
    _guideTexture.dispose();
    if (PlatformDetection.isIOS) {
      _screensaverController?.setPlaybackActive(false);
      unawaited(SystemChrome.setPreferredOrientations([]));
    }
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    try {
      GetIt.instance<PlaybackManager>().stop(userInitiated: true);
    } catch (_) {}
    super.dispose();
  }

  String _clickpadPrefsSnapshot() =>
      _prefs.get(UserPreferences.appleTvClickpadSeekMode).name;

  void _onPrefsChanged() {
    final previous = _lastSubtitleStyle;
    _pushSubtitleStyle();
    final next = _clickpadPrefsSnapshot();
    final clickpadChanged = next != _lastClickpadPrefs;
    _lastClickpadPrefs = next;
    if (previous != _lastSubtitleStyle || clickpadChanged) _pushMetadata();
  }

  /// [force] pushes even when nothing changed, for a new stream or backend.
  void _pushSubtitleStyle({bool force = false}) {
    final backend = _backend;
    if (backend == null) return;
    try {
      final style = SubtitleStyle.forResolution(
        _prefs,
        _manager.currentResolution,
      );
      final appearance = (
        style,
        _prefs.get(UserPreferences.secondarySubtitleSizeAdjustment),
        _prefs.get(UserPreferences.secondarySubtitleOffsetPosition),
        _prefs.get(UserPreferences.secondarySubtitleTextColor),
      );
      final previous = _lastSubtitleStyle;
      if (!force && appearance == previous) return;
      _lastSubtitleStyle = appearance;
      if (!force && style == previous?.$1) return;
      backend.configureSubtitleStyle(
        textColor: style.textColor,
        backgroundColor: style.backgroundColor,
        strokeColor: style.strokeColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        verticalOffset: style.verticalOffset,
        strokeScale: style.strokeScale,
        shadowColor: style.shadowColor,
        shadowOffset: style.shadowOffset,
        shadowBlur: style.shadowBlur,
        fontFamily: style.fontFamily,
      );
    } catch (_) {}
  }

  Future<void> _playCurrentChannel() async {
    // A channel change starts a new stream, so whatever caption choice is
    // remembered has to be put back once this one reports its own captions.
    _captionTrackApplied = false;
    // Until the new channel is up, a failure belongs to the tune below.
    _channelIsUp = false;
    final channel = _currentChannel;
    unawaited(_prefs.set(UserPreferences.liveTvLastChannelId, channel.id));
    final item = AggregatedItem(
      id: channel.id,
      serverId: _client.baseUrl,
      rawData: channel.rawData,
    );
    final allowDirect = _prefs.get(UserPreferences.liveTvDirectPlayEnabled);
    final terminalState = await observeChannelTune(
      channelId: channel.id,
      states: _manager.bringupStateStream,
      timeout: channelTuneTimeout,
      start: () => _manager.playItems(
        [item],
        enableDirectPlay: allowDirect,
        // Always allowed, the same as the Flutter player. The remux keeps the
        // original codecs and arrives as HLS, which has the live window a raw
        // transport stream lacks.
        enableDirectStream: true,
        // Keep transcoding available as a fallback so a failed direct-play of
        // the upstream URL recovers to the server transcode instead of erroring.
        enableTranscoding: true,
      ),
    );
    if (!mounted || _exiting || _currentChannel.id != channel.id) return;
    _channelIsUp = terminalState?.phase == PlaybackBringupPhase.ready;
    if (!_channelIsUp) {
      _showChannelFailed(channel.name);
      return;
    }
    _pushMetadata();
    _warmSchedule();
  }

  /// The Flutter player's failure card, as an alert over the native player
  /// with the same Retry. Before the player is up, there's only Flutter to
  /// show it on.
  void _showChannelFailed(String channelName) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final message = l10n.failedToPlayChannel(channelName);
    final backend = _backend;
    if (backend != null && backend.isPlayerPresented && !_inGuide) {
      unawaited(
        backend.showMessage(
          message,
          actionLabel: l10n.retry,
          closeLabel: l10n.close,
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: l10n.retry,
          onPressed: () => unawaited(_retryCurrentChannel()),
        ),
      ),
    );
  }

  Future<void> _retryCurrentChannel() async {
    if (_switching || _exiting) return;
    _switching = true;
    try {
      await _playCurrentChannel();
    } finally {
      _switching = false;
    }
  }

  Future<void> _switchChannel(String channelId) async {
    if (_switching) return;
    final index = _syncedChannels.indexWhere((c) => c.id == channelId);
    if (index < 0 || index == _currentIndex) return;
    _switching = true;
    try {
      _currentIndex = index;
      _readSchedule();
      _pushMetadata();
      await _playCurrentChannel();
    } finally {
      _switching = false;
    }
  }

  /// Opens the guide with the channel still playing in its mini player, the
  /// way the Flutter player shrinks its video into that box. The player steps
  /// off screen and hands its picture over, so nothing is tuned again and
  /// closing the guide puts the same stream back.
  Future<void> _enterGuideMode() async {
    final backend = _backend;
    if (backend == null || _inGuide || _switching || _exiting) return;
    _inGuide = true;
    _guideTexture.value = await backend.suspendPlayer();
    if (!mounted) {
      _inGuide = false;
      return;
    }

    String? selectedId;
    try {
      selectedId = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (_) => LiveTvGuideScreen(
            miniPlayerMode: true,
            currentChannel: _currentChannel,
            appleTvTextureId: _guideTexture,
          ),
        ),
      );
    } finally {
      _guideTexture.value = null;
      _inGuide = false;
    }

    if (!mounted || _exiting) return;
    await backend.resumePlayer();
    if (selectedId != null) await _switchChannel(selectedId);
  }

  /// The recording dialogs are the Flutter player's own, so the native player
  /// steps aside for them with the channel still playing behind.
  Future<void> _showRecordingDialog() async {
    final backend = _backend;
    final program = _currentProgram;
    if (backend == null ||
        program == null ||
        !canRecordAiring(program) ||
        _recordingFlow ||
        _inGuide ||
        _switching ||
        _exiting) {
      return;
    }
    final l10n = AppLocalizations.of(context);
    _recordingFlow = true;
    final texture = await backend.suspendPlayer();
    String? message;
    try {
      if (!mounted) return;
      setState(() => _recordingTexture = texture);
      final timers = await _client.liveTvApi.getTimers();
      if (!mounted) return;
      message = await runLiveTvRecordingFlow(
        context: context,
        liveTvApi: _client.liveTvApi,
        program: program,
        recording: LiveTvRecordingState.fromProgram(
          program.rawData,
          (timers['Items'] as List?) ?? const [],
        ),
        programTime:
            '${_clock(program.startDate)} – ${_clock(program.endDate)}',
        channel: recordPromptChannel(
          _currentChannel.number,
          _currentChannel.name,
        ),
        use24HourClock: _prefs.get(UserPreferences.use24HourClock),
        stillOnProgram: () =>
            mounted && !_exiting && _currentProgram?.id == program.id,
      );
    } catch (_) {
      message = l10n.failedToLoadRecordings;
    } finally {
      _recordingFlow = false;
      if (mounted && !_exiting) {
        setState(() => _recordingTexture = null);
        await backend.resumePlayer();
        if (message != null) {
          unawaited(backend.showMessage(message, closeLabel: l10n.close));
        }
      }
    }
  }

  String _clock(DateTime time) => formatClockTime(
    time,
    use24Hour: _prefs.get(UserPreferences.use24HourClock),
  );

  // The native player on iOS sits over this route, and iOS asks the Flutter
  // view which way it may turn, so the lock has to be set here as well.
  Future<void> _applyOrientationLock() => SystemChrome.setPreferredOrientations(
    _orientationLocked
        ? const [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]
        : const [],
  );

  void _warmSchedule() {
    if (_syncedChannels.isEmpty) return;
    var prewarm = _carouselPrewarm;
    if (prewarm == null) {
      prewarm = ChannelCarouselPrewarm(_client);
      prewarm.viewModel.addListener(_onScheduleChanged);
      _carouselPrewarm = prewarm;
    }
    prewarm.tuned(_syncedChannels, _currentChannel.id);
  }

  /// The schedule notifies several times a second while artwork loads, and
  /// each push sends the whole lineup, so a burst becomes one push.
  void _onScheduleChanged() {
    _schedulePushDebounce?.cancel();
    _schedulePushDebounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      _readSchedule();
      _pushMetadata();
    });
  }

  /// Reads what is airing now out of the loaded schedule. Nothing is fetched
  /// here, so a boundary the schedule already covers costs nothing.
  void _readSchedule() {
    final viewModel = _carouselPrewarm?.viewModel;
    if (viewModel == null) return;
    final currentId = _currentChannel.id;
    for (final channel in _syncedChannels) {
      final program = viewModel.nowNextForChannel(channel.id).now;
      if (program != null) _nowPlayingByChannel[channel.id] = program;
      if (channel.id == currentId) _currentProgram = program;
    }
  }

  String _channelLogoUrl(GuideChannel channel) {
    final cached = _logoUrlCache[channel.id];
    if (cached != null) return cached;
    return _logoUrlCache[channel.id] = _buildLogoUrl(channel);
  }

  String _buildLogoUrl(GuideChannel channel) {
    final tag = channel.imageTag;
    if (tag == null || tag.isEmpty) return '';
    try {
      return _client.imageApi.getPrimaryImageUrl(
        channel.id,
        maxHeight: 160,
        tag: tag,
      );
    } catch (_) {
      return '';
    }
  }

  /// One carousel card per channel, fully resolved. The native strip does no
  /// fetching and no formatting, so every label is built here where the
  /// localizations are.
  List<Map<String, dynamic>> _channelListPayload() {
    final viewModel = _carouselPrewarm?.viewModel;
    final currentId = _currentChannel.id;
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    return [
      for (final channel in _syncedChannels)
        {
          'id': channel.id,
          'number': channel.number ?? '',
          'name': channel.name,
          'logoUrl': _channelLogoUrl(channel),
          'isFavorite': channel.isFavorite,
          'selected': channel.id == currentId,
          ..._programPayload(
            _nowPlayingByChannel[channel.id],
            viewModel?.loadStateFor(channel.id) == GuideChannelLoadState.loaded,
            l10n,
            now,
          ),
        },
    ];
  }

  Map<String, dynamic> _programPayload(
    GuideProgram? program,
    bool scheduleLoaded,
    AppLocalizations l10n,
    DateTime now,
  ) {
    if (program == null) {
      return {
        'programName': '',
        'episodeTitle': '',
        'overview': '',
        'seasonEpisode': '',
        'timeLabel': '',
        'rating': '',
        'tags': const <String>[],
        'genre': '',
        'isLive': false,
        'progress': 0.0,
        'hasTimer': false,
        'programLoading': !scheduleLoaded,
      };
    }
    final seasonEpisode = program.seasonEpisodeLabel;
    return {
      'programName': program.name,
      'episodeTitle': program.episodeTitle ?? '',
      'overview': program.overview ?? '',
      'seasonEpisode': seasonEpisode == null ? '' : ' ($seasonEpisode)',
      'timeLabel': _timeRange(program),
      'rating': program.officialRating ?? '',
      'tags': _categoryLabels(program, l10n),
      'genre': _genreKey(program),
      'isLive': true,
      'progress': program.progressAt(now),
      'hasTimer': program.hasTimer,
      'hasSeriesTimer': program.hasSeriesTimer,
      'programLoading': false,
    };
  }

  String _timeRange(GuideProgram program) =>
      '${TimeOfDay.fromDateTime(program.startDate).format(context)} - '
      '${TimeOfDay.fromDateTime(program.endDate).format(context)}';

  /// The card tints itself from this, so the five genres the guide cells use
  /// are named rather than sent as colors.
  String _genreKey(GuideProgram program) {
    if (program.isMovie) return 'movie';
    if (program.isSports) return 'sports';
    if (program.isNews) return 'news';
    if (program.isKids) return 'kids';
    if (program.isSeries) return 'series';
    return 'none';
  }

  List<String> _categoryLabels(GuideProgram program, AppLocalizations l10n) {
    return [
      for (final tag in program.categoryTags)
        switch (tag) {
          GuideFilter.all => l10n.all,
          GuideFilter.movies => l10n.movies,
          GuideFilter.series => l10n.series,
          GuideFilter.sports => l10n.sports,
          GuideFilter.news => l10n.news,
          GuideFilter.kids => l10n.kids,
          GuideFilter.premiere => l10n.premiere,
          GuideFilter.favorites => l10n.favorites,
        },
    ];
  }

  Map<String, dynamic>? _liveProgramPayload() {
    final program = _currentProgram;
    if (program == null) return null;
    return {
      'name': program.name,
      'episodeTitle': program.episodeTitle ?? '',
      'startMs': program.startDate.millisecondsSinceEpoch,
      'endMs': program.endDate.millisecondsSinceEpoch,
      'hasTimer': program.hasTimer,
      'hasSeriesTimer': program.hasSeriesTimer,
      'episodeLine': program.episodeLine,
    };
  }

  /// What the record button shows, present while the airing on now can be
  /// recorded. Since it's on now, a timer of its own means it's recording.
  Map<String, dynamic>? _liveRecordPayload() {
    final program = _currentProgram;
    if (program == null || !canRecordAiring(program)) return null;
    return {'series': program.hasSeriesTimer, 'timer': program.hasTimer};
  }

  List<Map<String, dynamic>> _streamStatsPayload() {
    final resolution = _manager.currentResolution;
    final streams = resolution?.mediaStreams ?? const <Map<String, dynamic>>[];

    Map<String, dynamic>? pickStream(String type, int? preferredIndex) {
      if (preferredIndex != null && preferredIndex >= 0) {
        final preferred = streams
            .where((s) => s['Type'] == type)
            .firstWhere(
              (s) => s['Index'] == preferredIndex,
              orElse: () => const <String, dynamic>{},
            );
        if (preferred.isNotEmpty) return preferred;
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

    final audioCodec = ((audioStream?['Codec'] as String?) ?? '')
        .trim()
        .toUpperCase();
    final audioChannels = _formatChannels(audioStream?['Channels'] as int?);
    final audioLabel = audioStream == null
        ? 'Unknown'
        : (audioChannels.isEmpty ? audioCodec : '$audioCodec $audioChannels')
              .trim();

    final bitrate = videoStream?['BitRate'] as int?;
    final bitrateLabel = (bitrate == null || bitrate <= 0)
        ? 'Unknown'
        : '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';

    final subtitleLabel = subtitleStream == null
        ? 'Off'
        : ((subtitleStream['DisplayTitle'] as String?)?.trim().isNotEmpty ==
                  true
              ? (subtitleStream['DisplayTitle'] as String).trim()
              : (subtitleStream['Language'] as String?)?.trim() ?? 'On');

    return [
      {'label': 'Audio', 'value': audioLabel},
      {'label': 'Bitrate', 'value': bitrateLabel},
      {'label': 'Subtitles', 'value': subtitleLabel},
    ];
  }

  String _formatChannels(int? channels) {
    return switch (channels) {
      null => '',
      8 => '7.1',
      6 => '5.1',
      2 => 'Stereo',
      1 => 'Mono',
      _ => '${channels}ch',
    };
  }

  List<Map<String, dynamic>> _liveStreamInfoSections() {
    final resolution = _manager.currentResolution;
    final channel = _currentChannel;
    return buildPlaybackInfoSections(
      l10n: AppLocalizations.of(context),
      resolution: resolution,
      mediaStreams: resolution?.mediaStreams ?? const <Map<String, dynamic>>[],
      audioStreamIndex: _manager.audioStreamIndex,
      // A caption track isn't a server stream, so it gets no Subtitles section.
      subtitleStreamIndex: _captionTrackId == null
          ? _manager.subtitleStreamIndex
          : -1,
      transcodeForced: transcodeForcedBySettings(_manager),
      qualityLimitMbps: userQualityLimitMbps(
        _manager.maxBitrateOverrideMbps,
        _prefs.get(UserPreferences.maxBitrate),
      ),
      channel: channel.number == null
          ? channel.name
          : '${channel.number} ${channel.name}',
      program: _currentProgram?.name,
      player: 'AetherEngine',
      device: _deviceLabel,
      audioRoute: playbackAudioRoute(resolution?.mediaSourceId),
    );
  }

  void _pushMetadata() {
    final backend = _backend;
    if (backend == null || !mounted) return;
    final channel = _currentChannel;

    final audioStreams =
        (_manager.currentResolution?.mediaStreams ??
                const <Map<String, dynamic>>[])
            .where((s) => s['Type'] == 'Audio')
            .toList();
    final subtitleStreams =
        (_manager.currentResolution?.mediaStreams ??
                const <Map<String, dynamic>>[])
            .where((s) => s['Type'] == 'Subtitle')
            .toList();

    backend.setUiMetadata(
      topTitle: channel.name,
      topSubtitle: _currentProgram?.name ?? '',
      chapters: const [],
      hasPrevious: false,
      hasNext: false,
      skipForwardMs: _prefs.get(UserPreferences.skipForwardLength),
      skipBackMs: _prefs.get(UserPreferences.skipBackLength),
      clickpadSeekMode: _prefs.get(UserPreferences.appleTvClickpadSeekMode),
      audioTracks: _trackOptions(audioStreams, _manager.audioStreamIndex),
      subtitleTracks: [
        ..._trackOptions(
          subtitleStreams,
          // A caption choice turns the server-stream selection off, so its
          // row must not stay marked as the active one.
          _captionTrackId == null ? _manager.subtitleStreamIndex : null,
        ),
        ..._captionTrackOptions(),
      ],
      subtitleControls: appleTvSubtitleMetadata(
        manager: _manager,
        prefs: _prefs,
        l10n: AppLocalizations.of(context),
        // Live TV uses a single subtitle menu, so skip the Primary/Secondary chooser.
        tracks: const [],
      ),
      streamInfoSections: _liveStreamInfoSections(),
      streamInfoTitle: AppLocalizations.of(context).playbackInformation,
      streamInfoDroppedFramesLabel: AppLocalizations.of(
        context,
      ).playbackInfoDroppedFrames,
      selectedBitrateMbps: _manager.maxBitrateOverrideMbps ?? -1,
      isLive: true,
      liveProgram: _liveProgramPayload(),
      liveRecord: _liveRecordPayload(),
      orientationLocked: PlatformDetection.isIOS ? _orientationLocked : null,
      liveChannelNumber: channel.number ?? '',
      canFavorite: true,
      isFavorite: channel.isFavorite,
      channelList: _channelListPayload(),
      streamStats: _streamStatsPayload(),
      osdButtons: visibleOsdButtonIds(_prefs),
      transportDocked: nativeTransportDocked(_prefs),
    );
  }

  List<Map<String, dynamic>> _trackOptions(
    List<Map<String, dynamic>> streams,
    int? selectedIndex,
  ) {
    final options = <Map<String, dynamic>>[];
    for (final s in streams) {
      final index = (s['Index'] as int?) ?? -1;
      final label =
          s['DisplayTitle'] as String? ??
          s['Title'] as String? ??
          s['Language'] as String? ??
          'Track';
      final codec = (s['Codec'] as String?)?.toUpperCase() ?? '';
      options.add({
        'index': index,
        'label': label,
        'subtitle': codec,
        'selected': index == selectedIndex,
      });
    }
    return options;
  }

  /// Caption rows follow the server streams in the native menu, carrying a
  /// sentinel index the selection handler maps back to the backend's own
  /// caption id.
  List<Map<String, dynamic>> _captionTrackOptions() {
    final l10n = AppLocalizations.of(context);
    return [
      for (final track in _backend?.embeddedCaptionTracks ??
          const <EmbeddedCaptionTrack>[])
        {
          'index': _ccMenuIndexBase + track.id,
          'label': track.label,
          'subtitle': track.language ?? l10n.embedded,
          'selected': track.id == _captionTrackId,
        },
    ];
  }

  /// Refreshes the native menu once the player reports what it found, and
  /// puts a caption choice back after a channel change, which starts a new
  /// stream and drops every track selection with it.
  void _onPlayerTracksChanged() {
    if (!mounted) return;
    final tracks = _backend?.embeddedCaptionTracks ?? const [];
    if (tracks.isEmpty) {
      _captionTrackApplied = false;
    } else if (!_captionTrackApplied &&
        tracks.any((track) => track.id == _captionTrackId)) {
      _captionTrackApplied = true;
      unawaited(
        _backend?.setEmbeddedCaptionTrack(_captionTrackId!) ??
            Future<void>.value(),
      );
    }
    _pushMetadata();
  }

  void _handleUiAction(Map<String, dynamic> action) {
    final subtitleAction = handleAppleTvSubtitleAction(
      action,
      _manager,
      _prefs,
    );
    if (subtitleAction != null) {
      unawaited(subtitleAction.then((_) {
        if (mounted) _pushMetadata();
      }));
      return;
    }
    switch (action['event']?.toString()) {
      case 'play':
        unawaited(_manager.resume());
      case 'pause':
        unawaited(_manager.pause());
      case 'openGuide':
        unawaited(_enterGuideMode());
        return;
      case 'guideButton':
        _onGuideButton();
        return;
      case 'record':
        unawaited(_showRecordingDialog());
        return;
      case 'toggleFavorite':
        unawaited(_toggleChannelFavorite());
        return;
      case 'messageAction':
        unawaited(_retryCurrentChannel());
        return;
      case 'toggleOrientation':
        _orientationLocked = !_orientationLocked;
        unawaited(_applyOrientationLock());
      case 'setBitrate':
        final mbps = (action['mbps'] as num?)?.toInt();
        unawaited(
          _manager.changeBitrate(mbps == null || mbps < 0 ? null : mbps),
        );
      case 'selectChannel':
        final id = action['channelId']?.toString();
        if (id != null && id.isNotEmpty) {
          unawaited(_switchChannel(id));
        }
      case 'selectAudio':
        final index = (action['index'] as num?)?.toInt();
        if (index != null) {
          unawaited(_manager.changeAudioTrack(index));
        }
      case 'selectSubtitle':
        final index = (action['index'] as num?)?.toInt();
        if (index == null) break;
        _captionTrackId = null;
        _captionTrackApplied = false;
        if (index >= _ccMenuIndexBase) {
          _captionTrackId = index - _ccMenuIndexBase;
          _captionTrackApplied = true;
          unawaited(
            _backend?.setEmbeddedCaptionTrack(index - _ccMenuIndexBase) ??
                Future<void>.value(),
          );
        } else if (index < 0) {
          unawaited(_manager.disableSubtitles());
        } else {
          unawaited(_manager.changeSubtitleTrack(index));
        }
    }
    Future<void>.delayed(const Duration(milliseconds: 300), _pushMetadata);
  }

  void _onChannelUserDataChanged() {
    if (!mounted) return;
    final updated = GuideChannel.withSyncedUserDataAll(_syncedChannels);
    if (updated == null) return;
    // The native carousel and channel buttons follow this order, so it sorts
    // the way the guide and the Flutter carousel do.
    if (_carouselPrewarm?.viewModel.sortBy == ChannelSortBy.favoritesFirst) {
      final currentId = _currentChannel.id;
      updated.sort(
        LiveTvGuideViewModel.comparatorFor(ChannelSortBy.favoritesFirst),
      );
      _currentIndex = updated.indexWhere((c) => c.id == currentId);
    }
    _syncedChannels = updated;
    _pushMetadata();
  }

  /// setFavorite flips the synced flag at once, and the user data listener
  /// pushes the new heart. A failed request flips it back the same way.
  Future<void> _toggleChannelFavorite() async {
    final channel = _currentChannel;
    try {
      await ItemMutationRepository(
        _client,
      ).setFavorite(channel.id, isFavorite: !channel.isFavorite);
    } catch (_) {
      final backend = _backend;
      if (!mounted || backend == null) return;
      final l10n = AppLocalizations.of(context);
      unawaited(
        backend.showMessage(
          l10n.failedToUpdateFavoriteChannel,
          closeLabel: l10n.close,
        ),
      );
    }
  }

  /// The remote's Guide button closes the player's own guide, or else leaves
  /// the player for the full guide.
  void _onGuideButton() {
    if (!mounted || _exiting || _recordingFlow || _switching) return;
    final navigator = Navigator.of(context);
    if (_inGuide) {
      final hostRoute = ModalRoute.of(context);
      navigator.popUntil((route) => route == hostRoute);
      return;
    }
    _exiting = true;
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    final router = GoRouter.of(context);
    final matches = router.routerDelegate.currentConfiguration.matches;
    final below = matches.length < 2
        ? null
        : matches[matches.length - 2].matchedLocation;
    navigator.pop();
    // A player opened from the guide is already back there once it closes.
    if (below != Destinations.liveTvGuide) {
      unawaited(router.push(Destinations.liveTvGuide));
    }
  }

  void _handleExit() {
    if (_exiting || _inGuide || !mounted) return;
    _exiting = true;
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    if (context.canPop()) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final texture = _recordingTexture;
    return Scaffold(
      backgroundColor: Colors.black,
      body: texture == null
          ? const SizedBox.expand()
          : FittedBox(
              child: SizedBox(
                width: 1920,
                height: 1080,
                child: Texture(textureId: texture),
              ),
            ),
    );
  }
}
