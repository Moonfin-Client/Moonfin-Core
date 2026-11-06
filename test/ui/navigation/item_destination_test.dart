import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/navigation/destinations.dart';

void main() {
  group('Destinations.item', () {
    test('stays bare without options', () {
      expect(Destinations.item('abc'), '/item/abc');
    });

    test(
      'carries the browsed season so an inlined special keeps its context',
      () {
        expect(
          Destinations.item(
            'special-id',
            serverId: 's1',
            seasonContext: 'season-1',
          ),
          '/item/special-id?serverId=s1&seasonContext=season-1',
        );
      },
    );

    test('omits an absent or empty season context', () {
      expect(Destinations.item('abc', seasonContext: null), '/item/abc');
      expect(Destinations.item('abc', seasonContext: ''), '/item/abc');
    });

    test('escapes a season context so it survives the query string', () {
      final uri = Uri.parse(Destinations.item('abc', seasonContext: 'a b&c'));
      expect(uri.queryParameters['seasonContext'], 'a b&c');
    });
  });

  group('Destinations.studio', () {
    test('stays bare without a server', () {
      expect(Destinations.studio('A24'), '/studio/A24');
      expect(Destinations.studio('A24', serverId: ''), '/studio/A24');
    });

    test('carries the owning server so the studio opens on it', () {
      const serverId = 'https://host:8096/jf?x=1&y';
      final uri = Uri.parse(Destinations.studio('A24', serverId: serverId));
      expect(uri.path, '/studio/A24');
      expect(uri.queryParameters['serverId'], serverId);
    });

    test('escapes a studio name so it survives the path', () {
      const name = 'Studio / R&D 100% é';
      final uri = Uri.parse(Destinations.studio(name, serverId: 's1'));
      expect(uri.pathSegments, ['studio', name]);
    });
  });

  group('Destinations.genre', () {
    test('leaves serverId out without a server', () {
      expect(
        Destinations.genre('Drama', genreId: 'g1'),
        '/genre/Drama?genreId=g1',
      );
      expect(
        Destinations.genre('Drama', genreId: 'g1', serverId: ''),
        '/genre/Drama?genreId=g1',
      );
    });

    test('carries the owning server so the genre opens on it', () {
      const serverId = 'https://host:8096/jf?x=1&y';
      final uri = Uri.parse(
        Destinations.genre(
          'Drama',
          genreId: 'g1',
          parentId: 'lib',
          serverId: serverId,
        ),
      );
      expect(uri.path, '/genre/Drama');
      expect(uri.queryParameters['genreId'], 'g1');
      expect(uri.queryParameters['parentId'], 'lib');
      expect(uri.queryParameters['serverId'], serverId);
    });

    test('appends serverId after the existing query', () {
      expect(
        Destinations.genre('Drama', genreId: 'g1', serverId: 's1'),
        '/genre/Drama?genreId=g1&serverId=s1',
      );
    });
  });
}
