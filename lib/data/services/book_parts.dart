import 'dart:convert';

/// One file of a book a server keeps in several (`AbsTracks` from
/// Audiobookshelf), as a download saves it.
typedef BookPart = ({String url, String fileName, int size, Duration length});

/// A downloaded part and how long it plays.
typedef BookPartFile = ({String path, Duration length});

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
      length: Duration(
        milliseconds: (((track['Duration'] as num?) ?? 0) * 1000).round(),
      ),
    ));
  }
  return parts;
}

const bookPartsPlaylistExtension = '.edl';

/// An mpv EDL playlist that plays [parts] back to back as one timeline, so
/// positions and chapters are the whole book's. `%n%` gives a path's length
/// in bytes, which lets it hold any character. mpv skips the comment lines,
/// which give the Apple player each part's length.
String bookPartsPlaylist(List<BookPartFile> parts) => [
  '# mpv EDL v0',
  for (final part in parts) ...[
    '# length ${part.length.inMilliseconds}',
    '%${utf8.encode(part.path).length}%${part.path}',
  ],
  '',
].join('\n');

/// The parts a playlist from [bookPartsPlaylist] lists, or null when [bytes]
/// is not one or a part has no length.
List<BookPartFile>? readBookPartsPlaylist(List<int> bytes) {
  const newline = 10, hash = 35, percent = 37;
  int lineEnd(int from) {
    final end = bytes.indexOf(newline, from);
    return end < 0 ? bytes.length : end;
  }

  final lengthLine = RegExp(r'^# length (\d+)$');
  final parts = <BookPartFile>[];
  Duration? length;
  var i = 0;
  while (i < bytes.length) {
    if (bytes[i] == newline) {
      i++;
    } else if (bytes[i] == hash) {
      final end = lineEnd(i);
      final ms = lengthLine
          .firstMatch(utf8.decode(bytes.sublist(i, end)))
          ?.group(1);
      if (ms != null) length = Duration(milliseconds: int.parse(ms));
      i = end + 1;
    } else if (bytes[i] == percent) {
      final close = bytes.indexOf(percent, i + 1);
      final size = close < 0
          ? null
          : int.tryParse(String.fromCharCodes(bytes.sublist(i + 1, close)));
      if (size == null || size < 0 || close + 1 + size > bytes.length) {
        return null;
      }
      if (length == null || length <= Duration.zero) return null;
      final end = close + 1 + size;
      parts.add((
        path: utf8.decode(bytes.sublist(close + 1, end)),
        length: length,
      ));
      length = null;
      i = lineEnd(end) + 1;
    } else {
      return null;
    }
  }
  return parts.isEmpty ? null : parts;
}

bool isBookPartsPlaylist(String url) =>
    url.toLowerCase().endsWith(bookPartsPlaylistExtension);

/// Whether the server lets [raw] be downloaded.
bool serverAllowsDownload(Map<String, dynamic> raw) =>
    raw['CanDownload'] != false;

/// One timeline over the parts of a book downloaded in several files, for a
/// player that opens one file at a time.
class BookPartsTimeline {
  BookPartsTimeline(this.parts) {
    var at = Duration.zero;
    for (final part in parts) {
      starts.add(at);
      at += part.length;
    }
  }

  final List<BookPartFile> parts;
  final List<Duration> starts = [];

  Duration get length => starts.last + parts.last.length;

  /// The part that plays [position] in the book, and how far into it.
  ({int index, Duration offset}) locate(Duration position) {
    var index = parts.length - 1;
    while (index > 0 && starts[index] > position) {
      index--;
    }
    final offset = position - starts[index];
    if (offset < Duration.zero) return (index: 0, offset: Duration.zero);
    final length = parts[index].length;
    return (index: index, offset: offset > length ? length : offset);
  }
}
