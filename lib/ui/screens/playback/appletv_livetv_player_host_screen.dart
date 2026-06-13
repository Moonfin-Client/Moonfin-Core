import 'dart:async';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../playback/appletv_mpv_backend.dart';
import '../../../playback/appletv_preview_player.dart';
import '../../../preference/user_preferences.dart';
import '../../../l10n/app_localizations.dart';
import '../livetv/live_tv_guide_screen.dart';

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
    extends State<AppleTvLiveTvPlayerHostScreen> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();

  StreamSubscription<void>? _exitSub;
  StreamSubscription<Map<String, dynamic>>? _actionSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;

  late int _currentIndex;
  bool _exiting = false;
  bool _switching = false;
  bool _inGuide = false;
  AppleTvPreviewPlayer? _pipPlayer;
  Timer? _programRefreshTimer;

  GuideProgram? _currentProgram;
  final Map<String, String> _nowPlayingByChannel = {};
  List<Map<String, dynamic>>? _channelListCache;
  bool _sweepInFlight = false;

  AppleTvMpvBackend? get _backend {
    try {
      return GetIt.instance<AppleTvMpvBackend>();
    } catch (_) {
      return null;
    }
  }

  GuideChannel get _currentChannel => widget.channels[_currentIndex];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.startIndex;
    _exitSub = _backend?.userExitStream.listen((_) => _handleExit());
    _actionSub = _backend?.uiActionStream.listen(_handleUiAction);
    _bringupSub = _manager.bringupStateStream.listen((_) => _pushMetadata());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pushSubtitleStyle();
      _playCurrentChannel();
      _fetchAllNowPlaying();
    });
    _startProgramRefresh();
  }

  @override
  void dispose() {
    _exitSub?.cancel();
    _actionSub?.cancel();
    _bringupSub?.cancel();
    _programRefreshTimer?.cancel();
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
      backend.configureSubtitleStyle(
        textColor: _prefs.get(UserPreferences.subtitlesTextColor),
        backgroundColor: _prefs.get(UserPreferences.subtitlesBackgroundColor),
        strokeColor: _prefs.get(UserPreferences.subtitleTextStrokeColor),
        fontSize: _prefs.get(UserPreferences.subtitlesTextSize),
        fontWeight: _prefs.get(UserPreferences.subtitlesTextWeight),
        verticalOffset: _prefs.get(UserPreferences.subtitlesOffsetPosition),
      );
    } catch (_) {}
  }

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
        enableTranscoding: !allowDirect,
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
    _fetchCurrentProgram();
  }

  Future<void> _switchChannel(String channelId) async {
    if (_switching) return;
    final index = widget.channels.indexWhere((c) => c.id == channelId);
    if (index < 0 || index == _currentIndex) return;
    _switching = true;
    try {
      _currentIndex = index;
      _currentProgram = null;
      _pushMetadata();
      await _playCurrentChannel();
    } finally {
      _switching = false;
    }
  }

  Future<void> _enterGuideMode() async {
    if (_inGuide || _switching || _exiting) return;
    _inGuide = true;

    final streamUrl = _manager.currentResolution?.streamUrl;

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
          await pip.open(streamUrl, backend: 'mpv', live: true, volume: 100);
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
        _currentProgram = null;
      }
    }
    await _playCurrentChannel();
  }

  void _startProgramRefresh() {
    _programRefreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _fetchCurrentProgram();
      _fetchAllNowPlaying();
    });
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
        final start = DateTime.tryParse(raw['StartDate']?.toString() ?? '')
            ?.toLocal();
        final end = DateTime.tryParse(raw['EndDate']?.toString() ?? '')
            ?.toLocal();
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
      if (_currentChannel.id != channelId) return;

      _currentProgram = GuideProgram(
        id: selected['Id']?.toString() ?? '',
        channelId: channelId,
        name: selected['Name']?.toString() ?? '',
        startDate: selectedStart,
        endDate: selectedEnd,
        overview: selected['Overview'] as String?,
        episodeTitle: selected['EpisodeTitle'] as String?,
        isMovie: selected['IsMovie'] == true,
        isSeries: selected['IsSeries'] == true,
        isSports: selected['IsSports'] == true,
        isNews: selected['IsNews'] == true,
        isKids: selected['IsKids'] == true,
        isPremiere: selected['IsPremiere'] == true,
        hasTimer: selected['TimerId'] != null,
        rawData: selected,
      );
      _pushMetadata();
    } catch (_) {}
  }

  Future<void> _fetchAllNowPlaying() async {
    if (_sweepInFlight) return;
    final allIds = widget.channels.map((c) => c.id).toList();
    if (allIds.isEmpty) return;
    _sweepInFlight = true;
    try {
      const chunkSize = 50;
      for (var i = 0; i < allIds.length; i += chunkSize) {
        if (!mounted) return;
        final chunk = allIds.sublist(i, min(i + chunkSize, allIds.length));
        final now = DateTime.now();
        final response = await _client.liveTvApi.getGuide(
          startDate: now.subtract(const Duration(minutes: 5)),
          endDate: now.add(const Duration(minutes: 5)),
          channelIds: chunk,
          enableTotalRecordCount: false,
          userId: _client.userId,
        );
        final items = (response['Items'] as List?) ?? [];
        for (final item in items) {
          final raw = item as Map<String, dynamic>;
          final channelId = raw['ChannelId']?.toString();
          if (channelId == null) continue;
          final start = DateTime.tryParse(raw['StartDate']?.toString() ?? '')
              ?.toLocal();
          final end = DateTime.tryParse(raw['EndDate']?.toString() ?? '')
              ?.toLocal();
          if (start == null || end == null) continue;
          if (!now.isBefore(start) && now.isBefore(end)) {
            _nowPlayingByChannel[channelId] = raw['Name']?.toString() ?? '';
          }
        }
        if (!mounted) return;
        _pushMetadata();
      }
    } catch (_) {
    } finally {
      _sweepInFlight = false;
    }
  }

  String _channelLogoUrl(GuideChannel channel) {
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

  List<Map<String, dynamic>> _channelListPayload() {
    final cache =
        _channelListCache ??= [
          for (final channel in widget.channels)
            {
              'id': channel.id,
              'number': channel.number ?? '',
              'name': channel.name,
              'logoUrl': _channelLogoUrl(channel),
              'programName': '',
              'selected': false,
            },
        ];
    final currentId = _currentChannel.id;
    for (final entry in cache) {
      final id = entry['id'] as String;
      entry['programName'] = _nowPlayingByChannel[id] ?? '';
      entry['selected'] = id == currentId;
    }
    return cache;
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

    final audioCodec =
        ((audioStream?['Codec'] as String?) ?? '').trim().toUpperCase();
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
        : ((subtitleStream['DisplayTitle'] as String?)?.trim().isNotEmpty == true
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

    final playMethod = resolution != null
        ? _prettyPlayMethod(resolution.playMethod.name)
        : 'Unknown';
    final container =
        (resolution?.container ?? '').trim().toUpperCase().isEmpty
        ? 'Unknown'
        : (resolution?.container ?? '').trim().toUpperCase();

    addSection('Playback', [
      row('Channel', channelLabel),
      if (_currentProgram?.name.isNotEmpty == true)
        row('Program', _currentProgram!.name),
      row('Play Method', playMethod),
      if (resolution != null && resolution.transcodingReasons.isNotEmpty)
        row('Transcode Reasons', resolution.transcodingReasons.join(', ')),
      row('Player', 'MPVKit (libmpv)'),
      row('Container', container),
    ]);

    if (videoStream != null) {
      final fps = videoStream['RealFrameRate'] as num?;
      final width = videoStream['Width'];
      final height = videoStream['Height'];
      final codec =
          ((videoStream['Codec'] as String?) ?? 'Unknown').toUpperCase();
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

  String _prettyPlayMethod(String name) {
    switch (name) {
      case 'directPlay':
        return 'Direct Play';
      case 'directStream':
        return 'Direct Stream';
      case 'transcode':
        return 'Transcode';
      default:
        return name;
    }
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
      subtitleTracks: _trackOptions(
        subtitleStreams,
        _manager.subtitleStreamIndex,
      ),
      streamInfoSections: _liveStreamInfoSections(),
      isLive: true,
      liveProgram: _liveProgramPayload(),
      liveChannelNumber: channel.number ?? '',
      channelList: _channelListPayload(),
      streamStats: _streamStatsPayload(),
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

  void _handleUiAction(Map<String, dynamic> action) {
    switch (action['event']?.toString()) {
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
        if (index < 0) {
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
