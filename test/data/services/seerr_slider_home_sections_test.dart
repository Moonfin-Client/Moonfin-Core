import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_slider_catalog.dart';
import 'package:moonfin/data/services/seerr/seerr_slider_home_sections.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';

SeerrDiscoverSlider _slider({int id = 1, String title = 'Trending Anime'}) =>
    SeerrDiscoverSlider(
      id: id,
      type: SeerrSliderType.tmdbSearch,
      title: title,
      data: 'anime',
    );

void main() {
  group('mergeSeerrCustomSliderHomeSections', () {
    test('appends missing sliders disabled at the end', () {
      final current = [
        const HomeSectionConfig(
          type: HomeSectionType.resume,
          enabled: true,
          order: 0,
        ),
      ];
      final catalog = resolveSeerrSliderCatalog(_slider())!;
      final merged = mergeSeerrCustomSliderHomeSections(current, [
        (_slider(), catalog),
      ]);

      expect(merged, hasLength(2));
      expect(merged.first.type, HomeSectionType.resume);
      expect(merged.last.isSeerrCustomSlider, isTrue);
      expect(merged.last.enabled, isFalse);
      expect(merged.last.pluginDisplayText, 'Trending Anime');
      expect(merged.last.pluginAdditionalData, '1');
      expect(merged.last.order, 1);
    });

    test('keeps enable and order, refreshes the title', () {
      final existing = HomeSectionConfig.pluginDynamic(
        serverId: SeerrHomeSliderSection.serverId,
        pluginSection: SeerrHomeSliderSection.pluginSection,
        pluginAdditionalData: '1',
        pluginDisplayText: 'Old title',
        pluginSource: HomeSectionPluginSource.seerr,
        enabled: true,
        order: 4,
      );
      final catalog = resolveSeerrSliderCatalog(_slider(title: 'New title'))!;
      final merged = mergeSeerrCustomSliderHomeSections(
        [existing],
        [(_slider(title: 'New title'), catalog)],
      );

      expect(merged, hasLength(1));
      expect(merged.single.enabled, isTrue);
      expect(merged.single.order, 4);
      expect(merged.single.pluginDisplayText, 'New title');
    });

    test('drops sliders the server no longer returns', () {
      final stale = HomeSectionConfig.pluginDynamic(
        serverId: SeerrHomeSliderSection.serverId,
        pluginSection: SeerrHomeSliderSection.pluginSection,
        pluginAdditionalData: '99',
        pluginDisplayText: 'Gone',
        pluginSource: HomeSectionPluginSource.seerr,
      );
      final merged = mergeSeerrCustomSliderHomeSections([stale], const []);
      expect(merged, isEmpty);
    });

    test('collapses duplicate saved entries for the same slider', () {
      final first = HomeSectionConfig.pluginDynamic(
        serverId: SeerrHomeSliderSection.serverId,
        pluginSection: SeerrHomeSliderSection.pluginSection,
        pluginAdditionalData: '1',
        pluginDisplayText: 'Trending Anime',
        pluginSource: HomeSectionPluginSource.seerr,
        enabled: true,
        order: 2,
      );
      final duplicate = first.copyWith(order: 8);
      final catalog = resolveSeerrSliderCatalog(_slider())!;

      final merged = mergeSeerrCustomSliderHomeSections(
        [first, duplicate],
        [(_slider(), catalog)],
      );

      expect(merged, [first]);
    });
  });

  group('seerrCustomSliderIdFromStableId', () {
    test('reads the slider id off the home row id', () {
      final config = HomeSectionConfig.pluginDynamic(
        serverId: SeerrHomeSliderSection.serverId,
        pluginSection: SeerrHomeSliderSection.pluginSection,
        pluginAdditionalData: '42',
        pluginSource: HomeSectionPluginSource.seerr,
      );
      expect(seerrCustomSliderIdFromStableId(config.stableId), 42);
    });

    test('ignores builtin seerr rows', () {
      expect(seerrCustomSliderIdFromStableId('seerr_trending'), isNull);
    });
  });
}
