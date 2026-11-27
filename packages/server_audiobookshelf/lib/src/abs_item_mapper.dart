import 'abs_ids.dart';

/// Ticks per second, the unit the app keeps every position and runtime in.
const absTicksPerSecond = 10000000;

/// The runtime an ebook gets. The reader stores an EPUB position as a share
/// of one second's worth of ticks.
const absEbookRunTimeTicks = absTicksPerSecond;

/// The reader stores a PDF or comic position as the zero based page times this.
const absTicksPerPage = 10000;

int? absTicks(Object? seconds) =>
    seconds is num ? (seconds * absTicksPerSecond).round() : null;

double absSeconds(int ticks) => ticks / absTicksPerSecond;

/// The progress fields for a listening position, with its share of
/// [duration] when that's known.
Map<String, dynamic> absPositionBody(double seconds, double? duration) => {
  'currentTime': seconds,
  'duration': ?duration,
  if (duration != null && duration > 0)
    'progress': (seconds / duration).clamp(0.0, 1.0),
};

String? _iso(Object? millis) => millis is num
    ? DateTime.fromMillisecondsSinceEpoch(
        millis.toInt(),
        isUtc: true,
      ).toIso8601String()
    : null;

Map<String, dynamic> absItemsResult(
  List<Map<String, dynamic>> items, {
  int? total,
  int startIndex = 0,
}) => {
  'Items': items,
  'TotalRecordCount': total ?? startIndex + items.length,
  'StartIndex': startIndex,
};

/// A library as one of the app's views. Book libraries hold audiobooks and
/// ebooks side by side, which is what Jellyfin's books type means.
Map<String, dynamic> absLibraryToView(Map<String, dynamic> library) {
  final podcast = library['mediaType'] == 'podcast';
  return {
    'Id': absLibraryId(library['id'] as String),
    'Name': library['name'],
    'Type': 'CollectionFolder',
    'CollectionType': podcast ? 'music' : 'books',
    'IsFolder': true,
    'ImageTags': <String, dynamic>{},
    'SortName': library['name'],
    'AbsMediaType': library['mediaType'],
  };
}

Map<String, dynamic>? _map(Object? value) =>
    value is Map ? value.cast<String, dynamic>() : null;

List<Map<String, dynamic>> absMaps(Object? value) => [
  for (final entry in value as List? ?? const [])
    if (entry is Map) entry.cast<String, dynamic>(),
];

Map<String, dynamic> _unplayed() => {'Played': false, 'PlaybackPositionTicks': 0, 'IsFavorite': false};

String? _ext(Map<String, dynamic>? track) =>
    (_map(track?['metadata'])?['ext'] as String?)?.replaceFirst('.', '');

List<String> _strings(Object? value) => [
  for (final entry in value as List? ?? const [])
    if (entry is String && entry.isNotEmpty) entry,
];

/// Minified items carry names joined by commas instead of lists.
List<String> _names(Object? list, Object? joined) {
  final fromList = [
    for (final entry in list as List? ?? const [])
      if (entry is String && entry.isNotEmpty)
        entry
      else if (entry is Map && entry['name'] is String && entry['name'] != '')
        entry['name'] as String,
  ];
  if (fromList.isNotEmpty) return fromList;
  if (joined is! String || joined.isEmpty) return const [];
  return [
    for (final name in joined.split(','))
      if (name.trim().isNotEmpty) name.trim(),
  ];
}

/// "Name #2" in a minified item's seriesName.
({String name, String? sequence}) _seriesFromName(String joined) {
  final first = joined.split(',').first.trim();
  final hash = first.lastIndexOf(' #');
  if (hash <= 0) return (name: first, sequence: null);
  return (name: first.substring(0, hash), sequence: first.substring(hash + 2));
}

num? _sequenceNumber(String? sequence) =>
    sequence == null ? null : num.tryParse(sequence.trim());

String? _coverTag(Map<String, dynamic> item, Map<String, dynamic>? media) {
  if (media?['coverPath'] == null) return null;
  return '${item['updatedAt'] ?? item['mtimeMs'] ?? 0}';
}

