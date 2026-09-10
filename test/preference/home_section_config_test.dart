import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  group('HomeSectionConfig seerrSlider json', () {
    test('round-trips kind, sliderId, sliderType, and display text', () {
      final config = HomeSectionConfig.seerrSlider(
        sliderId: '47',
        sliderType: 21,
        pluginDisplayText: 'Netflix',
        enabled: false,
        order: 12,
      );
      final json = config.toJson();
      expect(json['kind'], 'seerrSlider');
      expect(json['type'], 'seerr_slider');
      expect(json['sliderId'], '47');
      expect(json['sliderType'], 21);
      expect(json['pluginDisplayText'], 'Netflix');

      final restored = HomeSectionConfig.fromJson(json);
      expect(restored.kind, HomeSectionKind.seerrSlider);
      expect(restored.type, HomeSectionType.none);
      expect(restored.sliderId, '47');
      expect(restored.sliderType, 21);
      expect(restored.pluginDisplayText, 'Netflix');
      expect(restored.enabled, isFalse);
      expect(restored.order, 12);
      expect(restored.stableId, 'seerrSlider:47');
    });

    test('parses type seerr_slider without kind', () {
      final restored = HomeSectionConfig.fromJson({
        'type': 'seerr_slider',
        'enabled': true,
        'order': 1,
        'sliderId': '9',
        'sliderType': 17,
        'pluginDisplayText': 'Anime',
      });
      expect(restored.kind, HomeSectionKind.seerrSlider);
      expect(restored.sliderId, '9');
      expect(restored.sliderType, 17);
    });
  });

  group('HomeSectionConfig isPersistable', () {
    test('drops builtin none leftovers', () {
      const orphan = HomeSectionConfig(type: HomeSectionType.none);
      expect(orphan.isPersistable, isFalse);
      expect(
        const HomeSectionConfig(
          type: HomeSectionType.resume,
        ).isPersistable,
        isTrue,
      );
    });

    test('drops slider rows with no id', () {
      expect(
        const HomeSectionConfig(
          kind: HomeSectionKind.seerrSlider,
        ).isPersistable,
        isFalse,
      );
      expect(
        HomeSectionConfig.seerrSlider(sliderId: '1').isPersistable,
        isTrue,
      );
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
          sliderType: 21,
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
    test('drops sliderId-less seerrSlider rows and builtin none', () {
      final restored = HomeSectionConfig.fromJsonString(
        '[{"type":"resume","enabled":true,"order":0},'
        '{"type":"none","enabled":true,"order":1},'
        '{"type":"seerr_slider","enabled":true,"order":2}]',
      );
      expect(restored.where((c) => c.isSeerrSlider), isEmpty);
      expect(
        restored.where((c) => c.isBuiltin && c.type == HomeSectionType.none),
        isEmpty,
      );
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
            sliderType: 21,
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
