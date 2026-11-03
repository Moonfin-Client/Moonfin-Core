import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../../util/language_matching.dart';
import '../models/series_track_preference.dart';

/// Brings a series' audio and subtitle choice kept by the server into the
/// device's series track preferences, for a server that keeps
/// them ([SeriesTrackPreferencesApi], Silo).
///
/// The server's choice wins when it names another language, or turns
/// subtitles off or on where the device's doesn't: it was made in the
/// server's own apps or on another device, or is the device's own written
/// through. A device choice in the same language is kept as it is, since it
/// also knows which of several same-language tracks was picked.
///
/// Answers whether anything changed. Failures change nothing.
Future<bool> syncSeriesTrackChoices(
  MediaServerClient client,
  String seriesId,
  UserPreferences prefs,
) async {
  if (seriesId.isEmpty) return false;
  SeriesTrackChoice? audio;
  SeriesTrackChoice? subtitle;
  try {
    final Object items = client.itemsApi;
    if (items is! SeriesTrackPreferencesApi) return false;
    final api = items;
    (audio, subtitle) = await (
      api.getSeriesAudioChoice(seriesId),
      api.getSeriesSubtitleChoice(seriesId),
    ).wait;
  } catch (_) {
    return false;
  }
  var changed = false;
  final audioPref = _preference(audio);
  if (audioPref != null &&
      _differs(prefs.getSeriesAudioPreference(seriesId), audioPref)) {
    await prefs.setSeriesAudioPreference(seriesId, audioPref);
    changed = true;
  }
  final subtitlePref = _preference(subtitle);
  if (subtitlePref != null &&
      _differs(prefs.getSeriesSubtitlePreference(seriesId), subtitlePref)) {
    await prefs.setSeriesSubtitlePreference(seriesId, subtitlePref);
    changed = true;
  }
  return changed;
}

SeriesTrackPreference? _preference(SeriesTrackChoice? choice) {
  if (choice == null) return null;
  if (choice.off) return SeriesTrackPreference.none;
  final pref = SeriesTrackPreference(
    language: choice.language,
    title: choice.title,
  );
  return pref.isEmpty ? null : pref;
}

bool _differs(SeriesTrackPreference local, SeriesTrackPreference server) {
  if (local.isEmpty) return true;
  if (local.isNone != server.isNone) return true;
  if (server.isNone) return false;
  if (server.language.isEmpty || local.language.isEmpty) {
    return server.title.toLowerCase() != local.title.toLowerCase();
  }
  return _language(server.language) != _language(local.language);
}

String _language(String raw) => toIso3Language(normalizeLanguage(raw));
