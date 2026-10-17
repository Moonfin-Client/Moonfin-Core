/// Plex library section keys share a number space with item ratingKeys, so
/// library views carry this prefix to keep the two apart.
const plexSectionPrefix = 'section-';

const _itemTypes = {
  'movie': 'Movie',
  'show': 'Series',
  'season': 'Season',
  'episode': 'Episode',
  'artist': 'MusicArtist',
  'album': 'MusicAlbum',
  'track': 'Audio',
  'collection': 'BoxSet',
  'playlist': 'Playlist',
  'photo': 'Photo',
};

const _folderTypes = {
  'show',
  'season',
  'artist',
  'album',
  'collection',
  'playlist',
};

const _collectionTypes = {
  'movie': 'movies',
  'show': 'tvshows',
  'artist': 'music',
  'photo': 'photos',
};

/// Plex `type` numbers for the Jellyfin item types a library query names.
const plexTypeNumbers = {
  'Movie': 1,
  'Series': 2,
  'Season': 3,
  'Episode': 4,
  'MusicArtist': 8,
  'MusicAlbum': 9,
  'Audio': 10,
};

const _streamTypes = {1: 'Video', 2: 'Audio', 3: 'Subtitle'};

Map<String, dynamic> plexItemsResult(
  List<Map<String, dynamic>> items, {
  int? total,
  int startIndex = 0,
}) => {
  'Items': items,
  'TotalRecordCount': total ?? items.length,
  'StartIndex': startIndex,
};

Map<String, dynamic> plexSectionToView(Map<String, dynamic> section) => {
  'Id': '$plexSectionPrefix${section['key']}',
  'Name': section['title'],
  'Type': 'CollectionFolder',
  'CollectionType': _collectionTypes[section['type']] ?? 'mixed',
  'IsFolder': true,
  'ImageTags': <String, dynamic>{},
};

