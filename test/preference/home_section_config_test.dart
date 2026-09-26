import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_slider_catalog.dart';
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

  group('HomeSectionConfig seerr discover migration', () {
    List<HomeSectionConfig> migrate(
      String json, {
      Map<int, bool>? seerrHomeRowEnabledBySliderType,
      bool? seerrShortcutsHomeRowEnabled,
    }) => HomeSectionConfig.fromJsonString(
      HomeSectionConfig.migrateLegacySeerrHomeJson(
        json,
        seerrHomeRowEnabledBySliderType: seerrHomeRowEnabledBySliderType,
        seerrShortcutsHomeRowEnabled: seerrShortcutsHomeRowEnabled,
      ),
    );

    test('rewrites seerr_trending to seerrSlider type 4', () {
      final slider = migrate(
        '[{"type":"seerr_trending","enabled":true,"order":3}]',
      ).singleWhere((c) => c.isSeerrSlider);
      expect(slider.sliderId, isNull);
      expect(slider.sliderType, 4);
      expect(slider.enabled, isTrue);
      expect(slider.order, 3);
      expect(slider.seerrSliderId, isNull);
      expect(slider.stableId, 'seerrSlider:type:4');
    });

    test('live ingest does not rewrite old seerr type names', () {
      expect(
        HomeSectionConfig.tryFromJson({
          'type': 'seerr_trending',
          'enabled': true,
          'order': 3,
        }),
        isNull,
      );
      expect(
        HomeSectionConfig.fromJsonString(
          '[{"type":"seerr_trending","enabled":true,"order":3}]',
        ).where((c) => c.isSeerrSlider),
        isEmpty,
      );
    });

    test('second parse of migrated JSON is stable', () {
      final first = migrate(
        '[{"type":"seerr_trending","enabled":true,"order":3}]',
      );
      final slider = first.singleWhere((c) => c.isSeerrSlider);
      expect(slider.sliderId, isNull);
      expect(slider.sliderType, 4);
      expect(slider.enabled, isTrue);
      expect(slider.order, 3);

      final second = HomeSectionConfig.fromJsonString(
        HomeSectionConfig.toJsonString(first),
      );
      final again = second.singleWhere((c) => c.isSeerrSlider);
      expect(again.sliderId, isNull);
      expect(again.sliderType, 4);
      expect(again.enabled, isTrue);
      expect(again.order, 3);
    });

    test('keeps a live slider and applies builtin flags when both exist', () {
      final sliders = migrate(
        '[{"type":"seerr_trending","enabled":true,"order":3},'
        '{"kind":"seerrSlider","type":"seerr_slider","sliderId":"42",'
        '"sliderType":4,"enabled":false,"order":9}]',
      ).where((c) => c.isSeerrSlider).toList();
      expect(sliders, hasLength(1));
      expect(sliders.single.sliderId, '42');
      expect(sliders.single.sliderType, 4);
      expect(sliders.single.enabled, isTrue);
      expect(sliders.single.order, 3);
    });

    test('ANDs homeRowsConfig onto a legacy slider', () {
      final restored = migrate(
        '[{"type":"seerr_trending","enabled":true,"order":3}]',
        seerrHomeRowEnabledBySliderType: const {4: false},
      );
      expect(
        restored.singleWhere((c) => c.isSeerrSlider).enabled,
        isFalse,
      );
    });

    test('rewrites seerr_shortcuts to seerrSlider shortcuts', () {
      final restored = migrate(
        '[{"type":"seerr_shortcuts","enabled":true,"order":2}]',
      ).singleWhere((c) => c.isSeerrShortcutsSlider);
      expect(restored.sliderId, seerrShortcutsSliderId);
      expect(restored.sliderType, isNull);
      expect(restored.enabled, isTrue);
      expect(restored.order, 2);
    });

    test('ANDs homeRowsConfig onto shortcuts', () {
      final restored = migrate(
        '[{"type":"seerr_shortcuts","enabled":true,"order":2}]',
        seerrShortcutsHomeRowEnabled: false,
      );
      expect(
        restored.singleWhere((c) => c.isSeerrShortcutsSlider).enabled,
        isFalse,
      );
    });

    test('strips leftover placeholder slider ids', () {
      final slider = migrate(
        '[{"kind":"seerrSlider","type":"seerr_slider","sliderId":"legacy:4",'
        '"sliderType":4,"enabled":true,"order":3}]',
      ).singleWhere((c) => c.isSeerrSlider);
      expect(slider.sliderId, isNull);
      expect(slider.sliderType, 4);
    });

    test('every SeerrRowType legacy home name migrates as a slider', () {
      for (final row in SeerrRowType.values) {
        final cfg = migrate(
          '[{"type":"seerr_${row.serializedName}","enabled":true,"order":0}]',
        ).singleWhere((c) => c.isSeerrSlider);
        if (row == SeerrRowType.shortcuts) {
          expect(cfg.isSeerrShortcutsSlider, isTrue);
        } else {
          expect(cfg.sliderType, row.discoverSliderType);
        }
      }
    });
  });

  group('HomeSectionConfig tryFromJson', () {
    test('keeps the watchlist alias as playlists', () {
      expect(
        HomeSectionConfig.tryFromJson({
          'type': 'watchlist',
          'enabled': true,
          'order': 0,
        })?.type,
        HomeSectionType.playlists,
      );
    });

    test('keeps pluginDynamic rows', () {
      final cfg = HomeSectionConfig.tryFromJson({
        'kind': 'pluginDynamic',
        'type': 'none',
        'enabled': true,
        'order': 0,
        'serverId': 's',
        'pluginSource': 'custom',
        'pluginSection': 'row',
      });
      expect(cfg?.isPluginDynamic, isTrue);
      expect(cfg?.pluginSection, 'row');
    });

    test('rejects slider rows with no id', () {
      expect(
        HomeSectionConfig.tryFromJson({
          'kind': 'seerrSlider',
          'type': 'seerr_slider',
          'enabled': true,
          'order': 0,
        }),
        isNull,
      );
      expect(
        HomeSectionConfig.tryFromJson({
          'type': 'seerr_slider',
          'enabled': true,
          'order': 0,
          'sliderId': '1',
        })?.sliderId,
        '1',
      );
    });
  });

  group('HomeSectionConfig tryFromTypeName', () {
    test('keeps builtin names and drops unknown ones', () {
      expect(
        HomeSectionConfig.tryFromTypeName(
          'resume',
          enabled: true,
          order: 0,
        )?.type,
        HomeSectionType.resume,
      );
      expect(
        HomeSectionConfig.tryFromTypeName(
          'not_a_row',
          enabled: true,
          order: 0,
        ),
        isNull,
      );
      expect(
        HomeSectionConfig.tryFromTypeName(
          'seerr_trending',
          enabled: true,
          order: 0,
        ),
        isNull,
      );
    });

    test('does not treat unprefixed Seerr row names as home types', () {
      expect(
        HomeSectionConfig.tryFromTypeName(
          'trending',
          enabled: true,
          order: 0,
        ),
        isNull,
      );
      expect(
        HomeSectionConfig.tryFromTypeName(
          'watchlist',
          enabled: true,
          order: 0,
        )?.type,
        HomeSectionType.playlists,
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

      final unbound = HomeSectionConfig.fromJsonString(
        HomeSectionConfig.toJsonString([
          HomeSectionConfig.seerrSlider(
            sliderType: 4,
            enabled: true,
            order: 0,
          ),
        ]),
      );
      expect(
        unbound.where((c) => c.isSeerrSlider && c.sliderType == 4),
        hasLength(1),
      );
    });
  });
}
