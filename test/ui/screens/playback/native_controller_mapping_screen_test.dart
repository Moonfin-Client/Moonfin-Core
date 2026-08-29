import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/native_controller_mapping_screen.dart';
import 'package:moonfin/util/native_controller_mapping.dart';
import 'package:moonfin/util/native_controller_player_assignments.dart';
import 'package:moonfin/util/core_input_descriptors.dart';

void main() {
  const deviceA = NativeControllerDevice(id: 'a', name: 'Pad A');
  const deviceB = NativeControllerDevice(id: 'b', name: 'Pad B');
  const deviceC = NativeControllerDevice(id: 'c', name: 'Pad C');

  test('creates a native device from Android connection metadata', () {
    final device = NativeControllerDevice.fromMap({
      'id': 'profile-a',
      'connectionId': 'connection-a',
      'name': 'Pad A',
      'port': 1,
      'supported': true,
    });

    expect(device.id, 'profile-a');
    expect(device.connectionId, 'connection-a');
    expect(device.port, 1);
    expect(device.supported, isTrue);
  });

  test('reads the device class and assignment metadata', () {
    final remote = NativeControllerDevice.fromMap({
      'id': 'remote',
      'name': 'onn TV Remote',
      'deviceClass': 'remote',
      'assignable': false,
      'supported': false,
    });

    expect(remote.deviceClass, NativeControllerDeviceClass.remote);
    expect(remote.assignable, isFalse);
    expect(remote.playerLabel, 'Menu & navigation');
  });

  test('a native build without the new keys keeps the old behaviour', () {
    final device = NativeControllerDevice.fromMap({
      'id': 'a',
      'name': 'Pad A',
      'port': 0,
    });

    expect(device.deviceClass, NativeControllerDeviceClass.gamepad);
    expect(device.assignable, isTrue);
    expect(device.pinned, isFalse);
  });

  test('a borrowed player slot is not labelled as pinned', () {
    const borrowed = NativeControllerDevice(id: 'a', name: 'Pad A', port: 0);
    const pinned = NativeControllerDevice(
      id: 'b',
      name: 'Pad B',
      port: 1,
      pinned: true,
    );

    expect(borrowed.playerLabel, 'Player 1');
    expect(pinned.playerLabel, 'Player 2 · pinned');
  });

  Widget harness(
    List<NativeControllerDevice> devices,
    GlobalKey<NativeControllerMappingScreenState> key,
  ) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            NativeControllerMappingScreen(
              key: key,
              devices: devices,
              mappings: const {},
              onMappingChanged: (_, _) async {},
              onClose: () {},
            ),
          ],
        ),
      ),
    );
  }

  testWidgets('the reset row says whether the buttons are stock or changed', (
    tester,
  ) async {
    const gameId = 'hydro-thunder';
    Widget harnessFor(NativeControllerMapping mapping) => MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            NativeControllerMappingScreen(
              devices: const [deviceA],
              mappings: {deviceA.id: mapping},
              gameId: gameId,
              onMappingChanged: (_, _) async {},
              onClose: () {},
            ),
          ],
        ),
      ),
    );

    Future<void> show(NativeControllerMapping mapping) async {
      await tester.pumpWidget(harnessFor(mapping));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Reset this game to defaults'),
        200,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
    }

    // 'Default layout' is also every unbound BUTTON row's subtitle, so scope
    // the check to the reset row itself.
    Finder captionOf(String text) => find.descendant(
      of: find
          .ancestor(
            of: find.text('Reset this game to defaults'),
            matching: find.byType(GestureDetector),
          )
          .first,
      matching: find.text(text),
    );

    await show(NativeControllerMapping.empty);
    expect(captionOf('Default layout'), findsOneWidget);

    await show(
      NativeControllerMapping.empty.withBindingForGame(
        gameId,
        96,
        RetroPadButton.a,
      ),
    );
    expect(captionOf('Customised for this game'), findsOneWidget);

    // A reset stores an explicit empty table, which is still an entry. The row
    // must report the buttons the user can see, not that bookkeeping.
    await show(
      NativeControllerMapping.empty
          .withBindingForGame(gameId, 96, RetroPadButton.a)
          .withBindingsForGame(gameId, const {}),
    );
    expect(captionOf('Default layout'), findsOneWidget);
  });

  testWidgets('reset returns this game to defaults and nothing else', (
    tester,
  ) async {
    // The row says "this game", so it must not also throw away the pad's
    // controller type for every core, its snap for every game, or another
    // game's bindings -- which replacing the whole mapping with empty did.
    const gameId = 'hydro-thunder';
    final saved = NativeControllerMapping.empty
        .withBindingForGame(gameId, 96, RetroPadButton.a)
        .withBindingForGame('burgertime', 190, RetroPadButton.b)
        .withSnap('burgertime', StickSnapMode.fourWay)
        .withControllerType('fbneo', 5);
    NativeControllerMapping? persisted;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [deviceA],
                mappings: {deviceA.id: saved},
                gameId: gameId,
                onMappingChanged: (_, mapping) async => persisted = mapping,
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Reset this game to defaults'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset this game to defaults'));
    await tester.pumpAndSettle();

    // A reset cannot be undone, so it asks first and nothing has happened yet.
    expect(find.text('Reset buttons'), findsOneWidget);
    expect(persisted, isNull);

    await tester.tap(find.text('Reset buttons'));
    await tester.pumpAndSettle();

    expect(persisted, isNotNull);
    expect(persisted!.bindingsForGame(gameId), isEmpty);
    expect(persisted!.bindingsForGame('burgertime')[190], RetroPadButton.b);
    expect(persisted!.snapForGame('burgertime'), StickSnapMode.fourWay);
    expect(persisted!.controllerTypeForCore('fbneo'), 5);
  });

  testWidgets('cancelling the reset confirmation changes nothing', (
    tester,
  ) async {
    const gameId = 'hydro-thunder';
    final saved = NativeControllerMapping.empty.withBindingForGame(
      gameId,
      96,
      RetroPadButton.a,
    );
    var persistCalls = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [deviceA],
                mappings: {deviceA.id: saved},
                gameId: gameId,
                onMappingChanged: (_, _) async => persistCalls++,
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Reset this game to defaults'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset this game to defaults'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(persistCalls, 0);
    // Back on the button list, with the mapping untouched.
    expect(find.text('Reset this game to defaults'), findsOneWidget);
  });

  testWidgets('the reset confirmation is reachable with a controller', (
    tester,
  ) async {
    // A Material dialog would strand a gamepad user here: this panel is driven
    // by RetroPad indices, not focus traversal.
    const gameId = 'hydro-thunder';
    final key = GlobalKey<NativeControllerMappingScreenState>();
    NativeControllerMapping? persisted;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                key: key,
                devices: const [deviceA],
                mappings: {
                  deviceA.id: NativeControllerMapping.empty.withBindingForGame(
                    gameId,
                    96,
                    RetroPadButton.a,
                  ),
                },
                gameId: gameId,
                onMappingChanged: (_, mapping) async => persisted = mapping,
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Reset this game to defaults'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reset this game to defaults'));
    await tester.pumpAndSettle();
    expect(find.text('Reset buttons'), findsOneWidget);

    // Cancel is preselected, so moving once lands on Reset; 0 activates it.
    key.currentState!.handleButton(4, true);
    await tester.pump();
    key.currentState!.handleButton(0, true);
    await tester.pumpAndSettle();

    expect(persisted, isNotNull);
    expect(persisted!.bindingsForGame(gameId), isEmpty);
  });

  testWidgets(
    'rebuild with a shorter device list clamps selection instead of throwing',
    (tester) async {
      final key = GlobalKey<NativeControllerMappingScreenState>();
      await tester.pumpWidget(harness([deviceA, deviceB, deviceC], key));
      key.currentState!.handleButton(7, true); // -> b
      await tester.pump();
      key.currentState!.handleButton(7, true); // -> c
      await tester.pump();
      expect(find.text('${deviceC.name} - (Unassigned)'), findsOneWidget);

      // deviceC (currently selected) is gone; list is now shorter than the
      // stored index. Must not throw RangeError.
      await tester.pumpWidget(harness([deviceA], key));
      await tester.pump();

      expect(find.text('${deviceA.name} - (Unassigned)'), findsOneWidget);
    },
  );

  testWidgets(
    'rebuild with an empty device list renders the empty-state message',
    (tester) async {
      final key = GlobalKey<NativeControllerMappingScreenState>();
      await tester.pumpWidget(harness([deviceA, deviceB], key));
      await tester.pumpWidget(harness(const [], key));
      await tester.pump();

      expect(
        find.text('Connect a physical controller to change its mapping.'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'rebuild preserves the selected device when it moves to a different index',
    (tester) async {
      final key = GlobalKey<NativeControllerMappingScreenState>();
      await tester.pumpWidget(harness([deviceA, deviceB, deviceC], key));
      key.currentState!.handleButton(7, true); // -> b
      await tester.pump();
      expect(find.text('${deviceB.name} - (Unassigned)'), findsOneWidget);

      // Same device, new position in the list.
      await tester.pumpWidget(harness([deviceC, deviceA, deviceB], key));
      await tester.pump();

      expect(find.text('${deviceB.name} - (Unassigned)'), findsOneWidget);
    },
  );

  testWidgets('copy asks for confirmation and invokes the source callback', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    String? copied;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                key: key,
                devices: const [
                  NativeControllerDevice(
                    id: 'a',
                    connectionId: 'a-connection',
                    name: 'Pad A',
                    port: 0,
                  ),
                  NativeControllerDevice(
                    id: 'b',
                    connectionId: 'b-connection',
                    name: 'Pad B',
                    port: 1,
                  ),
                ],
                mappings: const {
                  'a': NativeControllerMapping({96: RetroPadButton.a}),
                },
                onMappingChanged: (_, _) async {},
                onCopyMapping: (id) async => copied = id,
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    // Rows: stick snap, 16 buttons, then copy.
    for (var i = 0; i < 18; i++) {
      key.currentState!.handleButton(5, true);
    }
    key.currentState!.handleButton(0, true);
    await tester.pump();
    expect(
      find.textContaining('copies Android button keycodes'),
      findsOneWidget,
    );
    expect(copied, isNull);

    key.currentState!.handleButton(0, true);
    await tester.pump();
    expect(copied, 'a');
  });

  testWidgets(
    'cancelling the copy confirmation restores the copy row cursor, not the '
    'device row',
    (tester) async {
      final key = GlobalKey<NativeControllerMappingScreenState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NativeControllerMappingScreen(
                  key: key,
                  devices: const [
                    NativeControllerDevice(
                      id: 'a',
                      connectionId: 'a-connection',
                      name: 'Pad A',
                      port: 0,
                    ),
                    NativeControllerDevice(
                      id: 'b',
                      connectionId: 'b-connection',
                      name: 'Pad B',
                      port: 1,
                    ),
                  ],
                  mappings: const {
                    'a': NativeControllerMapping({96: RetroPadButton.a}),
                  },
                  onMappingChanged: (_, _) async {},
                  onCopyMapping: (id) async {},
                  onClose: () {},
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      // Navigate down to the copy row (stick snap, 16 buttons, then copy).
      for (var i = 0; i < 18; i++) {
        key.currentState!.handleButton(5, true);
      }
      key.currentState!.handleButton(0, true); // open copy confirmation
      await tester.pump();
      expect(
        find.textContaining('copies Android button keycodes'),
        findsOneWidget,
      );

      key.currentState!.handleButton(8, true); // back out of confirmation
      await tester.pump();
      // Still on Pad A -- if the cursor had fallen back to the device row (as
      // it did before the fix), the next assertion below would find Pad B.
      expect(find.textContaining('Pad A'), findsOneWidget);

      key.currentState!.handleButton(0, true);
      await tester.pump();
      // The cursor must still be on the copy row, so pressing A reopens the
      // confirmation rather than cycling to the next device.
      expect(
        find.textContaining('copies Android button keycodes'),
        findsOneWidget,
      );
      expect(find.textContaining('Pad B'), findsNothing);
    },
  );

  testWidgets('shows and applies the supported core controller type selector', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    int? selectedType;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                key: key,
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {
                  'a': NativeControllerMapping(
                    {},
                    controllerTypesByCore: {'fbneo': 517},
                  ),
                },
                coreId: 'fbneo',
                controllerTypesByPort: const {
                  0: [
                    CoreControllerType(port: 0, id: 5, label: 'Classic'),
                    CoreControllerType(port: 0, id: 517, label: 'Modern'),
                    CoreControllerType(
                      port: 0,
                      id: 261,
                      label: '6-Button Panel',
                    ),
                  ],
                },
                onMappingChanged: (_, _) async {},
                onControllerTypeChanged: (_, type) async => selectedType = type,
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Core controller type'), findsOneWidget);
    expect(find.text('Modern'), findsOneWidget);

    key.currentState!.handleButton(5, true);
    key.currentState!.handleButton(0, true);
    await tester.pump();
    expect(find.text('Auto (Core default)'), findsOneWidget);

    key.currentState!.handleButton(4, true);
    key.currentState!.handleButton(0, true);
    await tester.pump();
    expect(selectedType, 5);
  });

  testWidgets('shows Auto when one alternate layout is supported', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                key: key,
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {},
                coreId: 'fbneo',
                controllerTypesByPort: const {
                  0: [CoreControllerType(port: 0, id: 5, label: 'Classic')],
                },
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Core controller type'), findsOneWidget);
  });

  testWidgets('Back steps out of an armed capture instead of leaving', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(harness([deviceA], key));

    // Row 1 is stick snap, row 2 the first button; activating it arms capture.
    key.currentState!.handleButton(5, true);
    key.currentState!.handleButton(5, true);
    key.currentState!.handleButton(0, true);
    await tester.pump();
    expect(find.textContaining('Press the physical button'), findsOneWidget);

    expect(key.currentState!.handleBack(), isTrue);
    await tester.pump();

    // Back to the button list, and the host is told not to close the screen.
    expect(find.textContaining('Press the physical button'), findsNothing);
    expect(find.text('${deviceA.name} - (Unassigned)'), findsOneWidget);
  });

  testWidgets('Back at the top level defers to the host overlay', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(harness([deviceA], key));
    await tester.pump();

    expect(key.currentState!.handleBack(), isFalse);
  });

  Widget assignmentHarness({
    required List<NativeControllerDevice> devices,
    required NativeControllerPlayerAssignments assignments,
    required Future<void> Function(NativeControllerPlayerAssignments) onChanged,
  }) => MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          NativeControllerMappingScreen(
            devices: devices,
            mappings: const {},
            assignments: assignments,
            onAssignmentChanged: onChanged,
            onMappingChanged: (_, _) async {},
            onClose: () {},
          ),
        ],
      ),
    ),
  );

  testWidgets('assigning a player swaps with the device already holding it', (
    tester,
  ) async {
    NativeControllerPlayerAssignments? applied;
    await tester.pumpWidget(
      assignmentHarness(
        devices: const [
          NativeControllerDevice(id: 'a', name: 'Pad A', port: 0, pinned: true),
          NativeControllerDevice(id: 'b', name: 'Pad B', port: 1, pinned: true),
        ],
        assignments: const NativeControllerPlayerAssignments({1: 'a', 2: 'b'}),
        onChanged: (next) async => applied = next,
      ),
    );
    await tester.pump();

    final deviceHeading = find.text('Pad A - (Player 1, pinned)');
    expect(deviceHeading, findsOneWidget);
    final headingSpan =
        tester.widget<Text>(deviceHeading).textSpan! as TextSpan;
    final headingSpans = headingSpan.children!;
    expect(headingSpans.first.style?.fontStyle, isNot(FontStyle.italic));
    expect(headingSpans.last.style?.fontStyle, FontStyle.italic);
    expect(find.text('Player assignment'), findsOneWidget);
    expect(find.text('Player 1 · pinned'), findsOneWidget);

    await tester.tap(find.text('Player assignment'));
    await tester.pump();
    // Pad A is selected; taking Player 2 must hand Player 1 to Pad B rather
    // than leaving it unassigned.
    expect(find.textContaining('Currently Pad B'), findsOneWidget);
    await tester.tap(find.text('Player 2'));
    await tester.pump();

    expect(applied?.profileIdByPlayer, {2: 'a', 1: 'b'});
  });

  testWidgets('core input descriptors annotate the button rows', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {},
                inputDescriptors: CoreInputDescriptors.fromChannelPayload(
                  const [
                    // libretro calls id 0 "B" and id 1 "Y"; this screen shows
                    // them as "A" and "X". The ids are what match.
                    {
                      'port': 0,
                      'device': 1,
                      'index': 0,
                      'id': 0,
                      'description': 'Fire',
                    },
                    {
                      'port': 0,
                      'device': 1,
                      'index': 0,
                      'id': 1,
                      'description': 'Insert Coin',
                    },
                    // A core that just restates the button name adds nothing.
                    {
                      'port': 0,
                      'device': 1,
                      'index': 0,
                      'id': 3,
                      'description': 'Start',
                    },
                  ],
                ),
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    // The core's word is the primary text and the subtitle answers only "what
    // do I press" -- naming the RetroPad button there read as a contradiction
    // ("A - Button B") and traded one piece of jargon for another.
    expect(find.text('Fire'), findsOneWidget);
    expect(find.text('Insert Coin'), findsOneWidget);
    // Both rows are unbound, so both subtitles are the same bare binding.
    expect(find.text('Default layout'), findsWidgets);
    expect(find.text('A · Default layout'), findsNothing);
    expect(find.text('X · Default layout'), findsNothing);

    // A description is core-supplied text, so it is italicised.
    final fire = tester.widget<Text>(find.text('Fire'));
    expect(fire.style?.fontStyle, FontStyle.italic);

    // A button the core said nothing about keeps its bare name, upright, with
    // the binding alone beneath it.
    expect(find.text('Select'), findsOneWidget);
    final select = tester.widget<Text>(find.text('Select'));
    expect(select.style?.fontStyle, FontStyle.normal);

    // A core that only restates the button name is treated as saying nothing.
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Start · Default layout'), findsNothing);
  });

  testWidgets('a remote gets no player selector', (tester) async {
    await tester.pumpWidget(
      assignmentHarness(
        devices: const [
          NativeControllerDevice(
            id: 'remote',
            name: 'onn TV Remote',
            deviceClass: NativeControllerDeviceClass.remote,
            assignable: false,
            supported: false,
          ),
        ],
        assignments: const NativeControllerPlayerAssignments({}),
        onChanged: (_) async {},
      ),
    );
    await tester.pump();

    expect(find.text('onn TV Remote - (Menu & navigation)'), findsOneWidget);
    expect(find.text('Player assignment'), findsNothing);
  });

  testWidgets('a media keycode binding renders its name', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {
                  'a': NativeControllerMapping({85: RetroPadButton.a}),
                },
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Play/Pause'), findsOneWidget);
  });

  testWidgets('an unlisted keycode still renders "Key code N"', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {
                  'a': NativeControllerMapping({9999: RetroPadButton.a}),
                },
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Key code 9999'), findsOneWidget);
  });

  testWidgets('the synthetic trigger codes still render their labels', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                devices: const [
                  NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                ],
                mappings: const {
                  'a': NativeControllerMapping({
                    0x10012: RetroPadButton.a,
                    0x10013: RetroPadButton.b,
                  }),
                },
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Left trigger (L2)'), findsOneWidget);
    expect(find.text('Right trigger (R2)'), findsOneWidget);
  });

  testWidgets('an unpinned keyboard can be given a player slot', (
    tester,
  ) async {
    NativeControllerPlayerAssignments? applied;
    await tester.pumpWidget(
      assignmentHarness(
        devices: const [
          NativeControllerDevice(
            id: 'kbd',
            name: 'USB Keyboard',
            deviceClass: NativeControllerDeviceClass.keyboard,
            supported: false,
          ),
        ],
        assignments: const NativeControllerPlayerAssignments({}),
        onChanged: (next) async => applied = next,
      ),
    );
    await tester.pump();

    expect(find.text('USB Keyboard - (Menu & navigation)'), findsOneWidget);
    await tester.tap(find.text('Player assignment'));
    await tester.pump();
    await tester.tap(find.text('Player 2'));
    await tester.pump();

    expect(applied?.profileIdByPlayer, {2: 'kbd'});
  });

  // Regression test: the d-pad must move the highlight inside the player
  // assignment list. _row() highlighted on the main list's cursor, so entering
  // this sub-list left the highlight frozen on whatever main row index matched
  // -- 'Player assignment' is row 1, so 'Player 1' stayed lit no matter which
  // choice the cursor was actually on.
  String? highlightedRowLabel(WidgetTester tester) {
    for (final element in find.byType(Container).evaluate()) {
      final container = element.widget as Container;
      final decoration = container.decoration;
      if (decoration is BoxDecoration &&
          decoration.color == const Color(0x333F8CFF)) {
        final text =
            find
                    .descendant(
                      of: find.byWidget(container),
                      matching: find.byType(Text),
                    )
                    .evaluate()
                    .first
                    .widget
                as Text;
        return text.data;
      }
    }
    return null;
  }

  testWidgets('the d-pad moves the highlight through the player choices', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              NativeControllerMappingScreen(
                key: key,
                devices: const [
                  NativeControllerDevice(
                    id: 'a',
                    name: 'Pad A',
                    port: 0,
                    pinned: true,
                  ),
                ],
                mappings: const {},
                assignments: const NativeControllerPlayerAssignments({1: 'a'}),
                onAssignmentChanged: (_) async {},
                onMappingChanged: (_, _) async {},
                onClose: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('Player assignment'));
    await tester.pump();
    expect(find.text('Player 2'), findsOneWidget);
    expect(highlightedRowLabel(tester), 'Player 1');

    key.currentState!.handleButton(5, true); // d-pad down
    await tester.pump();
    expect(highlightedRowLabel(tester), 'Player 2');

    key.currentState!.handleButton(5, true); // d-pad down
    await tester.pump();
    expect(highlightedRowLabel(tester), 'Player 3');

    key.currentState!.handleButton(4, true); // d-pad up
    await tester.pump();
    expect(highlightedRowLabel(tester), 'Player 2');
  });

  testWidgets('entering and leaving player assignment reveals its cursor', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 120,
            child: Column(
              children: [
                NativeControllerMappingScreen(
                  key: key,
                  devices: const [
                    NativeControllerDevice(
                      id: 'a',
                      name: 'Pad A',
                      port: 0,
                      pinned: true,
                    ),
                  ],
                  mappings: const {},
                  assignments: const NativeControllerPlayerAssignments({
                    4: 'a',
                  }),
                  onAssignmentChanged: (_) async {},
                  onMappingChanged: (_, _) async {},
                  onClose: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    ScrollPosition position() =>
        tester.state<ScrollableState>(find.byType(Scrollable).last).position;
    expect(position().pixels, 0);

    // Player assignment is row 1. Player 4 is the current choice, which is
    // row 4 in its sub-list and initially outside this constrained viewport.
    key.currentState!.handleButton(5, true);
    key.currentState!.handleButton(0, true);
    await tester.pumpAndSettle();

    expect(position().pixels, greaterThan(0));

    expect(key.currentState!.handleBack(), isTrue);
    await tester.pumpAndSettle();
    expect(position().pixels, lessThanOrEqualTo(58));
  });

  testWidgets('controller type selection reveals its cursor after list swaps', (
    tester,
  ) async {
    final key = GlobalKey<NativeControllerMappingScreenState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 120,
            child: Column(
              children: [
                NativeControllerMappingScreen(
                  key: key,
                  devices: const [
                    NativeControllerDevice(id: 'a', name: 'Pad A', port: 0),
                  ],
                  mappings: const {
                    'a': NativeControllerMapping(
                      {},
                      controllerTypesByCore: {'fbneo': 261},
                    ),
                  },
                  coreId: 'fbneo',
                  controllerTypesByPort: const {
                    0: [
                      CoreControllerType(port: 0, id: 5, label: 'Classic'),
                      CoreControllerType(port: 0, id: 517, label: 'Modern'),
                      CoreControllerType(
                        port: 0,
                        id: 261,
                        label: '6-Button Panel',
                      ),
                    ],
                  },
                  onControllerTypeChanged: (_, _) async {},
                  onMappingChanged: (_, _) async {},
                  onClose: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    ScrollPosition position() =>
        tester.state<ScrollableState>(find.byType(Scrollable).last).position;
    expect(position().pixels, 0);

    key.currentState!.handleButton(5, true); // Core controller type, row 1.
    key.currentState!.handleButton(0, true);
    await tester.pumpAndSettle();

    expect(position().pixels, greaterThan(58));

    expect(key.currentState!.handleBack(), isTrue);
    await tester.pumpAndSettle();
    expect(position().pixels, lessThanOrEqualTo(58));
  });
}
