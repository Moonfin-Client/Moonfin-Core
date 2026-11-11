// The screens under a TV player stay mounted, and an Image on one of them only
// pauses, so its decoded picture stays on the GPU for the whole video. Under
// the player the artwork has to leave the tree, and come back when it pops.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/widgets/image_source.dart';
import 'package:moonfin/util/platform_detection.dart';

Widget _art(String label) => ArtworkBound(
  width: 120,
  height: 80,
  builder: (context, decodeWidth, decodeHeight) => Text(label),
);

final _android = TargetPlatformVariant.only(TargetPlatform.android);

Future<NavigatorState> _home(WidgetTester tester) async {
  final navigator = GlobalKey<NavigatorState>();
  await tester.pumpWidget(
    MaterialApp(
      navigatorKey: navigator,
      navigatorObservers: [PlayerRouteObserver.instance],
      home: Scaffold(body: _art('home art')),
    ),
  );
  return navigator.currentState!;
}

Future<void> _openPlayer(WidgetTester tester, NavigatorState navigator) async {
  navigator.push(
    MaterialPageRoute<void>(
      settings: const RouteSettings(name: Destinations.videoPlayer),
      builder: (_) => Scaffold(body: _art('player art')),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() => PlatformDetection.setTvMode(false));

  testWidgets('drops the artwork under a TV player until it pops', (tester) async {
    PlatformDetection.setTvMode(true);
    final navigator = await _home(tester);

    await _openPlayer(tester, navigator);
    expect(find.text('home art', skipOffstage: false), findsNothing);
    expect(find.text('player art'), findsOneWidget);

    navigator.pop();
    await tester.pumpAndSettle();
    expect(find.text('home art'), findsOneWidget);
    expect(PlayerRouteObserver.instance.isPlayerActive.value, isFalse);
  }, variant: _android);

  testWidgets('keeps the artwork of a screen opened over the player', (tester) async {
    PlatformDetection.setTvMode(true);
    final navigator = await _home(tester);
    await _openPlayer(tester, navigator);

    showDialog<void>(
      context: navigator.context,
      builder: (_) => Dialog(child: _art('dialog art')),
    );
    await tester.pumpAndSettle();
    expect(find.text('dialog art'), findsOneWidget);
    expect(find.text('player art'), findsOneWidget);
    expect(find.text('home art', skipOffstage: false), findsNothing);

    navigator.pop();
    navigator.pop();
    await tester.pumpAndSettle();
    expect(find.text('home art'), findsOneWidget);
  }, variant: _android);

  testWidgets('keeps the artwork under a page that is not a player', (tester) async {
    PlatformDetection.setTvMode(true);
    final navigator = await _home(tester);

    navigator.push(
      MaterialPageRoute<void>(
        settings: const RouteSettings(name: '/item/1'),
        builder: (_) => const Scaffold(body: Text('details')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('home art', skipOffstage: false), findsOneWidget);

    navigator.pop();
    await tester.pumpAndSettle();
  }, variant: _android);

  testWidgets('leaves the artwork alone off TV', (tester) async {
    final navigator = await _home(tester);
    await _openPlayer(tester, navigator);
    expect(find.text('home art', skipOffstage: false), findsOneWidget);

    navigator.pop();
    await tester.pumpAndSettle();
  }, variant: _android);
}
