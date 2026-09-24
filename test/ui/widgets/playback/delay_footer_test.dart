import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/playback/delay_footer.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  String formatDelay(double seconds) {
    if (seconds == 0) return 'None';
    return '${seconds >= 0 ? '+' : ''}${(seconds * 1000).round()} ms';
  }

  Future<List<double>> pumpFooter(
    WidgetTester tester, {
    double initialDelay = 0.0,
  }) async {
    final changes = <double>[];
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: DelayFooter(
            initialDelay: initialDelay,
            label: l10n.subtitleDelay,
            minDelay: -5.0,
            maxDelay: 5.0,
            onDelayChanged: changes.add,
            formatDelay: formatDelay,
          ),
        ),
      ),
    );
    await tester.pump();
    return changes;
  }

  testWidgets('starts from the initial delay', (tester) async {
    await pumpFooter(tester, initialDelay: 0.3);
    expect(find.text('+300 ms'), findsOneWidget);
  });

  testWidgets('the buttons step the delay', (tester) async {
    final changes = await pumpFooter(tester);

    await tester.tap(find.byTooltip(l10n.delayPlusMs(100)));
    await tester.pump();
    expect(find.text('+100 ms'), findsOneWidget);

    await tester.tap(find.byTooltip(l10n.delayMinusMs(100)));
    await tester.pump();
    await tester.tap(find.byTooltip(l10n.delayMinusMs(100)));
    await tester.pump();
    expect(find.text('-100 ms'), findsOneWidget);
    expect(changes, [0.1, 0.0, -0.1]);
  });

  testWidgets('reset clears the delay', (tester) async {
    final changes = await pumpFooter(tester, initialDelay: -0.5);
    await tester.tap(find.text(l10n.reset));
    await tester.pump();
    expect(find.text('None'), findsOneWidget);
    expect(changes, [0.0]);
  });
}
