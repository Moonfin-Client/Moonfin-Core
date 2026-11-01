// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Mixed';

  @override
  String get animeMarkerAnimeCanon => 'Anime Canon';

  @override
  String get animeMarkerMangaCanon => 'Manga Canon';

  @override
  String get animeMarkerSubbed => 'Subbed';

  @override
  String get animeMarkerDubbed => 'Dubbed';

  @override
  String get animeMarkerSubbedAndDubbed => 'Subbed/Dubbed';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'Pending';

  @override
  String get animeMarkerRecap => 'Recap';

  @override
  String get interfaceLanguage => 'ಇಂಟರ್‌ಫೇಸ್ ಭಾಷೆ';

  @override
  String get systemLanguageDefault => 'ಸಿಸ್ಟಂ ಡೀಫಾಲ್ಟ್';

  @override
  String get signIn => 'ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'ಖಾಲಿ';

  @override
  String connectingToServer(String serverName) {
    return '$serverName ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get quickConnectScanHint =>
      'Or scan this with a phone that\'s signed in to your server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tap to approve in your browser, or scan this with another device';

  @override
  String get timesUpTitle => 'Time\'s up';

  @override
  String get timesUpMessage => 'This account isn\'t available right now.';

  @override
  String timesUpResumesToday(String time) {
    return 'You can use it again today at $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'You can use it again tomorrow at $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'You can use it again on $day at $time.';
  }

  @override
  String get waitingForAuthorization => 'ದೃಢೀಕರಣಕ್ಕಾಗಿ ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get back => 'ಹಿಂದೆ';

  @override
  String get serverUnavailable => 'ಸರ್ವರ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get loginFailed => 'ಲಾಗಿನ್ ವಿಫಲವಾಗಿದೆ';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect ಲಭ್ಯವಿಲ್ಲ: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ಲಭ್ಯವಿಲ್ಲ ($status): $detail';
  }

  @override
  String get whosWatching => 'ಯಾರು ನೋಡುತ್ತಿದ್ದಾರೆ?';

  @override
  String get signedInOnThisDevice => 'Signed in on this device';

  @override
  String get pinRequired => 'PIN required';

  @override
  String get passwordRequired => 'Password required';

  @override
  String continueAsUser(String name) {
    return 'Continue as $name';
  }

  @override
  String switchToUser(String name) {
    return 'Switch to $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Signed in as $user on $server';
  }

  @override
  String get accountActive => 'Active';

  @override
  String get addUser => 'ಬಳಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String get selectServer => 'ಸರ್ವರ್ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin ಆವೃತ್ತಿ $version';
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
    return 'ನಿಮ್ಮ ಸರ್ವರ್‌ಗಳಿಂದ \"$serverName\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
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
  String get detailScreenStyle => 'ವಿವರ ಪರದೆಯ ಶೈಲಿ';

  @override
  String get detailScreenStyleSubtitle =>
      'ಕ್ಲಾಸಿಕ್ ಎಂಬುದು ಮೂಲ ಕೇಂದ್ರೀಕೃತ Moonfin ವಿನ್ಯಾಸ. ಮಾಡರ್ನ್ ಎಂಬುದು ಸ್ಪಂದನಶೀಲ ಸಿನಿಮ್ಯಾಟಿಕ್ ವಿನ್ಯಾಸ.';

  @override
  String get detailScreenStyleMoonfin => 'ಕ್ಲಾಸಿಕ್';

  @override
  String get detailScreenStyleModern => 'ಮಾಡರ್ನ್';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'More Actions';

  @override
  String get spotlightCastCrewStudios => 'Cast, Crew, and Studios';

  @override
  String get spotlightChaptersExtras => 'Chapters and Extras';

  @override
  String get spotlightFileDetails => 'File Details';

  @override
  String get spotlightSimilarRecommendations => 'Similar and Recommendations';

  @override
  String get spotlightSeasonsEpisodes => 'Seasons and Episodes';

  @override
  String get spotlightMoreEpisodes => 'More Episodes';

  @override
  String get spotlightFilmography => 'Filmography';

  @override
  String get spotlightCollectionsCard => 'Collections';

  @override
  String get spotlightPlaylistOrder => 'Playlist Order';

  @override
  String get spotlightMoviesAndShows => 'Movies & Shows';

  @override
  String get spotlightSimilarSeerr => 'Similar (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Recommendations (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count facts',
      one: '1 fact',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tags',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count studios',
      one: '1 studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count extras',
      one: '1 extra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seasons',
      one: '1 season',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movies',
      one: '1 movie',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count shows',
      one: '1 show',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albums',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count collections',
      one: '1 collection',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titles',
      one: '1 title',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

  @override
  String get expandedTabs => 'ವಿಸ್ತರಿಸಿದ ಟ್ಯಾಬ್‌ಗಳು';

  @override
  String get expandedTabsSubtitle =>
      'ಟ್ಯಾಬ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಟ್ಯಾಬ್ ವಿಷಯವನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತೋರಿಸಿ. ಪ್ರತಿ ಟ್ಯಾಬ್ ಅನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ತೆರೆಯಲು ಮತ್ತು ಮುಚ್ಚಲು ಆಫ್ ಮಾಡಿ.';

  @override
  String get showTechnicalDetails => 'ತಾಂತ್ರಿಕ ವಿವರಗಳನ್ನು ತೋರಿಸುವುದೇ?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'ಬ್ಯಾನರ್ ಸಾರಾಂಶದಲ್ಲಿ ಕೊಡೆಕ್, ರೆಸಲ್ಯೂಶನ್ ಮತ್ತು ಸ್ಟ್ರೀಮ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ';

  @override
  String get recommendationSystem => 'ಶಿಫಾರಸು ವ್ಯವಸ್ಥೆ';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends ಸ್ಥಳೀಯ-ಲೈಬ್ರರಿ ಅಲ್ಗಾರಿದಮ್ ಅಥವಾ ಆನ್‌ಲೈನ್ TMDb ಸಾಮ್ಯತೆ ಮಾಪನಗಳನ್ನು ಬಳಸಿ. ಗಮನಿಸಿ: ಆನ್‌ಲೈನ್ ಶಿಫಾರಸುಗಳಿಗೆ Seerr ಸಂಯೋಜನೆ ಅಗತ್ಯವಿದೆ.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb ಸಾಮ್ಯತೆ';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'ಪೋಷಕರ ರೇಟಿಂಗ್ ಮಿತಿಯನ್ನು ಅನ್ವಯಿಸುವುದೇ?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'ಗುರಿ ಮಾಧ್ಯಮದ ಪೋಷಕರ ರೇಟಿಂಗ್ ಪ್ರಕಾರ Moonfin Recommends ಸಲಹೆಗಳನ್ನು ಮಿತಿಗೊಳಿಸಿ';

  @override
  String get interfaceStyle => 'ಇಂಟರ್‌ಫೇಸ್ ಶೈಲಿ';

  @override
  String get interfaceStyleSubtitle =>
      'ಸ್ವಯಂಚಾಲಿತವು ನಿಮ್ಮ ಸಾಧನಕ್ಕೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ. ನಿರ್ದಿಷ್ಟ ನೋಟವನ್ನು ಒತ್ತಾಯಿಸಲು Apple ಅಥವಾ Material ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get interfaceStyleAutomatic => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Interface Layout';

  @override
  String get interfaceLayoutSubtitle =>
      'Override the detected layout when this device is read wrong. Restart Moonfin for changes to take effect.';

  @override
  String get interfaceLayoutAutomatic => 'Automatic';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Phone';

  @override
  String get glassQuality => 'ಗ್ಲಾಸ್ ಗುಣಮಟ್ಟ';

  @override
  String get oledMode => 'OLED Mode';

  @override
  String get oledModeSubtitle =>
      'Deepen blacks and enrich artwork. Best on OLED displays.';

  @override
  String get oledModeSubtle => 'Subtle';

  @override
  String get oledModeVivid => 'Vivid';

  @override
  String get glassQualitySubtitle =>
      'ಆಟೋ ಈ ಸಾಧನಕ್ಕೆ ಅತ್ಯುತ್ತಮ ಗ್ಲಾಸ್ ಪರಿಣಾಮವನ್ನು ಆಯ್ಕೆಮಾಡುತ್ತದೆ. ಫುಲ್ ನಿಜವಾದ ಬ್ಲರ್ ಅನ್ನು ಒತ್ತಾಯಿಸುತ್ತದೆ; ರಿಡ್ಯೂಸ್ಡ್ GPU ಶಕ್ತಿಯನ್ನು ಉಳಿಸುವ ಹಗುರವಾದ ಗ್ಲಾಸ್ ಅನ್ನು ಬಳಸುತ್ತದೆ.';

  @override
  String get glassQualityAuto => 'ಆಟೋ';

  @override
  String get glassQualityFull => 'ಫುಲ್';

  @override
  String get glassQualityReduced => 'ರಿಡ್ಯೂಸ್ಡ್';

  @override
  String get performanceMode => 'Performance';

  @override
  String get performanceModeSubtitle =>
      'Auto measures this device and holds back on the ones short on memory, which keeps fewer images in memory and leaves trailers as still images. Takes full effect on the next launch.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Reduced';

  @override
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Auto uses Impeller on boxes whose graphics run it smoothly and Skia everywhere else. Pick Skia if animations or video look wrong. Takes effect on the next launch.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Off because Performance is set to Reduced for this device';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸದೆಯೇ Moonfin ಮತ್ತು Neon Pulse ನಡುವೆ ಬದಲಿಸಿ';

  @override
  String get customThemeTitle => 'ಕಸ್ಟಮ್ ಥೀಮ್';

  @override
  String get customThemeSubtitle =>
      'ಕಸ್ಟಮ್ ಥೀಮ್‌ಗಳು Moonfin ನಾದ್ಯಂತ ದೃಶ್ಯ ಅಂಶಗಳನ್ನು ಬದಲಾಯಿಸುತ್ತವೆ. ನಿಮ್ಮ ಶೈಲಿಗೆ ಸರಿಹೊಂದುವ ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get keyboardStyle => 'Keyboard Style';

  @override
  String get keyboardStyleDescription =>
      'Native uses your TV\'s own keyboard. Classic is the original Moonfin keyboard. Glass is a frosted panel with larger keys. Docked fills the bottom of the screen and shows what you type above the keys.';

  @override
  String get keyboardStyleNative => 'Native';

  @override
  String get keyboardStyleClassic => 'Classic';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'Docked';

  @override
  String get keyboardSpace => 'space';

  @override
  String get keyboardHoldForAccents => 'hold for accents';

  @override
  String get keyboardClose => 'close';

  @override
  String get controller => 'Controller';

  @override
  String get gamepadNavigation => 'Gamepad Navigation';

  @override
  String get gamepadNavigationDescription =>
      'Let a connected game controller move focus and select items';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ಪ್ರಸ್ತುತ Moonfin ನೋಟ ನೀವೆಲ್ಲರೂ ಪ್ರೀತಿಸುವಂತೆ ಮಾಡಿದ್ದೀರಿ';

  @override
  String get themeNeonPulse => 'ನಿಯಾನ್ ಪಲ್ಸ್';

  @override
  String get themeNeonPulseSubtitle =>
      'ಮೆಜೆಂಟಾ ಗ್ಲೋ, ಸಯಾನ್ ಪಠ್ಯ ಮತ್ತು ಬಲವಾದ ಕ್ರೋಮ್ ಕಾಂಟ್ರಾಸ್ಟ್‌ನೊಂದಿಗೆ ಸಿಂಥ್ವೇವ್ ಸ್ಟೈಲಿಂಗ್';

  @override
  String get themeGlass => 'ಗ್ಲಾಸ್';

  @override
  String get themeGlassSubtitle =>
      'ತೇಲುವ ಗ್ರೇಡಿಯಂಟ್ ಹಿನ್ನೆಲೆ, ಮಂಜುಗಟ್ಟಿದ ಮೇಲ್ಮೈಗಳು ಮತ್ತು Apple-ನೀಲಿ ಆಕ್ಸೆಂಟ್‌ನೊಂದಿಗೆ ಲಿಕ್ವಿಡ್-ಗ್ಲಾಸ್ ಶೈಲಿ';

  @override
  String get theme8BitHero => '8-bit ಹೀರೋ';

  @override
  String get theme8BitHeroSubtitle =>
      'ದಪ್ಪ ಬಣ್ಣದ ಪ್ಯಾಲೆಟ್, ಬ್ಲಾಕಿ ಅಂಚುಗಳು, ಗಟ್ಟಿಯಾದ ಡ್ರಾಪ್-ಶ್ಯಾಡೋಗಳು ಮತ್ತು ಪಿಕ್ಸೆಲ್ ಫಾಂಟ್‌ನೊಂದಿಗೆ ರೆಟ್ರೊ ಪಿಕ್ಸೆಲ್-ಆರ್ಟ್ ಶೈಲಿ';

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
  String get signInWithPlex => 'Sign in with Plex';

  @override
  String get plexLinkInstructions =>
      'Go to plex.tv/link on any device and enter this code';

  @override
  String get plexOpenLink => 'Open plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Waiting for you to approve the code...';

  @override
  String get plexSignInWithPassword => 'Sign in with a password';

  @override
  String get plexVerificationCode => 'Verification code';

  @override
  String get plexNoServers => 'No Plex servers found on this account';

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
    return '$target ಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
  }

  @override
  String get exitApp => 'Moonfin ನಿರ್ಗಮಿಸುವುದೇ?';

  @override
  String get exitAppConfirmation => 'ನೀವು ನಿರ್ಗಮಿಸಲು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get exit => 'ನಿರ್ಗಮಿಸಿ';

  @override
  String get gameMenu => 'ಮೆನು';

  @override
  String get gamePaused => 'ವಿರಾಮಗೊಂಡಿದೆ';

  @override
  String get gameSaveState => 'ಸ್ಥಿತಿಯನ್ನು ಉಳಿಸಿ';

  @override
  String get games => 'ಆಟಗಳು';

  @override
  String get gameLoadState => 'ಸ್ಥಿತಿಯನ್ನು ಲೋಡ್ ಮಾಡಿ';

  @override
  String get gameFastForward => 'ಫಾಸ್ಟ್-ಫಾರ್ವರ್ಡ್';

  @override
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'ಎಮ್ಯುಲೇಟರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get gameNoCoreOptions => 'ಈ ಕೋರ್‌ಗೆ ಹೊಂದಿಸಬಹುದಾದ ಆಯ್ಕೆಗಳಿಲ್ಲ.';

  @override
  String get gameHoldToOpenMenu => 'ಮೆನು ತೆರೆಯಲು ಒತ್ತಿ ಹಿಡಿಯಿರಿ';

  @override
  String get gameKeepPlaying => 'Keep playing';

  @override
  String get gameSaveAndExit => 'Save & exit';

  @override
  String get gameExitGame => 'Exit game';

  @override
  String get gameSavingBeforeExit => 'Saving…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Could not save state. Still playing.';

  @override
  String get gamePlaybackUnsupported =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಆಟ ಆಡುವುದನ್ನು ಇನ್ನೂ ಬೆಂಬಲಿಸಲಾಗಿಲ್ಲ.';

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
  String get series => 'ಸರಣಿಗಳು';

  @override
  String get noItemsFound => 'ಯಾವುದೇ ಐಟಂಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get home => 'ಮುಖಪುಟ';

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
  String get library => 'ಲೈಬ್ರರಿ';

  @override
  String get displaySettings => 'ಪ್ರದರ್ಶನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get allGenres => 'ಎಲ್ಲಾ ಪ್ರಕಾರಗಳು';

  @override
  String get noGenresFound => 'ಯಾವುದೇ ಪ್ರಕಾರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String failedToLoadFolderError(String error) {
    return 'ಫೋಲ್ಡರ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ಈ ಫೋಲ್ಡರ್ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String itemCountLabel(int count) {
    return '$count ಐಟಂಗಳು';
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
    return '$count ಐಟಂಗಳು';
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
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Scroll Direction';

  @override
  String get scrollDirectionVertical => 'Vertical';

  @override
  String get scrollDirectionHorizontal => 'Horizontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ಪ್ರಕಾರಗಳು';
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
    return '$countನಿ ಹಿಂದೆ';
  }

  @override
  String hoursAgo(int count) {
    return '$countಗಂ ಹಿಂದೆ';
  }

  @override
  String daysAgo(int count) {
    return '$countದಿ ಹಿಂದೆ';
  }

  @override
  String get discoverySubjects => 'ಡಿಸ್ಕವರಿ ವಿಷಯಗಳು';

  @override
  String get apply => 'ಅನ್ವಯಿಸಿ';

  @override
  String get openLink => 'ಲಿಂಕ್ ತೆರೆಯಿರಿ';

  @override
  String get scanWithYourPhone => 'ನಿಮ್ಮ ಫೋನ್‌ನೊಂದಿಗೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get audiobookGenres => 'ಆಡಿಯೋಬುಕ್ ಪ್ರಕಾರಗಳು';

  @override
  String get scrollLeft => 'ಎಡಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get scrollRight => 'ಬಲಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get resume => 'ಮುಂದುವರಿಸಿ';

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
    return '$count ಲೇಖಕರು';
  }

  @override
  String genresCount(int count) {
    return '$count ಪ್ರಕಾರಗಳು';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% ಪೂರ್ಣಗೊಂಡಿದೆ';
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
    return 'ಓದುವಿಕೆಗೆ ಆದ್ಯತೆ ನೀಡುವ ಬ್ರೌಸಿಂಗ್‌ಗಾಗಿ ಜೋಡಿಸಲಾದ $count ಶೀರ್ಷಿಕೆಗಳು.';
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
  String get noBookmarkedItems => 'ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಲಾದ ಐಟಂಗಳು ಇನ್ನೂ ಇಲ್ಲ';

  @override
  String get nothingMatchesSection =>
      'ಈ ವಿಭಾಗಕ್ಕೆ ಇನ್ನೂ ಯಾವುದೂ ಹೊಂದಾಣಿಕೆಯಾಗುತ್ತಿಲ್ಲ. ಇನ್ನೊಂದು ಟ್ಯಾಬ್ ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ ಲೈಬ್ರರಿ ಸಿಂಕ್ ಮುಗಿದ ನಂತರ ಹಿಂತಿರುಗಿ.';

  @override
  String get audiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String noLabelFound(String label) {
    return 'ಯಾವುದೇ $label ಕಂಡುಬಂದಿಲ್ಲ';
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
  String get watched => 'ವೀಕ್ಷಿಸಲಾಗಿದೆ';

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
  String get latestBooks => 'ಇತ್ತೀಚಿನ ಪುಸ್ತಕಗಳು';

  @override
  String get latestAudiobooks => 'ಇತ್ತೀಚಿನ ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಪುಸ್ತಕಗಳು',
      one: '1 ಪುಸ್ತಕ',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'ಪುಸ್ತಕ';

  @override
  String get bookFormatAudiobook => 'ಆಡಿಯೋಬುಕ್';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'ಈ ಲೇಖಕರಿಗೆ ಯಾವುದೇ ಪುಸ್ತಕಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% ಓದಲಾಗಿದೆ';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time ಬಾಕಿ';
  }

  @override
  String get bookHeroRead => 'ಓದಿ';

  @override
  String get bookHeroListen => 'ಕೇಳಿ';

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
    return '$count ವಿಭಾಗಗಳು';
  }

  @override
  String firstPublished(int year) {
    return 'ಮೊದಲ ಪ್ರಕಟಣೆ $year';
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
    return '$count ಪುಸ್ತಕಗಳು';
  }

  @override
  String get couldNotLoadSubject =>
      'ಇದೀಗ ಈ ವಿಷಯವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get audiobookDetails => 'ಆಡಿಯೋಬುಕ್ ವಿವರಗಳು';

  @override
  String authorsCountTitle(int count) {
    return '$count ಲೇಖಕರು';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಆಡಿಯೋಬುಕ್‌ಗಳು',
      one: '1 ಆಡಿಯೋಬುಕ್',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ಟ್ರ್ಯಾಕ್ ಪಟ್ಟಿ';

  @override
  String get itemListPlaceholder => 'ಐಟಂ ಪಟ್ಟಿ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

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
  String get seasons => 'ಸೀಸನ್‌ಗಳು';

  @override
  String get chapters => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get features => 'ವೈಶಿಷ್ಟ್ಯಗಳು';

  @override
  String get movies => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get musicVideos => 'ಸಂಗೀತ ವಿಡಿಯೋಗಳು';

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
    return 'ಡಿಸ್ಕ್ $number';
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
  String get unableToLoadAuthorDetails =>
      'ಇದೀಗ ಲೇಖಕರ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ.';

  @override
  String published(int year) {
    return 'ಪ್ರಕಟಣೆ $year';
  }

  @override
  String get publicationDateUnknown => 'ಪ್ರಕಟಣೆಯ ದಿನಾಂಕ ತಿಳಿದಿಲ್ಲ';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಸೀಸನ್‌ಗಳು',
      one: '1 ಸೀಸನ್',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time ಕ್ಕೆ ಮುಗಿಯುತ್ತದೆ';
  }

  @override
  String get items => 'ಐಟಂಗಳು';

  @override
  String get extras => 'ಹೆಚ್ಚುವರಿಗಳು';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'ತೆರೆಯ ಹಿಂದೆ';

  @override
  String get deletedScenes => 'ಅಳಿಸಿದ ದೃಶ್ಯಗಳು';

  @override
  String get featurettes => 'ಫೀಚರೆಟ್‌ಗಳು';

  @override
  String get interviews => 'ಸಂದರ್ಶನಗಳು';

  @override
  String get scenes => 'ದೃಶ್ಯಗಳು';

  @override
  String get shorts => 'ಕಿರುಚಿತ್ರಗಳು';

  @override
  String get trailers => 'ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String timeRemaining(String time) {
    return '$time ಉಳಿದಿದೆ';
  }

  @override
  String endsIn(String time) {
    return '$time ನಲ್ಲಿ ಮುಗಿಯುತ್ತದೆ';
  }

  @override
  String get view => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get resumeReading => 'ಓದುವಿಕೆಯನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get read => 'ಓದು';

  @override
  String resumeFrom(String position) {
    return '$position ರಿಂದ ಪುನರಾರಂಭಿಸಿ';
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
  String get cast => 'ಬಿತ್ತರಿಸಿ';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'ಟ್ರೇಲರ್';

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
  String get finalizingDownload => 'Finalizing…';

  @override
  String get queuedDownload => 'Queued';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more queued',
      one: '1 more queued',
    );
    return '$_temp0';
  }

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಮರುಹೆಸರಿಸಿ';

  @override
  String get playlistName => 'ಪ್ಲೇಪಟ್ಟಿ ಹೆಸರು';

  @override
  String get deleteDownloadedAlbum => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಆಲ್ಬಮ್ ಅನ್ನು ಅಳಿಸಿ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸುವುದೇ?';
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
    return 'ಯಾವುದೇ $itemLabel ಲೋಡ್ ಆಗಿಲ್ಲ';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ ($count ಐಟಂಗಳು)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'ಸರ್ವರ್‌ನಿಂದ \"$name\" ಅನ್ನು ಅಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ? ಈ ಕ್ರಿಯೆಯನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String get itemDeleted => 'ಐಟಂ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get noPlayableTrailerFound => 'ಪ್ಲೇ ಮಾಡಬಹುದಾದ ಟ್ರೇಲರ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'ಬೆಂಬಲಿಸದ ಪುಸ್ತಕ ಸ್ವರೂಪ: .$extension';
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
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'ಆಯ್ಕೆಮಾಡಿದ ಉಪಶೀರ್ಷಿಕೆ ಅಮಾನ್ಯವಾಗಿದೆ.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡ್ ಆಗಿ ಆಯ್ಕೆಯಾಗಿದೆ: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ. Jellyfin ಐಟಂ ಅನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡುವಾಗ ಅದು ಕಾಣಿಸಿಕೊಳ್ಳಲು ಸ್ವಲ್ಪ ಸಮಯ ತೆಗೆದುಕೊಳ್ಳಬಹುದು.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language ಗಾಗಿ ಯಾವುದೇ ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String get selectVersion => 'ಆವೃತ್ತಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String versionNumber(int number) {
    return 'ಆವೃತ್ತಿ $number';
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
  String get downloadScopeTitle => 'What to download';

  @override
  String get downloadAllEpisodes => 'All episodes';

  @override
  String get downloadUnwatchedEpisodes => 'All unwatched episodes';

  @override
  String get downloadAllMovies => 'All movies';

  @override
  String get downloadUnwatchedMovies => 'All unwatched movies';

  @override
  String get downloadScopeLoading => 'Loading items...';

  @override
  String get downloadScopeLoadFailed => 'Could not load items to download';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size total';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received of $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size total';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count unknown';
  }

  @override
  String downloadingItem(String name, String quality) {
    return '$name ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel ಗಾಗಿ ಸ್ಥಳೀಯ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸುವುದೇ?\n\nಇದು ಸಂಗ್ರಹಣಾ ಸ್ಥಳವನ್ನು ಮುಕ್ತಗೊಳಿಸುತ್ತದೆ. ನೀವು ನಂತರ ಮತ್ತೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಬಹುದು.';
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
  String get starring => 'STARRING';

  @override
  String get directors => 'ನಿರ್ದೇಶಕರು';

  @override
  String get writer => 'ಬರಹಗಾರ';

  @override
  String get writers => 'ಬರಹಗಾರರು';

  @override
  String get studio => 'ಸ್ಟುಡಿಯೋ';

  @override
  String studioMoreCount(int count) {
    return '+$count ಇನ್ನಷ್ಟು';
  }

  @override
  String totalEpisodes(int count) {
    return '$count ಸಂಚಿಕೆಗಳು';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'ಸಂಚಿಕೆ $number';
  }

  @override
  String chapterNumber(int number) {
    return 'ಅಧ್ಯಾಯ $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಟ್ರ್ಯಾಕ್‌ಗಳು',
      one: '1 ಟ್ರ್ಯಾಕ್',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಅಧ್ಯಾಯಗಳು',
      one: '1 ಅಧ್ಯಾಯ',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'ಜನನ $date';
  }

  @override
  String died(String date) {
    return 'ಮರಣ $date';
  }

  @override
  String age(int age) {
    return 'ವಯಸ್ಸು $age';
  }

  @override
  String get showLess => 'ಕಡಿಮೆ ತೋರಿಸು';

  @override
  String get readMore => 'ಮುಂದೆ ಓದಿ';

  @override
  String get shuffle => 'ಷಫಲ್';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'ಎಲ್ಲಾ ಸಂಗೀತವನ್ನು ಷಫಲ್ ಮಾಡಿ';

  @override
  String get carSignInPrompt => 'ನಿಮ್ಮ ಫೋನ್‌ನಲ್ಲಿ Moonfin ಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get carServerUnreachable =>
      'ನಿಮ್ಮ ಸರ್ವರ್ ಅನ್ನು ತಲುಪಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String downloadsCount(int count) {
    return '$count ಡೌನ್‌ಲೋಡ್‌ಗಳು';
  }

  @override
  String get perfectMatch => 'ಪರಿಪೂರ್ಣ ಹೊಂದಾಣಿಕೆ';

  @override
  String get aiTranslated => 'AI Translated';

  @override
  String get machineTranslated => 'Machine Translated';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
  }

  @override
  String get mono => 'ಮೊನೊ';

  @override
  String get stereo => 'ಸ್ಟೀರಿಯೋ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ಗೆ ಈ ಬಳಕೆದಾರರಿಗೆ Jellyfin ಉಪಶೀರ್ಷಿಕೆ ನಿರ್ವಹಣೆ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ಗಾಗಿ ಈ ಐಟಂ ಸರ್ವರ್‌ನಲ್ಲಿ ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ವಿಫಲವಾಗಿದೆ: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ವಿಫಲವಾಗಿದೆ (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು $action ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳು';
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
    return '$label ಕ್ರಿಯೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'ಕಾಸ್ಟ್ ವಾಲ್ಯೂಮ್ ಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label ನಿಯಂತ್ರಣಗಳು';
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
    return '$label ನಿಲ್ಲಿಸಿ';
  }

  @override
  String get queueIsEmpty => 'ಸರತಿ ಸಾಲು ಖಾಲಿಯಾಗಿದೆ';

  @override
  String trackNumber(int number) {
    return 'ಟ್ರ್ಯಾಕ್ $number';
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
    return '$seconds ಸೆಕೆಂಡುಗಳು';
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
  String get showMpvStats => 'Show mpv Statistics (Shift+I)';

  @override
  String get hideMpvStats => 'Hide mpv Statistics (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Keyboard shortcuts';

  @override
  String get keyboardShortcutsSubtitle =>
      'Keys for the app, video player and reader';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Press ? or F1 while a video plays to see this list without leaving the player.';

  @override
  String get keyboardShortcutsSectionApp => 'Everywhere';

  @override
  String get keyboardShortcutsSectionAppScope => 'On any screen';

  @override
  String get keyboardShortcutsSectionPlayer => 'Video player';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'While a video is open, playing or paused';

  @override
  String get keyboardShortcutsSectionReader => 'Book and comic reader';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'While reading a book or comic';

  @override
  String get keyNameArrowKeys => 'Arrow keys';

  @override
  String get keyNameSpace => 'Space';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Delete';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Scroll wheel';

  @override
  String get shortcutMoveFocus => 'Move between items';

  @override
  String get shortcutActivate => 'Open the selected item';

  @override
  String get shortcutGoBack => 'Go back';

  @override
  String get shortcutToggleFullscreen => 'Fullscreen on or off';

  @override
  String get shortcutQuit => 'Quit Moonfin';

  @override
  String get shortcutPlayPause => 'Play or pause';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Show controls, or play/pause if shown';

  @override
  String get shortcutSeekBack => 'Seek back (hold for bigger jumps)';

  @override
  String get shortcutSeekForward => 'Seek forward (hold for bigger jumps)';

  @override
  String get shortcutVolumeUp => 'Volume up';

  @override
  String get shortcutVolumeDown => 'Volume down';

  @override
  String get shortcutMute => 'Mute or unmute';

  @override
  String get shortcutToggleSubtitles => 'Subtitles on or off';

  @override
  String get shortcutSlower => 'Slow down';

  @override
  String get shortcutFaster => 'Speed up';

  @override
  String get shortcutPlaybackInfo => 'Show playback information';

  @override
  String get shortcutMpvStats => 'mpv statistics on or off';

  @override
  String get shortcutRecropBlackBars => 'Recrop black bars';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Exit fullscreen, or stop if not fullscreen';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => 'Stop playback';

  @override
  String get shortcutNextItem => 'Next item';

  @override
  String get shortcutPreviousItem => 'Previous item';

  @override
  String get shortcutSkipSegment => 'Skip intro or credits when offered';

  @override
  String get shortcutShowShortcuts => 'Show this list';

  @override
  String get shortcutNextPage => 'Next page';

  @override
  String get shortcutPreviousPage => 'Previous page';

  @override
  String get shortcutScrollPage => 'Scroll the page (ebooks)';

  @override
  String get shortcutFirstPage => 'First page, or start of chapter';

  @override
  String get shortcutLastPage => 'Last page, or end of chapter';

  @override
  String get shortcutZoom => 'Zoom in or out (comics)';

  @override
  String get shortcutResetZoom => 'Reset zoom (comics)';

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
  String get player => 'ಪ್ಲೇಯರ್';

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
  String get videoRenderer => 'Video Renderer';

  @override
  String get videoRendererDescription =>
      'Native window gives the smoothest motion and sends HDR to the display untouched. Try another option if video misbehaves.';

  @override
  String get videoRendererNativeWindow => 'Native window (recommended)';

  @override
  String get videoRendererNativeHdrOnly => 'Native window for HDR only';

  @override
  String get videoRendererInApp => 'In-app (legacy)';

  @override
  String get track => 'ಟ್ರ್ಯಾಕ್';

  @override
  String get channels => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get format => 'ಫಾರ್ಮ್ಯಾಟ್';

  @override
  String get external => 'ಬಾಹ್ಯ';

  @override
  String get embedded => 'ಎಂಬೆಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String castSessionError(String protocol) {
    return '$protocol ಸೆಷನ್ ದೋಷ';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'ಪುಸ್ತಕದ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ EPUB ರೆಂಡರಿಂಗ್ ಇನ್ನೂ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'ಈ ಸ್ವರೂಪವನ್ನು (.$extension) ಇನ್ನೂ ಆ್ಯಪ್‌ನಲ್ಲಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ಎಂಬೆಡೆಡ್ ಡಾಕ್ಯುಮೆಂಟ್ ರೆಂಡರಿಂಗ್ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get couldNotOpenExternalViewer =>
      'ಬಾಹ್ಯ ವೀಕ್ಷಕವನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ಆ್ಯಪ್‌ನಲ್ಲಿನ ರೀಡರ್ ತೆರೆಯಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label ನಲ್ಲಿ ಬುಕ್‌ಮಾರ್ಕ್ ಈಗಾಗಲೇ ಉಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಲಾಗಿದೆ: $label';
  }

  @override
  String get noBookmarksYet =>
      'ಇನ್ನೂ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ.\nನಿಮ್ಮ ಸ್ಥಾನವನ್ನು ಉಳಿಸಲು ಓದುವಾಗ ಬುಕ್‌ಮಾರ್ಕ್ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get noTableOfContentsAvailable => 'ಯಾವುದೇ ಪರಿವಿಡಿ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String pageLabel(int number) {
    return 'ಪುಟ $number';
  }

  @override
  String get position => 'ಸ್ಥಾನ';

  @override
  String get bookReader => 'ಪುಸ್ತಕ ಓದುಗ';

  @override
  String formatExtension(String extension) {
    return 'ಸ್ವರೂಪ: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% ಓದಲಾಗಿದೆ';
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
    return 'ಝೂಮ್ ಮರುಹೊಂದಿಸಿ (${zoom}x)';
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
    return 'ಓದಿದ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ $extension ಫೈಲ್‌ಗಳಿಗಾಗಿ ಎಂಬೆಡೆಡ್ ಡಾಕ್ಯುಮೆಂಟ್ ಎಂಜಿನ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';
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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'ಮಾರ್ಗದರ್ಶಿ ಟೈಮ್‌ಲೈನ್';

  @override
  String failedToLoadGuide(String error) {
    return 'ಗೈಡ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get noChannelsFound => 'ಯಾವುದೇ ಚಾನಲ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'ಲೈವ್';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'ಮುಂದೆ: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesನಿ ಬಾಕಿ';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursಗಂ ಬಾಕಿ';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursಗಂ $minutesನಿ ಬಾಕಿ';
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
  String get record => 'ರೆಕಾರ್ಡ್ ಮಾಡಿ';

  @override
  String nextSeriesRecording(String dateTime) {
    return 'Next series recording: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Series recording is scheduled, but the guide has no upcoming episodes';

  @override
  String get seriesRecordingSkipsShowing =>
      'The series recording will skip this showing';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Which episodes should be recorded?';

  @override
  String get seriesRecordingAllEpisodes => 'All Episodes';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Every showing, including repeats';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Episodes Not Already Recorded';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Skips episodes already in your library and records each episode once';

  @override
  String get seriesRecordingNewEpisodesOnly => 'New Episodes Only';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'First airings only, no repeats';

  @override
  String get seriesRecordingSettings => 'Series Settings';

  @override
  String get seriesRecordingUpdated => 'Series recording updated';

  @override
  String get failedToUpdateSeriesRecording =>
      'Unable to update series recording';

  @override
  String get recordCurrentEpisode => 'Record This Episode';

  @override
  String get recordCurrentProgram => 'Record This Program';

  @override
  String get cancelCurrentRecording => 'Cancel This Recording';

  @override
  String get cancelRecordingAction => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಮಾಡಿ';

  @override
  String get programSetToRecord => 'ಪ್ರೋಗ್ರಾಂ ರೆಕಾರ್ಡ್ ಮಾಡಲು ಹೊಂದಿಸಲಾಗಿದೆ';

  @override
  String get recordingCancelled => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದಾಗಿದೆ';

  @override
  String get unableToCreateRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರಚಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get recordSeries => 'Record Series';

  @override
  String get seriesSetToRecord => 'Series set to record';

  @override
  String get seriesRecordingCancelled => 'Series recording cancelled';

  @override
  String get unableToCreateSeriesRecording =>
      'Unable to create series recording';

  @override
  String get watch => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String failedToPlayChannel(String name) {
    return '$name ಪ್ಲೇ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String get playbackStreamLost =>
      'Playback stopped and could not be recovered.';

  @override
  String get playbackVideoUnsupported =>
      'This device can\'t play this video\'s format. Try an external player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Reconnecting… ($attempt of $total)';
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
    return '\"$name\" ನ ನಿಗದಿತ ರೆಕಾರ್ಡಿಂಗ್ ಅನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
  }

  @override
  String get no => 'ಇಲ್ಲ';

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
    return '\"$name\" ರೆಕಾರ್ಡಿಂಗ್ ನಿಲ್ಲಿಸುವುದೇ?';
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
    return '\"$query\" ಗಾಗಿ ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';
  }

  @override
  String searchFailedError(String error) {
    return 'ಹುಡುಕಾಟ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr ಖಾತೆ ಪ್ರಕಾರ';

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
    return '\"$name\" ಮತ್ತು ಅದರ ಫೈಲ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String tracksCount(int count) {
    return '$count ಟ್ರ್ಯಾಕ್‌ಗಳು';
  }

  @override
  String get album => 'ಆಲ್ಬಮ್';

  @override
  String get playAlbum => 'ಆಲ್ಬಮ್ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String failedToLoadAlbum(String error) {
    return 'ಆಲ್ಬಮ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಯಾವುದೇ ಟ್ರ್ಯಾಕ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
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
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes ನಿಮಿ';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'ಸಂಚಿಕೆ $number';
  }

  @override
  String get seriesNotFound => 'ಸರಣಿ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get errorLoadingSeries => 'ಸರಣಿಯನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get downloadedEpisodes => 'ಸಂಚಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String seasonNumber(int number) {
    return 'ಸೀಸನ್ $number';
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
    return '$season ನಲ್ಲಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳನ್ನು ಅಳಿಸುವುದೇ?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಸಂಚಿಕೆಗಳು',
      one: '1 ಸಂಚಿಕೆ',
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
  String get activeDownloads => 'Active Downloads';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used of $limit';
  }

  @override
  String get savedMediaSelectItems => 'Select items';

  @override
  String get savedMediaNoDownloads => 'Nothing saved yet';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Downloads you start appear here and play without a connection.';

  @override
  String get savedMediaNoActiveDownloads => 'Nothing downloading right now';

  @override
  String get savedMediaNoResults => 'No downloads match that search';

  @override
  String get savedMediaPlayFromStart => 'Play from start';

  @override
  String get savedMediaGoToDetails => 'Go to details';

  @override
  String get savedMediaDeleteDownload => 'Delete download';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Delete $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count episodes',
      one: 'Delete 1 episode',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Open show';

  @override
  String get savedMediaPlayNextUnwatched => 'Play next unwatched';

  @override
  String get savedMediaRead => 'Read';

  @override
  String get savedMediaCancelDownload => 'Cancel download';

  @override
  String get sortBySize => 'Size';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByDateAdded => 'Date added';

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
    return 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ $count ಐಟಂಗಳನ್ನು ಅಳಿಸುವುದೇ?';
  }

  @override
  String get musicAndAudiobooks => 'ಸಂಗೀತ ಮತ್ತು ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get images => 'ಚಿತ್ರಗಳು';

  @override
  String get database => 'ಡೇಟಾಬೇಸ್';

  @override
  String ofStorageLimit(String limit) {
    return '$limit ಮಿತಿಯಲ್ಲಿ';
  }

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsSearchHint => 'Search settings';

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
  String get pluginAndRequests => 'ಪ್ಲಗಿನ್ ಮತ್ತು ವಿನಂತಿಗಳು';

  @override
  String get customizeAccountPlaybackInterface =>
      'ಖಾತೆ, ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಇಂಟರ್ಫೇಸ್ ನಡವಳಿಕೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ';

  @override
  String optionsCount(int count) {
    return '$count ಆಯ್ಕೆಗಳು';
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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get loadingAnimation => 'Loading Animation';

  @override
  String get loadingAnimationDescription =>
      'Customize the loading animations used throughout Moonfin';

  @override
  String get loadingAnimationConfiguration => 'Loading Animation Configuration';

  @override
  String get loadingAnimationImage => 'Image';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin Logo';

  @override
  String get loadingAnimationImageSpinner => 'Spinner';

  @override
  String get loadingAnimationImageRunner => 'Runner';

  @override
  String get loadingAnimationImageMoonPhases => 'Moon Phases';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin Phases';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin Phases';

  @override
  String get loadingAnimationSize => 'Animation Size';

  @override
  String get loadingAnimationSizeThumbnail => 'Thumbnail';

  @override
  String get loadingAnimationSizeSmall => 'Small';

  @override
  String get loadingAnimationSizeMedium => 'Medium';

  @override
  String get loadingAnimationSizeLarge => 'Large';

  @override
  String get loadingAnimationPosition => 'Animation Position';

  @override
  String get loadingAnimationPositionTopLeft => 'Top-Left';

  @override
  String get loadingAnimationPositionTopCenter => 'Top-Center';

  @override
  String get loadingAnimationPositionTopRight => 'Top-Right';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Middle-Left';

  @override
  String get loadingAnimationPositionMiddle => 'Middle';

  @override
  String get loadingAnimationPositionMiddleRight => 'Middle-Right';

  @override
  String get loadingAnimationPositionBottomLeft => 'Bottom-Left';

  @override
  String get loadingAnimationPositionBottomCenter => 'Bottom-Center';

  @override
  String get loadingAnimationPositionBottomRight => 'Bottom-Right';

  @override
  String get loadingAnimationPositionBouncing => 'Bouncing';

  @override
  String get loadingAnimationSpeed => 'Animation Speed';

  @override
  String get loadingAnimationSpeedSlow => 'Slow';

  @override
  String get loadingAnimationSpeedModerate => 'Moderate';

  @override
  String get loadingAnimationSpeedFast => 'Fast';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Show Text';

  @override
  String get loadingAnimationPreview => 'Preview';

  @override
  String get snow => 'ಹಿಮ';

  @override
  String get fireworks => 'ಪಟಾಕಿ';

  @override
  String get confetti => 'ಕಾನ್ಫೆಟ್ಟಿ';

  @override
  String get fallingLeaves => 'ಬೀಳುವ ಎಲೆಗಳು';

  @override
  String get seasonalChristmas => 'Christmas';

  @override
  String get seasonalPetals => 'Spring Petals';

  @override
  String get seasonalFireflies => 'Fireflies';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Density';

  @override
  String get seasonalDensityLight => 'Light';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Heavy';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Seasonal Row';

  @override
  String get seasonalRowDescription =>
      'Show a row of holiday movies from your library, with Seerr suggestions when available.';

  @override
  String get seasonalRowSubtitle => 'Seasonal';

  @override
  String get seasonalRowCountry => 'Country';

  @override
  String get seasonalRowCountryAuto => 'Automatic';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Other';

  @override
  String get seasonalRowHolidays => 'Holidays';

  @override
  String get seasonalRowHolidaysHint => 'Untick a holiday to hide its row.';

  @override
  String get holidayNewYear => 'New Year\'s';

  @override
  String get holidayValentines => 'Valentine\'s Day';

  @override
  String get holidayEaster => 'Easter';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Christmas Movies';

  @override
  String get holidayLunarNewYear => 'Lunar New Year';

  @override
  String get holidayDiwali => 'Diwali';

  @override
  String get themeMusic => 'ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get playThemeMusicOnDetailPages =>
      'ವಿವರ ಪುಟಗಳಲ್ಲಿ ಥೀಮ್ ಸಂಗೀತವನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get themeMusicVolume => 'ಥೀಮ್ ಸಂಗೀತ ಸಂಪುಟ';

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
  String get loopThemeMusic => 'ಥೀಮ್ ಸಂಗೀತವನ್ನು ಲೂಪ್ ಮಾಡಿ';

  @override
  String get loopThemeMusicSubtitle =>
      'ಟ್ರ್ಯಾಕ್ ಅನ್ನು ಒಮ್ಮೆ ಪ್ಲೇ ಮಾಡುವ ಬದಲು ಪುನರಾವರ್ತಿಸಿ';

  @override
  String get detailsBackgroundBlur => 'ವಿವರಗಳ ಹಿನ್ನೆಲೆ ಮಸುಕು';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get settingsScrollWheelAction => 'ಮೌಸ್ ಸ್ಕ್ರಾಲ್ ವೀಲ್';

  @override
  String get settingsScrollWheelActionDescription =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಯದಲ್ಲಿ ವಿಡಿಯೋ ಮೇಲೆ ಮೌಸ್ ವೀಲ್ ಸ್ಕ್ರಾಲ್ ಮಾಡಿದಾಗ ಏನಾಗಬೇಕು ಎಂಬುದನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get scrollWheelActionOff => 'ಆಫ್';

  @override
  String get scrollWheelActionSeek => 'ಸೀಕ್ (ಮುಂದೆ / ಹಿಂದೆ)';

  @override
  String get scrollWheelActionVolume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get playerTooltipVolume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get fit => 'ಫಿಟ್';

  @override
  String get autoCrop => 'ಸ್ವಯಂ ಬೆಳೆ';

  @override
  String get cropBlackBars => 'Crop Black Bars';

  @override
  String get settingsCropBlackBarsDescription =>
      'Detect encoded letterbox bars after playback starts, crop them, then fill the screen. Recrop from the player zoom button.';

  @override
  String get cropBlackBarsRecropInterval => 'Recrop Interval';

  @override
  String get cropBlackBarsOnce => 'Once at start';

  @override
  String get cropBlackBarsEverySecond => 'Every second';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Follow aspect ratio changes during playback.';

  @override
  String get playerRecroppingBlackBars => 'Recropping black bars';

  @override
  String get stretch => 'ಸ್ಟ್ರೆಚ್';

  @override
  String get refreshRateSwitching => 'ರಿಫ್ರೆಶ್ ದರ ಸ್ವಿಚಿಂಗ್';

  @override
  String get disabled => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get trickplayDisplayStyleSingle => 'Single Thumbnail';

  @override
  String get trickplayDisplayStyleStrip => 'Filmstrip';

  @override
  String get trickplayModeFull => 'Full Screen';

  @override
  String get trickplaySettingsPreviewHint =>
      'Drag the slider to preview scrubbing';

  @override
  String get trickplayPreviewScale => 'Preview Size';

  @override
  String get trickplayVerticalOffset => 'Distance From Seekbar';

  @override
  String get trickplayFollowScrubPosition => 'Follow Scrub Position';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Preview slides along the seekbar as you scrub, instead of staying centered';

  @override
  String get trickplayPauseWhileScrubbing => 'Pause While Scrubbing';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Playback pauses while you seek and resumes when you press play. Turn this off to keep playing and jump straight to the new spot';

  @override
  String get showDescriptionOnPause => 'ವಿರಾಮದಲ್ಲಿ ವಿವರಣೆಯನ್ನು ತೋರಿಸಿ';

  @override
  String get dimVideoShowOverview =>
      'ವಿರಾಮಗೊಳಿಸಿದಾಗ ವೀಡಿಯೊವನ್ನು ಮಂದಗೊಳಿಸಿ ಮತ್ತು ಅವಲೋಕನ ಪಠ್ಯವನ್ನು ತೋರಿಸಿ';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD ಲಾಕ್ ಬಟನ್';

  @override
  String get osdLockButtonDescription =>
      'ದೀರ್ಘಕಾಲ ಒತ್ತಿದರೆ ಸ್ಪರ್ಶ ಇನ್‌ಪುಟ್ ಅನ್ನು ನಿರ್ಬಂಧಿಸುವ ಲಾಕ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get playerSwipeGestures => 'Volume and Brightness Swipes';

  @override
  String get playerSwipeGesturesDescription =>
      'Slide up or down on the player to change brightness on the left and volume on the right';

  @override
  String get invertGestureIndicators => 'Invert Gesture Indicators';

  @override
  String get invertGestureIndicatorsDescription =>
      'Place brightness and volume visual indicators on same or opposite side of screen from swipe';

  @override
  String get gestureIndicatorSame => 'Same';

  @override
  String get gestureIndicatorInverted => 'Inverted';

  @override
  String get osdButtons => 'Player Buttons';

  @override
  String get osdButtonsDescription => 'Choose which buttons the player shows';

  @override
  String get osdButtonsSectionDescription =>
      'Playback controls are always shown. Everything below is up to you, and each kind of device keeps its own list.';

  @override
  String get detailButtons => 'Action Buttons';

  @override
  String get detailButtonsDescription =>
      'Choose which buttons the details screen shows';

  @override
  String get detailButtonsSectionDescription =>
      'Play is always first and the locked buttons are always shown. Everything else is up to you, and each kind of device keeps its own list.';

  @override
  String get actionButtonsOnScreen => 'Action Buttons on Screen';

  @override
  String get actionButtonsOnScreenDescription =>
      'Customize how many action buttons appear before folding into the More Actions menu.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (Theme Default)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Play only)';

  @override
  String get actionButtonsOnScreenAll => 'All (Horizontal Scroll)';

  @override
  String get detailMetadata => 'Metadata Row';

  @override
  String get detailMetadataDescription =>
      'Choose and reorder what metadata the details screen shows';

  @override
  String get detailMetadataSectionDescription =>
      'Turn metadata items on or off, and arrange the order they appear on the details screen. Each kind of device keeps its own list.';

  @override
  String get detailMetadataYear => 'Release Year';

  @override
  String get detailMetadataParentalRating => 'Parental Rating';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Runtime & Seasons';

  @override
  String get detailMetadataStatus => 'Series Status';

  @override
  String get detailMetadataStatusSubtitle =>
      'Shows whether the series is continuing, ended, or returning';

  @override
  String get detailMetadataGenres => 'Genres';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr Availability';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Shows request and media availability status from Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Upcoming Episodes';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Uses Sonarr and TMDB to show upcoming release dates';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choose which parts of the Details screen to show';

  @override
  String get detailSectionsScreenDescription =>
      'Only the sections the current Details screen style can show are listed. Hiding one hides it in every style that has it.';

  @override
  String get detailSectionGroupHeader => 'Header';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Person pages';

  @override
  String get detailSectionGroupCollection => 'Collection pages';

  @override
  String get detailSectionGroupOther => 'Other';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle => 'Shows the title as text when off';

  @override
  String get detailSectionTagline => 'Tagline';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Version badge';

  @override
  String get detailSectionUpNext => 'Next Up';

  @override
  String get detailSectionLyrics => 'Lyrics';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Also on collection pages';

  @override
  String get detailSectionCrew => 'Directors & writers';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapters';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'More Like This';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Also similar albums and artists';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'On episode pages';

  @override
  String get detailSectionMediaInfo => 'Media info';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, streams and Direct Play check';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & tags';

  @override
  String get detailSectionSeerrStats => 'Stats';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Recommendations';

  @override
  String get detailSectionSeerrSimilar => 'Similar titles';

  @override
  String get detailSectionSeerrCollection => 'Collection banner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Appearances';

  @override
  String get detailSectionSeerrPersonCrew => 'Crew credits';

  @override
  String get detailSectionPersonPagesSubtitle => 'On person pages';

  @override
  String get detailSectionBiography => 'Biography';

  @override
  String get detailSectionBirthplace => 'Birthplace';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Guest appearances';

  @override
  String get detailSectionMusicVideos => 'Music videos';

  @override
  String get detailSectionPlaylistOrder => 'Playlist order';

  @override
  String get detailSectionBookGenres => 'Book genres';

  @override
  String get detailSectionPhotoExif => 'Photo details';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Next: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Today';

  @override
  String get upcomingEpisodeTomorrow => 'Tomorrow';

  @override
  String get moveUp => 'Move Up';

  @override
  String get moveDown => 'Move Down';

  @override
  String get buttonOrderHint =>
      'Use the arrows to change the order. On a remote, left and right move the highlighted button. Switching one off drops it below the rest.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Orientation Lock';

  @override
  String get fullscreen => 'Fullscreen';

  @override
  String get audioBehavior => 'ಆಡಿಯೋ ಬಿಹೇವಿಯರ್';

  @override
  String get downmixToStereo => 'ಸ್ಟಿರಿಯೊಗೆ ಡೌನ್ಮಿಕ್ಸ್ ಮಾಡಿ';

  @override
  String get defaultAudioLanguage => 'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೊ ಭಾಷೆ';

  @override
  String get fallbackAudioLanguage => 'ಪರ್ಯಾಯ ಆಡಿಯೋ ಭಾಷೆ';

  @override
  String get preferDefaultAudioTrack =>
      'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferDefaultAudioTrackDescription =>
      'ಸ್ಥಳೀಯ ಡಬ್‌ಗಿಂತ ಮೂಲ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

  @override
  String get preferAudioDescription =>
      'ಆಡಿಯೋ ವಿವರಣೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferAudioDescriptionDescription =>
      'ಸಾಮಾನ್ಯ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗಿಂತ ಆಡಿಯೋ ವಿವರಣೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

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
  String get settingsAudioFallbackCodec => 'ಆಡಿಯೋ ಪರ್ಯಾಯ ಕೊಡೆಕ್';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'ಮೂಲ ಸ್ಟ್ರೀಮ್ ಅನ್ನು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಲು ಅಥವಾ ಪಾಸ್‌ಥ್ರೂ ಮಾಡಲು ಸಾಧ್ಯವಾಗದಿದ್ದಾಗ ಬಹು-ಚಾನೆಲ್ ಆಡಿಯೋವನ್ನು ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಲು ಗುರಿ ಸ್ವರೂಪವನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'ಸ್ವಯಂ ಪತ್ತೆ\n(ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(ಡೀಫಾಲ್ಟ್)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ಸ್ಟೀರಿಯೋ ಮಾತ್ರ)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ದಕ್ಷ)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(ನಷ್ಟರಹಿತ)';

  @override
  String get settingsMaxAudioChannels => 'ಗರಿಷ್ಠ ಆಡಿಯೋ ಚಾನೆಲ್‌ಗಳು';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'ನಿಮ್ಮ ಆಡಿಯೋ ಸೆಟಪ್‌ನ ಗರಿಷ್ಠ ಚಾನೆಲ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ. ಈ ಮಿತಿಯನ್ನು ಮೀರಿದ ಬಹು-ಚಾನೆಲ್ ಸ್ಟ್ರೀಮ್‌ಗಳು ಡೌನ್‌ಮಿಕ್ಸ್ ಅಥವಾ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಆಗುತ್ತವೆ.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ಸ್ವಯಂ ಪತ್ತೆ\n(ಹಾರ್ಡ್‌ವೇರ್ ಡೀಫಾಲ್ಟ್)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 ಮೊನೊ';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ಸ್ಟೀರಿಯೋ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 ಕ್ವಾಡ್ರಾಫೋನಿಕ್';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 ಸರೌಂಡ್';

  @override
  String get settingsAudioPassthroughAdvanced => 'ಪಾಸ್‌ಥ್ರೂ (ಸುಧಾರಿತ)';

  @override
  String get settingsAudioCodecPassthrough => 'ಕೊಡೆಕ್ ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'ನಿಮ್ಮ AVR ಅಥವಾ HDMI ಸಿಂಕ್ ಬೆಂಬಲಿಸುವ ಸ್ವರೂಪಗಳನ್ನು ಮಾತ್ರ ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS ಕೋರ್ ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioPassthroughMode => 'Passthrough';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'How compressed surround sound reaches your TV or receiver.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Disabled (always decode on this device)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (match detected device support)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manual (choose formats below)';

  @override
  String get settingsAudioPassthroughOutput => 'Passthrough Output';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Who packs bitstreams for the HDMI link. Try the app packer if passthrough is silent or glitchy on this device.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatic, system packer (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec => 'App packer (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Mix all decoded audio down to two channels.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, including Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Bitstream DTS-HD, including DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, including Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsDetectedAudioCapabilities => 'ಪತ್ತೆಯಾದ ಆಡಿಯೋ ಸಾಮರ್ಥ್ಯಗಳು';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ಇನ್ನೂ ಯಾವುದೇ ರನ್‌ಟೈಮ್ ಸಾಮರ್ಥ್ಯ ಸ್ನ್ಯಾಪ್‌ಶಾಟ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get settingsAudioRouteLabel => 'ಮಾರ್ಗ';

  @override
  String get settingsAudioDecodeLabel => 'ಡಿಕೋಡ್';

  @override
  String get settingsAudioPassthroughLabel => 'ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioHdRoute => 'HD ಆಡಿಯೋ ಮಾರ್ಗ';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ಸ್ಪೀಕರ್';

  @override
  String get settingsAudioRouteHeadphones => 'ಹೆಡ್‌ಫೋನ್‌ಗಳು';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

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
    return '$valueಸೆ';
  }

  @override
  String get mediaQueuing => 'ಮಾಧ್ಯಮ ಕ್ಯೂಯಿಂಗ್';

  @override
  String get autoQueueNextEpisodes => 'ಮುಂದಿನ ಸಂಚಿಕೆಗಳಲ್ಲಿ ಸ್ವಯಂ-ಸರದಿ';

  @override
  String get stillWatchingPrompt => 'ಇನ್ನೂ ಪ್ರಾಂಪ್ಟ್ ವೀಕ್ಷಿಸುತ್ತಿದೆ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes ಸಂಚಿಕೆಗಳ ನಂತರ / $hoursಗಂ';
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
  String get subtitleDownloadLanguages => 'Subtitle Download Languages';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Languages to search when downloading subtitles, up to 5. Auto searches one language picked from your default subtitle language or the video.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Preferred Secondary Subtitle Language';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳಿಲ್ಲ ಎಂಬುದಕ್ಕೆ ಡೀಫಾಲ್ಟ್';

  @override
  String get turnOffSubtitlesByDefault =>
      'ಡೀಫಾಲ್ಟ್ ಆಗಿ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get subtitleSize => 'ಉಪಶೀರ್ಷಿಕೆ ಗಾತ್ರ';

  @override
  String get primarySubtitleSlot => 'Primary Track';

  @override
  String get secondarySubtitleSlot => 'Secondary Track';

  @override
  String get secondarySubtitleTrack => 'Secondary Subtitles';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return 'Decrease $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Increase $setting';
  }

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
  String get subtitleMode => 'ಉಪಶೀರ್ಷಿಕೆ ಮೋಡ್';

  @override
  String get subtitleModeFlagged => 'ಫ್ಲ್ಯಾಗ್ ಮಾಡಲಾದ';

  @override
  String get subtitleModeAlways => 'ಯಾವಾಗಲೂ';

  @override
  String get subtitleModeForeign => 'ವಿದೇಶಿ';

  @override
  String get subtitleModeForced => 'ಫೋರ್ಸ್ಡ್';

  @override
  String get subtitleModeFlaggedDescription =>
      'ಮಾಧ್ಯಮ ಫೈಲ್‌ನ ಮೆಟಾಡೇಟಾದಲ್ಲಿ \"default\" ಅಥವಾ \"forced\" ಎಂದು ಆಂತರಿಕವಾಗಿ ಫ್ಲ್ಯಾಗ್ ಮಾಡಲಾದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeAlwaysDescription =>
      'ವಿಡಿಯೋ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಲೋಡ್ ಮಾಡಿ ತೋರಿಸುತ್ತದೆ.';

  @override
  String get subtitleModeForeignDescription =>
      'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್ ವಿದೇಶಿ ಭಾಷೆಯಲ್ಲಿದ್ದರೆ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಆನ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeForcedDescription =>
      'ಫೋರ್ಸ್ಡ್ ಮೆಟಾಡೇಟಾ ಫ್ಲ್ಯಾಗ್‌ನೊಂದಿಗೆ ಸ್ಪಷ್ಟವಾಗಿ ಟ್ಯಾಗ್ ಮಾಡಲಾದ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಮಾತ್ರ ಲೋಡ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeNoneDescription =>
      'ಸ್ವಯಂಚಾಲಿತ ಉಪಶೀರ್ಷಿಕೆ ಲೋಡಿಂಗ್ ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get fallbackSubtitleLanguage => 'ಪರ್ಯಾಯ ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get subtitleStream => 'ಉಪಶೀರ್ಷಿಕೆ ಸ್ಟ್ರೀಮ್';

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
  String get semiTransparentWhite => 'Semi-transparent White';

  @override
  String get lightGray => 'Light Gray';

  @override
  String get darkGray => 'Dark Gray';

  @override
  String get blue => 'Blue';

  @override
  String get magenta => 'Magenta';

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
    return '$profile ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿದೆ.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ಸ್ಥಳೀಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು $profile ಪ್ರೊಫೈಲ್‌ಗೆ ಸಿಂಕ್ ಮಾಡಲಾಗಿದೆ.';
  }

  @override
  String get syncing => 'ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String resetProfileTitle(String profile) {
    return 'Reset $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'This deletes the $profile profile from the server and puts every synced setting on this device back to its default.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'This deletes every saved profile from the server and puts every synced setting on this device back to its default.';

  @override
  String profileReset(String profile) {
    return 'Reset $profile profile to defaults.';
  }

  @override
  String get resetRatingsTitle => 'Reset ratings?';

  @override
  String get resetRatingsDescription =>
      'This puts every ratings setting back to its default, including which sources show and the order they appear in.';

  @override
  String get ratingsReset => 'Reset ratings to defaults.';

  @override
  String failedToResetProfile(String profile) {
    return 'Failed to reset $profile profile.';
  }

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'ಸರ್ವರ್‌ನಲ್ಲಿ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get reportDownloadsActivitySubtitle =>
      'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಿದ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಸರ್ವರ್ ನಿರ್ವಾಹಕರು ನೋಡಲು ಅನುಮತಿಸಿ';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'ಟೂಲ್‌ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರಿಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'ನ್ಯಾವ್‌ಬಾರ್ ಲೇಬಲ್‌ಗಳನ್ನು ಯಾವಾಗಲೂ ವಿಸ್ತರಿಸಿ';

  @override
  String get showSeerrButton => 'Seerr ಬಟನ್ ತೋರಿಸಿ';

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
  String get mergeRecentRowsByType => 'Merge Recent Rows by Type';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combine separate libraries of the same type for Recently Added and Recently Released home rows.';

  @override
  String get libraryView => 'Library View';

  @override
  String get libraryStyle => 'Video Library Style';

  @override
  String get libraryStyleDescription =>
      'Classic is the original header with icon buttons. Modern puts search and labeled sort, group and filter buttons in one bar. Docked moves the controls and the letters into a side panel.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classic is the original header with icon buttons. Modern adds labeled sort, group and filter chips under the search. Docked keeps the controls in a bar at the bottom of the screen.';

  @override
  String get libraryStyleClassic => 'Classic';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Docked';

  @override
  String get bookLibraryStyle => 'Book Library Style';

  @override
  String get bookLibraryStyleDescription =>
      'Classic is the original shelves under a featured title. Reading Room leads with what you\'re reading on large cards. Bookstore browses the whole library in a grid.';

  @override
  String get bookLibraryStyleClassic => 'Classic';

  @override
  String get bookLibraryStyleReadingRoom => 'Reading Room';

  @override
  String get bookLibraryStyleBookstore => 'Bookstore';

  @override
  String get musicLibraryStyle => 'Music Library Style';

  @override
  String get musicLibraryStyleDescription =>
      'Classic is the original rows under a Jump Back In card. Quick Access starts with a grid of your recent albums and playlists. Immersive leads with the album you\'re listening to.';

  @override
  String get musicLibraryStyleClassic => 'Classic';

  @override
  String get musicLibraryStyleQuickAccess => 'Quick Access';

  @override
  String get musicLibraryStyleImmersive => 'Immersive';

  @override
  String get jumpBackIn => 'Jump Back In';

  @override
  String get yourPlaylists => 'Your Playlists';

  @override
  String get fromThisAlbum => 'From This Album';

  @override
  String get searchMusic => 'Search Music';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count series',
      one: '1 series',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in progress';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Browse all $count titles',
      one: 'Browse 1 title',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Search books';

  @override
  String get libraryShowLabel => 'Show';

  @override
  String get libraryAToZ => 'A to Z';

  @override
  String get libraryJumpToLetter => 'Jump to letter';

  @override
  String get groupItemsIntoCollections => 'ಐಟಂಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get hideCollectionAssociatedItems =>
      'ಲೈಬ್ರರಿಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಸಂಗ್ರಹಣೆಗೆ ಸಂಬಂಧಿಸಿದ ಲೈಬ್ರರಿ ಐಟಂಗಳನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'ಲೈಬ್ರರಿ ಗುಂಪುಗೊಳಿಸುವಿಕೆ ಸೂಚನೆ';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'ಈ ಸೆಟ್ಟಿಂಗ್ ಅನ್ನು ಬಳಸಲು, ನಿಮ್ಮ Jellyfin ಅಥವಾ Emby ಸರ್ವರ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಲೈಬ್ರರಿಯ ಪ್ರದರ್ಶನ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಅಡಿಯಲ್ಲಿ \"Group movies into collections\" ಮತ್ತು/ಅಥವಾ \"Group shows into collections\" ಲೈಬ್ರರಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಸಕ್ರಿಯಗೊಂಡಿವೆ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ.';

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
  String get libraryOrder => 'Library Order';

  @override
  String get libraryOrderSubtitle => 'Choose the order of your libraries';

  @override
  String get libraryOrderDescription =>
      'Your libraries appear in this order on My Media, the recently added rows and the navigation bar. The order is saved to your server account, so other apps you sign in to use it too.';

  @override
  String get libraryOrderTvHint =>
      'Press left or right to move the highlighted library.';

  @override
  String get libraryOrderSaveFailed => 'Couldn\'t save the library order';

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
    return '$count ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ';
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
  String get mediaBarMode => 'ಮೀಡಿಯಾ ಬಾರ್ ಶೈಲಿ';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD ನಡುವೆ ಆಯ್ಕೆಮಾಡಿ ಅಥವಾ ಮಾಧ್ಯಮ ಬಾರ್ ಅನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ಆಫ್';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'ಮೀಡಿಯಾ ಬಾರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showFeaturedContentSlideshow =>
      'ಮುಖಪುಟದಲ್ಲಿ ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ ಸ್ಲೈಡ್‌ಶೋ ತೋರಿಸಿ';

  @override
  String get contentType => 'ವಿಷಯದ ಪ್ರಕಾರ';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerAudio => 'ಟ್ರೇಲರ್ ಆಡಿಯೋ';

  @override
  String get enableTrailerAudio =>
      'ಮೀಡಿಯಾ ಬಾರ್‌ನಲ್ಲಿ ಟ್ರೇಲರ್‌ಗಳಿಗೆ ಆಡಿಯೋ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'ಇತ್ತೀಚಿನ ಮಾಧ್ಯಮ';

  @override
  String get recentlyReleased => 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾಗಿದೆ';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'ಡೀಫಾಲ್ಟ್‌ಗಳಿಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get homeRowPosterSize => 'ಹೋಮ್ ರೋ ಪೋಸ್ಟರ್ ಗಾತ್ರ';

  @override
  String get configureImageTypeForEachRow =>
      'ಪ್ರತಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾದ ಹೋಮ್ ಸಾಲಿಗೆ ಚಿತ್ರದ ಪ್ರಕಾರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'ವಿಲೀನವನ್ನು ಮುಂದುವರಿಸಿ ವೀಕ್ಷಣೆ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String get combineBothRows => 'ಎರಡೂ ಸಾಲುಗಳನ್ನು ಒಂದೇ ಹೋಮ್ ವಿಭಾಗಕ್ಕೆ ಸೇರಿಸಿ';

  @override
  String get continueWatchingDefaultAction => 'Default Action';

  @override
  String get continueWatchingDefaultActionDescription =>
      'What selecting a Continue Watching or Next Up item does';

  @override
  String get goToDetailsScreen => 'Go to Details';

  @override
  String get playImmediately => 'Play immediately';

  @override
  String get nextUpMaxDays => 'Max days in Next Up';

  @override
  String get nextUpMaxDaysDescription =>
      'How long a show stays in Next Up after you last watched it';

  @override
  String daysValue(int days) {
    return '$days days';
  }

  @override
  String get fullScreenRows => 'ವಿಸ್ತರಿಸಿದ ಹೋಮ್ ಸಾಲುಗಳು';

  @override
  String get fullScreenRowsDescription =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಪ್ರತಿ ಪರದೆಗೆ 1 ಸಾಲಿಗೆ ಮಿತಿಗೊಳಿಸಿ';

  @override
  String get homeRowsPadding => 'Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

  @override
  String get perRowSettings => 'ಪ್ರತಿ ಸಾಲಿನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get autoLogin => 'ಸ್ವಯಂ ಲಾಗಿನ್';

  @override
  String get lastUser => 'ಕೊನೆಯ ಬಳಕೆದಾರ';

  @override
  String get currentUser => 'ಪ್ರಸ್ತುತ ಬಳಕೆದಾರ';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
    return '$minutes ನಿಮಿ';
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
  String get displayClockDuringScreensaver =>
      'ಸ್ಕ್ರೀನ್ ಸೇವರ್ ಸಮಯದಲ್ಲಿ ಗಡಿಯಾರವನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get clockModeStatic => 'ಸ್ಥಿರ';

  @override
  String get clockModeBouncing => 'ಪುಟಿಯುವ';

  @override
  String get screensaverGeneralSettings => 'General Settings';

  @override
  String get screensaverVisualComponents => 'Visual Components';

  @override
  String get screensaverLibraryContent => 'Library Content';

  @override
  String get screensaverBackdrop => 'Backdrop';

  @override
  String get screensaverBackdropBlack => 'Black';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calm';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Additional Component';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin Logo';

  @override
  String get screensaverComponentRunner => 'Runner';

  @override
  String get screensaverComponentMovement => 'Component Movement';

  @override
  String get screensaverComponentPosition => 'Component Position';

  @override
  String get screensaverComponentSize => 'Component Size';

  @override
  String get screensaverSourceLibrariesDefault => 'All (Default)';

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
  String get trakt => 'Trakt';

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
  String get pluginDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get pluginNotDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿಲ್ಲ';

  @override
  String get pluginNotDetectedDescription =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಪ್ರಸ್ತುತ ಪತ್ತೆಯಾಗಿಲ್ಲ. ಸ್ಥಳೀಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಇನ್ನೂ ತಮ್ಮ ಉಳಿಸಿದ ಮೌಲ್ಯಗಳನ್ನು ಅಥವಾ ಅಂತರ್ನಿರ್ಮಿತ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಬಳಸುತ್ತವೆ.';

  @override
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => 'Connected';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connected, version $version';
  }

  @override
  String get pluginSyncOn => 'Sync on';

  @override
  String get pluginSyncOff => 'Sync off';

  @override
  String get syncProfileDescription =>
      'This device syncs with the profile you pick until you pick another.';

  @override
  String get profileAppliesEverywhere => 'Applies everywhere';

  @override
  String get profileOverridesGlobal => 'Overrides Global';

  @override
  String get profileThisDevice => 'This device';

  @override
  String get profileLoad => 'Load';

  @override
  String get profileLoadSubtitle => 'Server to this device';

  @override
  String get profileSaveSubtitle => 'This device to server';

  @override
  String resetNamedProfile(String profile) {
    return 'Reset $profile Profile';
  }

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr ಡಿಸ್ಕವರಿ ಸಾಲುಗಳು';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'ಸಾಲುಗಳನ್ನು ಡೀಫಾಲ್ಟ್‌ಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get enableSeerr => 'Seerr ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showSeerrInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್‌ನಲ್ಲಿ Seerr ತೋರಿಸಿ (ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಅಗತ್ಯವಿದೆ)';

  @override
  String get seerrUnavailable =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್‌ನ Seerr ಬೆಂಬಲ ನಿಷ್ಕ್ರಿಯಗೊಂಡಿರುವುದರಿಂದ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get nsfwFilter => 'NSFW ಫಿಲ್ಟರ್';

  @override
  String get hideAdultContent => 'ಫಲಿತಾಂಶಗಳಲ್ಲಿ ವಯಸ್ಕ ವಿಷಯವನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get showMissingCollectionItems => 'Show Missing Collection Items';

  @override
  String get showMissingCollectionItemsDesc =>
      'Include missing items on Collection pages';

  @override
  String get showSeerrAvailabilityBadges => 'Show Seerr Availability Badges';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Show season availability badges on media details pages';

  @override
  String get seerrNotificationsSection => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get seerrNotifyNewRequestsTitle => 'ಹೊಸ ವಿನಂತಿ ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'ಯಾರಾದರೂ ವಿನಂತಿ ಸಲ್ಲಿಸಿದಾಗ ನನಗೆ ತಿಳಿಸಿ';

  @override
  String get seerrNotifyLibraryAddedTitle => 'ವಿನಂತಿ ನವೀಕರಣಗಳು';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'ಅನುಮೋದಿಸಲಾಗಿದೆ, ತಿರಸ್ಕರಿಸಲಾಗಿದೆ ಮತ್ತು ನಿಮ್ಮ ಲೈಬ್ರರಿಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get seerrNotifyIssuesTitle => 'ಸಮಸ್ಯೆ ನವೀಕರಣಗಳು';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'ಹೊಸ ಸಮಸ್ಯೆಗಳು, ಪ್ರತ್ಯುತ್ತರಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'ಇವರಾಗಿ ಲಾಗಿನ್ ಆಗಿದ್ದೀರಿ: $username';
  }

  @override
  String get discoverRows => 'Seerr ಡಿಸ್ಕವರಿ ಪುಟ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr ಮುಖಪುಟದಲ್ಲಿ ನೋಡಲು ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ. ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಕಸ್ಟಮ್ ಕ್ರಮವು Moonbase ನೊಂದಿಗೆ ಸಿಂಕ್ ಆಗುತ್ತದೆ.';

  @override
  String get discoverRowsDescription =>
      'Seerr ಮುಖಪುಟದಲ್ಲಿ ನೋಡಲು ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ. ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಕಸ್ಟಮ್ ಕ್ರಮವು Moonbase ನೊಂದಿಗೆ ಸಿಂಕ್ ಆಗುತ್ತದೆ.';

  @override
  String get enabled => 'ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get hidden => 'ಮರೆಮಾಡಲಾಗಿದೆ';

  @override
  String get aboutTitle => 'ಬಗ್ಗೆ';

  @override
  String versionValue(String version) {
    return 'ಆವೃತ್ತಿ $version';
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
    return 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ: v$version';
  }

  @override
  String get updateNotifications => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get showWhenUpdatesAvailable => 'ನವೀಕರಣಗಳು ಲಭ್ಯವಿದ್ದಾಗ ತೋರಿಸಿ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version ಲಭ್ಯವಿದೆ';
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
  String get featuredContentAppearance => 'ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ, ನೋಟ';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ಮಿತಿ';

  @override
  String get clearImageCache => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get imageCacheCleared => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ';

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
  String get seerrDownloading => 'Downloading';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Downloading · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '$percent%';
  }

  @override
  String seerrDownloadingPercent(int percent) {
    return 'ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ · $percent%';
  }

  @override
  String get seerrImportingStatus => 'ಆಮದು ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String itemsCount(int count) {
    return '$count ಐಟಂಗಳು';
  }

  @override
  String get seerrSettings => 'Seerr ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get requestMore => 'ಇನ್ನಷ್ಟು ವಿನಂತಿಸಿ';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'ವಿನಂತಿ';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡಿ';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Moonfin ನಲ್ಲಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return '$name ವಿನಂತಿಸಿದ್ದಾರೆ';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
    return '\"$title\" ಗಾಗಿ ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" ಗಾಗಿ $count ವಿನಂತಿಗಳನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
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
    return 'ಬಜೆಟ್: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'ಆದಾಯ: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type ವಿನಂತಿಸಿ';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get allSeasons => 'ಎಲ್ಲಾ ಋತುಗಳು';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get appearances => 'ಕಾಣಿಸಿಕೊಂಡ ಕೃತಿಗಳು';

  @override
  String get crewSection => 'ಸಿಬ್ಬಂದಿ';

  @override
  String ageValue(int age) {
    return 'ವಯಸ್ಸು $age';
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
  String get failedStatus => 'ವಿಫಲವಾಗಿದೆ';

  @override
  String get processingStatus => 'ಪ್ರಕ್ರಿಯೆಗೊಳ್ಳುತ್ತಿದೆ';

  @override
  String modifiedByName(String name) {
    return '$name ಮಾರ್ಪಡಿಸಿದ್ದಾರೆ';
  }

  @override
  String get completedStatus => 'ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String get requestErrorDuplicate => 'ಈ ಶೀರ್ಷಿಕೆಯನ್ನು ಈಗಾಗಲೇ ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String get requestErrorQuota => 'ವಿನಂತಿ ಮಿತಿ ತಲುಪಿದೆ';

  @override
  String get requestErrorBlocklisted => 'ಈ ಶೀರ್ಷಿಕೆ ನಿರ್ಬಂಧಿತ ಪಟ್ಟಿಯಲ್ಲಿದೆ';

  @override
  String get requestErrorNoSeasons => 'ವಿನಂತಿಸಲು ಯಾವುದೇ ಸೀಸನ್‌ಗಳು ಉಳಿದಿಲ್ಲ';

  @override
  String get requestErrorPermission => 'ಈ ವಿನಂತಿಯನ್ನು ಮಾಡಲು ನಿಮಗೆ ಅನುಮತಿ ಇಲ್ಲ';

  @override
  String get seerrRequestsTitle => 'ವಿನಂತಿಗಳು';

  @override
  String get seerrIssuesTitle => 'ಸಮಸ್ಯೆಗಳು';

  @override
  String get sortNewest => 'ಹೊಸದು';

  @override
  String get sortLastModified => 'ಕೊನೆಯದಾಗಿ ಮಾರ್ಪಡಿಸಿದ್ದು';

  @override
  String get noIssues => 'ಯಾವುದೇ ಸಮಸ್ಯೆಗಳಿಲ್ಲ';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit ಚಲನಚಿತ್ರ ವಿನಂತಿಗಳಲ್ಲಿ $remaining ಬಾಕಿ ಉಳಿದಿವೆ';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit ಸೀಸನ್ ವಿನಂತಿಗಳಲ್ಲಿ $remaining ಬಾಕಿ ಉಳಿದಿವೆ';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name ನ ಭಾಗ';
  }

  @override
  String get viewCollection => 'ಸಂಗ್ರಹಣೆಯನ್ನು ವೀಕ್ಷಿಸಿ';

  @override
  String get requestCollection => 'ಸಂಗ್ರಹಣೆಯನ್ನು ವಿನಂತಿಸಿ';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total ಚಲನಚಿತ್ರಗಳು · $available ಲಭ್ಯವಿದೆ';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count ಚಲನಚಿತ್ರಗಳನ್ನು ವಿನಂತಿಸಿ';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total ರಲ್ಲಿ $current ವಿನಂತಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count ಚಲನಚಿತ್ರಗಳನ್ನು ವಿನಂತಿಸಲಾಗಿದೆ';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total ಚಲನಚಿತ್ರಗಳಲ್ಲಿ $ok ಅನ್ನು ವಿನಂತಿಸಲಾಗಿದೆ';
  }

  @override
  String get collectionAllRequested =>
      'ಎಲ್ಲಾ ಚಲನಚಿತ್ರಗಳು ಈಗಾಗಲೇ ಲಭ್ಯವಿವೆ ಅಥವಾ ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String get reportIssue => 'ಸಮಸ್ಯೆಯನ್ನು ವರದಿ ಮಾಡಿ';

  @override
  String get issueTypeVideo => 'ವಿಡಿಯೋ';

  @override
  String get issueTypeAudio => 'ಆಡಿಯೋ';

  @override
  String get whatsWrong => 'ಏನು ತಪ್ಪಾಗಿದೆ?';

  @override
  String get allEpisodes => 'ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳು';

  @override
  String get episode => 'ಸಂಚಿಕೆ';

  @override
  String get openStatus => 'ತೆರೆದಿದೆ';

  @override
  String get resolvedStatus => 'ಪರಿಹರಿಸಲಾಗಿದೆ';

  @override
  String get resolveAction => 'ಪರಿಹರಿಸಿ';

  @override
  String get reopenAction => 'ಮತ್ತೆ ತೆರೆಯಿರಿ';

  @override
  String reportedByName(String name) {
    return '$name ವರದಿ ಮಾಡಿದ್ದಾರೆ';
  }

  @override
  String commentsCount(int count) {
    return '$count ಕಾಮೆಂಟ್‌ಗಳು';
  }

  @override
  String get addComment => 'ಕಾಮೆಂಟ್ ಸೇರಿಸಿ';

  @override
  String get deleteIssueConfirm => 'ಈ ಸಮಸ್ಯೆಯನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get submitReport => 'ವರದಿಯನ್ನು ಸಲ್ಲಿಸಿ';

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
  String get seasonsLabel => 'ಸೀಸನ್‌ಗಳು';

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
  String get edit => 'ಸಂಪಾದಿಸಿ';

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
  String get search => 'ಹುಡುಕಿ';

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
  String get stop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get streaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get time => 'ಸಮಯ';

  @override
  String get trickplay => 'Trickplay';

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
  String get adminDrawerLibraries => 'ಲೈಬ್ರರಿಗಳು';

  @override
  String get adminDrawerDisplay => 'ಪ್ರದರ್ಶನ';

  @override
  String get adminDrawerMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminDrawerNfo => 'NFO ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminDrawerTranscoding => 'ಟ್ರಾನ್ಸ್ಕೋಡಿಂಗ್';

  @override
  String get adminDrawerResume => 'ಮುಂದುವರಿಸಿ';

  @override
  String get adminDrawerStreaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminPremiereNoteLiveTv =>
      'Live TV needs Emby Premiere. Without it the server doesn\'t import channels or record anything.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore needs Emby Premiere once its trial ends.';

  @override
  String get adminGeneralRunAtStartup => 'Run the server at startup';

  @override
  String get adminGeneralLaunchWebApp =>
      'Open the web app in a browser when the server starts';

  @override
  String get adminGeneralBannerText => 'Home screen banner text';

  @override
  String get adminGeneralBannerTextHelp =>
      'Shown to every user on their home screen';

  @override
  String get adminGeneralSectionMaintenance => 'Maintenance mode';

  @override
  String get adminGeneralMaintenanceMode =>
      'Put the server into maintenance mode';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Users only see the maintenance message.';

  @override
  String get adminGeneralMaintenanceMessage => 'Maintenance message';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Leave it blank for a general message in each user\'s language.';

  @override
  String get adminGeneralSectionUpdates => 'Automatic updates';

  @override
  String get adminGeneralAutoUpdate => 'Update the server automatically';

  @override
  String get adminGeneralAutoRestart =>
      'Restart automatically to apply updates';

  @override
  String get adminGeneralAutoRestartHelp =>
      'The server only restarts while no users are active.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'After a system event ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Needs Emby Premiere after a 14-day free trial';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby backs up through its Backup & Restore plugin.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'The Backup & Restore plugin isn\'t installed. Install it from the plugin catalog to back up this server.';

  @override
  String get adminEmbyBackupNow => 'Back up now';

  @override
  String get adminEmbyFullBackup => 'Full backup';

  @override
  String get adminEmbyLightBackups => 'Database backups';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Restore $name? It replaces this server\'s libraries, settings, users and passwords, and the server shuts down when it\'s done. You may need to start it again yourself.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Restore the server ID';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Turn this off when you restore the same backup onto more than one server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'The restore is done and the server is shutting down. Start it again if it doesn\'t restart by itself.';

  @override
  String get adminHiddenRemotely =>
      'Hide from login screens when connected remotely';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Hide from login screens on devices they\'ve never signed in on';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limits how many videos this user can play at once.';

  @override
  String get adminUnlimited => 'Unlimited';

  @override
  String get adminAutoRemoteQuality => 'Auto remote quality (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Used remotely when the player is set to auto quality. Leave empty to detect it.';

  @override
  String get adminAllowCameraUpload => 'Allow camera upload';

  @override
  String get adminAllowSubtitleDownloading => 'Allow subtitle downloading';

  @override
  String get adminAllowMediaConversion => 'Allow media conversion';

  @override
  String get adminAllowSyncTranscoding =>
      'Allow downloads that need transcoding';

  @override
  String get adminAllowSharingPersonalItems =>
      'Allow sharing playlists with other users';

  @override
  String get adminAllowPreferenceAccess =>
      'Allow changing their own password and profile image';

  @override
  String get adminTagMode => 'Tag mode';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect username or email';

  @override
  String get adminEmbyConnectHelp =>
      'Lets this user sign in from any Emby app without knowing the server address.';

  @override
  String get adminEmbyConnectLink => 'Link';

  @override
  String get adminEmbyConnectUnlink => 'Unlink';

  @override
  String get adminEmbyConnectLinked => 'Linked to Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invitation sent. The link is made once they accept it.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect link removed';

  @override
  String get adminEmbyConnectNotFound =>
      'No Emby Connect account has that username or email.';

  @override
  String get adminLibImportPlaylists => 'Import playlist files';

  @override
  String get adminLibExcludeFromSearch => 'Exclude from global search';

  @override
  String get adminLibForcedSubtitlesOnly => 'Download forced subtitles only';

  @override
  String get adminLibImportCollections =>
      'Import collections from metadata downloaders';

  @override
  String get adminLibThumbnailInterval => 'Preview thumbnail interval';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Every $count seconds';
  }

  @override
  String get adminLibThumbnailAtChapters => 'At chapter markers';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Save preview thumbnails into media folders';

  @override
  String get adminLibrarySectionMarkers => 'Intro markers';

  @override
  String get adminLibIntroDetection => 'Detect intros';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Detect intros during the library scan';

  @override
  String get adminProviderEmbyGuide => 'Emby Guide Data';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Select a lineup. If none are listed, check the postal code. Lineups need Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Wake the server for recordings';

  @override
  String get adminDrawerLiveTvChannels => 'Live TV Channels';

  @override
  String get adminPageDescLiveTvChannels =>
      'Turn channels on and off and set their order';

  @override
  String get adminLiveTvChannelsEmpty =>
      'No channels yet. They show up here once a tuner is set up and the server has imported its channels.';

  @override
  String get adminTranscodingHwaAdvanced => 'Advanced';

  @override
  String get adminTranscodingHwaHelp =>
      'Advanced lets you pick and order the hardware codecs.';

  @override
  String get adminTranscodingHwDecoders => 'Preferred hardware decoders';

  @override
  String get adminTranscodingHwEncoders => 'Preferred hardware encoders';

  @override
  String get adminTranscodingTempPathHelp =>
      'Where the transcoder keeps its working files. Leave it empty to use the server\'s data folder.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Slows transcoding down once enough is buffered, to lower CPU use.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Raises the volume when audio is downmixed. 1 keeps the original volume.';

  @override
  String get adminTranscodingFontExtraction =>
      'Allow font extraction on the fly';

  @override
  String get adminTranscodingMaxResolution => 'Max transcoding resolution';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'A limit on every transcode, whatever quality the app asks for.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping in software transcodes';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping in hardware transcodes';

  @override
  String get adminTranscodingToneMapHelp =>
      'Keeps HDR video from looking dim and washed out when it\'s transcoded.';

  @override
  String get adminNetworkingLocalAddress => 'Local IP address';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'The local address the server gives to apps. Leave it empty to detect it automatically.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS is handled by a reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'External domain';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'A domain or dynamic DNS name for remote connections, without the protocol or port. A custom certificate needs it.';

  @override
  String get adminNetworkingUpnp => 'Enable automatic port mapping';

  @override
  String get adminNetworkingUpnpHelp =>
      'Tries to map the public port to the local port with UPnP. Some routers don\'t support it.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Read proxy headers for client addresses';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Uses headers like X-Forwarded-For to find each client\'s address. Only turn this on behind a reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Only when they hold remote addresses';

  @override
  String get adminNetworkingIpv4Only => 'Use IPv4 for outgoing requests';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'For when metadata providers and other services can\'t be reached over IPv6.';

  @override
  String get adminOnePerLine => 'One per line';

  @override
  String get adminStreamingStreamLimit => 'Max simultaneous video streams';

  @override
  String get adminStreamingStreamLimitHelp =>
      'How many videos can play at once across the server. 0 means no limit.';

  @override
  String get adminSyncJobsConversions => 'Conversion jobs';

  @override
  String get adminSyncJobsDownloads => 'Download jobs';

  @override
  String get adminSyncJobsEmpty => 'No jobs';

  @override
  String get adminSyncJobCancel => 'Cancel job';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Cancel $name and remove it from the list?';
  }

  @override
  String get adminSyncJobConverting => 'Converting';

  @override
  String get adminSyncJobReady => 'Ready to transfer';

  @override
  String get adminSyncJobTransferring => 'Transferring';

  @override
  String get adminSyncJobCompletedWithError => 'Completed with errors';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Database';

  @override
  String get adminPageDescDatabase => 'Cache size and upkeep';

  @override
  String get adminDatabaseWarning =>
      'These are advanced options. Leave them at their defaults unless you have a reason to change them.';

  @override
  String get adminDatabaseCacheSize => 'Database cache size (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'How much of each database file the server keeps in memory. More can make the server faster. Takes effect after a restart.';

  @override
  String get adminDatabaseOptimize =>
      'Optimize the database when the server shuts down';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Usually this does nothing, but now and then it runs an analysis that helps the server\'s queries. Shutdowns can take longer.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analysis row limit';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'About how many rows of each index the optimize step reads. More rows work better but can slow shutdowns.';

  @override
  String get adminDatabaseVacuum => 'Vacuum the database on the next startup';

  @override
  String get adminDatabaseVacuumHelp =>
      'Rebuilds the database file so it takes up the least space, which can help performance. The server can\'t be used while it runs and shows no progress, so don\'t force it closed. It turns itself back off after that startup.';

  @override
  String get adminDrawerCinemaIntros => 'Cinema Intros';

  @override
  String get adminPageDescCinemaIntros => 'Trailers and intros before playback';

  @override
  String get adminCinemaIntrosPlayBefore => 'Play intros before';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Include trailers from new and upcoming movies';

  @override
  String get adminCinemaIntrosOlder => 'Include trailers from older movies';

  @override
  String get adminCinemaIntrosLibrary =>
      'Include trailers from movies in my libraries';

  @override
  String get adminCinemaIntrosLibraryHelp => 'Needs local trailers set up.';

  @override
  String get adminCinemaIntrosCount => 'Number of trailers to play';

  @override
  String get adminCinemaIntrosParental => 'Smart parental control';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Only picks trailers rated the same as or lower than what\'s being watched.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Only play intros before unwatched content';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Only play trailers similar to what\'s being watched';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Based on shared genres, tags, studios and so on.';

  @override
  String get adminCinemaIntrosCustom => 'Custom intros';

  @override
  String get adminCinemaIntrosCustomPath => 'Custom intros folder';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'A folder of videos. One is picked at random and plays after the trailers.';

  @override
  String get adminCinemaIntrosCodecPath => 'Codec intros folder';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'A folder of videos. One whose file name matches the video codec, audio codec, audio profile or a tag plays before the main feature.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To and the DLNA server';

  @override
  String get adminDlnaPlayTo => 'Enable DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby can find devices on your network and control them remotely.';

  @override
  String get adminDlnaServer => 'Enable the DLNA server';

  @override
  String get adminDlnaServerHelp =>
      'Lets the server stream media to DLNA devices.';

  @override
  String get adminDlnaDefaultUser => 'Default user';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Whose libraries connected devices see. A device profile can override it.';

  @override
  String get adminDlnaDebugLog => 'Enable DLNA debug logging';

  @override
  String get adminDlnaDebugLogHelp =>
      'Makes large log files. Only turn it on while troubleshooting.';

  @override
  String get adminDrawerCameraUpload => 'Camera Upload';

  @override
  String get adminPageDescCameraUpload => 'Where photos from phones are saved';

  @override
  String get adminCameraUploadPath => 'Camera upload folder';

  @override
  String get adminCameraUploadPathHelp =>
      'Leave it blank to use the default folder. A custom folder also has to be added as a library.';

  @override
  String get adminCameraUploadSubfolders => 'Make a subfolder for each device';

  @override
  String get adminDrawerConversions => 'Conversions';

  @override
  String get adminPageDescConversions => 'Converted media and downloads';

  @override
  String get adminConversionsTempPath => 'Temporary file folder';

  @override
  String get adminConversionsTempPathHelp =>
      'Where media is kept while it\'s being converted.';

  @override
  String get adminConversionsFullSpeed => 'Convert at full speed';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Conversions run slowly by default to keep the load down.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'License status and key';

  @override
  String get adminPremiereActive => 'Premiere is active on this server.';

  @override
  String get adminPremiereInactive => 'This server has no Premiere key.';

  @override
  String get adminPremiereKeyInvalid =>
      'A key is set but isn\'t active. It may be mistyped or expired.';

  @override
  String get adminPremiereCurrentKey => 'Current key';

  @override
  String get adminPremiereNewKey => 'New key';

  @override
  String get adminPremiereNewKeyHint =>
      'Paste the key from your Emby Premiere email.';

  @override
  String get adminPremiereSaveKey => 'Save key';

  @override
  String get adminPremiereRemoveKey => 'Remove key';

  @override
  String get adminPremiereKeyRejected =>
      'Emby saved the key but didn\'t accept it.';

  @override
  String get adminPremiereLoadFailed => 'Couldn\'t load the Premiere status';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere required';

  @override
  String get embyPremiereRequiredBody =>
      'This needs an active Emby Premiere subscription on the server.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'This needs an active Emby Premiere subscription. Emby keeps the setting but won\'t use it until Premiere is active.';

  @override
  String get embyPremiereLearnMore => 'Learn more';

  @override
  String get embyPremiereSaveAnyway => 'Save anyway';

  @override
  String get embyPremiereEnterKey => 'Enter key';

  @override
  String get adminPremiereNote =>
      'Needs Emby Premiere. The server keeps this setting but won\'t use it until Premiere is active.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Artist';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Artist';

  @override
  String get adminExternalIdTypeOtherArtist => 'Other Artist';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release Group';

  @override
  String get adminExternalIdTypeBook => 'Book';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hardware acceleration can be unstable on some systems. Keep the operating system and video drivers up to date, and set this back to None if video stops playing.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Changes to metadata settings apply to new content. To update existing content, refresh it from its detail page or refresh the library.';

  @override
  String get adminLibFetcherSettings => 'Fetcher settings';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Image options for $type';
  }

  @override
  String get adminLibFetchImages => 'Fetch images';

  @override
  String get adminLibMaxBackdrops => 'Maximum number of backdrops per item';

  @override
  String get adminLibMinBackdropWidth => 'Minimum backdrop download width';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Box';

  @override
  String get adminImageTypeBoxRear => 'Box (back)';

  @override
  String get adminImageTypeDisc => 'Disc';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Media details';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'e.g. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Original language';

  @override
  String get adminMetadataFieldDateAdded => 'Date added';

  @override
  String get adminMetadataFieldArtists => 'Artists';

  @override
  String get adminMetadataFieldAlbumArtists => 'Album artists';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Series name';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Episode number';

  @override
  String get adminMetadataFieldSeasonNumber => 'Season number';

  @override
  String get adminMetadataFieldTrackNumber => 'Track number';

  @override
  String get adminMetadataFieldDiscNumber => 'Disc number';

  @override
  String get adminMetadataFieldAirTime => 'Air time';

  @override
  String get adminMetadataFieldRuntime => 'Runtime in minutes';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Place of birth';

  @override
  String get adminMetadataFieldBirthDate => 'Birth date';

  @override
  String get adminMetadataFieldBirthYear => 'Birth year';

  @override
  String get adminMetadataFieldDeathDate => 'Death date';

  @override
  String get adminMetadataFieldAspectRatio => 'Original aspect ratio';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Airs before season';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Airs after season';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Airs before episode';

  @override
  String get adminMetadataNamesHelp =>
      'Separate several names with a semicolon.';

  @override
  String get adminMetadataSectionRatings => 'Ratings';

  @override
  String get adminMetadataItemLocked =>
      'This item\'s metadata is locked. Unlock it before you identify it.';

  @override
  String get adminMetadataNameOrIdRequired => 'Enter a name or an external ID.';

  @override
  String get adminLibMetadataReaders => 'Metadata readers';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Similar item providers: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Media segment providers';

  @override
  String get adminLibEnableLibrary => 'Enable the library';

  @override
  String get adminLibEnableLibraryHelp =>
      'Disabling the library hides it from all user views.';

  @override
  String get adminLibSaveLyricsWithMedia => 'Save lyrics into media folders';

  @override
  String get adminLibUseCustomTagDelimiters => 'Use custom tag delimiter';

  @override
  String get adminLibCustomTagDelimiters => 'Custom tag delimiter';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Characters to treat as delimiters that separate tags.';

  @override
  String get adminLibDelimiterWhitelist => 'Delimiter whitelist';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Items to leave out of tag splitting, one per line.';

  @override
  String get adminLibDownloadLanguages => 'Download languages';

  @override
  String get adminLibraryFolderRequired =>
      'Add at least one folder to this library.';

  @override
  String get adminRenameLibraryWarning =>
      'Renaming a library loses all of its metadata. Proceed with caution.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Remove the library \"$name\"? Files on disk are not deleted.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'These media locations will be removed from the library:';

  @override
  String get adminRefreshMode => 'Refresh mode';

  @override
  String get adminRefreshModeScan => 'Scan for new and updated files';

  @override
  String get adminRefreshModeMissing => 'Search for missing metadata';

  @override
  String get adminReplaceTrickplayImages => 'Replace existing trickplay images';

  @override
  String get adminRefreshDialogHelp =>
      'Metadata is refreshed based on the settings and internet services enabled in the dashboard.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown of $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuners and guide';

  @override
  String get adminLiveTvTabRecordings => 'Recordings';

  @override
  String get adminLiveTvAddTuner => 'Add tuner device';

  @override
  String get adminLiveTvEditTuner => 'Edit tuner device';

  @override
  String get adminLiveTvTunerType => 'Tuner type';

  @override
  String get adminLiveTvDetectDevices => 'Detect my devices';

  @override
  String get adminLiveTvNoNewDevices => 'No new devices found';

  @override
  String get adminLiveTvDrmNote => 'Channels with DRM will not be imported.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner saved';

  @override
  String get adminLiveTvDeleteTuner => 'Delete tuner device';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Are you sure you want to delete this tuner device?';

  @override
  String get adminLiveTvDeleteProvider => 'Delete guide provider';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Are you sure you want to delete this guide provider?';

  @override
  String get adminLiveTvProviderSaved => 'Guide provider saved';

  @override
  String get adminLiveTvAddProvider => 'Add provider';

  @override
  String get adminLiveTvRefreshGuide => 'Refresh guide data';

  @override
  String get adminLiveTvMapChannels => 'Map channels';

  @override
  String get adminLiveTvNoTunerChannels => 'No tuner channels found';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'A path or URL to an XMLTV file. The server reads it and checks it for updates. You are responsible for creating and updating the file.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Create an account at $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Sign in';

  @override
  String get adminLiveTvSdLineup => 'Lineup';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Select a lineup. If none are listed, check your username, password and postal code.';

  @override
  String get adminLiveTvGuideDays => 'Number of days of guide data to download';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'More days let you schedule further ahead and see more listings, but the download takes longer. Automatic picks a value from the number of channels.';

  @override
  String get adminLiveTvRecordingPath => 'Default recording path';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Where recordings are saved. If empty, the server\'s program data folder is used.';

  @override
  String get adminLiveTvStartWhenPossible => 'Start when possible';

  @override
  String get adminLiveTvStopWhenPossible => 'Stop when possible';

  @override
  String get adminLiveTvMinutesBefore => 'minutes before';

  @override
  String get adminLiveTvMinutesAfter => 'minutes after';

  @override
  String get adminLiveTvSectionGuide => 'Guide data';

  @override
  String get adminLiveTvSectionDefaultRecording => 'Default recording settings';

  @override
  String get adminLiveTvSectionMetadata => 'Recording metadata';

  @override
  String adminUserLastActivity(String time) {
    return 'Last activity $time';
  }

  @override
  String get adminCurrentPassword => 'Current password';

  @override
  String get adminChannelAccess => 'Channel access';

  @override
  String get adminDeviceAccess => 'Device access';

  @override
  String get adminDeleteFromAllLibraries => 'All libraries';

  @override
  String get adminUserDisabledBanner =>
      'This user is disabled. Turn off Disabled under Permissions to let them sign in again.';

  @override
  String get adminNewPasswordEmpty => 'New password cannot be empty';

  @override
  String get adminScheduleStartBeforeEnd =>
      'The start time must be before the end time';

  @override
  String get adminDashboardAlerts => 'Alerts';

  @override
  String get adminSessionGoHome => 'Go to home screen';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Direct streaming';

  @override
  String get adminPlayMethodDirectPlay => 'Direct playing';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Warning';

  @override
  String get adminLogLevelError => 'Error';

  @override
  String get adminLogLevelCritical => 'Critical';

  @override
  String get adminLogLevelNone => 'None';

  @override
  String get adminActivityAllUsers => 'All users';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Last ran $time, taking $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Failed';

  @override
  String get adminTaskResultCancelled => 'Cancelled';

  @override
  String get adminTaskResultAborted => 'Aborted by server shutdown';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Delete task trigger';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Are you sure you want to delete this task trigger?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Every $minutes minutes';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Every $hours hours';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minutes';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours hours';
  }

  @override
  String get adminTimeLimitHours => 'Time limit (hours)';

  @override
  String get adminTranscodingDecodingFor => 'Enable hardware decoding for';

  @override
  String get adminTranscodingThreadCountHelp =>
      'The most threads a transcode can use. Fewer threads lower CPU use but may be too slow for smooth playback.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg path';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'The FFmpeg the server runs. It is set on the server, not here.';

  @override
  String get adminTranscodingAudioSeek => 'Audio seek strategy';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'How the server handles audio when you seek in an HLS stream.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Trim copied audio';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcode audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimum audiobook resume (minutes)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Audiobooks stopped before this time count as unplayed.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Audiobook remaining minutes to resume';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Audiobooks stopped with less than this many minutes left count as played.';

  @override
  String get adminBrandingSplashSection => 'Splash screen';

  @override
  String get adminBrandingSectionWebClient => 'Web client';

  @override
  String get adminBrandingSplashSizeHint =>
      'Custom images should be in a 16x9 aspect ratio at a minimum size of 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress => 'Server address settings';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS settings';

  @override
  String get adminNetworkingSectionRemoteAccess => 'Remote access settings';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP protocols';

  @override
  String get adminNetworkingSectionDiscovery => 'Network discovery';

  @override
  String get adminNetworkingSectionFirewall => 'Firewall and proxy settings';

  @override
  String get adminNetworkingLocalHttpPort => 'Local HTTP port number';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'The TCP port number for the HTTP server.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Listen on the HTTPS port. A valid certificate must also be set for this to take effect.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Local HTTPS port number';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'The TCP port number for the HTTPS server.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Adds a subdirectory to the server URL, for example https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Bind to local network address';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Overrides the local IP address of the HTTP server. Leave it empty to bind to all addresses. A change needs a restart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP addresses or IP/netmask entries of networks treated as local for bandwidth and remote access limits. Leave it empty to treat all RFC1918 addresses as local.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP addresses or host names of the proxies in front of this server. Needed to read X-Forwarded-For headers. A change needs a restart.';

  @override
  String get adminNetworkingCustomCertPath => 'Custom SSL certificate path';

  @override
  String get adminNetworkingCertPathHelp =>
      'Path to a PKCS #12 file with a certificate and private key, for TLS on a custom domain.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Enter the password if your certificate needs one.';

  @override
  String get adminNetworkingAllowRemote =>
      'Allow remote connections to this server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'When off, all remote connections are blocked.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP addresses or IP/netmask entries of remote networks. Leave it empty to allow every remote address.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Remote IP address filter mode';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'The public port mapped to the local HTTP port.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'The public port mapped to the local HTTPS port.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => 'Enable auto discovery';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Lets apps find this server on UDP port 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Use the same published server URI for internal and external access';

  @override
  String get adminNetworkingPublishedUri => 'Published server URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Overrides the URI the server gives out, based on the interface or the client IP address.';

  @override
  String get adminNetworkingInternalUri => 'Internal URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Published server URI for internal access.';

  @override
  String get adminNetworkingExternalUri => 'External URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Published server URI for external access.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Other published URIs';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URIs for one subnet or interface, written as subnet=URI.';

  @override
  String get adminBackupsHelp =>
      'Create and restore snapshots of your server. They can include the database, metadata, subtitles and trickplay images.';

  @override
  String get adminBackupDisclaimer =>
      'Depending on the size of your library, the backup can take a while.';

  @override
  String get adminBackupTasksWarningTitle => 'Scheduled tasks are running';

  @override
  String get adminBackupTasksWarning =>
      'Stop these tasks or wait for them to finish before you create a backup.';

  @override
  String get adminBackupArchiveNotFound =>
      'The server could not find this backup archive.';

  @override
  String get adminRestoreInProgress => 'Restore in progress';

  @override
  String get adminRestoreWaitingForServer =>
      'Waiting for the server to come back.';

  @override
  String get adminRestoreSucceeded => 'Restore completed';

  @override
  String get adminLogWatch => 'Watch';

  @override
  String get adminLogStopWatching => 'Stop watching';

  @override
  String get adminPluginInstallConfirmTitle => 'Confirm plugin installation';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installing a third party plugin carries risks. It may contain unstable or malicious code, and it can change at any time. Only install plugins from authors you trust, and know what they can do, such as query outside services, slow down library scans or add background work.';

  @override
  String get adminGroupOverview => 'Overview';

  @override
  String get adminGroupLibrary => 'Library';

  @override
  String get adminGroupPlayback => 'Playback';

  @override
  String get adminGroupPeople => 'People';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Admin areas';

  @override
  String get adminPagesLabel => 'Pages';

  @override
  String get adminPageDescDashboard =>
      'Server health, sessions and recent activity';

  @override
  String get adminPageDescAnalytics => 'Library sizes, codecs and formats';

  @override
  String get adminPageDescActivity => 'Everything that happened on the server';

  @override
  String get adminPageDescTasks => 'Scans, cleanups and their triggers';

  @override
  String get adminPageDescLibraries =>
      'Folders, scanners and metadata fetchers';

  @override
  String get adminPageDescDisplay => 'How libraries show to users';

  @override
  String get adminPageDescMetadata => 'Default language, country and images';

  @override
  String get adminPageDescNfo => 'Kodi NFO reading and saving';

  @override
  String get adminPageDescLiveTv => 'Tuners, guide data and recordings';

  @override
  String get adminPageDescTranscoding =>
      'Hardware acceleration, encoders, tone mapping';

  @override
  String get adminPageDescResume => 'When items count as started or played';

  @override
  String get adminPageDescStreaming => 'Remote bitrate limit';

  @override
  String get adminPageDescTrickplay => 'Seek preview thumbnails';

  @override
  String get adminPageDescUsers => 'Accounts, access and parental control';

  @override
  String get adminPageDescDevices => 'Signed in devices and their names';

  @override
  String get adminPageDescApiKeys => 'Keys for apps and scripts';

  @override
  String get adminPageDescSettings =>
      'Server name, language, paths, performance';

  @override
  String get adminPageDescBranding =>
      'Login message, custom CSS, splash screen';

  @override
  String get adminPageDescNetworking => 'Ports, HTTPS, LAN and remote access';

  @override
  String get adminPageDescPlugins => 'Installed plugins and the catalog';

  @override
  String get adminPageDescRepositories => 'Where plugins come from';

  @override
  String get adminPageDescBackups => 'Create and restore server backups';

  @override
  String get adminPageDescLogs => 'Server log files';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Search $count settings';
  }

  @override
  String get adminSearchNoResults => 'No settings match';

  @override
  String get adminSearchClear => 'Clear search';

  @override
  String get adminUnsavedChanges => 'Unsaved changes';

  @override
  String get adminDiscard => 'Discard';

  @override
  String get adminLeaveTitle => 'Discard unsaved changes?';

  @override
  String get adminLeaveMessage =>
      'The changes on this page haven\'t been saved yet.';

  @override
  String get adminKeepEditing => 'Keep editing';

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
    return 'ಪ್ಲಗಿನ್ ನವೀಕರಣಗಳು ಲಭ್ಯವಿವೆ: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'ಮರುಪ್ರಾರಂಭ ಅಗತ್ಯವಿರುವ ಪ್ಲಗಿನ್‌ಗಳು: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'ವಿಫಲವಾದ ನಿಗದಿತ ಕಾರ್ಯಗಳು: $count';
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
  String get adminLibraryScanStarted => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String errorGeneric(String error) {
    return 'ದೋಷ: $error';
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
    return 'ಆದೇಶ ವಿಫಲವಾಗಿದೆ: $error';
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
  String get volume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get actions => 'ಕ್ರಿಯೆಗಳು';

  @override
  String get videoCodec => 'ವೀಡಿಯೊ ಕೋಡೆಕ್';

  @override
  String get audioCodec => 'ಆಡಿಯೋ ಕೋಡೆಕ್';

  @override
  String get hwAccel => 'HW ವೇಗವರ್ಧನೆ';

  @override
  String get completion => 'ಪೂರ್ಣಗೊಳಿಸುವಿಕೆ';

  @override
  String get adminClearDates => 'ದಿನಾಂಕಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get adminActivitySeverityAll => 'ಎಲ್ಲಾ ತೀವ್ರತೆಗಳು';

  @override
  String get adminActivityDateRange => 'ದಿನಾಂಕ ವ್ಯಾಪ್ತಿ';

  @override
  String adminActivityLoadFailed(String error) {
    return 'ಚಟುವಟಿಕೆ ಲಾಗ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಸಾಧನವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminDeleteDevice => 'ಸಾಧನವನ್ನು ಅಳಿಸಿ';

  @override
  String get adminDeviceDeleted => 'ಸಾಧನವನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ಸಾಧನವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' ಸಾಧನವನ್ನು ತೆಗೆದುಹಾಕುವುದೇ? ಬಳಕೆದಾರರು ಈ ಸಾಧನದಲ್ಲಿ ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ.';
  }

  @override
  String get adminDeleteAllDevices => 'ಎಲ್ಲಾ ಸಾಧನಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕುವುದೇ? ಪ್ರಭಾವಿತ ಬಳಕೆದಾರರು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ. ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಸಾಧನಕ್ಕೆ ಇದು ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ.';
  }

  @override
  String get adminDevicesDeletedAll => 'ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'ಕೆಲವು ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ; $count ಅನ್ನು ತೆಗೆದುಹಾಕಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';
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
    return 'ಸ್ಕ್ಯಾನ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRenameLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಮರುಹೆಸರಿಸಿ';

  @override
  String get adminNewName => 'ಹೊಸ ಹೆಸರು';

  @override
  String adminLibraryRenamed(String name) {
    return 'ಲೈಬ್ರರಿಯನ್ನು \"$name\" ಎಂದು ಮರುಹೆಸರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminRenameFailed(String error) {
    return 'ಮರುಹೆಸರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminDeleteLibrary => 'ಲೈಬ್ರರಿ ಅಳಿಸಿ';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" ಲೈಬ್ರರಿಯನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ಲೈಬ್ರರಿಯನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'ಪಥವನ್ನು ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRemovePath => 'ಮಾರ್ಗವನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ಈ ಲೈಬ್ರರಿಯಿಂದ \"$path\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'ಪಥವನ್ನು ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
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
  String get adminPreferredMetadataLanguage => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminMetadataLanguageHint => 'ಉದಾ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'ಮೆಟಾಡೇಟಾ ದೇಶದ ಕೋಡ್';

  @override
  String get adminMetadataCountryHint => 'ಉದಾ. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'ಪಥಗಳು';

  @override
  String get adminLibraryTabOptions => 'ಆಯ್ಕೆಗಳು';

  @override
  String get adminLibraryTabDownloaders => 'ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String get adminLibMetadataSavers => 'ಮೆಟಾಡೇಟಾ ಸೇವರ್‌ಗಳು';

  @override
  String get adminLibSubtitleDownloaders => 'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String get adminLibLyricDownloaders => 'ಸಾಹಿತ್ಯ ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'ಮೆಟಾಡೇಟಾ ಡೌನ್‌ಲೋಡರ್‌ಗಳು: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'ಚಿತ್ರ ಫೆಚರ್‌ಗಳು: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'ಈ ಸರ್ವರ್ ಈ ಲೈಬ್ರರಿ ಪ್ರಕಾರಕ್ಕೆ ಯಾವುದೇ ಡೌನ್‌ಲೋಡರ್‌ಗಳನ್ನು ಒದಗಿಸುವುದಿಲ್ಲ.';

  @override
  String get adminLibrarySectionGeneral => 'ಸಾಮಾನ್ಯ';

  @override
  String get adminLibrarySectionMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminLibrarySectionEmbedded => 'ಎಂಬೆಡೆಡ್ ಮಾಹಿತಿ';

  @override
  String get adminLibrarySectionSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get adminLibrarySectionImages => 'ಚಿತ್ರಗಳು';

  @override
  String get adminLibrarySectionSeries => 'ಸರಣಿಗಳು';

  @override
  String get adminLibrarySectionMusic => 'ಸಂಗೀತ';

  @override
  String get adminLibrarySectionMovies => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get adminLibRealtimeMonitor =>
      'ನೈಜ-ಸಮಯದ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ಫೈಲ್ ಬದಲಾವಣೆಗಳನ್ನು ಪತ್ತೆ ಮಾಡಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಿ.';

  @override
  String get adminLibEnablePhotos => 'ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibSaveLocalMetadata =>
      'ಕಲಾಕೃತಿಯನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibRefreshInterval => 'ಸ್ವಯಂಚಾಲಿತ ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್';

  @override
  String get adminLibRefreshNever => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String get adminLibDefault => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get adminLibDisplayTitle => 'ಪ್ರದರ್ಶನ';

  @override
  String get adminLibDisplaySection => 'ಲೈಬ್ರರಿ ಪ್ರದರ್ಶನ';

  @override
  String get adminLibFolderView =>
      'ಸರಳ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳನ್ನು ತೋರಿಸಲು ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆಯನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibSpecialsInSeasons =>
      'ವಿಶೇಷ ಸಂಚಿಕೆಗಳನ್ನು ಅವು ಪ್ರಸಾರವಾದ ಸೀಸನ್‌ಗಳಲ್ಲಿ ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibGroupMovies => 'ಚಲನಚಿತ್ರಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get adminLibGroupShows => 'ಶೋಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get adminLibExternalSuggestions => 'ಸಲಹೆಗಳಲ್ಲಿ ಬಾಹ್ಯ ವಿಷಯವನ್ನು ತೋರಿಸಿ';

  @override
  String get adminLibDateAddedSection => 'ಸೇರಿಸಿದ ದಿನಾಂಕದ ವರ್ತನೆ';

  @override
  String get adminLibDateAddedLabel => 'ಸೇರಿಸಿದ ದಿನಾಂಕವನ್ನು ಇಲ್ಲಿಂದ ಬಳಸಿ';

  @override
  String get adminLibDateAddedImport => 'ಲೈಬ್ರರಿಗೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿದ ದಿನಾಂಕ';

  @override
  String get adminLibDateAddedFile => 'ಫೈಲ್ ರಚಿಸಲಾದ ದಿನಾಂಕ';

  @override
  String get adminLibMetadataTitle => 'ಮೆಟಾಡೇಟಾ ಮತ್ತು ಚಿತ್ರಗಳು';

  @override
  String get adminLibMetadataLangSection => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminLibChaptersSection => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get adminLibDummyChapterDuration => 'ಡಮ್ಮಿ ಅಧ್ಯಾಯದ ಅವಧಿ (ಸೆಕೆಂಡುಗಳು)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'ಅಧ್ಯಾಯಗಳಿಲ್ಲದ ಮಾಧ್ಯಮಕ್ಕಾಗಿ ರಚಿಸಲಾದ ಅಧ್ಯಾಯಗಳ ಉದ್ದ. ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು 0 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminLibChapterImageResolution => 'ಅಧ್ಯಾಯ ಚಿತ್ರದ ರೆಸಲ್ಯೂಶನ್';

  @override
  String get adminLibNfoTitle => 'NFO ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminLibNfoHelp =>
      'NFO ಮೆಟಾಡೇಟಾ Kodi ಮತ್ತು ಅಂತಹುದೇ ಕ್ಲೈಂಟ್‌ಗಳೊಂದಿಗೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ. ಈ ಸೆಟ್ಟಿಂಗ್‌ಗಳು NFO ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸುವ ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಅನ್ವಯಿಸುತ್ತವೆ.';

  @override
  String get adminLibKodiUser =>
      'NFO ಫೈಲ್‌ಗಳಲ್ಲಿ ವೀಕ್ಷಣಾ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸಬೇಕಾದ ಬಳಕೆದಾರ';

  @override
  String get adminLibSaveImagePaths => 'NFO ಫೈಲ್‌ಗಳಲ್ಲಿ ಚಿತ್ರ ಪಥಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminLibPathSubstitution =>
      'NFO ಚಿತ್ರ ಪಥಗಳಿಗೆ ಪಥ ಬದಲಿಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart ಚಿತ್ರಗಳನ್ನು extrathumbs ಫೋಲ್ಡರ್‌ಗೆ ನಕಲಿಸಿ';

  @override
  String get adminLibNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ದಿನಗಳು';
  }

  @override
  String get adminLibEmbeddedTitles => 'ಎಂಬೆಡೆಡ್ ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'ಹೆಚ್ಚುವರಿಗಳಿಗೆ ಎಂಬೆಡೆಡ್ ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'ಎಂಬೆಡೆಡ್ ಸಂಚಿಕೆ ಮಾಹಿತಿಯನ್ನು ಬಳಸಿ';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminLibEmbeddedAllowAll => 'ಎಲ್ಲವನ್ನೂ ಅನುಮತಿಸಿ';

  @override
  String get adminLibEmbeddedAllowText => 'ಪಠ್ಯ ಮಾತ್ರ';

  @override
  String get adminLibEmbeddedAllowImage => 'ಚಿತ್ರ ಮಾತ್ರ';

  @override
  String get adminLibEmbeddedAllowNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆಗಳಿದ್ದರೆ ಡೌನ್‌ಲೋಡ್ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್ ಡೌನ್‌ಲೋಡ್ ಭಾಷೆಗೆ ಹೊಂದಿಕೆಯಾದರೆ ಡೌನ್‌ಲೋಡ್ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get adminLibRequirePerfectMatch =>
      'ನಿಖರವಾದ ಉಪಶೀರ್ಷಿಕೆ ಹೊಂದಾಣಿಕೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibChapterImageExtraction => 'ಅಧ್ಯಾಯ ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibChapterImagesDuringScan =>
      'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಸಮಯದಲ್ಲಿ ಅಧ್ಯಾಯ ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibTrickplayExtraction =>
      'trickplay ಚಿತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibTrickplayDuringScan =>
      'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಸಮಯದಲ್ಲಿ trickplay ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'trickplay ಚಿತ್ರಗಳನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'ಬಹು ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಹರಡಿರುವ ಸರಣಿಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ವಿಲೀನಗೊಳಿಸಿ';

  @override
  String get adminLibSeasonZeroName => 'ಸೀಸನ್ ಶೂನ್ಯದ ಪ್ರದರ್ಶನ ಹೆಸರು';

  @override
  String get adminLibLufsScan =>
      'ಆಡಿಯೋ ನಾರ್ಮಲೈಸೇಶನ್‌ಗಾಗಿ LUFS ಸ್ಕ್ಯಾನ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibPreferNonstandardArtist =>
      'ಪ್ರಮಾಣಿತವಲ್ಲದ ಕಲಾವಿದರ ಟ್ಯಾಗ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get adminLibAutoAddToCollection =>
      'ಚಲನಚಿತ್ರಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಿಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸೇರಿಸಿ';

  @override
  String get adminLibraryNameRequired => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ಲೈಬ್ರರಿ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLibraryName => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು';

  @override
  String get adminSelectedPaths => 'ಆಯ್ದ ಮಾರ್ಗಗಳು:';

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
    return '$name ಅವರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವುದೇ? ಅವರಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name ಅವರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸುವುದೇ? ಅವರು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬಹುದು.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ಬಳಕೆದಾರ ನೀತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಬಳಕೆದಾರರನ್ನು ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminCreateUser => 'ಬಳಕೆದಾರರನ್ನು ರಚಿಸಿ';

  @override
  String get adminPasswordOptional => 'ಪಾಸ್ವರ್ಡ್ (ಐಚ್ಛಿಕ)';

  @override
  String get adminUsernameRequired => 'ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿ ಇರುವಂತಿಲ್ಲ';

  @override
  String adminSaveFailed(String error) {
    return 'ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminPasswordsMismatch => 'ಪಾಸ್‌ವರ್ಡ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String adminFailed(String error) {
    return 'ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUserLoadFailed => 'ಬಳಕೆದಾರರನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

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
  String get adminEnableAllLibraryAccess =>
      'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

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
  String get adminEnableAllDevices =>
      'ಎಲ್ಲಾ ಸಾಧನಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableAllChannels =>
      'ಎಲ್ಲಾ ಚಾನಲ್‌ಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminParentalControl => 'ಪೋಷಕರ ನಿಯಂತ್ರಣ';

  @override
  String get adminMaxParentalRating => 'ಗರಿಷ್ಠ ಅನುಮತಿಸಲಾದ ಪೋಷಕರ ರೇಟಿಂಗ್';

  @override
  String get adminMaxParentalRatingHint =>
      'ಹೆಚ್ಚಿನ ರೇಟಿಂಗ್ ಇರುವ ವಿಷಯವನ್ನು ಈ ಬಳಕೆದಾರರಿಂದ ಮರೆಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get adminParentalRatingNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get adminBlockUnratedItems =>
      'ರೇಟಿಂಗ್ ಮಾಹಿತಿ ಇಲ್ಲದ ಅಥವಾ ಗುರುತಿಸಲಾಗದ ಐಟಂಗಳನ್ನು ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get adminUnratedBook => 'ಪುಸ್ತಕಗಳು';

  @override
  String get adminUnratedChannelContent => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get adminUnratedLiveTvChannel => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get adminUnratedMovie => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get adminUnratedMusic => 'ಸಂಗೀತ';

  @override
  String get adminUnratedTrailer => 'ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String get adminUnratedSeries => 'ಶೋಗಳು';

  @override
  String get adminAccessSchedules => 'ಪ್ರವೇಶ ವೇಳಾಪಟ್ಟಿಗಳು';

  @override
  String get adminAccessSchedulesHint =>
      'ಕೆಳಗಿನ ನಿಗದಿತ ಸಮಯದಲ್ಲಿ ಮಾತ್ರ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ. ಯಾವುದೇ ವೇಳಾಪಟ್ಟಿ ಹೊಂದಿಸದಿದ್ದಾಗ ಇಡೀ ದಿನ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get adminAddSchedule => 'ವೇಳಾಪಟ್ಟಿ ಸೇರಿಸಿ';

  @override
  String get adminScheduleDay => 'ದಿನ';

  @override
  String get adminScheduleStart => 'ಪ್ರಾರಂಭ';

  @override
  String get adminScheduleEnd => 'ಅಂತ್ಯ';

  @override
  String get adminDayEveryday => 'ಪ್ರತಿದಿನ';

  @override
  String get adminDayWeekday => 'ವಾರದ ದಿನ';

  @override
  String get adminDayWeekend => 'ವಾರಾಂತ್ಯ';

  @override
  String get adminDaySunday => 'ಭಾನುವಾರ';

  @override
  String get adminDayMonday => 'ಸೋಮವಾರ';

  @override
  String get adminDayTuesday => 'ಮಂಗಳವಾರ';

  @override
  String get adminDayWednesday => 'ಬುಧವಾರ';

  @override
  String get adminDayThursday => 'ಗುರುವಾರ';

  @override
  String get adminDayFriday => 'ಶುಕ್ರವಾರ';

  @override
  String get adminDaySaturday => 'ಶನಿವಾರ';

  @override
  String get adminAllowedTags => 'ಅನುಮತಿಸಲಾದ ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminAllowedTagsHint =>
      'ಈ ಟ್ಯಾಗ್‌ಗಳಿರುವ ವಿಷಯವನ್ನು ಮಾತ್ರ ತೋರಿಸಲಾಗುತ್ತದೆ. ಎಲ್ಲವನ್ನೂ ಅನುಮತಿಸಲು ಖಾಲಿ ಬಿಡಿ.';

  @override
  String get adminBlockedTags => 'ನಿರ್ಬಂಧಿಸಿದ ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminBlockedTagsHint =>
      'ಈ ಟ್ಯಾಗ್‌ಗಳಿರುವ ವಿಷಯವನ್ನು ಈ ಬಳಕೆದಾರರಿಂದ ಮರೆಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get adminAddTag => 'ಟ್ಯಾಗ್ ಸೇರಿಸಿ';

  @override
  String get adminAuthProvider => 'ದೃಢೀಕರಣ ಪೂರೈಕೆದಾರ';

  @override
  String get adminPasswordResetProvider => 'ಪಾಸ್‌ವರ್ಡ್ ಮರುಹೊಂದಿಸುವ ಪೂರೈಕೆದಾರ';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'ಲಾಕ್‌ಔಟ್‌ಗೂ ಮೊದಲು ಗರಿಷ್ಠ ವಿಫಲ ಲಾಗಿನ್ ಪ್ರಯತ್ನಗಳು';

  @override
  String get adminLoginAttemptsHint =>
      'ಡೀಫಾಲ್ಟ್‌ಗಾಗಿ 0 ಗೆ ಹೊಂದಿಸಿ, ಅಥವಾ ಲಾಕ್‌ಔಟ್ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು -1 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay ಪ್ರವೇಶ';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'ಗುಂಪುಗಳನ್ನು ರಚಿಸಲು ಮತ್ತು ಸೇರಲು ಅನುಮತಿಸಿ';

  @override
  String get adminSyncPlayJoin => 'ಗುಂಪುಗಳಿಗೆ ಸೇರಲು ಅನುಮತಿಸಿ';

  @override
  String get adminSyncPlayNone => 'ಪ್ರವೇಶವಿಲ್ಲ';

  @override
  String get adminContentDeletionFolders =>
      'ಇಲ್ಲಿಂದ ವಿಷಯ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminResetPasswordWarning =>
      'ಇದು ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ. ಬಳಕೆದಾರರು ಪಾಸ್‌ವರ್ಡ್ ಇಲ್ಲದೆ ಲಾಗ್ ಇನ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'ಸರ್ವರ್ HTTP $status ಅನ್ನು ಹಿಂತಿರುಗಿಸಿದೆ';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name ಅವರನ್ನು ಅಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಕೀ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಿಂದ ಕೀ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get adminRevokeApiKey => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name ಗಾಗಿ ಕೀಯನ್ನು ರದ್ದುಗೊಳಿಸುವುದೇ?';
  }

  @override
  String get adminApiKeyRevoked => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಲಾಗಿದೆ';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ಕೀಯನ್ನು ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಟೋಕನ್: $token\\nರಚಿಸಲಾಗಿದೆ: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'ಬ್ಯಾಕಪ್ ರಚಿಸಿ';

  @override
  String get adminBackupDatabase => 'ಡೇಟಾಬೇಸ್';

  @override
  String get adminBackupDatabaseAlways => 'ಯಾವಾಗಲೂ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get adminBackupMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminBackupSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get adminBackupTrickplay => 'Trickplay ಚಿತ್ರಗಳು';

  @override
  String get adminCreatingBackup => 'ಬ್ಯಾಕಪ್ ರಚಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get adminBackupCreated => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ಬ್ಯಾಕಪ್ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಲ್ಲಿ ಬ್ಯಾಕಪ್ ಮಾರ್ಗ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String adminBackupManifest(String name) {
    return 'ಮ್ಯಾನಿಫೆಸ್ಟ್: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'ಮ್ಯಾನಿಫೆಸ್ಟ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminConfirmRestore => 'ಮರುಸ್ಥಾಪನೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get adminRestoringBackup => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಮರುಸ್ಥಾಪಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String adminRestoreFailed(String error) {
    return 'ಬ್ಯಾಕಪ್ ಮರುಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return '$path ಗೆ ಉಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ಫೈಲ್ ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String get adminSearchInLog => 'ಲಾಗ್‌ನಲ್ಲಿ ಹುಡುಕಿ';

  @override
  String get adminNoMatchingLines => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ಕಾರ್ಯಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ಯಾವುದೇ ನಿಗದಿತ ಕಾರ್ಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoTasksMatchFilter =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗೆ ಯಾವುದೇ ಕಾರ್ಯಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String adminTaskStartFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ನಿಲ್ಲಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRunNow => 'ಈಗ ರನ್ ಮಾಡಿ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ಟ್ರಿಗರ್ ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ಟ್ರಿಗರ್ ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
  String get adminNoLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String adminHours(String hours) {
    return '$hours ಗಂಟೆ(ಗಳು)';
  }

  @override
  String get adminDayOfWeek => 'ವಾರದ ದಿನ';

  @override
  String get adminSearchPlugins => 'ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUninstallPlugin => 'ಅಸ್ಥಾಪಿಸು ಪ್ಲಗಿನ್';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\" ಅನ್ನು ಅಸ್ಥಾಪಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಅಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'ಪ್ಯಾಕೇಜ್ ಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoPluginsInstalled => 'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String adminInstallUpdate(String version) {
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'ಕ್ಯಾಟಲಾಗ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ನಂತರ \"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'ಅಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" ಅನ್ನು v$version ಗೆ ನವೀಕರಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminPluginNotFound => 'ಪ್ಲಗಿನ್ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminPluginVersion(String version) {
    return 'ಆವೃತ್ತಿ $version';
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
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ಅನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
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
  String get adminPlaybackLoadFailed =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

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
  String get adminTrickplayLoadFailed =>
      'trickplay ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

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
  String get adminBaseUrlHint => 'ಉದಾ. /jellyfin';

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
  String adminMetadataLoadFailed(String error) {
    return 'ಮೆಟಾಡೇಟಾ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRefreshMetadata => 'ಮೆಟಾಡೇಟಾವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get recursive => 'ಪುನರಾವರ್ತಿತ';

  @override
  String get adminReplaceAllMetadata => 'ಎಲ್ಲಾ ಮೆಟಾಡೇಟಾವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get adminMetadataRefreshRequested =>
      'ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್ ಮಾಡಲು ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ಯಾವುದೇ ರಿಮೋಟ್ ಹೊಂದಾಣಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminRemoteResults => 'ರಿಮೋಟ್ ಫಲಿತಾಂಶಗಳು';

  @override
  String get adminRemoteMetadataApplied => 'ರಿಮೋಟ್ ಮೆಟಾಡೇಟಾ ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'ರಿಮೋಟ್ ಹುಡುಕಾಟ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUpdateContentType => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get adminContentType => 'ವಿಷಯ ಪ್ರಕಾರ';

  @override
  String get adminContentTypeUpdated => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
    return '$imageType ಚಿತ್ರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ಬೆಂಬಲವಿಲ್ಲದ ಚಿತ್ರ ಸ್ವರೂಪ';

  @override
  String get adminImageReadFailed => 'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಿ';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminAllProviders => 'ಎಲ್ಲಾ ಪೂರೈಕೆದಾರರು';

  @override
  String get adminNoRemoteImages => 'ಯಾವುದೇ ದೂರಸ್ಥ ಚಿತ್ರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ಟ್ಯೂನರ್ ಅನ್ವೇಷಣೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U ಟ್ಯೂನರ್';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ಫೈಲ್ ಅಥವಾ URL';

  @override
  String get adminTunerIpAddress => 'ಟ್ಯೂನರ್ IP ವಿಳಾಸ';

  @override
  String get adminTunerFriendlyName => 'ಪ್ರದರ್ಶನ ಹೆಸರು';

  @override
  String get adminTunerUserAgent => 'ಬಳಕೆದಾರ ಏಜೆಂಟ್';

  @override
  String get adminTunerCount => 'ಏಕಕಾಲಿಕ ಸಂಪರ್ಕ ಮಿತಿ';

  @override
  String get adminTunerCountHelp =>
      'ಟ್ಯೂನರ್ ಒಂದೇ ಬಾರಿಗೆ ಅನುಮತಿಸುವ ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮ್‌ಗಳ ಸಂಖ್ಯೆ. ಅನಿಯಮಿತಕ್ಕೆ 0 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminTunerFallbackBitrate => 'ಪರ್ಯಾಯ ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್‌ರೇಟ್';

  @override
  String get adminTunerImportFavoritesOnly =>
      'ಮೆಚ್ಚಿನ ಚಾನೆಲ್‌ಗಳನ್ನು ಮಾತ್ರ ಆಮದು ಮಾಡಿ';

  @override
  String get adminTunerAllowHwTranscoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerAllowFmp4 =>
      'fMP4 ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಕಂಟೇನರ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerAllowStreamSharing => 'ಸ್ಟ್ರೀಮ್ ಹಂಚಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerEnableStreamLooping => 'ಸ್ಟ್ರೀಮ್ ಲೂಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTunerIgnoreDts => 'DTS ಅನ್ನು ನಿರ್ಲಕ್ಷಿಸಿ';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'ಸ್ಥಳೀಯ ಫ್ರೇಮ್ ದರದಲ್ಲಿ ಇನ್‌ಪುಟ್ ಓದಿ';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ಫೈಲ್ ಅಥವಾ URL';

  @override
  String get adminXmltvMoviePrefix => 'ಚಲನಚಿತ್ರ ಪೂರ್ವಪ್ರತ್ಯಯ';

  @override
  String get adminXmltvMovieCategories => 'ಚಲನಚಿತ್ರ ವರ್ಗಗಳು';

  @override
  String get adminXmltvCategoriesHelp =>
      'ಬಹು ವರ್ಗಗಳನ್ನು ಲಂಬ ಗೆರೆಯಿಂದ ಬೇರ್ಪಡಿಸಿ.';

  @override
  String get adminXmltvKidsCategories => 'ಮಕ್ಕಳ ವರ್ಗಗಳು';

  @override
  String get adminXmltvNewsCategories => 'ಸುದ್ದಿ ವರ್ಗಗಳು';

  @override
  String get adminXmltvSportsCategories => 'ಕ್ರೀಡಾ ವರ್ಗಗಳು';

  @override
  String get adminSdUsername => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get adminSdPassword => 'ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get adminSdCountry => 'ದೇಶ';

  @override
  String get adminSdCountrySelect => 'ದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get adminSdPostalCode => 'ಅಂಚೆ ಕೋಡ್';

  @override
  String get adminEnableAllTuners => 'ಎಲ್ಲಾ ಟ್ಯೂನರ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ಟ್ಯೂನರ್ ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ಪೂರೈಕೆದಾರರನ್ನು ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ಮಾರ್ಗ';

  @override
  String get adminMovieRecordingPath => 'ಚಲನಚಿತ್ರ ರೆಕಾರ್ಡಿಂಗ್ ಪಥ';

  @override
  String get adminGuideDaysAuto => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get adminRecordingPostProcessor => 'ನಂತರದ-ಸಂಸ್ಕರಣೆ ಅಪ್ಲಿಕೇಶನ್ ಪಥ';

  @override
  String get adminRecordingPostProcessorArgs =>
      'ನಂತರದ-ಸಂಸ್ಕಾರಕ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳು';

  @override
  String get adminSaveRecordingNfo => 'ರೆಕಾರ್ಡಿಂಗ್ NFO ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸಿ';

  @override
  String get adminSaveRecordingImages => 'ರೆಕಾರ್ಡಿಂಗ್ ಚಿತ್ರಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminLiveTvSectionPaths => 'ರೆಕಾರ್ಡಿಂಗ್ ಪಥಗಳು';

  @override
  String get adminLiveTvSectionPostProcessing => 'ನಂತರದ-ಸಂಸ್ಕರಣೆ';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
  String get adminGuideRefreshStarted => 'ಗೈಡ್ ಡೇಟಾ ರಿಫ್ರೆಶ್ ಪ್ರಾರಂಭವಾಗಿದೆ';

  @override
  String get adminGuideRefreshUnavailable =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಗೈಡ್ ರಿಫ್ರೆಶ್ ಕಾರ್ಯ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminNoListingProviders =>
      'ಯಾವುದೇ ಪಟ್ಟಿ ಒದಗಿಸುವವರನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

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
    return '$name ಬ್ಯಾಕಪ್ ಅನ್ನು ಈಗ ಮರುಸ್ಥಾಪಿಸುವುದೇ?';
  }

  @override
  String get adminBackupsTitle => 'ಬ್ಯಾಕಪ್‌ಗಳು';

  @override
  String get adminUnknownDate => 'ಅಜ್ಞಾತ ದಿನಾಂಕ';

  @override
  String get adminUnnamedBackup => 'ಹೆಸರಿಸದ ಬ್ಯಾಕಪ್';

  @override
  String get adminApply => 'ಅನ್ವಯಿಸಿ';

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
    return '$minutesನಿ ಹಿಂದೆ';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursಗಂ ಹಿಂದೆ';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysದಿ ಹಿಂದೆ';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count ಹೊಂದಾಣಿಕೆಗಳು';
  }

  @override
  String get adminLogViewerNoMatches => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String get adminMetadataEditorTitle => 'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಕ';

  @override
  String get adminMetadataIdentify => 'ಗುರುತಿಸಿ';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'ಅಡಿಬರಹ';

  @override
  String get adminMetadataFieldOverview => 'ಅವಲೋಕನ';

  @override
  String get adminMetadataFieldDisplayOrder => 'Display order';

  @override
  String get adminMetadataDisplayOrderAired => 'Aired';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate => 'Original air date';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolute';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digital';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Story arc';

  @override
  String get adminMetadataDisplayOrderProduction => 'Production';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternate';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regional';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternate DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Date modified';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sort name';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Release date';

  @override
  String get adminMetadataSettings => 'Metadata Settings';

  @override
  String get adminMetadataDownloadLanguage => 'Preferred download language';

  @override
  String get adminMetadataCountryRegion => 'Country/Region';

  @override
  String get adminMetadataInheritHelp =>
      'Leave this on Default to inherit the setting from a parent item, or from the server default.';

  @override
  String get adminMetadataField3DFormat => '3D format';

  @override
  String get adminMetadataPersonKindActor => 'Actor';

  @override
  String get adminMetadataPersonKindDirector => 'Director';

  @override
  String get adminMetadataPersonKindComposer => 'Composer';

  @override
  String get adminMetadataPersonKindWriter => 'Writer';

  @override
  String get adminMetadataPersonKindGuestStar => 'Guest star';

  @override
  String get adminMetadataPersonKindProducer => 'Producer';

  @override
  String get adminMetadataPersonKindConductor => 'Conductor';

  @override
  String get adminMetadataPersonKindLyricist => 'Lyricist';

  @override
  String get adminMetadataPersonKindArranger => 'Arranger';

  @override
  String get adminMetadataPersonKindEngineer => 'Engineer';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Creator';

  @override
  String get adminMetadataPersonKindArtist => 'Artist';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Album artist';

  @override
  String get adminMetadataPersonKindAuthor => 'Author';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Penciller';

  @override
  String get adminMetadataPersonKindInker => 'Inker';

  @override
  String get adminMetadataPersonKindColorist => 'Colorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Letterer';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Cover artist';

  @override
  String get adminMetadataPersonKindEditor => 'Editor';

  @override
  String get adminMetadataPersonKindTranslator => 'Translator';

  @override
  String get adminMetadataPersonKindNarrator => 'Narrator';

  @override
  String get adminMetadataAirDays => 'Air days';

  @override
  String get adminMetadataLockItem =>
      'Lock this item to prevent future metadata changes';

  @override
  String get adminMetadataEnabledFields => 'Enabled Fields';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Uncheck a field to lock it and prevent its data from being changed.';

  @override
  String get adminMetadataLockFieldName => 'Name';

  @override
  String get adminMetadataLockFieldOverview => 'Overview';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Parental rating';

  @override
  String get adminMetadataLockFieldCast => 'People';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Production locations';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Birth location';

  @override
  String get adminMetadataLockFieldRuntime => 'Runtime';

  @override
  String get adminMetadataLockFieldStudios => 'Studios';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

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
  String get adminMetadataProvider => 'ಒದಗಿಸುವವರು';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಿ';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ಇದು ಐಟಂನಿಂದ ಪ್ರಸ್ತುತ ಚಿತ್ರವನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';
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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsNoneInstalled =>
      'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ: v$version';
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
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsCatalogEmpty => 'ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ಅನ್ನು ಸ್ಥಾಪಿಸಲಾಗುತ್ತಿದೆ...';
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
    return '$name ಸೆಟ್ಟಿಂಗ್‌ಗಳು';
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
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String get adminReposRemove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposSaveFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
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
  String get adminNetworkingEnableHttps => 'HTTPS ಸಕ್ರಿಯಗೊಳಿಸಿ';

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
  String get adminBrandingSplashUpload => 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get adminBrandingSplashUploaded => 'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingSplashUploadFailed =>
      'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminBrandingSplashDeleted => 'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String get adminBrandingNoSplash => 'ಕಸ್ಟಮ್ ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ಇಲ್ಲ';

  @override
  String get adminPlaybackHwAccel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackHwAccelLabel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackQsvDevice => 'QSV ಸಾಧನ';

  @override
  String get adminPlaybackEnhancedNvdec => 'ವರ್ಧಿತ NVDEC ಡಿಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'ಸಿಸ್ಟಂ ಸ್ಥಳೀಯ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bit ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackHwEncodingSection => 'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackAllowHevcEncoding =>
      'HEVC ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel ಕಡಿಮೆ-ಶಕ್ತಿಯ H.264 ಎನ್‌ಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel ಕಡಿಮೆ-ಶಕ್ತಿಯ HEVC ಎನ್‌ಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackToneMapping => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್';

  @override
  String get adminPlaybackEnableTonemapping => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಅಲ್ಗಾರಿದಮ್';

  @override
  String get adminPlaybackTonemappingMode => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಮೋಡ್';

  @override
  String get adminPlaybackTonemappingRange => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ರೇಂಜ್';

  @override
  String get adminPlaybackTonemappingDesat => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಡಿಸ್ಯಾಚುರೇಶನ್';

  @override
  String get adminPlaybackTonemappingPeak => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಪೀಕ್';

  @override
  String get adminPlaybackTonemappingParam => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಪ್ಯಾರಾಮೀಟರ್';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಹೊಳಪು';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಕಾಂಟ್ರಾಸ್ಟ್';

  @override
  String get adminPlaybackEncoderPreset => 'ಎನ್‌ಕೋಡರ್ ಪ್ರಿಸೆಟ್';

  @override
  String get adminPlaybackH264Crf => 'H.264 ಎನ್‌ಕೋಡಿಂಗ್ CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) ಎನ್‌ಕೋಡಿಂಗ್ CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'ಡಿಇಂಟರ್‌ಲೇಸ್ ವಿಧಾನ';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'ಡಿಇಂಟರ್‌ಲೇಸ್ ಮಾಡುವಾಗ ಫ್ರೇಮ್ ದರವನ್ನು ದ್ವಿಗುಣಗೊಳಿಸಿ';

  @override
  String get adminPlaybackAudioSection => 'ಆಡಿಯೋ';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'ಆಡಿಯೋ VBR ಎನ್‌ಕೋಡಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackDownmixBoost => 'ಆಡಿಯೋ ಡೌನ್‌ಮಿಕ್ಸ್ ಬೂಸ್ಟ್';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ಸ್ಟೀರಿಯೋ ಡೌನ್‌ಮಿಕ್ಸ್ ಅಲ್ಗಾರಿದಮ್';

  @override
  String get adminPlaybackMaxMuxingQueue => 'ಗರಿಷ್ಠ ಮಕ್ಸಿಂಗ್ ಕ್ಯೂ ಗಾತ್ರ';

  @override
  String get adminPlaybackAutoOption => 'ಆಟೋ';

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
  String get adminTaskStop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get adminRunningTasks => 'ಚಾಲನೆಯಲ್ಲಿರುವ ಕಾರ್ಯಗಳು';

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
    return 'ಪ್ರತಿದಿನ $time ಕ್ಕೆ';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ಪ್ರತಿ $day $time ಕ್ಕೆ';
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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಗಂಟೆಗಳು',
      one: '1 ಗಂಟೆ',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'ಸಮಯ';

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
    return '$daysದಿ ಹಿಂದೆ';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursಗಂ ಹಿಂದೆ';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesನಿ ಹಿಂದೆ';
  }

  @override
  String get adminActivityNow => 'ಈಗ';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesನಿ';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursಗಂ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysದಿ';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'ಸೀಕ್ ಪೂರ್ವವೀಕ್ಷಣೆ ಥಂಬ್‌ನೇಲ್‌ಗಳಿಗಾಗಿ trickplay ಚಿತ್ರ ರಚನೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get adminNetworkingPublicHttpsPort => 'ಸಾರ್ವಜನಿಕ HTTPS ಪೋರ್ಟ್';

  @override
  String get adminNetworkingBaseUrl => 'ಮೂಲ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ಉದಾ. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'ಸಾರ್ವಜನಿಕ HTTP ಪೋರ್ಟ್';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS ಅಗತ್ಯವಿದೆ';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'ಎಲ್ಲಾ ರಿಮೋಟ್ ವಿನಂತಿಗಳನ್ನು HTTPS ಗೆ ಮರುನಿರ್ದೇಶಿಸಿ. ಸರ್ವರ್‌ಗೆ ಮಾನ್ಯ ಪ್ರಮಾಣಪತ್ರ ಇಲ್ಲದಿದ್ದರೆ ಇದು ಯಾವುದೇ ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ.';

  @override
  String get adminNetworkingCertPassword => 'ಪ್ರಮಾಣಪತ್ರ ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingLocalSubnets => 'LAN ನೆಟ್‌ವರ್ಕ್‌ಗಳು';

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
  String get adminPlaybackThrottleDelay => 'ಥ್ರಾಟಲ್ ವಿಳಂಬ (ಸೆಕೆಂಡುಗಳು)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'ತಕ್ಷಣದ ಉಪಶೀರ್ಷಿಕೆ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

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
    return 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಮಿತಿ (ಮಿಸೆ)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminGeneralSectionServer => 'ಸರ್ವರ್';

  @override
  String get adminGeneralSectionMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminGeneralSectionPaths => 'ಪಥಗಳು';

  @override
  String get adminGeneralSectionPerformance => 'ಕಾರ್ಯಕ್ಷಮತೆ';

  @override
  String get adminGeneralCachePath => 'ಸಂಗ್ರಹ ಮಾರ್ಗ';

  @override
  String get adminGeneralMetadataPath => 'ಮೆಟಾಡೇಟಾ ಮಾರ್ಗ';

  @override
  String get adminGeneralServerName => 'ಸರ್ವರ್ ಹೆಸರು';

  @override
  String get adminGeneralDisplayLanguage => 'ಆದ್ಯತೆಯ ಪ್ರದರ್ಶನ ಭಾಷೆ';

  @override
  String get adminSettingsLoadFailed =>
      'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'ಸಮಯ ಮಿತಿ: $duration';
  }

  @override
  String get folders => 'ಫೋಲ್ಡರ್‌ಗಳು';

  @override
  String get libraries => 'ಲೈಬ್ರರಿಗಳು';

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
      other: '# ಭಾಗವಹಿಸುವವರು',
      one: '# ಭಾಗವಹಿಸುವವರು',
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
    return 'ಐಟಂ $index';
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
    return '$userName SyncPlay ಗುಂಪಿಗೆ ಸೇರಿದರು';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay ಗುಂಪಿನಿಂದ ಹೊರಟರು';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ಈ SyncPlay ಗುಂಪಿನಲ್ಲಿ ನೀವು ಒಂದು ಅಥವಾ ಹೆಚ್ಚಿನ ಐಟಂಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿಲ್ಲ. ಲೈಬ್ರರಿ ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಲು ಅಥವಾ ಬೇರೆ ಸರತಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಗುಂಪಿನ ಮಾಲೀಕರನ್ನು ಕೇಳಿ.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName ಗೆ ಪ್ಲೇಬ್ಯಾಕ್ ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ';
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
      other: '# ಸಾಲುಗಳು ಪತ್ತೆಯಾಗಿವೆ',
      one: '# ಸಾಲು ಪತ್ತೆಯಾಗಿದೆ',
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
  String get offlineBannerTitle => 'ನೀವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದೀರಿ';

  @override
  String get offlineBannerSubtitle => 'ನಿಮ್ಮ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get serverUnreachableBannerTitle =>
      'ನಿಮ್ಮ ಸರ್ವರ್ ಅನ್ನು ತಲುಪಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String get serverUnreachableBannerSubtitle =>
      'ಅದು ಮರಳುವವರೆಗೆ ಡೌನ್‌ಲೋಡ್‌ಗಳಿಂದ ಪ್ಲೇ ಮಾಡಲಾಗುತ್ತಿದೆ';

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
    return 'ಕಾಸ್ಟ್ ನಿಯಂತ್ರಣ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind ನಿಯಂತ್ರಣಗಳು';
  }

  @override
  String get castDeviceVolume => 'ಸಾಧನದ ಪರಿಮಾಣ';

  @override
  String get castVolumeUnavailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String castStopKind(String kind) {
    return '$kind ನಿಲ್ಲಿಸಿ';
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
    return '$length-ಅಂಕಿಯ PIN ನಮೂದಿಸಿ';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ನಿಮ್ಮ $length-ಅಂಕಿಯ PIN ನಮೂದಿಸಿ';
  }

  @override
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'ತಪ್ಪಾದ ಪಿನ್';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
      'Quick Connect ವಿನಂತಿಯನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect ಕೋಡ್ ಅಮಾನ್ಯವಾಗಿದೆ ಅಥವಾ ಅವಧಿ ಮೀರಿದೆ.';

  @override
  String get quickConnectNotSupported =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ Quick Connect ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect ಕೋಡ್ ಅನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get quickConnectDisabled =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ Quick Connect ನಿಷ್ಕ್ರಿಯಗೊಂಡಿದೆ.';

  @override
  String get quickConnectForbidden =>
      'ನಿಮ್ಮ ಖಾತೆಯು ಈ Quick Connect ವಿನಂತಿಯನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect ಕೋಡ್ ಕಂಡುಬಂದಿಲ್ಲ. ಹೊಸ ಕೋಡ್ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ವಿಫಲವಾಗಿದೆ: $message';
  }

  @override
  String get quickConnectEnterCode => 'ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get quickConnectAuthorize => 'ಅಧಿಕಾರ ನೀಡಿ';

  @override
  String remoteCommandFailed(String error) {
    return 'ಆದೇಶ ವಿಫಲವಾಗಿದೆ: $error';
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
    return 'ಕಾಸ್ಟಿಂಗ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get noRemoteDevices => 'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noRemoteDevicesIos =>
      'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.\n\niOS ನಲ್ಲಿ, AirPlay ಗುರಿಗಳು ಸಿಮ್ಯುಲೇಟರ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲದಿರಬಹುದು.';

  @override
  String get trackActionPlayNext => 'ಮುಂದೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get trackActionViewDetails => 'View Details';

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
    return '$name ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ...';
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
  String get shuffleLibrary => 'ಲೈಬ್ರರಿ';

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
  String get stillWatchingStop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get stillWatchingContinue => 'ಮುಂದುವರಿಸಿ';

  @override
  String skipSegment(String segment) {
    return '$segment ಬಿಟ್ಟುಬಿಡಿ';
  }

  @override
  String get liveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get continueWatchingAndNextUp =>
      'ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ';
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
  String get playerTooltipPrevious => 'ಹಿಂದಿನದು';

  @override
  String get playerTooltipSeekBack => 'ಹಿಂತಿರುಗಿ ನೋಡಿ';

  @override
  String get playerTooltipSeekForward => 'ಮುಂದೆ ಹುಡುಕು';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
      '\"ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ\" ವಿಭಾಗದಿಂದ ಮರೆಮಾಡಿ';

  @override
  String get contextMenuHideFromNextUp => '\"ಮುಂದಿನದು\" ವಿಭಾಗದಿಂದ ಮರೆಮಾಡಿ';

  @override
  String get contextMenuAddToCollection => 'ಸಂಗ್ರಹಣೆಗೆ ಸೇರಿಸಿ';

  @override
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'ಸರ್ವರ್ ಆಡಳಿತ ಫಲಕವನ್ನು ಪ್ರವೇಶಿಸಿ';

  @override
  String get settingsDynamicContent => 'ಡೈನಾಮಿಕ್ ವಿಷಯ';

  @override
  String get settingsDynamicContentSubtitle =>
      'ಮೀಡಿಯಾ ಬಾರ್ ಮತ್ತು ದೃಶ್ಯ ಮೇಲ್ಪದರಗಳು';

  @override
  String get settingsAboutSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ, ಕಾನೂನು ಮಾಹಿತಿ ಮತ್ತು ಕ್ರೆಡಿಟ್‌ಗಳು';

  @override
  String get settingsSortServersBy => 'ಮೂಲಕ ಸರ್ವರ್‌ಗಳನ್ನು ವಿಂಗಡಿಸಿ';

  @override
  String get settingsLastUsed => 'ಕೊನೆಯದಾಗಿ ಬಳಸಲಾಗಿದೆ';

  @override
  String get settingsAlphabetical => 'ವರ್ಣಮಾಲೆಯ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'ಸ್ವಯಂ-ಸಹಿ ಮಾಡಿದ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'ಸ್ವಯಂ-ಸಹಿ ಮಾಡಿದ ಅಥವಾ ಖಾಸಗಿ-CA TLS ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಬಳಸುವ ಸರ್ವರ್‌ಗಳನ್ನು ನಂಬಿರಿ. ನೀವು ನಿಯಂತ್ರಿಸುವ ಸರ್ವರ್‌ಗಳಿಗೆ ಮಾತ್ರ ಸಕ್ರಿಯಗೊಳಿಸಿ. ಇದು ಎಲ್ಲಾ ಸಂಪರ್ಕಗಳಿಗೆ ಪ್ರಮಾಣಪತ್ರ ಮೌಲ್ಯೀಕರಣವನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get untrustedServerCertificate =>
      'This server\'s certificate isn\'t trusted. If it\'s your own server and uses a self-signed or private certificate, you can allow it here.';

  @override
  String get clientCertTitle => 'Client certificate';

  @override
  String clientCertHost(String host) {
    return 'Certificate for $host';
  }

  @override
  String get clientCertChooseFile => 'Choose file';

  @override
  String get clientCertPassword => 'Certificate password';

  @override
  String get clientCertStartUpload => 'Send from phone';

  @override
  String get clientCertUploadHint =>
      'Scan this code with your phone, or open the address in its browser, then pick the file and enter its password.';

  @override
  String get clientCertStopUpload => 'Stop waiting';

  @override
  String get clientCertNoFileData => 'Couldn\'t read the file. Try again.';

  @override
  String get clientCertPickFailed => 'Couldn\'t open the file picker.';

  @override
  String get clientCertUploadFailed =>
      'Couldn\'t start the upload page. Try again.';

  @override
  String get clientCertNoSecureStorage =>
      'This device has no secure storage, so the certificate can\'t be saved. On Linux, install libsecret and try again.';

  @override
  String get clientCertDecodeFailed =>
      'Couldn\'t read that file as a certificate. Make sure it\'s a .p12 or .pfx.';

  @override
  String get clientCertWrongPassword =>
      'That password doesn\'t unlock this certificate.';

  @override
  String get clientCertRequired =>
      'This server needs a client certificate (mTLS). Add one for this host to continue.';

  @override
  String clientCertExpired(String date) {
    return 'The certificate for this server expired on $date. Replace it to continue.';
  }

  @override
  String get clientCertAddButton => 'Add client certificate';

  @override
  String get settingsClientCertificates => 'Client certificates';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificates this app presents to servers that require one (mTLS)';

  @override
  String get clientCertSubject => 'Subject';

  @override
  String clientCertExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get clientCertReplace => 'Replace';

  @override
  String get clientCertAdd => 'Add certificate';

  @override
  String get clientCertAddHostPrompt =>
      'Which server host needs a certificate?';

  @override
  String get itemBlockedByParentalControls => 'This isn\'t available';

  @override
  String get blockedRatingsCeilingHint =>
      'Blocking a rating also blocks everything stronger than it.';

  @override
  String get blockedRatingsUnrankedSection => 'Only blocks itself';

  @override
  String get settingsHomePage => 'ಮುಖಪುಟ';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರೀಸ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ Seerr ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ಮೇಲಿನ ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಪಠ್ಯ ಲೇಬಲ್‌ಗಳನ್ನು ಯಾವಾಗಲೂ ತೋರಿಸಿ';

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
  String get useNativeEmulator => 'Native Emulation';

  @override
  String get useNativeEmulatorSubtitle =>
      'Play games with native cores instead of the EmulatorJS web player';

  @override
  String get emulatorCores => 'Emulator Cores';

  @override
  String get emulatorCoresSubtitle => 'Download systems to play games natively';

  @override
  String get emulatorCoresDescription =>
      'Choose which systems to install. Cores are provided by the libretro project and let games run natively instead of in a browser view.';

  @override
  String get emulatorCoreDownloading => 'Downloading';

  @override
  String get emulatorCoreUnavailable => 'Not available for this device';

  @override
  String get emulatorCoreDownloadFailed =>
      'Could not download the core. Check your connection and try again.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Reset $system settings to defaults';
  }

  @override
  String get emulatorCoreSettingsReset => 'Settings reset to defaults.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Could not reset settings. Check your connection and try again.';

  @override
  String get downloadedGames => 'Downloaded Games';

  @override
  String get downloadedGamesSubtitle => 'Free up space used by game files';

  @override
  String get downloadedGamesDescription =>
      'Games are copied to this device before they play. Remove the ones you have finished to free up space. Saves are kept on the server and are not deleted.';

  @override
  String get downloadedGamesEmpty =>
      'No games have been downloaded to this device yet.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count games, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Remove All';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Remove $title from this device? It will download again the next time you play it.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Remove all downloaded games from this device? They will download again the next time you play them.';

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
  String get settingsSupportMoonfinSubtitle => 'ಡೆವಲಪರ್‌ಗೆ ಒಂದು ಕಾಫಿ ದಾನ ಮಾಡಿ';

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
  String get settingsBoth => 'ಎರಡೂ';

  @override
  String get settingsShuffleContentTypeFilter => 'ಷಫಲ್ ವಿಷಯದ ಪ್ರಕಾರದ ಫಿಲ್ಟರ್';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗಳು, ಸಂಸ್ಕರಣೆ ಮತ್ತು ಪಾಸ್‌ಥ್ರೂ ಆಯ್ಕೆಗಳು';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ಸ್ವಯಂಚಾಲಿತ ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಅನುಕ್ರಮ';

  @override
  String get settingsSyncplaySubtitle =>
      'ಗುಂಪು ಅವಧಿಗಳಿಗಾಗಿ ಸಿಂಕ್ರೊನೈಸೇಶನ್ ಲಾಜಿಕ್';

  @override
  String get settingsSkipIntrosAndOutros =>
      'ಪರಿಚಯಗಳು ಮತ್ತು ಔಟ್ರೊಗಳನ್ನು ಬಿಟ್ಟುಬಿಡುವುದೇ?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'ಮಾಧ್ಯಮ ವಿಭಾಗ ಕೌಂಟ್‌ಡೌನ್';

  @override
  String get settingsProgressBar => 'ಪ್ರಗತಿ ಪಟ್ಟಿ';

  @override
  String get settingsTimer => 'ಟೈಮರ್';

  @override
  String get settingsNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ಪರಂಪರೆ)';

  @override
  String get settingsRedetectDisplay => 'Re-detect display';

  @override
  String get settingsRedetectDisplayDescription =>
      'Ask the TV again what HDR formats it supports. Use this if Dolby Vision or HDR10 titles are being transcoded after the TV or receiver was powered on late.';

  @override
  String get settingsDisplayIsSdr => 'My TV is not HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Stop advertising HDR support for this display. Use this only if detection keeps reporting HDR your TV can\'t actually show.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Display re-detected: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'No HDR formats detected';

  @override
  String get settingsDisplayMarkedSdr => 'Display saved as SDR';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
    return 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾದ $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'ಮುಂದಿನ ಸಂಚಿಕೆಯನ್ನು ಸ್ವಯಂ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'ಲಭ್ಯವಿದ್ದಾಗ ಮುಂದಿನ ಸಂಚಿಕೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String get skipSilenceTitle => 'ಮೌನವನ್ನು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get skipSilenceSubtitle =>
      'ಸ್ಟ್ರೀಮ್ ಬೆಂಬಲಿಸಿದಾಗ ಮೌನ ಆಡಿಯೋ ವಿಭಾಗಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಬಿಟ್ಟುಬಿಡಿ.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'ಬಾಹ್ಯ ಆಡಿಯೋ ಪರಿಣಾಮಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'ಈಕ್ವಲೈಜರ್ ಮತ್ತು ಪರಿಣಾಮಗಳ ಆ್ಯಪ್‌ಗಳು (ಉದಾ. Wavelet) Media3 ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಷನ್‌ಗಳಿಗೆ ಲಗತ್ತಿಸಲು ಅನುಮತಿಸಿ.';

  @override
  String get disableTunnelingTitle => 'ಟನೆಲಿಂಗ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get disableTunnelingSubtitle =>
      'ಟನೆಲ್ ಮಾಡದ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಒತ್ತಾಯಿಸಿ. ಟನೆಲಿಂಗ್ ಆಡಿಯೋ/ವಿಡಿಯೋ ಅಸಂಗತತೆ ಇರುವ ಸಾಧನಗಳಲ್ಲಿ ಉಪಯುಕ್ತ.';

  @override
  String get enableTunnelingTitle => 'ಟನೆಲಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get enableTunnelingSubtitle =>
      'ಸುಧಾರಿತ. ಆಡಿಯೋ ಮತ್ತು ವಿಡಿಯೋವನ್ನು ಜೋಡಿಸಿದ ಹಾರ್ಡ್‌ವೇರ್ ಮಾರ್ಗದ ಮೂಲಕ ರೂಟ್ ಮಾಡುತ್ತದೆ. ಕೆಲವು ಸಾಧನಗಳಲ್ಲಿ ಆಡಿಯೋ/ವಿಡಿಯೋ ಡ್ರಾಪ್‌ಔಟ್‌ಗಳಿಗೆ ಕಾರಣವಾಗುವುದರಿಂದ ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ಆಫ್ ಆಗಿದೆ.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಅನ್ನು HEVC ಗೆ ಮ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV ಅಲ್ಲದ ಸಾಧನಗಳಲ್ಲಿ Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಸ್ಟ್ರೀಮ್‌ಗಳನ್ನು HDR10-ಹೊಂದಾಣಿಕೆಯ HEVC ಆಗಿ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆ ಶೈಲಿಗಳನ್ನು ಬಳಸಿ';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ನಲ್ಲಿ ಎಂಬೆಡ್ ಮಾಡಿದ ಬಣ್ಣಗಳು, ಫಾಂಟ್‌ಗಳು ಮತ್ತು ಸ್ಥಾನೀಕರಣವನ್ನು ಅನ್ವಯಿಸಿ. ಬದಲಿಗೆ ನಿಮ್ಮ ಶೀರ್ಷಿಕೆ ಶೈಲಿ ಆದ್ಯತೆಗಳನ್ನು ಬಳಸಲು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆ ಫಾಂಟ್ ಗಾತ್ರಗಳನ್ನು ಬಳಸಿ';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ನಲ್ಲಿ ಎಂಬೆಡ್ ಮಾಡಿದ ಫಾಂಟ್-ಗಾತ್ರ ಸೂಚನೆಗಳನ್ನು ಅನ್ವಯಿಸಿ. ನಿಮ್ಮ ಶೈಲಿ ಆದ್ಯತೆಗಳಿಂದ ಉಪಶೀರ್ಷಿಕೆ ಗಾತ್ರವನ್ನು ಬಳಸಲು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get showMediaDetailsOnLibraryPage => 'ಮಾಧ್ಯಮ ವಿವರಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'ಲೈಬ್ರರಿ ಪುಟಗಳ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಆಯ್ಕೆಮಾಡಿದ ಐಟಂನ ವಿವರಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'ವಿವರವಾದ ಉಪ-ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ಲೈಬ್ರರಿ ಪುಟಗಳಲ್ಲಿ ವಿವರವಾದ ಅಥವಾ ಕನಿಷ್ಠ ಉಪಸಾಲನ್ನು ತೋರಿಸಿ.';

  @override
  String get savedThemesDeleteDialogTitle => 'ಉಳಿಸಿದ ಥೀಮ್ ಅನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ಈ ಸಾಧನ ಕ್ಯಾಶ್‌ನಿಂದ \"$themeName\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String get themeStore => 'ಥೀಮ್ ಸ್ಟೋರ್';

  @override
  String get themeStoreSubtitle => 'ಸಮುದಾಯ ಥೀಮ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ ಮತ್ತು ಉಳಿಸಿ';

  @override
  String get themeStoreDescription =>
      'ನಿಮ್ಮ ಇತರ ಉಳಿಸಿದ ಥೀಮ್‌ಗಳಂತೆ ಬಳಸಲು ಥೀಮ್ ಅನ್ನು ಉಳಿಸಿ.';

  @override
  String get themeStoreEmpty => 'ಸದ್ಯಕ್ಕೆ ಯಾವುದೇ ಥೀಮ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get themeStoreLoadFailed =>
      'ಥೀಮ್ ಸ್ಟೋರ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ನಿಮ್ಮ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get themeStoreSave => 'ಉಳಿಸಿ';

  @override
  String get themeStoreSaveAndApply => 'ಉಳಿಸಿ ಮತ್ತು ಅನ್ವಯಿಸಿ';

  @override
  String get themeStoreSaved => 'ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get themeStoreInvalidMessage =>
      'ಈ ಥೀಮ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" ಉಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'ಈ ಸಾಧನದಿಂದ \"$themeName\" ಅಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ಅನ್ನು ಅಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';
  }

  @override
  String get savedThemesTitle => 'ಉಳಿಸಿದ ಥೀಮ್‌ಗಳು';

  @override
  String get savedThemesDescription =>
      'ಇವು ಪ್ರಸ್ತುತ ಸರ್ವರ್‌ಗಾಗಿ Moonfin ಪ್ಲಗಿನ್‌ನಿಂದ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಥೀಮ್‌ಗಳು. ಅಳಿಸುವಿಕೆಯು ಈ ಸ್ಥಳೀಯ ಪ್ರತಿಯನ್ನು ಮಾತ್ರ ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String get savedThemesEmpty =>
      'ಈ ಸರ್ವರ್‌ಗಾಗಿ ಯಾವುದೇ ಉಳಿಸಿದ ಥೀಮ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ಪ್ರಸ್ತುತ ಸಕ್ರಿಯ';
  }

  @override
  String get savedThemesDeleteTooltip => 'ಉಳಿಸಿದ ಥೀಮ್ ಅನ್ನು ಅಳಿಸಿ';

  @override
  String get savedThemesManageSubtitle =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಪ್ಲಗಿನ್ ಥೀಮ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get themeEditor => 'ಥೀಮ್ ಎಡಿಟರ್';

  @override
  String get themeEditorSubtitle =>
      'ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ Moonfin ಥೀಮ್ ಎಡಿಟರ್ ತೆರೆಯಿರಿ';

  @override
  String get homeScreen => 'ಹೋಮ್ ಪರದೆ';

  @override
  String get bottomBar => 'ಕೆಳಗಿನ ಪಟ್ಟಿ';

  @override
  String get homeRowsStyleClassic => 'ಕ್ಲಾಸಿಕ್';

  @override
  String get homeRowsStyleModern => 'ಮಾಡರ್ನ್';

  @override
  String get homeRowsSection => 'ಹೋಮ್ ಸಾಲುಗಳು';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'ಕ್ಲಾಸಿಕ್ ಪ್ರತಿ-ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರ ಮತ್ತು ಮಾಹಿತಿ ಓವರ್‌ಲೇ ಅನ್ನು ಉಳಿಸಿಕೊಳ್ಳುತ್ತದೆ. ಮಾಡರ್ನ್ ಪೋರ್ಟ್ರೇಟ್-ನಿಂದ-ಬ್ಯಾಕ್‌ಡ್ರಾಪ್ ಸಾಲುಗಳನ್ನು ಬಳಸುತ್ತದೆ.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

  @override
  String get displayFavoritesRows => 'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayFavoritesRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಮೆಚ್ಚಿನ ಚಲನಚಿತ್ರಗಳು, ಸರಣಿ ಮತ್ತು ಇತರ ಮೆಚ್ಚಿನ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get favoritesRowSorting => 'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get favoritesRowSortingDescription =>
      'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayCollectionsRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get collectionsRowSorting => 'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get collectionsRowSortingDescription =>
      'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayGenresRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get genresRowSorting => 'ಪ್ರಕಾರಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get genresRowSortingDescription =>
      'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'ಪ್ರಕಾರಗಳ ಸಾಲಿನ ಐಟಂಗಳು';

  @override
  String get genresRowItemsDescription =>
      'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳಲ್ಲಿ ಚಲನಚಿತ್ರಗಳು, ಸರಣಿ ಅಥವಾ ಎರಡನ್ನೂ ತೋರಿಸಿ.';

  @override
  String get displayStudiosRows => 'Display Studio Row';

  @override
  String get displayStudiosRowsSubtitle => 'Show Studio row in Home Sections.';

  @override
  String get studiosRowSorting => 'Studio Row Sorting';

  @override
  String get studiosRowSortingDescription =>
      'Studio row by name, recently added, and more.';

  @override
  String get studiosRowSortOrderDescription =>
      'Choose Ascending or Descending sort order.';

  @override
  String get selectStudiosToInclude => 'Select Studios to Include';

  @override
  String get selectStudiosToIncludeDescription =>
      'Select which studios should be included on the home row.';

  @override
  String get selectAllStudios => 'Select All';

  @override
  String get deselectAllStudios => 'Deselect All';

  @override
  String get tvStudiosFilter => 'TV Studios';

  @override
  String get movieStudiosFilter => 'Movie Studios';

  @override
  String get selectedStudiosFilter => 'Selected Studios';

  @override
  String get unselectedStudiosFilter => 'Unselected Studios';

  @override
  String get filtersHeader => 'Filters';

  @override
  String get showHeader => 'Show';

  @override
  String get displayPlaylistsRows => 'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get playlistsRowSorting => 'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get playlistsRowSortingDescription =>
      'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayAudioRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get audioRowsSorting => 'ಆಡಿಯೋ ಸಾಲುಗಳ ವಿಂಗಡಣೆ';

  @override
  String get audioRowsSortingDescription =>
      'ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get audioRowsSortOrderDescription =>
      'Sort Audio rows in ascending or descending order.';

  @override
  String get sorting => 'Sorting';

  @override
  String get imdbRowsSorting => 'IMDb Row Sorting';

  @override
  String get imdbRowsSortingDescription =>
      'Sort IMDb rows by name, release date, rating, and more.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Sort IMDb rows in ascending or descending order.';

  @override
  String get tmdbRowsSorting => 'TMDB Row Sorting';

  @override
  String get tmdbRowsSortingDescription =>
      'Sort TMDB rows by name, release date, rating, and more.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Sort TMDB rows in ascending or descending order.';

  @override
  String get seerrRowsSorting => 'Seerr Row Sorting';

  @override
  String get seerrRowsSortingDescription =>
      'Sort Seerr rows by name, release date, rating, and more.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Sort Seerr rows in ascending or descending order.';

  @override
  String get externalRowSortDefault => 'Default (List Order)';

  @override
  String get externalRowSortName => 'Name';

  @override
  String get externalRowSortReleaseDate => 'Release Date';

  @override
  String get externalRowSortRating => 'Rating';

  @override
  String get externalRowSortPopularity => 'Popularity';

  @override
  String get externalRowSortShuffle => 'Shuffle';

  @override
  String get audioPlaylists => 'ಆಡಿಯೋ ಪ್ಲೇಪಟ್ಟಿಗಳು';

  @override
  String get appearance => 'ಗೋಚರತೆ';

  @override
  String get layout => 'ವಿನ್ಯಾಸ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get keyboard => 'ಕೀಬೋರ್ಡ್';

  @override
  String get navButtons => 'ಬಟನ್‌ಗಳು';

  @override
  String get rendering => 'ರೆಂಡರಿಂಗ್';

  @override
  String get mpvConfiguration => 'MPV ಕಾನ್ಫಿಗರೇಶನ್';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'ಬಾಹ್ಯ ಪ್ಲೇಯರ್ ಆ್ಯಪ್';

  @override
  String get externalPlayerAppDescription =>
      'ದೀರ್ಘ-ಒತ್ತಿ ಪ್ಲೇ ಆಯ್ಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲು ಬಾಹ್ಯ ಪ್ಲೇಯರ್ ಅನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭವಾದಾಗ ಆ್ಯಪ್ ಆಯ್ಕೆದಾರವನ್ನು ತೋರಿಸಿ.';

  @override
  String get loadingInstalledPlayers =>
      'ಸ್ಥಾಪಿಸಿದ ಪ್ಲೇಯರ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get connection => 'ಸಂಪರ್ಕ';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get supportedOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಬೆಂಬಲಿತ';

  @override
  String get notSupportedOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಬೆಂಬಲಿತವಿಲ್ಲ';

  @override
  String get mediaPlayerBehavior => 'ಮೀಡಿಯಾ ಪ್ಲೇಯರ್ ವರ್ತನೆ';

  @override
  String get playbackEnhancements => 'ಪ್ಲೇಬ್ಯಾಕ್ ವರ್ಧನೆಗಳು';

  @override
  String get alwaysOn => 'ಯಾವಾಗಲೂ ಆನ್.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'ಸ್ಕಿಪ್ ಔಟ್ರೊ ಬದಲಿಗೆ ಮುಂದಿನದು ಪ್ರದರ್ಶನ';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'ಸ್ಕಿಪ್ ಔಟ್ರೊ ಬಟನ್ ಬದಲಿಗೆ ಮುಂದಿನದು ಓವರ್‌ಲೇ ತೋರಿಸಿ.';

  @override
  String get playerRouting => 'ಪ್ಲೇಯರ್ ರೂಟಿಂಗ್';

  @override
  String get preferSoftwareDecoders => 'ಸಾಫ್ಟ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗಳಿಗಿಂತ ಮೊದಲು FFmpeg (ಆಡಿಯೋ) ಮತ್ತು libgav1 (AV1) ಬಳಸಿ. HDMI ಆಡಿಯೋ ಪಾಸ್‌ಥ್ರೂ ಮುರಿದರೆ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get hevcSoftwareDirectPlay => 'Direct Play HEVC (Software Decode)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Play HEVC up to 1080p from the original file instead of asking the server to transcode it. This Apple TV decodes it in software, so heavy 10-bit or high bitrate files may stutter.';

  @override
  String get av1SoftwareUhdDirectPlay => 'Direct Play 4K AV1 (Software Decode)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Play AV1 above 1080p, including HDR10, from the original file instead of asking the server to transcode it. This device decodes AV1 in software, so heavy 4K or high bitrate files may stutter.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV ನಲ್ಲಿ ನೀವು ಆಯ್ಕೆಮಾಡಿದ ಬಾಹ್ಯ ಆ್ಯಪ್‌ನಲ್ಲಿ ವಿಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್ ತೆರೆಯಿರಿ.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'ಸ್ವಯಂಚಾಲಿತ ಕ್ಯೂಯಿಂಗ್';

  @override
  String get preferSdhSubtitles => 'SDH ಉಪಶೀರ್ಷಿಕೆಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'ಸ್ವಯಂ-ಆಯ್ಕೆ ಮಾಡುವಾಗ SDH/CC ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

  @override
  String get preferTextSubtitles => 'Prefer Text Subtitles';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Prioritize text-based subtitles (SRT, VTT) over image-based formats (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Prefer External Subtitles';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Prioritize external subtitle files over embedded tracks.';

  @override
  String get webDiagnostics => 'ವೆಬ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್';

  @override
  String get webDiagnosticsTitle => 'Moonfin ವೆಬ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್';

  @override
  String get webDiagnosticsIntro =>
      'ಬ್ರೌಸರ್ ಸಂಪರ್ಕ ಸಮಸ್ಯೆಗಳನ್ನು (CORS, ಮಿಶ್ರ ವಿಷಯ ಮತ್ತು ಅನ್ವೇಷಣಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು) ಪತ್ತೆಹಚ್ಚಲು ಈ ಪುಟವನ್ನು ಬಳಸಿ.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'ಮಿಶ್ರ-ವಿಷಯ ವೈಫಲ್ಯ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight ವೈಫಲ್ಯ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'HTTPS ಪುಟವು HTTP ಸರ್ವರ್ URL ಅನ್ನು ಕರೆಯಲು ಪ್ರಯತ್ನಿಸುತ್ತಿರುವುದನ್ನು Moonfin ಪತ್ತೆ ಮಾಡಿದೆ. ಬ್ರೌಸರ್‌ಗಳು ಈ ವಿನಂತಿಯನ್ನು ನಿಮ್ಮ ಸರ್ವರ್ ತಲುಪುವ ಮೊದಲೇ ನಿರ್ಬಂಧಿಸುತ್ತವೆ.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'ಮಾಧ್ಯಮ ಸರ್ವರ್‌ನಲ್ಲಿ CORS ಅಥವಾ preflight ಹೆಡರ್‌ಗಳ ಕೊರತೆಯಿಂದ ಸಾಮಾನ್ಯವಾಗಿ ಉಂಟಾಗುವ ಬ್ರೌಸರ್-ಮಟ್ಟದ ವಿನಂತಿ ವೈಫಲ್ಯವನ್ನು Moonfin ಪತ್ತೆ ಮಾಡಿದೆ.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'ಗುರಿ URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'ವಿವರ: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'ಪ್ರಸ್ತುತ ರನ್‌ಟೈಮ್ ಸಂದರ್ಭ';

  @override
  String get webDiagnosticsOrigin => 'ಮೂಲ';

  @override
  String get webDiagnosticsScheme => 'ಸ್ಕೀಮ್';

  @override
  String get webDiagnosticsPluginMode => 'ಪ್ಲಗಿನ್ ಮೋಡ್';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC ಸ್ಕ್ಯಾನ್';

  @override
  String get webDiagnosticsForcedServerUrl => 'ಒತ್ತಾಯಿಸಿದ ಸರ್ವರ್ URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'ಡೀಫಾಲ್ಟ್ ಸರ್ವರ್ URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'ಅನ್ವೇಷಣಾ ಪ್ರಾಕ್ಸಿ URL';

  @override
  String get notConfigured => 'ಕಾನ್ಫಿಗರ್ ಮಾಡಿಲ್ಲ';

  @override
  String get webDiagnosticsMixedContent => 'ಮಿಶ್ರ ವಿಷಯ';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'ಈ ಪುಟವನ್ನು HTTPS ಮೂಲಕ ಲೋಡ್ ಮಾಡಲಾಗಿದೆ, ಆದರೆ ಕಾನ್ಫಿಗರ್ ಮಾಡಿದ ಒಂದು ಅಥವಾ ಹೆಚ್ಚು URL ಗಳು HTTP ಆಗಿವೆ. ಬ್ರೌಸರ್‌ಗಳು HTTPS ಪುಟಗಳು HTTP API ಗಳನ್ನು ಕರೆಯುವುದನ್ನು ನಿರ್ಬಂಧಿಸುತ್ತವೆ.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'ಪರಿಹಾರ: ನಿಮ್ಮ ಮಾಧ್ಯಮ ಸರ್ವರ್ ಅಥವಾ ಪ್ರಾಕ್ಸಿ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅನ್ನು HTTPS ಮೂಲಕ ಒದಗಿಸಿ, ಅಥವಾ ವಿಶ್ವಾಸಾರ್ಹ ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್‌ಗಳಲ್ಲಿ ಮಾತ್ರ HTTP ಮೂಲಕ Moonfin ಲೋಡ್ ಮಾಡಿ.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'ಪ್ರಸ್ತುತ ರನ್‌ಟೈಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ಯಾವುದೇ ಸ್ಪಷ್ಟ ಮಿಶ್ರ-ವಿಷಯ ಕಾನ್ಫಿಗರೇಶನ್ ಪತ್ತೆಯಾಗಿಲ್ಲ.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS ಪರಿಶೀಲನಾ ಪಟ್ಟಿ';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin ನಲ್ಲಿ ಬ್ರೌಸರ್ ಮೂಲವನ್ನು ಅನುಮತಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers ನಲ್ಲಿ Authorization, X-Emby-Authorization ಮತ್ತು X-Emby-Token ಅನ್ನು ಸೇರಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ಸ್ಟ್ರೀಮಿಂಗ್ ಮತ್ತು ಸೀಕ್ ವರ್ತನೆಗಾಗಿ Content-Range ಮತ್ತು Accept-Ranges ಅನ್ನು ಬಹಿರಂಗಪಡಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight ವಿನಂತಿಗಳಿಗೆ 204 ಅನ್ನು ಹಿಂತಿರುಗಿಸಿ.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ಉದಾಹರಣೆ ಹೆಡರ್ ಸ್ನಿಪೆಟ್ (nginx-ಶೈಲಿ)';

  @override
  String get note => 'ಗಮನಿಸಿ';

  @override
  String get webDiagnosticsNonWebNote =>
      'ಈ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಮಾರ್ಗವು ವೆಬ್ ಬಿಲ್ಡ್‌ಗಳಿಗಾಗಿ ಉದ್ದೇಶಿಸಲಾಗಿದೆ. ನೀವು ಇದನ್ನು ಬೇರೆ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ನೋಡುತ್ತಿದ್ದರೆ, ಈ ಪರಿಶೀಲನೆಗಳು ಅನ್ವಯಿಸದೇ ಇರಬಹುದು.';

  @override
  String get backToServerSelect => 'ಸರ್ವರ್ ಆಯ್ಕೆಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get signOutAllUsers => 'ಎಲ್ಲಾ ಬಳಕೆದಾರರನ್ನು ಸೈನ್ ಔಟ್ ಮಾಡಿ';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಶಾಶ್ವತವಾಗಿ ನಿರಾಕರಿಸಲಾಗಿದೆ. ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಇದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get voiceSearchPermissionRequired =>
      'ಧ್ವನಿ ಹುಡುಕಾಟಕ್ಕೆ ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ.';

  @override
  String get voiceSearchNoMatch => 'ಅದು ಅರ್ಥವಾಗಲಿಲ್ಲ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get voiceSearchNoSpeechDetected => 'ಯಾವುದೇ ಮಾತು ಪತ್ತೆಯಾಗಿಲ್ಲ.';

  @override
  String get voiceSearchMicrophoneError => 'ಮೈಕ್ರೊಫೋನ್ ದೋಷ.';

  @override
  String get voiceSearchNeedsInternet =>
      'ಧ್ವನಿ ಹುಡುಕಾಟಕ್ಕೆ ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿದೆ.';

  @override
  String get voiceSearchServiceBusy =>
      'ಧ್ವನಿ ಸೇವೆ ಕಾರ್ಯನಿರತವಾಗಿದೆ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಶಾಶ್ವತವಾಗಿ ನಿರಾಕರಿಸಲಾಗಿದೆ.';

  @override
  String get microphonePermissionDenied => 'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ.';

  @override
  String get speechRecognitionUnavailable =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಮಾತು ಗುರುತಿಸುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get openIosRoutePicker => 'iOS ಮಾರ್ಗ ಆಯ್ಕೆದಾರವನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get airPlayRoutePickerUnavailable =>
      'ಈ ಸಾಧನದಲ್ಲಿ AirPlay ಮಾರ್ಗ ಆಯ್ಕೆದಾರ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get videos => 'ವಿಡಿಯೋಗಳು';

  @override
  String get programs => 'ಪ್ರೋಗ್ರಾಂಗಳು';

  @override
  String get songs => 'ಹಾಡುಗಳು';

  @override
  String get photoAlbums => 'ಫೋಟೋ ಆಲ್ಬಮ್‌ಗಳು';

  @override
  String get photos => 'ಫೋಟೋಗಳು';

  @override
  String get people => 'ಜನರು';

  @override
  String get recentlyReleasedEpisodes => 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾದ ಸಂಚಿಕೆಗಳು';

  @override
  String get watchAgain => 'ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get guestAppearances => 'ಅತಿಥಿ ಪಾತ್ರಗಳು';

  @override
  String get appearancesSeerr => 'ಪಾತ್ರಗಳು (Seerr)';

  @override
  String get crewContributionsSeerr => 'ಸಿಬ್ಬಂದಿ ಕೊಡುಗೆಗಳು (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'ಗುಂಪಿನೊಂದಿಗೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get watchPartyGroupSubtitles => 'Subtitles for everyone';

  @override
  String get watchPartyOwnSubtitles => 'Each person\'s choice';

  @override
  String get watchPartyLobby => 'In the lobby';

  @override
  String get watchPartyUpNextLabel => 'Up next';

  @override
  String get watchPartyRoomSettings => 'Room settings';

  @override
  String get watchPartyCodeOrLink => 'Room code or invite link';

  @override
  String get watchPartyCopyInvite => 'Copy invite link';

  @override
  String get watchPartyInviteCopied => 'Invite link copied';

  @override
  String get watchPartyLetEveryoneVote => 'Let everyone vote on movies';

  @override
  String get watchPartyVoteHelp =>
      'Add movies for everyone to vote on, then play the one you want. TV episodes are still your pick.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Vote for what you want to watch. The host plays one.';

  @override
  String get watchPartySearchMovies => 'Search movies';

  @override
  String get watchPartyNoSuggestions => 'No movies to vote on yet.';

  @override
  String get watchPartySuggested => 'Added to the Watch Party vote';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votes',
      one: '$count vote',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable => 'This server doesn\'t offer Watch Party.';

  @override
  String get watchPartyRoomCode => 'Room code';

  @override
  String get watchPartyStart => 'Start a Watch Party';

  @override
  String get watchPartyPickTitle =>
      'Open a title and choose Watch with group to pick what everyone watches.';

  @override
  String get watchPartyWaitingForHost =>
      'Waiting for the host to pick something.';

  @override
  String get watchPartyShareCode =>
      'Others join with this code from their Watch Party screen.';

  @override
  String get watchPartyReconnecting => 'Reconnecting...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Start for everyone';

  @override
  String get watchPartyBackToLobby => 'Back to the lobby';

  @override
  String get watchPartyGuestsCanPause => 'Guests can play and pause';

  @override
  String get watchPartyEnd => 'End Watch Party';

  @override
  String get watchPartyEnded => 'The Watch Party has ended.';

  @override
  String get watchPartyStaged => 'Picked for the Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Up next: $title';
  }

  @override
  String get disk => 'ಡಿಸ್ಕ್';

  @override
  String get openInBrowser => 'ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ';

  @override
  String get achievementBadges => 'Achievement Badges';

  @override
  String get achievementBadgesSubtitle =>
      'Badges, ranks and quests earned from what you watch';

  @override
  String get achievementsBadges => 'Badges';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked of $total badges';
  }

  @override
  String get achievementsUnlockToasts => 'Unlock Notifications';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Show a notification when you unlock a badge';

  @override
  String get achievementsUnlockedNotification => 'Achievement unlocked';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count achievements unlocked',
      one: '$count achievement unlocked',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count more';
  }

  @override
  String get achievementsQuests => 'Quests';

  @override
  String achievementsQuestCount(int count) {
    return '$count completed';
  }

  @override
  String get achievementsLeaderboard => 'Leaderboard';

  @override
  String get achievementsLeaderboardSubtitle =>
      'How you compare with other users on this server';

  @override
  String get achievementsRecap => 'Recap';

  @override
  String get achievementsRecapSubtitle => 'What you watched recently';

  @override
  String get achievementsLibraryCompletion => 'Library completion';

  @override
  String achievementsLibraryCount(int count) {
    return '$count libraries';
  }

  @override
  String achievementsScore(int score) {
    return '$score points';
  }

  @override
  String get achievementsScoreLabel => 'Score';

  @override
  String get achievementsTopRank => 'Top rank reached';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points points to $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days day streak';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Best: $days days';
  }

  @override
  String get achievementsShowcase => 'Showcase';

  @override
  String get achievementsUnlocked => 'Unlocked';

  @override
  String get achievementsLocked => 'Locked';

  @override
  String get achievementsNothingHere => 'Nothing here yet.';

  @override
  String get achievementsHiddenBadge => 'Hidden achievement';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Unlocked $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pts';
  }

  @override
  String get achievementsDailyQuests => 'Daily';

  @override
  String get achievementsWeeklyQuests => 'Weekly';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Reroll daily quests';

  @override
  String get achievementsRerollWeekly => 'Reroll weekly quests';

  @override
  String get achievementsRerollOffer => 'Swap this set for a different one';

  @override
  String get achievementsRerollSpentDaily =>
      'Used today, comes back at midnight UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Used this week, comes back Monday UTC';

  @override
  String get achievementsRerollConfirm => 'Reroll these quests?';

  @override
  String get achievementsRerollConfirmBody =>
      'You get one daily and one weekly reroll, and this spends it.';

  @override
  String get achievementsRerollFailed => 'Could not reroll those quests.';

  @override
  String get achievementsSuggested => 'Suggested items to watch';

  @override
  String get achievementsNoSuggestions => 'Nothing to suggest for this badge.';

  @override
  String get achievementsProgressLabel => 'Progress';

  @override
  String get achievementsLoadout => 'Loadout';

  @override
  String get achievementsLoadoutSubtitle =>
      'Score to spend and the boosts you hold';

  @override
  String get achievementsAppearance => 'Appearance';

  @override
  String get achievementsAppearanceSubtitle =>
      'The avatar and title on your profile';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titles';

  @override
  String get achievementsEquipped => 'Equipped';

  @override
  String get achievementsOwned => 'Owned';

  @override
  String achievementsEarnedAt(int score) {
    return 'Earned at $score lifetime score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'This server has no avatars or titles to wear.';

  @override
  String get achievementsAppearanceFailed =>
      'Could not change how the profile looks.';

  @override
  String get achievementsPowerUps => 'Power-ups';

  @override
  String get achievementsStats => 'Stats';

  @override
  String get achievementsStatsSubtitle =>
      'Your records and how the server is doing';

  @override
  String get achievementsStatsWatched => 'Watched';

  @override
  String get achievementsStatsBests => 'Bests';

  @override
  String get achievementsStatsHabits => 'Habits';

  @override
  String get achievementsStatsVariety => 'Variety';

  @override
  String get achievementsStatsServer => 'This server';

  @override
  String get achievementsStatsClock => 'When you watch';

  @override
  String get achievementsStatItems => 'Items watched';

  @override
  String get achievementsStatMovies => 'Films watched';

  @override
  String get achievementsStatSeries => 'Series finished';

  @override
  String get achievementsStatHours => 'Hours watched';

  @override
  String get achievementsStatDays => 'Days watched';

  @override
  String get achievementsStatRewatches => 'Rewatches';

  @override
  String get achievementsStatBestWatchStreak => 'Best watch streak';

  @override
  String get achievementsStatBestLoginStreak => 'Best login streak';

  @override
  String get achievementsStatMostEpisodes => 'Most episodes in a day';

  @override
  String get achievementsStatMostMovies => 'Most films in a day';

  @override
  String get achievementsStatLongestItem => 'Longest single item';

  @override
  String get achievementsStatBestCombo => 'Best combo';

  @override
  String get achievementsStatLateNight => 'Late night sessions';

  @override
  String get achievementsStatEarlyMorning => 'Early morning sessions';

  @override
  String get achievementsStatWeekend => 'Weekend sessions';

  @override
  String get achievementsStatDaysSignedIn => 'Days signed in';

  @override
  String get achievementsStatLibraries => 'Libraries visited';

  @override
  String get achievementsStatGenres => 'Genres watched';

  @override
  String get achievementsStatDecades => 'Decades watched';

  @override
  String get achievementsStatCountries => 'Countries watched';

  @override
  String get achievementsStatLanguages => 'Languages watched';

  @override
  String get achievementsStatUsers => 'Users';

  @override
  String get achievementsStatBadgesUnlocked => 'Badges unlocked';

  @override
  String get achievementsStatScoreEarned => 'Score earned';

  @override
  String get achievementsStatCommonBadge => 'Most common badge';

  @override
  String get achievementsActivity => 'Activity';

  @override
  String get achievementsActivitySubtitle =>
      'What the server has unlocked lately';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user unlocked $badge';
  }

  @override
  String get achievementsShop => 'Shop';

  @override
  String get achievementsShopSubtitle => 'Spend score on more boosts';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nothing for sale right now.';

  @override
  String get achievementsBuyConfirm => 'Buy this?';

  @override
  String get achievementsBuyConfirmBody =>
      'It comes straight out of your score bank.';

  @override
  String get achievementsBuyFailed => 'Could not buy that.';

  @override
  String get achievementsScoreBank => 'Score bank';

  @override
  String get achievementsBoost => 'XP Boost';

  @override
  String get achievementsBoostBody =>
      'Doubles score for an hour. Using it again restarts the hour.';

  @override
  String get achievementsDoubleCredit => 'Double Credit';

  @override
  String get achievementsDoubleCreditBody =>
      'The next thing you finish counts twice towards badges.';

  @override
  String get achievementsStreakFreeze => 'Streak Freeze';

  @override
  String get achievementsStreakFreezeBody =>
      'Covers one missed day. Only one can be banked.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count held',
      one: '1 held',
      zero: 'None held',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Running now';

  @override
  String get achievementsUsePowerUp => 'Use this power-up?';

  @override
  String get achievementsUsePowerUpBody =>
      'It\'s spent as soon as you confirm.';

  @override
  String get achievementsPowerUpFailed => 'Could not use that power-up.';

  @override
  String get achievementsHours => 'Hours';

  @override
  String get achievementsStreak => 'Streak';

  @override
  String get achievementsPeriodWeek => 'Week';

  @override
  String get achievementsPeriodMonth => 'Month';

  @override
  String get achievementsPeriodYear => 'Year';

  @override
  String achievementsDaysWatched(int count) {
    return '$count days watched';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count badges earned';
  }

  @override
  String get achievementsTopDirectors => 'Top directors';

  @override
  String get achievementsTopActors => 'Top actors';

  @override
  String get achievementsLoadFailed => 'Could not load your achievements.';

  @override
  String get friends => 'Friends';

  @override
  String get friendsSubtitle =>
      'See who\'s online and chat with people on this server';

  @override
  String get friendsShowButton => 'Show Friends Button';

  @override
  String get friendsShowButtonSubtitle =>
      'Friends and chat from the Achievement Badges plugin';

  @override
  String get friendsMessages => 'Messages';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count unread messages',
      one: '1 unread message',
      zero: 'No unread messages',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Friend requests';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waiting for you',
      one: '1 waiting for you',
      zero: 'Nothing waiting',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Add friends';

  @override
  String get friendsAddSubtitle => 'Find people on this server';

  @override
  String get friendsPrivacy => 'Privacy';

  @override
  String get friendsPrivacySubtitle => 'What your friends can see';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'No friends yet. Add people from this server to see them here.';

  @override
  String friendsWatching(String title) {
    return 'Watching $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Last watched $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Last seen $time';
  }

  @override
  String get friendsLoadFailed =>
      'Could not load this. Check your connection and try again.';

  @override
  String get friendsActionFailed => 'That didn\'t work. Try again in a moment.';

  @override
  String get friendsIncoming => 'Waiting for you';

  @override
  String get friendsOutgoing => 'Sent by you';

  @override
  String get friendsNoRequests => 'No friend requests.';

  @override
  String get friendsAccept => 'Accept';

  @override
  String get friendsDecline => 'Decline';

  @override
  String get friendsCancelRequest => 'Cancel request';

  @override
  String friendsRequestFrom(String name) {
    return '$name wants to be friends';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Take back the request you sent to $name?';
  }

  @override
  String get friendsSearchHint => 'Search people';

  @override
  String get friendsNoMatches => 'No one matches that name.';

  @override
  String friendsRequestSent(String name) {
    return 'Request sent to $name';
  }

  @override
  String get friendsSendRequest => 'Add as friend';

  @override
  String get friendsSendMessage => 'Send message';

  @override
  String friendsOpenItem(String title) {
    return 'Open $title';
  }

  @override
  String get friendsRemove => 'Remove friend';

  @override
  String friendsRemoveBody(String name) {
    return 'Remove $name from your friends? You can add them again later.';
  }

  @override
  String get friendsBlock => 'Block';

  @override
  String get friendsUnblock => 'Unblock';

  @override
  String friendsBlockBody(String name) {
    return 'Block $name? Neither of you will be able to message the other directly. Group chats you share stay open.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Unblock $name?';
  }

  @override
  String get friendsBlocked => 'Blocked users';

  @override
  String friendsProfileHidden(String name) {
    return '$name keeps their profile private.';
  }

  @override
  String get friendsAppearOffline => 'Appear Offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Friends always see you as offline';

  @override
  String get friendsHideNowPlaying => 'Hide What I\'m Watching';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Friends still see you online, but not what\'s playing';

  @override
  String get friendsHideLastWatched => 'Hide My Last Watched';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Friends won\'t see what you watched last while you\'re offline';

  @override
  String get friendsMessageNotifications => 'Message Notifications';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Show a banner when a friend messages you';

  @override
  String get friendsMuteDuringPlayback => 'Mute During Playback';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'No message banners while a video or game is playing';

  @override
  String get friendsSaveFailed => 'Could not save your settings.';

  @override
  String get chatNew => 'New message';

  @override
  String get chatNewSubtitle => 'Start a chat with a friend';

  @override
  String get chatNewGroup => 'New group';

  @override
  String get chatNewGroupSubtitle => 'Chat with several friends at once';

  @override
  String get chatNone => 'No messages yet.';

  @override
  String get chatYou => 'You';

  @override
  String chatYouSaid(String text) {
    return 'You: $text';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Search emoji';

  @override
  String get chatNoRecentEmoji => 'No recent emoji';

  @override
  String get chatViewPhoto => 'View photo';

  @override
  String get chatHint => 'Write a message';

  @override
  String get chatAttach => 'Send a photo';

  @override
  String get chatEdited => 'edited';

  @override
  String get chatSeen => 'Seen';

  @override
  String get chatSent => 'Sent';

  @override
  String get chatEditing => 'Editing message';

  @override
  String get chatMessageOptions => 'Message options';

  @override
  String get chatDeleteBody => 'Delete this message for everyone?';

  @override
  String get chatClear => 'Clear conversation';

  @override
  String get chatClearBody =>
      'Delete every message in this chat for everyone in it?';

  @override
  String get chatGroupInfo => 'Group info';

  @override
  String get chatGroupName => 'Group name';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Owner';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Make admin';

  @override
  String get chatRemoveAdmin => 'Remove admin';

  @override
  String get chatRemoveMember => 'Remove from group';

  @override
  String get chatAddMember => 'Add people';

  @override
  String get chatNobodyToAdd => 'No one left to add.';

  @override
  String get chatLeave => 'Leave group';

  @override
  String get chatLeaveBody =>
      'Leave this group? Someone will have to add you back to rejoin.';

  @override
  String get chatCreate => 'Create group';

  @override
  String get chatPickMembers => 'Pick at least two friends';

  @override
  String chatNewMessageFrom(String name) {
    return 'New message from $name';
  }

  @override
  String get chatImageTooLarge => 'That image is over 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Only PNG, JPEG, GIF and WebP images can be sent.';

  @override
  String get embeddedBrowserNotAvailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಎಂಬೆಡೆಡ್ ಬ್ರೌಸರ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRestartServerConfirmation =>
      'ಸರ್ವರ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';

  @override
  String get adminShutdownServerConfirmation =>
      'ಸರ್ವರ್ ಅನ್ನು ಸ್ಥಗಿತಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ? ನೀವು ಅದನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ಮರುಪ್ರಾರಂಭಿಸಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get internal => 'ಆಂತರಿಕ';

  @override
  String get idle => 'ನಿಷ್ಕ್ರಿಯ';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ಯಾವುದೇ ಬಳಕೆದಾರರು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoUsersMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಬಳಕೆದಾರರು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoDevicesFound => 'ಯಾವುದೇ ಸಾಧನಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗಳಿಗೆ ಯಾವುದೇ ಸಾಧನಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get remoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶ';

  @override
  String get localOnly => 'ಸ್ಥಳೀಯ ಮಾತ್ರ';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'ಮಾಧ್ಯಮ ವಿಶ್ಲೇಷಣೆಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'ಎಲ್ಲಾ ಮಾಧ್ಯಮ ಲೈಬ್ರರಿಗಳ ಸಂಯೋಜಿತ ವಿಶ್ಲೇಷಣೆ.';

  @override
  String get analyticsTopArtists => 'ಪ್ರಮುಖ ಕಲಾವಿದರು';

  @override
  String get analyticsTopAuthors => 'ಪ್ರಮುಖ ಲೇಖಕರು';

  @override
  String get analyticsTopContributors => 'ಪ್ರಮುಖ ಕೊಡುಗೆದಾರರು';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಲೈಬ್ರರಿಗಳು',
      one: '1 ಲೈಬ್ರರಿ',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'ಈ ಆಯ್ಕೆಗಾಗಿ ಇನ್ನೂ ಯಾವುದೇ ಇಂಡೆಕ್ಸ್ ಮಾಡಿದ ಮಾಧ್ಯಮ ಒಟ್ಟುಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get analyticsLibraryDetails => 'ಲೈಬ್ರರಿ ವಿವರಗಳು';

  @override
  String get analyticsLibraryBreakdown => 'ಲೈಬ್ರರಿ ವಿಭಜನೆ';

  @override
  String get analyticsNoLibrariesAvailable => 'ಯಾವುದೇ ಲೈಬ್ರರಿಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get analyticsLibraryShare => 'Share of items by library';

  @override
  String get analyticsTopRating => 'Most common rating';

  @override
  String get analyticsTypicalRuntime => 'Typical runtime';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% of items';
  }

  @override
  String get adminServerAdministrationTitle => 'ಸರ್ವರ್ ಆಡಳಿತ';

  @override
  String get adminServerPathData => 'ಡೇಟಾ';

  @override
  String get adminServerPathImageCache => 'ಚಿತ್ರ ಕ್ಯಾಶ್';

  @override
  String get adminServerPathCache => 'ಕ್ಯಾಶ್';

  @override
  String get adminServerPathLogs => 'ಲಾಗ್‌ಗಳು';

  @override
  String get adminServerPathMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminServerPathTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'ಈ ಸರ್ವರ್ ಯಾವುದೇ ಸರ್ವರ್ ಪಥಗಳನ್ನು ಹಿಂತಿರುಗಿಸಲಿಲ್ಲ.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ಬಳಸಲಾಗಿದೆ';
  }

  @override
  String get userActivity => 'ಬಳಕೆದಾರ ಚಟುವಟಿಕೆ';

  @override
  String get systemEvents => 'ಸಿಸ್ಟಂ ಈವೆಂಟ್‌ಗಳು';

  @override
  String get needsAttention => 'ಗಮನ ಅಗತ್ಯವಿದೆ';

  @override
  String get homeVideos => 'ಹೋಮ್ ವಿಡಿಯೋಗಳು';

  @override
  String get mixedContent => 'ಮಿಶ್ರ ವಿಷಯ';

  @override
  String get homeVideosAndPhotos => 'ಹೋಮ್ ವಿಡಿಯೋಗಳು ಮತ್ತು ಫೋಟೋಗಳು';

  @override
  String get mixedMoviesAndShows => 'ಮಿಶ್ರ ಚಲನಚಿತ್ರಗಳು ಮತ್ತು ಶೋಗಳು';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'ಯಾವುದೇ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ಆರ್ಕೈವ್ ಒಳಗೆ ಯಾವುದೇ ಚಿತ್ರ ಪುಟಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'ಎಂಬೆಡೆಡ್ ರೆಂಡರರ್ ವಿಫಲವಾಗಿದೆ ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB ರೆಂಡರರ್ ವಿಫಲವಾಗಿದೆ ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ರೀಡರ್‌ಗೆ ಸ್ಥಳೀಯ ಫೈಲ್ ಕಾಣೆಯಾಗಿದೆ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri ನಿಂದ ಪುಸ್ತಕ ಡೇಟಾ ತೆರೆಯುವಾಗ HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'ಯಾವುದೇ ಓದಬಹುದಾದ ಪುಸ್ತಕ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'ಬೆಂಬಲಿಸದ ಕಾಮಿಕ್ ಆರ್ಕೈವ್ ಸ್ವರೂಪ: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CBR ಹೊರತೆಗೆಯುವಿಕೆ ಪ್ಲಗಿನ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr ಆರ್ಕೈವ್ ಅನ್ನು ಹೊರತೆಗೆಯಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get cb7ExtractionUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CB7 ಹೊರತೆಗೆಯುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CB7 ಹೊರತೆಗೆಯುವಿಕೆ ಪ್ಲಗಿನ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get loadingShuffle => 'ಷಫಲ್ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get libraryShuffleLabel => 'ಲೈಬ್ರರಿ ಷಫಲ್';

  @override
  String get randomShuffleLabel => 'ಯಾದೃಚ್ಛಿಕ ಷಫಲ್';

  @override
  String get genresShuffleLabel => 'ಪ್ರಕಾರಗಳ ಷಫಲ್';

  @override
  String get autoHdrSwitching => 'ಸ್ವಯಂ HDR ಬದಲಾವಣೆ';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR ವಿಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್‌ಗಾಗಿ HDR ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ನಿರ್ಗಮಿಸಿದಾಗ ಪ್ರದರ್ಶನ ಮೋಡ್ ಅನ್ನು ಮರುಸ್ಥಾಪಿಸಿ.';

  @override
  String get whenFullscreen => 'ಪೂರ್ಣಪರದೆಯಲ್ಲಿದ್ದಾಗ';

  @override
  String get changeArtwork => 'ಕಲಾಕೃತಿಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get missing => 'ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get clearAllArtworkButton => 'ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸುವುದೇ?';

  @override
  String get clearAllArtworkWarning =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';

  @override
  String get confirmClear => 'ತೆರವುಗೊಳಿಸುವಿಕೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String confirmClearMessage(String itemType) {
    return 'ಈ $itemType ಅನ್ನು ತೆರವುಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String get uploadButton => 'ಅಪ್‌ಲೋಡ್ ಮಾಡುವುದೇ?';

  @override
  String get resolutionLabel => 'ರೆಸಲ್ಯೂಶನ್: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'ಇಂಟರ್‌ಫೇಸ್ ಭಾಷೆಯಲ್ಲಿ ಮಾತ್ರ ಕಲಾಕೃತಿಯನ್ನು ತೋರಿಸಿ';

  @override
  String get confirmClearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸುವುದನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get imageUploadSuccess => 'ಚಿತ್ರವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ!';

  @override
  String imageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get yes => 'ಹೌದು';

  @override
  String get posterCategory => 'ಪೋಸ್ಟರ್';

  @override
  String get backdropsCategory => 'ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು';

  @override
  String get bannerCategory => 'ಬ್ಯಾನರ್';

  @override
  String get logoCategory => 'ಲೋಗೋ';

  @override
  String get thumbnailCategory => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get artCategory => 'ಆರ್ಟ್';

  @override
  String get discArtCategory => 'ಡಿಸ್ಕ್ ಆರ್ಟ್';

  @override
  String get screenshotCategory => 'ಸ್ಕ್ರೀನ್‌ಶಾಟ್';

  @override
  String get boxCoverCategory => 'ಬಾಕ್ಸ್ ಕವರ್';

  @override
  String get boxRearCoverCategory => 'ಬಾಕ್ಸ್ ಹಿಂಬದಿ ಕವರ್';

  @override
  String get menuArtCategory => 'ಮೆನು ಆರ್ಟ್';

  @override
  String get confirmItemPoster => 'ಪೋಸ್ಟರ್';

  @override
  String get confirmItemBackdrop => 'ಬ್ಯಾಕ್‌ಡ್ರಾಪ್';

  @override
  String get confirmItemBanner => 'ಬ್ಯಾನರ್';

  @override
  String get confirmItemLogo => 'ಲೋಗೋ';

  @override
  String get confirmItemThumbnail => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get confirmItemArt => 'ಆರ್ಟ್';

  @override
  String get confirmItemDiscArt => 'ಡಿಸ್ಕ್ ಆರ್ಟ್';

  @override
  String get confirmItemScreenshot => 'ಸ್ಕ್ರೀನ್‌ಶಾಟ್';

  @override
  String get confirmItemBoxCover => 'ಬಾಕ್ಸ್ ಕವರ್';

  @override
  String get confirmItemBoxRearCover => 'ಬಾಕ್ಸ್ ಹಿಂಬದಿ ಕವರ್';

  @override
  String get confirmItemMenuArt => 'ಮೆನು ಆರ್ಟ್';

  @override
  String get resolutionAll => 'ಎಲ್ಲಾ';

  @override
  String get resolutionHigh => 'ಹೆಚ್ಚು (1080p+)';

  @override
  String get resolutionMedium => 'ಮಧ್ಯಮ (720p)';

  @override
  String get resolutionLow => 'ಕಡಿಮೆ (<720p)';

  @override
  String get sources => 'ಮೂಲಗಳು';

  @override
  String get audiobookChapters => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get audiobookBookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';

  @override
  String get audiobookNotes => 'ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get audiobookQueue => 'ಸರತಿ';

  @override
  String get audiobookTimeline => 'ಟೈಮ್‌ಲೈನ್';

  @override
  String get audiobookTimelineEmpty => 'ಟೈಮ್‌ಲೈನ್ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String get audiobookFocusedTimeline => 'ಕೇಂದ್ರೀಕೃತ ಟೈಮ್‌ಲೈನ್';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳನ್ನು ರಫ್ತು ಮಾಡಿ';

  @override
  String get audiobookExportNotes => 'ಟಿಪ್ಪಣಿಗಳನ್ನು ರಫ್ತು ಮಾಡಿ';

  @override
  String get audiobookExportAll => 'ಎಲ್ಲವನ್ನೂ ರಫ್ತು ಮಾಡಿ';

  @override
  String audiobookExportSuccess(String path) {
    return '$path ಗೆ ರಫ್ತು ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'ರಫ್ತು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get audiobookLyrics => 'ಸಾಹಿತ್ಯ';

  @override
  String get audiobookAddBookmark => 'ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಿ';

  @override
  String get audiobookAddNote => 'ಟಿಪ್ಪಣಿ ಸೇರಿಸಿ';

  @override
  String get audiobookEditNote => 'ಟಿಪ್ಪಣಿ ಸಂಪಾದಿಸಿ';

  @override
  String get audiobookNoteHint => 'ಈ ಕ್ಷಣಕ್ಕಾಗಿ ಟಿಪ್ಪಣಿ ಬರೆಯಿರಿ';

  @override
  String get audiobookSleepTimer => 'ಸ್ಲೀಪ್ ಟೈಮರ್';

  @override
  String get audiobookSleepOff => 'ಆಫ್';

  @override
  String get audiobookSleepEndOfChapter => 'ಅಧ್ಯಾಯದ ಕೊನೆ';

  @override
  String get audiobookSleepCustom => 'ಕಸ್ಟಮ್';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining ಬಾಕಿ';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ನಿಮಿ',
      one: '1 ನಿಮಿ',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ';

  @override
  String get audiobookRemainingTime => 'ಬಾಕಿ';

  @override
  String get audiobookElapsedTime => 'ಕಳೆದದ್ದು';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$secondsಸೆ ಹಿಂದೆ';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$secondsಸೆ ಮುಂದೆ';
  }

  @override
  String get audiobookPreviousChapter => 'ಹಿಂದಿನ ಅಧ್ಯಾಯ';

  @override
  String get audiobookNextChapter => 'ಮುಂದಿನ ಅಧ್ಯಾಯ';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total ರಲ್ಲಿ ಅಧ್ಯಾಯ $current';
  }

  @override
  String get audiobookNoChapters => 'ಯಾವುದೇ ಅಧ್ಯಾಯಗಳಿಲ್ಲ';

  @override
  String get audiobookNoBookmarks => 'ಇನ್ನೂ ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ';

  @override
  String get audiobookNoNotes => 'ಇನ್ನೂ ಯಾವುದೇ ಟಿಪ್ಪಣಿಗಳಿಲ್ಲ';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position ನಲ್ಲಿ ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಲಾಗಿದೆ';
  }

  @override
  String get audiobookSpeedReset => '1.0x ಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'ಉಳಿಸಿ';

  @override
  String get audiobookCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get audiobookDelete => 'ಅಳಿಸಿ';

  @override
  String get subtitlePreferencesDescription =>
      'ಉಪಶೀರ್ಷಿಕೆ ಮೋಡ್‌ಗಳು, ಡೀಫಾಲ್ಟ್ ಭಾಷೆಗಳು, ಗೋಚರತೆ ಮತ್ತು ರೆಂಡರಿಂಗ್ ಆಯ್ಕೆಗಳನ್ನು ಬದಲಾಯಿಸಿ.';

  @override
  String get subtitleRendering => 'ಉಪಶೀರ್ಷಿಕೆ ರೆಂಡರಿಂಗ್';

  @override
  String get displayOptions => 'ಪ್ರದರ್ಶನ ಆಯ್ಕೆಗಳು';

  @override
  String get releaseDateAscending => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ (ಆರೋಹಣ)';

  @override
  String get releaseDateDescending => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ (ಅವರೋಹಣ)';

  @override
  String get groupContributions => 'ಕೊಡುಗೆಗಳನ್ನು ಗುಂಪು ಮಾಡಿ';

  @override
  String get groupMultipleRoles => 'ಬಹು ಪಾತ್ರಗಳನ್ನು ಗುಂಪು ಮಾಡಿ';

  @override
  String get libraryWriteAccessWarningTitle => 'ಲೈಬ್ರರಿ ಬರೆಯುವ ಪ್ರವೇಶ ಎಚ್ಚರಿಕೆ';

  @override
  String get libraryWriteAccessHowToFix => 'ಇದನ್ನು ಸರಿಪಡಿಸುವುದು ಹೇಗೆ:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. ಸರ್ವರ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಮಾಧ್ಯಮ ಲೈಬ್ರರಿ ಫೋಲ್ಡರ್‌ಗಳಿಗಾಗಿ Jellyfin ಸೇವಾ ಬಳಕೆದಾರರಿಗೆ (ಉದಾ. jellyfin ಅಥವಾ Docker PUID/PGID) ಬರೆಯುವ ಅನುಮತಿಗಳನ್ನು ನೀಡಿ.\n\n2. ಅಥವಾ, ನಿಮ್ಮ Jellyfin ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ -> Libraries ಗೆ ಹೋಗಿ, ಈ ಲೈಬ್ರರಿಯನ್ನು ಸಂಪಾದಿಸಿ, ಮತ್ತು Jellyfin ನ ಆಂತರಿಕ ಡೇಟಾಬೇಸ್‌ನಲ್ಲಿ ಕಲಾಕೃತಿಯನ್ನು ಸಂಗ್ರಹಿಸಲು \'Save artwork into media folders\' ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get dismiss => 'ವಜಾಗೊಳಿಸಿ';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'ನಿಮ್ಮ \'$libraryName\' ಲೈಬ್ರರಿಯನ್ನು ಕಲಾಕೃತಿಯನ್ನು ನೇರವಾಗಿ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಲು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ (\'Save artwork into media folders\' ಸಕ್ರಿಯಗೊಂಡಿದೆ). ಆದಾಗ್ಯೂ, Jellyfin ಬರೆಯುವ ಪ್ರವೇಶವನ್ನು ಪರೀಕ್ಷಿಸಿದೆ ಮತ್ತು ಈ ಡೈರೆಕ್ಟರಿಗೆ ಫೈಲ್‌ಗಳನ್ನು ಬರೆಯಲು ಅನುಮತಿ ಇಲ್ಲ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin ಕಲಾಕೃತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾದಂತೆ ಕಾಣುತ್ತದೆ. ನಿಮ್ಮ ಲೈಬ್ರರಿಯನ್ನು ಕಲಾಕೃತಿಯನ್ನು ನೇರವಾಗಿ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಲು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ (\'Save artwork into media folders\' ಸಕ್ರಿಯಗೊಂಡಿದೆ). Jellyfin ಸರ್ವರ್ ಪ್ರಕ್ರಿಯೆಗೆ ನಿಮ್ಮ ಮಾಧ್ಯಮ ಡೈರೆಕ್ಟರಿಗಳಿಗೆ ಫೈಲ್‌ಗಳನ್ನು ಬರೆಯಲು ಅನುಮತಿ ಇಲ್ಲದಿದ್ದಾಗ ಈ ದೋಷ ಸಾಮಾನ್ಯವಾಗಿ ಸಂಭವಿಸುತ್ತದೆ.';

  @override
  String get replay => 'ಮತ್ತೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get fileInformation => 'ಫೈಲ್ ಮಾಹಿತಿ';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'ಗಾತ್ರ: $size  •  ಸ್ವರೂಪ: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'ಎಲ್ಲಾ ($count) ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ತೋರಿಸಿ';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'ಎಲ್ಲಾ ($count) ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ತೋರಿಸಿ';
  }

  @override
  String get checkingDirectPlay =>
      'ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get directPlayCapabilityLabel => 'ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ಸಾಮರ್ಥ್ಯ: ';

  @override
  String get forced => 'ಫೋರ್ಸ್ಡ್';

  @override
  String get transcodeContainerNotSupported =>
      'ಕಂಟೇನರ್ ಸ್ವರೂಪವನ್ನು ಪ್ಲೇಯರ್ ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get transcodeVideoCodecNotSupported => 'ವಿಡಿಯೋ ಕೊಡೆಕ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeAudioCodecNotSupported => 'ಆಡಿಯೋ ಕೊಡೆಕ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'ಉಪಶೀರ್ಷಿಕೆ ಸ್ವರೂಪ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ (ಬರ್ನಿಂಗ್ ಅಗತ್ಯವಿದೆ).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ಆಡಿಯೋ ಪ್ರೊಫೈಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'ವಿಡಿಯೋ ಪ್ರೊಫೈಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoLevelNotSupported => 'ವಿಡಿಯೋ ಲೆವೆಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'ಈ ಸಾಧನದಲ್ಲಿ ವಿಡಿಯೋ ರೆಸಲ್ಯೂಶನ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'ವಿಡಿಯೋ ಬಿಟ್ ಆಳ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'ವಿಡಿಯೋ ಫ್ರೇಮ್‌ರೇಟ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ಫೈಲ್ ಬಿಟ್‌ರೇಟ್ ಪ್ಲೇಯರ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'ವಿಡಿಯೋ ಬಿಟ್‌ರೇಟ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ಆಡಿಯೋ ಬಿಟ್‌ರೇಟ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ಆಡಿಯೋ ಚಾನೆಲ್‌ಗಳ ಸಂಖ್ಯೆ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Audio codec ($codec) is not supported directly.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Tip: If your audio receiver or soundbar supports $codec, enable Audio Passthrough in Audio settings.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Audio channel count (${channels}ch) exceeds the player limit.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Tip: Adjust \'Max Audio Channels\' or multichannel downmixing in Audio settings.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'ASS/SSA subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Tip: Enable \'ASS/SSA Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'PGS subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Tip: Enable \'PGS Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Subtitle format ($codec) is not supported directly and must be burned in.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'File bitrate ($fileBitrate) exceeds the configured streaming limit ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Tip: Increase \'Maximum Bitrate\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeResolutionHint =>
      'Tip: Increase \'Maximum Resolution\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Video dynamic range (e.g. Dolby Vision / HDR) is not supported by this display.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision Profile 7 enhancement layer direct play is disabled.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Tip: Enable \'Dolby Vision Profile 7 Direct Play\' in Playback settings if your display supports it.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Transcoding is preferred for Dolby Vision fallback per user settings.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Tip: Set \'Dolby Vision Fallback\' to \'Play as HDR10\' in Playback settings to avoid transcoding.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Connected display does not report support for HDR or Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Connected display lacks HDR10 support needed for Dolby Vision fallback.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Audio sample rate is not supported.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Audio bit depth is not supported.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Video reference frames exceed player limits.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorphic video is not supported.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Interlaced video is not supported.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Secondary audio stream requires transcoding.';

  @override
  String get transcodeDirectPlayError =>
      'Direct play is not supported for this media format.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ';

  @override
  String get sortReleaseAscending => 'ಬಿಡುಗಡೆ ಕ್ರಮ (ಆರೋಹಣ)';

  @override
  String get sortReleaseDescending => 'ಬಿಡುಗಡೆ ಕ್ರಮ (ಅವರೋಹಣ)';

  @override
  String get sortCustomDragDrop => 'ಕಸ್ಟಮ್ (ಎಳೆದು-ಬಿಡಿ)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'ಪ್ಲೇಪಟ್ಟಿ ವಿಂಗಡಣೆ ಆಯ್ಕೆಗಳು';

  @override
  String get resetSort => 'ವಿಂಗಡಣೆಯನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode ಅನ್ನು ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';
  }

  @override
  String get rewatchPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get noSubtitlesFound => 'ಯಾವುದೇ ಉಪಶೀರ್ಷಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get adminControls => 'ನಿರ್ವಾಹಕ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get impellerRendering => 'ರೆಂಡರಿಂಗ್ ಎಂಜಿನ್ (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ಎಂಬುದು ಸುಗಮ ಅನಿಮೇಶನ್‌ಗಳು ಮತ್ತು ಕಡಿಮೆ ಸ್ಟಟರ್‌ಗಾಗಿ Flutter ನ ಆಧುನಿಕ GPU ರೆಂಡರರ್. ಕೆಲವು TV ಬಾಕ್ಸ್‌ಗಳು ಮತ್ತು ಹಳೆಯ GPU ಗಳಲ್ಲಿ ಇದು ಗ್ಲಿಚ್‌ಗಳು ಅಥವಾ ಕಪ್ಪು ವಿಡಿಯೋಗೆ ಕಾರಣವಾಗಬಹುದು; ಅವು ಕಂಡುಬಂದರೆ ಇದನ್ನು ಆಫ್ ಮಾಡಿ. ಸ್ವಯಂಚಾಲಿತವು ನಿಮ್ಮ ಸಾಧನಕ್ಕೆ ಅತ್ಯುತ್ತಮ ಡೀಫಾಲ್ಟ್ ಆಯ್ಕೆಮಾಡುತ್ತದೆ. ಅನ್ವಯಿಸಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get impellerAuto => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get impellerOn => 'ಆನ್';

  @override
  String get impellerOff => 'ಆಫ್';

  @override
  String get impellerRestartTitle => 'ಮರುಪ್ರಾರಂಭ ಅಗತ್ಯವಿದೆ';

  @override
  String get impellerRestartMessage =>
      'ರೆಂಡರಿಂಗ್ ಎಂಜಿನ್ ಬದಲಾಯಿಸಲು Moonfin ಮರುಪ್ರಾರಂಭಿಸಬೇಕಾಗಿದೆ. ಈಗ ಆ್ಯಪ್ ಮುಚ್ಚಿ, ನಂತರ ಅನ್ವಯಿಸಲು ಅದನ್ನು ಮತ್ತೆ ತೆರೆಯಿರಿ.';

  @override
  String get impellerCloseNow => 'ಈಗ ಆ್ಯಪ್ ಮುಚ್ಚಿ';

  @override
  String get adminRefreshLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get adminRefreshAllLibraries => 'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get adminRepoSortDateOldest => 'ಸೇರಿಸಿದ ದಿನಾಂಕ (ಹಳೆಯದು ಮೊದಲು)';

  @override
  String get adminRepoSortDateNewest => 'ಸೇರಿಸಿದ ದಿನಾಂಕ (ಹೊಸದು ಮೊದಲು)';

  @override
  String get adminRepoSortNameAsc => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ (A ಇಂದ Z)';

  @override
  String get adminRepoSortNameDesc => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ (Z ಇಂದ A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'ಸರ್ವರ್ ವಿಶ್ಲೇಷಣೆ ಲೋಡ್ ಆಗುತ್ತಿದೆ... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'ಮೂಲಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get imdbTop250Movies => 'IMDb ಟಾಪ್ 250 ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbTop250TvShows => 'IMDb ಟಾಪ್ 250 ಟಿವಿ ಶೋಗಳು';

  @override
  String get imdbMostPopularMovies => 'IMDb ಅತ್ಯಂತ ಜನಪ್ರಿಯ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbMostPopularTvShows => 'IMDb ಅತ್ಯಂತ ಜನಪ್ರಿಯ ಟಿವಿ ಶೋಗಳು';

  @override
  String get imdbLowestRatedMovies =>
      'IMDb ಅತ್ಯಂತ ಕಡಿಮೆ ರೇಟ್ ಮಾಡಿದ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ಅತ್ಯುತ್ತಮ ರೇಟ್ ಮಾಡಿದ ಇಂಗ್ಲಿಷ್ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get addToWatchlist => 'Add to Watchlist';

  @override
  String get removeFromWatchlist => 'Remove from Watchlist';

  @override
  String get watchlistUpdateFailed => 'Couldn\'t update watchlist';

  @override
  String get adminSearchParameters => 'Search Parameters';

  @override
  String get adminCurrentMetadata => 'Current Metadata';

  @override
  String get adminLabelYear => 'Year';

  @override
  String get adminReplaceImages => 'Replace existing images';

  @override
  String get adminBackToSearch => 'Back to Search Criteria';

  @override
  String get grouping => 'Grouping';

  @override
  String get groupByType => 'Group by Type';

  @override
  String get playlistTypes => 'Playlist Types';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Audio (Music)';

  @override
  String get playlistTypeAudiobook => 'Audiobook';

  @override
  String get playlistTypeBook => 'Book';

  @override
  String get playlistTypePhoto => 'Photo';

  @override
  String get playlistTypeMixed => 'Mixed';

  @override
  String get videoPlaylistsSection => 'Video Playlists';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Audio Playlists';

  @override
  String get audiobookPlaylistsSection => 'Audiobook Playlists';

  @override
  String get bookPlaylistsSection => 'Book Playlists';

  @override
  String get photoPlaylistsSection => 'Photo Playlists';

  @override
  String get mixedPlaylistsSection => 'Mixed Playlists';

  @override
  String get currentTime => 'Current Time';

  @override
  String get playbackTimeDisplay => 'Progress Bar Time';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Choose which time labels appear around the playback progress bar.';

  @override
  String get playbackTimeTotal => 'Total duration';

  @override
  String get playbackTimeRemaining => 'Time remaining';

  @override
  String get playbackTimeEndsAt => 'Ends at';

  @override
  String get playbackTimeElapsed => 'Time elapsed';

  @override
  String get playbackTimeVideoSection => 'Video Player';

  @override
  String get playbackTimeMusicSection => 'Music Player';

  @override
  String get playbackTimeSlotDescription =>
      'Choose what is shown here, or hide it.';

  @override
  String get playbackTimeAboveBarLeft => 'Above bar, left';

  @override
  String get playbackTimeAboveBarCenter => 'Above bar, center';

  @override
  String get playbackTimeAboveBarRight => 'Above bar, right';

  @override
  String get playbackTimeBelowBarLeft => 'Below bar, left';

  @override
  String get playbackTimeBelowBarCenter => 'Below bar, center';

  @override
  String get playbackTimeBelowBarRight => 'Below bar, right';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Choose what is shown on the right side of the music progress bar.';

  @override
  String get groupByTitle => 'Group By';

  @override
  String get groupByDecade => 'Decade (Year)';

  @override
  String get groupByParentalRating => 'Parental Rating';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Show Alphabet';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Personal Rating Style';

  @override
  String get personalRatingThumbs => 'Like / dislike';

  @override
  String get personalRatingStars => '5 stars';

  @override
  String get personalRatingNumeric => 'Numeric score out of 10';

  @override
  String get rate => 'Rate';

  @override
  String get like => 'Like';

  @override
  String get dislike => 'Dislike';

  @override
  String get personalRatingClear => 'Clear rating';

  @override
  String get personalRatingRated => 'Rated';

  @override
  String get personalRatingMine => 'My Rating';

  @override
  String get personalRatingSaveFailed => 'Could not save rating';

  @override
  String get increase => 'Increase';

  @override
  String get decrease => 'Decrease';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'In Progress';

  @override
  String get filterUnreleased => 'Unreleased';

  @override
  String get filterTrailers => 'Trailers';

  @override
  String get filterExtras => 'Extras';

  @override
  String get filterThemeSongs => 'Theme Songs';

  @override
  String get filterThemeVideos => 'Theme Videos';

  @override
  String get source => 'Source';

  @override
  String get years => 'Years';

  @override
  String get audioLanguage => 'Audio Language';

  @override
  String get subtitleLanguage => 'Subtitle Language';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get seerrShortcutsRow => 'Seerr Browse';

  @override
  String get seerrReleased => 'Released';

  @override
  String get seerrMinRating => 'Minimum Rating';

  @override
  String get seerrMinVotes => 'Minimum Votes';

  @override
  String get seerrOriginalLanguage => 'Original Language';

  @override
  String get seerrRuntime => 'Runtime';

  @override
  String get subtitleHdrSeparate => 'Separate HDR Style';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'White is much brighter in HDR than in SDR, so a dimmer style here avoids the glare';

  @override
  String get scrollSensitivity => 'Scroll Sensitivity';

  @override
  String get scrollSensitivitySubtitle =>
      'How far one mouse wheel notch scrolls';

  @override
  String get mediaDetailsAndSpoilers => 'Media Details and Spoilers';

  @override
  String get openTrailersExternally => 'Open Trailers in External App';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailers open in the YouTube app or browser instead of the built-in player';

  @override
  String get hideDetailsMediaDescription => 'Hide Media Description';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get detailUseSeriesThumbnails => 'Use Series Thumbnails';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Replace all thumbnails on Classic details page with series thumbnail';

  @override
  String get hideHomeMediaDescription => 'Hide Media Description';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get hideHomeWatchProgress => 'Hide Watch Progress';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Hide the progress bar on posters you\'ve started watching.';

  @override
  String get hideHomeUnwatchedCount => 'Hide Unwatched Count';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Hide the badge showing how many episodes are left to watch.';

  @override
  String get continueWatchingAndNextUpHeader => 'Continue Watching and Next Up';

  @override
  String get setupSkip => 'Skip setup';

  @override
  String get setupNavbarQuestion => 'Where should navigation go?';

  @override
  String get setupMediaBarQuestion =>
      'How should the top of your Home screen look?';

  @override
  String get setupHomeRowsQuestion => 'How should your rows look?';

  @override
  String get setupDetailQuestion =>
      'How should a movie or show look when you open it?';

  @override
  String get setupTourQuestion => 'You\'re set. Here\'s what else is in here.';

  @override
  String get setupPlaybackLanguages => 'Playback languages';

  @override
  String get setupOptional => 'Optional';

  @override
  String get setupStyleClassic => 'Classic';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint => 'Compact. More rows on screen at once.';

  @override
  String get setupRowsModernHint => 'Larger cards with titles underneath.';

  @override
  String get setupDetailClassicHint => 'Everything centred in one stack.';

  @override
  String get setupDetailModernHint =>
      'Cinematic, with tabs for cast and extras.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Hero-first, with pop-up cards for cast and extras.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Full-screen, with sections stacked instead of tabs.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, one play button and the episodes.';

  @override
  String get setupNavbarStyleQuestion => 'How should the bottom bar look?';

  @override
  String get setupNavbarStyleDockHint =>
      'A floating pill with labels under every tab.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Search gets its own button, and the bar shrinks while you scroll.';

  @override
  String get setupNavbarStyleStripHint =>
      'A full-width bar along the bottom edge.';

  @override
  String get setupPickALook => 'Pick a look';

  @override
  String get setupTourMoreHeader => 'There is more waiting in Settings';

  @override
  String get setupTourBulletRequests => 'Seerr requests';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay watch parties';

  @override
  String get setupTourBulletThemes => 'Custom themes';

  @override
  String get setupTourBulletDownloads => 'Offline downloads';

  @override
  String get setupTourBulletMore => 'And plenty more';

  @override
  String setupStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get setupCurrent => 'Current';

  @override
  String get setupTvHint =>
      'Up and down to preview · OK to choose · Back twice to skip';

  @override
  String get setupNavbarTopHint => 'Tabs across the top of the screen.';

  @override
  String get setupNavbarLeftHint => 'A slim rail of icons down the left side.';

  @override
  String get setupNavbarBottomHint =>
      'Tabs along the bottom edge, in easy reach of your thumb.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Large artwork with the title, details and overview laid over it.';

  @override
  String get setupMediaBarMakdHint => 'Large artwork led by a big title logo.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titles shelved as book spines, with the featured one face out.';

  @override
  String get setupMediaBarGalleryHint =>
      'The featured title opened up, with the next few lined up beside it.';

  @override
  String get setupMediaBarBannerHint =>
      'A shorter banner above your rows, so more of them fit on screen.';

  @override
  String get setupMediaBarAyaHint =>
      'Artwork first in a framed panel, with your rows right underneath.';

  @override
  String get setupMediaBarOffHint =>
      'No featured area. Home opens straight onto your rows.';

  @override
  String get runSetupAgain => 'Run setup again';

  @override
  String get serverMessages => 'Messages';

  @override
  String get serverMessagesEmpty => 'No messages from your server yet';

  @override
  String get serverMessagesMarkAllRead => 'Mark all as read';

  @override
  String get serverMessagesShowButton => 'Show Messages Button';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Adds a button to the menu for messages sent by your server admin';

  @override
  String get showBookDiscoverTab => 'Show Book Library Discovery';

  @override
  String get showBookDiscoverTabDescription =>
      'Browse titles from Open Library and LibriVox in your book and audiobook libraries';

  @override
  String get autoDownloadNewEpisodes => 'Auto-download new episodes';

  @override
  String get autoDownloadStop => 'Stop auto-download';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads new episodes, up to $count unwatched at a time',
      one: 'Downloads new episodes, up to 1 unwatched at a time',
      zero: 'Downloads every new episode',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'On • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Transcoded qualities only download while Moonfin is open. Original quality also downloads in the background.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Transcoded downloads can\'t resume after an interruption and start over from the beginning. Original quality can resume.';

  @override
  String get autoDownloadForegroundOnly =>
      'Downloads only while Moonfin is open';

  @override
  String get autoDownloadQualityTitle => 'Auto-download quality';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Auto-download enabled for $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Auto-download stopped for $title';
  }

  @override
  String get smartDownloadsSection => 'Smart downloads';

  @override
  String get smartDownloadsEnable => 'Download Next Episodes';

  @override
  String get smartDownloadsEnableDescription =>
      'When you finish an episode on any device, Moonfin downloads the next ones. Episodes it downloads are deleted once watched.';

  @override
  String get smartDownloadsKeepReady => 'Episodes to Keep Downloaded';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keeps the next $count episodes downloaded',
      one: 'Keeps the next episode downloaded',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Episodes already downloaded stay on your device. The new number applies to future downloads.';

  @override
  String get autoDownloadSection => 'Automatic downloads';

  @override
  String get autoDownloadEnable => 'Enable Automatic Downloads';

  @override
  String get autoDownloadEnableSubtitle =>
      'Downloads new episodes of the series you follow. Existing episodes can still be downloaded manually.';

  @override
  String get autoDownloadKeepUnwatched => 'Keep Unwatched Episodes';

  @override
  String get autoDownloadKeepAll => 'All';

  @override
  String get autoDownloadDelete => 'Delete Downloaded Episodes';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'When to remove episodes downloaded for series you follow, after you watch them';

  @override
  String get removeWatchedDownloads => 'Remove Watched Downloads';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'When to remove episodes and movies you downloaded yourself. Only those you watch after turning this on are removed';

  @override
  String get keepDownloaded => 'Keep Downloaded';

  @override
  String get keepDownloadedSubtitle =>
      'Never remove this automatically after watching';

  @override
  String get autoDownloadDeleteNever => 'Never';

  @override
  String get autoDownloadDeleteImmediately => 'Right after watching';

  @override
  String get autoDownloadDeleteAfterDay => '1 day after watching';

  @override
  String get autoDownloadDeleteAfterWeek => '1 week after watching';

  @override
  String get autoDownloadBackgroundRefresh => 'Check in the Background';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Allow the system to check for new episodes periodically while Moonfin is closed';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Background App Refresh is disabled for Moonfin. Enable it in iOS Settings.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Background usage is restricted for Moonfin in Android Settings.';

  @override
  String get autoDownloadCheckNow => 'Check Now';

  @override
  String get autoDownloadChecking => 'Checking...';

  @override
  String get autoDownloadNeverChecked => 'Not checked yet';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued episodes queued',
      one: '1 episode queued',
      zero: 'nothing new',
    );
    return 'Last check $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Last check $when failed: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Followed series';

  @override
  String get autoDownloadNoSubscriptions =>
      'Open a series and choose \"Auto-download new episodes\" from its download menu';

  @override
  String get autoDownloadRemove => 'Stop following';

  @override
  String get autoDownloadStorageFull => 'Not enough storage';

  @override
  String get autoDownloadWaitingForWifi => 'Waiting for WiFi';

  @override
  String get downloadNotificationRunning => 'Downloading';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Downloading ($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — $percent%';
  }

  @override
  String downloadNotificationTransfer(
    String name,
    String progress,
    String timeRemaining,
  ) {
    return '$name — $progress · $timeRemaining';
  }

  @override
  String downloadNotificationStarting(String name) {
    return '$name...';
  }

  @override
  String downloadNotificationCompleteTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads complete',
      one: 'Download complete',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name saved for offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items saved for offline',
      one: '1 item saved for offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download failed';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Remote message';

  @override
  String get serverMessagesNotificationReceived => 'Message received';

  @override
  String get downloadStorageLimitReached =>
      'Storage limit reached. Free up space or increase the limit.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Not enough storage: $needed needed, $free free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Not enough storage for new episodes';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes are waiting for space.',
      one: '$name needs $size.',
    );
    return '$_temp0 Free up space or raise the download limit.';
  }

  @override
  String get pageTransitions => 'Page Transitions';

  @override
  String get pageTransitionsSubtitle =>
      'Adjusts fade time when navigating between pages';

  @override
  String get navigationSpeed => 'Navigation Speed';

  @override
  String get navigationSpeedSubtitle =>
      'Adjusts how quickly the focus indicator moves between items and rows';

  @override
  String get modernCardsTransitionSpeed => 'Modern Cards Transition Speed';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Adjusts animation speed when expanding focused modern cards';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Delay Card Expansion on Rapid Scroll';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Waits for focus movement to pause before expanding modern cards';

  @override
  String get animationSpeedExtraSlow => 'Extra Slow';

  @override
  String get animationSpeedSlow => 'Slow';

  @override
  String get animationSpeedMedium => 'Medium';

  @override
  String get animationSpeedFast => 'Fast';

  @override
  String get animationSpeedOff => 'Off';

  @override
  String get pageTransitionFadeNone => 'No Fade';

  @override
  String get pageTransitionFadeShort => 'Short Fade';

  @override
  String get pageTransitionFadeMedium => 'Medium Fade';

  @override
  String get pageTransitionFadeLong => 'Long Fade';

  @override
  String get siriRemoteSwipeSensitivity => 'Touchpad Swipe Sensitivity';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'How far focus moves for each swipe on the Siri Remote touchpad';

  @override
  String get appleTvHomeScreen => 'Apple TV home screen';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'What the Apple TV home screen shows above the Moonfin icon when it is selected. This setting stays on this device.';

  @override
  String get topShelfLatestMedia => 'Latest media';

  @override
  String get topShelfAppBanner => 'Moonfin banner';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Keep Video Clear of the Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'In landscape the camera housing covers one edge of the screen. This holds the picture back from it, which only changes anything for video wide enough to reach that far.';

  @override
  String get bottomNavbarStyle => 'Bottom Bar Style';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Split';

  @override
  String get bottomNavbarStyleStrip => 'Strip';

  @override
  String get bottomNavbarTabs => 'Bottom Bar Tabs';

  @override
  String get bottomNavbarTabsDescription =>
      'Pin up to 3 tabs between Home and You. Everything else is in the bottom navbar hub.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatic';

  @override
  String get bottomNavbarTabsPinned => 'Pinned';

  @override
  String get bottomNavbarTabsAvailable => 'Available';

  @override
  String get bottomNavbarTabsReset => 'Reset to Automatic';

  @override
  String get bottomNavbarTabsLimit =>
      'You can pin up to 3 tabs. Remove one to pin another.';

  @override
  String get bottomNavbarTabTurnedOff => 'Turned off under Buttons';

  @override
  String get bottomNavbarSplitSearchNote =>
      'In the Split style, Search always has its own button.';

  @override
  String get bottomNavbarButtonsNote =>
      'These decide what shows in the bottom navbar hub and which tabs you can pin to the bottom bar. Tabs already on the bar aren\'t listed here.';

  @override
  String get navYou => 'You';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => 'Details Page';

  @override
  String get storageAndDownloads => 'Storage & Downloads';

  @override
  String get integrations => 'ಏಕೀಕರಣಗಳು';

  @override
  String get settingsSync => 'Settings Sync';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase plugin sync and customization profiles';

  @override
  String get navigationBar => 'Navigation Bar';

  @override
  String get homeRows => 'Rows';

  @override
  String get homeRowsSubtitle => 'Turn rows on or off and change their order';

  @override
  String get rowOptions => 'Row Options';

  @override
  String get rowOptionsSubtitle => 'Sorting and content for each row';

  @override
  String get imageTypePerRow => 'Image Type per Row';

  @override
  String get externalSources => 'External Sources';

  @override
  String get qualityAndDecoding => 'Quality & Decoding';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, resolution, decoding, HDR, and Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Skipping & Autoplay';

  @override
  String get advancedPlayback => 'Advanced Playback';

  @override
  String get advancedPlaybackSubtitle =>
      'Player routing, external players, and mpv';

  @override
  String get settingsAccountSubtitle =>
      'Sign-in, PIN code, Kids Mode, parental controls, and settings sync';

  @override
  String get settingsGeneralSubtitle =>
      'Language, clock, input, and performance';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, home screen, libraries, details page, and themes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Rows, media bar, looks, and external sources';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Library visibility, order, and library pages';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, buttons, sections, ratings, and theme music';

  @override
  String get settingsPlaybackSubtitle =>
      'Player, quality, audio, subtitles, skipping, and SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Downloads, storage location, and the image cache';

  @override
  String get settingsServicesSubtitle => 'Seerr and Achievement Badges';

  @override
  String get settingsSignInSection => 'Sign-in';

  @override
  String get settingsFamilySection => 'Family';

  @override
  String get settingsServersSection => 'Servers';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsInputSection => 'Input';

  @override
  String get settingsMotionSection => 'Motion';

  @override
  String get settingsContentsSection => 'Contents';

  @override
  String get settingsLooksSection => 'Looks';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio & Subtitles';

  @override
  String get settingsSkippingAndQueueSection => 'Skipping & Queue';

  @override
  String get settingsWatchTogetherSection => 'Watch Together';

  @override
  String get settingsAdvancedSection => 'Advanced';

  @override
  String get playerSettingsSubtitle =>
      'Controls, seeking, player buttons, and trick play';

  @override
  String get siloPasswordChangeTitle => 'Choose a new password';

  @override
  String get siloPasswordChangeMessage =>
      'This account has a temporary password. Choose a new one to finish signing in.';

  @override
  String get siloPasswordChangeNew => 'New password';

  @override
  String get siloPasswordChangeConfirm => 'Confirm new password';

  @override
  String get siloPasswordChangeSubmit => 'Change password';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Use at least $count characters',
      one: 'Use at least 1 character',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'That password is too long';

  @override
  String get siloPasswordChangeMismatch => 'The passwords don\'t match';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Choose a password different from the temporary one';

  @override
  String get siloPasswordChangeFailed =>
      'Couldn\'t change the password. Try again.';

  @override
  String get siloPasswordChangeUnavailable =>
      'This account has a temporary password, and this server doesn\'t allow changing it here. Change it in Silo\'s web app, then sign in again.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Your password was changed. Sign in with the new password.';

  @override
  String get siloServerRowSubtitle => 'From your server';

  @override
  String get playlistSortReleaseDate => 'Release Date';

  @override
  String get playlistSortCriticRating => 'Critic Rating';

  @override
  String get playlistSortRuntime => 'Runtime';

  @override
  String get playlistSortLastPlayed => 'Last Played';

  @override
  String get playlistSortPlayCount => 'Play Count';

  @override
  String get playlistSortRandom => 'Random';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active',
      one: '1 active',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => 'No tracks match the active filters';

  @override
  String get librarySortPlaylistOrder => 'Playlist Order';

  @override
  String get librarySortDateAdded => 'Date Added';

  @override
  String get librarySortDateEpisodeAdded => 'Date Episode Added';

  @override
  String get librarySortParentalRating => 'Parental Rating';

  @override
  String get librarySortMyRating => 'My Rating';

  @override
  String get librarySortAlbumArtist => 'Album Artist';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artist';

  @override
  String get librarySortTrackNumber => 'Track Number';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Folders First';

  @override
  String get librarySortLength => 'Length';

  @override
  String get homeScreenBackdrop => 'Home Screen Backdrop';

  @override
  String get homeScreenBackdropFullScreen => 'Full Screen';

  @override
  String get homeScreenBackdropCorner => 'Corner';

  @override
  String get homeScreenBackdropTop => 'Top';

  @override
  String get detailsScreenBackdrop => 'Details Screen Backdrop';

  @override
  String get detailsBackdropSize => 'Backdrop Size';

  @override
  String get detailsBackdropFullScreen => 'Full Screen';

  @override
  String get detailsBackdropFit => 'Fit';

  @override
  String get libraryBackdrops => 'Library Backdrops';

  @override
  String get playbackInfoChannel => 'Channel';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Why';

  @override
  String get playbackInfoQualityLimit => 'Quality Limit';

  @override
  String get playbackInfoFrameRate => 'Frame Rate';

  @override
  String get playbackInfoDelivery => 'Delivery';

  @override
  String get playbackInfoFile => 'File';

  @override
  String get playbackInfoTechnical => 'Technical';

  @override
  String get playbackInfoDevice => 'Device';

  @override
  String get playbackInfoAudioRoute => 'Audio Route';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count channels';
  }

  @override
  String get playbackInfoBurnedIn => 'Burned in by the server';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (original $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (converted from $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, converted from $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay => 'Playing the original file as is.';

  @override
  String get playbackInfoNoteDirectStream =>
      'The server is repackaging the file without converting it.';

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'The server is converting the video so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'The server is converting the audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'The server is converting the video and audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'The server is converting this file so this device can play it.';

  @override
  String get playbackInfoNoteOffline => 'Playing a downloaded copy.';

  @override
  String get playbackInfoWhyForced => 'Transcoding is forced in settings';

  @override
  String get playbackInfoWhyBitrate =>
      'The bitrate is above the streaming limit';

  @override
  String get playbackInfoWhyContainer =>
      'This device can\'t play this file type';

  @override
  String get playbackInfoWhyVideo =>
      'This device can\'t play this video format';

  @override
  String get playbackInfoWhyHdr => 'This device can\'t display this HDR format';

  @override
  String get playbackInfoWhyAudio =>
      'This device can\'t play this audio format';

  @override
  String get playbackInfoWhySubtitles =>
      'Subtitles are being burned into the video';

  @override
  String get playbackInfoWhyOther => 'The file couldn\'t be played directly';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate is above the $limit streaming limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'This device can\'t open $container files';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'This device can\'t play $codec video';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'This device can\'t play $codec $profile video';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'This device can\'t play $codec level $level video';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'This device can\'t play $bits-bit video';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'This device can\'t play $resolution video';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'This device can\'t play $fps fps video';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'This device can\'t play interlaced video';

  @override
  String get playbackInfoWhyAnamorphic =>
      'This device can\'t play anamorphic video';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'This device can\'t display $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'This device can\'t play $format audio';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'This device can\'t play $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'This device can\'t play $channels audio';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'This device can\'t play $rate kHz audio';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'This device can\'t play $bits-bit audio';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'The audio track is in a separate file';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'This device can only play the first audio track';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format subtitles are being burned into the video';
  }

  @override
  String get playbackInfoDroppedFrames => 'Dropped Frames';

  @override
  String get playFromServer => 'Play from Server';

  @override
  String get settingsApplePlayerUi => 'Video player';

  @override
  String get settingsApplePlayerUiDescription =>
      'The native Apple style player has no casting, audio delay or PiP button, and its rotation lock is only in Live TV';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Native Apple style';

  @override
  String get playerTransportPosition => 'Play buttons';

  @override
  String get playerTransportPositionDescription =>
      'Show play, skip and seek in the middle of the video or docked in the bottom bar';

  @override
  String get playerTransportOnScreen => 'On screen';

  @override
  String get playerTransportDocked => 'Docked';

  @override
  String get incompleteRecording => 'Incomplete';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded of $expected min';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Complete showing scheduled $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Complete copy recorded $dateTime';
  }

  @override
  String get noCompleteShowingFound => 'No complete showing found';

  @override
  String get keepAsComplete => 'Keep as Complete';

  @override
  String get keptAsComplete => 'Marked as complete';

  @override
  String get unableToKeepAsComplete => 'Unable to mark as complete';

  @override
  String recordPromptTitle(String name) {
    return 'Record $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'This showing started $minutes minutes ago, so the recording will miss the start.',
      one: 'This showing started 1 minute ago, so the recording will miss the start.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Also record the future showing to get a complete recording?';

  @override
  String get recordPromptSearchLater =>
      'Also record a future showing automatically once one is found, to get a complete recording?';

  @override
  String get recordPromptNow => 'Now';

  @override
  String get recordPromptLater => 'Future showing';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min already aired',
      one: '1 min already aired',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Matched by title and description only. Check it\'s the same program.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'The descriptions differ, so this may be a different program.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Same episode (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Already set to record';

  @override
  String get recordPromptTomorrow => 'Tomorrow';

  @override
  String get recordNowOnly => 'Record Now Only';

  @override
  String recordNowAnd(String when) {
    return 'Record Now and $when';
  }

  @override
  String get recordNowAndLater => 'Record Now and Future Showing';

  @override
  String recordOnlyLater(String when) {
    return 'Record $when Only';
  }

  @override
  String get recordLaterShowingOnly => 'Record Future Showing Only';

  @override
  String get laterShowingOnlyRequested =>
      'The future showing will be recorded.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Couldn\'t request the future showing, so nothing will be recorded.';

  @override
  String get laterShowingRequested =>
      'Recording started. A future showing will be recorded too.';

  @override
  String get unableToRequestLaterShowing =>
      'Recording started, but couldn\'t request a future showing.';

  @override
  String get siloCodeSignIn => 'Sign in with a code';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scan the QR code with your phone, or go to $address on any signed-in device and enter this code:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Enter this code in Silo on a device where you\'re signed in:';

  @override
  String get siloCodeSignInOpened =>
      'Code found. Approve the sign-in on your other device.';

  @override
  String get siloCodeSignInDenied => 'This sign-in was declined.';

  @override
  String get siloCodeSignInNewCode => 'Get a new code';

  @override
  String get siloCodeSignInOff =>
      'Signing in with a code is turned off on this server.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'This account has a temporary password. Sign in with the password once to replace it.';

  @override
  String get siloApproveSignIn => 'Approve a sign-in';

  @override
  String get siloApproveSignInHint => 'Code shown on the other device';

  @override
  String get siloApproveSignInApprove => 'Approve';

  @override
  String get siloApproveSignInDone =>
      'Approved. The other device is signing in.';

  @override
  String get siloApproveSignInNoRequest =>
      'No sign-in is waiting with that code. Check it, or get a new code on the other device.';

  @override
  String get siloNativeOfferTitle => 'Connect to Silo directly?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'This address is the Jellyfin-compatible service of $serverName. Moonfin can connect to Silo directly at $address, with Silo\'s own features.';
  }

  @override
  String get siloNativeOfferUse => 'Use Silo';

  @override
  String get siloNativeOfferKeep => 'Keep Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      'This Silo server needs a newer version of Moonfin. Update Moonfin to use it.';

  @override
  String get siloServerUpdateRequired =>
      'This Silo server is too old for this version of Moonfin. Update Silo to use it.';

  @override
  String get siloTooManyAttempts => 'Too many attempts. Try again later.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get siloServerBusy =>
      'The server is busy or still starting. Try again later.';

  @override
  String siloServerBusyWait(String wait) {
    return 'The server is busy or still starting. Try again in $wait.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Playback isn\'t available on this Silo server.';

  @override
  String get siloPlaybackUpdateRequired =>
      'This Silo server needs a newer version of Moonfin to play.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Playback was ended on the Silo server.';

  @override
  String siloPinTitle(String name) {
    return 'PIN for $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Unlock';

  @override
  String get siloPinWrong => 'That PIN isn\'t right.';

  @override
  String get siloPinLocked => 'Too many wrong PINs. Try again later.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Too many wrong PINs. Try again in $wait.';
  }

  @override
  String get siloPinFailed => 'The PIN couldn\'t be checked. Try again.';

  @override
  String get siloSignOutAccount => 'Sign out of the Silo account';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trailers',
      one: '1 trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Subtitled';

  @override
  String get rommAccount => 'RomM account';

  @override
  String get rommAccountIntro =>
      'Link your RomM account to play from your own RomM library and keep your saves in RomM.';

  @override
  String get rommLinkAccount => 'Link RomM account';

  @override
  String get rommLinkInstructions =>
      'Sign in to RomM and enter this code to link your account.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scan the QR code with your phone, or go to $url';
  }

  @override
  String get rommOpen => 'Open RomM';

  @override
  String get rommWaitingForApproval =>
      'Waiting for you to approve the code in RomM...';

  @override
  String rommLinkedAs(String username) {
    return 'Linked as $username';
  }

  @override
  String get rommLinked => 'Your RomM account is linked.';

  @override
  String get rommUnlinkNote =>
      'Unlinking stops Moonfin from using your RomM key. The key stays in RomM until you remove it from your API tokens there.';

  @override
  String get rommUnlink => 'Unlink';

  @override
  String get rommLinkExpired =>
      'The code expired before it was approved. Link again to get a new one.';

  @override
  String get rommLinkDenied => 'The link was turned down in RomM.';

  @override
  String get rommUnreachable =>
      'Moonfin couldn\'t reach RomM. Try again in a moment.';

  @override
  String get rommNotAvailable => 'This server has no RomM library.';

  @override
  String get rommAccountLoadFailed => 'Couldn\'t load your RomM account.';

  @override
  String get reviews => 'Reviews';

  @override
  String get detailSectionReviews => 'Reviews';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Read on TMDB';

  @override
  String get addServerButtonSubtitle =>
      'By address, or with a Plex or Emby Connect account';

  @override
  String get addServerChooseHow => 'Choose how you\'d like to connect.';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby or Silo on your network or online';

  @override
  String get addServerPlexChoice => 'Use your Plex account to find its servers';

  @override
  String get addServerAddressHelp =>
      'The same address you\'d open in a browser, including the port.';

  @override
  String get addServerDetectNote =>
      'Works with Jellyfin, Emby and Silo. A Plex address opens the Plex sign-in.';

  @override
  String addServerChecking(String address) {
    return 'Checking $address';
  }

  @override
  String get addServerUnreachableDetail =>
      'Check the address and port, and that the server is running.';

  @override
  String get addServerFound => 'Server found';

  @override
  String get addServerFoundNote => 'Continue to choose who\'s signing in.';

  @override
  String get addServerUseDifferentAddress => 'Use a different address';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artists',
      one: '1 artist',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs',
      one: '1 song',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count playlists',
      one: '1 playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plays',
      one: '1 play',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'All Artists';

  @override
  String get libraryZToA => 'Z to A';

  @override
  String get musicSortYear => 'Year';

  @override
  String get musicFilter => 'Filter';

  @override
  String get musicGenreFilterTitle => 'Filter by Genre';

  @override
  String get openAlbum => 'Open Album';

  @override
  String get openPlaylist => 'Open Playlist';

  @override
  String get allSongsAToZ => 'All Songs A to Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Everything';

  @override
  String get musicMixEverythingSubtitle => '300 songs at random';

  @override
  String get mostPlayed => 'Most Played';

  @override
  String get musicMixMostPlayedSubtitle => 'Your top 100';

  @override
  String get musicMixFreshArrivals => 'Fresh Arrivals';

  @override
  String get musicMixFreshArrivalsSubtitle => 'The newest 100 songs';

  @override
  String get musicMixRediscover => 'Rediscover';

  @override
  String get musicMixRediscoverSubtitle =>
      'Favorites you haven\'t played lately';

  @override
  String get musicSortMostAlbums => 'Most Albums';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Book $index of $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count favorites',
      one: '1 favorite',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z to A';

  @override
  String get bookSortMostTitles => 'Most Titles';

  @override
  String get bookSurpriseMe => 'Surprise Me';

  @override
  String get bookShuffleAudiobooks => 'Shuffle Audiobooks';

  @override
  String get bookStartReading => 'Start Reading';

  @override
  String get bookOtherBooks => 'Other Books';

  @override
  String get bookDiscoverSearchBooks => 'Search Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => 'Search LibriVox';

  @override
  String get bookDiscoverFeatured => 'Featured';

  @override
  String get bookReaderControlsAutoHide => 'Controls hide automatically';

  @override
  String get bookReaderControlsStayVisible => 'Controls stay visible';

  @override
  String get settingsLivePreview => 'Live preview';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Shows on the $screen preview';
  }

  @override
  String get settingsPreviewNotShown => 'Not shown in the preview';

  @override
  String get settingsPreviewSaved => 'Saved';
}
