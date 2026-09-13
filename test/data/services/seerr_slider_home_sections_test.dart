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

      expect(merged, hasLength(3));
      expect(merged.first.type, HomeSectionType.resume);
      expect(merged[1].isSeerrShortcutsSlider, isTrue);
      expect(merged[1].enabled, isFalse);
      expect(merged.last.isSeerrSlider, isTrue);
      expect(merged.last.enabled, isFalse);
      expect(merged.last.type, HomeSectionType.none);
      expect(merged.last.sliderId, '1');
      expect(merged.last.sliderType, SeerrSliderType.tmdbSearch);
      expect(merged.last.pluginDisplayText, 'Trending Anime');
      expect(merged.last.order, 2);
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

      expect(merged.where((c) => c.sliderId == '1'), hasLength(1));
      expect(merged.singleWhere((c) => c.sliderId == '1').enabled, isTrue);
      expect(merged.singleWhere((c) => c.sliderId == '1').order, 4);
      expect(
        merged.singleWhere((c) => c.sliderId == '1').pluginDisplayText,
        'New title',
      );
    });

    test('drops sliders the server no longer returns', () {
      final stale = HomeSectionConfig.seerrSlider(
        sliderId: '99',
        sliderType: SeerrSliderType.tmdbSearch,
      );
      final merged = mergeSeerrSliderHomeSections([stale], const []);
      expect(merged.where((c) => c.sliderId == '99'), isEmpty);
      expect(merged.singleWhere((c) => c.isSeerrShortcutsSlider).sliderId, 'shortcuts');
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

      expect(merged.where((c) => c.sliderId == '1'), [first]);
    });

    test('binds an unbound type 4 row to the live slider id', () {
      final pending = HomeSectionConfig.seerrSlider(
        sliderType: 4,
        enabled: true,
        order: 3,
      );
      final live = SeerrDiscoverSlider(
        id: 42,
        type: SeerrSliderType.trending,
        title: 'Trending',
        isBuiltIn: true,
      );
      final catalog = resolveSeerrSliderCatalog(live)!;
      final merged = mergeSeerrSliderHomeSections(
        [pending],
        [(live, catalog)],
      );

      expect(merged.where((c) => c.sliderId == '42'), hasLength(1));
      expect(merged.singleWhere((c) => c.sliderId == '42').enabled, isTrue);
    });

    test('does not duplicate an unbound row that already has a live slider', () {
      final pending = HomeSectionConfig.seerrSlider(
        sliderType: 4,
        enabled: true,
        order: 3,
      );
      final existing = HomeSectionConfig.seerrSlider(
        sliderId: '42',
        sliderType: 4,
        enabled: false,
        order: 9,
      );
      final live = SeerrDiscoverSlider(
        id: 42,
        type: SeerrSliderType.trending,
        title: 'Trending',
        isBuiltIn: true,
      );
      final catalog = resolveSeerrSliderCatalog(live)!;
      final merged = mergeSeerrSliderHomeSections(
        [pending, existing],
        [(live, catalog)],
      );

      expect(merged.where((c) => c.sliderId == '42'), hasLength(1));
    });

    test('keeps an unbound type 4 row when the server has no type 4 slider', () {
      final pending = HomeSectionConfig.seerrSlider(
        sliderType: 4,
        enabled: true,
        order: 3,
      );
      final merged = mergeSeerrSliderHomeSections([pending], const []);
      expect(
        merged.where((c) => c.sliderType == 4 && c.seerrSliderId == null),
        hasLength(1),
      );
    });

    test('keeps a shortcuts slider when discover is empty', () {
      final shortcuts = HomeSectionConfig.seerrSlider(
        sliderId: seerrShortcutsSliderId,
        pluginDisplayText: 'Seerr Browse',
        enabled: true,
        order: 2,
      );
      final merged = mergeSeerrSliderHomeSections([shortcuts], const []);
      expect(merged.where((c) => c.isSeerrShortcutsSlider), hasLength(1));
      expect(merged.singleWhere((c) => c.isSeerrShortcutsSlider).enabled, isTrue);
      expect(merged.singleWhere((c) => c.isSeerrShortcutsSlider).order, 2);
    });

    test('does not duplicate an existing shortcuts slider', () {
      final shortcuts = HomeSectionConfig.seerrSlider(
        sliderId: seerrShortcutsSliderId,
        enabled: true,
        order: 1,
      );
      final merged = mergeSeerrSliderHomeSections(
        [shortcuts, shortcuts.copyWith(order: 8)],
        const [],
      );
      expect(merged.where((c) => c.isSeerrShortcutsSlider), hasLength(1));
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