/// The image tag of a series, collection or playlist, which shows its first
/// book's cover. The image API reads the book's id back out of it.
String? _borrowedCoverTag(Map<String, dynamic>? book) {
  if (book == null) return null;
  final tag = _coverTag(book, _map(book['media']));
  return tag == null ? null : '${book['id']}$absCoverItemSeparator$tag';
}

/// Splits a borrowed cover tag into the book it shows and its own tag.
({String itemId, String tag})? absBorrowedCover(String? tag) {
  final at = tag?.indexOf(absCoverItemSeparator) ?? -1;
  if (tag == null || at <= 0) return null;
  return (itemId: tag.substring(0, at), tag: tag.substring(at + 1));
}

const absCoverItemSeparator = '@';

/// [progress] is the signed in user's mediaProgress for the item, when the
/// caller has it.
Map<String, dynamic> absUserData(
  Map<String, dynamic>? progress, {
  required bool ebook,
  String? ebookFormat,
}) {
  if (progress == null) {
    return _unplayed();
  }
  final finished = progress['isFinished'] == true;
  final int position;
  final double share;
  if (ebook) {
    share = (progress['ebookProgress'] as num? ?? 0).toDouble();
    if (ebookFormat == 'pdf') {
      final page = int.tryParse('${progress['ebookLocation'] ?? ''}');
      position = page != null && page > 0 ? (page - 1) * absTicksPerPage : 0;
    } else {
      position = (share.clamp(0.0, 1.0) * absEbookRunTimeTicks).floor();
    }
  } else {
    position = absTicks(progress['currentTime']) ?? 0;
    share = (progress['progress'] as num? ?? 0).toDouble();
  }
  return {
    'Played': finished,
    'PlaybackPositionTicks': finished ? 0 : position,
    'PlayedPercentage': finished ? 100.0 : share * 100,
    'IsFavorite': false,
    'LastPlayedDate': ?_iso(progress['lastUpdate']),
    'HideFromResume': progress['hideFromContinueListening'] == true,
  };
}

List<Map<String, dynamic>> absChapters(Object? chapters) => [
  for (final chapter in absMaps(chapters))
    {
      'StartPositionTicks': absTicks(chapter['start']) ?? 0,
      'Name': chapter['title'] ?? '',
    },
];

