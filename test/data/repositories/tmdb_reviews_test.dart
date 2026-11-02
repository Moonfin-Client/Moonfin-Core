import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';

void main() {
  test('reads each review the plugin sends', () {
    final reviews = parseTmdbReviews({
      'success': true,
      'totalResults': 2,
      'reviews': [
        {
          'id': 'a',
          'author': 'Brett Pascoe',
          'rating': 9,
          'content': 'In my **top 5**.',
          'createdAt': '2021-06-23T10:11:12.000Z',
          'avatarUrl': 'https://image.tmdb.org/t/p/w185/pic.jpg',
          'url': 'https://www.themoviedb.org/review/a',
        },
        {'id': 'b', 'author': 'Goddard', 'rating': null, 'content': 'Fine.'},
      ],
    });

    expect(reviews, hasLength(2));
    expect(reviews[0].author, 'Brett Pascoe');
    expect(reviews[0].rating, 9.0);
    expect(reviews[0].createdAt, DateTime.utc(2021, 6, 23, 10, 11, 12));
    expect(reviews[0].url, 'https://www.themoviedb.org/review/a');
    expect(reviews[1].rating, isNull);
    expect(reviews[1].avatarUrl, isNull);
  });

  test('leaves out reviews with no text or the wrong shape', () {
    final reviews = parseTmdbReviews({
      'reviews': [
        {'author': 'a', 'content': ''},
        {'author': 'b'},
        'not a review',
        {'author': 7, 'content': 'Kept, with no name.', 'rating': 'nine'},
      ],
    });

    expect(reviews, hasLength(1));
    expect(reviews.single.author, '');
    expect(reviews.single.rating, isNull);
  });

  test('copes with an answer that has no reviews', () {
    expect(parseTmdbReviews({'success': true}), isEmpty);
  });
}
