import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/native_controller_mapping_screen.dart';

void main() {
  const deviceA = NativeControllerDevice(id: 'a', name: 'Pad A');
  const deviceB = NativeControllerDevice(id: 'b', name: 'Pad B');
  const deviceC = NativeControllerDevice(id: 'c', name: 'Pad C');

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

  testWidgets(
    'rebuild with a shorter device list clamps selection instead of throwing',
    (tester) async {
      final key = GlobalKey<NativeControllerMappingScreenState>();
      await tester.pumpWidget(harness([deviceA, deviceB, deviceC], key));
      key.currentState!.handleButton(7, true); // -> b
      await tester.pump();
      key.currentState!.handleButton(7, true); // -> c
      await tester.pump();
      expect(find.text('Controller: ${deviceC.name}'), findsOneWidget);

      // deviceC (currently selected) is gone; list is now shorter than the
      // stored index. Must not throw RangeError.
      await tester.pumpWidget(harness([deviceA], key));
      await tester.pump();

      expect(find.text('Controller: ${deviceA.name}'), findsOneWidget);
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
      expect(find.text('Controller: ${deviceB.name}'), findsOneWidget);

      // Same device, new position in the list.
      await tester.pumpWidget(harness([deviceC, deviceA, deviceB], key));
      await tester.pump();

      expect(find.text('Controller: ${deviceB.name}'), findsOneWidget);
    },
  );
}
