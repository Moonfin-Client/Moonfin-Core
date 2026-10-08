import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_discover_sliders.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';

SeerrDiscoverSlider _slider(int type, String data, {int id = 7}) =>
    SeerrDiscoverSlider(id: id, type: type, title: 'Row', data: data);

void main() {
  group('tryFromJson', () {
    test('reads a slider as /settings/discover returns it', () {
      final slider = SeerrDiscoverSlider.tryFromJson({
        'id': 14,
        'type': 13,
        'order': 3,
        'isBuiltIn': false,
        'enabled': true,
        'title': ' Christmas ',
        'data': '207317',
      });

      expect(slider?.id, 14);
      expect(slider?.type, 13);
      expect(slider?.enabled, isTrue);
      expect(slider?.title, 'Christmas');
      expect(slider?.data, '207317');
    });

    test('skips an entry without an id or type', () {
      expect(SeerrDiscoverSlider.tryFromJson({'type': 13}), isNull);
      expect(SeerrDiscoverSlider.tryFromJson({'id': 1}), isNull);
      expect(SeerrDiscoverSlider.tryFromJson('nope'), isNull);
    });

    test('a built-in slider has no title or data', () {
      final slider = SeerrDiscoverSlider.tryFromJson({
        'id': 1,
        'type': 4,
        'isBuiltIn': true,
        'enabled': false,
        'title': null,
        'data': null,
      });

      expect(slider?.enabled, isFalse);
      expect(slider?.title, isEmpty);
      expect(slider?.data, isEmpty);
    });
  });

  group('query', () {
    test('keyword sliders filter discover by keyword', () {
      final movie = _slider(SeerrSliderType.movieKeyword, '1,2').query!;
      expect(movie.path, 'discover/movies');
      expect(movie.params, {'keywords': '1,2'});

      final tv = _slider(SeerrSliderType.tvKeyword, '3').query!;
      expect(tv.path, 'discover/tv');
      expect(tv.params, {'keywords': '3'});
    });

    test('genre sliders filter discover by genre', () {
      final movie = _slider(SeerrSliderType.movieGenre, '28').query!;
      expect(movie.path, 'discover/movies');
      expect(movie.params, {'genre': '28'});

      final tv = _slider(SeerrSliderType.tvGenre, '16').query!;
      expect(tv.path, 'discover/tv');
      expect(tv.params, {'genre': '16'});
    });

    test('a search slider searches for its text', () {
      final query = _slider(SeerrSliderType.search, 'star wars').query!;
      expect(query.path, 'search');
      expect(query.params, {'query': 'star wars'});
    });

    test('studio and network sliders use their own routes', () {
      final studio = _slider(SeerrSliderType.studio, '420').query!;
      expect(studio.path, 'discover/movies/studio/420');
      expect(studio.params, isEmpty);

      final network = _slider(SeerrSliderType.network, '213').query!;
      expect(network.path, 'discover/tv/network/213');
      expect(network.params, isEmpty);
    });

    test('streaming sliders split region and providers', () {
      final movie = _slider(SeerrSliderType.movieStreaming, 'US,8|337').query!;
      expect(movie.path, 'discover/movies');
      expect(movie.params, {'watchRegion': 'US', 'watchProviders': '8|337'});

      final tv = _slider(SeerrSliderType.tvStreaming, 'GB,8').query!;
      expect(tv.path, 'discover/tv');
      expect(tv.params, {'watchRegion': 'GB', 'watchProviders': '8'});
    });

    test('a streaming slider missing its providers has no query', () {
      expect(_slider(SeerrSliderType.movieStreaming, 'US').query, isNull);
      expect(_slider(SeerrSliderType.tvStreaming, 'US,').query, isNull);
    });

    test('Seerr built-in types and unknown types have no query', () {
      for (var type = 1; type <= 12; type++) {
        expect(_slider(type, 'x').query, isNull, reason: 'type $type');
      }
      expect(_slider(22, 'x').query, isNull);
      expect(_slider(1001, 'x').query, isNull);
    });

    test('a slider without data has no query', () {
      expect(_slider(SeerrSliderType.movieKeyword, '').query, isNull);
    });
  });

  group('isSupported', () {
    test('needs the slider enabled, titled and understood', () {
      expect(_slider(SeerrSliderType.movieGenre, '28').isSupported, isTrue);
      expect(
        const SeerrDiscoverSlider(
          id: 1,
          type: SeerrSliderType.movieGenre,
          enabled: false,
          title: 'Action',
          data: '28',
        ).isSupported,
        isFalse,
      );
      expect(
        const SeerrDiscoverSlider(
          id: 1,
          type: SeerrSliderType.movieGenre,
          data: '28',
        ).isSupported,
        isFalse,
      );
      expect(_slider(4, 'x').isSupported, isFalse);
    });
  });

  group('layout entry', () {
    const slider = SeerrDiscoverSlider(
      id: 42,
      type: SeerrSliderType.movieKeyword,
      title: 'Christmas',
      data: '207317',
    );

    test('is a pluginDynamic section every client already carries', () {
      final json = seerrSliderSection(
        slider,
        serverId: 'http://jf.test',
      ).toJson();

      expect(json, {
        'type': 'none',
        'enabled': true,
        'order': 0,
        'kind': 'pluginDynamic',
        'pluginSource': 'seerr',
        'serverId': 'http://jf.test',
        'pluginSection': '42',
        'pluginAdditionalData': '13',
        'pluginDisplayText': 'Christmas',
      });
    });

    test('survives a save and load of the layout', () {
      final saved = HomeSectionConfig.toJsonString([
        seerrSliderSection(slider, serverId: 'http://jf.test'),
      ]);

      final loaded = HomeSectionConfig.fromJsonString(
        saved,
      ).where(isSeerrSliderSection).toList();

      expect(loaded, hasLength(1));
      expect(loaded.single.enabled, isTrue);
      expect(findSeerrSliderFor(loaded.single, [slider]), same(slider));
    });

    test('matches the live slider only when id and type agree', () {
      final cfg = seerrSliderSection(slider, serverId: 'http://jf.test');

      expect(findSeerrSliderFor(cfg, const [slider]), same(slider));
      expect(
        findSeerrSliderFor(cfg, const [
          SeerrDiscoverSlider(id: 42, type: SeerrSliderType.search),
        ]),
        isNull,
      );
      expect(findSeerrSliderFor(cfg, const []), isNull);
    });

    test('other plugin rows are not slider rows', () {
      final collection = HomeSectionConfig.pluginDynamic(
        serverId: 'http://jf.test',
        pluginSection: '42',
        pluginAdditionalData: '13',
      );

      expect(isSeerrSliderSection(collection), isFalse);
      expect(findSeerrSliderFor(collection, const [slider]), isNull);
    });

    group('put on Home or taken off', () {
      final entry = seerrSliderSection(slider, serverId: 'http://jf.test');
      final resume = HomeSectionConfig(
        type: HomeSectionType.resume,
        enabled: true,
        order: 0,
      );

      test('a new row goes last, switched on', () {
        final sections = setSeerrSliderShown([resume], entry, shown: true);

        expect(sections, hasLength(2));
        expect(sections.last.stableId, entry.stableId);
        expect(sections.last.enabled, isTrue);
        expect(sections.last.order, 1);
      });

      test('a row taken off keeps its entry and place', () {
        final shown = setSeerrSliderShown([resume], entry, shown: true);
        final hidden = setSeerrSliderShown(shown, entry, shown: false);

        expect(hidden, hasLength(2));
        expect(hidden.last.stableId, entry.stableId);
        expect(hidden.last.enabled, isFalse);
        expect(hidden.last.order, 1);
        expect(
          setSeerrSliderShown(hidden, entry, shown: true).last.enabled,
          isTrue,
        );
      });

      test('taking off a row Home never had changes nothing', () {
        final sections = [resume];

        expect(setSeerrSliderShown(sections, entry, shown: false), sections);
      });
    });
  });
}