/// Turns Plex metadata into the Jellyfin item shape the app reads.
///
/// Image tags hold the Plex image path itself, because a season or episode
/// borrows its backdrop and logo from the show and only the path says which.
Map<String, dynamic> plexItemToJellyfin(Map<String, dynamic> m) {
  final type = m['type'] as String?;
  final id = '${m['ratingKey']}';
  final duration = m['duration'] as int?;
  final viewOffset = m['viewOffset'] as int?;
  final leafCount = m['leafCount'] as int?;
  final viewedLeafCount = m['viewedLeafCount'] as int? ?? 0;
  final viewCount = m['viewCount'] as int? ?? 0;
  final images = <String, String>{
    for (final image in m['Image'] as List? ?? const [])
      if (image is Map && image['url'] is String)
        image['type'] as String: image['url'] as String,
  };
  final isChild = type == 'episode' || type == 'season';
  final seriesId = '${m['grandparentRatingKey'] ?? m['parentRatingKey']}';
  // Seasons and episodes borrow the show's art. Anything else owns its own,
  // even a collection whose art lives outside /library/metadata.
  bool owns(String path) =>
      !isChild || path.startsWith('/library/metadata/$id/');

  final art = m['art'] as String?;
  final logo = images['clearLogo'];
  final sources = [
    for (final media in m['Media'] as List? ?? const [])
      if (media is Map) _mediaSource(media, id),
  ];
  final ratingImage = m['ratingImage'] as String? ?? '';
  final rating = (m['rating'] as num?)?.toDouble();
  final isTrack = type == 'track';
  final (albumArtist, albumArtistId) = switch (type) {
    'album' => (m['parentTitle'], m['parentRatingKey']),
    'track' => (m['grandparentTitle'], m['grandparentRatingKey']),
    _ => (null, null),
  };

  return {
    'Id': id,
    'Name': m['title'],
    if (m['titleSort'] != null) 'SortName': m['titleSort'],
    'Type': _itemTypes[type] ?? 'Video',
    'IsFolder': _folderTypes.contains(type),
    if (type == 'movie' || type == 'episode') 'MediaType': 'Video',
    if (type == 'track') 'MediaType': 'Audio',
    if (m['summary'] != null) 'Overview': m['summary'],
    if (m['year'] != null) 'ProductionYear': m['year'],
    'PremiereDate': ?_date(m['originallyAvailableAt']),
    if (m['addedAt'] case final int addedAt) 'DateCreated': _epoch(addedAt),
    if (duration != null) 'RunTimeTicks': duration * 10000,
    if (m['audienceRating'] case final num audience)
      'CommunityRating': audience.toDouble()
    else if (rating != null && !ratingImage.startsWith('rottentomatoes'))
      'CommunityRating': rating,
    if (rating != null && ratingImage.startsWith('rottentomatoes'))
      'CriticRating': (rating * 10).round(),
    if (m['contentRating'] != null) 'OfficialRating': m['contentRating'],
    'Genres': _tags(m['Genre']),
    if (m['studio'] != null)
      'Studios': [
        {'Name': m['studio']},
      ],
    if (m['tagline'] != null) 'Taglines': [m['tagline']],
    'People': [
      ..._people(m['Role'], 'Actor'),
      ..._people(m['Director'], 'Director'),
      ..._people(m['Writer'], 'Writer'),
    ],
    'ProviderIds': _providerIds(m['Guid']),
    if (m['index'] != null) 'IndexNumber': m['index'],
    if (m['parentIndex'] != null) 'ParentIndexNumber': m['parentIndex'],
    if (m['parentRatingKey'] != null) 'ParentId': '${m['parentRatingKey']}',
    if (isChild) ...{
      'SeriesId': seriesId,
      'SeriesName': m['grandparentTitle'] ?? m['parentTitle'],
      if ((m['grandparentThumb'] ?? m['parentThumb']) case final String thumb)
        'SeriesPrimaryImageTag': thumb,
    },
    if (type == 'episode') ...{
      'SeasonId': '${m['parentRatingKey']}',
      'SeasonName': m['parentTitle'],
    },
    if (albumArtist is String) ...{
      'AlbumArtist': albumArtist,
      'AlbumArtists': [
        {'Name': albumArtist, 'Id': '$albumArtistId'},
      ],
      // A track only names its own artist, in originalTitle, when it differs
      // from the album's.
      'Artists': [isTrack ? m['originalTitle'] ?? albumArtist : albumArtist],
    },
    if (isTrack) ...{
      'Album': m['parentTitle'],
      'AlbumId': '${m['parentRatingKey']}',
      'AlbumPrimaryImageTag': ?m['parentThumb'],
    },
    if (type == 'show' && m['childCount'] != null)
      'ChildCount': m['childCount'],
    if (type == 'season' && leafCount != null) 'ChildCount': leafCount,
    'RecursiveItemCount': ?leafCount,
    'ImageTags': {
      if (m['thumb'] case final String thumb) 'Primary': thumb,
      if (logo != null && owns(logo)) 'Logo': logo,
    },
    'BackdropImageTags': [if (art != null && owns(art)) art],
    if (art != null && !owns(art)) ...{
      'ParentBackdropItemId': seriesId,
      'ParentBackdropImageTags': [art],
    },
    if (logo != null && !owns(logo)) ...{
      'ParentLogoItemId': seriesId,
      'ParentLogoImageTag': logo,
    },
    'UserData': {
      'PlaybackPositionTicks': (viewOffset ?? 0) * 10000,
      'PlayCount': viewCount,
      'IsFavorite': false,
      'Played': leafCount != null
          ? leafCount > 0 && viewedLeafCount >= leafCount
          : viewCount > 0,
      if (leafCount != null) 'UnplayedItemCount': leafCount - viewedLeafCount,
      if (viewOffset != null && duration != null && duration > 0)
        'PlayedPercentage': viewOffset * 100 / duration,
      if (m['lastViewedAt'] case final int lastViewedAt)
        'LastPlayedDate': _epoch(lastViewedAt),
    },
    // An empty list reads as unplayable, so the key stays out without media.
    if (sources.isNotEmpty) ...{
      'MediaSources': sources,
      'MediaStreams': sources.first['MediaStreams'],
    },
  };
}

List<String> _tags(Object? list) => [
  for (final tag in list as List? ?? const [])
    if (tag is Map && tag['tag'] is String) tag['tag'] as String,
];

/// Plex people come with full image URLs, which the image API passes through.
List<Map<String, dynamic>> _people(Object? list, String type) => [
  for (final person in list as List? ?? const [])
    if (person is Map && person['tag'] is String)
      {
        'Id': '${person['id'] ?? person['tag']}',
        'Name': person['tag'],
        'Type': type,
        if (person['role'] != null) 'Role': person['role'],
        if (person['thumb'] case final String thumb) 'PrimaryImageTag': thumb,
      },
];

Map<String, String> _providerIds(Object? guids) {
  const names = {'imdb': 'Imdb', 'tmdb': 'Tmdb', 'tvdb': 'Tvdb'};
  final ids = <String, String>{};
  for (final guid in guids as List? ?? const []) {
    final parts = guid is Map ? '${guid['id']}'.split('://') : const [];
    final name = parts.length == 2 ? names[parts[0]] : null;
    if (name != null) ids[name] = parts[1];
  }
  return ids;
}

Map<String, dynamic> _mediaSource(Map media, String itemId) {
  final part = (media['Part'] as List? ?? const [])
      .whereType<Map>()
      .firstOrNull;
  return {
    'Id': '${media['id']}',
    'ItemId': itemId,
    if (media['container'] != null) 'Container': media['container'],
    if (media['bitrate'] case final int bitrate) 'Bitrate': bitrate * 1000,
    if (media['duration'] case final int duration)
      'RunTimeTicks': duration * 10000,
    if (part?['size'] != null) 'Size': part!['size'],
    'Path': ?part?['file'],
    'MediaStreams': _streams(part),
  };
}

