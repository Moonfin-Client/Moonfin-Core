import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/profile_carousel.dart';

const _entries = [
  ProfileEntry(id: 'a1', name: 'Alex'),
  ProfileEntry(id: 'j2', name: 'Jordan', badge: ProfileBadge.pin),
  ProfileEntry(id: 's3', name: 'Sam'),
  ProfileEntry(id: 'k4', name: 'Kids'),
];

class _Harness extends StatefulWidget {
  const _Harness({required this.activated, this.width = 800});

  final List<int> activated;
  final double width;

  @override
  State<_Harness> createState() => _HarnessState();
}

class _HarnessState extends State<_Harness> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: widget.width,
            child: ProfileCarousel(
              entries: _entries,
              selected: selected,
              autofocus: true,
              onSelected: (index) => setState(() => selected = index),
              onActivate: widget.activated.add,
            ),
          ),
        ),
      ),
    );
  }
}

int _selectedOf(WidgetTester tester) =>
    tester.state<_HarnessState>(find.byType(_Harness)).selected;

void main() {
  test('initials colors are stable per user id, matching Smart-TV', () {
    // 'abc' sums to 294, 294 % 6 = 0.
    expect(profileInitialsColor('abc'), const Color(0xFF2B6CB0));
    // 'ab' sums to 195, 195 % 6 = 3.
    expect(profileInitialsColor('ab'), const Color(0xFF6B46C1));
    expect(profileInitialsColor(''), const Color(0xFF2B6CB0));
  });

  testWidgets('arrows move the selection and stop at the ends', (tester) async {
    final activated = <int>[];
    await tester.pumpWidget(_Harness(activated: activated));
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(_selectedOf(tester), 0);

    for (var i = 0; i < 5; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
    }
    expect(_selectedOf(tester), 3);
    expect(find.text('Kids'), findsWidgets);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(_selectedOf(tester), 2);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect(activated, [2]);
  });

  testWidgets('a click on a neighbor selects it, on the middle activates', (
    tester,
  ) async {
    final activated = <int>[];
    await tester.pumpWidget(_Harness(activated: activated));
    await tester.pumpAndSettle();

    // Jordan sits one step right of the middle.
    final center = tester.getCenter(find.byType(ProfileCarousel));
    final heroCenterY = tester.getCenter(find.text('A')).dy;
    await tester.tapAt(
      Offset(center.dx + ProfileCarousel.nearOffset, heroCenterY),
    );
    await tester.pumpAndSettle();
    expect(_selectedOf(tester), 1);
    expect(activated, isEmpty);

    await tester.tapAt(Offset(center.dx, heroCenterY));
    await tester.pumpAndSettle();
    expect(activated, [1]);

    // A swipe left moves on one, a swipe right comes back.
    await tester.flingFrom(
      Offset(center.dx, heroCenterY),
      const Offset(-300, 0),
      1000,
    );
    await tester.pumpAndSettle();
    expect(_selectedOf(tester), 2);
    await tester.flingFrom(
      Offset(center.dx, heroCenterY),
      const Offset(300, 0),
      1000,
    );
    await tester.pumpAndSettle();
    expect(_selectedOf(tester), 1);
    expect(activated, [1]);
  });

  testWidgets('the outer neighbors only show when they fit', (tester) async {
    Finder avatarOf(String initial) => find.ancestor(
      of: find.text(initial),
      matching: find.byType(AnimatedOpacity),
    );
    double opacityOf(String initial) =>
        tester.widget<AnimatedOpacity>(avatarOf(initial).first).opacity;

    double offsetOf(String initial) =>
        tester.getCenter(avatarOf(initial).first).dx -
        tester.getCenter(find.byType(ProfileCarousel)).dx;

    await tester.binding.setSurfaceSize(const Size(1200, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const _Harness(activated: [], width: 800));
    await tester.pumpAndSettle();
    // Sam is two steps from Alex. Kids is hidden, waiting one step past him.
    expect(opacityOf('S'), 0.3);
    expect(opacityOf('K'), 0.0);
    expect(offsetOf('K'), ProfileCarousel.farOffset + ProfileCarousel.farStep);

    // Wider, a third step fits.
    await tester.pumpWidget(const _Harness(activated: [], width: 1100));
    await tester.pumpAndSettle();
    expect(opacityOf('S'), 0.3);
    expect(opacityOf('K'), 0.3);
    expect(offsetOf('K'), ProfileCarousel.farOffset + ProfileCarousel.farStep);

    await tester.pumpWidget(const _Harness(activated: [], width: 600));
    await tester.pumpAndSettle();
    expect(opacityOf('S'), 0.0);
    expect(opacityOf('J'), 0.55);
  });

  test('the reach grows with the width and keeps clear of the edge', () {
    expect(ProfileCarousel.reachFor(699), 1);
    expect(ProfileCarousel.reachFor(700), 2);
    // A third step needs its own width plus a gap past it on both sides.
    expect(ProfileCarousel.reachFor(1003), 2);
    expect(ProfileCarousel.reachFor(1004), 3);
    expect(ProfileCarousel.reachFor(1228), 4);
    expect(ProfileCarousel.reachFor(double.infinity), 2);
  });

  testWidgets('the phone hero swipes and the strip selects', (tester) async {
    var selected = 0;
    var added = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) => Scaffold(
            body: Column(
              children: [
                ProfileHero(
                  entry: _entries[selected],
                  onPrevious: selected > 0
                      ? () => setState(() => selected--)
                      : null,
                  onNext: selected < _entries.length - 1
                      ? () => setState(() => selected++)
                      : null,
                ),
                ProfileStrip(
                  entries: _entries,
                  selected: selected,
                  onSelected: (index) => setState(() => selected = index),
                  onAdd: () => added++,
                  addLabel: 'Add User',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.fling(find.byType(ProfileHero), const Offset(-300, 0), 1000);
    await tester.pumpAndSettle();
    expect(selected, 1);
    expect(find.text('Jordan'), findsOneWidget);

    // A slow drag that starts beside the avatar ends with no speed, and still
    // counts by how far it went.
    final hero = tester.getRect(find.byType(ProfileHero));
    await tester.timedDragFrom(
      Offset(hero.right - 10, hero.center.dy),
      const Offset(-150, 0),
      const Duration(seconds: 2),
    );
    await tester.pumpAndSettle();
    expect(selected, 2);

    await tester.tap(find.bySemanticsLabel('Kids'));
    await tester.pumpAndSettle();
    expect(selected, 3);

    await tester.tap(find.bySemanticsLabel('Add User'));
    expect(added, 1);
  });
}
