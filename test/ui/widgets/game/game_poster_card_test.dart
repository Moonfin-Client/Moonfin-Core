import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/widgets/game/game_poster_card.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('focus and hover callbacks follow actual interaction', (
    tester,
  ) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var focused = 0;
    var focusLost = 0;
    var hoverStarted = 0;
    var hoverEnded = 0;

    await tester.pumpWidget(
      _TestApp(
        child: GamePosterCard(
          imageUrl: null,
          title: 'River Raid',
          fileName: 'River Raid (USA).a26',
          seed: 'river-raid',
          width: 110,
          focusNode: focusNode,
          onFocus: () => focused++,
          onFocusLost: () => focusLost++,
          onHoverStart: () => hoverStarted++,
          onHoverEnd: () => hoverEnded++,
          onTap: () {},
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    expect(focused, 1);

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(tester.getCenter(find.byType(GamePosterCard)));
    await tester.pump();
    expect(hoverStarted, 1);

    // Leaving with keyboard focus retained must not clear the active item.
    await mouse.moveTo(const Offset(1000, 1000));
    await tester.pump();
    expect(hoverEnded, 0);

    focusNode.unfocus();
    await tester.pump();
    expect(focusLost, 1);
  });

  testWidgets('large text can use the card intrinsic caption height', (
    tester,
  ) async {
    await tester.pumpWidget(
      _TestApp(
        textScaler: const TextScaler.linear(3),
        child: GamePosterCard(
          imageUrl: null,
          title: 'A deliberately long two-line game title',
          fileName: 'long-title.rom',
          seed: 'long-title',
          width: 110,
          onTap: () {},
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(
      find.text('A deliberately long two-line game title'),
      findsOneWidget,
    );
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child, this.textScaler = TextScaler.noScaling});

  final Widget child;
  final TextScaler textScaler;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: MediaQuery(
        data: MediaQueryData(textScaler: textScaler),
        child: Scaffold(body: Center(child: child)),
      ),
    );
  }
}
