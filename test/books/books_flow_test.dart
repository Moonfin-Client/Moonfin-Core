import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/books_repository.dart';
import 'package:moonfin/data/viewmodels/books_requests_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/books/books_requests_screen.dart';

class _BooksAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Object body = switch (options.uri.pathSegments.last) {
      'Search' => {
        'books': [
          {
            'provider': 'openlibrary',
            'provider_id': '1',
            'title': 'Example',
            'authors': ['Author'],
          },
        ],
        'page': 1,
        'has_more': false,
      },
      'Status' => {
        'queued': {
          'one': {'title': 'Own book', 'username': 'owner'},
          'two': {'title': 'Other book', 'username': 'another-user'},
        },
      },
      _ => {},
    };
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _InstantReleasesRepository extends BooksRepository {
  _InstantReleasesRepository()
    : super.forTest('https://jellyfin.example', 'test-token', Dio());

  @override
  Future<List<BookRelease>> releases(
    BookResult book,
    BooksMediaType type,
  ) async => const [
    BookRelease(
      source: 'prowlarr',
      sourceId: 'release-1',
      title: 'Example EPUB',
      format: 'epub',
      language: 'en',
    ),
  ];
}

void main() {
  test(
    'status keeps only the current username, including for admins',
    () async {
      final dio = Dio()..httpClientAdapter = _BooksAdapter();
      final repo = BooksRepository.forTest(
        'https://jellyfin.example',
        'test-token',
        dio,
        username: 'owner',
      );
      final status = await repo.active();
      expect(status.map((item) => item.title), ['Own book']);
    },
  );

  test('search maps results before a widget is pumped', () async {
    final dio = Dio()..httpClientAdapter = _BooksAdapter();
    final repository = BooksRepository.forTest(
      'https://jellyfin.example',
      'test-token',
      dio,
    );
    final model = BooksRequestsViewModel(repository)
      ..bindIdentity('server:user');
    await model.search('Example');
    expect(model.results.single.title, 'Example');
    model.dispose();
  });

  testWidgets('select release and start only once without Dio in fake async', (
    tester,
  ) async {
    final repo = _InstantReleasesRepository();
    const book = BookResult(
      provider: 'openlibrary',
      id: '1',
      title: 'Example',
      authors: ['Author'],
      year: 2020,
    );
    final downloadFinished = Completer<bool>();
    var calls = 0;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BookReleasesDialog(
            book: book,
            type: BooksMediaType.ebook,
            repository: repo,
            onStart: (book, release, type) {
              calls++;
              return downloadFinished.future;
            },
            onDownloads: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Example EPUB'), findsOneWidget);
    await tester.tap(find.text('Example EPUB'));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('books-submit')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('books-submit')));
    await tester.pump();
    expect(calls, 1);
    downloadFinished.complete(true);
    await tester.pumpAndSettle();
    expect(find.text('Download started'), findsOneWidget);
  }, timeout: const Timeout(Duration(seconds: 20)));
}
