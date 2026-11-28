import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/util/original_title.dart';

void main() {
  group('eligibleOriginalTitle', () {
    test('returns originalTitle for movies and series, null for episodes and seasons', () {
      const movie = AggregatedItem(
        id: '1',
        serverId: 's',
        rawData: {'Type': 'Movie', 'Name': 'Amélie', 'OriginalTitle': "Le Fabuleux Destin d'Amélie Poulain"},
      );
      const episode = AggregatedItem(
        id: '2',
        serverId: 's',
        rawData: {'Type': 'Episode', 'Name': 'Pilot', 'OriginalTitle': 'Pilote'},
      );
      const season = AggregatedItem(
        id: '3',
        serverId: 's',
        rawData: {'Type': 'Season', 'Name': 'Season 1', 'OriginalTitle': 'Saison 1'},
      );

      expect(eligibleOriginalTitle(movie), "Le Fabuleux Destin d'Amélie Poulain");
      expect(eligibleOriginalTitle(episode), isNull);
      expect(eligibleOriginalTitle(season), isNull);
    });
  });

  group('distinctOriginalTitle', () {
    test('returns null when originalTitle is null, blank, or matches title', () {
      expect(distinctOriginalTitle('Goodfellas', null), isNull);
      expect(distinctOriginalTitle('Goodfellas', '   '), isNull);
      expect(distinctOriginalTitle('Goodfellas', 'goodfellas'), isNull);
      expect(distinctOriginalTitle('Amelie', 'Amélie'), isNull);
      expect(distinctOriginalTitle('Amelie', 'Ame\u0301lie'), isNull);
    });

    test('returns trimmed originalTitle when distinct, including non-Latin', () {
      expect(
        distinctOriginalTitle('Les Affranchis', ' Goodfellas '),
        'Goodfellas',
      );
      expect(distinctOriginalTitle('Spirited Away', '千と千尋の神隠し'), '千と千尋の神隠し');
      expect(distinctOriginalTitle('Parasite', '기생충'), '기생충');
      expect(distinctOriginalTitle('и', 'и\u0306'), 'и\u0306');
    });
  });

  group('formatInlineTitle', () {
    test('formats according to mode', () {
      expect(
        formatInlineTitle('Les Affranchis', 'Goodfellas', OriginalTitleDisplay.off),
        'Les Affranchis',
      );
      expect(
        formatInlineTitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.replace,
        ),
        'Goodfellas',
      );
      expect(
        formatInlineTitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.parentheses,
        ),
        'Les Affranchis (Goodfellas)',
      );
      expect(
        formatInlineTitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.subtitle,
        ),
        'Les Affranchis',
      );
    });

    test('returns title unchanged when original matches', () {
      expect(
        formatInlineTitle(
          'Goodfellas',
          'Goodfellas',
          OriginalTitleDisplay.parentheses,
        ),
        'Goodfellas',
      );
    });
  });

  group('detailOriginalTitleSubtitle', () {
    test('returns null when off or identical', () {
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.off,
          hasLogo: true,
        ),
        isNull,
      );
      expect(
        detailOriginalTitleSubtitle(
          'Goodfellas',
          'goodfellas',
          OriginalTitleDisplay.subtitle,
          hasLogo: false,
        ),
        isNull,
      );
    });

    test('under logo, wraps parentheses mode in parens and keeps plain text for replace/subtitle', () {
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.replace,
          hasLogo: true,
        ),
        'Goodfellas',
      );
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.subtitle,
          hasLogo: true,
        ),
        'Goodfellas',
      );
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.parentheses,
          hasLogo: true,
        ),
        '(Goodfellas)',
      );
    });

    test('without logo, shows subtitle only in subtitle mode', () {
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.subtitle,
          hasLogo: false,
        ),
        'Goodfellas',
      );
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.replace,
          hasLogo: false,
        ),
        isNull,
      );
      expect(
        detailOriginalTitleSubtitle(
          'Les Affranchis',
          'Goodfellas',
          OriginalTitleDisplay.parentheses,
          hasLogo: false,
        ),
        isNull,
      );
    });
  });

  testWidgets('OriginalTitleSubtitle renders single-line ellipsized text', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: OriginalTitleSubtitle(
          text: "Le Fabuleux Destin d'Amélie Poulain",
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
    final textWidget = tester.widget<Text>(find.text("Le Fabuleux Destin d'Amélie Poulain"));
    expect(textWidget.maxLines, 1);
    expect(textWidget.overflow, TextOverflow.ellipsis);
  });
}
