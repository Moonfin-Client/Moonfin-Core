import 'dart:convert';

import '../../util/platform_detection.dart';

/// One file of a book a server keeps in several (`AbsTracks` from
/// Audiobookshelf), as a download saves it.
typedef BookPart = ({String url, String fileName, int size});

/// The files of a book kept in several, or null for anything kept in one.
List<BookPart>? bookPartsOf(Map<String, dynamic> raw) {
  final tracks = raw['AbsTracks'];
  if (tracks is! List || tracks.length < 2) return null;
  final parts = <BookPart>[];
  for (final (index, track) in tracks.indexed) {
    if (track is! Map || track['Url'] is! String) return null;
    final container = track['Container'] as String? ?? 'mp3';
    parts.add((
      url: track['Url'] as String,
      fileName: 'part${(index + 1).toString().padLeft(3, '0')}.$container',
      size: (track['Size'] as num?)?.toInt() ?? 0,
    ));
  }
  return parts;
}

const bookPartsPlaylistExtension = '.edl';

/// An mpv EDL playlist that plays [paths] back to back as one timeline, so
/// positions and chapters are the whole book's. `%n%` gives a path's length
/// in bytes, which lets it hold any character.
String bookPartsPlaylist(List<String> paths) => [
  '# mpv EDL v0',
  for (final path in paths) '%${utf8.encode(path).length}%$path',
  '',
].join('\n');

bool isBookPartsPlaylist(String url) =>
    url.toLowerCase().endsWith(bookPartsPlaylistExtension);

/// Whether this device can download [raw]: the server allows it and the
/// player here can play what the download saves.
// shortcut: no downloads of books in several files on Apple devices, whose
// player isn't mpv and can't read the parts playlist.
bool downloadableHere(Map<String, dynamic> raw) =>
    raw['CanDownload'] != false &&
    !((PlatformDetection.isApple || PlatformDetection.isAppleTV) &&
        (raw['AbsNumTracks'] as num? ?? 1) > 1);
