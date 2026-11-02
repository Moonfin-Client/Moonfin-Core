import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_streaming_row.dart';
import 'package:moonfin/util/platform_detection.dart';

// No logo paths, so the tiles fall back to the names and nothing loads.
const _providers = [
  SeerrWatchProvider(id: 1899, name: 'HBO Max'),
  SeerrWatchProvider(id: 2528, name: 'YouTube TV'),
];

Widget _app() => const MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: SeerrStreamingRow(providers: _providers)),
);

Finder _inRow(Finder finder) =>
    find.descendant(of: find.byType(SeerrStreamingRow), matching: finder);

void main() {
  tearDown(() => PlatformDetection.setTvMode(false));

  testWidgets('names each service in a tooltip', (tester) async {
    await tester.pumpWidget(_app());

    expect(find.text('Streaming on'), findsOneWidget);
    expect(find.byTooltip('HBO Max'), findsOneWidget);
    expect(find.byTooltip('YouTube TV'), findsOneWidget);
    expect(_inRow(find.byType(InkWell)), findsNothing);
  });

  testWidgets('on TV it names each service under its logo instead', (
    tester,
  ) async {
    PlatformDetection.setTvMode(true);
    await tester.pumpWidget(_app());

    expect(find.byType(Tooltip), findsNothing);
    // Once in the fallback tile and once under it.
    expect(find.text('HBO Max'), findsNWidgets(2));
    expect(_inRow(find.byType(Focus)), findsNothing);
  });
}
