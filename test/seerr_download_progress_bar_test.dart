import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/seerr_download_progress_bar.dart';

const _gb = 1024 * 1024 * 1024;

/// 1.4 GB of 15.2 GB, about 9%.
const _summary = SeerrDownloadSummary(
  fraction: 0.09,
  totalBytes: 15 * _gb,
  downloadedBytes: 1 * _gb,
);

Widget _host({
  required double width,
  SeerrDownloadSummary summary = _summary,
  int reasonMaxLines = 1,
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          child: SeerrDownloadProgressBar(
            summary: summary,
            reasonMaxLines: reasonMaxLines,
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('wide: shows the verb and both sizes', (tester) async {
    await tester.pumpWidget(_host(width: 320));
    await tester.pumpAndSettle();

    expect(find.textContaining('Downloading'), findsOneWidget);
    expect(find.textContaining('/'), findsOneWidget);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('medium: drops the verb, keeps the sizes', (tester) async {
    await tester.pumpWidget(_host(width: 200));
    await tester.pumpAndSettle();

    expect(find.textContaining('Downloading'), findsNothing);
    expect(find.textContaining('/'), findsOneWidget);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('poster tile width still shows the sizes', (tester) async {
    // A desktop grid tile leaves roughly this much for the caption.
    await tester.pumpWidget(_host(width: 166));
    await tester.pumpAndSettle();

    expect(find.textContaining('/'), findsOneWidget);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('TV tile truncates the sizes but keeps the percentage', (
    tester,
  ) async {
    // A TV grid tile leaves roughly this much for the caption: too little for
    // the sizes and the percentage both, so the sizes ellipsize.
    await tester.pumpWidget(_host(width: 111));
    await tester.pumpAndSettle();

    expect(find.textContaining('/'), findsOneWidget);
    expect(find.text('9%'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('narrow: percentage survives alone', (tester) async {
    await tester.pumpWidget(_host(width: 70));
    await tester.pumpAndSettle();

    expect(find.textContaining('/'), findsNothing);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('fills the width on mobile, so it lines up with the button', (
    tester,
  ) async {
    // flutter test reports defaultTargetPlatform as android, so this exercises
    // the mobile branch: no cap, matching the full-width action button above
    // it on the detail screen. The desktop and TV cap cannot be exercised here
    // without a seam over PlatformDetection.
    await tester.pumpWidget(_host(width: 600));
    await tester.pumpAndSettle();

    final bar = tester.getSize(find.byType(LinearProgressIndicator));
    expect(bar.width, 600);
    expect(bar.height, greaterThanOrEqualTo(6));
  });

  // A blocked import sits here with no end, so it can't claim to be
  // importing.
  testWidgets('a finished download says it is waiting for the import', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        // The test font is about twice as wide as a real one.
        width: 600,
        summary: const SeerrDownloadSummary(
          fraction: 1,
          state: SeerrDownloadState.waitingForImport,
          totalBytes: 15 * _gb,
          downloadedBytes: 15 * _gb,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Downloaded, waiting for import'), findsOneWidget);
    expect(find.text('100%'), findsNothing);
  });

  testWidgets('large text: says just Downloaded when the phrase would cut', (
    tester,
  ) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(2)),
        child: _host(
          width: 600,
          summary: const SeerrDownloadSummary(
            fraction: 1,
            state: SeerrDownloadState.waitingForImport,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Downloaded'), findsOneWidget);
  });

  testWidgets('a tile says just Downloaded rather than cutting the phrase', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        width: 111,
        summary: const SeerrDownloadSummary(
          fraction: 1,
          state: SeerrDownloadState.waitingForImport,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Downloaded'), findsOneWidget);
  });

  testWidgets('wide: shows the time left after the percentage', (tester) async {
    await tester.pumpWidget(
      _host(
        width: 600,
        summary: const SeerrDownloadSummary(
          fraction: 0.09,
          timeLeft: Duration(hours: 1, minutes: 5),
          totalBytes: 15 * _gb,
          downloadedBytes: 1 * _gb,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('9% · 1h 5m left'), findsOneWidget);
  });

  // The pair below: 12 minutes fits at normal size, so only the text scale
  // can push it out.
  testWidgets('normal text: a short time left fits at 320', (tester) async {
    await tester.pumpWidget(
      _host(
        width: 320,
        summary: const SeerrDownloadSummary(
          fraction: 0.09,
          timeLeft: Duration(minutes: 12),
          totalBytes: 15 * _gb,
          downloadedBytes: 1 * _gb,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('9% · 12m left'), findsOneWidget);
  });

  testWidgets('large text: drops the time left instead of overflowing', (
    tester,
  ) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(2)),
        child: _host(
          width: 320,
          summary: const SeerrDownloadSummary(
            fraction: 0.09,
            timeLeft: Duration(minutes: 12),
            totalBytes: 15 * _gb,
            downloadedBytes: 1 * _gb,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.textContaining('left'), findsNothing);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('medium: drops the time left before the sizes', (tester) async {
    await tester.pumpWidget(
      _host(
        width: 200,
        summary: const SeerrDownloadSummary(
          fraction: 0.09,
          timeLeft: Duration(minutes: 12),
          totalBytes: 15 * _gb,
          downloadedBytes: 1 * _gb,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('left'), findsNothing);
    expect(find.text('9%'), findsOneWidget);
  });

  testWidgets('stalled: says so, with the sizes when there is room', (
    tester,
  ) async {
    const stalled = SeerrDownloadSummary(
      fraction: 0,
      state: SeerrDownloadState.stalled,
      totalBytes: 15 * _gb,
      downloadedBytes: 0,
    );
    await tester.pumpWidget(_host(width: 320, summary: stalled));
    await tester.pumpAndSettle();
    expect(find.textContaining('Stalled · '), findsOneWidget);
    expect(find.textContaining('Downloading'), findsNothing);

    // The word matters more than the sizes, so a tile keeps it.
    await tester.pumpWidget(_host(width: 166, summary: stalled));
    await tester.pumpAndSettle();
    expect(find.text('Stalled'), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);
  });

  testWidgets('paused, queued and failed name their state', (tester) async {
    for (final (state, label) in [
      (SeerrDownloadState.paused, 'Paused'),
      (SeerrDownloadState.queued, 'Queued'),
      (SeerrDownloadState.failed, 'Download failed'),
    ]) {
      await tester.pumpWidget(
        _host(
          width: 166,
          summary: SeerrDownloadSummary(fraction: 0.5, state: state),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(label), findsOneWidget, reason: state.name);
    }
  });

  testWidgets('a blocked import names its state, with no percentage', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        width: 166,
        summary: const SeerrDownloadSummary(
          fraction: 1,
          state: SeerrDownloadState.importBlocked,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Import blocked'), findsOneWidget);
    expect(find.textContaining('%'), findsNothing);
  });

  testWidgets('the arr reason sits under the bar, one line on a card', (
    tester,
  ) async {
    const reason =
        'qBittorrent cannot resolve magnet link with DHT disabled, and this '
        'sentence keeps going long enough to need more than one line';
    const stalled = SeerrDownloadSummary(
      fraction: 0,
      state: SeerrDownloadState.stalled,
      reason: reason,
    );
    await tester.pumpWidget(_host(width: 166, summary: stalled));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final card = tester.widget<Text>(find.text(reason));
    expect(card.maxLines, 1);
    expect(card.overflow, TextOverflow.ellipsis);

    await tester.pumpWidget(
      _host(width: 320, summary: stalled, reasonMaxLines: 3),
    );
    await tester.pumpAndSettle();
    expect(tester.widget<Text>(find.text(reason)).maxLines, 3);
  });

  testWidgets('no reason line without a reason', (tester) async {
    await tester.pumpWidget(_host(width: 320));
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsNWidgets(3));
  });

  testWidgets('not found yet is a line, not an empty bar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: SizedBox(width: 120, child: SeerrNotFoundYetLabel()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Not found yet'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsNothing);
  });

  testWidgets('narrow: a stuck download leaves the percentage alone', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        width: 70,
        summary: const SeerrDownloadSummary(
          fraction: 0.5,
          state: SeerrDownloadState.failed,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('50%'), findsOneWidget);
    expect(find.textContaining('failed'), findsNothing);
  });

  testWidgets('no server sizes: falls back to the verb and the percentage', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(width: 320, summary: const SeerrDownloadSummary(fraction: 0.09)),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('/'), findsNothing);
    expect(find.textContaining('Downloading'), findsOneWidget);
    expect(find.text('9%'), findsOneWidget);
  });

  // The bar lives inside a fixed 140px card row that a ListView hands an
  // unbounded height. A stretch/IntrinsicHeight parent throws there, and
  // content taller than 140 overflows, so pin both.
  testWidgets('card column fits the 175px row at phone width', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // With the arr's reason too, which adds a line under the bar.
    for (final summary in const [
      _summary,
      SeerrDownloadSummary(
        fraction: 0,
        state: SeerrDownloadState.stalled,
        reason: 'qBittorrent cannot resolve magnet link with DHT disabled',
      ),
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: ListView(
              children: [
                SizedBox(
                  height: 175,
                  child: Row(
                    children: [
                      const SizedBox(width: 110),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Flexible(child: Text('Toy Story 5')),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 40, height: 17),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 70, height: 22),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SeerrDownloadProgressBar(summary: summary),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Requested by Axel · Modified by Axel · '
                                      '26 August 2026',
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(width: 32, height: 32),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    }
  });
}
