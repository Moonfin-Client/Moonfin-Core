import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/server_type_icon.dart';
import 'package:server_core/server_core.dart';

void main() {
  testWidgets('every server type renders an icon', (tester) async {
    for (final type in ServerType.values) {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(child: ServerTypeIcon(serverType: type, size: 32)),
        ),
      );
      expect(tester.takeException(), isNull, reason: type.name);
      expect(find.byType(ServerTypeIcon), findsOneWidget);
    }
  });

  testWidgets('Silo draws its own glyph, not a placeholder icon', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: ServerTypeIcon(serverType: ServerType.silo, size: 48),
        ),
      ),
    );
    expect(find.byType(Icon), findsNothing);
    final paint = tester.widget<CustomPaint>(
      find.descendant(
        of: find.byType(ServerTypeIcon),
        matching: find.byType(CustomPaint),
      ),
    );
    expect(paint.size, const Size.square(48));
    expect(paint.painter, isNotNull);
  });
}
