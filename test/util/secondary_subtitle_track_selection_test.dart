import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/secondary_subtitle_track_selection.dart';

void main() {
  final french = <String, dynamic>{
    'Index': 3,
    'Language': 'fra',
    'Title': 'French SDH',
    'Codec': 'srt',
  };
  final frenchDub = <String, dynamic>{
    'Index': 4,
    'Language': 'fra',
    'Title': 'French dub captions',
    'Codec': 'vtt',
  };
  final unknown = <String, dynamic>{'Index': 5, 'Codec': 'srt'};
  final english = <String, dynamic>{
    'Index': 6,
    'Language': 'eng',
    'Title': 'English',
    'Codec': 'srt',
  };

  test('preferred language ranks matches first and retains duplicates and unknowns', () {
    final ranked = rankSecondarySubtitleStreams([
      english,
      french,
      unknown,
      frenchDub,
    ], 'fr');

    expect(ranked, [french, frenchDub, english, unknown]);
    expect(ranked.where((s) => s['Language'] == 'fra').length, 2);
  });

  test(
    'preference does not choose a track when no explicit selection is stored',
    () {
      expect(
        restoreSecondarySubtitleTrack(null, [
          french,
          english,
        ], isCompatible: (_) => true),
        isNull,
      );
    },
  );

  test('restores by metadata when the selected stream index changes', () {
    final saved = secondarySubtitleTrackSelection([french, frenchDub], 4);
    final shiftedFrenchDub = {...frenchDub, 'Index': 17};

    expect(
      restoreSecondarySubtitleTrack(saved, [
        french,
        shiftedFrenchDub,
      ], isCompatible: (_) => true),
      17,
    );
  });

  test('explicit Off is distinct from no stored choice', () {
    final off = secondarySubtitleTrackSelection([french], -1);

    expect(
      restoreSecondarySubtitleTrack(off, [french], isCompatible: (_) => true),
      -1,
    );
  });

  test('unavailable or incompatible saved track restores as Off', () {
    final saved = secondarySubtitleTrackSelection([french], 3);

    expect(
      restoreSecondarySubtitleTrack(saved, [
        french,
      ], isCompatible: (_) => false),
      -1,
    );
    expect(
      restoreSecondarySubtitleTrack(saved, [
        english,
      ], isCompatible: (_) => true),
      -1,
    );
  });
}
