import 'dart:convert';

import '../database/offline_database.dart';

class AggregatedItem {
  final String id;
  final String serverId;
  final Map<String, dynamic> rawData;

  const AggregatedItem({
    required this.id,
    required this.serverId,
    required this.rawData,
  });

  factory AggregatedItem.fromOffline(DownloadedItem row) {
    final rawData = jsonDecode(row.metadataJson) as Map<String, dynamic>;
    return AggregatedItem(
      id: row.itemId,
      serverId: row.serverId,
      rawData: rawData,
    );
  }

  String get name => rawData['Name'] as String? ?? '';
  String? get type => rawData['Type'] as String?;

  /// Whether this item is music/audio content (track, audiobook, or any item
  /// whose server MediaType is Audio). Used to decide when to show the music
  /// mini-player and when to keep the audio media session alive.
  bool get isAudioLike =>
      type == 'Audio' || type == 'AudioBook' || rawData['MediaType'] == 'Audio';
  bool get canDelete => rawData['CanDelete'] as bool? ?? false;
  String? get seriesName => rawData['SeriesName'] as String?;
  int? get productionYear => _toInt(rawData['ProductionYear']);
  double? get communityRating =>
      (rawData['CommunityRating'] as num?)?.toDouble();
  String? get overview => rawData['Overview'] as String?;
  String? get officialRating => rawData['OfficialRating'] as String?;
  int? get indexNumber => _toInt(rawData['IndexNumber']);
  int? get parentIndexNumber => _toInt(rawData['ParentIndexNumber']);

  static int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  int? get runTimeTicks => _toInt(rawData['RunTimeTicks']);
  Duration? get runtime =>
      runTimeTicks != null ? Duration(microseconds: runTimeTicks! ~/ 10) : null;

  List<String> get genres =>
      (rawData['Genres'] as List?)?.cast<String>() ?? const [];

  String? get primaryImageTag =>
      (rawData['ImageTags'] as Map?)?['Primary'] as String?;

  String? get thumbImageTag =>
      (rawData['ImageTags'] as Map?)?['Thumb'] as String?;

  String? get primaryImageTagField => rawData['PrimaryImageTag'] as String?;

  String? get primaryImageItemId => rawData['PrimaryImageItemId']?.toString();

  List<String> get backdropImageTags =>
      (rawData['BackdropImageTags'] as List?)?.cast<String>() ?? const [];

  String? get parentBackdropItemId =>
      rawData['ParentBackdropItemId']?.toString();

  List<String> get parentBackdropImageTags =>
      (rawData['ParentBackdropImageTags'] as List?)?.cast<String>() ?? const [];

  String? get logoImageTag =>
      (rawData['ImageTags'] as Map?)?['Logo'] as String?;

  Map? get _userData => rawData['UserData'] as Map?;

  double? get playedPercentage =>
      (_userData?['PlayedPercentage'] as num?)?.toDouble();

  bool get isPlayed => _userData?['Played'] as bool? ?? false;

  bool get isFavorite => _userData?['IsFavorite'] as bool? ?? false;

  int? get playbackPositionTicks => _toInt(_userData?['PlaybackPositionTicks']);

  Duration? get playbackPosition => playbackPositionTicks != null
      ? Duration(microseconds: playbackPositionTicks! ~/ 10)
      : null;

  int? get unplayedItemCount => _toInt(_userData?['UnplayedItemCount']);

  int? get criticRating => _toInt(rawData['CriticRating']);

  String? get tagline {
    final taglines = rawData['Taglines'] as List?;
    return taglines != null && taglines.isNotEmpty
        ? taglines.first as String?
        : null;
  }

