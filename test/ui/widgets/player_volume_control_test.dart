import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/player_volume_control.dart';

Future<void> _pump(
  WidgetTester tester, {
  required double volume,
  double max = 1,
  ValueChanged<double>? onChanged,
  VoidCallback? onToggleMute,
}) {
  return tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: PlayerVolumeControl(
          volume: volume,
          max: max,
          onChanged: onChanged ?? (_) {},
          onToggleMute: onToggleMute ?? () {},
        ),
      ),
    ),
  );
}

void main() {
  test('the icon follows the level', () {
    expect(volumeIconFor(0), Icons.volume_off_rounded);
    expect(volumeIconFor(0.2), Icons.volume_down_rounded);
    expect(volumeIconFor(0.8), Icons.volume_up_rounded);
  });

  testWidgets('dragging the slider reports the new level', (tester) async {
    double? reported;
    await _pump(tester, volume: 0.5, onChanged: (v) => reported = v);

    await tester.tapAt(
      tester.getTopLeft(find.byType(Slider)) + const Offset(4, 12),
    );
    expect(reported, isNotNull);
    expect(reported, lessThan(0.5));
  });

  testWidgets('the button asks the owner to mute', (tester) async {
    var toggles = 0;
    await _pump(tester, volume: 0.7, onToggleMute: () => toggles++);

    await tester.tap(find.byType(IconButton));
    expect(toggles, 1);
  });

  testWidgets('a level above one is clamped rather than throwing', (
    tester,
  ) async {
    await _pump(tester, volume: 1.4);

    expect(tester.widget<Slider>(find.byType(Slider)).value, 1.0);
  });

  testWidgets('a player that amplifies lets the slider reach past full', (
    tester,
  ) async {
    double? reported;
    await _pump(tester, volume: 1.4, max: 1.5, onChanged: (v) => reported = v);
    expect(tester.widget<Slider>(find.byType(Slider)).value, 1.4);

    await tester.tapAt(
      tester.getTopRight(find.byType(Slider)) + const Offset(-4, 12),
    );
    expect(reported, greaterThan(1.4));
  });
}
