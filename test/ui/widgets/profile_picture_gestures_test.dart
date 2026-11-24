import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/profile_carousel.dart';

const _editable = ProfileEntry(
  id: 'a1',
  name: 'Alex',
  badge: ProfileBadge.active,
  canEditPicture: true,
);
const _other = ProfileEntry(id: 'j2', name: 'Jordan');

Widget _carousel({
  required List<ProfileEntry> entries,
  required List<int> edits,
  List<int>? activated,
}) => MaterialApp(
  home: Scaffold(
    body: Center(
      child: SizedBox(
        width: 800,
        child: ProfileCarousel(
          entries: entries,
          selected: 0,
          onSelected: (_) {},
          onActivate: (index) => activated?.add(index),
          onEditPicture: (index, _) => edits.add(index),
          editPictureLabel: 'Change profile picture',
        ),
      ),
    ),
  ),
);

Offset _hero(WidgetTester tester) => tester.getCenter(find.text('A'));

void main() {
  group('desktop carousel', () {
    testWidgets('hovering the signed-in avatar shows the camera button', (
      tester,
    ) async {
      final edits = <int>[];
      await tester.pumpWidget(
        _carousel(entries: const [_editable, _other], edits: edits),
      );
      await tester.pumpAndSettle();
      final button = find.byIcon(Icons.photo_camera_outlined);
      double opacity() => tester
          .widget<AnimatedOpacity>(
            // The nearest: the slot fades as well.
            find
                .ancestor(of: button, matching: find.byType(AnimatedOpacity))
                .first,
          )
          .opacity;
      expect(opacity(), 0);

      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      addTearDown(mouse.removePointer);
      await mouse.moveTo(_hero(tester));
      await tester.pumpAndSettle();
      expect(opacity(), 1);

      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(edits, [0]);
    });

    testWidgets('a right click or a long press opens it, a click switches', (
      tester,
    ) async {
      final edits = <int>[];
      final activated = <int>[];
      await tester.pumpWidget(
        _carousel(
          entries: const [_editable, _other],
          edits: edits,
          activated: activated,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tapAt(_hero(tester), buttons: kSecondaryMouseButton);
      await tester.pumpAndSettle();
      await tester.longPressAt(_hero(tester));
      await tester.pumpAndSettle();
      expect(edits, [0, 0]);
      expect(activated, isEmpty);

      await tester.tapAt(_hero(tester));
      await tester.pumpAndSettle();
      expect(activated, [0]);
    });

    testWidgets('a profile that cannot change its picture has no menu', (
      tester,
    ) async {
      final edits = <int>[];
      await tester.pumpWidget(
        _carousel(
          entries: const [
            ProfileEntry(id: 'a1', name: 'Alex', badge: ProfileBadge.active),
          ],
          edits: edits,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tapAt(_hero(tester), buttons: kSecondaryMouseButton);
      await tester.longPressAt(_hero(tester));
      await tester.pumpAndSettle();
      expect(edits, isEmpty);
      expect(find.byIcon(Icons.photo_camera_outlined), findsNothing);
    });
  });

  group('phone hero', () {
    Widget hero(ProfileEntry entry, List<Offset> edits) => MaterialApp(
      home: Scaffold(
        body: ProfileHero(
          entry: entry,
          onEditPicture: edits.add,
          editPictureLabel: 'Change profile picture',
        ),
      ),
    );

    testWidgets('a long press on the avatar opens the menu there', (
      tester,
    ) async {
      final edits = <Offset>[];
      await tester.pumpWidget(hero(_editable, edits));
      await tester.longPressAt(_hero(tester));
      await tester.pumpAndSettle();
      expect(edits, [_hero(tester)]);
    });

    testWidgets('not for a profile that cannot change its picture', (
      tester,
    ) async {
      final edits = <Offset>[];
      await tester.pumpWidget(hero(_other, edits));
      await tester.longPressAt(tester.getCenter(find.text('J')));
      await tester.pumpAndSettle();
      expect(edits, isEmpty);
    });
  });
}
