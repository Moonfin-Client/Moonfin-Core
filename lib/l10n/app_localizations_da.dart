// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

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
  String get interfaceLanguage => 'Sprog i brugerflade';

  @override
  String get systemLanguageDefault => 'Samme som system';

  @override
  String get signIn => 'Log ind';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tom';

  @override
  String connectingToServer(String serverName) {
    return 'Opretter forbindelse til $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Adgangskode';

  @override
  String get username => 'Brugernavn';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Indtast denne kode på din servers web-dashboard:';

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
  String get waitingForAuthorization => 'Venter på godkendelse...';

  @override
  String get back => 'Tilbage';

  @override
  String get serverUnavailable => 'Serveren er ikke tilgængelig';

  @override
  String get loginFailed => 'Login mislykkedes';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect er ikke tilgængelig: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect er ikke tilgængelig ($status): $detail';
  }

  @override
  String get whosWatching => 'Hvem ser med?';

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
  String get addUser => 'Tilføj bruger';

  @override
  String get selectServer => 'Vælg server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Gemte servere';

  @override
  String get discoveredServers => 'Fundne servere';

  @override
  String get noneFound => 'Ingen fundet';

  @override
  String get unableToConnectToServer =>
      'Kan ikke oprette forbindelse til serveren';

  @override
  String get addServer => 'Tilføj server';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Fjern server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Vil du fjerne \"$serverName\" fra dine servere?';
  }

  @override
  String get cancel => 'Annullér';

  @override
  String get remove => 'Fjern';

  @override
  String get connectToServer => 'Opret forbindelse til server';

  @override
  String get serverAddress => 'Server-adresse';

  @override
  String get serverAddressHint => 'https://din-server.eksempel.dk';

  @override
  String get connect => 'Forbind';

  @override
  String get secureStorageUnavailable =>
      'Sikker opbevaring er ikke tilgængelig';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin kunne ikke få adgang til din systemnøglering. Login kan fortsætte, men sikker token-opbevaring er muligvis ikke tilgængelig, før nøgleringen er låst op.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-tema';

  @override
  String get detailScreenStyle => 'Detaljeskærmens stil';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassisk er det oprindelige centrerede Moonfin-layout. Moderne er et responsivt, filmisk layout.';

  @override
  String get detailScreenStyleMoonfin => 'Klassisk';

  @override
  String get detailScreenStyleModern => 'Moderne';

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
  String get expandedTabs => 'Udvidede faneblade';

  @override
  String get expandedTabsSubtitle =>
      'Vis automatisk indholdet, når du bladrer gennem faneblade. Slå fra for at åbne og lukke hvert faneblad manuelt.';

  @override
  String get showTechnicalDetails => 'Vis tekniske detaljer?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Vis codec, opløsning og streamoplysninger i banneroversigten';

  @override
  String get recommendationSystem => 'Anbefalingssystem';

  @override
  String get recommendationSystemSubtitle =>
      'Brug Moonfin Anbefaler-algoritmen til dit lokale bibliotek eller TMDb\'s lighedsmålinger online. Bemærk: Onlineanbefalinger kræver Seerr-integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Anbefaler';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-lighed';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Begræns efter aldersgrænse?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Begræns forslag fra Moonfin Anbefaler efter målmediets aldersgrænse';

  @override
  String get interfaceStyle => 'Grænsefladestil';

  @override
  String get interfaceStyleSubtitle =>
      'Automatisk tilpasser sig din enhed. Vælg Apple eller Material for at fastlåse et udseende.';

  @override
  String get interfaceStyleAutomatic => 'Automatisk';

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
  String get glassQuality => 'Glaskvalitet';

  @override
  String get oledMode => 'OLED Tilstand';

  @override
  String get oledModeSubtitle =>
      'Dybere sort og forbedre illustrationer. Virker bedst på OLED skærme.';

  @override
  String get oledModeSubtle => 'Fin';

  @override
  String get oledModeVivid => 'Levende';

  @override
  String get glassQualitySubtitle =>
      'Auto vælger den bedste glaseffekt til denne enhed. Fuld fremtvinger ægte sløring; Reduceret bruger et let glas, der sparer GPU-strøm.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Fuld';

  @override
  String get glassQualityReduced => 'Reduceret';

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
      'Skift mellem Moonfin og Neon Pulse uden at genstarte appen';

  @override
  String get customThemeTitle => 'Brugerdefineret tema';

  @override
  String get customThemeSubtitle =>
      'Brugerdefinerede temaer ændrer visuelle elementer i hele Moonfin. Vælg en af disse muligheder, der passer til din stil.';

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
      'Det nuværende Moonfin-udseende, som alle vil komme til at elske';

  @override
  String get themeNeonPulse => 'Neonpuls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-styling med magenta glød, cyan tekst og stærkere kromkontrast';

  @override
  String get themeGlass => 'Glas';

  @override
  String get themeGlassSubtitle =>
      'Flydende glas-design med en glidende gradientbaggrund, frostede overflader og Apple-blå accentfarve';

  @override
  String get theme8BitHero => '8-bit-helt';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixelart-design med en fed palet, kantede rammer, hårde slagskygger og en pixelskrifttype';

  @override
  String get embyConnectSignInSubtitle => 'Log ind med din Emby Connect-konto';

  @override
  String get emailOrUsername => 'E-mail eller brugernavn';

  @override
  String get selectAServer => 'Vælg en server';

  @override
  String get tryAgain => 'Prøv igen';

  @override
  String get noLinkedServers =>
      'Ingen servere knyttet til denne Emby Connect-konto';

  @override
  String get invalidEmbyConnectCredentials =>
      'Ugyldige Emby Connect-legitimationsoplysninger';

  @override
  String get invalidEmbyConnectLogin =>
      'Ugyldigt Emby Connect brugernavn eller adgangskode';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveren understøtter ikke Emby Connect-udveksling';

  @override
  String get embyConnectNetworkError =>
      'Netværksfejl under kontakt til Emby Connect eller den valgte server';

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
  String get loadingLinkedServers => 'Indlæser linkede servere...';

  @override
  String get connectingToServerEllipsis => 'Opretter forbindelse til server...';

  @override
  String get noReachableAddress => 'Ingen tilgængelig adresse angivet';

  @override
  String get invalidServerExchangeResponse =>
      'Ugyldigt svar fra serverudvekslingsslutpunkt';

  @override
  String unableToConnectTo(String target) {
    return 'Kan ikke oprette forbindelse til $target';
  }

  @override
  String get exitApp => 'Afslut Moonfin?';

  @override
  String get exitAppConfirmation => 'Er du sikker på, at du vil afslutte?';

  @override
  String get exit => 'Afslut';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Sat på pause';

  @override
  String get gameSaveState => 'Gem tilstand';

  @override
  String get games => 'Spil';

  @override
  String get gameLoadState => 'Indlæs tilstand';

  @override
  String get gameFastForward => 'Spol frem';

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
  String get gameEmulatorSettings => 'Emulatorindstillinger';

  @override
  String get gameNoCoreOptions =>
      'Denne kerne har ingen justerbare indstillinger.';

  @override
  String get gameHoldToOpenMenu => 'Hold nede for at åbne menuen';

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
      'Spil understøttes endnu ikke på denne enhed.';

  @override
  String get noHomeRowsLoaded => 'Ingen Hjem-rækker kunne indlæses';

  @override
  String get noHomeRowsHint =>
      'Prøv at opdatere eller reducere aktive Hjem-sektioner.';

  @override
  String get retryHomeRows => 'Genindlæs Hjem-rækkerne';

  @override
  String get guide => 'Guide';

  @override
  String get recordings => 'Optagelser';

  @override
  String get schedule => 'Planlægning';

  @override
  String get series => 'Serier';

  @override
  String get noItemsFound => 'Ingen elementer fundet';

  @override
  String get home => 'Hjem';

  @override
  String get browseAll => 'Gennemse alle';

  @override
  String get genres => 'Genrer';

  @override
  String get collectionPlaceholder => 'Samlingselementer vises her';

  @override
  String get browseByLetter => 'Gennemse efter bogstav';

  @override
  String get alphabeticalBrowsePlaceholder => 'Alfabetisk oversigt vises her';

  @override
  String get suggestions => 'Forslag';

  @override
  String get suggestionsPlaceholder => 'Foreslåede elementer vises her';

  @override
  String get failedToLoadLibraries => 'Kunne ikke indlæse biblioteker';

  @override
  String get noLibrariesFound => 'Ingen biblioteker fundet';

  @override
  String get library => 'Bibliotek';

  @override
  String get displaySettings => 'Skærmindstillinger';

  @override
  String get allGenres => 'Alle genrer';

  @override
  String get noGenresFound => 'Ingen genrer fundet';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kunne ikke indlæse mappen: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Denne mappe er tom';

  @override
  String itemCountLabel(int count) {
    return '$count elementer';
  }

  @override
  String get failedToLoadFavorites => 'Favoritter kunne ikke indlæses';

  @override
  String get retry => 'Prøv igen';

  @override
  String get noFavoritesYet => 'Ingen favoritter endnu';

  @override
  String get favorites => 'Favoritter';

  @override
  String totalCountItems(int count) {
    return '$count elementer';
  }

  @override
  String get continuing => 'Fortsætter';

  @override
  String get ended => 'Afsluttet';

  @override
  String get sortAndFilter => 'Sortér og filtrér';

  @override
  String get type => 'Type';

  @override
  String get sortBy => 'Sorter efter';

  @override
  String get display => 'Vise';

  @override
  String get imageType => 'Billedtype';

  @override
  String get posterSize => 'Plakat størrelse';

  @override
  String get small => 'Lille';

  @override
  String get medium => 'Mellem';

  @override
  String get large => 'Stor';

  @override
  String get extraLarge => 'Ekstra stor';

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
    return '$name — Genrer';
  }

  @override
  String get views => 'Visninger';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Album kunstnere';

  @override
  String get artists => 'Kunstnere';

  @override
  String get bookmarks => 'Bogmærker';

  @override
  String get noSavedBookmarks => 'Ingen gemte bogmærker for denne titel endnu.';

  @override
  String get openBook => 'Åbn bog';

  @override
  String get chapter => 'Kapitel';

  @override
  String get page => 'Side';

  @override
  String get bookmark => 'Bogmærke';

  @override
  String get justNow => 'Lige nu';

  @override
  String minutesAgo(int count) {
    return '${count}m siden';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h siden';
  }

  @override
  String daysAgo(int count) {
    return '${count}d siden';
  }

  @override
  String get discoverySubjects => 'Opdagelsesfag';

  @override
  String get apply => 'Anvend';

  @override
  String get openLink => 'Åbn link';

  @override
  String get scanWithYourPhone => 'Scan med din telefon';

  @override
  String get audiobookGenres => 'Lydbog genrer';

  @override
  String get scrollLeft => 'Rul til venstre';

  @override
  String get scrollRight => 'Rul til højre';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Kunne ikke indlæse denne genre lige nu.';

  @override
  String get continueReading => 'Fortsæt med at læse';

  @override
  String get savedHighlights => 'Gemte højdepunkter';

  @override
  String get continueListening => 'Fortsæt med at lytte';

  @override
  String get listen => 'Lytte';

  @override
  String get resume => 'Genoptag';

  @override
  String get failedToLoadLibrary => 'Kunne ikke indlæse biblioteket';

  @override
  String get popularNow => 'Populær nu';

  @override
  String get savedForLater => 'Gemt til senere';

  @override
  String get topListens => 'Top lytter';

  @override
  String get unreadDiscoveries => 'Ulæste opdagelser';

  @override
  String get pickUpAgain => 'Saml op igen';

  @override
  String get bookHighlightsDescription =>
      'Dine bøger med højdepunkter, favoritter eller læsefremskridt.';

  @override
  String get handPickedFromLibrary => 'Håndplukket fra dit bibliotek.';

  @override
  String get handPickedFromListeningQueue => 'Håndplukket fra din lyttekø.';

  @override
  String get booksWithHighlights =>
      'Bøger med højdepunkter, favoritter eller læsefremskridt.';

  @override
  String get jumpBackNarration =>
      'Hop tilbage til fortælling uden at gå på jagt efter dit sted.';

  @override
  String get unreadBooksReady => 'Ulæste bøger klar til den næste stille time.';

  @override
  String get quickAccessFavorites =>
      'Hurtig adgang til de bøger, du bliver ved med at vende tilbage til.';

  @override
  String get searchAudiobooks => 'Søg lydbøger';

  @override
  String get searchYourLibrary => 'Søg i dit bibliotek';

  @override
  String get pickUpStory => 'Fortsæt historien, hvor du slap';

  @override
  String get savedPlacesChapters => 'Dine gemte steder og ufærdige kapitler';

  @override
  String authorsCount(int count) {
    return '$count forfattere';
  }

  @override
  String genresCount(int count) {
    return '$count genrer';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% fuldført';
  }

  @override
  String get readyWhenYouAre => 'Klar, når du er';

  @override
  String get details => 'Detaljer';

  @override
  String get listeningRoom => 'Lytterum';

  @override
  String get bookmarksAndProgress => 'Bogmærker og fremskridt';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titler arrangeret til læsning-først browsing.';
  }

  @override
  String get titles => 'Titler';

  @override
  String get allTitles => 'Alle titler';

  @override
  String get authors => 'Forfattere';

  @override
  String get browseByAuthor => 'Gennemse efter forfatter';

  @override
  String get browseByGenre => 'Gennemse efter genre';

  @override
  String get discover => 'Opdage';

  @override
  String get noBookmarkedItems => 'Ingen bogmærkede varer endnu';

  @override
  String get nothingMatchesSection =>
      'Intet matcher dette afsnit endnu. Prøv en anden fane, eller kom tilbage, når bibliotekssynkroniseringen er afsluttet.';

  @override
  String get audiobooks => 'Lydbøger';

  @override
  String noLabelFound(String label) {
    return 'Ingen $label fundet';
  }

  @override
  String get folder => 'Mappe';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Læsestatus';

  @override
  String get playedStatus => 'Spillet status';

  @override
  String get readStatus => 'Læse';

  @override
  String get watched => 'Set';

  @override
  String get unread => 'Ulæst';

  @override
  String get unwatched => 'Ikke set';

  @override
  String get seriesStatus => 'Seriestatus';

  @override
  String get allLibraries => 'Alle biblioteker';

  @override
  String get books => 'Bøger';

  @override
  String get latestBooks => 'Seneste bøger';

  @override
  String get latestAudiobooks => 'Seneste lydbøger';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøger',
      one: '1 bog',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Bog';

  @override
  String get bookFormatAudiobook => 'Lydbog';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Ingen bøger fundet for denne forfatter.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% læst';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time tilbage';
  }

  @override
  String get bookHeroRead => 'Læs';

  @override
  String get bookHeroListen => 'Lyt';

  @override
  String get author => 'Forfatter';

  @override
  String get unknownAuthor => 'Ukendt forfatter';

  @override
  String get uncategorized => 'Ikke kategoriseret';

  @override
  String get overview => 'Oversigt';

  @override
  String get noLibrivoxDescription =>
      'Ingen beskrivelse leveret af LibriVox for denne titel endnu.';

  @override
  String get readers => 'Læsere';

  @override
  String get openLinks => 'Åbn links';

  @override
  String get librivoxPage => 'LibriVox side';

  @override
  String get internetArchive => 'Internetarkiv';

  @override
  String get rssFeed => 'RSS-feed';

  @override
  String get downloadZip => 'Download zip';

  @override
  String sectionCountLabel(int count) {
    return '$count sektioner';
  }

  @override
  String firstPublished(int year) {
    return 'Først offentliggjort $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Der er endnu ingen tilgængelig oversigt fra Open Library for denne titel.';

  @override
  String get subjects => 'Emner';

  @override
  String get all => 'Alle';

  @override
  String booksCount(int count) {
    return '$count bøger';
  }

  @override
  String get couldNotLoadSubject => 'Kunne ikke indlæse dette emne lige nu.';

  @override
  String get audiobookDetails => 'Lydbog detaljer';

  @override
  String authorsCountTitle(int count) {
    return '$count Forfattere';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lydbøger',
      one: '1 lydbog',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Sporliste';

  @override
  String get itemListPlaceholder => 'Vareliste vises her';

  @override
  String get failedToLoad => 'Kunne ikke indlæses';

  @override
  String get delete => 'Slet';

  @override
  String get save => 'Gem';

  @override
  String get moreLikeThis => 'Mere som denne';

  @override
  String get castAndCrew => 'Medvirkende & hold';

  @override
  String get collection => 'Samling';

  @override
  String get episodes => 'Episoder';

  @override
  String get nextUp => 'Næste op';

  @override
  String get seasons => 'Sæsoner';

  @override
  String get chapters => 'kapitler';

  @override
  String get features => 'Funktioner';

  @override
  String get movies => 'Film';

  @override
  String get musicVideos => 'Musikvideoer';

  @override
  String get other => 'Andre';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Lignende kunstnere';

  @override
  String get tableOfContents => 'Indholdsfortegnelse';

  @override
  String get tracklist => 'Trackliste';

  @override
  String discNumber(int number) {
    return 'Disk $number';
  }

  @override
  String get biography => 'Biografi';

  @override
  String get authorDetails => 'Forfatterdetaljer';

  @override
  String get noOverviewAvailable =>
      'Ingen oversigt tilgængelig for denne titel endnu.';

  @override
  String get noBiographyAvailable =>
      'Ingen biografi tilgængelig for denne forfatter.';

  @override
  String get unableToLoadAuthorDetails =>
      'Kan ikke indlæse forfatteroplysninger lige nu.';

  @override
  String published(int year) {
    return 'Udgivet $year';
  }

  @override
  String get publicationDateUnknown => 'Udgivelsesdato ukendt';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sæsoner',
      one: '1 sæson',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Slutter kl. $time';
  }

  @override
  String get items => 'Elementer';

  @override
  String get extras => 'Ekstramateriale';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Bag kulisserne';

  @override
  String get deletedScenes => 'Slettede scener';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scener';

  @override
  String get shorts => 'Kortfilm';

  @override
  String get trailers => 'Trailere';

  @override
  String timeRemaining(String time) {
    return '$time tilbage';
  }

  @override
  String endsIn(String time) {
    return 'Slutter om $time';
  }

  @override
  String get view => 'Udsigt';

  @override
  String get resumeReading => 'Genoptag læsning';

  @override
  String get read => 'Læse';

  @override
  String resumeFrom(String position) {
    return 'Genoptag fra $position';
  }

  @override
  String get play => 'Afspil';

  @override
  String get startOver => 'Start forfra';

  @override
  String get restart => 'Genstart';

  @override
  String get readOffline => 'Læs offline';

  @override
  String get playOffline => 'Spil offline';

  @override
  String get audio => 'Lyd';

  @override
  String get subtitles => 'Undertekster';

  @override
  String get version => 'Version';

  @override
  String get cast => 'Cast';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Færdig';

  @override
  String get favorited => 'Foretrukken';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Afspilningsliste';

  @override
  String get downloaded => 'Downloadet';

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
  String get downloadAll => 'Download alle';

  @override
  String get download => 'Download';

  @override
  String get deleteDownloaded => 'Slet downloadet';

  @override
  String get goToSeries => 'Gå til serie';

  @override
  String get editMetadata => 'Rediger metadata';

  @override
  String get less => 'Mindre';

  @override
  String get more => 'Mere';

  @override
  String get deleteItem => 'Slet vare';

  @override
  String get deletePlaylist => 'Slet afspilningsliste';

  @override
  String get deletePlaylistMessage =>
      'Vil du slette denne afspilningsliste fra serveren?';

  @override
  String get deleteItemMessage => 'Vil du slette dette element fra serveren?';

  @override
  String get failedToDeletePlaylist => 'Afspilningslisten kunne ikke slettes';

  @override
  String get failedToDeleteItem => 'Elementet kunne ikke slettes';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Omdøb afspilningsliste';

  @override
  String get playlistName => 'Afspilningslistenavn';

  @override
  String get deleteDownloadedAlbum => 'Slet downloadet album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Vil du slette downloadede numre for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Downloadede numre slettet';

  @override
  String get downloadedTracksDeleteFailed =>
      'Nogle downloadede numre kunne ikke slettes';

  @override
  String get noTracksLoaded => 'Ingen spor indlæst';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Ingen $itemLabel indlæst';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Downloader $title ($count elementer)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Er du sikker på, at du vil slette \"$name\" fra serveren? Denne handling kan ikke fortrydes.';
  }

  @override
  String get itemDeleted => 'Varen er slettet';

  @override
  String get noPlayableTrailerFound => 'Ingen spilbar trailer fundet.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Ikke-understøttet bogformat: .$extension';
  }

  @override
  String get audioTrack => 'Lydspor';

  @override
  String get subtitleTrack => 'Undertekstspor';

  @override
  String get none => 'Ingen';

  @override
  String get downloadSubtitlesLabel => 'Download undertekster...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Søg ved hjælp af OpenSubtitles plugin';

  @override
  String get downloadSubtitles => 'Download undertekster';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Den valgte undertekst er ugyldig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Undertekst downloadet og valgt: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Undertekster downloadet. Det kan tage et øjeblik at dukke op, mens Jellyfin opdaterer elementet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Ingen fjernundertekster fundet for $language.';
  }

  @override
  String get selectVersion => 'Vælg Version';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Download alle — kvalitet';

  @override
  String get downloadQuality => 'Download kvalitet';

  @override
  String get originalFileNoReencoding => 'Original fil, ingen omkodning';

  @override
  String get originalFilesNoReencoding => 'Originale filer, ingen omkodning';

  @override
  String get noEpisodesLoaded => 'Ingen episoder indlæst';

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
    return 'Downloader $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Slet downloadede filer';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Vil du slette lokale filer for $typeLabel?\n\nDette vil frigøre lagerplads. Du kan downloade igen senere.';
  }

  @override
  String get downloadedFilesDeleted => 'Downloadede filer slettet';

  @override
  String get failedToDeleteFiles => 'Kunne ikke slette filer';

  @override
  String get deleteFiles => 'Slet filer';

  @override
  String get director => 'DIREKTØR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'INSTRUKTØRER';

  @override
  String get writer => 'FORFATTER';

  @override
  String get writers => 'MANUSKRIPTFORFATTERE';

  @override
  String get studio => 'STUDIE';

  @override
  String studioMoreCount(int count) {
    return '+$count mere';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Afsnit';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Afsnit $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitel $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count numre',
      one: '1 nummer',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitler',
      one: '1 kapitel',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Født $date';
  }

  @override
  String died(String date) {
    return 'Død $date';
  }

  @override
  String age(int age) {
    return 'Alder $age';
  }

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Læs mere';

  @override
  String get shuffle => 'Bland';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Bland al musik';

  @override
  String get carSignInPrompt => 'Log ind på Moonfin på din telefon';

  @override
  String get carServerUnreachable => 'Kan ikke få forbindelse til din server';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekt match';

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
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Fjernundertekst $action kræver Jellyfin tilladelse til administration af undertekster for denne bruger.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Dette element kunne ikke findes på serveren til fjernundertekst $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Fjernundertekst $action mislykkedes: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Fjernundertekst $action mislykkedes (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Mislykkedes til $action fjernundertekster.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alle downloadede afsnit for \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'alle downloadede afsnit i denne sæson';

  @override
  String get stillWatching => 'Ser du stadig?';

  @override
  String get unableToLoadTrailerStream => 'Kan ikke indlæse trailer.';

  @override
  String get trailerTimedOut => 'Traileren fik timeout under indlæsning.';

  @override
  String get playbackFailedForTrailer =>
      'Afspilning mislykkedes for denne trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casting er ikke tilgængelig under offlineafspilning.';

  @override
  String castActionFailed(String label, String error) {
    return '$label handling mislykkedes: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Kunne ikke indstille cast-volumen: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Betjeningselementer';
  }

  @override
  String get deviceVolume => 'Enhedsvolumen';

  @override
  String get unavailable => 'Ikke tilgængelig';

  @override
  String get pause => 'Pause';

  @override
  String get syncPosition => 'Synkroniseringsposition';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Køen er tom';

  @override
  String trackNumber(int number) {
    return 'Spor $number';
  }

  @override
  String get remotePlayback => 'Fjernafspilning';

  @override
  String get castingToGoogleCast => 'Caster til Google Cast';

  @override
  String get castingViaAirPlay => 'Caster via AirPlay';

  @override
  String get castingViaDlna => 'Caster via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get longPressToUnlock => 'Langt tryk for at låse op';

  @override
  String get off => 'Fra';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Auto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Lydforsinkelse';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Undertekstforsinkelse';

  @override
  String get reset => 'Nulstil';

  @override
  String get unknown => 'Ukendt';

  @override
  String get playbackInformation => 'Afspilningsoplysninger';

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
  String get playback => 'Afspilning';

  @override
  String get playMethod => 'Spillemetode';

  @override
  String get directPlay => 'Direkte spil';

  @override
  String get directStream => 'Direkte stream';

  @override
  String get transcoding => 'Omkodning';

  @override
  String get transcodeReasons => 'Omkodningsårsager';

  @override
  String get player => 'Afspiller';

  @override
  String get container => 'Beholder';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Opløsning';

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
  String get track => 'Spor';

  @override
  String get channels => 'Kanaler';

  @override
  String get format => 'Format';

  @override
  String get external => 'Ekstern';

  @override
  String get embedded => 'Indlejret';

  @override
  String castSessionError(String protocol) {
    return '$protocol sessionsfejl';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kunne ikke indlæse bogdetaljer: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-gengivelse i appen er endnu ikke tilgængelig på denne platform.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Dette format (.$extension) kan endnu ikke gengives i appen.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Integreret dokumentgengivelse er ikke tilgængelig på denne platform.';

  @override
  String get couldNotOpenExternalViewer => 'Kunne ikke åbne ekstern fremviser.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Kunne ikke åbne in-app-læser: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bogmærket er allerede gemt på $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Tilføjet bogmærke: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ingen bogmærker endnu.\nTryk på bogmærkeikonet, mens du læser for at gemme din position.';

  @override
  String get noTableOfContentsAvailable =>
      'Ingen indholdsfortegnelse tilgængelig';

  @override
  String pageLabel(int number) {
    return 'Side $number';
  }

  @override
  String get position => 'Position';

  @override
  String get bookReader => 'Boglæser';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% læst';
  }

  @override
  String get updating => 'Opdaterer...';

  @override
  String get markUnread => 'Marker som ulæst';

  @override
  String get markAsRead => 'Markér som læst';

  @override
  String get reloadReader => 'Genindlæs Reader';

  @override
  String get noPagesFound => 'Ingen sider fundet.';

  @override
  String get failedToDecodePageImage => 'Sidebilledet kunne ikke afkodes.';

  @override
  String resetZoom(String zoom) {
    return 'Nulstil zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Enkelt side';

  @override
  String get twoPageSpread => 'Opslag på to sider';

  @override
  String get addBookmark => 'Tilføj bogmærke';

  @override
  String get bookmarksEllipsis => 'Bogmærker...';

  @override
  String get markedAsRead => 'Markeret som læst';

  @override
  String get markedAsUnread => 'Markeret som ulæst';

  @override
  String failedToUpdateReadState(String error) {
    return 'Kunne ikke opdatere læsetilstand: $error';
  }

  @override
  String get themeSystem => 'Tema: System';

  @override
  String get themeLight => 'Tema: Lys';

  @override
  String get themeDark => 'Tema: Mørk';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inverter farver (fast layout)';

  @override
  String get invertColorsPdf => 'Inverter farver (PDF)';

  @override
  String get preparingInAppReader => 'Forbereder in-app-læser...';

  @override
  String get pdfDataNotAvailable => 'PDF-data er ikke tilgængelige.';

  @override
  String get readerFallbackModeActive => 'Læser fallback-tilstand aktiv';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Denne platform kan ikke være vært for den indlejrede dokumentmotor for $extension-filer.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Brug Reload Reader efter skift til et understøttet platformsmål (Android, iOS, macOS).';

  @override
  String get openExternally => 'Åbn eksternt';

  @override
  String get noEpubChaptersFound => 'Ingen EPUB-kapitler fundet.';

  @override
  String get readerNotReady => 'Læseren er ikke klar.';

  @override
  String get seriesRecordings => 'Serie optagelser';

  @override
  String get now => 'Nu';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nyheder';

  @override
  String get kids => 'Børn';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunne ikke indlæse guiden: $error';
  }

  @override
  String get noChannelsFound => 'Ingen kanaler fundet';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'LEVENDE';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Næste: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min tilbage';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours t tilbage';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours t $minutes min tilbage';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Fjernet fra yndlingskanaler';

  @override
  String get addedToFavoriteChannels => 'Tilføjet til foretrukne kanaler';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Det lykkedes ikke at opdatere favoritkanalen';

  @override
  String get unfavoriteChannel => 'Uforetrukken kanal';

  @override
  String get favoriteChannel => 'Yndlingskanal';

  @override
  String get record => 'Optag';

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
  String get cancelRecordingAction => 'Annuller optagelse';

  @override
  String get programSetToRecord => 'Program indstillet til optagelse';

  @override
  String get recordingCancelled => 'Optagelse annulleret';

  @override
  String get unableToCreateRecording => 'Kan ikke oprette optagelse';

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
  String get watch => 'Se';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Luk';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunne ikke spille $name';
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
  String get failedToLoadRecordings => 'Optagelserne kunne ikke indlæses';

  @override
  String get scheduledInNext24Hours => 'Planlagt i de næste 24 timer';

  @override
  String get recentRecordings => 'Seneste optagelser';

  @override
  String get tvSeries => 'TV-serie';

  @override
  String get failedToLoadSchedule => 'Kunne ikke indlæse tidsplanen';

  @override
  String get noScheduledRecordings => 'Ingen planlagte optagelser';

  @override
  String get cancelRecording => 'Vil du annullere optagelsen?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Vil du annullere planlagt optagelse af \"$name\"?';
  }

  @override
  String get no => 'Nej';

  @override
  String get yesCancel => 'Ja, annuller';

  @override
  String get failedToCancelRecording => 'Optagelsen kunne ikke annulleres';

  @override
  String get failedToLoadSeriesRecordings =>
      'Serieoptagelser kunne ikke indlæses';

  @override
  String get noSeriesRecordings => 'Ingen serieoptagelser';

  @override
  String get cancelSeriesRecording => 'Annuller serieoptagelse';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Vil du annullere serieoptagelse?';

  @override
  String stopRecordingName(String name) {
    return 'Vil du stoppe med at optage \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Serieoptagelsen kunne ikke annulleres';

  @override
  String get searchThisLibrary => 'Søg i dette bibliotek...';

  @override
  String get searchEllipsis => 'Søge...';

  @override
  String noResultsForQuery(String query) {
    return 'Ingen resultater for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Søgning mislykkedes: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-kontotype';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokal';

  @override
  String get savedMedia => 'Gemte medier';

  @override
  String get tvShows => 'TV-shows';

  @override
  String get music => 'Musik';

  @override
  String get musicAlbums => 'Musikalbum';

  @override
  String get noMediaInFilter => 'Ingen medier i dette filter';

  @override
  String get noDownloadedMediaYet => 'Ingen downloadede medier endnu';

  @override
  String get browseLibrary => 'Gennemse biblioteket';

  @override
  String get deleteDownload => 'Slet download';

  @override
  String removeItemAndFiles(String name) {
    return 'Vil du fjerne \"$name\" og dets filer?';
  }

  @override
  String tracksCount(int count) {
    return '$count spor';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Afspil album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Kunne ikke indlæse album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Der blev ikke fundet nogen downloadede numre for $name.';
  }

  @override
  String get season => 'Sæson';

  @override
  String get errorLoadingEpisodes => 'Fejl ved indlæsning af episoder';

  @override
  String get noDownloadedEpisodes => 'Ingen downloadede afsnit';

  @override
  String get deleteEpisode => 'Slet afsnit';

  @override
  String removeName(String name) {
    return 'Vil du fjerne \"$name\"?';
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
    return 'Afsnit $number';
  }

  @override
  String get seriesNotFound => 'Serie ikke fundet';

  @override
  String get errorLoadingSeries => 'Fejl ved indlæsning af serien';

  @override
  String get downloadedEpisodes => 'Downloadede episoder';

  @override
  String seasonNumber(int number) {
    return 'Sæson $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Tilbud';

  @override
  String get deleteSeason => 'Slet sæson';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Vil du slette alle downloadede afsnit i $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoder',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Lagerstyring';

  @override
  String get storageBreakdown => 'Opbevaringssammenbrud';

  @override
  String get downloadedItems => 'Downloadede varer';

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
  String get storageLimit => 'Opbevaringsgrænse';

  @override
  String get noLimit => 'Ingen grænse';

  @override
  String get deleteAllDownloads => 'Slet alle downloads';

  @override
  String get deleteAllDownloadsWarning =>
      'Dette vil fjerne alle downloadede mediefiler og kan ikke fortrydes.';

  @override
  String get deleteAll => 'Slet alle';

  @override
  String get deleteSelected => 'Slet valgte';

  @override
  String deleteSelectedCount(int count) {
    return 'Vil du slette $count downloadede elementer?';
  }

  @override
  String get musicAndAudiobooks => 'Musik og lydbøger';

  @override
  String get images => 'Billeder';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'af $limit grænse';
  }

  @override
  String get settings => 'Indstillinger';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentificering';

  @override
  String get autoLoginServerManagement => 'Automatisk login, serverstyring';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get setUpPinCodeProtection => 'Konfigurer PIN-kodebeskyttelse';

  @override
  String get parentalControls => 'Forældrekontrol';

  @override
  String get contentRatingRestrictions =>
      'Indholdsklassificeringsbegrænsninger';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, opløsning, adfærd';

  @override
  String get languageSizeAppearance => 'Sprog, størrelse, udseende';

  @override
  String get qualityStorage => 'Kvalitet, opbevaring';

  @override
  String get mediaRequestIntegration => 'Medieanmodningsintegration';

  @override
  String get switchServer => 'Skift server';

  @override
  String get signOut => 'Log ud';

  @override
  String get versionLicenses => 'Version, licenser';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Log-in og sikkerhed';

  @override
  String get administration => 'Administration';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverindstillinger, brugere, biblioteker';

  @override
  String get customization => 'Tilpasning';

  @override
  String get themeAndLayout => 'Tema og layout';

  @override
  String get videoAndSubtitles => 'Video og undertekster';

  @override
  String get pluginAndRequests => 'Plugin og anmodninger';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tilpas konto, afspilning og grænsefladeadfærd';

  @override
  String optionsCount(int count) {
    return '$count muligheder';
  }

  @override
  String get themeAndAppearance => 'Tema & Udseende';

  @override
  String get focusBorderColor => 'Fokus kantfarve';

  @override
  String get watchedIndicators => 'Overvågede indikatorer';

  @override
  String get always => 'Altid';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Skjul uovervåget';

  @override
  String get episodesOnly => 'Kun episoder';

  @override
  String get never => 'Aldrig';

  @override
  String get focusExpansionAnimation => 'Animation for fokusudvidelse';

  @override
  String get desktopUiScale => 'Desktop UI-skala';

  @override
  String get scaleFocusedCards =>
      'Skala fokuserede eller svævende kort og fliser';

  @override
  String get seriesThumbnails => 'Serie miniaturebilleder';

  @override
  String get seriesThumbnailsDescription =>
      'Kun episoder: brug serieillustrationer, der matcher hver række billedtype';

  @override
  String get homeRowInfoOverlay => 'Hjem Række Info Overlay';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Vis titel og metadata, når du gennemser hjemmerækker';

  @override
  String get clockDisplay => 'Ur Display';

  @override
  String get inMenus => 'I menuer';

  @override
  String get inVideo => 'I video';

  @override
  String get seasonalEffects => 'Sæsoneffekter';

  @override
  String get seasonalEffectsDescription =>
      'Visuelle effekter og sæsonbestemte dekorationer';

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
  String get snow => 'Sne';

  @override
  String get fireworks => 'Fyrværkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Faldende Blade';

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
  String get themeMusic => 'Tema musik';

  @override
  String get playThemeMusicOnDetailPages => 'Afspil temamusik på detaljesider';

  @override
  String get themeMusicVolume => 'Tema musikvolumen';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temamusik på Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Spil, når du browser på startskærmen';

  @override
  String get loopThemeMusic => 'Gentag temamusik';

  @override
  String get loopThemeMusicSubtitle =>
      'Gentag nummeret i stedet for at afspille det én gang';

  @override
  String get detailsBackgroundBlur => 'Detaljer Baggrundssløring';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Browser baggrundssløring';

  @override
  String get maxStreamingBitrate => 'Max streaming bitrate';

  @override
  String get maxResolution => 'Max opløsning';

  @override
  String get playerZoomMode => 'Afspillerzoomtilstand';

  @override
  String get settingsScrollWheelAction => 'Scrollhjul';

  @override
  String get settingsScrollWheelActionDescription =>
      'Vælg hvad der sker når der scrolles på musens hjul.';

  @override
  String get scrollWheelActionOff => 'Fra';

  @override
  String get scrollWheelActionSeek => 'Søg (frem/tilbage)';

  @override
  String get scrollWheelActionVolume => 'Lydstyrke';

  @override
  String get playerTooltipVolume => 'Lydstyrke';

  @override
  String get fit => 'Passe';

  @override
  String get autoCrop => 'Automatisk beskæring';

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
  String get stretch => 'Strække';

  @override
  String get refreshRateSwitching => 'Skift af opdateringshastighed';

  @override
  String get disabled => 'Deaktiveret';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Skala på TV';

  @override
  String get scaleOnDevice => 'Skala på enhed';

  @override
  String get trickPlay => 'Trickspil';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Vis forhåndsvisningsminiaturer, når du søger';

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
  String get showDescriptionOnPause => 'Vis beskrivelse på pause';

  @override
  String get dimVideoShowOverview =>
      'Dæmp video, og vis oversigtstekst, mens den er sat på pause';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD-låseknap';

  @override
  String get osdLockButtonDescription =>
      'Vis en låseknap, der blokerer berøringsinput, indtil der trykkes længe';

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
  String get audioBehavior => 'Lydadfærd';

  @override
  String get downmixToStereo => 'Downmix til stereo';

  @override
  String get defaultAudioLanguage => 'Standard lydsprog';

  @override
  String get fallbackAudioLanguage => 'Reservesprog for lyd';

  @override
  String get preferDefaultAudioTrack => 'Foretræk standardlydspor';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Foretræk det originale lydspor frem for lokaliseret eftersynkronisering.';

  @override
  String get preferAudioDescription => 'Foretræk synstolkningsspor';

  @override
  String get preferAudioDescriptionDescription =>
      'Foretræk synstolkningsspor frem for normale spor.';

  @override
  String get autoServerDefault => 'Auto (serverstandard)';

  @override
  String get english => 'engelsk';

  @override
  String get spanish => 'spansk';

  @override
  String get french => 'fransk';

  @override
  String get german => 'tysk';

  @override
  String get italian => 'italiensk';

  @override
  String get portuguese => 'portugisisk';

  @override
  String get japanese => 'japansk';

  @override
  String get korean => 'koreansk';

  @override
  String get chinese => 'kinesisk';

  @override
  String get russian => 'russisk';

  @override
  String get arabic => 'arabisk';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'hollandsk';

  @override
  String get swedish => 'svensk';

  @override
  String get norwegian => 'norsk';

  @override
  String get danish => 'dansk';

  @override
  String get finnish => 'finsk';

  @override
  String get polish => 'Polere';

  @override
  String get ac3Passthrough => 'AC3-passthrough';

  @override
  String get dtsPassthrough => 'DTS-passthrough';

  @override
  String get trueHdSupport => 'TrueHD-understøttelse';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS-lyd kun til AVR; kræver modtagerunderstøttelse og DTS-kildespor';

  @override
  String get settingsAudioFallbackCodec => 'Reservecodec for lyd';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Vælg det format, flerkanalslyd skal transkodes til, når kildestrømmen hverken kan afspilles direkte eller sendes igennem.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Registrér automatisk\n(anbefales)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(standard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(kun stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(effektiv)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(tabsfri)';

  @override
  String get settingsMaxAudioChannels => 'Maks. antal lydkanaler';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Angiv det maksimale antal kanaler i dit lydanlæg. Flerkanalsstrømme, der overskrider denne grænse, bliver downmixet eller transkodet.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Registrér automatisk\n(hardwarestandard)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kvadrofonisk';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avanceret)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec-passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktiver kun formater, som din AVR eller HDMI-vask understøtter.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-passthrough';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD-passthrough';

  @override
  String get settingsDetectedAudioCapabilities => 'Detekteret lydkapacitet';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Der er endnu ikke et øjebliksbillede af runtime-kapacitet tilgængelig.';

  @override
  String get settingsAudioRouteLabel => 'Rute';

  @override
  String get settingsAudioDecodeLabel => 'Afkode';

  @override
  String get settingsAudioPassthroughLabel => 'Gennemløb';

  @override
  String get settingsAudioHdRoute => 'HD audio rute';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Højttaler';

  @override
  String get settingsAudioRouteHeadphones => 'Hovedtelefoner';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count-kanals PCM';
  }

  @override
  String get nightMode => 'Nattilstand';

  @override
  String get compressDynamicRange => 'Komprimer det dynamiske område';

  @override
  String get advancedMpv => 'Avanceret mpv';

  @override
  String get enableCustomMpvConf => 'Aktiver Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Anvend en brugerspecificeret mpv.conf før afspilning starter';

  @override
  String get unsafeAdvancedMpvOptions => 'Usikre avancerede mpv-indstillinger';

  @override
  String get unsafeMpvOptionsDescription =>
      'Tillad et bredere sæt af mpv-indstillinger. Kan bryde afspilningsadfærd.';

  @override
  String get hardwareDecoding => 'Hardware afkodning';

  @override
  String get hardwareDecodingSubtitle =>
      'Kan forbedre ydeevnen, men kan forårsage afspilningsproblemer på nogle enheder.';

  @override
  String get nextUpAndQueuing => 'Næste op & i kø';

  @override
  String get nextUpDisplay => 'Visning af Næste op';

  @override
  String get extended => 'Udvidet';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Næste op timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Mediekø';

  @override
  String get autoQueueNextEpisodes => 'Sæt automatisk næste afsnit i kø';

  @override
  String get stillWatchingPrompt => 'Ser stadig prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Efter $episodes episoder / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Genoptag og spring over';

  @override
  String get resumeRewind => 'Genopspol tilbage';

  @override
  String get unpauseRewind => 'Genoptag Spol tilbage';

  @override
  String get fiveSeconds => '5 sekunder';

  @override
  String get tenSeconds => '10 sekunder';

  @override
  String get fifteenSeconds => '15 sekunder';

  @override
  String get thirtySeconds => '30 sekunder';

  @override
  String get skipBackLength => 'Spring tilbage Længde';

  @override
  String get skipForwardLength => 'Spring fremad længde';

  @override
  String get customMpvConfPath => 'Brugerdefineret mpv.conf-sti';

  @override
  String get notSetMpvConf =>
      'Ikke indstillet. Moonfin vil prøve en standard mpv.conf i app/data-mapper.';

  @override
  String get selectMpvConf => 'Vælg mpv.conf';

  @override
  String get pathToMpvConf => '/sti/til/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stilindstillinger (størrelse, farve, offset) gælder for tekstbaserede undertekster (SRT, VTT, TTML). ASS/SSA-undertekster bruger deres egen indlejrede stil, medmindre \"ASS/SSA Direct Play\" er slået fra. Bitmap-undertekster (PGS, DVB, VobSub) kan ikke ændres.';

  @override
  String get defaultSubtitleLanguage => 'Standardsprog for undertekster';

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
  String get defaultToNoSubtitles => 'Standard til Ingen undertekster';

  @override
  String get turnOffSubtitlesByDefault => 'Slå undertekster fra som standard';

  @override
  String get subtitleSize => 'Undertekst størrelse';

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
  String get textFillColor => 'Tekstfyldfarve';

  @override
  String get backgroundColor => 'Baggrundsfarve';

  @override
  String get textStrokeColor => 'Tekst stregfarve';

  @override
  String get subtitleCustomization => 'Tilpasning af undertekster';

  @override
  String get subtitleCustomizationDescription =>
      'Tilpas undertekstens udseende';

  @override
  String get subtitleMode => 'Underteksttilstand';

  @override
  String get subtitleModeFlagged => 'Markeret';

  @override
  String get subtitleModeAlways => 'Altid';

  @override
  String get subtitleModeForeign => 'Fremmedsprog';

  @override
  String get subtitleModeForced => 'Tvungen';

  @override
  String get subtitleModeFlaggedDescription =>
      'Afspiller spor, der i mediefilens metadata er markeret som \"default\" eller \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Indlæser og viser automatisk undertekster, hver gang en video starter.';

  @override
  String get subtitleModeForeignDescription =>
      'Slår automatisk undertekster til, hvis standardlydsporet er på et fremmedsprog.';

  @override
  String get subtitleModeForcedDescription =>
      'Indlæser kun undertekster, der udtrykkeligt er mærket med det tvungne metadataflag.';

  @override
  String get subtitleModeNoneDescription =>
      'Deaktiverer automatisk indlæsning af undertekster fuldstændigt.';

  @override
  String get fallbackSubtitleLanguage => 'Reservesprog for undertekster';

  @override
  String get subtitleStream => 'Undertekststrøm';

  @override
  String get subtitlePreviewText =>
      'Den hurtige brune ræv hopper over den dovne hund';

  @override
  String get verticalOffset => 'Lodret offset';

  @override
  String get pgsDirectPlay => 'PGS direkte spil';

  @override
  String get directPlayPgsSubtitles => 'Direkte afspilning af PGS-undertekster';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles => 'Afspil ASS/SSA undertekster direkte';

  @override
  String get white => 'Hvid';

  @override
  String get black => 'Sort';

  @override
  String get yellow => 'Gul';

  @override
  String get green => 'Grøn';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Rød';

  @override
  String get transparent => 'Gennemsigtig';

  @override
  String get semiTransparentBlack => 'Semi-transparent sort';

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
  String get global => 'Global';

  @override
  String get desktop => 'Computer';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Indlæste $profile profilindstillinger.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Kunne ikke indlæse $profile profilindstillinger.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synkroniserede lokale indstillinger til $profile profil.';
  }

  @override
  String get syncing => 'Synkroniserer...';

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
  String get profileSyncHidden => 'Profilsynkronisering skjult';

  @override
  String get enablePluginSyncDescription =>
      'Aktiver Server Plugin Sync i Plugin-indstillinger for at vise profilkontrolelementer her.';

  @override
  String get quality => 'Kvalitet';

  @override
  String get defaultDownloadQuality => 'Standard downloadkvalitet';

  @override
  String get network => 'Netværk';

  @override
  String get wifiOnlyDownloads => 'Kun WiFi-downloads';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Vis downloads på serveren';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Lad serveradministratoren se dine transkodede downloads i kontrolpanelet';

  @override
  String get onlyDownloadOnWifi => 'Download kun, når du er tilsluttet WiFi';

  @override
  String get storage => 'Opbevaring';

  @override
  String get storageUsed => 'Opbevaring brugt';

  @override
  String get manage => 'Styre';

  @override
  String get calculating => 'Beregner...';

  @override
  String get downloadLocation => 'Download placering';

  @override
  String get defaultLabel => 'Misligholdelse';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Gem i mappen Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — synlig for andre apps';

  @override
  String get dangerZone => 'Farezone';

  @override
  String get clearAllDownloads => 'Ryd alle downloads';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Skift downloadplacering';

  @override
  String get changeDownloadLocationDescription =>
      'Nye downloads vil blive gemt i den valgte mappe. Eksisterende downloads forbliver på deres nuværende placering og kan administreres fra lagerindstillinger.';

  @override
  String get confirm => 'Bekræfte';

  @override
  String get cannotWriteToFolder =>
      'Kan ikke skrive til den valgte mappe. Vælg en anden placering, eller giv lagertilladelser.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Vil du gemme i mappen Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Downloadede medier vil blive gemt i Downloads/Moonfin på din enhed. Disse filer vil være synlige for andre apps, såsom dit galleri eller din musikafspiller.\n\nEksisterende downloads forbliver på deres nuværende placering.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Aktiver';

  @override
  String get clearAllDownloadsWarning =>
      'Dette vil slette alle downloadede medier og kan ikke fortrydes.';

  @override
  String get clearAll => 'Ryd alle';

  @override
  String get navigationStyle => 'Navigationsstil';

  @override
  String get topBar => 'Top bar';

  @override
  String get leftSidebar => 'Venstre sidebjælke';

  @override
  String get showShuffleButton => 'Vis Shuffle-knap';

  @override
  String get showGenresButton => 'Vis genrer knap';

  @override
  String get showFavoritesButton => 'Knappen Vis favoritter';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Vis biblioteker i værktøjslinjen';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Udvid altid navigationslinjens etiketter';

  @override
  String get showSeerrButton => 'Vis Seerr-knap';

  @override
  String get navbarOpacity => 'Navbar Opacitet';

  @override
  String get navbarColor => 'Navbar farve';

  @override
  String get gray => 'Grå';

  @override
  String get darkBlue => 'Mørkeblå';

  @override
  String get purple => 'Lilla';

  @override
  String get teal => 'Blågrøn';

  @override
  String get navy => 'Flåde';

  @override
  String get charcoal => 'Trækul';

  @override
  String get brown => 'Brun';

  @override
  String get darkRed => 'Mørkerød';

  @override
  String get darkGreen => 'Mørkegrøn';

  @override
  String get slate => 'Skifer';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Biblioteksvisning';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Miniaturebillede';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'Tilsidesæt indstillingerne pr. bibliotek';

  @override
  String get applyImageTypeToAllLibraries =>
      'Anvend billedtype på alle biblioteker';

  @override
  String get multiServerLibraries => 'Multi-Server biblioteker';

  @override
  String get showLibrariesFromAllServers =>
      'Vis biblioteker fra alle tilsluttede servere';

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
  String get groupItemsIntoCollections => 'Gruppér elementer i samlinger';

  @override
  String get hideCollectionAssociatedItems =>
      'Skjul biblioteksemner, der hører til en samling, når du gennemser biblioteker';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Bemærkning om biblioteksgruppering';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'For at bruge denne indstilling skal du sikre dig, at biblioteksindstillingerne \"Gruppér film i samlinger\" og/eller \"Gruppér serier i samlinger\" er slået til under dit biblioteks visningsindstillinger på din Jellyfin- eller Emby-server.';

  @override
  String get libraryVisibility => 'Bibliotekets synlighed';

  @override
  String get libraryVisibilityDescription =>
      'Skift startsidesynlighed pr. bibliotek. Genstart Moonfin for at ændringerne træder i kraft.';

  @override
  String get showInNavigation => 'Vis i navigation';

  @override
  String get showInLatestMedia => 'Vis i seneste medier';

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
  String get sourceLibraries => 'Kildebiblioteker';

  @override
  String get sourceCollections => 'Kildesamlinger';

  @override
  String get excludedGenres => 'Udelukkede genrer';

  @override
  String get selectAll => 'Vælg alle';

  @override
  String itemsSelected(int count) {
    return '$count valgt';
  }

  @override
  String get mediaBar => 'Mediebar';

  @override
  String get mediaSources => 'Mediekilder';

  @override
  String get behavior => 'Opførsel';

  @override
  String get seconds => 'sekunder';

  @override
  String get mediaBarMode => 'Mediebar stil';

  @override
  String get mediaBarModeDescription =>
      'Vælg mellem forskellige medielinjestilarter, eller slå medielinjen fra';

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
  String get mediaBarModeOff => 'Fra';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Aktiver Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Vis slideshow med fremhævet indhold hjemme';

  @override
  String get contentType => 'Indholdstype';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Film og tv-serier';

  @override
  String get moviesOnly => 'Kun film';

  @override
  String get tvShowsOnly => 'Kun tv-udsendelser';

  @override
  String get itemCount => 'Vareantal';

  @override
  String get noneSelected => 'Ingen valgt';

  @override
  String get noneExcluded => 'Ingen udelukket';

  @override
  String get autoAdvance => 'Automatisk fremrykning';

  @override
  String get autoAdvanceSlides => 'Gå automatisk videre til næste dias';

  @override
  String get autoAdvanceInterval => 'Auto fremrykningsinterval';

  @override
  String get trailerPreview => 'Forhåndsvisning af trailer';

  @override
  String get autoPlayTrailers =>
      'Afspil trailere automatisk i mediebjælken efter 3 sekunder';

  @override
  String get trailerAudio => 'Trailerlyd';

  @override
  String get enableTrailerAudio => 'Aktivér lyd for trailere i mediebaren';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Forhåndsvisning af episode';

  @override
  String get mediaPreview => 'Medie-forhåndsvisning';

  @override
  String get episodePreviewDescription =>
      'Spil en 30-sekunders indlejret forhåndsvisning på fokuserede, svævende eller langtrykte kort';

  @override
  String get mediaPreviewDescription =>
      'Spil en 30-sekunders indlejret forhåndsvisning på fokuserede, svævende eller langtrykte kort';

  @override
  String get previewAudio => 'Forhåndsvisning af lyd';

  @override
  String get enablePreviewAudio =>
      'Aktiver lyd for forhåndsvisning af trailer og episode';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Seneste medier';

  @override
  String get recentlyReleased => 'For nylig udgivet';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mine medier';

  @override
  String get myMediaSmall => 'Mine medier (lille)';

  @override
  String get continueWatching => 'Fortsæt med at se';

  @override
  String get resumeAudio => 'Genoptag lyd';

  @override
  String get resumeBooks => 'CV-bøger';

  @override
  String get activeRecordings => 'Aktive optagelser';

  @override
  String get playlists => 'Afspilningslister';

  @override
  String get liveTV => 'Live tv';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Nulstil til standardindstillinger';

  @override
  String get homeRowPosterSize => 'Hjemmerække plakatstørrelse';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurer billedtype for hver aktiveret startrække';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Flet Fortsæt med at se og Næste';

  @override
  String get combineBothRows =>
      'Kombiner begge rækker til en enkelt hjemmesektion';

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
  String get fullScreenRows => 'Udvidede rækker på startskærmen';

  @override
  String get fullScreenRowsDescription =>
      'Begræns startskærmen til én række pr. skærm';

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
  String get perRowSettings => 'Indstillinger pr. række';

  @override
  String get autoLogin => 'Automatisk login';

  @override
  String get lastUser => 'Sidste bruger';

  @override
  String get currentUser => 'Nuværende bruger';

  @override
  String get alwaysAuthenticate => 'Autentificer altid';

  @override
  String get requirePasswordWithToken => 'Kræv adgangskode selv med gemt token';

  @override
  String get confirmExit => 'Bekræft Afslut';

  @override
  String get showConfirmationBeforeExiting =>
      'Vis bekræftelse, før du forlader';

  @override
  String get blockContentWithRatings =>
      'Bloker indhold med følgende klassificeringer:';

  @override
  String get noContentRatingsFound =>
      'Ingen indholdsklassificeringer blev fundet på denne server endnu.';

  @override
  String get couldNotLoadServerRatings =>
      'Kunne ikke indlæse servervurderinger. Viser kun gemte bedømmelser.';

  @override
  String get couldNotRefreshRatings =>
      'Kunne ikke opdatere vurderinger fra serveren. Viser gemte bedømmelser.';

  @override
  String get enablePinCode => 'Aktiver PIN-kode';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Kræv en pinkode for at få adgang til din konto';

  @override
  String get changePin => 'Skift pinkode';

  @override
  String get setNewPinCode => 'Indstil en ny PIN-kode';

  @override
  String get removePin => 'Fjern PIN-koden';

  @override
  String get removePinProtection => 'Fjern PIN-kodebeskyttelsen';

  @override
  String get screensaver => 'Pauseskærm';

  @override
  String get inAppScreensaver => 'Pauseskærm i appen';

  @override
  String get enableBuiltInScreensaver => 'Aktiver den indbyggede pauseskærm';

  @override
  String get mode => 'Tilstand';

  @override
  String get libraryArt => 'Bibliotekskunst';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Ur';

  @override
  String get timeout => 'Tidsgrænse';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Dæmpningsniveau';

  @override
  String get maxAgeRating => 'Max aldersvurdering';

  @override
  String get any => 'Enhver';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Kræv aldersvurdering';

  @override
  String get onlyShowRatedContent => 'Vis kun bedømt indhold';

  @override
  String get displayClockDuringScreensaver => 'Vis ur under pauseskærm';

  @override
  String get clockModeStatic => 'Fast';

  @override
  String get clockModeBouncing => 'Hoppende';

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
  String get rottenTomatoesCritics => 'Rådne tomater (kritikere)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Publikum)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisk';

  @override
  String get metacriticUser => 'Metacritic (bruger)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Fællesskabsvurdering';

  @override
  String get ratings => 'Bedømmelser';

  @override
  String get additionalRatings => 'Yderligere vurderinger';

  @override
  String get showMdbListAndTmdbRatings => 'Vis MDBList og TMDB ratings';

  @override
  String get ratingLabels => 'Bedømmelsesetiketter';

  @override
  String get showLabelsNextToIcons => 'Vis etiketter ud for vurderingsikoner';

  @override
  String get ratingBadges => 'Bedømmelsesmærker';

  @override
  String get showDecorativeBadges => 'Vis dekorative badges bag vurderinger';

  @override
  String get episodeRatings => 'Afsnitsbedømmelser';

  @override
  String get showRatingsOnEpisodes => 'Vis bedømmelser på individuelle afsnit';

  @override
  String get ratingSources => 'Bedømmelseskilder';

  @override
  String get ratingSourcesDescription =>
      'Aktiver og omarranger de vurderingskilder, der vises i hele appen';

  @override
  String get pluginDetected => 'Plugin fundet';

  @override
  String get pluginNotDetected => 'Plugin ikke fundet';

  @override
  String get pluginNotDetectedDescription =>
      'Server-plugin er ikke fundet i øjeblikket. Lokale indstillinger bruger stadig deres gemte værdier eller indbyggede standarder.';

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
  String get recentRequests => 'Seneste anmodninger';

  @override
  String get recentlyAdded => 'Nyligt tilføjet';

  @override
  String get trending => 'Populært lige nu';

  @override
  String get popularMovies => 'Populære film';

  @override
  String get movieGenres => 'Film genrer';

  @override
  String get upcomingMovies => 'Kommende film';

  @override
  String get studios => 'Studier';

  @override
  String get popularSeries => 'Populær serie';

  @override
  String get seriesGenres => 'Serie genrer';

  @override
  String get upcomingSeries => 'Kommende serie';

  @override
  String get networks => 'Netværk';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr-opdagelsesrækker';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Nulstil rækker til standardindstillinger';

  @override
  String get enableSeerr => 'Aktiver Seerr';

  @override
  String get showSeerrInNavigation =>
      'Vis Seerr i navigation (kræver serverplugin)';

  @override
  String get seerrUnavailable =>
      'Ikke tilgængelig, fordi serverplugin Seerr-understøttelse er deaktiveret.';

  @override
  String get nsfwFilter => 'NSFW filter';

  @override
  String get hideAdultContent => 'Skjul voksenindhold i resultater';

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
  String get seerrNotificationsSection => 'Notifikationer';

  @override
  String get seerrNotifyNewRequestsTitle => 'Notifikationer om nye anmodninger';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Giv mig besked, når nogen sender en anmodning';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Opdateringer om anmodninger';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Godkendt, afvist og tilføjet til dit bibliotek';

  @override
  String get seerrNotifyIssuesTitle => 'Opdateringer om problemer';

  @override
  String get seerrNotifyIssuesSubtitle => 'Nye problemer, svar og løsninger';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Logget ind som: $username';
  }

  @override
  String get discoverRows => 'Seerr-opdagelsesside';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Aktiver de rækker, du vil se på Seerr-hovedsiden. Træk for at omarrangere. Den tilpassede rækkefølge synkroniseres med Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Aktiver de rækker, du vil se på Seerr-hovedsiden. Træk for at omarrangere. Den tilpassede rækkefølge synkroniseres med Moonbase.';

  @override
  String get enabled => 'Aktiveret';

  @override
  String get hidden => 'Skjult';

  @override
  String get aboutTitle => 'Om';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Open Source-licenser';

  @override
  String get sourceCode => 'Kildekode';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Søg efter opdateringer nu';

  @override
  String get checksLatestDesktopRelease =>
      'Kontrollerer seneste desktop-udgivelse for denne platform';

  @override
  String get youAreUpToDate => 'Du er opdateret.';

  @override
  String get couldNotCheckForUpdates =>
      'Kunne ikke søge efter opdateringer lige nu.';

  @override
  String get noCompatibleUpdate =>
      'Der blev ikke fundet nogen kompatibel opdateringspakke til denne platform.';

  @override
  String get updateChecksNotSupported =>
      'Opdateringstjek understøttes ikke på denne platform.';

  @override
  String get updateNotificationsDisabled =>
      'Opdateringsmeddelelser er deaktiveret.';

  @override
  String get pleaseWaitBeforeChecking => 'Vent venligst, før du tjekker igen.';

  @override
  String get latestUpdateAlreadyShown =>
      'Seneste opdatering blev allerede vist.';

  @override
  String get updateAvailable => 'Opdatering tilgængelig.';

  @override
  String updateAvailableVersion(String version) {
    return 'Opdatering tilgængelig: v$version';
  }

  @override
  String get updateNotifications => 'Opdater meddelelser';

  @override
  String get showWhenUpdatesAvailable =>
      'Vis, når opdateringer er tilgængelige';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Tilgængelig';
  }

  @override
  String get readReleaseNotes => 'Læs Release Notes';

  @override
  String get downloadingUpdate => 'Downloader opdatering...';

  @override
  String get updateDownloadFailed =>
      'Download af opdatering mislykkedes. Prøv venligst igen.';

  @override
  String get openReleasesPage => 'Åbn udgivelsessiden';

  @override
  String get navigation => 'Navigation';

  @override
  String get watchedIndicatorsBackdrops => 'Overvågede indikatorer, baggrunde';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusfarve, overvågede indikatorer, baggrunde';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar stil, værktøjslinje knapper, udseende';

  @override
  String get featuredContentAppearance => 'Udvalgt indhold, udseende';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Grænse for billedcache';

  @override
  String get clearImageCache => 'Ryd billedcache';

  @override
  String get imageCacheCleared => 'Billedcachen er ryddet';

  @override
  String get clear => 'Ryd';

  @override
  String get browse => 'Gennemse';

  @override
  String get noResults => 'Ingen resultater';

  @override
  String get seerrAvailableStatus => 'Tilgængelig';

  @override
  String get seerrRequestedStatus => 'Anmodet';

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
    return 'Downloader · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importerer';

  @override
  String itemsCount(int count) {
    return '$count Elementer';
  }

  @override
  String get seerrSettings => 'Seerr Indstillinger';

  @override
  String get requestMore => 'Anmod om mere';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Anmodning';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Annuller anmodning';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Spil i Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Anmodet af $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Godkende';

  @override
  String get declineAction => 'Nedgang';

  @override
  String get similar => 'Lignende';

  @override
  String get recommendations => 'Anbefalinger';

  @override
  String cancelRequestForTitle(String title) {
    return 'Annuller anmodning om \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Vil du annullere $count anmodninger om \"$title\"?';
  }

  @override
  String get keep => 'Holde';

  @override
  String get itemNotFoundInLibrary =>
      'Element blev ikke fundet i dit Moonfin-bibliotek';

  @override
  String get errorSearchingLibrary => 'Fejl ved søgning i bibliotek';

  @override
  String budgetAmount(String amount) {
    return 'Budget: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Omsætning: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Anmod om $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Indsend anmodning';

  @override
  String get allSeasons => 'Alle årstider';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Avancerede indstillinger';

  @override
  String get noServiceServersConfigured => 'Ingen serviceservere konfigureret';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Kvalitetsprofil';

  @override
  String get rootFolder => 'Rodmappe';

  @override
  String get showMore => 'Vis mere';

  @override
  String get appearances => 'Optrædener';

  @override
  String get crewSection => 'Mandskab';

  @override
  String ageValue(int age) {
    return 'alder $age';
  }

  @override
  String get noRequests => 'Ingen anmodninger';

  @override
  String get pendingStatus => 'Indtil';

  @override
  String get declinedStatus => 'Afvist';

  @override
  String get partiallyAvailable => 'Delvis tilgængelig';

  @override
  String get downloadingStatus => 'Downloader';

  @override
  String get approvedStatus => 'Godkendt';

  @override
  String get notRequestedStatus => 'Ikke anmodet';

  @override
  String get blocklistedStatus => 'Bloklistet';

  @override
  String get deletedStatus => 'Slettet';

  @override
  String get failedStatus => 'Mislykkedes';

  @override
  String get processingStatus => 'Behandles';

  @override
  String modifiedByName(String name) {
    return 'Ændret af $name';
  }

  @override
  String get completedStatus => 'Fuldført';

  @override
  String get requestErrorDuplicate => 'Der er allerede anmodet om denne titel';

  @override
  String get requestErrorQuota => 'Grænsen for anmodninger er nået';

  @override
  String get requestErrorBlocklisted => 'Denne titel er blokeret';

  @override
  String get requestErrorNoSeasons => 'Der er ikke flere sæsoner at anmode om';

  @override
  String get requestErrorPermission =>
      'Du har ikke tilladelse til at foretage denne anmodning';

  @override
  String get seerrRequestsTitle => 'Anmodninger';

  @override
  String get seerrIssuesTitle => 'Problemer';

  @override
  String get sortNewest => 'Nyeste';

  @override
  String get sortLastModified => 'Senest ændret';

  @override
  String get noIssues => 'Ingen problemer';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining af $limit filmanmodninger tilbage';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining af $limit sæsonanmodninger tilbage';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Del af $name';
  }

  @override
  String get viewCollection => 'Vis samling';

  @override
  String get requestCollection => 'Anmod om samling';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total film · $available tilgængelige';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Anmod om $count film';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Anmoder om $current af $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Der er anmodet om $count film';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Der er anmodet om $ok af $total film';
  }

  @override
  String get collectionAllRequested =>
      'Alle film er allerede tilgængelige eller anmodet om';

  @override
  String get reportIssue => 'Rapportér problem';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Lyd';

  @override
  String get whatsWrong => 'Hvad er der galt?';

  @override
  String get allEpisodes => 'Alle episoder';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Åben';

  @override
  String get resolvedStatus => 'Løst';

  @override
  String get resolveAction => 'Markér som løst';

  @override
  String get reopenAction => 'Genåbn';

  @override
  String reportedByName(String name) {
    return 'Rapporteret af $name';
  }

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String get addComment => 'Tilføj en kommentar';

  @override
  String get deleteIssueConfirm => 'Slet dette problem?';

  @override
  String get submitReport => 'Send rapport';

  @override
  String get tmdbScore => 'TMDB-score';

  @override
  String get releaseDateLabel => 'Udgivelsesdato';

  @override
  String get firstAirDateLabel => 'Første luftdato';

  @override
  String get revenueLabel => 'Indtægter';

  @override
  String get runtimeLabel => 'Spilletid';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Originalsprog';

  @override
  String get seasonsLabel => 'Sæsoner';

  @override
  String get episodesLabel => 'Episoder';

  @override
  String get access => 'Adgang';

  @override
  String get add => 'Tilføj';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analyse';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Tilfreds';

  @override
  String get copy => 'Kopi';

  @override
  String get create => 'Skabe';

  @override
  String get disable => 'Deaktiver';

  @override
  String get done => 'Færdig';

  @override
  String get edit => 'Rediger';

  @override
  String get encoding => 'Kodning';

  @override
  String get error => 'Fejl';

  @override
  String get forward => 'Frem';

  @override
  String get general => 'Generelt';

  @override
  String get go => 'Gå';

  @override
  String get install => 'Installere';

  @override
  String get installed => 'Installeret';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Navn';

  @override
  String get networking => 'Netværk';

  @override
  String get next => 'Næste';

  @override
  String get path => 'Sti';

  @override
  String get paused => 'Pause';

  @override
  String get permissions => 'Tilladelser';

  @override
  String get processing => 'Forarbejdning';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Udbyder';

  @override
  String get refresh => 'Opfriske';

  @override
  String get remote => 'Fjernbetjening';

  @override
  String get rename => 'Omdøb';

  @override
  String get revoke => 'Tilbagekald';

  @override
  String get role => 'Rolle';

  @override
  String get root => 'Rod';

  @override
  String get run => 'Løbe';

  @override
  String get search => 'Søg';

  @override
  String get select => 'Vælge';

  @override
  String get send => 'Sende';

  @override
  String get sessions => 'Sessioner';

  @override
  String get set => 'Sæt';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Tid';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Afinstaller';

  @override
  String get up => 'Op';

  @override
  String get update => 'Opdatering';

  @override
  String get upload => 'Upload';

  @override
  String get unmute => 'Slå lyden til';

  @override
  String get mute => 'Slå lyd fra';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Kontrolpanel';

  @override
  String get adminDrawerAnalytics => 'Analyse';

  @override
  String get adminDrawerSettings => 'Indstillinger';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Brugere';

  @override
  String get adminDrawerLibraries => 'Biblioteker';

  @override
  String get adminDrawerDisplay => 'Visning';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO-indstillinger';

  @override
  String get adminDrawerTranscoding => 'Omkodning';

  @override
  String get adminDrawerResume => 'Genoptag';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Enheder';

  @override
  String get adminDrawerActivity => 'Aktivitet';

  @override
  String get adminDrawerNetworking => 'Netværk';

  @override
  String get adminDrawerApiKeys => 'API nøgler';

  @override
  String get adminDrawerBackups => 'Sikkerhedskopier';

  @override
  String get adminDrawerLogs => 'Logfiler';

  @override
  String get adminDrawerScheduledTasks => 'Planlagte opgaver';

  @override
  String get adminDrawerPlugins => 'Plugins';

  @override
  String get adminDrawerRepositories => 'Depoter';

  @override
  String get adminDrawerLiveTv => 'Live tv';

  @override
  String get adminExitTooltip => 'Afslut Admin';

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
  String get adminDashboardLoadFailed =>
      'Betjeningspanelet kunne ikke indlæses';

  @override
  String get adminMediaOverview => 'Medieoversigt';

  @override
  String get adminMediaTotalsError => 'Kunne ikke indlæse servermedietotaler.';

  @override
  String get adminMediaOverviewSubtitle =>
      'En hurtig læsning om, hvor meget indhold der er på denne server.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Plugin-opdateringer tilgængelige: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins, der kræver genstart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Mislykkede planlagte opgaver: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Mediedistribution';

  @override
  String get analyticsVideoCodecs => 'Video codecs';

  @override
  String get analyticsAudioCodecs => 'Lyd-codecs';

  @override
  String get analyticsContainers => 'Containere';

  @override
  String get analyticsTopGenres => 'Top genrer';

  @override
  String get analyticsReleaseYears => 'Udgivelsesår';

  @override
  String get analyticsContentRatings => 'Indholdsvurderinger';

  @override
  String get analyticsRuntimeBuckets => 'Spilletidsintervaller';

  @override
  String get analyticsFileFormats => 'Filformater';

  @override
  String get analyticsNoData => 'Ingen tilgængelige data.';

  @override
  String get adminServerInfo => 'Server info';

  @override
  String get adminRestartPending => 'Genstart afventer';

  @override
  String get adminServerPaths => 'Serverstier';

  @override
  String get adminServerActions => 'Serverhandlinger';

  @override
  String get adminRestartServer => 'Genstart server';

  @override
  String get adminShutdownServer => 'Luk server';

  @override
  String get adminLibraryScanStarted => 'Biblioteksscanning startede';

  @override
  String errorGeneric(String error) {
    return 'Fejl: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Servergenstart er i gang';

  @override
  String get adminServerRebootMessage =>
      'Servergenstart er i gang. Genstart venligst Moonfin';

  @override
  String get adminActiveSessions => 'Aktive sessioner';

  @override
  String get adminSessionsLoadFailed => 'Kunne ikke indlæse sessioner';

  @override
  String get adminNoActiveSessions => 'Ingen aktive sessioner';

  @override
  String get adminRecentActivity => 'Seneste aktivitet';

  @override
  String get adminNoRecentActivity => 'Ingen nylig aktivitet';

  @override
  String adminCommandFailed(String error) {
    return 'Kommando mislykkedes: $error';
  }

  @override
  String get adminSendMessage => 'Send besked';

  @override
  String get adminMessageTextHint => 'Besked tekst';

  @override
  String get adminSetVolume => 'Indstil lydstyrke';

  @override
  String get sessionPrev => 'Forrige';

  @override
  String get sessionRewind => 'Spole tilbage';

  @override
  String get sessionForward => 'Spol frem';

  @override
  String get sessionNext => 'Næste';

  @override
  String get sessionVolumeDown => 'bind –';

  @override
  String get sessionVolumeUp => 'Lyd +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Spiller nu';

  @override
  String get volume => 'Lydstyrke';

  @override
  String get actions => 'Handlinger';

  @override
  String get videoCodec => 'Videocodec';

  @override
  String get audioCodec => 'Lydcodec';

  @override
  String get hwAccel => 'HW-accel';

  @override
  String get completion => 'Fuldførelse';

  @override
  String get adminClearDates => 'Klare datoer';

  @override
  String get adminActivitySeverityAll => 'Alle alvorsgrader';

  @override
  String get adminActivityDateRange => 'Datointerval';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Kunne ikke indlæse aktivitetslog: $error';
  }

  @override
  String get adminNoActivityEntries => 'Ingen aktivitetsposter';

  @override
  String get adminEditDeviceName => 'Rediger enhedsnavn';

  @override
  String get adminCustomName => 'Brugerdefineret navn';

  @override
  String get adminDeviceNameUpdated => 'Enhedens navn er opdateret';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Kunne ikke opdatere enhed: $error';
  }

  @override
  String get adminDeleteDevice => 'Slet enhed';

  @override
  String get adminDeviceDeleted => 'Enheden er slettet';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Kunne ikke slette enhed: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Fjern enheden \'$name\'? Brugeren skal logge ind igen på denne enhed.';
  }

  @override
  String get adminDeleteAllDevices => 'Slet alle enheder';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Fjern $count enheder? Berørte brugere skal logge ind igen. Din nuværende enhed påvirkes ikke.';
  }

  @override
  String get adminDevicesDeletedAll => 'Enhederne er fjernet';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Nogle enheder blev fjernet; $count kunne ikke fjernes.';
  }

  @override
  String get adminDevicesLoadFailed => 'Kunne ikke indlæse enheder';

  @override
  String get adminSearchDevices => 'Søg efter enheder';

  @override
  String get adminThisDevice => 'Denne enhed';

  @override
  String get adminEditName => 'Rediger navn';

  @override
  String get adminLibrariesLoadFailed => 'Kunne ikke indlæse biblioteker';

  @override
  String get adminNoLibraries => 'Ingen biblioteker konfigureret';

  @override
  String get adminScanAllLibraries => 'Scan alle biblioteker';

  @override
  String get adminAddLibrary => 'Tilføj bibliotek';

  @override
  String adminScanFailed(String error) {
    return 'Kunne ikke starte scanning: $error';
  }

  @override
  String get adminRenameLibrary => 'Omdøb bibliotek';

  @override
  String get adminNewName => 'Nyt navn';

  @override
  String adminLibraryRenamed(String name) {
    return 'Bibliotek omdøbt til \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Kunne ikke omdøbe: $error';
  }

  @override
  String get adminDeleteLibrary => 'Slet bibliotek';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteket \"$name\" er slettet';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kunne ikke slette bibliotek: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Kunne ikke tilføje stien: $error';
  }

  @override
  String get adminRemovePath => 'Fjern sti';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Vil du fjerne \"$path\" fra dette bibliotek?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Kunne ikke fjerne stien: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kunne ikke indlæse biblioteket';

  @override
  String get adminNoMediaPaths => 'Ingen mediestier konfigureret';

  @override
  String get adminAddPath => 'Tilføj sti';

  @override
  String get adminBrowseFilesystem => 'Gennemse serverfilsystem:';

  @override
  String get adminPreferredMetadataLanguage => 'Foretrukken metadatasprog';

  @override
  String get adminMetadataLanguageHint => 'f.eks. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata landekode';

  @override
  String get adminMetadataCountryHint => 'f.eks. USA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Stier';

  @override
  String get adminLibraryTabOptions => 'Indstillinger';

  @override
  String get adminLibraryTabDownloaders => 'Downloadere';

  @override
  String get adminLibMetadataSavers => 'Metadatagemmere';

  @override
  String get adminLibSubtitleDownloaders => 'Undertekstdownloadere';

  @override
  String get adminLibLyricDownloaders => 'Sangtekstdownloadere';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadatadownloadere: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Billedhentere: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Denne server har ingen downloadere til denne bibliotekstype.';

  @override
  String get adminLibrarySectionGeneral => 'Generelt';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Indlejrede oplysninger';

  @override
  String get adminLibrarySectionSubtitles => 'Undertekster';

  @override
  String get adminLibrarySectionImages => 'Billeder';

  @override
  String get adminLibrarySectionSeries => 'Serier';

  @override
  String get adminLibrarySectionMusic => 'Musik';

  @override
  String get adminLibrarySectionMovies => 'Film';

  @override
  String get adminLibRealtimeMonitor => 'Aktivér overvågning i realtid';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Registrér filændringer, og behandl dem automatisk.';

  @override
  String get adminLibEnablePhotos => 'Vis fotos';

  @override
  String get adminLibSaveLocalMetadata => 'Gem grafik i mediemapperne';

  @override
  String get adminLibRefreshInterval => 'Automatisk opdatering af metadata';

  @override
  String get adminLibRefreshNever => 'Aldrig';

  @override
  String get adminLibDefault => 'Standard';

  @override
  String get adminLibDisplayTitle => 'Visning';

  @override
  String get adminLibDisplaySection => 'Biblioteksvisning';

  @override
  String get adminLibFolderView =>
      'Vis en mappevisning med almindelige mediemapper';

  @override
  String get adminLibSpecialsInSeasons =>
      'Vis specialafsnit i de sæsoner, de blev sendt i';

  @override
  String get adminLibGroupMovies => 'Gruppér film i samlinger';

  @override
  String get adminLibGroupShows => 'Gruppér serier i samlinger';

  @override
  String get adminLibExternalSuggestions => 'Vis eksternt indhold i forslag';

  @override
  String get adminLibDateAddedSection => 'Adfærd for tilføjelsesdato';

  @override
  String get adminLibDateAddedLabel => 'Brug tilføjelsesdato fra';

  @override
  String get adminLibDateAddedImport => 'Datoen for scanning ind i biblioteket';

  @override
  String get adminLibDateAddedFile => 'Datoen filen blev oprettet';

  @override
  String get adminLibMetadataTitle => 'Metadata og billeder';

  @override
  String get adminLibMetadataLangSection => 'Foretrukket metadatasprog';

  @override
  String get adminLibChaptersSection => 'Kapitler';

  @override
  String get adminLibDummyChapterDuration =>
      'Varighed af dummy-kapitler (sekunder)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Længden på kapitler, der genereres til medier uden kapitler. Sæt til 0 for at deaktivere.';

  @override
  String get adminLibChapterImageResolution => 'Opløsning for kapitelbilleder';

  @override
  String get adminLibNfoTitle => 'NFO-indstillinger';

  @override
  String get adminLibNfoHelp =>
      'NFO-metadata er kompatible med Kodi og lignende klienter. Indstillingerne gælder for alle biblioteker, der gemmer NFO-metadata.';

  @override
  String get adminLibKodiUser => 'Bruger, hvis visningsdata gemmes i NFO-filer';

  @override
  String get adminLibSaveImagePaths => 'Gem billedstier i NFO-filer';

  @override
  String get adminLibPathSubstitution =>
      'Aktivér stierstatning for billedstier i NFO-filer';

  @override
  String get adminLibExtraThumbs =>
      'Kopiér extrafanart-billeder til en extrathumbs-mappe';

  @override
  String get adminLibNone => 'Ingen';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dage';
  }

  @override
  String get adminLibEmbeddedTitles => 'Brug indlejrede titler';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Brug indlejrede titler til ekstramateriale';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Brug indlejrede episodeoplysninger';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Tillad indlejrede undertekster';

  @override
  String get adminLibEmbeddedAllowAll => 'Tillad alle';

  @override
  String get adminLibEmbeddedAllowText => 'Kun tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Kun billede';

  @override
  String get adminLibEmbeddedAllowNone => 'Ingen';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Spring download over, hvis der findes indlejrede undertekster';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Spring download over, hvis lydsporet matcher downloadsproget';

  @override
  String get adminLibRequirePerfectMatch => 'Kræv et perfekt undertekstmatch';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Gem undertekster i mediemapperne';

  @override
  String get adminLibChapterImageExtraction => 'Udtræk kapitelbilleder';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Udtræk kapitelbilleder under biblioteksscanningen';

  @override
  String get adminLibTrickplayExtraction =>
      'Aktivér udtrækning af trickplay-billeder';

  @override
  String get adminLibTrickplayDuringScan =>
      'Udtræk trickplay-billeder under biblioteksscanningen';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Gem trickplay-billeder i mediemapperne';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Flet automatisk serier, der er fordelt over flere mapper';

  @override
  String get adminLibSeasonZeroName => 'Visningsnavn for sæson nul';

  @override
  String get adminLibLufsScan => 'Aktivér LUFS-scanning til lydnormalisering';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Foretræk ikke-standardiseret artists-tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Tilføj automatisk film til samlinger';

  @override
  String get adminLibraryNameRequired => 'Bibliotekets navn er påkrævet';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kunne ikke oprette bibliotek: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekets navn';

  @override
  String get adminSelectedPaths => 'Valgte stier:';

  @override
  String get adminCreateLibrary => 'Opret bibliotek';

  @override
  String get paths => 'Stier:';

  @override
  String get adminDisableUser => 'Deaktiver bruger';

  @override
  String get adminEnableUser => 'Aktiver bruger';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Deaktiver $name? De vil ikke kunne logge ind.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Vil du aktivere $name? De vil være i stand til at logge ind igen.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Bruger \"$name\" deaktiveret';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Bruger \"$name\" aktiveret';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kunne ikke opdatere brugerpolitikken: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Kunne ikke indlæse brugere';

  @override
  String get adminSearchUsers => 'Søg efter brugere';

  @override
  String get adminEditUser => 'Rediger bruger';

  @override
  String get adminAddUser => 'Tilføj bruger';

  @override
  String adminUserCreateFailed(String error) {
    return 'Kunne ikke oprette bruger: $error';
  }

  @override
  String get adminCreateUser => 'Opret bruger';

  @override
  String get adminPasswordOptional => 'Adgangskode (valgfrit)';

  @override
  String get adminUsernameRequired => 'Brugernavnet må ikke være tomt';

  @override
  String adminSaveFailed(String error) {
    return 'Kunne ikke gemme: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Adgangskoder stemmer ikke overens';

  @override
  String adminFailed(String error) {
    return 'Mislykkedes: $error';
  }

  @override
  String get adminUserLoadFailed => 'Brugeren kunne ikke indlæses';

  @override
  String get adminDeleteUser => 'Slet bruger';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administratorer har fuld adgang til serveren. Giv med forsigtighed.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Skjult bruger';

  @override
  String get adminAllowMediaPlayback => 'Tillad medieafspilning';

  @override
  String get adminAllowAudioTranscoding => 'Tillad lydomkodning';

  @override
  String get adminAllowVideoTranscoding => 'Tillad videoomkodning';

  @override
  String get adminAllowRemuxing => 'Tillad genblanding';

  @override
  String get adminForceRemoteTranscoding => 'Tving fjernkildeomkodning';

  @override
  String get adminAllowContentDownloading => 'Tillad download af indhold';

  @override
  String get adminAllowPublicSharing => 'Tillad offentlig deling';

  @override
  String get adminAllowRemoteControl =>
      'Tillad fjernbetjening af andre brugere';

  @override
  String get adminAllowSharedDeviceControl => 'Tillad delt enhedskontrol';

  @override
  String get adminAllowRemoteAccess => 'Tillad fjernadgang';

  @override
  String get adminLeaveEmptyNoLimit => 'Lad stå tomt uden grænse';

  @override
  String get adminMaxActiveSessions => 'Max aktive sessioner';

  @override
  String get adminAllowLiveTvAccess => 'Tillad direkte tv-adgang';

  @override
  String get adminAllowLiveTvManagement => 'Tillad direkte tv-styring';

  @override
  String get adminAllowCollectionManagement => 'Tillad samlingsstyring';

  @override
  String get adminAllowSubtitleManagement =>
      'Tillad administration af undertekster';

  @override
  String get adminAllowLyricManagement => 'Tillad tekststyring';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktiver adgang til alle biblioteker';

  @override
  String get adminChangePassword => 'Skift adgangskode';

  @override
  String get adminNewPassword => 'Ny adgangskode';

  @override
  String get adminConfirmPassword => 'Bekræft adgangskode';

  @override
  String get adminSetPassword => 'Indstil adgangskode';

  @override
  String get adminResetPassword => 'Nulstil adgangskode';

  @override
  String get adminPasswordReset => 'Adgangskode nulstillet';

  @override
  String get adminPasswordUpdated => 'Adgangskode opdateret';

  @override
  String get adminUserSettings => 'Brugerindstillinger';

  @override
  String get adminLibraryAccess => 'Biblioteksadgang';

  @override
  String get adminEnableAllDevices => 'Aktiver adgang til alle enheder';

  @override
  String get adminEnableAllChannels => 'Aktiver adgang til alle kanaler';

  @override
  String get adminParentalControl => 'Forældrekontrol';

  @override
  String get adminMaxParentalRating => 'Højest tilladte aldersgrænse';

  @override
  String get adminMaxParentalRatingHint =>
      'Indhold med en højere aldersgrænse skjules for denne bruger.';

  @override
  String get adminParentalRatingNone => 'Ingen';

  @override
  String get adminBlockUnratedItems =>
      'Blokér emner uden eller med ukendte aldersoplysninger';

  @override
  String get adminUnratedBook => 'Bøger';

  @override
  String get adminUnratedChannelContent => 'Kanaler';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Film';

  @override
  String get adminUnratedMusic => 'Musik';

  @override
  String get adminUnratedTrailer => 'Trailere';

  @override
  String get adminUnratedSeries => 'Serier';

  @override
  String get adminAccessSchedules => 'Adgangsplaner';

  @override
  String get adminAccessSchedulesHint =>
      'Tillad kun adgang i de planlagte tidsrum nedenfor. Der er adgang hele døgnet, når der ikke er angivet en plan.';

  @override
  String get adminAddSchedule => 'Tilføj plan';

  @override
  String get adminScheduleDay => 'Dag';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'Slut';

  @override
  String get adminDayEveryday => 'Hver dag';

  @override
  String get adminDayWeekday => 'Hverdag';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Søndag';

  @override
  String get adminDayMonday => 'Mandag';

  @override
  String get adminDayTuesday => 'Tirsdag';

  @override
  String get adminDayWednesday => 'Onsdag';

  @override
  String get adminDayThursday => 'Torsdag';

  @override
  String get adminDayFriday => 'Fredag';

  @override
  String get adminDaySaturday => 'Lørdag';

  @override
  String get adminAllowedTags => 'Tilladte tags';

  @override
  String get adminAllowedTagsHint =>
      'Kun indhold med disse tags vises. Lad feltet stå tomt for at tillade alt.';

  @override
  String get adminBlockedTags => 'Blokerede tags';

  @override
  String get adminBlockedTagsHint =>
      'Indhold med disse tags skjules for denne bruger.';

  @override
  String get adminAddTag => 'Tilføj tag';

  @override
  String get adminAuthProvider => 'Godkendelsesudbyder';

  @override
  String get adminPasswordResetProvider =>
      'Udbyder til nulstilling af adgangskode';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maksimalt antal mislykkede loginforsøg før låsning';

  @override
  String get adminLoginAttemptsHint =>
      'Sæt til 0 for standardværdien, eller -1 for at deaktivere låsning.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-adgang';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Tillad oprettelse af og deltagelse i grupper';

  @override
  String get adminSyncPlayJoin => 'Tillad deltagelse i grupper';

  @override
  String get adminSyncPlayNone => 'Ingen adgang';

  @override
  String get adminContentDeletionFolders => 'Tillad sletning af indhold fra';

  @override
  String get adminResetPasswordWarning =>
      'Dette vil fjerne adgangskoden. Brugeren vil være i stand til at logge på uden adgangskode.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server returnerede HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Er du sikker på, at du vil slette $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Bruger \"$name\" slettet';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kunne ikke slette bruger: $error';
  }

  @override
  String get adminCreateApiKey => 'Opret API-nøgle';

  @override
  String get adminAppName => 'App navn';

  @override
  String get adminApiKeyCreated => 'API-nøgle oprettet';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Nøglen er oprettet. Serveren returnerede ikke tokenet. Tjek server API-nøgler.';

  @override
  String get adminKeyCopied => 'Nøglen er kopieret til udklipsholderen';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Kunne ikke oprette nøgle: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Nøgletoken mangler fra serversvar';

  @override
  String get adminRevokeApiKey => 'Tilbagekald API-nøgle';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Vil du tilbagekalde nøglen for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-nøgle tilbagekaldt';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nøglen kunne ikke tilbagekaldes: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Kunne ikke indlæse API-nøgler';

  @override
  String get adminApiKeysTitle => 'API nøgler';

  @override
  String get adminCreateKey => 'Opret nøgle';

  @override
  String get adminNoApiKeys => 'Ingen API-nøgler fundet';

  @override
  String get adminUnknownApp => 'Ukendt app';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nOprettet: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Opret sikkerhedskopi';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Altid inkluderet';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Undertekster';

  @override
  String get adminBackupTrickplay => 'Trickplay-billeder';

  @override
  String get adminCreatingBackup => 'Opretter backup...';

  @override
  String get adminBackupCreated => 'Sikkerhedskopien blev oprettet';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Kunne ikke oprette backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backupsti mangler i serversvar';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Kunne ikke indlæse manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Bekræft gendannelse';

  @override
  String get adminRestoringBackup => 'Gendanner backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Kunne ikke gendanne backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Kunne ikke indlæse sikkerhedskopier';

  @override
  String get adminCreateBackup => 'Opret sikkerhedskopi';

  @override
  String get adminNoBackups => 'Ingen sikkerhedskopier fundet';

  @override
  String get adminViewDetails => 'Se detaljer';

  @override
  String get restore => 'Gendan';

  @override
  String get adminLogsLoadFailed => 'Kunne ikke indlæse serverlogfiler';

  @override
  String get adminNoLogFiles => 'Ingen logfiler fundet';

  @override
  String get adminLogCopied => 'Log kopieret til udklipsholder';

  @override
  String get adminSaveLogFile => 'Gem logfil';

  @override
  String adminSavedTo(String path) {
    return 'Gemt til $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Filen kunne ikke gemmes: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Kunne ikke indlæse $fileName';
  }

  @override
  String get adminSearchInLog => 'Søg i log';

  @override
  String get adminNoMatchingLines => 'Ingen matchende linjer';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Kunne ikke indlæse opgaver: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ingen planlagte opgaver fundet';

  @override
  String get adminNoTasksMatchFilter =>
      'Ingen opgaver matcher det aktuelle filter';

  @override
  String adminTaskStartFailed(String error) {
    return 'Opgaven kunne ikke startes: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Opgaven kunne ikke stoppes: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Opgaven kunne ikke indlæses: $error';
  }

  @override
  String get adminRunNow => 'Kør nu';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Kunne ikke fjerne trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Kunne ikke tilføje trigger: $error';
  }

  @override
  String get adminLastExecution => 'Sidste henrettelse';

  @override
  String get adminTriggers => 'Udløsere';

  @override
  String get adminAddTrigger => 'Tilføj trigger';

  @override
  String get adminNoTriggers => 'Ingen udløsere er konfigureret';

  @override
  String get adminTriggerType => 'Trigger type';

  @override
  String get adminNoLimit => 'Ingen grænse';

  @override
  String adminHours(String hours) {
    return '$hours time(r)';
  }

  @override
  String get adminDayOfWeek => 'ugedag';

  @override
  String get adminSearchPlugins => 'Søg plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Kunne ikke skifte plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Afinstaller plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Er du sikker på, at du vil afinstallere \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Kunne ikke afinstallere plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Kunne ikke installere pakken: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Kunne ikke installere opdatering: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Kunne ikke indlæse plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'Ingen plugins matcher din søgning';

  @override
  String get adminNoPluginsInstalled => 'Ingen plugins installeret';

  @override
  String adminInstallUpdate(String version) {
    return 'Installer opdatering (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kunne ikke indlæse katalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Ingen pakker matcher din søgning';

  @override
  String get adminNoPackagesAvailable => 'Ingen tilgængelige pakker';

  @override
  String get adminExperimentalIntegration => 'Eksperimentel integration';

  @override
  String get adminExperimentalWarning =>
      'Integration af plugin-indstillinger er stadig eksperimentel. Nogle indstillingssider gengives muligvis ikke korrekt.';

  @override
  String get continueAction => 'Fortsætte';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" vil blive fjernet efter genstart af serveren';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Kunne ikke afinstallere: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Opdaterer \"$name\" til v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Kunne ikke indlæse plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin blev ikke fundet';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Aktiver plugin';

  @override
  String get adminPluginSettingsPage => 'Siden med plugin-indstillinger';

  @override
  String get adminRevisionHistory => 'Revisionshistorie';

  @override
  String get adminNoChangelog => 'Ingen ændringslog tilgængelig.';

  @override
  String get adminRemoveRepository => 'Fjern repository';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Er du sikker på, at du vil fjerne \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Kunne ikke gemme lagre: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Kunne ikke indlæse lagre: $error';
  }

  @override
  String get adminRepositoryNameHint => 'f.eks. Jellyfin Stald';

  @override
  String get adminRepositoryUrl => 'Depot-URL';

  @override
  String get adminAddEntry => 'Tilføj post';

  @override
  String get adminInvalidUrl => 'Ugyldig URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Kan ikke indlæse plugin-indstillinger: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Kunne ikke åbne $uri';
  }

  @override
  String get adminOpenInBrowser => 'Åbn i browser';

  @override
  String get adminOpenExternally => 'Åbn eksternt';

  @override
  String get adminGeneralSettings => 'Generelle indstillinger';

  @override
  String get adminServerName => 'Servernavn';

  @override
  String get adminPreferredMetadataCountry => 'Foretrukket metadataland';

  @override
  String get adminCachePath => 'Cache-sti';

  @override
  String get adminMetadataPath => 'Metadatasti';

  @override
  String get adminLibraryScanConcurrency => 'Biblioteksscanning samtidighed';

  @override
  String get adminParallelImageEncodingLimit =>
      'Grænse for kodning af parallelle billeder';

  @override
  String get adminSlowResponseThreshold => 'Tærskel for langsom respons (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Brandingindstillingerne kunne ikke indlæses';

  @override
  String get adminLoginDisclaimer => 'Login ansvarsfraskrivelse';

  @override
  String get adminLoginDisclaimerHint => 'HTML vist under login-formularen';

  @override
  String get adminCustomCss => 'Brugerdefineret CSS';

  @override
  String get adminCustomCssHint =>
      'Brugerdefineret CSS anvendt på webgrænsefladen';

  @override
  String get adminEnableSplashScreen => 'Aktiver splash screen';

  @override
  String get adminStreamingLoadFailed =>
      'Kunne ikke indlæse streamingindstillinger';

  @override
  String get adminStreamingDescription =>
      'Indstil globale streamingbithastighedsgrænser for fjernforbindelser.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ekstern klientbithastighedsgrænse (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Lad være tom eller 0 for ubegrænset';

  @override
  String get adminPlaybackLoadFailed =>
      'Kunne ikke indlæse afspilningsindstillinger';

  @override
  String get adminHardwareAcceleration => 'Hardwareacceleration';

  @override
  String get adminVaapiDevice => 'VA-API enhed';

  @override
  String get adminEnableHardwareEncoding => 'Aktiver hardwarekodning';

  @override
  String get adminEnableHardwareDecoding => 'Aktiver hardwareafkodning for:';

  @override
  String get adminEncodingThreads => 'Kodning af tråde';

  @override
  String get adminAutomatic => '0 = automatisk';

  @override
  String get adminTranscodingTempPath => 'Transkodning af temp sti';

  @override
  String get adminEnableFallbackFont => 'Aktiver reserveskrifttype';

  @override
  String get adminFallbackFontPath => 'Alternativ skrifttypesti';

  @override
  String get adminAllowSegmentDeletion => 'Tillad sletning af segmenter';

  @override
  String get adminSegmentKeepSeconds => 'Segmenthold (sekunder)';

  @override
  String get adminThrottleBuffering => 'Gasspjældbuffring';

  @override
  String get adminTrickplayLoadFailed =>
      'Kunne ikke indlæse trickplay-indstillinger';

  @override
  String get adminEnableHardwareAcceleration => 'Aktiver hardwareacceleration';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktiver kun udtræk af nøgleramme';

  @override
  String get adminKeyFrameSubtitle => 'Hurtigere men lavere nøjagtighed';

  @override
  String get adminScanBehavior => 'Scan adfærd';

  @override
  String get adminProcessPriority => 'Procesprioritet';

  @override
  String get adminImageSettings => 'Billedindstillinger';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Hvor ofte skal man fange billeder';

  @override
  String get adminWidthResolutions => 'Bredde opløsninger';

  @override
  String get adminTileWidth => 'Flisebredde';

  @override
  String get adminTileHeight => 'Flisehøjde';

  @override
  String get adminQualitySubtitle =>
      'Lavere værdier = bedre kvalitet, større filer';

  @override
  String get adminProcessThreads => 'Bearbejd tråde';

  @override
  String get adminResumeLoadFailed => 'Kunne ikke indlæse CV-indstillinger';

  @override
  String get adminResumeDescription =>
      'Konfigurer, hvornår indhold skal markeres som delvist afspillet eller fuldt afspillet.';

  @override
  String get adminMinResumePercentage => 'Minimum cv-procent';

  @override
  String get adminMinResumeSubtitle =>
      'Indhold skal afspilles over denne procentdel for at gemme fremskridt';

  @override
  String get adminMaxResumePercentage => 'Maksimal genoptagelsesprocent';

  @override
  String get adminMaxResumeSubtitle =>
      'Indhold betragtes som fuldt afspillet efter denne procentdel';

  @override
  String get adminMinResumeDuration =>
      'Minimum genoptagelsesvarighed (sekunder)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Elementer, der er kortere end dette, kan ikke genoptages';

  @override
  String get adminMinAudiobookResume =>
      'Minimumsprocent for genoptagelse af lydbog';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimal procentdel for genoptagelse af lydbøger';

  @override
  String get adminNetworkingLoadFailed =>
      'Netværksindstillinger kunne ikke indlæses';

  @override
  String get adminNetworkingWarning =>
      'Ændringer af netværksindstillinger kan kræve en genstart af serveren.';

  @override
  String get adminEnableRemoteAccess => 'Aktiver fjernadgang';

  @override
  String get ports => 'Havne';

  @override
  String get adminHttpPort => 'HTTP-port';

  @override
  String get adminHttpsPort => 'HTTPS-port';

  @override
  String get adminPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminBaseUrl => 'Basis URL';

  @override
  String get adminBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminLocalNetwork => 'Lokalt netværk';

  @override
  String get adminLocalNetworkAddresses => 'Lokale netværksadresser';

  @override
  String get adminKnownProxies => 'Kendte fuldmagter';

  @override
  String get adminRemoteIpFilter => 'Eksternt IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'Eksternt IP-filter';

  @override
  String get adminCertificatePath => 'Certifikatsti';

  @override
  String get whitelist => 'Hvidliste';

  @override
  String get blacklist => 'Sortliste';

  @override
  String get notSet => 'Ikke indstillet';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kunne ikke indlæse metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Opdater metadata';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Erstat alle metadata';

  @override
  String get adminMetadataRefreshRequested => 'Opdatering af metadata anmodet';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Kunne ikke opdatere metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Ingen fjernmatch fundet';

  @override
  String get adminRemoteResults => 'Fjernresultater';

  @override
  String get adminRemoteMetadataApplied => 'Fjernmetadata anvendt';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Fjernsøgning mislykkedes: $error';
  }

  @override
  String get adminUpdateContentType => 'Opdater indholdstype';

  @override
  String get adminContentType => 'Indholdstype';

  @override
  String get adminContentTypeUpdated => 'Indholdstype opdateret';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Kunne ikke opdatere indholdstypen: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Kunne ikke indlæse metadata-editor';

  @override
  String get adminNoPeopleEntries => 'Ingen personer indtastninger';

  @override
  String get adminNoExternalIds => 'Ingen eksterne id\'er tilgængelige';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType billede opdateret';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kunne ikke downloade billede: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Ikke-understøttet billedformat';

  @override
  String get adminImageReadFailed => 'Kunne ikke læse det valgte billede';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType billede uploadet';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kunne ikke uploade billede: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Slet $imageType billede';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType billede slettet';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kunne ikke slette billede: $error';
  }

  @override
  String get adminAllProviders => 'Alle udbydere';

  @override
  String get adminNoRemoteImages => 'Ingen fjernbilleder fundet';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tunergenkendelse mislykkedes: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fil eller URL';

  @override
  String get adminTunerIpAddress => 'Tunerens IP-adresse';

  @override
  String get adminTunerFriendlyName => 'Visningsnavn';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Grænse for samtidige forbindelser';

  @override
  String get adminTunerCountHelp =>
      'Det maksimale antal streams, tuneren tillader samtidigt. Sæt til 0 for ubegrænset.';

  @override
  String get adminTunerFallbackBitrate =>
      'Maksimal streamingbitrate som reserve';

  @override
  String get adminTunerImportFavoritesOnly => 'Importér kun favoritkanaler';

  @override
  String get adminTunerAllowHwTranscoding => 'Tillad hardwaretranskodning';

  @override
  String get adminTunerAllowFmp4 => 'Tillad fMP4 som transkodningscontainer';

  @override
  String get adminTunerAllowStreamSharing => 'Tillad deling af streams';

  @override
  String get adminTunerEnableStreamLooping => 'Aktivér looping af streams';

  @override
  String get adminTunerIgnoreDts => 'Ignorér DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Læs input med den oprindelige billedhastighed';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fil eller URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmpræfiks';

  @override
  String get adminXmltvMovieCategories => 'Filmkategorier';

  @override
  String get adminXmltvCategoriesHelp =>
      'Adskil flere kategorier med en lodret streg.';

  @override
  String get adminXmltvKidsCategories => 'Børnekategorier';

  @override
  String get adminXmltvNewsCategories => 'Nyhedskategorier';

  @override
  String get adminXmltvSportsCategories => 'Sportskategorier';

  @override
  String get adminSdUsername => 'Brugernavn';

  @override
  String get adminSdPassword => 'Adgangskode';

  @override
  String get adminSdCountry => 'Land';

  @override
  String get adminSdCountrySelect => 'Vælg et land';

  @override
  String get adminSdPostalCode => 'Postnummer';

  @override
  String get adminEnableAllTuners => 'Aktivér alle tunere';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kunne ikke fjerne tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kunne ikke fjerne udbyder: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serieoptagelsessti';

  @override
  String get adminMovieRecordingPath => 'Sti til filmoptagelser';

  @override
  String get adminGuideDaysAuto => 'Automatisk';

  @override
  String get adminRecordingPostProcessor => 'Sti til efterbehandlingsprogram';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumenter til efterbehandling';

  @override
  String get adminSaveRecordingNfo => 'Gem NFO-metadata for optagelser';

  @override
  String get adminSaveRecordingImages => 'Gem billeder for optagelser';

  @override
  String get adminLiveTvSectionPaths => 'Stier til optagelser';

  @override
  String get adminLiveTvSectionPostProcessing => 'Efterbehandling';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kunne ikke gemme indstillinger: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Direkte tv-administration kunne ikke indlæses';

  @override
  String get adminTunerDevices => 'Tuner enheder';

  @override
  String get adminNoTunerHosts => 'Ingen tuner-værter konfigureret';

  @override
  String get adminGuideProviders => 'Guide udbydere';

  @override
  String get adminGuideRefreshStarted => 'Opdatering af programdata er startet';

  @override
  String get adminGuideRefreshUnavailable =>
      'Opgaven til opdatering af programoversigten er ikke tilgængelig på denne server.';

  @override
  String get adminNoListingProviders => 'Ingen listeudbydere konfigureret';

  @override
  String get adminSettingsSaved => 'Indstillinger gemt';

  @override
  String get adminBackupsNotAvailable =>
      'Sikkerhedskopier er ikke tilgængelige på denne server build.';

  @override
  String get adminRestoreWarning1 =>
      'Gendannelse erstatter ALLE nuværende serverdata med backupdataene.';

  @override
  String get adminRestoreWarning2 =>
      'Aktuelle serverindstillinger, brugere og biblioteksdata vil blive overskrevet.';

  @override
  String get adminRestoreWarning3 => 'Serveren genstarter efter gendannelse.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Gendan backup $name nu?';
  }

  @override
  String get adminBackupsTitle => 'Sikkerhedskopier';

  @override
  String get adminUnknownDate => 'Ukendt dato';

  @override
  String get adminUnnamedBackup => 'Unavngivet backup';

  @override
  String get adminApply => 'Anvend';

  @override
  String get adminLogsTitle => 'Serverlogs';

  @override
  String get adminLogsNewestFirst => 'Nyeste først';

  @override
  String get adminLogsOldestFirst => 'Ældste først';

  @override
  String get adminLogsJustNow => 'Lige nu';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m siden';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h siden';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d siden';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Kunne ikke indlæse $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matcher';
  }

  @override
  String get adminLogViewerNoMatches => 'Ingen matchende linjer';

  @override
  String get adminMetadataEditorTitle => 'Metadataeditor';

  @override
  String get adminMetadataIdentify => 'Identificér';

  @override
  String get adminMetadataType => 'Type';

  @override
  String get adminMetadataDetails => 'Detaljer';

  @override
  String get adminMetadataExternalIds => 'Eksterne ID\'er';

  @override
  String get adminMetadataImages => 'Billeder';

  @override
  String get adminMetadataFieldTitle => 'Titel';

  @override
  String get adminMetadataFieldSortTitle => 'Sorter titel';

  @override
  String get adminMetadataFieldOriginalTitle => 'Original titel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premieredato (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Slutdato (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Produktionsår';

  @override
  String get adminMetadataFieldOfficialRating => 'Officiel vurdering';

  @override
  String get adminMetadataFieldCommunityRating => 'Fællesskabets vurdering';

  @override
  String get adminMetadataFieldCriticRating => 'Kritiker vurdering';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Oversigt';

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
  String get adminMetadataGenres => 'Genrer';

  @override
  String get adminMetadataTags => 'Tags';

  @override
  String get adminMetadataStudios => 'Studier';

  @override
  String get adminMetadataPeople => 'Mennesker';

  @override
  String get adminMetadataAddGenre => 'Tilføj genre';

  @override
  String get adminMetadataAddTag => 'Tilføj tag';

  @override
  String get adminMetadataAddStudio => 'Tilføj studie';

  @override
  String get adminMetadataAddPerson => 'Tilføj person';

  @override
  String get adminMetadataEditPerson => 'Rediger person';

  @override
  String get adminMetadataRole => 'Rolle';

  @override
  String get adminMetadataImagePrimary => 'Primær';

  @override
  String get adminMetadataImageBackdrop => 'Bagtæppe';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Tommelfinger';

  @override
  String get adminMetadataProvider => 'Udbyder';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType billede opdateret';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType billede uploadet';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType billede slettet';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kunne ikke downloade billede: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Kunne ikke læse det valgte billede';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kunne ikke uploade billede: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Slet $imageType billede';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Dette fjerner det aktuelle billede fra elementet.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kunne ikke slette billede: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Vælg $imageType billede';
  }

  @override
  String get adminMetadataUpload => 'Upload';

  @override
  String get adminMetadataUpdate => 'Opdatering';

  @override
  String get adminMetadataRemoteImage => 'Fjernbillede';

  @override
  String get adminPluginsInstalled => 'Installeret';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktiv';

  @override
  String get adminPluginsRestart => 'Genstart';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults => 'Ingen plugins matcher din søgning';

  @override
  String get adminPluginsNoneInstalled => 'Ingen plugins installeret';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Opdatering tilgængelig: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Opdatering tilgængelig';

  @override
  String get adminPluginsPendingRemoval => 'Afventer fjernelse efter genstart';

  @override
  String get adminPluginsChangesPending => 'Ændringer afventer genstart';

  @override
  String get adminPluginsEnable => 'Aktiver';

  @override
  String get adminPluginsDisable => 'Deaktiver';

  @override
  String get adminPluginsInstallUpdate => 'Installer opdatering';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Installer opdatering (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ingen pakker matcher din søgning';

  @override
  String get adminPluginsCatalogEmpty => 'Ingen tilgængelige pakker';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" er ved at blive installeret...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentel integration';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integration af plugin-indstillinger er stadig eksperimentel. Nogle felter eller layout gengives muligvis ikke korrekt endnu.';

  @override
  String get adminPluginDetailToggle404 =>
      'Kunne ikke skifte plugin. Serveren kunne ikke finde denne plugin-version. Prøv at opdatere plugins, og prøv derefter igen.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Kunne ikke skifte plugin. Tjek venligst serverlogfiler for detaljer.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Indstillinger';
  }

  @override
  String get adminPluginDetailDetails => 'Detaljer';

  @override
  String get adminPluginDetailDeveloper => 'Udvikler';

  @override
  String get adminPluginDetailRepository => 'Depot';

  @override
  String get adminPluginDetailBundled => 'Bundet';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktiver plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'En servergenstart er påkrævet for at ændringer kan træde i kraft.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Dette plugin vil blive fjernet efter genstart af serveren.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Dette plugin har defekt og fungerer muligvis ikke korrekt.';

  @override
  String get adminPluginDetailNotSupported =>
      'Dette plugin understøttes ikke af den aktuelle serverversion.';

  @override
  String get adminPluginDetailSuperseded =>
      'Dette plugin er blevet afløst af en nyere version.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Kunne ikke indlæse lagre: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Fjern repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Er du sikker på, at du vil fjerne \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Fjern';

  @override
  String adminReposSaveFailed(String error) {
    return 'Kunne ikke gemme lagre: $error';
  }

  @override
  String get adminReposEmpty => 'Ingen lagre konfigureret';

  @override
  String get adminReposEmptySubtitle =>
      'Tilføj et lager for at gennemse tilgængelige plugins';

  @override
  String get adminReposUnnamed => '(unavngivet)';

  @override
  String get adminReposEditTitle => 'Rediger lager';

  @override
  String get adminReposAddTitle => 'Tilføj lager';

  @override
  String get adminReposUrl => 'Depot-URL';

  @override
  String get adminReposNameHint => 'f.eks. Jellyfin Stald';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ugyldig URL';

  @override
  String get adminGeneralSettingsTitle => 'Generelle indstillinger';

  @override
  String get adminGeneralMetadataLanguage => 'Foretrukken metadatasprog';

  @override
  String get adminGeneralMetadataLanguageHint => 'f.eks. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Foretrukket metadataland';

  @override
  String get adminGeneralMetadataCountryHint => 'f.eks. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Biblioteksscanning samtidighed';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Grænse for kodning af parallelle billeder';

  @override
  String get adminUnknownError => 'Ukendt fejl';

  @override
  String get adminBrowse => 'Gennemse';

  @override
  String get adminCloseBrowser => 'Luk browseren';

  @override
  String get adminNetworkingTitle => 'Netværk';

  @override
  String get adminNetworkingRestartWarning =>
      'Ændringer af netværksindstillinger kan kræve en genstart af serveren.';

  @override
  String get adminNetworkingEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminNetworkingAddressHint => 'f.eks. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Kendte fuldmagter';

  @override
  String get adminNetworkingProxyHint => 'f.eks. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Hvidliste';

  @override
  String get adminNetworkingBlacklist => 'Sortliste';

  @override
  String get adminNetworkingAddEntry => 'Tilføj post';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer => 'Login ansvarsfraskrivelse';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML vist under login-formularen';

  @override
  String get adminBrandingCustomCss => 'Brugerdefineret CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Brugerdefineret CSS anvendt på webgrænsefladen';

  @override
  String get adminBrandingEnableSplash => 'Aktiver splash screen';

  @override
  String get adminBrandingSplashUpload => 'Upload billede';

  @override
  String get adminBrandingSplashUploaded => 'Velkomstskærmen er opdateret';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Velkomstskærmen kunne ikke uploades';

  @override
  String get adminBrandingSplashDeleted => 'Velkomstskærmen er fjernet';

  @override
  String get adminBrandingNoSplash => 'Ingen tilpasset velkomstskærm';

  @override
  String get adminPlaybackHwAccel => 'Hardwareacceleration';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwareacceleration';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktiver hardwarekodning';

  @override
  String get adminPlaybackQsvDevice => 'QSV-enhed';

  @override
  String get adminPlaybackEnhancedNvdec => 'Aktivér forbedret NVDEC-dekoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Foretræk systemets oprindelige hardwaredekoder';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC-dekodning';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9-dekodning';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bit-dekodning';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit-dekodning';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardwarekodning';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Tillad HEVC-kodning';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Tillad AV1-kodning';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Aktivér Intels strømbesparende H.264-encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Aktivér Intels strømbesparende HEVC-encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Aktivér tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Aktivér VPP-tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Aktivér VideoToolbox-tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritme til tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Tilstand for tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Område for tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Afmætning ved tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Spidsværdi for tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter for tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Lysstyrke for VPP-tone mapping';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast for VPP-tone mapping';

  @override
  String get adminPlaybackEncoderPreset => 'Forudindstilling for encoder';

  @override
  String get adminPlaybackH264Crf => 'CRF for H.264-kodning';

  @override
  String get adminPlaybackH265Crf => 'CRF for H.265-kodning (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlacing-metode';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Fordobl billedhastigheden ved deinterlacing';

  @override
  String get adminPlaybackAudioSection => 'Lyd';

  @override
  String get adminPlaybackEnableAudioVbr => 'Aktivér VBR-kodning af lyd';

  @override
  String get adminPlaybackDownmixBoost => 'Forstærkning ved downmix af lyd';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritme til stereo-downmix';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Maksimal størrelse på muxing-kø';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Kodning';

  @override
  String get adminPlaybackEncodingThreads => 'Kodning af tråde';

  @override
  String get adminPlaybackFallbackFont => 'Aktiver reserveskrifttype';

  @override
  String get adminPlaybackFallbackFontPath => 'Alternativ skrifttypesti';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Lydbøger';

  @override
  String get adminStreamingBitrateLimit =>
      'Ekstern klientbithastighedsgrænse (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lad være tom eller 0 for ubegrænset';

  @override
  String get adminTrickplayHwAccel => 'Aktiver hardwareacceleration';

  @override
  String get adminTrickplayHwEncoding => 'Aktiver hardwarekodning';

  @override
  String get adminTrickplayKeyFrameOnly => 'Aktiver kun udtræk af nøgleramme';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Hurtigere men lavere nøjagtighed';

  @override
  String get adminTrickplayNonBlocking => 'Ikke-blokerende';

  @override
  String get adminTrickplayBlocking => 'Blokering';

  @override
  String get adminTrickplayPriorityHigh => 'Høj';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Over Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Under Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Ledig';

  @override
  String get adminTrickplayImageSettings => 'Billedindstillinger';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Hvor ofte skal man fange billeder';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kommaseparerede pixelbredder (f.eks. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitet';

  @override
  String get adminTrickplayQScale => 'Kvalitets skala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Lavere værdier = bedre kvalitet, større filer';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvalitet';

  @override
  String get adminTrickplayProcessing => 'Forarbejdning';

  @override
  String get adminTasksEmpty => 'Ingen planlagte opgaver fundet';

  @override
  String get adminTasksNoFilterMatch =>
      'Ingen opgaver matcher det aktuelle filter';

  @override
  String get adminTaskCancelling => 'Annullerer...';

  @override
  String get adminTaskRunning => 'Kører...';

  @override
  String get adminTaskNeverRun => 'Løb aldrig';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminRunningTasks => 'Kørende opgaver';

  @override
  String get adminTaskRun => 'Løbe';

  @override
  String get adminTaskDetailLastExecution => 'Sidste henrettelse';

  @override
  String get adminTaskDetailStarted => 'Startede';

  @override
  String get adminTaskDetailEnded => 'Afsluttet';

  @override
  String get adminTaskDetailDuration => 'Varighed';

  @override
  String get adminTaskDetailErrorLabel => 'Fejl:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Dagligt på $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Hver $day på $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Ved opstart af applikation';

  @override
  String get adminTaskTriggerTypeDaily => 'Daglig';

  @override
  String get adminTaskTriggerTypeWeekly => 'Ugentlig';

  @override
  String get adminTaskTriggerTypeInterval => 'På et interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Hver time';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timer',
      one: '1 time',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tid';

  @override
  String get adminActivityJustNow => 'Lige nu';

  @override
  String get adminActivityLastHour => 'Sidste time';

  @override
  String get adminActivityToday => 'I dag';

  @override
  String get adminActivityYesterday => 'I går';

  @override
  String get adminActivityOlder => 'Ældre';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d siden';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h siden';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m siden';
  }

  @override
  String get adminActivityNow => 'nu';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '${minutes}m';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '${hours}t';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '${days}d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurer generering af trickplay-billeder til miniaturebilleder for søgeeksempler.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Basis URL';

  @override
  String get adminNetworkingBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Offentlig HTTP-port';

  @override
  String get adminNetworkingRequireHttps => 'Kræv HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Omdiriger alle fjernforespørgsler til HTTPS. Har ingen effekt, hvis serveren ikke har et gyldigt certifikat.';

  @override
  String get adminNetworkingCertPassword => 'Adgangskode til certifikat';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktivér IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktivér IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-netværk';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Eksternt IP-filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API enhed';

  @override
  String get adminPlaybackAutomatic => '0 = automatisk';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkodning af temp sti';

  @override
  String get adminPlaybackSegmentDeletion => 'Tillad sletning af segmenter';

  @override
  String get adminPlaybackSegmentKeep => 'Segmenthold (sekunder)';

  @override
  String get adminPlaybackThrottleBuffering => 'Gasspjældbuffring';

  @override
  String get adminPlaybackThrottleDelay =>
      'Forsinkelse for throttling (sekunder)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Tillad udtrækning af undertekster undervejs';

  @override
  String get adminResumeMinPct => 'Minimum cv-procent';

  @override
  String get adminResumeMinPctSubtitle =>
      'Indhold skal afspilles over denne procentdel for at gemme fremskridt';

  @override
  String get adminResumeMaxPct => 'Maksimal genoptagelsesprocent';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Indhold betragtes som fuldt afspillet efter denne procentdel';

  @override
  String get adminResumeMinDuration =>
      'Minimum genoptagelsesvarighed (sekunder)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Elementer, der er kortere end dette, kan ikke genoptages';

  @override
  String get adminTrickplayScanBehavior => 'Scan adfærd';

  @override
  String get adminTrickplayProcessPriority => 'Procesprioritet';

  @override
  String get adminTrickplayTileWidth => 'Flisebredde';

  @override
  String get adminTrickplayTileHeight => 'Flisehøjde';

  @override
  String get adminTrickplayProcessThreads => 'Bearbejd tråde';

  @override
  String get adminTrickplayWidthResolutions => 'Bredde opløsninger';

  @override
  String get adminMetadataDefault => 'Misligholdelse';

  @override
  String get adminMetadataContentTypeUpdated => 'Indholdstype opdateret';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Kunne ikke opdatere indholdstypen: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Tærskel for langsom respons (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Aktivér advarsler om langsomme svar';

  @override
  String get adminGeneralQuickConnect => 'Aktivér Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Stier';

  @override
  String get adminGeneralSectionPerformance => 'Ydeevne';

  @override
  String get adminGeneralCachePath => 'Cache-sti';

  @override
  String get adminGeneralMetadataPath => 'Metadatasti';

  @override
  String get adminGeneralServerName => 'Servernavn';

  @override
  String get adminGeneralDisplayLanguage => 'Foretrukket visningssprog';

  @override
  String get adminSettingsLoadFailed => 'Indstillingerne kunne ikke indlæses';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Kunne ikke opdatere tilknytninger: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tidsgrænse: $duration';
  }

  @override
  String get folders => 'Mapper';

  @override
  String get libraries => 'Biblioteker';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay deaktiveret';

  @override
  String get syncPlayDisabledMessage =>
      'Aktiver SyncPlay i Indstillinger for at bruge synkroniseret afspilning.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveren understøttes ikke';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay kræver en Jellyfin-server. Den aktuelle server understøtter det ikke.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay gruppe';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay gruppe';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# deltagere',
      one: '# deltager',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignorer vent';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Hold ikke gruppen oppe, mens denne enhed buffer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Fortsæt lokalt uden at vente på langsomme medlemmer';

  @override
  String get syncPlayRepeat => 'Gentage';

  @override
  String get syncPlayRepeatOne => 'En';

  @override
  String get syncPlayShuffleModeShuffled => 'Blandet';

  @override
  String get syncPlayShuffleModeSorted => 'Sorteret';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synkroniser den aktuelle afspilningskø';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Udskift gruppekøen med det, der spiller lokalt';

  @override
  String get syncPlayLeaveGroup => 'Forlad gruppen';

  @override
  String get syncPlayGroupQueue => 'Gruppekø';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Vare $index';
  }

  @override
  String get syncPlayPlayNow => 'Spil nu';

  @override
  String get syncPlayCreateNewGroup => 'Opret en ny gruppe';

  @override
  String get syncPlayGroupName => 'Gruppenavn';

  @override
  String get syncPlayDefaultGroupName => 'Min SyncPlay-gruppe';

  @override
  String get syncPlayCreateGroup => 'Opret gruppe';

  @override
  String get syncPlayAvailableGroups => 'Tilgængelige grupper';

  @override
  String get syncPlayNoGroupsAvailable => 'Ingen tilgængelige grupper';

  @override
  String get syncPlayJoinGroupQuestion => 'Vil du deltage i SyncPlay-gruppen?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Tilmelding til en SyncPlay-gruppe kan erstatte din nuværende afspilningskø. Fortsætte?';

  @override
  String get syncPlayJoin => 'Deltag';

  @override
  String get syncPlayStateIdle => 'Ledig';

  @override
  String get syncPlayStateWaiting => 'Venter';

  @override
  String get syncPlayStatePaused => 'Pause';

  @override
  String get syncPlayStatePlaying => 'Spiller';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName sluttede sig til SyncPlay-gruppen';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName venstre SyncPlay gruppen';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-adgang nægtet';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Du har ikke adgang til et eller flere elementer i denne SyncPlay-gruppe. Bed gruppeejeren om at bekræfte bibliotekstilladelser eller vælge en anden kø.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synkroniserer afspilning til $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Stemmesøgning er ikke tilgængelig.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play mislykkedes';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direkte afspilning kunne ikke starte for denne Dolby Vision-stream. Prøv igen at bruge servertranscode?';

  @override
  String get retryWithTranscode => 'Prøv igen med omkodning';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision understøttes ikke';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Denne enhed kan ikke afkode Dolby Vision-indhold direkte. Brug HDR10 fallback eller anmod om serveromkodning.';

  @override
  String get rememberMyChoice => 'Husk mit valg';

  @override
  String get playHdr10Fallback => 'Afspil HDR10 fallback';

  @override
  String get requestTranscode => 'Anmod om omkodning';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rækker fundet',
      one: '# række fundet',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Se alle';

  @override
  String get noItems => 'Ingen varer';

  @override
  String get switchUser => 'Skift bruger';

  @override
  String get remoteControl => 'Fjernbetjening';

  @override
  String get mediaBarLoading => 'Indlæser mediebjælke...';

  @override
  String get mediaBarError => 'Mediebjælken kunne ikke indlæses';

  @override
  String get offlineServerUnavailable =>
      'Forbundet til internettet, men den aktuelle server er ikke tilgængelig.';

  @override
  String get offlineNoInternet =>
      'Du er offline. Kun downloadet indhold er tilgængeligt.';

  @override
  String get offlineFileNotAvailable => 'Filen er ikke tilgængelig';

  @override
  String get offlineSwitchServer => 'Skift server';

  @override
  String get offlineSavedMedia => 'Gemte medier';

  @override
  String get offlineBannerTitle => 'Du er offline';

  @override
  String get offlineBannerSubtitle => 'Viser dine downloads';

  @override
  String get serverUnreachableBannerTitle =>
      'Kan ikke få forbindelse til din server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Afspiller fra downloads, indtil den er tilbage';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fjernafspilning';

  @override
  String castControlFailed(String error) {
    return 'Cast-kontrol mislykkedes: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Betjeningselementer';
  }

  @override
  String get castDeviceVolume => 'Enhedsvolumen';

  @override
  String get castVolumeUnavailable => 'Ikke tilgængelig';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Lyd';

  @override
  String get subtitlesLabel => 'Undertekster';

  @override
  String get pinConfirmTitle => 'Bekræft PIN-kode';

  @override
  String get pinSetTitle => 'Indstil pinkode';

  @override
  String get pinEnterTitle => 'Indtast PIN-kode';

  @override
  String get pinReenterToConfirm => 'Indtast din PIN-kode igen for at bekræfte';

  @override
  String pinEnterNDigit(int length) {
    return 'Indtast en $length-cifret pinkode';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Indtast din $length-cifrede pinkode';
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
  String get pinIncorrect => 'Forkert pinkode';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-koder stemmer ikke overens';

  @override
  String get pinForgot => 'Har du glemt PIN-koden?';

  @override
  String get pinClear => 'Ryd';

  @override
  String get pinBackspace => 'Tilbagetast';

  @override
  String get quickConnectAuthorized => 'Quick Connect-anmodning godkendt.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-koden er ugyldig eller udløbet.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect understøttes ikke på denne server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kunne ikke godkende Quick Connect-koden.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect er deaktiveret på denne server.';

  @override
  String get quickConnectForbidden =>
      'Din konto kan ikke godkende denne Quick Connect-anmodning.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-koden blev ikke fundet. Prøv en ny kode.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect mislykkedes: $message';
  }

  @override
  String get quickConnectEnterCode => 'Indtast kode';

  @override
  String get quickConnectAuthorize => 'Bemyndige';

  @override
  String remoteCommandFailed(String error) {
    return 'Kommando mislykkedes: $error';
  }

  @override
  String get remoteControlTitle => 'Fjernbetjening';

  @override
  String get remoteFailedToLoadSessions => 'Kunne ikke indlæse sessioner';

  @override
  String get remoteNoSessions => 'Ingen kontrollerbare sessioner';

  @override
  String get remoteStartPlayback => 'Start afspilning på en anden enhed';

  @override
  String get unknownUser => 'Ukendt';

  @override
  String get unknownItem => 'Ukendt';

  @override
  String get remoteNothingPlaying => 'Der spilles ikke noget i denne session';

  @override
  String get castingStarted => 'Casting startede på valgt enhed';

  @override
  String castingFailed(String error) {
    return 'Kunne ikke starte casting: $error';
  }

  @override
  String get noRemoteDevices => 'Ingen tilgængelige fjernafspilningsenheder.';

  @override
  String get noRemoteDevicesIos =>
      'Ingen tilgængelige fjernafspilningsenheder.\n\nPå iOS kan AirPlay-mål være utilgængelige i simulatoren.';

  @override
  String get trackActionPlayNext => 'Spil Næste';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Tilføj til kø';

  @override
  String get trackActionAddToPlaylist => 'Tilføj til afspilningsliste';

  @override
  String get trackActionCancelDownload => 'Annuller download';

  @override
  String get trackActionDeleteFromPlaylist => 'Slet fra afspilningsliste';

  @override
  String get trackActionMoveUp => 'Flyt op';

  @override
  String get trackActionMoveDown => 'Flyt ned';

  @override
  String get trackActionRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get trackActionAddToFavorites => 'Føj til favoritter';

  @override
  String get trackActionGoToAlbum => 'Gå til Album';

  @override
  String get trackActionGoToArtist => 'Gå til kunstner';

  @override
  String trackActionDownloading(String name) {
    return 'Downloader $name...';
  }

  @override
  String get trackActionDeletedFile => 'Slettet downloadet fil';

  @override
  String get trackActionDeleteFileFailed =>
      'Den downloadede fil kunne ikke slettes';

  @override
  String get shuffleBy => 'Bland ved';

  @override
  String get shuffleSelectLibrary => 'Vælg Bibliotek';

  @override
  String get shuffleSelectGenre => 'Vælg Genre';

  @override
  String get shuffleLibrary => 'Bibliotek';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Ingen kompatible biblioteker tilgængelige.';

  @override
  String get shuffleNoGenres =>
      'Der blev ikke fundet nogen genrer for denne blandetilstand.';

  @override
  String get posterDisplayTitle => 'Vise';

  @override
  String get posterImageType => 'Billedtype';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Miniaturebillede';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Kunne ikke føje til afspilningslisten';

  @override
  String get playlistCreateFailed => 'Kunne ikke oprette afspilningsliste';

  @override
  String get playlistNew => 'Ny afspilningsliste';

  @override
  String get playlistCreate => 'Skabe';

  @override
  String get playlistCreateNew => 'Opret ny afspilningsliste';

  @override
  String get playlistNoneFound => 'Ingen afspilningslister fundet';

  @override
  String get addToPlaylist => 'Tilføj til afspilningsliste';

  @override
  String get lyricsNotAvailable => 'Ingen tilgængelige sangtekster';

  @override
  String get upNext => 'Næste';

  @override
  String get playNext => 'Spil Næste';

  @override
  String get stillWatchingContent =>
      'Afspilningen er blevet sat på pause. Ser du stadig?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Fortsætte';

  @override
  String skipSegment(String segment) {
    return 'Spring over $segment';
  }

  @override
  String get liveTv => 'Live tv';

  @override
  String get continueWatchingAndNextUp => 'Fortsæt med at se og næste gang';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloader $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloader $fileName';
  }

  @override
  String get nextEpisode => 'Næste afsnit';

  @override
  String get moreFromThisSeason => 'Mere fra denne sæson';

  @override
  String get playerTooltipPlaybackSpeed => 'Afspilningshastighed';

  @override
  String get playerTooltipCastControls => 'Cast-kontroller';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Indtast fuldskærm';

  @override
  String get playerTooltipExitFullscreen => 'Afslut fuldskærm';

  @override
  String get playerTooltipFloatOnTop => 'Flyde ovenpå';

  @override
  String get playerTooltipExitFloatOnTop => 'Deaktiver flyder ovenpå';

  @override
  String get playerTooltipLockLandscape => 'Lås landskab';

  @override
  String get playerTooltipUnlockOrientation => 'Tillad rotation';

  @override
  String get playerTooltipPrevious => 'Forrige';

  @override
  String get playerTooltipSeekBack => 'Søg tilbage';

  @override
  String get playerTooltipSeekForward => 'Søg frem';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Marker som set';

  @override
  String get contextMenuMarkUnwatched => 'Markér som uovervåget';

  @override
  String get contextMenuAddToFavorites => 'Føj til favoritter';

  @override
  String get contextMenuRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get contextMenuGoToSeries => 'Gå til serie';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Skjul fra Fortsæt med at se';

  @override
  String get contextMenuHideFromNextUp => 'Skjul fra Næste op';

  @override
  String get contextMenuAddToCollection => 'Tilføj til samling';

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
      'Få adgang til serveradministrationspanelet';

  @override
  String get settingsDynamicContent => 'Dynamisk indhold';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Bar og visuelle overlejringer';

  @override
  String get settingsAboutSubtitle =>
      'Appversion, juridiske oplysninger og kreditter';

  @override
  String get settingsSortServersBy => 'Sorter servere efter';

  @override
  String get settingsLastUsed => 'Sidst brugt';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Tillad selvsignerede certifikater';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Stol på servere, der bruger selvsignerede TLS-certifikater eller certifikater fra en privat CA. Aktivér kun for servere, du selv kontrollerer. Dette deaktiverer certifikatvalidering for alle forbindelser.';

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
  String get settingsHomePage => 'Hjemmeside';

  @override
  String get settingsTwentyFourHourClock => '24-timers ur';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Brug 24-timers tidsformatering, uanset hvor uret vises';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Vis blandeknappen i navigationslinjen';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Vis genreknappen i navigationslinjen';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Vis knappen Favoritter i navigationslinjen';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Vis biblioteksknappen i navigationslinjen';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Vis Seerr-knappen i navigationslinjen';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Vis altid tekstetiketter i den øverste navigationslinje';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Skift startsidesynlighed pr. bibliotek. Genstart Moonfin for at ændringerne træder i kraft.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Mediebar og lokale forhåndsvisninger';

  @override
  String get settingsVisualOverlays => 'Visuelle overlejringer';

  @override
  String get settingsSeasonalSurprise => 'Sæsonbestemt overraskelse';

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
  String get settingsHigh => 'Høj';

  @override
  String get settingsLow => 'Lav';

  @override
  String get settingsCustomPath => 'Brugerdefineret sti';

  @override
  String get settingsEnterDownloadFolderPath => 'Indtast download-mappestien';

  @override
  String get settingsConcurrentDownloads => 'Samtidige downloads';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimalt antal elementer at downloade på én gang.';

  @override
  String get settingsAppInfo => 'APPOPLYSNINGER';

  @override
  String get settingsReportAnIssue => 'Rapporter et problem';

  @override
  String get settingsReportAnIssueSubtitle => 'Åbn problemsporingen på GitHub';

  @override
  String get settingsJoinDiscord => 'Tilmeld dig Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chat med fællesskabet';

  @override
  String get settingsJoinTheDiscord => 'Deltag i Discord';

  @override
  String get settingsSupportMoonfin => 'Støt Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Doner en kop kaffe til udvikleren';

  @override
  String get settingsLegal => 'JURIDISK';

  @override
  String get settingsLicenses => 'Licenser';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Open source-licensmeddelelser';

  @override
  String get settingsPrivacyPolicy => 'Privatlivspolitik';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Hvordan Moonfin håndterer dine data';

  @override
  String get settingsCheckForUpdates => 'Se efter opdateringer';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Se efter den seneste Moonfin-udgivelse';

  @override
  String get settingsBoth => 'Begge';

  @override
  String get settingsShuffleContentTypeFilter => 'Bland indholdstypefilter';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Muligheder for lydspor, behandling og passthrough';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisk afspilning og sekventering';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogik til gruppesessioner';

  @override
  String get settingsSkipIntrosAndOutros => 'Springe introer og outros over?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Nedtælling for mediesegment';

  @override
  String get settingsProgressBar => 'Statuslinje';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Ingen';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Spørg bruger';

  @override
  String get settingsSkip => 'Springe';

  @override
  String get settingsDoNothing => 'Gør ingenting';

  @override
  String get settingsMaxBitrateDescription =>
      'Begræns streaming-bithastigheden. Indhold over denne tærskel vil blive omkodet, så det passer.';

  @override
  String get settingsMaxResolutionDescription =>
      'Begræns den maksimale opløsning, som spilleren vil anmode om. Indhold i højere opløsning vil blive omkodet ned.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hvordan video skal skaleres, så den passer til skærmen.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Afspilningsmotor (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Vælg standardafspilningsmotoren på Android TV-enheder. Ændringer gælder for den næste afspilningssession.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (anbefales)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (forældet)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision-reserve';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Adfærd for Dolby Vision-titler på enheder uden Dolby Vision-afkodning.';

  @override
  String get settingsAskEachTime => 'Spørg hver gang';

  @override
  String get settingsPreferHdr10Fallback => 'Foretrækker HDR10 fallback';

  @override
  String get settingsPreferServerTranscode => 'Foretrækker servertranskodning';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Direkte afspilning';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Styrer, om Dolby Vision-profil 7-streams med forbedringslag skal dirigere afspilning.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFKTKRT aktiveret)';

  @override
  String get settingsEnabledOnThisDevice => 'Aktiveret på denne enhed';

  @override
  String get settingsDisabledPreferTranscode =>
      'Deaktiveret (foretrækker omkodning)';

  @override
  String get settingsResumeRewindDescription =>
      'Når du genoptager afspilningen (fra Fortsæt med at se eller en side med medieelementer), hvor mange sekunder skal der spoles tilbage?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Når du genoptager afspilningen efter at have trykket på pauseknappen, hvor mange sekunder skal der så spoles tilbage?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hvor mange sekunder der skal springes tilbage efter at have trykket på tilbagespolingsknappen.';

  @override
  String get settingsOneSecond => '1 sekund';

  @override
  String get settingsThreeSeconds => '3 sekunder';

  @override
  String get settingsFortyFiveSeconds => '45 sekunder';

  @override
  String get settingsSixtySeconds => '60 sekunder';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hvor mange sekunder der skal springes frem efter at have trykket på hurtig frem-knappen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 til ekstern dekoder';

  @override
  String get settingsCinemaMode => 'Biograftilstand';

  @override
  String get settingsCinemaModeSubtitle => 'Spil trailere før en hovedfunktion';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Udvidet viser et fuldt kort med episodeillustrationer og beskrivelse. Minimal viser en kompakt nedtællingsoverlejring. Deaktiveret skjuler prompten helt.';

  @override
  String get settingsShort => 'Kort';

  @override
  String get settingsLong => 'Lang';

  @override
  String get settingsVeryLong => 'Meget lang';

  @override
  String get settingsVideoStartDelay => 'Forsinket videostart';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Direkte direkte tv';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktiver direkte afspilning til live-tv';

  @override
  String get settingsOpenGroups => 'Åbne grupper';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Opret, deltag eller administrer SyncPlay-grupper';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay aktiveret';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Aktiver gruppevisningsfunktioner';

  @override
  String get settingsSyncplayButton => 'SyncPlay-knap';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Vis knappen SyncPlay på navigationslinjen';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Avanceret korrektion';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktiver finkornet synkroniseringslogik';

  @override
  String get settingsSyncplaySyncCorrection => 'Synkroniseringskorrektion';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Juster automatisk afspilning for at forblive synkroniseret';

  @override
  String get settingsSyncplaySpeedToSync => 'Hastighed til synkronisering';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Brug justering af afspilningshastighed til at synkronisere';

  @override
  String get settingsSyncplaySkipToSync => 'Spring til synkronisering';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Brug søge til at synkronisere';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimum hastighedsforsinkelse';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maksimal hastighedsforsinkelse';

  @override
  String get settingsSyncplaySpeedDuration => 'Hastighed Varighed';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimum Spring Delay';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ekstra Offset';

  @override
  String get onNow => 'På nu';

  @override
  String get collections => 'Samlinger';

  @override
  String get lastPlayed => 'Sidst spillet';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Seneste $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Nyligt udgivet i $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Autoplay næste afsnit';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Afspil automatisk næste afsnit, når det er tilgængeligt.';

  @override
  String get skipSilenceTitle => 'Spring stilheden over';

  @override
  String get skipSilenceSubtitle =>
      'Spring automatisk tavse lydsegmenter over, når det understøttes af streamen.';

  @override
  String get allowExternalAudioEffectsTitle => 'Tillad eksterne lydeffekter';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Tillad equalizer- og effektapps (f.eks. Wavelet) at knytte til Media3 afspilningssessioner.';

  @override
  String get disableTunnelingTitle => 'Deaktiver tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Tving ikke-tunneleret afspilning. Nyttig på enheder med tunnellyd/video-afbrydelser.';

  @override
  String get enableTunnelingTitle => 'Aktivér tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Avanceret. Sender lyd og video gennem en koblet hardwaresti. Slået fra som standard, fordi det giver udfald i lyd og video på nogle enheder.';

  @override
  String get mapDolbyVisionP7Title => 'Kort Dolby Vision profil 7 til HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Afspil Dolby Vision profil 7-streams som HDR10-kompatibel HEVC på ikke-DV-enheder.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Brug indlejrede undertekststile';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Anvend farver, skrifttyper og positionering indlejret i undertekstsporet. Deaktiver for at bruge dine præferencer for billedtekststil i stedet.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Brug indlejrede undertekstskriftstørrelser';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Anvend tip til skriftstørrelse, der er indlejret i undertekstsporet. Deaktiver for at bruge undertekststørrelsen fra dine stilpræferencer.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Vis mediedetaljer';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Vis detaljer om det valgte emne øverst på bibliotekssider.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Brug detaljerede underoverskrifter';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Vis detaljeret eller minimal underrække på bibliotekssider.';

  @override
  String get savedThemesDeleteDialogTitle => 'Vil du slette gemt tema?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Vil du fjerne \"$themeName\" fra denne enheds cache?';
  }

  @override
  String get themeStore => 'Temabutik';

  @override
  String get themeStoreSubtitle => 'Gennemse og gem temaer fra fællesskabet';

  @override
  String get themeStoreDescription =>
      'Gem et tema for at bruge det ligesom dine andre gemte temaer.';

  @override
  String get themeStoreEmpty => 'Der er ingen temaer tilgængelige lige nu.';

  @override
  String get themeStoreLoadFailed =>
      'Temabutikken kunne ikke indlæses. Tjek din forbindelse, og prøv igen.';

  @override
  String get themeStoreSave => 'Gem';

  @override
  String get themeStoreSaveAndApply => 'Gem og anvend';

  @override
  String get themeStoreSaved => 'Gemt';

  @override
  String get themeStoreInvalidMessage => 'Dette tema kunne ikke indlæses.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" er gemt.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Slettet \"$themeName\" fra denne enhed.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Kunne ikke slette \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Gemte temaer';

  @override
  String get savedThemesDescription =>
      'Disse er temaer, der er downloadet fra Moonfin plugin til den aktuelle server. Sletning fjerner kun denne lokale kopi.';

  @override
  String get savedThemesEmpty =>
      'Der blev ikke fundet nogen gemte temaer for denne server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Aktiv i øjeblikket';
  }

  @override
  String get savedThemesDeleteTooltip => 'Slet gemt tema';

  @override
  String get savedThemesManageSubtitle =>
      'Administrer downloadede plugin-temaer på denne enhed';

  @override
  String get themeEditor => 'Tema redaktør';

  @override
  String get themeEditorSubtitle => 'Åbn Moonfin Theme Editor i din browser';

  @override
  String get homeScreen => 'Startskærm';

  @override
  String get bottomBar => 'Nederste bjælke';

  @override
  String get homeRowsStyleClassic => 'Klassisk';

  @override
  String get homeRowsStyleModern => 'Moderne';

  @override
  String get homeRowsSection => 'Hjemmerækker';

  @override
  String get rowsType => 'Rækketype';

  @override
  String get rowsTypeDescription =>
      'Classic beholder billedtype og infooverlejring pr. række. Moderne bruger portræt-til-bagtæppe rækker.';

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
  String get displayFavoritesRows => 'Vis favoritrækker';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Vis favoritfilm, -serier og andre favoritrækker i hjemmesektioner.';

  @override
  String get favoritesRowSorting => 'Sortering af favoritrækker';

  @override
  String get favoritesRowSortingDescription =>
      'Sorter favoritrækker efter tilføjet dato, udgivelsesdato, alfabetisk og mere.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Vis samlingsrækker';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Vis samlingsrækker i startsektioner.';

  @override
  String get collectionsRowSorting => 'Sortering af samlinger';

  @override
  String get collectionsRowSortingDescription =>
      'Sorter samlingsrækker efter tilføjet dato, udgivelsesdato, alfabetisk og mere.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Vis genrerrækker';

  @override
  String get displayGenresRowsSubtitle => 'Vis genrerrækker i startsektioner.';

  @override
  String get genresRowSorting => 'Genrer Rækkesortering';

  @override
  String get genresRowSortingDescription =>
      'Sorter genrerrækker efter tilføjet dato, udgivelsesdato, alfabetisk og mere.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Genrer Rækkeelementer';

  @override
  String get genresRowItemsDescription =>
      'Vis film, serier eller begge i genrerækker.';

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
  String get displayPlaylistsRows => 'Vis afspilningslisterækker';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Vis afspilningslisterækker i startskærmens sektioner.';

  @override
  String get playlistsRowSorting => 'Sortering af afspilningslisterækker';

  @override
  String get playlistsRowSortingDescription =>
      'Sortér afspilningslisterækker efter tilføjelsesdato, udgivelsesdato, alfabetisk og mere.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Vis lydrækker';

  @override
  String get displayAudioRowsSubtitle =>
      'Vis lydrækker i startskærmens sektioner.';

  @override
  String get audioRowsSorting => 'Sortering af lydrækker';

  @override
  String get audioRowsSortingDescription =>
      'Sortér lydrækker efter tilføjelsesdato, udgivelsesdato, alfabetisk og mere.';

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
  String get audioPlaylists => 'Lydafspilningslister';

  @override
  String get appearance => 'Udseende';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tastatur';

  @override
  String get navButtons => 'Knapper';

  @override
  String get rendering => 'Gengivelse';

  @override
  String get mpvConfiguration => 'MPV-konfiguration';

  @override
  String get cardSize => 'Kortstørrelse';

  @override
  String get externalPlayerApp => 'Ekstern afspiller app';

  @override
  String get externalPlayerAppDescription =>
      'Vælg en ekstern afspiller for at aktivere afspilning ved langt tryk';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Vis appvælgeren, når afspilningen starter.';

  @override
  String get loadingInstalledPlayers => 'Indlæser installerede afspillere...';

  @override
  String get connection => 'Forbindelse';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Gennemløb';

  @override
  String get supportedOnThisDevice => 'Understøttet på denne enhed';

  @override
  String get notSupportedOnThisDevice => 'Ikke understøttet på denne enhed';

  @override
  String get mediaPlayerBehavior => 'Medieafspillerens opførsel';

  @override
  String get playbackEnhancements => 'Afspilningsforbedringer';

  @override
  String get alwaysOn => 'Altid tændt.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Erstat Skip Outro med Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Vis Next Up-overlejringen i stedet for knappen Spring Outro over.';

  @override
  String get playerRouting => 'Spillerruting';

  @override
  String get preferSoftwareDecoders => 'Foretrækker softwaredekodere';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Brug FFmpeg (lyd) og libgav1 (AV1) før hardwaredekodere. Deaktiver, hvis HDMI-lydgennemstrømningen bryder.';

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
  String get useExternalPlayer => 'Brug ekstern afspiller';

  @override
  String get useExternalPlayerSubtitle =>
      'Åbn videoafspilning i din valgte eksterne app på Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatisk kø';

  @override
  String get preferSdhSubtitles => 'Foretrækker SDH undertekster';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioriter SDH/CC-undertekstspor ved automatisk valg.';

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
  String get webDiagnostics => 'Webdiagnostik';

  @override
  String get webDiagnosticsTitle => 'Moonfin Webdiagnostik';

  @override
  String get webDiagnosticsIntro =>
      'Brug denne side til at diagnosticere problemer med browserforbindelse (CORS, blandet indhold og indstillinger for opdagelse).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detekteret blandet indholdsfejl';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detekteret CORS/Preflight-fejl';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin registrerede en HTTPS-side, der forsøgte at kalde en HTTP-server-URL. Browsere blokerer denne anmodning, før den når din server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin har registreret en anmodningsfejl på browserniveau, der almindeligvis er forårsaget af manglende CORS eller preflight-headers på medieserveren.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Mål-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detaljer: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Aktuel Runtime-kontekst';

  @override
  String get webDiagnosticsOrigin => 'Oprindelse';

  @override
  String get webDiagnosticsScheme => 'Ordning';

  @override
  String get webDiagnosticsPluginMode => 'Plugin-tilstand';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-scanning';

  @override
  String get webDiagnosticsForcedServerUrl => 'Tvunget server-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Standard server-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL til discovery-proxy';

  @override
  String get notConfigured => 'ikke konfigureret';

  @override
  String get webDiagnosticsMixedContent => 'Blandet indhold';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Denne side indlæses via HTTPS, men en eller flere konfigurerede URL\'er er HTTP. Browsere blokerer HTTPS-sider fra at kalde HTTP API\'er.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: server din medieserver eller proxy-slutpunkt via HTTPS, eller indlæs kun Moonfin over HTTP på betroede lokale netværk.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Ingen åbenlys konfiguration af blandet indhold fundet fra aktuelle runtime-indstillinger.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS tjekliste';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Tillad browserens oprindelse i Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inkluder autorisation, X-Emby-Authorization og X-Emby-Token i Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Eksponer Content-Range og Accept-Ranges for streaming og søgeadfærd.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Returner 204 til OPTIONS preflight-anmodninger.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Eksempel på overskriftsstykke (nginx-stil)';

  @override
  String get note => 'Bemærk';

  @override
  String get webDiagnosticsNonWebNote =>
      'Denne diagnosticeringsrute er beregnet til webbuilds. Hvis du ser dette på en anden platform, gælder disse kontroller muligvis ikke.';

  @override
  String get backToServerSelect => 'Tilbage til server Vælg';

  @override
  String get signOutAllUsers => 'Log ud af alle brugere';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofontilladelse afvises permanent. Aktiver det i systemindstillinger.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mikrofontilladelse er påkrævet for stemmesøgning.';

  @override
  String get voiceSearchNoMatch => 'Fangede det ikke. Prøv igen.';

  @override
  String get voiceSearchNoSpeechDetected => 'Ingen tale registreret.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofon fejl.';

  @override
  String get voiceSearchNeedsInternet => 'Stemmesøgning kræver internet.';

  @override
  String get voiceSearchServiceBusy => 'Taletjenesten er optaget. Prøv igen.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofontilladelse afvises permanent.';

  @override
  String get microphonePermissionDenied => 'Mikrofontilladelse er nægtet.';

  @override
  String get speechRecognitionUnavailable =>
      'Talegenkendelse er ikke tilgængelig på denne enhed.';

  @override
  String get openIosRoutePicker => 'Åbn iOS-rutevælgeren';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay rutevælger er ikke tilgængelig på denne enhed.';

  @override
  String get videos => 'Videoer';

  @override
  String get programs => 'Programmer';

  @override
  String get songs => 'Sange';

  @override
  String get photoAlbums => 'Fotoalbum';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Mennesker';

  @override
  String get recentlyReleasedEpisodes => 'Nyligt udgivne afsnit';

  @override
  String get watchAgain => 'Se igen';

  @override
  String get guestAppearances => 'Gæsteoptræden';

  @override
  String get appearancesSeerr => 'Optrædener (Seerr)';

  @override
  String get crewContributionsSeerr => 'Crewets bidrag (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Se med gruppen';

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
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Åbn i browser';

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
      'Integreret browser er ikke tilgængelig på denne platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Er du sikker på, at du vil genstarte serveren?';

  @override
  String get adminShutdownServerConfirmation =>
      'Er du sikker på, at du vil lukke serveren ned? Du skal genstarte den manuelt.';

  @override
  String get internal => 'Indre';

  @override
  String get idle => 'Ledig';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Ingen brugere fundet';

  @override
  String get adminNoUsersMatchSearch => 'Ingen brugere matcher din søgning';

  @override
  String get adminNoDevicesFound => 'Ingen enheder fundet';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ingen enheder matcher de aktuelle filtre';

  @override
  String get remoteAccess => 'Fjernadgang';

  @override
  String get localOnly => 'Kun lokalt';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Medieanalyse kunne ikke indlæses';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombineret analyse på tværs af alle mediebiblioteker.';

  @override
  String get analyticsTopArtists => 'Top kunstnere';

  @override
  String get analyticsTopAuthors => 'Topforfattere';

  @override
  String get analyticsTopContributors => 'Topbidragydere';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count biblioteker',
      one: '1 bibliotek',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ingen indekserede medietotaler er tilgængelige for dette valg endnu.';

  @override
  String get analyticsLibraryDetails => 'Bibliotek detaljer';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotekets opdeling';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Ingen biblioteker er tilgængelige.';

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
  String get adminServerAdministrationTitle => 'Server administration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Billedcache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logfiler';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Omkode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Ingen serverstier returneret af denne server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% brugt';
  }

  @override
  String get userActivity => 'Brugeraktivitet';

  @override
  String get systemEvents => 'Systemhændelser';

  @override
  String get needsAttention => 'Har brug for opmærksomhed';

  @override
  String get homeVideos => 'Hjemmevideoer';

  @override
  String get mixedContent => 'Blandet indhold';

  @override
  String get homeVideosAndPhotos => 'Hjemmevideoer og billeder';

  @override
  String get mixedMoviesAndShows => 'Blandede film og serier';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Ingen optagelser fundet';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Ingen billedsider fundet i .$extension-arkivet.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Integreret renderer mislykkedes ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-gengivelse mislykkedes ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Manglende lokal fil til læser: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status mens du åbner bogdata fra $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Intet læsbart bogslutpunkt tilgængeligt';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Ikke-understøttet tegneseriearkivformat: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR-ekstraktionsplugin er ikke tilgængeligt på denne platform.';

  @override
  String get failedToExtractCbrArchive => 'Kunne ikke udtrække .cbr-arkivet.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-ekstraktion er ikke tilgængelig på denne platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 ekstraktionsplugin er ikke tilgængelig på denne platform.';

  @override
  String get loadingShuffle => 'Indlæser shuffle...';

  @override
  String get libraryShuffleLabel => 'BLAND BIBLIOTEK';

  @override
  String get randomShuffleLabel => 'BLAND TILFÆLDIGT';

  @override
  String get genresShuffleLabel => 'BLAND GENRER';

  @override
  String get autoHdrSwitching => 'Automatisk HDR-skift';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktiver automatisk HDR for HDR-videoafspilning og gendan visningstilstand ved afslutning.';

  @override
  String get whenFullscreen => 'Når fuldskærm';

  @override
  String get changeArtwork => 'Skift grafik';

  @override
  String get missing => 'Mangler';

  @override
  String get clearAllArtworkButton => 'Ryd al grafik?';

  @override
  String get clearAllArtworkWarning =>
      'Er du sikker på, at du vil rydde al downloadet grafik?';

  @override
  String get confirmClear => 'Bekræft rydning';

  @override
  String confirmClearMessage(String itemType) {
    return 'Er du sikker på, at du vil rydde dette billede ($itemType)?';
  }

  @override
  String get uploadButton => 'Upload?';

  @override
  String get resolutionLabel => 'Opløsning: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Vis kun grafik på grænsefladens sprog';

  @override
  String get confirmClearAll => 'Bekræft rydning af alt';

  @override
  String get imageUploadSuccess => 'Billedet blev uploadet!';

  @override
  String imageUploadFailed(String error) {
    return 'Billedet kunne ikke uploades: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Billedet kunne ikke anvendes: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Billedet kunne ikke slettes: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Al grafik kunne ikke ryddes: $error';
  }

  @override
  String get yes => 'Ja';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Baggrundsbilleder';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniature';

  @override
  String get artCategory => 'Grafik';

  @override
  String get discArtCategory => 'Diskgrafik';

  @override
  String get screenshotCategory => 'Skærmbillede';

  @override
  String get boxCoverCategory => 'Coverforside';

  @override
  String get boxRearCoverCategory => 'Coverbagside';

  @override
  String get menuArtCategory => 'Menugrafik';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'baggrundsbillede';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniature';

  @override
  String get confirmItemArt => 'grafik';

  @override
  String get confirmItemDiscArt => 'diskgrafik';

  @override
  String get confirmItemScreenshot => 'skærmbillede';

  @override
  String get confirmItemBoxCover => 'coverforside';

  @override
  String get confirmItemBoxRearCover => 'coverbagside';

  @override
  String get confirmItemMenuArt => 'menugrafik';

  @override
  String get resolutionAll => 'Alle';

  @override
  String get resolutionHigh => 'Høj (1080p+)';

  @override
  String get resolutionMedium => 'Mellem (720p)';

  @override
  String get resolutionLow => 'Lav (<720p)';

  @override
  String get sources => 'Kilder';

  @override
  String get audiobookChapters => 'Kapitler';

  @override
  String get audiobookBookmarks => 'Bogmærker';

  @override
  String get audiobookNotes => 'Noter';

  @override
  String get audiobookQueue => 'Kø';

  @override
  String get audiobookTimeline => 'Tidslinje';

  @override
  String get audiobookTimelineEmpty => 'Tidslinjen er tom';

  @override
  String get audiobookFocusedTimeline => 'Fokuseret tidslinje';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Eksportér bogmærker';

  @override
  String get audiobookExportNotes => 'Eksportér noter';

  @override
  String get audiobookExportAll => 'Eksportér alt';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksporteret til $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksport mislykkedes: $error';
  }

  @override
  String get audiobookLyrics => 'Sangtekster';

  @override
  String get audiobookAddBookmark => 'Tilføj bogmærke';

  @override
  String get audiobookAddNote => 'Tilføj note';

  @override
  String get audiobookEditNote => 'Redigér note';

  @override
  String get audiobookNoteHint => 'Skriv en note til dette tidspunkt';

  @override
  String get audiobookSleepTimer => 'Sleep-timer';

  @override
  String get audiobookSleepOff => 'Fra';

  @override
  String get audiobookSleepEndOfChapter => 'Slut på kapitlet';

  @override
  String get audiobookSleepCustom => 'Tilpasset';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining tilbage';
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
  String get audiobookPlaybackSpeed => 'Afspilningshastighed';

  @override
  String get audiobookRemainingTime => 'Tilbage';

  @override
  String get audiobookElapsedTime => 'Forløbet';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Tilbage ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Frem ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Forrige kapitel';

  @override
  String get audiobookNextChapter => 'Næste kapitel';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapitel $current af $total';
  }

  @override
  String get audiobookNoChapters => 'Ingen kapitler';

  @override
  String get audiobookNoBookmarks => 'Ingen bogmærker endnu';

  @override
  String get audiobookNoNotes => 'Ingen noter endnu';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bogmærke tilføjet ved $position';
  }

  @override
  String get audiobookSpeedReset => 'Nulstil til 1,0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Gem';

  @override
  String get audiobookCancel => 'Annullér';

  @override
  String get audiobookDelete => 'Slet';

  @override
  String get subtitlePreferencesDescription =>
      'Skift underteksttilstande, standardsprog, udseende og gengivelsesindstillinger.';

  @override
  String get subtitleRendering => 'Gengivelse af undertekster';

  @override
  String get displayOptions => 'Visningsindstillinger';

  @override
  String get releaseDateAscending => 'Udgivelsesdato (stigende)';

  @override
  String get releaseDateDescending => 'Udgivelsesdato (faldende)';

  @override
  String get groupContributions => 'Gruppér bidrag';

  @override
  String get groupMultipleRoles => 'Gruppér flere roller';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Advarsel om skriveadgang til bibliotek';

  @override
  String get libraryWriteAccessHowToFix => 'Sådan løser du det:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Giv Jellyfin-tjenestens bruger (f.eks. jellyfin eller Docker PUID/PGID) skriverettigheder til dine mediebiblioteksmapper på serveren.\n\n2. Eller gå til dit Jellyfin-kontrolpanel -> Biblioteker, redigér dette bibliotek, og slå \'Gem grafik i mediemapperne\' fra for at gemme grafikken i Jellyfins interne database.';

  @override
  String get dismiss => 'Afvis';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Dit bibliotek \'$libraryName\' er indstillet til at gemme grafik direkte i mediemapperne (\'Gem grafik i mediemapperne\' er slået til). Jellyfin har dog testet skriveadgangen og har ikke tilladelse til at skrive filer til denne mappe:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Det ser ud til, at Jellyfin ikke kunne opdatere grafikken. Dit bibliotek er indstillet til at gemme grafik direkte i mediemapperne (\'Gem grafik i mediemapperne\' er slået til). Denne fejl opstår typisk, når Jellyfin-serverprocessen ikke har tilladelse til at skrive filer til dine mediemapper.';

  @override
  String get replay => 'Afspil igen';

  @override
  String get fileInformation => 'Filoplysninger';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Størrelse: $size  •  Format: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Vis alle ($count) lydspor';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Vis alle ($count) undertekstspor';
  }

  @override
  String get checkingDirectPlay => 'Kontrollerer Direct Play-understøttelse...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play-understøttelse: ';

  @override
  String get forced => 'Tvungen';

  @override
  String get transcodeContainerNotSupported =>
      'Containerformatet understøttes ikke af afspilleren.';

  @override
  String get transcodeVideoCodecNotSupported => 'Videocodec understøttes ikke.';

  @override
  String get transcodeAudioCodecNotSupported => 'Lydcodec understøttes ikke.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Undertekstformatet understøttes ikke (kræver indbrænding).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Lydprofilen understøttes ikke.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Videoprofilen understøttes ikke.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Videoniveauet understøttes ikke.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Videoopløsningen understøttes ikke af denne enhed.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Videoens bitdybde understøttes ikke.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Videoens billedhastighed understøttes ikke.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Filens bitrate overskrider afspillerens streaminggrænse.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Videoens bitrate overskrider streaminggrænsen.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Lydens bitrate overskrider streaminggrænsen.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Antallet af lydkanaler understøttes ikke.';

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
  String get sortAlphabetical => 'Alfabetisk';

  @override
  String get sortReleaseAscending => 'Udgivelsesrækkefølge (stigende)';

  @override
  String get sortReleaseDescending => 'Udgivelsesrækkefølge (faldende)';

  @override
  String get sortCustomDragDrop => 'Tilpasset (træk og slip)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions =>
      'Sorteringsindstillinger for afspilningsliste';

  @override
  String get resetSort => 'Nulstil sortering';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Se S$season:E$episode igen';
  }

  @override
  String get rewatchPlaylist => 'Se afspilningslisten igen';

  @override
  String get noSubtitlesFound => 'Der blev ikke fundet nogen undertekster.';

  @override
  String get adminControls => 'Administratorkontroller';

  @override
  String get impellerRendering => 'Gengivelsesmotor (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller er Flutters moderne GPU-renderer, der giver jævnere animationer og mindre hakken. På nogle TV-bokse og ældre GPU\'er kan den give grafikfejl eller sort video; slå den fra, hvis du oplever det. Automatisk vælger den bedste standardindstilling til din enhed. Genstart Moonfin for at anvende ændringen.';

  @override
  String get impellerAuto => 'Automatisk';

  @override
  String get impellerOn => 'Til';

  @override
  String get impellerOff => 'Fra';

  @override
  String get impellerRestartTitle => 'Genstart påkrævet';

  @override
  String get impellerRestartMessage =>
      'Moonfin skal genstartes for at skifte gengivelsesmotor. Luk appen nu, og åbn den igen for at anvende ændringen.';

  @override
  String get impellerCloseNow => 'Luk appen nu';

  @override
  String get adminRefreshLibrary => 'Opdatér bibliotek';

  @override
  String get adminRefreshAllLibraries => 'Opdatér alle biblioteker';

  @override
  String get adminRepoSortDateOldest => 'Tilføjelsesdato (ældste først)';

  @override
  String get adminRepoSortDateNewest => 'Tilføjelsesdato (nyeste først)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetisk (A til Å)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetisk (Å til A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Indlæser serveranalyse... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match kilden';

  @override
  String get imdbTop250Movies => 'IMDb Top 250-film';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250-serier';

  @override
  String get imdbMostPopularMovies => 'Mest populære film på IMDb';

  @override
  String get imdbMostPopularTvShows => 'Mest populære serier på IMDb';

  @override
  String get imdbLowestRatedMovies => 'Lavest bedømte film på IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Bedst bedømte engelsksprogede film på IMDb';

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
  String get integrations => 'Integrationer';

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
