import 'package:server_core/server_core.dart';

import '../silo_image_registry.dart';
import 'silo_ticks.dart';

/// A version's chapters (`VersionChapter`: `index`, `title`,
/// `start_seconds`, `end_seconds`, `thumbnail_url`) as Jellyfin's
/// `Chapters`, in start order.
///
/// Each thumbnail is recorded in [images] under [itemId] as a
/// [SiloImageType.chapter] at the chapter's place in the list, which is the
/// `index` Moonfin passes to `getChapterImageUrl`. Its tag is the chapter's
/// `ImageTag`. Without a thumbnail or a registry a chapter has no tag, and
/// Moonfin shows its usual placeholder.
///
/// Emby also lists intro and credit markers as chapters (`IntroStart`…).
/// Silo keeps those apart as marker segments, which Moonfin reads as media
/// segments, so only real chapters are listed here.
List<Map<String, dynamic>> siloChaptersToJellyfin(
  Map<String, dynamic> version, {
  required String itemId,
  SiloImageRegistry? images,
}) {
  final raw = version['chapters'];
  if (raw is! List) return const [];
  final chapters = <Map<String, dynamic>>[
    for (final c in raw)
      if (asJsonMap(c) case final chapter? when chapter['start_seconds'] is num)
        chapter,
  ];
  // Stable: chapters starting together keep Silo's order.
  final ordered = [for (final (i, c) in chapters.indexed) (i, c)]
    ..sort((a, b) {
      final byStart = (a.$2['start_seconds'] as num).compareTo(
        b.$2['start_seconds'] as num,
      );
      return byStart != 0 ? byStart : a.$1.compareTo(b.$1);
    });

  return [
    for (final (position, (_, chapter)) in ordered.indexed)
      _chapter(chapter, position, itemId, images),
  ];
}

Map<String, dynamic> _chapter(
  Map<String, dynamic> chapter,
  int position,
  String itemId,
  SiloImageRegistry? images,
) {
  final title = chapter['title'];
  final tag = images?.register(
    itemId,
    SiloImageType.chapter,
    chapter['thumbnail_url'] as String?,
    index: position,
  );
  final start = chapter['start_seconds'] as num;
  return {
    'StartPositionTicks': secondsToTicks(start < 0 ? 0 : start),
    'Name': ?jsonText(title),
    'ImageTag': ?tag,
    'MarkerType': 'Chapter',
    'ChapterIndex': position,
  };
}