  String? get subtitle {
    final customSubtitle = rawData['Subtitle'] as String?;
    if (customSubtitle != null && customSubtitle.isNotEmpty) {
      return customSubtitle;
    }
    if (type == 'Episode') {
      final s = parentIndexNumber;
      final e = indexNumber;
      final series = seriesName?.trim();
      final episodeInfo = switch ((s, e)) {
        (final season?, final episode?) => 'S$season:E$episode',
        _ => null,
      };

      if (episodeInfo != null && series != null && series.isNotEmpty) {
        return '$episodeInfo - $series';
      }
      if (episodeInfo != null) {
        return episodeInfo;
      }
      if (series != null && series.isNotEmpty) {
        return series;
      }
    }

    if (type == 'MusicAlbum' || type == 'Audio') {
      final artist = (albumArtist ?? '').trim().isNotEmpty
          ? albumArtist!.trim()
          : (albumArtists.isNotEmpty
              ? (albumArtists.first['Name'] as String?)?.trim()
              : (artists.isNotEmpty ? artists.first.trim() : ''));
      final year = productionYear;
      if (artist != null && artist.isNotEmpty) {
        if (year != null) {
          return '$artist ($year)';
        }
        return artist;
      }
      if (year != null) {
        return '$year';
      }
      return null;
    }

    final year = productionYear;
    final resolution = videoResolution;
    if (year == null && resolution == null) return null;
    if (year != null && resolution != null) return '$year  • $resolution';
    if (year != null) return '$year';
    return resolution;
  }

  String? get seriesId => rawData['SeriesId']?.toString();
  String? get seasonId => rawData['SeasonId']?.toString();
  String? get seriesPrimaryImageTag =>
      rawData['SeriesPrimaryImageTag'] as String?;
  String? get seriesThumbImageTag => rawData['SeriesThumbImageTag'] as String?;
  String? get parentPrimaryImageTag =>
      rawData['ParentPrimaryImageTag'] as String?;
  String? get parentPrimaryImageItemId =>
      rawData['ParentPrimaryImageItemId']?.toString();
  String? get parentThumbItemId => rawData['ParentThumbItemId']?.toString();
  String? get parentThumbImageTag => rawData['ParentThumbImageTag'] as String?;
  String? get status => rawData['Status'] as String?;
  String? get seerrMediaType => rawData['SeerrMediaType'] as String?;
  int? get seerrStatus => _toInt(rawData['SeerrStatus']);
  int? get childCount => _toInt(rawData['ChildCount']);

  DateTime? get premiereDate {
    final v = rawData['PremiereDate'] as String?;
    return v != null ? DateTime.tryParse(v) : null;
  }

  DateTime? get endDate {
    final v = rawData['EndDate'] as String?;
    return v != null ? DateTime.tryParse(v) : null;
  }

  List<String> get productionLocations =>
      (rawData['ProductionLocations'] as List?)?.cast<String>() ?? const [];

  String? get albumArtist => rawData['AlbumArtist'] as String?;
  String? get album => rawData['Album'] as String?;
  String? get albumId => rawData['AlbumId']?.toString();
  String? get albumPrimaryImageTag =>
      rawData['AlbumPrimaryImageTag'] as String?;
  List<String> get artists =>
      (rawData['Artists'] as List?)?.cast<String>() ?? const [];
  String? get parentId => rawData['ParentId']?.toString();
  int? get recursiveItemCount => _toInt(rawData['RecursiveItemCount']);
  List<Map<String, dynamic>> get albumArtists =>
      (rawData['AlbumArtists'] as List?)?.cast<Map<String, dynamic>>() ??
      const [];

  Map<String, String> get providerIds {
    final ids = rawData['ProviderIds'] as Map?;
    return ids?.cast<String, String>() ?? const {};
  }

  String? get tmdbId => providerIds['Tmdb'];
  String? get imdbId => providerIds['Imdb'];

  List<Map<String, dynamic>> get people =>
      (rawData['People'] as List?)?.cast<Map<String, dynamic>>() ?? const [];

  List<Map<String, dynamic>> get studios =>
      (rawData['Studios'] as List?)?.cast<Map<String, dynamic>>() ?? const [];

  List<Map<String, dynamic>> get mediaSources =>
      (rawData['MediaSources'] as List?)?.cast<Map<String, dynamic>>() ??
      const [];

