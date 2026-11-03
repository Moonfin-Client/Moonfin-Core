/// A server that prepares downloads itself and keeps a registry of the files
/// each device holds (Silo's managed downloads).
///
/// Moonfin's download service builds Jellyfin and Emby download URLs itself.
/// For a server whose client provides this API ([ServerDownloadsProvider]),
/// it asks the server for the file to fetch instead ([prepareDownload]), and
/// tells it when the file is on the device ([downloadFinished]) or gone again
/// ([downloadsRemoved]). Everything else (the transfer engines, storage,
/// offline catalog) stays the same.
abstract interface class ServerDownloadsApi {
  /// Registers the download of [request]'s item with the server and answers
  /// the file to fetch once the server has it ready.
  ///
  /// A converted file takes the server a while to make: until it's ready,
  /// [onPreparing] hears how far along it is, and [isCancelled] is asked
  /// between checks. Once it answers true the wait ends with
  /// [ServerDownloadCancelled].
  ///
  /// Throws [ServerDownloadRefused] when the server won't provide this
  /// download (no file, a quality it can't make, downloads switched off),
  /// with its reason. Other failures (network, server errors) pass through.
  Future<ServerDownloadTicket> prepareDownload(
    ServerDownloadRequest request, {
    void Function(ServerDownloadPreparation preparation)? onPreparing,
    bool Function()? isCancelled,
  });

  /// Whether the server makes converted downloads capped at [maxVideoBitrate]
  /// (bit/s) for this account.
  Future<bool> convertsDownloadsAt(int maxVideoBitrate);

  /// A link a browser can open to download [request]'s item, for the web
  /// build, where downloads go through the browser and carry no headers.
  /// Null when the server has none for this request.
  Future<Uri?> browserDownloadUrl(ServerDownloadRequest request);

  /// The file of [ticket] is complete on the device.
  Future<void> downloadFinished(ServerDownloadTicket ticket);

  /// Where to fetch [ticket]'s artwork, by kind, to keep it with the
  /// download (with [ServerDownloadTicket.headers]). Kinds the item has no
  /// artwork for are left out.
  Future<Map<ServerDownloadArtworkKind, Uri>> downloadArtwork(
    ServerDownloadTicket ticket,
  );

  /// The subtitle files to keep beside [ticket]'s file (with
  /// [ServerDownloadTicket.headers]), each named by the stream of
  /// [mediaSource] it stands for. Subtitles already inside the file are
  /// left out.
  Future<List<ServerDownloadSubtitle>> downloadSubtitles(
    ServerDownloadTicket ticket, {
    required Map<String, dynamic> mediaSource,
  });

  /// The downloads of [itemIds] were deleted from the device (movies and
  /// episodes, so a deleted season or series names each of its episodes).
  Future<void> downloadsRemoved(Iterable<String> itemIds);
}

/// A client that offers [ServerDownloadsApi].
abstract interface class ServerDownloadsProvider {
  ServerDownloadsApi get serverDownloads;
}

/// What to download.
class ServerDownloadRequest {
  const ServerDownloadRequest({
    required this.itemId,
    this.seriesId,
    this.mediaSourceId,
    this.maxVideoBitrate,
    this.maxWidth,
  });

  /// The movie or episode.
  final String itemId;

  final String? seriesId;

  /// The version (media source) to download, or null to let the server
  /// choose.
  final String? mediaSourceId;

  /// Video bitrate cap in bits per second, or null for the original file.
  final int? maxVideoBitrate;

  /// Width cap in pixels, or null for the original file.
  final int? maxWidth;

  /// Whether this asks for the original file rather than a converted one.
  bool get original => maxVideoBitrate == null;
}

/// A file the server has ready for download.
class ServerDownloadTicket {
  const ServerDownloadTicket({
    required this.id,
    required this.itemId,
    required this.url,
    required Map<String, String> Function() headers,
    this.revision,
    this.sizeBytes,
    this.container,
    this.mediaSourceId,
  }) : _headers = headers;

  /// The server's id of this download.
  final String id;

  /// The movie or episode it is for.
  final String itemId;

  /// Where to fetch the file. It supports ranged requests.
  final Uri url;

  /// Headers every request for [url] needs (credentials), read when used:
  /// the login may have been refreshed since the ticket was made.
  Map<String, String> get headers => _headers();
  final Map<String, String> Function() _headers;

  /// The server's revision of the download entry, when it keeps one.
  final int? revision;

  /// The file's size in bytes, when the server knows it.
  final int? sizeBytes;

  /// The file's container (`mp4`), when it isn't the source's own.
  final String? container;

  /// The version (media source) the file is of, when the server says.
  final String? mediaSourceId;
}

/// A subtitle file a server keeps for a download.
class ServerDownloadSubtitle {
  const ServerDownloadSubtitle({
    required this.url,
    required this.streamIndex,
    required this.format,
    this.stream,
  });

  final Uri url;

  /// The `Index` of the media source's subtitle stream it is.
  final int streamIndex;

  /// Its format, as a file extension (`srt`, `vtt`, `ass`, `sup`).
  final String format;

  /// The stream to add to the download's media source, for a subtitle the
  /// server keeps beside the file, which the media source doesn't list.
  final Map<String, dynamic>? stream;
}

/// The server won't provide a download.
class ServerDownloadRefused implements Exception {
  const ServerDownloadRefused(this.message, {this.reason});

  /// Readable text for the person (the server's, when it gave one).
  final String message;

  /// The server's code for why (`no_file`, `quality_unavailable`…).
  final String? reason;

  @override
  String toString() => message;
}

/// How far the server has got making a converted file.
class ServerDownloadPreparation {
  const ServerDownloadPreparation({
    this.progress,
    this.remainingSeconds,
    this.queuePosition,
  });

  /// Fraction made, 0 to 1, while the server reports it.
  final double? progress;

  /// Estimated seconds left, while the server reports it.
  final int? remainingSeconds;

  /// Place in the server's queue while it waits to start.
  final int? queuePosition;
}

/// The wait for a server-prepared file ended because the download was
/// canceled.
class ServerDownloadCancelled implements Exception {
  const ServerDownloadCancelled();

  @override
  String toString() => 'ServerDownloadCancelled';
}

/// Artwork a server keeps for a download.
enum ServerDownloadArtworkKind {
  /// A movie's poster, or an episode's still.
  poster,

  /// The backdrop (an episode's: its series').
  backdrop,

  logo,

  /// An episode's series poster.
  seriesPoster,
}
