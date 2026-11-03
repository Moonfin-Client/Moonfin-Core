import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

const _ticks = 10000000;

void main() {
  group('golden', () {
    test('Young Justice 1x01: the intro, near Emby\'s intro markers', () {
      final silo = siloMarkersToMediaSegments(
        _json('silo/markers_episode.json'),
        itemId: 'episode-1',
      );
      expect(silo, [
        {
          'Id': 'silo-intro-episode-1-0',
          'ItemId': 'episode-1',
          'Type': 'Intro',
          'StartTicks': 2479980000,
          'EndTicks': 2683290000,
        },
      ]);
      // Emby marks the same intro with chapter markers, and its detector lands
      // within two seconds of Silo's.
      final emby = (_json('emby/item_episode.json')['Chapters'] as List)
          .cast<Map<String, dynamic>>();
      int marker(String type) =>
          emby.firstWhere((c) => c['MarkerType'] == type)['StartPositionTicks']
              as int;
      expect(
        (silo.single['StartTicks'] as int) - marker('IntroStart'),
        inInclusiveRange(-2 * _ticks, 2 * _ticks),
      );
      expect(
        (silo.single['EndTicks'] as int) - marker('IntroEnd'),
        inInclusiveRange(-2 * _ticks, 2 * _ticks),
      );
    });

    test('the same from the /watch version', () {
      final version =
          (_json('silo/watch_episode.json')['versions'] as List).first
              as Map<String, dynamic>;
      expect(
        siloMarkersToMediaSegments(version, itemId: 'e').single['StartTicks'],
        2479980000,
      );
    });

    test('xXx has none', () {
      expect(
        siloMarkersToMediaSegments(
          _json('silo/markers_movie.json'),
          itemId: 'm',
        ),
        isEmpty,
      );
    });
  });

  group('rules', () {
    List<Map<String, dynamic>> map(
      Map<String, dynamic> markers, {
      num? runTime,
    }) => siloMarkersToMediaSegments(
      markers,
      itemId: 'i',
      runTimeSeconds: runTime,
    );

    test('every occurrence, in start order, each with its own id', () {
      final s = map({
        'marker_segments': [
          {'kind': 'intro', 'start_seconds': 300, 'end_seconds': 330},
          {'kind': 'recap', 'start_seconds': 0, 'end_seconds': 60},
          {'kind': 'intro', 'start_seconds': 60, 'end_seconds': 90},
          {'kind': 'credits', 'start_seconds': 1300, 'end_seconds': 1357},
          {'kind': 'preview', 'start_seconds': 1357, 'end_seconds': 1400},
        ],
      });
      expect(s.map((x) => x['Type']), [
        'Recap',
        'Intro',
        'Intro',
        'Outro',
        'Preview',
      ]);
      expect(s.map((x) => x['Id']), [
        'silo-recap-i-0',
        'silo-intro-i-0',
        'silo-intro-i-1',
        'silo-outro-i-0',
        'silo-preview-i-0',
      ]);
    });

    test('the single fields when there is no occurrence list', () {
      final s = map({
        'intro': {'start_seconds': 10, 'end_seconds': 40},
        'credits': {'start': 1200, 'end': 1300},
        'recap': {},
        'marker_segments': [],
      });
      expect(s.map((x) => '${x['Type']} ${x['StartTicks']}'), [
        'Intro ${10 * _ticks}',
        'Outro ${1200 * _ticks}',
      ]);
    });

    test('no end runs to the end of the file, or is dropped', () {
      final markers = {
        'marker_segments': [
          {'kind': 'credits', 'start_seconds': 1300},
        ],
      };
      expect(map(markers), isEmpty);
      expect(map(markers, runTime: 1357).single['EndTicks'], 1357 * _ticks);
    });

    test('empty, inverted, repeated and unknown segments are dropped', () {
      expect(
        map({
          'marker_segments': [
            {'kind': 'intro', 'start_seconds': 50, 'end_seconds': 50},
            {'kind': 'intro', 'start_seconds': 50, 'end_seconds': 40},
            {'kind': 'intro', 'start_seconds': 10, 'end_seconds': 20},
            {'kind': 'intro', 'start_seconds': 10, 'end_seconds': 20},
            {'kind': 'commercial', 'start_seconds': 0, 'end_seconds': 5},
            {'kind': 'intro'},
            'junk',
          ],
        }).map((x) => x['StartTicks']),
        [10 * _ticks],
      );
    });

    test('a negative start begins at 0', () {
      expect(
        map({
          'intro': {'start_seconds': -1, 'end_seconds': 30},
        }).single['StartTicks'],
        0,
      );
    });
  });
}
