import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/utils/episode_cast_utils.dart';
import 'package:server_core/server_core.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}
class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  group('mergeEpisodeCast', () {
    test('guest stars appear first and receive formatted role', () {
      final episodeActors = [
        {'Id': 'g1', 'Name': 'Guest One', 'Type': 'GuestStar', 'Role': 'Sheriff'},
        {'Id': 'g2', 'Name': 'Guest Two', 'Type': 'GuestStar', 'Role': ''},
        {'Id': 'a1', 'Name': 'Episode Actor', 'Type': 'Actor', 'Role': 'Bartender'},
      ];
      final parentActors = [
        {'Id': 'p1', 'Name': 'Main One', 'Type': 'Actor', 'Role': 'Hero'},
        {'Id': 'p2', 'Name': 'Main Two', 'Type': 'Actor', 'Role': 'Villain'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: parentActors,
      );

      expect(merged.length, 5);
      expect(merged[0]['Name'], 'Guest One');
      expect(merged[0]['Role'], 'Sheriff (Guest Star)');
      expect(merged[1]['Name'], 'Guest Two');
      expect(merged[1]['Role'], 'Guest Star');
      expect(merged[2]['Name'], 'Episode Actor');
      expect(merged[2]['Role'], 'Bartender');
      expect(merged[3]['Name'], 'Main One');
      expect(merged[3]['Role'], 'Hero');
      expect(merged[4]['Name'], 'Main Two');
      expect(merged[4]['Role'], 'Villain');
    });

    test('deduplicates parent actors who already appear in episode actors', () {
      final episodeActors = [
        {'Id': 'p1', 'Name': 'Main One', 'Type': 'Actor', 'Role': 'Hero in Disguise'},
      ];
      final parentActors = [
        {'Id': 'p1', 'Name': 'Main One', 'Type': 'Actor', 'Role': 'Hero'},
        {'Id': 'p2', 'Name': 'Main Two', 'Type': 'Actor', 'Role': 'Villain'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: parentActors,
      );

      expect(merged.length, 2);
      expect(merged[0]['Name'], 'Main One');
      expect(merged[0]['Role'], 'Hero in Disguise');
      expect(merged[1]['Name'], 'Main Two');
    });

    test('does not duplicate (Guest Star) suffix if already present', () {
      final episodeActors = [
        {'Id': 'g1', 'Name': 'Guest One', 'Type': 'GuestStar', 'Role': 'Special Guest Star'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: [],
      );

      expect(merged.single['Role'], 'Special Guest Star');
    });

    test('does not skip guest star suffix on roles containing guest as part of character description', () {
      final episodeActors = [
        {'Id': 'g1', 'Name': 'Guest One', 'Type': 'GuestStar', 'Role': 'Guesthouse Owner'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: [],
      );

      expect(merged.single['Role'], 'Guesthouse Owner (Guest Star)');
    });

    test('does not deduplicate distinct people sharing a name if they have different IDs', () {
      final episodeActors = [
        {'Id': 'ep_1', 'Name': 'John Smith', 'Type': 'Actor', 'Role': 'Junior'},
      ];
      final parentActors = [
        {'Id': 'parent_1', 'Name': 'John Smith', 'Type': 'Actor', 'Role': 'Senior'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: parentActors,
      );

      expect(merged.length, 2);
      expect(merged[0]['Id'], 'ep_1');
      expect(merged[1]['Id'], 'parent_1');
    });

    test('deduplicates people without IDs by name as fallback', () {
      final episodeActors = [
        {'Name': 'Jane Doe', 'Type': 'Actor', 'Role': 'Doctor'},
      ];
      final parentActors = [
        {'Name': 'Jane Doe', 'Type': 'Actor', 'Role': 'Doctor Regular'},
      ];

      final merged = mergeEpisodeCast(
        episodeActors: episodeActors,
        parentActors: parentActors,
      );

      expect(merged.length, 1);
      expect(merged[0]['Role'], 'Doctor');
    });
  });

  group('mergeEpisodePeople', () {
    test('orders episode cast first, then parent regulars, then episode crew', () {
      final episodePeople = [
        {'Id': 'd1', 'Name': 'Director Dan', 'Type': 'Director', 'Role': ''},
        {'Id': 'w1', 'Name': 'Writer Wendy', 'Type': 'Writer', 'Role': ''},
        {'Id': 'g1', 'Name': 'Guest Guy', 'Type': 'GuestStar', 'Role': 'Outlaw'},
      ];
      final parentActors = [
        {'Id': 'm1', 'Name': 'Main Star', 'Type': 'Actor', 'Role': 'Marshal'},
      ];

      final merged = mergeEpisodePeople(
        episodePeople: episodePeople,
        parentActors: parentActors,
      );

      expect(merged.length, 4);
      // Episode cast first
      expect(merged[0]['Name'], 'Guest Guy');
      expect(merged[0]['Role'], 'Outlaw (Guest Star)');
      // Parent regular next
      expect(merged[1]['Name'], 'Main Star');
      expect(merged[1]['Role'], 'Marshal');
      // Episode crew last
      expect(merged[2]['Name'], 'Director Dan');
      expect(merged[2]['Role'], 'Episode Director');
      expect(merged[3]['Name'], 'Writer Wendy');
      expect(merged[3]['Role'], 'Episode Writer');
    });
  });

  group('resolveParentCast', () {
    late _MockMediaServerClient client;
    late _MockItemsApi itemsApi;

    setUp(() {
      client = _MockMediaServerClient();
      itemsApi = _MockItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
    });

    test('prefers season cast when season has actors', () async {
      when(() => itemsApi.getItem('season-1')).thenAnswer(
        (_) async => {
          'People': [
            {'Id': 's1', 'Name': 'Season Actor', 'Type': 'Actor', 'Role': 'Hero'},
          ],
        },
      );

      final cast = await resolveParentCast(
        client: client,
        seasonId: 'season-1',
        seriesId: 'series-1',
      );

      expect(cast.length, 1);
      expect(cast.first['Name'], 'Season Actor');
      verifyNever(() => itemsApi.getItem('series-1'));
    });

    test('falls back to series cast when season has no actors', () async {
      when(() => itemsApi.getItem('season-1')).thenAnswer(
        (_) async => {
          'People': <Map<String, dynamic>>[],
        },
      );
      when(() => itemsApi.getItem('series-1')).thenAnswer(
        (_) async => {
          'People': [
            {'Id': 'ser1', 'Name': 'Series Actor', 'Type': 'Actor', 'Role': 'Legend'},
          ],
        },
      );

      final cast = await resolveParentCast(
        client: client,
        seasonId: 'season-1',
        seriesId: 'series-1',
      );

      expect(cast.length, 1);
      expect(cast.first['Name'], 'Series Actor');
    });

    test('falls back to series cast when season fetch fails', () async {
      when(() => itemsApi.getItem('season-1')).thenThrow(Exception('network error'));
      when(() => itemsApi.getItem('series-1')).thenAnswer(
        (_) async => {
          'People': [
            {'Id': 'ser1', 'Name': 'Series Actor', 'Type': 'Actor', 'Role': 'Legend'},
          ],
        },
      );

      final cast = await resolveParentCast(
        client: client,
        seasonId: 'season-1',
        seriesId: 'series-1',
      );

      expect(cast.length, 1);
      expect(cast.first['Name'], 'Series Actor');
    });
  });
}
