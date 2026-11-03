import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

/// A Silo list of [count] items, paged the way Silo pages: opaque next
/// cursors, a window cursor, `seek` from the window cursor, and every cursor
/// bound to the `limit` of the request that issued it, as Silo signs them.
class _FakeList {
  _FakeList(this.count, {this.exact = true, this.withWindow = true});

  final int count;
  final bool exact;
  final bool withWindow;
  int generation = 1;
  final calls = <String>[];

  Future<SiloPage> fetch({
    String? cursor,
    int? seek,
    required int limit,
  }) async {
    expect(limit, inInclusiveRange(1, siloMaxPageSize));
    calls.add(
      [
        if (cursor != null) 'cursor=$cursor',
        if (seek != null) 'seek=$seek',
        'limit=$limit',
      ].join('&'),
    );
    int offset;
    if (cursor == null) {
      offset = 0;
    } else {
      final parts = cursor.split(':');
      if (int.parse(parts[1]) != generation || int.parse(parts.last) != limit) {
        throw _problem('invalid_cursor');
      }
      if (parts[0] == 'window') {
        expect(seek, isNotNull);
        offset = seek!;
      } else {
        expect(seek, isNull);
        offset = int.parse(parts[2]);
      }
    }
    final end = offset + limit > count ? count : offset + limit;
    final items = [
      for (var i = offset; i < end; i++) {'content_id': 'item-$i'},
    ];
    final more = end < count;
    return SiloPage(
      items: items,
      nextCursor: more ? 'next:$generation:$end:$limit' : null,
      hasMore: more,
      windowCursor: withWindow ? 'window:$generation:$limit' : null,
      total: count,
      totalExact: exact,
    );
  }
}

DioException _problem(String code, {int status = 400}) {
  final request = RequestOptions(path: '/api/v2/catalog');
  return DioException(
    requestOptions: request,
    response: Response(
      requestOptions: request,
      statusCode: status,
      data: {
        'type': 'https://siloserver.org/docs/api/v2/problems/$code',
        'title': 'Bad cursor',
        'status': status,
      },
    ),
    type: DioExceptionType.badResponse,
  );
}

List<String> _ids(SiloPagedResult r) => [
  for (final i in r.items) i['content_id'] as String,
];

List<String> _range(int from, int to) => [
  for (var i = from; i < to; i++) 'item-$i',
];

