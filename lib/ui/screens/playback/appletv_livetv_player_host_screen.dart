import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../playback/subtitle_style.dart';
import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../playback/appletv_backend.dart';
import '../../../playback/appletv_preview_player.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/play_method_label.dart';
import '../livetv/live_tv_guide_screen.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../theme/app_theme_controller.dart';
import '../../widgets/live_tv/channel_carousel_overlay.dart';
import 'osd_buttons.dart';

class AppleTvLiveTvPlayerHostScreen extends StatefulWidget {
  final List<GuideChannel> channels;
  final int startIndex;
  // Only honored for the very first channel this screen plays; zapping to a
  // different channel afterwards always resolves the server-default source.
  final String? initialMediaSourceId;

  const AppleTvLiveTvPlayerHostScreen({
    super.key,
    required this.channels,
    required this.startIndex,
    this.initialMediaSourceId,
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

  StreamSubscription<void>? _exitSub;
  StreamSubscription<Map<String, dynamic>>? _actionSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;

  late int _currentIndex;
  String? _pendingInitialMediaSourceId;
  bool _exiting = false;
  bool _switching = false;
  bool _inGuide = false;
  AppleTvPreviewPlayer? _pipPlayer;

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

  AppleTvBackend? get _backend {
    try {
      return GetIt.instance<AppleTvBackend>();
    } catch (_) {
      return null;
    }
  }

  GuideChannel get _currentChannel => widget.channels[_currentIndex];

  @override
  void initState() {
    super.initState();
    try {
      _screensaverController = GetIt.instance<ScreensaverController>();
    } catch (_) {}
    _screensaverController?.setNativePlayerPresented(true);
    _currentIndex = widget.startIndex;
    _pendingInitialMediaSourceId = widget.initialMediaSourceId;
    _exitSub = _backend?.userExitStream.listen((_) => _handleExit());
    _actionSub = _backend?.uiActionStream.listen(_handleUiAction);
    _tracksChangedSub = _backend?.tracksChangedStream.listen(
      (_) => _onPlayerTracksChanged(),
    );
    _bringupSub = _manager.bringupStateStream.listen((_) => _pushMetadata());
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
  void dispose() {
    _exitSub?.cancel();
    _actionSub?.cancel();
    _bringupSub?.cancel();
    _tracksChangedSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _carouselPrewarm?.dispose();
    _screensaverController?.setNativePlayerPresented(false);
    _themeController?.removeListener(_onThemeChanged);
    unawaited(_pipPlayer?.dispose());
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    try {
      GetIt.instance<PlaybackManager>().stop(userInitiated: true);
    } catch (_) {}
    super.dispose();
  }

  void _pushSubtitleStyle() {
    final backend = _backend;
    if (backend == null) return;
    try {
      final style = SubtitleStyle.forResolution(
        _prefs,
        _manager.currentResolution,
      );
      backend.configureSubtitleStyle(
        textColor: style.textColor,
        backgroundColor: style.backgroundColor,
        strokeColor: style.strokeColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        verticalOffset: style.verticalOffset,
      );
    } catch (_) {}
  }

  Future<void> _playCurrentChannel() async {
    // A channel change starts a new stream, so whatever caption choice is
    // remembered has to be put back once this one reports its own captions.
    _captionTrackApplied = false;
    final channel = _currentChannel;
    unawaited(_prefs.set(UserPreferences.liveTvLastChannelId, channel.id));
    final item = AggregatedItem(
      id: channel.id,
      serverId: _client.baseUrl,
      rawData: channel.rawData,
    );
    final allowDirect = _prefs.get(UserPreferences.liveTvDirectPlayEnabled);
    final mediaSourceId = _pendingInitialMediaSourceId;
    _pendingInitialMediaSourceId = null;
    try {
      await _manager.playItems(
        [item],
        mediaSourceId: mediaSourceId,
        enableDirectPlay: allowDirect,
        enableDirectStream: allowDirect,
        // Keep transcoding available as a fallback so a failed direct-play of
        // the upstream URL recovers to the server transcode instead of erroring.
        enableTranscoding: true,
      );
    } catch (_) {
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
    _pushMetadata();
    _warmSchedule();
  }

  Future<void> _switchChannel(String channelId) async {
    if (_switching) return;
    final index = widget.channels.indexWhere((c) => c.id == channelId);
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

  Future<void> _enterGuideMode() async {
    if (_inGuide || _switching || _exiting) return;
    _inGuide = true;

    // The guide PiP is an AVPlayer texture, which can only ingest HLS. A raw
    // TS/upstream direct-play URL would fail to open, so skip the PiP for
    // those and let the guide show the channel image instead.
    final resolvedUrl = _manager.currentResolution?.streamUrl;
    final streamUrl =
        (resolvedUrl != null && resolvedUrl.toLowerCase().contains('.m3u8'))
        ? resolvedUrl
        : null;

    final pip = AppleTvPreviewPlayer();
    _pipPlayer = pip;

    // Dismiss the native player first for instant feedback, then open the PIP
    // in the background: the guide appears immediately with the channel image
    // and the live video swaps in reactively once the texture is ready, so a
    // slow or session-conflicting live stream never blocks the transition.
    await _backend?.dismissPlayer();
    if (streamUrl != null && streamUrl.isNotEmpty) {
      unawaited(() async {
        try {
          await pip.open(streamUrl, live: true, volume: 100);
          await pip.resume();
        } catch (_) {}
      }());
    }

    if (!mounted) {
      await pip.dispose();
      _pipPlayer = null;
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
            appleTvTextureId: pip.textureIdListenable,
          ),
        ),
      );
    } finally {
      await pip.stop();
      await pip.dispose();
      _pipPlayer = null;
      _inGuide = false;
    }

    if (!mounted) return;
    if (selectedId != null && selectedId != _currentChannel.id) {
      final idx = widget.channels.indexWhere((c) => c.id == selectedId);
      if (idx >= 0) {
        _currentIndex = idx;
        _readSchedule();
      }
    }
    await _playCurrentChannel();
  }

  void _warmSchedule() {
    if (widget.channels.isEmpty) return;
    var prewarm = _carouselPrewarm;
    if (prewarm == null) {
      prewarm = ChannelCarouselPrewarm(_client);
      prewarm.viewModel.addListener(_onScheduleChanged);
      _carouselPrewarm = prewarm;
    }
    prewarm.tuned(widget.channels, _currentChannel.id);
  }

  void _onScheduleChanged() {
    if (!mounted) return;
    _readSchedule();
    _pushMetadata();
  }

  /// Reads what is airing now out of the loaded schedule. Nothing is fetched
  /// here, so a boundary the schedule already covers costs nothing.
  void _readSchedule() {
    final viewModel = _carouselPrewarm?.viewModel;
    if (viewModel == null) return;
    final currentId = _currentChannel.id;
    for (final channel in widget.channels) {
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
      for (final channel in widget.channels)
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
      'hasTimer': program.hasTimer || program.hasSeriesTimer,
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
    };
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
    final streams = resolution?.mediaStreams ?? const <Map<String, dynamic>>[];
    final channel = _currentChannel;
    final channelLabel = channel.number == null
        ? channel.name
        : '${channel.number} ${channel.name}';

    Map<String, dynamic> row(String label, String value) {
      return {'label': label, 'value': value};
    }

    final sections = <Map<String, dynamic>>[];
    void addSection(String title, List<Map<String, dynamic>> rows) {
      if (rows.isEmpty) return;
      sections.add({'title': title, 'rows': rows});
    }

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

    final playMethod = playbackMethodLabel(
          l10n: AppLocalizations.of(context),
          playMethod: resolution?.playMethod,
          transcodingReasons: resolution?.transcodingReasons ?? const [],
        );
    final container = (resolution?.container ?? '').trim().toUpperCase().isEmpty
        ? 'Unknown'
        : (resolution?.container ?? '').trim().toUpperCase();

    addSection('Playback', [
      row('Channel', channelLabel),
      if (_currentProgram?.name.isNotEmpty == true)
        row('Program', _currentProgram!.name),
      row('Play Method', playMethod),
      if (resolution != null && resolution.transcodingReasons.isNotEmpty)
        row('Transcode Reasons', resolution.transcodingReasons.join(', ')),
      row('Player', 'AetherEngine'),
      row('Container', container),
    ]);

    if (videoStream != null) {
      final fps = videoStream['RealFrameRate'] as num?;
      final width = videoStream['Width'];
      final height = videoStream['Height'];
      final codec = ((videoStream['Codec'] as String?) ?? 'Unknown')
          .toUpperCase();
      addSection('Video', [
        row(
          'Resolution',
          '${width ?? '?'}x${height ?? '?'}${fps != null ? ' @ ${fps.round()}fps' : ''}',
        ),
        row(
          'HDR',
          (videoStream['VideoRangeType'] as String?) ??
              (videoStream['VideoRange'] as String?) ??
              'SDR',
        ),
        row('Codec', codec),
      ]);
    }

    if (audioStream != null) {
      addSection('Audio', [
        row(
          'Track',
          audioStream['DisplayTitle'] as String? ??
              audioStream['Language'] as String? ??
              'Unknown',
        ),
        row(
          'Codec',
          ((audioStream['Codec'] as String?) ?? 'Unknown').toUpperCase(),
        ),
        row('Channels', _formatChannels(audioStream['Channels'] as int?)),
      ]);
    }

    return sections;
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
      skipForwardMs: 0,
      skipBackMs: 0,
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
      streamInfoSections: _liveStreamInfoSections(),
      isLive: true,
      liveProgram: _liveProgramPayload(),
      liveChannelNumber: channel.number ?? '',
      channelList: _channelListPayload(),
      streamStats: _streamStatsPayload(),
      osdButtons: visibleOsdButtonIds(_prefs),
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
    switch (action['event']?.toString()) {
      case 'play':
        unawaited(_manager.resume());
      case 'pause':
        unawaited(_manager.pause());
      case 'openGuide':
        unawaited(_enterGuideMode());
        return;
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
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(),
    );
  }
}
