import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/ui/navigation/deep_link_navigator.dart';

void main() {
  GoRouter buildRouter() => GoRouter(
    initialLocation: '/search',
    routes: [
      for (final path in ['/home', '/search', '/item/1'])
        GoRoute(
          path: path,
          builder: (_, _) => Scaffold(body: Text(path)),
        ),
      GoRoute(
        path: '/live-tv',
        builder: (_, _) => const Scaffold(body: Text('/live-tv')),
        routes: [
          GoRoute(
            path: 'guide',
            builder: (_, _) => const Scaffold(body: Text('/live-tv/guide')),
          ),
        ],
      ),
    ],
  );

  testWidgets('a Live TV link opens over Home', (tester) async {
    final router = buildRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    unawaited(openLinkedRoute(router, '/live-tv/guide'));
    await tester.pumpAndSettle();
    expect(find.text('/live-tv/guide'), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
    expect(find.text('/home'), findsOneWidget);
    expect(router.canPop(), isFalse);
  });

  testWidgets('other links replace the stack', (tester) async {
    final router = buildRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    unawaited(openLinkedRoute(router, '/item/1'));
    await tester.pumpAndSettle();
    expect(find.text('/item/1'), findsOneWidget);
    expect(router.canPop(), isFalse);
  });
}
