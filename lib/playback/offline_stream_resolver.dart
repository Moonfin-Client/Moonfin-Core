import 'dart:convert';
import 'dart:io';

import '../data/repositories/offline_repository.dart';
import 'subtitle_formats.dart';

class OfflineStreamResult {
  final String url;
  final List<Map<String, dynamic>> mediaStreams;
  final List<OfflineSubtitle> externalSubtitles;

  /// The original server media source id, so play reports line up.
  final String mediaSourceId;

  /// True when the file was transcoded at download time, meaning the stored
  /// [mediaStreams] describe the original server file, not this one.
  final bool isTranscoded;

  const OfflineStreamResult({
    required this.url,
    required this.mediaStreams,
    this.externalSubtitles = const [],
    required this.mediaSourceId,
    this.isTranscoded = false,
  });
}

class OfflineSubtitle {
  final String path;
  final String? title;
  final String? language;
  final int index;
  final String? codec;

  const OfflineSubtitle({
    required this.path,
    this.title,
    this.language,
    required this.index,
    this.codec,
  });
}

class OfflineStreamResolver {
  final OfflineRepository _offlineRepo;

  OfflineStreamResolver(this._offlineRepo);

  Future<OfflineStreamResult?> resolve(String itemId) async {
    final item = await _offlineRepo.getItem(itemId);
    if (item == null || item.downloadStatus != 2 || item.localFilePath == null) {
      return null;
    }

    final file = File(item.localFilePath!);
    if (!await file.exists()) {
      await _offlineRepo.updateDownloadStatus(itemId, 3, error: 'File not found');
      return null;
    }

    final metadata = jsonDecode(item.metadataJson) as Map<String, dynamic>;
    final rawStreams = (metadata['MediaStreams'] as List?) ?? [];
    final mediaStreams = rawStreams.cast<Map<String, dynamic>>();

    final parentDir = file.parent;
    final fileNameBase = file.uri.pathSegments.last.replaceAll(RegExp(r'\.[^.]+$'), '');

    final subFilesByIndex = <int, File>{};
    final prefix = '${fileNameBase}_sub_';
    if (await parentDir.exists()) {
      await for (final entity in parentDir.list()) {
        if (entity is! File) continue;
        final name = entity.uri.pathSegments.last;
        if (!name.startsWith(prefix)) continue;
        final rest = name.substring(prefix.length);
        final dot = rest.indexOf('.');
        final idx = int.tryParse(dot >= 0 ? rest.substring(0, dot) : rest);
        if (idx != null) subFilesByIndex[idx] = entity;
      }
    }

    final externalSubs = <OfflineSubtitle>[];
    for (final stream in mediaStreams) {
      if (stream['Type'] != 'Subtitle') continue;
      final isExternal = stream['IsExternal'] == true;
      final supportsExternal = stream['SupportsExternalStream'] == true;
      if (!isExternal && !supportsExternal) continue;
      final index = stream['Index'] as int? ?? 0;
      final subFile = subFilesByIndex[index];
      if (subFile == null) continue;
      final fileExt = subFile.uri.pathSegments.last.split('.').last;
      externalSubs.add(OfflineSubtitle(
        path: subFile.path,
        title: stream['DisplayTitle'] as String? ?? stream['Title'] as String?,
        language: stream['Language'] as String?,
        index: index,
        codec: canonicalSubtitleCodec(fileExt),
      ));
    }

    final mediaSources = (metadata['MediaSources'] as List?) ?? const [];
    final mediaSourceId = mediaSources.isNotEmpty && mediaSources.first is Map
        ? ((mediaSources.first as Map)['Id']?.toString() ?? itemId)
        : itemId;

    return OfflineStreamResult(
      url: file.path,
      mediaStreams: mediaStreams,
      externalSubtitles: externalSubs,
      mediaSourceId: mediaSourceId,
      isTranscoded: item.qualityPreset != 'original',
    );
  }
}
