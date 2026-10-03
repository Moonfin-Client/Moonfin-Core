import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/game/game_card_focus_frame.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  setUp(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  testWidgets('toggling focus keeps the card subtree mounted', (tester) async {
    final active = ValueNotifier<bool>(false);
    addTearDown(active.dispose);
    var mounts = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: ValueListenableBuilder<bool>(
            valueListenable: active,
            builder: (context, value, _) => GameCardFocusFrame(
              active: value,
              child: SizedBox(
                width: 100,
                height: 134,
                child: _MountCounter(onMount: () => mounts++),
              ),
            ),
          ),
        ),
      ),
    );
    expect(mounts, 1);

    // Artwork state (decoded images, in-flight loads) lives inside the child.
    // Remounting it on focus changes is what made artwork flash back to the
    // placeholder every time focus moved.
    for (final value in [true, false, true, false]) {
      active.value = value;
      await tester.pump();
    }
    expect(mounts, 1);
  });
}

class _MountCounter extends StatefulWidget {
  const _MountCounter({required this.onMount});

  final VoidCallback onMount;

  @override
  State<_MountCounter> createState() => _MountCounterState();
}

class _MountCounterState extends State<_MountCounter> {
  @override
  void initState() {
    super.initState();
    widget.onMount();
  }

  @override
  Widget build(BuildContext context) => const SizedBox.expand();
}
