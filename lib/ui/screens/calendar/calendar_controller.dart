import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/calendar_entry.dart';
import '../../../data/repositories/calendar_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';

/// Loads the whole calendar window once and filters it with the user's
/// calendar settings. The styles and the month grid share one instance per
/// screen, and the repository caches the fetch between screens.
class CalendarController extends ChangeNotifier {
  CalendarController({
    CalendarRepository? repository,
    UserPreferences? prefs,
    PluginSyncService? pluginSync,
    DateTime Function()? clock,
  }) : _repo = repository ?? GetIt.instance<CalendarRepository>(),
       _prefs = prefs ?? GetIt.instance<UserPreferences>(),
       _sync = pluginSync ?? GetIt.instance<PluginSyncService>(),
       _clock = clock ?? DateTime.now {
    _prefs.addListener(_onPrefs);
  }

  final CalendarRepository _repo;
  final UserPreferences _prefs;
  final PluginSyncService _sync;
  final DateTime Function() _clock;

  List<CalendarEntry> _all = const [];
  List<CalendarEntry> _entries = const [];
  Map<DateTime, List<CalendarEntry>> _byDay = const {};
  Map<String, CalendarSeriesProgress> _progress = const {};
  Set<String> _reminders = const {};
  CalendarProblem? _problem;
  bool _loading = true;
  bool _disposed = false;
  String _filterSignature = '';

  DateTime get now => _clock();
  DateTime get today {
    final n = now;
    return DateTime(n.year, n.month, n.day);
  }

  DateTime get windowStart =>
      today.subtract(Duration(days: _sync.calendarDaysBack));
  DateTime get windowEnd =>
      today.add(Duration(days: _sync.calendarDaysAhead + 1));

  bool get loading => _loading;
  CalendarProblem? get problem => _problem;

  /// Filtered and sorted by date.
  List<CalendarEntry> get entries => _entries;

  bool get remindersEnabled =>
      PlatformDetection.useMobileUi &&
      _prefs.get(UserPreferences.calendarReminders) &&
      _sync.calendarRemindersAvailable;

  bool hasReminder(CalendarEntry e) => _reminders.contains(e.reminderKey);

  /// Spoiler safe mode hides an episode's title and still for a series the
  /// user is part way through.
  bool hidesSpoilers(CalendarEntry e) =>
      e.isEpisode &&
      _prefs.get(UserPreferences.calendarSpoilerSafe) &&
      (_progress[e.itemId]?.behind ?? false);

  List<CalendarEntry> on(DateTime day) =>
      _byDay[DateTime(day.year, day.month, day.day)] ?? const [];

  /// Days from today on, by day, for the Upcoming list.
  List<CalendarEntry> get upcoming => [
    for (final e in _entries)
      if (!e.day.isBefore(today)) e,
  ];

  /// The days before today, newest first, for Recently aired.
  List<CalendarEntry> get recent {
    final out = [
      for (final e in _entries)
        if (e.day.isBefore(today)) e,
    ];
    out.sort((a, b) => -compareCalendarEntries(a, b));
    return out;
  }

  /// The next thing to air from now. Movies count from the start of their day.
  CalendarEntry? get next {
    final n = now;
    for (final e in _entries) {
      if (e.inLibrary) continue;
      final at = e.hasTime ? e.date : e.day.add(const Duration(days: 1));
      if (at.isAfter(n)) return e;
    }
    return null;
  }

  /// Things that already aired and are on the server, newest first.
  List<CalendarEntry> get readyToWatch => [
    for (final e in recentAndToday)
      if (e.inLibrary) e,
  ];

  List<CalendarEntry> get recentAndToday {
    final cutoff = today.add(const Duration(days: 1));
    final out = [
      for (final e in _entries)
        if (e.day.isBefore(cutoff)) e,
    ];
    out.sort((a, b) => -compareCalendarEntries(a, b));
    return out;
  }

  List<CalendarEntry> get thisWeek {
    final end = today.add(const Duration(days: 7));
    final n = now;
    return [
      for (final e in _entries)
        if (!e.day.isBefore(today) &&
            e.day.isBefore(end) &&
            !e.inLibrary &&
            (!e.hasTime || e.date.isAfter(n)))
          e,
    ];
  }

