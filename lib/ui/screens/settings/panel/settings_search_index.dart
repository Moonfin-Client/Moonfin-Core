part of '../settings_side_panel.dart';

/// One thing the settings search can surface: a screen or a single setting.
/// Opening a leaf lands on the screen that holds it, so [subtitle] carries the
/// breadcrumb that tells the user where they are about to go.
class _SettingsSearchEntry {
  _SettingsSearchEntry({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onOpen,
    required String matchText,
  }) : titleLower = title.toLowerCase(),
       haystack = matchText.toLowerCase();

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onOpen;
  final String titleLower;
  final String haystack;
}

/// One source screen worth of entries. Every setting on a screen shares its
/// breadcrumb and the screen it opens, so declaring the screen once keeps
/// each setting below down to a title and a few keywords.
class _SearchSection {
  _SearchSection({
    required this.slug,
    required this.path,
    required this.icon,
    required this.open,
  });

  final String slug;

  /// Breadcrumb segments ending with this screen's own title.
  final List<String> path;
  final IconData icon;
  final VoidCallback open;

  _SettingsSearchEntry screen({List<String> keywords = const []}) =>
      _SettingsSearchEntry(
        id: slug,
        title: path.last,
        subtitle: path.length > 1
            ? path.sublist(0, path.length - 1).join(' › ')
            : '',
        icon: icon,
        onOpen: open,
        matchText: [...path, ...keywords].join(' '),
      );

  /// [header] is the section header the setting sits under, worth passing
  /// when a screen uses the same title twice so the results can be told apart.
  _SettingsSearchEntry leaf(
    String id,
    String title, {
    String? subtitle,
    List<String> keywords = const [],
    String? header,
  }) => _SettingsSearchEntry(
    id: '$slug.$id',
    title: title,
    subtitle: header == null
        ? path.join(' › ')
        : '${path.join(' › ')} › $header',
    icon: icon,
    onOpen: open,
    matchText: [title, ?subtitle, ...keywords, ...path].join(' '),
  );
}

/// Ranks [index] against [query]. Every word has to appear somewhere in an
/// entry, and entries whose title starts with or contains the whole query
/// outrank keyword only hits. Ties keep the order the panel lists things in.
List<_SettingsSearchEntry> _filterSettingsIndex(
  List<_SettingsSearchEntry> index,
  String query,
) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return const [];
  final tokens = q.split(RegExp(r'\s+'));

  final scored = <({int score, int order, _SettingsSearchEntry entry})>[];
  for (var i = 0; i < index.length; i++) {
    final entry = index[i];
    if (!tokens.every(entry.haystack.contains)) continue;
    final score = entry.titleLower.startsWith(q)
        ? 3
        : entry.titleLower.contains(q)
        ? 2
        : 1;
    scored.add((score: score, order: i, entry: entry));
  }
  scored.sort((a, b) {
    final byScore = b.score.compareTo(a.score);
    return byScore != 0 ? byScore : a.order.compareTo(b.order);
  });
  return [for (final match in scored.take(30)) match.entry];
}

