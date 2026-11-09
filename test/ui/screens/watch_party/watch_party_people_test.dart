import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/watch_party/silo_watch_party_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_silo/server_silo.dart';

class _NoPlayback extends Fake implements PlaybackManager {}

SiloRoom _room(List<String> guests) => SiloRoom.fromJson({
  'room_id': 'r1',
  'phase': 'lobby',
  'self_role': 'host',
  'members': [
    {'profile_id': 'm-maya', 'display_name': 'Maya', 'is_host': true,
        'is_self': true, 'connected': true},
    for (final name in guests)
      {'profile_id': 'm-$name', 'display_name': name, 'connected': true},
  ],
});

void main() {
  setUp(() {
    PlatformDetection.setTvMode(true);
    GetIt.instance.registerSingleton<SiloWatchPartyManager>(
      SiloWatchPartyManager(_NoPlayback()),
    );
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester, SiloRoom room) => tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Shortcuts(
          shortcuts: const {
            SingleActivator(LogicalKeyboardKey.arrowDown): NextFocusIntent(),
          },
          child: WatchPartyPeople(room: room),
        ),
      ),
    ),
  );

  testWidgets('after Remove on TV, focus waits on the list, not on the next '
      "member's Remove", (tester) async {
    await pump(tester, _room(['Sam', 'Jordan']));
    final remove = find.byTooltip('Remove');
    expect(remove, findsNWidgets(2));

    await tester.tap(remove.first);
    // The room comes back without Sam.
    await pump(tester, _room(['Jordan']));
    await tester.pump();
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'watch_party_people',
    );

    // Down goes on to a control again.
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    final focused = FocusManager.instance.primaryFocus;
    expect(focused?.debugLabel, isNot('watch_party_people'));
    expect(focused?.context, isNotNull);
  });
}
