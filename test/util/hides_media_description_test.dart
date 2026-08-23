import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/overview_text.dart';

void main() {
  test('a film and an episode give the story away, so they are held back', () {
    for (final type in ['Movie', 'Episode']) {
      expect(
        hidesMediaDescription(itemType: type, hideMediaDescription: true),
        isTrue,
        reason: '$type should be hidden',
      );
    }
  });

  test('a series or a season keeps its description', () {
    for (final type in ['Series', 'Season', 'BoxSet', 'Person']) {
      expect(
        hidesMediaDescription(itemType: type, hideMediaDescription: true),
        isFalse,
        reason: '$type is not an episode specific spoiler',
      );
    }
  });

  test('nothing is held back while the setting is off', () {
    for (final type in ['Movie', 'Episode', 'Series']) {
      expect(
        hidesMediaDescription(itemType: type, hideMediaDescription: false),
        isFalse,
      );
    }
  });

  test('an unknown or missing type keeps its description', () {
    expect(
      hidesMediaDescription(itemType: null, hideMediaDescription: true),
      isFalse,
    );
    expect(
      hidesMediaDescription(itemType: '', hideMediaDescription: true),
      isFalse,
    );
  });
}