  List<Map<String, dynamic>> get mediaStreams =>
      (rawData['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
      const [];

  List<Map<String, dynamic>> get remoteTrailers =>
      (rawData['RemoteTrailers'] as List?)?.cast<Map<String, dynamic>>() ??
      const [];

  List<Map<String, dynamic>> get chapters =>
      (rawData['Chapters'] as List?)?.cast<Map<String, dynamic>>() ?? const [];

  String? get videoResolution {
    for (final stream in mediaStreams) {
      if (stream['Type'] == 'Video') {
        final width = _toInt(stream['Width']);
        final height = _toInt(stream['Height']);
        if (width == null || height == null) return null;
        final interlaced = stream['IsInterlaced'] == true;
        final suffix = interlaced ? 'i' : 'p';

        if (width >= 7600 || height >= 4300) return '8K';
        if (width >= 3800 || height >= 2000) return '4K';
        if (width >= 2500 || height >= 1400) return '1440$suffix';
        if (width >= 1800 || height >= 1000) return '1080$suffix';
        if (width >= 1200 || height >= 700) return '720$suffix';
        if (width >= 600 || height >= 400) return '480$suffix';
        return 'SD';
      }
    }
    return null;
  }

  int? get sourceVideoWidth {
    for (final stream in mediaStreams) {
      if (stream['Type'] == 'Video') return _toInt(stream['Width']);
    }

    for (final source in mediaSources) {
      final streams = source['MediaStreams'] as List?;
      if (streams == null) continue;
      for (final raw in streams) {
        if (raw is! Map) continue;
        if (raw['Type'] == 'Video') {
          return _toInt(raw['Width']);
        }
      }
    }

    return null;
  }

  String? get videoCodec {
    for (final stream in mediaStreams) {
      if (stream['Type'] == 'Video') return stream['Codec'] as String?;
    }
    return null;
  }

  String? get hdrType {
    for (final stream in mediaStreams) {
      if (stream['Type'] == 'Video') {
        final rangeType = stream['VideoRangeType'] as String?;
        if (rangeType != null && rangeType != 'SDR') return rangeType;
        final range = stream['VideoRange'] as String?;
        if (range != null && range != 'SDR') return range;
      }
    }
    return null;
  }

  Map<String, dynamic>? get _defaultAudioStream {
    Map<String, dynamic>? first;
    for (final stream in mediaStreams) {
      if (stream['Type'] == 'Audio') {
        first ??= stream;
        if (stream['IsDefault'] == true) return stream;
      }
    }
    return first;
  }

  String? get audioCodec => _defaultAudioStream?['Codec'] as String?;

  String? get audioProfile => _defaultAudioStream?['Profile'] as String?;

  int? get audioChannels => _toInt(_defaultAudioStream?['Channels']);

  String? get channelLayout {
    final channels = audioChannels;
    if (channels == null) return null;
    return switch (channels) {
      1 => 'Mono',
      2 => 'Stereo',
      6 => '5.1',
      8 => '7.1',
      _ => '${channels}ch',
    };
  }

  String? endsAt({bool use24Hour = false}) {
    final ticks = runTimeTicks;
    if (ticks == null) return null;
    final remaining = runtime!;
    final percentage = playedPercentage;
    final Duration left;
    if (percentage != null && percentage > 0) {
      left = Duration(
        microseconds: (remaining.inMicroseconds * (1.0 - percentage / 100.0))
            .round(),
      );
    } else {
      left = remaining;
    }
    final end = DateTime.now().add(left);
    final hour = end.hour;
    final minute = end.minute.toString().padLeft(2, '0');
    if (use24Hour) {
      return '${hour.toString().padLeft(2, '0')}:$minute';
    }
    final amPm = hour >= 12 ? 'PM' : 'AM';
    final h12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$h12:$minute $amPm';
  }

  String get displayTitle {
    if (type == 'Episode') {
      final series = seriesName ?? '';
      final s = parentIndexNumber;
      final e = indexNumber;
      if (series.isNotEmpty && s != null && e != null) {
        return '$series - S$s:E$e - $name';
      }
    }
    return name;
  }
}
