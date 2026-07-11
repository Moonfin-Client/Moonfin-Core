import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../data/models/aggregated_item.dart';
import '../playback/audio_capability_profile.dart';
import '../util/idiom/app_ui_idiom.dart';
import '../util/insecure_certificates.dart';
import '../util/language_matching.dart';
import '../util/platform_detection.dart';
import 'home_section_config.dart';
import 'preference_constants.dart';
import 'seerr_row_config.dart';

class UserPreferences extends ChangeNotifier {
  static const _lastServerIdPreferenceKey = 'pref_last_server_id';
  static const _lastUserIdPreferenceKey = 'pref_last_user_id';

  static const mediaBarModeMoonfin = 'moonfin';
  static const mediaBarModeMakd = 'makd';
  static const mediaBarModeBookshelf = 'bookshelf';
  static const mediaBarModeGallery = 'gallery';
  static const mediaBarModeBanner = 'banner';
  static const mediaBarModeOff = 'off';
  static const mediaBarModeValues = <String>{
    mediaBarModeMoonfin,
    mediaBarModeMakd,
    mediaBarModeBookshelf,
    mediaBarModeGallery,
    mediaBarModeBanner,
    mediaBarModeOff,
  };

  final PreferenceStore _store;

  UserPreferences(this._store) {
    _migrateOverlayPreferences();
    _migrateDefaultAudioLanguagePreference();
    _migrateSeerrPreferenceKeys();
    _migrateSeerrRowsVisibility();
    _enforceMediaQueuingAlwaysOn();
    _seedClockFormatFromSystem();
    _syncInsecureCertificateFlag();
  }

  // Prime the native bad-certificate override with the stored opt-in so the
  // choice survives restarts. The toggle keeps [gAllowSelfSignedCertificates]
  // in sync while the app runs; this covers the value at launch.
  void _syncInsecureCertificateFlag() {
    gAllowSelfSignedCertificates = get(allowSelfSignedCerts);
  }

  // Carry over the pre-rename jellyseerr* preference keys to their seerr* names.
  void _migrateSeerrPreferenceKeys() {
    const legacyBlockNsfw = 'jellyseerrBlockNsfw';
    if (_store.containsKey(legacyBlockNsfw)) {
      final value = _store.get(Preference(key: legacyBlockNsfw, defaultValue: false));
      _setIfMissing(seerrBlockNsfw, value);
    }
  }

  // The global "Display Seerr Discovery Rows" toggle (default off) was removed.
  // Seerr rows now show whenever any Seerr row category is enabled. Preserve the
  // opt-out for anyone who had that toggle off by disabling their stored Seerr row
  // configs, so the rows don't suddenly appear after upgrading. Gating on the
  // legacy key's presence makes this run once and skips users who never had it.
  void _migrateSeerrRowsVisibility() {
    const legacyKey = 'pref_display_seerr_rows';
    if (!_store.containsKey(legacyKey)) return;

    final wasVisible = _store.getBool(legacyKey) ?? false;
    if (!wasVisible) {
      for (final key in _store.keys.toList()) {
        if (!key.startsWith('seerr_rows_config_')) continue;
        final disabled =
            SeerrRowConfig.fromJsonString(_store.getString(key) ?? '')
                .map((c) => c.copyWith(enabled: false))
                .toList();
        _store.setString(key, SeerrRowConfig.toJsonString(disabled));
      }
    }

    _store.remove(legacyKey);
  }

  void _migrateOverlayPreferences() {
    _setIfMissing(navbarOpacity, get(mediaBarOverlayOpacity));
    _setIfMissing(navbarColor, get(mediaBarOverlayColor));
  }

  void _migrateDefaultAudioLanguagePreference() {
    final current = get(defaultAudioLanguage).trim();
    _setIfMissing(defaultAudioLanguage, current.isNotEmpty ? current : 'auto');
  }

  void _enforceMediaQueuingAlwaysOn() {
    if (get(mediaQueuingEnabled) != true) {
      _setIfMissing(mediaQueuingEnabled, true);
    }
  }

  // On first run, default the 12h/24h clock to the device's locale so users in
  // 24h regions aren't stuck on 12h. Runs once; an explicit choice is kept.
  void _seedClockFormatFromSystem() {
    if (_store.containsKey(use24HourClock.key)) return;
    if (ui.PlatformDispatcher.instance.alwaysUse24HourFormat) {
      _store.set(use24HourClock, true);
    }
  }

  /// Initialize local language preferences from the current server's
  /// [UserConfiguration].  This will not overwrite explicitly set preferences,
  ///  only keys that are missing.
  ///
  /// - Audio: if the local pref is still default ('auto') and never
  ///   explicitly stored), replace it with the server's AudioLanguagePreference.
  /// - Subtitles: if the local pref has never been explicitly stored (empty
  ///   default), replace it with the server's SubtitleLanguagePreference.
  /// - SubtitleMode: if the local pref has never been explicitly stored (empty
  ///   default), convert it to the closest Moonfin subtitle mode.
  void initLanguagePrefs(UserConfiguration config) {
    final sysIso3 = toIso3Language(normalizeLanguage(ui.PlatformDispatcher.instance.locale.languageCode));

    // defaultAudioLanguage
    final serverAudio = config.audioLanguagePreference;
    final audioToSet = (serverAudio != null && serverAudio.isNotEmpty)
      ? serverAudio.toLowerCase()
      : sysIso3; // fallback to system language
    _setIfMissing(defaultAudioLanguage, audioToSet);

    // defaultSubtitleLanguage
    final serverSubtitle = config.subtitleLanguagePreference;
    final subToSet = (serverSubtitle != null && serverSubtitle.isNotEmpty)
      ? serverSubtitle.toLowerCase()
      : sysIso3; // fallback to system language
    _setIfMissing(defaultSubtitleLanguage, subToSet);

    // subtitleMode
    if (!containsPreference(subtitleMode, scopedOnly: true)) {
      final mode = switch (config.subtitleMode) {
        'smart' => SubtitleMode.foreign,
        'onlyforced' => SubtitleMode.forced,
        'always' => SubtitleMode.always,
        'none' => SubtitleMode.none,
        _ => SubtitleMode.flagged, // jellyfin 'default'/catch all case
      };
      _setIfMissing(subtitleMode, mode);
    }
  }

  String? _activeProfileScopeSuffix() {
    final serverId = (_store.getString(_lastServerIdPreferenceKey) ?? '')
        .trim();
    final userId = (_store.getString(_lastUserIdPreferenceKey) ?? '').trim();
    if (serverId.isEmpty || userId.isEmpty) {
      return null;
    }
    return '${serverId}_$userId';
  }

