import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/books_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/books/books_requests_screen.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin/util/platform_detection.dart';

class _ReleasesRepository extends BooksRepository {
  _ReleasesRepository()
    : super.forTest('https://jellyfin.example', 'test-token', Dio());

  @override
  Future<List<BookRelease>> releases(
    BookResult book,
    BooksMediaType type,
  ) async => const [
    BookRelease(source: 'test', sourceId: '1', title: 'First EPUB'),
    BookRelease(source: 'test', sourceId: '2', title: 'Second EPUB'),
  ];
}

void main() {
  setUp(() => PlatformDetection.setTvMode(true));
  tearDown(() {
    PlatformDetection.setTvMode(false);
    while (DialogBackSuppressor.consume()) {}
  });

  for (final key in [
    LogicalKeyboardKey.select,
    LogicalKeyboardKey.enter,
    LogicalKeyboardKey.numpadEnter,
    LogicalKeyboardKey.gameButtonA,
    LogicalKeyboardKey.accept,
    LogicalKeyboardKey.space,
  ]) {
    final physical = key == LogicalKeyboardKey.accept
        ? PhysicalKeyboardKey.enter
        : null;
    // Accept is a Windows/web logical key, absent from Android keyCode tables.
    final eventPlatform = key == LogicalKeyboardKey.accept ? 'windows' : null;
    testWidgets(
      'TV ${key.keyLabel}: select, submit once, back restores focus',
      (tester) async {
        final opener = FocusNode();
        addTearDown(opener.dispose);
        final pending = Completer<bool>();
        var starts = 0;
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: Builder(
                builder: (context) => TextButton(
                  focusNode: opener,
                  autofocus: true,
                  onPressed: () => showFocusRestoringDialog<void>(
                    context: context,
                    builder: (_) => BookReleasesDialog(
                      book: const BookResult(
                        provider: 'test',
                        id: 'book',
                        title: 'Example',
                        authors: [],
                      ),
                      type: BooksMediaType.ebook,
                      repository: _ReleasesRepository(),
                      onStart: (_, release, _) {
                        starts++;
                        expect(release.sourceId, '2');
                        return pending.future;
                      },
                      onDownloads: () {},
                    ),
                  ),
                  child: const Text('Open releases'),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();
        expect(FocusManager.instance.primaryFocus?.debugLabel, 'books-close');

        // Directional navigation from the action row reaches the release list.
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pumpAndSettle();
        expect(
          Focus.of(tester.element(find.text('Second EPUB'))).hasFocus,
          isTrue,
        );
        await tester.sendKeyEvent(
          key,
          physicalKey: physical,
          platform: eventPlatform,
        );
        await tester.pump();
        expect(
          tester
              .widget<ListTile>(
                find.byKey(const ValueKey('books-release:test:2')),
              )
              .selected,
          isTrue,
        );
        expect(
          starts,
          0,
          reason: 'Selecting a release must not start a download',
        );

        final submit = find.byKey(const ValueKey('books-submit'));
        Focus.of(
          tester.element(
            find.descendant(of: submit, matching: find.byType(Text)),
          ),
        ).requestFocus();
        await tester.pump();
        await tester.sendKeyDownEvent(
          key,
          physicalKey: physical,
          platform: eventPlatform,
        );
        await tester.pump();
        await tester.sendKeyRepeatEvent(
          key,
          physicalKey: physical,
          platform: eventPlatform,
        );
        await tester.sendKeyUpEvent(
          key,
          physicalKey: physical,
          platform: eventPlatform,
        );
        await tester.pump();
        expect(starts, 1);
        pending.complete(true);
        await tester.pumpAndSettle();
        expect(find.text('Download started'), findsOneWidget);

        await tester.sendKeyEvent(
          LogicalKeyboardKey.goBack,
          // Test the logical Back handler; Flutter has no Android BrowserBack scan mapping.
          physicalKey: PhysicalKeyboardKey.escape,
        );
        await tester.pumpAndSettle();
        expect(find.byType(BookReleasesDialog), findsNothing);
        expect(opener.hasPrimaryFocus, isTrue);
      },
    );
  }
}
