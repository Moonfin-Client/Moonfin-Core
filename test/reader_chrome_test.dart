import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/reader_settings.dart';
import 'package:moonfin/ui/widgets/reader/reader_chrome_bar.dart';

void main() {
  const colors = ReaderThemeColors(
    background: Color(0xFF0A0A0A),
    foreground: Colors.white,
    link: Color(0xFF6FA8FF),
    isDark: true,
  );

  testWidgets('ReaderTopBar renders with non-zero size', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              const Positioned.fill(child: ColoredBox(color: Colors.black)),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ReaderTopBar(
                  title: 'Fundamentals of Data Engineering',
                  subtitle: 'Chapter 4',
                  pageColors: colors,
                  onBack: () {},
                  onContents: () {},
                  onSettings: () {},
                  onBookmark: () {},
                  hasBookmarks: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final size = tester.getSize(find.byType(ReaderTopBar));
    expect(size.height, greaterThan(20));
    expect(size.width, greaterThan(100));
  });

  testWidgets('ReaderBottomBar renders with non-zero size', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              const Positioned.fill(child: ColoredBox(color: Colors.black)),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ReaderBottomBar(
                  pageColors: colors,
                  accent: const Color(0xFF0A84FF),
                  leftLabel: '1 / 24',
                  captionLabel: '4%',
                  value: 1,
                  min: 1,
                  max: 24,
                  divisions: 23,
                  onPrev: null,
                  onNext: () {},
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final size = tester.getSize(find.byType(ReaderBottomBar));
    expect(size.height, greaterThan(20));
  });
}