  static final Set<String> _scopedPreferenceKeys = {
    'pref_enable_tv_queuing',
    'pref_enable_cinema_mode',
    'pref_resume_preroll',
    'media_segment_actions',
    'pref_autoplay_next_episode',
    'next_up_behavior',
    'next_up_timeout',
    'replace_skip_outro_with_next_up',
    'enable_still_watching',
    'pref_language_override',
    'pref_media_segment_countdown',
    'pref_desktop_ui_scale',
    'poster_size_library',
    'poster_size_playlist',
    'pref_home_rows_fullscreen',
    'pref_show_seerr_button',
    'pref_show_media_details_on_library_page',
    'pref_use_detailed_sub_headings',
    'pref_show_clock',
    'pref_use_24_hour_clock',
    'pref_clock_behavior',
    'pref_prefer_system_ime_keyboard',
    'pref_audio_language',
    'pref_fallback_audio_language',
    'pref_prefer_default_audio_track',
    'pref_prefer_audio_description',
    'pref_subtitle_language',
    'pref_fallback_subtitle_language',
    'pref_subtitle_mode',
    'subtitles_background_color',
    'subtitles_text_weight',
    'subtitles_text_color',
    'subtitles_text_stroke_color',
    'subtitles_text_size',
    'subtitles_offset_position',
    'subtitles_default_to_none',
    'subtitles_use_embedded_styles',
    'subtitles_use_embedded_font_sizes',
    'prefer_sdh_subtitles',
    'app_theme_id',
    'pref_custom_theme_id',
    'pref_navbar_position',
    'focus_color',
    'pref_watched_indicator_behavior',
    'pref_card_focus_expansion',
    'pref_home_rows_style',
    'poster_size',
    'pref_display_favorites_rows',
    'pref_display_collections_rows',
    'pref_display_genres_rows',
    'pref_favorites_row_sort_by',
    'pref_collections_row_sort_by',
    'pref_genres_row_sort_by',
    'pref_genres_row_item_filter',
    'pref_show_shuffle_button',
    'pref_show_genres_button',
    'pref_show_favorites_button',
    'pref_show_syncplay_button',
    'pref_show_libraries_in_toolbar',
    'pref_navbar_always_expanded',
    'pref_shuffle_content_type',
    'pref_merge_continue_watching_next_up',
    'enable_multi_server_libraries',
    'enable_folder_view',
    'seasonal_surprise',
    'mediaBarEnabled',
    'mediaBarMode',
    'mediaBarContentType',
    'mediaBarItemCount',
    'mediaBarOverlayOpacity',
    'mediaBarOverlayColor',
    'navbarOpacity',
    'navbarColor',
    'mediaBarAutoAdvance',
    'mediaBarIntervalMs',
    'mediaBarTrailerPreview',
    'mediaBarTrailerAudio',
    'episodePreviewEnabled',
    'previewAudioEnabled',
    'mediaBarLibraryIds',
    'mediaBarCollectionIds',
    'mediaBarExcludedGenres',
    'themeMusicEnabled',
    'themeMusicVolume',
    'themeMusicOnHomeRows',
    'themeMusicLoop',
    'homeRowsUniversalOverride',
    'homeRowsUniversalImageType',
    'pref_enable_series_thumbnails',
    'pref_show_backdrop',
    'detailsBackgroundBlurAmount',
    'browsingBackgroundBlurAmount',
    'enableAdditionalRatings',
    'mdblistApiKey',
    'showRatingLabels',
    'showRatingBadges',
    'enableEpisodeRatings',
    'tmdbApiKey',
    'seerrEnabled',
    'seerrBlockNsfw',
    'enabledRatings',
    'home_sections_config',
    'pref_audio_display_latest',
    'pref_audio_display_last_played',
    'pref_audio_display_favorites',
    'pref_audio_display_playlists',
    'pref_audio_display_album_artists',
    'pref_audio_display_artists',
    'pref_audio_display_albums',
    'pref_audio_sort_option',
    'pref_person_page_sort_option',
    'pref_person_page_group_items',
    'tmdb_popular_movies_enabled',
    'tmdb_top_rated_movies_enabled',
    'tmdb_now_playing_movies_enabled',
    'tmdb_upcoming_movies_enabled',
    'tmdb_popular_tv_enabled',
    'tmdb_top_rated_tv_enabled',
    'tmdb_airing_today_tv_enabled',
    'tmdb_on_the_air_tv_enabled',
    'tmdb_trending_movie_daily_enabled',
    'tmdb_trending_movie_weekly_enabled',
    'tmdb_trending_tv_daily_enabled',
    'tmdb_trending_tv_weekly_enabled',
    'tmdb_trending_all_weekly_enabled',
    'enable_radarr_calendar',
    'enable_sonarr_calendar',
    'radarr_calendar_show_cinema',
    'radarr_calendar_show_digital',
    'radarr_calendar_show_physical',
    'radarr_calendar_show_date',
    'sonarr_calendar_show_date',
    'sonarr_calendar_show_episode_info',
    'last_radarr_calendar_fetch_time',
    'last_sonarr_calendar_fetch_time',
    'merge_radarr_sonarr_calendars',
  };

  bool _isScopedPreference<T>(Preference<T> pref) {
    return _scopedPreferenceKeys.contains(pref.key) ||
        pref.key.startsWith('homeRowImageType_');
  }

  Preference<T> getEffectivePreference<T>(Preference<T> pref) {
    if (_isScopedPreference(pref)) {
      final scoped = _scopedPreference(pref);
      if (scoped != null) {
        return scoped;
      }
    }
    return pref;
  }

  Preference<T>? _scopedPreference<T>(Preference<T> pref) {
    final scopeSuffix = _activeProfileScopeSuffix();
    if (scopeSuffix == null) {
      return null;
    }
    return pref.withKey('${pref.key}_$scopeSuffix');
  }

  T get<T>(Preference<T> pref) {
    if (_isScopedPreference(pref)) {
      final scoped = _scopedPreference(pref);
      if (scoped != null && _store.containsKey(scoped.key)) {
        return _store.get(scoped);
      }
      return _store.get(pref);
    }

    return _store.get(pref);
  }

  Future<void> set<T>(Preference<T> pref, T value) async {
    if (pref.key == subtitleMode.key) {
      final prevMode = get(subtitleMode);
      final newMode = value as SubtitleMode;
      if (newMode == SubtitleMode.none) {
        await set(defaultSubtitleLanguage, '');
      } else if (prevMode == SubtitleMode.none && !containsPreference(defaultSubtitleLanguage, scopedOnly: true)) {
        final sysLang = ui.PlatformDispatcher.instance.locale.languageCode;
        final iso3 = toIso3Language(normalizeLanguage(sysLang));
        await set(defaultSubtitleLanguage, iso3);
      }
    }

    if (_isScopedPreference(pref)) {
      final scoped = _scopedPreference(pref);
      if (scoped != null) {
        await _store.set(scoped, value);
      } else {
        await _store.set(pref, value);
      }
      notifyListeners();
      return;
    }

    await _store.set(pref, value);
    notifyListeners();
  }

  /// set pref if it doesn't exist, scoped to the active profile
  void _setIfMissing<T>(Preference<T> pref, T value) {
    final scoped = _scopedPreference(pref);
    if (scoped != null && !_store.containsKey(scoped.key)) {
      _store.set(scoped, value);
    }
  }

  /// Clears any stored value for [pref] so subsequent reads fall back to the
  /// default / capability-derived value. Used to return a tri-state passthrough
  /// toggle to its "Auto (follow detection)" state.
  Future<void> removePreference<T>(Preference<T> pref) async {
    if (_isScopedPreference(pref)) {
      final scoped = _scopedPreference(pref);
      if (scoped != null) {
        await _store.delete(scoped);
      }
    }
    await _store.delete(pref);
    notifyListeners();
  }

  Future<void> flushPendingWrites() => _store.flushPendingWrites();

  bool containsPreferenceKey(String key) => _store.containsKey(key);

  bool containsPreference<T>(Preference<T> pref, {bool scopedOnly = false}) {
    if (_isScopedPreference(pref)) {
      final scoped = _scopedPreference(pref);
      if (scoped == null) return false;
      final hasScoped = _store.containsKey(scoped.key);
      if (scopedOnly) {
        return hasScoped;
      }
      return hasScoped || _store.containsKey(pref.key);
    }
    if (scopedOnly) return false;

    return _store.containsKey(pref.key);
  }

  AudioOutputMode resolveAudioOutputMode() => get(audioOutputMode);

  AudioFallbackCodec resolveAudioFallbackCodec() => get(audioFallbackCodec);

  int resolveMaxAudioChannels() => get(maxAudioChannels);

  PosterSize resolveLibraryPosterSize() {
    if (containsPreference(libraryPosterSize, scopedOnly: true)) {
      return get(libraryPosterSize);
    }
    return get(posterSize);
  }

  PosterSize resolvePlaylistPosterSize() {
    if (containsPreference(playlistPosterSize, scopedOnly: true)) {
      return get(playlistPosterSize);
    }
    return get(posterSize);
  }

  /// The hardware audio capabilities last detected by the platform probe, or an
  /// optimistic (decode-everything / passthrough-nothing) profile when none has
  /// been detected. Mirrors how the playback backends build their profile.
  AudioCapabilityProfile get detectedAudioCapabilities =>
      PlatformDetection.hasAudioCapabilities
      ? AudioCapabilityProfile.fromMap(
          PlatformDetection.audioCapabilitiesSnapshot,
          audioOutputMode: resolveAudioOutputMode(),
        )
      : PlatformDetection.isIOS
          ? const AudioCapabilityProfile.appleMobile()
          : const AudioCapabilityProfile.optimistic();

  // Tri-state passthrough resolution: an explicitly-set toggle wins (On or
  // Off); when unset, the resolved value follows the detected hardware
  // capability so passthrough "just works" out of the box without the user
  // toggling anything. Callers may pass a profile they already built; when
  // omitted, the live detected profile is used. The DeviceProfileBuilder gate
  // already ANDs the codec hierarchy (e.g. DTS:X requires DTS core + DTS-HD)
  // across the resolved values, so each resolver only needs to report its own
  // capability.
  bool _resolvePassthrough(
    Preference<bool> pref,
    bool Function(AudioCapabilityProfile) capabilityOf,
    AudioCapabilityProfile? profile,
  ) => containsPreference(pref)
      ? get(pref)
      : capabilityOf(profile ?? detectedAudioCapabilities);

