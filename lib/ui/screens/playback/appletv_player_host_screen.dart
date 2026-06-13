import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/media_segment.dart';
import '../../../data/models/trickplay_info.dart';
import '../../../data/services/media_segment_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../playback/appletv_mpv_backend.dart';
import '../../../playback/playback_profile_diagnostics.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../theme/app_theme_controller.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';

class AppleTvPlayerHostScreen extends StatefulWidget {
  const AppleTvPlayerHostScreen({super.key});

  @override
  State<AppleTvPlayerHostScreen> createState() =>
      _AppleTvPlayerHostScreenState();
}

class _AppleTvPlayerHostScreenState extends State<AppleTvPlayerHostScreen> {
  StreamSubscription<void>? _exitSub;
  StreamSubscription<void>? _queueSub;
  StreamSubscription<void>? _sessionEndedSub;
  StreamSubscription<PlaybackBringupState>? _bringupSub;
  StreamSubscription<Map<String, dynamic>>? _actionSub;
  bool _exiting = false;
  final Map<String, List<Map<String, dynamic>>> _castCache = {};
  String? _castResolving;
  final Map<String, List<Map<String, dynamic>>> _segmentCache = {};
  String? _segmentResolving;
  int _consecutiveEpisodes = 0;
  String? _stillWatchingLastItemId;
  bool _pendingStillWatching = false;
  SyncPlayManager? _syncPlay;
  AppThemeController? _themeController;

  AppleTvMpvBackend? get _backend {
    try {
      return GetIt.instance<AppleTvMpvBackend>();
    } catch (_) {
      return null;
    }
  }

