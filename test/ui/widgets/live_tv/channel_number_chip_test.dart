import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart'
    show OledMode, VisualThemeId;
import 'package:moonfin/ui/screens/livetv/epg/widgets/epg_now_next_card.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin/ui/theme/app_theme_controller.dart';
import 'package:moonfin/ui/widgets/live_tv/channel_number_chip.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';

void main() {
  tearDown(() {
    ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
  });

  // A screen the way the app themes one: the theme active in the registry,
  // which AppColorScheme reads, and the ThemeData built from it.
  Widget themed(String themeId, Widget child) {
    ThemeRegistry.setActiveById(themeId);
    return MaterialApp(
      theme: AppTheme.buildTheme(ThemeRegistry.active),
      home: Scaffold(body: Center(child: child)),
    );
  }

  BoxDecoration decorationOf(WidgetTester tester, Finder chip) =>
      tester
              .widget<DecoratedBox>(
                find.descendant(of: chip, matching: find.byType(DecoratedBox)),
              )
              .decoration
          as BoxDecoration;

  EdgeInsetsGeometry paddingOf(WidgetTester tester, Finder chip) => tester
      .widget<Padding>(find.descendant(of: chip, matching: find.byType(Padding)))
      .padding;

  // What the number is painted with, once the ambient text style merged in.
  TextStyle styleOf(WidgetTester tester, Finder chip) => tester
      .renderObject<RenderParagraph>(
        find.descendant(of: chip, matching: find.byType(RichText)),
      )
      .text
      .style!;

  Widget guideCard(String name, String? number, {bool apple = false}) =>
      SizedBox(
        width: 374,
        child: EpgNowNextCard(
          logoUrl: null,
          channelName: name,
          channelNumber: number,
          nowTitle: 'Journal',
          nowProgress: 0.5,
          remainingLabel: '30 min',
          nextLabel: null,
          isLive: true,
          apple: apple,
          onTap: () {},
        ),
      );

  testWidgets('takes its fill, corners and type from the theme', (
    tester,
  ) async {
    // Each changes something the chip draws: the accent, the body font, and
    // under the pixel theme the corners too.
    const accents = {
      ThemeRegistry.moonfinId: Color(0xFF00A4DC),
      ThemeRegistry.neonPulseId: Color(0xFFFF2E92),
      ThemeRegistry.eightbitHeroId: Color(0xFFEF7D57),
    };
    final families = <String?>{};
    for (final entry in accents.entries) {
      final id = entry.key;
      await tester.pumpWidget(themed(id, const ChannelNumberChip('1')));
      // The app animates between themes, and so does the ambient text style.
      await tester.pumpAndSettle();
      final chip = find.byType(ChannelNumberChip);
      final decoration = decorationOf(tester, chip);
      expect(decoration.color, entry.value, reason: id);
      expect(
        decoration.borderRadius,
        id == ThemeRegistry.eightbitHeroId
            ? BorderRadius.zero
            : BorderRadius.circular(8),
        reason: id,
      );
      expect(
        paddingOf(tester, chip),
        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        reason: id,
      );
      final style = styleOf(tester, chip);
      final body = Theme.of(tester.element(chip)).textTheme.bodyMedium!;
      expect(style.fontSize, 10, reason: id);
      expect(style.fontWeight, FontWeight.w600, reason: id);
      expect(style.color, const Color(0xFF062430), reason: id);
      expect(style.fontFamily, body.fontFamily, reason: id);
      expect(style.letterSpacing, body.letterSpacing, reason: id);
      expect(style.height, body.height, reason: id);
      families.add(style.fontFamily);
    }
    expect(families, hasLength(accents.length));
  });

  testWidgets('repaints with a new theme its parent does not rebuild for', (
    tester,
  ) async {
    final controller = AppThemeController(
      ThemeRegistry.resolveById(ThemeRegistry.moonfinId),
      VisualThemeId.moonfin,
      '',
      OledMode.off,
    );
    // A const tree with no theme of its own, so only the chip's own
    // subscription can bring the new accent in.
    await tester.pumpWidget(
      AppThemeScope(
        controller: controller,
        child: const MaterialApp(
          home: Scaffold(body: Center(child: ChannelNumberChip('1'))),
        ),
      ),
    );
    final chip = find.byType(ChannelNumberChip);
    expect(decorationOf(tester, chip).color, const Color(0xFF00A4DC));

    controller.setByThemeId(VisualThemeId.neonPulse);
    await tester.pump();

    expect(decorationOf(tester, chip).color, const Color(0xFFFF2E92));
  });

  group("the guide's Now/Next card", () {
    for (final apple in [false, true]) {
      testWidgets('puts the chip right after the name apple=$apple', (
        tester,
      ) async {
        await tester.pumpWidget(
          themed(ThemeRegistry.moonfinId, guideCard('TF1', '1', apple: apple)),
        );

        final chip = find.byType(ChannelNumberChip);
        final name = find.text('TF1');
        expect(chip, findsOneWidget);
        expect(tester.widget<ChannelNumberChip>(chip).number, '1');
        expect(
          tester.getTopLeft(chip).dx,
          closeTo(tester.getTopRight(name).dx + 8, 0.01),
        );
        expect(
          tester.getCenter(chip).dy,
          closeTo(tester.getCenter(name).dy, 0.01),
        );
        expect(decorationOf(tester, chip).color, AppColorScheme.accent);
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('leaves the chip out without a number', (tester) async {
      await tester.pumpWidget(
        themed(ThemeRegistry.moonfinId, guideCard('TF1', null)),
      );

      expect(find.byType(ChannelNumberChip), findsNothing);
      expect(find.text('TF1'), findsOneWidget);
    });
  });

  for (final id in [ThemeRegistry.moonfinId, ThemeRegistry.neonPulseId]) {
    testWidgets('a search card draws the same chip as the guide under $id', (
      tester,
    ) async {
      await tester.pumpWidget(
        themed(
          id,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              guideCard('TF1 Séries Films', '20'),
              const SizedBox(height: 12),
              MediaCard(
                title: 'TF1 Séries Films',
                subtitleWidget: const ChannelNumberChip('20'),
                width: 108,
                itemType: 'TvChannel',
                onTap: () {},
              ),
            ],
          ),
        ),
      );

      final guide = find.descendant(
        of: find.byType(EpgNowNextCard),
        matching: find.byType(ChannelNumberChip),
      );
      final search = find.descendant(
        of: find.byType(MediaCard),
        matching: find.byType(ChannelNumberChip),
      );
      expect(guide, findsOneWidget);
      expect(search, findsOneWidget);
      expect(tester.getSize(search), tester.getSize(guide));
      expect(decorationOf(tester, search), decorationOf(tester, guide));
      expect(paddingOf(tester, search), paddingOf(tester, guide));
      expect(styleOf(tester, search), styleOf(tester, guide));
      expect(tester.takeException(), isNull);
    });
  }

  group("under a search card's name", () {
    // Search's narrowest card, a grid cell three to a 320 point screen inside
    // its 20 point margins and 12 point gaps, and the card in its rows.
    const cell = (320 - 2 * 20 - 2 * 12) / 3;
    const rowCard = 108.0;

    // A screen set up like the app's, which shrinks all text under the pixel
    // theme because its font draws large.
    Widget searchScreen(String themeId, Widget child) {
      ThemeRegistry.setActiveById(themeId);
      return MaterialApp(
        theme: AppTheme.buildTheme(ThemeRegistry.active),
        builder: (context, app) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(AppColorScheme.isPixel ? 0.6 : 1.0),
          ),
          child: app!,
        ),
        home: Scaffold(
          body: Align(alignment: Alignment.topLeft, child: child),
        ),
      );
    }

    // A result the way search builds one: a channel's number in the chip as
    // the subtitle widget, a movie's year as the subtitle.
    MediaCard result(
      String name, {
      String? number,
      String? year,
      double width = rowCard,
      bool focused = false,
    }) => MediaCard(
      key: ValueKey(name),
      title: name,
      subtitle: year,
      subtitleWidget: number == null ? null : ChannelNumberChip(number),
      width: width,
      aspectRatio: 2 / 3,
      itemType: year == null ? 'TvChannel' : 'Movie',
      externalIsFocused: focused ? true : null,
      onTap: () {},
    );

    Finder cardOf(String name) => find.byKey(ValueKey(name));

    // The name's line. Without artwork the card spells the name out in
    // capitals, which for "TF1" is the same text, so the label is the last.
    Finder nameOf(String name, {bool focused = false}) => focused
        ? find.descendant(of: cardOf(name), matching: find.byType(MarqueeText))
        : find.descendant(of: cardOf(name), matching: find.text(name)).last;

    // From a card's top, where its name's line ends, and where a year's line
    // under it ends, as MediaCard has always laid them out.
    double nameBottom(WidgetTester tester, double width) =>
        MediaCard.layoutHeight(
          tester.element(find.byType(MediaCard).first),
          width: width,
          aspectRatio: 2 / 3,
        );
    double yearBottom(WidgetTester tester, double width) =>
        MediaCard.layoutHeight(
          tester.element(find.byType(MediaCard).first),
          width: width,
          aspectRatio: 2 / 3,
          hasSubtitle: true,
        );

    for (final layout in [
      InterfaceLayout.phone,
      InterfaceLayout.tv,
      InterfaceLayout.desktop,
    ]) {
      testWidgets('sits whole under the full-width name on ${layout.name}', (
        tester,
      ) async {
        PlatformDetection.setInterfaceLayout(layout);
        for (final width in [cell, rowCard]) {
          for (final number in ['1', '20', '2.10', '1007']) {
            for (final name in ['TF1', 'TF1 Séries Films']) {
              // Focus, or a desktop's hover, is when a long name scrolls.
              for (final focused in [false, true]) {
                final what = '$width "$name" $number focused=$focused';
                await tester.pumpWidget(
                  searchScreen(
                    ThemeRegistry.moonfinId,
                    // A grid cell, the least room search gives a label.
                    SizedBox(
                      width: width,
                      height: width / (2 / 3) + 48,
                      child: result(
                        name,
                        number: number,
                        width: width,
                        focused: focused,
                      ),
                    ),
                  ),
                );
                expect(tester.takeException(), isNull, reason: what);

                final card = tester.getRect(cardOf(name));
                final title = tester.getRect(nameOf(name, focused: focused));
                final chip = find.byType(ChannelNumberChip);
                final chipRect = tester.getRect(chip);
                final digits = tester.renderObject<RenderParagraph>(
                  find.descendant(of: chip, matching: find.byType(RichText)),
                );
                // The name keeps the whole line, where it has always been.
                expect(title.left, closeTo(card.left, 0.01), reason: what);
                expect(title.width, closeTo(card.width, 0.01), reason: what);
                expect(
                  title.bottom,
                  closeTo(card.top + nameBottom(tester, width), 0.01),
                  reason: what,
                );
                // The chip starts the line under it, as wide as its number
                // and padding, so never squeezed, and inside the cell.
                expect(chipRect.left, closeTo(card.left, 0.01), reason: what);
                expect(
                  chipRect.top,
                  closeTo(title.bottom + 2, 0.01),
                  reason: what,
                );
                expect(
                  chipRect.width,
                  closeTo(
                    digits.getMaxIntrinsicWidth(double.infinity) + 16,
                    0.01,
                  ),
                  reason: what,
                );
                expect(
                  chipRect.right,
                  lessThanOrEqualTo(card.right),
                  reason: what,
                );
                expect(
                  chipRect.bottom,
                  lessThanOrEqualTo(card.bottom),
                  reason: what,
                );
              }
            }
          }
        }
      });
    }

    // The channel with a number, its neighbour without one and a movie with
    // a year: the same slot, the name on the same line, and under it only
    // the number or the year, each where a year goes.
    void expectAligned(
      WidgetTester tester,
      String number, {
      required String what,
    }) {
      expect(tester.takeException(), isNull, reason: what);
      final channel = tester.getRect(cardOf('TF1 Séries Films'));
      final title = tester.getRect(nameOf('TF1 Séries Films'));
      for (final name in ['Arte', 'Movie One']) {
        final why = '$what $name';
        final card = tester.getRect(cardOf(name));
        final other = tester.getRect(nameOf(name));
        // Cells at fractional x offsets differ in the last bit, so the sizes
        // are compared to a hundredth of a point rather than exactly.
        expect(card.width, closeTo(channel.width, 0.01), reason: why);
        expect(card.height, closeTo(channel.height, 0.01), reason: why);
        expect(card.top, closeTo(channel.top, 0.01), reason: why);
        expect(other.width, closeTo(title.width, 0.01), reason: why);
        expect(other.height, closeTo(title.height, 0.01), reason: why);
        expect(other.top, closeTo(title.top, 0.01), reason: why);
        expect(other.left, closeTo(card.left, 0.01), reason: why);
      }
      final width = channel.width;
      expect(title.left, closeTo(channel.left, 0.01), reason: what);
      expect(title.width, closeTo(width, 0.01), reason: what);
      expect(
        title.bottom,
        closeTo(channel.top + nameBottom(tester, width), 0.01),
        reason: what,
      );

      final chip = find.byType(ChannelNumberChip);
      expect(chip, findsOneWidget, reason: what);
      expect(
        find.descendant(of: cardOf('TF1 Séries Films'), matching: chip),
        findsOneWidget,
        reason: what,
      );
      expect(tester.widget<ChannelNumberChip>(chip).number, number);
      final chipRect = tester.getRect(chip);
      expect(chipRect.left, closeTo(channel.left, 0.01), reason: what);
      expect(chipRect.top, closeTo(title.bottom + 2, 0.01), reason: what);
      expect(chipRect.bottom, lessThanOrEqualTo(channel.bottom), reason: what);

      // The movie's year, right under its name, as on main.
      final movie = tester.getRect(cardOf('Movie One'));
      final year = tester.getRect(
        find.descendant(of: cardOf('Movie One'), matching: find.text('2024')),
      );
      expect(year.left, closeTo(movie.left, 0.01), reason: what);
      expect(
        year.top,
        closeTo(movie.top + nameBottom(tester, width), 0.01),
        reason: what,
      );
      expect(
        year.bottom,
        closeTo(movie.top + yearBottom(tester, width), 0.01),
        reason: what,
      );
    }

    // Moonfin and Glass draw the label in Roboto at full size; the pixel
    // theme in its own font, with the app's text at 0.6.
    const themes = [
      ThemeRegistry.moonfinId,
      ThemeRegistry.glassId,
      ThemeRegistry.eightbitHeroId,
    ];

    for (final id in themes) {
      for (final layout in [
        InterfaceLayout.phone,
        InterfaceLayout.tv,
        InterfaceLayout.desktop,
      ]) {
        testWidgets('a row keeps cards and names in place, $id ${layout.name}', (
          tester,
        ) async {
          PlatformDetection.setInterfaceLayout(layout);
          final cards = [
            result('TF1 Séries Films', number: '20'),
            result('Arte'),
            result('Movie One', year: '2024'),
          ];
          await tester.pumpWidget(
            searchScreen(
              id,
              // LibraryRow lays every card out at the row's full height,
              // which search sets to the artwork plus 56.
              SizedBox(
                width: 400,
                height: rowCard / (2 / 3) + 56,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (_, i) => cards[i],
                ),
              ),
            ),
          );

          expectAligned(tester, '20', what: '$id ${layout.name}');
        });
      }

      testWidgets('the narrowest grid keeps cells and names in place, $id', (
        tester,
      ) async {
        PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
        await tester.pumpWidget(
          searchScreen(
            id,
            SizedBox(
              width: 320,
              child: GridView.count(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                // Search's cells: the artwork plus 48.
                childAspectRatio: cell / (cell / (2 / 3) + 48),
                children: [
                  result('TF1 Séries Films', number: '1007', width: cell),
                  result('Arte', width: cell),
                  result('Movie One', year: '2024', width: cell),
                ],
              ),
            ),
          ),
        );

        expectAligned(tester, '1007', what: id);
      });
    }
  });
}
