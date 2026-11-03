import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../silo_kept_reads.dart';
import 'silo_items_api.dart';

/// Moonfin's `AdminItemsApi` on Silo: identifying an item, refreshing its
/// metadata and picking its artwork, through Silo's admin item routes.
/// Silo checks that the login may change the item.
///
/// Silo has no route for uploading or deleting an item's artwork, and
/// Moonfin doesn't edit Silo metadata yet.
class SiloAdminItemsApi implements AdminItemsApi {
  SiloAdminItemsApi(this._dio, this._items);

  final Dio _dio;
  final SiloItemsApi _items;

  /// An item's artwork choices, reused for two minutes. Each read asks the
  /// providers again, and the artwork dialog reads one list per kind of
  /// artwork it shows.
  final _imageChoices = SiloKeptReads<String, List<Map<String, dynamic>>>(
    lifetime: const Duration(minutes: 2),
  );

  Future<List<Map<String, dynamic>>> _choicesOf(
    String itemId, {
    bool refresh = false,
  }) => _imageChoices.get(
    itemId,
    () => _readImageChoices(itemId),
    refresh: refresh,
  );

  /// Silo's artwork kinds by Moonfin's.
  static const _artworkTypes = {
    ImageType.primary: 'poster',
    ImageType.backdrop: 'backdrop',
    ImageType.logo: 'logo',
  };

  /// Provider id names, Silo's key to Jellyfin's.
  static const _providerKeys = {'tmdb': 'Tmdb', 'imdb': 'Imdb', 'tvdb': 'Tvdb'};

  /// What a provider is called on screen, by Silo's key.
  static const _providerNames = {
    'tmdb': 'TheMovieDb',
    'imdb': 'IMDb',
    'tvdb': 'TheTVDB',
  };

  static String _providerName(Object? key) => _providerNames[key] ?? '$key';

  /// Key in a search result holding Silo's own provider ids, which applying
  /// the match sends back as they came.
  static const siloProviderIdsKey = 'SiloProviderIds';

  static String _path(String itemId) =>
      '/api/v2/admin/items/${Uri.encodeComponent(itemId)}';

  static Never _noEditor() =>
      throw UnsupportedError("Moonfin doesn't edit Silo metadata yet");

  @override
  Future<Map<String, dynamic>> getMetadataEditor(String itemId) async =>
      _noEditor();

  @override
  Future<void> updateItem(String itemId, Map<String, dynamic> itemData) async =>
      _noEditor();

  @override
  Future<void> updateContentType(String itemId, String contentType) async =>
      _noEditor();

  /// `POST .../refresh-metadata`, which queues a job. A full refresh is
  /// Silo's `complete` mode, anything else `quick`.
  @override
  Future<void> refreshItem(
    String itemId, {
    bool? recursive,
    bool? replaceAllMetadata,
    bool? replaceAllImages,
    bool? regenerateTrickplay,
    MetadataRefreshMode metadataRefreshMode =
        MetadataRefreshMode.defaultRefresh,
    MetadataRefreshMode imageRefreshMode = MetadataRefreshMode.defaultRefresh,
  }) => _dio.post<dynamic>(
    '${_path(itemId)}/refresh-metadata',
    data: {
      'mode':
          replaceAllMetadata == true ||
              metadataRefreshMode == MetadataRefreshMode.fullRefresh
          ? 'complete'
          : 'quick',
    },
  );

  /// The ids Silo's match search takes.
  @override
  Future<List<Map<String, dynamic>>> getExternalIdInfos(String itemId) async =>
      [
        for (final e in _providerKeys.entries)
          {'Key': e.value, 'Name': _providerName(e.key)},
      ];