  bool resolveAc3PassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        ac3PassthroughEnabled,
        (p) => p.canPassthroughAc3,
        profile,
      );

  bool resolveEac3PassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        eac3PassthroughEnabled,
        (p) => p.canPassthroughEac3,
        profile,
      );

  bool resolveEac3JocPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        eac3JocPassthroughEnabled,
        (p) => p.canPassthroughEac3Joc,
        profile,
      );

  bool resolveDtsCorePassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        dtsCorePassthroughEnabled,
        (p) => p.canPassthroughDts,
        profile,
      );

  bool resolveDtsHdPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        dtsHdPassthroughEnabled,
        (p) => p.canPassthroughDtsHd,
        profile,
      );

  bool resolveDtsXPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        dtsXPassthroughEnabled,
        (p) => p.canPassthroughDtsX,
        profile,
      );

  bool resolveTrueHdPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        trueHdPassthroughEnabled,
        (p) => p.canPassthroughTrueHd,
        profile,
      );

  bool resolveTrueHdAtmosPassthroughEnabled([
    AudioCapabilityProfile? profile,
  ]) => _resolvePassthrough(
    trueHdAtmosPassthroughEnabled,
    (p) => p.canPassthroughTrueHdJoc,
    profile,
  );

  /// The eight per-codec passthrough toggle preferences.
  static List<Preference<bool>> get passthroughTogglePreferences =>
      <Preference<bool>>[
        ac3PassthroughEnabled,
        eac3PassthroughEnabled,
        eac3JocPassthroughEnabled,
        dtsCorePassthroughEnabled,
        dtsHdPassthroughEnabled,
        dtsXPassthroughEnabled,
        trueHdPassthroughEnabled,
        trueHdAtmosPassthroughEnabled,
      ];

  /// Applies a high-level preset by bulk-writing the output mode and clearing
  /// per-codec overrides (so detection drives passthrough). Auto and AVR also
  /// reset Max Channels to Auto so the detected route maxes out (e.g. 8 on
  /// eARC, stereo on a stereo-only TV). [advanced] leaves the output mode,
  /// channels, and toggles untouched for manual control.
  Future<void> applyAudioPassthroughPreset(
    AudioPassthroughPreset preset,
  ) async {
    await set(audioPassthroughPreset, preset);
    switch (preset) {
      case AudioPassthroughPreset.auto:
        await set(audioOutputMode, AudioOutputMode.auto);
        await set(maxAudioChannels, 0);
        await clearPassthroughOverrides();
      case AudioPassthroughPreset.surroundReceiver:
        await set(audioOutputMode, AudioOutputMode.avrPassthrough);
        await set(maxAudioChannels, 0);
        await clearPassthroughOverrides();
      case AudioPassthroughPreset.stereo:
        await set(audioOutputMode, AudioOutputMode.forceStereo);
        await clearPassthroughOverrides();
      case AudioPassthroughPreset.advanced:
        // Snapshot the current effective values into explicit prefs so the
        // per-codec Advanced switches show the true state (a codec auto-enabled
        // by detection would otherwise read as a bare "off").
        await materializePassthroughOverrides();
    }
  }

  /// Clears every per-codec passthrough override so each resolves back to
  /// "Auto" (follow the detected capability).
  Future<void> clearPassthroughOverrides() async {
    for (final pref in passthroughTogglePreferences) {
      await removePreference(pref);
    }
  }

  /// Writes the current resolved (effective) passthrough values into explicit
  /// prefs for any toggle still on "Auto", so the per-codec Advanced switches
  /// reflect what detection is actually doing.
  Future<void> materializePassthroughOverrides() async {
    final profile = detectedAudioCapabilities;
    Future<void> materialize(Preference<bool> pref, bool value) async {
      if (!containsPreference(pref)) await set(pref, value);
    }

    await materialize(
      ac3PassthroughEnabled,
      resolveAc3PassthroughEnabled(profile),
    );
    await materialize(
      eac3PassthroughEnabled,
      resolveEac3PassthroughEnabled(profile),
    );
    await materialize(
      eac3JocPassthroughEnabled,
      resolveEac3JocPassthroughEnabled(profile),
    );
    await materialize(
      dtsCorePassthroughEnabled,
      resolveDtsCorePassthroughEnabled(profile),
    );
    await materialize(
      dtsHdPassthroughEnabled,
      resolveDtsHdPassthroughEnabled(profile),
    );
    await materialize(
      dtsXPassthroughEnabled,
      resolveDtsXPassthroughEnabled(profile),
    );
    await materialize(
      trueHdPassthroughEnabled,
      resolveTrueHdPassthroughEnabled(profile),
    );
    await materialize(
      trueHdAtmosPassthroughEnabled,
      resolveTrueHdAtmosPassthroughEnabled(profile),
    );
  }

  void notifyPreferenceChanged() {
    notifyListeners();
  }

  static String normalizeMediaBarMode(String? mode) {
    final normalized = (mode ?? '').trim().toLowerCase();
    if (mediaBarModeValues.contains(normalized)) {
      return normalized;
    }
    return mediaBarModeMoonfin;
  }

  static bool isMediaBarModeEnabled(String? mode) {
    return normalizeMediaBarMode(mode) != mediaBarModeOff;
  }

  static final posterSize = EnumPreference(
    key: 'poster_size',
    defaultValue: PosterSize.medium,
    values: PosterSize.values,
  );

  static final libraryPosterSize = EnumPreference(
    key: 'poster_size_library',
    defaultValue: PosterSize.medium,
    values: PosterSize.values,
  );

  static final playlistPosterSize = EnumPreference(
    key: 'poster_size_playlist',
    defaultValue: PosterSize.medium,
    values: PosterSize.values,
  );

  static final homeRowsStyle = EnumPreference(
    key: 'pref_home_rows_style',
    defaultValue: HomeRowsStyle.v2,
    values: HomeRowsStyle.values,
  );

  static final fullScreenRows = Preference(
    key: 'pref_home_rows_fullscreen',
    defaultValue: false,
  );

  static final desktopUiScale = EnumPreference(
    key: 'pref_desktop_ui_scale',
    defaultValue: DesktopUiScale.medium,
    values: DesktopUiScale.values,
  );

  static final cardFocusExpansion = Preference(
    key: 'pref_card_focus_expansion',
    defaultValue: true,
  );

  static final backdropEnabled = Preference(
    key: 'pref_show_backdrop',
    defaultValue: true,
  );

  static final seriesThumbnailsEnabled = Preference(
    key: 'pref_enable_series_thumbnails',
    defaultValue: false,
  );

  static final homeRowInfoOverlay = Preference(
    key: 'pref_home_row_info_overlay',
    defaultValue: PlatformDetection.isTV,
  );

  static final favoritesViewStyle = EnumPreference(
    key: 'pref_favorites_view_style',
    defaultValue: FavoritesViewStyle.home,
    values: FavoritesViewStyle.values,
  );

  static final displayFavoritesRows = Preference(
    key: 'pref_display_favorites_rows',
    defaultValue: false,
  );

  static final displayCollectionsRows = Preference(
    key: 'pref_display_collections_rows',
    defaultValue: false,
  );

  static final displayGenresRows = Preference(
    key: 'pref_display_genres_rows',
    defaultValue: false,
  );

  static final displayPlaylistsRows = Preference(
    key: 'pref_display_playlists_rows',
    defaultValue: false,
  );

  static final displayAudioRows = Preference(
    key: 'pref_display_audio_rows',
    defaultValue: false,
  );

  static final displaySinceYouWatchedRows = Preference(
    key: 'pref_display_since_you_watched_rows',
    defaultValue: false,
  );

  static final sinceYouWatched1Enabled = Preference(
    key: 'since_you_watched_1_enabled',
    defaultValue: false,
  );

  static final sinceYouWatched2Enabled = Preference(
    key: 'since_you_watched_2_enabled',
    defaultValue: false,
  );

  static final sinceYouWatched3Enabled = Preference(
    key: 'since_you_watched_3_enabled',
    defaultValue: false,
  );

  static final sinceYouWatched4Enabled = Preference(
    key: 'since_you_watched_4_enabled',
    defaultValue: false,
  );

  static final sinceYouWatched5Enabled = Preference(
    key: 'since_you_watched_5_enabled',
    defaultValue: false,
  );

  static final sinceYouWatchedSource = EnumPreference(
    key: 'pref_since_you_watched_source',
    defaultValue: SinceYouWatchedSource.local,
    values: SinceYouWatchedSource.values,
  );

  static final sinceYouWatchedSourceType = EnumPreference(
    key: 'pref_since_you_watched_source_type',
    defaultValue: SinceYouWatchedSourceType.movies,
    values: SinceYouWatchedSourceType.values,
  );

  static final sinceYouWatchedSourceItem = EnumPreference(
    key: 'pref_since_you_watched_source_item',
    defaultValue: SinceYouWatchedSourceItem.recentlyWatched,
    values: SinceYouWatchedSourceItem.values,
  );

  static final sinceYouWatchedNumRows = EnumPreference(
    key: 'pref_since_you_watched_num_rows',
    defaultValue: SinceYouWatchedNumRows.one,
    values: SinceYouWatchedNumRows.values,
  );

  static final sinceYouWatchedIncludeWatched = Preference(
    key: 'pref_since_you_watched_include_watched',
    defaultValue: false,
  );

  static final displayRewatchRow = Preference(
    key: 'pref_display_rewatch_row',
    defaultValue: false,
  );

  static final rewatchSortBy = EnumPreference(
    key: 'pref_rewatch_sort_by',
    defaultValue: RewatchSortBy.recentlyWatched,
    values: RewatchSortBy.values,
  );

  static final rewatchIncludeMovies = Preference(
    key: 'pref_rewatch_include_movies',
    defaultValue: true,
  );

  static final rewatchIncludeShows = Preference(
    key: 'pref_rewatch_include_shows',
    defaultValue: true,
  );

  static final rewatchIncludeCollections = Preference(
    key: 'pref_rewatch_include_collections',
    defaultValue: true,
  );
  static final favoritesRowSortBy = EnumPreference(
    key: 'pref_favorites_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final collectionsRowSortBy = EnumPreference(
    key: 'pref_collections_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final genresRowSortBy = EnumPreference(
    key: 'pref_genres_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final playlistsRowSortBy = EnumPreference(
    key: 'pref_playlists_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final audioRowsSortBy = EnumPreference(
    key: 'pref_audio_rows_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final genresRowItemFilter = EnumPreference(
    key: 'pref_genres_row_item_filter',
    defaultValue: GenresRowItemFilter.both,
    values: GenresRowItemFilter.values,
  );

  static final watchedIndicatorBehavior = EnumPreference(
    key: 'pref_watched_indicator_behavior',
    defaultValue: WatchedIndicatorBehavior.always,
    values: WatchedIndicatorBehavior.values,
  );

  static final mergeContinueWatchingNextUp = Preference(
    key: 'pref_merge_continue_watching_next_up',
    defaultValue: true,
  );

  static final focusColor = EnumPreference(
    key: 'focus_color',
    defaultValue: AppTheme.white,
    values: AppTheme.values,
  );

  static final preferSystemImeKeyboard = Preference(
    key: 'pref_prefer_system_ime_keyboard',
    defaultValue: PlatformDetection.useMobileUi ||
        PlatformDetection.isDesktop ||
        PlatformDetection.isAppleTV,
  );

  static final visualTheme = EnumPreference(
    key: 'app_theme_id',
    defaultValue: PlatformDetection.isApple || PlatformDetection.isAppleTV
        ? VisualThemeId.glass
        : VisualThemeId.moonfin,
    values: VisualThemeId.values,
  );

  static final interfaceStyle = EnumPreference(
    key: 'pref_interface_style',
    defaultValue: InterfaceStyle.automatic,
    values: InterfaceStyle.values,
  );

  static final glassQuality = EnumPreference(
    key: 'pref_glass_quality',
    defaultValue: GlassQualityMode.auto,
    values: GlassQualityMode.values,
  );

  /// Structural style for the media detail screen. Global (not scoped per
  /// server/user), so it is deliberately omitted from [_scopedPreferenceKeys].
  static final detailScreenStyle = EnumPreference(
    key: 'pref_detail_screen_style',
    defaultValue: DetailScreenStyle.modern,
    values: DetailScreenStyle.values,
  );

  /// When on, the modern detail tabs behave like the search tabs: the first
  /// tab starts expanded and moving focus across tabs shows their content
  /// without pressing select. When off, tabs start collapsed on TV and each
  /// one is opened/closed by pressing it. Global like [detailScreenStyle].
  static final detailExpandedTabs = Preference(
    key: 'pref_detail_expanded_tabs',
    defaultValue: true,
  );

  /// Algorithm source for the similar items recommendation system. Global
  /// (not scoped per server/user), so it is deliberately omitted from [_scopedPreferenceKeys].
  static final recommendationSystemSource = EnumPreference(
    key: 'pref_recommendation_system_source',
    defaultValue: RecommendationSystemSource.local,
    values: RecommendationSystemSource.values,
  );

  /// Apply parental rating ceiling to Moonfin Recommends suggestions.
  static final recommendationsApplyParentalRatingCap = Preference(
    key: 'pref_recommendations_apply_parental_rating_cap',
    defaultValue: true,
  );

  /// Default mobile view for the Live TV guide (Now/Next list vs compact grid).
  static final epgMobileView = EnumPreference(
    key: 'pref_epg_mobile_view',
    defaultValue: EpgMobileView.list,
    values: EpgMobileView.values,
  );

  /// Optional id of a plugin-supplied custom theme. When non-empty and the id
  /// resolves to a registered custom theme, it overrides [visualTheme].
  /// Empty string means "use the built-in [visualTheme] selection".
  static final customThemeId = Preference(
    key: 'pref_custom_theme_id',
    defaultValue: '',
  );

  static final showClock = Preference(
    key: 'pref_show_clock',
    defaultValue: true,
  );

  static final use24HourClock = Preference(
    key: 'pref_use_24_hour_clock',
    defaultValue: false,
  );

  // Opt-in: trust self-signed / private-CA TLS certificates. Off by default so
  // certificate validation stays on for everyone who doesn't need it.
  static final allowSelfSignedCerts = Preference(
    key: 'pref_allow_self_signed_certs',
    defaultValue: false,
  );

  static final showShuffleButton = Preference(
    key: 'pref_show_shuffle_button',
    defaultValue: true,
  );

  static final showGenresButton = Preference(
    key: 'pref_show_genres_button',
    defaultValue: true,
  );

  static final showFavoritesButton = Preference(
    key: 'pref_show_favorites_button',
    defaultValue: true,
  );

  static final showSyncPlayButton = Preference(
    key: 'pref_show_syncplay_button',
    defaultValue: false,
  );

  static final showLibrariesInToolbar = Preference(
    key: 'pref_show_libraries_in_toolbar',
    defaultValue: true,
  );

  static final navbarAlwaysExpanded = Preference(
    key: 'pref_navbar_always_expanded',
    defaultValue: false,
  );

  static final showSeerrButton = Preference(
    key: 'pref_show_seerr_button',
    defaultValue: true,
  );

  static final adminDrawerOrder = Preference(
    key: 'pref_admin_drawer_order',
    defaultValue: '',
  );

  static final navbarPosition = EnumPreference(
    key: 'pref_navbar_position',
    defaultValue: NavbarPosition.top,
    values: NavbarPosition.values,
  );

  static final shuffleContentType = Preference(
    key: 'pref_shuffle_content_type',
    defaultValue: 'both',
  );
  static final clockBehavior = EnumPreference(
    key: 'pref_clock_behavior',
    defaultValue: ClockBehavior.always,
    values: ClockBehavior.values,
  );
  static final enableMultiServerLibraries = Preference(
    key: 'enable_multi_server_libraries',
    defaultValue: false,
  );

  static final diagnosticLoggingEnabled = Preference(
    key: 'pref_diagnostic_logging_enabled',
    defaultValue: false,
  );

  static final enableFolderView = Preference(
    key: 'enable_folder_view',
    defaultValue: false,
  );

  static final groupItemsIntoCollections = Preference(
    key: 'pref_group_items_into_collections',
    defaultValue: false,
  );

  static final showMediaDetailsOnLibraryPage = Preference(
    key: 'pref_show_media_details_on_library_page',
    defaultValue: true,
  );

  static final useDetailedSubHeadings = Preference(
    key: 'pref_use_detailed_sub_headings',
    defaultValue: true,
  );
  static final maxBitrate = Preference(
    key: 'pref_max_bitrate',
    defaultValue: '120',
  );

  static final maxVideoResolution = EnumPreference(
    key: 'pref_max_video_resolution',
    defaultValue: MaxVideoResolution.auto,
    values: MaxVideoResolution.values,
  );

  static final mediaQueuingEnabled = Preference(
    key: 'pref_enable_tv_queuing',
    defaultValue: true,
  );

  static final autoplayNextEpisode = Preference(
    key: 'pref_autoplay_next_episode',
    defaultValue: true,
  );

  static final nextUpBehavior = EnumPreference(
    key: 'next_up_behavior',
    defaultValue: NextUpBehavior.extended,
    values: NextUpBehavior.values,
  );

  static final nextUpTimeout = Preference(
    key: 'next_up_timeout',
    defaultValue: 7000,
  );

  static final resumeSubtractDuration = Preference(
    key: 'pref_resume_preroll',
    defaultValue: '0',
  );

  static final cinemaModeEnabled = Preference(
    key: 'pref_enable_cinema_mode',
    defaultValue: true,
  );

  static final stillWatchingBehavior = EnumPreference(
    key: 'enable_still_watching',
    defaultValue: StillWatchingBehavior.disabled,
    values: StillWatchingBehavior.values,
  );

  static final screensaverEnabled = Preference(
    key: 'pref_screensaver_enabled',
    defaultValue: true,
  );

  static final screensaverMode = EnumPreference(
    key: 'pref_screensaver_mode',
    defaultValue: ScreensaverMode.library,
    values: ScreensaverMode.values,
  );

  static final screensaverTimeout = EnumPreference(
    key: 'pref_screensaver_timeout',
    defaultValue: ScreensaverTimeout.m5,
    values: ScreensaverTimeout.values,
  );

  static final screensaverDimming = Preference(
    key: 'pref_screensaver_dimming',
    defaultValue: 0,
  );

  static final screensaverClockMode = EnumPreference(
    key: 'pref_screensaver_clock_mode',
    defaultValue: ScreensaverClockMode.off,
    values: ScreensaverClockMode.values,
  );

  static final screensaverMaxAgeRating = Preference(
    key: 'pref_screensaver_max_age_rating',
    defaultValue: 'any',
  );

  static final screensaverRequireRating = Preference(
    key: 'pref_screensaver_require_rating',
    defaultValue: false,
  );

  static final useExternalPlayer = Preference(
    key: 'external_player',
    defaultValue: false,
  );

  static final externalPlayerComponentName = Preference(
    key: 'external_player_component',
    defaultValue: '',
  );

  static final refreshRateSwitchingBehavior = EnumPreference(
    key: 'refresh_rate_switching_behavior',
    defaultValue: RefreshRateSwitchingBehavior.disabled,
    values: RefreshRateSwitchingBehavior.values,
  );

  static final autoHdrSwitchingBehavior = EnumPreference(
    key: 'auto_hdr_switching_behavior',
    defaultValue: AutoHdrSwitchingBehavior.disabled,
    values: AutoHdrSwitchingBehavior.values,
  );

  static final preferExoPlayerFfmpeg = Preference(
    key: 'exoplayer_prefer_ffmpeg',
    defaultValue: !(PlatformDetection.isAndroid && PlatformDetection.isTV),
  );

  static final media3SkipSilence = Preference(
    key: 'media3_skip_silence',
    defaultValue: false,
  );

  static final media3TunnelingDisabled = Preference(
    key: 'media3_tunneling_disabled',
    defaultValue: true,
  );

  static final media3MapDolbyVisionProfile7ToHevc = Preference(
    key: 'media3_map_dolby_vision_profile7_to_hevc',
    defaultValue: false,
  );

  static final media3AllowExternalAudioEffects = Preference(
    key: 'media3_allow_external_audio_effects',
    defaultValue: true,
  );

  static final tunnelingFallbackDisabled = Preference(
    key: 'tunneling_fallback_disabled',
    defaultValue: false,
  );

  static final playerZoomMode = EnumPreference(
    key: 'player_zoom_mode',
    defaultValue: ZoomMode.fit,
    values: ZoomMode.values,
  );

  static final desktopScrollWheelAction = EnumPreference(
    key: 'desktop_scroll_wheel_action',
    defaultValue: DesktopScrollWheelAction.volume,
    values: DesktopScrollWheelAction.values,
  );

  static final trickPlayEnabled = Preference(
    key: 'trick_play_enabled',
    defaultValue: false,
  );

  static final pgsDirectPlay = Preference(
    key: 'pgs_enabled',
    defaultValue: true,
  );

  static final assDirectPlay = Preference(
    key: 'ass_enabled',
    defaultValue: true,
  );

  static final videoStartDelay = Preference(
    key: 'video_start_delay',
    defaultValue: 0,
  );
  static final audioOutputMode = EnumPreference(
    key: 'audio_output_mode',
    defaultValue: AudioOutputMode.auto,
    values: AudioOutputMode.values,
  );

  static final audioFallbackCodec = EnumPreference(
    key: 'audio_fallback_codec',
    defaultValue: AudioFallbackCodec.auto,
    values: AudioFallbackCodec.values,
  );

  static final audioPassthroughPreset = EnumPreference(
    key: 'pref_audio_passthrough_preset',
    defaultValue: AudioPassthroughPreset.auto,
    values: AudioPassthroughPreset.values,
  );

  /// One-time flag: existing installs that had their passthrough toggles
  /// auto-seeded by the old startup probe have been cleared back to "Auto"
  /// (tri-state follow-detection) where their stored value still matched the
  /// probe.
  static final audioPassthroughMigratedToAuto = Preference(
    key: 'pref_audio_passthrough_migrated_to_auto_v1',
    defaultValue: false,
  );

  static final maxAudioChannels = Preference<int>(
    key: 'pref_max_audio_channels',
    defaultValue: 0,
  );

  static final ac3PassthroughEnabled = Preference(
    key: 'pref_passthrough_ac3',
    defaultValue: false,
  );

  static final eac3PassthroughEnabled = Preference(
    key: 'pref_passthrough_eac3',
    defaultValue: false,
  );

  static final eac3JocPassthroughEnabled = Preference(
    key: 'pref_passthrough_eac3_joc',
    defaultValue: false,
  );

  static final dtsCorePassthroughEnabled = Preference(
    key: 'pref_passthrough_dts_core',
    defaultValue: false,
  );

  static final dtsHdPassthroughEnabled = Preference(
    key: 'pref_passthrough_dts_hd',
    defaultValue: false,
  );

  static final dtsXPassthroughEnabled = Preference(
    key: 'pref_passthrough_dts_x',
    defaultValue: false,
  );

  static final trueHdPassthroughEnabled = Preference(
    key: 'pref_passthrough_truehd',
    defaultValue: false,
  );

  static final trueHdAtmosPassthroughEnabled = Preference(
    key: 'pref_passthrough_truehd_atmos',
    defaultValue: false,
  );

  static final audioNightMode = Preference(
    key: 'audio_night_mode',
    defaultValue: false,
  );

  static final appleTvHybridAtmosEnabled = Preference(
    key: 'pref_appletv_hybrid_atmos',
    defaultValue: true,
  );

  static final appleTvAudioPassthroughEnabled = Preference(
    key: 'pref_appletv_audio_passthrough',
    defaultValue: false,
  );

  static final audioPrefsAutoDetected = Preference(
    key: 'pref_audio_caps_auto_detected',
    defaultValue: false,
  );

  static final audioPassthroughProbeSeeded = Preference(
    key: 'pref_audio_passthrough_probe_seeded_v1',
    defaultValue: false,
  );

  static final customMpvConfEnabled = Preference(
    key: 'custom_mpv_conf_enabled',
    defaultValue: false,
  );

  static final customMpvConfPath = Preference(
    key: 'custom_mpv_conf_path',
    defaultValue: '',
  );

  static final customMpvConfUnsafeAdvanced = Preference(
    key: 'custom_mpv_conf_unsafe_advanced',
    defaultValue: false,
  );

  static final hardwareDecoding = Preference(
    key: 'hardware_decoding',
    defaultValue: PlatformDetection.isAndroid || PlatformDetection.isIOS,
  );

  static final playbackEnginePreference = EnumPreference(
    key: 'playback_engine_preference',
    defaultValue: PlatformDetection.isAndroid && PlatformDetection.isTV
        ? PlaybackEnginePreference.media3
        : PlaybackEnginePreference.mpv,
    values: PlaybackEnginePreference.values,
  );

  static final dolbyVisionFallbackBehavior = EnumPreference(
    key: 'dolby_vision_fallback_behavior',
    defaultValue: DolbyVisionFallbackBehavior.ask,
    values: DolbyVisionFallbackBehavior.values,
  );

  static final dolbyVisionProfile7DirectPlayBehavior = EnumPreference(
    key: 'dolby_vision_profile7_direct_play_behavior',
    defaultValue: DolbyVisionProfile7DirectPlayBehavior.auto,
    values: DolbyVisionProfile7DirectPlayBehavior.values,
  );

  static final languageOverride = Preference<String>(
    key: 'pref_language_override',
    defaultValue: 'system',
  );

  static final defaultAudioLanguage = Preference(
    key: 'pref_audio_language',
    defaultValue: 'auto',
  );
  static final fallbackAudioLanguage = Preference<String>(
    key: 'pref_fallback_audio_language',
    defaultValue: '',
  );
  static final preferDefaultAudioTrack = Preference<bool>(
    key: 'pref_prefer_default_audio_track',
    defaultValue: false,
  );
  static final preferAudioDescription = Preference<bool>(
    key: 'pref_prefer_audio_description',
    defaultValue: false,
  );
  static final defaultSubtitleLanguage = Preference(
    key: 'pref_subtitle_language',
    defaultValue: '',
  );

  static final subtitlesBackgroundColor = Preference(
    key: 'subtitles_background_color',
    defaultValue: 0x00000000,
  );

  static final subtitlesTextWeight = Preference(
    key: 'subtitles_text_weight',
    defaultValue: 400,
  );

  static final subtitlesTextColor = Preference(
    key: 'subtitles_text_color',
    defaultValue: 0xFFFFFFFF,
  );

  static final subtitleTextStrokeColor = Preference(
    key: 'subtitles_text_stroke_color',
    defaultValue: 0xFF000000,
  );

  static final subtitlesTextSize = Preference(
    key: 'subtitles_text_size',
    defaultValue: 20.0,
  );

  static final subtitlesOffsetPosition = Preference(
    key: 'subtitles_offset_position',
    defaultValue: 0.04,
  );

  static final subtitleMode = EnumPreference(
    key: 'pref_subtitle_mode',
    defaultValue: SubtitleMode.flagged,
    values: SubtitleMode.values,
  );

  static final fallbackSubtitleLanguage = Preference(
    key: 'pref_fallback_subtitle_language',
    defaultValue: '',
  );

  /// Whether embedded subtitle styles (colours, positioning, fonts) should be
  /// applied when rendering text tracks. Disable to force the user's caption
  /// style preferences instead. Media3 (Android) only.
  static final subtitlesUseEmbeddedStyles = Preference(
    key: 'subtitles_use_embedded_styles',
    defaultValue: true,
  );

  /// Whether embedded subtitle font-size hints should be applied. Independent
  /// of [subtitlesUseEmbeddedStyles] so users can keep colours but override
  /// font sizes. Media3 (Android) only.
  static final subtitlesUseEmbeddedFontSizes = Preference(
    key: 'subtitles_use_embedded_font_sizes',
    defaultValue: true,
  );

  static final preferSdhSubtitles = Preference(
    key: 'prefer_sdh_subtitles',
    defaultValue: false,
  );

  static final mediaSegmentActions = Preference(
    key: 'media_segment_actions',
    defaultValue: 'intro:askToSkip,outro:askToSkip',
  );

  static final mediaSegmentCountdown = EnumPreference(
    key: 'pref_media_segment_countdown',
    defaultValue: MediaSegmentCountdown.both,
    values: MediaSegmentCountdown.values,
  );

  static final replaceSkipOutroWithNextUp = Preference(
    key: 'replace_skip_outro_with_next_up',
    defaultValue: false,
  );

  static final skipBackLength = Preference(
    key: 'skipBackLength',
    defaultValue: 10000,
  );

  // Restore the last audio queue when play arrives with nothing queued
  // (car head units, steering-wheel and Bluetooth play buttons).
  static final resumeLastQueueOnPlay = Preference(
    key: 'pref_resume_last_queue_on_play',
    defaultValue: true,
  );

  static final skipForwardLength = Preference(
    key: 'skipForwardLength',
    defaultValue: 30000,
  );

  static final unpauseRewindDuration = Preference(
    key: 'unpauseRewindDuration',
    defaultValue: 0,
  );

  static final audiobookDefaultSpeed = Preference(
    key: 'pref_audiobook_default_speed',
    defaultValue: 1.0,
  );

  static final audiobookSleepPresetMin = Preference(
    key: 'pref_audiobook_sleep_preset_min',
    defaultValue: 15,
  );

  static final audiobookExtendSleepTimer = Preference(
    key: 'pref_audiobook_extend_sleep_timer',
    defaultValue: false,
  );

  static final audiobookDrawerTab = Preference(
    key: 'pref_audiobook_drawer_tab',
    defaultValue: 'chapters',
  );

  static final showDescriptionOnPause = Preference(
    key: 'showDescriptionOnPause',
    defaultValue: false,
  );
  static final osdLockEnabled = Preference(
    key: 'osdLockEnabled',
    defaultValue: false,
  );
  static final mediaBarEnabled = Preference(
    key: 'mediaBarEnabled',
    defaultValue: true,
  );

  static final mediaBarMode = Preference(
    key: 'mediaBarMode',
    defaultValue: PlatformDetection.useMobileUi
        ? mediaBarModeGallery
        : mediaBarModeMoonfin,
  );

  static final mediaBarContentType = Preference(
    key: 'mediaBarContentType',
    defaultValue: 'both',
  );

  static final mediaBarItemCount = Preference(
    key: 'mediaBarItemCount',
    defaultValue: '10',
  );

  static final navbarOpacity = Preference(
    key: 'navbarOpacity',
    defaultValue: 50,
  );

  static final navbarColor = Preference(
    key: 'navbarColor',
    defaultValue: 'gray',
  );

  static final mediaBarOverlayOpacity = Preference(
    key: 'mediaBarOverlayOpacity',
    defaultValue: 50,
  );

  static final mediaBarOverlayColor = Preference(
    key: 'mediaBarOverlayColor',
    defaultValue: 'gray',
  );

  static final mediaBarAutoAdvance = Preference(
    key: 'mediaBarAutoAdvance',
    defaultValue: true,
  );

  static final mediaBarIntervalMs = Preference(
    key: 'mediaBarIntervalMs',
    defaultValue: 10000,
  );

  static final mediaBarTrailerPreview = Preference(
    key: 'mediaBarTrailerPreview',
    defaultValue: true,
  );

  static final mediaBarTrailerAudio = Preference(
    key: 'mediaBarTrailerAudio',
    defaultValue: false,
  );

  static final mediaBarLibraryIds = Preference(
    key: 'mediaBarLibraryIds',
    defaultValue: '',
  );

  static final mediaBarCollectionIds = Preference(
    key: 'mediaBarCollectionIds',
    defaultValue: '',
  );

  static final mediaBarExcludedGenres = Preference(
    key: 'mediaBarExcludedGenres',
    defaultValue: '',
  );

  static final episodePreviewEnabled = Preference(
    key: 'episodePreviewEnabled',
    defaultValue: false,
  );

  static final previewAudioEnabled = Preference(
    key: 'previewAudioEnabled',
    defaultValue: true,
  );
  static final homeRowsUniversalOverride = Preference(
    key: 'homeRowsUniversalOverride',
    defaultValue: false,
  );

  static final homeRowsUniversalImageType = EnumPreference(
    key: 'homeRowsUniversalImageType',
    defaultValue: ImageType.thumb,
    values: ImageType.values,
  );

  static EnumPreference<ImageType> homeRowImageType(
    HomeSectionType sectionType,
  ) => EnumPreference(
    key: 'homeRowImageType_${sectionType.serializedName}',
    defaultValue: _defaultHomeRowImageType(sectionType),
    values: ImageType.values,
  );

  static ImageType _defaultHomeRowImageType(HomeSectionType sectionType) {
    return switch (sectionType) {
      HomeSectionType.resume ||
      HomeSectionType.nextUp ||
      HomeSectionType.libraryTilesSmall => ImageType.banner,
      _ => ImageType.poster,
    };
  }

  static final detailsBackgroundBlurAmount = Preference(
    key: 'detailsBackgroundBlurAmount',
    defaultValue: 10,
  );

  static final browsingBackgroundBlurAmount = Preference(
    key: 'browsingBackgroundBlurAmount',
    defaultValue: 10,
  );
  static final enableAdditionalRatings = Preference(
    key: 'enableAdditionalRatings',
    defaultValue: false,
  );

  static final mdblistApiKey = Preference(
    key: 'mdblistApiKey',
    defaultValue: '',
  );

  static final enableEpisodeRatings = Preference(
    key: 'enableEpisodeRatings',
    defaultValue: false,
  );

  static final tmdbApiKey = Preference(key: 'tmdbApiKey', defaultValue: '');

  static final showRatingLabels = Preference(
    key: 'showRatingLabels',
    defaultValue: true,
  );

  static final showRatingBadges = Preference(
    key: 'showRatingBadges',
    defaultValue: true,
  );

  static final enabledRatings = Preference(
    key: 'enabledRatings',
    defaultValue: 'tomatoes,stars',
  );

  static final blockedParentalRatings = Preference(
    key: 'blocked_ratings',
    defaultValue: '',
  );

  static final homeSectionsJson = Preference(
    key: 'home_sections_config',
    defaultValue: '',
  );

  static final lastExternalRowsRefreshTime = Preference(
    key: 'last_external_rows_refresh_time',
    defaultValue: 0,
  );

  static final imdbTop250MoviesEnabled = Preference(
    key: 'imdb_top_250_movies_enabled',
    defaultValue: false,
  );

  static final imdbTop250TvShowsEnabled = Preference(
    key: 'imdb_top_250_tv_shows_enabled',
    defaultValue: false,
  );

  static final imdbMostPopularMoviesEnabled = Preference(
    key: 'imdb_most_popular_movies_enabled',
    defaultValue: false,
  );

  static final imdbMostPopularTvShowsEnabled = Preference(
    key: 'imdb_most_popular_tv_shows_enabled',
    defaultValue: false,
  );

  static final imdbLowestRatedMoviesEnabled = Preference(
    key: 'imdb_lowest_rated_movies_enabled',
    defaultValue: false,
  );

  static final imdbTopEnglishMoviesEnabled = Preference(
    key: 'imdb_top_english_movies_enabled',
    defaultValue: false,
  );

  static final tmdbPopularMoviesEnabled = Preference(
    key: 'tmdb_popular_movies_enabled',
    defaultValue: false,
  );

  static final tmdbTopRatedMoviesEnabled = Preference(
    key: 'tmdb_top_rated_movies_enabled',
    defaultValue: false,
  );

  static final tmdbNowPlayingMoviesEnabled = Preference(
    key: 'tmdb_now_playing_movies_enabled',
    defaultValue: false,
  );

  static final tmdbUpcomingMoviesEnabled = Preference(
    key: 'tmdb_upcoming_movies_enabled',
    defaultValue: false,
  );

  static final tmdbPopularTvEnabled = Preference(
    key: 'tmdb_popular_tv_enabled',
    defaultValue: false,
  );

  static final tmdbTopRatedTvEnabled = Preference(
    key: 'tmdb_top_rated_tv_enabled',
    defaultValue: false,
  );

  static final tmdbAiringTodayTvEnabled = Preference(
    key: 'tmdb_airing_today_tv_enabled',
    defaultValue: false,
  );

  static final tmdbOnTheAirTvEnabled = Preference(
    key: 'tmdb_on_the_air_tv_enabled',
    defaultValue: false,
  );

  static final tmdbTrendingMovieDailyEnabled = Preference(
    key: 'tmdb_trending_movie_daily_enabled',
    defaultValue: false,
  );

  static final tmdbTrendingMovieWeeklyEnabled = Preference(
    key: 'tmdb_trending_movie_weekly_enabled',
    defaultValue: false,
  );

  static final tmdbTrendingTvDailyEnabled = Preference(
    key: 'tmdb_trending_tv_daily_enabled',
    defaultValue: false,
  );

  static final tmdbTrendingTvWeeklyEnabled = Preference(
    key: 'tmdb_trending_tv_weekly_enabled',
    defaultValue: false,
  );

  static final tmdbTrendingAllWeeklyEnabled = Preference(
    key: 'tmdb_trending_all_weekly_enabled',
    defaultValue: false,
  );

  static final enableRadarrCalendar = Preference(
    key: 'enable_radarr_calendar',
    defaultValue: false,
  );

  static final enableSonarrCalendar = Preference(
    key: 'enable_sonarr_calendar',
    defaultValue: false,
  );

  static final radarrCalendarShowCinema = Preference(
    key: 'radarr_calendar_show_cinema',
    defaultValue: true,
  );

  static final radarrCalendarShowDigital = Preference(
    key: 'radarr_calendar_show_digital',
    defaultValue: true,
  );

  static final radarrCalendarShowPhysical = Preference(
    key: 'radarr_calendar_show_physical',
    defaultValue: true,
  );

  static final radarrCalendarShowDate = Preference(
    key: 'radarr_calendar_show_date',
    defaultValue: true,
  );

  static final sonarrCalendarShowDate = Preference(
    key: 'sonarr_calendar_show_date',
    defaultValue: true,
  );

  static final sonarrCalendarShowEpisodeInfo = Preference(
    key: 'sonarr_calendar_show_episode_info',
    defaultValue: true,
  );

  static final lastRadarrCalendarFetchTime = Preference(
    key: 'last_radarr_calendar_fetch_time',
    defaultValue: 0,
  );

  static final lastSonarrCalendarFetchTime = Preference(
    key: 'last_sonarr_calendar_fetch_time',
    defaultValue: 0,
  );

  static final mergeRadarrSonarrCalendars = Preference(
    key: 'merge_radarr_sonarr_calendars',
    defaultValue: false,
  );

  List<HomeSectionConfig> get homeSectionsConfig {
    final json = get(homeSectionsJson);
    return HomeSectionConfig.fromJsonString(json);
  }

  Future<void> setHomeSectionsConfig(List<HomeSectionConfig> configs) =>
      set(homeSectionsJson, HomeSectionConfig.toJsonString(configs));

  List<HomeSectionType> get activeHomeSections {
    final enabled = homeSectionsConfig.where((c) => c.enabled).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    return enabled
        .where((c) => c.isBuiltin && c.type != HomeSectionType.none)
        .map((c) => c.type)
        .toList();
  }

  /// Ordered list of all enabled section configs (builtin + plugin dynamic).
  /// Built-in `none` entries are filtered out.
  List<HomeSectionConfig> get activeHomeSectionConfigs {
    final enabled = homeSectionsConfig.where((c) => c.enabled).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    return enabled
        .where((c) => c.isPluginDynamic || c.type != HomeSectionType.none)
        .toList();
  }

  static final themeMusicEnabled = Preference(
    key: 'themeMusicEnabled',
    defaultValue: false,
  );

  static final themeMusicVolume = Preference(
    key: 'themeMusicVolume',
    defaultValue: 30,
  );

  // Desktop player volume (0-100), independent of the OS volume. Persisted so
  // playback resumes at the last level instead of jumping to max.
  static final playerVolume = Preference(
    key: 'player_volume',
    defaultValue: 100.0,
  );

  static final themeMusicOnHomeRows = Preference(
    key: 'themeMusicOnHomeRows',
    defaultValue: false,
  );
  static final themeMusicLoop = Preference(
    key: 'themeMusicLoop',
    defaultValue: true,
  );
  static final liveTvDirectPlayEnabled = Preference(
    key: 'pref_live_direct',
    defaultValue: true,
  );
  static final syncPlayEnabled = Preference(
    key: 'pref_syncplay_enabled',
    defaultValue: false,
  );

  static final syncPlayEnableSyncCorrection = Preference(
    key: 'syncplay_enable_sync_correction',
    defaultValue: true,
  );

  static final syncPlayUseSpeedToSync = Preference(
    key: 'syncplay_use_speed_to_sync',
    defaultValue: true,
  );

  static final syncPlayUseSkipToSync = Preference(
    key: 'syncplay_use_skip_to_sync',
    defaultValue: true,
  );

  static final syncPlayMinDelaySpeedToSync = Preference(
    key: 'syncplay_min_delay_speed_to_sync',
    defaultValue: 100.0,
  );

  static final syncPlayMaxDelaySpeedToSync = Preference(
    key: 'syncplay_max_delay_speed_to_sync',
    defaultValue: 5000.0,
  );

  static final syncPlaySpeedToSyncDuration = Preference(
    key: 'syncplay_speed_to_sync_duration',
    defaultValue: 1000.0,
  );

  static final syncPlayMinDelaySkipToSync = Preference(
    key: 'syncplay_min_delay_skip_to_sync',
    defaultValue: 2000.0,
  );

  static final syncPlayExtraTimeOffset = Preference(
    key: 'syncplay_extra_time_offset',
    defaultValue: 0.0,
  );
  static final pluginSyncEnabled = Preference(
    key: 'pref_plugin_sync_enabled',
    defaultValue: false,
  );

  static Preference<bool> pluginSyncInitializedForServer(String serverKey) =>
      Preference(
        key: 'pref_plugin_sync_initialized_$serverKey',
        defaultValue: false,
      );

  static final confirmExit = Preference(
    key: 'confirm_exit',
    defaultValue: true,
  );

  static final updateNotificationsEnabled = Preference(
    key: 'update_notifications_enabled',
    defaultValue: true,
  );

  static final seasonalSurprise = Preference(
    key: 'seasonal_surprise',
    defaultValue: 'none',
  );

  static final autoLoginUserBehavior = EnumPreference(
    key: 'pref_auto_login_behavior',
    defaultValue: UserSelectBehavior.lastUser,
    values: UserSelectBehavior.values,
  );

  static final autoLoginServerId = Preference(
    key: 'pref_auto_login_server_id',
    defaultValue: '',
  );

  static final autoLoginUserId = Preference(
    key: 'pref_auto_login_user_id',
    defaultValue: '',
  );

  static final lastServerId = Preference(
    key: 'pref_last_server_id',
    defaultValue: '',
  );

  static final lastUserId = Preference(
    key: 'pref_last_user_id',
    defaultValue: '',
  );

  static final alwaysAuthenticate = Preference(
    key: 'pref_always_authenticate',
    defaultValue: false,
  );
  static final userPinHash = Preference(key: 'user_pin_hash', defaultValue: '');

  static final userPinEnabled = Preference(
    key: 'user_pin_enabled',
    defaultValue: false,
  );

  static final liveTvChannelSortBy = EnumPreference(
    key: 'live_tv_channel_sort_by',
    defaultValue: ChannelSortBy.number,
    values: ChannelSortBy.values,
  );

  static EnumPreference<LibrarySortBy> librarySortBy(String libraryId) =>
      EnumPreference(
        key: 'library_sort_by_$libraryId',
        defaultValue: LibrarySortBy.name,
        values: LibrarySortBy.values,
      );

  static EnumPreference<SortDirection> librarySortDirection(String libraryId) =>
      EnumPreference(
        key: 'library_sort_dir_$libraryId',
        defaultValue: SortDirection.ascending,
        values: SortDirection.values,
      );

  static EnumPreference<PlayedStatusFilter> libraryPlayedFilter(
    String libraryId,
  ) => EnumPreference(
    key: 'library_played_filter_$libraryId',
    defaultValue: PlayedStatusFilter.all,
    values: PlayedStatusFilter.values,
  );

  static EnumPreference<SeriesStatusFilter> librarySeriesFilter(
    String libraryId,
  ) => EnumPreference(
    key: 'library_series_filter_$libraryId',
    defaultValue: SeriesStatusFilter.all,
    values: SeriesStatusFilter.values,
  );

  static Preference<bool> libraryFavoriteFilter(String libraryId) =>
      Preference(key: 'library_fav_filter_$libraryId', defaultValue: false);

  static EnumPreference<ImageType> libraryImageType(String libraryId) =>
      EnumPreference(
        key: 'library_image_type_$libraryId',
        defaultValue: ImageType.poster,
        values: ImageType.values,
      );

  static final allGenresImageType = EnumPreference(
    key: 'all_genres_image_type',
    defaultValue: ImageType.thumb,
    values: ImageType.values,
  );

  static EnumPreference<FavoriteTypeFilter> favoriteTypeFilter = EnumPreference(
    key: 'favorites_type_filter',
    defaultValue: FavoriteTypeFilter.all,
    values: FavoriteTypeFilter.values,
  );

  static final defaultFavoritesFilter = Preference(
    key: 'defaultFavoritesFilter',
    defaultValue: '',
  );

  static final seerrEnabled = Preference(
    key: 'seerr_enabled',
    defaultValue: false,
  );

  static final seerrBlockNsfw = Preference(
    key: 'seerrBlockNsfw',
    defaultValue: false,
  );

  static final defaultDownloadQuality = Preference(
    key: 'download_default_quality',
    defaultValue: 'original',
  );

  static final downloadWifiOnly = Preference(
    key: 'download_wifi_only',
    defaultValue: false,
  );

  static final downloadStorageLimitMb = Preference(
    key: 'download_storage_limit_mb',
    defaultValue: 0,
  );

  static final downloadConcurrentCount = Preference(
    key: 'download_concurrent_count',
    defaultValue: 2,
  );

  static final customDownloadPath = Preference(
    key: 'download_custom_path',
    defaultValue: '',
  );

  // macOS only: base64 security-scoped bookmark for the custom download folder,
  // so the sandboxed app can regain write access to it across launches.
  static final customDownloadPathBookmark = Preference(
    key: 'download_custom_path_bookmark',
    defaultValue: '',
  );

  static final windowWidth = Preference(key: 'window_width', defaultValue: 0.0);

  static final windowHeight = Preference(
    key: 'window_height',
    defaultValue: 0.0,
  );

  static final windowX = Preference(key: 'window_x', defaultValue: 0.0);

  static final windowY = Preference(key: 'window_y', defaultValue: 0.0);

  static final windowFullscreen = Preference(
    key: 'window_fullscreen',
    defaultValue: false,
  );

  static final syncPlayAdvancedCorrectionEnabled = Preference(
    key: 'syncplay_advanced_correction_enabled',
    defaultValue: true,
  );

  static final displayAudioLatest = Preference(
    key: 'pref_audio_display_latest',
    defaultValue: true,
  );

  static final displayAudioLastPlayed = Preference(
    key: 'pref_audio_display_last_played',
    defaultValue: true,
  );

  static final displayAudioFavorites = Preference(
    key: 'pref_audio_display_favorites',
    defaultValue: true,
  );

  static final displayAudioPlaylists = Preference(
    key: 'pref_audio_display_playlists',
    defaultValue: true,
  );

  static final displayAudioAlbumArtists = Preference(
    key: 'pref_audio_display_album_artists',
    defaultValue: true,
  );

  static final displayAudioArtists = Preference(
    key: 'pref_audio_display_artists',
    defaultValue: true,
  );

  static final displayAudioAlbums = Preference(
    key: 'pref_audio_display_albums',
    defaultValue: true,
  );

  static final audioSortOption = Preference<String>(
    key: 'pref_audio_sort_option',
    defaultValue: 'name',
  );

  static final personPageSortOption = Preference<String>(
    key: 'pref_person_page_sort_option',
    defaultValue: 'alphabetical',
  );

  static final personPageGroupItems = Preference<bool>(
    key: 'pref_person_page_group_items',
    defaultValue: false,
  );

  String getSeriesSubtitleLanguage(String seriesId) {
    final pref = Preference(
      key: 'pref_series_subtitle_lang_$seriesId',
      defaultValue: '',
    );
    return _store.get(pref);
  }

  Future<void> setSeriesSubtitleLanguage(String seriesId, String language) async {
    final pref = Preference(
      key: 'pref_series_subtitle_lang_$seriesId',
      defaultValue: '',
    );
    await _store.set(pref, language);
    notifyListeners();
  }

  int getItemSubtitleStreamIndex(String itemId) {
    final pref = Preference<int>(
      key: 'pref_item_subtitle_index_$itemId',
      defaultValue: -2,
    );
    return _store.get(pref);
  }

  Future<void> setItemSubtitleStreamIndex(String itemId, int? index) async {
    final pref = Preference<int>(
      key: 'pref_item_subtitle_index_$itemId',
      defaultValue: -2,
    );
    if (index == null) {
      await _store.delete(pref);
    } else {
      await _store.set(pref, index);
    }
    notifyListeners();
  }

  int getItemAudioStreamIndex(String itemId) {
    final pref = Preference<int>(
      key: 'pref_item_audio_index_$itemId',
      defaultValue: -2,
    );
    return _store.get(pref);
  }

  Future<void> setItemAudioStreamIndex(String itemId, int? index) async {
    final pref = Preference<int>(
      key: 'pref_item_audio_index_$itemId',
      defaultValue: -2,
    );
    if (index == null) {
      await _store.delete(pref);
    } else {
      await _store.set(pref, index);
    }
    notifyListeners();
  }

  static final hiddenContinueWatchingItems = Preference<String>(
    key: 'hidden_continue_watching_items',
    defaultValue: '{}',
  );

  static final hiddenNextUpSeries = Preference<String>(
    key: 'hidden_next_up_series',
    defaultValue: '{}',
  );

  Map<String, String> getHiddenContinueWatchingItems() {
    try {
      final jsonStr = get(hiddenContinueWatchingItems);
      final map = jsonDecode(jsonStr) as Map;
      return map.cast<String, String>();
    } catch (_) {
      return {};
    }
  }

  Future<void> hideFromContinueWatching(String id) async {
    final items = getHiddenContinueWatchingItems();
    items[id] = DateTime.now().toUtc().toIso8601String();
    await set(hiddenContinueWatchingItems, jsonEncode(items));
  }

  Future<void> unhideFromContinueWatching(String id) async {
    final items = getHiddenContinueWatchingItems();
    if (items.remove(id) != null) {
      await set(hiddenContinueWatchingItems, jsonEncode(items));
    }
  }

  Map<String, String> getHiddenNextUpSeries() {
    try {
      final jsonStr = get(hiddenNextUpSeries);
      final map = jsonDecode(jsonStr) as Map;
      return map.cast<String, String>();
    } catch (_) {
      return {};
    }
  }

  Future<void> hideFromNextUp(String seriesId) async {
    final series = getHiddenNextUpSeries();
    series[seriesId] = DateTime.now().toUtc().toIso8601String();
    await set(hiddenNextUpSeries, jsonEncode(series));
  }

  Future<void> unhideFromNextUp(String seriesId) async {
    final series = getHiddenNextUpSeries();
    if (series.remove(seriesId) != null) {
      await set(hiddenNextUpSeries, jsonEncode(series));
    }
  }

  List<AggregatedItem> filterContinueWatching(List<AggregatedItem> items) {
    final hidden = getHiddenContinueWatchingItems();
    if (hidden.isEmpty) return items;

    final toRemove = <String>{};
    final result = <AggregatedItem>[];

    for (final item in items) {
      final id = item.id;
      final seriesId = item.seriesId;

      String? matchedKey;
      if (hidden.containsKey(id)) {
        matchedKey = id;
      } else if (seriesId != null && hidden.containsKey(seriesId)) {
        matchedKey = seriesId;
      }

      if (matchedKey != null) {
        final lastPlayedStr = item.rawData['UserData']?['LastPlayedDate'] as String?;
        if (lastPlayedStr != null && lastPlayedStr.isNotEmpty) {
          final lastPlayed = DateTime.tryParse(lastPlayedStr);
          final hiddenAt = DateTime.tryParse(hidden[matchedKey]!);
          if (lastPlayed != null && hiddenAt != null && lastPlayed.isAfter(hiddenAt)) {
            toRemove.add(matchedKey);
            result.add(item);
            continue;
          }
        }
        continue;
      }
      result.add(item);
    }

    if (toRemove.isNotEmpty) {
      unawaited(() async {
        final current = getHiddenContinueWatchingItems();
        var changed = false;
        for (final k in toRemove) {
          if (current.remove(k) != null) {
            changed = true;
          }
        }
        if (changed) {
          await set(hiddenContinueWatchingItems, jsonEncode(current));
        }
      }());
    }

    return result;
  }

  List<AggregatedItem> filterNextUp(List<AggregatedItem> items) {
    final hidden = getHiddenNextUpSeries();
    if (hidden.isEmpty) return items;

    final toRemove = <String>{};
    final result = <AggregatedItem>[];

    for (final item in items) {
      final seriesId = item.seriesId;

      if (seriesId != null && hidden.containsKey(seriesId)) {
        final lastPlayedStr = item.rawData['UserData']?['LastPlayedDate'] as String?;
        if (lastPlayedStr != null && lastPlayedStr.isNotEmpty) {
          final lastPlayed = DateTime.tryParse(lastPlayedStr);
          final hiddenAt = DateTime.tryParse(hidden[seriesId]!);
          if (lastPlayed != null && hiddenAt != null && lastPlayed.isAfter(hiddenAt)) {
            toRemove.add(seriesId);
            result.add(item);
            continue;
          }
        }
        continue;
      }
      result.add(item);
    }

    if (toRemove.isNotEmpty) {
      unawaited(() async {
        final current = getHiddenNextUpSeries();
        var changed = false;
        for (final k in toRemove) {
          if (current.remove(k) != null) {
            changed = true;
          }
        }
        if (changed) {
          await set(hiddenNextUpSeries, jsonEncode(current));
        }
      }());
    }

    return result;
  }
}

