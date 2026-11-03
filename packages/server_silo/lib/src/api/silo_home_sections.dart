import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_kept_reads.dart';
import 'silo_items_api.dart' show siloListImageSize;

/// One section of a Silo home or library page, as its layout lists it.
class SiloSectionEntry {
  const SiloSectionEntry({
    required this.id,
    required this.sectionType,
    required this.title,
    this.itemLimit,
  });

  /// From a `SectionLayoutEntry`, or null when it has no id or type.
  static SiloSectionEntry? fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final type = json['section_type'];
    if (id is! String || id.isEmpty || type is! String || type.isEmpty) {
      return null;
    }
    final limit = json['item_limit'];
    return SiloSectionEntry(
      id: id,
      sectionType: type,
      title: json['title'] is String ? json['title'] as String : '',
      itemLimit: limit is num ? limit.toInt() : null,
    );
  }

  /// The section's id on its page (a number for stored sections,
  /// `default-continue-watching` and the like for a library's defaults).
  final String id;

  /// `continue_watching`, `next_up`, `recently_added`, `hidden_gems`…
  final String sectionType;

  final String title;

  /// How many cards Silo puts in the section.
  final int? itemLimit;
}

/// The sections of Silo's home page (`GET /home/layout`,
/// `GET /home/sections/{id}/items`) and of a library's page
/// (`GET /library/{id}/layout`, `.../sections/{section_id}/items`), as the
/// acting profile sees them.
///
/// Moonfin builds its own home rows, but Continue Watching and Next Up only
/// exist on Silo as sections: Silo assembles them per profile (resume points,
/// the next episode of each show, the cards the profile dismissed), and no
/// catalog query gives the same list. So those rows read the cards of the
/// matching sections.
///
/// Both rows load together and need the same sections, so a layout is kept
/// for [layoutTtl] and a section's cards for [itemsTtl], and a read already
/// on its way is shared. A failed read isn't kept.
class SiloHomeSections {
  SiloHomeSections(this._dio, {DateTime Function()? clock})
    : _layouts = SiloKeptReads(lifetime: layoutTtl, clock: clock),
      _items = SiloKeptReads(lifetime: itemsTtl, clock: clock);

  final Dio _dio;

  /// How long a page's layout is reused. Layouts change when the profile
  /// rearranges its home in Silo's web app, rarely.
  static const layoutTtl = Duration(minutes: 1);

  /// How long a section's cards are reused: long enough for the rows that
  /// load together to share one read, short enough that coming back to Home
  /// reads them again.
  static const itemsTtl = Duration(seconds: 5);

  final SiloKeptReads<String, List<SiloSectionEntry>> _layouts;
  final SiloKeptReads<String, List<Map<String, dynamic>>> _items;

  /// The sections of the home page, or of library [libraryId]'s page, in
  /// display order.
  Future<List<SiloSectionEntry>> layout({String? libraryId}) =>
      _layouts.get(_pageKey(libraryId), () => _readLayout(libraryId));

  /// The raw cards (`CatalogItem`s) of [section] on the home page, or on
  /// library [libraryId]'s page.
  Future<List<Map<String, dynamic>>> items(
    SiloSectionEntry section, {
    String? libraryId,
  }) => _items.get(
    '${_pageKey(libraryId)}#${section.id}',
    () => _readItems(section, libraryId),
  );

  /// The cards of every section of [sectionType] on the page, in layout
  /// order and without repeats, or null when the page has no such section.
  ///
  /// A page can hold more than one (an admin's section next to the
  /// built-in one, or one per kind of media), so they are read together.
  Future<List<Map<String, dynamic>>?> cardsOf(
    String sectionType, {
    String? libraryId,
  }) async {
    final sections = [
      for (final s in await layout(libraryId: libraryId))
        if (s.sectionType == sectionType) s,
    ];
    if (sections.isEmpty) return null;
    final lists = await Future.wait([
      for (final s in sections) items(s, libraryId: libraryId),
    ]);
    final seen = <String>{};
    return [
      for (final list in lists)
        for (final card in list)
          if (card['content_id'] case final String id)
            if (seen.add(id)) card,
    ];
  }

  /// Forgets what was read, so the next rows read Silo again.
  void clear() {
    _layouts.forget();
    _items.forget();
  }

  static String _pageKey(String? libraryId) =>
      libraryId == null ? 'home' : 'library:$libraryId';

  Future<List<SiloSectionEntry>> _readLayout(String? libraryId) async {
    final path = libraryId == null
        ? '/api/v2/home/layout'
        : '/api/v2/library/${Uri.encodeComponent(libraryId)}/layout';
    final response = await _dio.get<dynamic>(path);
    final raw = asJsonMap(response.data)?['sections'];
    if (raw is! List) {
      throw FormatException(
        'Expected a page layout from Silo, got ${response.data.runtimeType}',
      );
    }
    return [
      for (final entry in raw)
        if (asJsonMap(entry) case final json?)
          if (SiloSectionEntry.fromJson(json) case final section?) section,
    ];
  }

  Future<List<Map<String, dynamic>>> _readItems(
    SiloSectionEntry section,
    String? libraryId,
  ) async {
    final id = Uri.encodeComponent(section.id);
    final path = libraryId == null
        ? '/api/v2/home/sections/$id/items'
        : '/api/v2/library/${Uri.encodeComponent(libraryId)}/sections/$id/items';
    final response = await _dio.get<dynamic>(
      path,
      queryParameters: const {'image_size': siloListImageSize},
    );
    final raw = asJsonMap(response.data)?['items'];
    if (raw is! List) {
      throw FormatException(
        'Expected a section from Silo, got ${response.data.runtimeType}',
      );
    }
    return [
      for (final card in raw)
        if (asJsonMap(card) case final json?) json,
    ];
  }
}
