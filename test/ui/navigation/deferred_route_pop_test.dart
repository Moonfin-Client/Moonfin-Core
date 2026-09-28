import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/ui/navigation/deferred_route_pop.dart';

void main() {
  for (final scenario in [
    'idle',
    'repeat',
    'new Search',
    'new Home',
    'disposed',
  ]) {
    testWidgets('Back completes safely: $scenario', (tester) async {
      final router = GoRouter(
        initialLocation: '/home',
        routes: [
          for (final path in ['/home', '/details', '/search'])
            GoRoute(
              path: path,
              builder: (_, _) => Scaffold(body: Text(path)),
            ),
        ],
      );
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      unawaited(router.push('/details'));
      await tester.pumpAndSettle();
      expect(tester.binding.hasScheduledFrame, isFalse);
      var mounted = true;
      scheduleRoutePop(router, isMounted: () => mounted);
      // Assert before pump supplies a frame that could hide the original bug.
      expect(tester.binding.hasScheduledFrame, isTrue);
      if (scenario == 'repeat') {
        scheduleRoutePop(router, isMounted: () => mounted);
      }
      if (scenario == 'new Search') unawaited(router.push('/search'));
      if (scenario == 'new Home') router.go('/home');
      if (scenario == 'disposed') mounted = false;
      await tester.pumpAndSettle();
      expect(
        router.state.uri.path,
        scenario == 'new Search'
            ? '/search'
            : scenario == 'disposed'
            ? '/details'
            : '/home',
      );
      await tester.pumpWidget(const SizedBox());
      router.dispose();
    });
  }
}