/// A book library item, minified or expanded, in the shape of a Jellyfin
/// AudioBook (when it has audio) or Book (an ebook only).
Map<String, dynamic> absBookToJellyfin(
  Map<String, dynamic> item, {
  Map<String, dynamic>? progress,
}) {
  final media = _map(item['media']) ?? const {};
  final metadata = _map(media['metadata']) ?? const {};
  final id = item['id'] as String;
  final duration = media['duration'] as num? ?? 0;
  final tracks = absMaps(media['tracks']);
  final audioFiles = absMaps(media['audioFiles']);
  final numTracks =
      media['numTracks'] as int? ??
      media['numAudioFiles'] as int? ??
      (tracks.isNotEmpty ? tracks.length : audioFiles.length);
  final hasAudio = numTracks > 0 || duration > 0;
  final ebookFile = _map(media['ebookFile']);
  final ebookFormat =
      (media['ebookFormat'] ?? ebookFile?['ebookFormat']) as String?;
  final isEbook = !hasAudio && ebookFormat != null;

  final authors = _names(metadata['authors'], metadata['authorName']);
  final authorRefs = [
    for (final author in absMaps(metadata['authors']))
      if (author['id'] case final String authorId)
        {'Name': author['name'], 'Id': absAuthorId(authorId)},
  ];
  final narrators = _names(metadata['narrators'], metadata['narratorName']);

  final seriesList = absMaps(metadata['series']);
  String? seriesName;
  String? seriesId;
  String? sequence;
  if (seriesList.isNotEmpty) {
    seriesName = seriesList.first['name'] as String?;
    seriesId = seriesList.first['id'] as String?;
    sequence = seriesList.first['sequence'] as String?;
  } else if (metadata['seriesName'] case final String joined
      when joined.isNotEmpty) {
    final parsed = _seriesFromName(joined);
    seriesName = parsed.name;
    sequence = parsed.sequence;
  }

  final ebookPath =
      _map(ebookFile?['metadata'])?['filename'] as String? ??
      (ebookFormat == null ? null : '${metadata['title'] ?? id}.$ebookFormat');
  final tag = _coverTag(item, media);
  final year = int.tryParse('${metadata['publishedYear'] ?? ''}');
  final runTimeTicks = isEbook ? absEbookRunTimeTicks : absTicks(duration);
  final firstTrack = tracks.isNotEmpty ? tracks.first : null;
  final trackExt = _ext(firstTrack);
  final Object? sourcePath;
  if (isEbook) {
    sourcePath = ebookPath;
  } else if (numTracks == 1) {
    sourcePath = _map(firstTrack?['metadata'])?['filename'];
  } else {
    sourcePath = '${item['relPath'] ?? ''}'.split('/').last;
  }
  final Object? fileSize;
  if (isEbook) {
    fileSize = _map(ebookFile?['metadata'])?['size'];
  } else if (numTracks == 1) {
    fileSize = _map(firstTrack?['metadata'])?['size'];
  } else {
    fileSize = media['size'];
  }
  final mediaSource = {
    'Id': id,
    'Container': ?(isEbook ? ebookFormat : trackExt),
    'Path': ?sourcePath,
    'Size': ?fileSize,
    'RunTimeTicks': ?runTimeTicks,
    if (isEbook && ebookFile != null) 'DirectStreamUrl': '/api/items/$id/ebook',
    if (!isEbook && numTracks == 1 && firstTrack?['contentUrl'] != null)
      'DirectStreamUrl': firstTrack!['contentUrl'],
    'MediaStreams': [
      if (!isEbook)
        {
          'Type': 'Audio',
          'Index': 0,
          'Codec': ?firstTrack?['codec'],
          'Channels': ?firstTrack?['channels'],
          'IsDefault': true,
        },
    ],
  };

  return {
    'Id': id,
    'Name': metadata['title'] ?? '',
    'SortName': metadata['titleIgnorePrefix'] ?? metadata['title'] ?? '',
    'Type': isEbook ? 'Book' : 'AudioBook',
    'MediaType': isEbook ? 'Book' : 'Audio',
    'IsFolder': false,
    'ParentId': absLibraryId(item['libraryId'] as String? ?? ''),
    'Overview': ?metadata['description'],
    'Subtitle': ?metadata['subtitle'],
    'ProductionYear': ?year,
    'PremiereDate': ?(year == null ? null : '$year-01-01T00:00:00.000Z'),
    'DateCreated': ?_iso(item['addedAt']),
    'Genres': _strings(metadata['genres']),
    'GenreItems': [
      for (final genre in _strings(metadata['genres']))
        {'Name': genre, 'Id': absGenreId(genre)},
    ],
    'Tags': _strings(media['tags']),
    'Studios': [
      if (metadata['publisher'] case final String publisher
          when publisher.isNotEmpty)
        {'Name': publisher},
    ],
    'SeriesName': ?seriesName,
    'SeriesId': ?(seriesId == null ? null : absSeriesId(seriesId)),
    'IndexNumber': ?_sequenceNumber(sequence)?.toInt(),
    'AbsSequence': ?sequence,
    'AlbumArtist': ?(authors.isEmpty ? null : authors.join(', ')),
    'Artists': authors,
    'AlbumArtists': authorRefs,
    'ArtistItems': authorRefs,
    'People': [
      for (final author in authors) {'Name': author, 'Type': 'Author'},
      for (final narrator in narrators)
        {'Name': narrator, 'Type': 'Narrator', 'Role': 'Narrator'},
    ],
    'RunTimeTicks': ?runTimeTicks,
    'Chapters': absChapters(media['chapters']),
    'ImageTags': {'Primary': ?tag},
    'PrimaryImageAspectRatio': 1.0,
    'UserData': absUserData(
      progress ?? _map(item['userMediaProgress']) ?? _map(item['mediaProgress']),
      ebook: isEbook,
      ebookFormat: ebookFormat,
    ),
    'Path': ?(isEbook ? ebookPath : item['relPath'] ?? item['path']),
    'Container': ?(isEbook ? ebookFormat : trackExt),
    'MediaSources': [mediaSource],
    'LocationType': 'FileSystem',
    'CanDelete': false,
    'CanDownload': isEbook || hasAudio,
    'AbsLibraryId': item['libraryId'],
    'AbsNumTracks': numTracks,
    // A download of a book in several files saves each one.
    if (!isEbook && tracks.length > 1)
      'AbsTracks': [
        for (final track in tracks)
          {
            'Url': ?track['contentUrl'],
            'Duration': ?track['duration'],
            'Size': ?_map(track['metadata'])?['size'],
            'Container': ?_ext(track),
          },
      ],
    'AbsEbookFormat': ?ebookFormat,
    'AbsHasEbook': ebookFormat != null,
    'Language': ?metadata['language'],
    'ProviderIds': {
      'Isbn': ?metadata['isbn'],
      'Asin': ?metadata['asin'],
    },
  };
}

