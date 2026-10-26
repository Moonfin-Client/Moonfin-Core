import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/playback/appletv_subtitles.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import '../util/media_segment_fakes.dart' show testPrefs;

class _TrackManager extends PlaybackManager {
  @override
  int? get subtitleStreamIndex => 2;
  @override
  bool canUseAsSecondarySubtitle(int index) => {2, 3, 5, 6, 7}.contains(index);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('native menu prefers secondary language and preserves track indexes', () async {
    final prefs = await testPrefs();
    final manager = _TrackManager();
    addTearDown(prefs.dispose);
    addTearDown(manager.dispose);
    await prefs.set(UserPreferences.preferredSecondarySubtitleLanguage, 'jpn');
    await prefs.set(UserPreferences.subtitlesOffsetPosition, 0.50);
    const languages = {3: 'eng', 5: 'fra', 6: 'ja', 7: 'jpn', 2: 'eng', 4: 'ja'};
    final streams = [for (final entry in languages.entries)
      {'Index': entry.key, 'Language': entry.value}];
    final tracks = [for (final index in languages.keys)
      {'index': index, 'label': 'Track $index', 'selected': index == 7}];
    final metadata = appleTvSubtitleMetadata(
      manager: manager,
      prefs: prefs,
      l10n: AppLocalizationsEn(),
      tracks: tracks,
      sourceStreams: streams,
    );
    final ordered = (metadata['tracks'] as List).cast<Map<String, dynamic>>();
    expect(ordered.map((track) => track['index']).toList(), [6, 7, 3, 5]);
    expect(ordered[1]['selected'], true);
    expect(tracks.map((track) => track['index']).toList(), [3, 5, 6, 7, 2, 4]);
    expect(metadata['primaryVerticalOffset'], 0.36);
    expect(metadata['primaryStoredVerticalOffset'], 0.50);
    expect(metadata['primaryOffsetMax'], 0.36);
    expect(metadata['primaryOffsetStep'], 0.02);
    expect(metadata['secondaryOffsetMin'], 0.0);
    expect(metadata['secondaryOffsetMax'], 0.06);
    expect(metadata['secondaryOffsetStep'], 0.02);
    for (final (source, visible) in <(List<Map<String, dynamic>>?, bool)>[
      (null, true), ([], false), ([{'Codec': 'PGSSUB'}], false),
      ([{'Codec': 'pgs'}, {'Codec': 'subrip'}], true),
      ([{'Codec': 'ass'}], true), ([{'IsTextSubtitleStream': true}], true),
      ([{'Codec': 'mov_text'}], true), ([{'Codec': 'tx3g'}], true),
    ]) {
      expect(appleTvSubtitleMetadata(
        manager: manager, prefs: prefs, l10n: AppLocalizationsEn(),
        tracks: tracks, sourceStreams: source,
      )['showPrimaryAppearance'], visible);
    }
  });

  test('native secondary spacing clamps to Default and +6%', () async {
    final prefs = await testPrefs();
    final manager = _TrackManager();
    addTearDown(prefs.dispose);
    addTearDown(manager.dispose);

    await handleAppleTvSubtitleAction(
      {'event': 'configureSecondarySubtitleStyle', 'verticalOffset': -0.5},
      manager,
      prefs,
    )!;
    expect(prefs.get(UserPreferences.secondarySubtitleOffsetPosition), 0.0);
    expect(manager.secondarySubtitleOffset, 0.0);

    await handleAppleTvSubtitleAction(
      {'event': 'configureSecondarySubtitleStyle', 'verticalOffset': 0.5},
      manager,
      prefs,
    )!;
    expect(prefs.get(UserPreferences.secondarySubtitleOffsetPosition), 0.06);
    expect(manager.secondarySubtitleOffset, 0.06);
  });

}