  Future<void> load({bool refresh = false}) async {
    _loading = _all.isEmpty;
    _notify();
    final result = await _repo.load(
      start: windowStart,
      end: windowEnd,
      unmonitored: _prefs.get(UserPreferences.calendarIncludeUnmonitored),
      refresh: refresh,
    );
    if (_disposed) return;
    _all = result.entries;
    _problem = result.problem;
    await _loadProgress();
    if (remindersEnabled) {
      // A reminder that fired is gone from the server, so each load asks again.
      _reminders = await _repo.reminderKeys(refresh: true);
    }
    if (_disposed) return;
    _loading = false;
    _applyFilter();
    _notify();
  }

  Future<void> _loadProgress() async {
    final needed =
        _prefs.get(UserPreferences.calendarScope) == CalendarScope.myShows ||
        _prefs.get(UserPreferences.calendarSpoilerSafe);
    if (!needed) return;
    final ids = {
      for (final e in _all)
        if (e.isEpisode && e.itemId != null && !_progress.containsKey(e.itemId))
          e.itemId!,
    };
    if (ids.isEmpty) return;
    _progress = {..._progress, ...await _repo.seriesProgress(ids)};
  }

  /// Returns whether the reminder is now set, or null when saving failed.
  Future<bool?> toggleReminder(CalendarEntry e) async {
    final key = e.reminderKey;
    if (key == null) return null;
    final on = !_reminders.contains(key);
    try {
      final set = await _repo.setReminder(e, on);
      _reminders = set ? {..._reminders, key} : ({..._reminders}..remove(key));
      _notify();
      return set;
    } catch (err) {
      debugPrint('[Calendar] reminder failed: $err');
      return null;
    }
  }

  void _applyFilter() {
    final scope = _prefs.get(UserPreferences.calendarScope);
    final filter = CalendarFilter(
      showEpisodes: _prefs.get(UserPreferences.calendarShowEpisodes),
      showMovies: _prefs.get(UserPreferences.calendarShowMovies),
      showSpecials: _prefs.get(UserPreferences.calendarShowSpecials),
      cinema: _prefs.get(UserPreferences.radarrCalendarShowCinema),
      digital: _prefs.get(UserPreferences.radarrCalendarShowDigital),
      physical: _prefs.get(UserPreferences.radarrCalendarShowPhysical),
      libraryIds: {
        for (final id
            in _prefs.get(UserPreferences.calendarLibraryIds).split(','))
          if (id.trim().isNotEmpty) id.trim(),
      },
      myShowsOnly: scope == CalendarScope.myShows,
      followedSeriesIds: {
        for (final p in _progress.entries)
          if (p.value.followed) p.key,
      },
    );
    _entries = [
      for (final e in _all)
        if (filter.allows(e)) e,
    ];
    _byDay = groupBy(_entries, (CalendarEntry e) => e.day);
    _filterSignature = _signature();
  }

  String _signature() => [
    _prefs.get(UserPreferences.calendarShowEpisodes),
    _prefs.get(UserPreferences.calendarShowMovies),
    _prefs.get(UserPreferences.calendarShowSpecials),
    _prefs.get(UserPreferences.radarrCalendarShowCinema),
    _prefs.get(UserPreferences.radarrCalendarShowDigital),
    _prefs.get(UserPreferences.radarrCalendarShowPhysical),
    _prefs.get(UserPreferences.calendarLibraryIds),
    _prefs.get(UserPreferences.calendarScope).name,
    _prefs.get(UserPreferences.calendarSpoilerSafe),
    _prefs.get(UserPreferences.calendarIncludeUnmonitored),
    _prefs.get(UserPreferences.calendarReminders),
  ].join('|');

  void _onPrefs() {
    if (_loading || _signature() == _filterSignature) return;
    // Unmonitored changes what the server sends, and My shows or spoiler safe
    // may need watch state that wasn't loaded yet.
    load();
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _prefs.removeListener(_onPrefs);
    super.dispose();
  }
}
