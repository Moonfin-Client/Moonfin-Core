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

    test('reads the legacy pluginDynamic seerr row id', () {
      expect(
        seerrSliderIdFromStableId('pluginDynamic:seerr:seerr:slider:42'),
        42,
      );
    });

    test('ignores builtin seerr rows', () {
      expect(seerrSliderIdFromStableId('seerr_trending'), isNull);
    });
  });

  group('HomeSectionConfig seerrSlider json', () {
    test('round-trips kind, sliderId, sliderType, and display text', () {
      final config = HomeSectionConfig.seerrSlider(
        sliderId: '47',
        sliderType: SeerrSliderType.simklDropped,
        pluginDisplayText: 'Dropped',
        enabled: false,
        order: 12,
      );
      final json = config.toJson();
      expect(json['kind'], 'seerrSlider');
      expect(json['type'], 'seerr_slider');
      expect(json['sliderId'], '47');
      expect(json['sliderType'], 47);
      expect(json['pluginDisplayText'], 'Dropped');

      final restored = HomeSectionConfig.fromJson(json);
      expect(restored.kind, HomeSectionKind.seerrSlider);
      expect(restored.type, HomeSectionType.none);
      expect(restored.sliderId, '47');
      expect(restored.sliderType, 47);
      expect(restored.pluginDisplayText, 'Dropped');
      expect(restored.enabled, isFalse);
      expect(restored.order, 12);
    });

    test('migrates pluginSource seerr pluginDynamic rows', () {
      final restored = HomeSectionConfig.fromJson({
        'kind': 'pluginDynamic',
        'type': 'none',
        'enabled': true,
        'order': 3,
        'pluginSource': 'seerr',
        'pluginSection': 'slider',
        'pluginAdditionalData': '22',
        'pluginDisplayText': 'Trakt Recommendations',
      });
      expect(restored.kind, HomeSectionKind.seerrSlider);
      expect(restored.type, HomeSectionType.none);
      expect(restored.sliderId, '22');
      expect(restored.pluginDisplayText, 'Trakt Recommendations');
    });

    test('migrates legacy per-slider type names to sliderType', () {
      final restored = HomeSectionConfig.fromJson({
        'kind': 'seerrSlider',
        'type': 'seerr_trakt_list',
        'enabled': true,
        'order': 2,
        'sliderId': '9',
        'pluginDisplayText': 'My List',
      });
      expect(restored.kind, HomeSectionKind.seerrSlider);
      expect(restored.type, HomeSectionType.none);
      expect(restored.sliderId, '9');
      expect(restored.sliderType, SeerrSliderType.traktList);
      expect(restored.pluginDisplayText, 'My List');
    });
  });

  group('HomeSectionConfig homeRowOrderNames', () {
    test('encodes enabled builtins only', () {
      final configs = [
        const HomeSectionConfig(
          type: HomeSectionType.resume,
          enabled: true,
          order: 0,
        ),
        HomeSectionConfig.seerrSlider(
          sliderId: '47',
          sliderType: SeerrSliderType.simklDropped,
          enabled: true,
          order: 1,
        ),
        HomeSectionConfig.pluginDynamic(
          serverId: 's',
          pluginSection: 'collection',
          pluginAdditionalData: '1',
          pluginDisplayText: 'Box',
        ),
        const HomeSectionConfig(
          type: HomeSectionType.nextUp,
          enabled: false,
          order: 3,
        ),
      ];
      expect(HomeSectionConfig.homeRowOrderNames(configs), ['resume']);
    });
  });

  group('HomeSectionConfig fromJsonString orphans', () {
    test('drops sliderId-less seerrSlider rows', () {
      final restored = HomeSectionConfig.fromJsonString(
        '[{"type":"resume","enabled":true,"order":0},'
        '{"type":"seerr_slider","enabled":true,"order":1}]',
      );
      expect(restored.where((c) => c.isSeerrSlider), isEmpty);
      expect(
        restored.any((c) => c.type == HomeSectionType.resume && c.enabled),
        isTrue,
      );

      final noId = HomeSectionConfig.fromJsonString(
        '[{"kind":"seerrSlider","type":"seerr_slider","enabled":true,"order":0}]',
      );
      expect(noId.where((c) => c.isSeerrSlider), isEmpty);

      final kept = HomeSectionConfig.fromJsonString(
        HomeSectionConfig.toJsonString([
          HomeSectionConfig.seerrSlider(
            sliderId: '47',
            sliderType: SeerrSliderType.simklDropped,
            enabled: true,
            order: 0,
          ),
        ]),
      );
      expect(
        kept.where((c) => c.isSeerrSlider && c.sliderId == '47'),
        hasLength(1),
      );
    });
  });
}
