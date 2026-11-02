/// Translates between Silo's settings store and Jellyfin's
/// `UserConfiguration`, for the keys Moonfin reads from it.
library;

import 'package:server_core/server_core.dart';

/// The Silo settings `UserConfiguration` is built from, all stored at
/// `profile` scope.
const siloUserConfigurationKeys = [
  siloLibraryOrderKey,
  siloDisabledLibrariesKey,
  siloAudioLanguageKey,
  siloSubtitleLanguageKey,
  siloSubtitleModeKey,
  siloShowForcedSubtitlesKey,
  siloAutoPlayNextKey,
];

/// Library order (Jellyfin `OrderedViews`): integer library ids.
const siloLibraryOrderKey = 'ui.library_order';

/// Libraries the profile hid from its own browsing (Jellyfin
/// `MyMediaExcludes`). Not access control: Silo enforces access elsewhere.
const siloDisabledLibrariesKey = 'ui.disabled_library_ids';

const siloAudioLanguageKey = 'playback.audio_language';
const siloSubtitleLanguageKey = 'playback.subtitle_language';

/// `auto`, `always` or `off`.
const siloSubtitleModeKey = 'playback.subtitle_mode';
const siloShowForcedSubtitlesKey = 'playback.show_forced_subtitles';
const siloAutoPlayNextKey = 'playback.auto_play_next';

/// Jellyfin `UserConfiguration` JSON for Silo's effective setting [values]
/// (key to value). Missing keys read as Silo's contract defaults.
///
/// Keys with no Silo equivalent are left out and read as the model's
/// defaults: `LatestItemsExcludes` and `GroupedFolders` empty, the remember
/// and default-track switches on.
Map<String, dynamic> siloSettingsToUserConfiguration(
  Map<String, Object?> values,
) {
  final mode = values[siloSubtitleModeKey] as String?;
  final showForced = values[siloShowForcedSubtitlesKey] as bool? ?? true;
  return {
    'OrderedViews': _libraryIds(values[siloLibraryOrderKey]),
    'MyMediaExcludes': _libraryIds(values[siloDisabledLibrariesKey]),
    'EnableNextEpisodeAutoPlay': values[siloAutoPlayNextKey] as bool? ?? true,
    'AudioLanguagePreference': ?jsonText(values[siloAudioLanguageKey]),
    'SubtitleLanguagePreference': ?jsonText(values[siloSubtitleLanguageKey]),
    'SubtitleMode': siloSubtitleModeToJellyfin(mode, showForced: showForced),
  };
}

/// Silo's values for a Jellyfin configuration, ready to compare with what
/// was read and write back key by key.
///
/// [current] is what Silo last answered. It fills in what Jellyfin's model
/// can't say (`Default` subtitle mode keeps the current show-forced switch).
Map<String, Object?> userConfigurationToSiloSettings({
  required List<String> orderedViews,
  required List<String> myMediaExcludes,
  required bool enableNextEpisodeAutoPlay,
  required String? audioLanguagePreference,
  required String? subtitleLanguagePreference,
  required String? subtitleMode,
  Map<String, Object?> current = const {},
}) {
  final subtitles = jellyfinSubtitleModeToSilo(
    subtitleMode,
    currentShowForced: current[siloShowForcedSubtitlesKey] as bool? ?? true,
  );
  return {
    siloLibraryOrderKey: _toIntIds(orderedViews),
    siloDisabledLibrariesKey: _toIntIds(myMediaExcludes),
    siloAudioLanguageKey: jsonText(audioLanguagePreference),
    siloSubtitleLanguageKey: jsonText(subtitleLanguagePreference),
    siloSubtitleModeKey: subtitles.mode,
    siloShowForcedSubtitlesKey: subtitles.showForced,
    siloAutoPlayNextKey: enableNextEpisodeAutoPlay,
  };
}

/// Silo's subtitle mode plus its separate show-forced switch, as Jellyfin's
/// `SubtitleMode` name.
String siloSubtitleModeToJellyfin(String? mode, {bool showForced = true}) =>
    switch (mode) {
      'always' => 'Always',
      'off' => showForced ? 'OnlyForced' : 'None',
      _ => 'Default',
    };

/// The reverse of [siloSubtitleModeToJellyfin], case-insensitive (Moonfin's
/// model stores the mode lowercase). Jellyfin's `Default` and `Smart` both
/// mean Silo's `auto`, which has no show-forced choice of its own, so the
/// current switch is kept.
({String mode, bool showForced}) jellyfinSubtitleModeToSilo(
  String? mode, {
  bool currentShowForced = true,
}) => switch (mode?.trim().toLowerCase()) {
  'always' => (mode: 'always', showForced: currentShowForced),
  'onlyforced' => (mode: 'off', showForced: true),
  'none' => (mode: 'off', showForced: false),
  _ => (mode: 'auto', showForced: currentShowForced),
};

/// Silo library ids are positive integers, and Moonfin's are strings.
List<String> _libraryIds(Object? value) => [
  if (value is List)
    for (final id in value)
      if (id is num && id >= 1) '${id.toInt()}',
];

/// Ids that aren't positive integers can't be Silo libraries (Silo would
/// drop them anyway), so they're left out rather than refused.
List<int>? _toIntIds(List<String> ids) {
  final out = <int>[];
  for (final id in ids) {
    final n = int.tryParse(id.trim());
    if (n != null && n >= 1 && !out.contains(n)) out.add(n);
  }
  return out.isEmpty ? null : out;
}