/// A podcast library item as an album, so its episodes list like tracks.
Map<String, dynamic> absPodcastToJellyfin(Map<String, dynamic> item) {
  final media = _map(item['media']) ?? const {};
  final metadata = _map(media['metadata']) ?? const {};
  final id = item['id'] as String;
  final author = metadata['author'] as String?;
  final tag = _coverTag(item, media);
  final episodes = absMaps(media['episodes']);
  return {
    'Id': id,
    'Name': metadata['title'] ?? '',
    'SortName': metadata['titleIgnorePrefix'] ?? metadata['title'] ?? '',
    'Type': 'MusicAlbum',
    'MediaType': 'Audio',
    'IsFolder': true,
    'ParentId': absLibraryId(item['libraryId'] as String? ?? ''),
    'Overview': ?metadata['description'],
    'DateCreated': ?_iso(item['addedAt']),
    'Genres': _strings(metadata['genres']),
    'Tags': _strings(media['tags']),
    'AlbumArtist': ?author,
    'Artists': [?author],
    'AlbumArtists': [
      if (author != null) {'Name': author},
    ],
    'ImageTags': {'Primary': ?tag},
    'PrimaryImageAspectRatio': 1.0,
    'ChildCount':
        media['numEpisodes'] as int? ??
        (episodes.isEmpty ? null : episodes.length),
    'UserData': _unplayed(),
    'LocationType': 'FileSystem',
    'CanDelete': false,
    'CanDownload': true,
    'AbsLibraryId': item['libraryId'],
  };
}

/// A podcast episode as one of its album's tracks.
Map<String, dynamic> absEpisodeToJellyfin(
  Map<String, dynamic> podcast,
  Map<String, dynamic> episode, {
  Map<String, dynamic>? progress,
}) {
  final media = _map(podcast['media']) ?? const {};
  final metadata = _map(media['metadata']) ?? const {};
  final podcastId = podcast['id'] as String;
  final episodeId = episode['id'] as String;
  final audioFile = _map(episode['audioFile']);
  final duration =
      episode['duration'] as num? ??
      audioFile?['duration'] as num? ??
      _map(episode['audioTrack'])?['duration'] as num?;
  final author = metadata['author'] as String?;
  final tag = _coverTag(podcast, media);
  return {
    'Id': absEpisodeId(podcastId, episodeId),
    'Name': episode['title'] ?? '',
    'SortName': episode['title'] ?? '',
    'Type': 'Audio',
    'MediaType': 'Audio',
    'IsFolder': false,
    'ParentId': podcastId,
    'AlbumId': podcastId,
    'Album': metadata['title'],
    'AlbumPrimaryImageTag': ?tag,
    'AlbumArtist': ?author,
    'Artists': [?author],
    'Overview': ?(episode['subtitle'] ?? episode['description']),
    'IndexNumber': ?int.tryParse('${episode['episode'] ?? episode['index'] ?? ''}'),
    'ParentIndexNumber': ?int.tryParse('${episode['season'] ?? ''}'),
    'PremiereDate': ?_iso(episode['publishedAt']),
    'DateCreated': ?_iso(episode['addedAt']),
    'RunTimeTicks': ?absTicks(duration),
    'Chapters': absChapters(episode['chapters']),
    'ImageTags': {'Primary': ?tag},
    'PrimaryImageAspectRatio': 1.0,
    'UserData': absUserData(progress, ebook: false),
    'Path': ?_map(audioFile?['metadata'])?['filename'],
    'LocationType': 'FileSystem',
    'CanDelete': false,
    'CanDownload': true,
    'AbsLibraryId': podcast['libraryId'],
  };
}

