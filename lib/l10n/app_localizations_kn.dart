// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಮೂನ್ಫಿನ್';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'ತ್ವರಿತ ಸಂಪರ್ಕ';

  @override
  String get password => 'ಪಾಸ್ವರ್ಡ್';

  @override
  String get username => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get email => 'ಇಮೇಲ್';

  @override
  String get quickConnectInstruction =>
      'ನಿಮ್ಮ ಸರ್ವರ್‌ನ ವೆಬ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿ ಈ ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ:';

  @override
  String get waitingForAuthorization => 'ದೃಢೀಕರಣಕ್ಕಾಗಿ ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get back => 'ಹಿಂದೆ';

  @override
  String get serverUnavailable => 'ಸರ್ವರ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get loginFailed => 'ಲಾಗಿನ್ ವಿಫಲವಾಗಿದೆ';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'ಯಾರು ನೋಡುತ್ತಿದ್ದಾರೆ?';

  @override
  String get addUser => 'ಬಳಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String get selectServer => 'ಸರ್ವರ್ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'ಉಳಿಸಿದ ಸರ್ವರ್‌ಗಳು';

  @override
  String get discoveredServers => 'ಪತ್ತೆಯಾದ ಸರ್ವರ್‌ಗಳು';

  @override
  String get noneFound => 'ಯಾವುದೂ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get unableToConnectToServer => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String get addServer => 'ಸರ್ವರ್ ಸೇರಿಸಿ';

  @override
  String get embyConnect => 'Emby ಸಂಪರ್ಕಿಸಿ';

  @override
  String get removeServer => 'ಸರ್ವರ್ ತೆಗೆದುಹಾಕಿ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'ರದ್ದುಮಾಡು';

  @override
  String get remove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String get connectToServer => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ';

  @override
  String get serverAddress => 'ಸರ್ವರ್ ವಿಳಾಸ';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'ಸಂಪರ್ಕಿಸಿ';

  @override
  String get secureStorageUnavailable => 'ಸುರಕ್ಷಿತ ಸಂಗ್ರಹಣೆ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ನಿಮ್ಮ ಸಿಸ್ಟಂ ಕೀರಿಂಗ್ ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಲಾಗಿನ್ ಅನ್ನು ಮುಂದುವರಿಸಬಹುದು, ಆದರೆ ಕೀರಿಂಗ್ ಅನ್‌ಲಾಕ್ ಆಗುವವರೆಗೆ ಸುರಕ್ಷಿತ ಟೋಕನ್ ಸಂಗ್ರಹಣೆ ಲಭ್ಯವಿರುವುದಿಲ್ಲ.';

  @override
  String get ok => 'ಸರಿ';

  @override
  String get settingsAppearanceTheme => 'ಅಪ್ಲಿಕೇಶನ್ ಥೀಮ್';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Classic is the original centered moonfin layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Expanded Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Automatically show tab content while browsing tabs. Turn off to open and close each tab manually.';

  @override
  String get recommendationSystem => 'Recommendation System';

  @override
  String get recommendationSystemSubtitle =>
      'Use the Moonfin Recommends local-library algorithm or the online TMDb\'s Similarity Metrics. Note: Online recommendations require Seerr integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Apply Parental Rating Cap?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limit Moonfin Recommends suggestions by parental rating of target media';

  @override
  String get interfaceStyle => '';

  @override
  String get interfaceStyleSubtitle => '';

  @override
  String get interfaceStyleAutomatic => '';

  @override
  String get interfaceStyleApple => '';

  @override
  String get interfaceStyleMaterial => '';

  @override
  String get glassQuality => 'Glass Quality';

  @override
  String get glassQualitySubtitle =>
      'Auto picks the best glass effect for this device. Full forces real blur; Reduced uses a lightweight glass that saves GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸದೆಯೇ Moonfin ಮತ್ತು Neon Pulse ನಡುವೆ ಬದಲಿಸಿ';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'ಮೂನ್ಫಿನ್';

  @override
  String get themeMoonfinSubtitle =>
      'ಪ್ರಸ್ತುತ Moonfin ನೋಟ ನೀವೆಲ್ಲರೂ ಪ್ರೀತಿಸುವಂತೆ ಮಾಡಿದ್ದೀರಿ';

  @override
  String get themeNeonPulse => 'ನಿಯಾನ್ ಪಲ್ಸ್';

  @override
  String get themeNeonPulseSubtitle =>
      'ಮೆಜೆಂಟಾ ಗ್ಲೋ, ಸಯಾನ್ ಪಠ್ಯ ಮತ್ತು ಬಲವಾದ ಕ್ರೋಮ್ ಕಾಂಟ್ರಾಸ್ಟ್‌ನೊಂದಿಗೆ ಸಿಂಥ್ವೇವ್ ಸ್ಟೈಲಿಂಗ್';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

  @override
  String get embyConnectSignInSubtitle =>
      'ನಿಮ್ಮ Emby ಸಂಪರ್ಕ ಖಾತೆಯೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get emailOrUsername => 'ಇಮೇಲ್ ಅಥವಾ ಬಳಕೆದಾರಹೆಸರು';

  @override
  String get selectAServer => 'ಸರ್ವರ್ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get tryAgain => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get noLinkedServers =>
      'ಈ Emby ಸಂಪರ್ಕ ಖಾತೆಗೆ ಯಾವುದೇ ಸರ್ವರ್‌ಗಳನ್ನು ಲಿಂಕ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get invalidEmbyConnectCredentials => 'ಅಮಾನ್ಯ Emby ಸಂಪರ್ಕ ರುಜುವಾತುಗಳು';

  @override
  String get invalidEmbyConnectLogin =>
      'ಅಮಾನ್ಯ Emby ಬಳಕೆದಾರಹೆಸರು ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get embyConnectExchangeNotSupported =>
      'ಸರ್ವರ್ Emby ಸಂಪರ್ಕ ವಿನಿಮಯವನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ';

  @override
  String get embyConnectNetworkError =>
      'Emby ಸಂಪರ್ಕ ಅಥವಾ ಆಯ್ಕೆಮಾಡಿದ ಸರ್ವರ್ ಅನ್ನು ಸಂಪರ್ಕಿಸುವಾಗ ನೆಟ್‌ವರ್ಕ್ ದೋಷ';

  @override
  String get loadingLinkedServers =>
      'ಲಿಂಕ್ ಮಾಡಲಾದ ಸರ್ವರ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get connectingToServerEllipsis => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get noReachableAddress => 'ತಲುಪಬಹುದಾದ ವಿಳಾಸವನ್ನು ಒದಗಿಸಲಾಗಿಲ್ಲ';

  @override
  String get invalidServerExchangeResponse =>
      'ಸರ್ವರ್ ಎಕ್ಸ್ಚೇಂಜ್ ಎಂಡ್ ಪಾಯಿಂಟ್ನಿಂದ ಅಮಾನ್ಯ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin ನಿರ್ಗಮಿಸುವುದೇ?';

  @override
  String get exitAppConfirmation => 'ನೀವು ನಿರ್ಗಮಿಸಲು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get exit => 'ನಿರ್ಗಮಿಸಿ';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Paused';

  @override
  String get gameSaveState => 'Save state';

  @override
  String get gameLoadState => 'Load state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Emulator settings';

  @override
  String get gameNoCoreOptions => 'This core has no adjustable options.';

  @override
  String get gameHoldToOpenMenu => 'Hold to open menu';

  @override
  String get gamePlaybackUnsupported =>
      'Game playback is not supported on this device yet.';

  @override
  String get noHomeRowsLoaded => 'ಯಾವುದೇ ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ';

  @override
  String get noHomeRowsHint =>
      'ಸಕ್ರಿಯ ಹೋಮ್ ವಿಭಾಗಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಅಥವಾ ಕಡಿಮೆ ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get retryHomeRows => 'ಮುಖಪುಟ ಸಾಲುಗಳನ್ನು ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get guide => 'ಮಾರ್ಗದರ್ಶಿ';

  @override
  String get recordings => 'ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get schedule => 'ವೇಳಾಪಟ್ಟಿ';

  @override
  String get series => 'ಸರಣಿ';

  @override
  String get noItemsFound => 'ಯಾವುದೇ ಐಟಂಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get home => 'ಮನೆ';

  @override
  String get browseAll => 'ಎಲ್ಲವನ್ನೂ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get genres => 'ಪ್ರಕಾರಗಳು';

  @override
  String get collectionPlaceholder => 'ಸಂಗ್ರಹಣೆಯ ಐಟಂಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get browseByLetter => 'ಅಕ್ಷರದ ಮೂಲಕ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'ವರ್ಣಮಾಲೆಯ ಬ್ರೌಸ್ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

  @override
  String get suggestions => 'ಸಲಹೆಗಳು';

  @override
  String get suggestionsPlaceholder => 'ಸೂಚಿಸಿದ ಐಟಂಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get failedToLoadLibraries => 'ಲೈಬ್ರರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noLibrariesFound => 'ಯಾವುದೇ ಗ್ರಂಥಾಲಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get library => 'ಗ್ರಂಥಾಲಯ';

  @override
  String get displaySettings => 'ಪ್ರದರ್ಶನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get allGenres => 'ಎಲ್ಲಾ ಪ್ರಕಾರಗಳು';

  @override
  String get noGenresFound => 'ಯಾವುದೇ ಪ್ರಕಾರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ಈ ಫೋಲ್ಡರ್ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'ಮೆಚ್ಚಿನವುಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get retry => 'ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get noFavoritesYet => 'ಇನ್ನೂ ಯಾವುದೇ ಮೆಚ್ಚಿನವುಗಳಿಲ್ಲ';

  @override
  String get favorites => 'ಮೆಚ್ಚಿನವುಗಳು';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'ಮುಂದುವರೆಯುತ್ತಿದೆ';

  @override
  String get ended => 'ಕೊನೆಗೊಂಡಿದೆ';

  @override
  String get sortAndFilter => 'ವಿಂಗಡಿಸಿ ಮತ್ತು ಫಿಲ್ಟರ್ ಮಾಡಿ';

  @override
  String get type => 'ಟೈಪ್ ಮಾಡಿ';

  @override
  String get sortBy => 'ವಿಂಗಡಿಸಿ';

  @override
  String get display => 'ಪ್ರದರ್ಶನ';

  @override
  String get imageType => 'ಚಿತ್ರದ ಪ್ರಕಾರ';

  @override
  String get posterSize => 'ಪೋಸ್ಟರ್ ಗಾತ್ರ';

  @override
  String get small => 'ಚಿಕ್ಕದು';

  @override
  String get medium => 'ಮಧ್ಯಮ';

  @override
  String get large => 'ದೊಡ್ಡದು';

  @override
  String get extraLarge => 'ಹೆಚ್ಚುವರಿ ದೊಡ್ಡದು';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'ವೀಕ್ಷಣೆಗಳು';

  @override
  String get albums => 'ಆಲ್ಬಮ್‌ಗಳು';

  @override
  String get albumArtists => 'ಆಲ್ಬಮ್ ಕಲಾವಿದರು';

  @override
  String get artists => 'ಕಲಾವಿದರು';

  @override
  String get bookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';

  @override
  String get noSavedBookmarks =>
      'ಈ ಶೀರ್ಷಿಕೆಗಾಗಿ ಇನ್ನೂ ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿಲ್ಲ.';

  @override
  String get openBook => 'ಪುಸ್ತಕ ತೆರೆಯಿರಿ';

  @override
  String get chapter => 'ಅಧ್ಯಾಯ';

  @override
  String get page => 'ಪುಟ';

  @override
  String get bookmark => 'ಬುಕ್ಮಾರ್ಕ್';

  @override
  String get justNow => 'ಈಗಷ್ಟೇ';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get discoverySubjects => 'ಡಿಸ್ಕವರಿ ವಿಷಯಗಳು';

  @override
  String get pickDiscoverySubjects =>
      'Discover ನಲ್ಲಿ ತೋರಿಸಲು ಯಾವ ವಿಷಯದ ಫೀಡ್‌ಗಳನ್ನು ಆರಿಸಿ.';

  @override
  String get apply => 'ಅನ್ವಯಿಸು';

  @override
  String get openLink => 'ಲಿಂಕ್ ತೆರೆಯಿರಿ';

  @override
  String get scanWithYourPhone => 'ನಿಮ್ಮ ಫೋನ್‌ನೊಂದಿಗೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get audiobookGenres => 'ಆಡಿಯೋಬುಕ್ ಪ್ರಕಾರಗಳು';

  @override
  String get pickAudiobookGenres =>
      'ಆಡಿಯೋಬುಕ್ ಡಿಸ್ಕವರ್‌ನಲ್ಲಿ ಯಾವ ಪ್ರಕಾರಗಳನ್ನು ತೋರಿಸಬೇಕೆಂದು ಆರಿಸಿ.';

  @override
  String get discoverAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String get librivoxDescription =>
      'LibriVox ನಿಂದ ಜನಪ್ರಿಯ ಸಾರ್ವಜನಿಕ ಡೊಮೇನ್ ಶೀರ್ಷಿಕೆಗಳು.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'ಎಡಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get scrollRight => 'ಬಲಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get couldNotLoadGenre =>
      'ಇದೀಗ ಈ ಪ್ರಕಾರವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get continueReading => 'ಓದುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get savedHighlights => 'ಉಳಿಸಿದ ಮುಖ್ಯಾಂಶಗಳು';

  @override
  String get continueListening => 'ಕೇಳುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get listen => 'ಕೇಳು';

  @override
  String get resume => 'ಪುನರಾರಂಭಿಸಿ';

  @override
  String get failedToLoadLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get popularNow => 'ಈಗ ಜನಪ್ರಿಯವಾಗಿದೆ';

  @override
  String get savedForLater => 'ನಂತರ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get topListens => 'ಟಾಪ್ ಕೇಳುಗರು';

  @override
  String get unreadDiscoveries => 'ಓದದ ಅನ್ವೇಷಣೆಗಳು';

  @override
  String get pickUpAgain => 'ಮತ್ತೆ ಎತ್ತಿಕೊಳ್ಳಿ';

  @override
  String get bookHighlightsDescription =>
      'ಮುಖ್ಯಾಂಶಗಳು, ಮೆಚ್ಚಿನವುಗಳು ಅಥವಾ ಓದುವ ಪ್ರಗತಿಯೊಂದಿಗೆ ನಿಮ್ಮ ಪುಸ್ತಕಗಳು.';

  @override
  String get handPickedFromLibrary => 'ನಿಮ್ಮ ಲೈಬ್ರರಿಯಿಂದ ಕೈಯಿಂದ ಆರಿಸಲಾಗಿದೆ.';

  @override
  String get handPickedFromListeningQueue =>
      'ನಿಮ್ಮ ಆಲಿಸುವ ಸರದಿಯಿಂದ ಕೈಯಿಂದ ಆರಿಸಲಾಗಿದೆ.';

  @override
  String get booksWithHighlights =>
      'ಮುಖ್ಯಾಂಶಗಳು, ಮೆಚ್ಚಿನವುಗಳು ಅಥವಾ ಓದುವ ಪ್ರಗತಿಯೊಂದಿಗೆ ಪುಸ್ತಕಗಳು.';

  @override
  String get jumpBackNarration =>
      'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ಬೇಟೆಯಾಡದೆ ನಿರೂಪಣೆಗೆ ಹಿಂತಿರುಗಿ.';

  @override
  String get unreadBooksReady =>
      'ಮುಂದಿನ ಸ್ತಬ್ಧ ಗಂಟೆಗೆ ಓದದ ಪುಸ್ತಕಗಳು ಸಿದ್ಧವಾಗಿವೆ.';

  @override
  String get quickAccessFavorites =>
      'ನೀವು ಮರಳಿ ಬರುತ್ತಿರುವ ಪುಸ್ತಕಗಳಿಗೆ ತ್ವರಿತ ಪ್ರವೇಶ.';

  @override
  String get searchAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get searchYourLibrary => 'ನಿಮ್ಮ ಲೈಬ್ರರಿಯನ್ನು ಹುಡುಕಿ';

  @override
  String get pickUpStory => 'ನೀವು ನಿಲ್ಲಿಸಿದ ಕಥೆಯನ್ನು ಎತ್ತಿಕೊಳ್ಳಿ';

  @override
  String get savedPlacesChapters =>
      'ನಿಮ್ಮ ಉಳಿಸಿದ ಸ್ಥಳಗಳು ಮತ್ತು ಅಪೂರ್ಣ ಅಧ್ಯಾಯಗಳು';

  @override
  String authorsCount(int count) {
    return '$count authors';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
  }

  @override
  String get readyWhenYouAre => 'ನೀವು ಇರುವಾಗ ಸಿದ್ಧ';

  @override
  String get details => 'ವಿವರಗಳು';

  @override
  String get listeningRoom => 'ಆಲಿಸುವ ಕೊಠಡಿ';

  @override
  String get bookmarksAndProgress => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು ಮತ್ತು ಪ್ರಗತಿ';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'ಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get allTitles => 'ಎಲ್ಲಾ ಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get authors => 'ಲೇಖಕರು';

  @override
  String get browseByAuthor => 'ಲೇಖಕರಿಂದ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get browseByGenre => 'ಪ್ರಕಾರದ ಪ್ರಕಾರ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get discover => 'ಅನ್ವೇಷಿಸಿ';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library ರಿಂದ ವಿಷಯದ ಮೂಲಕ ಟ್ರೆಂಡಿಂಗ್ ಶೀರ್ಷಿಕೆಗಳು.';

  @override
  String get noBookmarkedItems => 'ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಲಾದ ಐಟಂಗಳು ಇನ್ನೂ ಇಲ್ಲ';

  @override
  String get nothingMatchesSection =>
      'ಈ ವಿಭಾಗಕ್ಕೆ ಇನ್ನೂ ಯಾವುದೂ ಹೊಂದಾಣಿಕೆಯಾಗುತ್ತಿಲ್ಲ. ಇನ್ನೊಂದು ಟ್ಯಾಬ್ ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ ಲೈಬ್ರರಿ ಸಿಂಕ್ ಮುಗಿದ ನಂತರ ಹಿಂತಿರುಗಿ.';

  @override
  String get audiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'ಫೋಲ್ಡರ್';

  @override
  String get filters => 'ಶೋಧಕಗಳು';

  @override
  String get readingStatus => 'ಓದುವ ಸ್ಥಿತಿ';

  @override
  String get playedStatus => 'ಆಡಿದ ಸ್ಥಿತಿ';

  @override
  String get readStatus => 'ಓದು';

  @override
  String get watched => 'ವೀಕ್ಷಿಸಿದರು';

  @override
  String get unread => 'ಓದಿಲ್ಲ';

  @override
  String get unwatched => 'ವೀಕ್ಷಿಸಲಾಗಿಲ್ಲ';

  @override
  String get seriesStatus => 'ಸರಣಿ ಸ್ಥಿತಿ';

  @override
  String get allLibraries => 'ಎಲ್ಲಾ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get books => 'ಪುಸ್ತಕಗಳು';

  @override
  String get latestBooks => 'Latest Books';

  @override
  String get latestAudiobooks => 'Latest Audiobooks';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Book';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% read';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get bookHeroRead => 'Read';

  @override
  String get bookHeroListen => 'Listen';

  @override
  String get author => 'ಲೇಖಕ';

  @override
  String get unknownAuthor => 'ಅಜ್ಞಾತ ಲೇಖಕ';

  @override
  String get uncategorized => 'ವರ್ಗೀಕರಿಸಲಾಗಿಲ್ಲ';

  @override
  String get overview => 'ಅವಲೋಕನ';

  @override
  String get noLibrivoxDescription =>
      'ಈ ಶೀರ್ಷಿಕೆಗೆ LibriVox ಯಾವುದೇ ವಿವರಣೆಯನ್ನು ಇನ್ನೂ ಒದಗಿಸಿಲ್ಲ.';

  @override
  String get readers => 'ಓದುಗರು';

  @override
  String get openLinks => 'ಲಿಂಕ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get librivoxPage => 'LibriVox ಪುಟ';

  @override
  String get internetArchive => 'ಇಂಟರ್ನೆಟ್ ಆರ್ಕೈವ್';

  @override
  String get rssFeed => 'RSS ಫೀಡ್';

  @override
  String get downloadZip => 'ಜಿಪ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String sectionCountLabel(int count) {
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'ಈ ಶೀರ್ಷಿಕೆಗಾಗಿ ಇನ್ನೂ Open Library ನಿಂದ ಯಾವುದೇ ಅವಲೋಕನ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get subjects => 'ವಿಷಯಗಳು';

  @override
  String get all => 'ಎಲ್ಲಾ';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'ಇದೀಗ ಈ ವಿಷಯವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get audiobookDetails => 'ಆಡಿಯೋಬುಕ್ ವಿವರಗಳು';

  @override
  String authorsCountTitle(int count) {
    return '$count Authors';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ಟ್ರ್ಯಾಕ್ ಪಟ್ಟಿ';

  @override
  String get itemListPlaceholder => 'ಐಟಂ ಪಟ್ಟಿ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

  @override
  String get favoriteTracksPlaceholder =>
      'ಮೆಚ್ಚಿನ ಟ್ರ್ಯಾಕ್‌ಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get failedToLoad => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get moreLikeThis => 'ಈ ರೀತಿ ಇನ್ನಷ್ಟು';

  @override
  String get castAndCrew => 'ಪಾತ್ರವರ್ಗ ಮತ್ತು ಸಿಬ್ಬಂದಿ';

  @override
  String get collection => 'ಸಂಗ್ರಹ';

  @override
  String get episodes => 'ಸಂಚಿಕೆಗಳು';

  @override
  String get nextUp => 'ಮುಂದೆ';

  @override
  String get seasons => 'ಋತುಗಳು';

  @override
  String get chapters => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get features => 'ವೈಶಿಷ್ಟ್ಯಗಳು';

  @override
  String get movies => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'ಇತರೆ';

  @override
  String get discography => 'ಧ್ವನಿಮುದ್ರಿಕೆ';

  @override
  String get similarArtists => 'ಇದೇ ಕಲಾವಿದರು';

  @override
  String get tableOfContents => 'ಪರಿವಿಡಿ';

  @override
  String get tracklist => 'ಟ್ರ್ಯಾಕ್‌ಲಿಸ್ಟ್';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'ಜೀವನಚರಿತ್ರೆ';

  @override
  String get authorDetails => 'ಲೇಖಕರ ವಿವರಗಳು';

  @override
  String get noOverviewAvailable =>
      'ಈ ಶೀರ್ಷಿಕೆಗೆ ಇನ್ನೂ ಯಾವುದೇ ಅವಲೋಕನ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noBiographyAvailable => 'ಈ ಲೇಖಕರಿಗೆ ಯಾವುದೇ ಜೀವನಚರಿತ್ರೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noBooksFound => 'ಈ ಲೇಖಕರಿಗೆ ಯಾವುದೇ ಪುಸ್ತಕಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get unableToLoadAuthorDetails =>
      'ಇದೀಗ ಲೇಖಕರ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'ಪ್ರಕಟಣೆಯ ದಿನಾಂಕ ತಿಳಿದಿಲ್ಲ';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Ends at $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Deleted Scenes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scenes';

  @override
  String get shorts => 'Shorts';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get resumeReading => 'ಓದುವಿಕೆಯನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get read => 'ಓದು';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get startOver => 'ಮತ್ತೆ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get restart => 'ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get readOffline => 'ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಓದಿ';

  @override
  String get playOffline => 'ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get audio => 'ಆಡಿಯೋ';

  @override
  String get subtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get version => 'ಆವೃತ್ತಿ';

  @override
  String get cast => 'ಎರಕಹೊಯ್ದ';

  @override
  String get trailer => 'ಟ್ರೈಲರ್';

  @override
  String get finished => 'ಮುಗಿದಿದೆ';

  @override
  String get favorited => 'ಮೆಚ್ಚಿನವು';

  @override
  String get favorite => 'ಮೆಚ್ಚಿನ';

  @override
  String get playlist => 'ಪ್ಲೇಪಟ್ಟಿ';

  @override
  String get downloaded => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get downloadAll => 'ಎಲ್ಲವನ್ನೂ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get download => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get deleteDownloaded => 'ಅಳಿಸಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get goToSeries => 'ಸರಣಿಗೆ ಹೋಗಿ';

  @override
  String get editMetadata => 'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಿಸಿ';

  @override
  String get less => 'ಕಡಿಮೆ';

  @override
  String get more => 'ಇನ್ನಷ್ಟು';

  @override
  String get deleteItem => 'ಐಟಂ ಅಳಿಸಿ';

  @override
  String get deletePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deletePlaylistMessage => 'ಸರ್ವರ್‌ನಿಂದ ಈ ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get deleteItemMessage => 'ಸರ್ವರ್‌ನಿಂದ ಈ ಐಟಂ ಅನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get failedToDeletePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToDeleteItem => 'ಐಟಂ ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get renamePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಮರುಹೆಸರಿಸಿ';

  @override
  String get playlistName => 'ಪ್ಲೇಪಟ್ಟಿ ಹೆಸರು';

  @override
  String get deleteDownloadedAlbum => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಆಲ್ಬಮ್ ಅನ್ನು ಅಳಿಸಿ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get downloadedTracksDeleteFailed =>
      'ಕೆಲವು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get noTracksLoaded => 'ಯಾವುದೇ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'No $itemLabel loaded';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Downloading $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Are you sure you want to delete \"$name\" from the server? This action cannot be undone.';
  }

  @override
  String get itemDeleted => 'ಐಟಂ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get noPlayableTrailerFound => 'ಪ್ಲೇ ಮಾಡಬಹುದಾದ ಟ್ರೇಲರ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್';

  @override
  String get subtitleTrack => 'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್';

  @override
  String get none => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get downloadSubtitlesLabel => 'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ...';

  @override
  String get searchOpenSubtitlesPlugin => 'OpenSubtitles ಪ್ಲಗಿನ್ ಬಳಸಿ ಹುಡುಕಿ';

  @override
  String get downloadSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get selectedSubtitleInvalid => 'ಆಯ್ಕೆಮಾಡಿದ ಉಪಶೀರ್ಷಿಕೆ ಅಮಾನ್ಯವಾಗಿದೆ.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ. Jellyfin ಐಟಂ ಅನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡುವಾಗ ಅದು ಕಾಣಿಸಿಕೊಳ್ಳಲು ಸ್ವಲ್ಪ ಸಮಯ ತೆಗೆದುಕೊಳ್ಳಬಹುದು.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'ಆವೃತ್ತಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'ಎಲ್ಲವನ್ನೂ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ - ಗುಣಮಟ್ಟ';

  @override
  String get downloadQuality => 'ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ';

  @override
  String get originalFileNoReencoding => 'ಮೂಲ ಫೈಲ್, ಮರು-ಎನ್ಕೋಡಿಂಗ್ ಇಲ್ಲ';

  @override
  String get originalFilesNoReencoding => 'ಮೂಲ ಫೈಲ್‌ಗಳು, ಮರು-ಎನ್‌ಕೋಡಿಂಗ್ ಇಲ್ಲ';

  @override
  String get noEpisodesLoaded => 'ಯಾವುದೇ ಸಂಚಿಕೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get failedToDeleteFiles => 'ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get deleteFiles => 'ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get director => 'ನಿರ್ದೇಶಕ';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'ಬರಹಗಾರರು';

  @override
  String get studio => 'ಸ್ಟುಡಿಯೋ';

  @override
  String studioMoreCount(int count) {
    return '+$count more';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episodes';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episode $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Chapter $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Born $date';
  }

  @override
  String died(String date) {
    return 'Died $date';
  }

  @override
  String age(int age) {
    return 'Age $age';
  }

  @override
  String get showLess => 'ಕಡಿಮೆ ತೋರಿಸು';

  @override
  String get readMore => 'ಮುಂದೆ ಓದಿ';

  @override
  String get shuffle => 'ಷಫಲ್';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'ಪರಿಪೂರ್ಣ ಹೊಂದಾಣಿಕೆ';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'ಮೊನೊ';

  @override
  String get stereo => 'ಸ್ಟೀರಿಯೋ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Remote subtitle $action requires the Jellyfin subtitle management permission for this user.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'This item could not be found on the server for remote subtitle $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Remote subtitle $action failed: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Remote subtitle $action failed (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Failed to $action remote subtitles.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'all downloaded episodes for \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'ಈ ಋತುವಿನಲ್ಲಿ ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳು';

  @override
  String get stillWatching => 'ಇನ್ನೂ ನೋಡುತ್ತಿರುವಿರಾ?';

  @override
  String get unableToLoadTrailerStream =>
      'ಟ್ರೇಲರ್ ಸ್ಟ್ರೀಮ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ.';

  @override
  String get trailerTimedOut => 'ಲೋಡ್ ಮಾಡುವಾಗ ಟ್ರೈಲರ್ ಸಮಯ ಮೀರಿದೆ.';

  @override
  String get playbackFailedForTrailer =>
      'ಈ ಟ್ರೈಲರ್‌ಗಾಗಿ ಪ್ಲೇಬ್ಯಾಕ್ ವಿಫಲವಾಗಿದೆ.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ಆಫ್‌ಲೈನ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಯದಲ್ಲಿ ಬಿತ್ತರಿಸುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String castActionFailed(String label, String error) {
    return '$label action failed: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Failed to set cast volume: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controls';
  }

  @override
  String get deviceVolume => 'ಸಾಧನದ ಪರಿಮಾಣ';

  @override
  String get unavailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get pause => 'ವಿರಾಮ';

  @override
  String get syncPosition => 'ಸಿಂಕ್ ಸ್ಥಾನ';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'ಸರತಿ ಸಾಲು ಖಾಲಿಯಾಗಿದೆ';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get castingToGoogleCast => 'Google Cast ಗೆ ಬಿತ್ತರಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get castingViaAirPlay => 'AirPlay ಮೂಲಕ ಬಿತ್ತರಿಸುವುದು';

  @override
  String get castingViaDlna => 'DLNA ಮೂಲಕ ಬಿತ್ತರಿಸುವುದು';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'ಅನ್‌ಲಾಕ್ ಮಾಡಲು ದೀರ್ಘವಾಗಿ ಒತ್ತಿರಿ';

  @override
  String get off => 'ಆಫ್';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ಆಟೋ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ಬಿಟ್ರೇಟ್ ಅತಿಕ್ರಮಣ';

  @override
  String get audioDelay => 'ಆಡಿಯೋ ವಿಳಂಬ';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'ಉಪಶೀರ್ಷಿಕೆ ವಿಳಂಬ';

  @override
  String get reset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get unknown => 'ಅಜ್ಞಾತ';

  @override
  String get playbackInformation => 'ಪ್ಲೇಬ್ಯಾಕ್ ಮಾಹಿತಿ';

  @override
  String get playback => 'ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get playMethod => 'ಆಟದ ವಿಧಾನ';

  @override
  String get directPlay => 'ನೇರ ಆಟ';

  @override
  String get directStream => 'ನೇರ ಸ್ಟ್ರೀಮ್';

  @override
  String get transcoding => 'ಟ್ರಾನ್ಸ್ಕೋಡಿಂಗ್';

  @override
  String get transcodeReasons => 'ಟ್ರಾನ್ಸ್ಕೋಡ್ ಕಾರಣಗಳು';

  @override
  String get player => 'ಆಟಗಾರ';

  @override
  String get container => 'ಕಂಟೈನರ್';

  @override
  String get bitrate => 'ಬಿಟ್ರೇಟ್';

  @override
  String get video => 'ವೀಡಿಯೊ';

  @override
  String get resolution => 'ರೆಸಲ್ಯೂಶನ್';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'ಕೊಡೆಕ್';

  @override
  String get videoBitrate => 'ವೀಡಿಯೊ ಬಿಟ್ರೇಟ್';

  @override
  String get track => 'ಟ್ರ್ಯಾಕ್ ಮಾಡಿ';

  @override
  String get channels => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get audioBitrate => 'ಆಡಿಯೋ ಬಿಟ್ರೇಟ್';

  @override
  String get sampleRate => 'ಮಾದರಿ ದರ';

  @override
  String get format => 'ಫಾರ್ಮ್ಯಾಟ್';

  @override
  String get external => 'ಬಾಹ್ಯ';

  @override
  String get embedded => 'ಎಂಬೆಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String castSessionError(String protocol) {
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ EPUB ರೆಂಡರಿಂಗ್ ಇನ್ನೂ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ಎಂಬೆಡೆಡ್ ಡಾಕ್ಯುಮೆಂಟ್ ರೆಂಡರಿಂಗ್ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get couldNotOpenExternalViewer =>
      'ಬಾಹ್ಯ ವೀಕ್ಷಕವನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Failed to open in-app reader: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bookmark already saved at $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bookmark added: $label';
  }

  @override
  String get noBookmarksYet =>
      'ಇನ್ನೂ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ.\nನಿಮ್ಮ ಸ್ಥಾನವನ್ನು ಉಳಿಸಲು ಓದುವಾಗ ಬುಕ್‌ಮಾರ್ಕ್ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get noTableOfContentsAvailable => 'ಯಾವುದೇ ಪರಿವಿಡಿ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'ಸ್ಥಾನ';

  @override
  String get bookReader => 'ಪುಸ್ತಕ ಓದುಗ';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'ನವೀಕರಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get markUnread => 'ಓದದಿರುವುದನ್ನು ಗುರುತಿಸಿ';

  @override
  String get markAsRead => 'ಓದಿದಂತೆ ಗುರುತಿಸಿ';

  @override
  String get reloadReader => 'ರೀಡರ್ ಅನ್ನು ಮರುಲೋಡ್ ಮಾಡಿ';

  @override
  String get noPagesFound => 'ಯಾವುದೇ ಪುಟಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get failedToDecodePageImage =>
      'ಪುಟದ ಚಿತ್ರವನ್ನು ಡಿಕೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'ಏಕ ಪುಟ';

  @override
  String get twoPageSpread => 'ಎರಡು ಪುಟಗಳ ಹರಡುವಿಕೆ';

  @override
  String get addBookmark => 'ಬುಕ್ಮಾರ್ಕ್ ಸೇರಿಸಿ';

  @override
  String get bookmarksEllipsis => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು...';

  @override
  String get markedAsRead => 'ಓದಿದೆ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String get markedAsUnread => 'ಓದಿಲ್ಲ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'ಥೀಮ್: ವ್ಯವಸ್ಥೆ';

  @override
  String get themeLight => 'ಥೀಮ್: ಬೆಳಕು';

  @override
  String get themeDark => 'ಥೀಮ್: ಡಾರ್ಕ್';

  @override
  String get themeSepia => 'ಥೀಮ್: ಸೆಪಿಯಾ';

  @override
  String get invertColorsFixedLayout => 'ವಿಲೋಮ ಬಣ್ಣಗಳು (ಸ್ಥಿರ ವಿನ್ಯಾಸ)';

  @override
  String get invertColorsPdf => 'ವಿಲೋಮ ಬಣ್ಣಗಳು (PDF)';

  @override
  String get preparingInAppReader =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ರೀಡರ್ ಅನ್ನು ಸಿದ್ಧಪಡಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get pdfDataNotAvailable => 'PDF ಡೇಟಾ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get readerFallbackModeActive => 'ರೀಡರ್ ಫಾಲ್‌ಬ್ಯಾಕ್ ಮೋಡ್ ಸಕ್ರಿಯವಾಗಿದೆ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'ಬೆಂಬಲಿತ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಗುರಿಗೆ ಬದಲಾಯಿಸಿದ ನಂತರ ರೀಲೋಡ್ ರೀಡರ್ ಅನ್ನು ಬಳಸಿ (Android, iOS, macOS).';

  @override
  String get openExternally => 'ಬಾಹ್ಯವಾಗಿ ತೆರೆಯಿರಿ';

  @override
  String get noEpubChaptersFound => 'ಯಾವುದೇ EPUB ಅಧ್ಯಾಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get readerNotReady => 'ಓದುಗ ಸಿದ್ಧವಾಗಿಲ್ಲ.';

  @override
  String get seriesRecordings => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get now => 'ಈಗ';

  @override
  String get sports => 'ಕ್ರೀಡೆಗಳು';

  @override
  String get news => 'ಸುದ್ದಿ';

  @override
  String get kids => 'ಮಕ್ಕಳು';

  @override
  String get premiere => 'ಪ್ರಥಮ ಪ್ರದರ್ಶನ';

  @override
  String get guideTimeline => 'ಮಾರ್ಗದರ್ಶಿ ಟೈಮ್‌ಲೈನ್';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'ಯಾವುದೇ ಚಾನಲ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get liveBadge => 'ಲೈವ್';

  @override
  String guideNextProgram(String time, String title) {
    return 'Next: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m left';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h left';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m left';
  }

  @override
  String get movie => 'ಚಲನಚಿತ್ರ';

  @override
  String get removedFromFavoriteChannels =>
      'ಮೆಚ್ಚಿನ ಚಾನಲ್‌ಗಳಿಂದ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String get addedToFavoriteChannels => 'ಮೆಚ್ಚಿನ ಚಾನಲ್‌ಗಳಿಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ಮೆಚ್ಚಿನ ಚಾನಲ್ ಅನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get unfavoriteChannel => 'ಮೆಚ್ಚಿನವಲ್ಲದ ಚಾನಲ್';

  @override
  String get favoriteChannel => 'ಮೆಚ್ಚಿನ ಚಾನಲ್';

  @override
  String get record => 'Record';

  @override
  String get cancelRecordingAction => 'Cancel Recording';

  @override
  String get programSetToRecord => 'Program set to record';

  @override
  String get recordingCancelled => 'Recording cancelled';

  @override
  String get unableToCreateRecording => 'Unable to create recording';

  @override
  String get watch => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings =>
      'ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get scheduledInNext24Hours => 'ಮುಂದಿನ 24 ಗಂಟೆಗಳಲ್ಲಿ ನಿಗದಿಪಡಿಸಲಾಗಿದೆ';

  @override
  String get recentRecordings => 'ಇತ್ತೀಚಿನ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get tvSeries => 'ಟಿವಿ ಸರಣಿ';

  @override
  String get failedToLoadSchedule => 'ವೇಳಾಪಟ್ಟಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noScheduledRecordings => 'ಯಾವುದೇ ನಿಗದಿತ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳಿಲ್ಲ';

  @override
  String get cancelRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸುವುದೇ?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'ಸಂ';

  @override
  String get yesCancel => 'ಹೌದು, ರದ್ದುಮಾಡಿ';

  @override
  String get failedToCancelRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToLoadSeriesRecordings =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noSeriesRecordings => 'ಯಾವುದೇ ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳಿಲ್ಲ';

  @override
  String get cancelSeriesRecording => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಮಾಡಿ';

  @override
  String get cancelSeriesRecordingQuestion =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸುವುದೇ?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get searchThisLibrary => 'ಈ ಗ್ರಂಥಾಲಯವನ್ನು ಹುಡುಕಿ...';

  @override
  String get searchEllipsis => 'ಹುಡುಕು...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'ಸೀರ್ ಖಾತೆಯ ಪ್ರಕಾರ';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'ಸ್ಥಳೀಯ';

  @override
  String get savedMedia => 'ಉಳಿಸಿದ ಮಾಧ್ಯಮ';

  @override
  String get tvShows => 'ಟಿವಿ ಶೋಗಳು';

  @override
  String get music => 'ಸಂಗೀತ';

  @override
  String get musicAlbums => 'ಸಂಗೀತ ಆಲ್ಬಂಗಳು';

  @override
  String get noMediaInFilter => 'ಈ ಫಿಲ್ಟರ್‌ನಲ್ಲಿ ಯಾವುದೇ ಮಾಧ್ಯಮವಿಲ್ಲ';

  @override
  String get noDownloadedMediaYet =>
      'ಇನ್ನೂ ಯಾವುದೇ ಮಾಧ್ಯಮವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿಲ್ಲ';

  @override
  String get browseLibrary => 'ಲೈಬ್ರರಿ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get deleteDownload => 'ಡೌನ್‌ಲೋಡ್ ಅಳಿಸಿ';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'ಆಲ್ಬಮ್';

  @override
  String get playAlbum => 'ಆಲ್ಬಮ್ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'ಸೀಸನ್';

  @override
  String get errorLoadingEpisodes => 'ಸಂಚಿಕೆಗಳನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get noDownloadedEpisodes => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳಿಲ್ಲ';

  @override
  String get deleteEpisode => 'ಸಂಚಿಕೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String removeName(String name) {
    return 'Remove \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Episode $number';
  }

  @override
  String get seriesNotFound => 'ಸರಣಿ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get errorLoadingSeries => 'ಸರಣಿಯನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get downloadedEpisodes => 'ಸಂಚಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'ವಿಶೇಷತೆಗಳು';

  @override
  String get deleteSeason => 'ಸೀಸನ್ ಅಳಿಸಿ';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Delete all downloaded episodes in $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ಶೇಖರಣಾ ನಿರ್ವಹಣೆ';

  @override
  String get storageBreakdown => 'ಶೇಖರಣಾ ಸ್ಥಗಿತ';

  @override
  String get downloadedItems => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಐಟಂಗಳು';

  @override
  String get storageLimit => 'ಶೇಖರಣಾ ಮಿತಿ';

  @override
  String get noLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String get deleteAllDownloads => 'ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAllDownloadsWarning =>
      'ಇದು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾದ ಎಲ್ಲಾ ಮಾಧ್ಯಮ ಫೈಲ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ ಮತ್ತು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get deleteAll => 'ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ';

  @override
  String get deleteSelected => 'ಆಯ್ಕೆ ಮಾಡಿರುವುದನ್ನು ಅಳಿಸಿ';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'ಸಂಗೀತ ಮತ್ತು ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get images => 'ಚಿತ್ರಗಳು';

  @override
  String get database => 'ಡೇಟಾಬೇಸ್';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get authentication => 'ದೃಢೀಕರಣ';

  @override
  String get autoLoginServerManagement => 'ಸ್ವಯಂ ಲಾಗಿನ್, ಸರ್ವರ್ ನಿರ್ವಹಣೆ';

  @override
  String get pinCode => 'ಪಿನ್ ಕೋಡ್';

  @override
  String get setUpPinCodeProtection => 'ಪಿನ್ ಕೋಡ್ ರಕ್ಷಣೆಯನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get parentalControls => 'ಪೋಷಕರ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get contentRatingRestrictions => 'ವಿಷಯ ರೇಟಿಂಗ್ ನಿರ್ಬಂಧಗಳು';

  @override
  String get bitRateResolutionBehavior => 'ಬಿಟ್ರೇಟ್, ರೆಸಲ್ಯೂಶನ್, ನಡವಳಿಕೆ';

  @override
  String get languageSizeAppearance => 'ಭಾಷೆ, ಗಾತ್ರ, ನೋಟ';

  @override
  String get qualityStorage => 'ಗುಣಮಟ್ಟ, ಸಂಗ್ರಹಣೆ';

  @override
  String get serverSyncAndPluginStatus => 'ಸರ್ವರ್ ಸಿಂಕ್ ಮತ್ತು ಪ್ಲಗಿನ್ ಸ್ಥಿತಿ';

  @override
  String get mediaRequestIntegration => 'ಮಾಧ್ಯಮ ವಿನಂತಿ ಏಕೀಕರಣ';

  @override
  String get switchServer => 'ಸರ್ವರ್ ಬದಲಿಸಿ';

  @override
  String get signOut => 'ಸೈನ್ ಔಟ್';

  @override
  String get versionLicenses => 'ಆವೃತ್ತಿ, ಪರವಾನಗಿಗಳು';

  @override
  String get account => 'ಖಾತೆ';

  @override
  String get signInAndSecurity => 'ಸೈನ್ ಇನ್ ಮತ್ತು ಭದ್ರತೆ';

  @override
  String get administration => 'ಆಡಳಿತ';

  @override
  String get serverSettingsUsersLibraries =>
      'ಸರ್ವರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಬಳಕೆದಾರರು, ಲೈಬ್ರರಿಗಳು';

  @override
  String get customization => 'ಗ್ರಾಹಕೀಕರಣ';

  @override
  String get themeAndLayout => 'ಥೀಮ್ ಮತ್ತು ಲೇಔಟ್';

  @override
  String get videoAndSubtitles => 'ವೀಡಿಯೊ ಮತ್ತು ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get integrations => 'ಏಕೀಕರಣಗಳು';

  @override
  String get pluginAndRequests => 'ಪ್ಲಗಿನ್ ಮತ್ತು ವಿನಂತಿಗಳು';

  @override
  String get customizeAccountPlaybackInterface =>
      'ಖಾತೆ, ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಇಂಟರ್ಫೇಸ್ ನಡವಳಿಕೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'ಥೀಮ್ ಮತ್ತು ಗೋಚರತೆ';

  @override
  String get focusBorderColor => 'ಫೋಕಸ್ ಬಾರ್ಡರ್ ಕಲರ್';

  @override
  String get watchedIndicators => 'ಸೂಚಕಗಳನ್ನು ವೀಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get always => 'ಯಾವಾಗಲೂ';

  @override
  String get hideUnwatched => 'ವೀಕ್ಷಿಸದಿರುವುದನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get episodesOnly => 'ಸಂಚಿಕೆಗಳು ಮಾತ್ರ';

  @override
  String get never => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String get focusExpansionAnimation => 'ಫೋಕಸ್ ವಿಸ್ತರಣೆ ಅನಿಮೇಷನ್';

  @override
  String get desktopUiScale => 'ಡೆಸ್ಕ್‌ಟಾಪ್ UI ಸ್ಕೇಲ್';

  @override
  String get scaleFocusedCards =>
      'ಸ್ಕೇಲ್ ಫೋಕಸ್ಡ್ ಅಥವಾ ಹೋವರ್ಡ್ ಕಾರ್ಡ್‌ಗಳು ಮತ್ತು ಟೈಲ್ಸ್';

  @override
  String get backgroundBackdrops => 'ಹಿನ್ನೆಲೆ ಹಿನ್ನೆಲೆಗಳು';

  @override
  String get showBackdropImages =>
      'ವಿಷಯದ ಹಿಂದೆ ಬ್ಯಾಕ್‌ಡ್ರಾಪ್ ಚಿತ್ರಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get seriesThumbnails => 'ಸರಣಿ ಥಂಬ್‌ನೇಲ್‌ಗಳು';

  @override
  String get seriesThumbnailsDescription =>
      'ಸಂಚಿಕೆಗಳು ಮಾತ್ರ: ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರಕ್ಕೆ ಹೊಂದಿಕೆಯಾಗುವ ಸರಣಿ ಕಲಾಕೃತಿಯನ್ನು ಬಳಸಿ';

  @override
  String get homeRowInfoOverlay => 'ಮುಖಪುಟ ಸಾಲಿನ ಮಾಹಿತಿ ಓವರ್‌ಲೇ';

  @override
  String get showTitleMetadataOnHomeRows =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಮೆಟಾಡೇಟಾವನ್ನು ತೋರಿಸಿ';

  @override
  String get clockDisplay => 'ಗಡಿಯಾರ ಪ್ರದರ್ಶನ';

  @override
  String get inMenus => 'ಮೆನುಗಳಲ್ಲಿ';

  @override
  String get inVideo => 'ವೀಡಿಯೊದಲ್ಲಿ';

  @override
  String get seasonalEffects => 'ಕಾಲೋಚಿತ ಪರಿಣಾಮಗಳು';

  @override
  String get seasonalEffectsDescription =>
      'ದೃಶ್ಯ ಪರಿಣಾಮಗಳು ಮತ್ತು ಕಾಲೋಚಿತ ಅಲಂಕಾರಗಳು';

  @override
  String get snow => 'ಹಿಮ';

  @override
  String get fireworks => 'ಪಟಾಕಿ';

  @override
  String get confetti => 'ಕಾನ್ಫೆಟ್ಟಿ';

  @override
  String get fallingLeaves => 'ಬೀಳುವ ಎಲೆಗಳು';

  @override
  String get themeMusic => 'ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get playThemeMusicOnDetailPages =>
      'ವಿವರ ಪುಟಗಳಲ್ಲಿ ಥೀಮ್ ಸಂಗೀತವನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get themeMusicVolume => 'ಥೀಮ್ ಸಂಗೀತ ಸಂಪುಟ';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ಹೋಮ್ ರೋಗಳಲ್ಲಿ ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get playWhenBrowsingHomeScreen =>
      'ಹೋಮ್ ಸ್ಕ್ರೀನ್ ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'ವಿವರಗಳ ಹಿನ್ನೆಲೆ ಮಸುಕು';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ಬ್ರೌಸಿಂಗ್ ಹಿನ್ನೆಲೆ ಮಸುಕು';

  @override
  String get maxStreamingBitrate => 'ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್';

  @override
  String get maxResolution => 'ಗರಿಷ್ಠ ರೆಸಲ್ಯೂಶನ್';

  @override
  String get playerZoomMode => 'ಪ್ಲೇಯರ್ ಜೂಮ್ ಮೋಡ್';

  @override
  String get settingsScrollWheelAction => '';

  @override
  String get settingsScrollWheelActionDescription => '';

  @override
  String get scrollWheelActionOff => '';

  @override
  String get scrollWheelActionSeek => '';

  @override
  String get scrollWheelActionVolume => '';

  @override
  String get playerTooltipVolume => '';

  @override
  String get fit => 'ಫಿಟ್';

  @override
  String get autoCrop => 'ಸ್ವಯಂ ಬೆಳೆ';

  @override
  String get stretch => 'ಸ್ಟ್ರೆಚ್';

  @override
  String get refreshRateSwitching => 'ರಿಫ್ರೆಶ್ ದರ ಸ್ವಿಚಿಂಗ್';

  @override
  String get disabled => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get scaleOnTv => 'ಟಿವಿಯಲ್ಲಿ ಸ್ಕೇಲ್';

  @override
  String get scaleOnDevice => 'ಸಾಧನದಲ್ಲಿ ಸ್ಕೇಲ್';

  @override
  String get trickPlay => 'ಟ್ರಿಕ್ ಪ್ಲೇ';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'ಹುಡುಕುತ್ತಿರುವಾಗ ಪೂರ್ವವೀಕ್ಷಣೆ ಥಂಬ್‌ನೇಲ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get showDescriptionOnPause => 'ವಿರಾಮದಲ್ಲಿ ವಿವರಣೆಯನ್ನು ತೋರಿಸಿ';

  @override
  String get dimVideoShowOverview =>
      'ವಿರಾಮಗೊಳಿಸಿದಾಗ ವೀಡಿಯೊವನ್ನು ಮಂದಗೊಳಿಸಿ ಮತ್ತು ಅವಲೋಕನ ಪಠ್ಯವನ್ನು ತೋರಿಸಿ';

  @override
  String get osdLockButton => 'OSD ಲಾಕ್ ಬಟನ್';

  @override
  String get osdLockButtonDescription =>
      'ದೀರ್ಘಕಾಲ ಒತ್ತಿದರೆ ಸ್ಪರ್ಶ ಇನ್‌ಪುಟ್ ಅನ್ನು ನಿರ್ಬಂಧಿಸುವ ಲಾಕ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get audioBehavior => 'ಆಡಿಯೋ ಬಿಹೇವಿಯರ್';

  @override
  String get downmixToStereo => 'ಸ್ಟಿರಿಯೊಗೆ ಡೌನ್ಮಿಕ್ಸ್ ಮಾಡಿ';

  @override
  String get defaultAudioLanguage => 'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೊ ಭಾಷೆ';

  @override
  String get fallbackAudioLanguage => '';

  @override
  String get preferDefaultAudioTrack => '';

  @override
  String get preferDefaultAudioTrackDescription => '';

  @override
  String get preferAudioDescription => '';

  @override
  String get preferAudioDescriptionDescription => '';

  @override
  String get transcodingAudio => '';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate or Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

  @override
  String get autoServerDefault => 'ಸ್ವಯಂ (ಸರ್ವರ್ ಡೀಫಾಲ್ಟ್)';

  @override
  String get english => 'ಇಂಗ್ಲೀಷ್';

  @override
  String get spanish => 'ಸ್ಪ್ಯಾನಿಷ್';

  @override
  String get french => 'ಫ್ರೆಂಚ್';

  @override
  String get german => 'ಜರ್ಮನ್';

  @override
  String get italian => 'ಇಟಾಲಿಯನ್';

  @override
  String get portuguese => 'ಪೋರ್ಚುಗೀಸ್';

  @override
  String get japanese => 'ಜಪಾನೀಸ್';

  @override
  String get korean => 'ಕೊರಿಯನ್';

  @override
  String get chinese => 'ಚೈನೀಸ್';

  @override
  String get russian => 'ರಷ್ಯನ್';

  @override
  String get arabic => 'ಅರೇಬಿಕ್';

  @override
  String get hindi => 'ಹಿಂದಿ';

  @override
  String get dutch => 'ಡಚ್';

  @override
  String get swedish => 'ಸ್ವೀಡಿಷ್';

  @override
  String get norwegian => 'ನಾರ್ವೇಜಿಯನ್';

  @override
  String get danish => 'ಡ್ಯಾನಿಶ್';

  @override
  String get finnish => 'ಫಿನ್ನಿಶ್';

  @override
  String get polish => 'ಪೋಲಿಷ್';

  @override
  String get ac3Passthrough => 'AC3 ಪಾಸ್ಥ್ರೂ';

  @override
  String get dtsPassthrough => 'ಡಿಟಿಎಸ್ ಪಾಸ್ ಥ್ರೂ';

  @override
  String get trueHdSupport => 'TrueHD ಬೆಂಬಲ';

  @override
  String get enableDtsPassthrough =>
      'ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ DTS ಆಡಿಯೋ AVR ಗೆ ಮಾತ್ರ; ರಿಸೀವರ್ ಬೆಂಬಲ ಮತ್ತು DTS ಮೂಲ ಟ್ರ್ಯಾಕ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ಆಡಿಯೊವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ (ಎಲ್ಲಾ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡದಿರಬಹುದು)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackCodecDescription => '';

  @override
  String get settingsAudioFallbackCodecAuto => '';

  @override
  String get settingsAudioFallbackCodecAac => '';

  @override
  String get settingsAudioFallbackCodecAc3 => '';

  @override
  String get settingsAudioFallbackCodecEac3 => '';

  @override
  String get settingsAudioFallbackCodecTrueHd => '';

  @override
  String get settingsAudioFallbackCodecMp3 => '';

  @override
  String get settingsAudioFallbackCodecOpus => '';

  @override
  String get settingsAudioFallbackCodecFlac => '';

  @override
  String get settingsMaxAudioChannels => '';

  @override
  String get settingsMaxAudioChannelsDescription => '';

  @override
  String get settingsMaxAudioChannelsAuto => '';

  @override
  String get settingsMaxAudioChannelsMono => '';

  @override
  String get settingsMaxAudioChannelsStereo => '';

  @override
  String get settingsMaxAudioChannels3_0 => '';

  @override
  String get settingsMaxAudioChannels4_0 => '';

  @override
  String get settingsMaxAudioChannels5_0 => '';

  @override
  String get settingsMaxAudioChannels5_1 => '';

  @override
  String get settingsMaxAudioChannels6_1 => '';

  @override
  String get settingsMaxAudioChannels7_1 => '';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Advanced)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Enable only formats your AVR or HDMI sink supports.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) to external decoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos over EAC3 (JOC) to external decoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (includes DTS core) to external decoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD with Atmos metadata to external decoder.';

  @override
  String get settingsDetectedAudioCapabilities => 'Detected Audio Capabilities';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'No runtime capability snapshot available yet.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Decode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audio route';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Speaker';

  @override
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostics';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Level';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Range';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitle Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Allowed Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Audio Codecs';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Active Audio Route';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Support';

  @override
  String get nightMode => 'ರಾತ್ರಿ ಮೋಡ್';

  @override
  String get compressDynamicRange => 'ಡೈನಾಮಿಕ್ ಶ್ರೇಣಿಯನ್ನು ಕುಗ್ಗಿಸಿ';

  @override
  String get advancedMpv => 'ಸುಧಾರಿತ mpv';

  @override
  String get enableCustomMpvConf => 'ಕಸ್ಟಮ್ mpv.conf ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get applyMpvConfBeforePlayback =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭವಾಗುವ ಮೊದಲು ಬಳಕೆದಾರ-ನಿರ್ದಿಷ್ಟಪಡಿಸಿದ mpv.conf ಅನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get unsafeAdvancedMpvOptions => 'ಅಸುರಕ್ಷಿತ ಸುಧಾರಿತ mpv ಆಯ್ಕೆಗಳು';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv ಆಯ್ಕೆಗಳ ವ್ಯಾಪಕ ಸೆಟ್ ಅನ್ನು ಅನುಮತಿಸಿ. ಪ್ಲೇಬ್ಯಾಕ್ ನಡವಳಿಕೆಯನ್ನು ಮುರಿಯಬಹುದು.';

  @override
  String get hardwareDecoding => 'ಹಾರ್ಡ್ವೇರ್ ಡಿಕೋಡಿಂಗ್';

  @override
  String get hardwareDecodingSubtitle =>
      'ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಸುಧಾರಿಸಬಹುದು ಆದರೆ ಕೆಲವು ಸಾಧನಗಳಲ್ಲಿ ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಸ್ಯೆಗಳನ್ನು ಉಂಟುಮಾಡಬಹುದು.';

  @override
  String get nextUpAndQueuing => 'ಮುಂದಿನದು ಮತ್ತು ಸರತಿ ಸಾಲಿನಲ್ಲಿ';

  @override
  String get nextUpDisplay => 'ಮುಂದಿನ ಪ್ರದರ್ಶನ';

  @override
  String get extended => 'ವಿಸ್ತರಿಸಲಾಗಿದೆ';

  @override
  String get minimal => 'ಕನಿಷ್ಠ';

  @override
  String get nextUpTimeout => 'ಮುಂದಿನ ಕಾಲಾವಧಿ';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'ಮಾಧ್ಯಮ ಕ್ಯೂಯಿಂಗ್';

  @override
  String get autoQueueNextEpisodes => 'ಮುಂದಿನ ಸಂಚಿಕೆಗಳಲ್ಲಿ ಸ್ವಯಂ-ಸರದಿ';

  @override
  String get stillWatchingPrompt => 'ಇನ್ನೂ ಪ್ರಾಂಪ್ಟ್ ವೀಕ್ಷಿಸುತ್ತಿದೆ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'ಪುನರಾರಂಭಿಸಿ ಮತ್ತು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get resumeRewind => 'ರಿಸ್ಯೂಮ್ ರಿವೈಂಡ್';

  @override
  String get unpauseRewind => 'ರಿವೈಂಡ್ ಅನ್ನು ವಿರಾಮಗೊಳಿಸಬೇಡಿ';

  @override
  String get fiveSeconds => '5 ಸೆಕೆಂಡುಗಳು';

  @override
  String get tenSeconds => '10 ಸೆಕೆಂಡುಗಳು';

  @override
  String get fifteenSeconds => '15 ಸೆಕೆಂಡುಗಳು';

  @override
  String get thirtySeconds => '30 ಸೆಕೆಂಡುಗಳು';

  @override
  String get skipBackLength => 'ಸ್ಕಿಪ್ ಬ್ಯಾಕ್ ಲೆಂಗ್ತ್';

  @override
  String get skipForwardLength => 'ಮುಂದಕ್ಕೆ ಉದ್ದವನ್ನು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get customMpvConfPath => 'ಕಸ್ಟಮ್ mpv.conf ಮಾರ್ಗ';

  @override
  String get notSetMpvConf =>
      'ಹೊಂದಿಸಿಲ್ಲ. Moonfin ಅಪ್ಲಿಕೇಶನ್/ಡೇಟಾ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಡೀಫಾಲ್ಟ್ mpv.conf ಅನ್ನು ಪ್ರಯತ್ನಿಸುತ್ತದೆ.';

  @override
  String get selectMpvConf => 'mpv.conf ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'ಶೈಲಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು (ಗಾತ್ರ, ಬಣ್ಣ, ಆಫ್‌ಸೆಟ್) ಪಠ್ಯ ಆಧಾರಿತ ಉಪಶೀರ್ಷಿಕೆಗಳಿಗೆ (SRT, VTT, TTML) ಅನ್ವಯಿಸುತ್ತವೆ. \"ASS/SSA ಡೈರೆಕ್ಟ್ ಪ್ಲೇ\" ಅನ್ನು ಆಫ್ ಮಾಡದ ಹೊರತು ASS/SSA ಉಪಶೀರ್ಷಿಕೆಗಳು ತಮ್ಮದೇ ಆದ ಎಂಬೆಡೆಡ್ ಸ್ಟೈಲಿಂಗ್ ಅನ್ನು ಬಳಸುತ್ತವೆ. ಬಿಟ್‌ಮ್ಯಾಪ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು (PGS, DVB, VobSub) ಮರುಹೊಂದಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get defaultSubtitleLanguage => 'ಡೀಫಾಲ್ಟ್ ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get defaultToNoSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳಿಲ್ಲ ಎಂಬುದಕ್ಕೆ ಡೀಫಾಲ್ಟ್';

  @override
  String get turnOffSubtitlesByDefault =>
      'ಡೀಫಾಲ್ಟ್ ಆಗಿ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get subtitleSize => 'ಉಪಶೀರ್ಷಿಕೆ ಗಾತ್ರ';

  @override
  String get textFillColor => 'ಪಠ್ಯವನ್ನು ತುಂಬುವ ಬಣ್ಣ';

  @override
  String get backgroundColor => 'ಹಿನ್ನೆಲೆ ಬಣ್ಣ';

  @override
  String get textStrokeColor => 'ಪಠ್ಯ ಸ್ಟ್ರೋಕ್ ಬಣ್ಣ';

  @override
  String get subtitleCustomization => 'ಉಪಶೀರ್ಷಿಕೆ ಗ್ರಾಹಕೀಕರಣ';

  @override
  String get subtitleCustomizationDescription =>
      'ಉಪಶೀರ್ಷಿಕೆ ನೋಟವನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ';

  @override
  String get subtitleMode => '';

  @override
  String get subtitleModeFlagged => '';

  @override
  String get subtitleModeAlways => '';

  @override
  String get subtitleModeForeign => '';

  @override
  String get subtitleModeForced => '';

  @override
  String get subtitleModeFlaggedDescription => '';

  @override
  String get subtitleModeAlwaysDescription => '';

  @override
  String get subtitleModeForeignDescription => '';

  @override
  String get subtitleModeForcedDescription => '';

  @override
  String get subtitleModeNoneDescription => '';

  @override
  String get fallbackSubtitleLanguage => '';

  @override
  String get subtitleStream => '';

  @override
  String get subtitlePreviewText =>
      'ತ್ವರಿತ ಕಂದು ನರಿ ಸೋಮಾರಿಯಾದ ನಾಯಿಯ ಮೇಲೆ ಜಿಗಿಯುತ್ತದೆ';

  @override
  String get verticalOffset => 'ಲಂಬ ಆಫ್ಸೆಟ್';

  @override
  String get pgsDirectPlay => 'PGS ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get directPlayPgsSubtitles => 'ನೇರ ಪ್ಲೇ PGS ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get assSsaDirectPlay => 'ASS/SSA ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get white => 'ಬಿಳಿ';

  @override
  String get black => 'ಕಪ್ಪು';

  @override
  String get yellow => 'ಹಳದಿ';

  @override
  String get green => 'ಹಸಿರು';

  @override
  String get cyan => 'ಸಯಾನ್';

  @override
  String get red => 'ಕೆಂಪು';

  @override
  String get transparent => 'ಪಾರದರ್ಶಕ';

  @override
  String get semiTransparentBlack => 'ಅರೆ-ಪಾರದರ್ಶಕ ಕಪ್ಪು';

  @override
  String get global => 'ಜಾಗತಿಕ';

  @override
  String get desktop => 'ಡೆಸ್ಕ್ಟಾಪ್';

  @override
  String get mobile => 'ಮೊಬೈಲ್';

  @override
  String get tv => 'ಟಿ.ವಿ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Loaded $profile profile settings.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Failed to load $profile profile settings.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synced local settings to $profile profile.';
  }

  @override
  String get customizationProfile => 'ಗ್ರಾಹಕೀಕರಣ ಪ್ರೊಫೈಲ್';

  @override
  String get customizationProfileDescription =>
      'ಲೋಡ್ ಮಾಡಲು, ಎಡಿಟ್ ಮಾಡಲು ಮತ್ತು ಸಿಂಕ್ ಮಾಡಲು ಪ್ರೊಫೈಲ್ ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ. ಸಾಧನದ ಪ್ರೊಫೈಲ್ ಅದನ್ನು ಅತಿಕ್ರಮಿಸದ ಹೊರತು ಗ್ಲೋಬಲ್ ಎಲ್ಲೆಡೆ ಅನ್ವಯಿಸುತ್ತದೆ. ಹಸಿರು ಚುಕ್ಕೆ ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಸಾಧನದ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಗುರುತಿಸುತ್ತದೆ.';

  @override
  String get loadProfile => 'ಪ್ರೊಫೈಲ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಿ';

  @override
  String get syncing => 'ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get syncToProfile => 'ಪ್ರೊಫೈಲ್‌ಗೆ ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get profileSyncHidden => 'ಪ್ರೊಫೈಲ್ ಸಿಂಕ್ ಮರೆಮಾಡಲಾಗಿದೆ';

  @override
  String get enablePluginSyncDescription =>
      'ಪ್ರೊಫೈಲ್ ನಿಯಂತ್ರಣಗಳನ್ನು ಇಲ್ಲಿ ತೋರಿಸಲು ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಸಿಂಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get quality => 'ಗುಣಮಟ್ಟ';

  @override
  String get defaultDownloadQuality => 'ಡೀಫಾಲ್ಟ್ ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ';

  @override
  String get network => 'ನೆಟ್ವರ್ಕ್';

  @override
  String get wifiOnlyDownloads => 'ವೈಫೈ-ಮಾತ್ರ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get onlyDownloadOnWifi => 'ವೈಫೈಗೆ ಸಂಪರ್ಕಗೊಂಡಾಗ ಮಾತ್ರ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get storage => 'ಸಂಗ್ರಹಣೆ';

  @override
  String get storageUsed => 'ಶೇಖರಣೆಯನ್ನು ಬಳಸಲಾಗಿದೆ';

  @override
  String get manage => 'ನಿರ್ವಹಿಸಿ';

  @override
  String get calculating => 'ಲೆಕ್ಕಾಚಾರ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get downloadLocation => 'ಸ್ಥಳವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get defaultLabel => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get saveToDownloadsFolder => 'ಡೌನ್‌ಲೋಡ್‌ಗಳ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸಿ';

  @override
  String get downloadsVisibleToOtherApps =>
      'ಡೌನ್‌ಲೋಡ್‌ಗಳು/Moonfin — ಇತರ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಗೋಚರಿಸುತ್ತದೆ';

  @override
  String get dangerZone => 'ಡೇಂಜರ್ ಝೋನ್';

  @override
  String get clearAllDownloads => 'ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get original => 'ಮೂಲ';

  @override
  String get changeDownloadLocation => 'ಡೌನ್‌ಲೋಡ್ ಸ್ಥಳವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get changeDownloadLocationDescription =>
      'ಹೊಸ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿದ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸಲಾಗುತ್ತದೆ. ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಡೌನ್‌ಲೋಡ್‌ಗಳು ಅವುಗಳ ಪ್ರಸ್ತುತ ಸ್ಥಳದಲ್ಲಿಯೇ ಉಳಿಯುತ್ತವೆ ಮತ್ತು ಶೇಖರಣಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ನಿರ್ವಹಿಸಬಹುದು.';

  @override
  String get confirm => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get cannotWriteToFolder =>
      'ಆಯ್ಕೆಮಾಡಿದ ಫೋಲ್ಡರ್‌ಗೆ ಬರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ. ದಯವಿಟ್ಟು ಬೇರೆ ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡಿ ಅಥವಾ ಶೇಖರಣಾ ಅನುಮತಿಗಳನ್ನು ನೀಡಿ.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'ಡೌನ್‌ಲೋಡ್‌ಗಳ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸುವುದೇ?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಮಾಧ್ಯಮವನ್ನು ನಿಮ್ಮ ಸಾಧನದಲ್ಲಿ ಡೌನ್‌ಲೋಡ್‌ಗಳು/Moonfin ಗೆ ಉಳಿಸಲಾಗುತ್ತದೆ. ಈ ಫೈಲ್‌ಗಳು ನಿಮ್ಮ ಗ್ಯಾಲರಿ ಅಥವಾ ಮ್ಯೂಸಿಕ್ ಪ್ಲೇಯರ್‌ನಂತಹ ಇತರ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಗೋಚರಿಸುತ್ತವೆ.\n\nಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಡೌನ್‌ಲೋಡ್‌ಗಳು ಅವುಗಳ ಪ್ರಸ್ತುತ ಸ್ಥಳದಲ್ಲಿಯೇ ಉಳಿಯುತ್ತವೆ.';

  @override
  String get enable => 'ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get clearAllDownloadsWarning =>
      'ಇದು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಮಾಧ್ಯಮವನ್ನು ಅಳಿಸುತ್ತದೆ ಮತ್ತು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get clearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get navigationStyle => 'ನ್ಯಾವಿಗೇಷನ್ ಶೈಲಿ';

  @override
  String get topBar => 'ಟಾಪ್ ಬಾರ್';

  @override
  String get leftSidebar => 'ಎಡ ಸೈಡ್ಬಾರ್';

  @override
  String get showShuffleButton => 'ಷಫಲ್ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showGenresButton => 'ಪ್ರಕಾರಗಳ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showFavoritesButton => 'ಮೆಚ್ಚಿನವುಗಳ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showLibrariesInToolbar => 'ಟೂಲ್‌ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರಿಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'ನವಬಾರ್ ಅಪಾರದರ್ಶಕತೆ';

  @override
  String get navbarColor => 'ನವಬಾರ್ ಬಣ್ಣ';

  @override
  String get gray => 'ಬೂದು';

  @override
  String get darkBlue => 'ಗಾಢ ನೀಲಿ';

  @override
  String get purple => 'ನೇರಳೆ';

  @override
  String get teal => 'ಟೀಲ್';

  @override
  String get navy => 'ನೌಕಾಪಡೆ';

  @override
  String get charcoal => 'ಇದ್ದಿಲು';

  @override
  String get brown => 'ಕಂದು';

  @override
  String get darkRed => 'ಗಾಢ ಕೆಂಪು';

  @override
  String get darkGreen => 'ಗಾಢ ಹಸಿರು';

  @override
  String get slate => 'ಸ್ಲೇಟ್';

  @override
  String get indigo => 'ಇಂಡಿಗೊ';

  @override
  String get libraryDisplay => 'ಲೈಬ್ರರಿ ಪ್ರದರ್ಶನ';

  @override
  String get posterLabel => 'ಪೋಸ್ಟರ್';

  @override
  String get thumbnailLabel => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get bannerLabel => 'ಬ್ಯಾನರ್';

  @override
  String get overridePerLibrarySettings =>
      'ಪ್ರತಿ-ಲೈಬ್ರರಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಅತಿಕ್ರಮಿಸಿ';

  @override
  String get applyImageTypeToAllLibraries =>
      'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಚಿತ್ರದ ಪ್ರಕಾರವನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get multiServerLibraries => 'ಬಹು-ಸರ್ವರ್ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get showLibrariesFromAllServers =>
      'ಎಲ್ಲಾ ಸಂಪರ್ಕಿತ ಸರ್ವರ್‌ಗಳಿಂದ ಲೈಬ್ರರಿಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get enableFolderView => 'ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showFolderBrowsingOption => 'ಫೋಲ್ಡರ್ ಬ್ರೌಸಿಂಗ್ ಆಯ್ಕೆಯನ್ನು ತೋರಿಸಿ';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'ಲೈಬ್ರರಿ ಗೋಚರತೆ';

  @override
  String get libraryVisibilityDescription =>
      'ಪ್ರತಿ ಲೈಬ್ರರಿಗೆ ಮುಖಪುಟದ ಗೋಚರತೆಯನ್ನು ಟಾಗಲ್ ಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get showInNavigation => 'ನ್ಯಾವಿಗೇಶನ್‌ನಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get showInLatestMedia => 'ಇತ್ತೀಚಿನ ಮಾಧ್ಯಮದಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get sourceLibraries => 'ಮೂಲ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get sourceCollections => 'ಮೂಲ ಸಂಗ್ರಹಣೆಗಳು';

  @override
  String get excludedGenres => 'ಹೊರತುಪಡಿಸಿದ ಪ್ರಕಾರಗಳು';

  @override
  String get selectAll => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'ಮೀಡಿಯಾ ಬಾರ್';

  @override
  String get mediaSources => 'ಮಾಧ್ಯಮ ಮೂಲಗಳು';

  @override
  String get behavior => 'ನಡವಳಿಕೆ';

  @override
  String get seconds => 'ಸೆಕೆಂಡುಗಳು';

  @override
  String get localPreviews => 'ಸ್ಥಳೀಯ ಮುನ್ನೋಟಗಳು';

  @override
  String get localPreviewsDescription =>
      'ಟ್ರೇಲರ್, ಮಾಧ್ಯಮ ಮತ್ತು ಆಡಿಯೊ ಪೂರ್ವವೀಕ್ಷಣೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get mediaBarMode => 'ಮೀಡಿಯಾ ಬಾರ್ ಶೈಲಿ';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD ನಡುವೆ ಆಯ್ಕೆಮಾಡಿ ಅಥವಾ ಮಾಧ್ಯಮ ಬಾರ್ ಅನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get mediaBarModeMoonfin => 'ಮೂನ್ಫಿನ್';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ಆಫ್';

  @override
  String get enableMediaBar => 'ಮೀಡಿಯಾ ಬಾರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showFeaturedContentSlideshow =>
      'ಮುಖಪುಟದಲ್ಲಿ ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ ಸ್ಲೈಡ್‌ಶೋ ತೋರಿಸಿ';

  @override
  String get contentType => 'ವಿಷಯದ ಪ್ರಕಾರ';

  @override
  String get moviesAndTvShows => 'ಚಲನಚಿತ್ರಗಳು ಮತ್ತು ಟಿವಿ ಶೋಗಳು';

  @override
  String get moviesOnly => 'ಚಲನಚಿತ್ರಗಳು ಮಾತ್ರ';

  @override
  String get tvShowsOnly => 'ಟಿವಿ ಶೋಗಳು ಮಾತ್ರ';

  @override
  String get itemCount => 'ಐಟಂ ಎಣಿಕೆ';

  @override
  String get noneSelected => 'ಯಾವುದನ್ನೂ ಆಯ್ಕೆ ಮಾಡಿಲ್ಲ';

  @override
  String get noneExcluded => 'ಯಾವುದನ್ನೂ ಹೊರಗಿಡಲಾಗಿಲ್ಲ';

  @override
  String get autoAdvance => 'ಆಟೋ ಅಡ್ವಾನ್ಸ್';

  @override
  String get autoAdvanceSlides => 'ಮುಂದಿನ ಸ್ಲೈಡ್‌ಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಮುನ್ನಡೆಯಿರಿ';

  @override
  String get autoAdvanceInterval => 'ಸ್ವಯಂ ಮುಂಗಡ ಮಧ್ಯಂತರ';

  @override
  String get trailerPreview => 'ಟ್ರೈಲರ್ ಪೂರ್ವವೀಕ್ಷಣೆ';

  @override
  String get autoPlayTrailers =>
      '3 ಸೆಕೆಂಡುಗಳ ನಂತರ ಮೀಡಿಯಾ ಬಾರ್‌ನಲ್ಲಿ ಸ್ವಯಂ-ಪ್ಲೇ ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => 'ಸಂಚಿಕೆ ಮುನ್ನೋಟ';

  @override
  String get mediaPreview => 'ಮಾಧ್ಯಮ ಮುನ್ನೋಟ';

  @override
  String get episodePreviewDescription =>
      'ಕೇಂದ್ರೀಕರಿಸಿದ, ಸುಳಿದಾಡಿದ ಅಥವಾ ದೀರ್ಘ-ಒತ್ತಿದ ಕಾರ್ಡ್‌ಗಳಲ್ಲಿ 30-ಸೆಕೆಂಡ್ ಇನ್‌ಲೈನ್ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get mediaPreviewDescription =>
      'ಕೇಂದ್ರೀಕರಿಸಿದ, ಸುಳಿದಾಡಿದ ಅಥವಾ ದೀರ್ಘ-ಒತ್ತಿದ ಕಾರ್ಡ್‌ಗಳಲ್ಲಿ 30-ಸೆಕೆಂಡ್ ಇನ್‌ಲೈನ್ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get previewAudio => 'ಪೂರ್ವವೀಕ್ಷಣೆ ಆಡಿಯೋ';

  @override
  String get enablePreviewAudio =>
      'ಟ್ರೈಲರ್ ಮತ್ತು ಎಪಿಸೋಡ್ ಪೂರ್ವವೀಕ್ಷಣೆಗಳಿಗಾಗಿ ಆಡಿಯೊವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get latestMedia => 'ಇತ್ತೀಚಿನ ಮಾಧ್ಯಮ';

  @override
  String get recentlyReleased => 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾಗಿದೆ';

  @override
  String get myMedia => 'ನನ್ನ ಮಾಧ್ಯಮ';

  @override
  String get myMediaSmall => 'ನನ್ನ ಮಾಧ್ಯಮ (ಸಣ್ಣ)';

  @override
  String get continueWatching => 'ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get resumeAudio => 'ಆಡಿಯೊವನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get resumeBooks => 'ಪುಸ್ತಕಗಳನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get activeRecordings => 'ಸಕ್ರಿಯ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get playlists => 'ಪ್ಲೇಪಟ್ಟಿಗಳು';

  @override
  String get liveTV => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get homeSections => 'ಮುಖಪುಟ ವಿಭಾಗಗಳು';

  @override
  String get resetToDefaults => 'ಡೀಫಾಲ್ಟ್‌ಗಳಿಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get homeRowPosterSize => 'ಹೋಮ್ ರೋ ಪೋಸ್ಟರ್ ಗಾತ್ರ';

  @override
  String get perRowImageTypeSelection => 'ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರದ ಆಯ್ಕೆ';

  @override
  String get configureImageTypeForEachRow =>
      'ಪ್ರತಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾದ ಹೋಮ್ ಸಾಲಿಗೆ ಚಿತ್ರದ ಪ್ರಕಾರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'ವಿಲೀನವನ್ನು ಮುಂದುವರಿಸಿ ವೀಕ್ಷಣೆ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String get combineBothRows => 'ಎರಡೂ ಸಾಲುಗಳನ್ನು ಒಂದೇ ಹೋಮ್ ವಿಭಾಗಕ್ಕೆ ಸೇರಿಸಿ';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರ';

  @override
  String get perRowSettings => 'ಪ್ರತಿ ಸಾಲಿನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get autoLogin => 'ಸ್ವಯಂ ಲಾಗಿನ್';

  @override
  String get lastUser => 'ಕೊನೆಯ ಬಳಕೆದಾರ';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'ಯಾವಾಗಲೂ ಪ್ರಮಾಣೀಕರಿಸಿ';

  @override
  String get requirePasswordWithToken =>
      'ಸಂಗ್ರಹಿಸಿದ ಟೋಕನ್‌ನೊಂದಿಗೆ ಸಹ ಪಾಸ್‌ವರ್ಡ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get confirmExit => 'ನಿರ್ಗಮನವನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get showConfirmationBeforeExiting =>
      'ನಿರ್ಗಮಿಸುವ ಮೊದಲು ದೃಢೀಕರಣವನ್ನು ತೋರಿಸಿ';

  @override
  String get blockContentWithRatings =>
      'ಕೆಳಗಿನ ರೇಟಿಂಗ್‌ಗಳೊಂದಿಗೆ ವಿಷಯವನ್ನು ನಿರ್ಬಂಧಿಸಿ:';

  @override
  String get noContentRatingsFound =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ವಿಷಯ ರೇಟಿಂಗ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get couldNotLoadServerRatings =>
      'ಸರ್ವರ್ ರೇಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಉಳಿಸಿದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ಮಾತ್ರ ತೋರಿಸಲಾಗುತ್ತಿದೆ.';

  @override
  String get couldNotRefreshRatings =>
      'ಸರ್ವರ್‌ನಿಂದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಉಳಿಸಿದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ.';

  @override
  String get enablePinCode => 'ಪಿನ್ ಕೋಡ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get requirePinToAccess => 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಪ್ರವೇಶಿಸಲು ಪಿನ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get changePin => 'ಪಿನ್ ಬದಲಾಯಿಸಿ';

  @override
  String get setNewPinCode => 'ಹೊಸ ಪಿನ್ ಕೋಡ್ ಹೊಂದಿಸಿ';

  @override
  String get removePin => 'ಪಿನ್ ತೆಗೆದುಹಾಕಿ';

  @override
  String get removePinProtection => 'ಪಿನ್ ಕೋಡ್ ರಕ್ಷಣೆಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String get screensaver => 'ಸ್ಕ್ರೀನ್ ಸೇವರ್';

  @override
  String get inAppScreensaver => 'ಇನ್-ಅಪ್ಲಿಕೇಶನ್ ಸ್ಕ್ರೀನ್ ಸೇವರ್';

  @override
  String get enableBuiltInScreensaver =>
      'ಅಂತರ್ನಿರ್ಮಿತ ಸ್ಕ್ರೀನ್ ಸೇವರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get mode => 'ಮೋಡ್';

  @override
  String get libraryArt => 'ಗ್ರಂಥಾಲಯ ಕಲೆ';

  @override
  String get logo => 'ಲೋಗೋ';

  @override
  String get clock => 'ಗಡಿಯಾರ';

  @override
  String get timeout => 'ಸಮಯ ಮೀರಿದೆ';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'ಮಬ್ಬಾಗಿಸುವಿಕೆ ಮಟ್ಟ';

  @override
  String get maxAgeRating => 'ಗರಿಷ್ಠ ವಯಸ್ಸಿನ ರೇಟಿಂಗ್';

  @override
  String get any => 'ಯಾವುದೇ';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'ವಯಸ್ಸಿನ ರೇಟಿಂಗ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get onlyShowRatedContent => 'ರೇಟ್ ಮಾಡಲಾದ ವಿಷಯವನ್ನು ಮಾತ್ರ ತೋರಿಸಿ';

  @override
  String get showClock => 'ಗಡಿಯಾರವನ್ನು ತೋರಿಸಿ';

  @override
  String get displayClockDuringScreensaver =>
      'ಸ್ಕ್ರೀನ್ ಸೇವರ್ ಸಮಯದಲ್ಲಿ ಗಡಿಯಾರವನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'ರಾಟನ್ ಟೊಮ್ಯಾಟೋಸ್ (ವಿಮರ್ಶಕರು)';

  @override
  String get rottenTomatoesAudience => 'ರಾಟನ್ ಟೊಮ್ಯಾಟೋಸ್ (ಪ್ರೇಕ್ಷಕರು)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ಮೆಟಾಕ್ರಿಟಿಕ್';

  @override
  String get metacriticUser => 'ಮೆಟಾಕ್ರಿಟಿಕ್ (ಬಳಕೆದಾರ)';

  @override
  String get trakt => 'ಟ್ರ್ಯಾಕ್ಟ್';

  @override
  String get letterboxd => 'ಲೆಟರ್ ಬಾಕ್ಸ್';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'ಅನಿಲಿಸ್ಟ್';

  @override
  String get communityRating => 'ಸಮುದಾಯ ರೇಟಿಂಗ್';

  @override
  String get ratings => 'ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get additionalRatings => 'ಹೆಚ್ಚುವರಿ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList ಮತ್ತು TMDB ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingLabels => 'ರೇಟಿಂಗ್ ಲೇಬಲ್‌ಗಳು';

  @override
  String get showLabelsNextToIcons =>
      'ರೇಟಿಂಗ್ ಐಕಾನ್‌ಗಳ ಪಕ್ಕದಲ್ಲಿ ಲೇಬಲ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingBadges => 'ರೇಟಿಂಗ್ ಬ್ಯಾಡ್ಜ್‌ಗಳು';

  @override
  String get showDecorativeBadges =>
      'ರೇಟಿಂಗ್‌ಗಳ ಹಿಂದೆ ಅಲಂಕಾರಿಕ ಬ್ಯಾಡ್ಜ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get episodeRatings => 'ಸಂಚಿಕೆ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get showRatingsOnEpisodes =>
      'ಪ್ರತ್ಯೇಕ ಸಂಚಿಕೆಗಳಲ್ಲಿ ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingSources => 'ರೇಟಿಂಗ್ ಮೂಲಗಳು';

  @override
  String get ratingSourcesDescription =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಾದ್ಯಂತ ತೋರಿಸಲಾದ ರೇಟಿಂಗ್ ಮೂಲಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ಮರುಕ್ರಮಗೊಳಿಸಿ';

  @override
  String get pluginLabel => 'ಪ್ಲಗಿನ್';

  @override
  String get pluginDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get pluginNotDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿಲ್ಲ';

  @override
  String get pluginDetectedDescription =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿದೆ. ಮೊದಲ ಬಾರಿಗೆ ಪ್ಲಗಿನ್ ಕಂಡುಬಂದಾಗ ಸಿಂಕ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get pluginNotDetectedDescription =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಪ್ರಸ್ತುತ ಪತ್ತೆಯಾಗಿಲ್ಲ. ಸ್ಥಳೀಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಇನ್ನೂ ತಮ್ಮ ಉಳಿಸಿದ ಮೌಲ್ಯಗಳನ್ನು ಅಥವಾ ಅಂತರ್ನಿರ್ಮಿತ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಬಳಸುತ್ತವೆ.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'ಲಭ್ಯವಿರುವ ಸೇವೆಗಳು';

  @override
  String get serverPluginSync => 'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಸಿಂಕ್';

  @override
  String get syncSettingsWithPlugin =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್‌ನೊಂದಿಗೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get whatSyncControls => 'ಯಾವ ಸಿಂಕ್ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get syncControlsDescription =>
      'ಪ್ಲಗಿನ್-ಬೆಂಬಲಿತ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸರ್ವರ್‌ಗೆ ತಳ್ಳಲಾಗುತ್ತದೆ ಮತ್ತು ಎಳೆಯಲಾಗುತ್ತದೆಯೇ ಎಂಬುದನ್ನು ಮಾತ್ರ ಸಿಂಕ್ ನಿಯಂತ್ರಿಸುತ್ತದೆ. ಪ್ಲಗಿನ್ ಸಿಂಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿದಾಗ ಪ್ರೊಫೈಲ್ ಆಯ್ಕೆ ಮತ್ತು ಪ್ರೊಫೈಲ್ ಸಿಂಕ್ ಕ್ರಿಯೆಗಳು ಗ್ರಾಹಕೀಕರಣ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿವೆ.';

  @override
  String get recentRequests => 'ಇತ್ತೀಚಿನ ವಿನಂತಿಗಳು';

  @override
  String get recentlyAdded => 'ಇತ್ತೀಚೆಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get trending => 'ಟ್ರೆಂಡಿಂಗ್';

  @override
  String get popularMovies => 'ಜನಪ್ರಿಯ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get movieGenres => 'ಚಲನಚಿತ್ರ ಪ್ರಕಾರಗಳು';

  @override
  String get upcomingMovies => 'ಮುಂಬರುವ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get studios => 'ಸ್ಟುಡಿಯೋಗಳು';

  @override
  String get popularSeries => 'ಜನಪ್ರಿಯ ಸರಣಿ';

  @override
  String get seriesGenres => 'ಸರಣಿ ಪ್ರಕಾರಗಳು';

  @override
  String get upcomingSeries => 'ಮುಂಬರುವ ಸರಣಿ';

  @override
  String get networks => 'ಜಾಲಗಳು';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'ಸಾಲುಗಳನ್ನು ಡೀಫಾಲ್ಟ್‌ಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get enableSeerr => 'ಸೀರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showSeerrInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್‌ನಲ್ಲಿ ಸೀರ್ ಅನ್ನು ತೋರಿಸಿ (ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಅಗತ್ಯವಿದೆ)';

  @override
  String get seerrUnavailable =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಸೀರ್ ಬೆಂಬಲವನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿರುವುದರಿಂದ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get nsfwFilter => 'NSFW ಫಿಲ್ಟರ್';

  @override
  String get hideAdultContent => 'ಫಲಿತಾಂಶಗಳಲ್ಲಿ ವಯಸ್ಕ ವಿಷಯವನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle => 'New request notifications';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Alert me when someone submits a request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Request updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approved, declined, and added to your library';

  @override
  String get seerrNotifyIssuesTitle => 'Issue updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'New issues, replies, and resolutions';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'ಸಾಲುಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಅಥವಾ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ. Moonfin ಪ್ಲಗ್‌ಇನ್‌ನೊಂದಿಗೆ ಸಾಲಿನ ಆರ್ಡರ್ ಸಿಂಕ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get discoverRowsDescription =>
      'ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಅಥವಾ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get enabled => 'ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get hidden => 'ಮರೆಮಾಡಲಾಗಿದೆ';

  @override
  String get aboutTitle => 'ಬಗ್ಗೆ';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'ಮುಕ್ತ ಮೂಲ ಪರವಾನಗಿಗಳು';

  @override
  String get sourceCode => 'ಮೂಲ ಕೋಡ್';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'ಇದೀಗ ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get checksLatestDesktopRelease =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಇತ್ತೀಚಿನ ಡೆಸ್ಕ್‌ಟಾಪ್ ಬಿಡುಗಡೆಯನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ';

  @override
  String get youAreUpToDate => 'ನೀವು ನವೀಕೃತವಾಗಿರುವಿರಿ.';

  @override
  String get couldNotCheckForUpdates => 'ಇದೀಗ ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get noCompatibleUpdate =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಯಾವುದೇ ಹೊಂದಾಣಿಕೆಯ ಅಪ್‌ಡೇಟ್ ಪ್ಯಾಕೇಜ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get updateChecksNotSupported =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ನವೀಕರಣ ಪರಿಶೀಲನೆಗಳನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get updateNotificationsDisabled =>
      'ನವೀಕರಣ ಅಧಿಸೂಚನೆಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get pleaseWaitBeforeChecking =>
      'ಮತ್ತೊಮ್ಮೆ ಪರಿಶೀಲಿಸುವ ಮೊದಲು ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ.';

  @override
  String get latestUpdateAlreadyShown =>
      'ಇತ್ತೀಚಿನ ನವೀಕರಣವನ್ನು ಈಗಾಗಲೇ ತೋರಿಸಲಾಗಿದೆ.';

  @override
  String get updateAvailable => 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get showWhenUpdatesAvailable => 'ನವೀಕರಣಗಳು ಲಭ್ಯವಿದ್ದಾಗ ತೋರಿಸಿ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'ಬಿಡುಗಡೆ ಟಿಪ್ಪಣಿಗಳನ್ನು ಓದಿ';

  @override
  String get downloadingUpdate => 'ನವೀಕರಣವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get updateDownloadFailed =>
      'ಅಪ್‌ಡೇಟ್ ಡೌನ್‌ಲೋಡ್ ವಿಫಲವಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get openReleasesPage => 'ಬಿಡುಗಡೆಯ ಪುಟವನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get navigation => 'ನ್ಯಾವಿಗೇಷನ್';

  @override
  String get watchedIndicatorsBackdrops =>
      'ಸೂಚಕಗಳು, ಹಿನ್ನೆಲೆಗಳನ್ನು ವೀಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'ಫೋಕಸ್ ಬಣ್ಣ, ವೀಕ್ಷಿಸಿದ ಸೂಚಕಗಳು, ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar ಶೈಲಿ, ಟೂಲ್‌ಬಾರ್ ಬಟನ್‌ಗಳು, ನೋಟ';

  @override
  String get reorderToggleHomeRows =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಮರುಕ್ರಮಗೊಳಿಸಿ ಮತ್ತು ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get featuredContentAppearance => 'ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ, ನೋಟ';

  @override
  String get posterSizeImageTypeFolderView =>
      'ಪೋಸ್ಟರ್ ಗಾತ್ರ, ಚಿತ್ರದ ಪ್ರಕಾರ, ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆ';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, ಮತ್ತು ರೇಟಿಂಗ್ ಮೂಲಗಳು';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String get browse => 'ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get noResults => 'ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';

  @override
  String get seerrAvailableStatus => 'ಲಭ್ಯವಿದೆ';

  @override
  String get seerrRequestedStatus => 'ಕೋರಲಾಗಿದೆ';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'ಸೀರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get requestMore => 'ಇನ್ನಷ್ಟು ವಿನಂತಿಸಿ';

  @override
  String get request => 'ವಿನಂತಿ';

  @override
  String get cancelRequest => 'ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡಿ';

  @override
  String get playInMoonfin => 'Moonfin ನಲ್ಲಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'ಅನುಮೋದಿಸಿ';

  @override
  String get declineAction => 'ನಿರಾಕರಿಸು';

  @override
  String get similar => 'ಇದೇ';

  @override
  String get recommendations => 'ಶಿಫಾರಸುಗಳು';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'ಇರಿಸಿಕೊಳ್ಳಿ';

  @override
  String get itemNotFoundInLibrary =>
      'ನಿಮ್ಮ Moonfin ಲೈಬ್ರರಿಯಲ್ಲಿ ಐಟಂ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get errorSearchingLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಹುಡುಕುವಲ್ಲಿ ದೋಷ';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Revenue: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Request $type';
  }

  @override
  String get submitRequest => 'ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get allSeasons => 'ಎಲ್ಲಾ ಋತುಗಳು';

  @override
  String get advancedOptions => 'ಸುಧಾರಿತ ಆಯ್ಕೆಗಳು';

  @override
  String get noServiceServersConfigured =>
      'ಯಾವುದೇ ಸೇವಾ ಸರ್ವರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get server => 'ಸರ್ವರ್';

  @override
  String get qualityProfile => 'ಗುಣಮಟ್ಟದ ಪ್ರೊಫೈಲ್';

  @override
  String get rootFolder => 'ರೂಟ್ ಫೋಲ್ಡರ್';

  @override
  String get showMore => 'ಇನ್ನಷ್ಟು ತೋರಿಸು';

  @override
  String get appearances => 'ಗೋಚರತೆಗಳು';

  @override
  String get crewSection => 'ಸಿಬ್ಬಂದಿ';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'ಯಾವುದೇ ವಿನಂತಿಗಳಿಲ್ಲ';

  @override
  String get pendingStatus => 'ಬಾಕಿಯಿದೆ';

  @override
  String get declinedStatus => 'ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get partiallyAvailable => 'ಭಾಗಶಃ ಲಭ್ಯವಿದೆ';

  @override
  String get downloadingStatus => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get approvedStatus => 'ಅನುಮೋದಿಸಲಾಗಿದೆ';

  @override
  String get notRequestedStatus => 'ವಿನಂತಿಸಲಾಗಿಲ್ಲ';

  @override
  String get blocklistedStatus => 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get deletedStatus => 'ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get failedStatus => 'Failed';

  @override
  String get processingStatus => 'Processing';

  @override
  String modifiedByName(String name) {
    return 'Modified by $name';
  }

  @override
  String get completedStatus => 'Completed';

  @override
  String get requestErrorDuplicate => 'This title was already requested';

  @override
  String get requestErrorQuota => 'Request limit reached';

  @override
  String get requestErrorBlocklisted => 'This title is blocklisted';

  @override
  String get requestErrorNoSeasons => 'No seasons left to request';

  @override
  String get requestErrorPermission =>
      'You don\'t have permission to make this request';

  @override
  String get seerrRequestsTitle => 'Requests';

  @override
  String get seerrIssuesTitle => 'Issues';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortLastModified => 'Last Modified';

  @override
  String get noIssues => 'No issues';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit movie requests remaining';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit season requests remaining';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Part of $name';
  }

  @override
  String get viewCollection => 'View Collection';

  @override
  String get requestCollection => 'Request Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total movies · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Request $count movies';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Requesting $current of $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Requested $count movies';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Requested $ok of $total movies';
  }

  @override
  String get collectionAllRequested =>
      'All movies are already available or requested';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'What\'s wrong?';

  @override
  String get allEpisodes => 'All Episodes';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Resolved';

  @override
  String get resolveAction => 'Resolve';

  @override
  String get reopenAction => 'Reopen';

  @override
  String reportedByName(String name) {
    return 'Reported by $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String get addComment => 'Add a comment';

  @override
  String get deleteIssueConfirm => 'Delete this issue?';

  @override
  String get submitReport => 'Submit Report';

  @override
  String get tmdbScore => 'TMDB ಸ್ಕೋರ್';

  @override
  String get releaseDateLabel => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ';

  @override
  String get firstAirDateLabel => 'ಮೊದಲ ಪ್ರಸಾರ ದಿನಾಂಕ';

  @override
  String get revenueLabel => 'ಆದಾಯ';

  @override
  String get runtimeLabel => 'ಚಾಲನಾಸಮಯ';

  @override
  String get budgetLabel => 'ಬಜೆಟ್';

  @override
  String get originalLanguageLabel => 'ಮೂಲ ಭಾಷೆ';

  @override
  String get seasonsLabel => 'ಋತುಗಳು';

  @override
  String get episodesLabel => 'ಸಂಚಿಕೆಗಳು';

  @override
  String get access => 'ಪ್ರವೇಶ';

  @override
  String get add => 'ಸೇರಿಸಿ';

  @override
  String get address => 'ವಿಳಾಸ';

  @override
  String get analytics => 'ಅನಾಲಿಟಿಕ್ಸ್';

  @override
  String get catalog => 'ಕ್ಯಾಟಲಾಗ್';

  @override
  String get content => 'ವಿಷಯ';

  @override
  String get copy => 'ನಕಲು ಮಾಡಿ';

  @override
  String get create => 'ರಚಿಸಿ';

  @override
  String get disable => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get done => 'ಮುಗಿದಿದೆ';

  @override
  String get edit => 'ಸಂಪಾದಿಸು';

  @override
  String get encoding => 'ಎನ್ಕೋಡಿಂಗ್';

  @override
  String get error => 'ದೋಷ';

  @override
  String get forward => 'ಮುಂದಕ್ಕೆ';

  @override
  String get general => 'ಸಾಮಾನ್ಯ';

  @override
  String get go => 'ಹೋಗು';

  @override
  String get install => 'ಸ್ಥಾಪಿಸಿ';

  @override
  String get installed => 'ಸ್ಥಾಪಿಸಲಾಗಿದೆ';

  @override
  String get interval => 'ಮಧ್ಯಂತರ';

  @override
  String get name => 'ಹೆಸರು';

  @override
  String get networking => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get next => 'ಮುಂದೆ';

  @override
  String get path => 'ಮಾರ್ಗ';

  @override
  String get paused => 'ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get permissions => 'ಅನುಮತಿಗಳು';

  @override
  String get processing => 'ಸಂಸ್ಕರಣೆ';

  @override
  String get profile => 'ಪ್ರೊಫೈಲ್';

  @override
  String get provider => 'ಒದಗಿಸುವವರು';

  @override
  String get refresh => 'ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get remote => 'ರಿಮೋಟ್';

  @override
  String get rename => 'ಮರುಹೆಸರಿಸು';

  @override
  String get revoke => 'ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String get role => 'ಪಾತ್ರ';

  @override
  String get root => 'ರೂಟ್';

  @override
  String get run => 'ಓಡು';

  @override
  String get search => 'ಹುಡುಕು';

  @override
  String get select => 'ಆಯ್ಕೆ ಮಾಡಿ';

  @override
  String get send => 'ಕಳುಹಿಸು';

  @override
  String get sessions => 'ಸೆಷನ್ಸ್';

  @override
  String get set => 'ಹೊಂದಿಸಿ';

  @override
  String get status => 'ಸ್ಥಿತಿ';

  @override
  String get stop => 'ನಿಲ್ಲಿಸು';

  @override
  String get streaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get time => 'ಸಮಯ';

  @override
  String get trickplay => 'ಟ್ರಿಕ್ಪ್ಲೇ';

  @override
  String get uninstall => 'ಅನ್‌ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ';

  @override
  String get up => 'ಮೇಲಕ್ಕೆ';

  @override
  String get update => 'ನವೀಕರಿಸಿ';

  @override
  String get upload => 'ಅಪ್ಲೋಡ್ ಮಾಡಿ';

  @override
  String get unmute => 'ಅನ್‌ಮ್ಯೂಟ್ ಮಾಡಿ';

  @override
  String get mute => 'ಮ್ಯೂಟ್ ಮಾಡಿ';

  @override
  String get branding => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminDrawerDashboard => 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್';

  @override
  String get adminDrawerAnalytics => 'ಅನಾಲಿಟಿಕ್ಸ್';

  @override
  String get adminDrawerSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminDrawerBranding => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminDrawerUsers => 'ಬಳಕೆದಾರರು';

  @override
  String get adminDrawerLibraries => 'ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'ಟ್ರಾನ್ಸ್ಕೋಡಿಂಗ್';

  @override
  String get adminDrawerResume => 'ಪುನರಾರಂಭಿಸಿ';

  @override
  String get adminDrawerStreaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get adminDrawerTrickplay => 'ಟ್ರಿಕ್ಪ್ಲೇ';

  @override
  String get adminDrawerDevices => 'ಸಾಧನಗಳು';

  @override
  String get adminDrawerActivity => 'ಚಟುವಟಿಕೆ';

  @override
  String get adminDrawerNetworking => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get adminDrawerApiKeys => 'API ಕೀಗಳು';

  @override
  String get adminDrawerBackups => 'ಬ್ಯಾಕಪ್‌ಗಳು';

  @override
  String get adminDrawerLogs => 'ದಾಖಲೆಗಳು';

  @override
  String get adminDrawerScheduledTasks => 'ನಿಗದಿತ ಕಾರ್ಯಗಳು';

  @override
  String get adminDrawerPlugins => 'ಪ್ಲಗಿನ್‌ಗಳು';

  @override
  String get adminDrawerRepositories => 'ರೆಪೊಸಿಟರಿಗಳು';

  @override
  String get adminDrawerLiveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get adminExitTooltip => 'ನಿರ್ವಾಹಕರಿಂದ ನಿರ್ಗಮಿಸಿ';

  @override
  String get adminDashboardLoadFailed => 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminMediaOverview => 'ಮಾಧ್ಯಮ ಅವಲೋಕನ';

  @override
  String get adminMediaTotalsError =>
      'ಸರ್ವರ್ ಮೀಡಿಯಾ ಮೊತ್ತವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get adminMediaOverviewSubtitle =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಎಷ್ಟು ವಿಷಯವಿದೆ ಎಂಬುದರ ಕುರಿತು ತ್ವರಿತ ಓದುವಿಕೆ.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Plugin updates available: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins requiring restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Failed scheduled tasks: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Recent warning/error entries: $count';
  }

  @override
  String get analyticsMediaDistribution => 'ಮಾಧ್ಯಮ ವಿತರಣೆ';

  @override
  String get analyticsVideoCodecs => 'ವೀಡಿಯೊ ಕೋಡೆಕ್‌ಗಳು';

  @override
  String get analyticsAudioCodecs => 'ಆಡಿಯೋ ಕೋಡೆಕ್‌ಗಳು';

  @override
  String get analyticsContainers => 'ಕಂಟೈನರ್ಗಳು';

  @override
  String get analyticsTopGenres => 'ಉನ್ನತ ಪ್ರಕಾರಗಳು';

  @override
  String get analyticsReleaseYears => 'ಬಿಡುಗಡೆಯ ವರ್ಷಗಳು';

  @override
  String get analyticsContentRatings => 'ವಿಷಯ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get analyticsRuntimeBuckets => 'ರನ್ಟೈಮ್ ಬಕೆಟ್ಗಳು';

  @override
  String get analyticsFileFormats => 'ಫೈಲ್ ಸ್ವರೂಪಗಳು';

  @override
  String get analyticsNoData => 'ಯಾವುದೇ ಡೇಟಾ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminServerInfo => 'ಸರ್ವರ್ ಮಾಹಿತಿ';

  @override
  String get adminRestartPending => 'ಮರುಪ್ರಾರಂಭಿಸಲು ಬಾಕಿಯಿದೆ';

  @override
  String get adminServerPaths => 'ಸರ್ವರ್ ಮಾರ್ಗಗಳು';

  @override
  String get adminServerActions => 'ಸರ್ವರ್ ಕ್ರಿಯೆಗಳು';

  @override
  String get adminRestartServer => 'ಸರ್ವರ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get adminShutdownServer => 'ಸ್ಥಗಿತಗೊಳಿಸುವ ಸರ್ವರ್';

  @override
  String get adminScanLibraries => 'ಲೈಬ್ರರಿಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminLibraryScanStarted => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'ಸರ್ವರ್ ರೀಬೂಟ್ ಪ್ರಗತಿಯಲ್ಲಿದೆ';

  @override
  String get adminServerRebootMessage =>
      'ಸರ್ವರ್ ರೀಬೂಟ್ ಪ್ರಗತಿಯಲ್ಲಿದೆ, ದಯವಿಟ್ಟು ಮರುಪ್ರಾರಂಭಿಸಿ Moonfin';

  @override
  String get adminActiveSessions => 'ಸಕ್ರಿಯ ಅವಧಿಗಳು';

  @override
  String get adminSessionsLoadFailed => 'ಸೆಶನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoActiveSessions => 'ಯಾವುದೇ ಸಕ್ರಿಯ ಅವಧಿಗಳಿಲ್ಲ';

  @override
  String get adminRecentActivity => 'ಇತ್ತೀಚಿನ ಚಟುವಟಿಕೆ';

  @override
  String get adminNoRecentActivity => 'ಯಾವುದೇ ಇತ್ತೀಚಿನ ಚಟುವಟಿಕೆ ಇಲ್ಲ';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'ಸಂದೇಶ ಕಳುಹಿಸಿ';

  @override
  String get adminMessageTextHint => 'ಸಂದೇಶ ಪಠ್ಯ';

  @override
  String get adminSetVolume => 'ವಾಲ್ಯೂಮ್ ಹೊಂದಿಸಿ';

  @override
  String get sessionPrev => 'ಹಿಂದಿನ';

  @override
  String get sessionRewind => 'ರಿವೈಂಡ್';

  @override
  String get sessionForward => 'ಮುಂದಕ್ಕೆ';

  @override
  String get sessionNext => 'ಮುಂದೆ';

  @override
  String get sessionVolumeDown => 'ಸಂಪುಟ -';

  @override
  String get sessionVolumeUp => 'ಸಂಪುಟ +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ಈಗ ಪ್ಲೇ ಆಗುತ್ತಿದೆ';

  @override
  String get volume => 'ಸಂಪುಟ';

  @override
  String get actions => 'ಕ್ರಿಯೆಗಳು';

  @override
  String get videoCodec => 'ವೀಡಿಯೊ ಕೋಡೆಕ್';

  @override
  String get audioCodec => 'ಆಡಿಯೋ ಕೋಡೆಕ್';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'ಪೂರ್ಣಗೊಳಿಸುವಿಕೆ';

  @override
  String get direct => 'ನೇರ';

  @override
  String get adminDisconnect => 'ಸಂಪರ್ಕ ಕಡಿತಗೊಳಿಸಿ';

  @override
  String get adminClearDates => 'ದಿನಾಂಕಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'ಯಾವುದೇ ಚಟುವಟಿಕೆ ನಮೂದುಗಳಿಲ್ಲ';

  @override
  String get adminEditDeviceName => 'ಸಾಧನದ ಹೆಸರನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminCustomName => 'ಕಸ್ಟಮ್ ಹೆಸರು';

  @override
  String get adminDeviceNameUpdated => 'ಸಾಧನದ ಹೆಸರನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'ಸಾಧನವನ್ನು ಅಳಿಸಿ';

  @override
  String get adminDeviceDeleted => 'ಸಾಧನವನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remove device \'$name\'? The user will need to sign in again on this device.';
  }

  @override
  String get adminDeleteAllDevices => 'Delete all devices';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remove $count devices? Affected users will need to sign in again. Your current device is not affected.';
  }

  @override
  String get adminDevicesDeletedAll => 'Devices removed';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Removed some devices; $count could not be removed.';
  }

  @override
  String get adminDevicesLoadFailed => 'ಸಾಧನಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminSearchDevices => 'ಸಾಧನಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get adminThisDevice => 'ಈ ಸಾಧನ';

  @override
  String get adminEditName => 'ಹೆಸರು ಸಂಪಾದಿಸಿ';

  @override
  String get adminLibrariesLoadFailed => 'ಲೈಬ್ರರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoLibraries => 'ಯಾವುದೇ ಗ್ರಂಥಾಲಯಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminScanAllLibraries => 'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminAddLibrary => 'ಲೈಬ್ರರಿ ಸೇರಿಸಿ';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಮರುಹೆಸರಿಸಿ';

  @override
  String get adminNewName => 'ಹೊಸ ಹೆಸರು';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'ಲೈಬ್ರರಿ ಅಳಿಸಿ';

  @override
  String adminLibraryDeleted(String name) {
    return 'Library \"$name\" deleted';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Failed to delete library: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Failed to add path: $error';
  }

  @override
  String get adminRemovePath => 'ಮಾರ್ಗವನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ಲೈಬ್ರರಿ ಆಯ್ಕೆಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'ಲೈಬ್ರರಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoMediaPaths =>
      'ಯಾವುದೇ ಮಾಧ್ಯಮ ಮಾರ್ಗಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminAddPath => 'ಮಾರ್ಗವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminBrowseFilesystem => 'ಸರ್ವರ್ ಫೈಲ್ ಸಿಸ್ಟಮ್ ಅನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ:';

  @override
  String get adminSaveOptions => 'ಆಯ್ಕೆಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminPreferredMetadataLanguage => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminMetadataLanguageHint => 'ಉದಾ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'ಮೆಟಾಡೇಟಾ ದೇಶದ ಕೋಡ್';

  @override
  String get adminMetadataCountryHint => 'ಉದಾ. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Paths';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metadata savers';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitle downloaders';

  @override
  String get adminLibLyricDownloaders => 'Lyric downloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadata downloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Image fetchers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'This server exposes no downloaders for this library type.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded Info';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitles';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Music';

  @override
  String get adminLibrarySectionMovies => 'Movies';

  @override
  String get adminLibRealtimeMonitor => 'Enable real-time monitoring';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detect file changes and process them automatically.';

  @override
  String get adminLibArchiveMediaFiles => 'Treat archives as media files';

  @override
  String get adminLibEnablePhotos => 'Display photos';

  @override
  String get adminLibSaveLocalMetadata => 'Save artwork into media folders';

  @override
  String get adminLibRefreshInterval => 'Automatic metadata refresh';

  @override
  String get adminLibRefreshNever => 'Never';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Library display';

  @override
  String get adminLibFolderView =>
      'Display a folder view to show plain media folders';

  @override
  String get adminLibSpecialsInSeasons =>
      'Display specials within seasons they aired in';

  @override
  String get adminLibGroupMovies => 'Group movies into collections';

  @override
  String get adminLibGroupShows => 'Group shows into collections';

  @override
  String get adminLibExternalSuggestions =>
      'Show external content in suggestions';

  @override
  String get adminLibDateAddedSection => 'Date added behavior';

  @override
  String get adminLibDateAddedLabel => 'Use date added from';

  @override
  String get adminLibDateAddedImport => 'Date scanned into the library';

  @override
  String get adminLibDateAddedFile => 'Date the file was created';

  @override
  String get adminLibMetadataTitle => 'Metadata and Images';

  @override
  String get adminLibMetadataLangSection => 'Preferred metadata language';

  @override
  String get adminLibChaptersSection => 'Chapters';

  @override
  String get adminLibDummyChapterDuration => 'Dummy chapter duration (seconds)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Length of chapters generated for media that has none. Set to 0 to disable.';

  @override
  String get adminLibChapterImageResolution => 'Chapter image resolution';

  @override
  String get adminLibNfoTitle => 'NFO Settings';

  @override
  String get adminLibNfoHelp =>
      'NFO metadata is compatible with Kodi and similar clients. Settings apply to all libraries that save NFO metadata.';

  @override
  String get adminLibKodiUser => 'User to store watch data for in NFO files';

  @override
  String get adminLibSaveImagePaths => 'Save image paths within NFO files';

  @override
  String get adminLibPathSubstitution =>
      'Enable path substitution for NFO image paths';

  @override
  String get adminLibExtraThumbs =>
      'Copy extrafanart images into an extrathumbs folder';

  @override
  String get adminLibNone => 'None';

  @override
  String adminLibRefreshDays(int days) {
    return '$days days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Use embedded titles';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Use embedded titles for extras';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Use embedded episode information';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Allow embedded subtitles';

  @override
  String get adminLibEmbeddedAllowAll => 'Allow all';

  @override
  String get adminLibEmbeddedAllowText => 'Text only';

  @override
  String get adminLibEmbeddedAllowImage => 'Image only';

  @override
  String get adminLibEmbeddedAllowNone => 'None';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Skip download if embedded subtitles are present';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Skip download if the audio track matches the download language';

  @override
  String get adminLibRequirePerfectMatch => 'Require a perfect subtitle match';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Save subtitles into media folders';

  @override
  String get adminLibChapterImageExtraction => 'Extract chapter images';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extract chapter images during the library scan';

  @override
  String get adminLibTrickplayExtraction => 'Enable trickplay image extraction';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extract trickplay images during the library scan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Save trickplay images into media folders';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatically merge series that are spread across multiple folders';

  @override
  String get adminLibSeasonZeroName => 'Season zero display name';

  @override
  String get adminLibLufsScan => 'Enable LUFS scan for audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prefer non-standard artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatically add movies to collections';

  @override
  String get adminLibraryNameRequired => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು';

  @override
  String get adminSelectedPaths => 'ಆಯ್ದ ಮಾರ್ಗಗಳು:';

  @override
  String get adminNoPathsAdded =>
      'ಯಾವುದೇ ಮಾರ್ಗಗಳನ್ನು ಸೇರಿಸಲಾಗಿಲ್ಲ (ನಂತರ ಸೇರಿಸಬಹುದು)';

  @override
  String get adminCreateLibrary => 'ಲೈಬ್ರರಿ ರಚಿಸಿ';

  @override
  String get paths => 'ಮಾರ್ಗಗಳು:';

  @override
  String get adminDisableUser => 'ಬಳಕೆದಾರರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableUser => 'ಬಳಕೆದಾರರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Disable $name? They will not be able to sign in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Enable $name? They will be able to sign in again.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'User \"$name\" disabled';
  }

  @override
  String adminUserEnabled(String name) {
    return 'User \"$name\" enabled';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Failed to update user policy: $error';
  }

  @override
  String get adminUsersLoadFailed => 'ಬಳಕೆದಾರರನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminSearchUsers => 'ಬಳಕೆದಾರರನ್ನು ಹುಡುಕಿ';

  @override
  String get adminEditUser => 'ಬಳಕೆದಾರರನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminAddUser => 'ಬಳಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'ಬಳಕೆದಾರರನ್ನು ರಚಿಸಿ';

  @override
  String get adminPasswordOptional => 'ಪಾಸ್ವರ್ಡ್ (ಐಚ್ಛಿಕ)';

  @override
  String get adminUsernameRequired => 'ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿ ಇರುವಂತಿಲ್ಲ';

  @override
  String get adminNoProfileChanges => 'ಉಳಿಸಲು ಯಾವುದೇ ಪ್ರೊಫೈಲ್ ಬದಲಾವಣೆಗಳಿಲ್ಲ';

  @override
  String get adminProfileSaved => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'ಅನುಮತಿಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminPasswordsMismatch => 'ಪಾಸ್‌ವರ್ಡ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'ಬಳಕೆದಾರರನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminBackToUsers => 'ಬಳಕೆದಾರರಿಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get adminSaveProfile => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಿ';

  @override
  String get adminDeleteUser => 'ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಿ';

  @override
  String get admin => 'ನಿರ್ವಾಹಕ';

  @override
  String get adminFullAccessWarning =>
      'ನಿರ್ವಾಹಕರು ಸರ್ವರ್‌ಗೆ ಸಂಪೂರ್ಣ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿರುತ್ತಾರೆ. ಎಚ್ಚರಿಕೆಯಿಂದ ಅನುದಾನ ನೀಡಿ.';

  @override
  String get administrator => 'ನಿರ್ವಾಹಕ';

  @override
  String get adminHiddenUser => 'ಗುಪ್ತ ಬಳಕೆದಾರ';

  @override
  String get adminAllowMediaPlayback => 'ಮಾಧ್ಯಮ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowAudioTranscoding =>
      'ಆಡಿಯೋ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowVideoTranscoding =>
      'ವೀಡಿಯೊ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemuxing => 'ರೀಮಕ್ಸಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminForceRemoteTranscoding =>
      'ರಿಮೋಟ್ ಸೋರ್ಸ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಒತ್ತಾಯಿಸಿ';

  @override
  String get adminAllowContentDeletion => 'ವಿಷಯವನ್ನು ಅಳಿಸಲು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowContentDownloading =>
      'ವಿಷಯವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowPublicSharing => 'ಸಾರ್ವಜನಿಕ ಹಂಚಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemoteControl =>
      'ಇತರ ಬಳಕೆದಾರರ ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowSharedDeviceControl =>
      'ಹಂಚಿದ ಸಾಧನ ನಿಯಂತ್ರಣವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminRemoteBitrateLimit => 'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'ಯಾವುದೇ ಮಿತಿಯಿಲ್ಲದೆ ಖಾಲಿ ಬಿಡಿ';

  @override
  String get adminMaxActiveSessions => 'ಗರಿಷ್ಠ ಸಕ್ರಿಯ ಅವಧಿಗಳು';

  @override
  String get adminAllowLiveTvAccess => 'ಲೈವ್ ಟಿವಿ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowLiveTvManagement => 'ಲೈವ್ ಟಿವಿ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowCollectionManagement => 'ಸಂಗ್ರಹ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowSubtitleManagement =>
      'ಉಪಶೀರ್ಷಿಕೆ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowLyricManagement => 'ಸಾಹಿತ್ಯ ನಿರ್ವಹಣೆಗೆ ಅವಕಾಶ ನೀಡಿ';

  @override
  String get adminSavePermissions => 'ಅನುಮತಿಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminEnableAllLibraryAccess =>
      'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminSaveAccess => 'ಪ್ರವೇಶವನ್ನು ಉಳಿಸಿ';

  @override
  String get adminChangePassword => 'ಪಾಸ್ವರ್ಡ್ ಬದಲಾಯಿಸಿ';

  @override
  String get adminNewPassword => 'ಹೊಸ ಪಾಸ್ವರ್ಡ್';

  @override
  String get adminConfirmPassword => 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get adminSetPassword => 'ಪಾಸ್ವರ್ಡ್ ಹೊಂದಿಸಿ';

  @override
  String get adminResetPassword => 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminPasswordReset => 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminPasswordUpdated => 'ಪಾಸ್ವರ್ಡ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get adminUserSettings => 'ಬಳಕೆದಾರರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminLibraryAccess => 'ಗ್ರಂಥಾಲಯ ಪ್ರವೇಶ';

  @override
  String get adminDeviceAndChannelAccess => 'ಸಾಧನ ಮತ್ತು ಚಾನಲ್ ಪ್ರವೇಶ';

  @override
  String get adminEnableAllDevices =>
      'ಎಲ್ಲಾ ಸಾಧನಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableAllChannels =>
      'ಎಲ್ಲಾ ಚಾನಲ್‌ಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating => 'Maximum allowed parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Content with a higher rating will be hidden from this user.';

  @override
  String get adminParentalRatingNone => 'None';

  @override
  String get adminBlockUnratedItems =>
      'Block items with no or unrecognized rating information';

  @override
  String get adminUnratedBook => 'Books';

  @override
  String get adminUnratedChannelContent => 'Channels';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Movies';

  @override
  String get adminUnratedMusic => 'Music';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Shows';

  @override
  String get adminAccessSchedules => 'Access Schedules';

  @override
  String get adminAccessSchedulesHint =>
      'Allow access only during the scheduled times below. Access is allowed all day when no schedule is set.';

  @override
  String get adminAddSchedule => 'Add Schedule';

  @override
  String get adminScheduleDay => 'Day';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'End';

  @override
  String get adminDayEveryday => 'Every day';

  @override
  String get adminDayWeekday => 'Weekday';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Sunday';

  @override
  String get adminDayMonday => 'Monday';

  @override
  String get adminDayTuesday => 'Tuesday';

  @override
  String get adminDayWednesday => 'Wednesday';

  @override
  String get adminDayThursday => 'Thursday';

  @override
  String get adminDayFriday => 'Friday';

  @override
  String get adminDaySaturday => 'Saturday';

  @override
  String get adminAllowedTags => 'Allowed tags';

  @override
  String get adminAllowedTagsHint =>
      'Only content with these tags is shown. Leave empty to allow all.';

  @override
  String get adminBlockedTags => 'Blocked tags';

  @override
  String get adminBlockedTagsHint =>
      'Content with these tags is hidden from this user.';

  @override
  String get adminAddTag => 'Add tag';

  @override
  String get adminEnabledDevices => 'Enabled devices';

  @override
  String get adminEnabledChannels => 'Enabled channels';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximum failed login attempts before lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Set to 0 for the default, or -1 to disable lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin => 'Allow creating and joining groups';

  @override
  String get adminSyncPlayJoin => 'Allow joining groups';

  @override
  String get adminSyncPlayNone => 'No access';

  @override
  String get adminContentDeletionFolders => 'Allow content deletion from';

  @override
  String get adminResetPasswordWarning =>
      'ಇದು ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ. ಬಳಕೆದಾರರು ಪಾಸ್‌ವರ್ಡ್ ಇಲ್ಲದೆ ಲಾಗ್ ಇನ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server returned HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'User \"$name\" deleted';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Failed to delete user: $error';
  }

  @override
  String get adminCreateApiKey => 'API ಕೀಯನ್ನು ರಚಿಸಿ';

  @override
  String get adminAppName => 'ಅಪ್ಲಿಕೇಶನ್ ಹೆಸರು';

  @override
  String get adminApiKeyCreated => 'API ಕೀಯನ್ನು ರಚಿಸಲಾಗಿದೆ';

  @override
  String get adminApiKeyCreatedNoToken =>
      'ಕೀಲಿಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಟೋಕನ್ ಹಿಂತಿರುಗಿಸಲಿಲ್ಲ. ಸರ್ವರ್ API ಕೀಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get adminKeyCopied => 'ಕೀಲಿಯನ್ನು ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಿಂದ ಕೀ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get adminRevokeApiKey => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಲಾಗಿದೆ';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API ಕೀಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminApiKeysTitle => 'API ಕೀಗಳು';

  @override
  String get adminCreateKey => 'ಕೀಲಿಯನ್ನು ರಚಿಸಿ';

  @override
  String get adminNoApiKeys => 'ಯಾವುದೇ API ಕೀಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminUnknownApp => 'ಅಜ್ಞಾತ ಅಪ್ಲಿಕೇಶನ್';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Create Backup';

  @override
  String get adminBackupInclude => 'Choose what to include in the backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Always included';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Subtitles';

  @override
  String get adminBackupTrickplay => 'Trickplay images';

  @override
  String get adminCreatingBackup => 'ಬ್ಯಾಕಪ್ ರಚಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get adminBackupCreated => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಲ್ಲಿ ಬ್ಯಾಕಪ್ ಮಾರ್ಗ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'ಮರುಸ್ಥಾಪನೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get adminRestoringBackup => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಮರುಸ್ಥಾಪಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'ಬ್ಯಾಕಪ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminCreateBackup => 'ಬ್ಯಾಕಪ್ ರಚಿಸಿ';

  @override
  String get adminNoBackups => 'ಯಾವುದೇ ಬ್ಯಾಕ್‌ಅಪ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminViewDetails => 'ವಿವರಗಳನ್ನು ವೀಕ್ಷಿಸಿ';

  @override
  String get restore => 'ಮರುಸ್ಥಾಪಿಸಿ';

  @override
  String get adminLogsLoadFailed => 'ಸರ್ವರ್ ಲಾಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoLogFiles => 'ಯಾವುದೇ ಲಾಗ್ ಫೈಲ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminLogCopied => 'ಲಾಗ್ ಅನ್ನು ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get adminSaveLogFile => 'ಲಾಗ್ ಫೈಲ್ ಅನ್ನು ಉಳಿಸಿ';

  @override
  String adminSavedTo(String path) {
    return 'Saved to $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Failed to save file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String get adminSearchInLog => 'ಲಾಗ್‌ನಲ್ಲಿ ಹುಡುಕಿ';

  @override
  String get adminNoMatchingLines => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ಯಾವುದೇ ನಿಗದಿತ ಕಾರ್ಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoTasksMatchFilter =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗೆ ಯಾವುದೇ ಕಾರ್ಯಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String adminTaskStartFailed(String error) {
    return 'Failed to start task: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Failed to stop task: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Failed to load task: $error';
  }

  @override
  String get adminRunNow => 'ಈಗ ರನ್ ಮಾಡಿ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'ಕೊನೆಯ ಮರಣದಂಡನೆ';

  @override
  String get adminTriggers => 'ಪ್ರಚೋದಿಸುತ್ತದೆ';

  @override
  String get adminAddTrigger => 'ಪ್ರಚೋದಕವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminNoTriggers => 'ಯಾವುದೇ ಟ್ರಿಗ್ಗರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminTriggerType => 'ಪ್ರಚೋದಕ ಪ್ರಕಾರ';

  @override
  String get adminTimeLimit => 'ಸಮಯದ ಮಿತಿ (ಐಚ್ಛಿಕ)';

  @override
  String get adminNoLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'ವಾರದ ದಿನ';

  @override
  String get adminSearchPlugins => 'ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'ಅಸ್ಥಾಪಿಸು ಪ್ಲಗಿನ್';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Are you sure you want to uninstall \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Failed to uninstall plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Failed to install package: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Failed to install update: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Failed to load plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoPluginsInstalled => 'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoPackagesAvailable => 'ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get adminExperimentalIntegration => 'ಪ್ರಾಯೋಗಿಕ ಏಕೀಕರಣ';

  @override
  String get adminExperimentalWarning =>
      'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಏಕೀಕರಣವು ಇನ್ನೂ ಪ್ರಾಯೋಗಿಕವಾಗಿದೆ. ಕೆಲವು ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪುಟಗಳು ಸರಿಯಾಗಿ ರೆಂಡರ್ ಆಗದೇ ಇರಬಹುದು.';

  @override
  String get continueAction => 'ಮುಂದುವರಿಸಿ';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" will be removed after server restart';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Failed to uninstall: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Updating \"$name\" to v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ: ದೃಢೀಕರಣ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'ಪ್ಲಗಿನ್ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'ಪ್ಲಗಿನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginSettingsPage => 'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪುಟ';

  @override
  String get adminRevisionHistory => 'ಪರಿಷ್ಕರಣೆ ಇತಿಹಾಸ';

  @override
  String get adminNoChangelog => 'ಯಾವುದೇ ಚೇಂಜ್ಲಾಗ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRemoveRepository => 'ರೆಪೊಸಿಟರಿಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ಉದಾ. Jellyfin ಸ್ಥಿರ';

  @override
  String get adminRepositoryUrl => 'ರೆಪೊಸಿಟರಿ URL';

  @override
  String get adminAddEntry => 'ನಮೂದನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminInvalidUrl => 'ಅಮಾನ್ಯ URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ';

  @override
  String get adminOpenExternally => 'ಬಾಹ್ಯವಾಗಿ ತೆರೆಯಿರಿ';

  @override
  String get adminGeneralSettings => 'ಸಾಮಾನ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get adminServerName => 'ಸರ್ವರ್ ಹೆಸರು';

  @override
  String get adminPreferredMetadataCountry => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ದೇಶ';

  @override
  String get adminCachePath => 'ಸಂಗ್ರಹ ಮಾರ್ಗ';

  @override
  String get adminMetadataPath => 'ಮೆಟಾಡೇಟಾ ಮಾರ್ಗ';

  @override
  String get adminLibraryScanConcurrency => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಏಕಕಾಲಿಕತೆ';

  @override
  String get adminParallelImageEncodingLimit =>
      'ಸಮಾನಾಂತರ ಚಿತ್ರ ಎನ್ಕೋಡಿಂಗ್ ಮಿತಿ';

  @override
  String get adminSlowResponseThreshold => 'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಮಿತಿ (ಮಿಸೆ)';

  @override
  String get adminBrandingSaved => 'ಬ್ರ್ಯಾಂಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingLoadFailed =>
      'ಬ್ರ್ಯಾಂಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminLoginDisclaimer => 'ಲಾಗಿನ್ ಹಕ್ಕು ನಿರಾಕರಣೆ';

  @override
  String get adminLoginDisclaimerHint =>
      'ಲಾಗಿನ್ ಫಾರ್ಮ್‌ನ ಕೆಳಗೆ HTML ಅನ್ನು ಪ್ರದರ್ಶಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminCustomCss => 'ಕಸ್ಟಮ್ CSS';

  @override
  String get adminCustomCssHint => 'ವೆಬ್ ಇಂಟರ್ಫೇಸ್‌ಗೆ ಕಸ್ಟಮ್ CSS ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String get adminEnableSplashScreen => 'ಸ್ಪ್ಲಾಶ್ ಪರದೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminStreamingSaved => 'ಸ್ಟ್ರೀಮಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminStreamingLoadFailed =>
      'ಸ್ಟ್ರೀಮಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminStreamingDescription =>
      'ರಿಮೋಟ್ ಸಂಪರ್ಕಗಳಿಗಾಗಿ ಜಾಗತಿಕ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್ ಮಿತಿಗಳನ್ನು ಹೊಂದಿಸಿ.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'ಅನಿಯಮಿತಕ್ಕೆ ಖಾಲಿ ಅಥವಾ 0 ಅನ್ನು ಬಿಡಿ';

  @override
  String get adminPlaybackSaved => 'ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminPlaybackLoadFailed =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminPlaybackTranscoding => 'ಪ್ಲೇಬ್ಯಾಕ್ / ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್';

  @override
  String get adminHardwareAcceleration => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminVaapiDevice => 'VA-API ಸಾಧನ';

  @override
  String get adminEnableHardwareEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableHardwareDecoding =>
      'ಇದಕ್ಕಾಗಿ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:';

  @override
  String get adminEncodingThreads => 'ಎನ್ಕೋಡಿಂಗ್ ಥ್ರೆಡ್ಗಳು';

  @override
  String get adminAutomatic => '0 = ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get adminTranscodingTempPath => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ತಾಪ ಮಾರ್ಗ';

  @override
  String get adminEnableFallbackFont => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminFallbackFontPath => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಮಾರ್ಗ';

  @override
  String get adminAllowSegmentDeletion => 'ವಿಭಾಗ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminSegmentKeepSeconds => 'ಸೆಗ್ಮೆಂಟ್ ಕೀಪ್ (ಸೆಕೆಂಡ್)';

  @override
  String get adminThrottleBuffering => 'ಥ್ರೊಟಲ್ ಬಫರಿಂಗ್';

  @override
  String get adminTrickplaySaved => 'ಟ್ರಿಕ್‌ಪ್ಲೇ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminTrickplayLoadFailed =>
      'ಟ್ರಿಕ್‌ಪ್ಲೇ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminEnableHardwareAcceleration =>
      'ಹಾರ್ಡ್‌ವೇರ್ ವೇಗವರ್ಧನೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableKeyFrameExtraction =>
      'ಕೀ ಫ್ರೇಮ್ ಮಾತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminKeyFrameSubtitle => 'ವೇಗವಾಗಿ ಆದರೆ ಕಡಿಮೆ ನಿಖರತೆ';

  @override
  String get adminScanBehavior => 'ನಡವಳಿಕೆಯನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminProcessPriority => 'ಪ್ರಕ್ರಿಯೆಯ ಆದ್ಯತೆ';

  @override
  String get adminImageSettings => 'ಚಿತ್ರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminIntervalMs => 'ಮಧ್ಯಂತರ (ಮಿಸೆ)';

  @override
  String get adminCaptureFrameSubtitle =>
      'ಚೌಕಟ್ಟುಗಳನ್ನು ಸೆರೆಹಿಡಿಯಲು ಎಷ್ಟು ಬಾರಿ';

  @override
  String get adminWidthResolutions => 'ಅಗಲ ನಿರ್ಣಯಗಳು';

  @override
  String get adminTileWidth => 'ಟೈಲ್ ಅಗಲ';

  @override
  String get adminTileHeight => 'ಟೈಲ್ ಎತ್ತರ';

  @override
  String get adminQualitySubtitle =>
      'ಕಡಿಮೆ ಮೌಲ್ಯಗಳು = ಉತ್ತಮ ಗುಣಮಟ್ಟ, ದೊಡ್ಡ ಫೈಲ್‌ಗಳು';

  @override
  String get adminProcessThreads => 'ಪ್ರಕ್ರಿಯೆ ಎಳೆಗಳು';

  @override
  String get adminResumeSaved => 'ರೆಸ್ಯೂಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminResumeLoadFailed =>
      'ರೆಸ್ಯೂಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminResumeDescription =>
      'ವಿಷಯವನ್ನು ಯಾವಾಗ ಭಾಗಶಃ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಅಥವಾ ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಬೇಕು ಎಂದು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get adminMinResumePercentage => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMinResumeSubtitle =>
      'ಪ್ರಗತಿಯನ್ನು ಉಳಿಸಲು ಈ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣವನ್ನು ಮೀರಿ ವಿಷಯವನ್ನು ಪ್ಲೇ ಮಾಡಬೇಕು';

  @override
  String get adminMaxResumePercentage => 'ಗರಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMaxResumeSubtitle =>
      'ಈ ಶೇಕಡಾವಾರು ನಂತರ ವಿಷಯವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminMinResumeDuration => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಅವಧಿ (ಸೆಕೆಂಡ್‌ಗಳು)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'ಇದಕ್ಕಿಂತ ಚಿಕ್ಕದಾದ ಐಟಂಗಳನ್ನು ಪುನರಾರಂಭಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get adminMinAudiobookResume => 'ಕನಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMaxAudiobookResume => 'ಗರಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminNetworkingSaved =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminNetworkingLoadFailed =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNetworkingWarning =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಬದಲಾವಣೆಗಳಿಗೆ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminEnableRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get ports => 'ಬಂದರುಗಳು';

  @override
  String get adminHttpPort => 'HTTP ಪೋರ್ಟ್';

  @override
  String get adminHttpsPort => 'HTTPS ಪೋರ್ಟ್';

  @override
  String get adminPublicHttpsPort => 'ಸಾರ್ವಜನಿಕ HTTPS ಪೋರ್ಟ್';

  @override
  String get adminBaseUrl => 'ಮೂಲ URL';

  @override
  String get adminBaseUrlHint => 'ಉದಾ. / ಜೆಲ್ಲಿಫಿನ್';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLocalNetwork => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್';

  @override
  String get adminLocalNetworkAddresses => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್ ವಿಳಾಸಗಳು';

  @override
  String get adminKnownProxies => 'ತಿಳಿದಿರುವ ಪ್ರಾಕ್ಸಿಗಳು';

  @override
  String get adminRemoteIpFilter => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminRemoteIpFilterEntries => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminCertificatePath => 'ಪ್ರಮಾಣಪತ್ರ ಮಾರ್ಗ';

  @override
  String get whitelist => 'ಶ್ವೇತಪಟ್ಟಿ';

  @override
  String get blacklist => 'ಕಪ್ಪುಪಟ್ಟಿ';

  @override
  String get notSet => 'ಹೊಂದಿಸಿಲ್ಲ';

  @override
  String get adminMetadataSaved => 'ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'ಮೆಟಾಡೇಟಾವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get recursive => 'ಪುನರಾವರ್ತಿತ';

  @override
  String get adminReplaceAllMetadata => 'ಎಲ್ಲಾ ಮೆಟಾಡೇಟಾವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get adminReplaceAllImages => 'ಎಲ್ಲಾ ಚಿತ್ರಗಳನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get adminMetadataRefreshRequested =>
      'ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್ ಮಾಡಲು ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ಯಾವುದೇ ರಿಮೋಟ್ ಹೊಂದಾಣಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminRemoteResults => 'ರಿಮೋಟ್ ಫಲಿತಾಂಶಗಳು';

  @override
  String get adminRemoteMetadataApplied => 'ರಿಮೋಟ್ ಮೆಟಾಡೇಟಾ ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get adminContentType => 'ವಿಷಯ ಪ್ರಕಾರ';

  @override
  String get adminContentTypeUpdated => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಕವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoPeopleEntries => 'ಯಾವುದೇ ಜನರ ನಮೂದುಗಳಿಲ್ಲ';

  @override
  String get adminNoExternalIds => 'ಯಾವುದೇ ಬಾಹ್ಯ ID ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ಬೆಂಬಲವಿಲ್ಲದ ಚಿತ್ರ ಸ್ವರೂಪ';

  @override
  String get adminImageReadFailed => 'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String get adminAllProviders => 'ಎಲ್ಲಾ ಪೂರೈಕೆದಾರರು';

  @override
  String get adminNoRemoteImages => 'ಯಾವುದೇ ದೂರಸ್ಥ ಚಿತ್ರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'ಟ್ಯೂನರ್ ಸೇರಿಸಿ';

  @override
  String get adminTunerType => 'ಟ್ಯೂನರ್ ಪ್ರಕಾರ';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, ಇತರೆ';

  @override
  String get adminUrlPath => 'URL / ಮಾರ್ಗ';

  @override
  String get adminNameOptional => 'ಹೆಸರು (ಐಚ್ಛಿಕ)';

  @override
  String get adminTunerAdded => 'ಟ್ಯೂನರ್ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'ಮಾರ್ಗದರ್ಶಿ ಪೂರೈಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminProviderType => 'ಪೂರೈಕೆದಾರರ ಪ್ರಕಾರ';

  @override
  String get adminProviderTypeHint => 'ವೇಳಾಪಟ್ಟಿಗಳು ಡೈರೆಕ್ಟ್ ಅಥವಾ XMLTV';

  @override
  String get adminUsernameOptional => 'ಬಳಕೆದಾರ ಹೆಸರು (ಐಚ್ಛಿಕ)';

  @override
  String get adminRefreshInterval => 'ರಿಫ್ರೆಶ್ ಮಧ್ಯಂತರ (ಗಂಟೆಗಳು)';

  @override
  String get adminProviderAdded => 'ಪೂರೈಕೆದಾರರನ್ನು ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'ಟ್ಯೂನರ್ ಮರುಹೊಂದಿಸಲು ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'ರೆಕಾರ್ಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminPrePadding => 'ಪೂರ್ವ-ಪ್ಯಾಡಿಂಗ್ (ನಿಮಿಷಗಳು)';

  @override
  String get adminPostPadding => 'ಪೋಸ್ಟ್-ಪ್ಯಾಡಿಂಗ್ (ನಿಮಿಷಗಳು)';

  @override
  String get adminRecordingPath => 'ರೆಕಾರ್ಡಿಂಗ್ ಮಾರ್ಗ';

  @override
  String get adminSeriesRecordingPath => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ಮಾರ್ಗ';

  @override
  String get adminMovieRecordingPath => 'Movie recording path';

  @override
  String get adminGuideDays => 'Guide data days';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days days';
  }

  @override
  String get adminRecordingPostProcessor => 'Post-processing application path';

  @override
  String get adminRecordingPostProcessorArgs => 'Post-processor arguments';

  @override
  String get adminSaveRecordingNfo => 'Save recording NFO metadata';

  @override
  String get adminSaveRecordingImages => 'Save recording images';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Recording paths';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'ರೆಕಾರ್ಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get adminMappingJson => 'JSON ಮ್ಯಾಪಿಂಗ್';

  @override
  String get adminMappingJsonHint => 'ಉದಾಹರಣೆ: ಮ್ಯಾಪಿಂಗ್‌ಗಳು JSON ಪೇಲೋಡ್';

  @override
  String get adminChannelMappingsUpdated =>
      'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'ಲೈವ್ ಟಿವಿ ಆಡಳಿತವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminTunerDevices => 'ಟ್ಯೂನರ್ ಸಾಧನಗಳು';

  @override
  String get adminNoTunerHosts =>
      'ಯಾವುದೇ ಟ್ಯೂನರ್ ಹೋಸ್ಟ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminGuideProviders => 'ಮಾರ್ಗದರ್ಶಿ ಪೂರೈಕೆದಾರರು';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'ಒದಗಿಸುವವರನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminNoListingProviders =>
      'ಯಾವುದೇ ಪಟ್ಟಿ ಒದಗಿಸುವವರನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Recording path: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Series path: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pre-padding: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'ಟ್ಯೂನರ್ ಡಿಸ್ಕವರಿ';

  @override
  String get adminChannelMappings => 'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳು';

  @override
  String get adminNoDiscoveredTuners => 'ಟ್ಯೂನರ್‌ಗಳು ಇನ್ನೂ ಪತ್ತೆಯಾಗಿಲ್ಲ';

  @override
  String get adminSettingsSaved => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminBackupsNotAvailable =>
      'ಈ ಸರ್ವರ್ ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಬ್ಯಾಕಪ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRestoreWarning1 =>
      'ಮರುಸ್ಥಾಪನೆಯು ಎಲ್ಲಾ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಡೇಟಾವನ್ನು ಬ್ಯಾಕಪ್ ಡೇಟಾದೊಂದಿಗೆ ಬದಲಾಯಿಸುತ್ತದೆ.';

  @override
  String get adminRestoreWarning2 =>
      'ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಬಳಕೆದಾರರು ಮತ್ತು ಲೈಬ್ರರಿ ಡೇಟಾವನ್ನು ತಿದ್ದಿ ಬರೆಯಲಾಗುತ್ತದೆ.';

  @override
  String get adminRestoreWarning3 =>
      'ಮರುಸ್ಥಾಪನೆಯ ನಂತರ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭಗೊಳ್ಳುತ್ತದೆ.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'ಮರುಸ್ಥಾಪಿಸಲು ವಿನಂತಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭವು ಈ ಸೆಶನ್ ಅನ್ನು ಸಂಪರ್ಕ ಕಡಿತಗೊಳಿಸಬಹುದು.';

  @override
  String get adminBackupsTitle => 'ಬ್ಯಾಕಪ್‌ಗಳು';

  @override
  String get adminUnknownDate => 'ಅಜ್ಞಾತ ದಿನಾಂಕ';

  @override
  String get adminUnnamedBackup => 'ಹೆಸರಿಸದ ಬ್ಯಾಕಪ್';

  @override
  String get adminLiveTvNotAvailable =>
      'ಈ ಸರ್ವರ್ ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಲೈವ್ ಟಿವಿ ಆಡಳಿತ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminLiveTvTitle => 'ಲೈವ್ ಟಿವಿ ಆಡಳಿತ';

  @override
  String get adminApply => 'ಅನ್ವಯಿಸು';

  @override
  String get adminNotSet => 'ಹೊಂದಿಸಿಲ್ಲ';

  @override
  String get adminReset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminLogsTitle => 'ಸರ್ವರ್ ಲಾಗ್‌ಗಳು';

  @override
  String get adminLogsNewestFirst => 'ಹೊಸದು ಮೊದಲನೆಯದು';

  @override
  String get adminLogsOldestFirst => 'ಅತ್ಯಂತ ಹಳೆಯ ಮೊದಲ';

  @override
  String get adminLogsJustNow => 'ಈಗಷ್ಟೇ';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matches';
  }

  @override
  String get adminLogViewerNoMatches => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String get adminMetadataEditorTitle => 'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಕ';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => 'ಟೈಪ್ ಮಾಡಿ';

  @override
  String get adminMetadataDetails => 'ವಿವರಗಳು';

  @override
  String get adminMetadataExternalIds => 'ಬಾಹ್ಯ ID ಗಳು';

  @override
  String get adminMetadataImages => 'ಚಿತ್ರಗಳು';

  @override
  String get adminMetadataFieldTitle => 'ಶೀರ್ಷಿಕೆ';

  @override
  String get adminMetadataFieldSortTitle => 'ಶೀರ್ಷಿಕೆಯನ್ನು ವಿಂಗಡಿಸಿ';

  @override
  String get adminMetadataFieldOriginalTitle => 'ಮೂಲ ಶೀರ್ಷಿಕೆ';

  @override
  String get adminMetadataFieldPremiereDate => 'ಪ್ರೀಮಿಯರ್ ದಿನಾಂಕ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'ಅಂತಿಮ ದಿನಾಂಕ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ಉತ್ಪಾದನಾ ವರ್ಷ';

  @override
  String get adminMetadataFieldOfficialRating => 'ಅಧಿಕೃತ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldCommunityRating => 'ಸಮುದಾಯ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldCriticRating => 'ವಿಮರ್ಶಕ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldTagline => 'ಅಡಿಬರಹ';

  @override
  String get adminMetadataFieldOverview => 'ಅವಲೋಕನ';

  @override
  String get adminMetadataGenres => 'ಪ್ರಕಾರಗಳು';

  @override
  String get adminMetadataTags => 'ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminMetadataStudios => 'ಸ್ಟುಡಿಯೋಗಳು';

  @override
  String get adminMetadataPeople => 'ಜನರು';

  @override
  String get adminMetadataAddGenre => 'ಪ್ರಕಾರವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddTag => 'ಟ್ಯಾಗ್ ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddStudio => 'ಸ್ಟುಡಿಯೋ ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddPerson => 'ವ್ಯಕ್ತಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminMetadataEditPerson => 'ವ್ಯಕ್ತಿಯನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminMetadataRole => 'ಪಾತ್ರ';

  @override
  String get adminMetadataImagePrimary => 'ಪ್ರಾಥಮಿಕ';

  @override
  String get adminMetadataImageBackdrop => 'ಹಿನ್ನೆಲೆ';

  @override
  String get adminMetadataImageLogo => 'ಲೋಗೋ';

  @override
  String get adminMetadataImageBanner => 'ಬ್ಯಾನರ್';

  @override
  String get adminMetadataImageThumb => 'ಹೆಬ್ಬೆರಳು';

  @override
  String get adminMetadataRecursive => 'ಪುನರಾವರ್ತಿತ';

  @override
  String get adminMetadataProvider => 'ಒದಗಿಸುವವರು';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ಇದು ಐಟಂನಿಂದ ಪ್ರಸ್ತುತ ಚಿತ್ರವನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'ಅಪ್ಲೋಡ್ ಮಾಡಿ';

  @override
  String get adminMetadataUpdate => 'ನವೀಕರಿಸಿ';

  @override
  String get adminMetadataRemoteImage => 'ದೂರಸ್ಥ ಚಿತ್ರ';

  @override
  String get adminPluginsInstalled => 'ಸ್ಥಾಪಿಸಲಾಗಿದೆ';

  @override
  String get adminPluginsCatalog => 'ಕ್ಯಾಟಲಾಗ್';

  @override
  String get adminPluginsActive => 'ಸಕ್ರಿಯ';

  @override
  String get adminPluginsRestart => 'ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get adminPluginsNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsNoneInstalled =>
      'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ';

  @override
  String get adminPluginsPendingRemoval =>
      'ಮರುಪ್ರಾರಂಭಿಸಿದ ನಂತರ ತೆಗೆಯುವಿಕೆ ಬಾಕಿಯಿದೆ';

  @override
  String get adminPluginsChangesPending => 'ಬಾಕಿ ಉಳಿದಿರುವ ಬದಲಾವಣೆಗಳು ಪುನರಾರಂಭ';

  @override
  String get adminPluginsEnable => 'ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginsDisable => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginsInstallUpdate => 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsCatalogEmpty => 'ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'ಪ್ರಾಯೋಗಿಕ ಏಕೀಕರಣ';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಏಕೀಕರಣವು ಇನ್ನೂ ಪ್ರಾಯೋಗಿಕವಾಗಿದೆ. ಕೆಲವು ಕ್ಷೇತ್ರಗಳು ಅಥವಾ ಲೇಔಟ್‌ಗಳು ಇನ್ನೂ ಸರಿಯಾಗಿ ರೆಂಡರ್ ಆಗದೇ ಇರಬಹುದು.';

  @override
  String get adminPluginDetailToggle404 =>
      'ಪ್ಲಗಿನ್ ಅನ್ನು ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ. ಸರ್ವರ್‌ಗೆ ಈ ಪ್ಲಗಿನ್ ಆವೃತ್ತಿಯನ್ನು ಹುಡುಕಲಾಗಲಿಲ್ಲ. ಪ್ಲಗಿನ್‌ಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿ, ನಂತರ ಮರುಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get adminPluginDetailToggleDioError =>
      'ಪ್ಲಗಿನ್ ಅನ್ನು ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ. ವಿವರಗಳಿಗಾಗಿ ದಯವಿಟ್ಟು ಸರ್ವರ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'ವಿವರಗಳು';

  @override
  String get adminPluginDetailDeveloper => 'ಡೆವಲಪರ್';

  @override
  String get adminPluginDetailRepository => 'ಭಂಡಾರ';

  @override
  String get adminPluginDetailBundled => 'ಬಂಡಲ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get adminPluginDetailEnablePlugin => 'ಪ್ಲಗಿನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginDetailRestartRequired =>
      'ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿದೆ.';

  @override
  String get adminPluginDetailRemovalPending =>
      'ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭಿಸಿದ ನಂತರ ಈ ಪ್ಲಗಿನ್ ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ಈ ಪ್ಲಗಿನ್ ಅಸಮರ್ಪಕವಾಗಿದೆ ಮತ್ತು ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸದೇ ಇರಬಹುದು.';

  @override
  String get adminPluginDetailNotSupported =>
      'ಈ ಪ್ಲಗಿನ್ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಆವೃತ್ತಿಯಿಂದ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get adminPluginDetailSuperseded =>
      'ಈ ಪ್ಲಗಿನ್ ಅನ್ನು ಹೊಸ ಆವೃತ್ತಿಯಿಂದ ಬದಲಾಯಿಸಲಾಗಿದೆ.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'ಯಾವುದೇ ರೆಪೊಸಿಟರಿಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminReposEmptySubtitle =>
      'ಲಭ್ಯವಿರುವ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಲು ರೆಪೊಸಿಟರಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminReposUnnamed => '(ಹೆಸರಿಲ್ಲದ)';

  @override
  String get adminReposEditTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminReposAddTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminReposUrl => 'ರೆಪೊಸಿಟರಿ URL';

  @override
  String get adminReposNameHint => 'ಉದಾ. Jellyfin ಸ್ಥಿರ';

  @override
  String get adminPluginSettingsInvalidUrl => 'ಅಮಾನ್ಯ URL';

  @override
  String get adminGeneralSettingsTitle => 'ಸಾಮಾನ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get adminGeneralMetadataLanguage => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminGeneralMetadataLanguageHint => 'ಉದಾ. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ದೇಶ';

  @override
  String get adminGeneralMetadataCountryHint => 'ಉದಾ. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಏಕಕಾಲಿಕತೆ';

  @override
  String get adminGeneralImageEncodingLimit => 'ಸಮಾನಾಂತರ ಚಿತ್ರ ಎನ್ಕೋಡಿಂಗ್ ಮಿತಿ';

  @override
  String get adminUnknownError => 'ಅಜ್ಞಾತ ದೋಷ';

  @override
  String get adminBrowse => 'ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get adminCloseBrowser => 'ಬ್ರೌಸರ್ ಅನ್ನು ಮುಚ್ಚಿ';

  @override
  String get adminNetworkingTitle => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get adminNetworkingRestartWarning =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಬದಲಾವಣೆಗಳಿಗೆ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminNetworkingRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingPorts => 'ಬಂದರುಗಳು';

  @override
  String get adminNetworkingHttpPort => 'HTTP ಪೋರ್ಟ್';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS ಪೋರ್ಟ್';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingLocalNetwork => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್';

  @override
  String get adminNetworkingLocalAddresses => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್ ವಿಳಾಸಗಳು';

  @override
  String get adminNetworkingAddressHint => 'ಉದಾ. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'ತಿಳಿದಿರುವ ಪ್ರಾಕ್ಸಿಗಳು';

  @override
  String get adminNetworkingProxyHint => 'ಉದಾ. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ಶ್ವೇತಪಟ್ಟಿ';

  @override
  String get adminNetworkingBlacklist => 'ಕಪ್ಪುಪಟ್ಟಿ';

  @override
  String get adminNetworkingAddEntry => 'ನಮೂದನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminBrandingTitle => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminBrandingLoginDisclaimer => 'ಲಾಗಿನ್ ಹಕ್ಕು ನಿರಾಕರಣೆ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ಲಾಗಿನ್ ಫಾರ್ಮ್‌ನ ಕೆಳಗೆ HTML ಅನ್ನು ಪ್ರದರ್ಶಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminBrandingCustomCss => 'ಕಸ್ಟಮ್ CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ವೆಬ್ ಇಂಟರ್ಫೇಸ್‌ಗೆ ಕಸ್ಟಮ್ CSS ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingEnableSplash => 'ಸ್ಪ್ಲಾಶ್ ಪರದೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminBrandingSplashUpload => 'Upload image';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen updated';

  @override
  String get adminBrandingSplashUploadFailed => 'Failed to upload splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen removed';

  @override
  String get adminBrandingNoSplash => 'No custom splashscreen';

  @override
  String get adminPlaybackHwAccel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackHwAccelLabel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'ಇದಕ್ಕಾಗಿ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec => 'Enable enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prefer system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Hardware decoding color depth';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC decoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 decoding';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit decoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit decoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware encoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Allow HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Allow AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Enable Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Enable Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Enable tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Enable VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Enable VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping algorithm';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping mode';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping range';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping desaturation';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping peak';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping parameter';

  @override
  String get adminPlaybackPresetsQuality => 'Presets & Quality';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace method';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Enable audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max muxing queue size';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'ಎನ್ಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackEncodingThreads => 'ಎನ್ಕೋಡಿಂಗ್ ಥ್ರೆಡ್ಗಳು';

  @override
  String get adminPlaybackFallbackFont => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackFallbackFontPath => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಮಾರ್ಗ';

  @override
  String get adminPlaybackStreaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get adminResumeVideo => 'ವೀಡಿಯೊ';

  @override
  String get adminResumeAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get adminResumeMinAudiobookPct =>
      'ಕನಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMaxAudiobookPct =>
      'ಗರಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminStreamingBitrateLimit =>
      'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'ಅನಿಯಮಿತಕ್ಕೆ ಖಾಲಿ ಅಥವಾ 0 ಅನ್ನು ಬಿಡಿ';

  @override
  String get adminTrickplayHwAccel => 'ಹಾರ್ಡ್‌ವೇರ್ ವೇಗವರ್ಧನೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayHwEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'ಕೀ ಫ್ರೇಮ್ ಮಾತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'ವೇಗವಾಗಿ ಆದರೆ ಕಡಿಮೆ ನಿಖರತೆ';

  @override
  String get adminTrickplayNonBlocking => 'ನಾನ್-ಬ್ಲಾಕಿಂಗ್';

  @override
  String get adminTrickplayBlocking => 'ತಡೆಯುವುದು';

  @override
  String get adminTrickplayPriorityHigh => 'ಹೆಚ್ಚು';

  @override
  String get adminTrickplayPriorityAboveNormal => 'ಸಾಮಾನ್ಯಕ್ಕಿಂತ ಹೆಚ್ಚು';

  @override
  String get adminTrickplayPriorityNormal => 'ಸಾಮಾನ್ಯ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'ಸಾಮಾನ್ಯಕ್ಕಿಂತ ಕೆಳಗೆ';

  @override
  String get adminTrickplayPriorityIdle => 'ಐಡಲ್';

  @override
  String get adminTrickplayImageSettings => 'ಚಿತ್ರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminTrickplayInterval => 'ಮಧ್ಯಂತರ (ಮಿಸೆ)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'ಚೌಕಟ್ಟುಗಳನ್ನು ಸೆರೆಹಿಡಿಯಲು ಎಷ್ಟು ಬಾರಿ';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'ಅಲ್ಪವಿರಾಮದಿಂದ ಬೇರ್ಪಡಿಸಿದ ಪಿಕ್ಸೆಲ್ ಅಗಲಗಳು (ಉದಾ. 320)';

  @override
  String get adminTrickplayQuality => 'ಗುಣಮಟ್ಟ';

  @override
  String get adminTrickplayQScale => 'ಗುಣಮಟ್ಟದ ಪ್ರಮಾಣ';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'ಕಡಿಮೆ ಮೌಲ್ಯಗಳು = ಉತ್ತಮ ಗುಣಮಟ್ಟ, ದೊಡ್ಡ ಫೈಲ್‌ಗಳು';

  @override
  String get adminTrickplayJpegQuality => 'JPEG ಗುಣಮಟ್ಟ';

  @override
  String get adminTrickplayProcessing => 'ಸಂಸ್ಕರಣೆ';

  @override
  String get adminTasksEmpty => 'ಯಾವುದೇ ನಿಗದಿತ ಕಾರ್ಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminTasksNoFilterMatch =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗೆ ಯಾವುದೇ ಕಾರ್ಯಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminTaskCancelling => 'ರದ್ದುಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get adminTaskRunning => 'ಚಾಲನೆಯಲ್ಲಿದೆ...';

  @override
  String get adminTaskNeverRun => 'ಎಂದಿಗೂ ಓಡುವುದಿಲ್ಲ';

  @override
  String get adminTaskStop => 'ನಿಲ್ಲಿಸು';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => 'ಓಡು';

  @override
  String get adminTaskDetailLastExecution => 'ಕೊನೆಯ ಮರಣದಂಡನೆ';

  @override
  String get adminTaskDetailStarted => 'ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String get adminTaskDetailEnded => 'ಕೊನೆಗೊಂಡಿದೆ';

  @override
  String get adminTaskDetailDuration => 'ಅವಧಿ';

  @override
  String get adminTaskDetailErrorLabel => 'ದೋಷ:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Daily at $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Every $day at $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Every $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾರಂಭದಲ್ಲಿ';

  @override
  String get adminTaskTriggerTypeDaily => 'ಪ್ರತಿದಿನ';

  @override
  String get adminTaskTriggerTypeWeekly => 'ಸಾಪ್ತಾಹಿಕ';

  @override
  String get adminTaskTriggerTypeInterval => 'ಮಧ್ಯಂತರದಲ್ಲಿ';

  @override
  String get adminTaskTriggerIntervalLabel => 'ಮಧ್ಯಂತರ';

  @override
  String get adminTaskTriggerEveryHour => 'ಪ್ರತಿ ಗಂಟೆಗೆ';

  @override
  String get adminTaskTriggerEvery6Hours => 'ಪ್ರತಿ 6 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery12Hours => 'ಪ್ರತಿ 12 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery24Hours => 'ಪ್ರತಿ 24 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery2Days => 'ಪ್ರತಿ 2 ದಿನಗಳು';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'ಸಮಯ';

  @override
  String get adminTaskTriggerNoLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String get adminActivityJustNow => 'ಈಗಷ್ಟೇ';

  @override
  String get adminActivityLastHour => 'ಕೊನೆಯ ಗಂಟೆ';

  @override
  String get adminActivityToday => 'ಇಂದು';

  @override
  String get adminActivityYesterday => 'ನಿನ್ನೆ';

  @override
  String get adminActivityOlder => 'ಹಳೆಯದು';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String get adminActivityNow => 'ಈಗ';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '${minutes}m';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '${hours}h';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '${days}d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'ಸೀಕ್ ಪ್ರಿವ್ಯೂ ಥಂಬ್‌ನೇಲ್‌ಗಳಿಗಾಗಿ ಟ್ರಿಕ್‌ಪ್ಲೇ ಇಮೇಜ್ ಜನರೇಷನ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get adminNetworkingPublicHttpsPort => 'ಸಾರ್ವಜನಿಕ HTTPS ಪೋರ್ಟ್';

  @override
  String get adminNetworkingBaseUrl => 'ಮೂಲ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ಉದಾ. / ಜೆಲ್ಲಿಫಿನ್';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Require HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirect all remote requests to HTTPS. Has no effect if the server has no valid certificate.';

  @override
  String get adminNetworkingCertPassword => 'Certificate password';

  @override
  String get adminNetworkingIpSettings => 'IP Settings';

  @override
  String get adminNetworkingEnableIpv4 => 'Enable IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Enable IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Enable automatic port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'LAN networks';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Comma or line separated list of IP addresses or CIDR subnets treated as being on the local network.';

  @override
  String get adminNetworkingPublishedUris => 'Published server URIs';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Map a subnet or address to a published URL, e.g. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'ಪ್ರಮಾಣಪತ್ರ ಮಾರ್ಗ';

  @override
  String get adminNetworkingRemoteIpFilter => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ಸಾಧನ';

  @override
  String get adminPlaybackAutomatic => '0 = ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get adminPlaybackTranscodeTempPath => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ತಾಪ ಮಾರ್ಗ';

  @override
  String get adminPlaybackSegmentDeletion => 'ವಿಭಾಗ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackSegmentKeep => 'ಸೆಗ್ಮೆಂಟ್ ಕೀಪ್ (ಸೆಕೆಂಡ್)';

  @override
  String get adminPlaybackThrottleBuffering => 'ಥ್ರೊಟಲ್ ಬಫರಿಂಗ್';

  @override
  String get adminResumeMinPct => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMinPctSubtitle =>
      'ಪ್ರಗತಿಯನ್ನು ಉಳಿಸಲು ಈ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣವನ್ನು ಮೀರಿ ವಿಷಯವನ್ನು ಪ್ಲೇ ಮಾಡಬೇಕು';

  @override
  String get adminResumeMaxPct => 'ಗರಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMaxPctSubtitle =>
      'ಈ ಶೇಕಡಾವಾರು ನಂತರ ವಿಷಯವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminResumeMinDuration => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಅವಧಿ (ಸೆಕೆಂಡ್‌ಗಳು)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'ಇದಕ್ಕಿಂತ ಚಿಕ್ಕದಾದ ಐಟಂಗಳನ್ನು ಪುನರಾರಂಭಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get adminTrickplayScanBehavior => 'ನಡವಳಿಕೆಯನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminTrickplayProcessPriority => 'ಪ್ರಕ್ರಿಯೆಯ ಆದ್ಯತೆ';

  @override
  String get adminTrickplayTileWidth => 'ಟೈಲ್ ಅಗಲ';

  @override
  String get adminTrickplayTileHeight => 'ಟೈಲ್ ಎತ್ತರ';

  @override
  String get adminTrickplayProcessThreads => 'ಪ್ರಕ್ರಿಯೆ ಎಳೆಗಳು';

  @override
  String get adminTrickplayWidthResolutions => 'ಅಗಲ ನಿರ್ಣಯಗಳು';

  @override
  String get adminMetadataDefault => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get adminMetadataContentTypeUpdated =>
      'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಮಿತಿ (ಮಿಸೆ)';

  @override
  String get adminGeneralEnableSlowResponse => 'Enable slow response warnings';

  @override
  String get adminGeneralQuickConnect => 'Enable Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Paths';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => 'ಸಂಗ್ರಹ ಮಾರ್ಗ';

  @override
  String get adminGeneralMetadataPath => 'ಮೆಟಾಡೇಟಾ ಮಾರ್ಗ';

  @override
  String get adminGeneralServerName => 'ಸರ್ವರ್ ಹೆಸರು';

  @override
  String get adminSettingsLoadFailed =>
      'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminDiscover => 'ಅನ್ವೇಷಿಸಿ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'ಫೋಲ್ಡರ್‌ಗಳು';

  @override
  String get libraries => 'ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayDisabledMessage =>
      'ಸಿಂಕ್ರೊನೈಸ್ ಮಾಡಿದ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಬಳಸಲು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ SyncPlay ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get syncPlayServerUnsupportedTitle => 'ಸರ್ವರ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ಗೆ Jellyfin ಸರ್ವರ್ ಅಗತ್ಯವಿದೆ. ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಇದನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay ಗುಂಪು';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay ಗುಂಪು';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# participants',
      one: '# participant',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'ಕಾಯುವುದನ್ನು ನಿರ್ಲಕ್ಷಿಸಿ';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'ಈ ಸಾಧನವು ಬಫರ್ ಆಗಿರುವಾಗ ಗುಂಪನ್ನು ಹಿಡಿದಿಟ್ಟುಕೊಳ್ಳಬೇಡಿ';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ನಿಧಾನಗತಿಯ ಸದಸ್ಯರಿಗೆ ಕಾಯದೆ ಸ್ಥಳೀಯವಾಗಿ ಮುಂದುವರಿಯಿರಿ';

  @override
  String get syncPlayRepeat => 'ಪುನರಾವರ್ತಿಸಿ';

  @override
  String get syncPlayRepeatOne => 'ಒಂದು';

  @override
  String get syncPlayShuffleModeShuffled => 'ಷಫಲ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get syncPlayShuffleModeSorted => 'ವಿಂಗಡಿಸಲಾಗಿದೆ';

  @override
  String get syncPlaySyncCurrentQueue =>
      'ಪ್ರಸ್ತುತ ಪ್ಲೇಬ್ಯಾಕ್ ಕ್ಯೂ ಅನ್ನು ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'ಗುಂಪಿನ ಸರದಿಯನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪ್ಲೇ ಮಾಡುವುದರೊಂದಿಗೆ ಬದಲಾಯಿಸಿ';

  @override
  String get syncPlayLeaveGroup => 'ಗುಂಪನ್ನು ತೊರೆಯಿರಿ';

  @override
  String get syncPlayGroupQueue => 'ಗುಂಪು ಸರದಿ';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'ಈಗ ಆಟವಾಡಿ';

  @override
  String get syncPlayCreateNewGroup => 'ಹೊಸ ಗುಂಪನ್ನು ರಚಿಸಿ';

  @override
  String get syncPlayGroupName => 'ಗುಂಪಿನ ಹೆಸರು';

  @override
  String get syncPlayDefaultGroupName => 'ನನ್ನ SyncPlay ಗುಂಪು';

  @override
  String get syncPlayCreateGroup => 'ಗುಂಪನ್ನು ರಚಿಸಿ';

  @override
  String get syncPlayAvailableGroups => 'ಲಭ್ಯವಿರುವ ಗುಂಪುಗಳು';

  @override
  String get syncPlayNoGroupsAvailable => 'ಯಾವುದೇ ಗುಂಪುಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay ಗುಂಪಿಗೆ ಸೇರುವುದೇ?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay ಗುಂಪಿಗೆ ಸೇರುವುದರಿಂದ ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಪ್ಲೇಬ್ಯಾಕ್ ಸರದಿಯನ್ನು ಬದಲಾಯಿಸಬಹುದು. ಮುಂದುವರಿಸುವುದೇ?';

  @override
  String get syncPlayJoin => 'ಸೇರಿಕೊಳ್ಳಿ';

  @override
  String get syncPlayStateIdle => 'ಐಡಲ್';

  @override
  String get syncPlayStateWaiting => 'ಕಾಯುತ್ತಿದೆ';

  @override
  String get syncPlayStatePaused => 'ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayStatePlaying => 'ನುಡಿಸುತ್ತಿದೆ';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ಈ SyncPlay ಗುಂಪಿನಲ್ಲಿ ನೀವು ಒಂದು ಅಥವಾ ಹೆಚ್ಚಿನ ಐಟಂಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿಲ್ಲ. ಲೈಬ್ರರಿ ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಲು ಅಥವಾ ಬೇರೆ ಸರತಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಗುಂಪಿನ ಮಾಲೀಕರನ್ನು ಕೇಳಿ.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'ಧ್ವನಿ ಹುಡುಕಾಟ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ವಿಫಲವಾಗಿದೆ';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ಈ Dolby Vision ಸ್ಟ್ರೀಮ್‌ಗಾಗಿ ನೇರವಾದ ಪ್ಲೇ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ. ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಬಳಸಿ ಮರುಪ್ರಯತ್ನಿಸುವುದೇ?';

  @override
  String get retryWithTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ನೊಂದಿಗೆ ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ಬೆಂಬಲಿತವಾಗಿಲ್ಲ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'ಈ ಸಾಧನವು ನೇರವಾಗಿ Dolby Vision ವಿಷಯವನ್ನು ಡಿಕೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ. HDR10 ಫಾಲ್‌ಬ್ಯಾಕ್ ಬಳಸಿ ಅಥವಾ ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ವಿನಂತಿಸಿ.';

  @override
  String get rememberMyChoice => 'ನನ್ನ ಆಯ್ಕೆಯನ್ನು ನೆನಪಿಡಿ';

  @override
  String get playHdr10Fallback => 'HDR10 ಫಾಲ್ಬ್ಯಾಕ್ ಅನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get requestTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಅನ್ನು ವಿನಂತಿಸಿ';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rows discovered',
      one: '# row discovered',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'ಎಲ್ಲವನ್ನೂ ನೋಡಿ';

  @override
  String get noItems => 'ಯಾವುದೇ ಐಟಂಗಳಿಲ್ಲ';

  @override
  String get switchUser => 'ಬಳಕೆದಾರರನ್ನು ಬದಲಿಸಿ';

  @override
  String get remoteControl => 'ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್';

  @override
  String get mediaBarLoading => 'ಮೀಡಿಯಾ ಬಾರ್ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get mediaBarError => 'ಮೀಡಿಯಾ ಬಾರ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get offlineServerUnavailable =>
      'ಇಂಟರ್ನೆಟ್‌ಗೆ ಸಂಪರ್ಕಗೊಂಡಿದೆ, ಆದರೆ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get offlineNoInternet =>
      'ನೀವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿರುವಿರಿ. ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ವಿಷಯ ಮಾತ್ರ ಲಭ್ಯವಿದೆ.';

  @override
  String get offlineFileNotAvailable => 'ಫೈಲ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get offlineSwitchServer => 'ಸರ್ವರ್ ಬದಲಿಸಿ';

  @override
  String get offlineSavedMedia => 'ಉಳಿಸಿದ ಮಾಧ್ಯಮ';

  @override
  String get offlineBannerTitle => 'You\'re offline';

  @override
  String get offlineBannerSubtitle => 'Showing your downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle => 'Can\'t reach your server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Playing from downloads until it\'s back';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'ಸಾಧನದ ಪರಿಮಾಣ';

  @override
  String get castVolumeUnavailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'ಆಡಿಯೋ';

  @override
  String get subtitlesLabel => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get pinConfirmTitle => 'ಪಿನ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get pinSetTitle => 'ಪಿನ್ ಹೊಂದಿಸಿ';

  @override
  String get pinEnterTitle => 'ಪಿನ್ ನಮೂದಿಸಿ';

  @override
  String get pinReenterToConfirm => 'ಖಚಿತಪಡಿಸಲು ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ಮರು-ನಮೂದಿಸಿ';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'ತಪ್ಪಾದ ಪಿನ್';

  @override
  String get pinMismatch => 'ಪಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String get pinForgot => 'ಪಿನ್ ಮರೆತಿರುವಿರಾ?';

  @override
  String get pinClear => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String get pinBackspace => 'ಬ್ಯಾಕ್‌ಸ್ಪೇಸ್';

  @override
  String get quickConnectAuthorized =>
      'ತ್ವರಿತ ಸಂಪರ್ಕ ವಿನಂತಿಯನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get quickConnectInvalidOrExpired =>
      'ತ್ವರಿತ ಸಂಪರ್ಕ ಕೋಡ್ ಅಮಾನ್ಯವಾಗಿದೆ ಅಥವಾ ಅವಧಿ ಮೀರಿದೆ.';

  @override
  String get quickConnectNotSupported =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ತ್ವರಿತ ಸಂಪರ್ಕವು ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get quickConnectAuthorizeFailed =>
      'ತ್ವರಿತ ಸಂಪರ್ಕ ಕೋಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get quickConnectDisabled =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ತ್ವರಿತ ಸಂಪರ್ಕವನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get quickConnectForbidden =>
      'ನಿಮ್ಮ ಖಾತೆಯು ಈ ತ್ವರಿತ ಸಂಪರ್ಕ ವಿನಂತಿಯನ್ನು ದೃಢೀಕರಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get quickConnectNotFound =>
      'ತ್ವರಿತ ಸಂಪರ್ಕ ಕೋಡ್ ಕಂಡುಬಂದಿಲ್ಲ. ಹೊಸ ಕೋಡ್ ಅನ್ನು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get quickConnectAuthorize => 'ಅಧಿಕಾರ ನೀಡಿ';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್';

  @override
  String get remoteFailedToLoadSessions => 'ಸೆಶನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get remoteNoSessions => 'ನಿಯಂತ್ರಿಸಬಹುದಾದ ಸೆಷನ್‌ಗಳಿಲ್ಲ';

  @override
  String get remoteStartPlayback => 'ಮತ್ತೊಂದು ಸಾಧನದಲ್ಲಿ ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get unknownUser => 'ಅಜ್ಞಾತ';

  @override
  String get unknownItem => 'ಅಜ್ಞಾತ';

  @override
  String get remoteNothingPlaying => 'ಈ ಅಧಿವೇಶನದಲ್ಲಿ ಏನೂ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ';

  @override
  String get castingStarted =>
      'ಆಯ್ಕೆಮಾಡಿದ ಸಾಧನದಲ್ಲಿ ಬಿತ್ತರಿಸುವಿಕೆ ಪ್ರಾರಂಭವಾಗಿದೆ';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noRemoteDevicesIos =>
      'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.\n\niOS ನಲ್ಲಿ, AirPlay ಗುರಿಗಳು ಸಿಮ್ಯುಲೇಟರ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲದಿರಬಹುದು.';

  @override
  String get trackActionPlayNext => 'ಮುಂದೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get trackActionAddToQueue => 'ಕ್ಯೂಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionAddToPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionCancelDownload => 'ಡೌನ್‌ಲೋಡ್ ರದ್ದುಮಾಡಿ';

  @override
  String get trackActionDeleteFromPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯಿಂದ ಅಳಿಸಿ';

  @override
  String get trackActionMoveUp => 'ಮೇಲಕ್ಕೆ ಸರಿಸಿ';

  @override
  String get trackActionMoveDown => 'ಕೆಳಗೆ ಸರಿಸಿ';

  @override
  String get trackActionRemoveFromFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get trackActionAddToFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionGoToAlbum => 'ಆಲ್ಬಮ್‌ಗೆ ಹೋಗಿ';

  @override
  String get trackActionGoToArtist => 'ಕಲಾವಿದರ ಬಳಿಗೆ ಹೋಗಿ';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get trackActionDeleteFileFailed =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get shuffleBy => 'ಷಫಲ್ ಮೂಲಕ';

  @override
  String get shuffleSelectLibrary => 'ಲೈಬ್ರರಿ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get shuffleSelectGenre => 'ಪ್ರಕಾರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get shuffleLibrary => 'ಗ್ರಂಥಾಲಯ';

  @override
  String get shuffleGenre => 'ಪ್ರಕಾರ';

  @override
  String get shuffleNoLibraries => 'ಯಾವುದೇ ಹೊಂದಾಣಿಕೆಯ ಗ್ರಂಥಾಲಯಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get shuffleNoGenres => 'ಈ ಷಫಲ್ ಮೋಡ್‌ಗೆ ಯಾವುದೇ ಪ್ರಕಾರಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get posterDisplayTitle => 'ಪ್ರದರ್ಶನ';

  @override
  String get posterImageType => 'ಚಿತ್ರದ ಪ್ರಕಾರ';

  @override
  String get imageTypePoster => 'ಪೋಸ್ಟರ್';

  @override
  String get imageTypeThumbnail => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get imageTypeBanner => 'ಬ್ಯಾನರ್';

  @override
  String get playlistAddFailed => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get playlistCreateFailed => 'ಪ್ಲೇಪಟ್ಟಿ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get playlistNew => 'ಹೊಸ ಪ್ಲೇಪಟ್ಟಿ';

  @override
  String get playlistCreate => 'ರಚಿಸಿ';

  @override
  String get playlistCreateNew => 'ಹೊಸ ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ರಚಿಸಿ';

  @override
  String get playlistNoneFound => 'ಯಾವುದೇ ಪ್ಲೇಪಟ್ಟಿಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get addToPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಿ';

  @override
  String get lyricsNotAvailable => 'ಯಾವುದೇ ಸಾಹಿತ್ಯ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get upNext => 'ಮುಂದೆ';

  @override
  String get playNext => 'ಮುಂದೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get stillWatchingContent =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ. ನೀವು ಇನ್ನೂ ನೋಡುತ್ತಿದ್ದೀರಾ?';

  @override
  String get stillWatchingStop => 'ನಿಲ್ಲಿಸು';

  @override
  String get stillWatchingContinue => 'ಮುಂದುವರಿಸಿ';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get continueWatchingAndNextUp =>
      'ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'ಮುಂದಿನ ಸಂಚಿಕೆ';

  @override
  String get moreFromThisSeason => 'ಈ ಸೀಸನ್‌ನಿಂದ ಇನ್ನಷ್ಟು';

  @override
  String get playerTooltipPlaybackSpeed => 'ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ';

  @override
  String get playerTooltipCastControls => 'ಎರಕಹೊಯ್ದ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get playerTooltipPlaybackQuality => 'ಬಿಟ್ರೇಟ್';

  @override
  String get playerTooltipEnterFullscreen => 'ಪೂರ್ಣಪರದೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get playerTooltipExitFullscreen => 'ಪೂರ್ಣಪರದೆಯಿಂದ ನಿರ್ಗಮಿಸಿ';

  @override
  String get playerTooltipFloatOnTop => 'ಮೇಲೆ ತೇಲುತ್ತದೆ';

  @override
  String get playerTooltipExitFloatOnTop =>
      'ಮೇಲ್ಭಾಗದಲ್ಲಿ ಫ್ಲೋಟ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get playerTooltipLockLandscape => 'ಭೂದೃಶ್ಯವನ್ನು ಲಾಕ್ ಮಾಡಿ';

  @override
  String get playerTooltipUnlockOrientation => 'ತಿರುಗುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get playerTooltipPrevious => 'ಹಿಂದಿನ';

  @override
  String get playerTooltipSeekBack => 'ಹಿಂತಿರುಗಿ ನೋಡಿ';

  @override
  String get playerTooltipSeekForward => 'ಮುಂದೆ ಹುಡುಕು';

  @override
  String get contextMenuMarkWatched => 'ವೀಕ್ಷಿಸಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get contextMenuMarkUnwatched => 'ವೀಕ್ಷಿಸಲಾಗಿಲ್ಲ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get contextMenuAddToFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಗೆ ಸೇರಿಸಿ';

  @override
  String get contextMenuRemoveFromFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get contextMenuGoToSeries => 'ಸರಣಿಗೆ ಹೋಗಿ';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'ಸರ್ವರ್ ಆಡಳಿತ ಫಲಕವನ್ನು ಪ್ರವೇಶಿಸಿ';

  @override
  String get settingsAccountSecurity => 'ಖಾತೆ ಮತ್ತು ಭದ್ರತೆ';

  @override
  String get settingsAccountSecuritySubtitle =>
      'ದೃಢೀಕರಣ, ಪಿನ್ ಕೋಡ್ ಮತ್ತು ಪೋಷಕರ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get settingsPersonalization => 'ವೈಯಕ್ತೀಕರಣ';

  @override
  String get settingsPersonalizationSubtitle =>
      'ಥೀಮ್, ನ್ಯಾವಿಗೇಷನ್, ಹೋಮ್ ಸಾಲುಗಳು ಮತ್ತು ಲೈಬ್ರರಿ ಗೋಚರತೆ';

  @override
  String get settingsDynamicContent => 'ಡೈನಾಮಿಕ್ ವಿಷಯ';

  @override
  String get settingsDynamicContentSubtitle =>
      'ಮೀಡಿಯಾ ಬಾರ್ ಮತ್ತು ದೃಶ್ಯ ಮೇಲ್ಪದರಗಳು';

  @override
  String get settingsPlaybackSyncplay => 'ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ಆಡಿಯೋ/ವೀಡಿಯೋ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಉಪಶೀರ್ಷಿಕೆಗಳು, ಡೌನ್‌ಲೋಡ್‌ಗಳು ಮತ್ತು SyncPlay ನಿಯಂತ್ರಣಗಳು';

  @override
  String get settingsIntegrationsSubtitle =>
      'ಪ್ಲಗಿನ್ ಸಿಂಕ್, ಸೀರ್, ರೇಟಿಂಗ್‌ಗಳು ಮತ್ತು ಇನ್ನಷ್ಟು';

  @override
  String get settingsAboutSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ, ಕಾನೂನು ಮಾಹಿತಿ ಮತ್ತು ಕ್ರೆಡಿಟ್‌ಗಳು';

  @override
  String get settingsAuthenticationSection => 'ದೃಢೀಕರಣ';

  @override
  String get settingsSortServersBy => 'ಮೂಲಕ ಸರ್ವರ್‌ಗಳನ್ನು ವಿಂಗಡಿಸಿ';

  @override
  String get settingsLastUsed => 'ಕೊನೆಯದಾಗಿ ಬಳಸಲಾಗಿದೆ';

  @override
  String get settingsAlphabetical => 'ವರ್ಣಮಾಲೆಯ';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'ಗೌಪ್ಯತೆ ಮತ್ತು ಸುರಕ್ಷತೆ';

  @override
  String get settingsBlockedRatings => 'ನಿರ್ಬಂಧಿಸಿದ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsGeneralStyle => 'ಸಾಮಾನ್ಯ ಶೈಲಿ';

  @override
  String get settingsGeneralStyleSubtitle =>
      'ಥೀಮ್ ಉಚ್ಚಾರಣೆಗಳು, ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು, ವೀಕ್ಷಿಸಿದ ಸೂಚಕಗಳು ಮತ್ತು ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'ಮುಖಪುಟ';

  @override
  String get settingsHomePageSubtitle =>
      'ವಿಭಾಗಗಳು, ಚಿತ್ರದ ಪ್ರಕಾರಗಳು, ಓವರ್‌ಲೇಗಳು ಮತ್ತು ಮಾಧ್ಯಮ ಪೂರ್ವವೀಕ್ಷಣೆಗಳು';

  @override
  String get settingsLibrariesSubtitle =>
      'ಲೈಬ್ರರಿ ಗೋಚರತೆ, ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆ ಮತ್ತು ಬಹು-ಸರ್ವರ್ ನಡವಳಿಕೆ';

  @override
  String get settingsTwentyFourHourClock => '24-ಗಂಟೆಯ ಗಡಿಯಾರ';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ಗಡಿಯಾರವನ್ನು ತೋರಿಸಿರುವಲ್ಲೆಲ್ಲಾ 24-ಗಂಟೆಗಳ ಸಮಯದ ಫಾರ್ಮ್ಯಾಟಿಂಗ್ ಅನ್ನು ಬಳಸಿ';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಷನ್ ಬಾರ್‌ನಲ್ಲಿ ಷಫಲ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಷನ್ ಬಾರ್‌ನಲ್ಲಿ ಪ್ರಕಾರಗಳ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಮೆಚ್ಚಿನವುಗಳ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರೀಸ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ಪ್ರತಿ ಲೈಬ್ರರಿಗೆ ಮುಖಪುಟದ ಗೋಚರತೆಯನ್ನು ಟಾಗಲ್ ಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'ಮೀಡಿಯಾ ಬಾರ್ ಮತ್ತು ಸ್ಥಳೀಯ ಪೂರ್ವವೀಕ್ಷಣೆಗಳು';

  @override
  String get settingsVisualOverlays => 'ದೃಶ್ಯ ಮೇಲ್ಪದರಗಳು';

  @override
  String get settingsSeasonalSurprise => 'ಕಾಲೋಚಿತ ಆಶ್ಚರ್ಯ';

  @override
  String get settingsMetadataAndRatings => 'ಮೆಟಾಡೇಟಾ ಮತ್ತು ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ಹೆಚ್ಚುವರಿ ರೇಟಿಂಗ್ ಮೂಲಗಳು, ಸೀರ್ ವಿನಂತಿಗಳು ಮತ್ತು ಸಿಂಕ್ ಮಾಡಲಾದ ಪ್ರಾಶಸ್ತ್ಯಗಳನ್ನು ಒಳಗೊಂಡಂತೆ ಸರ್ವರ್-ಸೈಡ್ ಇಂಟಿಗ್ರೇಷನ್‌ಗಳಿಗೆ ಶಕ್ತಿ ನೀಡುತ್ತದೆ.';

  @override
  String get settingsOfflineDownloads => 'ಆಫ್‌ಲೈನ್ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get settingsHigh => 'ಹೆಚ್ಚು';

  @override
  String get settingsLow => 'ಕಡಿಮೆ';

  @override
  String get settingsCustomPath => 'ಕಸ್ಟಮ್ ಮಾರ್ಗ';

  @override
  String get settingsEnterDownloadFolderPath =>
      'ಡೌನ್‌ಲೋಡ್ ಫೋಲ್ಡರ್ ಮಾರ್ಗವನ್ನು ನಮೂದಿಸಿ';

  @override
  String get settingsConcurrentDownloads => 'ಏಕಕಾಲಿಕ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ಒಮ್ಮೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಗರಿಷ್ಠ ಸಂಖ್ಯೆಯ ಐಟಂಗಳು.';

  @override
  String get settingsAppInfo => 'ಅಪ್ಲಿಕೇಶನ್ ಮಾಹಿತಿ';

  @override
  String get settingsReportAnIssue => 'ಸಮಸ್ಯೆಯನ್ನು ವರದಿ ಮಾಡಿ';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub ನಲ್ಲಿ ಸಮಸ್ಯೆ ಟ್ರ್ಯಾಕರ್ ತೆರೆಯಿರಿ';

  @override
  String get settingsJoinDiscord => 'Discord ಸೇರಿ';

  @override
  String get settingsJoinDiscordSubtitle => 'ಸಮುದಾಯದೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಿ';

  @override
  String get settingsJoinTheDiscord => 'Discord ಸೇರಿ';

  @override
  String get settingsSupportMoonfin => 'ಬೆಂಬಲ Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'ಕಾನೂನುಬದ್ಧ';

  @override
  String get settingsLicenses => 'ಪರವಾನಗಿಗಳು';

  @override
  String get settingsOpenSourceLicenseNotices => 'ಓಪನ್ ಸೋರ್ಸ್ ಪರವಾನಗಿ ಸೂಚನೆಗಳು';

  @override
  String get settingsPrivacyPolicy => 'ಗೌಪ್ಯತೆ ನೀತಿ';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತ್ತದೆ';

  @override
  String get settingsCheckForUpdates => 'ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'ಇತ್ತೀಚಿನ Moonfin ಬಿಡುಗಡೆಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get settingsPoweredByFlutter => 'Flutter ನಿಂದ ನಡೆಸಲ್ಪಡುತ್ತಿದೆ';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# license notices',
      one: '# license notice',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'ಎರಡೂ';

  @override
  String get settingsShuffleContentTypeFilter => 'ಷಫಲ್ ವಿಷಯದ ಪ್ರಕಾರದ ಫಿಲ್ಟರ್';

  @override
  String get settingsVideoPlaybackPreferences => 'ವೀಡಿಯೊ ಪ್ಲೇಬ್ಯಾಕ್ ಆದ್ಯತೆಗಳು';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'ಕೋರ್ ವೀಡಿಯೊ ಎಂಜಿನ್ ಮತ್ತು ಸ್ಟ್ರೀಮಿಂಗ್ ಗುಣಮಟ್ಟದ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsAudioPreferences => 'ಆಡಿಯೋ ಪ್ರಾಶಸ್ತ್ಯಗಳು';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗಳು, ಸಂಸ್ಕರಣೆ ಮತ್ತು ಪಾಸ್‌ಥ್ರೂ ಆಯ್ಕೆಗಳು';

  @override
  String get settingsAutomationAndQueue => 'ಆಟೊಮೇಷನ್ ಮತ್ತು ಕ್ಯೂ';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ಸ್ವಯಂಚಾಲಿತ ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಅನುಕ್ರಮ';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ, ಸಂಗ್ರಹಣೆ ಮಿತಿಗಳು ಮತ್ತು ಸರತಿ ಗಾತ್ರ';

  @override
  String get settingsSyncplaySubtitle =>
      'ಗುಂಪು ಅವಧಿಗಳಿಗಾಗಿ ಸಿಂಕ್ರೊನೈಸೇಶನ್ ಲಾಜಿಕ್';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ವಿಶೇಷ ಆಟಗಾರರ ವೈಶಿಷ್ಟ್ಯಗಳು. ಕೆಲವು ಆಯ್ಕೆಗಳು ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಸ್ಯೆಗಳನ್ನು ಉಂಟುಮಾಡಬಹುದು, ಎಚ್ಚರಿಕೆಯಿಂದ ಬಳಸಿ';

  @override
  String get settingsSkipIntrosAndOutros =>
      'ಪರಿಚಯಗಳು ಮತ್ತು ಔಟ್ರೊಗಳನ್ನು ಬಿಟ್ಟುಬಿಡುವುದೇ?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'ಪ್ರಾಂಪ್ಟ್ ಬಳಕೆದಾರ';

  @override
  String get settingsSkip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get settingsDoNothing => 'ಏನೂ ಮಾಡಬೇಡಿ';

  @override
  String get settingsMaxBitrateDescription =>
      'ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್ ಅನ್ನು ಕ್ಯಾಪ್ ಮಾಡಿ. ಈ ಮಿತಿಯ ಮೇಲಿರುವ ವಿಷಯವನ್ನು ಸರಿಹೊಂದುವಂತೆ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get settingsMaxResolutionDescription =>
      'ಆಟಗಾರನು ವಿನಂತಿಸುವ ಗರಿಷ್ಠ ರೆಸಲ್ಯೂಶನ್ ಅನ್ನು ಮಿತಿಗೊಳಿಸಿ. ಹೆಚ್ಚಿನ ರೆಸಲ್ಯೂಶನ್ ವಿಷಯವನ್ನು ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಡೌನ್ ಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get settingsPlayerZoomDescription =>
      'ಪರದೆಗೆ ಸರಿಹೊಂದುವಂತೆ ವೀಡಿಯೊವನ್ನು ಹೇಗೆ ಅಳೆಯಬೇಕು.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಎಂಜಿನ್ (ಆಂಡ್ರಾಯ್ಡ್ ಟಿವಿ)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV ಸಾಧನಗಳಲ್ಲಿ ಡೀಫಾಲ್ಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಎಂಜಿನ್ ಆಯ್ಕೆಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಮುಂದಿನ ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಶನ್‌ಗೆ ಅನ್ವಯಿಸುತ್ತವೆ.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ಪರಂಪರೆ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ಫಾಲ್‌ಬ್ಯಾಕ್';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision ಡಿಕೋಡಿಂಗ್ ಇಲ್ಲದ ಸಾಧನಗಳಲ್ಲಿ Dolby Vision ಶೀರ್ಷಿಕೆಗಳ ವರ್ತನೆ.';

  @override
  String get settingsAskEachTime => 'ಪ್ರತಿ ಬಾರಿಯೂ ಕೇಳಿ';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ಫಾಲ್ಬ್ಯಾಕ್ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get settingsPreferServerTranscode =>
      'ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ವರ್ಧನೆ-ಪದರದ ಸ್ಟ್ರೀಮ್‌ಗಳು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಬೇಕೆ ಎಂಬುದನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.';

  @override
  String get settingsAutoAftkrtEnabled => 'ಸ್ವಯಂ (AFTKRT ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ)';

  @override
  String get settingsEnabledOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get settingsDisabledPreferTranscode =>
      'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ (ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ಗೆ ಆದ್ಯತೆ)';

  @override
  String get settingsResumeRewindDescription =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಪುನರಾರಂಭಿಸುವಾಗ (ವೀಕ್ಷಿಸುವುದನ್ನು ಮುಂದುವರಿಸಿ ಅಥವಾ ಮಾಧ್ಯಮ ಐಟಂ ಪುಟದಿಂದ), ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ರಿವೈಂಡ್ ಮಾಡಬೇಕು?';

  @override
  String get settingsUnpauseRewindDescription =>
      'ವಿರಾಮ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಪುನರಾರಂಭಿಸುವಾಗ, ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ರಿವೈಂಡ್ ಮಾಡಬೇಕು?';

  @override
  String get settingsSkipBackLengthDescription =>
      'ರಿವೈಂಡ್ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ಹಿಂದಕ್ಕೆ ಹೋಗಬೇಕು.';

  @override
  String get settingsOneSecond => '1 ಸೆಕೆಂಡ್';

  @override
  String get settingsThreeSeconds => '3 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsFortyFiveSeconds => '45 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsSixtySeconds => '60 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ಫಾಸ್ಟ್ ಫಾರ್ವರ್ಡ್ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ಮುಂದಕ್ಕೆ ಹೋಗಬೇಕು.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ AC3 ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ';

  @override
  String get settingsCinemaMode => 'ಸಿನಿಮಾ ಮೋಡ್';

  @override
  String get settingsCinemaModeSubtitle =>
      'ಮುಖ್ಯ ವೈಶಿಷ್ಟ್ಯದ ಮೊದಲು ಟ್ರೇಲರ್‌ಗಳು/ಪ್ರಿರೋಲ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get settingsNextUpDisplayDescription =>
      'ವಿಸ್ತೃತವು ಸಂಚಿಕೆ ಕಲಾಕೃತಿ ಮತ್ತು ವಿವರಣೆಯೊಂದಿಗೆ ಪೂರ್ಣ ಕಾರ್ಡ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ. ಮಿನಿಮಲ್ ಕಾಂಪ್ಯಾಕ್ಟ್ ಕೌಂಟ್‌ಡೌನ್ ಓವರ್‌ಲೇ ಅನ್ನು ತೋರಿಸುತ್ತದೆ. ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವಿಕೆಯು ಪ್ರಾಂಪ್ಟ್ ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಮರೆಮಾಡುತ್ತದೆ.';

  @override
  String get settingsShort => 'ಚಿಕ್ಕದು';

  @override
  String get settingsLong => 'ಉದ್ದ';

  @override
  String get settingsVeryLong => 'ಬಹಳ ಉದ್ದವಾಗಿದೆ';

  @override
  String get settingsVideoStartDelay => 'ವೀಡಿಯೊ ಪ್ರಾರಂಭ ವಿಳಂಬ';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ಲೈವ್ ಟಿವಿ ನೇರ';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'ಲೈವ್ ಟಿವಿಗಾಗಿ ನೇರ ಪ್ಲೇ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsOpenGroups => 'ಗುಂಪುಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay ಗುಂಪುಗಳನ್ನು ರಚಿಸಿ, ಸೇರಿಕೊಳ್ಳಿ ಅಥವಾ ನಿರ್ವಹಿಸಿ';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ಗುಂಪು ವೀಕ್ಷಣೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsSyncplayButton => 'SyncPlay ಬಟನ್';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ SyncPlay ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsSyncplayAdvancedCorrection => 'ಸುಧಾರಿತ ತಿದ್ದುಪಡಿ';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'ಸೂಕ್ಷ್ಮವಾದ ಸಿಂಕ್ ಲಾಜಿಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsSyncplaySyncCorrection => 'ಸಿಂಕ್ ತಿದ್ದುಪಡಿ';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ಸಿಂಕ್‌ನಲ್ಲಿ ಉಳಿಯಲು ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹೊಂದಿಸಿ';

  @override
  String get settingsSyncplaySpeedToSync => 'ಸಿಂಕ್ ಮಾಡಲು ವೇಗ';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ಸಿಂಕ್ ಮಾಡಲು ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ ಹೊಂದಾಣಿಕೆಯನ್ನು ಬಳಸಿ';

  @override
  String get settingsSyncplaySkipToSync => 'ಸಿಂಕ್‌ಗೆ ತೆರಳಿ';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'ಸಿಂಕ್ ಮಾಡಲು ಹುಡುಕುವುದನ್ನು ಬಳಸಿ';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ಕನಿಷ್ಠ ವೇಗ ವಿಳಂಬ';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'ಗರಿಷ್ಠ ವೇಗ ವಿಳಂಬ';

  @override
  String get settingsSyncplaySpeedDuration => 'ವೇಗದ ಅವಧಿ';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ಕನಿಷ್ಠ ಸ್ಕಿಪ್ ವಿಳಂಬ';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay ಹೆಚ್ಚುವರಿ ಆಫ್‌ಸೆಟ್';

  @override
  String get onNow => 'ಈಗ';

  @override
  String get collections => 'ಸಂಗ್ರಹಣೆಗಳು';

  @override
  String get lastPlayed => 'ಕೊನೆಯದಾಗಿ ಆಡಿದ್ದು';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Latest $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'Autoplay Next Episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatically play the next episode when available.';

  @override
  String get skipSilenceTitle => 'Skip silence';

  @override
  String get skipSilenceSubtitle =>
      'Automatically skip silent audio segments when supported by the stream.';

  @override
  String get allowExternalAudioEffectsTitle => 'Allow external audio effects';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Allow equalizer and effects apps (e.g. Wavelet) to attach to Media3 playback sessions.';

  @override
  String get disableTunnelingTitle => 'Disable tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Force non-tunneled playback. Useful on devices with tunneling audio/video discontinuities.';

  @override
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title => 'Map Dolby Vision profile 7 to HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Play Dolby Vision profile 7 streams as HDR10-compatible HEVC on non-DV devices.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Use embedded subtitle styles';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apply colours, fonts, and positioning embedded in the subtitle track. Disable to use your caption style preferences instead.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use embedded subtitle font sizes';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apply font-size hints embedded in the subtitle track. Disable to use the subtitle size from your style preferences.';

  @override
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

  @override
  String get useDetailedSubHeadings => 'Use Detailed Sub-Headings';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Show detailed or minimal subrow on Library pages.';

  @override
  String get savedThemesDeleteDialogTitle => 'Delete saved theme?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remove \"$themeName\" from this device cache?';
  }

  @override
  String get themeStore => '';

  @override
  String get themeStoreSubtitle => '';

  @override
  String get themeStoreDescription => '';

  @override
  String get themeStoreEmpty => '';

  @override
  String get themeStoreLoadFailed => '';

  @override
  String get themeStoreSave => '';

  @override
  String get themeStoreSaveAndApply => '';

  @override
  String get themeStoreSaved => '';

  @override
  String get themeStoreInvalidMessage => '';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Deleted \"$themeName\" from this device.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Could not delete \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Saved themes';

  @override
  String get savedThemesDescription =>
      'These are themes downloaded from the Moonfin plugin for the current server. Deleting removes only this local copy.';

  @override
  String get savedThemesEmpty => 'No saved themes were found for this server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Currently active';
  }

  @override
  String get savedThemesDeleteTooltip => 'Delete saved theme';

  @override
  String get savedThemesManageSubtitle =>
      'Manage downloaded plugin themes on this device';

  @override
  String get themeEditor => 'Theme Editor';

  @override
  String get themeEditorSubtitle =>
      'Open the Moonfin Theme Editor in your browser';

  @override
  String get homeScreen => 'Home Screen';

  @override
  String get bottomBar => 'Bottom Bar';

  @override
  String get homeRowsStyleClassic => 'Classic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Home Rows';

  @override
  String get homeRowDisplay => '';

  @override
  String get homeRowSections => '';

  @override
  String get homeRowToggles => '';

  @override
  String get homeRowTogglesSubtitle => '';

  @override
  String get homeRowTogglesDescription => '';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';

  @override
  String get displayFavoritesRows => 'Display Favorites Rows';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Show Favorite Movies, Series, and other favorite rows in Home Sections.';

  @override
  String get favoritesRowSorting => 'Favorites Row Sorting';

  @override
  String get favoritesRowSortingDescription =>
      'Sort Favorites rows by date added, release date, alphabetically, and more.';

  @override
  String get displayCollectionsRows => 'Display Collections Rows';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Show Collections rows in Home Sections.';

  @override
  String get collectionsRowSorting => 'Collections Row Sorting';

  @override
  String get collectionsRowSortingDescription =>
      'Sort Collections rows by date added, release date, alphabetically, and more.';

  @override
  String get displayGenresRows => 'Display Genres Rows';

  @override
  String get displayGenresRowsSubtitle => 'Show Genres rows in Home Sections.';

  @override
  String get genresRowSorting => 'Genres Row Sorting';

  @override
  String get genresRowSortingDescription =>
      'Sort Genres rows by date added, release date, alphabetically, and more.';

  @override
  String get genresRowItems => 'Genres Row Items';

  @override
  String get genresRowItemsDescription =>
      'Show Movies, Series, or both in Genres rows.';

  @override
  String get displayPlaylistsRows => '';

  @override
  String get displayPlaylistsRowsSubtitle => '';

  @override
  String get playlistsRowSorting => '';

  @override
  String get playlistsRowSortingDescription => '';

  @override
  String get displayAudioRows => '';

  @override
  String get displayAudioRowsSubtitle => '';

  @override
  String get audioRowsSorting => '';

  @override
  String get audioRowsSortingDescription => '';

  @override
  String get audioPlaylists => '';

  @override
  String get appearance => 'Appearance';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Buttons';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Show app chooser when playback starts.';

  @override
  String get loadingInstalledPlayers => 'Loading installed players...';

  @override
  String get connection => 'Connection';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Supported on this device';

  @override
  String get notSupportedOnThisDevice => 'Not Supported on this device';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) to external decoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Media Player Behavior';

  @override
  String get playbackEnhancements => 'Playback Enhancements';

  @override
  String get alwaysOn => 'Always on.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Replace Skip Outro with Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Show the Next Up overlay instead of the Skip Outro button.';

  @override
  String get playerRouting => 'Player Routing';

  @override
  String get preferSoftwareDecoders => 'Prefer software decoders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (audio) and libgav1 (AV1) before hardware decoders. Disable if HDMI audio passthrough breaks.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Open video playback in your selected external app on Android TV.';

  @override
  String get automaticQueuing => 'Automatic Queuing';

  @override
  String get preferSdhSubtitles => 'Prefer SDH subtitles';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritize SDH/CC subtitle tracks when auto-selecting.';

  @override
  String get webDiagnostics => 'Web diagnostics';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Diagnostics';

  @override
  String get webDiagnosticsIntro =>
      'Use this page to diagnose browser connectivity issues (CORS, mixed content, and discovery settings).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detected Mixed-Content Failure';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detected CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detected an HTTPS page trying to call an HTTP server URL. Browsers block this request before it reaches your server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detected a browser-level request failure that is commonly caused by missing CORS or preflight headers on the media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Target URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Current Runtime Context';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Scheme';

  @override
  String get webDiagnosticsPluginMode => 'Plugin Mode';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC Scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Forced Server URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Default Server URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'not configured';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'This page is loaded over HTTPS, but one or more configured URLs are HTTP. Browsers block HTTPS pages from calling HTTP APIs.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: serve your media server or proxy endpoint via HTTPS, or load Moonfin over HTTP on trusted local networks only.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'No obvious mixed-content configuration detected from current runtime settings.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Allow the browser origin in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Include Authorization, X-Emby-Authorization, and X-Emby-Token in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expose Content-Range and Accept-Ranges for streaming and seek behavior.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Return 204 to OPTIONS preflight requests.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Example Header Snippet (nginx-style)';

  @override
  String get note => 'Note';

  @override
  String get webDiagnosticsNonWebNote =>
      'This diagnostics route is intended for web builds. If you are seeing this on another platform, these checks may not apply.';

  @override
  String get backToServerSelect => 'Back To Server Select';

  @override
  String get signOutAllUsers => 'Sign Out All Users';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Microphone permission is permanently denied. Enable it in system settings.';

  @override
  String get voiceSearchPermissionRequired =>
      'Microphone permission is required for voice search.';

  @override
  String get voiceSearchNoMatch => 'Did not catch that. Try again.';

  @override
  String get voiceSearchNoSpeechDetected => 'No speech detected.';

  @override
  String get voiceSearchMicrophoneError => 'Microphone error.';

  @override
  String get voiceSearchNeedsInternet => 'Voice search needs internet.';

  @override
  String get voiceSearchServiceBusy => 'Voice service is busy. Try again.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Microphone permission is permanently denied.';

  @override
  String get microphonePermissionDenied => 'Microphone permission is denied.';

  @override
  String get speechRecognitionUnavailable =>
      'Speech recognition is unavailable on this device.';

  @override
  String get openIosRoutePicker => 'Open iOS route picker';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay route picker is unavailable on this device.';

  @override
  String get videos => 'Videos';

  @override
  String get programs => 'Programs';

  @override
  String get songs => 'Songs';

  @override
  String get photoAlbums => 'Photo Albums';

  @override
  String get photos => 'Photos';

  @override
  String get people => 'People';

  @override
  String get recentlyReleasedEpisodes => 'Recently Released Episodes';

  @override
  String get watchAgain => 'Watch Again';

  @override
  String get guestAppearances => 'Guest Appearances';

  @override
  String get appearancesSeerr => 'Appearances (Seerr)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Watch with group';

  @override
  String get errors => 'Errors';

  @override
  String get warnings => 'Warnings';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Embedded browser is not available on this platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Are you sure you want to restart the server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Are you sure you want to shut down the server? You will need to restart it manually.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Idle';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'No users found';

  @override
  String get adminNoUsersMatchSearch => 'No users match your search';

  @override
  String get adminNoDevicesFound => 'No devices found';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'No devices match the current filters';

  @override
  String get passwordSet => 'Password set';

  @override
  String get noPasswordConfigured => 'No password configured';

  @override
  String get remoteAccess => 'Remote Access';

  @override
  String get localOnly => 'Local Only';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Failed to load media analytics';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Combined analytics across all media libraries.';

  @override
  String get analyticsTopArtists => 'Top Artists';

  @override
  String get analyticsTopAuthors => 'Top Authors';

  @override
  String get analyticsTopContributors => 'Top Contributors';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Libraries',
      one: '1 Library',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'No indexed media totals are available for this selection yet.';

  @override
  String get analyticsLibraryDetails => 'Library Details';

  @override
  String get analyticsLibraryBreakdown => 'Library Breakdown';

  @override
  String get analyticsNoLibrariesAvailable => 'No libraries are available.';

  @override
  String get adminServerAdministrationTitle => 'Server Administration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Image Cache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logs';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'No server paths returned by this server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% used';
  }

  @override
  String get userActivity => 'User Activity';

  @override
  String get systemEvents => 'System Events';

  @override
  String get needsAttention => 'Needs Attention';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Playback';

  @override
  String get adminDrawerSectionDevices => 'Devices';

  @override
  String get adminDrawerSectionAdvanced => 'Advanced';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'Home Videos';

  @override
  String get mixedContent => 'Mixed Content';

  @override
  String get homeVideosAndPhotos => 'Home Videos & Photos';

  @override
  String get mixedMoviesAndShows => 'Mixed Movies & Shows';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'No recordings found';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'No image pages found inside .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Embedded renderer failed ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB renderer failed ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Missing local file for reader: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status while opening book data from $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'No readable book endpoint available';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Unsupported comic archive format: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR extraction plugin is not available on this platform.';

  @override
  String get failedToExtractCbrArchive => 'Failed to extract .cbr archive.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 extraction is not available on this platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 extraction plugin is not available on this platform.';

  @override
  String get closeGenrePanel => 'Close genre panel';

  @override
  String get loadingShuffle => 'Loading shuffle...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Auto HDR Switching';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatically enable HDR for HDR video playback and restore display mode on exit.';

  @override
  String get whenFullscreen => 'When fullscreen';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Transcoding Limits';

  @override
  String get clearAllArtworkButton => '';

  @override
  String get clearAllArtworkWarning => '';

  @override
  String get confirmClear => '';

  @override
  String confirmClearMessage(String itemType) {
    return '';
  }

  @override
  String get uploadButton => '';

  @override
  String get resolutionLabel => '';

  @override
  String get onlyShowInterfaceLanguage => '';

  @override
  String get confirmClearAll => '';

  @override
  String get imageUploadSuccess => '';

  @override
  String imageUploadFailed(String error) {
    return '';
  }

  @override
  String imageDownloadFailed(String error) {
    return '';
  }

  @override
  String imageDeleteFailed(String error) {
    return '';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '';
  }

  @override
  String get yes => '';

  @override
  String get posterCategory => '';

  @override
  String get backdropsCategory => '';

  @override
  String get bannerCategory => '';

  @override
  String get logoCategory => '';

  @override
  String get thumbnailCategory => '';

  @override
  String get artCategory => '';

  @override
  String get discArtCategory => '';

  @override
  String get screenshotCategory => '';

  @override
  String get boxCoverCategory => '';

  @override
  String get boxRearCoverCategory => '';

  @override
  String get menuArtCategory => '';

  @override
  String get confirmItemPoster => '';

  @override
  String get confirmItemBackdrop => '';

  @override
  String get confirmItemBanner => '';

  @override
  String get confirmItemLogo => '';

  @override
  String get confirmItemThumbnail => '';

  @override
  String get confirmItemArt => '';

  @override
  String get confirmItemDiscArt => '';

  @override
  String get confirmItemScreenshot => '';

  @override
  String get confirmItemBoxCover => '';

  @override
  String get confirmItemBoxRearCover => '';

  @override
  String get confirmItemMenuArt => '';

  @override
  String get resolutionAll => '';

  @override
  String get resolutionHigh => '';

  @override
  String get resolutionMedium => '';

  @override
  String get resolutionLow => '';

  @override
  String get sources => '';

  @override
  String get audiobookChapters => 'Chapters';

  @override
  String get audiobookBookmarks => 'Bookmarks';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Timeline is empty';

  @override
  String get audiobookWholeBook => 'Whole Book';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'Export Bookmarks';

  @override
  String get audiobookExportNotes => 'Export Notes';

  @override
  String get audiobookExportAll => 'Export All';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Add bookmark';

  @override
  String get audiobookAddNote => 'Add note';

  @override
  String get audiobookEditNote => 'Edit note';

  @override
  String get audiobookNoteHint => 'Write a note for this moment';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Off';

  @override
  String get audiobookSleepEndOfChapter => 'End of chapter';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining left';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Playback speed';

  @override
  String get audiobookRemainingTime => 'Remaining';

  @override
  String get audiobookElapsedTime => 'Elapsed';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Back ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Forward ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Previous chapter';

  @override
  String get audiobookNextChapter => 'Next chapter';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get audiobookNoChapters => 'No chapters';

  @override
  String get audiobookNoBookmarks => 'No bookmarks yet';

  @override
  String get audiobookNoNotes => 'No notes yet';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bookmark added at $position';
  }

  @override
  String get audiobookSpeedReset => 'Reset to 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Save';

  @override
  String get audiobookCancel => 'Cancel';

  @override
  String get audiobookDelete => 'Delete';

  @override
  String get subtitlePreferences => '';

  @override
  String get subtitlePreferencesDescription => '';

  @override
  String get subtitleRendering => '';

  @override
  String get displayOptions => '';

  @override
  String get releaseDateAscending => '';

  @override
  String get releaseDateDescending => '';

  @override
  String get groupContributions => '';

  @override
  String get groupMultipleRoles => '';

  @override
  String get libraryWriteAccessWarningTitle => '';

  @override
  String get libraryWriteAccessHowToFix => '';

  @override
  String get libraryWriteAccessFixSteps => '';

  @override
  String get dismiss => '';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '';
  }

  @override
  String get libraryWriteAccessReactiveBody => '';

  @override
  String get externalLists => 'External Lists';

  @override
  String get replay => 'Replay';

  @override
  String get fileInformation => 'File Information';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Size: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Show All ($count) Audio Tracks';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Show All ($count) Subtitle Tracks';
  }

  @override
  String get checkingDirectPlay => 'Checking Direct Play capability...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play Capability: ';

  @override
  String get forced => 'Forced';

  @override
  String get transcodeContainerNotSupported =>
      'Container format is not supported by the player.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video codec is not supported.';

  @override
  String get transcodeAudioCodecNotSupported => 'Audio codec is not supported.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitle format is not supported (requires burning).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Audio profile is not supported.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profile is not supported.';

  @override
  String get transcodeVideoLevelNotSupported => 'Video level is not supported.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Video resolution is not supported by this device.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bit depth is not supported.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video framerate is not supported.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'File bitrate exceeds player streaming limit.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Audio bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Number of audio channels is not supported.';

  @override
  String get sortAlphabetical => 'Alphabetical';

  @override
  String get sortReleaseAscending => 'Release Order (Ascending)';

  @override
  String get sortReleaseDescending => 'Release Order (Descending)';

  @override
  String get sortCustomDragDrop => 'Custom (Drag-and-Drop)';

  @override
  String get playlistSortOptions => 'Playlist Sort Options';

  @override
  String get resetSort => 'Reset Sort';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rewatch S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rewatch Playlist';

  @override
  String get noSubtitlesFound => 'No subtitles found.';

  @override
  String get adminControls => 'Admin Controls';

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is Flutter\'s modern GPU renderer for smoother animations and less stutter. On some TV boxes and older GPUs it can cause glitches or black video; switch it Off if you see those. Automatic picks the best default for your device. Restart Moonfin to apply.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'On';

  @override
  String get impellerOff => 'Off';

  @override
  String get impellerRestartTitle => 'Restart required';

  @override
  String get impellerRestartMessage =>
      'Moonfin needs to restart to change the rendering engine. Close the app now, then reopen it to apply.';

  @override
  String get impellerCloseNow => 'Close app now';

  @override
  String get adminRefreshLibrary => 'Refresh Library';

  @override
  String get adminRefreshAllLibraries => 'Refresh All Libraries';

  @override
  String get adminRepoSortDateOldest => 'Date Added (Oldest First)';

  @override
  String get adminRepoSortDateNewest => 'Date Added (Newest First)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetical (A to Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetical (Z to A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Loading Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Movies';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV Shows';

  @override
  String get imdbMostPopularMovies => 'IMDb Most Popular Movies';

  @override
  String get imdbMostPopularTvShows => 'IMDb Most Popular TV Shows';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lowest Rated Movies';

  @override
  String get imdbTopEnglishMovies => 'IMDb Top Rated English Movies';
}
