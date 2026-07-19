import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/game_browse_filter.dart';

void main() {
  group('gameTitleMatchesBrowseFilters', () {
    test('matches word prefixes without regard to case', () {
      expect(
        gameTitleMatchesBrowseFilters('Super Mario World', query: 'mArIo'),
        isTrue,
      );
      expect(
        gameTitleMatchesBrowseFilters('Super Mario World', query: 'mar wor'),
        isTrue,
      );
      expect(
        gameTitleMatchesBrowseFilters('Chrono Trigger', query: 'mario'),
        isFalse,
      );
    });

    test('does not match text from the middle of a word', () {
      expect(
        gameTitleMatchesBrowseFilters('River Raid', query: 'river'),
        isTrue,
      );
      expect(
        gameTitleMatchesBrowseFilters('Night Driver', query: 'river'),
        isFalse,
      );
    });

    test('can match a ROM filename without matching inside its words', () {
      expect(
        gameTitleMatchesBrowseFilters(
          'A Different Display Title',
          alternateText: 'River Raid (USA).a26',
          query: 'river',
        ),
        isTrue,
      );
      expect(
        gameTitleMatchesBrowseFilters(
          'A Different Display Title',
          alternateText: 'Night Driver (USA).a26',
          query: 'river',
        ),
        isFalse,
      );
    });

    test('separator-only queries do not filter the library', () {
      expect(gameTitleMatchesBrowseFilters('Adventure', query: '.-\''), isTrue);
    });

    test('matches an alphabetical bucket', () {
      expect(gameTitleMatchesBrowseFilters('Adventure', letter: 'A'), isTrue);
      expect(gameTitleMatchesBrowseFilters('Zelda', letter: 'A'), isFalse);
    });

    test('folds accents and places other initials in the hash bucket', () {
      expect(
        gameTitleMatchesBrowseFilters('3-D Tic-Tac-Toe', letter: '#'),
        isTrue,
      );
      expect(gameTitleMatchesBrowseFilters('.hack', letter: '#'), isTrue);
      expect(gameTitleMatchesBrowseFilters('[BIOS] PS1', letter: '#'), isTrue);
      expect(gameTitleMatchesBrowseFilters('~Homebrew', letter: '#'), isTrue);
      expect(gameTitleMatchesBrowseFilters('Asteroids', letter: '#'), isFalse);
      expect(gameTitleMatchesBrowseFilters('Élite', letter: '#'), isFalse);
      expect(gameTitleMatchesBrowseFilters('Élite', letter: 'E'), isTrue);
      expect(gameTitleMatchesBrowseFilters('Ōkami', letter: 'O'), isTrue);
    });

    test('applies search and alphabet filters together', () {
      expect(
        gameTitleMatchesBrowseFilters(
          'Advance Wars',
          query: 'wars',
          letter: 'A',
        ),
        isTrue,
      );
      expect(
        gameTitleMatchesBrowseFilters('Star Wars', query: 'wars', letter: 'A'),
        isFalse,
      );
    });
  });
}
