import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/playback/subtitle_cues.dart';
import 'package:moonfin/ui/widgets/playback/subtitle_delay_panel.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  testWidgets('the lines slide past the playhead as the delay changes', (tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    final state = PlayerState()..setPosition(const Duration(seconds: 1));
    final delays = <double>[];
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SizedBox(
            width: 640,
            child: SubtitleDelayPanel(
              initialDelay: 0,
              label: 'Subtitle delay',
              onDelayChanged: delays.add,
              formatDelay: (s) => '$s',
              state: state,
              cues: SynchronousFuture(const [
                SubtitleCue(0.5, 2, 'First line'),
                SubtitleCue(3, 4, 'Second line'),
              ]),
            ),
          ),
        ),
      ),
    );

    expect(find.text('First line'), findsOneWidget);
    expect(find.text('Second line'), findsOneWidget);
    expect(find.text('0:05'), findsOneWidget);
    final before = tester.getTopLeft(find.text('Second line')).dx;

    await tester.tap(find.byTooltip(l10n.delayPlusMs(100)));
    await tester.pump();
    expect(delays, [0.1]);
    expect(tester.getTopLeft(find.text('Second line')).dx, greaterThan(before));
  });
}
