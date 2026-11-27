import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/separated_wrap.dart';

void main() {
  Future<RenderSeparatedWrap> pump(
    WidgetTester tester,
    TextDirection direction,
  ) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: direction,
        child: Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: SeparatedWrap(
              separator: const Text('·'),
              spacing: 8,
              runSpacing: 6,
              children: [
                for (var i = 0; i < 4; i++)
                  SizedBox(key: ValueKey(i), width: 100, height: 20),
              ],
            ),
          ),
        ),
      ),
    );
    return tester.renderObject(find.byType(SeparatedWrap));
  }

  testWidgets('drops the separator where the line breaks', (tester) async {
    final wrap = await pump(tester, TextDirection.ltr);
    expect(wrap.size, const Size(230, 46));
    expect(wrap, paintsExactlyCountTimes(#drawParagraph, 2));
  });

  testWidgets('starts each line from the right in RTL', (tester) async {
    await pump(tester, TextDirection.rtl);
    expect(
      tester.getTopLeft(find.byKey(const ValueKey(0))),
      const Offset(130, 0),
    );
    expect(
      tester.getTopLeft(find.byKey(const ValueKey(2))),
      const Offset(130, 26),
    );
  });
}
