import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/can_claim_initial_focus.dart';

void main() {
  testWidgets('a screen in front may claim focus', (tester) async {
    late bool claimable;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            claimable = canClaimInitialFocus(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(claimable, isTrue);
  });

  testWidgets('a screen under a modal may not', (tester) async {
    // The case this exists for: a panel is open over the screen, the screen
    // rebuilds underneath it, and its fresh content asks for focus.
    final claims = <bool>[];
    late BuildContext homeContext;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            homeContext = context;
            claims.add(canClaimInitialFocus(context));
            return ElevatedButton(
              onPressed: () => setState(() {}),
              child: const Text('rebuild'),
            );
          },
        ),
      ),
    );
    expect(claims.last, isTrue);

    unawaited(
      showGeneralDialog<void>(
        context: homeContext,
        pageBuilder: (_, _, _) => const SizedBox.shrink(),
      ),
    );
    await tester.pumpAndSettle();

    // Force the covered screen to rebuild, the way a preference write does.
    (homeContext as Element).markNeedsBuild();
    await tester.pump();

    expect(claims.last, isFalse);
  });

  testWidgets('a context with no route counts as claimable', (tester) async {
    // A widget pumped on its own keeps the behaviour it had.
    late bool claimable;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            claimable = canClaimInitialFocus(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(claimable, isTrue);
  });
}
