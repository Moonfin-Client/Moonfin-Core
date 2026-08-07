import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/app_update_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/app_update_banner.dart';
import 'package:moonfin/ui/widgets/status_banner_pill.dart';

void main() {
  Widget wrap(Future<DesktopUpdateInfo?> Function() check) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: AppUpdateBanner(checkForUpdate: check)),
    );
  }

  final update = DesktopUpdateInfo(
    version: '2.3.3',
    downloadUri: Uri.parse('https://example.invalid/Moonfin.apk'),
    releaseNotesUrl: 'https://example.invalid/notes',
  );

  testWidgets('shows the version, then dismisses itself', (tester) async {
    await tester.pumpWidget(wrap(() async => update));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(StatusBannerPill), findsOneWidget);
    expect(find.textContaining('2.3.3'), findsOneWidget);

    // Past the auto-dismiss timer the banner leaves on its own, untouched.
    await tester.pump(const Duration(seconds: 8));
    await tester.pumpAndSettle();

    expect(find.byType(StatusBannerPill), findsNothing);
  });

  testWidgets('stays hidden when there is no update', (tester) async {
    await tester.pumpWidget(wrap(() async => null));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(StatusBannerPill), findsNothing);
  });

  testWidgets('a failed check leaves the banner hidden', (tester) async {
    await tester.pumpWidget(wrap(() async => throw Exception('offline')));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(StatusBannerPill), findsNothing);
  });
}
