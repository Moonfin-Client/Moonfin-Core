import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';
import 'package:moonfin/l10n/current_app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final tempDir = Directory.systemTemp.createTempSync('moonfin_test_');

  // Mock path_provider channel
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return tempDir.path;
  });

  tearDownAll(() {
    try {
      tempDir.deleteSync(recursive: true);
    } catch (_) {}
  });

  group('CustomExternalLists Config Mapping', () {
    test('JSON serialization and deserialization of HomeSectionConfig with custom source', () {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_12345',
        pluginDisplayText: 'My Letterboxd Watchlist',
        pluginAdditionalData: jsonEncode({
          'source': 'letterboxd',
          'type': 'watchlist',
          'params': {'user': 'testuser'}
        }),
        pluginSource: HomeSectionPluginSource.custom,
        enabled: true,
        order: 10,
      );

      final serialized = config.toJson();
      expect(serialized['pluginSource'], 'custom');
      expect(serialized['serverId'], 'custom');
      expect(serialized['pluginSection'], 'custom_row_12345');
      expect(serialized['pluginDisplayText'], 'My Letterboxd Watchlist');

      final deserialized = HomeSectionConfig.fromJson(serialized);
      expect(deserialized.pluginSource, HomeSectionPluginSource.custom);
      expect(deserialized.pluginSection, 'custom_row_12345');
      expect(deserialized.pluginDisplayText, 'My Letterboxd Watchlist');
      
      final data = jsonDecode(deserialized.pluginAdditionalData!) as Map<String, dynamic>;
      expect(data['source'], 'letterboxd');
      expect(data['type'], 'watchlist');
      expect(data['params']['user'], 'testuser');
    });
  });

  group('CustomExternalLists cache age', () {
    late CustomExternalListsService service;
    late HomeSectionConfig config;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      service = CustomExternalListsService();
      config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_cache_age',
        pluginDisplayText: 'Watchlist',
        pluginAdditionalData: jsonEncode({
          'source': 'letterboxd',
          'type': 'watchlist',
          'params': {'user': 'someone'},
        }),
        pluginSource: HomeSectionPluginSource.custom,
        enabled: true,
        order: 1,
      );
      await service.saveCustomRowToCache(config, [
        ImdbExternalListItem(
          imdbId: 'tt1',
          tmdbId: '1',
          title: 'Cached Film',
          type: 'Movie',
          backdropUrl: 'http://server/backdrop.jpg',
        ),
      ]);
    });

    Future<void> ageCacheBy(Duration age) async {
      final file = await service.cacheFile(config);
      file.setLastModifiedSync(DateTime.now().subtract(age));
    }

    test('a cache-first caller refetches once the row is a day old', () async {
      await ageCacheBy(const Duration(hours: 30));

      final items = await service.loadCustomRowFromCache(
        config,
        maxAge: CustomExternalListsService.cacheMaxAge,
      );

      expect(items, isEmpty);
    });

    test('a cache-first caller keeps a row that is still fresh', () async {
      await ageCacheBy(const Duration(hours: 2));

      final items = await service.loadCustomRowFromCache(
        config,
        maxAge: CustomExternalListsService.cacheMaxAge,
      );

      expect(items, hasLength(1));
    });

    test('drops a row an older plugin sent with posters as backdrops', () async {
      await service.saveCustomRowToCache(config, [
        ImdbExternalListItem(
          imdbId: 'tt1',
          tmdbId: '',
          title: 'Cached Film',
          type: 'Movie',
          posterUrl: 'https://m.media-amazon.com/poster.jpg',
          backdropUrl: 'https://m.media-amazon.com/poster.jpg',
        ),
      ]);

      expect(await service.loadCustomRowFromCache(config), isEmpty);
    });

    test('an old row still answers when there is no server to ask', () async {
      await ageCacheBy(const Duration(days: 5));

      expect(await service.loadCustomRowFromCache(config), hasLength(1));
      // No MediaServerClient is registered, which is the offline path.
      expect(await service.fetchCustomRow(config), hasLength(1));
    });

    test('partitions cache by language code', () async {
      final itemEn = ImdbExternalListItem(
        imdbId: 'tt0245429',
        title: 'Spirited Away',
        type: 'Movie',
        backdropUrl: 'http://server/backdrop.jpg',
      );
      final itemFr = ImdbExternalListItem(
        imdbId: 'tt0245429',
        title: 'Le Voyage de Chihiro',
        type: 'Movie',
        backdropUrl: 'http://server/backdrop.jpg',
      );

      await service.saveCustomRowToCache(config, [itemEn], language: 'en');
      await service.saveCustomRowToCache(config, [itemFr], language: 'fr');

      final cachedEn = await service.loadCustomRowFromCache(config, language: 'en');
      expect(cachedEn, hasLength(1));
      expect(cachedEn.first.title, 'Spirited Away');

      final cachedFr = await service.loadCustomRowFromCache(config, language: 'fr');
      expect(cachedFr, hasLength(1));
      expect(cachedFr.first.title, 'Le Voyage de Chihiro');

      // Spanish has no cache saved yet; cache-first caller with maxAge gets empty list to trigger network fetch
      final cachedEs = await service.loadCustomRowFromCache(
        config,
        maxAge: CustomExternalListsService.cacheMaxAge,
        language: 'es',
      );
      expect(cachedEs, isEmpty);
    });

    test('falls back to legacy unpartitioned cache when offline', () async {
      final legacyFile = File('${tempDir.path}/custom_chart_custom_row_cache_age.json');
      final legacyItem = ImdbExternalListItem(
        imdbId: 'tt_legacy',
        tmdbId: '999',
        title: 'Legacy Film',
        type: 'Movie',
        backdropUrl: 'http://server/backdrop.jpg',
      );
      await legacyFile.writeAsString(jsonEncode([legacyItem.toJson()]));

      // Querying without maxAge (offline fallback path) for a language that has no specific cache
      final items = await service.loadCustomRowFromCache(config, language: 'de');
      expect(items, hasLength(1));
      expect(items.first.title, 'Legacy Film');
    });
  });

  group('CustomExternalLists sorting logic', () {
    late CustomExternalListsService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      service = CustomExternalListsService();
    });

    final mockItems = [
      ImdbExternalListItem(
        imdbId: '1',
        title: 'C Title',
        year: 2020,
        type: 'Movie',
        popularity: 50.0,
        rating: 8.5,
      ),
      ImdbExternalListItem(
        imdbId: '2',
        title: 'A Title',
        year: 2010,
        type: 'Movie',
        popularity: 150.0,
        rating: 6.0,
      ),
      ImdbExternalListItem(
        imdbId: '3',
        title: 'B Title',
        year: 2015,
        type: 'Movie',
        popularity: 10.0,
        rating: 9.0,
      ),
    ];

    test('Sorts alphabetically by Film Name (title)', () async {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_title_test',
        pluginDisplayText: 'Test Title Sort',
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb',
          'type': 'user_list',
          'sort_by': 'title',
          'sort_order': 'asc',
        }),
        pluginSource: HomeSectionPluginSource.custom,
      );

      await service.saveCustomRowToCache(config, mockItems);
      final sorted = await service.loadCustomRowFromCache(config);

      expect(sorted.length, 3);
      expect(sorted[0].title, 'A Title');
      expect(sorted[1].title, 'B Title');
      expect(sorted[2].title, 'C Title');
    });

    test('Sorts by Release Date (year) descending', () async {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_year_test',
        pluginDisplayText: 'Test Year Sort',
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb',
          'type': 'user_list',
          'sort_by': 'year',
          'sort_order': 'desc',
        }),
        pluginSource: HomeSectionPluginSource.custom,
      );

      await service.saveCustomRowToCache(config, mockItems);
      final sorted = await service.loadCustomRowFromCache(config);

      expect(sorted[0].year, 2020);
      expect(sorted[1].year, 2015);
      expect(sorted[2].year, 2010);
    });

    test('Sorts by Popularity descending', () async {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_pop_test',
        pluginDisplayText: 'Test Pop Sort',
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb',
          'type': 'user_list',
          'sort_by': 'popularity',
          'sort_order': 'desc',
        }),
        pluginSource: HomeSectionPluginSource.custom,
      );

      await service.saveCustomRowToCache(config, mockItems);
      final sorted = await service.loadCustomRowFromCache(config);

      expect(sorted[0].popularity, 150.0);
      expect(sorted[1].popularity, 50.0);
      expect(sorted[2].popularity, 10.0);
    });

    test('Sorts by Average Rating descending', () async {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_rating_test',
        pluginDisplayText: 'Test Rating Sort',
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb',
          'type': 'user_list',
          'sort_by': 'rating',
          'sort_order': 'desc',
        }),
        pluginSource: HomeSectionPluginSource.custom,
      );

      await service.saveCustomRowToCache(config, mockItems);
      final sorted = await service.loadCustomRowFromCache(config);

      expect(sorted[0].rating, 9.0);
      expect(sorted[1].rating, 8.5);
      expect(sorted[2].rating, 6.0);
    });

    test('Keeps default order when sort_by is none', () async {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'custom',
        pluginSection: 'custom_row_none_test',
        pluginDisplayText: 'Test None Sort',
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb',
          'type': 'user_list',
          'sort_by': 'none',
        }),
        pluginSource: HomeSectionPluginSource.custom,
      );

      await service.saveCustomRowToCache(config, mockItems);
      final sorted = await service.loadCustomRowFromCache(config);

      expect(sorted[0].imdbId, '1');
      expect(sorted[1].imdbId, '2');
      expect(sorted[2].imdbId, '3');
    });
  });

  group('currentAppLocale resolution', () {
    test('resolves supported locales', () {
      expect(currentAppLocale(const Locale('fr')).languageCode, 'fr');
      expect(currentAppLocale(const Locale('es')).languageCode, 'es');
      expect(currentAppLocale(const Locale('de', 'DE')).languageCode, 'de');
    });

    test('falls back to English for unsupported device locales', () {
      expect(currentAppLocale(const Locale('is')).languageCode, 'en');
      expect(currentAppLocale(const Locale('tlh')).languageCode, 'en');
    });
  });
}
