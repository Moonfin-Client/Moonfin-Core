import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../data/models/aggregated_item.dart';
import '../data/models/series_track_preference.dart';
import '../playback/audio_capability_profile.dart';
import '../util/device_performance.dart';
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
  static const mediaBarModeAya = 'aya';
  static const mediaBarModeOff = 'off';
  static const mediaBarModeValues = <String>{
    mediaBarModeMoonfin,
    mediaBarModeMakd,
    mediaBarModeBookshelf,
    mediaBarModeGallery,
    mediaBarModeBanner,
    mediaBarModeAya,
    mediaBarModeOff,
  };

  // Where the bar draws its titles from. Every source still passes through the
  // library, collection, content type and genre filters, and still picks its
  // slides at random out of what comes back.
  static const mediaBarSourceRandom = 'random';
  static const mediaBarSourceRecentlyAdded = 'recentlyAdded';
  static const mediaBarSourceRecentlyReleased = 'recentlyReleased';

  final PreferenceStore _store;

  UserPreferences(this._store) {
    _adoptNewlyScopedPreferences();
    _repairMediaBarContentType();
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
      final value = _store.get(
        Preference(key: legacyBlockNsfw, defaultValue: false),
      );
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
        final disabled = SeerrRowConfig.fromJsonString(
          _store.getString(key) ?? '',
        ).map((c) => c.copyWith(enabled: false)).toList();
        _store.setString(key, SeerrRowConfig.toJsonString(disabled));
      }
    }

    _store.remove(legacyKey);
  }

  // Navbar colour and opacity once inherited their values from the media bar overlay
  // settings. That carry-over is gone on purpose.
  //
  // Both preferences are stored per server and user. The old code wrote the bare keys while
  // reads went through the scoped ones, so for anyone signed in it quietly did nothing for
  // several releases. Routing it through the scoped keys woke it up, and because a scoped
  // value is missing for every server and user the app hasn't seen yet, it re-ran on each
  // new one and stamped the media bar's colour and opacity onto a navbar the user had
  // already styled. The result was then pushed to the plugin and handed to every other
  // client. There is no way to carry the old values across now that reads are scoped, so
  // the navbar simply keeps its own defaults.

  // A preference that moves to per server storage leaves its old value under the bare key,
  // where nothing reads it any more, so the setting looks like it was reset. Hand that value
  // to the server the user is on and drop the bare key, which leaves any other server to
  // start from its own defaults rather than inheriting a choice made for a different one.
  void _adoptNewlyScopedPreferences() {
    final suffix = _activeProfileScopeSuffix();
    if (suffix == null) return;

    for (final key in _scopedPreferenceKeys) {
      if (!_store.containsKey(key)) continue;

      final scopedKey = '${key}_$suffix';
      if (!_store.containsKey(scopedKey)) {
        _copyStoredValue(key, scopedKey);
      }
      _store.remove(key);
    }
  }

  // The store is typed per getter and doesn't record which type a key holds, so each one is
  // tried in turn. Reading a key as the wrong type throws on some platforms.
  void _copyStoredValue(String from, String to) {
    try {
      final asBool = _store.getBool(from);
      if (asBool != null) {
        _store.setBool(to, asBool);
        return;
      }
    } catch (_) {}

    try {
      final asInt = _store.getInt(from);
      if (asInt != null) {
        _store.setInt(to, asInt);
        return;
      }
    } catch (_) {}

    try {
      final asString = _store.getString(from);
      if (asString != null) _store.setString(to, asString);
    } catch (_) {}
  }

  // Media bar item types and media bar source once shared a key with other clients, so a
  // source of "library" could land in the item type preference. The picker never offered
  // that value, so it showed as a selection the user could look at but not choose again.
  // Put any such value back to a real one, across every stored scope.
  void _repairMediaBarContentType() {
    for (final key in _store.keys.toList()) {
      if (key != mediaBarContentType.key &&
          !key.startsWith('${mediaBarContentType.key}_')) {
        continue;
      }
      final stored = _store.getString(key);
      if (stored == null || mediaBarContentTypeValues.contains(stored)) {
        continue;
      }
      _store.setString(key, normalizeMediaBarContentType(stored));
    }
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
    if (!ui.PlatformDispatcher.instance.alwaysUse24HourFormat) return;

    // This preference is stored per server and user, so the seed has to go through the
    // effective key. Writing the bare key put the value somewhere nothing reads it.
    final effective = getEffectivePreference(use24HourClock);
    if (_store.containsKey(effective.key)) return;
    _store.set(effective, true);
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
    final sysIso3 = toIso3Language(
      normalizeLanguage(ui.PlatformDispatcher.instance.locale.languageCode),
    );

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
    // Newly synced settings. Anything that goes to the server profile has to be stored
    // per server and user, or one server's value is read back on the next.
    'all_genres_image_type',
    'ass_enabled',
    'audio_night_mode',
    'confirm_exit',
    'defaultFavoritesFilter',
    'detailButtonOrderDesktop',
    'detailButtonOrderMobile',
    'detailButtonOrderTv',
    'download_default_quality',
    'download_report_as_activity',
    'download_storage_limit_mb',
    'download_wifi_only',
    'hiddenDetailButtonsDesktop',
    'hiddenDetailButtonsMobile',
    'hiddenDetailButtonsTv',
    'hiddenOsdButtonsDesktop',
    'hiddenOsdButtonsMobile',
    'hiddenOsdButtonsTv',
    'imdb_lowest_rated_movies_enabled',
    'imdb_most_popular_movies_enabled',
    'imdb_most_popular_tv_shows_enabled',
    'imdb_top_250_movies_enabled',
    'imdb_top_250_tv_shows_enabled',
    'imdb_top_english_movies_enabled',
    'live_tv_channel_sort_by',
    'music_playback_time_display',
    'osdButtonOrderDesktop',
    'osdButtonOrderMobile',
    'osdButtonOrderTv',
    'osdLockEnabled',
    'pgs_enabled',
    'playback_time_above_center',
    'playback_time_above_left',
    'playback_time_above_right',
    'playback_time_below_center',
    'playback_time_below_left',
    'playback_time_below_right',
    'playerSwipeGestures',
    'player_zoom_mode',
    'pref_audio_rows_sort_by',
    'pref_audio_rows_sort_order',
    'pref_crash_reports_enabled',
    'pref_diagnostic_logging_enabled',
    'pref_display_studios_rows',
    'pref_epg_mobile_view',
    'pref_favorites_view_style',
    'pref_group_items_into_collections',
    'pref_home_row_info_overlay',
    'pref_interface_style',
    'pref_live_direct',
    'pref_max_bitrate',
    'pref_max_video_resolution',
    'pref_playlists_row_show_episodes',
    'pref_playlists_row_sort_by',
    'pref_playlists_row_sort_order',
    'pref_recommendations_apply_parental_rating_cap',
    'pref_resume_last_queue_on_play',
    'pref_screensaver_clock_mode',
    'pref_screensaver_dimming',
    'pref_screensaver_enabled',
    'pref_screensaver_max_age_rating',
    'pref_screensaver_mode',
    'pref_screensaver_require_rating',
    'pref_screensaver_timeout',
    'pref_studios_row_selected_ids',
    'pref_studios_row_sort_by',
    'pref_studios_row_sort_order',
    'pref_syncplay_enabled',
    'showDescriptionOnPause',
    'since_you_watched_1_enabled',
    'since_you_watched_2_enabled',
    'since_you_watched_3_enabled',
    'since_you_watched_4_enabled',
    'since_you_watched_5_enabled',
    'skipBackLength',
    'skipForwardLength',
    'syncplay_advanced_correction_enabled',
    'syncplay_enable_sync_correction',
    'syncplay_extra_time_offset',
    'syncplay_max_delay_speed_to_sync',
    'syncplay_min_delay_skip_to_sync',
    'syncplay_min_delay_speed_to_sync',
    'syncplay_speed_to_sync_duration',
    'syncplay_use_skip_to_sync',
    'syncplay_use_speed_to_sync',
    'unpauseRewindDuration',
    'update_notifications_enabled',
    'video_start_delay',
    // These sync to the server profile, which is per server and per user, so they have
    // to be scoped as well. While they were not, a value set on one server was read
    // back on the next one the user signed in to and then pushed into its profile.
    'hidden_continue_watching_items',
    'hidden_next_up_series',
    'pref_recommendation_system_source',
    'pref_detail_screen_style',
    'pref_detail_expanded_tabs',
    'pref_detail_show_technical_details',
    'pref_detail_trailers_external',
    'pref_hide_details_media_description',
    'pref_detail_use_series_thumbnails',
    'pref_hide_home_media_description',
    'pref_display_audio_rows',
    'pref_display_since_you_watched_rows',
    'pref_since_you_watched_source',
    'pref_since_you_watched_source_type',
    'pref_since_you_watched_source_item',
    'pref_since_you_watched_include_watched',
    'pref_display_playlists_rows',
    'pref_display_rewatch_row',
    'pref_rewatch_sort_by',
    'pref_rewatch_include_movies',
    'pref_rewatch_include_shows',
    'pref_rewatch_include_collections',
    'seerr_enabled',
    'pref_enable_tv_queuing',
    'pref_enable_cinema_mode',
    'pref_enable_cinema_mode_episodes',
    'pref_resume_preroll',
    'media_segment_actions',
    'pref_autoplay_next_episode',
    'next_up_behavior',
    'next_up_timeout',
    'replace_skip_outro_with_next_up',
    'enable_still_watching',
    'pref_language_override',
    'pref_media_segment_countdown',
    'pref_media_segment_auto_hide',
    'pref_desktop_scroll_sensitivity',
    'pref_desktop_ui_scale',
    'poster_size_library',
    'poster_size_playlist',
    'pref_home_rows_fullscreen',
    'pref_show_seerr_button',
    'pref_show_server_messages_button',
    'pref_show_media_details_on_library_page',
    'pref_use_detailed_sub_headings',
    'pref_hide_backdrops_in_libraries',
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
    'subtitles_hdr_separate',
    'subtitles_hdr_background_color',
    'subtitles_hdr_text_weight',
    'subtitles_hdr_text_color',
    'subtitles_hdr_text_stroke_color',
    'subtitles_hdr_text_size',
    'subtitles_hdr_offset_position',
    'subtitles_use_embedded_styles',
    'subtitles_use_embedded_font_sizes',
    'prefer_sdh_subtitles',
    'app_theme_id',
    'pref_custom_theme_id',
    'pref_glass_quality',
    'pref_oled_mode',
    'pref_navbar_position',
    'focus_color',
    'pref_watched_indicator_behavior',
    'pref_card_focus_expansion',
    'pref_home_rows_style',
    'pref_modern_home_rows_padding',
    'pref_classic_home_rows_padding',
    'poster_size',
    'pref_display_favorites_rows',
    'pref_display_collections_rows',
    'pref_display_genres_rows',
    'pref_favorites_row_sort_by',
    'pref_favorites_row_sort_order',
    'pref_collections_row_show_episodes',
    'pref_collections_row_sort_by',
    'pref_collections_row_sort_order',
    'pref_genres_row_sort_by',
    'pref_genres_row_sort_order',
    'pref_genres_row_item_filter',
    'pref_show_shuffle_button',
    'pref_show_genres_button',
    'pref_show_favorites_button',
    'pref_show_syncplay_button',
    'pref_show_libraries_in_toolbar',
    'pref_navbar_always_expanded',
    'pref_shuffle_content_type',
    'pref_merge_continue_watching_next_up',
    'pref_next_up_max_days',
    'enable_multi_server_libraries',
    'pref_merge_recent_rows_by_type',
    'enable_folder_view',
    'seasonal_surprise',
    'mediaBarEnabled',
    'mediaBarMode',
    'mediaBarContentType',
    'mediaBarSourceType',
    'mediaBarItemCount',
    'mediaBarOverlayOpacity',
    'mediaBarOverlayColor',
    'navbarOpacity',
    'navbarColor',
    'mediaBarAutoAdvance',
    'mediaBarIntervalMs',
    'mediaBarTrailerPreview',
    'mediaBarTrailerAudio',
    'mediaBarTrailerCaptions',
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
    'pref_media_type_badge_behavior',
    'pref_show_backdrop',
    'detailsBackgroundBlurAmount',
    'browsingBackgroundBlurAmount',
    'enableAdditionalRatings',
    'mdblistApiKey',
    'showRatingLabels',
    'showRatingBadges',
    'enableEpisodeRatings',
    'pref_personal_rating_style',
    'tmdbApiKey',
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
    'recently_released_series_type',
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
      } else if (prevMode == SubtitleMode.none &&
          !containsPreference(defaultSubtitleLanguage, scopedOnly: true)) {
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

  bool isRatingSourceEnabled(String source) =>
      get(enabledRatings).split(',').map((s) => s.trim()).contains(source);

  bool get canFetchEpisodeRatings =>
      get(enableAdditionalRatings) &&
      get(enableEpisodeRatings) &&
      isRatingSourceEnabled('tmdb');

  /// What this device can afford, taking the user's choice over the probe.
  DevicePerformanceTier resolveDevicePerformanceTier() =>
      resolveDevicePerformanceTierFor(
        get(performanceMode),
        PlatformDetection.deviceMemory,
      );

  /// Whether a media bar trailer may play here. A device on the reduced tier
  /// keeps the still image, because the decoder is what takes it down.
  bool resolveMediaBarTrailerPreview() => inlinePreviewAllowed(
    userEnabled: get(mediaBarTrailerPreview),
    tier: resolveDevicePerformanceTier(),
  );

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
        )
      : const AudioCapabilityProfile.optimistic();

  // Mode-aware passthrough resolution. Disabled bitstreams nothing, auto
  // follows the detected hardware capability, and manual follows the stored
  // toggles. Callers may pass a profile they already built, and when omitted
  // the live detected profile is used.
  bool _resolvePassthrough(
    Preference<bool> pref,
    bool Function(AudioCapabilityProfile) capabilityOf,
    AudioCapabilityProfile? profile,
  ) {
    switch (get(audioPassthroughMode)) {
      case AudioPassthroughMode.disabled:
        return false;
      case AudioPassthroughMode.auto:
        return capabilityOf(profile ?? detectedAudioCapabilities);
      case AudioPassthroughMode.manual:
        return get(pref);
    }
  }

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

  bool resolveDtsCorePassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        dtsCorePassthroughEnabled,
        (p) => p.canPassthroughDts,
        profile,
      );

  /// DTS-HD rides on a DTS core stream, so bitstreaming it also requires the
  /// core toggle in manual mode (and core capability in auto).
  bool resolveDtsHdPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      resolveDtsCorePassthroughEnabled(profile) &&
      _resolvePassthrough(
        dtsHdPassthroughEnabled,
        (p) => p.canPassthroughDtsHd,
        profile,
      );

  bool resolveTrueHdPassthroughEnabled([AudioCapabilityProfile? profile]) =>
      _resolvePassthrough(
        trueHdPassthroughEnabled,
        (p) => p.canPassthroughTrueHd,
        profile,
      );

  /// The effective passthrough codec set for the current mode, in wire form
  /// for the native player and the mpv spdif synthesis.
  Set<PassthroughCodec> resolvedPassthroughCodecs([
    AudioCapabilityProfile? profile,
  ]) {
    // Resolved once so the five resolvers below don't each rebuild it.
    final capabilities = profile ?? detectedAudioCapabilities;
    return <PassthroughCodec>{
      if (resolveAc3PassthroughEnabled(capabilities)) PassthroughCodec.ac3,
      if (resolveEac3PassthroughEnabled(capabilities)) PassthroughCodec.eac3,
      if (resolveDtsCorePassthroughEnabled(capabilities))
        PassthroughCodec.dtsCore,
      if (resolveDtsHdPassthroughEnabled(capabilities)) PassthroughCodec.dtsHd,
      if (resolveTrueHdPassthroughEnabled(capabilities))
        PassthroughCodec.trueHd,
    };
  }

  /// The five per-codec passthrough toggle preferences.
  static List<Preference<bool>> get passthroughTogglePreferences =>
      <Preference<bool>>[
        ac3PassthroughEnabled,
        eac3PassthroughEnabled,
        dtsCorePassthroughEnabled,
        dtsHdPassthroughEnabled,
        trueHdPassthroughEnabled,
      ];

  /// Switches the passthrough mode. Entering manual seeds any toggle that was
  /// never written from the detected capability, so the switches start out
  /// showing what the hardware can actually do instead of a wall of "off".
  Future<void> setAudioPassthroughMode(AudioPassthroughMode mode) async {
    await set(audioPassthroughMode, mode);
    if (mode == AudioPassthroughMode.manual) {
      await seedAbsentPassthroughToggles();
    }
  }

  /// Writes the detected capability into each toggle that has no stored value.
  /// Idempotent: existing values are never touched, so it is safe to run again
  /// after a late hardware probe.
  Future<void> seedAbsentPassthroughToggles() async {
    final profile = detectedAudioCapabilities;
    Future<void> seed(Preference<bool> pref, bool value) async {
      if (!containsPreference(pref)) await set(pref, value);
    }

    await seed(ac3PassthroughEnabled, profile.canPassthroughAc3);
    await seed(eac3PassthroughEnabled, profile.canPassthroughEac3);
    await seed(dtsCorePassthroughEnabled, profile.canPassthroughDts);
    await seed(dtsHdPassthroughEnabled, profile.canPassthroughDtsHd);
    await seed(trueHdPassthroughEnabled, profile.canPassthroughTrueHd);
  }

  /// Clears every per-codec passthrough toggle back to unwritten, so the next
  /// entry into manual mode reseeds them from detection.
  Future<void> clearPassthroughOverrides() async {
    for (final pref in passthroughTogglePreferences) {
      await removePreference(pref);
    }
  }

  void notifyPreferenceChanged() {
    notifyListeners();
  }

  bool _notificationsSuppressed = false;
  bool _notificationPending = false;

  @override
  void notifyListeners() {
    if (_notificationsSuppressed) {
      _notificationPending = true;
      return;
    }
    super.notifyListeners();
  }

  /// Runs [action] with listener notifications held back, then emits a single
  /// notification if any write fired during it. Lets the settings sync apply
  /// a whole profile without notifying every listener once per key.
  Future<T> batchNotifications<T>(Future<T> Function() action) async {
    if (_notificationsSuppressed) return action();
    _notificationsSuppressed = true;
    try {
      return await action();
    } finally {
      _notificationsSuppressed = false;
      if (_notificationPending) {
        _notificationPending = false;
        super.notifyListeners();
      }
    }
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

  /// Item types the media bar can show.
  ///
  /// Separate from where it draws items, which other clients call the source type. The two
  /// once shared a key, so a source of "library" could arrive here and sit in the picker as
  /// a value it never offered.
  static const mediaBarContentTypeBoth = 'both';
  static const mediaBarContentTypeMovies = 'movies';
  static const mediaBarContentTypeTvShows = 'tvshows';
  static const mediaBarContentTypeValues = <String>{
    mediaBarContentTypeBoth,
    mediaBarContentTypeMovies,
    mediaBarContentTypeTvShows,
  };

  static String normalizeMediaBarContentType(String? contentType) {
    final normalized = (contentType ?? '').trim().toLowerCase();
    if (mediaBarContentTypeValues.contains(normalized)) {
      return normalized;
    }
    return mediaBarContentTypeBoth;
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
    defaultValue: PlatformDetection.useMobileUi
        ? HomeRowsStyle.v1
        : HomeRowsStyle.v2,
    values: HomeRowsStyle.values,
  );

  static final fullScreenRows = Preference(
    key: 'pref_home_rows_fullscreen',
    defaultValue: false,
  );

  static final modernHomeRowsPadding = Preference<int>(
    key: 'pref_modern_home_rows_padding',
    defaultValue: 460,
  );

  static final classicHomeRowsPadding = Preference<int>(
    key: 'pref_classic_home_rows_padding',
    defaultValue: 30,
  );

  /// How far a mouse wheel notch scrolls, as a percentage of what the platform
  /// reports.
  static final desktopScrollSensitivity = Preference(
    key: 'pref_desktop_scroll_sensitivity',
    defaultValue: 100,
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

  /// Plays retro games through the native libretro backend instead of the
  /// EmulatorJS WebView, on platforms that have both. Deliberately not synced:
  /// the right backend is a per-device choice.
  static final useNativeEmulator = Preference(
    key: 'pref_use_native_emulator',
    defaultValue: true,
  );

  static final seriesThumbnailsEnabled = Preference(
    key: 'pref_enable_series_thumbnails',
    defaultValue: false,
  );

  static final mediaTypeBadgeBehavior = EnumPreference(
    key: 'pref_media_type_badge_behavior',
    defaultValue: MediaTypeBadgeBehavior.always,
    values: MediaTypeBadgeBehavior.values,
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

  static final displayStudiosRows = Preference(
    key: 'pref_display_studios_rows',
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
    defaultValue: true,
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
    defaultValue: true,
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

  static final favoritesRowSortOrder = EnumPreference(
    key: 'pref_favorites_row_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final collectionsRowSortBy = EnumPreference(
    key: 'pref_collections_row_sort_by',
    defaultValue: LibrarySortBy.playlistOrder,
    values: LibrarySortBy.values,
  );

  static final collectionsRowSortOrder = EnumPreference(
    key: 'pref_collections_row_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final collectionsRowShowEpisodes = Preference(
    key: 'pref_collections_row_show_episodes',
    defaultValue: false,
  );

  static final genresRowSortBy = EnumPreference(
    key: 'pref_genres_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final genresRowSortOrder = EnumPreference(
    key: 'pref_genres_row_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final playlistsRowSortBy = EnumPreference(
    key: 'pref_playlists_row_sort_by',
    defaultValue: LibrarySortBy.playlistOrder,
    values: LibrarySortBy.values,
  );

  static final playlistsRowSortOrder = EnumPreference(
    key: 'pref_playlists_row_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final playlistsRowShowEpisodes = Preference(
    key: 'pref_playlists_row_show_episodes',
    defaultValue: false,
  );

  static final audioRowsSortBy = EnumPreference(
    key: 'pref_audio_rows_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final audioRowsSortOrder = EnumPreference(
    key: 'pref_audio_rows_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final studiosRowSortBy = EnumPreference(
    key: 'pref_studios_row_sort_by',
    defaultValue: LibrarySortBy.name,
    values: LibrarySortBy.values,
  );

  static final studiosRowSortOrder = EnumPreference(
    key: 'pref_studios_row_sort_order',
    defaultValue: SortDirection.ascending,
    values: SortDirection.values,
  );

  static final studiosRowSelectedIds = Preference<String>(
    key: 'pref_studios_row_selected_ids',
    defaultValue: '',
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

  // Zero means no limit. The 365 days match what the other Moonfin clients and
  // Jellyfin's own web client already default to.
  static final nextUpMaxDays = Preference(
    key: 'pref_next_up_max_days',
    defaultValue: 365,
  );

  static final focusColor = EnumPreference(
    key: 'focus_color',
    defaultValue: AppTheme.white,
    values: AppTheme.values,
  );

  static final preferSystemImeKeyboard = Preference(
    key: 'pref_prefer_system_ime_keyboard',
    defaultValue:
        PlatformDetection.useMobileUi ||
        PlatformDetection.isDesktop ||
        PlatformDetection.isAppleTV,
  );

  /// Whether a game controller drives the app UI. Off by default. Games take
  /// the pad for themselves either way. Belongs to the device rather than the
  /// account, like [useExternalPlayer], so it's neither synced nor stored per
  /// server.
  static final gamepadNavigationEnabled = Preference(
    key: 'pref_gamepad_navigation_enabled',
    defaultValue: false,
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

  static final interfaceLayout = EnumPreference(
    key: 'pref_interface_layout',
    defaultValue: InterfaceLayout.automatic,
    values: InterfaceLayout.values,
  );

  static final glassQuality = EnumPreference(
    key: 'pref_glass_quality',
    defaultValue: GlassQualityMode.auto,
    values: GlassQualityMode.values,
  );

  /// How much this device is asked to spend on decoded images and inline
  /// video. Auto on every platform: the variation belongs in the resolver, not
  /// in the default. Deliberately neither scoped nor synced, because it is a
  /// fact about this device rather than about the account, and because the
  /// tier has to resolve before sign-in makes a scoped key readable.
  static final performanceMode = EnumPreference(
    key: 'pref_performance_mode',
    defaultValue: DevicePerformanceMode.auto,
    values: DevicePerformanceMode.values,
  );

  /// Deepens chrome toward pure black and enriches artwork, on top of the
  /// selected theme. Off by default so no existing install changes look.
  static final oledMode = EnumPreference(
    key: 'pref_oled_mode',
    defaultValue: OledMode.off,
    values: OledMode.values,
  );

  /// Settled quality of the adaptive glass renderer from the last session.
  /// Seeds GlassAdaptiveScope's initialQuality so repeat launches skip the
  /// warm-up benchmark. [GlassSettledQuality.unset] means benchmark again.
  static final glassSettledQuality = EnumPreference(
    key: 'pref_glass_settled_quality',
    defaultValue: GlassSettledQuality.unset,
    values: GlassSettledQuality.values,
  );

  /// Structural style for the media detail screen. Stored per server and user,
  /// because it syncs to that server's profile.
  static final detailScreenStyle = EnumPreference(
    key: 'pref_detail_screen_style',
    defaultValue: DetailScreenStyle.modern,
    values: DetailScreenStyle.values,
  );

  /// When on, the modern detail tabs behave like the search tabs: the first
  /// tab starts expanded and moving focus across tabs shows their content
  /// without pressing select. When off, tabs start collapsed on TV and each
  /// one is opened/closed by pressing it. Stored per server like [detailScreenStyle].
  static final detailExpandedTabs = Preference(
    key: 'pref_detail_expanded_tabs',
    defaultValue: true,
  );

  /// When on, the modern detail screen shows codec and stream technical details. Stored per
  /// server like [detailScreenStyle].
  static final detailShowTechnicalDetails = Preference(
    key: 'pref_detail_show_technical_details',
    defaultValue: false,
  );

  /// When on, the details screen hands remote trailers to the system, the
  /// YouTube app on TV or the browser elsewhere, instead of the in-app
  /// player. Local trailers are server files only this app can stream, so
  /// they always play in-app. Stored per server like [detailScreenStyle].
  static final detailTrailersExternal = Preference(
    key: 'pref_detail_trailers_external',
    defaultValue: false,
  );

  /// When on, media description paragraph on the details page is hidden.
  static final hideDetailsMediaDescription = Preference(
    key: 'pref_hide_details_media_description',
    defaultValue: false,
  );

  /// When on, thumbnails on Classic details page are replaced with series thumbnail.
  static final detailUseSeriesThumbnails = Preference(
    key: 'pref_detail_use_series_thumbnails',
    defaultValue: false,
  );

  /// When on, media description paragraph on the Home screen is hidden.
  static final hideHomeMediaDescription = Preference(
    key: 'pref_hide_home_media_description',
    defaultValue: false,
  );

  /// Algorithm source for the similar items recommendation system. Stored per server and
  /// user, because it syncs to that server's profile.
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

  static final showAlphabeticalFilters = Preference(
    key: 'pref_show_alphabetical_filters',
    defaultValue: false,
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

  /// Off by default. An admin who wants it on for everyone can set it in the
  /// Moonbase default settings.
  static final showServerMessagesButton = Preference(
    key: 'pref_show_server_messages_button',
    defaultValue: false,
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
  static final mergeRecentRowsByType = Preference(
    key: 'pref_merge_recent_rows_by_type',
    defaultValue: false,
  );

  static final diagnosticLoggingEnabled = Preference(
    key: 'pref_diagnostic_logging_enabled',
    defaultValue: false,
  );

  /// Gates uploading crash reports to the server. Capture itself always runs
  /// and stays on the device.
  static final crashReportsEnabled = Preference(
    key: 'pref_crash_reports_enabled',
    defaultValue: true,
  );

  static final enableFolderView = Preference(
    key: 'enable_folder_view',
    defaultValue: false,
  );

  static final groupItemsIntoCollections = Preference(
    key: 'pref_group_items_into_collections',
    defaultValue: false,
  );

  static final playlistsGroupByType = Preference(
    key: 'pref_playlists_group_by_type',
    defaultValue: true,
  );

  static final showMediaDetailsOnLibraryPage = Preference(
    key: 'pref_show_media_details_on_library_page',
    defaultValue: true,
  );

  static final useDetailedSubHeadings = Preference(
    key: 'pref_use_detailed_sub_headings',
    defaultValue: true,
  );

  static final hideBackdropsInLibraries = Preference(
    key: 'pref_hide_backdrops_in_libraries',
    defaultValue: false,
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

  /// Off by default, because a preroll before every episode of a binge wears
  /// thin much faster than one before a film.
  static final cinemaModeEpisodesEnabled = Preference(
    key: 'pref_enable_cinema_mode_episodes',
    defaultValue: false,
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

  /// Sends HDR video to the display untouched, by giving mpv its own D3D11
  /// window instead of the shared 8-bit texture. Windows only, and only
  /// engaged when the display is already in HDR mode and the content is HDR.
  static final nativeHdrOutput = Preference(
    key: 'native_hdr_output',
    defaultValue: false,
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

  static final trickPlayMode = EnumPreference(
    key: 'trickplay_mode',
    defaultValue: TrickplayMode.single,
    values: TrickplayMode.values,
  );

  static final trickPlayPreviewScalePercent = Preference<int>(
    key: 'trickplay_preview_scale_percent',
    defaultValue: 30,
  );

  static final trickPlayVerticalPositionPercent = Preference<int>(
    key: 'trickplay_vertical_position_percent',
    defaultValue: 0,
  );

  static final trickPlayFollowScrubPosition = Preference<bool>(
    key: 'trickplay_follow_scrub_position',
    defaultValue: true,
  );

  // Defaults chosen so the overlay looks unchanged for anyone who never opens
  // the setting.
  static final playbackTimeAboveLeft = EnumPreference(
    key: 'playback_time_above_left',
    defaultValue: PlaybackTimeSlot.none,
    values: PlaybackTimeSlot.values,
  );

  static final playbackTimeAboveCenter = EnumPreference(
    key: 'playback_time_above_center',
    defaultValue: PlaybackTimeSlot.none,
    values: PlaybackTimeSlot.values,
  );

  static final playbackTimeAboveRight = EnumPreference(
    key: 'playback_time_above_right',
    defaultValue: PlaybackTimeSlot.endsAt,
    values: PlaybackTimeSlot.values,
  );

  static final playbackTimeBelowLeft = EnumPreference(
    key: 'playback_time_below_left',
    defaultValue: PlaybackTimeSlot.elapsed,
    values: PlaybackTimeSlot.values,
  );

  static final playbackTimeBelowCenter = EnumPreference(
    key: 'playback_time_below_center',
    defaultValue: PlaybackTimeSlot.none,
    values: PlaybackTimeSlot.values,
  );

  static final playbackTimeBelowRight = EnumPreference(
    key: 'playback_time_below_right',
    defaultValue: PlaybackTimeSlot.totalDuration,
    values: PlaybackTimeSlot.values,
  );

  /// The music player has one label rather than six slots, so it picks a mode.
  static final musicPlaybackTimeDisplay = EnumPreference(
    key: 'music_playback_time_display',
    defaultValue: PlaybackTimeDisplay.totalDuration,
    values: PlaybackTimeDisplay.values,
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
  static final audioFallbackCodec = EnumPreference(
    key: 'audio_fallback_codec',
    defaultValue: AudioFallbackCodec.auto,
    values: AudioFallbackCodec.values,
  );

  static final audioPassthroughMode = EnumPreference(
    key: 'pref_audio_passthrough_mode',
    defaultValue: AudioPassthroughMode.auto,
    values: AudioPassthroughMode.values,
  );

  static final downmixToStereo = Preference(
    key: 'pref_downmix_to_stereo',
    defaultValue: false,
  );

  /// One-time flag: the old preset, output mode, and variant toggles have been
  /// folded into [audioPassthroughMode], [downmixToStereo], and the five base
  /// toggles.
  static final audioModeMigrated = Preference(
    key: 'pref_audio_passthrough_mode_migrated_v1',
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

  static final dtsCorePassthroughEnabled = Preference(
    key: 'pref_passthrough_dts_core',
    defaultValue: false,
  );

  static final dtsHdPassthroughEnabled = Preference(
    key: 'pref_passthrough_dts_hd',
    defaultValue: false,
  );

  static final trueHdPassthroughEnabled = Preference(
    key: 'pref_passthrough_truehd',
    defaultValue: false,
  );

  static final audioNightMode = Preference(
    key: 'audio_night_mode',
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
    defaultValue: PlatformDetection.isAndroid
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

  /// A second appearance used only while HDR reaches the screen, defaulting to
  /// grey text since white reads far brighter in HDR than in SDR.
  static final subtitlesHdrSeparate = Preference(
    key: 'subtitles_hdr_separate',
    defaultValue: false,
  );

  static final subtitlesHdrBackgroundColor = Preference(
    key: 'subtitles_hdr_background_color',
    defaultValue: 0x00000000,
  );

  static final subtitlesHdrTextWeight = Preference(
    key: 'subtitles_hdr_text_weight',
    defaultValue: 400,
  );

  static final subtitlesHdrTextColor = Preference(
    key: 'subtitles_hdr_text_color',
    defaultValue: 0xFF808080,
  );

  static final subtitlesHdrTextStrokeColor = Preference(
    key: 'subtitles_hdr_text_stroke_color',
    defaultValue: 0xFF000000,
  );

  static final subtitlesHdrTextSize = Preference(
    key: 'subtitles_hdr_text_size',
    defaultValue: 20.0,
  );

  static final subtitlesHdrOffsetPosition = Preference(
    key: 'subtitles_hdr_offset_position',
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

  static final mediaSegmentAutoHide = EnumPreference(
    key: 'pref_media_segment_auto_hide',
    defaultValue: MediaSegmentAutoHide.off,
    values: MediaSegmentAutoHide.values,
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
  static final playerSwipeGestures = Preference(
    key: 'playerSwipeGestures',
    defaultValue: true,
  );
  static final detailButtonOrderTv = Preference(
    key: 'detailButtonOrderTv',
    defaultValue: '',
  );
  static final detailButtonOrderMobile = Preference(
    key: 'detailButtonOrderMobile',
    defaultValue: '',
  );
  static final detailButtonOrderDesktop = Preference(
    key: 'detailButtonOrderDesktop',
    defaultValue: '',
  );
  static final osdButtonOrderTv = Preference(
    key: 'osdButtonOrderTv',
    defaultValue: '',
  );
  static final osdButtonOrderMobile = Preference(
    key: 'osdButtonOrderMobile',
    defaultValue: '',
  );
  static final osdButtonOrderDesktop = Preference(
    key: 'osdButtonOrderDesktop',
    defaultValue: '',
  );
  static final hiddenDetailButtonsTv = Preference(
    key: 'hiddenDetailButtonsTv',
    defaultValue: '',
  );
  static final hiddenDetailButtonsMobile = Preference(
    key: 'hiddenDetailButtonsMobile',
    defaultValue: '',
  );
  static final hiddenDetailButtonsDesktop = Preference(
    key: 'hiddenDetailButtonsDesktop',
    defaultValue: '',
  );
  static final hiddenOsdButtonsTv = Preference(
    key: 'hiddenOsdButtonsTv',
    defaultValue: '',
  );
  static final hiddenOsdButtonsMobile = Preference(
    key: 'hiddenOsdButtonsMobile',
    defaultValue: '',
  );
  static final hiddenOsdButtonsDesktop = Preference(
    key: 'hiddenOsdButtonsDesktop',
    defaultValue: '',
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

  static final mediaBarSourceType = Preference(
    key: 'mediaBarSourceType',
    defaultValue: mediaBarSourceRandom,
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

  static final mediaBarTrailerCaptions = Preference(
    key: 'mediaBarTrailerCaptions',
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
      HomeSectionType.libraryTilesSmall => ImageType.thumb,
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
    defaultValue: true,
  );

  static final personalRatingStyle = EnumPreference(
    key: 'pref_personal_rating_style',
    values: PersonalRatingStyle.values,
    defaultValue: PersonalRatingStyle.thumbs,
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
    defaultValue: 'stars,imdb,tmdb,tomatoes,metacritic',
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

  static final recentlyReleasedSeriesType = EnumPreference(
    key: 'recently_released_series_type',
    defaultValue: RecentlyReleasedSeriesType.series,
    values: RecentlyReleasedSeriesType.values,
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
    defaultValue: false,
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

  /// How far through the first-run setup this server and user have been taken.
  ///
  /// A version rather than a flag, so a release that adds a step can show only
  /// the new one instead of asking everything again. Kept per server and user
  /// because a second server is a fresh set of libraries worth arranging, and
  /// kept out of the synced fields so a new device asks rather than inheriting
  /// somebody else's answer.
  static Preference<int> setupWizardVersionForServer(String serverKey) =>
      Preference(
        key: 'pref_setup_wizard_version_$serverKey',
        defaultValue: 0,
      );

  /// Bumped only when a release adds a step that earns its place. Everything
  /// already answered stays answered.
  static const setupWizardVersion = 1;

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

  static final loadingAnimationImage = EnumPreference(
    key: 'loading_animation_image',
    defaultValue: LoadingAnimationImage.moonfinLogo,
    values: LoadingAnimationImage.values,
  );

  static final loadingAnimationSize = EnumPreference(
    key: 'loading_animation_size',
    defaultValue: LoadingAnimationSize.medium,
    values: LoadingAnimationSize.values,
  );

  static final loadingAnimationPosition = EnumPreference(
    key: 'loading_animation_position',
    defaultValue: LoadingAnimationPosition.middle,
    values: LoadingAnimationPosition.values,
  );

  static final loadingAnimationSpeed = EnumPreference(
    key: 'loading_animation_speed',
    defaultValue: LoadingAnimationSpeed.fast,
    values: LoadingAnimationSpeed.values,
  );

  static final showLoadingAnimationText = Preference(
    key: 'show_loading_animation_text',
    defaultValue: true,
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

  static EnumPreference<LikedStatusFilter> libraryLikedFilter(
    String libraryId,
  ) => EnumPreference(
    key: 'library_liked_filter_$libraryId',
    defaultValue: LikedStatusFilter.all,
    values: LikedStatusFilter.values,
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

  /// The multi choice filters, each held as the selected enum names or the
  /// selected facet values so a library reopens the way it was left.
  static Preference<List<String>> libraryFeatureFilters(String libraryId) =>
      Preference(
        key: 'library_feature_filters_$libraryId',
        defaultValue: const [],
      );

  static Preference<List<String>> libraryVideoQualityFilters(
    String libraryId,
  ) => Preference(
    key: 'library_video_quality_filters_$libraryId',
    defaultValue: const [],
  );

  static Preference<List<String>> libraryVideoSourceFilters(String libraryId) =>
      Preference(
        key: 'library_video_source_filters_$libraryId',
        defaultValue: const [],
      );

  static Preference<List<String>> libraryGenreFilters(String libraryId) =>
      Preference(
        key: 'library_genre_filters_$libraryId',
        defaultValue: const [],
      );

  static Preference<List<String>> libraryOfficialRatingFilters(
    String libraryId,
  ) => Preference(
    key: 'library_official_rating_filters_$libraryId',
    defaultValue: const [],
  );

  static Preference<List<String>> libraryTagFilters(String libraryId) =>
      Preference(key: 'library_tag_filters_$libraryId', defaultValue: const []);

  static Preference<List<String>> libraryYearFilters(String libraryId) =>
      Preference(
        key: 'library_year_filters_$libraryId',
        defaultValue: const [],
      );

  static Preference<List<String>> libraryAudioLanguageFilters(
    String libraryId,
  ) => Preference(
    key: 'library_audio_language_filters_$libraryId',
    defaultValue: const [],
  );

  static Preference<List<String>> librarySubtitleLanguageFilters(
    String libraryId,
  ) => Preference(
    key: 'library_subtitle_language_filters_$libraryId',
    defaultValue: const [],
  );

  static EnumPreference<ImageType> libraryImageType(String libraryId) =>
      EnumPreference(
        key: 'library_image_type_$libraryId',
        defaultValue: ImageType.poster,
        values: ImageType.values,
      );

  static EnumPreference<LibraryScrollDirection> libraryScrollDirection(
    String libraryId,
  ) => EnumPreference(
    key: 'library_scroll_dir_$libraryId',
    defaultValue: LibraryScrollDirection.vertical,
    values: LibraryScrollDirection.values,
  );

  static EnumPreference<LibraryGroupBy> libraryGroupBy(
    String libraryId,
  ) => EnumPreference(
    key: 'library_group_by_$libraryId',
    defaultValue: LibraryGroupBy.none,
    values: LibraryGroupBy.values,
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

  // Android TV only: the detail page keeps its download, delete, and
  // download-all actions hidden until the user opts in from
  // Settings -> Playback -> Offline Downloads. Other platforms offer
  // downloads unconditionally, and nothing about existing downloads or the
  // management screens is gated by this.
  static final tvOfflineDownloads = Preference(
    key: 'tv_offline_downloads',
    defaultValue: false,
  );

  // JSON-encoded list of server base URLs whose TLS certificate the native
  // download engine rejected (typically self-signed). Downloads for these
  // servers run on the legacy in-process engine, which accepts any cert.
  static final legacyDownloadEngineServers = Preference(
    key: 'download_legacy_engine_servers',
    defaultValue: '',
  );

  static final downloadStorageLimitMb = Preference(
    key: 'download_storage_limit_mb',
    defaultValue: 0,
  );

  static final downloadConcurrentCount = Preference(
    key: 'download_concurrent_count',
    defaultValue: 2,
  );

  /// The user's download concurrency, clamped to the supported range. The
  /// app-level scheduler and the native engine's holding queue must both use
  /// this single resolver so their limits can never drift apart.
  int get effectiveDownloadConcurrentCount =>
      get(downloadConcurrentCount).clamp(1, 8).toInt();

  static final reportDownloadsAsActivity = Preference(
    key: 'download_report_as_activity',
    defaultValue: true,
  );

  // Byte budget for the on-disk image cache, in megabytes. 0 disables the
  // budget and falls back to the cache manager's object-count cap.
  static final imageCacheLimitMb = Preference(
    key: 'image_cache_limit_mb',
    defaultValue: 350,
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

  static final windowMaximized = Preference(
    key: 'window_maximized',
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

  SeriesTrackPreference getSeriesSubtitlePreference(String seriesId) {
    final pref = Preference(
      key: 'pref_series_subtitle_lang_$seriesId',
      defaultValue: '',
    );
    final raw = _store.get(pref);
    return SeriesTrackPreference.fromRawString(raw);
  }

  Future<void> setSeriesSubtitlePreference(
    String seriesId,
    SeriesTrackPreference pref,
  ) async {
    final key = Preference(
      key: 'pref_series_subtitle_lang_$seriesId',
      defaultValue: '',
    );
    await _store.set(key, pref.toRawString());
    notifyListeners();
  }

  SeriesTrackPreference getSeriesAudioPreference(String seriesId) {
    final pref = Preference(
      key: 'pref_series_audio_lang_$seriesId',
      defaultValue: '',
    );
    final raw = _store.get(pref);
    return SeriesTrackPreference.fromRawString(raw);
  }

  Future<void> setSeriesAudioPreference(String seriesId, SeriesTrackPreference pref) async {
    final key = Preference(
      key: 'pref_series_audio_lang_$seriesId',
      defaultValue: '',
    );
    await _store.set(key, pref.toRawString());
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
        final lastPlayedStr =
            item.rawData['UserData']?['LastPlayedDate'] as String?;
        if (lastPlayedStr != null && lastPlayedStr.isNotEmpty) {
          final lastPlayed = DateTime.tryParse(lastPlayedStr);
          final hiddenAt = DateTime.tryParse(hidden[matchedKey]!);
          if (lastPlayed != null &&
              hiddenAt != null &&
              lastPlayed.isAfter(hiddenAt)) {
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
        final lastPlayedStr =
            item.rawData['UserData']?['LastPlayedDate'] as String?;
        if (lastPlayedStr != null && lastPlayedStr.isNotEmpty) {
          final lastPlayed = DateTime.tryParse(lastPlayedStr);
          final hiddenAt = DateTime.tryParse(hidden[seriesId]!);
          if (lastPlayed != null &&
              hiddenAt != null &&
              lastPlayed.isAfter(hiddenAt)) {
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
