// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

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
  String get interfaceLanguage => 'Interfaca lingvo';

  @override
  String get systemLanguageDefault => 'Sistema defaŭlto';

  @override
  String get signIn => 'Ensalutu';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Malplena';

  @override
  String connectingToServer(String serverName) {
    return 'Konektante al $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Pasvorto';

  @override
  String get username => 'Uzantnomo';

  @override
  String get email => 'Retpoŝto';

  @override
  String get quickConnectInstruction =>
      'Enigu ĉi tiun kodon en la retpanelo de via servilo:';

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
  String get waitingForAuthorization => 'Atendante rajtigon...';

  @override
  String get back => 'Reen';

  @override
  String get serverUnavailable => 'Servilo estas nedisponebla';

  @override
  String get loginFailed => 'Ensaluto malsukcesis';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nedisponebla: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nedisponebla ($status): $detail';
  }

  @override
  String get whosWatching => 'Kiu rigardas?';

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
  String get addUser => 'Aldoni Uzanton';

  @override
  String get selectServer => 'Elektu Servilon';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versio $version';
  }

  @override
  String get savedServers => 'Savitaj Serviloj';

  @override
  String get discoveredServers => 'Malkovritaj Serviloj';

  @override
  String get noneFound => 'Neniu trovita';

  @override
  String get unableToConnectToServer => 'Ne eblas konektiĝi al servilo';

  @override
  String get addServer => 'Aldonu Servilon';

  @override
  String get embyConnect => 'Emby Konekti';

  @override
  String get removeServer => 'Forigi Servilon';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Ĉu forigi \"$serverName\" de viaj serviloj?';
  }

  @override
  String get cancel => 'Nuligi';

  @override
  String get remove => 'Forigi';

  @override
  String get connectToServer => 'Konekti al Servilo';

  @override
  String get serverAddress => 'Servilo Adreso';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Konekti';

  @override
  String get secureStorageUnavailable => 'Sekura Stokado Ne Disponebla';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ne povis aliri vian sisteman ŝlosilringon. Ensaluto povas daŭri, sed sekura ĵetono-stokado eble estos nedisponebla ĝis la ŝlosilringo estas malŝlosita.';

  @override
  String get ok => 'Bone';

  @override
  String get settingsAppearanceTheme => 'Aplika Temo';

  @override
  String get detailScreenStyle => 'Stilo de detala ekrano';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasika estas la origina centrigita aranĝo de Moonfin. Moderna estas respondema kinema aranĝo.';

  @override
  String get detailScreenStyleMoonfin => 'Klasika';

  @override
  String get detailScreenStyleModern => 'Moderna';

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
  String get expandedTabs => 'Etenditaj langetoj';

  @override
  String get expandedTabsSubtitle =>
      'Aŭtomate montri la enhavon de la langetoj dum vi trarigardas ilin. Malŝaltu por malfermi kaj fermi ĉiun langeton permane.';

  @override
  String get showTechnicalDetails => 'Ĉu montri teknikajn detalojn?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Montri informojn pri kodeko, distingivo kaj fluo en la resumo de la banero';

  @override
  String get recommendationSystem => 'Rekomenda sistemo';

  @override
  String get recommendationSystemSubtitle =>
      'Uzi la lok-bibliotekan algoritmon de Moonfin Recommends aŭ la retajn similecajn metrikojn de TMDb. Noto: retaj rekomendoj bezonas Seerr-integriĝon.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-simileco';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Ĉu apliki limon de aĝoklasifiko?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limigi la sugestojn de Moonfin Recommends laŭ la aĝoklasifiko de la celata aŭdvidaĵo';

  @override
  String get interfaceStyle => 'Interfaca stilo';

  @override
  String get interfaceStyleSubtitle =>
      'Aŭtomata adaptiĝas al via aparato. Elektu Apple aŭ Material por devigi aspekton.';

  @override
  String get interfaceStyleAutomatic => 'Aŭtomata';

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
  String get glassQuality => 'Kvalito de vitro';

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
      'Aŭtomata elektas la plej bonan vitran efekton por ĉi tiu aparato. Plena devigas veran malfokusigon; Reduktita uzas malpezan vitron, kiu ŝparas GPU-energion.';

  @override
  String get glassQualityAuto => 'Aŭtomata';

  @override
  String get glassQualityFull => 'Plena';

  @override
  String get glassQualityReduced => 'Reduktita';

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
      'Ŝanĝu inter Moonfin kaj Neon Pulse sen rekomenci la apon';

  @override
  String get customThemeTitle => 'Propra temo';

  @override
  String get customThemeSubtitle =>
      'Propraj temoj ŝanĝas vidajn elementojn tra Moonfin. Elektu unu el ĉi tiuj ebloj laŭ via stilo.';

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
      'Nuna aspekto de Moonfin, kiun vi ĉiuj amis';

  @override
  String get themeNeonPulse => 'Neona Pulso';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-stilado kun magenta brilo, cejana teksto kaj pli forta kroma kontrasto';

  @override
  String get themeGlass => 'Vitro';

  @override
  String get themeGlassSubtitle =>
      'Likva-vitra stilo kun drivanta gradienta fono, prujnaj surfacoj kaj Apple-blua akcento';

  @override
  String get theme8BitHero => '8-bita Heroo';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro piksel-arta stilo kun dika paletro, blokecaj borderoj, akraj falombroj kaj piksela tiparo';

  @override
  String get embyConnectSignInSubtitle => 'Ensalutu per via Emby Connect-konto';

  @override
  String get emailOrUsername => 'Retpoŝto aŭ Uzantnomo';

  @override
  String get selectAServer => 'Elektu Servilon';

  @override
  String get tryAgain => 'Provu Denove';

  @override
  String get noLinkedServers =>
      'Neniuj serviloj ligitaj al ĉi tiu Emby Connect-konto';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nevalidaj akreditaĵoj de Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Nevalida uzantnomo aŭ pasvorto de Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Servilo ne subtenas Emby Connect-interŝanĝon';

  @override
  String get embyConnectNetworkError =>
      'Reta eraro dum kontakto kun Emby Connect aŭ la elektita servilo';

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
  String get loadingLinkedServers => 'Ŝargante ligitajn servilojn...';

  @override
  String get connectingToServerEllipsis => 'Konektante al servilo...';

  @override
  String get noReachableAddress => 'Neniu atingebla adreso provizita';

  @override
  String get invalidServerExchangeResponse =>
      'Nevalida respondo de servila interŝanĝo finpunkto';

  @override
  String unableToConnectTo(String target) {
    return 'Ne eblas konekti al $target';
  }

  @override
  String get exitApp => 'Eliri Moonfin?';

  @override
  String get exitAppConfirmation => 'Ĉu vi certas, ke vi volas eliri?';

  @override
  String get exit => 'Eliro';

  @override
  String get gameMenu => 'Menuo';

  @override
  String get gamePaused => 'Paŭzita';

  @override
  String get gameSaveState => 'Konservi staton';

  @override
  String get games => 'Ludoj';

  @override
  String get gameLoadState => 'Ŝargi staton';

  @override
  String get gameFastForward => 'Rapide antaŭen';

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
  String get gameEmulatorSettings => 'Agordoj de emulilo';

  @override
  String get gameNoCoreOptions =>
      'Ĉi tiu kerno havas neniujn agordeblajn opciojn.';

  @override
  String get gameHoldToOpenMenu => 'Tenu por malfermi la menuon';

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
      'Ludado ankoraŭ ne estas subtenata sur ĉi tiu aparato.';

  @override
  String get noHomeRowsLoaded => 'Neniuj hejmaj vicoj povus esti ŝarĝitaj';

  @override
  String get noHomeRowsHint =>
      'Provu refreŝigi aŭ redukti aktivajn hejmajn sekciojn.';

  @override
  String get retryHomeRows => 'Reprovi Hejmajn Vicojn';

  @override
  String get guide => 'Gvidilo';

  @override
  String get recordings => 'Registraĵoj';

  @override
  String get schedule => 'Horaro';

  @override
  String get series => 'Serioj';

  @override
  String get noItemsFound => 'Neniuj eroj trovitaj';

  @override
  String get home => 'Hejmo';

  @override
  String get browseAll => 'Foliumi Ĉiujn';

  @override
  String get genres => 'Ĝenroj';

  @override
  String get collectionPlaceholder => 'Kolektaĵoj aperos ĉi tie';

  @override
  String get browseByLetter => 'Foliumi per Litero';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alfabeta foliumado aperos ĉi tie';

  @override
  String get suggestions => 'Sugestoj';

  @override
  String get suggestionsPlaceholder => 'Proponitaj eroj aperos ĉi tie';

  @override
  String get failedToLoadLibraries => 'Malsukcesis ŝargi bibliotekojn';

  @override
  String get noLibrariesFound => 'Neniuj bibliotekoj trovitaj';

  @override
  String get library => 'Biblioteko';

  @override
  String get displaySettings => 'Montraj Agordoj';

  @override
  String get allGenres => 'Ĉiuj Ĝenroj';

  @override
  String get noGenresFound => 'Neniuj ĝenroj trovitaj';

  @override
  String failedToLoadFolderError(String error) {
    return 'Malsukcesis ŝargi dosierujon: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ĉi tiu dosierujo estas malplena';

  @override
  String itemCountLabel(int count) {
    return '$count eroj';
  }

  @override
  String get failedToLoadFavorites => 'Malsukcesis ŝargi favoratojn';

  @override
  String get retry => 'Reprovi';

  @override
  String get noFavoritesYet => 'Ankoraŭ neniuj ŝatatoj';

  @override
  String get favorites => 'Plej ŝatataj';

  @override
  String totalCountItems(int count) {
    return '$count Eroj';
  }

  @override
  String get continuing => 'Daŭrigante';

  @override
  String get ended => 'Finiĝis';

  @override
  String get sortAndFilter => 'Ordigi & Filtrilo';

  @override
  String get type => 'Tajpu';

  @override
  String get sortBy => 'Ordigi Laŭ';

  @override
  String get display => 'Montru';

  @override
  String get imageType => 'Bilda Tipo';

  @override
  String get posterSize => 'Afiŝo Grandeco';

  @override
  String get small => 'Malgranda';

  @override
  String get medium => 'Meza';

  @override
  String get large => 'Granda';

  @override
  String get extraLarge => 'Ekstra Granda';

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
    return '$name — Ĝenroj';
  }

  @override
  String get views => 'Vidoj';

  @override
  String get albums => 'Albumoj';

  @override
  String get albumArtists => 'Albumaj Artistoj';

  @override
  String get artists => 'Artistoj';

  @override
  String get bookmarks => 'Legosignoj';

  @override
  String get noSavedBookmarks =>
      'Ankoraŭ neniuj konservitaj legosignoj por ĉi tiu titolo.';

  @override
  String get openBook => 'Malferma Libro';

  @override
  String get chapter => 'Ĉapitro';

  @override
  String get page => 'Paĝo';

  @override
  String get bookmark => 'Legomarko';

  @override
  String get justNow => 'Ĝuste nun';

  @override
  String minutesAgo(int count) {
    return 'antaŭ ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'antaŭ ${count}h';
  }

  @override
  String daysAgo(int count) {
    return '${count}d antaŭ';
  }

  @override
  String get discoverySubjects => 'Malkovraj Temoj';

  @override
  String get apply => 'Apliki';

  @override
  String get openLink => 'Malfermu Ligon';

  @override
  String get scanWithYourPhone => 'Skanu per via telefono';

  @override
  String get audiobookGenres => 'Aŭdlibroj Ĝenroj';

  @override
  String get scrollLeft => 'Rulumu maldekstren';

  @override
  String get scrollRight => 'Rulumu dekstren';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Ne eblis ŝargi ĉi tiun ĝenron nun.';

  @override
  String get continueReading => 'Daŭre Legado';

  @override
  String get savedHighlights => 'Konservitaj Kulminaĵoj';

  @override
  String get continueListening => 'Daŭre Aŭskulti';

  @override
  String get listen => 'Aŭskultu';

  @override
  String get resume => 'Daŭrigi';

  @override
  String get failedToLoadLibrary => 'Malsukcesis ŝargi bibliotekon';

  @override
  String get popularNow => 'Populara Nun';

  @override
  String get savedForLater => 'Konservite por Poste';

  @override
  String get topListens => 'Supraj Aŭskultoj';

  @override
  String get unreadDiscoveries => 'Nelegitaj Malkovroj';

  @override
  String get pickUpAgain => 'Elektu Denove';

  @override
  String get bookHighlightsDescription =>
      'Viaj libroj kun elstaraj, plej ŝatataj aŭ legado-progreso.';

  @override
  String get handPickedFromLibrary => 'Manele elektitaj el via biblioteko.';

  @override
  String get handPickedFromListeningQueue =>
      'Manele elektitaj el via aŭskulta vico.';

  @override
  String get booksWithHighlights =>
      'Libroj kun kulminaĵoj, ŝatatoj aŭ legado-progreso.';

  @override
  String get jumpBackNarration => 'Resaltu en rakonton sen ĉasi vian lokon.';

  @override
  String get unreadBooksReady =>
      'Nelegitaj libroj pretaj por la sekva trankvila horo.';

  @override
  String get quickAccessFavorites =>
      'Rapida aliro al la libroj, al kiuj vi daŭre revenas.';

  @override
  String get searchAudiobooks => 'Serĉu aŭdlibrojn';

  @override
  String get searchYourLibrary => 'Serĉu vian bibliotekon';

  @override
  String get pickUpStory => 'Reprenu la rakonton kie vi ĉesis';

  @override
  String get savedPlacesChapters =>
      'Viaj konservitaj lokoj kaj nefinitaj ĉapitroj';

  @override
  String authorsCount(int count) {
    return '$count aŭtoroj';
  }

  @override
  String genresCount(int count) {
    return '$count ĝenroj';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% kompletigita';
  }

  @override
  String get readyWhenYouAre => 'Preta kiam vi estos';

  @override
  String get details => 'Detaloj';

  @override
  String get listeningRoom => 'Aŭskultejo';

  @override
  String get bookmarksAndProgress => 'Legosignoj & Progreso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titoloj aranĝitaj por legi unue foliumi.';
  }

  @override
  String get titles => 'Titoloj';

  @override
  String get allTitles => 'Ĉiuj Titoloj';

  @override
  String get authors => 'Aŭtoroj';

  @override
  String get browseByAuthor => 'Foliumi Laŭ Aŭtoro';

  @override
  String get browseByGenre => 'Foliumi Laŭ Ĝenro';

  @override
  String get discover => 'Malkovru';

  @override
  String get noBookmarkedItems => 'Ankoraŭ neniuj legosignitaj eroj';

  @override
  String get nothingMatchesSection =>
      'Nenio ankoraŭ kongruas kun ĉi tiu sekcio. Provu alian langeton aŭ revenu post kiam la biblioteksinkroniĝo finiĝos.';

  @override
  String get audiobooks => 'Aŭdlibroj';

  @override
  String noLabelFound(String label) {
    return 'Neniu $label trovita';
  }

  @override
  String get folder => 'Dosierujo';

  @override
  String get filters => 'Filtriloj';

  @override
  String get readingStatus => 'Statuso de Legado';

  @override
  String get playedStatus => 'Ludita Statuso';

  @override
  String get readStatus => 'Legu';

  @override
  String get watched => 'Spektitaj';

  @override
  String get unread => 'Nelegita';

  @override
  String get unwatched => 'Nespektitaj';

  @override
  String get seriesStatus => 'Serio Statuso';

  @override
  String get allLibraries => 'Ĉiuj Bibliotekoj';

  @override
  String get books => 'Libroj';

  @override
  String get latestBooks => 'Plej novaj libroj';

  @override
  String get latestAudiobooks => 'Plej novaj aŭdlibroj';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libroj',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Libro';

  @override
  String get bookFormatAudiobook => 'Aŭdlibro';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Neniuj libroj trovitaj por ĉi tiu aŭtoro.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% legita';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time restas';
  }

  @override
  String get bookHeroRead => 'Legi';

  @override
  String get bookHeroListen => 'Aŭskulti';

  @override
  String get author => 'Aŭtoro';

  @override
  String get unknownAuthor => 'Nekonata Aŭtoro';

  @override
  String get uncategorized => 'Nekategoriita';

  @override
  String get overview => 'Superrigardo';

  @override
  String get noLibrivoxDescription =>
      'Ankoraŭ neniu priskribo disponigita de LibriVox por ĉi tiu titolo.';

  @override
  String get readers => 'Legantoj';

  @override
  String get openLinks => 'Malfermu Ligilojn';

  @override
  String get librivoxPage => 'LibriVox Paĝo';

  @override
  String get internetArchive => 'Interreta Arkivo';

  @override
  String get rssFeed => 'RSS Fluo';

  @override
  String get downloadZip => 'Elŝutu Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count sekcioj';
  }

  @override
  String firstPublished(int year) {
    return 'Unue eldonita $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Ankoraŭ neniu superrigardo havebla de Open Library por ĉi tiu titolo.';

  @override
  String get subjects => 'Temoj';

  @override
  String get all => 'Ĉiuj';

  @override
  String booksCount(int count) {
    return '$count libroj';
  }

  @override
  String get couldNotLoadSubject => 'Ne eblis ŝargi ĉi tiun temon nun.';

  @override
  String get audiobookDetails => 'Detaloj de Aŭdlibro';

  @override
  String authorsCountTitle(int count) {
    return '$count Aŭtoroj';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aŭdlibroj',
      one: '1 aŭdlibro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Trako Listo';

  @override
  String get itemListPlaceholder => 'Listo de eroj aperos ĉi tie';

  @override
  String get failedToLoad => 'Malsukcesis ŝargi';

  @override
  String get delete => 'Forigi';

  @override
  String get save => 'Konservi';

  @override
  String get moreLikeThis => 'Pli Kiel Ĉi tio';

  @override
  String get castAndCrew => 'Rolantaro & Skipo';

  @override
  String get collection => 'Kolekto';

  @override
  String get episodes => 'Epizodoj';

  @override
  String get nextUp => 'Sekva Supre';

  @override
  String get seasons => 'Sezonoj';

  @override
  String get chapters => 'Ĉapitroj';

  @override
  String get features => 'Karakterizaĵoj';

  @override
  String get movies => 'Filmoj';

  @override
  String get musicVideos => 'Muzikaj Videoj';

  @override
  String get other => 'Aliaj';

  @override
  String get discography => 'Diskografio';

  @override
  String get similarArtists => 'Similaj Artistoj';

  @override
  String get tableOfContents => 'Enhavo';

  @override
  String get tracklist => 'Traklisto';

  @override
  String discNumber(int number) {
    return 'Disko $number';
  }

  @override
  String get biography => 'Biografio';

  @override
  String get authorDetails => 'Detaloj de Aŭtoro';

  @override
  String get noOverviewAvailable =>
      'Ankoraŭ neniu superrigardo disponebla por ĉi tiu titolo.';

  @override
  String get noBiographyAvailable =>
      'Neniu biografio disponebla por ĉi tiu aŭtoro.';

  @override
  String get unableToLoadAuthorDetails =>
      'Ne eblas ŝargi detalojn pri aŭtoro nun.';

  @override
  String published(int year) {
    return 'Publikigite $year';
  }

  @override
  String get publicationDateUnknown => 'Dato de publikigo nekonata';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sezonoj',
      one: '1 Sezono',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Finiĝas ĉe $time';
  }

  @override
  String get items => 'Eroj';

  @override
  String get extras => 'Ekstraĵoj';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Malantaŭ la scenejo';

  @override
  String get deletedScenes => 'Forigitaj scenoj';

  @override
  String get featurettes => 'Dokumentetoj';

  @override
  String get interviews => 'Intervjuoj';

  @override
  String get scenes => 'Scenoj';

  @override
  String get shorts => 'Mallongaj filmoj';

  @override
  String get trailers => 'Antaŭfilmoj';

  @override
  String timeRemaining(String time) {
    return '$time restas';
  }

  @override
  String endsIn(String time) {
    return 'Finiĝas post $time';
  }

  @override
  String get view => 'Vido';

  @override
  String get resumeReading => 'Rekomencu Legado';

  @override
  String get read => 'Legu';

  @override
  String resumeFrom(String position) {
    return 'Rekomencu de $position';
  }

  @override
  String get play => 'Ludi';

  @override
  String get startOver => 'Rekomencu';

  @override
  String get restart => 'Rekomencu';

  @override
  String get readOffline => 'Legu Senrete';

  @override
  String get playOffline => 'Ludu eksterrete';

  @override
  String get audio => 'Aŭdio';

  @override
  String get subtitles => 'Subtekstoj';

  @override
  String get version => 'Versio';

  @override
  String get cast => 'Elsendi';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Antaŭfilmo';

  @override
  String get finished => 'Finita';

  @override
  String get favorited => 'Favoritita';

  @override
  String get favorite => 'Plej ŝatata';

  @override
  String get playlist => 'Ludlisto';

  @override
  String get downloaded => 'Elŝutite';

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
  String get downloadAll => 'Elŝutu Ĉion';

  @override
  String get download => 'Elŝutu';

  @override
  String get deleteDownloaded => 'Forigi Elŝutitan';

  @override
  String get goToSeries => 'Iru al Serio';

  @override
  String get editMetadata => 'Redaktu metadatumojn';

  @override
  String get less => 'Malpli';

  @override
  String get more => 'Pli';

  @override
  String get deleteItem => 'Forigi Eron';

  @override
  String get deletePlaylist => 'Forigi Ludliston';

  @override
  String get deletePlaylistMessage =>
      'Ĉu forigi ĉi tiun ludliston de la servilo?';

  @override
  String get deleteItemMessage => 'Ĉu forigi ĉi tiun eron de la servilo?';

  @override
  String get failedToDeletePlaylist => 'Malsukcesis forigi ludliston';

  @override
  String get failedToDeleteItem => 'Malsukcesis forigi eron';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Alinomi Ludliston';

  @override
  String get playlistName => 'Nomo de ludlisto';

  @override
  String get deleteDownloadedAlbum => 'Forigi Elŝutitan Albumon';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ĉu forigi elŝutitajn spurojn por \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Elŝutitaj trakoj forigitaj';

  @override
  String get downloadedTracksDeleteFailed =>
      'Kelkaj elŝutitaj trakoj ne povis esti forigitaj';

  @override
  String get noTracksLoaded => 'Neniuj trakoj ŝarĝitaj';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Ne $itemLabel ŝarĝita';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Elŝutante $title ($count erojn)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ĉu vi certas, ke vi volas forigi \"$name\" de la servilo? Ĉi tiu ago ne povas esti malfarita.';
  }

  @override
  String get itemDeleted => 'Ero forigita';

  @override
  String get noPlayableTrailerFound => 'Neniu ludebla antaŭfilmo trovita.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nesubtenata libroformato: .$extension';
  }

  @override
  String get audioTrack => 'Sontrako';

  @override
  String get subtitleTrack => 'Subtitola Trako';

  @override
  String get none => 'Neniu';

  @override
  String get downloadSubtitlesLabel => 'Elŝutu subtekstojn...';

  @override
  String get searchOpenSubtitlesPlugin => 'Serĉu per la OpenSubtitles kromaĵo';

  @override
  String get downloadSubtitles => 'Elŝutu Subtekstojn';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid =>
      'La elektita subteksto estas malvalida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitolo elŝutita kaj elektita: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitolo elŝutita. Povas preni momenton por aperi dum Jellyfin refreŝigas la objekton.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Neniuj foraj subtekstoj trovitaj por $language.';
  }

  @override
  String get selectVersion => 'Elektu Version';

  @override
  String versionNumber(int number) {
    return 'Versio $number';
  }

  @override
  String get downloadAllQuality => 'Elŝutu Ĉion - Kvalito';

  @override
  String get downloadQuality => 'Elŝutu Kvaliton';

  @override
  String get originalFileNoReencoding => 'Originala dosiero, sen rekodigo';

  @override
  String get originalFilesNoReencoding => 'Originalaj dosieroj, sen rekodigo';

  @override
  String get noEpisodesLoaded => 'Neniuj epizodoj ŝarĝitaj';

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
    return 'Elŝutante $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Forigu elŝutitajn dosierojn';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ĉu forigi lokajn dosierojn por $typeLabel?\n\nĈi tio liberigos stokan spacon. Vi povas re-elŝuti poste.';
  }

  @override
  String get downloadedFilesDeleted => 'Elŝutitaj dosieroj forigitaj';

  @override
  String get failedToDeleteFiles => 'Malsukcesis forigi dosierojn';

  @override
  String get deleteFiles => 'Forigi dosierojn';

  @override
  String get director => 'DIRECTORO';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REĜISOROJ';

  @override
  String get writer => 'VERKISTO';

  @override
  String get writers => 'SCENARISTOJ';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count pli';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Epizodoj';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Epizodo $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Ĉapitro $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trakoj',
      one: '1 trako',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ĉapitroj',
      one: '1 ĉapitro',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Naskita $date';
  }

  @override
  String died(String date) {
    return 'Mortis $date';
  }

  @override
  String age(int age) {
    return 'Aĝo $age';
  }

  @override
  String get showLess => 'Montru Malpli';

  @override
  String get readMore => 'Legu Pli';

  @override
  String get shuffle => 'Miksi';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Miksi la tutan muzikon';

  @override
  String get carSignInPrompt => 'Ensalutu al Moonfin per via telefono';

  @override
  String get carServerUnreachable => 'Ne eblas atingi vian servilon';

  @override
  String downloadsCount(int count) {
    return '$count elŝutas';
  }

  @override
  String get perfectMatch => 'Perfekta matĉo';

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
  String get mono => 'Monofonia';

  @override
  String get stereo => 'Stereofonia';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Fora subtitolo $action postulas la Jellyfin subtitolan permeson por ĉi tiu uzanto.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ĉi tiu ero ne troveblas en la servilo por fora subtitolo $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Fora subtitolo $action malsukcesis: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Fora subtitolo $action malsukcesis (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Malsukcesis $action foraj subtekstoj.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'ĉiuj elŝutitaj epizodoj por \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'ĉiuj elŝutitaj epizodoj en ĉi tiu sezono';

  @override
  String get stillWatching => 'Ankoraŭ Rigardas?';

  @override
  String get unableToLoadTrailerStream => 'Ne eblas ŝargi antaŭfilman fluon.';

  @override
  String get trailerTimedOut => 'Antaŭfilmo elĉerpita dum ŝarĝo.';

  @override
  String get playbackFailedForTrailer =>
      'Reproduktado malsukcesis por ĉi tiu antaŭfilmo.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casting estas neatingebla dum eksterreta reproduktado.';

  @override
  String castActionFailed(String label, String error) {
    return '$label ago malsukcesis: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Malsukcesis agordi la volumon: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Kontroloj';
  }

  @override
  String get deviceVolume => 'Aparato Volumo';

  @override
  String get unavailable => 'Nedisponebla';

  @override
  String get pause => 'Paŭzo';

  @override
  String get syncPosition => 'Sinkronigi Pozicion';

  @override
  String stopCast(String label) {
    return 'Ĉesu $label';
  }

  @override
  String get queueIsEmpty => 'Vico estas malplena';

  @override
  String trackNumber(int number) {
    return 'Spuri $number';
  }

  @override
  String get remotePlayback => 'Fora Reproduktado';

  @override
  String get castingToGoogleCast => 'Elsendo al Google Cast';

  @override
  String get castingViaAirPlay => 'Casting per AirPlay';

  @override
  String get castingViaDlna => 'Elĵeto per DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekundoj';
  }

  @override
  String get longPressToUnlock => 'Longe premu por malŝlosi';

  @override
  String get off => 'Malŝaltita';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Aŭtomate';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Audio Prokrasto';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Subtitolo Prokrasto';

  @override
  String get reset => 'Restarigi';

  @override
  String get unknown => 'Nekonata';

  @override
  String get playbackInformation => 'Informoj pri Ludado';

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
  String get playback => 'Reproduktado';

  @override
  String get playMethod => 'Ludu Metodon';

  @override
  String get directPlay => 'Rekta Ludado';

  @override
  String get directStream => 'Rekta Rojo';

  @override
  String get transcoding => 'Transkodigo';

  @override
  String get transcodeReasons => 'Transkodi Kialoj';

  @override
  String get player => 'Medialudilo';

  @override
  String get container => 'Ujo';

  @override
  String get bitrate => 'Bitrapido';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezolucio';

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
  String get track => 'Trako';

  @override
  String get channels => 'Kanaloj';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Ekstera';

  @override
  String get embedded => 'Enigita';

  @override
  String castSessionError(String protocol) {
    return '$protocol seanca eraro';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Malsukcesis ŝargi librodetalojn: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-bildado en-apo ankoraŭ ne haveblas sur ĉi tiu platformo.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ĉi tiu formato (.$extension) ankoraŭ ne povas esti prezentita en la aplikaĵo.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Enigita dokumentoprezento ne haveblas sur ĉi tiu platformo.';

  @override
  String get couldNotOpenExternalViewer =>
      'Ne eblis malfermi eksteran rigardilon.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Malsukcesis malfermi en-apan legilon: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Legomarko jam konservita ĉe $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Legomarko aldonita: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ankoraŭ neniuj legosignoj.\nFrapu la legosignikon dum legado por konservi vian pozicion.';

  @override
  String get noTableOfContentsAvailable => 'Neniu enhavtabelo havebla';

  @override
  String pageLabel(int number) {
    return 'Paĝo $number';
  }

  @override
  String get position => 'Pozicio';

  @override
  String get bookReader => 'Libroleganto';

  @override
  String formatExtension(String extension) {
    return 'Formato: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% legis';
  }

  @override
  String get updating => 'Ĝisdatigante...';

  @override
  String get markUnread => 'Marki Nelegita';

  @override
  String get markAsRead => 'Marku kiel Legita';

  @override
  String get reloadReader => 'Reŝargi Leganton';

  @override
  String get noPagesFound => 'Neniuj paĝoj trovitaj.';

  @override
  String get failedToDecodePageImage => 'Malsukcesis malkodi paĝan bildon.';

  @override
  String resetZoom(String zoom) {
    return 'Restarigi Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Ununura Paĝo';

  @override
  String get twoPageSpread => 'Du-Paĝa Disvastigo';

  @override
  String get addBookmark => 'Aldonu legosignon';

  @override
  String get bookmarksEllipsis => 'Legosignoj...';

  @override
  String get markedAsRead => 'Markite kiel legita';

  @override
  String get markedAsUnread => 'Markite kiel nelegita';

  @override
  String failedToUpdateReadState(String error) {
    return 'Malsukcesis ĝisdatigi legan staton: $error';
  }

  @override
  String get themeSystem => 'Temo: Sistemo';

  @override
  String get themeLight => 'Temo: Lumo';

  @override
  String get themeDark => 'Temo: Mallumo';

  @override
  String get themeSepia => 'Temo: Sepio';

  @override
  String get invertColorsFixedLayout => 'Inversigi Kolorojn (fiksita aranĝo)';

  @override
  String get invertColorsPdf => 'Inversu Kolorojn (PDF)';

  @override
  String get preparingInAppReader => 'Preparante en-apan legilon...';

  @override
  String get pdfDataNotAvailable => 'PDF-datumoj ne haveblaj.';

  @override
  String get readerFallbackModeActive => 'Aktiva reĝimo de falo de leganto';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ĉi tiu platformo ne povas gastigi la enigitan dokumentmotoron por $extension dosieroj.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Uzu Reload Reader post ŝanĝado al subtenata platforma celo (Android, iOS, macOS).';

  @override
  String get openExternally => 'Malfermu Ekstere';

  @override
  String get noEpubChaptersFound => 'Neniuj EPUB-ĉapitroj trovitaj.';

  @override
  String get readerNotReady => 'Leganto ne preta.';

  @override
  String get seriesRecordings => 'Serioregistradoj';

  @override
  String get now => 'Nun';

  @override
  String get sports => 'Sportoj';

  @override
  String get news => 'Novaĵoj';

  @override
  String get kids => 'Infanoj';

  @override
  String get premiere => 'Premiero';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Gvida Kronologio';

  @override
  String failedToLoadGuide(String error) {
    return 'Malsukcesis ŝargi gvidilon: $error';
  }

  @override
  String get noChannelsFound => 'Neniuj kanaloj trovitaj';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'VIVU';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Sekva: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}min restas';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h restas';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}min restas';
  }

  @override
  String get movie => 'Filmo';

  @override
  String get removedFromFavoriteChannels => 'Forigita de plej ŝatataj kanaloj';

  @override
  String get addedToFavoriteChannels => 'Aldonita al plej ŝatataj kanaloj';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Malsukcesis ĝisdatigi preferatan kanalon';

  @override
  String get unfavoriteChannel => 'Malfavorata Kanalo';

  @override
  String get favoriteChannel => 'Ŝatata Kanalo';

  @override
  String get record => 'Registri';

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
  String get cancelRecordingAction => 'Nuligi Registradon';

  @override
  String get programSetToRecord => 'Programo agordita por registri';

  @override
  String get recordingCancelled => 'Registrado nuligita';

  @override
  String get unableToCreateRecording => 'Ne eblas krei registradon';

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
  String get watch => 'Spekti';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Fermi';

  @override
  String failedToPlayChannel(String name) {
    return 'Malsukcesis ludi $name';
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
  String get failedToLoadRecordings => 'Malsukcesis ŝargi registradojn';

  @override
  String get scheduledInNext24Hours => 'Planita en Venontaj 24 Horoj';

  @override
  String get recentRecordings => 'Lastatempaj Registradoj';

  @override
  String get tvSeries => 'Televidserio';

  @override
  String get failedToLoadSchedule => 'Malsukcesis ŝargi horaron';

  @override
  String get noScheduledRecordings => 'Neniuj planitaj registradoj';

  @override
  String get cancelRecording => 'Ĉu nuligi registradon?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Ĉu nuligi planitan registradon de \"$name\"?';
  }

  @override
  String get no => 'Ne';

  @override
  String get yesCancel => 'Jes, Nuligi';

  @override
  String get failedToCancelRecording => 'Malsukcesis nuligi registradon';

  @override
  String get failedToLoadSeriesRecordings =>
      'Malsukcesis ŝargi serioregistraĵojn';

  @override
  String get noSeriesRecordings => 'Neniuj serioregistraĵoj';

  @override
  String get cancelSeriesRecording => 'Nuligi Serioregistradon';

  @override
  String get cancelSeriesRecordingQuestion => 'Ĉu nuligi serioregistradon?';

  @override
  String stopRecordingName(String name) {
    return 'Ĉu ĉesi registri \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Malsukcesis nuligi serioregistradon';

  @override
  String get searchThisLibrary => 'Serĉu ĉi tiun bibliotekon...';

  @override
  String get searchEllipsis => 'Serĉu...';

  @override
  String noResultsForQuery(String query) {
    return 'Neniuj rezultoj por \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Serĉo malsukcesis: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-Konto-Tipo';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Loka';

  @override
  String get savedMedia => 'Savita Amaskomunikilaro';

  @override
  String get tvShows => 'Televidprogramoj';

  @override
  String get music => 'Muziko';

  @override
  String get musicAlbums => 'Muzikaj Albumoj';

  @override
  String get noMediaInFilter => 'Neniu amaskomunikilaro en ĉi tiu filtrilo';

  @override
  String get noDownloadedMediaYet => 'Ankoraŭ neniu elŝutita amaskomunikilaro';

  @override
  String get browseLibrary => 'Foliumi Bibliotekon';

  @override
  String get deleteDownload => 'Forigi Elŝuton';

  @override
  String removeItemAndFiles(String name) {
    return 'Ĉu forigi \"$name\" kaj ĝiajn dosierojn?';
  }

  @override
  String tracksCount(int count) {
    return '$count spuroj';
  }

  @override
  String get album => 'Albumo';

  @override
  String get playAlbum => 'Ludu Albumon';

  @override
  String failedToLoadAlbum(String error) {
    return 'Malsukcesis ŝargi albumon: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Neniuj elŝutitaj trakoj trovitaj por $name.';
  }

  @override
  String get season => 'Sezono';

  @override
  String get errorLoadingEpisodes => 'Eraro dum ŝarĝo de epizodoj';

  @override
  String get noDownloadedEpisodes => 'Neniuj elŝutitaj epizodoj';

  @override
  String get deleteEpisode => 'Forigi Epizodon';

  @override
  String removeName(String name) {
    return 'Ĉu forigi \"$name\"?';
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
    return 'Epizodo $number';
  }

  @override
  String get seriesNotFound => 'Serio ne trovita';

  @override
  String get errorLoadingSeries => 'Eraro dum ŝarĝo de serio';

  @override
  String get downloadedEpisodes => 'Elŝutitaj Epizodoj';

  @override
  String seasonNumber(int number) {
    return 'Sezono $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Specialaĵoj';

  @override
  String get deleteSeason => 'Forigi Sezonon';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ĉu forigi ĉiujn elŝutitajn epizodojn en $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizodoj',
      one: '1 epizodo',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Stokado-Administrado';

  @override
  String get storageBreakdown => 'Stokado Panas';

  @override
  String get downloadedItems => 'Elŝutitaj Eroj';

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
  String get storageLimit => 'Limo de Stokado';

  @override
  String get noLimit => 'Neniu limo';

  @override
  String get deleteAllDownloads => 'Forigi Ĉiuj Elŝutoj';

  @override
  String get deleteAllDownloadsWarning =>
      'Ĉi tio forigos ĉiujn elŝutitajn amaskomunikilajn dosierojn kaj ne povas esti malfarita.';

  @override
  String get deleteAll => 'Forigi Ĉion';

  @override
  String get deleteSelected => 'Forigi Elektitajn';

  @override
  String deleteSelectedCount(int count) {
    return 'Ĉu forigi $count elŝutitajn erojn?';
  }

  @override
  String get musicAndAudiobooks => 'Muziko kaj Aŭdlibroj';

  @override
  String get images => 'Bildoj';

  @override
  String get database => 'Datumbazo';

  @override
  String ofStorageLimit(String limit) {
    return 'de $limit limo';
  }

  @override
  String get settings => 'Agordoj';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Aŭtentikigo';

  @override
  String get autoLoginServerManagement =>
      'Aŭtomata ensaluto, servila administrado';

  @override
  String get pinCode => 'PIN Kodo';

  @override
  String get setUpPinCodeProtection => 'Agordu PIN-kodan protekton';

  @override
  String get parentalControls => 'Gepatraj Kontroloj';

  @override
  String get contentRatingRestrictions => 'Limigoj pri enhavo-taksado';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, rezolucio, konduto';

  @override
  String get languageSizeAppearance => 'Lingvo, grandeco, aspekto';

  @override
  String get qualityStorage => 'Kvalito, stokado';

  @override
  String get mediaRequestIntegration => 'Amaskomunikilaro petas integriĝon';

  @override
  String get switchServer => 'Ŝanĝi Servilon';

  @override
  String get signOut => 'Elsaluti';

  @override
  String get versionLicenses => 'Versio, permesiloj';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Ensalutu kaj sekureco';

  @override
  String get administration => 'Administrado';

  @override
  String get serverSettingsUsersLibraries =>
      'Servilaj agordoj, uzantoj, bibliotekoj';

  @override
  String get customization => 'Personigo';

  @override
  String get themeAndLayout => 'Temo kaj aranĝo';

  @override
  String get videoAndSubtitles => 'Video kaj subtekstoj';

  @override
  String get pluginAndRequests => 'Kromaĵo kaj petoj';

  @override
  String get customizeAccountPlaybackInterface =>
      'Agordu konton, reproduktadon kaj interfacan konduton';

  @override
  String optionsCount(int count) {
    return '$count opcioj';
  }

  @override
  String get themeAndAppearance => 'Temo & Apero';

  @override
  String get focusBorderColor => 'Fokuso Bordo Koloro';

  @override
  String get watchedIndicators => 'Rigardis Indikilojn';

  @override
  String get always => 'Ĉiam';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Kaŝi Nerigardita';

  @override
  String get episodesOnly => 'Nur Epizodoj';

  @override
  String get never => 'Neniam';

  @override
  String get focusExpansionAnimation => 'Fokusa Vastiga Animacio';

  @override
  String get desktopUiScale => 'Labortabla UI-Skalo';

  @override
  String get scaleFocusedCards =>
      'Skalu fokusitajn aŭ ŝvebitajn kartojn kaj kahelojn';

  @override
  String get seriesThumbnails => 'Seriobildetoj';

  @override
  String get seriesThumbnailsDescription =>
      'Nur epizodoj: uzu serio-artaĵojn, kiuj kongruas kun ĉiu vica bildspeco';

  @override
  String get homeRowInfoOverlay => 'Hejma Vico Info Overlay';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Montru titolon kaj metadatumojn dum foliumado de hejmaj vicoj';

  @override
  String get clockDisplay => 'Horloĝo Display';

  @override
  String get inMenus => 'En Menuoj';

  @override
  String get inVideo => 'En Video';

  @override
  String get seasonalEffects => 'Sezonaj Efektoj';

  @override
  String get seasonalEffectsDescription =>
      'Vidaj efikoj kaj laŭsezonaj dekoracioj';

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
  String get snow => 'Neĝo';

  @override
  String get fireworks => 'Artfajraĵo';

  @override
  String get confetti => 'Konfetoj';

  @override
  String get fallingLeaves => 'Falantaj Folioj';

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
  String get themeMusic => 'Temo Muziko';

  @override
  String get playThemeMusicOnDetailPages => 'Ludu temomuzikon sur detalpaĝoj';

  @override
  String get themeMusicVolume => 'Temo Muzika Volumo';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temo Muziko sur Hejmaj Vicoj';

  @override
  String get playWhenBrowsingHomeScreen => 'Ludu dum foliumas hejman ekranon';

  @override
  String get loopThemeMusic => 'Ripetigi teman muzikon';

  @override
  String get loopThemeMusicSubtitle =>
      'Ripeti la trakon anstataŭ ludi ĝin unufoje';

  @override
  String get detailsBackgroundBlur => 'Detaloj Fona Blur';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Foliumanta Fona Blur';

  @override
  String get maxStreamingBitrate => 'Maksimuma Streaming Bitrate';

  @override
  String get maxResolution => 'Maksimuma Rezolucio';

  @override
  String get playerZoomMode => 'Ludanta Zoom-Reĝimo';

  @override
  String get settingsScrollWheelAction => 'Musa rulumrado';

  @override
  String get settingsScrollWheelActionDescription =>
      'Elektu kion faras rulumado de la musrado super la video dum ludado.';

  @override
  String get scrollWheelActionOff => 'Malŝaltita';

  @override
  String get scrollWheelActionSeek => 'Serĉi (antaŭen / malantaŭen)';

  @override
  String get scrollWheelActionVolume => 'Laŭteco';

  @override
  String get playerTooltipVolume => 'Laŭteco';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Aŭtomata Tondado';

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
  String get stretch => 'Streĉi';

  @override
  String get refreshRateSwitching => 'Refreŝiga Indice Ŝanĝado';

  @override
  String get disabled => 'Malebligita';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Skalo en televido';

  @override
  String get scaleOnDevice => 'Skali sur Aparato';

  @override
  String get trickPlay => 'Truka Ludo';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Montru antaŭrigardajn bildetojn dum serĉado';

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
  String get showDescriptionOnPause => 'Montri Priskribon ĉe Paŭzo';

  @override
  String get dimVideoShowOverview =>
      'Malklarigu videon kaj montru superrigardan tekston dum paŭzo';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD Ŝlosa Butono';

  @override
  String get osdLockButtonDescription =>
      'Montru ŝlosilbutonon, kiu blokas tuŝan enigon ĝis longe premata';

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
  String get audioBehavior => 'Aŭdio-Konduto';

  @override
  String get downmixToStereo => 'Downmix al Stereo';

  @override
  String get defaultAudioLanguage => 'Defaŭlta Audio Lingvo';

  @override
  String get fallbackAudioLanguage => 'Rezerva aŭdia lingvo';

  @override
  String get preferDefaultAudioTrack => 'Preferi defaŭltan aŭdian trakon';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferi la originalan aŭdian trakon anstataŭ lokalizitan sinkronigadon.';

  @override
  String get preferAudioDescription => 'Preferi aŭdpriskribajn trakojn';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferi aŭdpriskribajn trakojn anstataŭ normalajn trakojn.';

  @override
  String get autoServerDefault => 'Aŭtomata (Servilo defaŭlta)';

  @override
  String get english => 'la angla';

  @override
  String get spanish => 'hispana';

  @override
  String get french => 'franca';

  @override
  String get german => 'germana';

  @override
  String get italian => 'itala';

  @override
  String get portuguese => 'portugala';

  @override
  String get japanese => 'Japanoj';

  @override
  String get korean => 'korea';

  @override
  String get chinese => 'ĉinoj';

  @override
  String get russian => 'rusa';

  @override
  String get arabic => 'araba';

  @override
  String get hindi => 'Hindia';

  @override
  String get dutch => 'nederlanda';

  @override
  String get swedish => 'sveda';

  @override
  String get norwegian => 'norvega';

  @override
  String get danish => 'dana';

  @override
  String get finnish => 'finna';

  @override
  String get polish => 'pola';

  @override
  String get ac3Passthrough => 'AC3 Trapaso';

  @override
  String get dtsPassthrough => 'DTS Trapaso';

  @override
  String get trueHdSupport => 'Subteno TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio nur al AVR; postulas ricevan subtenon kaj DTS-fontan trakon';

  @override
  String get settingsAudioFallbackCodec => 'Rezerva aŭdia kodeko';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Elektu la celan formaton por transkodi plurkanalan aŭdion kiam la fontfluo ne povas esti rekte ludata aŭ trapasata.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Aŭtomata detekto\n(Rekomendita)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Defaŭlta)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Nur stereofonia)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efika)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Senperda)';

  @override
  String get settingsMaxAudioChannels => 'Maksimumaj aŭdiaj kanaloj';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Agordu la maksimumajn kanalojn de via aŭdia aranĝo. Plurkanalaj fluoj superantaj ĉi tiun limon estos downmiksitaj aŭ transkoditaj.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Aŭtomata detekto\n(Aparatara defaŭlto)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Monofonia';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereofonia';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Ĉirkaŭsono';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kvarfonia';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Ĉirkaŭsono';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Ĉirkaŭsono';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Ĉirkaŭsono';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Ĉirkaŭsono';

  @override
  String get settingsAudioPassthroughAdvanced => 'Trapaso (Altnivela)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodeka trapaso';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ebligu nur formatojn, kiujn via AVR aŭ HDMI-lavujo subtenas.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Trapaso';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core trapaso';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA trapaso';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD trapaso';

  @override
  String get settingsDetectedAudioCapabilities => 'Detektitaj Aŭdaj Kapabloj';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ankoraŭ neniu rultempa kapablo momentfoto havebla.';

  @override
  String get settingsAudioRouteLabel => 'Itinero';

  @override
  String get settingsAudioDecodeLabel => 'Malkodi';

  @override
  String get settingsAudioPassthroughLabel => 'Trapaso';

  @override
  String get settingsAudioHdRoute => 'HD audio itinero';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Parolanto';

  @override
  String get settingsAudioRouteHeadphones => 'Kapaŭskultiloj';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kanaloj PCM';
  }

  @override
  String get nightMode => 'Nokta Reĝimo';

  @override
  String get compressDynamicRange => 'Kunpremi dinamikan gamon';

  @override
  String get advancedMpv => 'Altnivela mpv';

  @override
  String get enableCustomMpvConf => 'Ebligu Propra mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Apliki mpv.conf specifitan de uzanto antaŭ ol la reproduktado komenciĝas';

  @override
  String get unsafeAdvancedMpvOptions => 'Nesekuraj Altnivelaj mpv-Ebloj';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permesu pli larĝan aron de mpv-opcioj. Povas rompi reproduktan konduton.';

  @override
  String get hardwareDecoding => 'Malkodado de aparataro';

  @override
  String get hardwareDecodingSubtitle =>
      'Povas plibonigi rendimenton sed povas kaŭzi problemojn pri reprodukto ĉe iuj aparatoj.';

  @override
  String get nextUpAndQueuing => 'Sekva Supre & Vico';

  @override
  String get nextUpDisplay => 'Sekva Supre Montru';

  @override
  String get extended => 'Etendita';

  @override
  String get minimal => 'Minimuma';

  @override
  String get nextUpTimeout => 'Sekva Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Vicigo de aŭdvidaĵoj';

  @override
  String get autoQueueNextEpisodes => 'Aŭtovigu sekvajn epizodojn';

  @override
  String get stillWatchingPrompt => 'Ankoraŭ Rigardas Prompton';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Post $episodes epizodoj / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Rekomenci & Salti';

  @override
  String get resumeRewind => 'Rekomencu Rebobenadon';

  @override
  String get unpauseRewind => 'Malŝaltu Rebobenadon';

  @override
  String get fiveSeconds => '5 sekundoj';

  @override
  String get tenSeconds => '10 sekundoj';

  @override
  String get fifteenSeconds => '15 sekundoj';

  @override
  String get thirtySeconds => '30 sekundoj';

  @override
  String get skipBackLength => 'Saltu Malantaŭen Longon';

  @override
  String get skipForwardLength => 'Saltu Antaŭen Longon';

  @override
  String get customMpvConfPath => 'Propra mpv.conf Vojo';

  @override
  String get notSetMpvConf =>
      'Ne fiksita. Moonfin provos defaŭltan mpv.conf en dosierujoj de aplikaĵoj/datumoj.';

  @override
  String get selectMpvConf => 'Elektu mpv.conf';

  @override
  String get pathToMpvConf => '/vojo/al/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stilaj agordoj (grandeco, koloro, ofseto) validas por tekst-bazitaj subtekstoj (SRT, VTT, TTML). ASS/SSA-subtekstoj uzas sian propran enigitan stilon krom se \"ASS/SSA Direct Play\" estas malŝaltita. Bitmapaj subtekstoj (PGS, DVB, VobSub) ne povas esti restiligitaj.';

  @override
  String get defaultSubtitleLanguage => 'Defaŭlta Subtitola Lingvo';

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
  String get defaultToNoSubtitles => 'Defaŭlte al Neniuj Subtekstoj';

  @override
  String get turnOffSubtitlesByDefault => 'Malŝaltu subtekstojn defaŭlte';

  @override
  String get subtitleSize => 'Subtitolo Grandeco';

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
  String get textFillColor => 'Teksto Plenigkoloro';

  @override
  String get backgroundColor => 'Fona Koloro';

  @override
  String get textStrokeColor => 'Teksta Stroke Koloro';

  @override
  String get subtitleCustomization => 'Subtitolo Personigo';

  @override
  String get subtitleCustomizationDescription => 'Agordu subtitolan aspekton';

  @override
  String get subtitleMode => 'Subteksta reĝimo';

  @override
  String get subtitleModeFlagged => 'Markita';

  @override
  String get subtitleModeAlways => 'Ĉiam';

  @override
  String get subtitleModeForeign => 'Fremda';

  @override
  String get subtitleModeForced => 'Devigita';

  @override
  String get subtitleModeFlaggedDescription =>
      'Ludas trakojn interne markitajn en la metadatumoj de la dosiero kiel \"default\" aŭ \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Aŭtomate ŝargas kaj montras subtekstojn ĉiufoje kiam video komenciĝas.';

  @override
  String get subtitleModeForeignDescription =>
      'Aŭtomate ŝaltas subtekstojn se la defaŭlta aŭdia trako estas en fremda lingvo.';

  @override
  String get subtitleModeForcedDescription =>
      'Ŝargas nur subtekstojn eksplicite markitajn per la marko \"forced\".';

  @override
  String get subtitleModeNoneDescription =>
      'Tute malŝaltas aŭtomatan ŝargon de subtekstoj.';

  @override
  String get fallbackSubtitleLanguage => 'Rezerva subteksta lingvo';

  @override
  String get subtitleStream => 'Subteksta fluo';

  @override
  String get subtitlePreviewText =>
      'La rapida bruna vulpo saltas super la maldiligentan hundon';

  @override
  String get verticalOffset => 'Vertikala Ofseto';

  @override
  String get pgsDirectPlay => 'PGS Rekta Ludado';

  @override
  String get directPlayPgsSubtitles => 'Rekta ludado PGS-subtekstoj';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Rekta Ludado';

  @override
  String get directPlayAssSsaSubtitles => 'Rekta ludado ASS/SSA-subtekstoj';

  @override
  String get white => 'Blanka';

  @override
  String get black => 'Nigra';

  @override
  String get yellow => 'Flava';

  @override
  String get green => 'Verda';

  @override
  String get cyan => 'Cejana';

  @override
  String get red => 'Ruĝa';

  @override
  String get transparent => 'Travidebla';

  @override
  String get semiTransparentBlack => 'Duontravidebla Nigra';

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
  String get global => 'Tutmonda';

  @override
  String get desktop => 'Labortablo';

  @override
  String get mobile => 'Poŝtelefono';

  @override
  String get tv => 'televido';

  @override
  String loadedProfileSettings(String profile) {
    return 'Ŝargitaj $profile profilaj agordoj.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Malsukcesis ŝargi $profile profilagordojn.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Sinkronigitaj lokaj agordoj al $profile profilo.';
  }

  @override
  String get syncing => 'Sinkronigante...';

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
  String get profileSyncHidden => 'Profila Sinkronigo Kaŝita';

  @override
  String get enablePluginSyncDescription =>
      'Ebligu Servil-Aldonaĵan Sinkronigon en Aldonaĵagordoj por montri profilkontrolojn ĉi tie.';

  @override
  String get quality => 'Kvalito';

  @override
  String get defaultDownloadQuality => 'Defaŭlta Elŝuta Kvalito';

  @override
  String get network => 'Reto';

  @override
  String get wifiOnlyDownloads => 'Nur WiFi-Elŝutoj';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Montri elŝutojn sur la servilo';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permesi al la servila administranto vidi viajn transkoditajn elŝutojn en la panelo';

  @override
  String get onlyDownloadOnWifi => 'Elŝutu nur kiam konektite al WiFi';

  @override
  String get storage => 'Stokado';

  @override
  String get storageUsed => 'Stokado Uzita';

  @override
  String get manage => 'Administri';

  @override
  String get calculating => 'Kalkulante...';

  @override
  String get downloadLocation => 'Elŝutu Loko';

  @override
  String get defaultLabel => 'Defaŭlte';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Konservu al dosierujo de Elŝutoj';

  @override
  String get downloadsVisibleToOtherApps =>
      'Elŝutoj/Moonfin - videbla por aliaj programoj';

  @override
  String get dangerZone => 'Danĝera Zono';

  @override
  String get clearAllDownloads => 'Forigi Ĉiuj Elŝutoj';

  @override
  String get original => 'Originala';

  @override
  String get changeDownloadLocation => 'Ŝanĝi Elŝutan Lokon';

  @override
  String get changeDownloadLocationDescription =>
      'Novaj elŝutoj estos konservitaj en la elektita dosierujo. Ekzistantaj elŝutoj restos en sia nuna loko kaj povas esti administritaj de Stokado-agordoj.';

  @override
  String get confirm => 'Konfirmu';

  @override
  String get cannotWriteToFolder =>
      'Ne povas skribi al elektita dosierujo. Bonvolu elekti alian lokon aŭ doni konservajn permesojn.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Ĉu konservi en dosierujo de Elŝutoj?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Elŝutitaj amaskomunikiloj estos konservitaj al Elŝutoj/Moonfin en via aparato. Ĉi tiuj dosieroj estos videblaj por aliaj programoj kiel via galerio aŭ muzikludanto.\n\nEkzistantaj elŝutoj restos en sia nuna loko.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Ebligu';

  @override
  String get clearAllDownloadsWarning =>
      'Ĉi tio forigos ĉiujn elŝutitajn komunikilojn kaj ne povas esti malfarita.';

  @override
  String get clearAll => 'Forigi Ĉion';

  @override
  String get navigationStyle => 'Stilo de Navigado';

  @override
  String get topBar => 'Supra Trinkejo';

  @override
  String get leftSidebar => 'Maldekstra Flankmenuo';

  @override
  String get showShuffleButton => 'Montri Shuffle Butonon';

  @override
  String get showGenresButton => 'Montri Ĝenrojn Butonon';

  @override
  String get showFavoritesButton => 'Montri Preferatajn Butonon';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Montru Bibliotekojn en Ilobreto';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Ĉiam etendi etikedojn de la navigbreto';

  @override
  String get showSeerrButton => 'Montri butonon de Seerr';

  @override
  String get navbarOpacity => 'Navbar Opakeco';

  @override
  String get navbarColor => 'Navbar Koloro';

  @override
  String get gray => 'Griza';

  @override
  String get darkBlue => 'Malhela Bluo';

  @override
  String get purple => 'Purpuro';

  @override
  String get teal => 'Kreko';

  @override
  String get navy => 'Mararmeo';

  @override
  String get charcoal => 'Lignokarbo';

  @override
  String get brown => 'Bruna';

  @override
  String get darkRed => 'Malhela Ruĝa';

  @override
  String get darkGreen => 'Malhela Verdo';

  @override
  String get slate => 'Ardezo';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Biblioteko Display';

  @override
  String get posterLabel => 'Afiŝo';

  @override
  String get thumbnailLabel => 'Bildeto';

  @override
  String get bannerLabel => 'Standardo';

  @override
  String get overridePerLibrarySettings =>
      'Anstataŭigi per-bibliotekaj agordoj';

  @override
  String get applyImageTypeToAllLibraries =>
      'Apliki bildspecon al ĉiuj bibliotekoj';

  @override
  String get multiServerLibraries => 'Plurservilaj Bibliotekoj';

  @override
  String get showLibrariesFromAllServers =>
      'Montru bibliotekojn de ĉiuj konektitaj serviloj';

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
  String get groupItemsIntoCollections => 'Grupigi erojn en kolektojn';

  @override
  String get hideCollectionAssociatedItems =>
      'Kaŝi bibliotekajn erojn asociitajn kun kolektoj dum foliumado de bibliotekoj';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Avizo pri bibliotekgrupigo';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Por uzi ĉi tiun agordon, bonvolu certigi ke la bibliotekaj agordoj \"Grupigi filmojn en kolektojn\" kaj/aŭ \"Grupigi seriojn en kolektojn\" estas ebligitaj sub la Montroagordoj de via biblioteko en via Jellyfin- aŭ Emby-servilo.';

  @override
  String get libraryVisibility => 'Biblioteko Videbleco';

  @override
  String get libraryVisibilityDescription =>
      'Ŝaltu hejmpaĝan videblecon per biblioteko. Rekomencu Moonfin por ke ŝanĝoj efektiviĝu.';

  @override
  String get showInNavigation => 'Montru en navigado';

  @override
  String get showInLatestMedia => 'Montru en plej novaj amaskomunikiloj';

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
  String get sourceLibraries => 'Fontaj Bibliotekoj';

  @override
  String get sourceCollections => 'Fontaj Kolektoj';

  @override
  String get excludedGenres => 'Ekskluditaj Ĝenroj';

  @override
  String get selectAll => 'Elektu Ĉiujn';

  @override
  String itemsSelected(int count) {
    return '$count elektita';
  }

  @override
  String get mediaBar => 'Media Trinkejo';

  @override
  String get mediaSources => 'Media Fontoj';

  @override
  String get behavior => 'Konduto';

  @override
  String get seconds => 'sekundoj';

  @override
  String get mediaBarMode => 'Media Bar Stilo';

  @override
  String get mediaBarModeDescription =>
      'Elektu inter diversaj stiloj de amaskomunikila breto, aŭ malŝaltu la amaskomunikilan breton';

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
  String get mediaBarModeOff => 'Malŝaltita';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Ebligu Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Montru elstaran enhavo-bildaron hejme';

  @override
  String get contentType => 'Enhavo Tipo';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmoj kaj Televidprogramoj';

  @override
  String get moviesOnly => 'Nur Filmoj';

  @override
  String get tvShowsOnly => 'Nur Televidprogramoj';

  @override
  String get itemCount => 'Item Nombro';

  @override
  String get noneSelected => 'Neniu elektita';

  @override
  String get noneExcluded => 'Neniu ekskludita';

  @override
  String get autoAdvance => 'Aŭtomata Antaŭeniĝo';

  @override
  String get autoAdvanceSlides => 'Aŭtomate antaŭeniru al la sekva glitado';

  @override
  String get autoAdvanceInterval => 'Aŭtomata Antaŭa Intervalo';

  @override
  String get trailerPreview => 'Antaŭrigardo';

  @override
  String get autoPlayTrailers =>
      'Aŭtomate ludu antaŭfilmojn en la amaskomunikila trinkejo post 3 sekundoj';

  @override
  String get trailerAudio => 'Aŭdio de antaŭfilmoj';

  @override
  String get enableTrailerAudio =>
      'Ebligi aŭdion por antaŭfilmoj en la aŭdvida breto';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Epizoda Antaŭrigardo';

  @override
  String get mediaPreview => 'Amaskomunikilaro Antaŭrigardo';

  @override
  String get episodePreviewDescription =>
      'Ludu 30-sekundan enlinian antaŭrigardon sur fokusitaj, ŝvebitaj aŭ longe premitaj kartoj';

  @override
  String get mediaPreviewDescription =>
      'Ludu 30-sekundan enlinian antaŭrigardon sur fokusitaj, ŝvebitaj aŭ longe premitaj kartoj';

  @override
  String get previewAudio => 'Antaŭrigardu Aŭdio';

  @override
  String get enablePreviewAudio =>
      'Ebligu aŭdion por antaŭprezentoj de antaŭfilmoj kaj epizodoj';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Plej novaj Amaskomunikiloj';

  @override
  String get recentlyReleased => 'Lastatempe Liberigita';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mia Amaskomunikilaro';

  @override
  String get myMediaSmall => 'Mia Amaskomunikilaro (Malgranda)';

  @override
  String get continueWatching => 'Daŭre Rigardi';

  @override
  String get resumeAudio => 'Rekomencu Aŭdion';

  @override
  String get resumeBooks => 'Resume Libroj';

  @override
  String get activeRecordings => 'Aktivaj Registradoj';

  @override
  String get playlists => 'Ludlistoj';

  @override
  String get liveTV => 'Viva televido';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Restarigi al defaŭltoj';

  @override
  String get homeRowPosterSize => 'Hejma Vico Afiŝo Grandeco';

  @override
  String get configureImageTypeForEachRow =>
      'Agordu bildspecon por ĉiu ebligita hejma vico';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Kunfandi Daŭrigu Rigardadon kaj Sekvantan';

  @override
  String get combineBothRows =>
      'Kombinu ambaŭ vicojn en ununuran hejman sekcion';

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
  String get fullScreenRows => 'Etenditaj hejmaj vicoj';

  @override
  String get fullScreenRowsDescription =>
      'Limigi hejmajn vicojn al 1 vico po ekrano';

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
  String get perRowSettings => 'Agordoj por vico';

  @override
  String get autoLogin => 'Aŭtomata Ensaluto';

  @override
  String get lastUser => 'Lasta Uzanto';

  @override
  String get currentUser => 'Nuna uzanto';

  @override
  String get alwaysAuthenticate => 'Ĉiam Aŭtentikigi';

  @override
  String get requirePasswordWithToken =>
      'Postulu pasvorton eĉ kun stokita ĵetono';

  @override
  String get confirmExit => 'Konfirmu Eliron';

  @override
  String get showConfirmationBeforeExiting => 'Montru konfirmon antaŭ ol eliri';

  @override
  String get blockContentWithRatings => 'Bloki enhavon kun la sekvaj taksoj:';

  @override
  String get noContentRatingsFound =>
      'Neniuj enhavtaksoj ankoraŭ estis trovitaj sur ĉi tiu servilo.';

  @override
  String get couldNotLoadServerRatings =>
      'Ne eblis ŝargi servilojn. Montrante nur konservitajn taksojn.';

  @override
  String get couldNotRefreshRatings =>
      'Ne eblis refreŝigi taksojn de servilo. Montrante konservitajn taksojn.';

  @override
  String get enablePinCode => 'Ebligu PIN-kodon';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Postuli PIN por aliri vian konton';

  @override
  String get changePin => 'Ŝanĝu PIN';

  @override
  String get setNewPinCode => 'Agordu novan PIN-kodon';

  @override
  String get removePin => 'Forigi PIN';

  @override
  String get removePinProtection => 'Forigu PIN-kodan protekton';

  @override
  String get screensaver => 'Ekranŝirmilo';

  @override
  String get inAppScreensaver => 'En-apa Ekranŝirmilo';

  @override
  String get enableBuiltInScreensaver =>
      'Ebligu la enkonstruitan ekranŝirmilon';

  @override
  String get mode => 'Reĝimo';

  @override
  String get libraryArt => 'Biblioteko Arto';

  @override
  String get logo => 'Emblemo';

  @override
  String get clock => 'Horloĝo';

  @override
  String get timeout => 'Tempolimo';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Malfortiga Nivelo';

  @override
  String get maxAgeRating => 'Maksimuma Aĝa Taksado';

  @override
  String get any => 'Ajna';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Postula Aĝa Taksado';

  @override
  String get onlyShowRatedContent => 'Montru nur taksitan enhavon';

  @override
  String get displayClockDuringScreensaver => 'Montru horloĝon dum ekranŝparo';

  @override
  String get clockModeStatic => 'Statika';

  @override
  String get clockModeBouncing => 'Resaltanta';

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
  String get rottenTomatoesCritics => 'Putraj Tomatoj (kritikistoj)';

  @override
  String get rottenTomatoesAudience => 'Putraj Tomatoj (spektantaro)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakrita';

  @override
  String get metacriticUser => 'Metakrita (uzanto)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Leterkestod';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Komunuma Takso';

  @override
  String get ratings => 'Taksoj';

  @override
  String get additionalRatings => 'Pliaj Taksoj';

  @override
  String get showMdbListAndTmdbRatings => 'Montru MDBList kaj TMDB-taksojn';

  @override
  String get ratingLabels => 'Taksaj Etikedoj';

  @override
  String get showLabelsNextToIcons => 'Montru etikedojn apud taksaj ikonoj';

  @override
  String get ratingBadges => 'Taksaj Insignoj';

  @override
  String get showDecorativeBadges =>
      'Montru dekoraciajn insignojn malantaŭ taksoj';

  @override
  String get episodeRatings => 'Epizodaj Taksoj';

  @override
  String get showRatingsOnEpisodes => 'Montru taksojn pri individuaj epizodoj';

  @override
  String get ratingSources => 'Taksaj Fontoj';

  @override
  String get ratingSourcesDescription =>
      'Ebligu kaj reordigu la taksofontojn montritajn tra la aplikaĵo';

  @override
  String get pluginDetected => 'Kromaĵo Detektita';

  @override
  String get pluginNotDetected => 'Kromaĵo Ne Detektita';

  @override
  String get pluginNotDetectedDescription =>
      'Servila kromaĵo ne estas nuntempe detektita. Lokaj agordoj ankoraŭ uzas siajn konservitajn valorojn aŭ enkonstruitajn defaŭltojn.';

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
  String get recentRequests => 'Lastatempaj Petoj';

  @override
  String get recentlyAdded => 'Lastatempe Aldonita';

  @override
  String get trending => 'Tendenco';

  @override
  String get popularMovies => 'Popularaj Filmoj';

  @override
  String get movieGenres => 'Filmaj Ĝenroj';

  @override
  String get upcomingMovies => 'Venontaj Filmoj';

  @override
  String get studios => 'Studioj';

  @override
  String get popularSeries => 'Populara Serio';

  @override
  String get seriesGenres => 'Serio Ĝenroj';

  @override
  String get upcomingSeries => 'Venonta Serio';

  @override
  String get networks => 'Retoj';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Malkovraj vicoj de Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Restarigu vicojn al defaŭltoj';

  @override
  String get enableSeerr => 'Ebligu Seerr';

  @override
  String get showSeerrInNavigation =>
      'Montru Seerr en navigado (postulas servilan kromprogramon)';

  @override
  String get seerrUnavailable =>
      'Nehavebla ĉar servila kromaĵo Seerr-subteno estas malŝaltita.';

  @override
  String get nsfwFilter => 'NSFW Filtrilo';

  @override
  String get hideAdultContent => 'Kaŝi plenkreskan enhavon en rezultoj';

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
  String get seerrNotificationsSection => 'Sciigoj';

  @override
  String get seerrNotifyNewRequestsTitle => 'Sciigoj pri novaj petoj';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Averti min kiam iu sendas peton';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Ĝisdatigoj pri petoj';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprobita, malaprobita kaj aldonita al via biblioteko';

  @override
  String get seerrNotifyIssuesTitle => 'Ĝisdatigoj pri problemoj';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Novaj problemoj, respondoj kaj solvoj';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Ensalutinta kiel: $username';
  }

  @override
  String get discoverRows => 'Malkovra paĝo de Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Ebligu vicojn por vidi sur la ĉefpaĝo de Seerr. Trenu por reordigi. Propra ordo sinkroniĝas kun Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Ebligu vicojn por vidi sur la ĉefpaĝo de Seerr. Trenu por reordigi. Propra ordo sinkroniĝas kun Moonbase.';

  @override
  String get enabled => 'Ebligita';

  @override
  String get hidden => 'Kaŝita';

  @override
  String get aboutTitle => 'Pri';

  @override
  String versionValue(String version) {
    return 'Versio $version';
  }

  @override
  String get openSourceLicenses => 'Malfermfontaj Licencoj';

  @override
  String get sourceCode => 'Fontkodo';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Kontrolu ĝisdatigojn Nun';

  @override
  String get checksLatestDesktopRelease =>
      'Kontrolas la plej novan labortablan eldonon por ĉi tiu platformo';

  @override
  String get youAreUpToDate => 'Vi estas ĝisdatigita.';

  @override
  String get couldNotCheckForUpdates => 'Ne eblis kontroli ĝisdatigojn nun.';

  @override
  String get noCompatibleUpdate =>
      'Neniu kongrua ĝisdatiga pako trovita por ĉi tiu platformo.';

  @override
  String get updateChecksNotSupported =>
      'Ĝisdatigkontroloj ne estas subtenataj sur ĉi tiu platformo.';

  @override
  String get updateNotificationsDisabled =>
      'Ĝisdatigaj sciigoj estas malŝaltitaj.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Bonvolu atendi antaŭ kontroli denove.';

  @override
  String get latestUpdateAlreadyShown =>
      'La lasta ĝisdatigo jam estis montrita.';

  @override
  String get updateAvailable => 'Ĝisdatigo disponebla.';

  @override
  String updateAvailableVersion(String version) {
    return 'Disponebla ĝisdatigo: v$version';
  }

  @override
  String get updateNotifications => 'Ĝisdatigi Sciigojn';

  @override
  String get showWhenUpdatesAvailable => 'Montru kiam ĝisdatigoj disponeblas';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponebla';
  }

  @override
  String get readReleaseNotes => 'Legu Eldonajn Notojn';

  @override
  String get downloadingUpdate => 'Elŝutante ĝisdatigon...';

  @override
  String get updateDownloadFailed =>
      'Elŝuto de ĝisdatigo malsukcesis. Bonvolu provi denove.';

  @override
  String get openReleasesPage => 'Malfermu Paĝon pri Eldonaĵoj';

  @override
  String get navigation => 'Navigado';

  @override
  String get watchedIndicatorsBackdrops => 'Rigardataj indikiloj, fonoj';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusokoloro, rigardataj indikiloj, fonoj';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar stilo, ilobreto butonoj, aspekto';

  @override
  String get featuredContentAppearance => 'Elstara enhavo, aspekto';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limo de bildkaŝmemoro';

  @override
  String get clearImageCache => 'Vakigi bildkaŝmemoron';

  @override
  String get imageCacheCleared => 'Bildkaŝmemoro vakigita';

  @override
  String get clear => 'Vakigi';

  @override
  String get browse => 'Foliumi';

  @override
  String get noResults => 'Neniuj rezultoj';

  @override
  String get seerrAvailableStatus => 'Disponebla';

  @override
  String get seerrRequestedStatus => 'Petita';

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
    return 'Elŝutante · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importante';

  @override
  String itemsCount(int count) {
    return '$count Eroj';
  }

  @override
  String get seerrSettings => 'Seerr Agordoj';

  @override
  String get requestMore => 'Petu Pli';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Peto';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Nuligi Peton';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Ludu en Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Petite de $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Aprobi';

  @override
  String get declineAction => 'Malkresko';

  @override
  String get similar => 'Simile';

  @override
  String get recommendations => 'Rekomendoj';

  @override
  String cancelRequestForTitle(String title) {
    return 'Ĉu nuligi peton por \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Ĉu nuligi $count petojn por \"$title\"?';
  }

  @override
  String get keep => 'Konservu';

  @override
  String get itemNotFoundInLibrary =>
      'Ero ne trovita en via Moonfin-biblioteko';

  @override
  String get errorSearchingLibrary => 'Eraro serĉante bibliotekon';

  @override
  String budgetAmount(String amount) {
    return 'Buĝeto: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Enspezo: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Petu $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Sendu Peton';

  @override
  String get allSeasons => 'Ĉiuj Sezonoj';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Altnivelaj Opcioj';

  @override
  String get noServiceServersConfigured => 'Neniuj servoserviloj agordis';

  @override
  String get server => 'Servilo';

  @override
  String get qualityProfile => 'Kvalita Profilo';

  @override
  String get rootFolder => 'Radika Dosierujo';

  @override
  String get showMore => 'Montri Pli';

  @override
  String get appearances => 'Aperoj';

  @override
  String get crewSection => 'Ŝipano';

  @override
  String ageValue(int age) {
    return 'aĝo $age';
  }

  @override
  String get noRequests => 'Neniuj petoj';

  @override
  String get pendingStatus => 'Pritraktata';

  @override
  String get declinedStatus => 'Malakceptis';

  @override
  String get partiallyAvailable => 'Parte Havebla';

  @override
  String get downloadingStatus => 'Elŝutante';

  @override
  String get approvedStatus => 'Aprobita';

  @override
  String get notRequestedStatus => 'Ne Petita';

  @override
  String get blocklistedStatus => 'Bloklistigita';

  @override
  String get deletedStatus => 'Forigita';

  @override
  String get failedStatus => 'Malsukcesis';

  @override
  String get processingStatus => 'Traktante';

  @override
  String modifiedByName(String name) {
    return 'Modifita de $name';
  }

  @override
  String get completedStatus => 'Finita';

  @override
  String get requestErrorDuplicate => 'Ĉi tiu titolo jam estis petita';

  @override
  String get requestErrorQuota => 'Limo de petoj atingita';

  @override
  String get requestErrorBlocklisted => 'Ĉi tiu titolo estas en la bloklisto';

  @override
  String get requestErrorNoSeasons => 'Neniuj sezonoj restas por peti';

  @override
  String get requestErrorPermission =>
      'Vi ne havas permeson fari ĉi tiun peton';

  @override
  String get seerrRequestsTitle => 'Petoj';

  @override
  String get seerrIssuesTitle => 'Problemoj';

  @override
  String get sortNewest => 'Plej novaj';

  @override
  String get sortLastModified => 'Laste modifita';

  @override
  String get noIssues => 'Neniuj problemoj';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining el $limit filmpetoj restas';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining el $limit sezonpetoj restas';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Parto de $name';
  }

  @override
  String get viewCollection => 'Vidi kolekton';

  @override
  String get requestCollection => 'Peti kolekton';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmoj · $available disponeblaj';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Peti $count filmojn';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Petante $current el $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Petis $count filmojn';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Petis $ok el $total filmoj';
  }

  @override
  String get collectionAllRequested =>
      'Ĉiuj filmoj jam estas disponeblaj aŭ petitaj';

  @override
  String get reportIssue => 'Raporti problemon';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Aŭdio';

  @override
  String get whatsWrong => 'Kio malas?';

  @override
  String get allEpisodes => 'Ĉiuj epizodoj';

  @override
  String get episode => 'Epizodo';

  @override
  String get openStatus => 'Malfermita';

  @override
  String get resolvedStatus => 'Solvita';

  @override
  String get resolveAction => 'Solvi';

  @override
  String get reopenAction => 'Remalfermi';

  @override
  String reportedByName(String name) {
    return 'Raportita de $name';
  }

  @override
  String commentsCount(int count) {
    return '$count komentoj';
  }

  @override
  String get addComment => 'Aldoni komenton';

  @override
  String get deleteIssueConfirm => 'Ĉu forigi ĉi tiun problemon?';

  @override
  String get submitReport => 'Sendi raporton';

  @override
  String get tmdbScore => 'TMDB-Poentaro';

  @override
  String get releaseDateLabel => 'Eldondato';

  @override
  String get firstAirDateLabel => 'Unua Aera Dato';

  @override
  String get revenueLabel => 'Enspezo';

  @override
  String get runtimeLabel => 'Daŭro';

  @override
  String get budgetLabel => 'Buĝeto';

  @override
  String get originalLanguageLabel => 'Originala Lingvo';

  @override
  String get seasonsLabel => 'Sezonoj';

  @override
  String get episodesLabel => 'Epizodoj';

  @override
  String get access => 'Aliro';

  @override
  String get add => 'Aldoni';

  @override
  String get address => 'Adreso';

  @override
  String get analytics => 'Analitiko';

  @override
  String get catalog => 'Katalogo';

  @override
  String get content => 'Enhavo';

  @override
  String get copy => 'Kopiu';

  @override
  String get create => 'Krei';

  @override
  String get disable => 'Malebligu';

  @override
  String get done => 'Farita';

  @override
  String get edit => 'Redakti';

  @override
  String get encoding => 'Kodigado';

  @override
  String get error => 'Eraro';

  @override
  String get forward => 'Antaŭen';

  @override
  String get general => 'Ĝenerala';

  @override
  String get go => 'Iru';

  @override
  String get install => 'Instali';

  @override
  String get installed => 'Instalita';

  @override
  String get interval => 'Intervalo';

  @override
  String get name => 'Nomo';

  @override
  String get networking => 'Retoj';

  @override
  String get next => 'Sekva';

  @override
  String get path => 'Vojo';

  @override
  String get paused => 'Paŭzita';

  @override
  String get permissions => 'Permesoj';

  @override
  String get processing => 'Prilaborado';

  @override
  String get profile => 'Profilo';

  @override
  String get provider => 'Provizanto';

  @override
  String get refresh => 'Refreŝigi';

  @override
  String get remote => 'Teleregilo';

  @override
  String get rename => 'Alinomi';

  @override
  String get revoke => 'Revoki';

  @override
  String get role => 'Rolo';

  @override
  String get root => 'Radiko';

  @override
  String get run => 'Kuru';

  @override
  String get search => 'Serĉi';

  @override
  String get select => 'Elektu';

  @override
  String get send => 'Sendu';

  @override
  String get sessions => 'Sesioj';

  @override
  String get set => 'Agordu';

  @override
  String get status => 'Statuso';

  @override
  String get stop => 'Haltigi';

  @override
  String get streaming => 'Elsendfluado';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Malinstali';

  @override
  String get up => 'Supren';

  @override
  String get update => 'Ĝisdatigo';

  @override
  String get upload => 'Alŝutu';

  @override
  String get unmute => 'Malŝaltu';

  @override
  String get mute => 'Silentigi';

  @override
  String get branding => 'Markado';

  @override
  String get adminDrawerDashboard => 'Panelo';

  @override
  String get adminDrawerAnalytics => 'Analitiko';

  @override
  String get adminDrawerSettings => 'Agordoj';

  @override
  String get adminDrawerBranding => 'Markado';

  @override
  String get adminDrawerUsers => 'Uzantoj';

  @override
  String get adminDrawerLibraries => 'Bibliotekoj';

  @override
  String get adminDrawerDisplay => 'Montro';

  @override
  String get adminDrawerMetadata => 'Metadatumoj';

  @override
  String get adminDrawerNfo => 'NFO-agordoj';

  @override
  String get adminDrawerTranscoding => 'Transkodigo';

  @override
  String get adminDrawerResume => 'Daŭrigi';

  @override
  String get adminDrawerStreaming => 'Elsendfluado';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Aparatoj';

  @override
  String get adminDrawerActivity => 'Aktiveco';

  @override
  String get adminDrawerNetworking => 'Retoj';

  @override
  String get adminDrawerApiKeys => 'API-Ŝlosiloj';

  @override
  String get adminDrawerBackups => 'Rezervoj';

  @override
  String get adminDrawerLogs => 'Ŝtipoj';

  @override
  String get adminDrawerScheduledTasks => 'Planitaj Taskoj';

  @override
  String get adminDrawerPlugins => 'Kromaĵoj';

  @override
  String get adminDrawerRepositories => 'Deponejoj';

  @override
  String get adminDrawerLiveTv => 'Viva televido';

  @override
  String get adminExitTooltip => 'Eliru Admin';

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
  String get adminDashboardLoadFailed => 'Malsukcesis ŝarĝi panelon';

  @override
  String get adminMediaOverview => 'Media Superrigardo';

  @override
  String get adminMediaTotalsError =>
      'Ne eblis ŝargi servilajn amaskomunikilajn totalojn.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Rapida legado pri kiom da enhavo estas sur ĉi tiu servilo.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Aldonaĵĝisdatigoj haveblaj: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Kromaĵoj postulantaj rekomencon: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Malsukcesaj planitaj taskoj: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Media Distribuo';

  @override
  String get analyticsVideoCodecs => 'Videokodekoj';

  @override
  String get analyticsAudioCodecs => 'Aŭdiokodekoj';

  @override
  String get analyticsContainers => 'Ujoj';

  @override
  String get analyticsTopGenres => 'Ĉefaj Ĝenroj';

  @override
  String get analyticsReleaseYears => 'Eldonjaroj';

  @override
  String get analyticsContentRatings => 'Enhavaj Taksoj';

  @override
  String get analyticsRuntimeBuckets => 'Runtime Siteloj';

  @override
  String get analyticsFileFormats => 'Dosieraj Formatoj';

  @override
  String get analyticsNoData => 'Neniuj Datumoj Disponeblaj.';

  @override
  String get adminServerInfo => 'Servilo Informoj';

  @override
  String get adminRestartPending => 'Rekomenco Atendante';

  @override
  String get adminServerPaths => 'Servilaj Vojetoj';

  @override
  String get adminServerActions => 'Servilaj Agoj';

  @override
  String get adminRestartServer => 'Rekomencu Servilon';

  @override
  String get adminShutdownServer => 'Malŝaltu Servilon';

  @override
  String get adminLibraryScanStarted => 'Biblioteko-skanado komenciĝis';

  @override
  String errorGeneric(String error) {
    return 'Eraro: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Servilo rekomencas en progreso';

  @override
  String get adminServerRebootMessage =>
      'Servilo rekomencas, bonvolu rekomenci Moonfin';

  @override
  String get adminActiveSessions => 'Aktivaj Sesioj';

  @override
  String get adminSessionsLoadFailed => 'Malsukcesis ŝargi kunsidojn';

  @override
  String get adminNoActiveSessions => 'Neniuj aktivaj sesioj';

  @override
  String get adminRecentActivity => 'Lastatempa Agado';

  @override
  String get adminNoRecentActivity => 'Neniu lastatempa agado';

  @override
  String adminCommandFailed(String error) {
    return 'Komando malsukcesis: $error';
  }

  @override
  String get adminSendMessage => 'Sendu Mesaĝon';

  @override
  String get adminMessageTextHint => 'Mesaĝa teksto';

  @override
  String get adminSetVolume => 'Agordu Volumon';

  @override
  String get sessionPrev => 'Antaŭa';

  @override
  String get sessionRewind => 'Rebobenu';

  @override
  String get sessionForward => 'Antaŭen';

  @override
  String get sessionNext => 'Sekva';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Laŭt. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Nun Ludante';

  @override
  String get volume => 'Laŭteco';

  @override
  String get actions => 'Agoj';

  @override
  String get videoCodec => 'Videa kodeko';

  @override
  String get audioCodec => 'Aŭdiokodeko';

  @override
  String get hwAccel => 'Aparatara akcelo';

  @override
  String get completion => 'Kompletigo';

  @override
  String get adminClearDates => 'Klaraj datoj';

  @override
  String get adminActivitySeverityAll => 'Ĉiuj gravecoj';

  @override
  String get adminActivityDateRange => 'Datintervalo';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Malsukcesis ŝargi agadprotokolo: $error';
  }

  @override
  String get adminNoActivityEntries => 'Neniuj aktivaj enskriboj';

  @override
  String get adminEditDeviceName => 'Redaktu Apalan Nomon';

  @override
  String get adminCustomName => 'Propra Nomo';

  @override
  String get adminDeviceNameUpdated => 'Aparatonomo ĝisdatigita';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Malsukcesis ĝisdatigi aparaton: $error';
  }

  @override
  String get adminDeleteDevice => 'Forigi aparaton';

  @override
  String get adminDeviceDeleted => 'Aparato forigita';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Malsukcesis forigi aparaton: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ĉu forigi aparaton \'$name\'? La uzanto devos denove ensaluti sur ĉi tiu aparato.';
  }

  @override
  String get adminDeleteAllDevices => 'Forigi ĉiujn aparatojn';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Ĉu forigi $count aparatojn? La koncernaj uzantoj devos denove ensaluti. Via nuna aparato ne estas tuŝita.';
  }

  @override
  String get adminDevicesDeletedAll => 'Aparatoj forigitaj';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Forigis kelkajn aparatojn; $count ne povis esti forigitaj.';
  }

  @override
  String get adminDevicesLoadFailed => 'Malsukcesis ŝargi aparatojn';

  @override
  String get adminSearchDevices => 'Serĉu aparatojn';

  @override
  String get adminThisDevice => 'Ĉi tiu Aparato';

  @override
  String get adminEditName => 'Redakti Nomon';

  @override
  String get adminLibrariesLoadFailed => 'Malsukcesis ŝargi bibliotekojn';

  @override
  String get adminNoLibraries => 'Neniuj bibliotekoj agordis';

  @override
  String get adminScanAllLibraries => 'Skanu Ĉiujn Bibliotekojn';

  @override
  String get adminAddLibrary => 'Aldonu Bibliotekon';

  @override
  String adminScanFailed(String error) {
    return 'Malsukcesis komenci skanadon: $error';
  }

  @override
  String get adminRenameLibrary => 'Alinomi Biblioteko';

  @override
  String get adminNewName => 'Nova nomo';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteko renomita al \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Malsukcesis renomi: $error';
  }

  @override
  String get adminDeleteLibrary => 'Forigi Bibliotekon';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteko \"$name\" forigita';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Malsukcesis forigi bibliotekon: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Malsukcesis aldoni vojon: $error';
  }

  @override
  String get adminRemovePath => 'Forigi Vojon';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ĉu forigi \"$path\" de ĉi tiu biblioteko?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Malsukcesis forigi vojon: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Malsukcesis ŝargi bibliotekon';

  @override
  String get adminNoMediaPaths => 'Neniuj amaskomunikilaj vojoj agordis';

  @override
  String get adminAddPath => 'Aldonu Vojon';

  @override
  String get adminBrowseFilesystem => 'Foliumi servilan dosiersistemon:';

  @override
  String get adminPreferredMetadataLanguage => 'Preferata metadatuma lingvo';

  @override
  String get adminMetadataLanguageHint => 'ekz. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Landkodo de metadatumoj';

  @override
  String get adminMetadataCountryHint => 'ekz. Usono, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Vojoj';

  @override
  String get adminLibraryTabOptions => 'Opcioj';

  @override
  String get adminLibraryTabDownloaders => 'Elŝutiloj';

  @override
  String get adminLibMetadataSavers => 'Konservantoj de metadatumoj';

  @override
  String get adminLibSubtitleDownloaders => 'Elŝutiloj de subtekstoj';

  @override
  String get adminLibLyricDownloaders => 'Elŝutiloj de kantotekstoj';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Elŝutiloj de metadatumoj: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Alportiloj de bildoj: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ĉi tiu servilo prezentas neniujn elŝutilojn por ĉi tiu bibliotektipo.';

  @override
  String get adminLibrarySectionGeneral => 'Ĝenerala';

  @override
  String get adminLibrarySectionMetadata => 'Metadatumoj';

  @override
  String get adminLibrarySectionEmbedded => 'Enigita informo';

  @override
  String get adminLibrarySectionSubtitles => 'Subtekstoj';

  @override
  String get adminLibrarySectionImages => 'Bildoj';

  @override
  String get adminLibrarySectionSeries => 'Serioj';

  @override
  String get adminLibrarySectionMusic => 'Muziko';

  @override
  String get adminLibrarySectionMovies => 'Filmoj';

  @override
  String get adminLibRealtimeMonitor => 'Ebligi realtempan monitoradon';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detekti dosierŝanĝojn kaj trakti ilin aŭtomate.';

  @override
  String get adminLibEnablePhotos => 'Montri fotojn';

  @override
  String get adminLibSaveLocalMetadata =>
      'Konservi bildojn en aŭdvidajn dosierujojn';

  @override
  String get adminLibRefreshInterval => 'Aŭtomata refreŝigo de metadatumoj';

  @override
  String get adminLibRefreshNever => 'Neniam';

  @override
  String get adminLibDefault => 'Defaŭlta';

  @override
  String get adminLibDisplayTitle => 'Montro';

  @override
  String get adminLibDisplaySection => 'Bibliotekmontro';

  @override
  String get adminLibFolderView =>
      'Montri dosierujan vidon por prezenti simplajn aŭdvidajn dosierujojn';

  @override
  String get adminLibSpecialsInSeasons =>
      'Montri specialaĵojn ene de la sezonoj en kiuj ili elsendiĝis';

  @override
  String get adminLibGroupMovies => 'Grupigi filmojn en kolektojn';

  @override
  String get adminLibGroupShows => 'Grupigi seriojn en kolektojn';

  @override
  String get adminLibExternalSuggestions =>
      'Montri eksteran enhavon en sugestoj';

  @override
  String get adminLibDateAddedSection => 'Konduto de aldondato';

  @override
  String get adminLibDateAddedLabel => 'Uzi aldondaton el';

  @override
  String get adminLibDateAddedImport => 'Dato skanita en la bibliotekon';

  @override
  String get adminLibDateAddedFile => 'Dato kiam la dosiero estis kreita';

  @override
  String get adminLibMetadataTitle => 'Metadatumoj kaj bildoj';

  @override
  String get adminLibMetadataLangSection => 'Preferata lingvo de metadatumoj';

  @override
  String get adminLibChaptersSection => 'Ĉapitroj';

  @override
  String get adminLibDummyChapterDuration =>
      'Daŭro de fikcia ĉapitro (sekundoj)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Longeco de ĉapitroj generitaj por aŭdvidaĵoj kiuj havas neniujn. Agordu al 0 por malŝalti.';

  @override
  String get adminLibChapterImageResolution => 'Distingivo de ĉapitraj bildoj';

  @override
  String get adminLibNfoTitle => 'NFO-agordoj';

  @override
  String get adminLibNfoHelp =>
      'NFO-metadatumoj kongruas kun Kodi kaj similaj klientoj. La agordoj validas por ĉiuj bibliotekoj kiuj konservas NFO-metadatumojn.';

  @override
  String get adminLibKodiUser =>
      'Uzanto por kiu konservi spektadan datumon en NFO-dosieroj';

  @override
  String get adminLibSaveImagePaths =>
      'Konservi bildvojojn ene de NFO-dosieroj';

  @override
  String get adminLibPathSubstitution =>
      'Ebligi vojanstataŭigon por NFO-bildvojoj';

  @override
  String get adminLibExtraThumbs =>
      'Kopii extrafanart-bildojn en extrathumbs-dosierujon';

  @override
  String get adminLibNone => 'Neniu';

  @override
  String adminLibRefreshDays(int days) {
    return '$days tagoj';
  }

  @override
  String get adminLibEmbeddedTitles => 'Uzi enigitajn titolojn';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Uzi enigitajn titolojn por ekstraĵoj';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Uzi enigitajn epizodinformojn';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Permesi enigitajn subtekstojn';

  @override
  String get adminLibEmbeddedAllowAll => 'Permesi ĉiujn';

  @override
  String get adminLibEmbeddedAllowText => 'Nur teksto';

  @override
  String get adminLibEmbeddedAllowImage => 'Nur bildo';

  @override
  String get adminLibEmbeddedAllowNone => 'Neniu';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Preterlasi elŝuton se enigitaj subtekstoj ĉeestas';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Preterlasi elŝuton se la aŭdia trako kongruas kun la elŝutlingvo';

  @override
  String get adminLibRequirePerfectMatch =>
      'Postuli perfektan subtekstan kongruon';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Konservi subtekstojn en aŭdvidajn dosierujojn';

  @override
  String get adminLibChapterImageExtraction => 'Ekstrakti ĉapitrajn bildojn';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Ekstrakti ĉapitrajn bildojn dum la bibliotekskano';

  @override
  String get adminLibTrickplayExtraction =>
      'Ebligi ekstraktadon de Trickplay-bildoj';

  @override
  String get adminLibTrickplayDuringScan =>
      'Ekstrakti Trickplay-bildojn dum la bibliotekskano';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Konservi Trickplay-bildojn en aŭdvidajn dosierujojn';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Aŭtomate kunfandi seriojn disigitajn tra pluraj dosierujoj';

  @override
  String get adminLibSeasonZeroName => 'Montronomo de sezono nul';

  @override
  String get adminLibLufsScan => 'Ebligi LUFS-skanon por aŭdia normaligo';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferi nenorman artistetikedon';

  @override
  String get adminLibAutoAddToCollection =>
      'Aŭtomate aldoni filmojn al kolektoj';

  @override
  String get adminLibraryNameRequired => 'Biblioteko nomo estas postulata';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Malsukcesis krei bibliotekon: $error';
  }

  @override
  String get adminLibraryName => 'Biblioteko Nomo';

  @override
  String get adminSelectedPaths => 'Elektitaj Vojetoj:';

  @override
  String get adminCreateLibrary => 'Krei Bibliotekon';

  @override
  String get paths => 'Vojetoj:';

  @override
  String get adminDisableUser => 'Malebligu Uzanton';

  @override
  String get adminEnableUser => 'Ebligu Uzanton';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Malŝalti $name? Ili ne povos ensaluti.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Ebligi $name? Ili denove povos ensaluti.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Uzanto \"$name\" malŝaltita';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Uzanto \"$name\" ebligita';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Malsukcesis ĝisdatigi uzantpolitikon: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Malsukcesis ŝargi uzantojn';

  @override
  String get adminSearchUsers => 'Serĉu uzantojn';

  @override
  String get adminEditUser => 'Redaktu Uzanton';

  @override
  String get adminAddUser => 'Aldoni Uzanton';

  @override
  String adminUserCreateFailed(String error) {
    return 'Malsukcesis krei uzanton: $error';
  }

  @override
  String get adminCreateUser => 'Krei Uzanton';

  @override
  String get adminPasswordOptional => 'Pasvorto (laŭvola)';

  @override
  String get adminUsernameRequired => 'Uzantnomo ne povas esti malplena';

  @override
  String adminSaveFailed(String error) {
    return 'Malsukcesis konservi: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Pasvortoj ne kongruas';

  @override
  String adminFailed(String error) {
    return 'Malsukcesis: $error';
  }

  @override
  String get adminUserLoadFailed => 'Malsukcesis ŝargi uzanton';

  @override
  String get adminDeleteUser => 'Forigi Uzanton';

  @override
  String get admin => 'Administranto';

  @override
  String get adminFullAccessWarning =>
      'Administrantoj havas kompletan aliron al la servilo. Donu kun singardemo.';

  @override
  String get administrator => 'Administranto';

  @override
  String get adminHiddenUser => 'Kaŝita uzanto';

  @override
  String get adminAllowMediaPlayback =>
      'Permesu reproduktadon de amaskomunikiloj';

  @override
  String get adminAllowAudioTranscoding => 'Permesu son-transkodigon';

  @override
  String get adminAllowVideoTranscoding => 'Permesu video-transkodigon';

  @override
  String get adminAllowRemuxing => 'Permesu remiksadon';

  @override
  String get adminForceRemoteTranscoding => 'Devigi foran fontan transkodigon';

  @override
  String get adminAllowContentDownloading => 'Permesu elŝuton de enhavo';

  @override
  String get adminAllowPublicSharing => 'Permesu publikan kundividon';

  @override
  String get adminAllowRemoteControl =>
      'Permesu malproksiman kontrolon de aliaj uzantoj';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permesu komunan aparaton kontrolon';

  @override
  String get adminAllowRemoteAccess => 'Permesu malproksiman aliron';

  @override
  String get adminLeaveEmptyNoLimit => 'Lasu malplena sen limo';

  @override
  String get adminMaxActiveSessions => 'Maksimumaj aktivaj sesioj';

  @override
  String get adminAllowLiveTvAccess => 'Permesu Live TV-aliron';

  @override
  String get adminAllowLiveTvManagement => 'Permesu Live TV-administradon';

  @override
  String get adminAllowCollectionManagement => 'Permesu kolekto-administradon';

  @override
  String get adminAllowSubtitleManagement =>
      'Permesu administradon de subtitoloj';

  @override
  String get adminAllowLyricManagement => 'Permesu lirikan administradon';

  @override
  String get adminEnableAllLibraryAccess => 'Ebligu aliron al ĉiuj bibliotekoj';

  @override
  String get adminChangePassword => 'Ŝanĝi Pasvorton';

  @override
  String get adminNewPassword => 'Nova Pasvorto';

  @override
  String get adminConfirmPassword => 'Konfirmu Pasvorton';

  @override
  String get adminSetPassword => 'Agordu Pasvorton';

  @override
  String get adminResetPassword => 'Restarigi Pasvorton';

  @override
  String get adminPasswordReset => 'Pasvorto rekomencigita';

  @override
  String get adminPasswordUpdated => 'Pasvorto ĝisdatigita';

  @override
  String get adminUserSettings => 'Uzanto-Agordoj';

  @override
  String get adminLibraryAccess => 'Biblioteko Aliro';

  @override
  String get adminEnableAllDevices => 'Ebligu aliron al ĉiuj aparatoj';

  @override
  String get adminEnableAllChannels => 'Ebligu aliron al ĉiuj kanaloj';

  @override
  String get adminParentalControl => 'Gepatra kontrolo';

  @override
  String get adminMaxParentalRating => 'Maksimuma permesita aĝoklasifiko';

  @override
  String get adminMaxParentalRatingHint =>
      'Enhavo kun pli alta klasifiko estos kaŝita de ĉi tiu uzanto.';

  @override
  String get adminParentalRatingNone => 'Neniu';

  @override
  String get adminBlockUnratedItems =>
      'Bloki erojn kun neniu aŭ nerekonata klasifika informo';

  @override
  String get adminUnratedBook => 'Libroj';

  @override
  String get adminUnratedChannelContent => 'Kanaloj';

  @override
  String get adminUnratedLiveTvChannel => 'Viva televido';

  @override
  String get adminUnratedMovie => 'Filmoj';

  @override
  String get adminUnratedMusic => 'Muziko';

  @override
  String get adminUnratedTrailer => 'Antaŭfilmoj';

  @override
  String get adminUnratedSeries => 'Serioj';

  @override
  String get adminAccessSchedules => 'Alirhoraroj';

  @override
  String get adminAccessSchedulesHint =>
      'Permesi aliron nur dum la suba horaro. Aliro estas permesita la tutan tagon kiam neniu horaro estas agordita.';

  @override
  String get adminAddSchedule => 'Aldoni horaron';

  @override
  String get adminScheduleDay => 'Tago';

  @override
  String get adminScheduleStart => 'Komenco';

  @override
  String get adminScheduleEnd => 'Fino';

  @override
  String get adminDayEveryday => 'Ĉiutage';

  @override
  String get adminDayWeekday => 'Labortago';

  @override
  String get adminDayWeekend => 'Semajnfino';

  @override
  String get adminDaySunday => 'Dimanĉo';

  @override
  String get adminDayMonday => 'Lundo';

  @override
  String get adminDayTuesday => 'Mardo';

  @override
  String get adminDayWednesday => 'Merkredo';

  @override
  String get adminDayThursday => 'Ĵaŭdo';

  @override
  String get adminDayFriday => 'Vendredo';

  @override
  String get adminDaySaturday => 'Sabato';

  @override
  String get adminAllowedTags => 'Permesitaj etikedoj';

  @override
  String get adminAllowedTagsHint =>
      'Nur enhavo kun ĉi tiuj etikedoj estas montrata. Lasu malplena por permesi ĉiujn.';

  @override
  String get adminBlockedTags => 'Blokitaj etikedoj';

  @override
  String get adminBlockedTagsHint =>
      'Enhavo kun ĉi tiuj etikedoj estas kaŝita de ĉi tiu uzanto.';

  @override
  String get adminAddTag => 'Aldoni etikedon';

  @override
  String get adminAuthProvider => 'Aŭtentiga provizanto';

  @override
  String get adminPasswordResetProvider => 'Provizanto de pasvortrestarigo';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maksimumaj malsukcesaj ensalutprovoj antaŭ ŝloso';

  @override
  String get adminLoginAttemptsHint =>
      'Agordu al 0 por la defaŭlto, aŭ al -1 por malŝalti ŝloson.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-aliro';

  @override
  String get adminSyncPlayCreateAndJoin => 'Permesi krei kaj aliĝi al grupoj';

  @override
  String get adminSyncPlayJoin => 'Permesi aliĝi al grupoj';

  @override
  String get adminSyncPlayNone => 'Neniu aliro';

  @override
  String get adminContentDeletionFolders => 'Permesi forigon de enhavo el';

  @override
  String get adminResetPasswordWarning =>
      'Ĉi tio forigos la pasvorton. La uzanto povos ensaluti sen pasvorto.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Servilo resendis HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ĉu vi certas, ke vi volas forigi $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Uzanto \"$name\" forigita';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Malsukcesis forigi uzanton: $error';
  }

  @override
  String get adminCreateApiKey => 'Kreu API-Ŝlosilon';

  @override
  String get adminAppName => 'Nomo de la aplikaĵo';

  @override
  String get adminApiKeyCreated => 'API Ŝlosilo Kreita';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ŝlosilo kreita sukcese. La servilo ne resendis la ĵetonon. Kontrolu servilajn API-ŝlosilojn.';

  @override
  String get adminKeyCopied => 'Ŝlosilo kopiita al tondujo';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Malsukcesis krei ŝlosilon: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Ŝlosilĵetono mankas de servila respondo';

  @override
  String get adminRevokeApiKey => 'Revoki API-Ŝlosilon';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Ĉu revoki ŝlosilon por $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-ŝlosilo revokita';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Malsukcesis revoki ŝlosilon: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Malsukcesis ŝargi API-ŝlosilojn';

  @override
  String get adminApiKeysTitle => 'API-Ŝlosiloj';

  @override
  String get adminCreateKey => 'Krei Ŝlosilon';

  @override
  String get adminNoApiKeys => 'Neniuj API-ŝlosiloj trovitaj';

  @override
  String get adminUnknownApp => 'Nekonata Apo';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Ĵetono: $token\\nKreita: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Krei sekurkopion';

  @override
  String get adminBackupDatabase => 'Datumbazo';

  @override
  String get adminBackupDatabaseAlways => 'Ĉiam inkluzivita';

  @override
  String get adminBackupMetadata => 'Metadatumoj';

  @override
  String get adminBackupSubtitles => 'Subtekstoj';

  @override
  String get adminBackupTrickplay => 'Trickplay-bildoj';

  @override
  String get adminCreatingBackup => 'Kreante sekurkopion...';

  @override
  String get adminBackupCreated => 'Rezervo kreita sukcese';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Malsukcesis krei sekurkopion: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Rezerva vojo mankas en servila respondo';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesto: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Malsukcesis ŝargi manifeston: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmu Restarigon';

  @override
  String get adminRestoringBackup => 'Restarigante sekurkopion...';

  @override
  String adminRestoreFailed(String error) {
    return 'Malsukcesis restarigi sekurkopion: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Malsukcesis ŝargi sekurkopiojn';

  @override
  String get adminCreateBackup => 'Krei Rezervon';

  @override
  String get adminNoBackups => 'Neniuj sekurkopioj trovitaj';

  @override
  String get adminViewDetails => 'Rigardu Detalojn';

  @override
  String get restore => 'Restarigi';

  @override
  String get adminLogsLoadFailed => 'Malsukcesis ŝargi servilaj protokoloj';

  @override
  String get adminNoLogFiles => 'Neniuj protokoldosieroj trovitaj';

  @override
  String get adminLogCopied => 'Registro kopiita al tondujo';

  @override
  String get adminSaveLogFile => 'Konservu protokoldosieron';

  @override
  String adminSavedTo(String path) {
    return 'Konservite al $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Malsukcesis konservi dosieron: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Malsukcesis ŝargi $fileName';
  }

  @override
  String get adminSearchInLog => 'Serĉu en protokolo';

  @override
  String get adminNoMatchingLines => 'Neniuj kongruaj linioj';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Malsukcesis ŝargi taskojn: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Neniuj planitaj taskoj trovitaj';

  @override
  String get adminNoTasksMatchFilter =>
      'Neniuj taskoj kongruas kun la nuna filtrilo';

  @override
  String adminTaskStartFailed(String error) {
    return 'Malsukcesis komenci taskon: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Malsukcesis ĉesigi taskon: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Malsukcesis ŝargi taskon: $error';
  }

  @override
  String get adminRunNow => 'Kuru Nun';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Malsukcesis forigi ellasilon: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Malsukcesis aldoni ellasilon: $error';
  }

  @override
  String get adminLastExecution => 'Lasta Ekzekuto';

  @override
  String get adminTriggers => 'Ellasiloj';

  @override
  String get adminAddTrigger => 'Aldonu ellasilon';

  @override
  String get adminNoTriggers => 'Neniu ellasilo agordita';

  @override
  String get adminTriggerType => 'Trigger Tipo';

  @override
  String get adminNoLimit => 'Neniu limo';

  @override
  String adminHours(String hours) {
    return '$hours horo(j)';
  }

  @override
  String get adminDayOfWeek => 'Tago de semajno';

  @override
  String get adminSearchPlugins => 'Serĉu kromaĵojn...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Malsukcesis ŝanĝi kromprogramon: $error';
  }

  @override
  String get adminUninstallPlugin => 'Malinstali kromprogramon';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ĉu vi certas, ke vi volas malinstali \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Malsukcesis malinstali kromprogramon: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Malsukcesis instali pakon: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Malsukcesis instali ĝisdatigon: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Malsukcesis ŝargi kromaĵojn: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Neniuj kromprogramoj kongruas kun via serĉo';

  @override
  String get adminNoPluginsInstalled => 'Neniuj kromprogramoj instalitaj';

  @override
  String adminInstallUpdate(String version) {
    return 'Instali ĝisdatigon (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Malsukcesis ŝargi katalogon: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Neniuj pakoj kongruas kun via serĉo';

  @override
  String get adminNoPackagesAvailable => 'Neniuj pakoj haveblaj';

  @override
  String get adminExperimentalIntegration => 'Eksperimenta Integriĝo';

  @override
  String get adminExperimentalWarning =>
      'La integriĝo de kromprogramoj ankoraŭ estas eksperimenta. Iuj agordaj paĝoj eble ne bildigas ĝuste.';

  @override
  String get continueAction => 'Daŭrigu';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" estos forigita post rekomenco de servilo';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Malsukcesis malinstali: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Ĝisdatigante \"$name\" al v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Malsukcesis ŝargi kromprogramon: $error';
  }

  @override
  String get adminPluginNotFound => 'Kromaĵo ne trovita';

  @override
  String adminPluginVersion(String version) {
    return 'Versio $version';
  }

  @override
  String get adminEnablePlugin => 'Ebligu Kromprogramon';

  @override
  String get adminPluginSettingsPage => 'Paĝo de agordoj de kromprogramoj';

  @override
  String get adminRevisionHistory => 'Historio de Revizio';

  @override
  String get adminNoChangelog => 'Neniu ŝanĝprotokolo havebla.';

  @override
  String get adminRemoveRepository => 'Forigi Deponejon';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ĉu vi certas, ke vi volas forigi \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Malsukcesis konservi deponejojn: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Malsukcesis ŝargi deponejojn: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ekz. Jellyfin Stalo';

  @override
  String get adminRepositoryUrl => 'Deponejo URL';

  @override
  String get adminAddEntry => 'Aldonu eniron';

  @override
  String get adminInvalidUrl => 'Nevalida URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Ne eblas ŝargi kromprogramojn: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Ne eblis malfermi $uri';
  }

  @override
  String get adminOpenInBrowser => 'Malfermu en Retumilo';

  @override
  String get adminOpenExternally => 'Malfermu ekstere';

  @override
  String get adminGeneralSettings => 'Ĝeneralaj Agordoj';

  @override
  String get adminServerName => 'Servilonomo';

  @override
  String get adminPreferredMetadataCountry => 'Preferata metadatuma lando';

  @override
  String get adminCachePath => 'Cache vojo';

  @override
  String get adminMetadataPath => 'Metadatuma vojo';

  @override
  String get adminLibraryScanConcurrency => 'Biblioteko skanado samtempeco';

  @override
  String get adminParallelImageEncodingLimit => 'Paralela bildo-koda limo';

  @override
  String get adminSlowResponseThreshold => 'Malrapida responda sojlo (ms)';

  @override
  String get adminBrandingLoadFailed => 'Malsukcesis ŝargi markajn agordojn';

  @override
  String get adminLoginDisclaimer => 'Ensalutu malgarantio';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML montrata sub la ensaluta formularo';

  @override
  String get adminCustomCss => 'Propra CSS';

  @override
  String get adminCustomCssHint => 'Propra CSS aplikita al la retinterfaco';

  @override
  String get adminEnableSplashScreen => 'Ebligu plaŭdan ekranon';

  @override
  String get adminStreamingLoadFailed => 'Malsukcesis ŝargi streaming-agordojn';

  @override
  String get adminStreamingDescription =>
      'Agordu tutmondajn fluajn bitrapidajn limojn por foraj konektoj.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Malproksima klienta bitrapida limo (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Lasu malplena aŭ 0 por senlima';

  @override
  String get adminPlaybackLoadFailed =>
      'Malsukcesis ŝargi reproduktajn agordojn';

  @override
  String get adminHardwareAcceleration => 'Akcelado de aparataro';

  @override
  String get adminVaapiDevice => 'VA-API-aparato';

  @override
  String get adminEnableHardwareEncoding => 'Ebligu aparatan kodigon';

  @override
  String get adminEnableHardwareDecoding => 'Ebligu aparatan malkodigon por:';

  @override
  String get adminEncodingThreads => 'Kodi fadenojn';

  @override
  String get adminAutomatic => '0 = aŭtomata';

  @override
  String get adminTranscodingTempPath => 'Transkodiga tempvojo';

  @override
  String get adminEnableFallbackFont => 'Ebligu rezervan tiparon';

  @override
  String get adminFallbackFontPath => 'Retipara vojo';

  @override
  String get adminAllowSegmentDeletion => 'Permesu forigon de segmento';

  @override
  String get adminSegmentKeepSeconds => 'Segmento konservi (sekundoj)';

  @override
  String get adminThrottleBuffering => 'Akcelila bufro';

  @override
  String get adminTrickplayLoadFailed => 'Malsukcesis ŝargi Trickplay-agordojn';

  @override
  String get adminEnableHardwareAcceleration => 'Ebligu aparatan akcelon';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ebligu eltiron de nur ŝlosila kadro';

  @override
  String get adminKeyFrameSubtitle => 'Pli rapida sed pli malalta precizeco';

  @override
  String get adminScanBehavior => 'Skanado konduto';

  @override
  String get adminProcessPriority => 'Proceza prioritato';

  @override
  String get adminImageSettings => 'Bildaj Agordoj';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kiom ofte kapti kadrojn';

  @override
  String get adminWidthResolutions => 'Larĝrezolucioj';

  @override
  String get adminTileWidth => 'Kahelo larĝa';

  @override
  String get adminTileHeight => 'Kahela alteco';

  @override
  String get adminQualitySubtitle =>
      'Pli malaltaj valoroj = pli bona kvalito, pli grandaj dosieroj';

  @override
  String get adminProcessThreads => 'Procezi fadenojn';

  @override
  String get adminResumeLoadFailed => 'Malsukcesis ŝargi rekomencajn agordojn';

  @override
  String get adminResumeDescription =>
      'Agordu kiam enhavo devus esti markita kiel parte ludita aŭ plene ludita.';

  @override
  String get adminMinResumePercentage => 'Minimuma resumprocento';

  @override
  String get adminMinResumeSubtitle =>
      'Enhavo devas esti ludita preter ĉi tiu procento por konservi progreson';

  @override
  String get adminMaxResumePercentage => 'Maksimuma resuma procento';

  @override
  String get adminMaxResumeSubtitle =>
      'Enhavo estas konsiderata plene ludita post ĉi tiu procento';

  @override
  String get adminMinResumeDuration => 'Minimuma vivdaŭro (sekundoj)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Eroj pli mallongaj ol ĉi tio ne estas rekomenceblaj';

  @override
  String get adminMinAudiobookResume => 'Minimuma aŭdlibro-rekomenca procento';

  @override
  String get adminMaxAudiobookResume => 'Maksimuma aŭdlibro-rekomencprocento';

  @override
  String get adminNetworkingLoadFailed =>
      'Malsukcesis ŝargi interretajn agordojn';

  @override
  String get adminNetworkingWarning =>
      'Ŝanĝoj al interkonektaj agordoj eble postulas rekomencon de servilo.';

  @override
  String get adminEnableRemoteAccess => 'Ebligu foran aliron';

  @override
  String get ports => 'Havenoj';

  @override
  String get adminHttpPort => 'HTTP-haveno';

  @override
  String get adminHttpsPort => 'HTTPS-haveno';

  @override
  String get adminPublicHttpsPort => 'Publika HTTPS-haveno';

  @override
  String get adminBaseUrl => 'Baza URL';

  @override
  String get adminBaseUrlHint => 'ekz. /jellyfin';

  @override
  String get https => 'HW Accel';

  @override
  String get adminEnableHttps => 'Ebligu HTTPS';

  @override
  String get adminLocalNetwork => 'Loka Reto';

  @override
  String get adminLocalNetworkAddresses => 'Lokaj retaj adresoj';

  @override
  String get adminKnownProxies => 'Konataj prokuriloj';

  @override
  String get adminRemoteIpFilter => 'Fora IP-Filtrilo';

  @override
  String get adminRemoteIpFilterEntries => 'Fora IP-filtrilo';

  @override
  String get adminCertificatePath => 'Vojo de atestilo';

  @override
  String get whitelist => 'Blanka listo';

  @override
  String get blacklist => 'Nigra listo';

  @override
  String get notSet => 'Ne fiksita';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Malsukcesis ŝargi metadatenojn: $error';
  }

  @override
  String get adminRefreshMetadata => 'Refreŝigi Metadatumojn';

  @override
  String get recursive => 'Rekursiva';

  @override
  String get adminReplaceAllMetadata => 'Anstataŭigi ĉiujn metadatumojn';

  @override
  String get adminMetadataRefreshRequested => 'Refreŝigo de metadatumoj petis';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Malsukcesis refreŝigi metadatenojn: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Neniuj foraj kongruoj trovitaj';

  @override
  String get adminRemoteResults => 'Foraj Rezultoj';

  @override
  String get adminRemoteMetadataApplied => 'Foraj metadatenoj aplikitaj';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Fora serĉo malsukcesis: $error';
  }

  @override
  String get adminUpdateContentType => 'Ĝisdatigu Enhavan Tipon';

  @override
  String get adminContentType => 'Enhavo tipo';

  @override
  String get adminContentTypeUpdated => 'Enhavo-tipo ĝisdatigita';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Malsukcesis ĝisdatigi enhavtipon: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Malsukcesis ŝargi metadatuman redaktilon';

  @override
  String get adminNoPeopleEntries => 'Neniuj enskriboj de homoj';

  @override
  String get adminNoExternalIds => 'Neniuj eksteraj identigiloj haveblaj';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType bildo ĝisdatigita';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Malsukcesis elŝuti bildon: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nesubtenata bildformato';

  @override
  String get adminImageReadFailed => 'Malsukcesis legi elektitan bildon';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType bildo alŝutita';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Malsukcesis alŝuti bildon: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Forigu $imageType bildon';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType bildo forigita';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Malsukcesis forigi bildon: $error';
  }

  @override
  String get adminAllProviders => 'Ĉiuj provizantoj';

  @override
  String get adminNoRemoteImages => 'Neniuj malproksimaj bildoj trovitaj';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Malkovro de agordiloj malsukcesis: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-agordilo';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Dosiero aŭ URL';

  @override
  String get adminTunerIpAddress => 'IP-adreso de la agordilo';

  @override
  String get adminTunerFriendlyName => 'Amika nomo';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limo de samtempaj konektoj';

  @override
  String get adminTunerCountHelp =>
      'La maksimuma nombro da fluoj kiujn la agordilo permesas samtempe. Agordu al 0 por senlima.';

  @override
  String get adminTunerFallbackBitrate => 'Rezerva maksimuma elsenda bitrapido';

  @override
  String get adminTunerImportFavoritesOnly => 'Importi nur ŝatatajn kanalojn';

  @override
  String get adminTunerAllowHwTranscoding => 'Permesi aparataran transkodadon';

  @override
  String get adminTunerAllowFmp4 => 'Permesi fMP4-transkodan ujon';

  @override
  String get adminTunerAllowStreamSharing => 'Permesi fludividon';

  @override
  String get adminTunerEnableStreamLooping => 'Ebligi fluripetadon';

  @override
  String get adminTunerIgnoreDts => 'Ignori DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Legi enigon je la denaska kadrofrekvenco';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Dosiero aŭ URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmoprefikso';

  @override
  String get adminXmltvMovieCategories => 'Filmkategorioj';

  @override
  String get adminXmltvCategoriesHelp =>
      'Apartigu plurajn kategoriojn per vertikala streko.';

  @override
  String get adminXmltvKidsCategories => 'Infankategorioj';

  @override
  String get adminXmltvNewsCategories => 'Novaĵkategorioj';

  @override
  String get adminXmltvSportsCategories => 'Sportkategorioj';

  @override
  String get adminSdUsername => 'Uzantnomo';

  @override
  String get adminSdPassword => 'Pasvorto';

  @override
  String get adminSdCountry => 'Lando';

  @override
  String get adminSdCountrySelect => 'Elektu landon';

  @override
  String get adminSdPostalCode => 'Poŝtkodo';

  @override
  String get adminEnableAllTuners => 'Ebligi ĉiujn agordilojn';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Malsukcesis forigi agordilon: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Malsukcesis forigi provizanton: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Seria registra vojo';

  @override
  String get adminMovieRecordingPath => 'Vojo de filmregistrado';

  @override
  String get adminGuideDaysAuto => 'Aŭtomata';

  @override
  String get adminRecordingPostProcessor => 'Vojo de posttrakta aplikaĵo';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentoj de posttraktilo';

  @override
  String get adminSaveRecordingNfo => 'Konservi NFO-metadatumojn de registrado';

  @override
  String get adminSaveRecordingImages => 'Konservi bildojn de registrado';

  @override
  String get adminLiveTvSectionPaths => 'Registradvojoj';

  @override
  String get adminLiveTvSectionPostProcessing => 'Posttraktado';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Malsukcesis konservi agordojn: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Malsukcesis ŝargi administradon de Live TV';

  @override
  String get adminTunerDevices => 'Agordaj aparatoj';

  @override
  String get adminNoTunerHosts => 'Neniuj agordaj gastigantoj agordis';

  @override
  String get adminGuideProviders => 'Gvidprovizantoj';

  @override
  String get adminGuideRefreshStarted =>
      'Refreŝigo de programdatumoj komenciĝis';

  @override
  String get adminGuideRefreshUnavailable =>
      'Tasko de programrefreŝigo ne estas disponebla sur ĉi tiu servilo.';

  @override
  String get adminNoListingProviders => 'Neniuj listigitaj provizantoj agordis';

  @override
  String get adminSettingsSaved => 'Agordoj konservitaj';

  @override
  String get adminBackupsNotAvailable =>
      'Sekurkopioj ne estas disponeblaj en ĉi tiu servila konstruo.';

  @override
  String get adminRestoreWarning1 =>
      'Restarigo anstataŭigos ĈIUJN nunajn servildatumojn per la rezervaj datumoj.';

  @override
  String get adminRestoreWarning2 =>
      'Nunaj servilaj agordoj, uzantoj kaj bibliotekaj datumoj estos anstataŭitaj.';

  @override
  String get adminRestoreWarning3 => 'La servilo rekomencos post restarigo.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Ĉu restarigi sekurkopion $name nun?';
  }

  @override
  String get adminBackupsTitle => 'Rezervoj';

  @override
  String get adminUnknownDate => 'Nekonata dato';

  @override
  String get adminUnnamedBackup => 'Nenomita Rezervo';

  @override
  String get adminApply => 'Apliki';

  @override
  String get adminLogsTitle => 'Servilaj Registroj';

  @override
  String get adminLogsNewestFirst => 'Plej Nova Unue';

  @override
  String get adminLogsOldestFirst => 'Plej malnova Unue';

  @override
  String get adminLogsJustNow => 'Ĝuste nun';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'antaŭ ${minutes}m';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'antaŭ ${hours}h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d antaŭ';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Malsukcesis ŝargi $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count kongruas';
  }

  @override
  String get adminLogViewerNoMatches => 'Neniuj kongruaj linioj';

  @override
  String get adminMetadataEditorTitle => 'Redaktilo de metadatumoj';

  @override
  String get adminMetadataIdentify => 'Identigi';

  @override
  String get adminMetadataType => 'Tajpu';

  @override
  String get adminMetadataDetails => 'Detaloj';

  @override
  String get adminMetadataExternalIds => 'Eksteraj identigiloj';

  @override
  String get adminMetadataImages => 'Bildoj';

  @override
  String get adminMetadataFieldTitle => 'Titolo';

  @override
  String get adminMetadataFieldSortTitle => 'Ordigi titolon';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originala titolo';

  @override
  String get adminMetadataFieldPremiereDate => 'Premiera dato (JJAA-MM-JJ)';

  @override
  String get adminMetadataFieldEndDate => 'Findato (JJAA-MM-JJ)';

  @override
  String get adminMetadataFieldProductionYear => 'Jaro de produktado';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficiala takso';

  @override
  String get adminMetadataFieldCommunityRating => 'Komunuma takso';

  @override
  String get adminMetadataFieldCriticRating => 'Kritika takso';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Slogano';

  @override
  String get adminMetadataFieldOverview => 'Superrigardo';

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
  String get adminMetadataGenres => 'Ĝenroj';

  @override
  String get adminMetadataTags => 'Etikedoj';

  @override
  String get adminMetadataStudios => 'Studioj';

  @override
  String get adminMetadataPeople => 'Homoj';

  @override
  String get adminMetadataAddGenre => 'Aldonu ĝenron';

  @override
  String get adminMetadataAddTag => 'Aldonu etikedon';

  @override
  String get adminMetadataAddStudio => 'Aldonu studion';

  @override
  String get adminMetadataAddPerson => 'Aldoni Personon';

  @override
  String get adminMetadataEditPerson => 'Redakti Person';

  @override
  String get adminMetadataRole => 'Rolo';

  @override
  String get adminMetadataImagePrimary => 'Primara';

  @override
  String get adminMetadataImageBackdrop => 'Fono';

  @override
  String get adminMetadataImageLogo => 'Emblemo';

  @override
  String get adminMetadataImageBanner => 'Standardo';

  @override
  String get adminMetadataImageThumb => 'Dikfingro';

  @override
  String get adminMetadataProvider => 'Provizanto';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType bildo ĝisdatigita';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType bildo alŝutita';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType bildo forigita';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Malsukcesis elŝuti bildon: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Malsukcesis legi elektitan bildon';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Malsukcesis alŝuti bildon: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Forigu $imageType bildon';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ĉi tio forigas la nunan bildon de la ero.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Malsukcesis forigi bildon: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Elektu $imageType bildon';
  }

  @override
  String get adminMetadataUpload => 'Alŝutu';

  @override
  String get adminMetadataUpdate => 'Ĝisdatigo';

  @override
  String get adminMetadataRemoteImage => 'Fora bildo';

  @override
  String get adminPluginsInstalled => 'Instalita';

  @override
  String get adminPluginsCatalog => 'Katalogo';

  @override
  String get adminPluginsActive => 'Aktiva';

  @override
  String get adminPluginsRestart => 'Rekomencu';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Neniuj kromprogramoj kongruas kun via serĉo';

  @override
  String get adminPluginsNoneInstalled => 'Neniuj kromprogramoj instalitaj';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Disponebla ĝisdatigo: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Ĝisdatigo disponebla';

  @override
  String get adminPluginsPendingRemoval => 'Atendante forigon post rekomenco';

  @override
  String get adminPluginsChangesPending => 'Ŝanĝoj atendante rekomencon';

  @override
  String get adminPluginsEnable => 'Ebligu';

  @override
  String get adminPluginsDisable => 'Malebligu';

  @override
  String get adminPluginsInstallUpdate => 'Instalu ĝisdatigon';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instali ĝisdatigon (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Neniuj pakoj kongruas kun via serĉo';

  @override
  String get adminPluginsCatalogEmpty => 'Neniuj pakoj haveblaj';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" estas instalita...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimenta Integriĝo';

  @override
  String get adminPluginDetailExperimentalContent =>
      'La integriĝo de kromprogramoj ankoraŭ estas eksperimenta. Iuj kampoj aŭ aranĝoj eble ankoraŭ ne korekte bildigas.';

  @override
  String get adminPluginDetailToggle404 =>
      'Malsukcesis ŝanĝi aldonaĵon. La servilo ne povis trovi ĉi tiun kromprogramon. Provu refreŝigi kromaĵojn, poste reprovu.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Malsukcesis ŝanĝi aldonaĵon. Bonvolu kontroli servilojn por detaloj.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Agordoj';
  }

  @override
  String get adminPluginDetailDetails => 'Detaloj';

  @override
  String get adminPluginDetailDeveloper => 'Ellaboranto';

  @override
  String get adminPluginDetailRepository => 'Deponejo';

  @override
  String get adminPluginDetailBundled => 'Pakigita';

  @override
  String get adminPluginDetailEnablePlugin => 'Ebligu Kromprogramon';

  @override
  String get adminPluginDetailRestartRequired =>
      'Rekomenco de servilo estas necesa por ke ŝanĝoj efektiviĝu.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ĉi tiu kromaĵo estos forigita post rekomenco de la servilo.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ĉi tiu kromaĵo misfunkciis kaj eble ne funkcias ĝuste.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ĉi tiu kromaĵo ne estas subtenata de la nuna servila versio.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ĉi tiu kromaĵo estis anstataŭita de pli nova versio.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Malsukcesis ŝargi deponejojn: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Forigi Deponejon';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ĉu vi certas, ke vi volas forigi \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Forigi';

  @override
  String adminReposSaveFailed(String error) {
    return 'Malsukcesis konservi deponejojn: $error';
  }

  @override
  String get adminReposEmpty => 'Neniuj deponejoj agordis';

  @override
  String get adminReposEmptySubtitle =>
      'Aldonu deponejon por foliumi disponeblajn kromaĵojn';

  @override
  String get adminReposUnnamed => '(nenomita)';

  @override
  String get adminReposEditTitle => 'Redakti Deponejon';

  @override
  String get adminReposAddTitle => 'Aldonu Deponejon';

  @override
  String get adminReposUrl => 'Deponejo URL';

  @override
  String get adminReposNameHint => 'ekz. Jellyfin Stalo';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nevalida URL';

  @override
  String get adminGeneralSettingsTitle => 'Ĝeneralaj Agordoj';

  @override
  String get adminGeneralMetadataLanguage => 'Preferata metadatuma lingvo';

  @override
  String get adminGeneralMetadataLanguageHint => 'ekz. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferata metadatuma lando';

  @override
  String get adminGeneralMetadataCountryHint => 'ekz. Usono, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Biblioteko skanado samtempeco';

  @override
  String get adminGeneralImageEncodingLimit => 'Paralela bildo-koda limo';

  @override
  String get adminUnknownError => 'Nekonata eraro';

  @override
  String get adminBrowse => 'Foliumi';

  @override
  String get adminCloseBrowser => 'Fermu retumilon';

  @override
  String get adminNetworkingTitle => 'Retoj';

  @override
  String get adminNetworkingRestartWarning =>
      'Ŝanĝoj al interkonektaj agordoj eble postulas rekomencon de servilo.';

  @override
  String get adminNetworkingEnableHttps => 'Ebligu HTTPS';

  @override
  String get adminNetworkingAddressHint => 'ekz. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Konataj prokuriloj';

  @override
  String get adminNetworkingProxyHint => 'ekz. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Blanka listo';

  @override
  String get adminNetworkingBlacklist => 'Nigra listo';

  @override
  String get adminNetworkingAddEntry => 'Aldonu eniron';

  @override
  String get adminBrandingTitle => 'Markado';

  @override
  String get adminBrandingLoginDisclaimer => 'Ensalutu malgarantio';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML montrata sub la ensaluta formularo';

  @override
  String get adminBrandingCustomCss => 'Propra CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Propra CSS aplikita al la retinterfaco';

  @override
  String get adminBrandingEnableSplash => 'Ebligu plaŭdan ekranon';

  @override
  String get adminBrandingSplashUpload => 'Alŝuti bildon';

  @override
  String get adminBrandingSplashUploaded => 'Ekranŝprucaĵo ĝisdatigita';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Malsukcesis alŝuti ekranŝprucaĵon';

  @override
  String get adminBrandingSplashDeleted => 'Ekranŝprucaĵo forigita';

  @override
  String get adminBrandingNoSplash => 'Neniu propra ekranŝprucaĵo';

  @override
  String get adminPlaybackHwAccel => 'Aparataro Akcelo';

  @override
  String get adminPlaybackHwAccelLabel => 'Akcelado de aparataro';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ebligu aparatan kodigon';

  @override
  String get adminPlaybackQsvDevice => 'QSV-aparato';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Ebligi plibonigitan NVDEC-dekodilon';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferi la denaskan aparataran dekodilon de la sistemo';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bita HEVC-dekodado';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bita VP9-dekodado';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bita dekodado';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bita dekodado';

  @override
  String get adminPlaybackHwEncodingSection => 'Aparatara kodado';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permesi HEVC-kodadon';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permesi AV1-kodadon';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Ebligi Intel malaltenergian H.264-kodilon';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Ebligi Intel malaltenergian HEVC-kodilon';

  @override
  String get adminPlaybackToneMapping => 'Tonmapado';

  @override
  String get adminPlaybackEnableTonemapping => 'Ebligi tonmapadon';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Ebligi VPP-tonmapadon';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Ebligi VideoToolbox-tonmapadon';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritmo de tonmapado';

  @override
  String get adminPlaybackTonemappingMode => 'Reĝimo de tonmapado';

  @override
  String get adminPlaybackTonemappingRange => 'Amplekso de tonmapado';

  @override
  String get adminPlaybackTonemappingDesat => 'Malsaturigo de tonmapado';

  @override
  String get adminPlaybackTonemappingPeak => 'Pinto de tonmapado';

  @override
  String get adminPlaybackTonemappingParam => 'Parametro de tonmapado';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'Heleco de VPP-tonmapado';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrasto de VPP-tonmapado';

  @override
  String get adminPlaybackEncoderPreset => 'Antaŭagordo de kodilo';

  @override
  String get adminPlaybackH264Crf => 'H.264-koda CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC)-koda CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metodo de malenteksado';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Duobligi la kadrofrekvencon dum malenteksado';

  @override
  String get adminPlaybackAudioSection => 'Aŭdio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ebligi aŭdian VBR-kodadon';

  @override
  String get adminPlaybackDownmixBoost => 'Plifortigo de aŭdia downmix';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Algoritmo de stereofonia downmix';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Maksimuma grandeco de miksvico';

  @override
  String get adminPlaybackAutoOption => 'Aŭtomata';

  @override
  String get adminPlaybackEncoding => 'Kodigado';

  @override
  String get adminPlaybackEncodingThreads => 'Kodi fadenojn';

  @override
  String get adminPlaybackFallbackFont => 'Ebligu rezervan tiparon';

  @override
  String get adminPlaybackFallbackFontPath => 'Retipara vojo';

  @override
  String get adminPlaybackStreaming => 'Elsendfluado';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Aŭdlibroj';

  @override
  String get adminStreamingBitrateLimit =>
      'Malproksima klienta bitrapida limo (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Lasu malplena aŭ 0 por senlima';

  @override
  String get adminTrickplayHwAccel => 'Ebligu aparatan akcelon';

  @override
  String get adminTrickplayHwEncoding => 'Ebligu aparatan kodigon';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ebligu eltiron de nur ŝlosila kadro';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Pli rapida sed pli malalta precizeco';

  @override
  String get adminTrickplayNonBlocking => 'Ne-Blokado';

  @override
  String get adminTrickplayBlocking => 'Blokado';

  @override
  String get adminTrickplayPriorityHigh => 'Alta';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Super Normala';

  @override
  String get adminTrickplayPriorityNormal => 'Normala';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Sub Normala';

  @override
  String get adminTrickplayPriorityIdle => 'Senlabore';

  @override
  String get adminTrickplayImageSettings => 'Bildaj Agordoj';

  @override
  String get adminTrickplayInterval => 'Intervalo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Kiom ofte kapti kadrojn';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Komo-separataj pikselaj larĝoj (ekz. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalito';

  @override
  String get adminTrickplayQScale => 'Kvalita skalo';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Pli malaltaj valoroj = pli bona kvalito, pli grandaj dosieroj';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-kvalito';

  @override
  String get adminTrickplayProcessing => 'Prilaborado';

  @override
  String get adminTasksEmpty => 'Neniuj planitaj taskoj trovitaj';

  @override
  String get adminTasksNoFilterMatch =>
      'Neniuj taskoj kongruas kun la nuna filtrilo';

  @override
  String get adminTaskCancelling => 'Nuligo...';

  @override
  String get adminTaskRunning => 'Kurante...';

  @override
  String get adminTaskNeverRun => 'Neniam kuru';

  @override
  String get adminTaskStop => 'Haltigi';

  @override
  String get adminRunningTasks => 'Aktivaj taskoj';

  @override
  String get adminTaskRun => 'Kuru';

  @override
  String get adminTaskDetailLastExecution => 'Lasta Ekzekuto';

  @override
  String get adminTaskDetailStarted => 'Komencis';

  @override
  String get adminTaskDetailEnded => 'Finiĝis';

  @override
  String get adminTaskDetailDuration => 'Daŭro';

  @override
  String get adminTaskDetailErrorLabel => 'Eraro:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Ĉiutage ĉe $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Ĉiu $day ĉe $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Dum aplikaĵo ekfunkciigas';

  @override
  String get adminTaskTriggerTypeDaily => 'Ĉiutage';

  @override
  String get adminTaskTriggerTypeWeekly => 'Ĉiusemajne';

  @override
  String get adminTaskTriggerTypeInterval => 'Je intervalo';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalo';

  @override
  String get adminTaskTriggerEveryHour => 'Ĉiuhore';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count horoj',
      one: '1 horo',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tempo';

  @override
  String get adminActivityJustNow => 'Ĝuste nun';

  @override
  String get adminActivityLastHour => 'Lasta horo';

  @override
  String get adminActivityToday => 'Hodiaŭ';

  @override
  String get adminActivityYesterday => 'Hieraŭ';

  @override
  String get adminActivityOlder => 'Pli maljuna';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d antaŭ';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'antaŭ ${hours}h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'antaŭ ${minutes}m';
  }

  @override
  String get adminActivityNow => 'nun';

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
    return '${days}t';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Agordu trickplay bildgeneracion por serĉi antaŭrigardajn bildetojn.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Publika HTTPS-haveno';

  @override
  String get adminNetworkingBaseUrl => 'Baza URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ekz. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Publika HTTP-pordo';

  @override
  String get adminNetworkingRequireHttps => 'Postuli HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Alidirekti ĉiujn forajn petojn al HTTPS. Havas neniun efikon se la servilo ne havas validan atestilon.';

  @override
  String get adminNetworkingCertPassword => 'Pasvorto de atestilo';

  @override
  String get adminNetworkingEnableIpv4 => 'Ebligi IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Ebligi IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-retoj';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Fora IP-filtrilo';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API-aparato';

  @override
  String get adminPlaybackAutomatic => '0 = aŭtomata';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkodiga tempvojo';

  @override
  String get adminPlaybackSegmentDeletion => 'Permesu forigon de segmento';

  @override
  String get adminPlaybackSegmentKeep => 'Segmento konservi (sekundoj)';

  @override
  String get adminPlaybackThrottleBuffering => 'Akcelila bufro';

  @override
  String get adminPlaybackThrottleDelay => 'Bremsa prokrasto (sekundoj)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permesi ekstraktadon de subtekstoj dum ludado';

  @override
  String get adminResumeMinPct => 'Minimuma resumprocento';

  @override
  String get adminResumeMinPctSubtitle =>
      'Enhavo devas esti ludita preter ĉi tiu procento por konservi progreson';

  @override
  String get adminResumeMaxPct => 'Maksimuma resuma procento';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Enhavo estas konsiderata plene ludita post ĉi tiu procento';

  @override
  String get adminResumeMinDuration => 'Minimuma vivdaŭro (sekundoj)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Eroj pli mallongaj ol ĉi tio ne estas rekomenceblaj';

  @override
  String get adminTrickplayScanBehavior => 'Skanado konduto';

  @override
  String get adminTrickplayProcessPriority => 'Proceza prioritato';

  @override
  String get adminTrickplayTileWidth => 'Kahelo larĝa';

  @override
  String get adminTrickplayTileHeight => 'Kahela alteco';

  @override
  String get adminTrickplayProcessThreads => 'Procezi fadenojn';

  @override
  String get adminTrickplayWidthResolutions => 'Larĝrezolucioj';

  @override
  String get adminMetadataDefault => 'Defaŭlte';

  @override
  String get adminMetadataContentTypeUpdated => 'Enhavo-tipo ĝisdatigita';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Malsukcesis ĝisdatigi enhavtipon: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Malrapida responda sojlo (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Ebligi avertojn pri malrapida respondo';

  @override
  String get adminGeneralQuickConnect => 'Ebligi Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Servilo';

  @override
  String get adminGeneralSectionMetadata => 'Metadatumoj';

  @override
  String get adminGeneralSectionPaths => 'Vojoj';

  @override
  String get adminGeneralSectionPerformance => 'Rendimento';

  @override
  String get adminGeneralCachePath => 'Cache vojo';

  @override
  String get adminGeneralMetadataPath => 'Metadatuma vojo';

  @override
  String get adminGeneralServerName => 'Servilonomo';

  @override
  String get adminGeneralDisplayLanguage => 'Preferata montrolingvo';

  @override
  String get adminSettingsLoadFailed => 'Malsukcesis ŝargi agordojn';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Malsukcesis ĝisdatigi mapadojn: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tempolimo: $duration';
  }

  @override
  String get folders => 'Dosierujoj';

  @override
  String get libraries => 'Bibliotekoj';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay malŝaltita';

  @override
  String get syncPlayDisabledMessage =>
      'Ebligu SyncPlay en Agordoj por uzi sinkronigitan reproduktadon.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servilo nesubtenata';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay postulas Jellyfin-servilon. La nuna servilo ne subtenas ĝin.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grupo';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grupo';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# partoprenantoj',
      one: '# partoprenanto',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignoru atendu';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ne teni la grupon dum ĉi tiu aparato bufras';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Daŭrigu loke sen atendi malrapidajn membrojn';

  @override
  String get syncPlayRepeat => 'Ripeti';

  @override
  String get syncPlayRepeatOne => 'Unu';

  @override
  String get syncPlayShuffleModeShuffled => 'Miksita';

  @override
  String get syncPlayShuffleModeSorted => 'Ordigita';

  @override
  String get syncPlaySyncCurrentQueue => 'Sinkronigi nunan reproduktan vicon';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Anstataŭigu la grupvicon kun tio, kio ludas loke';

  @override
  String get syncPlayLeaveGroup => 'Forlasu grupon';

  @override
  String get syncPlayGroupQueue => 'Grupo vico';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Ero $index';
  }

  @override
  String get syncPlayPlayNow => 'Ludu nun';

  @override
  String get syncPlayCreateNewGroup => 'Kreu novan grupon';

  @override
  String get syncPlayGroupName => 'Grupnomo';

  @override
  String get syncPlayDefaultGroupName => 'Mia SyncPlay Grupo';

  @override
  String get syncPlayCreateGroup => 'Krei grupon';

  @override
  String get syncPlayAvailableGroups => 'Disponeblaj grupoj';

  @override
  String get syncPlayNoGroupsAvailable => 'Neniuj grupoj disponeblaj';

  @override
  String get syncPlayJoinGroupQuestion => 'Ĉu aliĝi al SyncPlay-grupo?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Aliĝi al SyncPlay-grupo povas anstataŭigi vian nunan reproduktan vicon. Ĉu daŭrigi?';

  @override
  String get syncPlayJoin => 'Aliĝu';

  @override
  String get syncPlayStateIdle => 'Senlabore';

  @override
  String get syncPlayStateWaiting => 'Atendante';

  @override
  String get syncPlayStatePaused => 'Paŭzita';

  @override
  String get syncPlayStatePlaying => 'Ludante';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName aliĝis al SyncPlay grupo';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName forlasis SyncPlay grupon';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-aliro malakceptita';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Vi ne havas aliron al unu aŭ pluraj eroj en ĉi tiu SyncPlay-grupo. Petu al la grupposedanto kontroli bibliotekajn permesojn aŭ elekti alian vicon.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinkronigante reproduktadon al $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Voĉa serĉo ne disponeblas.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Rekta Ludado Malsukcesis';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Rekta ludado ne ekis por ĉi tiu fluo de Dolby Vision. Ĉu reprovi uzi servilan transkodon?';

  @override
  String get retryWithTranscode => 'Reprovu per transkodo';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Ne Subtenata';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ĉi tiu aparato ne povas senpere malkodi enhavon de Dolby Vision. Uzu HDR10-riparon aŭ petu servilan transkodigon.';

  @override
  String get rememberMyChoice => 'Memoru mian elekton';

  @override
  String get playHdr10Fallback => 'Ludu HDR10-riparon';

  @override
  String get requestTranscode => 'Petu transkodon';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# vicoj malkovritaj',
      one: '# vico malkovrita',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Vidu Ĉion';

  @override
  String get noItems => 'Neniuj eroj';

  @override
  String get switchUser => 'Ŝanĝi Uzanton';

  @override
  String get remoteControl => 'Teleregilo';

  @override
  String get mediaBarLoading => 'Ŝarĝante amaskomunikila trinkejo...';

  @override
  String get mediaBarError => 'Media trinkejo malsukcesis ŝargi';

  @override
  String get offlineServerUnavailable =>
      'Konektita al la interreto, sed la nuna servilo ne disponeblas.';

  @override
  String get offlineNoInternet =>
      'Vi estas eksterrete. Nur elŝutita enhavo disponeblas.';

  @override
  String get offlineFileNotAvailable => 'Dosiero ne havebla';

  @override
  String get offlineSwitchServer => 'Ŝanĝi Servilon';

  @override
  String get offlineSavedMedia => 'Savita Amaskomunikilaro';

  @override
  String get offlineBannerTitle => 'Vi estas eksterrete';

  @override
  String get offlineBannerSubtitle => 'Montrante viajn elŝutojn';

  @override
  String get serverUnreachableBannerTitle => 'Ne eblas atingi vian servilon';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Ludante el elŝutoj ĝis ĝi revenos';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fora Reproduktado';

  @override
  String castControlFailed(String error) {
    return 'Giskontrolo malsukcesis: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Kontroloj';
  }

  @override
  String get castDeviceVolume => 'Aparato Volumo';

  @override
  String get castVolumeUnavailable => 'Nedisponebla';

  @override
  String castStopKind(String kind) {
    return 'Ĉesu $kind';
  }

  @override
  String get audioLabel => 'Aŭdio';

  @override
  String get subtitlesLabel => 'Subtekstoj';

  @override
  String get pinConfirmTitle => 'Konfirmu PIN';

  @override
  String get pinSetTitle => 'Agordu PIN';

  @override
  String get pinEnterTitle => 'Enigu PIN';

  @override
  String get pinReenterToConfirm => 'Reenigu vian PIN por konfirmi';

  @override
  String pinEnterNDigit(int length) {
    return 'Enigu $length-ciferan PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enigu vian $length-ciferan PIN';
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
  String get pinIncorrect => 'Malĝusta PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-oj ne kongruas';

  @override
  String get pinForgot => 'Ĉu vi forgesis PIN?';

  @override
  String get pinClear => 'Vakigi';

  @override
  String get pinBackspace => 'Retropaŝo';

  @override
  String get quickConnectAuthorized => 'Peto de Quick Connect rajtigita.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kodo de Quick Connect estas nevalida aŭ eksvalidiĝinta.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect ne estas subtenata sur ĉi tiu servilo.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Malsukcesis rajtigi Quick Connect-kodon.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect estas malŝaltita sur ĉi tiu servilo.';

  @override
  String get quickConnectForbidden =>
      'Via konto ne povas rajtigi ĉi tiun peton de Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Kodo de Quick Connect ne estis trovita. Provu novan kodon.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect malsukcesis: $message';
  }

  @override
  String get quickConnectEnterCode => 'Enigu kodon';

  @override
  String get quickConnectAuthorize => 'Rajtigi';

  @override
  String remoteCommandFailed(String error) {
    return 'Komando malsukcesis: $error';
  }

  @override
  String get remoteControlTitle => 'Teleregilo';

  @override
  String get remoteFailedToLoadSessions => 'Malsukcesis ŝargi kunsidojn';

  @override
  String get remoteNoSessions => 'Neniuj kontroleblaj kunsidoj';

  @override
  String get remoteStartPlayback => 'Komencu reproduktadon sur alia aparato';

  @override
  String get unknownUser => 'Nekonata';

  @override
  String get unknownItem => 'Nekonata';

  @override
  String get remoteNothingPlaying => 'Nenio ludas en ĉi tiu sesio';

  @override
  String get castingStarted => 'Ĵetado komenciĝis sur elektita aparato';

  @override
  String castingFailed(String error) {
    return 'Malsukcesis komenci gisi: $error';
  }

  @override
  String get noRemoteDevices => 'Neniuj foraj reproduktaj aparatoj haveblaj.';

  @override
  String get noRemoteDevicesIos =>
      'Neniuj foraj reproduktaj aparatoj haveblaj.\n\nEn iOS, AirPlay-celoj povas esti neatingeblaj en la simulilo.';

  @override
  String get trackActionPlayNext => 'Ludu Poste';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Aldoni al Vico';

  @override
  String get trackActionAddToPlaylist => 'Aldoni al Ludlisto';

  @override
  String get trackActionCancelDownload => 'Nuligi Elŝuton';

  @override
  String get trackActionDeleteFromPlaylist => 'Forigi el Ludlisto';

  @override
  String get trackActionMoveUp => 'Movu Supren';

  @override
  String get trackActionMoveDown => 'Movu Malsupren';

  @override
  String get trackActionRemoveFromFavorites => 'Forigi el Favoritoj';

  @override
  String get trackActionAddToFavorites => 'Aldoni al Favoritoj';

  @override
  String get trackActionGoToAlbum => 'Iru al Albumo';

  @override
  String get trackActionGoToArtist => 'Iru al Artisto';

  @override
  String trackActionDownloading(String name) {
    return 'Elŝutante $name...';
  }

  @override
  String get trackActionDeletedFile => 'Forigita elŝutita dosiero';

  @override
  String get trackActionDeleteFileFailed =>
      'Ne eblis forigi elŝutitan dosieron';

  @override
  String get shuffleBy => 'Miksi Per';

  @override
  String get shuffleSelectLibrary => 'Elektu Bibliotekon';

  @override
  String get shuffleSelectGenre => 'Elektu Ĝenron';

  @override
  String get shuffleLibrary => 'Biblioteko';

  @override
  String get shuffleGenre => 'Ĝenro';

  @override
  String get shuffleNoLibraries => 'Neniuj kongruaj bibliotekoj haveblaj.';

  @override
  String get shuffleNoGenres =>
      'Neniuj ĝenroj trovitaj por ĉi tiu miksa reĝimo.';

  @override
  String get posterDisplayTitle => 'Montru';

  @override
  String get posterImageType => 'Bilda Tipo';

  @override
  String get imageTypePoster => 'Afiŝo';

  @override
  String get imageTypeThumbnail => 'Bildeto';

  @override
  String get imageTypeBanner => 'Standardo';

  @override
  String get playlistAddFailed => 'Malsukcesis aldoni al ludlisto';

  @override
  String get playlistCreateFailed => 'Malsukcesis krei ludliston';

  @override
  String get playlistNew => 'Nova Ludlisto';

  @override
  String get playlistCreate => 'Krei';

  @override
  String get playlistCreateNew => 'Krei Novan Ludliston';

  @override
  String get playlistNoneFound => 'Neniuj ludlistoj trovitaj';

  @override
  String get addToPlaylist => 'Aldoni al Ludlisto';

  @override
  String get lyricsNotAvailable => 'Neniu kantoteksto haveblaj';

  @override
  String get upNext => 'Sekva';

  @override
  String get playNext => 'Ludu Poste';

  @override
  String get stillWatchingContent =>
      'La reprodukto estas paŭzita. Ĉu vi ankoraŭ rigardas?';

  @override
  String get stillWatchingStop => 'Haltigi';

  @override
  String get stillWatchingContinue => 'Daŭrigu';

  @override
  String skipSegment(String segment) {
    return 'Preterpasi $segment';
  }

  @override
  String get liveTv => 'Viva televido';

  @override
  String get continueWatchingAndNextUp => 'Daŭrigu Rigardi kaj Poste';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Elŝutante $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Elŝutante $fileName';
  }

  @override
  String get nextEpisode => 'Sekva Epizodo';

  @override
  String get moreFromThisSeason => 'Pli De Ĉi tiu Sezono';

  @override
  String get playerTooltipPlaybackSpeed => 'Rapido de reprodukto';

  @override
  String get playerTooltipCastControls => 'Rolitaj kontroloj';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrapido';

  @override
  String get playerTooltipEnterFullscreen => 'Enigu plenan ekranon';

  @override
  String get playerTooltipExitFullscreen => 'Eliru plenekranan';

  @override
  String get playerTooltipFloatOnTop => 'Flosu supre';

  @override
  String get playerTooltipExitFloatOnTop => 'Malebligu flosilon supre';

  @override
  String get playerTooltipLockLandscape => 'Ŝlosu pejzaĝon';

  @override
  String get playerTooltipUnlockOrientation => 'Permesu rotacion';

  @override
  String get playerTooltipPrevious => 'Antaŭa';

  @override
  String get playerTooltipSeekBack => 'Serĉu reen';

  @override
  String get playerTooltipSeekForward => 'Serĉu antaŭen';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Marki kiel Rigardita';

  @override
  String get contextMenuMarkUnwatched => 'Marki kiel Nerigardita';

  @override
  String get contextMenuAddToFavorites => 'Aldoni al Favoritoj';

  @override
  String get contextMenuRemoveFromFavorites => 'Forigi el Favoritoj';

  @override
  String get contextMenuGoToSeries => 'Iru al Serio';

  @override
  String get contextMenuHideFromContinueWatching => 'Kaŝi el Daŭre Rigardi';

  @override
  String get contextMenuHideFromNextUp => 'Kaŝi el Sekva';

  @override
  String get contextMenuAddToCollection => 'Aldoni al kolekto';

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
      'Aliru la servilan administradan panelon';

  @override
  String get settingsDynamicContent => 'Dinamika Enhavo';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Trinkejo kaj vidaj supermetaĵoj';

  @override
  String get settingsAboutSubtitle => 'App-versio, juraj informoj kaj kreditoj';

  @override
  String get settingsSortServersBy => 'Ordigi Servilojn Laŭ';

  @override
  String get settingsLastUsed => 'Laste Uzita';

  @override
  String get settingsAlphabetical => 'Alfabeta';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permesi memsubskribitajn atestilojn';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Fidi servilojn uzantajn memsubskribitajn aŭ privat-CA TLS-atestilojn. Ebligu nur por serviloj kiujn vi regas. Ĉi tio malŝaltas atestilvalidigon por ĉiuj konektoj.';

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
  String get settingsHomePage => 'Hejmpaĝo';

  @override
  String get settingsTwentyFourHourClock => '24-Hora Horloĝo';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Uzu 24-horan formatadon kie ajn la horloĝo montriĝas';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Montru la miksbutonon en la navigadbreto';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Montru la ĝenrojn-butonon en la navigadbreto';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Montru la plej ŝatatajn butonon en la navigadbreto';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Montru la butonon de bibliotekoj en la navigadbreto';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Montri la butonon de Seerr en la navigbreto';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Ĉiam montri tekstajn etikedojn en la supra navigbreto';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Ŝaltu hejmpaĝan videblecon per biblioteko. Rekomencu Moonfin por ke ŝanĝoj efektiviĝu.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Media Trinkejo & Lokaj Antaŭrigardoj';

  @override
  String get settingsVisualOverlays => 'Vidaj Supermetaĵoj';

  @override
  String get settingsSeasonalSurprise => 'Sezona Surprizo';

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
  String get settingsHigh => 'Alta';

  @override
  String get settingsLow => 'Malalta';

  @override
  String get settingsCustomPath => 'Propra Vojo';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Enigu la vojon de elŝuta dosierujo';

  @override
  String get settingsConcurrentDownloads => 'Samtempaj Elŝutoj';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimuma nombro da eroj por elŝuti samtempe.';

  @override
  String get settingsAppInfo => 'INFORMOJ DE APLIKAĴO';

  @override
  String get settingsReportAnIssue => 'Raportu Problemon';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Malfermu la temo-spurilon en GitHub';

  @override
  String get settingsJoinDiscord => 'Aliĝu al Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Babilu kun la komunumo';

  @override
  String get settingsJoinTheDiscord => 'Aliĝu al la Discord';

  @override
  String get settingsSupportMoonfin => 'Subtenu Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Donacu kafon al la programisto';

  @override
  String get settingsLegal => 'LEGALE';

  @override
  String get settingsLicenses => 'Licencoj';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Malfermfontaj licencaj avizoj';

  @override
  String get settingsPrivacyPolicy => 'Privateca Politiko';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kiel Moonfin pritraktas viajn datumojn';

  @override
  String get settingsCheckForUpdates => 'Kontrolu ĝisdatigojn';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kontrolu la plej novan eldonon de Moonfin';

  @override
  String get settingsBoth => 'Ambaŭ';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Miksi Enhavan Tipon Filtrilon';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Sondaj spuroj, prilaborado kaj trapasaj elektoj';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Aŭtomatigita reproduktado kaj sinsekvo';

  @override
  String get settingsSyncplaySubtitle =>
      'Sinkroniga logiko por grupaj kunsidoj';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ĉu preterpasi enkondukojn kaj aliajn?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Antaŭnombrado de aŭdvida segmento';

  @override
  String get settingsProgressBar => 'Progresbreto';

  @override
  String get settingsTimer => 'Tempigilo';

  @override
  String get settingsNone => 'Neniu';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Prompta Uzanto';

  @override
  String get settingsSkip => 'Saltu';

  @override
  String get settingsDoNothing => 'Faru Nenion';

  @override
  String get settingsMaxBitrateDescription =>
      'Limitu la fluan bitrapidecon. Enhavo super ĉi tiu sojlo estos transkodita por konveni.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limigu la maksimuman rezolucion, kiun la ludanto petos. Pli alta rezolucia enhavo estos transkodita malsupren.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kiel video devus esti skalita por konveni la ekranon.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Ludmotoro (Androida televido)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Elektu la defaŭltan reproduktan motoron ĉe Android TV-aparatoj. Ŝanĝoj validas por la sekva reprodukta sesio.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (rekomendita)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (heredaĵo)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Refalo';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Konduto por Dolby Vision-titoloj sur aparatoj sen Dolby Vision-malkodado.';

  @override
  String get settingsAskEachTime => 'Demandu ĉiufoje';

  @override
  String get settingsPreferHdr10Fallback => 'Preferu HDR10-riparon';

  @override
  String get settingsPreferServerTranscode => 'Preferas servilon transkodi';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Rekta Ludado';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kontrolas ĉu Dolby Vision-profilo 7 plibonig-tavolaj fluoj devus direkti ludadon.';

  @override
  String get settingsAutoAftkrtEnabled => 'Aŭtomata (AFTKRT ebligita)';

  @override
  String get settingsEnabledOnThisDevice => 'Ebligita sur ĉi tiu aparato';

  @override
  String get settingsDisabledPreferTranscode =>
      'Malŝaltita (preferas transkodon)';

  @override
  String get settingsResumeRewindDescription =>
      'Kiam oni rekomencas la reproduktadon (de Daŭrigi Rigardadon aŭ paĝon pri amaskomunikilaro), kiom da sekundoj estu rebobenitaj?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kiam oni rekomencas la reproduktadon post premado de la paŭzobutono, kiom da sekundoj estu rebobenitaj?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Kiom da sekundoj por salti reen post premado de la rebobenbutono.';

  @override
  String get settingsOneSecond => '1 sekundo';

  @override
  String get settingsThreeSeconds => '3 sekundoj';

  @override
  String get settingsFortyFiveSeconds => '45 sekundoj';

  @override
  String get settingsSixtySeconds => '60 sekundoj';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Kiom da sekundoj salti antaŭen post premado de la rapida antaŭen-butono.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 al ekstera malĉifrilo';

  @override
  String get settingsCinemaMode => 'Kina Reĝimo';

  @override
  String get settingsCinemaModeSubtitle =>
      'Ludu antaŭfilmojn/antaŭrulojn antaŭ ĉefa funkcio';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Plilongigita montras plenan karton kun epizoda arto kaj priskribo. Minimumo montras kompaktan retronombradon. Malŝaltita tute kaŝas la promptilon.';

  @override
  String get settingsShort => 'Mallonga';

  @override
  String get settingsLong => 'Longe';

  @override
  String get settingsVeryLong => 'Tre Longa';

  @override
  String get settingsVideoStartDelay => 'Video Komenco Prokrasto';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Viva Televido Rekta';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ebligu rektan ludadon por Live TV';

  @override
  String get settingsOpenGroups => 'Malfermu Grupojn';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Kreu, aliĝu aŭ administru grupojn de SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Ebligita';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Ebligu funkciojn por gruprigardado';

  @override
  String get settingsSyncplayButton => 'SyncPlay Butono';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Montru la butonon SyncPlay sur la navigadbreto';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Altnivela Korekto';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ebligu fajnan sinkronigan logikon';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinkronigi Korekton';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Aŭtomate ĝustigu reproduktadon por resti sinkronigita';

  @override
  String get settingsSyncplaySpeedToSync => 'Rapido por Sinkronigi';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Uzu reproduktadrapidecon por sinkronigi';

  @override
  String get settingsSyncplaySkipToSync => 'Saltu al Sinkronigi';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Uzu serĉadon por sinkronigi';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimuma Rapida Prokrasto';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimuma Rapida Prokrasto';

  @override
  String get settingsSyncplaySpeedDuration => 'Rapida Daŭro';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimuma Skip Prokrasto';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ekstra Offset';

  @override
  String get onNow => 'Sur Nun';

  @override
  String get collections => 'Kolektoj';

  @override
  String get lastPlayed => 'Laste Ludita';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Plej nova $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Lastatempe eldonita $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Aŭtomate Ludo Sekva Epizodo';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Aŭtomate ludu la sekvan epizodon kiam disponebla.';

  @override
  String get skipSilenceTitle => 'Saltu silenton';

  @override
  String get skipSilenceSubtitle =>
      'Aŭtomate preterlasu silentajn aŭdsegmentojn kiam subtenata de la fluo.';

  @override
  String get allowExternalAudioEffectsTitle => 'Permesu eksterajn sonefikojn';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permesu al aplikaĵoj de ekvalizilo kaj efektoj (ekz. Wavelet) alligi al Media3 reproduktaj sesioj.';

  @override
  String get disableTunnelingTitle => 'Malebligu tuneladon';

  @override
  String get disableTunnelingSubtitle =>
      'Devigi ne-tunelitan reproduktadon. Utila sur aparatoj kun tunelaj audio/video malkontinuecoj.';

  @override
  String get enableTunnelingTitle => 'Ebligi tunuladon';

  @override
  String get enableTunnelingSubtitle =>
      'Altnivela. Direktas aŭdion kaj videon tra kunligita aparatara vojo. Malŝaltita defaŭlte ĉar ĝi kaŭzas aŭdiajn/videajn interrompojn sur kelkaj aparatoj.';

  @override
  String get mapDolbyVisionP7Title => 'Mapu Dolby Vision profilon 7 al HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Ludu Dolby Vision profilon 7 fluojn kiel HDR10-kongrua HEVC sur ne-DV-aparatoj.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Uzu enigitajn subtitolojn';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apliki kolorojn, tiparojn kaj poziciigon enigitan en la subtitolon. Malebligu uzi viajn subtitolajn stilpreferojn anstataŭe.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Uzu enkorpigitajn subtitolaj tiparoj';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apliku tipargrandajn sugestojn enkonstruitajn en la subtitola trako. Malebligu uzi la subtitolon de viaj stilaj preferoj.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Montri aŭdvidajn detalojn';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Montri detalojn de la elektita ero ĉe la supro de bibliotekaj paĝoj.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Uzu Detalaj Sub-Titoloj';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Montru detalan aŭ minimuman subvicon sur Bibliotekaj paĝoj.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ĉu forigi konservitan temon?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ĉu forigi \"$themeName\" el ĉi tiu aparatkaŝmemoro?';
  }

  @override
  String get themeStore => 'Temvendejo';

  @override
  String get themeStoreSubtitle => 'Foliumi kaj konservi komunumajn temojn';

  @override
  String get themeStoreDescription =>
      'Konservu temon por uzi ĝin kiel viajn aliajn konservitajn temojn.';

  @override
  String get themeStoreEmpty => 'Neniuj temoj estas disponeblaj nun.';

  @override
  String get themeStoreLoadFailed =>
      'Ne eblis ŝargi la Temvendejon. Kontrolu vian konekton kaj reprovu.';

  @override
  String get themeStoreSave => 'Konservi';

  @override
  String get themeStoreSaveAndApply => 'Konservi kaj apliki';

  @override
  String get themeStoreSaved => 'Konservita';

  @override
  String get themeStoreInvalidMessage => 'Ĉi tiu temo ne povis esti ŝargita.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Konservis \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Forigita \"$themeName\" de ĉi tiu aparato.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Ne eblis forigi \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Konservitaj temoj';

  @override
  String get savedThemesDescription =>
      'Ĉi tiuj estas temoj elŝutitaj de la kromaĵo Moonfin por la nuna servilo. Forigo forigas nur ĉi tiun lokan kopion.';

  @override
  String get savedThemesEmpty =>
      'Neniuj konservitaj temoj estis trovitaj por ĉi tiu servilo.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Nuntempe aktiva';
  }

  @override
  String get savedThemesDeleteTooltip => 'Forigu konservitan temon';

  @override
  String get savedThemesManageSubtitle =>
      'Administru elŝutitajn kromtemojn sur ĉi tiu aparato';

  @override
  String get themeEditor => 'Temo-Redaktilo';

  @override
  String get themeEditorSubtitle =>
      'Malfermu la Moonfin Temo-Redaktilon en via retumilo';

  @override
  String get homeScreen => 'Hejma Ekrano';

  @override
  String get bottomBar => 'Malsupra Trinkejo';

  @override
  String get homeRowsStyleClassic => 'Klasika';

  @override
  String get homeRowsStyleModern => 'Moderna';

  @override
  String get homeRowsSection => 'Hejmaj Vicoj';

  @override
  String get rowsType => 'Vicoj Tipo';

  @override
  String get rowsTypeDescription =>
      'Klasika konservas po-vican bildspecon kaj informan tegmenton. Modernaj uzoj portret-al-fono vicoj.';

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
  String get displayFavoritesRows => 'Montru Favoritajn Vicojn';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Montru Ŝatatajn Filmojn, Seriojn kaj aliajn ŝatatajn vicojn en Hejmaj Sekcioj.';

  @override
  String get favoritesRowSorting => 'Ŝtata Ordigo de Vico';

  @override
  String get favoritesRowSortingDescription =>
      'Ordigu la Vicojn de Ŝtatatoj laŭ dato de aldonita, eldondato, alfabete kaj pli.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Vidigu Kolektoj Vicoj';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Montru vicojn de Kolektoj en Hejmaj Sekcioj.';

  @override
  String get collectionsRowSorting => 'Kolektoj Vico Ordigo';

  @override
  String get collectionsRowSortingDescription =>
      'Ordigi la vicojn de Kolektoj laŭ dato de aldonita, eldondato, alfabete kaj pli.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Montru Ĝenrojn Vicoj';

  @override
  String get displayGenresRowsSubtitle =>
      'Montru Ĝenrajn vicojn en Hejmaj Sekcioj.';

  @override
  String get genresRowSorting => 'Ĝenroj Vico Ordigo';

  @override
  String get genresRowSortingDescription =>
      'Ordigu Ĝenrajn vicojn laŭ dato de aldonita, eldondato, alfabete kaj pli.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Ĝenroj Vico Eroj';

  @override
  String get genresRowItemsDescription =>
      'Montru Filmojn, Seriojn aŭ ambaŭ en Ĝenraj vicoj.';

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
  String get displayPlaylistsRows => 'Montri vicojn de ludlistoj';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Montri vicojn de ludlistoj en Hejmaj Sekcioj.';

  @override
  String get playlistsRowSorting => 'Ordigo de vicoj de ludlistoj';

  @override
  String get playlistsRowSortingDescription =>
      'Ordigi vicojn de ludlistoj laŭ aldondato, eldondato, alfabete kaj pli.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Montri aŭdiajn vicojn';

  @override
  String get displayAudioRowsSubtitle =>
      'Montri aŭdiajn vicojn en Hejmaj Sekcioj.';

  @override
  String get audioRowsSorting => 'Ordigo de aŭdiaj vicoj';

  @override
  String get audioRowsSortingDescription =>
      'Ordigi aŭdiajn vicojn laŭ aldondato, eldondato, alfabete kaj pli.';

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
  String get audioPlaylists => 'Aŭdiaj ludlistoj';

  @override
  String get appearance => 'Aspekto';

  @override
  String get layout => 'Aranĝo';

  @override
  String get theme => 'Temo';

  @override
  String get keyboard => 'Klavaro';

  @override
  String get navButtons => 'Butonoj';

  @override
  String get rendering => 'Bildigado';

  @override
  String get mpvConfiguration => 'MPV-agordo';

  @override
  String get cardSize => 'Karto Grandeco';

  @override
  String get externalPlayerApp => 'Ekstera ludanta aplikaĵo';

  @override
  String get externalPlayerAppDescription =>
      'Agordu eksteran ludilon por ebligi la eblon ludi per longa premo';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Montru aplikan elektilon kiam reproduktado komenciĝas.';

  @override
  String get loadingInstalledPlayers => 'Ŝargante instalitajn ludantojn...';

  @override
  String get connection => 'Konekto';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Trapaso';

  @override
  String get supportedOnThisDevice => 'Subtenata sur ĉi tiu aparato';

  @override
  String get notSupportedOnThisDevice => 'Ne Subtenata sur ĉi tiu aparato';

  @override
  String get mediaPlayerBehavior => 'Media Player Konduto';

  @override
  String get playbackEnhancements => 'Plibonigoj de Ludado';

  @override
  String get alwaysOn => 'Ĉiam ŝaltita.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Anstataŭigi Skip Outro per Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Montru la kovraĵon Sekva Supre anstataŭ la butonon Saltu Outro.';

  @override
  String get playerRouting => 'Ludanta Vokado';

  @override
  String get preferSoftwareDecoders => 'Preferas programajn malĉifrilojn';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Uzu FFmpeg (audio) kaj libgav1 (AV1) antaŭ aparataj malĉifriloj. Malebligu se HDMI-aŭdio-transpaso rompas.';

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
  String get useExternalPlayer => 'Uzu eksteran ludilon';

  @override
  String get useExternalPlayerSubtitle =>
      'Malfermu videoludadon en via elektita ekstera programo en Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Aŭtomata Vidovico';

  @override
  String get preferSdhSubtitles => 'Preferu SDH-subtekstojn';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorigu SDH/CC-subtitolojn dum aŭtomata elekto.';

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
  String get webDiagnostics => 'Reta diagnozo';

  @override
  String get webDiagnosticsTitle => 'Moonfin Reteja Diagnozo';

  @override
  String get webDiagnosticsIntro =>
      'Uzu ĉi tiun paĝon por diagnozi problemojn pri retumila konektebleco (CORS, miksita enhavo kaj malkovraj agordoj).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detektita Miksenhava Fiasko';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detektita CORS/Preflight Fiasko';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detektis HTTPS-paĝon provantan voki HTTP-servilan URL. Retumiloj blokas ĉi tiun peton antaŭ ol ĝi atingas vian servilon.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detektis fiaskon de peto-nivela foliumilo, kiu estas kutime kaŭzita de mankantaj CORS aŭ antaŭflugaj kaplinioj sur la amaskomunikila servilo.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Cela URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalo: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Nuna Rultempa Kunteksto';

  @override
  String get webDiagnosticsOrigin => 'Origino';

  @override
  String get webDiagnosticsScheme => 'Skemo';

  @override
  String get webDiagnosticsPluginMode => 'Kromprogramo-Reĝimo';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-Skanado';

  @override
  String get webDiagnosticsForcedServerUrl => 'Devigita Servilo URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Defaŭlta Servila URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Malkovra Prokura URL';

  @override
  String get notConfigured => 'ne agordita';

  @override
  String get webDiagnosticsMixedContent => 'Miksita Enhavo';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ĉi tiu paĝo estas ŝarĝita per HTTPS, sed unu aŭ pluraj agorditaj URL-oj estas HTTP. Retumiloj blokas HTTPS-paĝojn de voki HTTP-APIojn.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Ripari: servu vian amaskomunikilaron aŭ prokuran finpunkton per HTTPS, aŭ ŝarĝu Moonfin per HTTP nur en fidindaj lokaj retoj.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Neniu evidenta miksenhava agordo detektita de nunaj rultempaj agordoj.';

  @override
  String get webDiagnosticsCorsChecklist => 'Kontrollisto de CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permesu la retumilon originon en Aliro-Kontrolo-Allow-Origino.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inkluzivi Rajtigon, X-Emby-Ratorigo, kaj X-Emby-Token en Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ekspozi Enhavo-Gamoj kaj Akceptu-Gamoj por streaming kaj serĉi konduton.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Resendu 204 al OPCIOJ antaŭflugpetoj.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Ekzempla Kapa Fragmento (nginx-stila)';

  @override
  String get note => 'Notu';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ĉi tiu diagnoza vojo estas destinita por TTT-konstruaĵoj. Se vi vidas ĉi tion sur alia platformo, ĉi tiuj ĉekoj eble ne aplikiĝas.';

  @override
  String get backToServerSelect => 'Reen Al Servilo Elektu';

  @override
  String get signOutAllUsers => 'Elsaluti Ĉiuj Uzantoj';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofonpermeso estas konstante malakceptita. Ebligu ĝin en sistemaj agordoj.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mikrofona permeso estas bezonata por voĉa serĉo.';

  @override
  String get voiceSearchNoMatch => 'Ne kaptis tion. Provu denove.';

  @override
  String get voiceSearchNoSpeechDetected => 'Neniu parolado detektita.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofono eraro.';

  @override
  String get voiceSearchNeedsInternet => 'Voĉa serĉo bezonas interreton.';

  @override
  String get voiceSearchServiceBusy =>
      'Voĉa servo estas okupata. Provu denove.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofonpermeso estas konstante malakceptita.';

  @override
  String get microphonePermissionDenied =>
      'Mikrofonpermeso estas malakceptita.';

  @override
  String get speechRecognitionUnavailable =>
      'Parola rekono ne disponeblas en ĉi tiu aparato.';

  @override
  String get openIosRoutePicker => 'Malfermu iOS-itineran elektilon';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay itinero-elektilo ne estas disponebla en ĉi tiu aparato.';

  @override
  String get videos => 'Videoj';

  @override
  String get programs => 'Programoj';

  @override
  String get songs => 'Kantoj';

  @override
  String get photoAlbums => 'Fotoalbumoj';

  @override
  String get photos => 'Fotoj';

  @override
  String get people => 'Homoj';

  @override
  String get recentlyReleasedEpisodes => 'Lastatempe Eldonitaj Epizodoj';

  @override
  String get watchAgain => 'Spektu Denove';

  @override
  String get guestAppearances => 'Gastaj Aperoj';

  @override
  String get appearancesSeerr => 'Aperoj (Seerr)';

  @override
  String get crewContributionsSeerr => 'Kontribuoj de teamo (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Rigardu kun grupo';

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
  String get disk => 'Disko';

  @override
  String get openInBrowser => 'Malfermu en Retumilo';

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
      'Enigita retumilo ne haveblas sur ĉi tiu platformo.';

  @override
  String get adminRestartServerConfirmation =>
      'Ĉu vi certas, ke vi volas rekomenci la servilon?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ĉu vi certas, ke vi volas malŝalti la servilon? Vi devos rekomenci ĝin permane.';

  @override
  String get internal => 'Interna';

  @override
  String get idle => 'Senlabore';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Neniuj uzantoj trovitaj';

  @override
  String get adminNoUsersMatchSearch => 'Neniuj uzantoj kongruas kun via serĉo';

  @override
  String get adminNoDevicesFound => 'Neniuj aparatoj trovitaj';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Neniuj aparatoj kongruas kun la nunaj filtriloj';

  @override
  String get remoteAccess => 'Fora Aliro';

  @override
  String get localOnly => 'Loka Nur';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Malsukcesis ŝargi amaskomunikilaran analizon';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinita analizo tra ĉiuj amaskomunikilaj bibliotekoj.';

  @override
  String get analyticsTopArtists => 'Plej bonaj Artistoj';

  @override
  String get analyticsTopAuthors => 'Ĉefaj Aŭtoroj';

  @override
  String get analyticsTopContributors => 'Ĉefaj Kontribuantoj';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bibliotekoj',
      one: '1 Biblioteko',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Neniuj indeksitaj amaskomunikiloj ankoraŭ disponeblas por ĉi tiu elekto.';

  @override
  String get analyticsLibraryDetails => 'Biblioteko Detaloj';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotekrompo';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Neniuj bibliotekoj estas haveblaj.';

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
  String get adminServerAdministrationTitle => 'Servila Administrado';

  @override
  String get adminServerPathData => 'Datumoj';

  @override
  String get adminServerPathImageCache => 'Bilda kaŝmemoro';

  @override
  String get adminServerPathCache => 'Deponejo';

  @override
  String get adminServerPathLogs => 'Ŝtipoj';

  @override
  String get adminServerPathMetadata => 'Metadatenoj';

  @override
  String get adminServerPathTranscode => 'Transkodigo';

  @override
  String get adminServerPathWeb => 'Retejo';

  @override
  String get adminNoServerPathsReturned =>
      'Neniuj servilaj vojoj revenis de ĉi tiu servilo.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% uzata';
  }

  @override
  String get userActivity => 'Uzanto-Agado';

  @override
  String get systemEvents => 'Sistema Eventoj';

  @override
  String get needsAttention => 'Bezonas Atenton';

  @override
  String get homeVideos => 'Hejmaj Videoj';

  @override
  String get mixedContent => 'Miksita Enhavo';

  @override
  String get homeVideosAndPhotos => 'Hejmaj Videoj kaj Fotoj';

  @override
  String get mixedMoviesAndShows => 'Miksitaj Filmoj kaj Spektakloj';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Neniuj registradoj trovitaj';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Neniuj bildaj paĝoj trovitaj ene de .$extension-arkivo.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Enigita bildilo malsukcesis ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-bildilo malsukcesis ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Mankas loka dosiero por leganto: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status dum malfermado de librodatenoj de $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Neniu legebla librofinpunkto havebla';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nesubtenata komika arkivformato: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR-eltira kromaĵo ne haveblas sur ĉi tiu platformo.';

  @override
  String get failedToExtractCbrArchive => 'Malsukcesis ĉerpi .cbr-arkivon.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-ekstraktado ne haveblas sur ĉi tiu platformo.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7-eltira kromaĵo ne haveblas sur ĉi tiu platformo.';

  @override
  String get loadingShuffle => 'Ŝargante miksadon...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTEKA MIKSADO';

  @override
  String get randomShuffleLabel => 'HAZARDA MIKSADO';

  @override
  String get genresShuffleLabel => 'ĜENRA MIKSADO';

  @override
  String get autoHdrSwitching => 'Aŭtomata HDR Ŝanĝo';

  @override
  String get autoHdrSwitchingDescription =>
      'Aŭtomate ebligu HDR por HDR-video-reproduktado kaj restarigu ekranreĝimon ĉe eliro.';

  @override
  String get whenFullscreen => 'Kiam plenekrana';

  @override
  String get changeArtwork => 'Ŝanĝi bildaĵon';

  @override
  String get missing => 'Mankanta';

  @override
  String get clearAllArtworkButton => 'Ĉu vakigi ĉiujn bildaĵojn?';

  @override
  String get clearAllArtworkWarning =>
      'Ĉu vi certas ke vi volas vakigi ĉiujn elŝutitajn bildaĵojn?';

  @override
  String get confirmClear => 'Konfirmi vakigon';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ĉu vi certas ke vi volas vakigi ĉi tiun $itemType?';
  }

  @override
  String get uploadButton => 'Ĉu alŝuti?';

  @override
  String get resolutionLabel => 'Distingivo: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Montri bildaĵojn nur en la interfaca lingvo';

  @override
  String get confirmClearAll => 'Konfirmi vakigon de ĉiuj';

  @override
  String get imageUploadSuccess => 'Bildo alŝutita sukcese!';

  @override
  String imageUploadFailed(String error) {
    return 'Malsukcesis alŝuti bildon: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Malsukcesis agordi bildon: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Malsukcesis forigi bildon: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Malsukcesis vakigi ĉiujn bildaĵojn: $error';
  }

  @override
  String get yes => 'Jes';

  @override
  String get posterCategory => 'Afiŝo';

  @override
  String get backdropsCategory => 'Fonbildoj';

  @override
  String get bannerCategory => 'Standardo';

  @override
  String get logoCategory => 'Emblemo';

  @override
  String get thumbnailCategory => 'Bildeto';

  @override
  String get artCategory => 'Arto';

  @override
  String get discArtCategory => 'Diskarto';

  @override
  String get screenshotCategory => 'Ekrankopio';

  @override
  String get boxCoverCategory => 'Skatolkovrilo';

  @override
  String get boxRearCoverCategory => 'Malantaŭa skatolkovrilo';

  @override
  String get menuArtCategory => 'Menuarto';

  @override
  String get confirmItemPoster => 'afiŝon';

  @override
  String get confirmItemBackdrop => 'fonbildon';

  @override
  String get confirmItemBanner => 'standardon';

  @override
  String get confirmItemLogo => 'emblemon';

  @override
  String get confirmItemThumbnail => 'bildeton';

  @override
  String get confirmItemArt => 'arton';

  @override
  String get confirmItemDiscArt => 'diskarton';

  @override
  String get confirmItemScreenshot => 'ekrankopion';

  @override
  String get confirmItemBoxCover => 'skatolkovrilon';

  @override
  String get confirmItemBoxRearCover => 'malantaŭan skatolkovrilon';

  @override
  String get confirmItemMenuArt => 'menuarton';

  @override
  String get resolutionAll => 'Ĉiuj';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Meza (720p)';

  @override
  String get resolutionLow => 'Malalta (<720p)';

  @override
  String get sources => 'Fontoj';

  @override
  String get audiobookChapters => 'Ĉapitroj';

  @override
  String get audiobookBookmarks => 'Legosignoj';

  @override
  String get audiobookNotes => 'Notoj';

  @override
  String get audiobookQueue => 'Vico';

  @override
  String get audiobookTimeline => 'Templinio';

  @override
  String get audiobookTimelineEmpty => 'Templinio estas malplena';

  @override
  String get audiobookFocusedTimeline => 'Fokusita templinio';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Eksporti legosignojn';

  @override
  String get audiobookExportNotes => 'Eksporti notojn';

  @override
  String get audiobookExportAll => 'Eksporti ĉion';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksportita al $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksporto malsukcesis: $error';
  }

  @override
  String get audiobookLyrics => 'Kantoteksto';

  @override
  String get audiobookAddBookmark => 'Aldoni legosignon';

  @override
  String get audiobookAddNote => 'Aldoni noton';

  @override
  String get audiobookEditNote => 'Redakti noton';

  @override
  String get audiobookNoteHint => 'Skribu noton por ĉi tiu momento';

  @override
  String get audiobookSleepTimer => 'Dormtempigilo';

  @override
  String get audiobookSleepOff => 'Malŝaltita';

  @override
  String get audiobookSleepEndOfChapter => 'Fino de ĉapitro';

  @override
  String get audiobookSleepCustom => 'Propra';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining restas';
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
  String get audiobookPlaybackSpeed => 'Ludrapido';

  @override
  String get audiobookRemainingTime => 'Restanta';

  @override
  String get audiobookElapsedTime => 'Pasinta';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Reen ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Antaŭen ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Antaŭa ĉapitro';

  @override
  String get audiobookNextChapter => 'Sekva ĉapitro';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Ĉapitro $current el $total';
  }

  @override
  String get audiobookNoChapters => 'Neniuj ĉapitroj';

  @override
  String get audiobookNoBookmarks => 'Ankoraŭ neniuj legosignoj';

  @override
  String get audiobookNoNotes => 'Ankoraŭ neniuj notoj';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Legosigno aldonita ĉe $position';
  }

  @override
  String get audiobookSpeedReset => 'Restarigi al 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Konservi';

  @override
  String get audiobookCancel => 'Nuligi';

  @override
  String get audiobookDelete => 'Forigi';

  @override
  String get subtitlePreferencesDescription =>
      'Ŝanĝi subtekstajn reĝimojn, defaŭltajn lingvojn, aspekton kaj bildigajn opciojn.';

  @override
  String get subtitleRendering => 'Bildigado de subtekstoj';

  @override
  String get displayOptions => 'Montroopcioj';

  @override
  String get releaseDateAscending => 'Eldondato (kreskanta)';

  @override
  String get releaseDateDescending => 'Eldondato (malkreskanta)';

  @override
  String get groupContributions => 'Grupigi kontribuojn';

  @override
  String get groupMultipleRoles => 'Grupigi plurajn rolojn';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Averto pri skribaliro al biblioteko';

  @override
  String get libraryWriteAccessHowToFix => 'Kiel ripari ĉi tion:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Donu skribpermesojn al la Jellyfin-serva uzanto (ekz. jellyfin aŭ Docker PUID/PGID) por viaj aŭdvidaj bibliotekaj dosierujoj sur la servilo.\n\n2. Aŭ, iru al via Jellyfin-panelo -> Bibliotekoj, redaktu ĉi tiun bibliotekon, kaj malŝaltu \'Konservi bildojn en aŭdvidajn dosierujojn\' por konservi bildaĵojn en la interna datumbazo de Jellyfin.';

  @override
  String get dismiss => 'Forĵeti';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Via biblioteko \'$libraryName\' estas agordita por konservi bildaĵojn rekte en la aŭdvidajn dosierujojn (\'Konservi bildojn en aŭdvidajn dosierujojn\' estas ebligita). Tamen Jellyfin testis skribaliron kaj ne havas permeson skribi dosierojn en ĉi tiun dosierujon:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Ŝajnas ke Jellyfin malsukcesis ĝisdatigi la bildaĵon. Via biblioteko estas agordita por konservi bildaĵojn rekte en la aŭdvidajn dosierujojn (\'Konservi bildojn en aŭdvidajn dosierujojn\' estas ebligita). Ĉi tiu eraro tipe okazas kiam la Jellyfin-servila procezo ne havas permeson skribi dosierojn en viajn aŭdvidajn dosierujojn.';

  @override
  String get replay => 'Reludi';

  @override
  String get fileInformation => 'Dosierinformo';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Grandeco: $size  •  Formato: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Montri ĉiujn ($count) aŭdiajn trakojn';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Montri ĉiujn ($count) subtekstajn trakojn';
  }

  @override
  String get checkingDirectPlay => 'Kontrolante la kapablon de Rekta Ludado...';

  @override
  String get directPlayCapabilityLabel => 'Kapablo de Rekta Ludado: ';

  @override
  String get forced => 'Devigita';

  @override
  String get transcodeContainerNotSupported =>
      'La ujformato ne estas subtenata de la ludilo.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'La videa kodeko ne estas subtenata.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'La aŭdia kodeko ne estas subtenata.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'La subteksta formato ne estas subtenata (postulas enbruligon).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'La aŭdia profilo ne estas subtenata.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'La videa profilo ne estas subtenata.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'La videa nivelo ne estas subtenata.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'La videa distingivo ne estas subtenata de ĉi tiu aparato.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'La videa bitprofundo ne estas subtenata.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'La videa kadrofrekvenco ne estas subtenata.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'La dosiera bitrapido superas la elsendan limon de la ludilo.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'La videa bitrapido superas la elsendan limon.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'La aŭdia bitrapido superas la elsendan limon.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'La nombro da aŭdiaj kanaloj ne estas subtenata.';

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
  String get sortAlphabetical => 'Alfabete';

  @override
  String get sortReleaseAscending => 'Eldonordo (kreskanta)';

  @override
  String get sortReleaseDescending => 'Eldonordo (malkreskanta)';

  @override
  String get sortCustomDragDrop => 'Propra (treni kaj demeti)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Ordigopcioj de ludlisto';

  @override
  String get resetSort => 'Restarigi ordigon';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rerigardi S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rerigardi ludliston';

  @override
  String get noSubtitlesFound => 'Neniuj subtekstoj trovitaj.';

  @override
  String get adminControls => 'Administraj regiloj';

  @override
  String get impellerRendering => 'Bildiga maŝino (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller estas la moderna GPU-bildigilo de Flutter por pli glataj animacioj kaj malpli da ŝutriĝo. Sur kelkaj TV-skatoloj kaj pli malnovaj GPU-oj ĝi povas kaŭzi difektojn aŭ nigran videon; malŝaltu ĝin se vi vidas tiajn. Aŭtomata elektas la plej bonan defaŭlton por via aparato. Restartigu Moonfin por apliki.';

  @override
  String get impellerAuto => 'Aŭtomata';

  @override
  String get impellerOn => 'Ŝaltita';

  @override
  String get impellerOff => 'Malŝaltita';

  @override
  String get impellerRestartTitle => 'Restarto necesa';

  @override
  String get impellerRestartMessage =>
      'Moonfin devas restarti por ŝanĝi la bildigan maŝinon. Fermu la aplikaĵon nun, poste remalfermu ĝin por apliki.';

  @override
  String get impellerCloseNow => 'Fermi la aplikaĵon nun';

  @override
  String get adminRefreshLibrary => 'Refreŝigi bibliotekon';

  @override
  String get adminRefreshAllLibraries => 'Refreŝigi ĉiujn bibliotekojn';

  @override
  String get adminRepoSortDateOldest => 'Aldondato (plej malnovaj unue)';

  @override
  String get adminRepoSortDateNewest => 'Aldondato (plej novaj unue)';

  @override
  String get adminRepoSortNameAsc => 'Alfabete (A al Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabete (Z al A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Ŝargante servilan analitikon... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kongrui kun fonto';

  @override
  String get imdbTop250Movies => 'IMDb Plej Bonaj 250 Filmoj';

  @override
  String get imdbTop250TvShows => 'IMDb Plej Bonaj 250 TV-Serioj';

  @override
  String get imdbMostPopularMovies => 'IMDb Plej Popularaj Filmoj';

  @override
  String get imdbMostPopularTvShows => 'IMDb Plej Popularaj TV-Serioj';

  @override
  String get imdbLowestRatedMovies => 'IMDb Plej Malalte Taksitaj Filmoj';

  @override
  String get imdbTopEnglishMovies => 'IMDb Plej Bone Taksitaj Anglaj Filmoj';

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
  String get integrations => 'Integriĝoj';

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
