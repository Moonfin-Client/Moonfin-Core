import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';
import 'package:moonfin/data/services/imdb_external_lists_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock path_provider channel
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return '.';
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

  group('CustomExternalLists sorting logic', () {
    late UserPreferences prefs;
    late CustomExternalListsService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      prefs = UserPreferences(store);
      service = CustomExternalListsService(prefs);
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
          'source': 'imdb',
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
          'source': 'imdb',
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
          'source': 'imdb',
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
          'source': 'imdb',
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
          'source': 'imdb',
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
}