void main() {
  late SiloPager pager;

  setUp(() => pager = SiloPager());

  Future<SiloPagedResult> page(
    _FakeList list,
    int start,
    int? limit, {
    String signature = 'q',
  }) => pager.page(
    signature: signature,
    startIndex: start,
    limit: limit,
    fetch: list.fetch,
  );

  group('requests', () {
    test('every request to Silo has the same limit', () async {
      final list = _FakeList(5000);
      // A grid's pages, a jump far down, a scroll back up.
      await page(list, 0, 75);
      await page(list, 75, 48);
      await page(list, 123, 300);
      await page(list, 3500, 48);
      await page(list, 40, 10);
      expect(list.calls.map((c) => c.split('&').last).toSet(), {'limit=100'});
    });

    test(
      'the first page is a plain request, trimmed to what was asked',
      () async {
        final list = _FakeList(120);
        final r = await page(list, 0, 50);
        expect(_ids(r), _range(0, 50));
        expect(r.totalRecordCount, 120);
        expect(list.calls, ['limit=100']);
      },
    );

    test('what was fetched serves the next ranges without a request', () async {
      final list = _FakeList(500);
      await page(list, 0, 75);
      final r = await page(list, 75, 20);
      expect(_ids(r), _range(75, 95));
      expect(list.calls, ['limit=100']);
    });

    test('the next page follows next_cursor', () async {
      final list = _FakeList(500);
      await page(list, 0, 75);
      final r = await page(list, 75, 48);
      expect(_ids(r), _range(75, 123));
      expect(list.calls, ['limit=100', 'cursor=next:1:100:100&limit=100']);
    });

    test('any other offset seeks from the window cursor', () async {
      final list = _FakeList(1000);
      await page(list, 0, 50);
      final r = await page(list, 700, 40);
      expect(_ids(r), _range(700, 740));
      expect(list.calls.last, 'cursor=window:1:100&seek=700&limit=100');
      // Scrolling on from there is served by that page, then its next cursor.
      await page(list, 740, 40);
      expect(list.calls, hasLength(2));
      await page(list, 780, 40);
      expect(list.calls.last, 'cursor=next:1:800:100&limit=100');
    });

    test('a jump before any first page fetches one for the window', () async {
      final list = _FakeList(1000);
      final r = await page(list, 300, 25);
      expect(_ids(r), _range(300, 325));
      expect(list.calls, [
        'limit=100',
        'cursor=window:1:100&seek=300&limit=100',
      ]);
    });

    test('going back is served from what was kept, or seeks', () async {
      final list = _FakeList(3000);
      await page(list, 0, 50);
      await page(list, 2000, 50);
      final calls = list.calls.length;
      final r = await page(list, 10, 50);
      expect(_ids(r), _range(10, 60));
      expect(list.calls, hasLength(calls), reason: 'the first page is kept');
    });

    test('a large range seeks its pages in parallel batches', () async {
      final list = _FakeList(5000);
      await page(list, 0, 75);
      final r = await page(list, 75, 3500);
      expect(_ids(r), _range(75, 3575));
      // Page 0 is kept, and the rest are seeks of 100, four at a time.
      final seeks = list.calls.where((c) => c.contains('seek=')).toList();
      expect(seeks.first, 'cursor=window:1:100&seek=100&limit=100');
      expect(seeks, hasLength(35));
    });

    test('a range past the end stops at the end', () async {
      final list = _FakeList(1500);
      final r = await page(list, 100, 2000);
      expect(_ids(r), _range(100, 1500));
      expect(r.totalRecordCount, 1500);
      expect(list.calls, isNot(contains(contains('seek=1500'))));
    });

    test('no limit is one page of Silo\'s default size', () async {
      final list = _FakeList(120);
      final r = await page(list, 0, null);
      expect(r.items, hasLength(50));
    });

    test('past an exact total: empty, no request', () async {
      final list = _FakeList(30);
      await page(list, 0, 50);
      final r = await page(list, 30, 50);
      expect(r.items, isEmpty);
      expect(r.totalRecordCount, 30);
      expect(list.calls, hasLength(1));
    });

    test('queries are kept apart by signature', () async {
      final movies = _FakeList(500);
      final shows = _FakeList(500);
      await page(movies, 0, 100, signature: 'movies');
      await page(shows, 0, 100, signature: 'shows');
      await page(movies, 100, 50, signature: 'movies');
      expect(movies.calls.last, 'cursor=next:1:100:100&limit=100');
    });
  });

  group('invalid cursors', () {
    test('a rejected cursor starts over once', () async {
      final list = _FakeList(1000);
      await page(list, 0, 100);
      // The server restarted, so old cursors are refused.
      list.generation = 2;
      final r = await page(list, 100, 50);
      expect(_ids(r), _range(100, 150));
      expect(list.calls.sublist(1), [
        'cursor=next:1:100:100&limit=100',
        'limit=100',
        'cursor=next:2:100:100&limit=100',
      ]);
    });

    test('a second rejection is passed on', () async {
      final pager = SiloPager();
      var calls = 0;
      await expectLater(
        pager.page(
          signature: 'q',
          startIndex: 0,
          limit: 10,
          fetch: ({cursor, seek, required limit}) async {
            calls++;
            throw _problem('invalid_cursor');
          },
        ),
        throwsA(isA<DioException>()),
      );
      expect(calls, 2);
    });

    test('other errors are not retried', () async {
      var calls = 0;
      await expectLater(
        pager.page(
          signature: 'q',
          startIndex: 0,
          limit: 10,
          fetch: ({cursor, seek, required limit}) async {
            calls++;
            throw _problem('forbidden', status: 403);
          },
        ),
        throwsA(isA<DioException>()),
      );
      expect(calls, 1);
    });

    test('what counts as a cursor error', () {
      expect(isSiloInvalidCursorError(_problem('invalid_cursor')), isTrue);
      expect(isSiloInvalidCursorError(_problem('cursor_expired')), isTrue);
      expect(
        isSiloInvalidCursorError(_problem('invalid_cursor', status: 422)),
        isTrue,
      );
      expect(
        isSiloInvalidCursorError(_problem('not_found', status: 404)),
        isFalse,
      );
      expect(isSiloInvalidCursorError(StateError('x')), isFalse);

      final request = RequestOptions(path: '/api/v2/catalog');
      DioException validation(String location) => DioException(
        requestOptions: request,
        response: Response(
          requestOptions: request,
          statusCode: 422,
          data: {
            'type':
                'https://siloserver.org/docs/api/v2/problems/validation_failed',
            'title': 'Validation failed',
            'errors': [
              {'location': location, 'code': 'invalid'},
            ],
          },
        ),
        type: DioExceptionType.badResponse,
      );
      expect(isSiloInvalidCursorError(validation('query.cursor')), isTrue);
      expect(isSiloInvalidCursorError(validation('query.seek')), isTrue);
      expect(isSiloInvalidCursorError(validation('query.sort')), isFalse);
    });
  });

  group('totals', () {
    test('an estimate is replaced by where the list was seen to end', () async {
      final list = _FakeList(120, exact: false);
      final r = await page(list, 100, 50);
      expect(r.items, hasLength(20));
      expect(r.totalRecordCount, 120);
    });

    test('no total: seen plus one while there is more', () async {
      final pager = SiloPager(pageSize: 2);
      final r = await pager.page(
        signature: 'q',
        startIndex: 0,
        limit: 2,
        fetch: ({cursor, seek, required limit}) async => const SiloPage(
          items: [
            {'a': 1},
            {'a': 2},
          ],
          nextCursor: 'n',
          hasMore: true,
        ),
      );
      expect(r.totalRecordCount, 3);
    });
  });

  group('no window cursor', () {
    test('an offset is reached by following next cursors', () async {
      final list = _FakeList(500, withWindow: false);
      final r = await page(list, 230, 20);
      expect(_ids(r), _range(230, 250));
      expect(list.calls, [
        'limit=100',
        'cursor=next:1:100:100&limit=100',
        'cursor=next:1:200:100&limit=100',
      ]);
    });

    test('behind the walk it starts over from the top', () async {
      final list = _FakeList(2000, withWindow: false);
      await page(list, 1500, 10);
      final r = await page(list, 5, 10);
      expect(_ids(r), _range(5, 15));
    });
  });

  group('odd answers', () {
    test('an empty page that claims more ends the range', () async {
      var calls = 0;
      final r = await pager.page(
        signature: 'q',
        startIndex: 0,
        limit: 10,
        fetch: ({cursor, seek, required limit}) async {
          calls++;
          return const SiloPage(items: [], nextCursor: 'n', hasMore: true);
        },
      );
      expect(r.items, isEmpty);
      expect(calls, 1);
    });

    test('more claimed with no cursor at all ends the range', () async {
      var calls = 0;
      final r = await pager.page(
        signature: 'q',
        startIndex: 150,
        limit: 10,
        fetch: ({cursor, seek, required limit}) async {
          calls++;
          return SiloPage(
            items: [
              for (var i = 0; i < limit; i++) {'i': i},
            ],
            hasMore: true,
          );
        },
      );
      expect(r.items, isEmpty);
      expect(calls, 1);
    });
  });

  group('cache', () {
    test('the least recently used query is forgotten first', () async {
      final pager = SiloPager(maxEntries: 2);
      final list = _FakeList(1000);
      for (final s in ['a', 'b', 'c']) {
        await pager.page(
          signature: s,
          startIndex: 0,
          limit: 10,
          fetch: list.fetch,
        );
      }
      expect(pager.length, 2);
      list.calls.clear();
      // 'a' was forgotten: even its first rows need a request again.
      await pager.page(
        signature: 'a',
        startIndex: 10,
        limit: 10,
        fetch: list.fetch,
      );
      expect(list.calls.first, 'limit=100');
      pager.clear();
      expect(pager.length, 0);
    });
  });

  group('signatures', () {
    test('paging parameters, order and empty values don\'t matter', () {
      final a = siloPageSignature('/api/v2/catalog', {
        'library_id': '1',
        'sort': '-added_at',
        'limit': 50,
        'cursor': 'x',
        'seek': 10,
        'q': '',
        'genre': null,
        'content_rating': <String>[],
      });
      final b = siloPageSignature('/api/v2/catalog', {
        'sort': '-added_at',
        'library_id': 1,
      });
      expect(a, b);
      expect(
        siloPageSignature('/api/v2/catalog', {'library_id': '3'}),
        isNot(a),
      );
      expect(
        siloPageSignature('/api/v2/catalog', {
          'content_rating': ['PG', 'G'],
        }),
        isNot(
          siloPageSignature('/api/v2/catalog', {
            'content_rating': ['G', 'PG'],
          }),
        ),
      );
    });
  });

  group('reading Silo\'s answer', () {
    test('the library page fixture', () {
      final page = SiloPage.fromJson(
        jsonDecode(fixture('silo/catalog_library_page1.json'))
            as Map<String, dynamic>,
      );
      expect(page.items, hasLength(5));
      expect(page.hasMore, isTrue);
      expect(page.nextCursor, isNotNull);
      expect(page.windowCursor, isNotNull);
      expect(page.total, 4611);
      expect(page.totalExact, isTrue);
    });

    test('a last page has no next cursor', () {
      final page = SiloPage.fromJson({
        'items': [],
        'page': {'has_more': false},
      });
      expect(page.nextCursor, isNull);
      expect(page.hasMore, isFalse);
      expect(page.total, isNull);
    });
  });
}