  PlaybackManager? get _manager {
    try {
      return GetIt.instance<PlaybackManager>();
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _exitSub = _backend?.userExitStream.listen((_) => _handleExit());
    _actionSub = _backend?.uiActionStream.listen(_handleUiAction);
    final manager = _manager;
    if (manager != null) {
      _queueSub = manager.queueService.queueChangedStream.listen(
        (_) => _onQueueChanged(),
      );
      _sessionEndedSub = manager.sessionEndedStream.listen(
        (_) => _handleExit(),
      );
      _bringupSub = manager.bringupStateStream.listen((_) => _pushMetadata());
    }
    if (GetIt.instance.isRegistered<SyncPlayManager>()) {
      _syncPlay = GetIt.instance<SyncPlayManager>();
      _syncPlay!.addListener(_onSyncPlayChanged);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pushMetadata();
      _pushSubtitleStyle();
      _pushThemeConfig();
    });
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
        onSurfaceARGB: AppColorScheme.onSurface.toARGB32(),
        rangeProgressARGB: AppColorScheme.rangeProgress.toARGB32(),
        rangeTrackARGB: AppColorScheme.rangeTrack.toARGB32(),
      ),
    );
  }

  void _pushSubtitleStyle() {
    final backend = _backend;
    if (backend == null) return;
    try {
      final prefs = GetIt.instance<UserPreferences>();
      backend.configureSubtitleStyle(
        textColor: prefs.get(UserPreferences.subtitlesTextColor),
        backgroundColor: prefs.get(UserPreferences.subtitlesBackgroundColor),
        strokeColor: prefs.get(UserPreferences.subtitleTextStrokeColor),
        fontSize: prefs.get(UserPreferences.subtitlesTextSize),
        fontWeight: prefs.get(UserPreferences.subtitlesTextWeight),
        verticalOffset: prefs.get(UserPreferences.subtitlesOffsetPosition),
      );
    } catch (_) {}
  }

  String _logoUrlForItem(dynamic item) {
    Map<String, dynamic>? raw;
    String? itemId;
    String? serverId;
    if (item is AggregatedItem) {
      raw = item.rawData;
      itemId = item.id;
      serverId = item.serverId;
    } else if (item is Map) {
      raw = item.cast<String, dynamic>();
      itemId = (raw['Id'] ?? raw['id'])?.toString();
      serverId = (raw['ServerId'] as String?) ?? (raw['serverId'] as String?);
    }
    if (raw == null) return '';

    String? logoItemId;
    String? logoTag;
    final type = (raw['Type'] as String?)?.trim();
    if (type == 'Episode') {
      logoItemId =
          (raw['ParentLogoItemId'] as String?) ?? (raw['SeriesId'] as String?);
      logoTag = raw['ParentLogoImageTag'] as String?;
    } else {
      final imageTags = raw['ImageTags'];
      if (imageTags is Map) {
        logoTag = imageTags['Logo'] as String?;
      }
      logoTag ??= raw['LogoImageTag'] as String?;
      logoItemId = itemId;
    }

    final normalizedItemId = logoItemId?.trim();
    final normalizedTag = logoTag?.trim();
    if (normalizedItemId == null ||
        normalizedItemId.isEmpty ||
        normalizedTag == null ||
        normalizedTag.isEmpty) {
      return '';
    }

    try {
      MediaServerClient? client;
      if (serverId != null && serverId.isNotEmpty) {
        client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
          serverId,
        );
      }
      client ??= GetIt.instance<MediaServerClient>();
      return client.imageApi.getLogoImageUrl(
        normalizedItemId,
        maxWidth: 420,
        tag: normalizedTag,
      );
    } catch (_) {
      return '';
    }
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

  Map<String, dynamic>? _rawDataForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.rawData;
    if (item is Map) return item.cast<String, dynamic>();
    if (item is String) return _manager?.currentOfflineMetadata;
    return null;
  }

  String? _itemIdForQueueItem(dynamic item) {
    if (item is AggregatedItem) return item.id;
    if (item is Map) return (item['Id'] ?? item['id'])?.toString();
    return null;
  }

  MediaServerClient? _clientForQueueItem(dynamic item) {
    try {
      String? serverId;
      if (item is AggregatedItem) {
        serverId = item.serverId;
      } else if (item is Map) {
        serverId =
            (item['ServerId'] as String?) ?? (item['serverId'] as String?);
      }
      MediaServerClient? client;
      if (serverId != null && serverId.isNotEmpty) {
        client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
          serverId,
        );
      }
      return client ?? GetIt.instance<MediaServerClient>();
    } catch (_) {
      return null;
    }
  }

  String _artworkUrlForItem(dynamic item) {
    final raw = _rawDataForQueueItem(item);
    final itemId = _itemIdForQueueItem(item);
    final imageApi = _clientForQueueItem(item)?.imageApi;
    if (raw == null || itemId == null || itemId.isEmpty || imageApi == null) {
      return '';
    }
    final imageTags = raw['ImageTags'] as Map?;
    final primaryTag = (imageTags?['Primary'] as String?)?.trim();
    final thumbTag = (imageTags?['Thumb'] as String?)?.trim();
    final backdropTags = raw['BackdropImageTags'] as List?;
    final backdropTag = backdropTags?.isNotEmpty == true
        ? backdropTags!.first.toString().trim()
        : null;
    if (primaryTag != null && primaryTag.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(itemId, maxHeight: 420, tag: primaryTag);
    }
    if (thumbTag != null && thumbTag.isNotEmpty) {
      return imageApi.getThumbImageUrl(itemId, maxWidth: 960, tag: thumbTag);
    }
    if (backdropTag != null && backdropTag.isNotEmpty) {
      return imageApi.getBackdropImageUrl(itemId, maxWidth: 1280, tag: backdropTag);
    }
    return '';
  }

  String _formatBitrate(int? bitrate) {
    if (bitrate == null) return 'Unknown';
    if (bitrate >= 1000000) {
      return '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';
    }
    if (bitrate >= 1000) {
      return '${(bitrate / 1000).toStringAsFixed(0)} Kbps';
    }
    return '$bitrate bps';
  }

  String _formatChannels(int? channels) {
    return switch (channels) {
      null => 'Unknown',
      1 => 'Mono (1)',
      2 => 'Stereo (2)',
      6 => '5.1 (6)',
      8 => '7.1 (8)',
      _ => '$channels channels',
    };
  }

  List<Map<String, dynamic>> _streamInfoSections(PlaybackManager manager) {
    final res = manager.currentResolution;
    final item = manager.queueService.currentItem;

    Map<String, dynamic>? mediaSource;
    Map<String, dynamic>? videoStream;
    Map<String, dynamic>? audioStream;
    Map<String, dynamic>? subtitleStream;

    Map<String, dynamic>? pickStream(
      List<Map<String, dynamic>> streams,
      String type,
      int? preferredIndex,
    ) {
      if (preferredIndex != null && preferredIndex >= 0) {
        final preferred = streams
            .where((s) => s['Type'] == type)
            .firstWhere(
              (s) => s['Index'] == preferredIndex,
              orElse: () => const <String, dynamic>{},
            );
        if (preferred.isNotEmpty) return preferred;
      }
      final defaults = streams
          .where((s) => s['Type'] == type && s['IsDefault'] == true)
          .toList();
      if (defaults.isNotEmpty) return defaults.first;
      final any = streams.where((s) => s['Type'] == type).toList();
      return any.isNotEmpty ? any.first : null;
    }

    final raw = _rawDataForQueueItem(item);
    final allStreams =
        res?.mediaStreams ??
        (raw?['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    videoStream = allStreams.where((s) => s['Type'] == 'Video').firstOrNull;
    audioStream = pickStream(allStreams, 'Audio', manager.audioStreamIndex);
    subtitleStream = manager.subtitleStreamIndex == -1
        ? null
        : pickStream(allStreams, 'Subtitle', manager.subtitleStreamIndex);

    final sources = (raw?['MediaSources'] as List?)
        ?.cast<Map<String, dynamic>>();
    final sourceId = res?.mediaSourceId;
    if (sources != null && sources.isNotEmpty) {
      mediaSource = sourceId != null
          ? sources.firstWhere(
              (s) => s['Id'] == sourceId,
              orElse: () => sources.first,
            )
          : sources.first;
    }

    String fileName() {
      final path = (mediaSource?['Path'] as String?)?.trim();
      if (path != null && path.isNotEmpty) {
        final segments = path.split(RegExp(r'[\\/]'));
        if (segments.isNotEmpty && segments.last.trim().isNotEmpty) {
          return segments.last.trim();
        }
      }
      final name = (mediaSource?['Name'] as String?)?.trim();
      return (name != null && name.isNotEmpty) ? name : 'Unknown';
    }

    Map<String, dynamic> rowEntry(String label, String value) {
      return {'label': label, 'value': value};
    }

    final sections = <Map<String, dynamic>>[];
    void addSection(String title, List<Map<String, dynamic>> rows) {
      if (rows.isEmpty) return;
      sections.add({'title': title, 'rows': rows});
    }

    final overrideMbps = manager.maxBitrateOverrideMbps;
    final container =
        (mediaSource?['Container'] as String?)?.toUpperCase() ??
        res?.container?.toUpperCase() ??
        'Unknown';

    addSection('Playback', [
      rowEntry('File Name', fileName()),
      rowEntry(
        'Play Method',
        res != null ? _prettyPlayMethod(res.playMethod.name) : 'Unknown',
      ),
      if (res != null && res.transcodingReasons.isNotEmpty)
        rowEntry('Transcode Reasons', res.transcodingReasons.join(', ')),
      rowEntry('Player', 'MPVKit (libmpv)'),
      rowEntry('Container', container),
      rowEntry('Bitrate', _formatBitrate(mediaSource?['Bitrate'] as int?)),
      rowEntry(
        'Max Bitrate',
        overrideMbps != null ? '$overrideMbps Mbps' : 'Auto',
      ),
      rowEntry('Max Resolution', _maxResolutionLabel()),
    ]);

    if (videoStream != null) {
      final video = videoStream;
      final fps = video['RealFrameRate'] as num?;
      final width = video['Width'];
      final height = video['Height'];
      final range =
          (video['VideoRangeType'] as String?) ??
          (video['VideoRange'] as String?) ??
          'SDR';
      final codec = ((video['Codec'] as String?) ?? 'Unknown').toUpperCase();
      final profile = (video['Profile'] as String?) ?? '';
      final level = video['Level'];
      final bitDepth = video['BitDepth'];
      addSection('Video', [
        rowEntry(
          'Resolution',
          '${width ?? '?'}×${height ?? '?'}${fps != null ? ' @ ${fps.round()}fps' : ''}',
        ),
        rowEntry('HDR', range),
        rowEntry(
          'Codec',
          [
            codec,
            if (profile.isNotEmpty) profile,
            if (level != null) 'L$level',
          ].join(' '),
        ),
        if (bitDepth != null) rowEntry('Bit Depth', '$bitDepth-bit'),
        if (video['BitRate'] != null)
          rowEntry('Video Bitrate', _formatBitrate(video['BitRate'] as int?)),
      ]);
    }

    if (audioStream != null) {
      final audio = audioStream;
      final codec = ((audio['Codec'] as String?) ?? 'Unknown').toUpperCase();
      final profile = (audio['Profile'] as String?) ?? '';
      addSection('Audio', [
        rowEntry(
          'Track',
          audio['DisplayTitle'] as String? ??
              audio['Language'] as String? ??
              'Unknown',
        ),
        rowEntry('Codec', profile.isEmpty ? codec : '$codec ($profile)'),
        rowEntry('Channels', _formatChannels(audio['Channels'] as int?)),
        if (audio['BitRate'] != null)
          rowEntry('Audio Bitrate', _formatBitrate(audio['BitRate'] as int?)),
        if (audio['SampleRate'] != null)
          rowEntry(
            'Sample Rate',
            '${((audio['SampleRate'] as num) / 1000).toStringAsFixed(1)} kHz',
          ),
      ]);
    }

    if (subtitleStream != null) {
      final subtitle = subtitleStream;
      addSection('Subtitles', [
        rowEntry(
          'Track',
          subtitle['DisplayTitle'] as String? ??
              subtitle['Language'] as String? ??
              'Unknown',
        ),
        rowEntry(
          'Format',
          ((subtitle['Codec'] as String?) ?? 'Unknown').toUpperCase(),
        ),
        rowEntry(
          'Type',
          subtitle['IsExternal'] == true ? 'External' : 'Embedded',
        ),
      ]);
    }

    final diagnostics = PlaybackProfileDiagnostics.instance.lastDecision;
    if (diagnostics != null) {
      final diagSourceId = diagnostics['mediaSourceId']?.toString();
      final currentSourceId =
          res?.mediaSourceId ?? mediaSource?['Id']?.toString();
      final matches =
          diagSourceId == null ||
          currentSourceId == null ||
          diagSourceId == currentSourceId;
      if (matches) {
        String value(String key) {
          final v = diagnostics[key];
          if (v is List) {
            final values = v
                .map((e) => e.toString().trim())
                .where((e) => e.isNotEmpty)
                .toList();
            return values.isEmpty ? 'Unknown' : values.join(', ');
          }
          final text = v?.toString().trim() ?? '';
          return text.isEmpty ? 'Unknown' : text;
        }

        addSection('Diagnostics', [
          rowEntry('Backend', value('backend')),
          rowEntry('Play Method', value('playMethod')),
          rowEntry('Transcode Reasons', value('transcodingReasons')),
          rowEntry('Container', value('container')),
          rowEntry('Video Codec', value('videoCodec')),
          rowEntry('Video Profile', value('videoProfile')),
          rowEntry('Video Level', value('videoLevel')),
          rowEntry('Video Range', value('videoRange')),
          rowEntry('Audio Codec', value('audioCodec')),
          rowEntry('Audio Profile', value('audioProfile')),
          rowEntry('Audio Channels', value('audioChannels')),
          rowEntry('Subtitle Codec', value('subtitleCodec')),
          rowEntry('Allowed Audio Codecs', value('allowedAudioCodecs')),
          rowEntry('Audio Route', value('activeRouteType')),
        ]);
      }
    }

    return sections;
  }

  Map<String, dynamic>? _trickplayPayload(dynamic item, PlaybackManager manager) {
    try {
      if (!GetIt.instance<UserPreferences>().get(
        UserPreferences.trickPlayEnabled,
      )) {
        return null;
      }
    } catch (_) {
      return null;
    }
    final raw = _rawDataForQueueItem(item);
    final itemId = _itemIdForQueueItem(item);
    final client = _clientForQueueItem(item);
    if (raw == null || itemId == null || itemId.isEmpty || client == null) {
      return null;
    }
    final mediaSourceId = manager.currentResolution?.mediaSourceId;
    final info = TrickplayInfo.fromItemData(raw, mediaSourceId: mediaSourceId);
    if (info == null || !info.isValid) return null;

    final runtimeTicks = raw['RunTimeTicks'] as int?;
    final durationMs = runtimeTicks != null ? runtimeTicks ~/ 10000 : 0;
    final msPerImage = info.interval * info.tilesPerImage;
    var imageCount = durationMs > 0 ? (durationMs / msPerImage).ceil() + 1 : 16;
    imageCount = imageCount.clamp(1, 128);

    final urls = List<String>.generate(
      imageCount,
      (i) => client.imageApi.getTrickplayTileImageUrl(
        itemId,
        width: info.width,
        index: i,
        mediaSourceId: mediaSourceId,
      ),
    );
    final token = client.accessToken;
    return {
      'urls': urls,
      'headers': {
        if (token != null && token.isNotEmpty)
          'Authorization': 'MediaBrowser Token="$token"',
      },
      'width': info.width,
      'height': info.height,
      'cols': info.tileWidth,
      'rows': info.tileHeight,
      'intervalMs': info.interval,
    };
  }

  List<Map<String, dynamic>> _mapPeople(
    List<Map<String, dynamic>> people,
    ImageApi imageApi,
  ) {
    return people
        .map((person) {
          final name = (person['Name'] as String?)?.trim() ?? '';
          if (name.isEmpty) return null;
          final personId = (person['Id'] as String?)?.trim() ?? '';
          final imageTag = (person['PrimaryImageTag'] as String?)?.trim();
          final role = (person['Role'] as String?)?.trim();
          final type = (person['Type'] as String?)?.trim();
          final subtitle = (role != null && role.isNotEmpty)
              ? role
              : ((type != null && type.isNotEmpty) ? type : '');
          String imageUrl = '';
          if (personId.isNotEmpty && imageTag != null && imageTag.isNotEmpty) {
            imageUrl = imageApi.getPrimaryImageUrl(
              personId,
              maxHeight: 300,
              tag: imageTag,
            );
          }
          return <String, dynamic>{
            'name': name,
            'subtitle': subtitle,
            'imageUrl': imageUrl,
          };
        })
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);
  }

  bool _hasCastCrew(dynamic item) {
    if (item is! AggregatedItem) return false;
    if (item.people.isNotEmpty) return true;
    return item.type == 'Episode' &&
        item.seriesId != null &&
        item.seriesId!.isNotEmpty;
  }

  bool _canFavorite(dynamic item) {
    if (item is! AggregatedItem) return false;
    final id = _itemIdForQueueItem(item);
    return id != null && id.isNotEmpty;
  }

  bool _queueItemIsFavorite(dynamic item) {
    if (item is AggregatedItem) return item.isFavorite;
    final userData = _rawDataForQueueItem(item)?['UserData'];
    if (userData is Map) return userData['IsFavorite'] as bool? ?? false;
    return false;
  }

  bool _canDownloadSubtitles(dynamic item) {
    if (item is! AggregatedItem) return false;
    final client = _clientForQueueItem(item);
    if (client == null) return false;
    bool canManage = false;
    try {
      canManage =
          GetIt.instance<UserRepository>().currentUser?.canManageSubtitles ??
          false;
    } catch (_) {
      return false;
    }
    final mediaType = item.rawData['MediaType'] as String?;
    final isAudio =
        item.type == 'Audio' ||
        item.type == 'MusicAlbum' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
    return client.serverType == ServerType.jellyfin &&
        canManage &&
        item.mediaSources.isNotEmpty &&
        item.type != 'Photo' &&
        item.type != 'Book' &&
        !isAudio;
  }

  String _remoteSubtitleLanguage(
    List<Map<String, dynamic>> subtitleStreams,
    List<Map<String, dynamic>> audioStreams,
  ) {
    final preferred = GetIt.instance<UserPreferences>()
        .get(UserPreferences.defaultSubtitleLanguage)
        .trim()
        .toLowerCase();
    if (preferred.isNotEmpty &&
        preferred != 'auto' &&
        preferred != 'none') {
      return preferred;
    }
    for (final stream in [...subtitleStreams, ...audioStreams]) {
      final language = (stream['Language'] as String?)?.trim();
      if (language != null && language.isNotEmpty) return language;
    }
    return 'eng';
  }

  String _remoteSubtitleOptionSubtitle(Map<String, dynamic> subtitle) {
    final details = <String>[];
    final language =
        (subtitle['ThreeLetterISOLanguageName'] as String?)?.trim() ??
        (subtitle['Language'] as String?)?.trim();
    final provider = subtitle['ProviderName'] as String?;
    final format = subtitle['Format'] as String?;
    final rating = subtitle['CommunityRating'] as num?;
    if (language != null && language.isNotEmpty) {
      details.add(language.toUpperCase());
    }
    if (provider != null && provider.isNotEmpty) details.add(provider);
    if (format != null && format.isNotEmpty) details.add(format.toUpperCase());
    if (rating != null) details.add('${rating.toStringAsFixed(1)}*');
    return details.join(' · ');
  }

  void _searchRemoteSubtitles() {
    final manager = _manager;
    final backend = _backend;
    if (manager == null || backend == null) return;
    final item = manager.queueService.currentItem;
    if (item is! AggregatedItem) {
      backend.showRemoteSubtitles(const []);
      return;
    }
    final client = _clientForQueueItem(item);
    if (client == null) {
      backend.showRemoteSubtitles(const []);
      return;
    }
    final allStreams =
        manager.currentResolution?.mediaStreams ??
        const <Map<String, dynamic>>[];
    final subtitleStreams = allStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();
    final audioStreams = allStreams.where((s) => s['Type'] == 'Audio').toList();
    final language = _remoteSubtitleLanguage(subtitleStreams, audioStreams);
    () async {
      var results = const <Map<String, dynamic>>[];
      try {
        results = await client.itemsApi.searchRemoteSubtitles(
          item.id,
          language: language,
        );
      } catch (_) {}
      if (!mounted) return;
      final mapped = results
          .map((s) {
            final id = (s['Id'] as String?) ?? '';
            final label =
                (s['Name'] as String?) ??
                (s['Author'] as String?) ??
                'Subtitle';
            return {
              'id': id,
              'label': label,
              'subtitle': _remoteSubtitleOptionSubtitle(s),
            };
          })
          .where((m) => (m['id'] as String).isNotEmpty)
          .toList();
      backend.showRemoteSubtitles(mapped);
    }();
  }

  void _downloadSubtitle(String subtitleId) {
    final manager = _manager;
    if (manager == null || subtitleId.isEmpty) return;
    final item = manager.queueService.currentItem;
    if (item is! AggregatedItem) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final existingIndexes =
        (manager.currentResolution?.mediaStreams ??
                const <Map<String, dynamic>>[])
            .where((s) => s['Type'] == 'Subtitle')
            .map((s) => s['Index'] as int?)
            .whereType<int>()
            .toSet();
    () async {
      try {
        await client.itemsApi.downloadRemoteSubtitle(item.id, subtitleId);
        final newStream = await _refreshAndFindSubtitle(
          item,
          client,
          existingIndexes,
        );
        final index = newStream?['Index'] as int?;
        if (index != null) {
          await manager.changeSubtitleTrack(index);
        }
      } catch (_) {
      } finally {
        if (mounted) _pushMetadata();
      }
    }();
  }

  Future<Map<String, dynamic>?> _refreshAndFindSubtitle(
    AggregatedItem item,
    MediaServerClient client,
    Set<int> existingIndexes,
  ) async {
    for (var attempt = 0; attempt < 8; attempt++) {
      try {
        final raw = await client.itemsApi.getItem(item.id);
        if (!mounted) return null;
        final refreshed = AggregatedItem(
          id: item.id,
          serverId: item.serverId,
          rawData: raw,
        );
        for (final s in refreshed.mediaStreams.where(
          (s) => s['Type'] == 'Subtitle',
        )) {
          final index = s['Index'] as int?;
          if (index != null && !existingIndexes.contains(index)) return s;
        }
      } catch (_) {}
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    return null;
  }

  void _toggleFavorite(dynamic item) {
    final itemId = _itemIdForQueueItem(item);
    if (itemId == null || itemId.isEmpty) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    final wasFavorite = _queueItemIsFavorite(item);
    () async {
      try {
        await ItemMutationRepository(
          client,
        ).setFavorite(itemId, isFavorite: !wasFavorite);
        final raw = _rawDataForQueueItem(item);
        if (raw != null) {
          final existing = raw['UserData'];
          final userData = existing is Map<String, dynamic>
              ? existing
              : (existing is Map
                    ? existing.cast<String, dynamic>()
                    : <String, dynamic>{});
          userData['IsFavorite'] = !wasFavorite;
          raw['UserData'] = userData;
        }
      } catch (_) {
      } finally {
        if (mounted) _pushMetadata();
      }
    }();
  }

  List<Map<String, dynamic>> _castPeople(dynamic item) {
    final imageApi = _clientForQueueItem(item)?.imageApi;
    if (imageApi == null) return const [];
    final itemId = _itemIdForQueueItem(item);
    if (itemId != null && _castCache.containsKey(itemId)) {
      return _castCache[itemId]!;
    }
    final raw = _rawDataForQueueItem(item);
    final people = (raw?['People'] as List?)?.cast<Map<String, dynamic>>();
    if (people == null || people.isEmpty) return const [];
    return _mapPeople(people, imageApi);
  }

  void _resolveCastAsync(dynamic item) {
    if (item is! AggregatedItem) return;
    final itemId = item.id;
    if (_castCache.containsKey(itemId) ||
        _castResolving == itemId ||
        item.people.isNotEmpty) {
      return;
    }
    if (item.type != 'Episode' ||
        item.seriesId == null ||
        item.seriesId!.isEmpty) {
      return;
    }
    final client = _clientForQueueItem(item);
    if (client == null) return;
    _castResolving = itemId;
    () async {
      try {
        final seriesData = await client.itemsApi.getItem(item.seriesId!);
        final people = (seriesData['People'] as List?)
            ?.cast<Map<String, dynamic>>();
        _castCache[itemId] = (people == null || people.isEmpty)
            ? const []
            : _mapPeople(people, client.imageApi);
      } catch (_) {
        _castCache[itemId] = const [];
      } finally {
        _castResolving = null;
        if (mounted) _pushMetadata();
      }
    }();
  }

  List<Map<String, dynamic>> _mediaSegments(dynamic item) {
    final id = _itemIdForQueueItem(item);
    if (id != null && _segmentCache.containsKey(id)) {
      return _segmentCache[id]!;
    }
    return const [];
  }

  String _segmentLabel(MediaSegmentType type) {
    return switch (type) {
      MediaSegmentType.intro => 'Skip Intro',
      MediaSegmentType.outro => 'Skip Credits',
      MediaSegmentType.recap => 'Skip Recap',
      MediaSegmentType.preview => 'Skip Preview',
      _ => 'Skip',
    };
  }

  void _resolveSegmentsAsync(dynamic item) {
    final id = _itemIdForQueueItem(item);
    if (id == null || id.isEmpty) return;
    if (_segmentCache.containsKey(id) || _segmentResolving == id) return;
    final client = _clientForQueueItem(item);
    if (client == null) return;
    _segmentResolving = id;
    () async {
      try {
        final prefs = GetIt.instance<UserPreferences>();
        final service = MediaSegmentService(
          client,
          FeatureDetector(serverType: client.serverType, serverVersion: ''),
          prefs,
        );
        await service.loadSegments(id);
        final actionMap = service.actionMap;
        final result = <Map<String, dynamic>>[];
        for (final segment in service.segments) {
          final action = actionMap[segment.type] ?? MediaSegmentAction.nothing;
          if (action == MediaSegmentAction.nothing) continue;
          final spanMs = segment.end.inMilliseconds - segment.start.inMilliseconds;
          final minMs = action == MediaSegmentAction.skip ? 1000 : 3000;
          if (spanMs < minMs) continue;
          result.add({
            'startMs': segment.start.inMilliseconds,
            'endMs': segment.end.inMilliseconds,
            'action': action == MediaSegmentAction.skip ? 'skip' : 'ask',
            'label': _segmentLabel(segment.type),
          });
        }
        _segmentCache[id] = result;
      } catch (_) {
        _segmentCache[id] = const [];
      } finally {
        _segmentResolving = null;
        if (mounted) _pushMetadata();
      }
    }();
  }

  Map<String, dynamic>? _nextUpPayload(PlaybackManager manager) {
    final next = manager.queueService.peekNext;
    if (next == null) return null;
    String title = '';
    if (next is AggregatedItem) {
      final episodeInfo = next.indexNumber != null
          ? 'S${next.parentIndexNumber ?? '?'}:E${next.indexNumber}'
          : null;
      title = [?episodeInfo, next.name].where((s) => s.isNotEmpty).join(' - ');
    } else if (next is Map) {
      title = (next['Name'] as String?) ?? '';
    }
    if (title.isEmpty) return null;
    return {'title': title, 'imageUrl': _artworkUrlForItem(next)};
  }

  Map<String, dynamic>? _pauseMetaPayload(dynamic item) {
    bool enabled = false;
    try {
      enabled = GetIt.instance<UserPreferences>().get(
        UserPreferences.showDescriptionOnPause,
      );
    } catch (_) {}
    if (!enabled) return null;
    final raw = _rawDataForQueueItem(item);
    final overview =
        (raw?['Overview'] as String?)?.trim() ??
        ((raw?['Taglines'] as List?)?.firstOrNull as String?)?.trim() ??
        '';
    if (overview.isEmpty) return null;
    return {'overview': overview, 'imageUrl': _artworkUrlForItem(item)};
  }

  List<Map<String, dynamic>> _trackOptions(
    List<Map<String, dynamic>> streams,
    int? selectedIndex, {
    required bool audio,
  }) {
    final options = <Map<String, dynamic>>[];
    for (final s in streams) {
      final index = (s['Index'] as int?) ?? -1;
      final displayTitle = s['DisplayTitle'] as String?;
      final title = s['Title'] as String?;
      final language = s['Language'] as String?;
      final codec = s['Codec'] as String?;
      final label = displayTitle ?? title ?? language ?? 'Track';
      final String subtitle;
      if (audio) {
        subtitle = [
          if (language != null && displayTitle != null) language,
          if (codec != null) codec.toUpperCase(),
          if (s['Channels'] != null) '${s['Channels']}ch',
        ].join(' · ');
      } else {
        final subtitleType =
            ((codec == null || codec.isEmpty) ? 'Unknown' : codec)
                .toUpperCase();
        final deliveryMethod = (s['DeliveryMethod'] as String?)
            ?.trim()
            .toLowerCase();
        final location = s['IsExternal'] == true
            ? 'External'
            : (deliveryMethod == 'embed' ? 'Embedded' : 'Internal');
        subtitle = '$subtitleType · $location';
      }
      options.add({
        'index': index,
        'label': label,
        'subtitle': subtitle,
        'selected': index == selectedIndex,
      });
    }
    return options;
  }

  void _pushMetadata() {
    final manager = _manager;
    final backend = _backend;
    if (manager == null || backend == null) return;

    final item = manager.queueService.currentItem;
    final chapters = <Map<String, dynamic>>[];

    List<Map<String, dynamic>>? rawChapters;
    if (item is AggregatedItem) {
      rawChapters = item.chapters;
    } else if (item is String) {
      rawChapters = (manager.currentOfflineMetadata?['Chapters'] as List?)
          ?.cast<Map<String, dynamic>>();
    }

    if (rawChapters != null) {
      for (var i = 0; i < rawChapters.length; i++) {
        final chapter = rawChapters[i];
        final ticks = (chapter['StartPositionTicks'] as int?) ?? 0;
        final startMs = ticks ~/ 10000;
        final title = (chapter['Name'] as String?)?.trim();
        chapters.add({
          'title': (title != null && title.isNotEmpty)
              ? title
              : 'Chapter ${i + 1}',
          'startMs': startMs,
        });
      }
    }

    String topTitle = '';
    String topSubtitle = '';
    if (item is AggregatedItem) {
      final episodeInfo = item.indexNumber != null
          ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
          : null;
      final episodeLine = [
        ?episodeInfo,
        item.name,
      ].where((s) => s.isNotEmpty).join(' - ');
      final series = item.seriesName ?? '';
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = item.name;
        topSubtitle = '';
      }
    } else if (item is Map) {
      final title = (item['Name'] as String?) ?? '';
      final series = (item['SeriesName'] as String?) ?? '';
      final idx = item['IndexNumber'];
      final episodeInfo = idx != null
          ? 'S${item['ParentIndexNumber'] ?? '?'}:E$idx'
          : null;
      final episodeLine = [
        ?episodeInfo,
        title,
      ].where((s) => s.isNotEmpty).join(' - ');
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = title;
        topSubtitle = '';
      }
    } else if (item is String) {
      final meta = manager.currentOfflineMetadata;
      final title = (meta?['Name'] as String?) ?? item.split('/').last;
      final series = (meta?['SeriesName'] as String?) ?? '';
      final idx = meta?['IndexNumber'] as int?;
      final parentIdx = meta?['ParentIndexNumber'] as int?;
      final episodeInfo = idx != null ? 'S${parentIdx ?? '?'}:E$idx' : null;
      final episodeLine = [
        ?episodeInfo,
        title,
      ].where((s) => s.isNotEmpty).join(' - ');
      if (series.isNotEmpty) {
        topTitle = series;
        topSubtitle = episodeLine;
      } else {
        topTitle = title;
        topSubtitle = '';
      }
    }

    final allStreams =
        manager.currentResolution?.mediaStreams ??
        (manager.currentOfflineMetadata?['MediaStreams'] as List?)
            ?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    final audioStreams = allStreams
        .where((s) => s['Type'] == 'Audio')
        .toList();
    final subtitleStreams = allStreams
        .where((s) => s['Type'] == 'Subtitle')
        .toList();

    final skipForwardMs = _prefInt(
      UserPreferences.skipForwardLength,
      defaultValue: 30000,
    );
    final skipBackMs = _prefInt(
      UserPreferences.skipBackLength,
      defaultValue: 10000,
    );

    backend.setUiMetadata(
      topTitle: topTitle,
      topSubtitle: topSubtitle,
      chapters: chapters,
      hasPrevious: manager.queueService.hasPrevious,
      hasNext: manager.queueService.hasNext,
      skipForwardMs: skipForwardMs,
      skipBackMs: skipBackMs,
      audioTracks: _trackOptions(
        audioStreams,
        manager.audioStreamIndex,
        audio: true,
      ),
      subtitleTracks: _trackOptions(
        subtitleStreams,
        manager.subtitleStreamIndex,
        audio: false,
      ),
      logoUrl: _logoUrlForItem(item),
      streamInfoSections: _streamInfoSections(manager),
      trickplay: _trickplayPayload(item, manager),
      hasCast: _hasCastCrew(item),
      castPeople: _castPeople(item),
      nextUp: _nextUpPayload(manager),
      nextUpThresholdMs: _nextUpThresholdMs(),
      pauseMeta: _pauseMetaPayload(item),
      selectedBitrateMbps: manager.maxBitrateOverrideMbps ?? -1,
      mediaSegments: _mediaSegments(item),
      canFavorite: _canFavorite(item),
      isFavorite: _queueItemIsFavorite(item),
      showStillWatching: _pendingStillWatching,
      canDownloadSubtitles: _canDownloadSubtitles(item),
      syncPlay: _syncPlayPayload(),
    );
    _pendingStillWatching = false;

    _resolveCastAsync(item);
    _resolveSegmentsAsync(item);
  }

  String _maxResolutionLabel() {
    try {
      final res = GetIt.instance<UserPreferences>().get(
        UserPreferences.maxVideoResolution,
      );
      return res == MaxVideoResolution.auto ? 'Auto' : '${res.height}p';
    } catch (_) {
      return 'Auto';
    }
  }

  int _nextUpThresholdMs() {
    try {
      final behavior = GetIt.instance<UserPreferences>().get(
        UserPreferences.nextUpBehavior,
      );
      if (behavior == NextUpBehavior.disabled) return 0;
      return 30000;
    } catch (_) {
      return 30000;
    }
  }

  int _prefInt(Preference<int> pref, {required int defaultValue}) {
    try {
      return GetIt.instance<UserPreferences>().get(pref);
    } catch (_) {
      return defaultValue;
    }
  }

  void _onSyncPlayChanged() {
    if (mounted) _pushMetadata();
  }

  Map<String, dynamic>? _syncPlayPayload() {
    final sync = _syncPlay;
    if (sync == null || !sync.state.enabled) return null;
    return {
      'groupName': sync.state.groupName ?? 'SyncPlay',
      'participants': sync.state.participants,
      'ignoreWait': sync.ignoreWaitEnabled,
    };
  }

  void _onQueueChanged() {
    final manager = _manager;
    if (manager == null) return;
    final id = _itemIdForQueueItem(manager.queueService.currentItem);
    if (id != null &&
        id.isNotEmpty &&
        _stillWatchingLastItemId != null &&
        id != _stillWatchingLastItemId) {
      _consecutiveEpisodes++;
      final behavior = GetIt.instance<UserPreferences>().get(
        UserPreferences.stillWatchingBehavior,
      );
      if (behavior != StillWatchingBehavior.disabled &&
          _consecutiveEpisodes >= behavior.episodes) {
        _pendingStillWatching = true;
      }
    }
    if (id != null && id.isNotEmpty) {
      _stillWatchingLastItemId = id;
    }
    _pushMetadata();
  }

  void _handleUiAction(Map<String, dynamic> action) {
    final manager = _manager;
    if (manager == null) return;
    switch (action['event']?.toString()) {
      case 'play':
        unawaited(manager.resume());
      case 'pause':
        unawaited(manager.pause());
      case 'seek':
        final positionMs = (action['positionMs'] as num?)?.toInt();
        if (positionMs != null) {
          unawaited(manager.seekTo(Duration(milliseconds: positionMs)));
        }
      case 'next':
        unawaited(manager.next());
      case 'previous':
        unawaited(manager.previous());
      case 'selectAudio':
        final index = (action['index'] as num?)?.toInt();
        if (index != null) {
          unawaited(manager.changeAudioTrack(index));
        }
      case 'selectSubtitle':
        final index = (action['index'] as num?)?.toInt();
        if (index == null) break;
        if (index < 0) {
          unawaited(manager.disableSubtitles());
        } else {
          unawaited(manager.changeSubtitleTrack(index));
        }
      case 'setSpeed':
        final speed = (action['speed'] as num?)?.toDouble();
        if (speed != null && speed > 0) {
          unawaited(_backend?.setPlaybackSpeed(speed) ?? Future<void>.value());
        }
      case 'setBitrate':
        final mbps = (action['mbps'] as num?)?.toInt();
        unawaited(manager.changeBitrate(mbps == null || mbps < 0 ? null : mbps));
      case 'toggleFavorite':
        _toggleFavorite(manager.queueService.currentItem);
      case 'stillWatchingContinue':
        _consecutiveEpisodes = 0;
      case 'stillWatchingStop':
        _handleExit();
      case 'searchSubtitles':
        _searchRemoteSubtitles();
      case 'downloadSubtitle':
        final id = action['id']?.toString();
        if (id != null && id.isNotEmpty) _downloadSubtitle(id);
      case 'syncplayLeave':
        unawaited(_syncPlay?.leaveGroup() ?? Future<void>.value());
      case 'syncplayIgnoreWait':
        final value = action['value'] == true;
        unawaited(
          _syncPlay?.requestSetIgnoreWait(value) ?? Future<void>.value(),
        );
    }
    Future<void>.delayed(const Duration(milliseconds: 300), _pushMetadata);
  }

  void _handleExit() {
    if (_exiting || !mounted) return;
    _exiting = true;
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    if (context.canPop()) {
      context.pop();
    }
  }

  @override
  void dispose() {
    _exitSub?.cancel();
    _queueSub?.cancel();
    _sessionEndedSub?.cancel();
    _bringupSub?.cancel();
    _actionSub?.cancel();
    _syncPlay?.removeListener(_onSyncPlayChanged);
    _themeController?.removeListener(_onThemeChanged);
    unawaited(_backend?.dismissPlayer() ?? Future<void>.value());
    try {
      GetIt.instance<PlaybackManager>().stop(userInitiated: true);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(),
    );
  }
}