  /// `POST .../match/search` for `query['ItemId']`, by title and year or by
  /// provider id. Silo's search takes no item type or provider, so
  /// [searchType] and a named provider change nothing.
  @override
  Future<List<Map<String, dynamic>>> searchRemote(
    String searchType,
    Map<String, dynamic> query,
  ) async {
    final info = asJsonMap(query['SearchInfo']) ?? const {};
    final ids = {
      for (final e in (asJsonMap(info['ProviderIds']) ?? const {}).entries)
        e.key.toLowerCase(): '${e.value}'.trim(),
    };
    final title = '${info['Name'] ?? ''}'.trim();
    final response = await _dio.post<dynamic>(
      '${_path('${query['ItemId']}')}/match/search',
      data: {
        if (title.isNotEmpty) 'title': title,
        if (info['Year'] case final num year) 'year': year.toInt(),
        for (final key in _providerKeys.keys)
          if (ids[key] case final id? when id.isNotEmpty) '${key}_id': id,
      },
    );
    final candidates =
        asJsonMap(response.data)?['candidates'] as List? ?? const [];
    return [
      for (final raw in candidates)
        if (asJsonMap(raw) case final candidate?)
          if (asJsonMap(candidate['provider_ids']) case final providerIds?)
            {
              'Name': ?candidate['title'],
              'ProductionYear': ?candidate['year'],
              'Overview': ?candidate['overview'],
              'ImageUrl': ?candidate['image_url'],
              'SearchProviderName': (candidate['sources'] as List? ?? const [])
                  .map(_providerName)
                  .join(', '),
              'ProviderIds': {
                for (final e in providerIds.entries)
                  _providerKeys[e.key] ?? e.key: '${e.value}',
              },
              siloProviderIdsKey: providerIds,
            },
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> searchRemotePerson(
    Map<String, dynamic> query,
  ) async => const [];

  /// `POST .../match/apply` with the match's provider ids. Matching an
  /// unmatched item gives it a new id (`local-...` becomes `movie-tmdb-812`),
  /// which is answered. Silo has no counterpart to [replaceAllImages].
  @override
  Future<String?> applyRemoteSearchResult(
    String itemId,
    Map<String, dynamic> result, {
    bool replaceAllImages = true,
  }) async {
    final response = await _dio.post<dynamic>(
      '${_path(itemId)}/match/apply',
      data: {'provider_ids': result[siloProviderIdsKey]},
    );
    _imageChoices.forget(itemId);
    _items.noteCatalogChanged();
    final id = asJsonMap(response.data)?['content_id'];
    return id is String && id.isNotEmpty && id != itemId ? id : null;
  }

  /// One kind of artwork from the item's choices (`GET .../images`). Each
  /// choice's preview link is its `Url`, which picking it sends back, and
  /// the choice it stands for is found again from that. Choices Silo
  /// previews inline (the artwork already in the item's folder) have no
  /// link, so they're left out.
  @override
  Future<Map<String, dynamic>> getRemoteImages(
    String itemId, {
    required ImageType imageType,
    int? startIndex,
    int? limit,
    String? providerName,
    bool? includeAllLanguages,
  }) async {
    final type = _artworkTypes[imageType];
    final choices = type == null
        ? const <Map<String, dynamic>>[]
        : [
            for (final choice in await _choicesOf(itemId))
              if (choice['type'] == type && _isLink(choice['url']))
                {
                  'Url': choice['url'],
                  'ProviderName': _providerName(choice['provider_id']),
                  'Width': ?(choice['width'] as num?)?.toInt(),
                  'Height': ?(choice['height'] as num?)?.toInt(),
                  'CommunityRating': ?choice['rating'],
                  if (choice['language'] case final String language
                      when language.isNotEmpty)
                    'Language': language,
                },
          ];
    final page = choices
        .skip(startIndex ?? 0)
        .take(limit ?? choices.length)
        .toList();
    return {'Images': page, 'TotalRecordCount': choices.length};
  }

  /// `POST .../images/apply` with the choice [imageUrl] previews.
  @override
  Future<void> downloadRemoteImage(
    String itemId, {
    required ImageType imageType,
    required String imageUrl,
  }) async {
    final type = _artworkTypes[imageType];
    if (type == null) {
      throw UnsupportedError("Silo doesn't keep ${imageType.name} artwork");
    }
    Map<String, dynamic>? choiceOf(List<Map<String, dynamic>> choices) =>
        choices.where((c) => c['url'] == imageUrl).firstOrNull;
    final choice =
        choiceOf(await _choicesOf(itemId)) ??
        choiceOf(await _choicesOf(itemId, refresh: true));
    if (choice == null) {
      throw StateError('That artwork is no longer one of the choices');
    }
    await _dio.post<dynamic>(
      '${_path(itemId)}/images/apply',
      data: {
        'original_url': choice['original_url'],
        'type': type,
        'provider_id': ?choice['provider_id'],
      },
    );
    _imageChoices.forget(itemId);
    _items.noteCatalogChanged();
  }

  @override
  Future<void> uploadItemImage(
    String itemId, {
    required ImageType imageType,
    required List<int> bytes,
    required String contentType,
  }) async => throw UnsupportedError("Silo can't take uploaded artwork");

  @override
  Future<void> deleteItemImage(
    String itemId, {
    required ImageType imageType,
    int? imageIndex,
  }) async =>
      throw UnsupportedError("Silo can't delete artwork, only pick another");

  /// Every choice, page after page (at most 1,000).
  Future<List<Map<String, dynamic>>> _readImageChoices(String itemId) async {
    final choices = <Map<String, dynamic>>[];
    String? cursor;
    for (var page = 0; page < 5; page++) {
      final response = await _dio.get<dynamic>(
        '${_path(itemId)}/images',
        queryParameters: {'limit': 200, 'cursor': ?cursor},
      );
      final json = asJsonMap(response.data);
      for (final raw in json?['items'] as List? ?? const []) {
        if (asJsonMap(raw) case final choice?) choices.add(choice);
      }
      cursor = asJsonMap(json?['page'])?['next_cursor'] as String?;
      if (cursor == null) break;
    }
    return choices;
  }

  static bool _isLink(Object? url) =>
      url is String &&
      (url.startsWith('https://') || url.startsWith('http://'));
}
