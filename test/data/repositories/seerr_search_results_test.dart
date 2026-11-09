import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';

/// Page 1 of 40, so a test can see the server's totals carried through.
Map<String, dynamic> page(List<Map<String, dynamic>> results) => {
  'page': 1,
  'totalPages': 40,
  'totalResults': 800,
  'results': results,
};

void main() {
  group('keepVideoSearchResults', () {
    test('leaves a page of video kinds alone', () {
      final input = page([
        {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
        {'id': 1399, 'mediaType': 'tv', 'name': 'Game of Thrones'},
        {'id': 6384, 'mediaType': 'person', 'name': 'Keanu Reeves'},
        {'id': 2344, 'mediaType': 'collection', 'name': 'The Matrix'},
      ]);

      final output = keepVideoSearchResults(input);

      expect(output, same(input));
      expect(output['totalResults'], 800);
      expect(output['totalPages'], 40);
    });

    test('drops the kinds that carry a string id, and keeps the totals', () {
      final output = keepVideoSearchResults(
        page([
          {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
          {
            'id': '3eed7c58-d58f-3c5f-b82b-0349771cca80',
            'mediaType': 'album',
            'title': 'Matrix',
          },
          {
            'id': 'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d',
            'mediaType': 'artist',
            'name': 'Ryoji Ikeda',
          },
          {'id': 'OL27448W', 'mediaType': 'book', 'title': 'The Matrix'},
          {'id': 'OL23919A', 'mediaType': 'author', 'name': 'Someone'},
        ]),
      );

      expect(output['results'], hasLength(1));
      expect(output['totalResults'], 800);
      expect(output['totalPages'], 40);
    });

    test('parses into a page once the string ids are gone', () {
      final output = keepVideoSearchResults(
        page([
          {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
          {'id': 'OL27448W', 'mediaType': 'book', 'title': 'The Matrix'},
        ]),
      );

      final parsed = SeerrDiscoverPage.fromJson(output);

      expect(parsed.results, hasLength(1));
      expect(parsed.results.single.id, 603);
      expect(parsed.results.single.mediaType, 'movie');
    });

    test('keeps a result that never said what kind it is', () {
      final output = keepVideoSearchResults(
        page([
          {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
          {'id': 7, 'title': 'No mediaType'},
        ]),
      );

      expect(output['results'], hasLength(2));
    });

    test('drops a result with no kind and a string id', () {
      final output = keepVideoSearchResults(
        page([
          {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
          {'id': 'OL27448W', 'title': 'No mediaType'},
        ]),
      );

      expect(output['results'], hasLength(1));
    });

    test('drops a video kind whose id is not a number', () {
      final output = keepVideoSearchResults(
        page([
          {'id': 603, 'mediaType': 'movie', 'title': 'The Matrix'},
          {'id': '603', 'mediaType': 'movie', 'title': 'String id'},
          {'mediaType': 'tv', 'name': 'No id'},
        ]),
      );

      expect(output['results'], hasLength(1));
      expect(SeerrDiscoverPage.fromJson(output).results.single.id, 603);
    });

    test('passes a body without a results list straight through', () {
      final input = <String, dynamic>{'message': 'Not found'};

      expect(keepVideoSearchResults(input), same(input));
    });
  });
}
