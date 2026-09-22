import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/playback/delay_footer.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The footer shows the correction the player applied on its own beside the
/// delay the user set, and only the user's value moves with the buttons.
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
    double autoOffset = 0.0,
    Stream<double>? autoOffsetStream,
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
            autoOffset: autoOffset,
            autoOffsetStream: autoOffsetStream,
            onDelayChanged: changes.add,
            formatDelay: formatDelay,
          ),
        ),
      ),
    );
    await tester.pump();
    return changes;
  }

  testWidgets('no auto line when there is no correction', (tester) async {
    await pumpFooter(tester);
    expect(find.text('None'), findsOneWidget);
    expect(find.textContaining('Auto'), findsNothing);
  });

  testWidgets('a correction shows as its own read only line', (tester) async {
    await pumpFooter(tester, initialDelay: 0.3, autoOffset: 2.0);
    expect(find.text('+300 ms'), findsOneWidget);
    expect(find.text(l10n.subtitleDelayAuto('+2000 ms')), findsOneWidget);
  });

  testWidgets('the line follows the stream and goes away at zero', (
    tester,
  ) async {
    final controller = StreamController<double>.broadcast();
    addTearDown(controller.close);
    await pumpFooter(tester, autoOffsetStream: controller.stream);
    expect(find.textContaining('Auto'), findsNothing);

    controller.add(1.5);
    await tester.pump();
    await tester.pump();
    expect(find.text(l10n.subtitleDelayAuto('+1500 ms')), findsOneWidget);

    controller.add(0.0);
    await tester.pump();
    await tester.pump();
    expect(find.textContaining('Auto'), findsNothing);
  });

  testWidgets('the buttons step the user value and leave the correction', (
    tester,
  ) async {
    final changes = await pumpFooter(tester, autoOffset: 2.0);

    await tester.tap(find.byTooltip(l10n.delayPlusMs(100)));
    await tester.pump();
    expect(find.text('+100 ms'), findsOneWidget);

    await tester.tap(find.byTooltip(l10n.delayMinusMs(100)));
    await tester.pump();
    await tester.tap(find.byTooltip(l10n.delayMinusMs(100)));
    await tester.pump();
    expect(find.text('-100 ms'), findsOneWidget);
    expect(changes, [0.1, 0.0, -0.1]);
    expect(find.text(l10n.subtitleDelayAuto('+2000 ms')), findsOneWidget);
  });

  testWidgets('reset clears the user value only', (tester) async {
    final changes = await pumpFooter(
      tester,
      initialDelay: -0.5,
      autoOffset: 2.0,
    );
    await tester.tap(find.text(l10n.reset));
    await tester.pump();
    expect(find.text('None'), findsOneWidget);
    expect(changes, [0.0]);
    expect(find.text(l10n.subtitleDelayAuto('+2000 ms')), findsOneWidget);
  });
}