/// Closed captions ride inside the video stream and share its index, so
/// they're left out.
List<Map<String, dynamic>> _streams(Map? part) {
  return [
    for (final stream in part?['Stream'] as List? ?? const [])
      if (stream is Map &&
          _streamTypes[stream['streamType']] != null &&
          stream['embeddedInVideo'] == null)
        {
          'Index': stream['index'] ?? stream['id'],
          'Type': _streamTypes[stream['streamType']],
          if (stream['codec'] != null) 'Codec': stream['codec'],
          if (stream['languageCode'] != null)
            'Language': stream['languageCode'],
          if (stream['displayTitle'] != null)
            'DisplayTitle': stream['displayTitle'],
          if (stream['title'] != null) 'Title': stream['title'],
          'IsDefault': stream['default'] == true,
          'IsForced': stream['forced'] == true,
          'IsHearingImpaired': stream['hearingImpaired'] == true,
          'IsExternal': stream['key'] != null,
          if (stream['key'] case final String key) ...{
            'DeliveryUrl': key,
            'DeliveryMethod': 'External',
            'SupportsExternalStream': true,
          },
          if (stream['width'] != null) 'Width': stream['width'],
          if (stream['height'] != null) 'Height': stream['height'],
          if (stream['channels'] != null) 'Channels': stream['channels'],
          if (stream['bitrate'] case final int bitrate)
            'BitRate': bitrate * 1000,
          if (stream['profile'] != null) 'Profile': stream['profile'],
          if (stream['frameRate'] case final num rate) ...{
            'RealFrameRate': rate.toDouble(),
            'AverageFrameRate': rate.toDouble(),
          },
          'BitDepth': ?stream['bitDepth'],
          'Level': ?stream['level'],
          'SampleRate': ?stream['samplingRate'],
          'ChannelLayout': ?stream['audioChannelLayout'],
          'DvProfile': ?stream['DOVIProfile'],
          'DvBlSignalCompatibilityId': ?stream['DOVIBLCompatID'],
          if (stream['streamType'] == 1) ...{
            'IsInterlaced': stream['scanType'] == 'interlaced',
            ..._videoRange(stream),
          },
        },
  ];
}

/// The dynamic range in the names Jellyfin uses, worked out by Jellyfin's
/// rules, since the app's HDR and Dolby Vision handling reads those names.
Map<String, String> _videoRange(Map stream) {
  String lower(String key) => '${stream[key] ?? ''}'.toLowerCase();
  const pq = 'smpte2084';
  const hlg = 'arib-std-b67';
  final transfer = lower('colorTrc');
  final base = transfer == pq || transfer == hlg ? 'HDR' : 'SDR';
  final hdr10Plus = stream['HDR10PlusPresent'] == true;
  final profile = stream['DOVIProfile'];
  final compat = stream['DOVIBLCompatID'];

  final (String, String) range;
  if (const {5, 7, 8, 10}.contains(profile) &&
      const {0, 1, 2, 4, 6}.contains(compat) &&
      stream['DOVIRPUPresent'] == true &&
      stream['DOVIBLPresent'] == true) {
    final dolby = switch ((profile, compat)) {
      (5, _) || (10, 0) => ('HDR', 'DOVI'),
      (7, _) => ('HDR', 'DOVIWithEL'),
      (8 || 10, 1) => ('HDR', 'DOVIWithHDR10'),
      (8 || 10, 4) => ('HDR', 'DOVIWithHLG'),
      (8 || 10, 2) => ('SDR', 'DOVIWithSDR'),
      _ => (base, 'DOVIInvalid'),
    };
    // A base layer whose colors don't match what it claims is out of spec.
    final expected = switch (dolby.$2) {
      'DOVIWithHDR10' || 'DOVIWithEL' => pq,
      'DOVIWithHLG' => hlg,
      _ => null,
    };
    range =
        expected != null &&
            (lower('colorSpace') != 'bt2020nc' ||
                transfer != expected ||
                lower('colorPrimaries') != 'bt2020')
        ? (base, 'DOVIInvalid')
        : switch (dolby.$2) {
            'DOVIWithHDR10' when hdr10Plus => ('HDR', 'DOVIWithHDR10Plus'),
            'DOVIWithEL' when hdr10Plus => ('HDR', 'DOVIWithELHDR10Plus'),
            _ => dolby,
          };
  } else {
    range = switch (transfer) {
      pq => ('HDR', hdr10Plus ? 'HDR10Plus' : 'HDR10'),
      hlg => ('HDR', 'HLG'),
      _ => ('SDR', 'SDR'),
    };
  }
  return {'VideoRange': range.$1, 'VideoRangeType': range.$2};
}

String? _date(Object? value) {
  final parsed = value is String ? DateTime.tryParse(value) : null;
  if (parsed == null) return null;
  return DateTime.utc(parsed.year, parsed.month, parsed.day).toIso8601String();
}

String _epoch(int seconds) => DateTime.fromMillisecondsSinceEpoch(
  seconds * 1000,
  isUtc: true,
).toIso8601String();
