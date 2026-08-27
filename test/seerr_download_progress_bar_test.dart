import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_download_progress.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/seerr_download_progress_bar.dart';

const _gb = 1024 * 1024 * 1024;

/// 1.4 GB of 15.2 GB, about 9%.
const _summary = SeerrDownloadSummary(
  fraction: 0.09,
  isImporting: false,
  totalBytes: 15 * _gb,
  downloadedBytes: 1 * _gb,
);

Widget _host({required double width, SeerrDownloadSummary summary = _summary}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          child: SeerrDownloadProgressBar(summary: summary),
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

  testWidgets('importing says so instead of showing a stuck 100%', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        width: 320,
        summary: const SeerrDownloadSummary(
          fraction: 1,
          isImporting: true,
          totalBytes: 15 * _gb,
          downloadedBytes: 15 * _gb,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Importing'), findsOneWidget);
    expect(find.text('100%'), findsNothing);
  });

  testWidgets('no server sizes: falls back to the verb and the percentage', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        width: 320,
        summary: const SeerrDownloadSummary(fraction: 0.09, isImporting: false),
      ),
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
                            const SeerrDownloadProgressBar(summary: _summary),
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
  });
}