Map<String, dynamic> absItemToJellyfin(
  Map<String, dynamic> item, {
  Map<String, dynamic>? progress,
}) => item['mediaType'] == 'podcast'
    ? absPodcastToJellyfin(item)
    : absBookToJellyfin(item, progress: progress);

/// A series as a folder of books, with the first covers for its stacked look.
Map<String, dynamic> absSeriesToJellyfin(Map<String, dynamic> series) {
  final books = absMaps(series['books']);
  final first = books.isEmpty ? null : books.first;
  final firstTag = _borrowedCoverTag(first);
  return {
    'Id': absSeriesId(series['id'] as String),
    'Name': series['name'] ?? '',
    'SortName': series['nameIgnorePrefix'] ?? series['name'] ?? '',
    'Type': 'Folder',
    'IsFolder': true,
    'ParentId': ?(series['libraryId'] == null
        ? null
        : absLibraryId(series['libraryId'] as String)),
    'Overview': ?series['description'],
    'DateCreated': ?_iso(series['addedAt']),
    'ChildCount': books.isEmpty ? null : books.length,
    'ImageTags': {'Primary': ?firstTag},
    'StackCovers': [
      for (final book in books.take(3))
        if (_coverTag(book, _map(book['media'])) case final String tag)
          {'Id': book['id'], 'Tag': tag},
    ],
    'UserData': _unplayed(),
  };
}

Map<String, dynamic> absAuthorToJellyfin(Map<String, dynamic> author) => {
  'Id': absAuthorId(author['id'] as String),
  'Name': author['name'] ?? '',
  'SortName': author['lastFirst'] ?? author['name'] ?? '',
  'Type': 'MusicArtist',
  'IsFolder': true,
  'Overview': ?author['description'],
  'ImageTags': {
    'Primary': ?(author['imagePath'] == null
        ? null
        : '${author['updatedAt'] ?? 0}'),
  },
  'ChildCount': ?author['numBooks'],
  'UserData': _unplayed(),
};

Map<String, dynamic> absCollectionToJellyfin(Map<String, dynamic> collection) {
  final books = absMaps(collection['books']);
  final first = books.isEmpty ? null : books.first;
  final firstTag = _borrowedCoverTag(first);
  return {
    'Id': absCollectionId(collection['id'] as String),
    'Name': collection['name'] ?? '',
    'SortName': collection['name'] ?? '',
    'Type': 'BoxSet',
    'IsFolder': true,
    'Overview': ?collection['description'],
    'DateCreated': ?_iso(collection['createdAt']),
    'ChildCount': books.length,
    'ImageTags': {'Primary': ?firstTag},
    'UserData': _unplayed(),
  };
}

Map<String, dynamic> absPlaylistToJellyfin(Map<String, dynamic> playlist) {
  final entries = absMaps(playlist['items']);
  final first = entries.isEmpty ? null : _map(entries.first['libraryItem']);
  final firstTag = _borrowedCoverTag(first);
  return {
    'Id': absPlaylistId(playlist['id'] as String),
    'Name': playlist['name'] ?? '',
    'SortName': playlist['name'] ?? '',
    'Type': 'Playlist',
    'MediaType': 'Audio',
    'IsFolder': true,
    'Overview': ?playlist['description'],
    'ChildCount': entries.length,
    'ImageTags': {'Primary': ?firstTag},
    'UserData': _unplayed(),
  };
}

Map<String, dynamic> absGenreToJellyfin(String name) => {
  'Id': absGenreId(name),
  'Name': name,
  'SortName': name,
  'Type': 'Genre',
  'IsFolder': true,
  'ImageTags': <String, dynamic>{},
};
