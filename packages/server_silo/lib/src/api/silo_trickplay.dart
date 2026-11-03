import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_trickplay_mapper.dart';
import '../silo_image_registry.dart';

/// Silo's seek previews for the file that plays.
///
/// `GET /watch/{id}/trickplay?file_id=` answers one file's sprite sheets
/// (`WatchTrickplay`), mapped to Jellyfin's `Trickplay` field by
/// `siloTrickplayToJellyfin`, which also records each sheet's URL in the
/// image registry under the file id. `ImageApi.getTrickplayTileImageUrl`
/// answers from there.
///
/// **Expiry.** Sheet URLs carry their own authorization and stop working at
/// `expires_at`, after which the previews must be read again for fresh
/// URLs. An answer is kept until [refreshMargin] before that. A player keeps
/// the grid it read (it doesn't change), so the URLs are refreshed when it
/// asks for a sheet: [touch] reads the previews again in the background once
/// the file's are due, and the registry then hands out the new URLs. Sheets
/// already loaded stay in the image cache, which keys signed artwork by path.
///
/// A file without previews (404) is remembered as such for [missTtl], so a
/// queue of episodes doesn't ask again on every return to one.
class SiloTrickplay {
  SiloTrickplay(this._dio, {this.images, DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  final Dio _dio;
  final SiloImageRegistry? images;
  final DateTime Function() _clock;

  static const refreshMargin = Duration(minutes: 2);
  static const missTtl = Duration(minutes: 10);

  final _files = <String, _Entry>{};

  /// The `Trickplay` field for [fileId] of [itemId], or null without
  /// previews.
  Future<Map<String, dynamic>?> manifest(String itemId, String fileId) {
    final entry = _files[fileId];
    if (entry != null && !entry.due(_clock())) {
      return Future.value(entry.manifest);
    }
    return _read(itemId, fileId);
  }

  /// A sheet of [fileId] is about to be loaded: reads the previews again in
  /// the background when their URLs are due.
  void touch(String fileId) {
    final entry = _files[fileId];
    if (entry == null || entry.reading != null || !entry.due(_clock())) return;
    if (entry.missing) return;
    unawaited(_read(entry.itemId, fileId).then((_) {}, onError: (_) {}));
  }

  Future<Map<String, dynamic>?> _read(String itemId, String fileId) {
    final existing = _files[fileId];
    final inFlight = existing?.reading;
    if (inFlight != null) return inFlight;
    final entry = existing ?? _Entry(itemId);
    _files[fileId] = entry;
    final reading = _fetch(entry, fileId);
    entry.reading = reading;
    return reading.whenComplete(() => entry.reading = null);
  }

  Future<Map<String, dynamic>?> _fetch(_Entry entry, String fileId) async {
    final now = _clock();
    final itemId = entry.itemId;
    try {
      final response = await _dio.get<dynamic>(
        '/api/v2/watch/${Uri.encodeComponent(itemId)}/trickplay',
        queryParameters: {'file_id': fileId},
      );
      final json = asJsonMap(response.data);
      final mapped = json == null
          ? null
          : siloTrickplayToJellyfin(json, images: images);
      final expires = DateTime.tryParse('${json?[_expiresAt]}');
      entry
        ..manifest = mapped
        ..missing = mapped == null
        ..validUntil = mapped == null
            ? now.add(missTtl)
            : (expires ?? now.add(missTtl)).subtract(refreshMargin);
      return mapped;
    } on DioException catch (error) {
      if (error.response?.statusCode != 404) {
        // A failed read isn't kept, unless an older answer is still there
        // to fall back on.
        if (entry.manifest == null && identical(_files[fileId], entry)) {
          _files.remove(fileId);
        }
        rethrow;
      }
      entry
        ..manifest = null
        ..missing = true
        ..validUntil = now.add(missTtl);
      return null;
    }
  }

  static const _expiresAt = 'expires_at';
}

class _Entry {
  _Entry(this.itemId);

  final String itemId;
  Map<String, dynamic>? manifest;
  bool missing = false;
  DateTime? validUntil;
  Future<Map<String, dynamic>?>? reading;

  bool due(DateTime now) {
    final until = validUntil;
    return until == null || !now.isBefore(until);
  }
}
