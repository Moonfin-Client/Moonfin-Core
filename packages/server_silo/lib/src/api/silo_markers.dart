import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_marker_mapper.dart';
import '../silo_kept_reads.dart';

/// Silo's skip markers (intro, credits, recap, preview) as Moonfin's media
/// segments.
///
/// Silo keeps markers per **file**: `GET /markers/files/{file_id}` answers
/// one file, `GET /markers/items/{item_id}` the first file of an item the
/// profile may play. A film with two versions can have different markers
/// on each, so the segments come from the file that plays: the resolver
/// tells this class which one it started ([notePlayingFile]), and an item
/// with no file noted (its segments asked for before it plays) is read by
/// its id.
///
/// Answers are kept for [ttl] per file, since the player asks again for
/// each item of a queue and on each return to it. An edit in Silo's web app
/// shows on the next play after that.
class SiloMarkers {
  SiloMarkers(this._dio, {DateTime Function()? clock})
    : _segments = SiloKeptReads(lifetime: ttl, clock: clock);

  final Dio _dio;

  static const ttl = Duration(minutes: 5);

  /// The file each item plays (or last played) in this session.
  final _playing = <String, ({String fileId, num? runTimeSeconds})>{};

  /// Segments by file (`file:<id>`), or by item before one is noted
  /// (`item:<id>`). A failed read isn't kept, so the next play asks again.
  final SiloKeptReads<String, List<Map<String, dynamic>>> _segments;

  /// Called by the resolver when [itemId] starts playing [fileId] (the
  /// plan's effective file), with its length when known, which a credits
  /// marker without an end runs to.
  void notePlayingFile(String itemId, String fileId, {num? runTimeSeconds}) {
    _playing[itemId] = (fileId: fileId, runTimeSeconds: runTimeSeconds);
  }

  /// The segments of [itemId]'s playing file, or of its first file. A file
  /// without markers, or one Silo doesn't know, has none.
  Future<List<Map<String, dynamic>>> segmentsOf(String itemId) {
    final playing = _playing[itemId];
    if (playing == null) {
      return _segments.get(
        'item:$itemId',
        () => _read(
          '/api/v2/markers/items/${Uri.encodeComponent(itemId)}',
          itemId,
          null,
        ),
      );
    }
    return _segments.get(
      'file:${playing.fileId}',
      () => _read(
        '/api/v2/markers/files/${Uri.encodeComponent(playing.fileId)}',
        itemId,
        playing.runTimeSeconds,
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _read(
    String path,
    String itemId,
    num? runTimeSeconds,
  ) async {
    try {
      final response = await _dio.get<dynamic>(path);
      final markers = asJsonMap(response.data);
      if (markers == null) return const [];
      return siloMarkersToMediaSegments(
        markers,
        itemId: itemId,
        runTimeSeconds: runTimeSeconds,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return const [];
      rethrow;
    }
  }
}
