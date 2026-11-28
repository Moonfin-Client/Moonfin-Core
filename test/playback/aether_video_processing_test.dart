import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_video_processing.dart';

void main() {
  test('animated shows and anything tagged anime count as drawn animation', () {
    expect(
      isDrawnAnimation(genres: ['Animation', 'Action'], isEpisode: true),
      isTrue,
    );
    expect(isDrawnAnimation(genres: ['Anime'], isEpisode: false), isTrue);
    expect(isDrawnAnimation(genres: ['anime'], isEpisode: true), isTrue);
  });

  test('animated movies and live action do not', () {
    expect(
      isDrawnAnimation(genres: ['Animation', 'Comedy'], isEpisode: false),
      isFalse,
    );
    expect(isDrawnAnimation(genres: ['Drama'], isEpisode: true), isFalse);
    expect(isDrawnAnimation(genres: const [], isEpisode: true), isFalse);
  });
}