/// The whole settings tree flattened for search. It is built fresh each time
/// so titles follow the language and the gates follow the device, matching
/// what the source screens themselves check. Gates that depend on another
/// preference are left out on purpose. The setting still exists either way,
/// and the screen it lives on decides whether to draw it.
List<_SettingsSearchEntry> _buildSettingsSearchIndex({
  required AppLocalizations l10n,
  required bool showAdmin,
  required bool showThemeEditor,
  required void Function(Widget screen) push,
  required VoidCallback openAdmin,
  required VoidCallback openThemeEditor,
}) {
  final seerrAvailable = GetIt.instance<PluginSyncService>().seerrAvailable;
  final tmdbAvailable = GetIt.instance<PluginSyncService>().tmdbAvailable;

  final account = _SearchSection(
    slug: 'account',
    path: [l10n.settingsAccountSecurity],
    icon: Icons.lock,
    open: () => push(const _AuthenticationCategoryScreen()),
  );
  final personalization = _SearchSection(
    slug: 'personalization',
    path: [l10n.settingsPersonalization],
    icon: Icons.palette,
    open: () => push(const _CustomizationCategoryScreen()),
  );
  final playback = _SearchSection(
    slug: 'playback',
    path: [l10n.settingsPlaybackSyncplay],
    icon: Icons.play_circle,
    open: () => push(const _PlaybackCategoryScreen()),
  );
  final integrations = _SearchSection(
    slug: 'integrations',
    path: [l10n.integrations],
    icon: Icons.hub,
    open: () => push(const _IntegrationsScreen()),
  );
  final pin = _SearchSection(
    slug: 'pin',
    path: [l10n.settingsAccountSecurity, l10n.pinCode],
    icon: Icons.pin,
    open: () => push(const PinCodeSettingsScreen()),
  );
  final parental = _SearchSection(
    slug: 'parental',
    path: [l10n.settingsAccountSecurity, l10n.settingsBlockedRatings],
    icon: Icons.shield,
    open: () => push(const ParentalSettingsScreen()),
  );
  final style = _SearchSection(
    slug: 'style',
    path: [l10n.settingsPersonalization, l10n.settingsGeneralStyle],
    icon: Icons.style,
    open: () => push(const _GeneralStyleScreen()),
  );
  final themes = _SearchSection(
    slug: 'themes',
    path: [
      l10n.settingsPersonalization,
      l10n.settingsGeneralStyle,
      l10n.settingsAppearanceTheme,
    ],
    icon: Icons.color_lens,
    open: () => push(const AppearanceThemeScreen()),
  );
  final themeStore = _SearchSection(
    slug: 'theme-store',
    path: [
      l10n.settingsPersonalization,
      l10n.settingsGeneralStyle,
      l10n.themeStore,
    ],
    icon: Icons.storefront,
    open: () => push(const ThemeStoreScreen()),
  );
  final savedThemes = _SearchSection(
    slug: 'saved-themes',
    path: [
      l10n.settingsPersonalization,
      l10n.settingsGeneralStyle,
      l10n.savedThemesTitle,
    ],
    icon: Icons.bookmark,
    open: () => push(const SavedThemesScreen()),
  );
  final details = _SearchSection(
    slug: 'details',
    path: [l10n.settingsPersonalization, l10n.settingsDetailsScreen],
    icon: Icons.article,
    open: () => push(const _DetailsScreenSettingsScreen()),
  );
  final detailButtons = _SearchSection(
    slug: 'detail-buttons',
    path: [
      l10n.settingsPersonalization,
      l10n.settingsDetailsScreen,
      l10n.detailButtons,
    ],
    icon: Icons.smart_button,
    open: () => push(const _DetailButtonsScreen()),
  );
  final navigation = _SearchSection(
    slug: 'navigation',
    path: [l10n.settingsPersonalization, l10n.navigation],
    icon: Icons.navigation,
    open: () => push(const _NavigationCategoryScreen()),
  );
  final screensaver = _SearchSection(
    slug: 'screensaver',
    path: [l10n.settingsPersonalization, l10n.screensaver],
    icon: Icons.wallpaper,
    open: () => push(const ScreensaverSettingsScreen()),
  );
  final home = _SearchSection(
    slug: 'home',
    path: [l10n.settingsPersonalization, l10n.homeScreen],
    icon: Icons.home,
    open: () => push(const _HomeScreenCategoryScreen()),
  );
  final homeSections = _SearchSection(
    slug: 'home-sections',
    path: [l10n.settingsPersonalization, l10n.homeScreen, l10n.homeSections],
    icon: Icons.reorder,
    open: () => push(const HomeSectionsScreen(showGeneralOptions: false)),
  );
  final rowToggles = _SearchSection(
    slug: 'row-toggles',
    path: [l10n.settingsPersonalization, l10n.homeScreen, l10n.homeRowToggles],
    icon: Icons.toggle_on,
    open: () => push(const HomeRowTogglesScreen()),
  );
  final rowImages = _SearchSection(
    slug: 'row-images',
    path: [
      l10n.settingsPersonalization,
      l10n.homeScreen,
      l10n.perRowImageTypeSelection,
    ],
    icon: Icons.image,
    open: () => push(const HomeRowsImageTypeScreen()),
  );
  final externalLists = _SearchSection(
    slug: 'external-lists',
    path: [l10n.integrations, l10n.externalLists],
    icon: Icons.playlist_add,
    open: () => push(const _ExternalListsScreen()),
  );
  final imdbLists = _SearchSection(
    slug: 'imdb',
    path: [l10n.integrations, l10n.externalLists, 'IMDb Lists'],
    icon: Icons.list_alt,
    open: () => push(const _ImdbListsScreen()),
  );
  final tmdbLists = _SearchSection(
    slug: 'tmdb',
    path: [l10n.integrations, l10n.externalLists, 'TMDB Lists'],
    icon: Icons.list_alt,
    open: () => push(const _TmdbListsScreen()),
  );
  final calendars = _SearchSection(
    slug: 'calendars',
    path: [l10n.integrations, l10n.externalLists, 'Upcoming Calendars'],
    icon: Icons.calendar_month,
    open: () => push(const _UpcomingCalendarsScreen()),
  );
  final seerrLists = _SearchSection(
    slug: 'seerr-lists',
    path: [l10n.integrations, l10n.externalLists, 'Seerr Lists'],
    icon: Icons.list_alt,
    open: () => push(const _SeerrListsScreen()),
  );
  final customRows = _SearchSection(
    slug: 'custom-rows',
    path: [l10n.integrations, l10n.externalLists, 'Custom Home Rows Wizard'],
    icon: Icons.dashboard_customize,
    open: () => push(const _CustomListsScreen()),
  );
  final libraries = _SearchSection(
    slug: 'libraries',
    path: [l10n.settingsPersonalization, l10n.libraries],
    icon: Icons.video_library,
    open: () => push(const _LibrariesCategoryScreen()),
  );
  final libraryVisibility = _SearchSection(
    slug: 'library-visibility',
    path: [
      l10n.settingsPersonalization,
      l10n.libraries,
      l10n.libraryVisibility,
    ],
    icon: Icons.visibility,
    open: () => push(const LibraryVisibilityScreen()),
  );
  final mediaBar = _SearchSection(
    slug: 'media-bar',
    path: [l10n.settingsPersonalization, l10n.mediaBar],
    icon: Icons.featured_video,
    open: () => push(const MediaBarSettingsScreen()),
  );
  final previews = _SearchSection(
    slug: 'previews',
    path: [l10n.settingsPersonalization, l10n.localPreviews],
    icon: Icons.preview,
    open: () => push(const LocalPreviewsSettingsScreen()),
  );
  final seasonal = _SearchSection(
    slug: 'seasonal',
    path: [l10n.settingsPersonalization, l10n.seasonalEffects],
    icon: Icons.celebration,
    open: () => push(const _SeasonalEffectsScreen()),
  );
  final themeMusic = _SearchSection(
    slug: 'theme-music',
    path: [l10n.settingsPersonalization, l10n.themeMusic],
    icon: Icons.music_note,
    open: () => push(const _ThemeMusicScreen()),
  );
  final loadingAnimation = _SearchSection(
    slug: 'loading-animation',
    path: [l10n.settingsPersonalization, l10n.loadingAnimation],
    icon: Icons.motion_photos_on_outlined,
    open: () => push(const _LoadingAnimationScreen()),
  );
  final video = _SearchSection(
    slug: 'video',
    path: [
      l10n.settingsPlaybackSyncplay,
      l10n.settingsVideoPlaybackPreferences,
    ],
    icon: Icons.play_circle_outline,
    open: () => push(const _VideoPlaybackScreen()),
  );
  final playbackTime = _SearchSection(
    slug: 'playback-time',
    path: [
      l10n.settingsPlaybackSyncplay,
      l10n.settingsVideoPlaybackPreferences,
      l10n.playbackTimeDisplay,
    ],
    icon: Icons.timer_outlined,
    open: () => push(const _PlaybackTimeLayoutScreen()),
  );
  final osdButtons = _SearchSection(
    slug: 'osd-buttons',
    path: [
      l10n.settingsPlaybackSyncplay,
      l10n.settingsVideoPlaybackPreferences,
      l10n.osdButtons,
    ],
    icon: Icons.smart_button,
    open: () => push(const _OsdButtonsScreen()),
  );
  final audio = _SearchSection(
    slug: 'audio',
    path: [l10n.settingsPlaybackSyncplay, l10n.settingsAudioPreferences],
    icon: Icons.audiotrack,
    open: () => push(const _AudioPreferencesScreen()),
  );
  final subtitles = _SearchSection(
    slug: 'subtitles',
    path: [l10n.settingsPlaybackSyncplay, l10n.subtitlePreferences],
    icon: Icons.subtitles,
    open: () => push(const SubtitleSettingsScreen()),
  );
  final subtitleStyle = _SearchSection(
    slug: 'subtitle-style',
    path: [
      l10n.settingsPlaybackSyncplay,
      l10n.subtitlePreferences,
      l10n.subtitleCustomization,
    ],
    icon: Icons.format_color_text,
    open: () => push(const SubtitleCustomizationScreen()),
  );
  final automation = _SearchSection(
    slug: 'automation',
    path: [l10n.settingsPlaybackSyncplay, l10n.settingsAutomationAndQueue],
    icon: Icons.queue_play_next,
    open: () => push(const _AutomationQueueScreen()),
  );
  final downloads = _SearchSection(
    slug: 'downloads',
    path: [l10n.settingsPlaybackSyncplay, l10n.settingsOfflineDownloads],
    icon: Icons.download,
    open: () => push(const DownloadSettingsScreen()),
  );
  final emulatorCores = _SearchSection(
    slug: 'emulator-cores',
    path: [l10n.settingsPlaybackSyncplay, l10n.emulatorCores],
    icon: Icons.videogame_asset,
    open: () => push(const EmulatorCoresScreen()),
  );
  final downloadedGames = _SearchSection(
    slug: 'downloaded-games',
    path: [l10n.settingsPlaybackSyncplay, l10n.downloadedGames],
    icon: Icons.videogame_asset,
    open: () => push(const DownloadedGamesScreen()),
  );
  final syncplay = _SearchSection(
    slug: 'syncplay',
    path: [l10n.settingsPlaybackSyncplay, l10n.syncPlay],
    icon: Icons.groups,
    open: () => push(const _SyncPlaySettingsScreen()),
  );
  final advanced = _SearchSection(
    slug: 'advanced',
    path: [l10n.settingsPlaybackSyncplay, l10n.advancedOptions],
    icon: Icons.tune,
    open: () => push(const _AdvancedOptionsScreen()),
  );
  final plugin = _SearchSection(
    slug: 'plugin',
    path: [l10n.integrations, l10n.pluginLabel],
    icon: Icons.extension,
    open: () => push(const _PluginScreen()),
  );
  final metadata = _SearchSection(
    slug: 'metadata',
    path: [l10n.integrations, l10n.settingsMetadataAndRatings],
    icon: Icons.star,
    open: () => push(const _MetadataRatingsScreen()),
  );
  final ratingSources = _SearchSection(
    slug: 'rating-sources',
    path: [
      l10n.integrations,
      l10n.settingsMetadataAndRatings,
      l10n.ratingSources,
    ],
    icon: Icons.star_half,
    open: () => push(const RatingsConfigScreen()),
  );
  final seerr = _SearchSection(
    slug: 'seerr',
    path: [l10n.integrations, l10n.seerr],
    icon: Icons.movie_filter,
    open: () => push(const SeerrConfigScreen()),
  );
  final about = _SearchSection(
    slug: 'about',
    path: [l10n.aboutTitle],
    icon: Icons.info_outline,
    open: () => push(const _AboutCategoryScreen()),
  );
  final diagnostics = _SearchSection(
    slug: 'diagnostics',
    path: [l10n.aboutTitle, 'Diagnostics & Logging'],
    icon: Icons.bug_report,
    open: () => push(const DiagnosticsSettingsScreen()),
  );

  final entries = <_SettingsSearchEntry>[
    if (showAdmin)
      _SettingsSearchEntry(
        id: 'admin',
        title: l10n.administration,
        subtitle: l10n.settingsAdministrationSubtitle,
        icon: Icons.admin_panel_settings,
        onOpen: openAdmin,
        matchText:
            '${l10n.administration} ${l10n.settingsAdministrationSubtitle} '
            'server dashboard users',
      ),
    if (showThemeEditor)
      _SettingsSearchEntry(
        id: 'theme-editor',
        title: l10n.themeEditor,
        subtitle: l10n.themeEditorSubtitle,
        icon: Icons.brush,
        onOpen: openThemeEditor,
        matchText: '${l10n.themeEditor} ${l10n.themeEditorSubtitle}',
      ),

    account.screen(keywords: ['login', 'password', 'server']),
    account.leaf('pref_auto_login_behavior', l10n.autoLogin, keywords: [
      'startup',
      'remember',
    ]),
    account.leaf(
      'pref_always_authenticate',
      l10n.alwaysAuthenticate,
      subtitle: l10n.requirePasswordWithToken,
      keywords: ['password'],
    ),
    account.leaf('pref_language_override', l10n.interfaceLanguage, keywords: [
      'locale',
      'translation',
    ]),
    if (!PlatformDetection.isWeb) ...[
      account.leaf('pref_user_sort_by', l10n.settingsSortServersBy, keywords: [
        'server order',
      ]),
      account.leaf(
        'confirm_exit',
        l10n.confirmExit,
        subtitle: l10n.showConfirmationBeforeExiting,
        keywords: ['quit', 'close'],
      ),
      account.leaf(
        'pref_allow_self_signed_certs',
        l10n.settingsAllowSelfSignedCerts,
        subtitle: l10n.settingsAllowSelfSignedCertsSubtitle,
        keywords: ['certificate', 'ssl', 'https', 'insecure'],
      ),
    ],
    pin.screen(keywords: ['lock', 'passcode']),
    pin.leaf(
      'enable',
      l10n.enablePinCode,
      subtitle: l10n.requirePinToAccess,
      keywords: ['lock', 'passcode'],
    ),
    pin.leaf('change', l10n.changePin, subtitle: l10n.setNewPinCode),
    pin.leaf('remove', l10n.removePin, subtitle: l10n.removePinProtection),
    parental.screen(keywords: [
      'parental controls',
      'age',
      'content rating',
      'block',
      'kids',
    ]),

    personalization.screen(keywords: ['appearance', 'customization', 'theme']),
    style.screen(keywords: ['appearance', 'look']),
    style.leaf('pref_interface_style', l10n.interfaceStyle, keywords: [
      'classic',
      'modern',
    ]),
    if (PlatformDetection.canOverrideInterfaceLayout)
      style.leaf('pref_interface_layout', l10n.interfaceLayout, keywords: [
        'tv mode',
        'leanback',
        'force',
      ]),
    themes.screen(keywords: ['theme', 'color scheme', 'glass', 'neon']),
    if (AppColorScheme.isGlass)
      style.leaf('pref_glass_quality', l10n.glassQuality, keywords: [
        'blur',
        'performance',
      ]),
    themeStore.screen(keywords: ['download themes', 'community']),
    savedThemes.screen(keywords: ['custom themes', 'manage']),
    style.leaf('focus_color', l10n.focusBorderColor, keywords: [
      'highlight',
      'accent',
    ]),
    if (PlatformDetection.isTV)
      style.leaf(
        'pref_prefer_system_ime_keyboard',
        l10n.keyboardPreferSystemIme,
        subtitle: l10n.keyboardPreferSystemImeDescription,
        keywords: ['keyboard', 'input'],
      ),
    if (GamepadNavigationScope.isConfigurable)
      style.leaf(
        'pref_gamepad_navigation_enabled',
        l10n.gamepadNavigation,
        subtitle: l10n.gamepadNavigationDescription,
        keywords: ['gamepad', 'controller', 'input'],
      ),
    style.leaf('pref_clock_behavior', l10n.clockDisplay, keywords: ['time']),
    style.leaf(
      'pref_use_24_hour_clock',
      l10n.settingsTwentyFourHourClock,
      subtitle: l10n.settingsTwentyFourHourClockSubtitle,
      keywords: ['time format', 'am pm'],
    ),
    if (!PlatformDetection.useMobileUi)
      style.leaf(
        'pref_card_focus_expansion',
        l10n.focusExpansionAnimation,
        subtitle: l10n.scaleFocusedCards,
        keywords: ['zoom', 'cards'],
      ),
    style.leaf('pref_desktop_ui_scale', l10n.desktopUiScale, keywords: [
      'size',
      'zoom',
      'scaling',
    ]),
    style.leaf(
      'pref_desktop_scroll_sensitivity',
      l10n.scrollSensitivity,
      subtitle: l10n.scrollSensitivitySubtitle,
      keywords: ['mouse', 'wheel', 'speed', 'scrolling'],
    ),
    style.leaf(
      'pref_show_backdrop',
      l10n.backgroundBackdrops,
      subtitle: l10n.showBackdropImages,
      keywords: ['background images'],
    ),
    style.leaf(
      'pref_oled_mode',
      l10n.oledMode,
      subtitle: l10n.oledModeSubtitle,
      keywords: [
        'oled',
        'amoled',
        'true black',
        'pure black',
        'vibrance',
        'saturation',
        'contrast',
      ],
    ),
    style.leaf(
      'browsingBackgroundBlurAmount',
      l10n.browsingBackgroundBlur,
      keywords: ['backdrop'],
    ),
    style.leaf(
      'pref_watched_indicator_behavior',
      l10n.watchedIndicators,
      keywords: ['checkmark', 'seen', 'badge'],
    ),

    details.screen(keywords: ['movie page', 'show page', 'item page']),
    details.leaf('pref_detail_screen_style', l10n.detailScreenStyle, keywords: [
      'classic',
      'modern',
    ]),
    details.leaf('detailsBackgroundBlurAmount', l10n.detailsBackgroundBlur),
    details.leaf(
      'pref_detail_expanded_tabs',
      l10n.expandedTabs,
      subtitle: l10n.expandedTabsSubtitle,
    ),
    details.leaf(
      'pref_detail_show_technical_details',
      l10n.showTechnicalDetails,
      subtitle: l10n.showTechnicalDetailsSubtitle,
      keywords: ['codec', 'bitrate info'],
    ),
    details.leaf(
      'pref_detail_trailers_external',
      l10n.openTrailersExternally,
      subtitle: l10n.openTrailersExternallySubtitle,
      keywords: ['youtube', 'trailer', 'external app'],
    ),
    details.leaf(
      'pref_hide_details_media_description',
      l10n.hideDetailsMediaDescription,
      subtitle: l10n.hideDetailsMediaDescriptionSubtitle,
      keywords: ['spoiler', 'description', 'overview'],
    ),
    details.leaf(
      'pref_detail_use_series_thumbnails',
      l10n.detailUseSeriesThumbnails,
      subtitle: l10n.detailUseSeriesThumbnailsSubtitle,
      keywords: ['spoiler', 'thumbnails', 'series artwork'],
    ),
    details.leaf(
      'pref_recommendation_system_source',
      l10n.recommendationSystem,
      keywords: ['similar', 'suggestions'],
    ),
    details.leaf(
      'pref_recommendations_apply_parental_rating_cap',
      l10n.recommendationsApplyParentalRatingCap,
      subtitle: l10n.recommendationsApplyParentalRatingCapSubtitle,
    ),
    detailButtons.screen(keywords: [
      'action buttons',
      'hide',
      'reorder',
      'shuffle',
      'trailer',
      'favorite',
      'playlist',
    ]),

    navigation.screen(keywords: ['navbar', 'toolbar', 'sidebar']),
    navigation.leaf('pref_navbar_position', l10n.navigationStyle, keywords: [
      'navbar position',
      'top',
      'left',
      'bottom',
    ]),
    navigation.leaf('navbarColor', l10n.navbarColor),
    navigation.leaf('navbarOpacity', l10n.navbarOpacity, keywords: [
      'transparency',
    ]),
    navigation.leaf(
      'pref_show_shuffle_button',
      l10n.showShuffleButton,
      subtitle: l10n.settingsShowShuffleButtonInNavigation,
      keywords: ['random'],
    ),
    navigation.leaf(
      'pref_shuffle_content_type',
      l10n.settingsShuffleContentTypeFilter,
      keywords: ['movies', 'shows'],
    ),
    navigation.leaf(
      'pref_show_genres_button',
      l10n.showGenresButton,
      subtitle: l10n.settingsShowGenresButtonInNavigation,
    ),
    navigation.leaf(
      'pref_show_favorites_button',
      l10n.showFavoritesButton,
      subtitle: l10n.settingsShowFavoritesButtonInNavigation,
    ),
    navigation.leaf(
      'pref_show_libraries_in_toolbar',
      l10n.showLibrariesInToolbar,
      subtitle: l10n.settingsShowLibrariesButtonInNavigation,
    ),
    navigation.leaf(
      'pref_navbar_always_expanded',
      l10n.navbarAlwaysExpanded,
      subtitle: l10n.settingsAlwaysExpandNavbarLabels,
      keywords: ['labels'],
    ),
    navigation.leaf(
      'enable_folder_view',
      l10n.enableFolderView,
      subtitle: l10n.showFolderBrowsingOption,
      keywords: ['directories'],
    ),
    if (seerrAvailable)
      navigation.leaf(
        'pref_show_seerr_button',
        l10n.showSeerrButton,
        subtitle: l10n.settingsShowSeerrButtonInNavigation,
        keywords: ['requests'],
      ),

    if (PlatformDetection.isTV) ...[
      screensaver.screen(keywords: ['idle', 'dim', 'burn in']),
      screensaver.leaf(
        'pref_screensaver_enabled',
        l10n.inAppScreensaver,
        subtitle: l10n.enableBuiltInScreensaver,
      ),
      screensaver.leaf('pref_screensaver_timeout', l10n.timeout, keywords: [
        'screensaver delay',
      ]),
      screensaver.leaf(
        'pref_screensaver_dimming',
        l10n.dimmingLevel,
        keywords: ['brightness'],
      ),
      screensaver.leaf(
        'pref_screensaver_clock_mode',
        l10n.showClock,
        keywords: ['screensaver clock'],
      ),
    ],

    home.screen(keywords: ['home page', 'rows']),
    home.leaf('pref_home_rows_style', l10n.rowsType, keywords: [
      'classic',
      'modern rows',
    ]),
    home.leaf(
      'pref_merge_continue_watching_next_up',
      l10n.mergeContinueWatchingAndNextUp,
      subtitle: l10n.combineBothRows,
      keywords: ['continue watching', 'next up'],
    ),
    home.leaf(
      'pref_next_up_max_days',
      l10n.nextUpMaxDays,
      subtitle: l10n.nextUpMaxDaysDescription,
      keywords: ['next up', 'days', 'cutoff'],
    ),
    home.leaf(
      'pref_enable_series_thumbnails',
      l10n.seriesThumbnails,
      subtitle: l10n.seriesThumbnailsDescription,
      keywords: ['episode images'],
    ),
    if (!PlatformDetection.useMobileUi)
      home.leaf(
        'pref_home_rows_fullscreen',
        l10n.fullScreenRows,
        subtitle: l10n.fullScreenRowsDescription,
        keywords: ['immersive'],
      ),
    if (!PlatformDetection.useMobileUi)
      home.leaf(
        'pref_home_row_info_overlay',
        l10n.homeRowInfoOverlay,
        subtitle: l10n.showTitleMetadataOnHomeRows,
      ),
    home.leaf(
      'pref_hide_home_media_description',
      l10n.hideHomeMediaDescription,
      subtitle: l10n.hideHomeMediaDescriptionSubtitle,
      keywords: ['spoiler', 'description', 'overview'],
    ),
    home.leaf('home_rows_padding', l10n.homeRowsPadding, keywords: [
      'spacing',
      'gap',
    ]),
    home.leaf('poster_size', l10n.cardSize, keywords: ['poster size']),
    homeSections.screen(keywords: [
      'reorder rows',
      'toggle rows',
      'hide rows',
      'continue watching',
      'next up',
      'recently added',
    ]),
    rowToggles.screen(keywords: [
      'audio rows',
      'collections',
      'favorites',
      'genres',
      'playlists',
      'rewatch',
      'since you watched',
    ]),
    rowToggles.leaf(
      'pref_display_audio_rows',
      l10n.displayAudioRows,
      subtitle: l10n.displayAudioRowsSubtitle,
      keywords: ['music'],
    ),
    rowToggles.leaf(
      'pref_display_collections_rows',
      l10n.displayCollectionsRows,
      subtitle: l10n.displayCollectionsRowsSubtitle,
    ),
    rowToggles.leaf(
      'pref_display_favorites_rows',
      l10n.displayFavoritesRows,
      subtitle: l10n.displayFavoritesRowsSubtitle,
    ),
    rowToggles.leaf(
      'pref_display_genres_rows',
      l10n.displayGenresRows,
      subtitle: l10n.displayGenresRowsSubtitle,
    ),
    rowToggles.leaf(
      'pref_display_playlists_rows',
      l10n.displayPlaylistsRows,
      subtitle: l10n.displayPlaylistsRowsSubtitle,
    ),
    rowToggles.leaf(
      'pref_display_rewatch_row',
      'Display Rewatch Row',
      subtitle: 'Show Rewatch row in Home Sections',
      keywords: ['watch again'],
    ),
    rowToggles.leaf(
      'pref_display_since_you_watched_rows',
      'Display Since You Watched Rows',
      subtitle: 'Show and customize Since You Watched rows in Home Sections.',
      keywords: ['recommendations'],
    ),
    rowImages.screen(keywords: ['poster', 'thumbnail', 'banner']),
    if (seerrAvailable) ...[
      externalLists.screen(keywords: [
        'external home rows',
        'imdb',
        'tmdb',
        'letterboxd',
      ]),
      imdbLists.screen(keywords: ['top 250', 'popular', 'charts']),
      imdbLists.leaf('imdb_top_250_movies_enabled', l10n.imdbTop250Movies),
      imdbLists.leaf('imdb_top_250_tv_shows_enabled', l10n.imdbTop250TvShows),
      imdbLists.leaf(
        'imdb_most_popular_movies_enabled',
        l10n.imdbMostPopularMovies,
      ),
      imdbLists.leaf(
        'imdb_most_popular_tv_shows_enabled',
        l10n.imdbMostPopularTvShows,
      ),
      imdbLists.leaf(
        'imdb_lowest_rated_movies_enabled',
        l10n.imdbLowestRatedMovies,
      ),
      imdbLists.leaf(
        'imdb_top_english_movies_enabled',
        l10n.imdbTopEnglishMovies,
      ),
      if (tmdbAvailable) ...[
        tmdbLists.screen(keywords: ['popular', 'top rated', 'trending']),
        tmdbLists.leaf('tmdb_popular_movies_enabled', 'Popular Movies'),
        tmdbLists.leaf('tmdb_top_rated_movies_enabled', 'Top Rated Movies'),
        tmdbLists.leaf('tmdb_now_playing_movies_enabled', 'Now Playing Movies'),
        tmdbLists.leaf('tmdb_upcoming_movies_enabled', 'Upcoming Movies'),
        tmdbLists.leaf('tmdb_popular_tv_enabled', 'Popular TV'),
        tmdbLists.leaf('tmdb_top_rated_tv_enabled', 'Top Rated TV'),
        tmdbLists.leaf('tmdb_airing_today_tv_enabled', 'Airing Today TV'),
        tmdbLists.leaf('tmdb_on_the_air_tv_enabled', 'On The Air TV'),
        tmdbLists.leaf(
          'tmdb_trending_movie_daily_enabled',
          'Trending Movies (Daily)',
        ),
        tmdbLists.leaf(
          'tmdb_trending_movie_weekly_enabled',
          'Trending Movies (Weekly)',
        ),
        tmdbLists.leaf('tmdb_trending_tv_daily_enabled', 'Trending TV (Daily)'),
        tmdbLists.leaf(
          'tmdb_trending_tv_weekly_enabled',
          'Trending TV (Weekly)',
        ),
        tmdbLists.leaf(
          'tmdb_trending_all_weekly_enabled',
          'Trending All (Weekly)',
        ),
      ],
      calendars.screen(keywords: ['radarr', 'sonarr', 'upcoming releases']),
      calendars.leaf(
        'merge_radarr_sonarr_calendars',
        'Merge Sonarr and Radarr Calendars?',
      ),
      calendars.leaf(
        'enable_radarr_calendar',
        "Enable Radarr's Upcoming Calendar",
        keywords: ['movies'],
      ),
      calendars.leaf(
        'radarr_calendar_show_cinema',
        'Show Upcoming Cinema Releases',
        header: 'Radarr',
      ),
      calendars.leaf(
        'radarr_calendar_show_digital',
        'Show Upcoming Digital Releases',
        header: 'Radarr',
      ),
      calendars.leaf(
        'radarr_calendar_show_physical',
        'Show Upcoming Physical Releases',
        header: 'Radarr',
      ),
      calendars.leaf(
        'radarr_calendar_show_date',
        'Show Release Date on Home Screen?',
        header: 'Radarr',
      ),
      calendars.leaf(
        'enable_sonarr_calendar',
        "Enable Sonarr's Upcoming Calendar",
        keywords: ['shows', 'episodes'],
      ),
      calendars.leaf(
        'sonarr_calendar_show_episode_info',
        'Display Episode Information?',
        header: 'Sonarr',
      ),
      calendars.leaf(
        'sonarr_calendar_show_date',
        'Show Release Date on Home Screen?',
        header: 'Sonarr',
      ),
      seerrLists.screen(keywords: ['discovery rows', 'watchlist', 'trending']),
      customRows.screen(keywords: ['letterboxd', 'mdblist', 'tmdb', 'custom']),
    ],

    libraries.screen(keywords: ['media folders']),
    libraryVisibility.screen(keywords: [
      'hide library',
      'show in navigation',
      'latest media',
    ]),
    libraries.leaf(
      'enable_multi_server_libraries',
      l10n.multiServerLibraries,
      subtitle: l10n.showLibrariesFromAllServers,
    ),
    libraries.leaf(
      'pref_merge_recent_rows_by_type',
      l10n.mergeRecentRowsByType,
      subtitle: l10n.mergeRecentRowsByTypeDescription,
      keywords: ['combine', 'homepage', 'rows', 'recent', 'released'],
    ),
    libraries.leaf(
      'pref_group_items_into_collections',
      l10n.groupItemsIntoCollections,
      subtitle: l10n.hideCollectionAssociatedItems,
      keywords: ['boxsets'],
    ),
    libraries.leaf(
      'pref_show_media_details_on_library_page',
      l10n.showMediaDetailsOnLibraryPage,
      subtitle: l10n.showMediaDetailsOnLibraryPageDescription,
    ),
    libraries.leaf(
      'pref_use_detailed_sub_headings',
      l10n.useDetailedSubHeadings,
      subtitle: l10n.useDetailedSubHeadingsDescription,
    ),
    libraries.leaf(
      'pref_hide_backdrops_in_libraries',
      l10n.hideBackdropsInLibraries,
      keywords: ['background'],
    ),

    mediaBar.screen(keywords: ['featured', 'carousel', 'banner', 'hero']),
    mediaBar.leaf('mediaBarMode', l10n.mediaBarMode),
    mediaBar.leaf('mediaBarContentType', l10n.contentType, keywords: [
      'movies',
      'shows',
    ]),
    mediaBar.leaf('mediaBarSourceType', l10n.mediaBarSourceType, keywords: [
      'random',
      'recently added',
      'recently released',
      'newest',
    ]),
    mediaBar.leaf('mediaBarItemCount', l10n.itemCount),
    mediaBar.leaf('mediaBarLibraryIds', l10n.sourceLibraries),
    mediaBar.leaf('mediaBarCollectionIds', l10n.sourceCollections),
    mediaBar.leaf('mediaBarExcludedGenres', l10n.excludedGenres),
    mediaBar.leaf(
      'mediaBarAutoAdvance',
      l10n.autoAdvance,
      subtitle: l10n.autoAdvanceSlides,
      keywords: ['rotate', 'slideshow'],
    ),
    mediaBar.leaf('mediaBarIntervalMs', l10n.autoAdvanceInterval),

    previews.screen(keywords: ['trailers', 'autoplay']),
    previews.leaf(
      'mediaBarTrailerPreview',
      l10n.trailerPreview,
      subtitle: l10n.autoPlayTrailers,
    ),
    previews.leaf(
      'mediaBarTrailerAudio',
      l10n.trailerAudio,
      subtitle: l10n.enableTrailerAudio,
      keywords: ['mute'],
    ),
    previews.leaf(
      'mediaBarTrailerCaptions',
      l10n.trailerCaptions,
      subtitle: l10n.trailerCaptionsDescription,
      keywords: ['subtitles'],
    ),
    previews.leaf(
      'episodePreviewEnabled',
      l10n.mediaPreview,
      subtitle: l10n.mediaPreviewDescription,
    ),
    previews.leaf(
      'previewAudioEnabled',
      l10n.previewAudio,
      subtitle: l10n.enablePreviewAudio,
      keywords: ['mute'],
    ),

    seasonal.screen(keywords: ['snow', 'fireworks', 'confetti', 'holiday']),
    themeMusic.screen(keywords: ['soundtrack']),
    themeMusic.leaf(
      'themeMusicEnabled',
      l10n.themeMusic,
      subtitle: l10n.playThemeMusicOnDetailPages,
    ),
    themeMusic.leaf('themeMusicVolume', l10n.themeMusicVolume),
    if (!PlatformDetection.isMobile)
      themeMusic.leaf(
        'themeMusicOnHomeRows',
        l10n.themeMusicOnHomeRows,
        subtitle: l10n.playWhenBrowsingHomeScreen,
      ),
    themeMusic.leaf(
      'themeMusicLoop',
      l10n.loopThemeMusic,
      subtitle: l10n.loopThemeMusicSubtitle,
      keywords: ['repeat'],
    ),
    loadingAnimation.screen(keywords: ['spinner', 'runner', 'moon', 'logo', 'loading']),
    loadingAnimation.leaf(
      'loadingAnimationImage',
      l10n.loadingAnimationImage,
    ),
    loadingAnimation.leaf(
      'loadingAnimationSize',
      l10n.loadingAnimationSize,
    ),
    loadingAnimation.leaf(
      'loadingAnimationPosition',
      l10n.loadingAnimationPosition,
    ),
    loadingAnimation.leaf(
      'showLoadingAnimationText',
      l10n.showLoadingAnimationText,
    ),

    playback.screen(keywords: ['video', 'audio', 'subtitles', 'player']),
    video.screen(keywords: ['player', 'playback']),
    video.leaf(
      'showDescriptionOnPause',
      l10n.showDescriptionOnPause,
      subtitle: l10n.dimVideoShowOverview,
    ),
    video.leaf('player_zoom_mode', l10n.playerZoomMode, keywords: [
      'aspect ratio',
      'crop',
      'stretch',
    ]),
    playbackTime.screen(keywords: [
      'time left',
      'time remaining',
      'ends at',
      'duration',
      'progress bar',
    ]),
    playbackTime.leaf(
      'playback_time_above_left',
      l10n.playbackTimeAboveBarLeft,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'playback_time_above_center',
      l10n.playbackTimeAboveBarCenter,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'playback_time_above_right',
      l10n.playbackTimeAboveBarRight,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'playback_time_below_left',
      l10n.playbackTimeBelowBarLeft,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'playback_time_below_center',
      l10n.playbackTimeBelowBarCenter,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'playback_time_below_right',
      l10n.playbackTimeBelowBarRight,
      subtitle: l10n.playbackTimeSlotDescription,
    ),
    playbackTime.leaf(
      'music_playback_time_display',
      l10n.playbackTimeMusicSection,
      subtitle: l10n.settingsMusicPlaybackTimeDescription,
      keywords: ['music', 'song', 'track'],
    ),
    video.leaf(
      'trickplay_mode',
      l10n.trickPlay,
      subtitle: l10n.showPreviewThumbnailsWhenSeeking,
      keywords: [
        'scrubbing',
        'seek thumbnails',
        'preview size',
        'distance from seekbar',
        'follow scrub',
      ],
    ),
    if (PlatformDetection.useDesktopUi)
      video.leaf(
        'desktop_scroll_wheel_action',
        l10n.settingsScrollWheelAction,
        keywords: ['mouse', 'volume'],
      ),
    video.leaf('pref_resume_preroll', l10n.resumeRewind, keywords: [
      'rewind on resume',
    ]),
    video.leaf('unpauseRewindDuration', l10n.unpauseRewind),
    video.leaf('skipBackLength', l10n.skipBackLength, keywords: ['seek back']),
    video.leaf('skipForwardLength', l10n.skipForwardLength, keywords: [
      'seek forward',
    ]),
    if (PlatformDetection.useMobileUi) ...[
      video.leaf(
        'osdLockEnabled',
        l10n.osdLockButton,
        subtitle: l10n.osdLockButtonDescription,
        keywords: ['lock controls'],
      ),
      video.leaf(
        'playerSwipeGestures',
        l10n.playerSwipeGestures,
        subtitle: l10n.playerSwipeGesturesDescription,
        keywords: ['swipe', 'gestures', 'volume', 'brightness'],
      ),
    ],
    osdButtons.screen(keywords: [
      'player buttons',
      'hide',
      'reorder',
      'quality',
      'zoom',
      'speed',
    ]),
    if (PlatformDetection.isAndroid)
      video.leaf(
        'playback_engine_preference',
        l10n.settingsPlaybackEngineAndroidTv,
        keywords: ['exoplayer', 'mpv', 'media3', 'engine'],
      ),
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) ...[
      video.leaf(
        'dolby_vision_fallback_behavior',
        l10n.settingsDolbyVisionFallback,
        keywords: ['hdr'],
      ),
      video.leaf(
        'dolby_vision_profile7_direct_play_behavior',
        l10n.settingsDolbyVisionProfile7DirectPlay,
        keywords: ['hdr', 'profile 7'],
      ),
      video.leaf(
        'refresh_rate_switching_behavior',
        l10n.refreshRateSwitching,
        keywords: ['frame rate', 'hz', '24p'],
      ),
    ],
    if (!PlatformDetection.isWeb && !PlatformDetection.isAppleTV)
      video.leaf(
        'hardware_decoding',
        l10n.hardwareDecoding,
        subtitle: l10n.hardwareDecodingSubtitle,
        keywords: ['gpu', 'acceleration'],
      ),
    if (PlatformDetection.isWindows)
      video.leaf('auto_hdr_switching_behavior', l10n.autoHdrSwitching),
    if (PlatformDetection.supportsNativeHdrWindow)
      video.leaf(
        'native_hdr_output',
        l10n.nativeHdrOutput,
        subtitle: l10n.nativeHdrOutputDescription,
        keywords: ['hdr10', 'passthrough', 'tone mapping'],
      ),
    video.leaf(
      'pref_live_direct',
      l10n.settingsLiveTvDirect,
      subtitle: l10n.settingsLiveTvDirectSubtitle,
      keywords: ['live tv'],
    ),
    video.leaf('pref_max_bitrate', l10n.maxStreamingBitrate, keywords: [
      'quality',
      'bandwidth',
      'transcode',
    ]),
    video.leaf('pref_max_video_resolution', l10n.maxResolution, keywords: [
      '4k',
      '1080p',
      'transcode',
    ]),

    audio.screen(keywords: ['sound', 'passthrough']),
    audio.leaf(
      'audio_night_mode',
      l10n.nightMode,
      subtitle: l10n.compressDynamicRange,
      keywords: ['loudness', 'volume leveling'],
    ),
    audio.leaf(
      'pref_audio_language',
      l10n.defaultAudioLanguage,
      keywords: ['track'],
    ),
    audio.leaf('pref_fallback_audio_language', l10n.fallbackAudioLanguage),
    audio.leaf(
      'pref_prefer_default_audio_track',
      l10n.preferDefaultAudioTrack,
      subtitle: l10n.preferDefaultAudioTrackDescription,
    ),
    audio.leaf(
      'pref_prefer_audio_description',
      l10n.preferAudioDescription,
      subtitle: l10n.preferAudioDescriptionDescription,
      keywords: ['accessibility'],
    ),
    if (!PlatformDetection.isWeb) ...[
      audio.leaf(
        'pref_audio_passthrough_mode',
        l10n.settingsAudioPassthroughMode,
        keywords: ['passthrough', 'bitstream', 'receiver', 'output'],
      ),
      audio.leaf(
        'pref_downmix_to_stereo',
        l10n.downmixToStereo,
        keywords: ['stereo', 'downmix', '2.0'],
      ),
      audio.leaf(
        'pref_max_audio_channels',
        l10n.settingsMaxAudioChannels,
        keywords: ['5.1', '7.1', 'stereo'],
      ),
      audio.leaf('audio_fallback_codec', l10n.settingsAudioFallbackCodec),
      audio.leaf(
        'pref_passthrough_ac3',
        l10n.ac3Passthrough,
        keywords: ['dolby digital', 'bitstream'],
      ),
      audio.leaf(
        'pref_passthrough_eac3',
        l10n.settingsAudioEac3Passthrough,
        keywords: ['dolby digital plus', 'atmos', 'bitstream'],
      ),
      audio.leaf(
        'pref_passthrough_dts_core',
        l10n.settingsAudioDtsCorePassthrough,
        keywords: ['dts', 'bitstream'],
      ),
      audio.leaf(
        'pref_passthrough_dts_hd',
        l10n.settingsAudioDtsHdPassthrough,
        keywords: ['dts', 'dts:x', 'bitstream'],
      ),
      audio.leaf(
        'pref_passthrough_truehd',
        l10n.settingsAudioTrueHdPassthrough,
        keywords: ['truehd', 'atmos', 'bitstream'],
      ),
    ],

    subtitles.screen(keywords: ['captions', 'cc']),
    subtitles.leaf('pref_subtitle_mode', l10n.subtitleMode, keywords: [
      'always',
      'forced',
      'none',
    ]),
    subtitles.leaf('pref_subtitle_language', l10n.defaultSubtitleLanguage),
    subtitles.leaf(
      'pref_fallback_subtitle_language',
      l10n.fallbackSubtitleLanguage,
    ),
    subtitles.leaf(
      'prefer_sdh_subtitles',
      l10n.preferSdhSubtitles,
      subtitle: l10n.preferSdhSubtitlesSubtitle,
      keywords: ['hearing impaired', 'accessibility'],
    ),
    subtitles.leaf(
      'pgs_enabled',
      l10n.pgsDirectPlay,
      subtitle: l10n.directPlayPgsSubtitles,
    ),
    subtitles.leaf(
      'ass_enabled',
      l10n.assSsaDirectPlay,
      subtitle: l10n.directPlayAssSsaSubtitles,
      keywords: ['anime'],
    ),
    subtitleStyle.screen(keywords: [
      'subtitle size',
      'subtitle color',
      'font',
      'position',
    ]),
    subtitleStyle.leaf('subtitles_text_color', l10n.textFillColor),
    subtitleStyle.leaf(
      'subtitles_text_stroke_color',
      l10n.textStrokeColor,
      keywords: ['outline'],
    ),
    subtitleStyle.leaf('subtitles_background_color', l10n.backgroundColor),
    subtitleStyle.leaf('subtitles_text_size', l10n.subtitleSize, keywords: [
      'font size',
    ]),
    subtitleStyle.leaf(
      'subtitles_offset_position',
      l10n.verticalOffset,
      keywords: ['position', 'height'],
    ),
    subtitleStyle.leaf(
      'subtitles_hdr_separate',
      l10n.subtitleHdrSeparate,
      subtitle: l10n.subtitleHdrSeparateSubtitle,
      keywords: ['hdr', 'brightness', 'grey'],
    ),

    automation.screen(keywords: ['skip intro', 'autoplay', 'queue']),
    automation.leaf(
      'pref_enable_cinema_mode',
      l10n.settingsCinemaMode,
      subtitle: l10n.settingsCinemaModeSubtitle,
      keywords: ['trailers before movie'],
    ),
    for (final type in configurableMediaSegmentTypes)
      automation.leaf(
        'media_segment_actions_${type.name}',
        l10n.settingsMediaSegmentTypeAction(type.displayName),
        keywords: [
          'skip',
          'segments',
          type.name,
          if (type == MediaSegmentType.outro) 'credits',
        ],
      ),
    automation.leaf(
      'pref_media_segment_countdown',
      l10n.settingsMediaSegmentCountdown,
    ),
    automation.leaf(
      'pref_media_segment_auto_hide',
      l10n.settingsSkipButtonAutoHide,
      subtitle: l10n.settingsSkipButtonAutoHideDescription,
      keywords: ['auto dismiss', 'skip intro', 'skip button'],
    ),
    automation.leaf(
      'pref_autoplay_next_episode',
      l10n.autoplayNextEpisode,
      subtitle: l10n.autoplayNextEpisodeSubtitle,
      keywords: ['binge'],
    ),
    automation.leaf('next_up_behavior', l10n.nextUpDisplay, keywords: [
      'next episode prompt',
    ]),
    automation.leaf('next_up_timeout', l10n.nextUpTimeout),
    automation.leaf(
      'replace_skip_outro_with_next_up',
      l10n.replaceSkipOutroWithNextUpDisplay,
      subtitle: l10n.replaceSkipOutroWithNextUpDisplaySubtitle,
    ),
    automation.leaf(
      'enable_still_watching',
      l10n.stillWatchingPrompt,
      subtitle: 'Prompt to Continue Watching after X consecutive episodes.',
      keywords: ['are you still watching'],
    ),

    if (PlatformDetection.supportsOfflineDownloads &&
        !PlatformDetection.isWeb) ...[
      downloads.screen(keywords: ['offline', 'storage']),
      downloads.leaf(
        'download_default_quality',
        l10n.defaultDownloadQuality,
        keywords: ['offline quality'],
      ),
      downloads.leaf(
        'download_wifi_only',
        l10n.wifiOnlyDownloads,
        subtitle: l10n.onlyDownloadOnWifi,
        keywords: ['cellular', 'data'],
      ),
      downloads.leaf(
        'download_concurrent_count',
        l10n.settingsConcurrentDownloads,
        subtitle: l10n.settingsConcurrentDownloadsDescription,
        keywords: ['parallel', 'simultaneous'],
      ),
      downloads.leaf('download_storage_limit_mb', l10n.storageLimit),
      downloads.leaf('download_custom_path', l10n.downloadLocation, keywords: [
        'folder',
        'path',
      ]),
      downloads.leaf(
        'clear_all_downloads',
        l10n.clearAllDownloads,
        keywords: ['delete downloads'],
      ),
    ],

    if (canToggleGameBackend)
      playback.leaf(
        'pref_use_native_emulator',
        l10n.useNativeEmulator,
        subtitle: l10n.useNativeEmulatorSubtitle,
        keywords: ['games', 'retroarch'],
      ),
    if (supportsCoreDownloads && usesNativeGameBackend)
      emulatorCores.screen(keywords: ['retroarch', 'games', 'systems']),
    if (usesNativeGameBackend)
      downloadedGames.screen(keywords: ['roms', 'storage']),

    syncplay.screen(keywords: ['watch together', 'group', 'sync']),
    syncplay.leaf(
      'pref_syncplay_enabled',
      l10n.settingsSyncplayEnabled,
      subtitle: l10n.settingsSyncplayEnabledSubtitle,
    ),
    syncplay.leaf(
      'pref_show_syncplay_button',
      l10n.settingsSyncplayButton,
      subtitle: l10n.settingsSyncplayButtonSubtitle,
    ),

    advanced.screen(keywords: ['mpv', 'cache', 'tuning']),
    advanced.leaf('video_start_delay', l10n.settingsVideoStartDelay),
    if (PlatformDetection.isAndroid)
      advanced.leaf('pref_performance_mode', l10n.performanceMode, keywords: [
        'memory',
        'low ram',
        'trailers',
        'previews',
        'slow',
      ]),
    if (!PlatformDetection.isWeb) ...[
      advanced.leaf('image_cache_limit_mb', l10n.imageCacheLimit, keywords: [
        'storage',
        'disk',
      ]),
      advanced.leaf('clear_image_cache', l10n.clearImageCache),
    ],
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) ...[
      advanced.leaf(
        'exoplayer_prefer_ffmpeg',
        l10n.preferSoftwareDecoders,
        subtitle: l10n.preferSoftwareDecodersSubtitle,
        keywords: ['ffmpeg'],
      ),
      advanced.leaf(
        'media3_tunneling_disabled',
        l10n.enableTunnelingTitle,
        subtitle: l10n.enableTunnelingSubtitle,
      ),
    ],
    if (PlatformDetection.isAndroid) ...[
      advanced.leaf(
        'external_player',
        l10n.useExternalPlayer,
        subtitle: l10n.useExternalPlayerSubtitle,
        keywords: ['vlc', 'just player'],
      ),
    ],
    if (!PlatformDetection.isTV &&
        !PlatformDetection.isIOS &&
        !PlatformDetection.isWeb)
      advanced.leaf(
        'custom_mpv_conf_enabled',
        l10n.enableCustomMpvConf,
        subtitle: l10n.applyMpvConfBeforePlayback,
        keywords: ['mpv config'],
      ),

    integrations.screen(keywords: ['plugin', 'seerr', 'ratings']),
    plugin.screen(keywords: ['moonbase', 'server sync', 'status']),
    metadata.screen(keywords: ['ratings', 'mdblist', 'tmdb']),
    metadata.leaf(
      'enableAdditionalRatings',
      l10n.additionalRatings,
      subtitle: l10n.showMdbListAndTmdbRatings,
      keywords: ['imdb', 'rotten tomatoes'],
    ),
    metadata.leaf(
      'enableEpisodeRatings',
      l10n.episodeRatings,
      subtitle: l10n.showRatingsOnEpisodes,
    ),
    metadata.leaf(
      'showRatingLabels',
      l10n.ratingLabels,
      subtitle: l10n.showLabelsNextToIcons,
    ),
    metadata.leaf(
      'showRatingBadges',
      l10n.ratingBadges,
      subtitle: l10n.showDecorativeBadges,
    ),
    ratingSources.screen(keywords: [
      'rotten tomatoes',
      'imdb',
      'metacritic',
      'trakt',
      'letterboxd',
      'reorder',
    ]),
    seerr.screen(keywords: [
      'requests',
      'jellyseerr',
      'overseerr',
      'discover',
      'nsfw',
      'notifications',
    ]),

    about.screen(keywords: ['version', 'update', 'discord', 'license']),
    if (AppDistribution.supportsInAppUpdates)
      about.leaf(
        'check_updates',
        l10n.settingsCheckForUpdates,
        subtitle: l10n.settingsCheckForUpdatesSubtitle,
      ),
    about.leaf(
      'report_issue',
      l10n.settingsReportAnIssue,
      subtitle: l10n.settingsReportAnIssueSubtitle,
      keywords: ['bug', 'github'],
    ),
    about.leaf(
      'run_setup_again',
      l10n.runSetupAgain,
      keywords: ['setup', 'wizard', 'first run', 'onboarding', 'quick start'],
    ),
    diagnostics.screen(keywords: ['logs', 'report', 'debug']),
    diagnostics.leaf(
      'pref_crash_reports_enabled',
      'Send crash reports to server',
      keywords: ['error', 'bug', 'crashes'],
    ),
  ];

  assert(() {
    final ids = <String>{};
    for (final entry in entries) {
      if (!ids.add(entry.id)) {
        throw StateError('duplicate settings search id: ${entry.id}');
      }
    }
    return true;
  }());

  return entries;
}
