// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

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
  String get interfaceLanguage => 'Liidese keel';

  @override
  String get systemLanguageDefault => 'Süsteemi vaikimisi';

  @override
  String get signIn => 'Logi sisse';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tühi';

  @override
  String connectingToServer(String serverName) {
    return 'Ühenduse loomine aadressiga $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Parool';

  @override
  String get username => 'Kasutajanimi';

  @override
  String get email => 'Meil';

  @override
  String get quickConnectInstruction =>
      'Sisestage see kood oma serveri veebi juhtpaneelile:';

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
  String get waitingForAuthorization => 'Autoriseerimise ootel...';

  @override
  String get back => 'Tagasi';

  @override
  String get serverUnavailable => 'Server pole saadaval';

  @override
  String get loginFailed => 'Sisselogimine ebaõnnestus';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect pole saadaval: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect pole saadaval ($status): $detail';
  }

  @override
  String get whosWatching => 'Kes vaatab?';

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
  String get addUser => 'Lisa kasutaja';

  @override
  String get selectServer => 'Valige Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versioon $version';
  }

  @override
  String get savedServers => 'Salvestatud serverid';

  @override
  String get discoveredServers => 'Avastatud serverid';

  @override
  String get noneFound => 'Ühtegi ei leitud';

  @override
  String get unableToConnectToServer => 'Serveriga ei saa ühendust luua';

  @override
  String get addServer => 'Lisa server';

  @override
  String get embyConnect => 'Emby Ühendage';

  @override
  String get removeServer => 'Eemalda server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Kas eemaldada \"$serverName\" oma serveritest?';
  }

  @override
  String get cancel => 'Tühista';

  @override
  String get remove => 'Eemalda';

  @override
  String get connectToServer => 'Ühendage serveriga';

  @override
  String get serverAddress => 'Serveri aadress';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Ühendage';

  @override
  String get secureStorageUnavailable =>
      'Turvaline salvestusruum pole saadaval';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ei pääsenud teie süsteemi võtmehoidjale juurde. Sisselogimine võib jätkuda, kuid žetoonide turvaline salvestus ei pruugi olla saadaval enne, kui võtmehoidja on lukust avatud.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Rakenduse teema';

  @override
  String get detailScreenStyle => 'Detailivaate stiil';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassikaline on algne keskjoondatud Moonfini paigutus. Moodne on kohanduv kinolik paigutus.';

  @override
  String get detailScreenStyleMoonfin => 'Klassikaline';

  @override
  String get detailScreenStyleModern => 'Moodne';

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
  String get expandedTabs => 'Laiendatud vahekaardid';

  @override
  String get expandedTabsSubtitle =>
      'Näita vahekaardi sisu automaatselt vahekaartide sirvimisel. Lülita välja, et avada ja sulgeda iga vahekaart käsitsi.';

  @override
  String get showTechnicalDetails => 'Kas näidata tehnilisi andmeid?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Näita bänneri kokkuvõttes koodeki, eraldusvõime ja voo teavet';

  @override
  String get recommendationSystem => 'Soovitussüsteem';

  @override
  String get recommendationSystemSubtitle =>
      'Kasuta kohalikul meediakogul põhinevat algoritmi „Moonfin soovitab“ või TMDb võrgupõhiseid sarnasusmõõdikuid. Märkus: võrgusoovitused vajavad Seerri integratsiooni.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin soovitab';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb sarnasus';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Kas piirata vanusepiiranguga?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Piira „Moonfin soovitab“ ettepanekuid sihtmeedia vanusepiirangu järgi';

  @override
  String get interfaceStyle => 'Liidese stiil';

  @override
  String get interfaceStyleSubtitle =>
      'Automaatne kohandub sinu seadmega. Vali Apple või Material, et sundida kindlat välimust.';

  @override
  String get interfaceStyleAutomatic => 'Automaatne';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Kasutajaliidese Paigutus';

  @override
  String get interfaceLayoutSubtitle =>
      'Override the detected layout when this device is read wrong. Restart Moonfin for changes to take effect.';

  @override
  String get interfaceLayoutAutomatic => 'Automaatne';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Töölaud';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Klaasi kvaliteet';

  @override
  String get oledMode => 'OLED režiim';

  @override
  String get oledModeSubtitle =>
      'Teeb mustad toonid sügavamaks ja rikastab värve. Parim OLED ekraanidel.';

  @override
  String get oledModeSubtle => 'Tagasihoidlik';

  @override
  String get oledModeVivid => 'Ergas';

  @override
  String get glassQualitySubtitle =>
      'Automaatne valib selle seadme jaoks parima klaasiefekti. Täielik sunnib päris hägustuse, Vähendatud kasutab kerget klaasi, mis säästab GPU jõudlust.';

  @override
  String get glassQualityAuto => 'Automaatne';

  @override
  String get glassQualityFull => 'Täielik';

  @override
  String get glassQualityReduced => 'Vähendatud';

  @override
  String get performanceMode => 'Jõudlus';

  @override
  String get performanceModeSubtitle =>
      'Auto measures this device and holds back on the ones short on memory, which keeps fewer images in memory and leaves trailers as still images. Takes full effect on the next launch.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Tavaline';

  @override
  String get performanceModeReduced => 'Vähendatud';

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
      'Välja lülitatud kuna Jõudlus on sellel seadmel seadistatud Vähendatuks';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Lülitage Moonfini ja Neon Pulse vahel ilma rakendust taaskäivitamata';

  @override
  String get customThemeTitle => 'Kohandatud teema';

  @override
  String get customThemeSubtitle =>
      'Kohandatud teemad muudavad Moonfini visuaalseid elemente kõikjal. Vali oma stiiliga sobiv variant.';

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
  String get controller => 'Mängupult';

  @override
  String get gamepadNavigation => 'Mängupuldiga navigeerimine';

  @override
  String get gamepadNavigationDescription =>
      'Luba ühendatud mängupuldil liigutada fookust ning valida asju';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Praegune Moonfin välimus, mida olete kõik armastama hakanud';

  @override
  String get themeNeonPulse => 'Neoonpulss';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stiil magenta sära, tsüaani teksti ja tugevama kroomitud kontrastiga';

  @override
  String get themeGlass => 'Klaas';

  @override
  String get themeGlassSubtitle =>
      'Vedela klaasi stiil hõljuva üleminekuga taustal, härmatanud pinnad ja Apple’i sinine rõhuvärv';

  @override
  String get theme8BitHero => '8-bitine kangelane';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikslikunsti stiil jämeda paleti, kandiliste äärte, teravate varjude ja pikslifondiga';

  @override
  String get embyConnectSignInSubtitle =>
      'Logige sisse oma Emby Connecti kontoga';

  @override
  String get emailOrUsername => 'E-post või kasutajanimi';

  @override
  String get selectAServer => 'Valige server';

  @override
  String get tryAgain => 'Proovige uuesti';

  @override
  String get noLinkedServers =>
      'Selle Emby Connecti kontoga pole lingitud ühtegi serverit';

  @override
  String get invalidEmbyConnectCredentials =>
      'Kehtetud Emby Connecti mandaadid';

  @override
  String get invalidEmbyConnectLogin =>
      'Kehtetu Emby Connecti kasutajanimi või parool';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server ei toeta Emby Connecti vahetust';

  @override
  String get embyConnectNetworkError =>
      'Võrgutõrge Emby Connecti või valitud serveriga ühenduse võtmisel';

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
  String get loadingLinkedServers => 'Lingitud serverite laadimine...';

  @override
  String get connectingToServerEllipsis => 'Ühenduse loomine serveriga...';

  @override
  String get noReachableAddress => 'Kättesaadav aadress puudub';

  @override
  String get invalidServerExchangeResponse =>
      'Vale vastus serverivahetuse lõpp-punktist';

  @override
  String unableToConnectTo(String target) {
    return 'Ühendust ei saa luua $target';
  }

  @override
  String get exitApp => 'Kas lahkuda Moonfinist?';

  @override
  String get exitAppConfirmation => 'Kas soovite kindlasti väljuda?';

  @override
  String get exit => 'Välju';

  @override
  String get gameMenu => 'Menüü';

  @override
  String get gamePaused => 'Pausil';

  @override
  String get gameSaveState => 'Salvesta olek';

  @override
  String get games => 'Mängud';

  @override
  String get gameLoadState => 'Laadi olek';

  @override
  String get gameFastForward => 'Kiirkerimine';

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
  String get gameEmulatorSettings => 'Emulaatori seaded';

  @override
  String get gameNoCoreOptions =>
      'Sellel tuumal pole reguleeritavaid valikuid.';

  @override
  String get gameHoldToOpenMenu => 'Hoia all, et avada menüü';

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
      'See seade ei toeta veel mängude mängimist.';

  @override
  String get noHomeRowsLoaded => 'Ühtegi kodurida ei saanud laadida';

  @override
  String get noHomeRowsHint =>
      'Proovige aktiivseid koduosasid värskendada või vähendada.';

  @override
  String get retryHomeRows => 'Proovige koduridu uuesti';

  @override
  String get guide => 'Juhend';

  @override
  String get recordings => 'Salvestised';

  @override
  String get schedule => 'Ajakava';

  @override
  String get series => 'Sarjad';

  @override
  String get noItemsFound => 'Üksusi ei leitud';

  @override
  String get home => 'Avaleht';

  @override
  String get browseAll => 'Sirvi kõiki';

  @override
  String get genres => 'Žanrid';

  @override
  String get collectionPlaceholder => 'Siin kuvatakse kollektsiooni üksused';

  @override
  String get browseByLetter => 'Sirvige kirjade kaupa';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Siin kuvatakse tähestikuline sirvimine';

  @override
  String get suggestions => 'Ettepanekud';

  @override
  String get suggestionsPlaceholder => 'Soovitatud üksused kuvatakse siin';

  @override
  String get failedToLoadLibraries => 'Teekide laadimine ebaõnnestus';

  @override
  String get noLibrariesFound => 'Ühtegi raamatukogu ei leitud';

  @override
  String get library => 'Meediakogu';

  @override
  String get displaySettings => 'Kuva seaded';

  @override
  String get allGenres => 'Kõik žanrid';

  @override
  String get noGenresFound => 'Žanreid ei leitud';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kausta laadimine ebaõnnestus: $error';
  }

  @override
  String get thisFolderIsEmpty => 'See kaust on tühi';

  @override
  String itemCountLabel(int count) {
    return '$count üksused';
  }

  @override
  String get failedToLoadFavorites => 'Lemmikute laadimine ebaõnnestus';

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get noFavoritesYet => 'Lemmikuid veel pole';

  @override
  String get favorites => 'Lemmikud';

  @override
  String totalCountItems(int count) {
    return '$count Üksused';
  }

  @override
  String get continuing => 'Jätkub';

  @override
  String get ended => 'Lõppenud';

  @override
  String get sortAndFilter => 'Sorteeri ja filtreeri';

  @override
  String get type => 'Tüüp';

  @override
  String get sortBy => 'Sorteeri';

  @override
  String get display => 'Ekraan';

  @override
  String get imageType => 'Pildi tüüp';

  @override
  String get posterSize => 'Plakati suurus';

  @override
  String get small => 'Väike';

  @override
  String get medium => 'Keskmine';

  @override
  String get large => 'Suur';

  @override
  String get extraLarge => 'Eriti suur';

  @override
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Kerimise Suund';

  @override
  String get scrollDirectionVertical => 'Vertikaalne';

  @override
  String get scrollDirectionHorizontal => 'Horisontaalne';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Žanrid';
  }

  @override
  String get views => 'Vaated';

  @override
  String get albums => 'Albumid';

  @override
  String get albumArtists => 'Albumi kunstnikud';

  @override
  String get artists => 'Esitajad';

  @override
  String get bookmarks => 'Järjehoidjad';

  @override
  String get noSavedBookmarks =>
      'Selle pealkirja jaoks pole veel salvestatud järjehoidjaid.';

  @override
  String get openBook => 'Ava raamat';

  @override
  String get chapter => 'Peatükk';

  @override
  String get page => 'Lehekülg';

  @override
  String get bookmark => 'Järjehoidja';

  @override
  String get justNow => 'Just praegu';

  @override
  String minutesAgo(int count) {
    return '${count}m tagasi';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h tagasi';
  }

  @override
  String daysAgo(int count) {
    return '${count}d tagasi';
  }

  @override
  String get discoverySubjects => 'Avastusobjektid';

  @override
  String get apply => 'Rakenda';

  @override
  String get openLink => 'Ava link';

  @override
  String get scanWithYourPhone => 'Skannige oma telefoniga';

  @override
  String get audiobookGenres => 'Audioraamatu žanrid';

  @override
  String get scrollLeft => 'Kerige vasakule';

  @override
  String get scrollRight => 'Kerige paremale';

  @override
  String get scrollToTop => 'Keri tippu';

  @override
  String get couldNotLoadGenre => 'Seda žanrit ei saanud praegu laadida.';

  @override
  String get continueReading => 'Jätka lugemist';

  @override
  String get savedHighlights => 'Salvestatud esiletõstmised';

  @override
  String get continueListening => 'Jätka kuulamist';

  @override
  String get listen => 'Kuulake';

  @override
  String get resume => 'Jätka';

  @override
  String get failedToLoadLibrary => 'Teegi laadimine ebaõnnestus';

  @override
  String get popularNow => 'Praegu populaarne';

  @override
  String get savedForLater => 'Salvestatud hilisemaks';

  @override
  String get topListens => 'Parimad kuulamised';

  @override
  String get unreadDiscoveries => 'Lugemata avastused';

  @override
  String get pickUpAgain => 'Võtke uuesti üles';

  @override
  String get bookHighlightsDescription =>
      'Teie raamatud tipphetkede, lemmikute või lugemise edenemisega.';

  @override
  String get handPickedFromLibrary => 'Teie raamatukogust käsitsi valitud.';

  @override
  String get handPickedFromListeningQueue =>
      'Teie kuulamisjärjekorrast käsitsi valitud.';

  @override
  String get booksWithHighlights =>
      'Raamatud tipphetkede, lemmikute või lugemise edenemisega.';

  @override
  String get jumpBackNarration =>
      'Hüppa tagasi jutustamisse ilma oma kohta jahtimata.';

  @override
  String get unreadBooksReady =>
      'Lugemata raamatud on järgmiseks vaikseks tunniks valmis.';

  @override
  String get quickAccessFavorites =>
      'Kiire juurdepääs raamatutele, mille juurde naased.';

  @override
  String get searchAudiobooks => 'Otsige audioraamatuid';

  @override
  String get searchYourLibrary => 'Otsige oma raamatukogust';

  @override
  String get pickUpStory => 'Jätkake lugu sealt, kus pooleli jäite';

  @override
  String get savedPlacesChapters =>
      'Teie salvestatud kohad ja lõpetamata peatükid';

  @override
  String authorsCount(int count) {
    return '$count autorid';
  }

  @override
  String genresCount(int count) {
    return '$count žanrid';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% valmis';
  }

  @override
  String get readyWhenYouAre => 'Valmis, kui oled';

  @override
  String get details => 'Üksikasjad';

  @override
  String get listeningRoom => 'Kuulamistuba';

  @override
  String get bookmarksAndProgress => 'Järjehoidjad ja edenemine';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count pealkirjad, mis on seatud esmaseks lugemiseks sirvimiseks.';
  }

  @override
  String get titles => 'Pealkirjad';

  @override
  String get allTitles => 'Kõik pealkirjad';

  @override
  String get authors => 'Autorid';

  @override
  String get browseByAuthor => 'Sirvi autori järgi';

  @override
  String get browseByGenre => 'Sirvi žanri järgi';

  @override
  String get discover => 'Avastage';

  @override
  String get noBookmarkedItems => 'Järjehoidjatesse lisatud üksusi pole veel';

  @override
  String get nothingMatchesSection =>
      'Sellele jaotisele ei vasta veel midagi. Proovige teist vahekaarti või tulge pärast teegi sünkroonimise lõppemist tagasi.';

  @override
  String get audiobooks => 'Audioraamatud';

  @override
  String noLabelFound(String label) {
    return '$label ei leitud';
  }

  @override
  String get folder => 'Kaust';

  @override
  String get filters => 'Filtrid';

  @override
  String get readingStatus => 'Lugemise olek';

  @override
  String get playedStatus => 'Mänginud olek';

  @override
  String get readStatus => 'Lugege';

  @override
  String get watched => 'Vaadatud';

  @override
  String get unread => 'Lugemata';

  @override
  String get unwatched => 'Vaatamata';

  @override
  String get seriesStatus => 'Sarja olek';

  @override
  String get allLibraries => 'Kõik raamatukogud';

  @override
  String get books => 'Raamatud';

  @override
  String get latestBooks => 'Uusimad raamatud';

  @override
  String get latestAudiobooks => 'Uusimad audioraamatud';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count raamatut',
      one: '1 raamat',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Raamat';

  @override
  String get bookFormatAudiobook => 'Audioraamat';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Selle autori jaoks ei leitud ühtegi raamatut.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% loetud';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time jäänud';
  }

  @override
  String get bookHeroRead => 'Loe';

  @override
  String get bookHeroListen => 'Kuula';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Tundmatu autor';

  @override
  String get uncategorized => 'Kategooriata';

  @override
  String get overview => 'Ülevaade';

  @override
  String get noLibrivoxDescription =>
      'LibriVox pole selle pealkirja kohta veel kirjeldust esitanud.';

  @override
  String get readers => 'Lugejad';

  @override
  String get openLinks => 'Avage lingid';

  @override
  String get librivoxPage => 'LibriVoxi leht';

  @override
  String get internetArchive => 'Interneti-arhiiv';

  @override
  String get rssFeed => 'RSS-voog';

  @override
  String get downloadZip => 'Laadige alla Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count jaotised';
  }

  @override
  String firstPublished(int year) {
    return 'Esmakordselt avaldatud $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Selle pealkirja kohta pole Open Library ülevaadet veel saadaval.';

  @override
  String get subjects => 'Õppeained';

  @override
  String get all => 'Kõik';

  @override
  String booksCount(int count) {
    return '$count raamatud';
  }

  @override
  String get couldNotLoadSubject => 'Seda teemat ei saanud praegu laadida.';

  @override
  String get audiobookDetails => 'Audioraamatu üksikasjad';

  @override
  String authorsCountTitle(int count) {
    return '$count Autorid';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audioraamatut',
      one: '1 audioraamat',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lugude loend';

  @override
  String get itemListPlaceholder => 'Siin kuvatakse üksuste loend';

  @override
  String get failedToLoad => 'Laadimine ebaõnnestus';

  @override
  String get delete => 'Kustuta';

  @override
  String get save => 'Salvesta';

  @override
  String get moreLikeThis => 'Rohkem sellist';

  @override
  String get castAndCrew => 'Näitlejad ja meeskond';

  @override
  String get collection => 'Kollektsioon';

  @override
  String get episodes => 'Episoodid';

  @override
  String get nextUp => 'Järgmine Üles';

  @override
  String get seasons => 'Hooajad';

  @override
  String get chapters => 'Peatükid';

  @override
  String get features => 'Omadused';

  @override
  String get movies => 'Filmid';

  @override
  String get musicVideos => 'Muusikavideod';

  @override
  String get other => 'muud';

  @override
  String get discography => 'Diskograafia';

  @override
  String get similarArtists => 'Sarnased kunstnikud';

  @override
  String get tableOfContents => 'Sisukord';

  @override
  String get tracklist => 'Lugude nimekiri';

  @override
  String discNumber(int number) {
    return 'Plaat $number';
  }

  @override
  String get biography => 'Biograafia';

  @override
  String get authorDetails => 'Autori üksikasjad';

  @override
  String get noOverviewAvailable =>
      'Selle pealkirja kohta pole veel ülevaadet saadaval.';

  @override
  String get noBiographyAvailable => 'Selle autori elulugu pole saadaval.';

  @override
  String get unableToLoadAuthorDetails =>
      'Autori üksikasju ei saa praegu laadida.';

  @override
  String published(int year) {
    return 'Avaldatud $year';
  }

  @override
  String get publicationDateUnknown => 'Avaldamise kuupäev teadmata';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hooaega',
      one: '1 hooaeg',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Lõpeb $time';
  }

  @override
  String get items => 'Üksused';

  @override
  String get extras => 'Lisamaterjalid';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Kaadri taga';

  @override
  String get deletedScenes => 'Väljajäetud stseenid';

  @override
  String get featurettes => 'Lühidokumentaalid';

  @override
  String get interviews => 'Intervjuud';

  @override
  String get scenes => 'Stseenid';

  @override
  String get shorts => 'Lühifilmid';

  @override
  String get trailers => 'Treilerid';

  @override
  String timeRemaining(String time) {
    return '$time jäänud';
  }

  @override
  String endsIn(String time) {
    return 'Lõpeb $time pärast';
  }

  @override
  String get view => 'Vaade';

  @override
  String get resumeReading => 'Jätka lugemist';

  @override
  String get read => 'Lugege';

  @override
  String resumeFrom(String position) {
    return 'Jätka $position';
  }

  @override
  String get play => 'Esita';

  @override
  String get startOver => 'Alusta otsast';

  @override
  String get restart => 'Taaskäivitage';

  @override
  String get readOffline => 'Lugege võrguühenduseta';

  @override
  String get playOffline => 'Mängige võrguühenduseta';

  @override
  String get audio => 'Heli';

  @override
  String get subtitles => 'Subtiitrid';

  @override
  String get version => 'Versioon';

  @override
  String get cast => 'Cast';

  @override
  String get castMembers => 'Osatäitjad';

  @override
  String get trailer => 'Treiler';

  @override
  String get finished => 'Valmis';

  @override
  String get favorited => 'Lemmikus';

  @override
  String get favorite => 'Lemmik';

  @override
  String get playlist => 'Esitusloend';

  @override
  String get downloaded => 'Alla laaditud';

  @override
  String get finalizingDownload => 'Lõpetan…';

  @override
  String get queuedDownload => 'Järjekorras';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veel järjekorras',
      one: '1 veel järjekorras',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Laadige kõik alla';

  @override
  String get download => 'Laadi alla';

  @override
  String get deleteDownloaded => 'Kustuta allalaaditud';

  @override
  String get goToSeries => 'Minge seeriasse';

  @override
  String get editMetadata => 'Redigeeri metaandmeid';

  @override
  String get less => 'Vähem';

  @override
  String get more => 'Rohkem';

  @override
  String get deleteItem => 'Kustuta üksus';

  @override
  String get deletePlaylist => 'Kustuta esitusloend';

  @override
  String get deletePlaylistMessage =>
      'Kas kustutada see esitusloend serverist?';

  @override
  String get deleteItemMessage => 'Kas kustutada see üksus serverist?';

  @override
  String get failedToDeletePlaylist => 'Esitusloendi kustutamine ebaõnnestus';

  @override
  String get failedToDeleteItem => 'Üksuse kustutamine ebaõnnestus';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Kustutamine ebaõnnestus järgmise veateatega: $error';
  }

  @override
  String get renamePlaylist => 'Esitusloendi ümbernimetamine';

  @override
  String get playlistName => 'Esitusloendi nimi';

  @override
  String get deleteDownloadedAlbum => 'Allalaaditud albumi kustutamine';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Kas kustutada „$title” allalaaditud lood?';
  }

  @override
  String get downloadedTracksDeleted => 'Allalaaditud lood on kustutatud';

  @override
  String get downloadedTracksDeleteFailed =>
      'Mõnda allalaaditud lugu ei saanud kustutada';

  @override
  String get noTracksLoaded => 'Lugusid pole laaditud';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel pole laaditud';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title ($count üksuste) allalaadimine...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Kas olete kindel, et soovite \"$name\" serverist kustutada? Seda toimingut ei saa tagasi võtta.';
  }

  @override
  String get itemDeleted => 'Üksus kustutatud';

  @override
  String get noPlayableTrailerFound => 'Esitatavat treilerit ei leitud.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Toetamata raamatuvorming: .$extension';
  }

  @override
  String get audioTrack => 'Helirada';

  @override
  String get subtitleTrack => 'Subtiitrirada';

  @override
  String get none => 'Puudub';

  @override
  String get downloadSubtitlesLabel => 'Laadi alla subtiitrid...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Otsige OpenSubtitlesi pistikprogrammi abil';

  @override
  String get downloadSubtitles => 'Laadige alla subtiitrid';

  @override
  String get searchingSubtitles => 'Otsin subtiitreid…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Laen subtiitreid…';

  @override
  String get selectedSubtitleInvalid => 'Valitud alapealkiri on kehtetu.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtiitrid alla laaditud ja valitud: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtiitrid alla laaditud. Jellyfini üksust värskendades võib kuvamiseks kuluda veidi aega.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Subtiitreid $language ei leitud.';
  }

  @override
  String get selectVersion => 'Valige Versioon';

  @override
  String versionNumber(int number) {
    return 'Versioon $number';
  }

  @override
  String get downloadAllQuality => 'Laadige kõik alla – kvaliteet';

  @override
  String get downloadQuality => 'Allalaadimise kvaliteet';

  @override
  String get originalFileNoReencoding =>
      'Originaalfail, uuesti kodeerimist pole';

  @override
  String get originalFilesNoReencoding =>
      'Originaalfailid, uuesti kodeerimist pole';

  @override
  String get noEpisodesLoaded => 'Ühtegi episoodi pole laaditud';

  @override
  String get downloadScopeTitle => 'Mida alla laadida';

  @override
  String get downloadAllEpisodes => 'Kõik episoodid';

  @override
  String get downloadUnwatchedEpisodes => 'Kõik vaatamata episoodid';

  @override
  String get downloadAllMovies => 'Kõik filmid';

  @override
  String get downloadUnwatchedMovies => 'Kõik vaatamata filmid';

  @override
  String get downloadScopeLoading => 'Laen sisu...';

  @override
  String get downloadScopeLoadFailed => 'Could not load items to download';

  @override
  String downloadEstimateTotal(String size) {
    return 'kokku ~$size';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received $total-st';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return 'kokku $size';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count tundmatut';
  }

  @override
  String downloadingItem(String name, String quality) {
    return '$name ($quality) allalaadimine...';
  }

  @override
  String get deleteDownloadedFiles => 'Kustutage allalaaditud failid';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Kas kustutada $typeLabel kohalikud failid?\n\nSee vabastab salvestusruumi. Saate hiljem uuesti alla laadida.';
  }

  @override
  String get downloadedFilesDeleted => 'Allalaaditud failid on kustutatud';

  @override
  String get failedToDeleteFiles => 'Failide kustutamine ebaõnnestus';

  @override
  String get deleteFiles => 'Kustuta failid';

  @override
  String get director => 'DIREKTOR';

  @override
  String get starring => 'PEAOSADES';

  @override
  String get directors => 'REŽISSÖÖRID';

  @override
  String get writer => 'STSENARIST';

  @override
  String get writers => 'STSENARISTID';

  @override
  String get studio => 'STUUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count rohkem';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episoodid';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Jagu $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Peatükk $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lugu',
      one: '1 lugu',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peatükki',
      one: '1 peatükk',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Sündis $date';
  }

  @override
  String died(String date) {
    return 'Suri $date';
  }

  @override
  String age(int age) {
    return 'Vanus $age';
  }

  @override
  String get showLess => 'Näita vähem';

  @override
  String get readMore => 'Loe edasi';

  @override
  String get shuffle => 'Juhuesitus';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Esita kogu muusika juhuslikus järjekorras';

  @override
  String get carSignInPrompt => 'Logi telefonis Moonfini sisse';

  @override
  String get carServerUnreachable => 'Serveriga ei saa ühendust';

  @override
  String downloadsCount(int count) {
    return '$count allalaadimised';
  }

  @override
  String get perfectMatch => 'Ideaalne sobivus';

  @override
  String get aiTranslated => 'Tehisaru tõlgitud';

  @override
  String get machineTranslated => 'Masintõlgitud';

  @override
  String get hearingImpaired => 'Kuulmisvaeguste jaoks';

  @override
  String framerateFps(String rate) {
    return '$rate kaadrit/sek';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Kaug-alapealkiri $action nõuab selle kasutaja jaoks Jellyfin subtiitrite haldusõigust.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Seda üksust ei leitud serverist kaugalapealkirja $action jaoks.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Kaug-alapealkiri $action ebaõnnestus: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Kaug-alapealkiri $action ebaõnnestus (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '$action kaugsubtiitrite loomine ebaõnnestus.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'kõik allalaaditud jaod \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'kõik selle hooaja allalaaditud episoodid';

  @override
  String get stillWatching => 'Vaatad ikka veel?';

  @override
  String get unableToLoadTrailerStream => 'Treilerite voogu ei saa laadida.';

  @override
  String get trailerTimedOut => 'Haagis aegus laadimise ajal.';

  @override
  String get playbackFailedForTrailer =>
      'Selle treileri taasesitus ebaõnnestus.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Ülekandmine pole võrguühenduseta taasesituse ajal saadaval.';

  @override
  String castActionFailed(String label, String error) {
    return '$label toiming ebaõnnestus: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Ülekande helitugevuse määramine ebaõnnestus: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Juhtelemendid';
  }

  @override
  String get deviceVolume => 'Seadme helitugevus';

  @override
  String get unavailable => 'Pole saadaval';

  @override
  String get pause => 'Paus';

  @override
  String get syncPosition => 'Sünkroonimispositsioon';

  @override
  String stopCast(String label) {
    return 'Peata $label';
  }

  @override
  String get queueIsEmpty => 'Järjekord on tühi';

  @override
  String trackNumber(int number) {
    return 'Jälgi $number';
  }

  @override
  String get remotePlayback => 'Kaugesitus';

  @override
  String get castingToGoogleCast => 'Ülekandmine Google Casti';

  @override
  String get castingViaAirPlay => 'Ülekandmine AirPlay kaudu';

  @override
  String get castingViaDlna => 'Ülekandmine DLNA kaudu';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekundit';
  }

  @override
  String get longPressToUnlock => 'Avamiseks vajutage pikalt';

  @override
  String get off => 'Väljas';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automaatne';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Heli viivitus';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Subtiitrite viivitus';

  @override
  String get reset => 'Lähtesta';

  @override
  String get unknown => 'Tundmatu';

  @override
  String get playbackInformation => 'Taasesituse teave';

  @override
  String get showMpvStats => 'Näita mpv Statistikat (Shift+I)';

  @override
  String get hideMpvStats => 'Peida mpv Statistika (Shift+I)';

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
  String get playback => 'Taasesitus';

  @override
  String get playMethod => 'Mängumeetod';

  @override
  String get directPlay => 'Otsene mängimine';

  @override
  String get directStream => 'Otsene voog';

  @override
  String get transcoding => 'Ümberkodeerimine';

  @override
  String get transcodeReasons => 'Transkodeerimise põhjused';

  @override
  String get player => 'Pleier';

  @override
  String get container => 'Konteiner';

  @override
  String get bitrate => 'Bitikiirus';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolutsioon';

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
  String get track => 'Rada';

  @override
  String get channels => 'Kanalid';

  @override
  String get format => 'Vorming';

  @override
  String get external => 'Väline';

  @override
  String get embedded => 'Manustatud';

  @override
  String castSessionError(String protocol) {
    return '$protocol seansi viga';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Raamatu üksikasjade laadimine ebaõnnestus: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Rakendusesisene EPUB-i renderdamine pole sellel platvormil veel saadaval.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Seda vormingut (.$extension) ei saa veel rakendusesiseselt renderdada.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Manustatud dokumendi renderdamine pole sellel platvormil saadaval.';

  @override
  String get couldNotOpenExternalViewer => 'Välist vaatajat ei saanud avada.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Rakendusesisese lugeja avamine nurjus: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Järjehoidja on juba salvestatud aadressil $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Järjehoidja lisatud: $label';
  }

  @override
  String get noBookmarksYet =>
      'Järjehoidjaid pole veel.\nOma asukoha salvestamiseks puudutage lugemise ajal järjehoidja ikooni.';

  @override
  String get noTableOfContentsAvailable => 'Sisukorda pole saadaval';

  @override
  String pageLabel(int number) {
    return 'Leht $number';
  }

  @override
  String get position => 'positsioon';

  @override
  String get bookReader => 'Raamatulugeja';

  @override
  String formatExtension(String extension) {
    return 'Vorming: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% loetud';
  }

  @override
  String get updating => 'Värskendamine...';

  @override
  String get markUnread => 'Märgi mitteloetuks';

  @override
  String get markAsRead => 'Märgi loetuks';

  @override
  String get reloadReader => 'Laadige lugeja uuesti';

  @override
  String get noPagesFound => 'Ühtegi lehte ei leitud.';

  @override
  String get failedToDecodePageImage => 'Lehepildi dekodeerimine ebaõnnestus.';

  @override
  String resetZoom(String zoom) {
    return 'Lähtesta suum (${zoom}x)';
  }

  @override
  String get singlePage => 'Üks leht';

  @override
  String get twoPageSpread => 'Kaheleheküljeline levi';

  @override
  String get addBookmark => 'Lisa järjehoidja';

  @override
  String get bookmarksEllipsis => 'Järjehoidjad...';

  @override
  String get markedAsRead => 'Märgitud loetuks';

  @override
  String get markedAsUnread => 'Märgitud lugemata';

  @override
  String failedToUpdateReadState(String error) {
    return 'Lugemisoleku värskendamine ebaõnnestus: $error';
  }

  @override
  String get themeSystem => 'Teema: Süsteem';

  @override
  String get themeLight => 'Teema: Valgus';

  @override
  String get themeDark => 'Teema: tume';

  @override
  String get themeSepia => 'Teema: Seepia';

  @override
  String get invertColorsFixedLayout =>
      'Inverteeri värvid (fikseeritud paigutus)';

  @override
  String get invertColorsPdf => 'Inverteeri värvid (PDF)';

  @override
  String get preparingInAppReader =>
      'Rakendusesisese lugeja ettevalmistamine...';

  @override
  String get pdfDataNotAvailable => 'PDF-andmed pole saadaval.';

  @override
  String get readerFallbackModeActive => 'Lugeja varurežiim aktiivne';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'See platvorm ei saa majutada $extension failide manustatud dokumendimootorit.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Kasutage Reload Readerit pärast toetatud platvormi sihtmärgile (Android, iOS, macOS) lülitumist.';

  @override
  String get openExternally => 'Avage väliselt';

  @override
  String get noEpubChaptersFound => 'EPUB-i peatükke ei leitud.';

  @override
  String get readerNotReady => 'Lugeja pole valmis.';

  @override
  String get seriesRecordings => 'Sarja salvestused';

  @override
  String get now => 'Nüüd';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Uudised';

  @override
  String get kids => 'Lapsed';

  @override
  String get premiere => 'Esietendus';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Juhend ajaskaala';

  @override
  String failedToLoadGuide(String error) {
    return 'Juhendi laadimine ebaõnnestus: $error';
  }

  @override
  String get noChannelsFound => 'Ühtegi kanalit ei leitud';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'OTSE';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Järgmisena: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min jäänud';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours t jäänud';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours t $minutes min jäänud';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Lemmikkanalitest eemaldatud';

  @override
  String get addedToFavoriteChannels => 'Lisatud lemmikkanalitesse';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Lemmikkanali värskendamine ebaõnnestus';

  @override
  String get unfavoriteChannel => 'Lemmik kanal';

  @override
  String get favoriteChannel => 'Lemmikkanal';

  @override
  String get record => 'Salvesta';

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
  String get cancelRecordingAction => 'Tühista salvestamine';

  @override
  String get programSetToRecord => 'Programm on seadistatud salvestama';

  @override
  String get recordingCancelled => 'Salvestamine tühistati';

  @override
  String get unableToCreateRecording => 'Salvestist ei saa luua';

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
  String get watch => 'Vaata';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Sule';

  @override
  String failedToPlayChannel(String name) {
    return '$name esitamine nurjus';
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
  String get failedToLoadRecordings => 'Salvestiste laadimine ebaõnnestus';

  @override
  String get scheduledInNext24Hours => 'Plaanitud järgmise 24 tunni jooksul';

  @override
  String get recentRecordings => 'Viimased salvestused';

  @override
  String get tvSeries => 'Telesari';

  @override
  String get failedToLoadSchedule => 'Ajakava laadimine ebaõnnestus';

  @override
  String get noScheduledRecordings => 'Ajastatud salvestusi pole';

  @override
  String get cancelRecording => 'Kas katkestada salvestamine?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Kas tühistada \"$name\" ajastatud salvestamine?';
  }

  @override
  String get no => 'Ei';

  @override
  String get yesCancel => 'Jah, tühista';

  @override
  String get failedToCancelRecording => 'Salvestamise tühistamine ebaõnnestus';

  @override
  String get failedToLoadSeriesRecordings =>
      'Sarja salvestiste laadimine ebaõnnestus';

  @override
  String get noSeriesRecordings => 'Sarja salvestusi pole';

  @override
  String get cancelSeriesRecording => 'Tühista seeria salvestamine';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Kas katkestada seeria salvestamine?';

  @override
  String stopRecordingName(String name) {
    return 'Kas peatada \"$name\" salvestamine?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Sarja salvestamise tühistamine ebaõnnestus';

  @override
  String get searchThisLibrary => 'Otsi sellest raamatukogust...';

  @override
  String get searchEllipsis => 'Otsi...';

  @override
  String noResultsForQuery(String query) {
    return 'Päringule \"$query\" ei leitud tulemusi';
  }

  @override
  String searchFailedError(String error) {
    return 'Otsing ebaõnnestus: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerri konto tüüp';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Kohalik';

  @override
  String get savedMedia => 'Salvestatud meedia';

  @override
  String get tvShows => 'Telesaated';

  @override
  String get music => 'Muusika';

  @override
  String get musicAlbums => 'Muusikaalbumid';

  @override
  String get noMediaInFilter => 'Selles filtris pole meediat';

  @override
  String get noDownloadedMediaYet => 'Allalaaditud meediat pole veel';

  @override
  String get browseLibrary => 'Sirvige raamatukogu';

  @override
  String get deleteDownload => 'Kustuta allalaadimine';

  @override
  String removeItemAndFiles(String name) {
    return 'Kas eemaldada \"$name\" ja selle failid?';
  }

  @override
  String tracksCount(int count) {
    return '$count lugusid';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Esita albumit';

  @override
  String failedToLoadAlbum(String error) {
    return 'Albumi laadimine ebaõnnestus: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name allalaaditud lugusid ei leitud.';
  }

  @override
  String get season => 'Hooaeg';

  @override
  String get errorLoadingEpisodes => 'Viga episoodide laadimisel';

  @override
  String get noDownloadedEpisodes => 'Allalaaditud episoode pole';

  @override
  String get deleteEpisode => 'Kustuta episood';

  @override
  String removeName(String name) {
    return 'Kas eemaldada \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'H$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Jagu $number';
  }

  @override
  String get seriesNotFound => 'Sarja ei leitud';

  @override
  String get errorLoadingSeries => 'Seeria laadimisel tekkis viga';

  @override
  String get downloadedEpisodes => 'Allalaaditud episoodid';

  @override
  String seasonNumber(int number) {
    return 'Hooaeg $number';
  }

  @override
  String seasonChip(int number) {
    return 'H$number';
  }

  @override
  String get specials => 'Eripakkumised';

  @override
  String get deleteSeason => 'Kustuta hooaeg';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Kas kustutada kõik allalaaditud jaod kaustas $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoodi',
      one: '1 episood',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Salvestusruumi haldamine';

  @override
  String get storageBreakdown => 'Salvestusala jaotus';

  @override
  String get downloadedItems => 'Allalaaditud üksused';

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
  String get storageLimit => 'Salvestuspiirang';

  @override
  String get noLimit => 'Piiramata';

  @override
  String get deleteAllDownloads => 'Kustuta kõik allalaadimised';

  @override
  String get deleteAllDownloadsWarning =>
      'See eemaldab kõik allalaaditud meediumifailid ja seda ei saa tagasi võtta.';

  @override
  String get deleteAll => 'Kustuta kõik';

  @override
  String get deleteSelected => 'Kustuta valitud';

  @override
  String deleteSelectedCount(int count) {
    return 'Kas kustutada $count allalaaditud üksused?';
  }

  @override
  String get musicAndAudiobooks => 'Muusika ja heliraamatud';

  @override
  String get images => 'Pildid';

  @override
  String get database => 'Andmebaas';

  @override
  String ofStorageLimit(String limit) {
    return '$limit piirangust';
  }

  @override
  String get settings => 'Seaded';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentimine';

  @override
  String get autoLoginServerManagement =>
      'Automaatne sisselogimine, serverihaldus';

  @override
  String get pinCode => 'PIN-kood';

  @override
  String get setUpPinCodeProtection => 'Seadistage PIN-koodi kaitse';

  @override
  String get parentalControls => 'Vanemlik kontroll';

  @override
  String get contentRatingRestrictions => 'Sisu reitingupiirangud';

  @override
  String get bitRateResolutionBehavior => 'Bitikiirus, eraldusvõime, käitumine';

  @override
  String get languageSizeAppearance => 'Keel, suurus, välimus';

  @override
  String get qualityStorage => 'Kvaliteet, ladustamine';

  @override
  String get mediaRequestIntegration => 'Meediumitaotluste integreerimine';

  @override
  String get switchServer => 'Vaheta serverit';

  @override
  String get signOut => 'Logi välja';

  @override
  String get versionLicenses => 'Versioon, litsentsid';

  @override
  String get account => 'konto';

  @override
  String get signInAndSecurity => 'Sisselogimine ja turvalisus';

  @override
  String get administration => 'Administreerimine';

  @override
  String get serverSettingsUsersLibraries =>
      'Serveri seaded, kasutajad, teegid';

  @override
  String get customization => 'Kohandamine';

  @override
  String get themeAndLayout => 'Teema ja paigutus';

  @override
  String get videoAndSubtitles => 'Video ja subtiitrid';

  @override
  String get pluginAndRequests => 'Plugin ja taotlused';

  @override
  String get customizeAccountPlaybackInterface =>
      'Kohandage konto, taasesituse ja liidese käitumist';

  @override
  String optionsCount(int count) {
    return '$count valikut';
  }

  @override
  String get themeAndAppearance => 'Teema ja välimus';

  @override
  String get focusBorderColor => 'Fookuse äärise värv';

  @override
  String get watchedIndicators => 'Vaadatud indikaatorid';

  @override
  String get always => 'Alati';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Peida jälgimata';

  @override
  String get episodesOnly => 'Ainult episoodid';

  @override
  String get never => 'Mitte kunagi';

  @override
  String get focusExpansionAnimation => 'Fookuse laiendamise animatsioon';

  @override
  String get desktopUiScale => 'Töölaua kasutajaliidese skaala';

  @override
  String get scaleFocusedCards =>
      'Skaalake fokuseeritud või hõljutatud kaarte ja paanid';

  @override
  String get seriesThumbnails => 'Sarja pisipildid';

  @override
  String get seriesThumbnailsDescription =>
      'Ainult jaod: kasutage seeriakujundust, mis sobib iga rea ​​kujutise tüübiga';

  @override
  String get homeRowInfoOverlay => 'Avalehe rea teabe ülekate';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Kuva koduridade sirvimisel pealkiri ja metaandmed';

  @override
  String get clockDisplay => 'Kella ekraan';

  @override
  String get inMenus => 'Menüüdes';

  @override
  String get inVideo => 'Videos';

  @override
  String get seasonalEffects => 'Hooajalised efektid';

  @override
  String get seasonalEffectsDescription =>
      'Visuaalsed efektid ja hooajalised kaunistused';

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
  String get snow => 'Lumi';

  @override
  String get fireworks => 'Ilutulestik';

  @override
  String get confetti => 'Konfettid';

  @override
  String get fallingLeaves => 'Langevad lehed';

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
  String get themeMusic => 'Teema Muusika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Esitage teemamuusikat üksikasjade lehtedel';

  @override
  String get themeMusicVolume => 'Teema muusika helitugevus';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Teemamuusika koduridadel';

  @override
  String get playWhenBrowsingHomeScreen => 'Esita avakuva sirvimisel';

  @override
  String get loopThemeMusic => 'Korda tunnusmuusikat';

  @override
  String get loopThemeMusicSubtitle => 'Korda lugu ühekordse esitamise asemel';

  @override
  String get detailsBackgroundBlur => 'Üksikasjad Tausta hägu';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Sirvimise taustahägu';

  @override
  String get maxStreamingBitrate => 'Maksimaalne voogesituse bitikiirus';

  @override
  String get maxResolution => 'Maksimaalne eraldusvõime';

  @override
  String get playerZoomMode => 'Mängija suumirežiim';

  @override
  String get settingsScrollWheelAction => 'Hiire kerimisratas';

  @override
  String get settingsScrollWheelActionDescription =>
      'Vali, mida hiireratta kerimine video kohal esituse ajal teeb.';

  @override
  String get scrollWheelActionOff => 'Väljas';

  @override
  String get scrollWheelActionSeek => 'Kerimine (edasi / tagasi)';

  @override
  String get scrollWheelActionVolume => 'Helitugevus';

  @override
  String get playerTooltipVolume => 'Helitugevus';

  @override
  String get fit => 'Sobivad';

  @override
  String get autoCrop => 'Automaatne kärpimine';

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
  String get stretch => 'Venitada';

  @override
  String get refreshRateSwitching => 'Värskendussageduse vahetamine';

  @override
  String get disabled => 'Keelatud';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Skaala teleris';

  @override
  String get scaleOnDevice => 'Skaala seadmel';

  @override
  String get trickPlay => 'Trikimäng';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Kuva otsimisel eelvaate pisipildid';

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
  String get showDescriptionOnPause => 'Kuva kirjeldus pausil';

  @override
  String get dimVideoShowOverview =>
      'Hämardage video ja kuvage ülevaateteksti peatamise ajal';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD lukustusnupp';

  @override
  String get osdLockButtonDescription =>
      'Kuva lukustusnupp, mis blokeerib puutesisendi, kuni seda pikalt vajutatakse';

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
  String get audioBehavior => 'Heli käitumine';

  @override
  String get downmixToStereo => 'Mikserda alla stereoks';

  @override
  String get defaultAudioLanguage => 'Heli vaikekeel';

  @override
  String get fallbackAudioLanguage => 'Varuheli keel';

  @override
  String get preferDefaultAudioTrack => 'Eelista vaikimisi helirada';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Eelista originaalhelirada lokaliseeritud dublaažile.';

  @override
  String get preferAudioDescription => 'Eelista kirjeldustõlke radu';

  @override
  String get preferAudioDescriptionDescription =>
      'Eelista kirjeldustõlke radu tavaliste radade asemel.';

  @override
  String get autoServerDefault => 'Automaatne (serveri vaikeseade)';

  @override
  String get english => 'inglise keel';

  @override
  String get spanish => 'hispaania keel';

  @override
  String get french => 'prantsuse keel';

  @override
  String get german => 'saksa keel';

  @override
  String get italian => 'itaalia keel';

  @override
  String get portuguese => 'portugali keel';

  @override
  String get japanese => 'Jaapani';

  @override
  String get korean => 'korea keel';

  @override
  String get chinese => 'hiina keel';

  @override
  String get russian => 'vene keel';

  @override
  String get arabic => 'araabia keel';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'hollandi keel';

  @override
  String get swedish => 'rootsi keel';

  @override
  String get norwegian => 'norra keel';

  @override
  String get danish => 'taani keel';

  @override
  String get finnish => 'soome keel';

  @override
  String get polish => 'poola keel';

  @override
  String get ac3Passthrough => 'AC3 läbilaskevõime';

  @override
  String get dtsPassthrough => 'DTS läbipääs';

  @override
  String get trueHdSupport => 'TrueHD tugi';

  @override
  String get enableDtsPassthrough =>
      'Bitivoo DTS-heli ainult AVR-ile; nõuab vastuvõtja tuge ja DTS-i allika rada';

  @override
  String get settingsAudioFallbackCodec => 'Heli varukoodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Vali sihtvorming, millesse mitmekanaliline heli transkodeeritakse, kui lähtevoogu ei saa otse esitada ega läbi lasta.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automaatne tuvastus\n(soovitatav)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(vaikimisi)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ainult stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(tõhus)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(kadudeta)';

  @override
  String get settingsMaxAudioChannels => 'Helikanalite maksimum';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Määra oma helisüsteemi kanalite maksimum. Seda piiri ületavad mitmekanalilised vood miksitakse alla või transkodeeritakse.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automaatne tuvastus\n(riistvara vaikeväärtus)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 ruumiline heli';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofooniline';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 ruumiline heli';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 ruumiline heli';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 ruumiline heli';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 ruumiline heli';

  @override
  String get settingsAudioPassthroughAdvanced => 'Läbimine (täpsem)';

  @override
  String get settingsAudioCodecPassthrough => 'Koodeki läbilase';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Lubage ainult vormingud, mida teie AVR- või HDMI-pistikupesa toetab.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 läbipääs';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core läbilase';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA läbilaskevõime';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD läbilase';

  @override
  String get settingsDetectedAudioCapabilities => 'Tuvastatud helivõimalused';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Käitusaja võimekuse hetktõmmis pole veel saadaval.';

  @override
  String get settingsAudioRouteLabel => 'Marsruut';

  @override
  String get settingsAudioDecodeLabel => 'Dekodeerida';

  @override
  String get settingsAudioPassthroughLabel => 'Läbipääs';

  @override
  String get settingsAudioHdRoute => 'HD heli marsruut';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Kõlar';

  @override
  String get settingsAudioRouteHeadphones => 'Kõrvaklapid';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get nightMode => 'Öörežiim';

  @override
  String get compressDynamicRange => 'Dünaamilise ulatuse tihendamine';

  @override
  String get advancedMpv => 'Täiustatud mpv';

  @override
  String get enableCustomMpvConf => 'Luba kohandatud mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Enne taasesituse alustamist rakendage kasutaja määratud mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Ebaturvalised mpv täpsemad valikud';

  @override
  String get unsafeMpvOptionsDescription =>
      'Lubage laiem mpv-valikute komplekt. Võib rikkuda taasesituskäitumist.';

  @override
  String get hardwareDecoding => 'Riistvara dekodeerimine';

  @override
  String get hardwareDecodingSubtitle =>
      'Võib parandada jõudlust, kuid võib mõnes seadmes põhjustada taasesitusprobleeme.';

  @override
  String get nextUpAndQueuing => 'Järgmine üles ja järjekord';

  @override
  String get nextUpDisplay => 'Järgmine ekraan';

  @override
  String get extended => 'Laiendatud';

  @override
  String get minimal => 'Minimaalne';

  @override
  String get nextUpTimeout => '„Järgmisena“ ooteaeg';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Meedia järjekord';

  @override
  String get autoQueueNextEpisodes =>
      'Pange järgmised osad automaatselt järjekorda';

  @override
  String get stillWatchingPrompt => 'Vaatan endiselt viipa';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Pärast $episodes episoode / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Jätka ja jäta vahele';

  @override
  String get resumeRewind => 'Jätka tagasikerimist';

  @override
  String get unpauseRewind => 'Tühista tagasikerimise paus';

  @override
  String get fiveSeconds => '5 sekundit';

  @override
  String get tenSeconds => '10 sekundit';

  @override
  String get fifteenSeconds => '15 sekundit';

  @override
  String get thirtySeconds => '30 sekundit';

  @override
  String get skipBackLength => 'Jäta vahele pikkus';

  @override
  String get skipForwardLength => 'Jätke pikkus edasi';

  @override
  String get customMpvConfPath => 'Kohandatud mpv.conf tee';

  @override
  String get notSetMpvConf =>
      'Pole määratud. Moonfin proovib rakenduste/andmete kaustades vaikefaili mpv.conf.';

  @override
  String get selectMpvConf => 'Valige mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stiiliseaded (suurus, värv, nihe) kehtivad tekstipõhistele subtiitritele (SRT, VTT, TTML). ASS/SSA subtiitrid kasutavad oma manustatud stiili, välja arvatud juhul, kui \"ASS/SSA Direct Play\" on välja lülitatud. Bitmap-subtiitreid (PGS, DVB, VobSub) ei saa ümber kujundada.';

  @override
  String get defaultSubtitleLanguage => 'Subtiitrite vaikekeel';

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
  String get defaultToNoSubtitles => 'Vaikimisi Subtiitreid pole';

  @override
  String get turnOffSubtitlesByDefault => 'Lülitage subtiitrid vaikimisi välja';

  @override
  String get subtitleSize => 'Subtiitrite suurus';

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
  String get textFillColor => 'Teksti täitevärv';

  @override
  String get backgroundColor => 'Taustavärv';

  @override
  String get textStrokeColor => 'Teksti joone värv';

  @override
  String get subtitleCustomization => 'Subtiitrite kohandamine';

  @override
  String get subtitleCustomizationDescription =>
      'Kohandage subtiitrite välimust';

  @override
  String get subtitleMode => 'Subtiitrite režiim';

  @override
  String get subtitleModeFlagged => 'Märgistatud';

  @override
  String get subtitleModeAlways => 'Alati';

  @override
  String get subtitleModeForeign => 'Võõrkeelsed';

  @override
  String get subtitleModeForced => 'Sunnitud';

  @override
  String get subtitleModeFlaggedDescription =>
      'Esitab rajad, mis on meediafaili metaandmetes märgitud „vaikimisi“ või „sunnitud“ radadeks.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Laadib ja kuvab subtiitrid automaatselt iga kord, kui video algab.';

  @override
  String get subtitleModeForeignDescription =>
      'Lülitab subtiitrid automaatselt sisse, kui vaikimisi helirada on võõrkeelne.';

  @override
  String get subtitleModeForcedDescription =>
      'Laadib ainult need subtiitrid, mis on selgesõnaliselt märgitud sunnitud lipuga.';

  @override
  String get subtitleModeNoneDescription =>
      'Keelab subtiitrite automaatse laadimise täielikult.';

  @override
  String get fallbackSubtitleLanguage => 'Varusubtiitrite keel';

  @override
  String get subtitleStream => 'Subtiitrivoog';

  @override
  String get subtitlePreviewText => 'Kiire pruunrebane hüppab üle laisa koera';

  @override
  String get verticalOffset => 'Vertikaalne nihe';

  @override
  String get pgsDirectPlay => 'PGS otsemäng';

  @override
  String get directPlayPgsSubtitles => 'Otsesesitus PGS-i subtiitritega';

  @override
  String get assSsaDirectPlay => 'ASS/SSA otsemäng';

  @override
  String get directPlayAssSsaSubtitles => 'Otsesesitus ASS/SSA subtiitritega';

  @override
  String get white => 'Valge';

  @override
  String get black => 'Must';

  @override
  String get yellow => 'Kollane';

  @override
  String get green => 'Roheline';

  @override
  String get cyan => 'Tsüaan';

  @override
  String get red => 'Punane';

  @override
  String get transparent => 'Läbipaistev';

  @override
  String get semiTransparentBlack => 'Poolläbipaistev must';

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
  String get global => 'Globaalne';

  @override
  String get desktop => 'Töölaud';

  @override
  String get mobile => 'Mobiilne';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Laaditi $profile profiili seaded.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile profiili seadete laadimine ebaõnnestus.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Kohalikud seaded sünkrooniti $profile profiiliga.';
  }

  @override
  String get syncing => 'Sünkroonimine...';

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
  String get profileSyncHidden => 'Profiili sünkroonimine on peidetud';

  @override
  String get enablePluginSyncDescription =>
      'Profiili juhtelementide kuvamiseks lubage pistikprogrammi seadetes serveri pistikprogrammi sünkroonimine.';

  @override
  String get quality => 'Kvaliteet';

  @override
  String get defaultDownloadQuality => 'Allalaadimise vaikekvaliteet';

  @override
  String get network => 'Võrk';

  @override
  String get wifiOnlyDownloads => 'Allalaadimised ainult WiFi kaudu';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Näita allalaadimisi serveris';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Luba serveri administraatoril näha juhtpaneelil sinu transkodeeritud allalaadimisi';

  @override
  String get onlyDownloadOnWifi =>
      'Laadige alla ainult siis, kui see on ühendatud WiFi-ga';

  @override
  String get storage => 'Säilitamine';

  @override
  String get storageUsed => 'Ladustamine Kasutatud';

  @override
  String get manage => 'Halda';

  @override
  String get calculating => 'Arvutamine...';

  @override
  String get downloadLocation => 'Laadi alla asukoht';

  @override
  String get defaultLabel => 'Vaikimisi';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Salvestage kausta Allalaadimised';

  @override
  String get downloadsVisibleToOtherApps =>
      'Allalaadimised/Moonfin – nähtav teistele rakendustele';

  @override
  String get dangerZone => 'Ohutu tsoon';

  @override
  String get clearAllDownloads => 'Kustuta kõik allalaadimised';

  @override
  String get original => 'Originaal';

  @override
  String get changeDownloadLocation => 'Muutke allalaadimise asukohta';

  @override
  String get changeDownloadLocationDescription =>
      'Uued allalaadimised salvestatakse valitud kausta. Olemasolevad allalaadimised jäävad oma praegusesse asukohta ja neid saab hallata Salvestusruumi seadetes.';

  @override
  String get confirm => 'Kinnita';

  @override
  String get cannotWriteToFolder =>
      'Valitud kausta ei saa kirjutada. Valige mõni muu asukoht või andke talletusload.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Kas salvestada allalaadimiste kausta?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Allalaaditud meedium salvestatakse teie seadme kausta Allalaadimised/Moonfin. Need failid on nähtavad teistele rakendustele, nagu teie galerii või muusikapleier.\n\nOlemasolevad allalaadimised jäävad oma praegusesse asukohta.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Luba';

  @override
  String get clearAllDownloadsWarning =>
      'See kustutab kõik allalaaditud meediumid ja seda ei saa tagasi võtta.';

  @override
  String get clearAll => 'Kustuta kõik';

  @override
  String get navigationStyle => 'Navigeerimisstiil';

  @override
  String get topBar => 'Ülemine riba';

  @override
  String get leftSidebar => 'Vasak külgriba';

  @override
  String get showShuffleButton => 'Näita juhujuhtimisnuppu';

  @override
  String get showGenresButton => 'Žanrite kuvamise nupp';

  @override
  String get showFavoritesButton => 'Kuva lemmikute nupp';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Näita teeke tööriistaribal';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Näita navigeerimisriba silte alati';

  @override
  String get showSeerrButton => 'Näita Seerri nuppu';

  @override
  String get navbarOpacity => 'Navbari läbipaistmatus';

  @override
  String get navbarColor => 'Navbari värv';

  @override
  String get gray => 'Hall';

  @override
  String get darkBlue => 'Tumesinine';

  @override
  String get purple => 'Lilla';

  @override
  String get teal => 'Sinine';

  @override
  String get navy => 'Merevägi';

  @override
  String get charcoal => 'Süsi';

  @override
  String get brown => 'Pruun';

  @override
  String get darkRed => 'Tumepunane';

  @override
  String get darkGreen => 'Tumeroheline';

  @override
  String get slate => 'Kiltkivi';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Raamatukogu väljapanek';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Pisipilt';

  @override
  String get bannerLabel => 'Bänner';

  @override
  String get overridePerLibrarySettings => 'Alista raamatukogupõhised sätted';

  @override
  String get applyImageTypeToAllLibraries =>
      'Rakenda pilditüüp kõikidele teekidele';

  @override
  String get multiServerLibraries => 'Mitme serveriga raamatukogud';

  @override
  String get showLibrariesFromAllServers =>
      'Kuva kõigi ühendatud serverite teegid';

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
  String get groupItemsIntoCollections => 'Rühmita üksused kollektsioonidesse';

  @override
  String get hideCollectionAssociatedItems =>
      'Peida kollektsiooniga seotud üksused kogude sirvimisel';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'Kogu rühmitamise teade';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Selle seade kasutamiseks veendu, et Jellyfini või Emby serveris on sinu kogu kuvamisseadetes lubatud „Rühmita filmid kollektsioonidesse“ ja/või „Rühmita saated kollektsioonidesse“.';

  @override
  String get libraryVisibility => 'Raamatukogu nähtavus';

  @override
  String get libraryVisibilityDescription =>
      'Avalehe nähtavuse sisse- ja väljalülitamine teegi kaupa. Muudatuste jõustumiseks taaskäivitage Moonfin.';

  @override
  String get showInNavigation => 'Kuva navigeerimisel';

  @override
  String get showInLatestMedia => 'Näita uusimas meedias';

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
  String get sourceLibraries => 'Allikate raamatukogud';

  @override
  String get sourceCollections => 'Allikakogud';

  @override
  String get excludedGenres => 'Välistatud žanrid';

  @override
  String get selectAll => 'Valige Kõik';

  @override
  String itemsSelected(int count) {
    return '$count valitud';
  }

  @override
  String get mediaBar => 'Meediumiriba';

  @override
  String get mediaSources => 'Meedia allikad';

  @override
  String get behavior => 'Käitumine';

  @override
  String get seconds => 'sekundit';

  @override
  String get mediaBarMode => 'Meediumiriba stiil';

  @override
  String get mediaBarModeDescription =>
      'Valige erinevate meediariba stiilide vahel või lülitage meediariba välja';

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
  String get mediaBarModeOff => 'Väljas';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Luba meediariba';

  @override
  String get showFeaturedContentSlideshow =>
      'Kuva esiletõstetud sisu slaidiseanss kodus';

  @override
  String get contentType => 'Sisu tüüp';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmid ja telesaated';

  @override
  String get moviesOnly => 'Ainult filmid';

  @override
  String get tvShowsOnly => 'Ainult telesaated';

  @override
  String get itemCount => 'Artiklite arv';

  @override
  String get noneSelected => 'Ühtegi pole valitud';

  @override
  String get noneExcluded => 'Pole välistatud';

  @override
  String get autoAdvance => 'Automaatne edasiliikumine';

  @override
  String get autoAdvanceSlides => 'Liikub automaatselt järgmisele slaidile';

  @override
  String get autoAdvanceInterval => 'Automaatse edasiliikumise intervall';

  @override
  String get trailerPreview => 'Treileri eelvaade';

  @override
  String get autoPlayTrailers =>
      'Esitage treilereid automaatselt meediaribal 3 sekundi pärast';

  @override
  String get trailerAudio => 'Treileri heli';

  @override
  String get enableTrailerAudio => 'Luba treilerite heli meediaribal';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Episoodi eelvaade';

  @override
  String get mediaPreview => 'Meedia eelvaade';

  @override
  String get episodePreviewDescription =>
      'Esitage teravustatud, hõljutatud või pikalt vajutatud kaartidel 30-sekundiline rea eelvaade';

  @override
  String get mediaPreviewDescription =>
      'Esitage teravustatud, hõljutatud või pikalt vajutatud kaartidel 30-sekundiline rea eelvaade';

  @override
  String get previewAudio => 'Heli eelvaade';

  @override
  String get enablePreviewAudio => 'Lubage treileri ja jao eelvaate jaoks heli';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Uusim meedia';

  @override
  String get recentlyReleased => 'Hiljuti välja antud';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Minu meedia';

  @override
  String get myMediaSmall => 'Minu meedia (väike)';

  @override
  String get continueWatching => 'Jätkake vaatamist';

  @override
  String get resumeAudio => 'Jätka heli';

  @override
  String get resumeBooks => 'Jätka raamatuid';

  @override
  String get activeRecordings => 'Aktiivsed salvestused';

  @override
  String get playlists => 'Esitusloendid';

  @override
  String get liveTV => 'Otse-TV';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Lähtestage vaikeseadetele';

  @override
  String get homeRowPosterSize => 'Kodurea plakati suurus';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigureerige iga lubatud kodurea pilditüüp';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Ühendage Jätka vaatamist ja Edasi';

  @override
  String get combineBothRows => 'Ühendage mõlemad read üheks koduosaks';

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
  String get fullScreenRows => 'Laiendatud avaekraani read';

  @override
  String get fullScreenRowsDescription =>
      'Näita korraga ainult üht avaekraani rida';

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
  String get perRowSettings => 'Reapõhised sätted';

  @override
  String get autoLogin => 'Automaatne sisselogimine';

  @override
  String get lastUser => 'Viimane kasutaja';

  @override
  String get currentUser => 'Praegune kasutaja';

  @override
  String get alwaysAuthenticate => 'Autentige alati';

  @override
  String get requirePasswordWithToken =>
      'Nõua parooli isegi salvestatud märgiga';

  @override
  String get confirmExit => 'Kinnitage väljumine';

  @override
  String get showConfirmationBeforeExiting => 'Enne väljumist näita kinnitust';

  @override
  String get blockContentWithRatings => 'Blokeeri sisu järgmiste hinnangutega:';

  @override
  String get noContentRatingsFound =>
      'Sellest serverist ei leitud veel ühtegi sisu reitingut.';

  @override
  String get couldNotLoadServerRatings =>
      'Serveri hinnanguid ei saanud laadida. Kuvatakse ainult salvestatud hinnangud.';

  @override
  String get couldNotRefreshRatings =>
      'Hinnanguid serverist ei saanud värskendada. Kuvatakse salvestatud hinnangud.';

  @override
  String get enablePinCode => 'PIN-koodi lubamine';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Nõua oma kontole juurdepääsuks PIN-koodi';

  @override
  String get changePin => 'Muuda PIN-koodi';

  @override
  String get setNewPinCode => 'Määra uus PIN-kood';

  @override
  String get removePin => 'Eemaldage PIN-kood';

  @override
  String get removePinProtection => 'Eemaldage PIN-koodi kaitse';

  @override
  String get screensaver => 'Ekraanisäästja';

  @override
  String get inAppScreensaver => 'Rakendusesisene ekraanisäästja';

  @override
  String get enableBuiltInScreensaver => 'Lubage sisseehitatud ekraanisäästja';

  @override
  String get mode => 'Režiim';

  @override
  String get libraryArt => 'Raamatukogu Art';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Kell';

  @override
  String get timeout => 'Aegumine';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Hämardamise tase';

  @override
  String get maxAgeRating => 'Maksimaalne vanusepiirang';

  @override
  String get any => 'Ükskõik milline';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Nõua vanusepiirangut';

  @override
  String get onlyShowRatedContent => 'Kuva ainult hinnatud sisu';

  @override
  String get displayClockDuringScreensaver => 'Kuva kella ekraanisäästja ajal';

  @override
  String get clockModeStatic => 'Paigal';

  @override
  String get clockModeBouncing => 'Põrkuv';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (kriitikud)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (vaatajaskond)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakriitiline';

  @override
  String get metacriticUser => 'Metacritic (kasutaja)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Postkastd';

  @override
  String get myAnimeList => 'MinuAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Kogukonna hinnang';

  @override
  String get ratings => 'Hinnangud';

  @override
  String get additionalRatings => 'Täiendavad hinnangud';

  @override
  String get showMdbListAndTmdbRatings => 'Kuva MDBList ja TMDB reitingud';

  @override
  String get ratingLabels => 'Reitingusildid';

  @override
  String get showLabelsNextToIcons => 'Kuva sildid hinnanguikoonide kõrval';

  @override
  String get ratingBadges => 'Reitingumärgid';

  @override
  String get showDecorativeBadges =>
      'Kuvage hinnangute taga dekoratiivsed märgid';

  @override
  String get episodeRatings => 'Episoodide hinnangud';

  @override
  String get showRatingsOnEpisodes => 'Kuva üksikute osade hinnangud';

  @override
  String get ratingSources => 'Hinnanguallikad';

  @override
  String get ratingSourcesDescription =>
      'Lubage ja korraldage ümber kogu rakenduses kuvatavad reitinguallikad';

  @override
  String get pluginDetected => 'Tuvastati plugin';

  @override
  String get pluginNotDetected => 'Pluginat ei tuvastatud';

  @override
  String get pluginNotDetectedDescription =>
      'Serveri pistikprogrammi ei tuvastata praegu. Kohalikud seaded kasutavad endiselt oma salvestatud väärtusi või sisseehitatud vaikeseadeid.';

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
  String get recentRequests => 'Viimased taotlused';

  @override
  String get recentlyAdded => 'Hiljuti lisatud';

  @override
  String get trending => 'Trendikas';

  @override
  String get popularMovies => 'Populaarsed filmid';

  @override
  String get movieGenres => 'Filmižanrid';

  @override
  String get upcomingMovies => 'Tulevased filmid';

  @override
  String get studios => 'Stuudiod';

  @override
  String get popularSeries => 'Populaarne sari';

  @override
  String get seriesGenres => 'Sarja žanrid';

  @override
  String get upcomingSeries => 'Tulevane seeria';

  @override
  String get networks => 'Võrgud';

  @override
  String get tags => 'Sildid';

  @override
  String get genresAndTags => 'Žanrid ja Sildid';

  @override
  String get seerrDiscoveryRows => 'Seerri avastamisread';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Lähtestage read vaikeseadetele';

  @override
  String get enableSeerr => 'Luba Seerr';

  @override
  String get showSeerrInNavigation =>
      'Kuva Seerr navigeerimisribal (nõuab serveri pluginat)';

  @override
  String get seerrUnavailable =>
      'Pole saadaval, kuna serveri pistikprogrammi Seerr tugi on keelatud.';

  @override
  String get nsfwFilter => 'NSFW filter';

  @override
  String get hideAdultContent =>
      'Peida tulemustes täiskasvanutele mõeldud sisu';

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
  String get seerrNotificationsSection => 'Teavitused';

  @override
  String get seerrNotifyNewRequestsTitle => 'Uute taotluste teavitused';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Teavita mind, kui keegi esitab taotluse';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Taotluste uuendused';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Heaks kiidetud, tagasi lükatud ja kogusse lisatud';

  @override
  String get seerrNotifyIssuesTitle => 'Probleemide uuendused';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Uued probleemid, vastused ja lahendused';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Sisse logitud kui: $username';
  }

  @override
  String get discoverRows => 'Seerri avastamisleht';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Lubage read, mida soovite Seerri avalehel näha. Lohistage ümberjärjestamiseks. Kohandatud järjestus sünkroonitakse Moonbase\'iga.';

  @override
  String get discoverRowsDescription =>
      'Lubage read, mida soovite Seerri avalehel näha. Lohistage ümberjärjestamiseks. Kohandatud järjestus sünkroonitakse Moonbase\'iga.';

  @override
  String get enabled => 'Lubatud';

  @override
  String get hidden => 'Peidetud';

  @override
  String get aboutTitle => 'Umbes';

  @override
  String versionValue(String version) {
    return 'Versioon $version';
  }

  @override
  String get openSourceLicenses => 'Avatud lähtekoodiga litsentsid';

  @override
  String get sourceCode => 'Lähtekood';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Otsige värskendusi kohe';

  @override
  String get checksLatestDesktopRelease =>
      'Kontrollib selle platvormi uusimat töölauaversiooni';

  @override
  String get youAreUpToDate => 'Olete kursis.';

  @override
  String get couldNotCheckForUpdates =>
      'Värskendusi ei saanud praegu kontrollida.';

  @override
  String get noCompatibleUpdate =>
      'Selle platvormi jaoks ei leitud ühilduvat värskenduspaketti.';

  @override
  String get updateChecksNotSupported =>
      'Sellel platvormil värskenduste kontrollimist ei toetata.';

  @override
  String get updateNotificationsDisabled =>
      'Värskenduste märguanded on keelatud.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Palun oodake enne uuesti kontrollimist.';

  @override
  String get latestUpdateAlreadyShown => 'Viimane värskendus on juba näidatud.';

  @override
  String get updateAvailable => 'Värskendus saadaval.';

  @override
  String updateAvailableVersion(String version) {
    return 'Värskendus on saadaval: v$version';
  }

  @override
  String get updateNotifications => 'Teavituste värskendamine';

  @override
  String get showWhenUpdatesAvailable => 'Näita, kui värskendused on saadaval';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Saadaval';
  }

  @override
  String get readReleaseNotes => 'Lugege väljalaskemärkmeid';

  @override
  String get downloadingUpdate => 'Värskenduse allalaadimine...';

  @override
  String get updateDownloadFailed =>
      'Värskenduse allalaadimine ebaõnnestus. Palun proovi uuesti.';

  @override
  String get openReleasesPage => 'Avage väljaannete leht';

  @override
  String get navigation => 'Navigeerimine';

  @override
  String get watchedIndicatorsBackdrops => 'Vaadatud indikaatorid, taustad';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fookuse värv, vaadatud indikaatorid, taustad';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navibari stiil, tööriistariba nupud, välimus';

  @override
  String get featuredContentAppearance => 'Esiletõstetud sisu, välimus';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Pildipuhvri piirang';

  @override
  String get clearImageCache => 'Tühjenda pildipuhver';

  @override
  String get imageCacheCleared => 'Pildipuhver tühjendatud';

  @override
  String get clear => 'Tühjenda';

  @override
  String get browse => 'Sirvige';

  @override
  String get noResults => 'Tulemusi pole';

  @override
  String get seerrAvailableStatus => 'Saadaval';

  @override
  String get seerrRequestedStatus => 'Soovitud';

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
    return 'Allalaadimine · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importimine';

  @override
  String itemsCount(int count) {
    return '$count Üksused';
  }

  @override
  String get seerrSettings => 'Seerri seaded';

  @override
  String get requestMore => 'Küsi lisa';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Taotlus';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Tühista taotlus';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Mängi Moonfinis';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Taotleja $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Kinnita';

  @override
  String get declineAction => 'Keeldumine';

  @override
  String get similar => 'Sarnased';

  @override
  String get recommendations => 'Soovitused';

  @override
  String cancelRequestForTitle(String title) {
    return 'Kas tühistada \"$title\" taotlus?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Kas tühistada $count päringud \"$title\"?';
  }

  @override
  String get keep => 'Hoidke';

  @override
  String get itemNotFoundInLibrary => 'Üksust ei leitud teie Moonfini teegist';

  @override
  String get errorSearchingLibrary => 'Viga raamatukogu otsimisel';

  @override
  String budgetAmount(String amount) {
    return 'Eelarve: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Tulu: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Taotlus $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Esitage taotlus';

  @override
  String get allSeasons => 'Kõik aastaajad';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Täpsemad suvandid';

  @override
  String get noServiceServersConfigured =>
      'Ühtegi teenindusserverit pole konfigureeritud';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Kvaliteediprofiil';

  @override
  String get rootFolder => 'Juurkaust';

  @override
  String get showMore => 'Näita rohkem';

  @override
  String get appearances => 'Esinemised';

  @override
  String get crewSection => 'Meeskond';

  @override
  String ageValue(int age) {
    return 'vanus $age';
  }

  @override
  String get noRequests => 'Taotlusi pole';

  @override
  String get pendingStatus => 'Ootel';

  @override
  String get declinedStatus => 'Keeldutud';

  @override
  String get partiallyAvailable => 'Osaliselt saadaval';

  @override
  String get downloadingStatus => 'Allalaadimine';

  @override
  String get approvedStatus => 'Kinnitatud';

  @override
  String get notRequestedStatus => 'Pole nõutud';

  @override
  String get blocklistedStatus => 'Blokeeritud nimekirjas';

  @override
  String get deletedStatus => 'Kustutatud';

  @override
  String get failedStatus => 'Ebaõnnestus';

  @override
  String get processingStatus => 'Töötlemisel';

  @override
  String modifiedByName(String name) {
    return 'Muutja: $name';
  }

  @override
  String get completedStatus => 'Lõpetatud';

  @override
  String get requestErrorDuplicate => 'Seda pealkirja on juba taotletud';

  @override
  String get requestErrorQuota => 'Taotluste limiit on täis';

  @override
  String get requestErrorBlocklisted => 'See pealkiri on blokeerimisnimekirjas';

  @override
  String get requestErrorNoSeasons => 'Rohkem taotletavaid hooaegu pole';

  @override
  String get requestErrorPermission => 'Sul pole õigust seda taotlust esitada';

  @override
  String get seerrRequestsTitle => 'Taotlused';

  @override
  String get seerrIssuesTitle => 'Probleemid';

  @override
  String get sortNewest => 'Uusimad';

  @override
  String get sortLastModified => 'Viimati muudetud';

  @override
  String get noIssues => 'Probleeme pole';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Jäänud $remaining/$limit filmitaotlust';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Jäänud $remaining/$limit hooajataotlust';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Kuulub kollektsiooni: $name';
  }

  @override
  String get viewCollection => 'Vaata kollektsiooni';

  @override
  String get requestCollection => 'Taotle kollektsiooni';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmi · $available saadaval';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Taotle $count filmi';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Taotlemine $current/$total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Taotletud $count filmi';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Taotletud $ok/$total filmi';
  }

  @override
  String get collectionAllRequested =>
      'Kõik filmid on juba saadaval või taotletud';

  @override
  String get reportIssue => 'Teata probleemist';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Heli';

  @override
  String get whatsWrong => 'Mis on valesti?';

  @override
  String get allEpisodes => 'Kõik episoodid';

  @override
  String get episode => 'Episood';

  @override
  String get openStatus => 'Avatud';

  @override
  String get resolvedStatus => 'Lahendatud';

  @override
  String get resolveAction => 'Märgi lahendatuks';

  @override
  String get reopenAction => 'Ava uuesti';

  @override
  String reportedByName(String name) {
    return 'Teataja: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count kommentaari';
  }

  @override
  String get addComment => 'Lisa kommentaar';

  @override
  String get deleteIssueConfirm => 'Kas kustutada see probleem?';

  @override
  String get submitReport => 'Esita teade';

  @override
  String get tmdbScore => 'TMDB skoor';

  @override
  String get releaseDateLabel => 'Väljalaske kuupäev';

  @override
  String get firstAirDateLabel => 'Esimene eetri kuupäev';

  @override
  String get revenueLabel => 'Tulu';

  @override
  String get runtimeLabel => 'Kestus';

  @override
  String get budgetLabel => 'Eelarve';

  @override
  String get originalLanguageLabel => 'Algkeel';

  @override
  String get seasonsLabel => 'Hooajad';

  @override
  String get episodesLabel => 'Episoodid';

  @override
  String get access => 'Juurdepääs';

  @override
  String get add => 'Lisa';

  @override
  String get address => 'Aadress';

  @override
  String get analytics => 'Analüütika';

  @override
  String get catalog => 'Kataloog';

  @override
  String get content => 'Sisu';

  @override
  String get copy => 'Kopeeri';

  @override
  String get create => 'Loo';

  @override
  String get disable => 'Keela';

  @override
  String get done => 'Valmis';

  @override
  String get edit => 'Muuda';

  @override
  String get encoding => 'Kodeerimine';

  @override
  String get error => 'Viga';

  @override
  String get forward => 'Edasi';

  @override
  String get general => 'Üldine';

  @override
  String get go => 'Mine';

  @override
  String get install => 'Installige';

  @override
  String get installed => 'Paigaldatud';

  @override
  String get interval => 'Intervall';

  @override
  String get name => 'Nimi';

  @override
  String get networking => 'Võrgustiku loomine';

  @override
  String get next => 'Järgmine';

  @override
  String get path => 'Tee';

  @override
  String get paused => 'Peatatud';

  @override
  String get permissions => 'load';

  @override
  String get processing => 'Töötlemine';

  @override
  String get profile => 'Profiil';

  @override
  String get provider => 'Pakkuja';

  @override
  String get refresh => 'Värskenda';

  @override
  String get remote => 'Kaugjuhtimispult';

  @override
  String get rename => 'Nimeta ümber';

  @override
  String get revoke => 'Tühista';

  @override
  String get role => 'Roll';

  @override
  String get root => 'Juur';

  @override
  String get run => 'Jookse';

  @override
  String get search => 'Otsi';

  @override
  String get select => 'Valige';

  @override
  String get send => 'Saada';

  @override
  String get sessions => 'Seansid';

  @override
  String get set => 'Määra';

  @override
  String get status => 'Olek';

  @override
  String get stop => 'Peata';

  @override
  String get streaming => 'Voogesitus';

  @override
  String get time => 'Aeg';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Desinstalli';

  @override
  String get up => 'Üles';

  @override
  String get update => 'Värskenda';

  @override
  String get upload => 'Laadi üles';

  @override
  String get unmute => 'Tühista vaigistus';

  @override
  String get mute => 'Vaigista';

  @override
  String get branding => 'Bränding';

  @override
  String get adminDrawerDashboard => 'Armatuurlaud';

  @override
  String get adminDrawerAnalytics => 'Analüütika';

  @override
  String get adminDrawerSettings => 'Seaded';

  @override
  String get adminDrawerBranding => 'Bränding';

  @override
  String get adminDrawerUsers => 'Kasutajad';

  @override
  String get adminDrawerLibraries => 'Meediakogud';

  @override
  String get adminDrawerDisplay => 'Kuva';

  @override
  String get adminDrawerMetadata => 'Metaandmed';

  @override
  String get adminDrawerNfo => 'NFO seaded';

  @override
  String get adminDrawerTranscoding => 'Ümberkodeerimine';

  @override
  String get adminDrawerResume => 'Jätka';

  @override
  String get adminDrawerStreaming => 'Voogesitus';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Seadmed';

  @override
  String get adminDrawerActivity => 'Tegevus';

  @override
  String get adminDrawerNetworking => 'Võrgustiku loomine';

  @override
  String get adminDrawerApiKeys => 'API võtmed';

  @override
  String get adminDrawerBackups => 'Varukoopiad';

  @override
  String get adminDrawerLogs => 'Palgid';

  @override
  String get adminDrawerScheduledTasks => 'Plaanitud ülesanded';

  @override
  String get adminDrawerPlugins => 'Pluginad';

  @override
  String get adminDrawerRepositories => 'Hoidlad';

  @override
  String get adminDrawerLiveTv => 'Otse-TV';

  @override
  String get adminExitTooltip => 'Välju administraatorist';

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
  String get adminDashboardLoadFailed => 'Armatuurlaua laadimine ebaõnnestus';

  @override
  String get adminMediaOverview => 'Meedia ülevaade';

  @override
  String get adminMediaTotalsError =>
      'Serveri meediumikogumeid ei saanud laadida.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Kiire lugemine selle kohta, kui palju sisu selles serveris on.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Saadaval on pistikprogrammi värskendused: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Taaskäivitamist vajavad pistikprogrammid: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Ajastatud ülesanded ebaõnnestusid: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Meedia levitamine';

  @override
  String get analyticsVideoCodecs => 'Videokodekid';

  @override
  String get analyticsAudioCodecs => 'Heli kodekid';

  @override
  String get analyticsContainers => 'Konteinerid';

  @override
  String get analyticsTopGenres => 'Parimad žanrid';

  @override
  String get analyticsReleaseYears => 'Väljalaskeaastad';

  @override
  String get analyticsContentRatings => 'Sisu reitingud';

  @override
  String get analyticsRuntimeBuckets => 'Tööaja ämbrid';

  @override
  String get analyticsFileFormats => 'Failivormingud';

  @override
  String get analyticsNoData => 'Andmed pole saadaval.';

  @override
  String get adminServerInfo => 'Serveriteave';

  @override
  String get adminRestartPending => 'Taaskäivitamine Ootel';

  @override
  String get adminServerPaths => 'Serveriteed';

  @override
  String get adminServerActions => 'Serveri toimingud';

  @override
  String get adminRestartServer => 'Taaskäivitage server';

  @override
  String get adminShutdownServer => 'Serveri väljalülitamine';

  @override
  String get adminLibraryScanStarted => 'Teegi skannimine algas';

  @override
  String errorGeneric(String error) {
    return 'Viga: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Serveri taaskäivitamine on pooleli';

  @override
  String get adminServerRebootMessage =>
      'Serveri taaskäivitamine on pooleli, taaskäivitage Moonfin';

  @override
  String get adminActiveSessions => 'Aktiivsed seansid';

  @override
  String get adminSessionsLoadFailed => 'Seansside laadimine ebaõnnestus';

  @override
  String get adminNoActiveSessions => 'Aktiivseid seansse pole';

  @override
  String get adminRecentActivity => 'Hiljutine tegevus';

  @override
  String get adminNoRecentActivity => 'Hiljutine tegevus puudub';

  @override
  String adminCommandFailed(String error) {
    return 'Käsk ebaõnnestus: $error';
  }

  @override
  String get adminSendMessage => 'Saada sõnum';

  @override
  String get adminMessageTextHint => 'Sõnumi tekst';

  @override
  String get adminSetVolume => 'Helitugevuse määramine';

  @override
  String get sessionPrev => 'Eelmine';

  @override
  String get sessionRewind => 'Keri tagasi';

  @override
  String get sessionForward => 'Edasi';

  @override
  String get sessionNext => 'Järgmine';

  @override
  String get sessionVolumeDown => 'Heli –';

  @override
  String get sessionVolumeUp => 'Heli +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Mängib';

  @override
  String get volume => 'Helitugevus';

  @override
  String get actions => 'Tegevused';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Heli koodek';

  @override
  String get hwAccel => 'Riistvarakiirendus';

  @override
  String get completion => 'Lõpetamine';

  @override
  String get adminClearDates => 'Selged kuupäevad';

  @override
  String get adminActivitySeverityAll => 'Kõik raskusastmed';

  @override
  String get adminActivityDateRange => 'Ajavahemik';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Tegevuste logi laadimine ebaõnnestus: $error';
  }

  @override
  String get adminNoActivityEntries => 'Tegevuskirjeid pole';

  @override
  String get adminEditDeviceName => 'Redigeeri seadme nime';

  @override
  String get adminCustomName => 'Kohandatud nimi';

  @override
  String get adminDeviceNameUpdated => 'Seadme nime värskendati';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Seadme värskendamine ebaõnnestus: $error';
  }

  @override
  String get adminDeleteDevice => 'Kustuta seade';

  @override
  String get adminDeviceDeleted => 'Seade kustutatud';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Seadme kustutamine ebaõnnestus: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Kas eemaldada seade \'$name\'? Kasutaja peab selles seadmes uuesti sisse logima.';
  }

  @override
  String get adminDeleteAllDevices => 'Kustuta kõik seadmed';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Kas eemaldada $count seadet? Mõjutatud kasutajad peavad uuesti sisse logima. Sinu praegust seadet see ei puuduta.';
  }

  @override
  String get adminDevicesDeletedAll => 'Seadmed eemaldatud';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Osa seadmeid eemaldati, $count seadet ei õnnestunud eemaldada.';
  }

  @override
  String get adminDevicesLoadFailed => 'Seadmete laadimine ebaõnnestus';

  @override
  String get adminSearchDevices => 'Otsige seadmeid';

  @override
  String get adminThisDevice => 'See seade';

  @override
  String get adminEditName => 'Redigeeri nime';

  @override
  String get adminLibrariesLoadFailed => 'Teekide laadimine ebaõnnestus';

  @override
  String get adminNoLibraries => 'Ühtegi teeki pole konfigureeritud';

  @override
  String get adminScanAllLibraries => 'Kontrollige kõiki teeke';

  @override
  String get adminAddLibrary => 'Lisa raamatukogu';

  @override
  String adminScanFailed(String error) {
    return 'Skannimise käivitamine ebaõnnestus: $error';
  }

  @override
  String get adminRenameLibrary => 'Nimeta raamatukogu ümber';

  @override
  String get adminNewName => 'Uus nimi';

  @override
  String adminLibraryRenamed(String name) {
    return 'Teek nimetati ümber \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Ümbernimetamine ebaõnnestus: $error';
  }

  @override
  String get adminDeleteLibrary => 'Kustuta raamatukogu';

  @override
  String adminLibraryDeleted(String name) {
    return 'Teek \"$name\" on kustutatud';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Teegi kustutamine ebaõnnestus: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Tee lisamine nurjus: $error';
  }

  @override
  String get adminRemovePath => 'Eemalda tee';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Kas eemaldada \"$path\" sellest teegist?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Tee eemaldamine ebaõnnestus: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Teegi laadimine ebaõnnestus';

  @override
  String get adminNoMediaPaths => 'Meediumiteid pole konfigureeritud';

  @override
  String get adminAddPath => 'Lisa tee';

  @override
  String get adminBrowseFilesystem => 'Sirvige serveri failisüsteemi:';

  @override
  String get adminPreferredMetadataLanguage => 'Eelistatud metaandmete keel';

  @override
  String get adminMetadataLanguageHint => 'nt. et, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metaandmete riigikood';

  @override
  String get adminMetadataCountryHint => 'nt. USA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Teed';

  @override
  String get adminLibraryTabOptions => 'Valikud';

  @override
  String get adminLibraryTabDownloaders => 'Allalaadijad';

  @override
  String get adminLibMetadataSavers => 'Metaandmete salvestajad';

  @override
  String get adminLibSubtitleDownloaders => 'Subtiitrite allalaadijad';

  @override
  String get adminLibLyricDownloaders => 'Laulusõnade allalaadijad';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metaandmete allalaadijad: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Piltide hankijad: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'See server ei paku selle kogutüübi jaoks allalaadijaid.';

  @override
  String get adminLibrarySectionGeneral => 'Üldine';

  @override
  String get adminLibrarySectionMetadata => 'Metaandmed';

  @override
  String get adminLibrarySectionEmbedded => 'Manustatud teave';

  @override
  String get adminLibrarySectionSubtitles => 'Subtiitrid';

  @override
  String get adminLibrarySectionImages => 'Pildid';

  @override
  String get adminLibrarySectionSeries => 'Sarjad';

  @override
  String get adminLibrarySectionMusic => 'Muusika';

  @override
  String get adminLibrarySectionMovies => 'Filmid';

  @override
  String get adminLibRealtimeMonitor => 'Luba reaalajas jälgimine';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Tuvasta failimuudatused ja töötle need automaatselt.';

  @override
  String get adminLibEnablePhotos => 'Näita fotosid';

  @override
  String get adminLibSaveLocalMetadata =>
      'Salvesta kujunduspildid meediakaustadesse';

  @override
  String get adminLibRefreshInterval => 'Metaandmete automaatne värskendamine';

  @override
  String get adminLibRefreshNever => 'Mitte kunagi';

  @override
  String get adminLibDefault => 'Vaikimisi';

  @override
  String get adminLibDisplayTitle => 'Kuva';

  @override
  String get adminLibDisplaySection => 'Kogu kuvamine';

  @override
  String get adminLibFolderView =>
      'Näita kaustavaadet tavaliste meediakaustade jaoks';

  @override
  String get adminLibSpecialsInSeasons =>
      'Näita eriosi nende hooaegade sees, kus need eetris olid';

  @override
  String get adminLibGroupMovies => 'Rühmita filmid kollektsioonidesse';

  @override
  String get adminLibGroupShows => 'Rühmita saated kollektsioonidesse';

  @override
  String get adminLibExternalSuggestions => 'Näita soovitustes välist sisu';

  @override
  String get adminLibDateAddedSection => 'Lisamiskuupäeva käitumine';

  @override
  String get adminLibDateAddedLabel => 'Kasuta lisamiskuupäevana';

  @override
  String get adminLibDateAddedImport => 'Kogusse skannimise kuupäev';

  @override
  String get adminLibDateAddedFile => 'Faili loomise kuupäev';

  @override
  String get adminLibMetadataTitle => 'Metaandmed ja pildid';

  @override
  String get adminLibMetadataLangSection => 'Eelistatud metaandmete keel';

  @override
  String get adminLibChaptersSection => 'Peatükid';

  @override
  String get adminLibDummyChapterDuration =>
      'Asenduspeatükkide kestus (sekundites)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Peatükkide pikkus meedia jaoks, millel neid pole. Keelamiseks määra 0.';

  @override
  String get adminLibChapterImageResolution => 'Peatükipiltide eraldusvõime';

  @override
  String get adminLibNfoTitle => 'NFO seaded';

  @override
  String get adminLibNfoHelp =>
      'NFO metaandmed ühilduvad Kodi ja sarnaste klientidega. Seaded kehtivad kõigile kogudele, mis salvestavad NFO metaandmeid.';

  @override
  String get adminLibKodiUser =>
      'Kasutaja, kelle vaatamisandmed NFO failidesse salvestatakse';

  @override
  String get adminLibSaveImagePaths => 'Salvesta pilditeed NFO failidesse';

  @override
  String get adminLibPathSubstitution =>
      'Luba teede asendamine NFO pilditeede jaoks';

  @override
  String get adminLibExtraThumbs =>
      'Kopeeri extrafanart-pildid kausta extrathumbs';

  @override
  String get adminLibNone => 'Puudub';

  @override
  String adminLibRefreshDays(int days) {
    return '$days päeva';
  }

  @override
  String get adminLibEmbeddedTitles => 'Kasuta manustatud pealkirju';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Kasuta manustatud pealkirju lisamaterjalide jaoks';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Kasuta manustatud episooditeavet';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Luba manustatud subtiitrid';

  @override
  String get adminLibEmbeddedAllowAll => 'Luba kõik';

  @override
  String get adminLibEmbeddedAllowText => 'Ainult tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Ainult pilt';

  @override
  String get adminLibEmbeddedAllowNone => 'Puudub';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Jäta allalaadimine vahele, kui manustatud subtiitrid on olemas';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Jäta allalaadimine vahele, kui helirada vastab allalaadimise keelele';

  @override
  String get adminLibRequirePerfectMatch => 'Nõua täpset subtiitrite vastet';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Salvesta subtiitrid meediakaustadesse';

  @override
  String get adminLibChapterImageExtraction => 'Eralda peatükipildid';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Eralda peatükipildid kogu skannimise ajal';

  @override
  String get adminLibTrickplayExtraction => 'Luba Trickplay piltide eraldamine';

  @override
  String get adminLibTrickplayDuringScan =>
      'Eralda Trickplay pildid kogu skannimise ajal';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Salvesta Trickplay pildid meediakaustadesse';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Ühenda automaatselt sarjad, mis on jaotatud mitme kausta vahel';

  @override
  String get adminLibSeasonZeroName => 'Nullhooaja kuvatav nimi';

  @override
  String get adminLibLufsScan => 'Luba LUFS-skannimine heli normaliseerimiseks';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Eelista mittestandardset esitajasilti';

  @override
  String get adminLibAutoAddToCollection =>
      'Lisa filmid automaatselt kollektsioonidesse';

  @override
  String get adminLibraryNameRequired => 'Teegi nimi on kohustuslik';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Teegi loomine ebaõnnestus: $error';
  }

  @override
  String get adminLibraryName => 'Raamatukogu nimi';

  @override
  String get adminSelectedPaths => 'Valitud teed:';

  @override
  String get adminCreateLibrary => 'Loo raamatukogu';

  @override
  String get paths => 'Teed:';

  @override
  String get adminDisableUser => 'Kasutaja keelamine';

  @override
  String get adminEnableUser => 'Luba kasutaja';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Kas keelata $name? Nad ei saa sisse logida.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Kas lubada $name? Nad saavad uuesti sisse logida.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Kasutaja \"$name\" on keelatud';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Kasutaja \"$name\" on lubatud';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kasutajapoliitika värskendamine ebaõnnestus: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Kasutajate laadimine ebaõnnestus';

  @override
  String get adminSearchUsers => 'Otsige kasutajaid';

  @override
  String get adminEditUser => 'Redigeeri kasutajat';

  @override
  String get adminAddUser => 'Lisa kasutaja';

  @override
  String adminUserCreateFailed(String error) {
    return 'Kasutaja loomine ebaõnnestus: $error';
  }

  @override
  String get adminCreateUser => 'Loo kasutaja';

  @override
  String get adminPasswordOptional => 'Parool (valikuline)';

  @override
  String get adminUsernameRequired => 'Kasutajanimi ei tohi olla tühi';

  @override
  String adminSaveFailed(String error) {
    return 'Salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Paroolid ei ühti';

  @override
  String adminFailed(String error) {
    return 'Ebaõnnestunud: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kasutaja laadimine ebaõnnestus';

  @override
  String get adminDeleteUser => 'Kustuta kasutaja';

  @override
  String get admin => 'Logo';

  @override
  String get adminFullAccessWarning =>
      'Administraatoritel on täielik juurdepääs serverile. Andke ettevaatusega.';

  @override
  String get administrator => 'Administraator';

  @override
  String get adminHiddenUser => 'Varjatud kasutaja';

  @override
  String get adminAllowMediaPlayback => 'Luba meedia taasesitus';

  @override
  String get adminAllowAudioTranscoding => 'Luba heli ümberkodeerimine';

  @override
  String get adminAllowVideoTranscoding => 'Luba video ümberkodeerimine';

  @override
  String get adminAllowRemuxing => 'Luba uuesti segada';

  @override
  String get adminForceRemoteTranscoding =>
      'Kaugallika ümberkodeerimise sundimine';

  @override
  String get adminAllowContentDownloading => 'Luba sisu allalaadimine';

  @override
  String get adminAllowPublicSharing => 'Luba avalik jagamine';

  @override
  String get adminAllowRemoteControl =>
      'Lubage teiste kasutajate kaugjuhtimine';

  @override
  String get adminAllowSharedDeviceControl => 'Luba jagatud seadme juhtimine';

  @override
  String get adminAllowRemoteAccess => 'Luba kaugjuurdepääs';

  @override
  String get adminLeaveEmptyNoLimit => 'Jätke piiranguteta tühjaks';

  @override
  String get adminMaxActiveSessions => 'Aktiivsete seansside maksimaalne arv';

  @override
  String get adminAllowLiveTvAccess => 'Luba otsetelevisiooni juurdepääs';

  @override
  String get adminAllowLiveTvManagement => 'Luba otse-TV haldamine';

  @override
  String get adminAllowCollectionManagement => 'Luba kogude haldamine';

  @override
  String get adminAllowSubtitleManagement => 'Luba subtiitrite haldamine';

  @override
  String get adminAllowLyricManagement => 'Luba laulusõnade haldamine';

  @override
  String get adminEnableAllLibraryAccess =>
      'Luba juurdepääs kõikidele raamatukogudele';

  @override
  String get adminChangePassword => 'Muuda parooli';

  @override
  String get adminNewPassword => 'Uus parool';

  @override
  String get adminConfirmPassword => 'Kinnitage parool';

  @override
  String get adminSetPassword => 'Määra parool';

  @override
  String get adminResetPassword => 'Lähtestage parool';

  @override
  String get adminPasswordReset => 'Parooli lähtestamine';

  @override
  String get adminPasswordUpdated => 'Parool uuendatud';

  @override
  String get adminUserSettings => 'Kasutaja seaded';

  @override
  String get adminLibraryAccess => 'Juurdepääs raamatukogule';

  @override
  String get adminEnableAllDevices => 'Luba juurdepääs kõikidele seadmetele';

  @override
  String get adminEnableAllChannels => 'Luba juurdepääs kõikidele kanalitele';

  @override
  String get adminParentalControl => 'Vanemlik järelevalve';

  @override
  String get adminMaxParentalRating => 'Suurim lubatud vanusepiirang';

  @override
  String get adminMaxParentalRatingHint =>
      'Sellest kõrgema piiranguga sisu peidetakse selle kasutaja eest.';

  @override
  String get adminParentalRatingNone => 'Puudub';

  @override
  String get adminBlockUnratedItems =>
      'Blokeeri üksused, mille vanusepiirangu teave puudub või on tundmatu';

  @override
  String get adminUnratedBook => 'Raamatud';

  @override
  String get adminUnratedChannelContent => 'Kanalid';

  @override
  String get adminUnratedLiveTvChannel => 'Otse-TV';

  @override
  String get adminUnratedMovie => 'Filmid';

  @override
  String get adminUnratedMusic => 'Muusika';

  @override
  String get adminUnratedTrailer => 'Treilerid';

  @override
  String get adminUnratedSeries => 'Sarjad';

  @override
  String get adminAccessSchedules => 'Juurdepääsu ajakavad';

  @override
  String get adminAccessSchedulesHint =>
      'Luba juurdepääs ainult allpool määratud aegadel. Kui ajakava pole määratud, on juurdepääs lubatud kogu päeva.';

  @override
  String get adminAddSchedule => 'Lisa ajakava';

  @override
  String get adminScheduleDay => 'Päev';

  @override
  String get adminScheduleStart => 'Algus';

  @override
  String get adminScheduleEnd => 'Lõpp';

  @override
  String get adminDayEveryday => 'Iga päev';

  @override
  String get adminDayWeekday => 'Argipäev';

  @override
  String get adminDayWeekend => 'Nädalavahetus';

  @override
  String get adminDaySunday => 'Pühapäev';

  @override
  String get adminDayMonday => 'Esmaspäev';

  @override
  String get adminDayTuesday => 'Teisipäev';

  @override
  String get adminDayWednesday => 'Kolmapäev';

  @override
  String get adminDayThursday => 'Neljapäev';

  @override
  String get adminDayFriday => 'Reede';

  @override
  String get adminDaySaturday => 'Laupäev';

  @override
  String get adminAllowedTags => 'Lubatud sildid';

  @override
  String get adminAllowedTagsHint =>
      'Näidatakse ainult nende siltidega sisu. Kõige lubamiseks jäta tühjaks.';

  @override
  String get adminBlockedTags => 'Blokeeritud sildid';

  @override
  String get adminBlockedTagsHint =>
      'Nende siltidega sisu peidetakse selle kasutaja eest.';

  @override
  String get adminAddTag => 'Lisa silt';

  @override
  String get adminAuthProvider => 'Autentimisteenuse pakkuja';

  @override
  String get adminPasswordResetProvider => 'Parooli lähtestamise pakkuja';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Ebaõnnestunud sisselogimiskatsete maksimum enne lukustamist';

  @override
  String get adminLoginAttemptsHint =>
      'Vaikeväärtuse jaoks määra 0 või lukustamise keelamiseks -1.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay juurdepääs';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Luba rühmade loomine ja nendega liitumine';

  @override
  String get adminSyncPlayJoin => 'Luba rühmadega liitumine';

  @override
  String get adminSyncPlayNone => 'Juurdepääs puudub';

  @override
  String get adminContentDeletionFolders => 'Luba sisu kustutamine kaustadest';

  @override
  String get adminResetPasswordWarning =>
      'See eemaldab parooli. Kasutaja saab sisse logida ilma paroolita.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server tagastas HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Kas olete kindel, et soovite kustutada $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Kasutaja \"$name\" on kustutatud';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kasutaja kustutamine ebaõnnestus: $error';
  }

  @override
  String get adminCreateApiKey => 'Looge API võti';

  @override
  String get adminAppName => 'Rakenduse nimi';

  @override
  String get adminApiKeyCreated => 'API võti loodud';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Võtme loomine õnnestus. Server ei tagastanud luba. Kontrollige serveri API võtmeid.';

  @override
  String get adminKeyCopied => 'Võti kopeeriti lõikelauale';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Võtme loomine ebaõnnestus: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Serveri vastusest puudub võtmemärk';

  @override
  String get adminRevokeApiKey => 'Tühista API võti';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Kas tühistada $name võti?';
  }

  @override
  String get adminApiKeyRevoked => 'API võti tühistati';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Võtme tühistamine ebaõnnestus: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API võtmete laadimine ebaõnnestus';

  @override
  String get adminApiKeysTitle => 'API võtmed';

  @override
  String get adminCreateKey => 'Loo võti';

  @override
  String get adminNoApiKeys => 'API võtmeid ei leitud';

  @override
  String get adminUnknownApp => 'Tundmatu rakendus';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nLoodud: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Loo varukoopia';

  @override
  String get adminBackupDatabase => 'Andmebaas';

  @override
  String get adminBackupDatabaseAlways => 'Alati kaasatud';

  @override
  String get adminBackupMetadata => 'Metaandmed';

  @override
  String get adminBackupSubtitles => 'Subtiitrid';

  @override
  String get adminBackupTrickplay => 'Trickplay pildid';

  @override
  String get adminCreatingBackup => 'Varukoopia loomine...';

  @override
  String get adminBackupCreated => 'Varundamine õnnestus';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Varukoopia loomine ebaõnnestus: $error';
  }

  @override
  String get adminBackupPathMissing => 'Serveri vastuses puudub varutee';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Manifesti laadimine ebaõnnestus: $error';
  }

  @override
  String get adminConfirmRestore => 'Kinnitage taastamine';

  @override
  String get adminRestoringBackup => 'Varukoopia taastamine...';

  @override
  String adminRestoreFailed(String error) {
    return 'Varukoopia taastamine ebaõnnestus: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Varukoopiate laadimine ebaõnnestus';

  @override
  String get adminCreateBackup => 'Loo varukoopia';

  @override
  String get adminNoBackups => 'Varukoopiaid ei leitud';

  @override
  String get adminViewDetails => 'Kuva üksikasjad';

  @override
  String get restore => 'Taasta';

  @override
  String get adminLogsLoadFailed => 'Serveri logide laadimine ebaõnnestus';

  @override
  String get adminNoLogFiles => 'Logifaile ei leitud';

  @override
  String get adminLogCopied => 'Logi kopeeriti lõikelauale';

  @override
  String get adminSaveLogFile => 'Salvesta logifail';

  @override
  String adminSavedTo(String path) {
    return 'Salvestatud aadressile $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Faili salvestamine nurjus: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName laadimine nurjus';
  }

  @override
  String get adminSearchInLog => 'Otsi logist';

  @override
  String get adminNoMatchingLines => 'Ühtegi sobivat rida pole';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Ülesannete laadimine ebaõnnestus: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ajastatud ülesandeid ei leitud';

  @override
  String get adminNoTasksMatchFilter =>
      'Praegusele filtrile ei vasta ükski ülesanne';

  @override
  String adminTaskStartFailed(String error) {
    return 'Ülesande käivitamine ebaõnnestus: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Ülesande peatamine ebaõnnestus: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Ülesande laadimine ebaõnnestus: $error';
  }

  @override
  String get adminRunNow => 'Jookse kohe';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Päästiku eemaldamine ebaõnnestus: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Päästiku lisamine nurjus: $error';
  }

  @override
  String get adminLastExecution => 'Viimane hukkamine';

  @override
  String get adminTriggers => 'Päästikud';

  @override
  String get adminAddTrigger => 'Lisa päästik';

  @override
  String get adminNoTriggers => 'Päästikuid pole konfigureeritud';

  @override
  String get adminTriggerType => 'Päästiku tüüp';

  @override
  String get adminNoLimit => 'Piiramata';

  @override
  String adminHours(String hours) {
    return '$hours tund(a)';
  }

  @override
  String get adminDayOfWeek => 'Nädalapäev';

  @override
  String get adminSearchPlugins => 'Otsi pluginaid...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Plugina ümberlülitamine nurjus: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstallige pistikprogramm';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Kas olete kindel, et soovite desinstallida \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Plugina desinstallimine ebaõnnestus: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Paketi installimine nurjus: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Värskenduse installimine ebaõnnestus: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Pluginate laadimine ebaõnnestus: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ükski pistikprogramm ei vasta teie otsingule';

  @override
  String get adminNoPluginsInstalled => 'Pluginaid pole installitud';

  @override
  String adminInstallUpdate(String version) {
    return 'Installige värskendus (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kataloogi laadimine ebaõnnestus: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Ükski pakend ei vasta teie otsingule';

  @override
  String get adminNoPackagesAvailable => 'Paketid pole saadaval';

  @override
  String get adminExperimentalIntegration => 'Eksperimentaalne integratsioon';

  @override
  String get adminExperimentalWarning =>
      'Pistikprogrammide seadete integreerimine on veel eksperimentaalne. Mõnda seadete lehte ei pruugita õigesti renderdada.';

  @override
  String get continueAction => 'Jätka';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" eemaldatakse pärast serveri taaskäivitamist';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Desinstallimine ebaõnnestus: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" värskendamine v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Plugina laadimine nurjus: $error';
  }

  @override
  String get adminPluginNotFound => 'Pluginat ei leitud';

  @override
  String adminPluginVersion(String version) {
    return 'Versioon $version';
  }

  @override
  String get adminEnablePlugin => 'Luba pistikprogramm';

  @override
  String get adminPluginSettingsPage => 'Pistikprogrammi seadete leht';

  @override
  String get adminRevisionHistory => 'Läbivaatamise ajalugu';

  @override
  String get adminNoChangelog => 'Muudatuste logi pole saadaval.';

  @override
  String get adminRemoveRepository => 'Eemalda hoidla';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Kas olete kindel, et soovite \"$name\" eemaldada?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Hoidlate salvestamine ebaõnnestus: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Hoidlate laadimine ebaõnnestus: $error';
  }

  @override
  String get adminRepositoryNameHint => 'nt. Jellyfin stabiilne';

  @override
  String get adminRepositoryUrl => 'Hoidla URL';

  @override
  String get adminAddEntry => 'Lisa kirje';

  @override
  String get adminInvalidUrl => 'Vigane URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Plugina seadeid ei saa laadida: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ei saanud avada';
  }

  @override
  String get adminOpenInBrowser => 'Avage brauseris';

  @override
  String get adminOpenExternally => 'Avage väliselt';

  @override
  String get adminGeneralSettings => 'Üldsätted';

  @override
  String get adminServerName => 'Serveri nimi';

  @override
  String get adminPreferredMetadataCountry => 'Eelistatud metaandmete riik';

  @override
  String get adminCachePath => 'Vahemälu tee';

  @override
  String get adminMetadataPath => 'Metaandmete tee';

  @override
  String get adminLibraryScanConcurrency => 'Raamatukogu skannimise samaaegsus';

  @override
  String get adminParallelImageEncodingLimit =>
      'Kujutise paralleelse kodeerimise piirang';

  @override
  String get adminSlowResponseThreshold => 'Aeglase reageerimise lävi (ms)';

  @override
  String get adminBrandingLoadFailed => 'Brändiseadete laadimine ebaõnnestus';

  @override
  String get adminLoginDisclaimer => 'Sisselogimisest loobumine';

  @override
  String get adminLoginDisclaimerHint => 'HTML kuvatakse sisselogimisvormi all';

  @override
  String get adminCustomCss => 'Kohandatud CSS';

  @override
  String get adminCustomCssHint => 'Veebiliidesele rakendatud kohandatud CSS';

  @override
  String get adminEnableSplashScreen => 'Luba pritskuva';

  @override
  String get adminStreamingLoadFailed =>
      'Voogesituse seadete laadimine ebaõnnestus';

  @override
  String get adminStreamingDescription =>
      'Määrake kaugühenduste jaoks globaalsed voogesituse bitikiiruse piirangud.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Kaugkliendi bitikiiruse limiit (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Jätke tühjaks või 0 piiramatuks';

  @override
  String get adminPlaybackLoadFailed =>
      'Taasesituse seadete laadimine ebaõnnestus';

  @override
  String get adminHardwareAcceleration => 'Riistvaraline kiirendus';

  @override
  String get adminVaapiDevice => 'VA-API seade';

  @override
  String get adminEnableHardwareEncoding => 'Luba riistvaraline kodeering';

  @override
  String get adminEnableHardwareDecoding => 'Riistvara dekodeerimise lubamine:';

  @override
  String get adminEncodingThreads => 'Kodeerimislõngad';

  @override
  String get adminAutomatic => '0 = automaatne';

  @override
  String get adminTranscodingTempPath => 'Transkodeerimise temp tee';

  @override
  String get adminEnableFallbackFont => 'Luba varufont';

  @override
  String get adminFallbackFontPath => 'Varufondi tee';

  @override
  String get adminAllowSegmentDeletion => 'Luba segmendi kustutamine';

  @override
  String get adminSegmentKeepSeconds => 'Segmendi säilitamine (sekundites)';

  @override
  String get adminThrottleBuffering => 'Drosselklapi puhverdus';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay seadete laadimine ebaõnnestus';

  @override
  String get adminEnableHardwareAcceleration => 'Luba riistvaraline kiirendus';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Luba ainult võtmeraami ekstraheerimine';

  @override
  String get adminKeyFrameSubtitle => 'Kiirem, kuid väiksem täpsus';

  @override
  String get adminScanBehavior => 'Skaneerimise käitumine';

  @override
  String get adminProcessPriority => 'Protsessi prioriteet';

  @override
  String get adminImageSettings => 'Pildi seaded';

  @override
  String get adminIntervalMs => 'Intervall (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kui sageli kaadreid jäädvustada';

  @override
  String get adminWidthResolutions => 'Laiuse eraldusvõimed';

  @override
  String get adminTileWidth => 'Plaatide laius';

  @override
  String get adminTileHeight => 'Plaatide kõrgus';

  @override
  String get adminQualitySubtitle =>
      'Madalamad väärtused = parem kvaliteet, suuremad failid';

  @override
  String get adminProcessThreads => 'Töötle niidid';

  @override
  String get adminResumeLoadFailed => 'Jätkamisseadete laadimine ebaõnnestus';

  @override
  String get adminResumeDescription =>
      'Seadistage, millal tuleks sisu märkida osaliselt või täielikult esitatuks.';

  @override
  String get adminMinResumePercentage => 'Minimaalne jätkamise protsent';

  @override
  String get adminMinResumeSubtitle =>
      'Edenemise salvestamiseks tuleb sisu esitada sellest protsendist üle';

  @override
  String get adminMaxResumePercentage => 'Maksimaalne jätkamise protsent';

  @override
  String get adminMaxResumeSubtitle =>
      'Pärast seda protsenti loetakse sisu täielikult esitatuks';

  @override
  String get adminMinResumeDuration =>
      'Jätkamise minimaalne kestus (sekundites)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Sellest lühemaid esemeid ei saa jätkata';

  @override
  String get adminMinAudiobookResume =>
      'Audioraamatute jätkamise minimaalne protsent';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimaalne audioraamatu jätkamise protsent';

  @override
  String get adminNetworkingLoadFailed => 'Võrguseadete laadimine ebaõnnestus';

  @override
  String get adminNetworkingWarning =>
      'Võrguseadete muutmine võib nõuda serveri taaskäivitamist.';

  @override
  String get adminEnableRemoteAccess => 'Luba kaugjuurdepääs';

  @override
  String get ports => 'Sadamad';

  @override
  String get adminHttpPort => 'HTTP port';

  @override
  String get adminHttpsPort => 'HTTPS-port';

  @override
  String get adminPublicHttpsPort => 'Avalik HTTPS-port';

  @override
  String get adminBaseUrl => 'Baas-URL';

  @override
  String get adminBaseUrlHint => 'nt /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Luba HTTPS';

  @override
  String get adminLocalNetwork => 'Kohalik võrk';

  @override
  String get adminLocalNetworkAddresses => 'Kohaliku võrgu aadressid';

  @override
  String get adminKnownProxies => 'Tuntud puhverserverid';

  @override
  String get adminRemoteIpFilter => 'Kaug-IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'Kaug-IP-filter';

  @override
  String get adminCertificatePath => 'Sertifikaadi tee';

  @override
  String get whitelist => 'Valge nimekiri';

  @override
  String get blacklist => 'Must nimekiri';

  @override
  String get notSet => 'Pole määratud';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Metaandmete laadimine ebaõnnestus: $error';
  }

  @override
  String get adminRefreshMetadata => 'Värskenda metaandmeid';

  @override
  String get recursive => 'Rekursiivne';

  @override
  String get adminReplaceAllMetadata => 'Asendage kõik metaandmed';

  @override
  String get adminMetadataRefreshRequested =>
      'Taotleti metaandmete värskendamist';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Metaandmete värskendamine ebaõnnestus: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Kaugvasteid ei leitud';

  @override
  String get adminRemoteResults => 'Kaugtulemused';

  @override
  String get adminRemoteMetadataApplied => 'Kaugmetaandmed on rakendatud';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Kaugotsing ebaõnnestus: $error';
  }

  @override
  String get adminUpdateContentType => 'Värskenda sisutüüpi';

  @override
  String get adminContentType => 'Sisu tüüp';

  @override
  String get adminContentTypeUpdated => 'Sisutüüp on värskendatud';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Sisutüübi värskendamine ebaõnnestus: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Metaandmete redaktori laadimine ebaõnnestus';

  @override
  String get adminNoPeopleEntries => 'Inimesi sissekandeid pole';

  @override
  String get adminNoExternalIds => 'Väliseid ID-sid pole saadaval';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType pilti värskendati';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Pildi allalaadimine ebaõnnestus: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Toetamata pildivorming';

  @override
  String get adminImageReadFailed => 'Valitud pildi lugemine ebaõnnestus';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType pilt on üles laaditud';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Pildi üleslaadimine ebaõnnestus: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Kustuta $imageType pilt';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType pilt kustutatud';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Pildi kustutamine ebaõnnestus: $error';
  }

  @override
  String get adminAllProviders => 'Kõik pakkujad';

  @override
  String get adminNoRemoteImages => 'Kaugpilte ei leitud';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuneri leidmine ebaõnnestus: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U tuuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fail või URL';

  @override
  String get adminTunerIpAddress => 'Tuuneri IP-aadress';

  @override
  String get adminTunerFriendlyName => 'Kuvatav nimi';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Samaaegsete ühenduste piirang';

  @override
  String get adminTunerCountHelp =>
      'Voogude maksimaalne arv, mida tuuner korraga lubab. Piiramatu jaoks määra 0.';

  @override
  String get adminTunerFallbackBitrate =>
      'Voogedastuse varubitikiiruse ülempiir';

  @override
  String get adminTunerImportFavoritesOnly => 'Impordi ainult lemmikkanalid';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Luba riistvaraline transkodeerimine';

  @override
  String get adminTunerAllowFmp4 => 'Luba fMP4 transkodeerimiskonteiner';

  @override
  String get adminTunerAllowStreamSharing => 'Luba voo jagamine';

  @override
  String get adminTunerEnableStreamLooping => 'Luba voo kordamine';

  @override
  String get adminTunerIgnoreDts => 'Eira DTS-i';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Loe sisendit algsel kaadrisagedusel';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fail või URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmide eesliide';

  @override
  String get adminXmltvMovieCategories => 'Filmikategooriad';

  @override
  String get adminXmltvCategoriesHelp =>
      'Eralda mitu kategooriat püstkriipsuga.';

  @override
  String get adminXmltvKidsCategories => 'Lastesaadete kategooriad';

  @override
  String get adminXmltvNewsCategories => 'Uudistekategooriad';

  @override
  String get adminXmltvSportsCategories => 'Spordikategooriad';

  @override
  String get adminSdUsername => 'Kasutajanimi';

  @override
  String get adminSdPassword => 'Parool';

  @override
  String get adminSdCountry => 'Riik';

  @override
  String get adminSdCountrySelect => 'Vali riik';

  @override
  String get adminSdPostalCode => 'Postiindeks';

  @override
  String get adminEnableAllTuners => 'Luba kõik tuunerid';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tuneri eemaldamine ebaõnnestus: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Teenusepakkuja eemaldamine ebaõnnestus: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Sarja salvestustee';

  @override
  String get adminMovieRecordingPath => 'Filmisalvestiste tee';

  @override
  String get adminGuideDaysAuto => 'Automaatne';

  @override
  String get adminRecordingPostProcessor => 'Järeltöötlusrakenduse tee';

  @override
  String get adminRecordingPostProcessorArgs => 'Järeltöötleja argumendid';

  @override
  String get adminSaveRecordingNfo => 'Salvesta salvestise NFO metaandmed';

  @override
  String get adminSaveRecordingImages => 'Salvesta salvestise pildid';

  @override
  String get adminLiveTvSectionPaths => 'Salvestamise teed';

  @override
  String get adminLiveTvSectionPostProcessing => 'Järeltöötlus';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Seadete salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Otseülekande halduse laadimine ebaõnnestus';

  @override
  String get adminTunerDevices => 'Tuneri seadmed';

  @override
  String get adminNoTunerHosts => 'Ühtegi tuuneri hosti pole konfigureeritud';

  @override
  String get adminGuideProviders => 'Juhendi pakkujad';

  @override
  String get adminGuideRefreshStarted => 'Kavaandmete värskendamine alustatud';

  @override
  String get adminGuideRefreshUnavailable =>
      'Kava värskendamise ülesanne pole selles serveris saadaval.';

  @override
  String get adminNoListingProviders =>
      'Ühtegi loendi pakkujat pole konfigureeritud';

  @override
  String get adminSettingsSaved => 'Seaded salvestatud';

  @override
  String get adminBackupsNotAvailable =>
      'Varukoopiad pole selles serverijärgus saadaval.';

  @override
  String get adminRestoreWarning1 =>
      'Taastamine asendab KÕIK praegused serveri andmed varuandmetega.';

  @override
  String get adminRestoreWarning2 =>
      'Praegused serveri seaded, kasutajad ja teegi andmed kirjutatakse üle.';

  @override
  String get adminRestoreWarning3 => 'Server taaskäivitub pärast taastamist.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Kas taastada varukoopia $name kohe?';
  }

  @override
  String get adminBackupsTitle => 'Varukoopiad';

  @override
  String get adminUnknownDate => 'Tundmatu kuupäev';

  @override
  String get adminUnnamedBackup => 'Nimetu varukoopia';

  @override
  String get adminApply => 'Rakenda';

  @override
  String get adminLogsTitle => 'Serveri logid';

  @override
  String get adminLogsNewestFirst => 'Kõige uuemad enne';

  @override
  String get adminLogsOldestFirst => 'Vanim esimene';

  @override
  String get adminLogsJustNow => 'Just praegu';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m tagasi';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h tagasi';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d tagasi';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName laadimine nurjus';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count vasted';
  }

  @override
  String get adminLogViewerNoMatches => 'Ühtegi sobivat rida pole';

  @override
  String get adminMetadataEditorTitle => 'Metaandmete redaktor';

  @override
  String get adminMetadataIdentify => 'Tuvasta';

  @override
  String get adminMetadataType => 'Tüüp';

  @override
  String get adminMetadataDetails => 'Üksikasjad';

  @override
  String get adminMetadataExternalIds => 'Välised ID-d';

  @override
  String get adminMetadataImages => 'Pildid';

  @override
  String get adminMetadataFieldTitle => 'Pealkiri';

  @override
  String get adminMetadataFieldSortTitle => 'Sorteeri pealkiri';

  @override
  String get adminMetadataFieldOriginalTitle => 'Algne pealkiri';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Esilinastuse kuupäev (AAAA-KK-PP)';

  @override
  String get adminMetadataFieldEndDate => 'Lõppkuupäev (AAAA-KK-PP)';

  @override
  String get adminMetadataFieldProductionYear => 'Tootmisaasta';

  @override
  String get adminMetadataFieldOfficialRating => 'Ametlik reiting';

  @override
  String get adminMetadataFieldCommunityRating => 'kogukonna reiting';

  @override
  String get adminMetadataFieldCriticRating => 'Kriitika hinnang';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Tunnuslause';

  @override
  String get adminMetadataFieldOverview => 'Ülevaade';

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
  String get adminMetadataGenres => 'Žanrid';

  @override
  String get adminMetadataTags => 'Sildid';

  @override
  String get adminMetadataStudios => 'Stuudiokorterid';

  @override
  String get adminMetadataPeople => 'Inimesed';

  @override
  String get adminMetadataAddGenre => 'Lisa žanr';

  @override
  String get adminMetadataAddTag => 'Lisa silt';

  @override
  String get adminMetadataAddStudio => 'Lisa stuudio';

  @override
  String get adminMetadataAddPerson => 'Lisa inimene';

  @override
  String get adminMetadataEditPerson => 'Muuda isikut';

  @override
  String get adminMetadataRole => 'Roll';

  @override
  String get adminMetadataImagePrimary => 'Esmane';

  @override
  String get adminMetadataImageBackdrop => 'Taust';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Bänner';

  @override
  String get adminMetadataImageThumb => 'Pöial';

  @override
  String get adminMetadataProvider => 'Pakkuja';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType pilti värskendati';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType pilt on üles laaditud';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType pilt kustutatud';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Pildi allalaadimine ebaõnnestus: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Valitud pildi lugemine ebaõnnestus';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Pildi üleslaadimine ebaõnnestus: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Kustuta $imageType pilt';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'See eemaldab elemendist praeguse pildi.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Pildi kustutamine ebaõnnestus: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Valige $imageType pilt';
  }

  @override
  String get adminMetadataUpload => 'Laadi üles';

  @override
  String get adminMetadataUpdate => 'Värskenda';

  @override
  String get adminMetadataRemoteImage => 'Kaugpilt';

  @override
  String get adminPluginsInstalled => 'Paigaldatud';

  @override
  String get adminPluginsCatalog => 'Kataloog';

  @override
  String get adminPluginsActive => 'Aktiivne';

  @override
  String get adminPluginsRestart => 'Taaskäivitage';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Ükski pistikprogramm ei vasta teie otsingule';

  @override
  String get adminPluginsNoneInstalled => 'Pluginaid pole installitud';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Värskendus on saadaval: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Värskendus saadaval';

  @override
  String get adminPluginsPendingRemoval =>
      'Pärast taaskäivitamist ootel eemaldamine';

  @override
  String get adminPluginsChangesPending => 'Muudatused ootavad taaskäivitamist';

  @override
  String get adminPluginsEnable => 'Luba';

  @override
  String get adminPluginsDisable => 'Keela';

  @override
  String get adminPluginsInstallUpdate => 'Installige värskendus';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Installige värskendus (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ükski pakend ei vasta teie otsingule';

  @override
  String get adminPluginsCatalogEmpty => 'Paketid pole saadaval';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" installitakse...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentaalne integratsioon';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Pistikprogrammide seadete integreerimine on veel eksperimentaalne. Mõnda välja või paigutust ei pruugita veel õigesti renderdada.';

  @override
  String get adminPluginDetailToggle404 =>
      'Plugina sisse- ja väljalülitamine ebaõnnestus. Server ei leidnud seda pistikprogrammi versiooni. Proovige pistikprogramme värskendada ja seejärel uuesti.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Plugina sisse- ja väljalülitamine ebaõnnestus. Vaadake üksikasju serveri logidest.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Seaded';
  }

  @override
  String get adminPluginDetailDetails => 'Üksikasjad';

  @override
  String get adminPluginDetailDeveloper => 'Arendaja';

  @override
  String get adminPluginDetailRepository => 'Hoidla';

  @override
  String get adminPluginDetailBundled => 'Komplektis';

  @override
  String get adminPluginDetailEnablePlugin => 'Luba pistikprogramm';

  @override
  String get adminPluginDetailRestartRequired =>
      'Muudatuste jõustumiseks on vaja serveri taaskäivitamist.';

  @override
  String get adminPluginDetailRemovalPending =>
      'See pistikprogramm eemaldatakse pärast serveri taaskäivitamist.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Sellel pistikprogrammil on tõrge ja see ei pruugi korralikult töötada.';

  @override
  String get adminPluginDetailNotSupported =>
      'Seda pistikprogrammi praegune serveriversioon ei toeta.';

  @override
  String get adminPluginDetailSuperseded =>
      'See pistikprogramm on asendatud uuema versiooniga.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Hoidlate laadimine ebaõnnestus: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Eemalda hoidla';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Kas olete kindel, et soovite \"$name\" eemaldada?';
  }

  @override
  String get adminReposRemove => 'Eemalda';

  @override
  String adminReposSaveFailed(String error) {
    return 'Hoidlate salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminReposEmpty => 'Hoidlaid pole konfigureeritud';

  @override
  String get adminReposEmptySubtitle =>
      'Saadaolevate pistikprogrammide sirvimiseks lisage hoidla';

  @override
  String get adminReposUnnamed => '(nimetu)';

  @override
  String get adminReposEditTitle => 'Redigeeri hoidlat';

  @override
  String get adminReposAddTitle => 'Lisa hoidla';

  @override
  String get adminReposUrl => 'Hoidla URL';

  @override
  String get adminReposNameHint => 'nt. Jellyfin stabiilne';

  @override
  String get adminPluginSettingsInvalidUrl => 'Vigane URL';

  @override
  String get adminGeneralSettingsTitle => 'Üldsätted';

  @override
  String get adminGeneralMetadataLanguage => 'Eelistatud metaandmete keel';

  @override
  String get adminGeneralMetadataLanguageHint => 'nt. et, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Eelistatud metaandmete riik';

  @override
  String get adminGeneralMetadataCountryHint => 'nt. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Raamatukogu skannimise samaaegsus';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Kujutise paralleelse kodeerimise piirang';

  @override
  String get adminUnknownError => 'Tundmatu viga';

  @override
  String get adminBrowse => 'Sirvige';

  @override
  String get adminCloseBrowser => 'Sulgege brauser';

  @override
  String get adminNetworkingTitle => 'Võrgustiku loomine';

  @override
  String get adminNetworkingRestartWarning =>
      'Võrguseadete muutmine võib nõuda serveri taaskäivitamist.';

  @override
  String get adminNetworkingEnableHttps => 'Luba HTTPS';

  @override
  String get adminNetworkingAddressHint => 'nt. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Tuntud puhverserverid';

  @override
  String get adminNetworkingProxyHint => 'nt. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Valge nimekiri';

  @override
  String get adminNetworkingBlacklist => 'Must nimekiri';

  @override
  String get adminNetworkingAddEntry => 'Lisa kirje';

  @override
  String get adminBrandingTitle => 'Bränding';

  @override
  String get adminBrandingLoginDisclaimer => 'Sisselogimisest loobumine';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML kuvatakse sisselogimisvormi all';

  @override
  String get adminBrandingCustomCss => 'Kohandatud CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Veebiliidesele rakendatud kohandatud CSS';

  @override
  String get adminBrandingEnableSplash => 'Luba pritskuva';

  @override
  String get adminBrandingSplashUpload => 'Laadi pilt üles';

  @override
  String get adminBrandingSplashUploaded => 'Avakuva uuendatud';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Avakuva üleslaadimine ebaõnnestus';

  @override
  String get adminBrandingSplashDeleted => 'Avakuva eemaldatud';

  @override
  String get adminBrandingNoSplash => 'Kohandatud avakuva puudub';

  @override
  String get adminPlaybackHwAccel => 'Riistvaraline kiirendus';

  @override
  String get adminPlaybackHwAccelLabel => 'Riistvaraline kiirendus';

  @override
  String get adminPlaybackEnableHwEncoding => 'Luba riistvaraline kodeering';

  @override
  String get adminPlaybackQsvDevice => 'QSV seade';

  @override
  String get adminPlaybackEnhancedNvdec => 'Luba täiustatud NVDEC dekooder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Eelista süsteemi algset riistvaralist dekooderit';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bitine HEVC dekodeerimine';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bitine VP9 dekodeerimine';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bitine dekodeerimine';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-bitine dekodeerimine';

  @override
  String get adminPlaybackHwEncodingSection => 'Riistvaraline kodeerimine';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Luba HEVC kodeerimine';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Luba AV1 kodeerimine';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Luba Inteli väikese energiatarbega H.264 kooder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Luba Inteli väikese energiatarbega HEVC kooder';

  @override
  String get adminPlaybackToneMapping => 'Toonivastendus';

  @override
  String get adminPlaybackEnableTonemapping => 'Luba toonivastendus';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Luba VPP toonivastendus';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Luba VideoToolboxi toonivastendus';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Toonivastenduse algoritm';

  @override
  String get adminPlaybackTonemappingMode => 'Toonivastenduse režiim';

  @override
  String get adminPlaybackTonemappingRange => 'Toonivastenduse vahemik';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Toonivastenduse küllastuse vähendamine';

  @override
  String get adminPlaybackTonemappingPeak => 'Toonivastenduse tipptase';

  @override
  String get adminPlaybackTonemappingParam => 'Toonivastenduse parameeter';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP toonivastenduse heledus';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP toonivastenduse kontrastsus';

  @override
  String get adminPlaybackEncoderPreset => 'Koodri eelseadistus';

  @override
  String get adminPlaybackH264Crf => 'H.264 kodeerimise CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kodeerimise CRF';

  @override
  String get adminPlaybackDeinterlaceMethod =>
      'Ülerealaotuse eemaldamise meetod';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Kahekordista kaadrisagedus ülerealaotuse eemaldamisel';

  @override
  String get adminPlaybackAudioSection => 'Heli';

  @override
  String get adminPlaybackEnableAudioVbr => 'Luba heli VBR-kodeerimine';

  @override
  String get adminPlaybackDownmixBoost => 'Heli allamiksimise võimendus';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo allamiksimise algoritm';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Multipleksimisjärjekorra maksimaalne suurus';

  @override
  String get adminPlaybackAutoOption => 'Automaatne';

  @override
  String get adminPlaybackEncoding => 'Kodeerimine';

  @override
  String get adminPlaybackEncodingThreads => 'Kodeerimislõngad';

  @override
  String get adminPlaybackFallbackFont => 'Luba varufont';

  @override
  String get adminPlaybackFallbackFontPath => 'Varufondi tee';

  @override
  String get adminPlaybackStreaming => 'Voogesitus';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audioraamatud';

  @override
  String get adminStreamingBitrateLimit =>
      'Kaugkliendi bitikiiruse limiit (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Jätke tühjaks või 0 piiramatuks';

  @override
  String get adminTrickplayHwAccel => 'Luba riistvaraline kiirendus';

  @override
  String get adminTrickplayHwEncoding => 'Luba riistvaraline kodeering';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Luba ainult võtmeraami ekstraheerimine';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Kiirem, kuid väiksem täpsus';

  @override
  String get adminTrickplayNonBlocking => 'Mitteblokeeriv';

  @override
  String get adminTrickplayBlocking => 'Blokeerimine';

  @override
  String get adminTrickplayPriorityHigh => 'Kõrge';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Üle normaalse';

  @override
  String get adminTrickplayPriorityNormal => 'Tavaline';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Alla normaalse';

  @override
  String get adminTrickplayPriorityIdle => 'Tühikäik';

  @override
  String get adminTrickplayImageSettings => 'Pildi seaded';

  @override
  String get adminTrickplayInterval => 'Intervall (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Kui sageli kaadreid jäädvustada';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Komaga eraldatud pikslilaiused (nt 320)';

  @override
  String get adminTrickplayQuality => 'Kvaliteet';

  @override
  String get adminTrickplayQScale => 'Kvaliteedi skaala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Madalamad väärtused = parem kvaliteet, suuremad failid';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvaliteet';

  @override
  String get adminTrickplayProcessing => 'Töötlemine';

  @override
  String get adminTasksEmpty => 'Ajastatud ülesandeid ei leitud';

  @override
  String get adminTasksNoFilterMatch =>
      'Praegusele filtrile ei vasta ükski ülesanne';

  @override
  String get adminTaskCancelling => 'Tühistamine...';

  @override
  String get adminTaskRunning => 'Jooksmine...';

  @override
  String get adminTaskNeverRun => 'Ärge kunagi jookske';

  @override
  String get adminTaskStop => 'Peata';

  @override
  String get adminRunningTasks => 'Töötavad ülesanded';

  @override
  String get adminTaskRun => 'Jookse';

  @override
  String get adminTaskDetailLastExecution => 'Viimane hukkamine';

  @override
  String get adminTaskDetailStarted => 'Alustatud';

  @override
  String get adminTaskDetailEnded => 'Lõppenud';

  @override
  String get adminTaskDetailDuration => 'Kestus';

  @override
  String get adminTaskDetailErrorLabel => 'Viga:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Iga päev aadressil $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Iga $day kell $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Rakenduse käivitamisel';

  @override
  String get adminTaskTriggerTypeDaily => 'Igapäevane';

  @override
  String get adminTaskTriggerTypeWeekly => 'Iganädalane';

  @override
  String get adminTaskTriggerTypeInterval => 'Vahepeal';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervall';

  @override
  String get adminTaskTriggerEveryHour => 'Iga tund';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tundi',
      one: '1 tund',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Aeg';

  @override
  String get adminActivityJustNow => 'Just praegu';

  @override
  String get adminActivityLastHour => 'Viimane tund';

  @override
  String get adminActivityToday => 'Täna';

  @override
  String get adminActivityYesterday => 'eile';

  @override
  String get adminActivityOlder => 'Vanemad';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d tagasi';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h tagasi';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m tagasi';
  }

  @override
  String get adminActivityNow => 'nüüd';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours t';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days p';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigureerige eelvaate pisipiltide jaoks trickplay-piltide genereerimine.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Avalik HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Baas-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'nt /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Avalik HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Nõua HTTPS-i';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Suuna kõik kaugpäringud HTTPS-ile. Ei avalda mõju, kui serveril pole kehtivat sertifikaati.';

  @override
  String get adminNetworkingCertPassword => 'Sertifikaadi parool';

  @override
  String get adminNetworkingEnableIpv4 => 'Luba IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Luba IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Kohtvõrgud';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Kaug-IP-filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API seade';

  @override
  String get adminPlaybackAutomatic => '0 = automaatne';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkodeerimise temp tee';

  @override
  String get adminPlaybackSegmentDeletion => 'Luba segmendi kustutamine';

  @override
  String get adminPlaybackSegmentKeep => 'Segmendi säilitamine (sekundites)';

  @override
  String get adminPlaybackThrottleBuffering => 'Drosselklapi puhverdus';

  @override
  String get adminPlaybackThrottleDelay => 'Piiramise viivitus (sekundites)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Luba subtiitrite eraldamine lennult';

  @override
  String get adminResumeMinPct => 'Minimaalne jätkamise protsent';

  @override
  String get adminResumeMinPctSubtitle =>
      'Edenemise salvestamiseks tuleb sisu esitada sellest protsendist üle';

  @override
  String get adminResumeMaxPct => 'Maksimaalne jätkamise protsent';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Pärast seda protsenti loetakse sisu täielikult esitatuks';

  @override
  String get adminResumeMinDuration =>
      'Jätkamise minimaalne kestus (sekundites)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Sellest lühemaid esemeid ei saa jätkata';

  @override
  String get adminTrickplayScanBehavior => 'Skaneerimise käitumine';

  @override
  String get adminTrickplayProcessPriority => 'Protsessi prioriteet';

  @override
  String get adminTrickplayTileWidth => 'Plaatide laius';

  @override
  String get adminTrickplayTileHeight => 'Plaatide kõrgus';

  @override
  String get adminTrickplayProcessThreads => 'Töötle niidid';

  @override
  String get adminTrickplayWidthResolutions => 'Laiuse eraldusvõimed';

  @override
  String get adminMetadataDefault => 'Vaikimisi';

  @override
  String get adminMetadataContentTypeUpdated => 'Sisutüüp on värskendatud';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Sisutüübi värskendamine ebaõnnestus: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Aeglase reageerimise lävi (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'Luba aeglase vastuse hoiatused';

  @override
  String get adminGeneralQuickConnect => 'Luba Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metaandmed';

  @override
  String get adminGeneralSectionPaths => 'Teed';

  @override
  String get adminGeneralSectionPerformance => 'Jõudlus';

  @override
  String get adminGeneralCachePath => 'Vahemälu tee';

  @override
  String get adminGeneralMetadataPath => 'Metaandmete tee';

  @override
  String get adminGeneralServerName => 'Serveri nimi';

  @override
  String get adminGeneralDisplayLanguage => 'Eelistatud kuvakeel';

  @override
  String get adminSettingsLoadFailed => 'Seadete laadimine ebaõnnestus';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Vastendite värskendamine ebaõnnestus: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Ajapiirang: $duration';
  }

  @override
  String get folders => 'Kaustad';

  @override
  String get libraries => 'Meediakogud';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay on keelatud';

  @override
  String get syncPlayDisabledMessage =>
      'Sünkroonitud taasesituse kasutamiseks lubage seadetes SyncPlay.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serverit ei toetata';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay nõuab Jellyfini serverit. Praegune server seda ei toeta.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay grupp';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grupp';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# osalejat',
      one: '# osaleja',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignoreeri ootamist';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ärge hoidke rühma üleval, kui seade puhverdab';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Jätkake kohapeal, ootamata aeglaseid liikmeid';

  @override
  String get syncPlayRepeat => 'Korda';

  @override
  String get syncPlayRepeatOne => 'Üks';

  @override
  String get syncPlayShuffleModeShuffled => 'Segatud';

  @override
  String get syncPlayShuffleModeSorted => 'Sorteeritud';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sünkrooni praegune taasesitusjärjekord';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Asendage rühmajärjekord kohapeal esitatavaga';

  @override
  String get syncPlayLeaveGroup => 'Lahku rühmast';

  @override
  String get syncPlayGroupQueue => 'Grupi järjekord';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Üksus $index';
  }

  @override
  String get syncPlayPlayNow => 'Mängi nüüd';

  @override
  String get syncPlayCreateNewGroup => 'Looge uus grupp';

  @override
  String get syncPlayGroupName => 'Grupi nimi';

  @override
  String get syncPlayDefaultGroupName => 'Minu SyncPlay grupp';

  @override
  String get syncPlayCreateGroup => 'Loo grupp';

  @override
  String get syncPlayAvailableGroups => 'Saadaolevad rühmad';

  @override
  String get syncPlayNoGroupsAvailable => 'Ühtegi rühma pole saadaval';

  @override
  String get syncPlayJoinGroupQuestion => 'Kas liituda SyncPlay grupiga?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay grupiga liitumine võib teie praeguse taasesitusjärjekorra asendada. Kas jätkata?';

  @override
  String get syncPlayJoin => 'Liitu';

  @override
  String get syncPlayStateIdle => 'Tühikäik';

  @override
  String get syncPlayStateWaiting => 'Ootan';

  @override
  String get syncPlayStatePaused => 'Peatatud';

  @override
  String get syncPlayStatePlaying => 'Mängib';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName liitus SyncPlay grupiga';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName lahkus SyncPlay grupist';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay juurdepääs keelatud';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Teil pole juurdepääsu ühele või mitmele selle SyncPlay grupi üksusele. Paluge rühma omanikul kinnitada teegi õigused või valida mõni muu järjekord.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Taasesituse sünkroonimine $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Häälotsing pole saadaval.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play ebaõnnestus';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Selle Dolby Visioni voo otseesituse käivitamine ebaõnnestus. Kas proovida serveri ümberkodeerimist uuesti kasutada?';

  @override
  String get retryWithTranscode => 'Proovige uuesti ümberkodeerimisega';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Visioni ei toetata';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'See seade ei saa Dolby Visioni sisu otse dekodeerida. Kasutage HDR10 varuvarianti või taotlege serveri ümberkodeerimist.';

  @override
  String get rememberMyChoice => 'Pidage meeles minu valikut';

  @override
  String get playHdr10Fallback => 'Esitage HDR10 varuvarianti';

  @override
  String get requestTranscode => 'Küsi transkodeerimist';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'leitud # rida',
      one: 'leitud # rida',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Vaata kõiki';

  @override
  String get noItems => 'Üksusi pole';

  @override
  String get switchUser => 'Vaheta kasutajat';

  @override
  String get remoteControl => 'Kaugjuhtimispult';

  @override
  String get mediaBarLoading => 'Meediumiriba laadimine...';

  @override
  String get mediaBarError => 'Meediumiriba laadimine ebaõnnestus';

  @override
  String get offlineServerUnavailable =>
      'Internetiga ühendatud, kuid praegune server pole saadaval.';

  @override
  String get offlineNoInternet =>
      'Olete võrguühenduseta. Saadaval on ainult allalaaditud sisu.';

  @override
  String get offlineFileNotAvailable => 'Fail pole saadaval';

  @override
  String get offlineSwitchServer => 'Vaheta serverit';

  @override
  String get offlineSavedMedia => 'Salvestatud meedia';

  @override
  String get offlineBannerTitle => 'Oled võrguühenduseta';

  @override
  String get offlineBannerSubtitle => 'Näitame sinu allalaadimisi';

  @override
  String get serverUnreachableBannerTitle => 'Serveriga ei saa ühendust';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Esitame allalaadimistest, kuni ühendus taastub';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Kaugesitus';

  @override
  String castControlFailed(String error) {
    return 'Ülekande juhtimine ebaõnnestus: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Juhtelemendid';
  }

  @override
  String get castDeviceVolume => 'Seadme helitugevus';

  @override
  String get castVolumeUnavailable => 'Pole saadaval';

  @override
  String castStopKind(String kind) {
    return 'Peata $kind';
  }

  @override
  String get audioLabel => 'Heli';

  @override
  String get subtitlesLabel => 'Subtiitrid';

  @override
  String get pinConfirmTitle => 'Kinnitage PIN-kood';

  @override
  String get pinSetTitle => 'Määra PIN';

  @override
  String get pinEnterTitle => 'Sisestage PIN-kood';

  @override
  String get pinReenterToConfirm => 'Kinnitamiseks sisestage PIN-kood uuesti';

  @override
  String pinEnterNDigit(int length) {
    return 'Sisestage $length-kohaline PIN-kood';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Sisestage oma $length-kohaline PIN-kood';
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
  String get pinIncorrect => 'Vale PIN-kood';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-koodid ei ühti';

  @override
  String get pinForgot => 'Unustasite PIN-koodi?';

  @override
  String get pinClear => 'Tühjenda';

  @override
  String get pinBackspace => 'Tagasilükkeklahv';

  @override
  String get quickConnectAuthorized => 'Quick Connecti taotlus on lubatud.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connecti kood on kehtetu või aegunud.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connecti ei toetata selles serveris.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connecti koodi autoriseerimine ebaõnnestus.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect on selles serveris keelatud.';

  @override
  String get quickConnectForbidden =>
      'Teie konto ei saa seda Quick Connecti taotlust autoriseerida.';

  @override
  String get quickConnectNotFound =>
      'Quick Connecti koodi ei leitud. Proovige uut koodi.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ebaõnnestus: $message';
  }

  @override
  String get quickConnectEnterCode => 'Sisestage kood';

  @override
  String get quickConnectAuthorize => 'Volita';

  @override
  String remoteCommandFailed(String error) {
    return 'Käsk ebaõnnestus: $error';
  }

  @override
  String get remoteControlTitle => 'Kaugjuhtimispult';

  @override
  String get remoteFailedToLoadSessions => 'Seansside laadimine ebaõnnestus';

  @override
  String get remoteNoSessions => 'Kontrollitavaid seansse pole';

  @override
  String get remoteStartPlayback => 'Alustage taasesitust teises seadmes';

  @override
  String get unknownUser => 'Tundmatu';

  @override
  String get unknownItem => 'Tundmatu';

  @override
  String get remoteNothingPlaying => 'Sellel seansil ei mängita midagi';

  @override
  String get castingStarted => 'Ülekandmine algas valitud seadmes';

  @override
  String castingFailed(String error) {
    return 'Ülekandmise alustamine ebaõnnestus: $error';
  }

  @override
  String get noRemoteDevices => 'Kaugesituse seadmeid pole saadaval.';

  @override
  String get noRemoteDevicesIos =>
      'Kaugesituse seadmeid pole saadaval.\n\niOS-is ei pruugi AirPlay sihtmärgid simulaatoris saadaval olla.';

  @override
  String get trackActionPlayNext => 'Mängi edasi';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Lisa järjekorda';

  @override
  String get trackActionAddToPlaylist => 'Lisa esitusloendisse';

  @override
  String get trackActionCancelDownload => 'Tühista allalaadimine';

  @override
  String get trackActionDeleteFromPlaylist => 'Kustuta esitusloendist';

  @override
  String get trackActionMoveUp => 'Liigu üles';

  @override
  String get trackActionMoveDown => 'Liigu alla';

  @override
  String get trackActionRemoveFromFavorites => 'Eemalda lemmikutest';

  @override
  String get trackActionAddToFavorites => 'Lisa lemmikute hulka';

  @override
  String get trackActionGoToAlbum => 'Minge albumisse';

  @override
  String get trackActionGoToArtist => 'Mine Artist';

  @override
  String trackActionDownloading(String name) {
    return '$name allalaadimine...';
  }

  @override
  String get trackActionDeletedFile => 'Allalaaditud fail on kustutatud';

  @override
  String get trackActionDeleteFileFailed =>
      'Allalaaditud faili ei saanud kustutada';

  @override
  String get shuffleBy => 'Juhuslikult';

  @override
  String get shuffleSelectLibrary => 'Valige Raamatukogu';

  @override
  String get shuffleSelectGenre => 'Valige Žanr';

  @override
  String get shuffleLibrary => 'Meediakogu';

  @override
  String get shuffleGenre => 'Žanr';

  @override
  String get shuffleNoLibraries => 'Ühilduvaid teeke pole saadaval.';

  @override
  String get shuffleNoGenres =>
      'Selle segamisrežiimi jaoks ei leitud ühtegi žanri.';

  @override
  String get posterDisplayTitle => 'Ekraan';

  @override
  String get posterImageType => 'Pildi tüüp';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Pisipilt';

  @override
  String get imageTypeBanner => 'Bänner';

  @override
  String get playlistAddFailed => 'Esitusloendisse lisamine ebaõnnestus';

  @override
  String get playlistCreateFailed => 'Esitusloendi loomine ebaõnnestus';

  @override
  String get playlistNew => 'Uus esitusloend';

  @override
  String get playlistCreate => 'Loo';

  @override
  String get playlistCreateNew => 'Loo uus esitusloend';

  @override
  String get playlistNoneFound => 'Esitusloendeid ei leitud';

  @override
  String get addToPlaylist => 'Lisa esitusloendisse';

  @override
  String get lyricsNotAvailable => 'Laulusõnu pole saadaval';

  @override
  String get upNext => 'Üles Järgmine';

  @override
  String get playNext => 'Mängi edasi';

  @override
  String get stillWatchingContent =>
      'Taasesitus on peatatud. Kas sa ikka vaatad?';

  @override
  String get stillWatchingStop => 'Peata';

  @override
  String get stillWatchingContinue => 'Jätka';

  @override
  String skipSegment(String segment) {
    return 'Jäta vahele $segment';
  }

  @override
  String get liveTv => 'Otse-TV';

  @override
  String get continueWatchingAndNextUp => 'Jätkake vaatamist ja järgmist';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Allalaadimine $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Allalaadimine $fileName';
  }

  @override
  String get nextEpisode => 'Järgmine episood';

  @override
  String get moreFromThisSeason => 'Veel sellest hooajast';

  @override
  String get playerTooltipPlaybackSpeed => 'Taasesituse kiirus';

  @override
  String get playerTooltipCastControls => 'Cast juhtnupud';

  @override
  String get playerTooltipPlaybackQuality => 'Bitikiirus';

  @override
  String get playerTooltipEnterFullscreen => 'Sisenege täisekraanil';

  @override
  String get playerTooltipExitFullscreen => 'Välju täisekraanilt';

  @override
  String get playerTooltipFloatOnTop => 'Hõljuge peal';

  @override
  String get playerTooltipExitFloatOnTop => 'Keela ujuk peal';

  @override
  String get playerTooltipLockLandscape => 'Lukusta maastik';

  @override
  String get playerTooltipUnlockOrientation => 'Luba pöörlemine';

  @override
  String get playerTooltipPrevious => 'Eelmine';

  @override
  String get playerTooltipSeekBack => 'Otsige tagasi';

  @override
  String get playerTooltipSeekForward => 'Otsige edasi';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Märgi vaadatuks';

  @override
  String get contextMenuMarkUnwatched => 'Märgi jälgimata';

  @override
  String get contextMenuAddToFavorites => 'Lisa lemmikute hulka';

  @override
  String get contextMenuRemoveFromFavorites => 'Eemalda lemmikutest';

  @override
  String get contextMenuGoToSeries => 'Minge seeriasse';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Peida jaotisest „Jätka vaatamist“';

  @override
  String get contextMenuHideFromNextUp => 'Peida jaotisest „Järgmisena“';

  @override
  String get contextMenuAddToCollection => 'Lisa kollektsiooni';

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
      'Juurdepääs serveri halduspaneelile';

  @override
  String get settingsDynamicContent => 'Dünaamiline sisu';

  @override
  String get settingsDynamicContentSubtitle =>
      'Meediumiriba ja visuaalsed ülekatted';

  @override
  String get settingsAboutSubtitle =>
      'Rakenduse versioon, juriidiline teave ja krediidid';

  @override
  String get settingsSortServersBy => 'Sorteeri serverid';

  @override
  String get settingsLastUsed => 'Viimati kasutatud';

  @override
  String get settingsAlphabetical => 'Tähestikuline';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Luba ise allkirjastatud sertifikaadid';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Usalda servereid, mis kasutavad ise allkirjastatud või privaatse CA TLS-sertifikaate. Luba ainult enda hallatavate serverite puhul. See keelab sertifikaatide kontrolli kõigil ühendustel.';

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
  String get settingsHomePage => 'Avaleht';

  @override
  String get settingsTwentyFourHourClock => '24-tunnine kell';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Kasutage 24-tunnise kellaaja vormindamist kõikjal, kus kella kuvatakse';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Kuvage navigeerimisribal juhuesitusnupp';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Kuvage navigeerimisribal žanrite nupp';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Kuvage navigeerimisribal lemmikute nupp';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Kuvage navigeerimisribal teekide nupp';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Näita Seerri nuppu navigeerimisribal';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Näita ülemisel navigeerimisribal alati tekstisilte';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Avalehe nähtavuse sisse- ja väljalülitamine teegi kaupa. Muudatuste jõustumiseks taaskäivitage Moonfin.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Meediumiriba ja kohalikud eelvaated';

  @override
  String get settingsVisualOverlays => 'Visuaalsed ülekatted';

  @override
  String get settingsSeasonalSurprise => 'Hooajaline üllatus';

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
  String get settingsHigh => 'Kõrge';

  @override
  String get settingsLow => 'Madal';

  @override
  String get settingsCustomPath => 'Kohandatud tee';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Sisestage allalaaditava kausta tee';

  @override
  String get settingsConcurrentDownloads => 'Samaaegsed allalaadimised';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimaalne korraga allalaaditavate üksuste arv.';

  @override
  String get settingsAppInfo => 'RAKENDUSE INFO';

  @override
  String get settingsReportAnIssue => 'Probleemist teavitamine';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Avage GitHubis probleemide jälgija';

  @override
  String get settingsJoinDiscord => 'Liituge Discordiga';

  @override
  String get settingsJoinDiscordSubtitle => 'Vestelge kogukonnaga';

  @override
  String get settingsJoinTheDiscord => 'Liituge Discordiga';

  @override
  String get settingsSupportMoonfin => 'Toetage Moonfinit';

  @override
  String get settingsSupportMoonfinSubtitle => 'Annetage arendajale kohv';

  @override
  String get settingsLegal => 'ÕIGUSLIK';

  @override
  String get settingsLicenses => 'Litsentsid';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avatud lähtekoodiga litsentsi teatised';

  @override
  String get settingsPrivacyPolicy => 'Privaatsuspoliitika';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kuidas Moonfin teie andmeid käsitleb';

  @override
  String get settingsCheckForUpdates => 'Kontrollige värskendusi';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kontrollige uusimat Moonfini väljaannet';

  @override
  String get settingsBoth => 'Mõlemad';

  @override
  String get settingsShuffleContentTypeFilter => 'Juhusliku sisutüübi filter';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Helirajad, töötlemine ja läbipääsuvalikud';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automaatne taasesitus ja järjestus';

  @override
  String get settingsSyncplaySubtitle => 'Grupiseansside sünkroonimisloogika';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Kas jätta sissejuhatused ja välised vahele?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Meediasegmendi loendur';

  @override
  String get settingsProgressBar => 'Edenemisriba';

  @override
  String get settingsTimer => 'Taimer';

  @override
  String get settingsNone => 'Puudub';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Küsi kasutajat';

  @override
  String get settingsSkip => 'Jäta vahele';

  @override
  String get settingsDoNothing => 'Ära tee midagi';

  @override
  String get settingsMaxBitrateDescription =>
      'Piirake voogesituse bitikiirust. Sellest lävest ületav sisu ümberkodeeritakse, et see sobiks.';

  @override
  String get settingsMaxResolutionDescription =>
      'Piirake maksimaalset eraldusvõimet, mida mängija taotleb. Kõrgema eraldusvõimega sisu transkodeeritakse allapoole.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kuidas tuleks videot ekraanile sobitamiseks skaleerida.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Taasesitusmootor (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Valige Android TV seadmete vaike taasesitusmootor. Muudatused rakenduvad järgmisele taasesitusseansile.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (soovitatav)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (pärand)';

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
  String get settingsDolbyVisionFallback => 'Dolby Visioni tagavara';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Visioni pealkirjade käitumine seadmetes, kus puudub Dolby Vision dekodeerimine.';

  @override
  String get settingsAskEachTime => 'Küsi iga kord';

  @override
  String get settingsPreferHdr10Fallback => 'Eelista HDR10 varu';

  @override
  String get settingsPreferServerTranscode =>
      'Eelista serveri ümberkodeerimist';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profiil 7 Otsesesitus';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Määrab, kas Dolby Vision 7. profiili täiustuskihi vood peaksid esitust suunama.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automaatne (AFTKRT lubatud)';

  @override
  String get settingsEnabledOnThisDevice => 'Selles seadmes lubatud';

  @override
  String get settingsDisabledPreferTranscode =>
      'Keelatud (eelistage ümberkodeerimist)';

  @override
  String get settingsResumeRewindDescription =>
      'Mitu sekundit tuleks taasesituse jätkamisel (Jätka vaatamist või meediumiüksuse lehelt) tagasi kerida?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Mitu sekundit tuleks tagasi kerida, kui jätkate taasesitust pärast pausinupu vajutamist?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Mitu sekundit pärast tagasikerimise nupu vajutamist tagasi hüpata.';

  @override
  String get settingsOneSecond => '1 sekund';

  @override
  String get settingsThreeSeconds => '3 sekundit';

  @override
  String get settingsFortyFiveSeconds => '45 sekundit';

  @override
  String get settingsSixtySeconds => '60 sekundit';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Mitu sekundit pärast edasikerimise nupu vajutamist edasi hüpata.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitivoog AC3 välisele dekoodrile';

  @override
  String get settingsCinemaMode => 'Kinorežiim';

  @override
  String get settingsCinemaModeSubtitle =>
      'Enne põhifunktsiooni esitage treilereid/eelreklaame';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Laiendatud kuvab täieliku kaardi koos jaokujunduse ja kirjeldusega. Minimaalne näitab kompaktset loenduri ülekatet. Keelatud peidab viipa täielikult.';

  @override
  String get settingsShort => 'Lühike';

  @override
  String get settingsLong => 'Pikk';

  @override
  String get settingsVeryLong => 'Väga pikk';

  @override
  String get settingsVideoStartDelay => 'Video käivitamise viivitus';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Otse-TV';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Luba otseesitus otsesaadete jaoks';

  @override
  String get settingsOpenGroups => 'Avage rühmad';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Looge, liituge või hallake SyncPlay gruppe';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay lubatud';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Lubage rühmavaatamise funktsioonid';

  @override
  String get settingsSyncplayButton => 'SyncPlay nupp';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Kuvage navigeerimisribal nuppu SyncPlay';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Täiustatud parandus';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Luba peeneteraline sünkroonimisloogika';

  @override
  String get settingsSyncplaySyncCorrection => 'Sünkroonimisparandus';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Reguleerige esitust automaatselt, et sünkroonis püsida';

  @override
  String get settingsSyncplaySpeedToSync => 'Sünkroonimise kiirus';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Kasutage sünkroonimiseks taasesituskiiruse reguleerimist';

  @override
  String get settingsSyncplaySkipToSync => 'Jätke sünkroonimise juurde';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Kasutage sünkroonimiseks otsimist';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimaalne kiiruse viivitus';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maksimaalse kiiruse viivitus';

  @override
  String get settingsSyncplaySpeedDuration => 'Kiiruse kestus';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimaalne vahelejätmise viivitus';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Lisanihe';

  @override
  String get onNow => 'Sisse kohe';

  @override
  String get collections => 'Kollektsioonid';

  @override
  String get lastPlayed => 'Viimati mängitud';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Viimased $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Hiljuti ilmunud: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Järgmise jao automaatne esitamine';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Esitage järgmine jagu automaatselt, kui see on saadaval.';

  @override
  String get skipSilenceTitle => 'Jäta vaikus vahele';

  @override
  String get skipSilenceSubtitle =>
      'Kui voog toetab, jätke vaiksed helisegmendid automaatselt vahele.';

  @override
  String get allowExternalAudioEffectsTitle => 'Luba välised heliefektid';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Lubage ekvalaiseri ja efektide rakendustel (nt Wavelet) lisada Media3 taasesitusseanssidele.';

  @override
  String get disableTunnelingTitle => 'Keela tunneldamine';

  @override
  String get disableTunnelingSubtitle =>
      'Sunnita tunneleerimata taasesitus. Kasulik heli/video katkestustega seadmetes.';

  @override
  String get enableTunnelingTitle => 'Luba tunneldamine';

  @override
  String get enableTunnelingSubtitle =>
      'Täpsem seade. Suunab heli ja video seotud riistvaratee kaudu. Vaikimisi väljas, kuna see põhjustab mõnes seadmes heli- ja pildikatkestusi.';

  @override
  String get mapDolbyVisionP7Title =>
      'Kaardistada Dolby Vision profiil 7 HEVC-ga';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Esitage Dolby Vision profiili 7 voogusid HDR10-ühilduva HEVC-na mitte-DV-seadmetes.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Kasutage manustatud subtiitrite stiile';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Kasutage subtiitrirajale manustatud värve, fonte ja paigutust. Keelake selle asemel oma subtiitrite stiili eelistuste kasutamine.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Kasutage manustatud subtiitrite fondi suurust';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Rakendage subtiitrite rajale manustatud fondisuuruse vihjeid. Keelake oma stiilieelistuste alusel subtiitrite suuruse kasutamine.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Näita meedia üksikasju';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Näita valitud üksuse üksikasju kogulehtede ülaosas.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Kasutage üksikasjalikke alapealkirju';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Kuva üksikasjalikud või minimaalsed alamread raamatukogu lehtedel.';

  @override
  String get savedThemesDeleteDialogTitle => 'Kas kustutada salvestatud teema?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Kas eemaldada \"$themeName\" sellest seadme vahemälust?';
  }

  @override
  String get themeStore => 'Teemapood';

  @override
  String get themeStoreSubtitle => 'Sirvi ja salvesta kogukonna teemasid';

  @override
  String get themeStoreDescription =>
      'Salvesta teema, et kasutada seda nagu teisi salvestatud teemasid.';

  @override
  String get themeStoreEmpty => 'Praegu pole ühtegi teemat saadaval.';

  @override
  String get themeStoreLoadFailed =>
      'Teemapoodi ei õnnestunud laadida. Kontrolli ühendust ja proovi uuesti.';

  @override
  String get themeStoreSave => 'Salvesta';

  @override
  String get themeStoreSaveAndApply => 'Salvesta ja rakenda';

  @override
  String get themeStoreSaved => 'Salvestatud';

  @override
  String get themeStoreInvalidMessage => 'Seda teemat ei õnnestunud laadida.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Teema „$themeName“ salvestatud.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" on sellest seadmest kustutatud.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ei saanud kustutada.';
  }

  @override
  String get savedThemesTitle => 'Salvestatud teemad';

  @override
  String get savedThemesDescription =>
      'Need on praeguse serveri pluginast Moonfin alla laaditud teemad. Kustutamine eemaldab ainult selle kohaliku koopia.';

  @override
  String get savedThemesEmpty =>
      'Selle serveri jaoks ei leitud ühtegi salvestatud teemat.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Hetkel aktiivne';
  }

  @override
  String get savedThemesDeleteTooltip => 'Kustutage salvestatud teema';

  @override
  String get savedThemesManageSubtitle =>
      'Hallake selles seadmes allalaaditud pistikprogrammide teemasid';

  @override
  String get themeEditor => 'Teemaredaktor';

  @override
  String get themeEditorSubtitle => 'Avage brauseris Moonfin teemaredaktor';

  @override
  String get homeScreen => 'Avakuva';

  @override
  String get bottomBar => 'Alumine riba';

  @override
  String get homeRowsStyleClassic => 'Klassikaline';

  @override
  String get homeRowsStyleModern => 'Kaasaegne';

  @override
  String get homeRowsSection => 'Kodu read';

  @override
  String get rowsType => 'Ridade tüüp';

  @override
  String get rowsTypeDescription =>
      'Classic säilitab reapõhise pilditüübi ja teabe ülekatte. Modern kasutab portree-taustadekoratsiooni ridu.';

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
  String get displayFavoritesRows => 'Kuva lemmikute read';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Kuva lemmikfilmid, -sarjad ja muud lemmikridad avalehe jaotistes.';

  @override
  String get favoritesRowSorting => 'Lemmikute ridade sortimine';

  @override
  String get favoritesRowSortingDescription =>
      'Sorteerige lemmikute ridu lisamiskuupäeva, väljalaskekuupäeva, tähestiku ja muu järgi.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Kuva kogude read';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Kuva kogude read avalehe jaotistes.';

  @override
  String get collectionsRowSorting => 'Kogude ridade sortimine';

  @override
  String get collectionsRowSortingDescription =>
      'Sorteerige kogude ridu lisamiskuupäeva, väljalaskekuupäeva, tähestiku ja muu järgi.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Kuva Žanrid read';

  @override
  String get displayGenresRowsSubtitle =>
      'Kuva žanrite read avalehe jaotistes.';

  @override
  String get genresRowSorting => 'Žanrid ridade sorteerimine';

  @override
  String get genresRowSortingDescription =>
      'Sorteerige Žanrite ridu lisamiskuupäeva, väljalaskekuupäeva, tähestiku ja muu järgi.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Žanrid rea elemendid';

  @override
  String get genresRowItemsDescription =>
      'Kuva filmid, seriaalid või mõlemad žanrite ridadel.';

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
  String get displayPlaylistsRows => 'Näita esitusloendite ridu';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Näita esitusloendite ridu avaekraani jaotistes.';

  @override
  String get playlistsRowSorting => 'Esitusloendite ridade sortimine';

  @override
  String get playlistsRowSortingDescription =>
      'Sordi esitusloendite ridu lisamiskuupäeva, ilmumiskuupäeva, tähestiku ja muu järgi.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Näita heliridu';

  @override
  String get displayAudioRowsSubtitle => 'Näita heliridu avaekraani jaotistes.';

  @override
  String get audioRowsSorting => 'Heliridade sortimine';

  @override
  String get audioRowsSortingDescription =>
      'Sordi heliridu lisamiskuupäeva, ilmumiskuupäeva, tähestiku ja muu järgi.';

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
  String get audioPlaylists => 'Heliesitusloendid';

  @override
  String get appearance => 'Välimus';

  @override
  String get layout => 'Paigutus';

  @override
  String get theme => 'Teema';

  @override
  String get keyboard => 'Klaviatuur';

  @override
  String get navButtons => 'Nupud';

  @override
  String get rendering => 'Renderdamine';

  @override
  String get mpvConfiguration => 'MPV seadistus';

  @override
  String get cardSize => 'Kaardi suurus';

  @override
  String get externalPlayerApp => 'Väline mängija rakendus';

  @override
  String get externalPlayerAppDescription =>
      'Määra väline mängija, et lubada pika vajutuse esitusvalik';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Kuva rakenduse valija, kui taasesitus algab.';

  @override
  String get loadingInstalledPlayers => 'Installitud mängijate laadimine...';

  @override
  String get connection => 'Ühendus';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Läbipääs';

  @override
  String get supportedOnThisDevice => 'Selles seadmes toetatud';

  @override
  String get notSupportedOnThisDevice => 'Selles seadmes ei toetata';

  @override
  String get mediaPlayerBehavior => 'Meediumipleieri käitumine';

  @override
  String get playbackEnhancements => 'Taasesituse täiustused';

  @override
  String get alwaysOn => 'Alati sees.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Asendage Skip Outro järgmise ekraaniga';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Kuvage ülekate Next Up (Järgmine üles) nupu Skip Outro asemel.';

  @override
  String get playerRouting => 'Mängija marsruutimine';

  @override
  String get preferSoftwareDecoders => 'Eelista tarkvaradekoodereid';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Kasutage enne riistvaradekoodereid FFmpeg (heli) ja libgav1 (AV1). Keelake, kui HDMI-heli läbilaskevõime katkeb.';

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
  String get useExternalPlayer => 'Kasutage välist mängijat';

  @override
  String get useExternalPlayerSubtitle =>
      'Avage Android TV valitud välisrakenduses video taasesitus.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automaatne järjekord';

  @override
  String get preferSdhSubtitles => 'Eelista SDH subtiitreid';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Seadistage automaatsel valimisel prioriteediks SDH/CC subtiitrirajad.';

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
  String get webDiagnostics => 'Veebi diagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin Veebidiagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Kasutage seda lehte brauseri ühenduvusprobleemide diagnoosimiseks (CORS, segasisu ja avastusseaded).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Tuvastatud segasisu tõrge';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Tuvastatud CORS-i/lennueelse rike';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin tuvastas HTTPS-i lehe, mis üritas helistada HTTP-serveri URL-ile. Brauserid blokeerivad selle päringu enne, kui see teie serverisse jõuab.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin tuvastas brauseri tasemel päringu tõrke, mille tavaliselt põhjustab meediumiserveris puuduv CORS või eelkontrolli päised.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Siht-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Üksikasjad: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Praegune käitusaja kontekst';

  @override
  String get webDiagnosticsOrigin => 'Päritolu';

  @override
  String get webDiagnosticsScheme => 'Skeem';

  @override
  String get webDiagnosticsPluginMode => 'Plugina režiim';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC skannimine';

  @override
  String get webDiagnosticsForcedServerUrl => 'Sunnitud serveri URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Serveri vaike-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery puhverserveri URL';

  @override
  String get notConfigured => 'pole konfigureeritud';

  @override
  String get webDiagnosticsMixedContent => 'Segatud sisu';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'See leht laaditakse HTTPS-i kaudu, kuid üks või mitu konfigureeritud URL-i on HTTP. Brauserid blokeerivad HTTPS-i lehtedel HTTP API-de kutsumise.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Parandus: teenindage oma meediumiserverit või puhverserveri lõpp-punkti HTTPS-i kaudu või laadige Moonfin HTTP kaudu ainult usaldusväärsetes kohalikes võrkudes.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Praeguste käitusaja seadete põhjal ei tuvastatud ilmset segasisu konfiguratsiooni.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORSi kontrollnimekiri';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Luba brauseri lähtekoht valikus Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Lisage jaotisesse Access-Control-Allow-Headers Autoriseerimine, X-Emby-Authorization ja X-Emby-Token.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Avaldage voogesituse ja otsingu käitumise jaoks sisuvahemikku ja aktsepteerimisvahemikku.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Naaske 204 OPTIONSi lennueelsete taotluste juurde.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Päise väljavõtte näide (nginxi stiilis)';

  @override
  String get note => 'Märkus';

  @override
  String get webDiagnosticsNonWebNote =>
      'See diagnostikamarsruut on mõeldud veebi koostamiseks. Kui näete seda mõnel teisel platvormil, ei pruugi need kontrollid kehtida.';

  @override
  String get backToServerSelect => 'Tagasi serverisse Valige';

  @override
  String get signOutAllUsers => 'Logi välja kõik kasutajad';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofoni luba on jäädavalt keelatud. Luba see süsteemiseadetes.';

  @override
  String get voiceSearchPermissionRequired =>
      'Häälotsingu jaoks on vaja mikrofoni luba.';

  @override
  String get voiceSearchNoMatch => 'Ei saanud sellest aru. Proovi uuesti.';

  @override
  String get voiceSearchNoSpeechDetected => 'Kõnet ei tuvastatud.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofoni viga.';

  @override
  String get voiceSearchNeedsInternet => 'Häälotsing vajab Internetti.';

  @override
  String get voiceSearchServiceBusy => 'Kõneteenus on hõivatud. Proovi uuesti.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofoni luba on jäädavalt keelatud.';

  @override
  String get microphonePermissionDenied => 'Mikrofoni luba on keelatud.';

  @override
  String get speechRecognitionUnavailable =>
      'Kõnetuvastus pole selles seadmes saadaval.';

  @override
  String get openIosRoutePicker => 'Avage iOS-i marsruudi valija';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay marsruudi valija pole selles seadmes saadaval.';

  @override
  String get videos => 'Videod';

  @override
  String get programs => 'Programmid';

  @override
  String get songs => 'Laulud';

  @override
  String get photoAlbums => 'Fotoalbumid';

  @override
  String get photos => 'Fotod';

  @override
  String get people => 'Inimesed';

  @override
  String get recentlyReleasedEpisodes => 'Hiljuti avaldatud episoodid';

  @override
  String get watchAgain => 'Vaata uuesti';

  @override
  String get guestAppearances => 'Külalisesinemised';

  @override
  String get appearancesSeerr => 'Esinemised (Seerr)';

  @override
  String get crewContributionsSeerr => 'Meeskonna panused (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Vaadake koos rühmaga';

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
  String get disk => 'Ketas';

  @override
  String get openInBrowser => 'Avage brauseris';

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
      'Manustatud brauser pole sellel platvormil saadaval.';

  @override
  String get adminRestartServerConfirmation =>
      'Kas olete kindel, et soovite serveri taaskäivitada?';

  @override
  String get adminShutdownServerConfirmation =>
      'Kas olete kindel, et soovite serveri sulgeda? Peate selle käsitsi taaskäivitama.';

  @override
  String get internal => 'Sisemine';

  @override
  String get idle => 'Tühikäik';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Ühtegi kasutajat ei leitud';

  @override
  String get adminNoUsersMatchSearch =>
      'Teie otsingule ei vasta ükski kasutaja';

  @override
  String get adminNoDevicesFound => 'Ühtegi seadet ei leitud';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ükski seade ei vasta praegustele filtritele';

  @override
  String get remoteAccess => 'Kaugjuurdepääs';

  @override
  String get localOnly => 'Ainult kohalik';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Meediaanalüüsi laadimine ebaõnnestus';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombineeritud analüüs kõigis meediumiteekides.';

  @override
  String get analyticsTopArtists => 'Tippkunstnikud';

  @override
  String get analyticsTopAuthors => 'Parimad autorid';

  @override
  String get analyticsTopContributors => 'Peamised panustajad';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kogu',
      one: '1 kogu',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Selle valiku jaoks pole veel ühtegi indekseeritud meedia kogusummat saadaval.';

  @override
  String get analyticsLibraryDetails => 'Raamatukogu üksikasjad';

  @override
  String get analyticsLibraryBreakdown => 'Raamatukogu jaotus';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Ühtegi raamatukogu pole saadaval.';

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
  String get adminServerAdministrationTitle => 'Serveri administreerimine';

  @override
  String get adminServerPathData => 'Andmed';

  @override
  String get adminServerPathImageCache => 'Pildi vahemälu';

  @override
  String get adminServerPathCache => 'Vahemälu';

  @override
  String get adminServerPathLogs => 'Palgid';

  @override
  String get adminServerPathMetadata => 'Metaandmed';

  @override
  String get adminServerPathTranscode => 'Ümberkodeerimine';

  @override
  String get adminServerPathWeb => 'Veeb';

  @override
  String get adminNoServerPathsReturned =>
      'See server ei tagastanud ühtegi serveriteed.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% kasutatud';
  }

  @override
  String get userActivity => 'Kasutaja tegevus';

  @override
  String get systemEvents => 'Süsteemi sündmused';

  @override
  String get needsAttention => 'Vajab Tähelepanu';

  @override
  String get homeVideos => 'Koduvideod';

  @override
  String get mixedContent => 'Segatud sisu';

  @override
  String get homeVideosAndPhotos => 'Koduvideod ja fotod';

  @override
  String get mixedMoviesAndShows => 'Segafilmid ja -saated';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Salvestisi ei leitud';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension arhiivist ei leitud ühtegi pildilehte.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Manustatud renderdaja ebaõnnestus ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-i renderdaja nurjus ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Lugeja jaoks puudub kohalik fail: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status raamatuandmete avamisel aadressilt $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Loetava raamatu lõpp-punkt pole saadaval';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Toetamata koomiksiarhiivi vorming: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR-i ekstraheerimise pistikprogramm pole sellel platvormil saadaval.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr arhiivi ekstraktimine ebaõnnestus.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 ekstraheerimine pole sellel platvormil saadaval.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 ekstraheerimise pistikprogramm pole sellel platvormil saadaval.';

  @override
  String get loadingShuffle => 'Juhusliku esituse laadimine...';

  @override
  String get libraryShuffleLabel => 'KOGU SEGAMINE';

  @override
  String get randomShuffleLabel => 'JUHUSLIK SEGAMINE';

  @override
  String get genresShuffleLabel => 'ŽANRIDE SEGAMINE';

  @override
  String get autoHdrSwitching => 'Automaatne HDR-i vahetamine';

  @override
  String get autoHdrSwitchingDescription =>
      'Lubage HDR-i automaatselt HDR-video taasesitamiseks ja taastage väljumisel kuvarežiim.';

  @override
  String get whenFullscreen => 'Täisekraanil';

  @override
  String get changeArtwork => 'Muuda kujunduspilti';

  @override
  String get missing => 'Puudub';

  @override
  String get clearAllArtworkButton => 'Kas tühjendada kõik kujunduspildid?';

  @override
  String get clearAllArtworkWarning =>
      'Kas oled kindel, et soovid kõik allalaaditud kujunduspildid tühjendada?';

  @override
  String get confirmClear => 'Kinnita tühjendamine';

  @override
  String confirmClearMessage(String itemType) {
    return 'Kas oled kindel, et soovid tühjendada selle: $itemType?';
  }

  @override
  String get uploadButton => 'Kas laadida üles?';

  @override
  String get resolutionLabel => 'Eraldusvõime: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Näita ainult liidese keeles kujunduspilte';

  @override
  String get confirmClearAll => 'Kinnita kõigi tühjendamine';

  @override
  String get imageUploadSuccess => 'Pilt laaditi edukalt üles!';

  @override
  String imageUploadFailed(String error) {
    return 'Pildi üleslaadimine ebaõnnestus: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Pildi määramine ebaõnnestus: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Pildi kustutamine ebaõnnestus: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Kõigi kujunduspiltide tühjendamine ebaõnnestus: $error';
  }

  @override
  String get yes => 'Jah';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Taustapildid';

  @override
  String get bannerCategory => 'Bänner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Pisipilt';

  @override
  String get artCategory => 'Kujunduspilt';

  @override
  String get discArtCategory => 'Plaadi kujundus';

  @override
  String get screenshotCategory => 'Ekraanipilt';

  @override
  String get boxCoverCategory => 'Karbi esikaas';

  @override
  String get boxRearCoverCategory => 'Karbi tagakaas';

  @override
  String get menuArtCategory => 'Menüü kujundus';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'taustapilt';

  @override
  String get confirmItemBanner => 'bänner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'pisipilt';

  @override
  String get confirmItemArt => 'kujunduspilt';

  @override
  String get confirmItemDiscArt => 'plaadi kujundus';

  @override
  String get confirmItemScreenshot => 'ekraanipilt';

  @override
  String get confirmItemBoxCover => 'karbi esikaas';

  @override
  String get confirmItemBoxRearCover => 'karbi tagakaas';

  @override
  String get confirmItemMenuArt => 'menüü kujundus';

  @override
  String get resolutionAll => 'Kõik';

  @override
  String get resolutionHigh => 'Kõrge (1080p+)';

  @override
  String get resolutionMedium => 'Keskmine (720p)';

  @override
  String get resolutionLow => 'Madal (<720p)';

  @override
  String get sources => 'Allikad';

  @override
  String get audiobookChapters => 'Peatükid';

  @override
  String get audiobookBookmarks => 'Järjehoidjad';

  @override
  String get audiobookNotes => 'Märkmed';

  @override
  String get audiobookQueue => 'Järjekord';

  @override
  String get audiobookTimeline => 'Ajajoon';

  @override
  String get audiobookTimelineEmpty => 'Ajajoon on tühi';

  @override
  String get audiobookFocusedTimeline => 'Kitsendatud ajajoon';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Ekspordi järjehoidjad';

  @override
  String get audiobookExportNotes => 'Ekspordi märkmed';

  @override
  String get audiobookExportAll => 'Ekspordi kõik';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksporditud asukohta $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksportimine ebaõnnestus: $error';
  }

  @override
  String get audiobookLyrics => 'Laulusõnad';

  @override
  String get audiobookAddBookmark => 'Lisa järjehoidja';

  @override
  String get audiobookAddNote => 'Lisa märge';

  @override
  String get audiobookEditNote => 'Muuda märget';

  @override
  String get audiobookNoteHint => 'Kirjuta selle koha kohta märge';

  @override
  String get audiobookSleepTimer => 'Unetaimer';

  @override
  String get audiobookSleepOff => 'Väljas';

  @override
  String get audiobookSleepEndOfChapter => 'Peatüki lõpp';

  @override
  String get audiobookSleepCustom => 'Kohandatud';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining jäänud';
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
  String get audiobookPlaybackSpeed => 'Esituskiirus';

  @override
  String get audiobookRemainingTime => 'Jäänud';

  @override
  String get audiobookElapsedTime => 'Möödunud';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Tagasi $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Edasi $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Eelmine peatükk';

  @override
  String get audiobookNextChapter => 'Järgmine peatükk';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Peatükk $current/$total';
  }

  @override
  String get audiobookNoChapters => 'Peatükke pole';

  @override
  String get audiobookNoBookmarks => 'Järjehoidjaid pole veel';

  @override
  String get audiobookNoNotes => 'Märkmeid pole veel';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Järjehoidja lisatud kohta $position';
  }

  @override
  String get audiobookSpeedReset => 'Lähtesta kiirusele 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Salvesta';

  @override
  String get audiobookCancel => 'Tühista';

  @override
  String get audiobookDelete => 'Kustuta';

  @override
  String get subtitlePreferencesDescription =>
      'Muuda subtiitrite režiime, vaikekeeli, välimust ja renderdamisvalikuid.';

  @override
  String get subtitleRendering => 'Subtiitrite renderdamine';

  @override
  String get displayOptions => 'Kuvamisvalikud';

  @override
  String get releaseDateAscending => 'Ilmumiskuupäev (kasvav)';

  @override
  String get releaseDateDescending => 'Ilmumiskuupäev (kahanev)';

  @override
  String get groupContributions => 'Rühmita panused';

  @override
  String get groupMultipleRoles => 'Rühmita mitu rolli';

  @override
  String get libraryWriteAccessWarningTitle => 'Kogu kirjutusõiguse hoiatus';

  @override
  String get libraryWriteAccessHowToFix => 'Kuidas seda parandada:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Anna Jellyfini teenuse kasutajale (nt jellyfin või Dockeri PUID/PGID) kirjutusõigused serveris asuvatele meediakogu kaustadele.\n\n2. Või mine Jellyfini juhtpaneelile -> Kogud, muuda seda kogu ja keela „Salvesta kujunduspildid meediakaustadesse“, et kujunduspilte hoitaks Jellyfini sisemises andmebaasis.';

  @override
  String get dismiss => 'Sulge';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Sinu kogu \'$libraryName\' on seadistatud salvestama kujunduspilte otse meediakaustadesse (valik „Salvesta kujunduspildid meediakaustadesse“ on lubatud). Jellyfin kontrollis aga kirjutusõigust ja tal pole luba sellesse kataloogi faile kirjutada:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Näib, et Jellyfinil ei õnnestunud kujunduspilti uuendada. Sinu kogu on seadistatud salvestama kujunduspilte otse meediakaustadesse (valik „Salvesta kujunduspildid meediakaustadesse“ on lubatud). See viga tekib tavaliselt siis, kui Jellyfini serveriprotsessil pole luba sinu meediakataloogidesse faile kirjutada.';

  @override
  String get replay => 'Esita uuesti';

  @override
  String get fileInformation => 'Faili teave';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Suurus: $size  •  Vorming: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Näita kõiki ($count) helirada';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Näita kõiki ($count) subtiitrirada';
  }

  @override
  String get checkingDirectPlay => 'Otseesituse toe kontrollimine...';

  @override
  String get directPlayCapabilityLabel => 'Otseesituse tugi: ';

  @override
  String get forced => 'Sunnitud';

  @override
  String get transcodeContainerNotSupported =>
      'Mängija ei toeta konteinerivormingut.';

  @override
  String get transcodeVideoCodecNotSupported => 'Videokoodekit ei toetata.';

  @override
  String get transcodeAudioCodecNotSupported => 'Helikoodekit ei toetata.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtiitrivormingut ei toetata (nõuab pildile põletamist).';

  @override
  String get transcodeAudioProfileNotSupported => 'Heliprofiili ei toetata.';

  @override
  String get transcodeVideoProfileNotSupported => 'Videoprofiili ei toetata.';

  @override
  String get transcodeVideoLevelNotSupported => 'Videotaset ei toetata.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'See seade ei toeta video eraldusvõimet.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bitisügavust ei toetata.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video kaadrisagedust ei toetata.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Faili bitikiirus ületab mängija voogedastuse piiri.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitikiirus ületab voogedastuse piiri.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Heli bitikiirus ületab voogedastuse piiri.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Helikanalite arvu ei toetata.';

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
  String get sortAlphabetical => 'Tähestikuline';

  @override
  String get sortReleaseAscending => 'Ilmumisjärjekord (kasvav)';

  @override
  String get sortReleaseDescending => 'Ilmumisjärjekord (kahanev)';

  @override
  String get sortCustomDragDrop => 'Kohandatud (lohistamisega)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Esitusloendi sortimisvalikud';

  @override
  String get resetSort => 'Lähtesta sortimine';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Vaata uuesti H$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Vaata esitusloendit uuesti';

  @override
  String get noSubtitlesFound => 'Subtiitreid ei leitud.';

  @override
  String get adminControls => 'Administraatori juhtnupud';

  @override
  String get impellerRendering => 'Renderdusmootor (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller on Flutteri moodne GPU-renderdaja, mis annab sujuvamad animatsioonid ja vähem tõrkeid. Mõnes TV-boksis ja vanemas GPU-s võib see põhjustada häireid või musta pilti; sel juhul lülita see välja. Automaatne valib sinu seadme jaoks parima vaikeväärtuse. Muudatuse rakendamiseks käivita Moonfin uuesti.';

  @override
  String get impellerAuto => 'Automaatne';

  @override
  String get impellerOn => 'Sees';

  @override
  String get impellerOff => 'Väljas';

  @override
  String get impellerRestartTitle => 'Vajalik on taaskäivitus';

  @override
  String get impellerRestartMessage =>
      'Renderdusmootori muutmiseks tuleb Moonfin taaskäivitada. Sulge rakendus nüüd ja ava see uuesti, et muudatus rakenduks.';

  @override
  String get impellerCloseNow => 'Sulge rakendus nüüd';

  @override
  String get adminRefreshLibrary => 'Värskenda kogu';

  @override
  String get adminRefreshAllLibraries => 'Värskenda kõiki kogusid';

  @override
  String get adminRepoSortDateOldest => 'Lisamiskuupäev (vanimad enne)';

  @override
  String get adminRepoSortDateNewest => 'Lisamiskuupäev (uusimad enne)';

  @override
  String get adminRepoSortNameAsc => 'Tähestikuline (A–Ü)';

  @override
  String get adminRepoSortNameDesc => 'Tähestikuline (Ü–A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Serveri analüütika laadimine... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Sama mis lähtefailil';

  @override
  String get imdbTop250Movies => 'IMDb 250 parimat filmi';

  @override
  String get imdbTop250TvShows => 'IMDb 250 parimat sarja';

  @override
  String get imdbMostPopularMovies => 'IMDb populaarseimad filmid';

  @override
  String get imdbMostPopularTvShows => 'IMDb populaarseimad sarjad';

  @override
  String get imdbLowestRatedMovies => 'IMDb madalaima hinnanguga filmid';

  @override
  String get imdbTopEnglishMovies => 'IMDb parimad ingliskeelsed filmid';

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
  String get integrations => 'Integratsioonid';

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
