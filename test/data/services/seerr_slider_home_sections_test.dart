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
  group('mergeSeerrSliderHomeSections', () {
    test('appends missing sliders disabled at the end', () {
      final current = [
        const HomeSectionConfig(
          type: HomeSectionType.resume,
          enabled: true,
          order: 0,
        ),
      ];
      final catalog = resolveSeerrSliderCatalog(_slider())!;
      final merged = mergeSeerrSliderHomeSections(current, [
        (_slider(), catalog),
      ]);

      expect(merged, hasLength(2));
      expect(merged.first.type, HomeSectionType.resume);
      expect(merged.last.isSeerrSlider, isTrue);
      expect(merged.last.enabled, isFalse);
      expect(merged.last.type, HomeSectionType.none);
      expect(merged.last.sliderId, '1');
      expect(merged.last.sliderType, SeerrSliderType.tmdbSearch);
      expect(merged.last.pluginDisplayText, 'Trending Anime');
      expect(merged.last.order, 1);
    });

    test('keeps enable and order, refreshes type and title', () {
      final existing = HomeSectionConfig.seerrSlider(
        sliderId: '1',
        sliderType: SeerrSliderType.tmdbSearch,
        enabled: true,
        order: 4,
      );
      final catalog = resolveSeerrSliderCatalog(_slider(title: 'New title'))!;
      final merged = mergeSeerrSliderHomeSections(
        [existing],
        [(_slider(title: 'New title'), catalog)],
      );

      expect(merged, hasLength(1));
      expect(merged.single.enabled, isTrue);
      expect(merged.single.order, 4);
      expect(merged.single.type, HomeSectionType.none);
      expect(merged.single.sliderType, SeerrSliderType.tmdbSearch);
      expect(merged.single.pluginDisplayText, 'New title');
      expect(merged.single.sliderId, '1');
    });

    test('drops sliders the server no longer returns', () {
      final stale = HomeSectionConfig.seerrSlider(
        sliderId: '99',
        sliderType: SeerrSliderType.tmdbSearch,
      );
      final merged = mergeSeerrSliderHomeSections([stale], const []);
      expect(merged, isEmpty);
    });

    test('collapses duplicate saved entries for the same slider', () {
      final first = HomeSectionConfig.seerrSlider(
        sliderId: '1',
        sliderType: SeerrSliderType.tmdbSearch,
        pluginDisplayText: 'Trending Anime',
        enabled: true,
        order: 2,
      );
      final duplicate = first.copyWith(order: 8);
      final catalog = resolveSeerrSliderCatalog(_slider())!;

      final merged = mergeSeerrSliderHomeSections(
        [first, duplicate],
        [(_slider(), catalog)],
      );

      expect(merged, [first]);
    });
  });

  group('seerrSliderIdFromStableId', () {
    test('reads the slider id off the home row id', () {
      final config = HomeSectionConfig.seerrSlider(
        sliderId: '42',
        sliderType: SeerrSliderType.tmdbSearch,
      );
      expect(seerrSliderIdFromStableId(config.stableId), 42);
    });

    test('ignores builtin seerr rows', () {
      expect(seerrSliderIdFromStableId('seerr_trending'), isNull);
    });
  });
}
