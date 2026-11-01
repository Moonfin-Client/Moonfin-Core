// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

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
  String get interfaceLanguage => 'Interfacetaal';

  @override
  String get systemLanguageDefault => 'Systeemstandaard';

  @override
  String get signIn => 'Inloggen';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Leeg';

  @override
  String connectingToServer(String serverName) {
    return 'Verbinden met $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Wachtwoord';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Voer deze code in op het webdashboard van uw server:';

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
  String get waitingForAuthorization => 'Wachten op toestemming...';

  @override
  String get back => 'Terug';

  @override
  String get serverUnavailable => 'Server is niet beschikbaar';

  @override
  String get loginFailed => 'Inloggen mislukt';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect niet beschikbaar: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect niet beschikbaar ($status): $detail';
  }

  @override
  String get whosWatching => 'Wie kijkt er?';

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
  String get addUser => 'Gebruiker toevoegen';

  @override
  String get selectServer => 'Selecteer Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versie $version';
  }

  @override
  String get savedServers => 'Opgeslagen servers';

  @override
  String get discoveredServers => 'Ontdekte servers';

  @override
  String get noneFound => 'Geen gevonden';

  @override
  String get unableToConnectToServer =>
      'Kan geen verbinding maken met de server';

  @override
  String get addServer => 'Server toevoegen';

  @override
  String get embyConnect => 'Emby Verbinden';

  @override
  String get removeServer => 'Server verwijderen';

  @override
  String removeServerConfirmation(String serverName) {
    return '\"$serverName\" uit uw servers verwijderen?';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get remove => 'Verwijderen';

  @override
  String get connectToServer => 'Maak verbinding met de server';

  @override
  String get serverAddress => 'Serveradres';

  @override
  String get serverAddressHint => 'https://uw-server.voorbeeld.com';

  @override
  String get connect => 'Verbinden';

  @override
  String get secureStorageUnavailable => 'Veilige opslag niet beschikbaar';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin heeft geen toegang tot uw systeemsleutel. Inloggen kan doorgaan, maar veilige tokenopslag is mogelijk niet beschikbaar totdat de sleutel wordt ontgrendeld.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-thema';

  @override
  String get detailScreenStyle => 'Stijl van detailscherm';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassiek is de oorspronkelijke gecentreerde Moonfin-lay-out. Modern is een responsieve, filmische lay-out.';

  @override
  String get detailScreenStyleMoonfin => 'Klassiek';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get expandedTabs => 'Uitgeklapte tabbladen';

  @override
  String get expandedTabsSubtitle =>
      'Toon tabbladinhoud automatisch tijdens het bladeren. Zet dit uit om elk tabblad handmatig te openen en te sluiten.';

  @override
  String get showTechnicalDetails => 'Technische details tonen?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Toon codec-, resolutie- en streaminformatie in de bannersamenvatting';

  @override
  String get recommendationSystem => 'Aanbevelingssysteem';

  @override
  String get recommendationSystemSubtitle =>
      'Gebruik het lokale bibliotheekalgoritme van Moonfin Recommends of de online gelijkeniswaarden van TMDb. Let op: online aanbevelingen vereisen Seerr-integratie.';

  @override
  String get recommendationSystemMoonfin => 'Aanbeveling Moonfin';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-gelijkenis';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Leeftijdsclassificatielimiet toepassen?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Beperk suggesties van Moonfin Recommends op basis van de leeftijdsclassificatie van de betreffende media';

  @override
  String get interfaceStyle => 'Interfacestijl';

  @override
  String get interfaceStyleSubtitle =>
      'Automatisch past zich aan uw apparaat aan. Kies Apple of Material om een vaste look af te dwingen.';

  @override
  String get interfaceStyleAutomatic => 'Automatisch';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Interfacelay-out';

  @override
  String get interfaceLayoutSubtitle =>
      'De gedetecteerde lay-out overschrijven als dit apparaat onjuist wordt gelezen. Start Moonfin opnieuw op om de wijzigingen door te voeren.';

  @override
  String get interfaceLayoutAutomatic => 'Automatisch';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Telefoon';

  @override
  String get glassQuality => 'Glaskwaliteit';

  @override
  String get oledMode => 'OLED-modus';

  @override
  String get oledModeSubtitle =>
      'Maak zwarttinten en kleuren duidelijker. Werkt het best op OLED-schermen.';

  @override
  String get oledModeSubtle => 'Subtiel';

  @override
  String get oledModeVivid => 'Levendig';

  @override
  String get glassQualitySubtitle =>
      'Auto kiest het beste glaseffect voor dit apparaat. Volledig dwingt echte vervaging af; beperkt gebruikt een lichtgewicht glas dat GPU-vermogen bespaart.';

  @override
  String get glassQualityAuto => 'Automatisch';

  @override
  String get glassQualityFull => 'Volledig';

  @override
  String get glassQualityReduced => 'Beperkt';

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
      'Pas een volledig aangepast thema toe en schakel tussen een op Apple of Material Design geïnspireerde gebruikersinterface.';

  @override
  String get customThemeTitle => 'Aangepast thema';

  @override
  String get customThemeSubtitle =>
      'Aangepaste thema\'s veranderen visuele elementen in heel Moonfin. Kies een van deze opties die bij uw stijl past.';

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
  String get gamepadNavigation => 'Gamepad-navigatie';

  @override
  String get gamepadNavigationDescription =>
      'Laat een aangesloten gamecontroller de focus verplaatsen en items selecteren';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'De originele, schone Moonfin-standaard.';

  @override
  String get themeNeonPulse => 'Neonpuls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-stijl met magenta gloed, cyaan tekst en sterker chroomcontrast';

  @override
  String get themeGlass => 'Glas';

  @override
  String get themeGlassSubtitle =>
      'Liquid glass-styling met een zwevende gradiëntachtergrond, matglazen oppervlakken en een Apple-blauw accent';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixelart-styling met een stevig palet, blokkerige randen, harde slagschaduwen en een pixellettertype';

  @override
  String get embyConnectSignInSubtitle =>
      'Meld u aan met uw Emby Connect-account';

  @override
  String get emailOrUsername => 'E-mail of gebruikersnaam';

  @override
  String get selectAServer => 'Selecteer een server';

  @override
  String get tryAgain => 'Probeer het opnieuw';

  @override
  String get noLinkedServers =>
      'Er zijn geen servers gekoppeld aan dit Emby Connect-account';

  @override
  String get invalidEmbyConnectCredentials =>
      'Ongeldige Emby Connect-inloggegevens';

  @override
  String get invalidEmbyConnectLogin =>
      'Ongeldige Emby Connect-gebruikersnaam of wachtwoord';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server ondersteunt geen Emby Connect-uitwisseling';

  @override
  String get embyConnectNetworkError =>
      'Netwerkfout tijdens het verbinden met Emby Connect of de geselecteerde server';

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
  String get loadingLinkedServers => 'Gekoppelde servers laden...';

  @override
  String get connectingToServerEllipsis => 'Verbinding maken met server...';

  @override
  String get noReachableAddress => 'Er is geen bereikbaar adres opgegeven';

  @override
  String get invalidServerExchangeResponse =>
      'Ongeldig antwoord van serveruitwisselingseindpunt';

  @override
  String unableToConnectTo(String target) {
    return 'Kan geen verbinding maken met $target';
  }

  @override
  String get exitApp => 'Moonfin verlaten?';

  @override
  String get exitAppConfirmation => 'Weet u zeker dat u wilt afsluiten?';

  @override
  String get exit => 'Afsluiten';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Gepauzeerd';

  @override
  String get gameSaveState => 'Status opslaan';

  @override
  String get games => 'Games';

  @override
  String get gameLoadState => 'Status laden';

  @override
  String get gameFastForward => 'Vooruitspoelen';

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
  String get gameEmulatorSettings => 'Emulatorinstellingen';

  @override
  String get gameNoCoreOptions => 'Deze core heeft geen aanpasbare opties.';

  @override
  String get gameHoldToOpenMenu => 'Houd ingedrukt om het menu te openen';

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
      'Games afspelen wordt op dit apparaat nog niet ondersteund.';

  @override
  String get noHomeRowsLoaded => 'Er konden geen startrijen worden geladen';

  @override
  String get noHomeRowsHint =>
      'Probeer actieve startgedeelten te vernieuwen of te verminderen.';

  @override
  String get retryHomeRows => 'Probeer de startrijen opnieuw';

  @override
  String get guide => 'Gids';

  @override
  String get recordings => 'Opnames';

  @override
  String get schedule => 'Schema';

  @override
  String get series => 'Series';

  @override
  String get noItemsFound => 'Geen artikelen gevonden';

  @override
  String get home => 'Home';

  @override
  String get browseAll => 'Blader door alles';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Hier verschijnen collectie-items';

  @override
  String get browseByLetter => 'Blader per letter';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alfabetisch bladeren verschijnt hier';

  @override
  String get suggestions => 'Suggesties';

  @override
  String get suggestionsPlaceholder =>
      'Voorgestelde items worden hier weergegeven';

  @override
  String get failedToLoadLibraries => 'Kan bibliotheken niet laden';

  @override
  String get noLibrariesFound => 'Geen bibliotheken gevonden';

  @override
  String get library => 'Bibliotheek';

  @override
  String get displaySettings => 'Weergave-instellingen';

  @override
  String get allGenres => 'Alle genres';

  @override
  String get noGenresFound => 'Geen genres gevonden';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kan map niet laden: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Deze map is leeg';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Kan favorieten niet laden';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get noFavoritesYet => 'Nog geen favorieten';

  @override
  String get favorites => 'Favorieten';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Loopt nog';

  @override
  String get ended => 'Beëindigd';

  @override
  String get sortAndFilter => 'Sorteren en filteren';

  @override
  String get type => 'Type';

  @override
  String get sortBy => 'Sorteer op';

  @override
  String get display => 'Weergave';

  @override
  String get imageType => 'Afbeeldingstype';

  @override
  String get posterSize => 'Posterformaat';

  @override
  String get small => 'Klein';

  @override
  String get medium => 'Medium';

  @override
  String get large => 'Groot';

  @override
  String get extraLarge => 'Extra groot';

  @override
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Scrolrichting';

  @override
  String get scrollDirectionVertical => 'Verticaal';

  @override
  String get scrollDirectionHorizontal => 'Horizontaal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Bekeken';

  @override
  String get albums => 'Albums';

  @override
  String get albumArtists => 'Albumartiesten';

  @override
  String get artists => 'Artiesten';

  @override
  String get bookmarks => 'Bladwijzers';

  @override
  String get noSavedBookmarks =>
      'Er zijn nog geen opgeslagen bladwijzers voor deze titel.';

  @override
  String get openBook => 'Boek openen';

  @override
  String get chapter => 'Hoofdstuk';

  @override
  String get page => 'Pagina';

  @override
  String get bookmark => 'Bladwijzer';

  @override
  String get justNow => 'Zojuist';

  @override
  String minutesAgo(int count) {
    return '${count}m geleden';
  }

  @override
  String hoursAgo(int count) {
    return '${count}u geleden';
  }

  @override
  String daysAgo(int count) {
    return '${count}d geleden';
  }

  @override
  String get discoverySubjects => 'Ontdekkingsonderwerpen';

  @override
  String get apply => 'Toepassen';

  @override
  String get openLink => 'Link openen';

  @override
  String get scanWithYourPhone => 'Scan met uw telefoon';

  @override
  String get audiobookGenres => 'Luisterboek-genres';

  @override
  String get scrollLeft => 'Scrol naar links';

  @override
  String get scrollRight => 'Scrol naar rechts';

  @override
  String get scrollToTop => 'Scrol naar boven';

  @override
  String get couldNotLoadGenre => 'Kan dit genre momenteel niet laden.';

  @override
  String get continueReading => 'Ga door met lezen';

  @override
  String get savedHighlights => 'Opgeslagen hoogtepunten';

  @override
  String get continueListening => 'Ga door met luisteren';

  @override
  String get listen => 'Luisteren';

  @override
  String get resume => 'Hervatten';

  @override
  String get failedToLoadLibrary => 'Kan bibliotheek niet laden';

  @override
  String get popularNow => 'Nu populair';

  @override
  String get savedForLater => 'Bewaard voor later';

  @override
  String get topListens => 'Top luistert';

  @override
  String get unreadDiscoveries => 'Ongelezen ontdekkingen';

  @override
  String get pickUpAgain => 'Opnieuw ophalen';

  @override
  String get bookHighlightsDescription =>
      'Je boeken met hoogtepunten, favorieten of leesvoortgang.';

  @override
  String get handPickedFromLibrary => 'Uitgekozen uit uw bibliotheek.';

  @override
  String get handPickedFromListeningQueue =>
      'Uitgekozen uit uw luisterwachtrij.';

  @override
  String get booksWithHighlights =>
      'Boeken met hoogtepunten, favorieten of leesvoortgang.';

  @override
  String get jumpBackNarration =>
      'Spring terug in het verhaal zonder op zoek te gaan naar je plaats.';

  @override
  String get unreadBooksReady =>
      'Ongelezen boeken klaar voor het volgende rustige uurtje.';

  @override
  String get quickAccessFavorites =>
      'Snelle toegang tot de boeken waar je steeds weer naar terugkomt.';

  @override
  String get searchAudiobooks => 'Zoek audioboeken';

  @override
  String get searchYourLibrary => 'Zoek in uw bibliotheek';

  @override
  String get pickUpStory => 'Ga verder met het verhaal waar je was gebleven';

  @override
  String get savedPlacesChapters =>
      'Je opgeslagen plaatsen en onvoltooide hoofdstukken';

  @override
  String authorsCount(int count) {
    return '$count auteurs';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% voltooid';
  }

  @override
  String get readyWhenYouAre => 'Klaar wanneer jij dat bent';

  @override
  String get details => 'Details';

  @override
  String get listeningRoom => 'Luisterkamer';

  @override
  String get bookmarksAndProgress => 'Bladwijzers en voortgang';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titels, geordend om lezend te bladeren.';
  }

  @override
  String get titles => 'Titels';

  @override
  String get allTitles => 'Alle titels';

  @override
  String get authors => 'Auteurs';

  @override
  String get browseByAuthor => 'Blader op auteur';

  @override
  String get browseByGenre => 'Blader op genre';

  @override
  String get discover => 'Ontdekken';

  @override
  String get noBookmarkedItems => 'Er zijn nog geen items met bladwijzers';

  @override
  String get nothingMatchesSection =>
      'Er is nog niets dat overeenkomt met deze sectie. Probeer een ander tabblad of kom terug nadat de bibliotheeksynchronisatie is voltooid.';

  @override
  String get audiobooks => 'Luisterboeken';

  @override
  String noLabelFound(String label) {
    return '$label niet gevonden';
  }

  @override
  String get folder => 'Map';

  @override
  String get filters => 'Filters';

  @override
  String get readingStatus => 'Leesstatus';

  @override
  String get playedStatus => 'Afgespeelde status';

  @override
  String get readStatus => 'Lezen';

  @override
  String get watched => 'Bekeken';

  @override
  String get unread => 'Ongelezen';

  @override
  String get unwatched => 'Niet bekeken';

  @override
  String get seriesStatus => 'Seriestatus';

  @override
  String get allLibraries => 'Alle bibliotheken';

  @override
  String get books => 'Boeken';

  @override
  String get latestBooks => 'Nieuwste boeken';

  @override
  String get latestAudiobooks => 'Nieuwste luisterboeken';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count boeken',
      one: '1 boek',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Boek';

  @override
  String get bookFormatAudiobook => 'Luisterboek';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Er zijn geen boeken gevonden voor deze auteur.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% gelezen';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Nog $time';
  }

  @override
  String get bookHeroRead => 'Lezen';

  @override
  String get bookHeroListen => 'Luisteren';

  @override
  String get author => 'Auteur';

  @override
  String get unknownAuthor => 'Onbekende auteur';

  @override
  String get uncategorized => 'Niet gecategoriseerd';

  @override
  String get overview => 'Overzicht';

  @override
  String get noLibrivoxDescription =>
      'Er is nog geen beschrijving gegeven door LibriVox voor deze titel.';

  @override
  String get readers => 'Lezers';

  @override
  String get openLinks => 'Koppelingen openen';

  @override
  String get librivoxPage => 'LibriVox-pagina';

  @override
  String get internetArchive => 'Internetarchief';

  @override
  String get rssFeed => 'RSS-feed';

  @override
  String get downloadZip => 'Download als Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count secties';
  }

  @override
  String firstPublished(int year) {
    return 'Eerste uitgave $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Er is nog geen overzicht beschikbaar vanaf Open Library voor deze titel.';

  @override
  String get subjects => 'Onderwerpen';

  @override
  String get all => 'Alle';

  @override
  String booksCount(int count) {
    return '$count boeken';
  }

  @override
  String get couldNotLoadSubject => 'Kan dit onderwerp nu niet laden.';

  @override
  String get audiobookDetails => 'Luisterboekdetails';

  @override
  String authorsCountTitle(int count) {
    return '$count Auteurs';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audioboeken',
      one: '1 audioboek',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Tracklijst';

  @override
  String get itemListPlaceholder => 'De itemlijst verschijnt hier';

  @override
  String get failedToLoad => 'Kan niet laden';

  @override
  String get delete => 'Verwijderen';

  @override
  String get save => 'Opslaan';

  @override
  String get moreLikeThis => 'Meer zoals dit';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Verzameling';

  @override
  String get episodes => 'Afleveringen';

  @override
  String get nextUp => 'Volgende';

  @override
  String get seasons => 'Seizoenen';

  @override
  String get chapters => 'Hoofdstukken';

  @override
  String get features => 'Functies';

  @override
  String get movies => 'Films';

  @override
  String get musicVideos => 'Videoclips';

  @override
  String get other => 'Ander';

  @override
  String get discography => 'Discografie';

  @override
  String get similarArtists => 'Soortgelijke artiesten';

  @override
  String get tableOfContents => 'Inhoudsopgave';

  @override
  String get tracklist => 'Tracklijst';

  @override
  String discNumber(int number) {
    return 'Schijf $number';
  }

  @override
  String get biography => 'Biografie';

  @override
  String get authorDetails => 'Auteurgegevens';

  @override
  String get noOverviewAvailable =>
      'Er is nog geen overzicht beschikbaar voor deze titel.';

  @override
  String get noBiographyAvailable =>
      'Er is geen biografie beschikbaar van deze auteur.';

  @override
  String get unableToLoadAuthorDetails =>
      'Kan auteursgegevens momenteel niet laden.';

  @override
  String published(int year) {
    return 'Uitgegeven in $year';
  }

  @override
  String get publicationDateUnknown => 'Datum van publicatie onbekend';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seizoenen',
      one: '1 seizoen',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Eindigt om $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extra\'s';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Achter de schermen';

  @override
  String get deletedScenes => 'Verwijderde scènes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scènes';

  @override
  String get shorts => 'Korte films';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return 'Nog $time';
  }

  @override
  String endsIn(String time) {
    return 'Eindigt over $time';
  }

  @override
  String get view => 'Weergave';

  @override
  String get resumeReading => 'Hervat het lezen';

  @override
  String get read => 'Lezen';

  @override
  String resumeFrom(String position) {
    return 'Hervatten vanaf $position';
  }

  @override
  String get play => 'Afspelen';

  @override
  String get startOver => 'Begin opnieuw';

  @override
  String get restart => 'Opnieuw starten';

  @override
  String get readOffline => 'Offline lezen';

  @override
  String get playOffline => 'Speel offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Ondertitels';

  @override
  String get version => 'Versie';

  @override
  String get cast => 'Casten';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Afgerond';

  @override
  String get favorited => 'Favoriet';

  @override
  String get favorite => 'Favoriet';

  @override
  String get playlist => 'Afspeellijst';

  @override
  String get downloaded => 'Gedownload';

  @override
  String get finalizingDownload => 'Afronden…';

  @override
  String get queuedDownload => 'In de wachtrij';

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
  String get downloadAll => 'Alles downloaden';

  @override
  String get download => 'Downloaden';

  @override
  String get deleteDownloaded => 'Downloads verwijderen';

  @override
  String get goToSeries => 'Ga naar Serie';

  @override
  String get editMetadata => 'Metagegevens bewerken';

  @override
  String get less => 'Minder';

  @override
  String get more => 'Meer';

  @override
  String get deleteItem => 'Item verwijderen';

  @override
  String get deletePlaylist => 'Afspeellijst verwijderen';

  @override
  String get deletePlaylistMessage =>
      'Deze afspeellijst van de server verwijderen?';

  @override
  String get deleteItemMessage => 'Dit item van de server verwijderen?';

  @override
  String get failedToDeletePlaylist => 'Kan afspeellijst niet verwijderen';

  @override
  String get failedToDeleteItem => 'Kan item niet verwijderen';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'De verwijdering is mislukt met de volgende foutmelding: $error';
  }

  @override
  String get renamePlaylist => 'Hernoem de afspeellijst';

  @override
  String get playlistName => 'Naam van afspeellijst';

  @override
  String get deleteDownloadedAlbum => 'Verwijder het gedownloade album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Gedownloade nummers voor \"$title\" verwijderen?';
  }

  @override
  String get downloadedTracksDeleted => 'Gedownloade nummers verwijderd';

  @override
  String get downloadedTracksDeleteFailed =>
      'Sommige gedownloade nummers konden niet worden verwijderd';

  @override
  String get noTracksLoaded => 'Er zijn geen nummers geladen';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Geen $itemLabel geladen';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title downloaden ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Weet u zeker dat u \"$name\" van de server wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.';
  }

  @override
  String get itemDeleted => 'Item verwijderd';

  @override
  String get noPlayableTrailerFound => 'Geen afspeelbare trailer gevonden.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Niet-ondersteund boekformaat: .$extension';
  }

  @override
  String get audioTrack => 'Audiotrack';

  @override
  String get subtitleTrack => 'Ondertiteltrack';

  @override
  String get none => 'Geen';

  @override
  String get downloadSubtitlesLabel => 'Ondertitels downloaden...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Zoek met behulp van de OpenSubtitles-plug-in';

  @override
  String get downloadSubtitles => 'Ondertitels downloaden';

  @override
  String get searchingSubtitles => 'Naar ondertitels aan het zoeken…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Ondertitels downloaden…';

  @override
  String get selectedSubtitleInvalid =>
      'De geselecteerde ondertitel is ongeldig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Ondertitel gedownload en geselecteerd: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Ondertitel gedownload. Het kan even duren voordat Jellyfin het item vernieuwt.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Geen externe ondertitels gevonden voor $language.';
  }

  @override
  String get selectVersion => 'Selecteer Versie';

  @override
  String versionNumber(int number) {
    return 'Versie $number';
  }

  @override
  String get downloadAllQuality => 'Alles downloaden - Kwaliteit';

  @override
  String get downloadQuality => 'Kwaliteit downloaden';

  @override
  String get originalFileNoReencoding => 'Origineel bestand, geen hercodering';

  @override
  String get originalFilesNoReencoding =>
      'Originele bestanden, geen hercodering';

  @override
  String get noEpisodesLoaded => 'Er zijn geen afleveringen geladen';

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
    return '$name downloaden ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Verwijder gedownloade bestanden';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Lokale bestanden voor $typeLabel verwijderen?\n\nDit maakt opslagruimte vrij. U kunt ze later opnieuw downloaden.';
  }

  @override
  String get downloadedFilesDeleted => 'Gedownloade bestanden verwijderd';

  @override
  String get failedToDeleteFiles => 'Kan bestanden niet verwijderen';

  @override
  String get deleteFiles => 'Bestanden verwijderen';

  @override
  String get director => 'REGISSEUR';

  @override
  String get starring => 'Met in de hoofdrol';

  @override
  String get directors => 'REGISSEURS';

  @override
  String get writer => 'SCHRIJVER';

  @override
  String get writers => 'SCHRIJVERS';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count meer';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Afleveringen';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Aflevering $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Hoofdstuk $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nummers',
      one: '1 nummer',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hoofdstukken',
      one: '1 hoofdstuk',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Geboren $date';
  }

  @override
  String died(String date) {
    return 'Overleden $date';
  }

  @override
  String age(int age) {
    return 'Leeftijd $age';
  }

  @override
  String get showLess => 'Toon minder';

  @override
  String get readMore => 'Lees meer';

  @override
  String get shuffle => 'Willekeurig';

  @override
  String get shuffleAll => 'Shuffle alles';

  @override
  String get shuffleAllMusic => 'Alle muziek willekeurig afspelen';

  @override
  String get carSignInPrompt => 'Meld u aan bij Moonfin op uw telefoon';

  @override
  String get carServerUnreachable => 'Kan uw server niet bereiken';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfecte wedstrijd';

  @override
  String get aiTranslated => 'AI-vertaald';

  @override
  String get machineTranslated => 'Machine-vertaald';

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
    return 'Voor $action van externe ondertitels is de Jellyfin-machtiging voor ondertitelbeheer vereist voor deze gebruiker.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Dit item kon niet op de server worden gevonden voor $action van externe ondertitels.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action van externe ondertitels mislukt: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action van externe ondertitels mislukt (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Kan externe ondertitels niet $action.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alle gedownloade afleveringen van \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'alle gedownloade afleveringen van dit seizoen';

  @override
  String get stillWatching => 'Nog steeds aan het kijken?';

  @override
  String get unableToLoadTrailerStream => 'Kan trailerstream niet laden.';

  @override
  String get trailerTimedOut =>
      'Er is een time-out opgetreden tijdens het laden van de trailer.';

  @override
  String get playbackFailedForTrailer =>
      'Het afspelen van deze trailer is mislukt.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casten is niet beschikbaar tijdens offline afspelen.';

  @override
  String castActionFailed(String label, String error) {
    return 'Actie $label mislukt: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Kan castvolume niet instellen: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label-bediening';
  }

  @override
  String get deviceVolume => 'Apparaatvolume';

  @override
  String get unavailable => 'Niet beschikbaar';

  @override
  String get pause => 'Pauzeren';

  @override
  String get syncPosition => 'Synchroniseer positie';

  @override
  String stopCast(String label) {
    return '$label stoppen';
  }

  @override
  String get queueIsEmpty => 'Wachtrij is leeg';

  @override
  String trackNumber(int number) {
    return 'Nummer $number';
  }

  @override
  String get remotePlayback => 'Afspelen op afstand';

  @override
  String get castingToGoogleCast => 'Casten naar Google Cast';

  @override
  String get castingViaAirPlay => 'Casten via AirPlay';

  @override
  String get castingViaDlna => 'Casten via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconden';
  }

  @override
  String get longPressToUnlock => 'Lang indrukken om te ontgrendelen';

  @override
  String get off => 'Uit';

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
  String get audioDelay => 'Audiovertraging';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Ondertitelvertraging';

  @override
  String get reset => 'Resetten';

  @override
  String get unknown => 'Onbekend';

  @override
  String get playbackInformation => 'Afspeelinformatie';

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
  String get playback => 'Afspelen';

  @override
  String get playMethod => 'Speelmethode';

  @override
  String get directPlay => 'Direct afspelen';

  @override
  String get directStream => 'Directe stroom';

  @override
  String get transcoding => 'Transcoderen';

  @override
  String get transcodeReasons => 'Redenen voor transcoderen';

  @override
  String get player => 'Speler';

  @override
  String get container => 'Houder';

  @override
  String get bitrate => 'Bitsnelheid';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Oplossing';

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
  String get track => 'Nummer';

  @override
  String get channels => 'Kanalen';

  @override
  String get format => 'Formaat';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Ingebed';

  @override
  String castSessionError(String protocol) {
    return 'Fout in $protocol-sessie';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kan boekgegevens niet laden: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-rendering in-app is nog niet beschikbaar op dit platform.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Dit formaat (.$extension) kan nog niet in de app worden weergegeven.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ingebedde documentweergave is niet beschikbaar op dit platform.';

  @override
  String get couldNotOpenExternalViewer => 'Kan externe viewer niet openen.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Kan de ingebouwde lezer niet openen: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Er is al een bladwijzer opgeslagen bij $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bladwijzer toegevoegd: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nog geen bladwijzers.\nTik tijdens het lezen op het bladwijzerpictogram om uw positie op te slaan.';

  @override
  String get noTableOfContentsAvailable => 'Geen inhoudsopgave beschikbaar';

  @override
  String pageLabel(int number) {
    return 'Pagina $number';
  }

  @override
  String get position => 'Positie';

  @override
  String get bookReader => 'Boeklezer';

  @override
  String formatExtension(String extension) {
    return 'Formaat: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% gelezen';
  }

  @override
  String get updating => 'Updaten...';

  @override
  String get markUnread => 'Markeer als ongelezen';

  @override
  String get markAsRead => 'Markeer als gelezen';

  @override
  String get reloadReader => 'Laad Lezer opnieuw';

  @override
  String get noPagesFound => 'Geen pagina\'s gevonden.';

  @override
  String get failedToDecodePageImage =>
      'Kan de paginaafbeelding niet decoderen.';

  @override
  String resetZoom(String zoom) {
    return 'Zoom herstellen (${zoom}x)';
  }

  @override
  String get singlePage => 'Enkele pagina';

  @override
  String get twoPageSpread => 'Twee pagina\'s verspreid';

  @override
  String get addBookmark => 'Voeg bladwijzer toe';

  @override
  String get bookmarksEllipsis => 'Bladwijzers...';

  @override
  String get markedAsRead => 'Gemarkeerd als gelezen';

  @override
  String get markedAsUnread => 'Gemarkeerd als ongelezen';

  @override
  String failedToUpdateReadState(String error) {
    return 'Kan leesstatus niet bijwerken: $error';
  }

  @override
  String get themeSystem => 'Thema: Systeem';

  @override
  String get themeLight => 'Thema: Licht';

  @override
  String get themeDark => 'Thema: Donker';

  @override
  String get themeSepia => 'Thema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Kleuren omkeren (vaste lay-out)';

  @override
  String get invertColorsPdf => 'Kleuren omkeren (PDF)';

  @override
  String get preparingInAppReader => 'In-app-lezer voorbereiden...';

  @override
  String get pdfDataNotAvailable => 'PDF-gegevens niet beschikbaar.';

  @override
  String get readerFallbackModeActive => 'Lezer fallback-modus actief';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Dit platform kan de ingesloten documentengine voor $extension-bestanden niet uitvoeren.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Gebruik Reader opnieuw laden nadat u bent overgeschakeld naar een ondersteund platformdoel (Android, iOS, macOS).';

  @override
  String get openExternally => 'Extern openen';

  @override
  String get noEpubChaptersFound => 'Geen EPUB-hoofdstukken gevonden.';

  @override
  String get readerNotReady => 'Lezer niet klaar.';

  @override
  String get seriesRecordings => 'Serie opnames';

  @override
  String get now => 'Nu';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nieuws';

  @override
  String get kids => 'Kinderen';

  @override
  String get premiere => 'Première';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Gids Tijdlijn';

  @override
  String failedToLoadGuide(String error) {
    return 'Kan gids niet laden: $error';
  }

  @override
  String get noChannelsFound => 'Geen kanalen gevonden';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Straks: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Nog ${minutes}m';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Nog ${hours}u';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Nog ${hours}u ${minutes}m';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Verwijderd uit favoriete kanalen';

  @override
  String get addedToFavoriteChannels => 'Toegevoegd aan favoriete kanalen';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Kan favoriete kanaal niet updaten';

  @override
  String get unfavoriteChannel => 'Onfavoriet kanaal';

  @override
  String get favoriteChannel => 'Favoriete kanaal';

  @override
  String get record => 'Opnemen';

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
  String get cancelRecordingAction => 'Opname annuleren';

  @override
  String get programSetToRecord => 'Programma wordt opgenomen';

  @override
  String get recordingCancelled => 'Opname geannuleerd';

  @override
  String get unableToCreateRecording => 'Kan opname niet aanmaken';

  @override
  String get recordSeries => 'Serie opnemen';

  @override
  String get seriesSetToRecord => 'Serie wordt opgenomen';

  @override
  String get seriesRecordingCancelled => 'Serie-opname geannuleerd';

  @override
  String get unableToCreateSeriesRecording => 'Serie-opname aanmaken mislukt';

  @override
  String get watch => 'Kijken';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Sluiten';

  @override
  String failedToPlayChannel(String name) {
    return 'Kan $name niet afspelen';
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
  String get failedToLoadRecordings => 'Kan opnamen niet laden';

  @override
  String get scheduledInNext24Hours => 'Gepland in de komende 24 uur';

  @override
  String get recentRecordings => 'Recente opnames';

  @override
  String get tvSeries => 'TV-serie';

  @override
  String get failedToLoadSchedule => 'Kan het schema niet laden';

  @override
  String get noScheduledRecordings => 'Geen geplande opnames';

  @override
  String get cancelRecording => 'Opname annuleren?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Geplande opname van \"$name\" annuleren?';
  }

  @override
  String get no => 'Nee';

  @override
  String get yesCancel => 'Ja, annuleren';

  @override
  String get failedToCancelRecording => 'Kan de opname niet annuleren';

  @override
  String get failedToLoadSeriesRecordings => 'Kan serieopnamen niet laden';

  @override
  String get noSeriesRecordings => 'Geen serie-opnames';

  @override
  String get cancelSeriesRecording => 'Serie-opname annuleren';

  @override
  String get cancelSeriesRecordingQuestion => 'Serie-opname annuleren?';

  @override
  String stopRecordingName(String name) {
    return 'Opname van \"$name\" stoppen?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Kan de serie-opname niet annuleren';

  @override
  String get searchThisLibrary => 'Doorzoek deze bibliotheek...';

  @override
  String get searchEllipsis => 'Zoeken...';

  @override
  String noResultsForQuery(String query) {
    return 'Geen resultaten voor \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Zoeken mislukt: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-accounttype';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokaal';

  @override
  String get savedMedia => 'Opgeslagen media';

  @override
  String get tvShows => 'TV-programma\'s';

  @override
  String get music => 'Muziek';

  @override
  String get musicAlbums => 'Muziekalbums';

  @override
  String get noMediaInFilter => 'Geen media in dit filter';

  @override
  String get noDownloadedMediaYet => 'Nog geen gedownloade media';

  @override
  String get browseLibrary => 'Blader door de bibliotheek';

  @override
  String get deleteDownload => 'Downloaden verwijderen';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" en de bijbehorende bestanden verwijderen?';
  }

  @override
  String tracksCount(int count) {
    return '$count nummers';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Album afspelen';

  @override
  String failedToLoadAlbum(String error) {
    return 'Kan album niet laden: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Geen gedownloade tracks gevonden voor $name.';
  }

  @override
  String get season => 'Seizoen';

  @override
  String get errorLoadingEpisodes => 'Fout bij het laden van afleveringen';

  @override
  String get noDownloadedEpisodes => 'Geen gedownloade afleveringen';

  @override
  String get deleteEpisode => 'Aflevering verwijderen';

  @override
  String removeName(String name) {
    return '\"$name\" verwijderen?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season A$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Aflevering $number';
  }

  @override
  String get seriesNotFound => 'Serie niet gevonden';

  @override
  String get errorLoadingSeries => 'Fout bij laden van serie';

  @override
  String get downloadedEpisodes => 'Gedownloade afleveringen';

  @override
  String seasonNumber(int number) {
    return 'Seizoen $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Speciale aanbiedingen';

  @override
  String get deleteSeason => 'Seizoen verwijderen';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Alle gedownloade afleveringen in $season verwijderen?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count afleveringen',
      one: '1 aflevering',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Opslagbeheer';

  @override
  String get storageBreakdown => 'Opslagverdeling';

  @override
  String get downloadedItems => 'Gedownloade items';

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
  String get storageLimit => 'Opslaglimiet';

  @override
  String get noLimit => 'Geen limiet';

  @override
  String get deleteAllDownloads => 'Verwijder alle downloads';

  @override
  String get deleteAllDownloadsWarning =>
      'Hiermee worden alle gedownloade mediabestanden verwijderd en dit kan niet ongedaan worden gemaakt.';

  @override
  String get deleteAll => 'Alles verwijderen';

  @override
  String get deleteSelected => 'Geselecteerde verwijderen';

  @override
  String deleteSelectedCount(int count) {
    return '$count gedownloade items verwijderen?';
  }

  @override
  String get musicAndAudiobooks => 'Muziek en audioboeken';

  @override
  String get images => 'Afbeeldingen';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'van $limit limiet';
  }

  @override
  String get settings => 'Instellingen';

  @override
  String get settingsSearchHint => 'Zoekinstellingen';

  @override
  String get authentication => 'Authenticatie';

  @override
  String get autoLoginServerManagement => 'Automatisch inloggen, serverbeheer';

  @override
  String get pinCode => 'PIN-code';

  @override
  String get setUpPinCodeProtection => 'Stel pincodebeveiliging in';

  @override
  String get parentalControls => 'Ouderlijk toezicht';

  @override
  String get contentRatingRestrictions => 'Beperkingen voor inhoudsbeoordeling';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolutie, gedrag';

  @override
  String get languageSizeAppearance => 'Taal, grootte, uiterlijk';

  @override
  String get qualityStorage => 'Kwaliteit, opslag';

  @override
  String get mediaRequestIntegration => 'Integratie van mediaverzoeken';

  @override
  String get switchServer => 'Wissel van server';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get versionLicenses => 'Versie, licenties';

  @override
  String get account => 'Account';

  @override
  String get signInAndSecurity => 'Inloggen en beveiliging';

  @override
  String get administration => 'Administratie';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverinstellingen, gebruikers, bibliotheken';

  @override
  String get customization => 'Maatwerk';

  @override
  String get themeAndLayout => 'Thema en lay-out';

  @override
  String get videoAndSubtitles => 'Video en ondertitels';

  @override
  String get pluginAndRequests => 'Plug-in en verzoeken';

  @override
  String get customizeAccountPlaybackInterface =>
      'Pas account-, afspeel- en interfacegedrag aan';

  @override
  String optionsCount(int count) {
    return '$count opties';
  }

  @override
  String get themeAndAppearance => 'Thema & Uiterlijk';

  @override
  String get focusBorderColor => 'Randkleur focus';

  @override
  String get watchedIndicators => 'Indicatoren bekeken';

  @override
  String get always => 'Altijd';

  @override
  String get mixedRowsOnly => 'Alleen gemengde rijen';

  @override
  String get hideUnwatched => 'Onbewaakt verbergen';

  @override
  String get episodesOnly => 'Alleen afleveringen';

  @override
  String get never => 'Nooit';

  @override
  String get focusExpansionAnimation => 'Animatie voor focusuitbreiding';

  @override
  String get desktopUiScale => 'Desktop UI-schaal';

  @override
  String get scaleFocusedCards =>
      'Schaal gefocuste of zwevende kaarten en tegels';

  @override
  String get seriesThumbnails => 'Serieminiaturen';

  @override
  String get seriesThumbnailsDescription =>
      'Bij TV-series: gebruik afbeeldingen die overeenkomen met elke thumbnail.';

  @override
  String get homeRowInfoOverlay => 'Info-overlay voor startrij';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Toon titel en metagegevens wanneer u door de startrijen bladert';

  @override
  String get clockDisplay => 'Klokweergave';

  @override
  String get inMenus => 'In Menu\'s';

  @override
  String get inVideo => 'Op video';

  @override
  String get seasonalEffects => 'Seizoenseffecten';

  @override
  String get seasonalEffectsDescription =>
      'Visuele effecten en seizoensdecoraties';

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
  String get snow => 'Sneeuw';

  @override
  String get fireworks => 'Vuurwerk';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'Vallende bladeren';

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
  String get themeMusic => 'Thema Muziek';

  @override
  String get playThemeMusicOnDetailPages =>
      'Speel themamuziek af op detailpagina\'s';

  @override
  String get themeMusicVolume => 'Themamuziekvolume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Themamuziek op de thuisrijen';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Speel af tijdens het bladeren door het startscherm';

  @override
  String get loopThemeMusic => 'Themamuziek herhalen';

  @override
  String get loopThemeMusicSubtitle =>
      'Herhaal de track in plaats van hem één keer af te spelen';

  @override
  String get detailsBackgroundBlur => 'Details Achtergrondvervaging';

  @override
  String get detailsBackgroundOpacity => 'Achtergronddoorzichtigheid Details';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur =>
      'Achtergrondvervaging tijdens het browsen';

  @override
  String get maxStreamingBitrate => 'Maximale streaming-bitsnelheid';

  @override
  String get maxResolution => 'Maximale resolutie';

  @override
  String get playerZoomMode => 'Spelerzoommodus';

  @override
  String get settingsScrollWheelAction => 'Muiswiel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Kies wat scrollen met het muiswiel over de video doet tijdens het afspelen.';

  @override
  String get scrollWheelActionOff => 'Uit';

  @override
  String get scrollWheelActionSeek => 'Spoelen (vooruit / achteruit)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatisch bijsnijden';

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
  String get stretch => 'Strek';

  @override
  String get refreshRateSwitching => 'Wisselen van vernieuwingsfrequentie';

  @override
  String get disabled => 'Uitgeschakeld';

  @override
  String get manual => 'Handmatig';

  @override
  String get autoDetect => 'Autodetecteren';

  @override
  String get scaleOnTv => 'Schaal op tv';

  @override
  String get scaleOnDevice => 'Schaal op apparaat';

  @override
  String get trickPlay => 'TrickPlay';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Toon voorbeeldminiaturen tijdens het zoeken';

  @override
  String get trickplayDisplayStyleSingle => 'Enkele miniatuur';

  @override
  String get trickplayDisplayStyleStrip => 'Filmstrook';

  @override
  String get trickplayModeFull => 'Volledig scherm';

  @override
  String get trickplaySettingsPreviewHint =>
      'Schuif de schuifregelaar om een voorbeeld van het schrobben te zien';

  @override
  String get trickplayPreviewScale => 'Voorbeeldgrootte';

  @override
  String get trickplayVerticalOffset => 'Afstand van de zoekbalk';

  @override
  String get trickplayFollowScrubPosition => 'Schrobpositie volgen';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Geef voorbeelddia\'s langs de zoekbalk tijdens het schrobben, in plaats van het te centreren';

  @override
  String get trickplayPauseWhileScrubbing => 'Pause While Scrubbing';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Playback pauses while you seek and resumes when you press play. Turn this off to keep playing and jump straight to the new spot';

  @override
  String get showDescriptionOnPause => 'Beschrijving weergeven bij pauze';

  @override
  String get dimVideoShowOverview =>
      'Video dimmen en overzichtstekst weergeven tijdens pauze';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD-vergrendelknop';

  @override
  String get osdLockButtonDescription =>
      'Toon een vergrendelknop die aanraakinvoer blokkeert totdat deze lang wordt ingedrukt';

  @override
  String get playerSwipeGestures => 'Volume- en helderheidsveegbewegingen';

  @override
  String get playerSwipeGesturesDescription =>
      'Schuif links naar boven of naar beneden in de speler om helderheid te veranderen en rechts om volume te veranderen';

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
  String get osdButtons => 'Afspeelknoppen';

  @override
  String get osdButtonsDescription => 'Kies welke knop de speler laat zien';

  @override
  String get osdButtonsSectionDescription =>
      'De afspeelbediening wordt altijd getoond. Alles daaronder kun je bewerken; elk apparaat slaat de eigen keuzes op.';

  @override
  String get detailButtons => 'Actieknoppen';

  @override
  String get detailButtonsDescription =>
      'Kies welke knoppen op het detailscherm worden getoond';

  @override
  String get detailButtonsSectionDescription =>
      'De afspeelknop staat als eerst en de vergrendelde knoppen worden altijd getoond. De rest kun je zelf bepalen; elk apparaat bewaart de eigen instellingen.';

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
  String get moveUp => 'Ga omhoog';

  @override
  String get moveDown => 'Ga omlaag';

  @override
  String get buttonOrderHint =>
      'Gebruik de pijltjes om de volgorde aan te passen. Op een afstandsbediening verplaatsen links en rechts te oplichtende knop. Zet je er eentje uit, dan komt deze onderaan de lijst te staan.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Vergrendeling schermstand';

  @override
  String get fullscreen => 'Volledig scherm';

  @override
  String get audioBehavior => 'Audio-gedrag';

  @override
  String get downmixToStereo => 'Downmixen naar stereo';

  @override
  String get defaultAudioLanguage => 'Standaard audiotaal';

  @override
  String get fallbackAudioLanguage => 'Terugvaltaal voor audio';

  @override
  String get preferDefaultAudioTrack => 'Voorkeur voor standaard audiotrack';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Geef de voorkeur aan de originele audiotrack boven de nagesynchroniseerde versie.';

  @override
  String get preferAudioDescription => 'Voorkeur voor audiodescriptietracks';

  @override
  String get preferAudioDescriptionDescription =>
      'Geef de voorkeur aan audiodescriptietracks boven normale tracks.';

  @override
  String get autoServerDefault => 'Automatisch (serverstandaard)';

  @override
  String get english => 'Engels';

  @override
  String get spanish => 'Spaans';

  @override
  String get french => 'Frans';

  @override
  String get german => 'Duits';

  @override
  String get italian => 'Italiaans';

  @override
  String get portuguese => 'Portugees';

  @override
  String get japanese => 'Japanse';

  @override
  String get korean => 'Koreaans';

  @override
  String get chinese => 'Chinees';

  @override
  String get russian => 'Russisch';

  @override
  String get arabic => 'Arabisch';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Nederlands';

  @override
  String get swedish => 'Zweeds';

  @override
  String get norwegian => 'Noors';

  @override
  String get danish => 'Deens';

  @override
  String get finnish => 'Fins';

  @override
  String get polish => 'Pools';

  @override
  String get ac3Passthrough => 'AC3-doorvoer';

  @override
  String get dtsPassthrough => 'DTS-doorvoer';

  @override
  String get trueHdSupport => 'TrueHD-ondersteuning';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS-audio alleen naar AVR; vereist ontvangerondersteuning en DTS-brontrack';

  @override
  String get settingsAudioFallbackCodec => 'Terugvalcodec voor audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selecteer het doelformaat waarnaar meerkanaalsaudio wordt getranscodeerd wanneer de bronstream niet direct kan worden afgespeeld of doorgegeven.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automatisch detecteren\n(Aanbevolen)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Standaard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Alleen stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficiënt)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Verliesvrij)';

  @override
  String get settingsMaxAudioChannels => 'Max. audiokanalen';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Stel het maximale aantal kanalen van uw audio-opstelling in. Meerkanaalsstreams die deze limiet overschrijden worden gedownmixt of getranscodeerd.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automatisch detecteren\n(Hardwarestandaard)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrafonisch';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (geavanceerd)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec-passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Schakel alleen formaten in die uw AVR of HDMI-apparaat ondersteunt.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-passthrough';

  @override
  String get settingsAudioPassthroughMode => 'Direct doorsturen';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Hoe gecomprimeerde audio naar je TV of ontvanger wordt gestuurd.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Uit (altijd ontcijferen op dit apparaat)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Automatisch (kijkt per apparaat of ontcijferen nodig is)';

  @override
  String get settingsAudioPassthroughModeManual => 'Handmatig (kies hieronder)';

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
      'Mix alle audio naar twee kanalen.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, met Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX => 'Bitstream DTS-HD, met DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, met Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-passthrough';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Gedetecteerde audiomogelijkheden';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nog geen momentopname van runtimemogelijkheden beschikbaar.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Decoderen';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD-audioroute';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Luidspreker';

  @override
  String get settingsAudioRouteHeadphones => 'Koptelefoon';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get nightMode => 'Nachtmodus';

  @override
  String get compressDynamicRange => 'Dynamisch bereik comprimeren';

  @override
  String get advancedMpv => 'Geavanceerde mpv';

  @override
  String get enableCustomMpvConf => 'Schakel Aangepaste mpv.conf in';

  @override
  String get applyMpvConfBeforePlayback =>
      'Pas een door de gebruiker opgegeven mpv.conf toe voordat het afspelen begint';

  @override
  String get unsafeAdvancedMpvOptions => 'Onveilige geavanceerde mpv-opties';

  @override
  String get unsafeMpvOptionsDescription =>
      'Sta een bredere reeks mpv-opties toe. Kan het afspeelgedrag verstoren.';

  @override
  String get hardwareDecoding => 'Hardware-decodering';

  @override
  String get hardwareDecodingSubtitle =>
      'Kan de prestaties verbeteren, maar kan op sommige apparaten afspeelproblemen veroorzaken.';

  @override
  String get nextUpAndQueuing => 'Volgende en in de rij staan';

  @override
  String get nextUpDisplay => 'Volgende scherm';

  @override
  String get extended => 'Verlengd';

  @override
  String get minimal => 'Minimaal';

  @override
  String get nextUpTimeout => 'Time-out volgende keer';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Mediawachtrij';

  @override
  String get autoQueueNextEpisodes =>
      'Zet volgende afleveringen automatisch in de wachtrij';

  @override
  String get stillWatchingPrompt => 'Kijk nog steeds naar Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Na $episodes afleveringen / $hours u';
  }

  @override
  String get resumeAndSkip => 'Hervatten en overslaan';

  @override
  String get resumeRewind => 'Hervat terugspoelen';

  @override
  String get unpauseRewind => 'Hervat terugspoelen';

  @override
  String get fiveSeconds => '5 seconden';

  @override
  String get tenSeconds => '10 seconden';

  @override
  String get fifteenSeconds => '15 seconden';

  @override
  String get thirtySeconds => '30 seconden';

  @override
  String get skipBackLength => 'Lengte overslaan';

  @override
  String get skipForwardLength => 'Lengte vooruit overslaan';

  @override
  String get customMpvConfPath => 'Aangepast mpv.conf-pad';

  @override
  String get notSetMpvConf =>
      'Niet ingesteld. Moonfin zal een standaard mpv.conf proberen in app/data-mappen.';

  @override
  String get selectMpvConf => 'Selecteer mpv.conf';

  @override
  String get pathToMpvConf => '/pad/naar/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stijlinstellingen (grootte, kleur, offset) zijn van toepassing op tekstgebaseerde ondertitels (SRT, VTT, TTML). ASS/SSA-ondertitels gebruiken hun eigen ingebouwde stijl, tenzij \"ASS/SSA Direct Play\" is uitgeschakeld. Bitmap-ondertitels (PGS, DVB, VobSub) kunnen niet worden gerestyled.';

  @override
  String get defaultSubtitleLanguage => 'Standaard ondertiteltaal';

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
  String get defaultToNoSubtitles => 'Standaard ingesteld op Geen ondertitels';

  @override
  String get turnOffSubtitlesByDefault => 'Schakel ondertitels standaard uit';

  @override
  String get subtitleSize => 'Grootte ondertiteling';

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
  String get textFillColor => 'Tekstvulkleur';

  @override
  String get backgroundColor => 'Achtergrondkleur';

  @override
  String get textStrokeColor => 'Tekstlijnkleur';

  @override
  String get subtitleCustomization => 'Aanpassing van ondertitels';

  @override
  String get subtitleCustomizationDescription =>
      'Pas de weergave van ondertitels aan';

  @override
  String get subtitleMode => 'Ondertitelmodus';

  @override
  String get subtitleModeFlagged => 'Gemarkeerd';

  @override
  String get subtitleModeAlways => 'Altijd';

  @override
  String get subtitleModeForeign => 'Anderstalig';

  @override
  String get subtitleModeForced => 'Geforceerd';

  @override
  String get subtitleModeFlaggedDescription =>
      'Speelt tracks af die in de metagegevens van het mediabestand intern zijn gemarkeerd als \"default\" of \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Laadt en toont automatisch ondertitels telkens wanneer een video start.';

  @override
  String get subtitleModeForeignDescription =>
      'Schakelt ondertitels automatisch in als de standaard audiotrack in een vreemde taal is.';

  @override
  String get subtitleModeForcedDescription =>
      'Laadt alleen ondertitels die expliciet zijn gemarkeerd met de forced-metagegevensvlag.';

  @override
  String get subtitleModeNoneDescription =>
      'Schakelt het automatisch laden van ondertitels volledig uit.';

  @override
  String get fallbackSubtitleLanguage => 'Terugvaltaal voor ondertitels';

  @override
  String get subtitleStream => 'Ondertitelstream';

  @override
  String get subtitlePreviewText =>
      'De snelle bruine vos springt over de luie hond heen';

  @override
  String get verticalOffset => 'Verticale verschuiving';

  @override
  String get pgsDirectPlay => 'PGS Direct afspelen';

  @override
  String get directPlayPgsSubtitles => 'Direct afspelen van PGS-ondertitels';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct afspelen';

  @override
  String get directPlayAssSsaSubtitles =>
      'Direct afspelen van ASS/SSA-ondertitels';

  @override
  String get white => 'Wit';

  @override
  String get black => 'Zwart';

  @override
  String get yellow => 'Geel';

  @override
  String get green => 'Groen';

  @override
  String get cyan => 'Cyaan';

  @override
  String get red => 'Rood';

  @override
  String get transparent => 'Transparant';

  @override
  String get semiTransparentBlack => 'Semi-transparant zwart';

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
  String get global => 'Globaal';

  @override
  String get desktop => 'Bureaublad';

  @override
  String get mobile => 'Mobiel';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Profielinstellingen van $profile geladen.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Kan profielinstellingen van $profile niet laden.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokale instellingen gesynchroniseerd met profiel $profile.';
  }

  @override
  String get syncing => 'Synchroniseren...';

  @override
  String resetProfileTitle(String profile) {
    return 'Reset $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Dit verwijdert het profiel $profile van de server en zet alle opgeslagen instellingen op dit apparaat naar de standaardinstellingen.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Dit verwijdert elk opgeslagen profiel van de server en zet alle opgeslagen instellingen op dit apparaat naar de standaardinstellingen.';

  @override
  String profileReset(String profile) {
    return 'Reset het profiel $profile naar de standaardinstellingen.';
  }

  @override
  String get resetRatingsTitle => 'Reset de beoordelingen?';

  @override
  String get resetRatingsDescription =>
      'Dit zet alle beoordelingen naar de standaardinstellingen, ook de zoektermen en de volgordes.';

  @override
  String get ratingsReset =>
      'Reset de beoordelingen naar de standaardinstellingen.';

  @override
  String failedToResetProfile(String profile) {
    return 'Mislukt om het profiel $profile te resetten.';
  }

  @override
  String get profileSyncHidden => 'Profielsynchronisatie verborgen';

  @override
  String get enablePluginSyncDescription =>
      'Schakel Server Plugin Sync in Plugin-instellingen in om hier profielinstellingen weer te geven.';

  @override
  String get quality => 'Kwaliteit';

  @override
  String get defaultDownloadQuality => 'Standaard downloadkwaliteit';

  @override
  String get network => 'Netwerk';

  @override
  String get wifiOnlyDownloads => 'Alleen wifi-downloads';

  @override
  String get tvOfflineDownloads => 'Schakel offline-downloads in';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Laat downloadacties zien op itempagina\'s';

  @override
  String get reportDownloadsActivity => 'Downloads op de server tonen';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Laat de serverbeheerder uw getranscodeerde downloads in het dashboard zien';

  @override
  String get onlyDownloadOnWifi =>
      'Alleen downloaden wanneer verbonden met WiFi';

  @override
  String get storage => 'Opslag';

  @override
  String get storageUsed => 'Opslag gebruikt';

  @override
  String get manage => 'Beheren';

  @override
  String get calculating => 'Berekenen...';

  @override
  String get downloadLocation => 'Locatie downloaden';

  @override
  String get defaultLabel => 'Standaard';

  @override
  String get sdCard => 'SD-kaart';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android laat Moonfin alleen toe in de folders die door Moonfin gemaakt zijn. Dit apparaat heeft geen verwijderbare opslag. Zet \'opslaan naar downloadmap\' aan om de downloads op te slaan op een plek waar Moonfin bij kan.';

  @override
  String get saveToDownloadsFolder => 'Opslaan in de map Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — zichtbaar voor andere apps';

  @override
  String get dangerZone => 'Gevarenzone';

  @override
  String get clearAllDownloads => 'Wis alle downloads';

  @override
  String get original => 'Origineel';

  @override
  String get changeDownloadLocation => 'Wijzig de downloadlocatie';

  @override
  String get changeDownloadLocationDescription =>
      'Nieuwe downloads worden in de geselecteerde map opgeslagen. Bestaande downloads blijven op hun huidige locatie en kunnen worden beheerd via Opslaginstellingen.';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get cannotWriteToFolder =>
      'Kan niet naar de geselecteerde map schrijven. Kies een andere locatie of verleen opslagrechten.';

  @override
  String get saveToDownloadsFolderQuestion => 'Opslaan in de map Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Gedownloade media worden opgeslagen in Downloads/Moonfin op uw apparaat. Deze bestanden zijn zichtbaar voor andere apps, zoals uw galerij of muziekspeler.\n\nBestaande downloads blijven op hun huidige locatie.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoderen: resterende tijd niet beschikbaar';

  @override
  String get enable => 'Inschakelen';

  @override
  String get clearAllDownloadsWarning =>
      'Hiermee worden alle gedownloade media verwijderd en dit kan niet ongedaan worden gemaakt.';

  @override
  String get clearAll => 'Alles wissen';

  @override
  String get navigationStyle => 'Navigatiestijl';

  @override
  String get topBar => 'Bovenste balk';

  @override
  String get leftSidebar => 'Linker zijbalk';

  @override
  String get showShuffleButton => 'Shuffle-knop weergeven';

  @override
  String get showGenresButton => 'Knop Genres weergeven';

  @override
  String get showFavoritesButton => 'Knop Favorieten tonen';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Bibliotheken weergeven in de werkbalk';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Navigatiebalklabels altijd uitklappen';

  @override
  String get showSeerrButton => 'Seerr-knop tonen';

  @override
  String get navbarOpacity => 'Navigatiebalkdekking';

  @override
  String get navbarColor => 'Navigatiebalk Kleur';

  @override
  String get gray => 'Grijs';

  @override
  String get darkBlue => 'Donkerblauw';

  @override
  String get purple => 'Paars';

  @override
  String get teal => 'Wintertaling';

  @override
  String get navy => 'Marine';

  @override
  String get charcoal => 'Houtskool';

  @override
  String get brown => 'Bruin';

  @override
  String get darkRed => 'Donkerrood';

  @override
  String get darkGreen => 'Donkergroen';

  @override
  String get slate => 'Leisteen';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotheekvertoning';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatuur';

  @override
  String get bannerLabel => 'Banier';

  @override
  String get overridePerLibrarySettings =>
      'Instellingen per bibliotheek overschrijven';

  @override
  String get applyImageTypeToAllLibraries =>
      'Pas het afbeeldingstype toe op alle bibliotheken';

  @override
  String get multiServerLibraries => 'Bibliotheken met meerdere servers';

  @override
  String get showLibrariesFromAllServers =>
      'Toon bibliotheken van alle verbonden servers';

  @override
  String get mergeRecentRowsByType =>
      'Voeg de recente items bij elkaar per type';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Voeg verschillende bibliotheken met dezelfde categorie samen bij de balken \'Recent toegevoegd\' en \'Recent uitgekomen\'.';

  @override
  String get libraryView => 'Bibliotheekmodus';

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
  String get groupItemsIntoCollections => 'Items groeperen in collecties';

  @override
  String get hideCollectionAssociatedItems =>
      'Verberg bibliotheekitems die bij een collectie horen tijdens het bladeren door bibliotheken';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Melding over bibliotheekgroepering';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Om deze instelling te gebruiken, moet u ervoor zorgen dat de bibliotheekinstellingen \"Group movies into collections\" en/of \"Group shows into collections\" zijn ingeschakeld onder de weergave-instellingen van uw bibliotheek op uw Jellyfin- of Emby-server.';

  @override
  String get libraryVisibility => 'Zichtbaarheid van de bibliotheek';

  @override
  String get libraryVisibilityDescription =>
      'Schakel de zichtbaarheid van de startpagina per bibliotheek in. Start Moonfin opnieuw op zodat de wijzigingen van kracht worden.';

  @override
  String get showInNavigation => 'Toon in navigatie';

  @override
  String get showInLatestMedia =>
      'Toon in de recentelijke toegevoegd/vrijgegeven media';

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
  String get sourceLibraries => 'Bronbibliotheken';

  @override
  String get sourceCollections => 'Broncollecties';

  @override
  String get excludedGenres => 'Uitgesloten genres';

  @override
  String get selectAll => 'Selecteer Alles';

  @override
  String itemsSelected(int count) {
    return '$count geselecteerd';
  }

  @override
  String get mediaBar => 'Mediabalk';

  @override
  String get mediaSources => 'Mediabronnen';

  @override
  String get behavior => 'Gedrag';

  @override
  String get seconds => 'seconden';

  @override
  String get mediaBarMode => 'Mediabalkstijl';

  @override
  String get mediaBarModeDescription =>
      'Kies uit verschillende stijlen voor de mediabalk of schakel de mediabalk uit';

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
  String get mediaBarModeOff => 'Uit';

  @override
  String get mediaBarModeBookshelf => 'Boekenplank';

  @override
  String get mediaBarModeGallery => 'Gallerij';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Mediabalk inschakelen';

  @override
  String get showFeaturedContentSlideshow =>
      'Toon diavoorstelling met uitgelichte inhoud op Home';

  @override
  String get contentType => 'Inhoudstype';

  @override
  String get mediaBarSourceType => 'Bron';

  @override
  String get mediaBarSourceRandom => 'Willekeurig';

  @override
  String get moviesAndTvShows => 'Films en tv-programma\'s';

  @override
  String get moviesOnly => 'Alleen films';

  @override
  String get tvShowsOnly => 'Alleen tv-programma\'s';

  @override
  String get itemCount => 'Aantal artikelen';

  @override
  String get noneSelected => 'Geen geselecteerd';

  @override
  String get noneExcluded => 'Geen uitgesloten';

  @override
  String get autoAdvance => 'Automatische voortgang';

  @override
  String get autoAdvanceSlides => 'Automatisch doorgaan naar de volgende dia';

  @override
  String get autoAdvanceInterval => 'Interval voor automatisch vooruitgaan';

  @override
  String get trailerPreview => 'Trailervoorbeeld';

  @override
  String get autoPlayTrailers =>
      'Trailers worden na 3 seconden automatisch afgespeeld in de mediabalk';

  @override
  String get trailerAudio => 'Traileraudio';

  @override
  String get enableTrailerAudio =>
      'Audio inschakelen voor trailers in de mediabalk';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailerondertitels';

  @override
  String get trailerCaptionsDescription =>
      'Laat ondertitels zien in de YouTube-trailers in de mediabalk';

  @override
  String get episodePreview => 'Afleveringsvoorbeeld';

  @override
  String get mediaPreview => 'Mediavoorbeeld';

  @override
  String get episodePreviewDescription =>
      'Speel een inline preview van 30 seconden op gefocuste, zwevende of lang ingedrukte kaarten';

  @override
  String get mediaPreviewDescription =>
      'Speel een inline preview van 30 seconden op gefocuste, zwevende of lang ingedrukte kaarten';

  @override
  String get previewAudio => 'Voorbeeld van audio';

  @override
  String get enablePreviewAudio => 'Schakel audio in voor previews van media';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Recent toegevoegde media';

  @override
  String get recentlyReleased => 'Onlangs uitgebracht';

  @override
  String get recentlyReleasedSeriesType =>
      'Recent uitgebrachte series sorteren';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sorteer recent uitgebrachte serie thuisrijen naar serie, nieuwste seizoen, of meeste recente uitzending';

  @override
  String get myMedia => 'Mijn media';

  @override
  String get myMediaSmall => 'Mijn media (klein)';

  @override
  String get continueWatching => 'Ga door met kijken';

  @override
  String get resumeAudio => 'Audio hervatten';

  @override
  String get resumeBooks => 'Hervat boeken';

  @override
  String get activeRecordings => 'Actieve opnames';

  @override
  String get playlists => 'Afspeellijsten';

  @override
  String get liveTV => 'Live-tv';

  @override
  String get favoriteChannels => 'Favoriete kanalen';

  @override
  String get resetToDefaults => 'Terugzetten naar standaardwaarden';

  @override
  String get homeRowPosterSize => 'Posterformaat thuisrij';

  @override
  String get configureImageTypeForEachRow =>
      'Configureer het afbeeldingstype voor elke ingeschakelde thuisrij';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Samenvoegen, doorgaan met kijken en volgende';

  @override
  String get combineBothRows => 'Combineer beide rijen tot één startgedeelte';

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
  String get nextUpMaxDays => 'Maximaal aantal dagen in \'Volgende\'';

  @override
  String get nextUpMaxDaysDescription =>
      'Hoe lang een aflevering blijft staan bij \'Volgende\' nadat je het voor het laatst bekeken hebt';

  @override
  String daysValue(int days) {
    return '$days dagen';
  }

  @override
  String get fullScreenRows => 'Uitgeklapte startrijen';

  @override
  String get fullScreenRowsDescription =>
      'Beperk startrijen tot 1 rij per scherm';

  @override
  String get homeRowsPadding => 'Thuisrij vulling';

  @override
  String get homeRowsPaddingDescription =>
      'Vulling tussen thuisrijen aanpassen';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

  @override
  String get perRowSettings => 'Instellingen per rij';

  @override
  String get autoLogin => 'Automatisch inloggen';

  @override
  String get lastUser => 'Laatste gebruiker';

  @override
  String get currentUser => 'Huidige gebruiker';

  @override
  String get alwaysAuthenticate => 'Altijd authenticeren';

  @override
  String get requirePasswordWithToken =>
      'Wachtwoord vereisen, zelfs met opgeslagen token';

  @override
  String get confirmExit => 'Bevestig Afsluiten';

  @override
  String get showConfirmationBeforeExiting =>
      'Toon bevestiging voordat u afsluit';

  @override
  String get blockContentWithRatings =>
      'Blokkeer inhoud met de volgende beoordelingen:';

  @override
  String get noContentRatingsFound =>
      'Er zijn nog geen inhoudsbeoordelingen gevonden op deze server.';

  @override
  String get couldNotLoadServerRatings =>
      'Kan serverbeoordelingen niet laden. Alleen opgeslagen beoordelingen worden weergegeven.';

  @override
  String get couldNotRefreshRatings =>
      'Kan de beoordelingen van de server niet vernieuwen. Opgeslagen beoordelingen weergeven.';

  @override
  String get enablePinCode => 'Pincode inschakelen';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Een pincode vereisen voor toegang tot uw account';

  @override
  String get changePin => 'Wijzig pincode';

  @override
  String get setNewPinCode => 'Stel een nieuwe pincode in';

  @override
  String get removePin => 'Pincode verwijderen';

  @override
  String get removePinProtection => 'Verwijder de pincodebeveiliging';

  @override
  String get screensaver => 'Schermbeveiliging';

  @override
  String get inAppScreensaver => 'In-app-screensaver';

  @override
  String get enableBuiltInScreensaver => 'Schakel de ingebouwde screensaver in';

  @override
  String get mode => 'Modus';

  @override
  String get libraryArt => 'Bibliotheek kunst';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Klok';

  @override
  String get timeout => 'Time-out';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Dimniveau';

  @override
  String get maxAgeRating => 'Maximale leeftijdsclassificatie';

  @override
  String get any => 'Elk';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Leeftijdsclassificatie vereisen';

  @override
  String get onlyShowRatedContent => 'Toon alleen beoordeelde inhoud';

  @override
  String get displayClockDuringScreensaver =>
      'Klok weergeven tijdens screensaver';

  @override
  String get clockModeStatic => 'Statisch';

  @override
  String get clockModeBouncing => 'Stuiterend';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (critici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Publiek)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritisch';

  @override
  String get metacriticUser => 'Metacritic (gebruiker)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MijnAnimeLijst';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Gemeenschapsbeoordeling';

  @override
  String get ratings => 'Beoordelingen';

  @override
  String get additionalRatings => 'Aanvullende beoordelingen';

  @override
  String get showMdbListAndTmdbRatings => 'Toon MDBList- en TMDB-beoordelingen';

  @override
  String get ratingLabels => 'Beoordelingslabels';

  @override
  String get showLabelsNextToIcons =>
      'Toon labels naast beoordelingspictogrammen';

  @override
  String get ratingBadges => 'Beoordelingsbadges';

  @override
  String get showDecorativeBadges =>
      'Toon decoratieve badges achter beoordelingen';

  @override
  String get episodeRatings => 'Afleveringsbeoordelingen';

  @override
  String get showRatingsOnEpisodes =>
      'Toon beoordelingen voor afzonderlijke afleveringen';

  @override
  String get ratingSources => 'Beoordelingsbronnen';

  @override
  String get ratingSourcesDescription =>
      'Schakel de beoordelingsbronnen in die in de app worden weergegeven en herschik ze';

  @override
  String get pluginDetected => 'Plug-in gedetecteerd';

  @override
  String get pluginNotDetected => 'Plug-in niet gedetecteerd';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplug-in wordt momenteel niet gedetecteerd. Lokale instellingen gebruiken nog steeds hun opgeslagen waarden of ingebouwde standaardinstellingen.';

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
  String get recentRequests => 'Recente verzoeken';

  @override
  String get recentlyAdded => 'Recent toegevoegd';

  @override
  String get trending => 'Populair';

  @override
  String get popularMovies => 'Populaire films';

  @override
  String get movieGenres => 'Filmgenres';

  @override
  String get upcomingMovies => 'Aankomende films';

  @override
  String get studios => 'Studio\'s';

  @override
  String get popularSeries => 'Populaire serie';

  @override
  String get seriesGenres => 'Serie-genres';

  @override
  String get upcomingSeries => 'Aankomende serie';

  @override
  String get networks => 'Netwerken';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres en tags';

  @override
  String get seerrDiscoveryRows => 'Seerr-ontdekkingsrijen';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Jouw kijklijst';

  @override
  String get resetRowsToDefaults => 'Zet rijen terug naar de standaardwaarden';

  @override
  String get enableSeerr => 'Schakel Seerr in';

  @override
  String get showSeerrInNavigation =>
      'Seerr weergeven in navigatie (vereist serverplug-in)';

  @override
  String get seerrUnavailable =>
      'Niet beschikbaar omdat de serverplug-in Seerr-ondersteuning is uitgeschakeld.';

  @override
  String get nsfwFilter => 'NSFW-filter';

  @override
  String get hideAdultContent =>
      'Inhoud voor volwassenen verbergen in de resultaten';

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
  String get seerrNotificationsSection => 'Meldingen';

  @override
  String get seerrNotifyNewRequestsTitle => 'Meldingen voor nieuwe verzoeken';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Waarschuw mij wanneer iemand een verzoek indient';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Verzoekupdates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Goedgekeurd, afgewezen en toegevoegd aan uw bibliotheek';

  @override
  String get seerrNotifyIssuesTitle => 'Probleemupdates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Nieuwe problemen, reacties en oplossingen';

  @override
  String get seerrNotifyNewMediaTitle => 'Nieuwe media toegevoegd';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Alle nieuwe media toegevoegd aan de serverbibliotheek';

  @override
  String loggedInAs(String username) {
    return 'Ingelogd als: $username';
  }

  @override
  String get discoverRows => 'Seerr-ontdekkingspagina';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Schakel de rijen in die je op de hoofdpagina van Seerr wilt zien. Sleep om de volgorde te wijzigen. De aangepaste volgorde wordt gesynchroniseerd met Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Schakel de rijen in die je op de hoofdpagina van Seerr wilt zien. Sleep om de volgorde te wijzigen. De aangepaste volgorde wordt gesynchroniseerd met Moonbase.';

  @override
  String get enabled => 'Ingeschakeld';

  @override
  String get hidden => 'Verborgen';

  @override
  String get aboutTitle => 'Over';

  @override
  String versionValue(String version) {
    return 'Versie $version';
  }

  @override
  String get openSourceLicenses => 'Open Source-licenties';

  @override
  String get sourceCode => 'Broncode';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Controleer nu op updates';

  @override
  String get checksLatestDesktopRelease =>
      'Controleert de nieuwste desktopversie voor dit platform';

  @override
  String get youAreUpToDate => 'Je bent op de hoogte.';

  @override
  String get couldNotCheckForUpdates =>
      'Kan momenteel niet controleren op updates.';

  @override
  String get noCompatibleUpdate =>
      'Er is geen compatibel updatepakket gevonden voor dit platform.';

  @override
  String get updateChecksNotSupported =>
      'Updatecontroles worden niet ondersteund op dit platform.';

  @override
  String get updateNotificationsDisabled =>
      'Updatemeldingen zijn uitgeschakeld.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Wacht even voordat u opnieuw controleert.';

  @override
  String get latestUpdateAlreadyShown => 'Laatste update werd al getoond.';

  @override
  String get updateAvailable => 'Update beschikbaar.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update beschikbaar: v$version';
  }

  @override
  String get updateNotifications => 'Meldingen bijwerken';

  @override
  String get showWhenUpdatesAvailable =>
      'Laat zien wanneer er updates beschikbaar zijn';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version beschikbaar';
  }

  @override
  String get readReleaseNotes => 'Lees de releaseopmerkingen';

  @override
  String get downloadingUpdate => 'Update downloaden...';

  @override
  String get updateDownloadFailed =>
      'Updatedownload mislukt. Probeer het opnieuw.';

  @override
  String get openReleasesPage => 'Open de Releasepagina';

  @override
  String get navigation => 'Navigatie';

  @override
  String get watchedIndicatorsBackdrops => 'Bekeken indicatoren, achtergronden';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Focuskleur, bekeken indicatoren, achtergronden';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigatiebalkstijl, werkbalkknoppen, uiterlijk';

  @override
  String get featuredContentAppearance => 'Uitgelichte inhoud, uiterlijk';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limiet afbeeldingscache';

  @override
  String get clearImageCache => 'Afbeeldingscache wissen';

  @override
  String get imageCacheCleared => 'Afbeeldingscache gewist';

  @override
  String get clear => 'Wissen';

  @override
  String get browse => 'Blader';

  @override
  String get noResults => 'Geen resultaten';

  @override
  String get seerrAvailableStatus => 'Beschikbaar';

  @override
  String get seerrRequestedStatus => 'Gevraagd';

  @override
  String get seerrDownloading => 'Downloaden';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Downloaden · $done / $total';
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
    return 'Downloaden · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importeren';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr-instellingen';

  @override
  String get requestMore => 'Vraag meer aan';

  @override
  String get requestMore4k => 'Vraag om meer in 4K-resolutie';

  @override
  String get request => 'Verzoek';

  @override
  String get request4k => 'Vraag om 4K';

  @override
  String get requested4k => '4K aangevraagd';

  @override
  String get cancelRequest => 'Aanvraag annuleren';

  @override
  String get cancelRequest4k => 'Verwijder de 4K-vraag';

  @override
  String get playInMoonfin => 'Speel in Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Aangevraagd door $name';
  }

  @override
  String get manageRequests => 'Bewerk aanvragen';

  @override
  String get watchlist => 'Kijklijst';

  @override
  String get onWatchlist => 'Op de kijklijst';

  @override
  String get approve => 'Goedkeuren';

  @override
  String get declineAction => 'Afwijzen';

  @override
  String get similar => 'Vergelijkbaar';

  @override
  String get recommendations => 'Aanbevelingen';

  @override
  String cancelRequestForTitle(String title) {
    return 'Verzoek voor \"$title\" annuleren?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '$count verzoeken voor \"$title\" annuleren?';
  }

  @override
  String get keep => 'Houden';

  @override
  String get itemNotFoundInLibrary =>
      'Item niet gevonden in uw Moonfin-bibliotheek';

  @override
  String get errorSearchingLibrary => 'Fout bij zoeken in bibliotheek';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Opbrengst: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type aanvragen';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Vraag om 4K $type';
  }

  @override
  String get submitRequest => 'Verzoek indienen';

  @override
  String get allSeasons => 'Alle seizoenen';

  @override
  String get seerrSeriesContinuing =>
      'Serie gaat verder - Toekomstige seizoenen kunnen aangevraagd worden';

  @override
  String get advancedOptions => 'Geavanceerde opties';

  @override
  String get noServiceServersConfigured => 'Geen serviceservers geconfigureerd';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Kwaliteitsprofiel';

  @override
  String get rootFolder => 'Hoofdmap';

  @override
  String get showMore => 'Toon meer';

  @override
  String get appearances => 'Optredens';

  @override
  String get crewSection => 'Bemanning';

  @override
  String ageValue(int age) {
    return 'leeftijd $age';
  }

  @override
  String get noRequests => 'Geen verzoeken';

  @override
  String get pendingStatus => 'In behandeling';

  @override
  String get declinedStatus => 'Afgewezen';

  @override
  String get partiallyAvailable => 'Gedeeltelijk beschikbaar';

  @override
  String get downloadingStatus => 'Downloaden';

  @override
  String get approvedStatus => 'Goedgekeurd';

  @override
  String get notRequestedStatus => 'Niet aangevraagd';

  @override
  String get blocklistedStatus => 'Geblokkeerd';

  @override
  String get deletedStatus => 'Verwijderd';

  @override
  String get failedStatus => 'Mislukt';

  @override
  String get processingStatus => 'Wordt verwerkt';

  @override
  String modifiedByName(String name) {
    return 'Gewijzigd door $name';
  }

  @override
  String get completedStatus => 'Voltooid';

  @override
  String get requestErrorDuplicate => 'Deze titel is al aangevraagd';

  @override
  String get requestErrorQuota => 'Verzoeklimiet bereikt';

  @override
  String get requestErrorBlocklisted => 'Deze titel staat op de blokkeerlijst';

  @override
  String get requestErrorNoSeasons => 'Geen seizoenen meer om aan te vragen';

  @override
  String get requestErrorPermission =>
      'U hebt geen toestemming om dit verzoek te doen';

  @override
  String get seerrRequestsTitle => 'Verzoeken';

  @override
  String get seerrIssuesTitle => 'Problemen';

  @override
  String get sortNewest => 'Nieuwste';

  @override
  String get sortLastModified => 'Laatst gewijzigd';

  @override
  String get noIssues => 'Geen problemen';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Nog $remaining van $limit filmverzoeken over';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Nog $remaining van $limit seizoensverzoeken over';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Onderdeel van $name';
  }

  @override
  String get viewCollection => 'Collectie bekijken';

  @override
  String get requestCollection => 'Collectie aanvragen';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total films · $available beschikbaar';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count films aanvragen';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$current van $total aanvragen...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count films aangevraagd';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok van $total films aangevraagd';
  }

  @override
  String get collectionAllRequested =>
      'Alle films zijn al beschikbaar of aangevraagd';

  @override
  String get reportIssue => 'Probleem melden';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Wat is er mis?';

  @override
  String get allEpisodes => 'Alle afleveringen';

  @override
  String get episode => 'Aflevering';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Opgelost';

  @override
  String get resolveAction => 'Oplossen';

  @override
  String get reopenAction => 'Heropenen';

  @override
  String reportedByName(String name) {
    return 'Gemeld door $name';
  }

  @override
  String commentsCount(int count) {
    return '$count reacties';
  }

  @override
  String get addComment => 'Een reactie toevoegen';

  @override
  String get deleteIssueConfirm => 'Dit probleem verwijderen?';

  @override
  String get submitReport => 'Melding verzenden';

  @override
  String get tmdbScore => 'TMDB-score';

  @override
  String get releaseDateLabel => 'Releasedatum';

  @override
  String get firstAirDateLabel => 'Eerste uitzenddatum';

  @override
  String get revenueLabel => 'Winst';

  @override
  String get runtimeLabel => 'Looptijd';

  @override
  String get budgetLabel => 'Begroting';

  @override
  String get originalLanguageLabel => 'Originele taal';

  @override
  String get seasonsLabel => 'Seizoenen';

  @override
  String get episodesLabel => 'Afleveringen';

  @override
  String get access => 'Toegang';

  @override
  String get add => 'Toevoegen';

  @override
  String get address => 'Adres';

  @override
  String get analytics => 'Analyses';

  @override
  String get catalog => 'Catalogus';

  @override
  String get content => 'Inhoud';

  @override
  String get copy => 'Kopiëren';

  @override
  String get create => 'Creëren';

  @override
  String get disable => 'Uitzetten';

  @override
  String get done => 'Klaar';

  @override
  String get edit => 'Bewerken';

  @override
  String get encoding => 'Codering';

  @override
  String get error => 'Fout';

  @override
  String get forward => 'Vooruit';

  @override
  String get general => 'Algemeen';

  @override
  String get go => 'Gaan';

  @override
  String get install => 'Installeren';

  @override
  String get installed => 'Geïnstalleerd';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Naam';

  @override
  String get networking => 'Netwerken';

  @override
  String get next => 'Volgende';

  @override
  String get path => 'Pad';

  @override
  String get paused => 'Gepauzeerd';

  @override
  String get permissions => 'Machtigingen';

  @override
  String get processing => 'Verwerking';

  @override
  String get profile => 'Profiel';

  @override
  String get provider => 'Aanbieder';

  @override
  String get refresh => 'Vernieuwen';

  @override
  String get remote => 'Afstandsbediening';

  @override
  String get rename => 'Hernoemen';

  @override
  String get revoke => 'Herroepen';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Root';

  @override
  String get run => 'Uitvoeren';

  @override
  String get search => 'Zoeken';

  @override
  String get select => 'Selecteer';

  @override
  String get send => 'Versturen';

  @override
  String get sessions => 'Sessies';

  @override
  String get set => 'Set';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stoppen';

  @override
  String get streaming => 'Streamen';

  @override
  String get time => 'Tijd';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Verwijderen';

  @override
  String get up => 'Omhoog';

  @override
  String get update => 'Bijwerken';

  @override
  String get upload => 'Uploaden';

  @override
  String get unmute => 'Dempen opheffen';

  @override
  String get mute => 'Dempen';

  @override
  String get branding => 'Merk';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analyses';

  @override
  String get adminDrawerSettings => 'Instellingen';

  @override
  String get adminDrawerBranding => 'Merk';

  @override
  String get adminDrawerUsers => 'Gebruikers';

  @override
  String get adminDrawerLibraries => 'Bibliotheken';

  @override
  String get adminDrawerDisplay => 'Weergave';

  @override
  String get adminDrawerMetadata => 'Metagegevens';

  @override
  String get adminDrawerNfo => 'NFO-instellingen';

  @override
  String get adminDrawerTranscoding => 'Transcoderen';

  @override
  String get adminDrawerResume => 'Hervatten';

  @override
  String get adminDrawerStreaming => 'Streamen';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Apparaten';

  @override
  String get adminDrawerActivity => 'Activiteit';

  @override
  String get adminDrawerNetworking => 'Netwerken';

  @override
  String get adminDrawerApiKeys => 'API-sleutels';

  @override
  String get adminDrawerBackups => 'Back-ups';

  @override
  String get adminDrawerLogs => 'Logboeken';

  @override
  String get adminDrawerScheduledTasks => 'Geplande taken';

  @override
  String get adminDrawerPlugins => 'Plug-ins';

  @override
  String get adminDrawerRepositories => 'Opslagplaatsen';

  @override
  String get adminDrawerLiveTv => 'Live-tv';

  @override
  String get adminExitTooltip => 'Sluit beheerder af';

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
  String get adminDashboardLoadFailed => 'Kan dashboard niet laden';

  @override
  String get adminMediaOverview => 'Media-overzicht';

  @override
  String get adminMediaTotalsError =>
      'Kan de mediatotalen van de server niet laden.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Lees snel hoeveel inhoud er op deze server staat.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Beschikbare plug-in-updates: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plug-ins die opnieuw opstarten vereisen: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Mislukte geplande taken: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Mediadistributie';

  @override
  String get analyticsVideoCodecs => 'Videocodecs';

  @override
  String get analyticsAudioCodecs => 'Audiocodecs';

  @override
  String get analyticsContainers => 'Containers';

  @override
  String get analyticsTopGenres => 'Topgenres';

  @override
  String get analyticsReleaseYears => 'Release jaren';

  @override
  String get analyticsContentRatings => 'Inhoudsbeoordelingen';

  @override
  String get analyticsRuntimeBuckets => 'Runtime-buckets';

  @override
  String get analyticsFileFormats => 'Bestandsformaten';

  @override
  String get analyticsNoData => 'Geen gegevens beschikbaar.';

  @override
  String get adminServerInfo => 'Serverinfo';

  @override
  String get adminRestartPending => 'Opnieuw starten in behandeling';

  @override
  String get adminServerPaths => 'Serverpaden';

  @override
  String get adminServerActions => 'Serveracties';

  @override
  String get adminRestartServer => 'Start de server opnieuw';

  @override
  String get adminShutdownServer => 'Server afsluiten';

  @override
  String get adminLibraryScanStarted => 'Bibliotheekscan gestart';

  @override
  String errorGeneric(String error) {
    return 'Fout: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Het opnieuw opstarten van de server wordt uitgevoerd';

  @override
  String get adminServerRebootMessage =>
      'Het opnieuw opstarten van de server wordt uitgevoerd. Start Moonfin opnieuw op';

  @override
  String get adminActiveSessions => 'Actieve sessies';

  @override
  String get adminSessionsLoadFailed => 'Kan sessies niet laden';

  @override
  String get adminNoActiveSessions => 'Geen actieve sessies';

  @override
  String get adminRecentActivity => 'Recente activiteit';

  @override
  String get adminNoRecentActivity => 'Geen recente activiteit';

  @override
  String adminCommandFailed(String error) {
    return 'Opdracht mislukt: $error';
  }

  @override
  String get adminSendMessage => 'Bericht verzenden';

  @override
  String get adminMessageTextHint => 'Berichttekst';

  @override
  String get adminSetVolume => 'Volume instellen';

  @override
  String get sessionPrev => 'Vorige';

  @override
  String get sessionRewind => 'Terugspoelen';

  @override
  String get sessionForward => 'Vooruit';

  @override
  String get sessionNext => 'Volgende';

  @override
  String get sessionVolumeDown => 'Vol-';

  @override
  String get sessionVolumeUp => 'Vol+';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Nu aan het spelen';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Acties';

  @override
  String get videoCodec => 'Videocodec';

  @override
  String get audioCodec => 'Audiocodec';

  @override
  String get hwAccel => 'HW-versnelling';

  @override
  String get completion => 'Voltooiing';

  @override
  String get adminClearDates => 'Duidelijke data';

  @override
  String get adminActivitySeverityAll => 'Alle ernstniveaus';

  @override
  String get adminActivityDateRange => 'Datumbereik';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Kan activiteitenlogboek niet laden: $error';
  }

  @override
  String get adminNoActivityEntries => 'Geen activiteiteninvoer';

  @override
  String get adminEditDeviceName => 'Apparaatnaam bewerken';

  @override
  String get adminCustomName => 'Aangepaste naam';

  @override
  String get adminDeviceNameUpdated => 'Apparaatnaam bijgewerkt';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Kan apparaat niet bijwerken: $error';
  }

  @override
  String get adminDeleteDevice => 'Apparaat verwijderen';

  @override
  String get adminDeviceDeleted => 'Apparaat verwijderd';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Kan apparaat niet verwijderen: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Apparaat \'$name\' verwijderen? De gebruiker moet zich op dit apparaat opnieuw aanmelden.';
  }

  @override
  String get adminDeleteAllDevices => 'Alle apparaten verwijderen';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count apparaten verwijderen? Betrokken gebruikers moeten zich opnieuw aanmelden. Uw huidige apparaat wordt niet beïnvloed.';
  }

  @override
  String get adminDevicesDeletedAll => 'Apparaten verwijderd';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Enkele apparaten verwijderd; $count konden niet worden verwijderd.';
  }

  @override
  String get adminDevicesLoadFailed => 'Kan apparaten niet laden';

  @override
  String get adminSearchDevices => 'Zoek apparaten';

  @override
  String get adminThisDevice => 'Dit apparaat';

  @override
  String get adminEditName => 'Naam bewerken';

  @override
  String get adminLibrariesLoadFailed => 'Kan bibliotheken niet laden';

  @override
  String get adminNoLibraries => 'Geen bibliotheken geconfigureerd';

  @override
  String get adminScanAllLibraries => 'Scan alle bibliotheken';

  @override
  String get adminAddLibrary => 'Bibliotheek toevoegen';

  @override
  String adminScanFailed(String error) {
    return 'Kan scan niet starten: $error';
  }

  @override
  String get adminRenameLibrary => 'Naam bibliotheek wijzigen';

  @override
  String get adminNewName => 'Nieuwe naam';

  @override
  String adminLibraryRenamed(String name) {
    return 'Bibliotheek hernoemd naar \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Hernoemen mislukt: $error';
  }

  @override
  String get adminDeleteLibrary => 'Bibliotheek verwijderen';

  @override
  String adminLibraryDeleted(String name) {
    return 'Bibliotheek \"$name\" verwijderd';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kan bibliotheek niet verwijderen: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Kan pad niet toevoegen: $error';
  }

  @override
  String get adminRemovePath => 'Pad verwijderen';

  @override
  String adminRemovePathConfirm(String path) {
    return '\"$path\" uit deze bibliotheek verwijderen?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Kan pad niet verwijderen: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kan bibliotheek niet laden';

  @override
  String get adminNoMediaPaths => 'Geen mediapaden geconfigureerd';

  @override
  String get adminAddPath => 'Pad toevoegen';

  @override
  String get adminBrowseFilesystem => 'Blader door het serverbestandssysteem:';

  @override
  String get adminPreferredMetadataLanguage => 'Voorkeurstaal voor metadata';

  @override
  String get adminMetadataLanguageHint => 'bijv. nl, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metagegevens landcode';

  @override
  String get adminMetadataCountryHint => 'bijv. VS, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Paden';

  @override
  String get adminLibraryTabOptions => 'Opties';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metagegevensbewaarders';

  @override
  String get adminLibSubtitleDownloaders => 'Ondertiteldownloaders';

  @override
  String get adminLibLyricDownloaders => 'Songtekstdownloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metagegevensdownloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Afbeeldingsophalers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Deze server biedt geen downloaders voor dit bibliotheektype.';

  @override
  String get adminLibrarySectionGeneral => 'Algemeen';

  @override
  String get adminLibrarySectionMetadata => 'Metagegevens';

  @override
  String get adminLibrarySectionEmbedded => 'Ingesloten informatie';

  @override
  String get adminLibrarySectionSubtitles => 'Ondertitels';

  @override
  String get adminLibrarySectionImages => 'Afbeeldingen';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Muziek';

  @override
  String get adminLibrarySectionMovies => 'Films';

  @override
  String get adminLibRealtimeMonitor => 'Realtimemonitoring inschakelen';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detecteer bestandswijzigingen en verwerk ze automatisch.';

  @override
  String get adminLibEnablePhotos => 'Foto\'s weergeven';

  @override
  String get adminLibSaveLocalMetadata => 'Afbeeldingen opslaan in mediamappen';

  @override
  String get adminLibRefreshInterval => 'Metagegevens automatisch vernieuwen';

  @override
  String get adminLibRefreshNever => 'Nooit';

  @override
  String get adminLibDefault => 'Standaard';

  @override
  String get adminLibDisplayTitle => 'Weergave';

  @override
  String get adminLibDisplaySection => 'Bibliotheekweergave';

  @override
  String get adminLibFolderView =>
      'Een mapweergave tonen voor gewone mediamappen';

  @override
  String get adminLibSpecialsInSeasons =>
      'Specials tonen binnen het seizoen waarin ze zijn uitgezonden';

  @override
  String get adminLibGroupMovies => 'Films groeperen in collecties';

  @override
  String get adminLibGroupShows => 'Series groeperen in collecties';

  @override
  String get adminLibExternalSuggestions =>
      'Externe inhoud tonen bij suggesties';

  @override
  String get adminLibDateAddedSection => 'Gedrag van datum toegevoegd';

  @override
  String get adminLibDateAddedLabel => 'Datum toegevoegd overnemen van';

  @override
  String get adminLibDateAddedImport =>
      'Datum waarop het in de bibliotheek is gescand';

  @override
  String get adminLibDateAddedFile => 'Datum waarop het bestand is aangemaakt';

  @override
  String get adminLibMetadataTitle => 'Metagegevens en afbeeldingen';

  @override
  String get adminLibMetadataLangSection => 'Voorkeurstaal voor metadata';

  @override
  String get adminLibChaptersSection => 'Hoofdstukken';

  @override
  String get adminLibDummyChapterDuration =>
      'Duur van tijdelijke hoofdstukken (seconden)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Lengte van hoofdstukken die worden gegenereerd voor media zonder hoofdstukken. Stel in op 0 om uit te schakelen.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolutie van hoofdstukafbeeldingen';

  @override
  String get adminLibNfoTitle => 'NFO-instellingen';

  @override
  String get adminLibNfoHelp =>
      'NFO-metagegevens zijn compatibel met Kodi en vergelijkbare clients. Instellingen gelden voor alle bibliotheken die NFO-metagegevens opslaan.';

  @override
  String get adminLibKodiUser =>
      'Gebruiker van wie kijkgegevens in NFO-bestanden worden opgeslagen';

  @override
  String get adminLibSaveImagePaths =>
      'Afbeeldingspaden opslaan in NFO-bestanden';

  @override
  String get adminLibPathSubstitution =>
      'Padvervanging inschakelen voor NFO-afbeeldingspaden';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart-afbeeldingen kopiëren naar een extrathumbs-map';

  @override
  String get adminLibNone => 'Geen';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dagen';
  }

  @override
  String get adminLibEmbeddedTitles => 'Ingesloten titels gebruiken';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Ingesloten titels gebruiken voor extra\'s';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Ingesloten afleveringsinformatie gebruiken';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Ingesloten ondertitels toestaan';

  @override
  String get adminLibEmbeddedAllowAll => 'Alles toestaan';

  @override
  String get adminLibEmbeddedAllowText => 'Alleen tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Alleen afbeeldingen';

  @override
  String get adminLibEmbeddedAllowNone => 'Geen';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Download overslaan als er ingesloten ondertitels aanwezig zijn';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Download overslaan als de audiotrack overeenkomt met de downloadtaal';

  @override
  String get adminLibRequirePerfectMatch =>
      'Een perfecte ondertitelovereenkomst vereisen';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Ondertitels opslaan in mediamappen';

  @override
  String get adminLibChapterImageExtraction =>
      'Hoofdstukafbeeldingen extraheren';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Hoofdstukafbeeldingen extraheren tijdens de bibliotheekscan';

  @override
  String get adminLibTrickplayExtraction =>
      'Extractie van trickplay-afbeeldingen inschakelen';

  @override
  String get adminLibTrickplayDuringScan =>
      'Trickplay-afbeeldingen extraheren tijdens de bibliotheekscan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay-afbeeldingen opslaan in mediamappen';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Series die over meerdere mappen zijn verspreid automatisch samenvoegen';

  @override
  String get adminLibSeasonZeroName => 'Weergavenaam voor seizoen nul';

  @override
  String get adminLibLufsScan => 'LUFS-scan inschakelen voor audionormalisatie';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Voorkeur voor niet-standaard artiesten-tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Films automatisch aan collecties toevoegen';

  @override
  String get adminLibraryNameRequired => 'Bibliotheeknaam is vereist';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kan bibliotheek niet aanmaken: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotheeknaam';

  @override
  String get adminSelectedPaths => 'Geselecteerde paden:';

  @override
  String get adminCreateLibrary => 'Bibliotheek maken';

  @override
  String get paths => 'Paden:';

  @override
  String get adminDisableUser => 'Gebruiker uitschakelen';

  @override
  String get adminEnableUser => 'Gebruiker inschakelen';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name uitschakelen? Deze gebruiker kan zich dan niet meer aanmelden.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name inschakelen? Deze gebruiker kan zich dan weer aanmelden.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Gebruiker \"$name\" uitgeschakeld';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Gebruiker \"$name\" ingeschakeld';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kan gebruikersbeleid niet bijwerken: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Kan gebruikers niet laden';

  @override
  String get adminSearchUsers => 'Zoek gebruikers';

  @override
  String get adminEditUser => 'Gebruiker bewerken';

  @override
  String get adminAddUser => 'Gebruiker toevoegen';

  @override
  String adminUserCreateFailed(String error) {
    return 'Kan gebruiker niet aanmaken: $error';
  }

  @override
  String get adminCreateUser => 'Gebruiker aanmaken';

  @override
  String get adminPasswordOptional => 'Wachtwoord (optioneel)';

  @override
  String get adminUsernameRequired => 'Gebruikersnaam mag niet leeg zijn';

  @override
  String adminSaveFailed(String error) {
    return 'Opslaan mislukt: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String adminFailed(String error) {
    return 'Mislukt: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kan gebruiker niet laden';

  @override
  String get adminDeleteUser => 'Gebruiker verwijderen';

  @override
  String get admin => 'Beheerder';

  @override
  String get adminFullAccessWarning =>
      'Beheerders hebben volledige toegang tot de server. Wees voorzichtig.';

  @override
  String get administrator => 'Beheerder';

  @override
  String get adminHiddenUser => 'Verborgen gebruiker';

  @override
  String get adminAllowMediaPlayback => 'Media afspelen toestaan';

  @override
  String get adminAllowAudioTranscoding => 'Sta audiotranscodering toe';

  @override
  String get adminAllowVideoTranscoding => 'Sta videotranscodering toe';

  @override
  String get adminAllowRemuxing => 'Remuxing toestaan';

  @override
  String get adminForceRemoteTranscoding =>
      'Transcodering van externe bronnen forceren';

  @override
  String get adminAllowContentDownloading =>
      'Sta het downloaden van inhoud toe';

  @override
  String get adminAllowPublicSharing => 'Openbaar delen toestaan';

  @override
  String get adminAllowRemoteControl =>
      'Sta afstandsbediening van andere gebruikers toe';

  @override
  String get adminAllowSharedDeviceControl => 'Sta gedeeld apparaatbeheer toe';

  @override
  String get adminAllowRemoteAccess => 'Sta externe toegang toe';

  @override
  String get adminLeaveEmptyNoLimit => 'Laat leeg voor geen limiet';

  @override
  String get adminMaxActiveSessions => 'Max. actieve sessies';

  @override
  String get adminAllowLiveTvAccess => 'Sta live tv-toegang toe';

  @override
  String get adminAllowLiveTvManagement => 'Live TV-beheer toestaan';

  @override
  String get adminAllowCollectionManagement => 'Laat collectiebeheer toe';

  @override
  String get adminAllowSubtitleManagement => 'Ondertitelbeheer toestaan';

  @override
  String get adminAllowLyricManagement => 'Songtekstbeheer toestaan';

  @override
  String get adminEnableAllLibraryAccess =>
      'Schakel toegang tot alle bibliotheken in';

  @override
  String get adminChangePassword => 'Wachtwoord wijzigen';

  @override
  String get adminNewPassword => 'Nieuw wachtwoord';

  @override
  String get adminConfirmPassword => 'Bevestig wachtwoord';

  @override
  String get adminSetPassword => 'Wachtwoord instellen';

  @override
  String get adminResetPassword => 'Wachtwoord opnieuw instellen';

  @override
  String get adminPasswordReset => 'Wachtwoord opnieuw instellen';

  @override
  String get adminPasswordUpdated => 'Wachtwoord bijgewerkt';

  @override
  String get adminUserSettings => 'Gebruikersinstellingen';

  @override
  String get adminLibraryAccess => 'Toegang tot bibliotheek';

  @override
  String get adminEnableAllDevices => 'Schakel toegang tot alle apparaten in';

  @override
  String get adminEnableAllChannels => 'Schakel toegang tot alle kanalen in';

  @override
  String get adminParentalControl => 'Ouderlijk toezicht';

  @override
  String get adminMaxParentalRating =>
      'Maximaal toegestane leeftijdsclassificatie';

  @override
  String get adminMaxParentalRatingHint =>
      'Inhoud met een hogere classificatie wordt voor deze gebruiker verborgen.';

  @override
  String get adminParentalRatingNone => 'Geen';

  @override
  String get adminBlockUnratedItems =>
      'Items zonder of met onbekende classificatie blokkeren';

  @override
  String get adminUnratedBook => 'Boeken';

  @override
  String get adminUnratedChannelContent => 'Kanalen';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Films';

  @override
  String get adminUnratedMusic => 'Muziek';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Series';

  @override
  String get adminAccessSchedules => 'Toegangsschema\'s';

  @override
  String get adminAccessSchedulesHint =>
      'Sta alleen toegang toe tijdens de onderstaande geplande tijden. Als er geen schema is ingesteld, is toegang de hele dag toegestaan.';

  @override
  String get adminAddSchedule => 'Schema toevoegen';

  @override
  String get adminScheduleDay => 'Dag';

  @override
  String get adminScheduleStart => 'Begin';

  @override
  String get adminScheduleEnd => 'Einde';

  @override
  String get adminDayEveryday => 'Elke dag';

  @override
  String get adminDayWeekday => 'Doordeweeks';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Zondag';

  @override
  String get adminDayMonday => 'Maandag';

  @override
  String get adminDayTuesday => 'Dinsdag';

  @override
  String get adminDayWednesday => 'Woensdag';

  @override
  String get adminDayThursday => 'Donderdag';

  @override
  String get adminDayFriday => 'Vrijdag';

  @override
  String get adminDaySaturday => 'Zaterdag';

  @override
  String get adminAllowedTags => 'Toegestane tags';

  @override
  String get adminAllowedTagsHint =>
      'Alleen inhoud met deze tags wordt getoond. Laat leeg om alles toe te staan.';

  @override
  String get adminBlockedTags => 'Geblokkeerde tags';

  @override
  String get adminBlockedTagsHint =>
      'Inhoud met deze tags wordt voor deze gebruiker verborgen.';

  @override
  String get adminAddTag => 'Tag toevoegen';

  @override
  String get adminAuthProvider => 'Authenticatieprovider';

  @override
  String get adminPasswordResetProvider => 'Provider voor wachtwoordherstel';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximumaantal mislukte aanmeldpogingen vóór blokkering';

  @override
  String get adminLoginAttemptsHint =>
      'Stel in op 0 voor de standaardwaarde, of op -1 om blokkering uit te schakelen.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-toegang';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Groepen aanmaken en eraan deelnemen toestaan';

  @override
  String get adminSyncPlayJoin => 'Deelnemen aan groepen toestaan';

  @override
  String get adminSyncPlayNone => 'Geen toegang';

  @override
  String get adminContentDeletionFolders => 'Inhoud verwijderen toestaan uit';

  @override
  String get adminResetPasswordWarning =>
      'Hiermee wordt het wachtwoord verwijderd. De gebruiker kan inloggen zonder wachtwoord.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server gaf HTTP $status terug';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Weet u zeker dat u $name wilt verwijderen?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Gebruiker \"$name\" verwijderd';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kan gebruiker niet verwijderen: $error';
  }

  @override
  String get adminCreateApiKey => 'Maak een API-sleutel';

  @override
  String get adminAppName => 'App-naam';

  @override
  String get adminApiKeyCreated => 'API-sleutel gemaakt';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Sleutel succesvol aangemaakt. De server heeft het token niet geretourneerd. Controleer de API-sleutels van de server.';

  @override
  String get adminKeyCopied => 'Sleutel gekopieerd naar klembord';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Kan sleutel niet aanmaken: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Sleuteltoken ontbreekt in serverreactie';

  @override
  String get adminRevokeApiKey => 'API-sleutel intrekken';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Sleutel voor $name intrekken?';
  }

  @override
  String get adminApiKeyRevoked => 'API-sleutel ingetrokken';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Kan sleutel niet intrekken: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Kan API-sleutels niet laden';

  @override
  String get adminApiKeysTitle => 'API-sleutels';

  @override
  String get adminCreateKey => 'Sleutel maken';

  @override
  String get adminNoApiKeys => 'Geen API-sleutels gevonden';

  @override
  String get adminUnknownApp => 'Onbekende app';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nAangemaakt: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Back-up maken';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Altijd opgenomen';

  @override
  String get adminBackupMetadata => 'Metagegevens';

  @override
  String get adminBackupSubtitles => 'Ondertitels';

  @override
  String get adminBackupTrickplay => 'Trickplay-afbeeldingen';

  @override
  String get adminCreatingBackup => 'Back-up maken...';

  @override
  String get adminBackupCreated => 'Back-up is succesvol gemaakt';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Kan back-up niet maken: $error';
  }

  @override
  String get adminBackupPathMissing => 'Back-uppad ontbreekt in serverreactie';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Kan manifest niet laden: $error';
  }

  @override
  String get adminConfirmRestore => 'Bevestig Herstellen';

  @override
  String get adminRestoringBackup => 'Back-up herstellen...';

  @override
  String adminRestoreFailed(String error) {
    return 'Kan back-up niet herstellen: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Kan back-ups niet laden';

  @override
  String get adminCreateBackup => 'Maak een back-up';

  @override
  String get adminNoBackups => 'Geen back-ups gevonden';

  @override
  String get adminViewDetails => 'Details bekijken';

  @override
  String get restore => 'Herstellen';

  @override
  String get adminLogsLoadFailed => 'Kan serverlogboeken niet laden';

  @override
  String get adminNoLogFiles => 'Geen logbestanden gevonden';

  @override
  String get adminLogCopied => 'Logboek gekopieerd naar klembord';

  @override
  String get adminSaveLogFile => 'Logbestand opslaan';

  @override
  String adminSavedTo(String path) {
    return 'Opgeslagen in $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Kan bestand niet opslaan: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Kan $fileName niet laden';
  }

  @override
  String get adminSearchInLog => 'Zoek in logboek';

  @override
  String get adminNoMatchingLines => 'Geen bijpassende lijnen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Kan taken niet laden: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Geen geplande taken gevonden';

  @override
  String get adminNoTasksMatchFilter =>
      'Er zijn geen taken die overeenkomen met het huidige filter';

  @override
  String adminTaskStartFailed(String error) {
    return 'Kan taak niet starten: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Kan taak niet stoppen: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Kan taak niet laden: $error';
  }

  @override
  String get adminRunNow => 'Ren nu';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Kan trigger niet verwijderen: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Kan trigger niet toevoegen: $error';
  }

  @override
  String get adminLastExecution => 'Laatste executie';

  @override
  String get adminTriggers => 'Triggers';

  @override
  String get adminAddTrigger => 'Trigger toevoegen';

  @override
  String get adminNoTriggers => 'Geen triggers geconfigureerd';

  @override
  String get adminTriggerType => 'Triggertype';

  @override
  String get adminNoLimit => 'Geen limiet';

  @override
  String adminHours(String hours) {
    return '$hours uur';
  }

  @override
  String get adminDayOfWeek => 'Dag van de week';

  @override
  String get adminSearchPlugins => 'Plug-ins zoeken...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Kan plug-in niet in-/uitschakelen: $error';
  }

  @override
  String get adminUninstallPlugin => 'Plug-in verwijderen';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Weet u zeker dat u \"$name\" wilt verwijderen?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Kan plug-in niet verwijderen: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Kan pakket niet installeren: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Kan update niet installeren: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Kan plug-ins niet laden: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Er zijn geen plug-ins die overeenkomen met uw zoekopdracht';

  @override
  String get adminNoPluginsInstalled => 'Geen plug-ins geïnstalleerd';

  @override
  String adminInstallUpdate(String version) {
    return 'Update installeren (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kan catalogus niet laden: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Er zijn geen pakketten die overeenkomen met uw zoekopdracht';

  @override
  String get adminNoPackagesAvailable => 'Geen pakketten beschikbaar';

  @override
  String get adminExperimentalIntegration => 'Experimentele integratie';

  @override
  String get adminExperimentalWarning =>
      'De integratie van plug-ininstellingen is nog experimenteel. Sommige instellingenpagina\'s worden mogelijk niet correct weergegeven.';

  @override
  String get continueAction => 'Doorgaan';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" wordt verwijderd nadat de server opnieuw is opgestart';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Verwijderen mislukt: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" bijwerken naar v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Kan plug-in niet laden: $error';
  }

  @override
  String get adminPluginNotFound => 'Plug-in niet gevonden';

  @override
  String adminPluginVersion(String version) {
    return 'Versie $version';
  }

  @override
  String get adminEnablePlugin => 'Plug-in inschakelen';

  @override
  String get adminPluginSettingsPage => 'Pagina met plug-ininstellingen';

  @override
  String get adminRevisionHistory => 'Revisiegeschiedenis';

  @override
  String get adminNoChangelog => 'Geen changelog beschikbaar.';

  @override
  String get adminRemoveRepository => 'Verwijder de opslagplaats';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Weet u zeker dat u \"$name\" wilt verwijderen?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Kan repository\'s niet opslaan: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Kan repository\'s niet laden: $error';
  }

  @override
  String get adminRepositoryNameHint => 'bijv. Jellyfin-stal';

  @override
  String get adminRepositoryUrl => 'Repository-URL';

  @override
  String get adminAddEntry => 'Vermelding toevoegen';

  @override
  String get adminInvalidUrl => 'Ongeldige URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Kan plug-in-instellingen niet laden: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Kan $uri niet openen';
  }

  @override
  String get adminOpenInBrowser => 'Openen in browser';

  @override
  String get adminOpenExternally => 'Extern openen';

  @override
  String get adminGeneralSettings => 'Algemene instellingen';

  @override
  String get adminServerName => 'Servernaam';

  @override
  String get adminPreferredMetadataCountry => 'Voorkeur land voor metadata';

  @override
  String get adminCachePath => 'Cache-pad';

  @override
  String get adminMetadataPath => 'Metagegevenspad';

  @override
  String get adminLibraryScanConcurrency =>
      'Gelijktijdigheid van bibliotheekscans';

  @override
  String get adminParallelImageEncodingLimit =>
      'Coderingslimiet voor parallelle afbeeldingen';

  @override
  String get adminSlowResponseThreshold => 'Drempel voor langzame respons (ms)';

  @override
  String get adminBrandingLoadFailed => 'Kan brandinginstellingen niet laden';

  @override
  String get adminLoginDisclaimer => 'Disclaimer voor inloggen';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML weergegeven onder het inlogformulier';

  @override
  String get adminCustomCss => 'Aangepaste CSS';

  @override
  String get adminCustomCssHint =>
      'Aangepaste CSS toegepast op de webinterface';

  @override
  String get adminEnableSplashScreen => 'Schakel het splash-scherm in';

  @override
  String get adminStreamingLoadFailed => 'Kan streaminginstellingen niet laden';

  @override
  String get adminStreamingDescription =>
      'Stel globale streaming-bitratelimieten in voor externe verbindingen.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Bitsnelheidlimiet voor externe client (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Laat leeg of 0 voor onbeperkt';

  @override
  String get adminPlaybackLoadFailed => 'Kan afspeelinstellingen niet laden';

  @override
  String get adminHardwareAcceleration => 'Hardwareversnelling';

  @override
  String get adminVaapiDevice => 'VA-API-apparaat';

  @override
  String get adminEnableHardwareEncoding => 'Schakel hardwarecodering in';

  @override
  String get adminEnableHardwareDecoding =>
      'Schakel hardwaredecodering in voor:';

  @override
  String get adminEncodingThreads => 'Coderen van threads';

  @override
  String get adminAutomatic => '0 = automatisch';

  @override
  String get adminTranscodingTempPath => 'Temp-pad transcoderen';

  @override
  String get adminEnableFallbackFont => 'Schakel het fallback-lettertype in';

  @override
  String get adminFallbackFontPath => 'Terugvallettertypepad';

  @override
  String get adminAllowSegmentDeletion => 'Sta segmentverwijdering toe';

  @override
  String get adminSegmentKeepSeconds => 'Segment behouden (seconden)';

  @override
  String get adminThrottleBuffering => 'Gaspedaalbuffering';

  @override
  String get adminTrickplayLoadFailed =>
      'Kan trickplay-instellingen niet laden';

  @override
  String get adminEnableHardwareAcceleration =>
      'Schakel hardwareversnelling in';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Schakel extractie van alleen sleutelframes in';

  @override
  String get adminKeyFrameSubtitle => 'Sneller maar lagere nauwkeurigheid';

  @override
  String get adminScanBehavior => 'Scangedrag';

  @override
  String get adminProcessPriority => 'Procesprioriteit';

  @override
  String get adminImageSettings => 'Beeldinstellingen';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Hoe vaak frames moeten worden vastgelegd';

  @override
  String get adminWidthResolutions => 'Breedte resoluties';

  @override
  String get adminTileWidth => 'Tegel breedte';

  @override
  String get adminTileHeight => 'Tegel hoogte';

  @override
  String get adminQualitySubtitle =>
      'Lagere waarden = betere kwaliteit, grotere bestanden';

  @override
  String get adminProcessThreads => 'Procesdraden';

  @override
  String get adminResumeLoadFailed =>
      'Kan de hervattingsinstellingen niet laden';

  @override
  String get adminResumeDescription =>
      'Configureer wanneer inhoud moet worden gemarkeerd als gedeeltelijk afgespeeld of volledig afgespeeld.';

  @override
  String get adminMinResumePercentage => 'Minimaal hervattingspercentage';

  @override
  String get adminMinResumeSubtitle =>
      'Content moet voorbij dit percentage worden afgespeeld om voortgang te besparen';

  @override
  String get adminMaxResumePercentage => 'Maximaal hervattingspercentage';

  @override
  String get adminMaxResumeSubtitle =>
      'Na dit percentage wordt de inhoud als volledig afgespeeld beschouwd';

  @override
  String get adminMinResumeDuration => 'Minimale hervattingsduur (seconden)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Items korter dan dit kunnen niet worden hervat';

  @override
  String get adminMinAudiobookResume => 'Minimaal audioboek-cv-percentage';

  @override
  String get adminMaxAudiobookResume =>
      'Maximaal cv-percentage voor audioboeken';

  @override
  String get adminNetworkingLoadFailed => 'Kan netwerkinstellingen niet laden';

  @override
  String get adminNetworkingWarning =>
      'Wijzigingen in de netwerkinstellingen vereisen mogelijk een herstart van de server.';

  @override
  String get adminEnableRemoteAccess => 'Schakel externe toegang in';

  @override
  String get ports => 'Poorten';

  @override
  String get adminHttpPort => 'HTTP-poort';

  @override
  String get adminHttpsPort => 'HTTPS-poort';

  @override
  String get adminPublicHttpsPort => 'Openbare HTTPS-poort';

  @override
  String get adminBaseUrl => 'Basis-URL';

  @override
  String get adminBaseUrlHint => 'bijv. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Schakel HTTPS in';

  @override
  String get adminLocalNetwork => 'Lokaal netwerk';

  @override
  String get adminLocalNetworkAddresses => 'Lokale netwerkadressen';

  @override
  String get adminKnownProxies => 'Bekende proxy\'s';

  @override
  String get adminRemoteIpFilter => 'Extern IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'IP-filter op afstand';

  @override
  String get adminCertificatePath => 'Certificaatpad';

  @override
  String get whitelist => 'Witte lijst';

  @override
  String get blacklist => 'Zwarte lijst';

  @override
  String get notSet => 'Niet ingesteld';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kan metagegevens niet laden: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metagegevens vernieuwen';

  @override
  String get recursive => 'Recursief';

  @override
  String get adminReplaceAllMetadata => 'Vervang alle metagegevens';

  @override
  String get adminMetadataRefreshRequested =>
      'Vernieuwing van metagegevens aangevraagd';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Kan metagegevens niet vernieuwen: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Geen externe overeenkomsten gevonden';

  @override
  String get adminRemoteResults => 'Resultaten op afstand';

  @override
  String get adminRemoteMetadataApplied => 'Metagegevens op afstand toegepast';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Extern zoeken mislukt: $error';
  }

  @override
  String get adminUpdateContentType => 'Inhoudstype bijwerken';

  @override
  String get adminContentType => 'Inhoudstype';

  @override
  String get adminContentTypeUpdated => 'Inhoudstype bijgewerkt';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Kan inhoudstype niet bijwerken: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Kan de metadata-editor niet laden';

  @override
  String get adminNoPeopleEntries => 'Geen personeninvoer';

  @override
  String get adminNoExternalIds => 'Geen externe ID\'s beschikbaar';

  @override
  String adminImageUpdated(String imageType) {
    return 'Afbeelding $imageType bijgewerkt';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kan afbeelding niet downloaden: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Niet-ondersteund afbeeldingsformaat';

  @override
  String get adminImageReadFailed =>
      'Kan de geselecteerde afbeelding niet lezen';

  @override
  String adminImageUploaded(String imageType) {
    return 'Afbeelding $imageType geüpload';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kan afbeelding niet uploaden: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Afbeelding $imageType verwijderen';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Afbeelding $imageType verwijderd';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kan afbeelding niet verwijderen: $error';
  }

  @override
  String get adminAllProviders => 'Alle aanbieders';

  @override
  String get adminNoRemoteImages => 'Geen externe afbeeldingen gevonden';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Zoeken naar tuners mislukt: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Bestand of URL';

  @override
  String get adminTunerIpAddress => 'IP-adres van tuner';

  @override
  String get adminTunerFriendlyName => 'Weergavenaam';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limiet voor gelijktijdige verbindingen';

  @override
  String get adminTunerCountHelp =>
      'Het maximale aantal streams dat de tuner tegelijk toestaat. Stel in op 0 voor onbeperkt.';

  @override
  String get adminTunerFallbackBitrate =>
      'Maximale streaming-bitsnelheid als terugval';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Alleen favoriete kanalen importeren';

  @override
  String get adminTunerAllowHwTranscoding => 'Hardwaretranscodering toestaan';

  @override
  String get adminTunerAllowFmp4 => 'fMP4-transcodeercontainer toestaan';

  @override
  String get adminTunerAllowStreamSharing => 'Streams delen toestaan';

  @override
  String get adminTunerEnableStreamLooping =>
      'Herhalen van streams inschakelen';

  @override
  String get adminTunerIgnoreDts => 'DTS negeren';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Invoer lezen op de oorspronkelijke framerate';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Bestand of URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmvoorvoegsel';

  @override
  String get adminXmltvMovieCategories => 'Filmcategorieën';

  @override
  String get adminXmltvCategoriesHelp =>
      'Scheid meerdere categorieën met een verticale streep.';

  @override
  String get adminXmltvKidsCategories => 'Kindercategorieën';

  @override
  String get adminXmltvNewsCategories => 'Nieuwscategorieën';

  @override
  String get adminXmltvSportsCategories => 'Sportcategorieën';

  @override
  String get adminSdUsername => 'Gebruikersnaam';

  @override
  String get adminSdPassword => 'Wachtwoord';

  @override
  String get adminSdCountry => 'Land';

  @override
  String get adminSdCountrySelect => 'Selecteer een land';

  @override
  String get adminSdPostalCode => 'Postcode';

  @override
  String get adminEnableAllTuners => 'Alle tuners inschakelen';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kan tuner niet verwijderen: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kan provider niet verwijderen: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serie-opnamepad';

  @override
  String get adminMovieRecordingPath => 'Opnamepad voor films';

  @override
  String get adminGuideDaysAuto => 'Automatisch';

  @override
  String get adminRecordingPostProcessor => 'Pad naar nabewerkingsprogramma';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenten voor nabewerking';

  @override
  String get adminSaveRecordingNfo => 'NFO-metagegevens van opname opslaan';

  @override
  String get adminSaveRecordingImages => 'Opnameafbeeldingen opslaan';

  @override
  String get adminLiveTvSectionPaths => 'Opnamepaden';

  @override
  String get adminLiveTvSectionPostProcessing => 'Nabewerking';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kan instellingen niet opslaan: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Kan Live TV-beheer niet laden';

  @override
  String get adminTunerDevices => 'Tuner-apparaten';

  @override
  String get adminNoTunerHosts => 'Geen tuner-hosts geconfigureerd';

  @override
  String get adminGuideProviders => 'Gids aanbieders';

  @override
  String get adminGuideRefreshStarted => 'Vernieuwen van gidsgegevens gestart';

  @override
  String get adminGuideRefreshUnavailable =>
      'De taak voor het vernieuwen van de gids is niet beschikbaar op deze server.';

  @override
  String get adminNoListingProviders =>
      'Er zijn geen vermeldingsproviders geconfigureerd';

  @override
  String get adminSettingsSaved => 'Instellingen opgeslagen';

  @override
  String get adminBackupsNotAvailable =>
      'Back-ups zijn niet beschikbaar op deze serverbuild.';

  @override
  String get adminRestoreWarning1 =>
      'Bij het herstellen worden ALLE huidige servergegevens vervangen door de back-upgegevens.';

  @override
  String get adminRestoreWarning2 =>
      'Huidige serverinstellingen, gebruikers en bibliotheekgegevens worden overschreven.';

  @override
  String get adminRestoreWarning3 =>
      'De server zal na herstel opnieuw opstarten.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Back-up $name nu herstellen?';
  }

  @override
  String get adminBackupsTitle => 'Back-ups';

  @override
  String get adminUnknownDate => 'Onbekende datum';

  @override
  String get adminUnnamedBackup => 'Naamloze back-up';

  @override
  String get adminApply => 'Toepassen';

  @override
  String get adminLogsTitle => 'Serverlogboeken';

  @override
  String get adminLogsNewestFirst => 'Nieuwste eerst';

  @override
  String get adminLogsOldestFirst => 'Oudste eerst';

  @override
  String get adminLogsJustNow => 'Zojuist';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m geleden';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h geleden';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d geleden';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Kan $fileName niet laden';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count overeenkomsten';
  }

  @override
  String get adminLogViewerNoMatches => 'Geen bijpassende lijnen';

  @override
  String get adminMetadataEditorTitle => 'Metagegevenseditor';

  @override
  String get adminMetadataIdentify => 'Identificeren';

  @override
  String get adminMetadataType => 'Type';

  @override
  String get adminMetadataDetails => 'Details';

  @override
  String get adminMetadataExternalIds => 'Externe ID\'s';

  @override
  String get adminMetadataImages => 'Afbeeldingen';

  @override
  String get adminMetadataFieldTitle => 'Titel';

  @override
  String get adminMetadataFieldSortTitle => 'Titel sorteren';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originele titel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premièredatum (JJJJ-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Einddatum (JJJJ-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Productie jaar';

  @override
  String get adminMetadataFieldOfficialRating => 'Officiële beoordeling';

  @override
  String get adminMetadataFieldCommunityRating => 'Gemeenschapsbeoordeling';

  @override
  String get adminMetadataFieldCriticRating => 'Beoordeling van critici';

  @override
  String get adminMetadataFieldCustomRating => 'Aangepaste beoordeling';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Overzicht';

  @override
  String get adminMetadataFieldDisplayOrder => 'Weergavevolgorde';

  @override
  String get adminMetadataDisplayOrderAired => 'Uitgezonden';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Oorspronkelijke uitzenddatum';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absoluut';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digitaal';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Verhaallijn';

  @override
  String get adminMetadataDisplayOrderProduction => 'Productie';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternatief';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regionaal';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternatieve DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Datum aangepast';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sorteernaam';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Releasedatum';

  @override
  String get adminMetadataSettings => 'Metadata-instellingen';

  @override
  String get adminMetadataDownloadLanguage => 'Voorkeurstaal downloads';

  @override
  String get adminMetadataCountryRegion => 'Land/Regio';

  @override
  String get adminMetadataInheritHelp =>
      'Laat dit op Standaard staan om de instelling over te nemen van een bovenliggend item of van de serverstandaard.';

  @override
  String get adminMetadataField3DFormat => '3D-formaat';

  @override
  String get adminMetadataPersonKindActor => 'Acteur';

  @override
  String get adminMetadataPersonKindDirector => 'Regisseur';

  @override
  String get adminMetadataPersonKindComposer => 'Componist';

  @override
  String get adminMetadataPersonKindWriter => 'Schrijver';

  @override
  String get adminMetadataPersonKindGuestStar => 'Gastrol';

  @override
  String get adminMetadataPersonKindProducer => 'Producent';

  @override
  String get adminMetadataPersonKindConductor => 'Dirigent';

  @override
  String get adminMetadataPersonKindLyricist => 'Tekstschrijver';

  @override
  String get adminMetadataPersonKindArranger => 'Arrangeur';

  @override
  String get adminMetadataPersonKindEngineer => 'Technicus';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Maker';

  @override
  String get adminMetadataPersonKindArtist => 'Artiest';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Albumartiest';

  @override
  String get adminMetadataPersonKindAuthor => 'Auteur';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Boekmaker';

  @override
  String get adminMetadataPersonKindInker => 'Inkter';

  @override
  String get adminMetadataPersonKindColorist => 'Colorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Letteraar';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Coverartiest';

  @override
  String get adminMetadataPersonKindEditor => 'Redacteur';

  @override
  String get adminMetadataPersonKindTranslator => 'Vertaler';

  @override
  String get adminMetadataPersonKindNarrator => 'Verteller';

  @override
  String get adminMetadataAirDays => 'Uitzenddagen';

  @override
  String get adminMetadataLockItem =>
      'Lock this item to prevent future metadata changes';

  @override
  String get adminMetadataEnabledFields => 'Ingeschakelde velden';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Uncheck a field to lock it and prevent its data from being changed.';

  @override
  String get adminMetadataLockFieldName => 'Naam';

  @override
  String get adminMetadataLockFieldOverview => 'Overzicht';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Kijkwijzer';

  @override
  String get adminMetadataLockFieldCast => 'Mensen';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Productielocaties';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Geboorteplek';

  @override
  String get adminMetadataLockFieldRuntime => 'Looptijd';

  @override
  String get adminMetadataLockFieldStudios => 'Studio\'s';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

  @override
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Labels';

  @override
  String get adminMetadataStudios => 'Studio\'s';

  @override
  String get adminMetadataPeople => 'Mensen';

  @override
  String get adminMetadataAddGenre => 'Genre toevoegen';

  @override
  String get adminMetadataAddTag => 'Label toevoegen';

  @override
  String get adminMetadataAddStudio => 'Studio toevoegen';

  @override
  String get adminMetadataAddPerson => 'Persoon toevoegen';

  @override
  String get adminMetadataEditPerson => 'Persoon bewerken';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'Primair';

  @override
  String get adminMetadataImageBackdrop => 'Achtergrond';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banier';

  @override
  String get adminMetadataImageThumb => 'Duim';

  @override
  String get adminMetadataProvider => 'Aanbieder';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Afbeelding $imageType bijgewerkt';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Afbeelding $imageType geüpload';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Afbeelding $imageType verwijderd';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kan afbeelding niet downloaden: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Kan de geselecteerde afbeelding niet lezen';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kan afbeelding niet uploaden: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Afbeelding $imageType verwijderen';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Hiermee wordt de huidige afbeelding van het item verwijderd.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kan afbeelding niet verwijderen: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Afbeelding $imageType kiezen';
  }

  @override
  String get adminMetadataUpload => 'Uploaden';

  @override
  String get adminMetadataUpdate => 'Bijwerken';

  @override
  String get adminMetadataRemoteImage => 'Afbeelding op afstand';

  @override
  String get adminPluginsInstalled => 'Geïnstalleerd';

  @override
  String get adminPluginsCatalog => 'Catalogus';

  @override
  String get adminPluginsActive => 'Actief';

  @override
  String get adminPluginsRestart => 'Opnieuw opstarten';

  @override
  String get adminPluginsRestartRequired => 'Opnieuw opstarten vereist';

  @override
  String get adminPluginsNoSearchResults =>
      'Er zijn geen plug-ins die overeenkomen met uw zoekopdracht';

  @override
  String get adminPluginsNoneInstalled => 'Geen plug-ins geïnstalleerd';

  @override
  String get adminPluginsNoneActive => 'Geen actieve plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Geen plugins hebben een serverherstart nodig';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update beschikbaar: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Update beschikbaar';

  @override
  String get adminPluginsPendingRemoval =>
      'In afwachting van verwijdering na opnieuw opstarten';

  @override
  String get adminPluginsChangesPending =>
      'Wijzigingen in afwachting van herstart';

  @override
  String get adminPluginsEnable => 'Inschakelen';

  @override
  String get adminPluginsDisable => 'Uitzetten';

  @override
  String get adminPluginsInstallUpdate => 'Update installeren';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Update installeren (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Er zijn geen pakketten die overeenkomen met uw zoekopdracht';

  @override
  String get adminPluginsCatalogEmpty => 'Geen pakketten beschikbaar';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" wordt geïnstalleerd...';
  }

  @override
  String get adminPluginDetailExperimental => 'Experimentele integratie';

  @override
  String get adminPluginDetailExperimentalContent =>
      'De integratie van plug-ininstellingen is nog experimenteel. Sommige velden of lay-outs worden mogelijk nog niet correct weergegeven.';

  @override
  String get adminPluginDetailToggle404 =>
      'Kan de plug-in niet omschakelen. De server kon deze plug-inversie niet vinden. Probeer plug-ins te vernieuwen en probeer het opnieuw.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Kan de plug-in niet omschakelen. Controleer de serverlogboeken voor meer informatie.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Instellingen voor $name';
  }

  @override
  String get adminPluginDetailDetails => 'Details';

  @override
  String get adminPluginDetailDeveloper => 'Ontwikkelaar';

  @override
  String get adminPluginDetailRepository => 'Opslagplaats';

  @override
  String get adminPluginDetailBundled => 'Gebundeld';

  @override
  String get adminPluginDetailEnablePlugin => 'Plug-in inschakelen';

  @override
  String get adminPluginDetailRestartRequired =>
      'Om de wijzigingen door te voeren, is een herstart van de server vereist.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Deze plug-in wordt verwijderd nadat de server opnieuw is opgestart.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Deze plug-in werkt niet goed en werkt mogelijk niet correct.';

  @override
  String get adminPluginDetailNotSupported =>
      'Deze plug-in wordt niet ondersteund door de huidige serverversie.';

  @override
  String get adminPluginDetailSuperseded =>
      'Deze plug-in is vervangen door een nieuwere versie.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Kan repository\'s niet laden: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Verwijder de opslagplaats';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Weet u zeker dat u \"$name\" wilt verwijderen?';
  }

  @override
  String get adminReposRemove => 'Verwijderen';

  @override
  String adminReposSaveFailed(String error) {
    return 'Kan repository\'s niet opslaan: $error';
  }

  @override
  String get adminReposEmpty => 'Geen opslagplaatsen geconfigureerd';

  @override
  String get adminReposEmptySubtitle =>
      'Voeg een repository toe om door beschikbare plug-ins te bladeren';

  @override
  String get adminReposUnnamed => '(naamloos)';

  @override
  String get adminReposEditTitle => 'Bewaarplaats bewerken';

  @override
  String get adminReposAddTitle => 'Voeg opslagplaats toe';

  @override
  String get adminReposUrl => 'Repository-URL';

  @override
  String get adminReposNameHint => 'bijv. Jellyfin-stal';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ongeldige URL';

  @override
  String get adminGeneralSettingsTitle => 'Algemene instellingen';

  @override
  String get adminGeneralMetadataLanguage => 'Voorkeurstaal voor metadata';

  @override
  String get adminGeneralMetadataLanguageHint => 'bijv. nl, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Voorkeur land voor metadata';

  @override
  String get adminGeneralMetadataCountryHint => 'bijv. VS, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Gelijktijdigheid van bibliotheekscans';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Coderingslimiet voor parallelle afbeeldingen';

  @override
  String get adminUnknownError => 'Onbekende fout';

  @override
  String get adminBrowse => 'Blader';

  @override
  String get adminCloseBrowser => 'Sluit browser';

  @override
  String get adminNetworkingTitle => 'Netwerken';

  @override
  String get adminNetworkingRestartWarning =>
      'Wijzigingen in de netwerkinstellingen vereisen mogelijk een herstart van de server.';

  @override
  String get adminNetworkingEnableHttps => 'Schakel HTTPS in';

  @override
  String get adminNetworkingAddressHint => 'bijv. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Bekende proxy\'s';

  @override
  String get adminNetworkingProxyHint => 'bijv. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Witte lijst';

  @override
  String get adminNetworkingBlacklist => 'Zwarte lijst';

  @override
  String get adminNetworkingAddEntry => 'Vermelding toevoegen';

  @override
  String get adminBrandingTitle => 'Merk';

  @override
  String get adminBrandingLoginDisclaimer => 'Disclaimer voor inloggen';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML weergegeven onder het inlogformulier';

  @override
  String get adminBrandingCustomCss => 'Aangepaste CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Aangepaste CSS toegepast op de webinterface';

  @override
  String get adminBrandingEnableSplash => 'Schakel het splash-scherm in';

  @override
  String get adminBrandingSplashUpload => 'Afbeelding uploaden';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen bijgewerkt';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Kan splashscreen niet uploaden';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen verwijderd';

  @override
  String get adminBrandingNoSplash => 'Geen aangepast splashscreen';

  @override
  String get adminPlaybackHwAccel => 'Hardwareversnelling';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwareversnelling';

  @override
  String get adminPlaybackEnableHwEncoding => 'Schakel hardwarecodering in';

  @override
  String get adminPlaybackQsvDevice => 'QSV-apparaat';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Verbeterde NVDEC-decoder inschakelen';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Voorkeur voor de eigen hardwaredecoder van het systeem';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bits HEVC-decodering';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bits VP9-decodering';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bits decodering';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-bits decodering';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardwarecodering';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC-codering toestaan';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1-codering toestaan';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel low-power H.264-encoder inschakelen';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel low-power HEVC-encoder inschakelen';

  @override
  String get adminPlaybackToneMapping => 'Tone mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Tone mapping inschakelen';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP-tone mapping inschakelen';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox-tone mapping inschakelen';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping-algoritme';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping-modus';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping-bereik';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping-desaturatie';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping-piek';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping-parameter';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP-tone mapping-helderheid';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP-tone mapping-contrast';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder-preset';

  @override
  String get adminPlaybackH264Crf => 'CRF voor H.264-codering';

  @override
  String get adminPlaybackH265Crf => 'CRF voor H.265 (HEVC)-codering';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deïnterlacemethode';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'De framerate verdubbelen bij deïnterlacen';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'VBR-audiocodering inschakelen';

  @override
  String get adminPlaybackDownmixBoost => 'Versterking bij audiodownmix';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritme voor stereodownmix';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maximale grootte van de muxing-wachtrij';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Codering';

  @override
  String get adminPlaybackEncodingThreads => 'Coderen van threads';

  @override
  String get adminPlaybackFallbackFont => 'Schakel het fallback-lettertype in';

  @override
  String get adminPlaybackFallbackFontPath => 'Terugvallettertypepad';

  @override
  String get adminPlaybackStreaming => 'Streamen';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audioboeken';

  @override
  String get adminStreamingBitrateLimit =>
      'Bitsnelheidlimiet voor externe client (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Laat leeg of 0 voor onbeperkt';

  @override
  String get adminTrickplayHwAccel => 'Schakel hardwareversnelling in';

  @override
  String get adminTrickplayHwEncoding => 'Schakel hardwarecodering in';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Schakel extractie van alleen sleutelframes in';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Sneller maar lagere nauwkeurigheid';

  @override
  String get adminTrickplayNonBlocking => 'Niet-blokkerend';

  @override
  String get adminTrickplayBlocking => 'Blokkeren';

  @override
  String get adminTrickplayPriorityHigh => 'Hoog';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Boven Normaal';

  @override
  String get adminTrickplayPriorityNormal => 'Normaal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Onder Normaal';

  @override
  String get adminTrickplayPriorityIdle => 'Inactief';

  @override
  String get adminTrickplayImageSettings => 'Beeldinstellingen';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Hoe vaak frames moeten worden vastgelegd';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Door komma\'s gescheiden pixelbreedtes (bijvoorbeeld 320)';

  @override
  String get adminTrickplayQuality => 'Kwaliteit';

  @override
  String get adminTrickplayQScale => 'Kwaliteitsschaal';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Lagere waarden = betere kwaliteit, grotere bestanden';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-kwaliteit';

  @override
  String get adminTrickplayProcessing => 'Verwerking';

  @override
  String get adminTasksEmpty => 'Geen geplande taken gevonden';

  @override
  String get adminTasksNoFilterMatch =>
      'Er zijn geen taken die overeenkomen met het huidige filter';

  @override
  String get adminTaskCancelling => 'Annuleren...';

  @override
  String get adminTaskRunning => 'Rennen...';

  @override
  String get adminTaskNeverRun => 'Nooit rennen';

  @override
  String get adminTaskStop => 'Stoppen';

  @override
  String get adminRunningTasks => 'Lopende taken';

  @override
  String get adminTaskRun => 'Uitvoeren';

  @override
  String get adminTaskDetailLastExecution => 'Laatste executie';

  @override
  String get adminTaskDetailStarted => 'Gestart';

  @override
  String get adminTaskDetailEnded => 'Beëindigd';

  @override
  String get adminTaskDetailDuration => 'Duur';

  @override
  String get adminTaskDetailErrorLabel => 'Fout:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Dagelijks om $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Elke $day om $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Bij het opstarten van de applicatie';

  @override
  String get adminTaskTriggerTypeDaily => 'Dagelijks';

  @override
  String get adminTaskTriggerTypeWeekly => 'Wekelijks';

  @override
  String get adminTaskTriggerTypeInterval => 'Op een interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Elk uur';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uur',
      one: '1 uur',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tijd';

  @override
  String get adminActivityJustNow => 'Zojuist';

  @override
  String get adminActivityLastHour => 'Laatste uur';

  @override
  String get adminActivityToday => 'Vandaag';

  @override
  String get adminActivityYesterday => 'Gisteren';

  @override
  String get adminActivityOlder => 'Ouder';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d geleden';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}u geleden';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m geleden';
  }

  @override
  String get adminActivityNow => 'nu';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '${minutes}m';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '${hours}u';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '${days}d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day-$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Configureer het genereren van trickplay-afbeeldingen voor het zoeken naar voorbeeldminiaturen.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Openbare HTTPS-poort';

  @override
  String get adminNetworkingBaseUrl => 'Basis-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'bijv. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Openbare HTTP-poort';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS vereisen';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Leid alle externe verzoeken om naar HTTPS. Dit heeft geen effect als de server geen geldig certificaat heeft.';

  @override
  String get adminNetworkingCertPassword => 'Certificaatwachtwoord';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 inschakelen';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 inschakelen';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-netwerken';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'IP-filter op afstand';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API-apparaat';

  @override
  String get adminPlaybackAutomatic => '0 = automatisch';

  @override
  String get adminPlaybackTranscodeTempPath => 'Temp-pad transcoderen';

  @override
  String get adminPlaybackSegmentDeletion => 'Sta segmentverwijdering toe';

  @override
  String get adminPlaybackSegmentKeep => 'Segment behouden (seconden)';

  @override
  String get adminPlaybackThrottleBuffering => 'Gaspedaalbuffering';

  @override
  String get adminPlaybackThrottleDelay => 'Throttlevertraging (seconden)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Ondertitels direct extraheren toestaan';

  @override
  String get adminResumeMinPct => 'Minimaal hervattingspercentage';

  @override
  String get adminResumeMinPctSubtitle =>
      'Content moet voorbij dit percentage worden afgespeeld om voortgang te besparen';

  @override
  String get adminResumeMaxPct => 'Maximaal hervattingspercentage';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Na dit percentage wordt de inhoud als volledig afgespeeld beschouwd';

  @override
  String get adminResumeMinDuration => 'Minimale hervattingsduur (seconden)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Items korter dan dit kunnen niet worden hervat';

  @override
  String get adminTrickplayScanBehavior => 'Scangedrag';

  @override
  String get adminTrickplayProcessPriority => 'Procesprioriteit';

  @override
  String get adminTrickplayTileWidth => 'Tegel breedte';

  @override
  String get adminTrickplayTileHeight => 'Tegel hoogte';

  @override
  String get adminTrickplayProcessThreads => 'Procesdraden';

  @override
  String get adminTrickplayWidthResolutions => 'Breedte resoluties';

  @override
  String get adminMetadataDefault => 'Standaard';

  @override
  String get adminMetadataContentTypeUpdated => 'Inhoudstype bijgewerkt';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Kan inhoudstype niet bijwerken: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Drempel voor langzame respons (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Waarschuwingen voor trage reacties inschakelen';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect inschakelen';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metagegevens';

  @override
  String get adminGeneralSectionPaths => 'Paden';

  @override
  String get adminGeneralSectionPerformance => 'Prestaties';

  @override
  String get adminGeneralCachePath => 'Cache-pad';

  @override
  String get adminGeneralMetadataPath => 'Metagegevenspad';

  @override
  String get adminGeneralServerName => 'Servernaam';

  @override
  String get adminGeneralDisplayLanguage => 'Voorkeurstaal voor weergave';

  @override
  String get adminSettingsLoadFailed => 'Kan instellingen niet laden';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Kan toewijzingen niet bijwerken: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tijdslimiet: $duration';
  }

  @override
  String get folders => 'Mappen';

  @override
  String get libraries => 'Bibliotheken';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay uitgeschakeld';

  @override
  String get syncPlayDisabledMessage =>
      'Schakel SyncPlay in Instellingen in om gesynchroniseerd afspelen te gebruiken.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server wordt niet ondersteund';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Voor SyncPlay is een Jellyfin-server vereist. De huidige server ondersteunt dit niet.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay-groep';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay-groep';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# deelnemers',
      one: '# deelnemer',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Negeer wachten';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Houd de groep niet tegen terwijl dit apparaat buffert';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Ga lokaal verder zonder te wachten op langzame leden';

  @override
  String get syncPlayRepeat => 'Herhalen';

  @override
  String get syncPlayRepeatOne => 'Een';

  @override
  String get syncPlayShuffleModeShuffled => 'Geschud';

  @override
  String get syncPlayShuffleModeSorted => 'Gesorteerd';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synchroniseer de huidige afspeelwachtrij';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Vervang de groepswachtrij door wat lokaal wordt afgespeeld';

  @override
  String get syncPlayLeaveGroup => 'Verlaat de groep';

  @override
  String get syncPlayGroupQueue => 'Groepswachtrij';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Speel nu';

  @override
  String get syncPlayCreateNewGroup => 'Maak een nieuwe groep';

  @override
  String get syncPlayGroupName => 'Groepsnaam';

  @override
  String get syncPlayDefaultGroupName => 'Mijn SyncPlay-groep';

  @override
  String get syncPlayCreateGroup => 'Groep aanmaken';

  @override
  String get syncPlayAvailableGroups => 'Beschikbare groepen';

  @override
  String get syncPlayNoGroupsAvailable => 'Geen groepen beschikbaar';

  @override
  String get syncPlayJoinGroupQuestion => 'Lid worden van de SyncPlay-groep?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Lid worden van een SyncPlay-groep kan uw huidige afspeelwachtrij vervangen. Doorgaan?';

  @override
  String get syncPlayJoin => 'Meedoen';

  @override
  String get syncPlayStateIdle => 'Inactief';

  @override
  String get syncPlayStateWaiting => 'Wachten';

  @override
  String get syncPlayStatePaused => 'Gepauzeerd';

  @override
  String get syncPlayStatePlaying => 'Spelen';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName is lid geworden van de SyncPlay-groep';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName heeft de SyncPlay-groep verlaten';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-toegang geweigerd';

  @override
  String get syncPlayAccessDeniedMessage =>
      'U heeft geen toegang tot een of meer items in deze SyncPlay-groep. Vraag de groepseigenaar om de bibliotheekmachtigingen te verifiëren of een andere wachtrij te kiezen.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Afspelen synchroniseren met $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'Gesproken zoekopdrachten zijn niet beschikbaar.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct afspelen mislukt';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direct afspelen kan niet worden gestart voor deze Dolby Vision-stream. Opnieuw proberen met servertranscode?';

  @override
  String get retryWithTranscode => 'Probeer het opnieuw met transcoderen';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision wordt niet ondersteund';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Dit apparaat kan Dolby Vision-inhoud niet rechtstreeks decoderen. Gebruik HDR10-fallback of vraag servertranscodering aan.';

  @override
  String get rememberMyChoice => 'Onthoud mijn keuze';

  @override
  String get playHdr10Fallback => 'Speel HDR10-fallback';

  @override
  String get requestTranscode => 'Transcode aanvragen';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rijen gevonden',
      one: '# rij gevonden',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Bekijk alles';

  @override
  String get noItems => 'Geen artikelen';

  @override
  String get switchUser => 'Gebruiker wisselen';

  @override
  String get remoteControl => 'Afstandsbediening';

  @override
  String get mediaBarLoading => 'Mediabalk laden...';

  @override
  String get mediaBarError => 'Mediabalk kan niet worden geladen';

  @override
  String get offlineServerUnavailable =>
      'Verbonden met internet, maar de huidige server is niet beschikbaar.';

  @override
  String get offlineNoInternet =>
      'Je bent offline. Alleen gedownloade inhoud is beschikbaar.';

  @override
  String get offlineFileNotAvailable => 'Bestand niet beschikbaar';

  @override
  String get offlineSwitchServer => 'Wissel van server';

  @override
  String get offlineSavedMedia => 'Opgeslagen media';

  @override
  String get offlineBannerTitle => 'U bent offline';

  @override
  String get offlineBannerSubtitle => 'Uw downloads worden getoond';

  @override
  String get serverUnreachableBannerTitle => 'Kan uw server niet bereiken';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Afspelen vanuit downloads tot hij weer bereikbaar is';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Afspelen op afstand';

  @override
  String castControlFailed(String error) {
    return 'Cast-bediening mislukt: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind-bediening';
  }

  @override
  String get castDeviceVolume => 'Apparaatvolume';

  @override
  String get castVolumeUnavailable => 'Niet beschikbaar';

  @override
  String castStopKind(String kind) {
    return '$kind stoppen';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Ondertitels';

  @override
  String get pinConfirmTitle => 'Bevestig pincode';

  @override
  String get pinSetTitle => 'Pincode instellen';

  @override
  String get pinEnterTitle => 'Voer pincode in';

  @override
  String get pinReenterToConfirm =>
      'Voer uw pincode opnieuw in om te bevestigen';

  @override
  String pinEnterNDigit(int length) {
    return 'Voer een pincode van $length cijfers in';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Voer uw pincode van $length cijfers in';
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
  String get pinIncorrect => 'Onjuiste pincode';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'Pincodes komen niet overeen';

  @override
  String get pinForgot => 'Pincode vergeten?';

  @override
  String get pinClear => 'Wissen';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Quick Connect-verzoek geautoriseerd.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-code is ongeldig of verlopen.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect wordt niet ondersteund op deze server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kan de Quick Connect-code niet autoriseren.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect is uitgeschakeld op deze server.';

  @override
  String get quickConnectForbidden =>
      'Uw account kan dit Quick Connect-verzoek niet autoriseren.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-code is niet gevonden. Probeer een nieuwe code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect mislukt: $message';
  }

  @override
  String get quickConnectEnterCode => 'Voer code in';

  @override
  String get quickConnectAuthorize => 'Autoriseren';

  @override
  String remoteCommandFailed(String error) {
    return 'Opdracht mislukt: $error';
  }

  @override
  String get remoteControlTitle => 'Afstandsbediening';

  @override
  String get remoteFailedToLoadSessions => 'Kan sessies niet laden';

  @override
  String get remoteNoSessions => 'Geen controleerbare sessies';

  @override
  String get remoteStartPlayback => 'Start het afspelen op een ander apparaat';

  @override
  String get unknownUser => 'Onbekend';

  @override
  String get unknownItem => 'Onbekend';

  @override
  String get remoteNothingPlaying => 'Er speelt niets tijdens deze sessie';

  @override
  String get castingStarted =>
      'Het casten is gestart op het geselecteerde apparaat';

  @override
  String castingFailed(String error) {
    return 'Kan casten niet starten: $error';
  }

  @override
  String get noRemoteDevices =>
      'Er zijn geen externe afspeelapparaten beschikbaar.';

  @override
  String get noRemoteDevicesIos =>
      'Er zijn geen externe afspeelapparaten beschikbaar.\n\nOp iOS zijn AirPlay-doelen mogelijk niet beschikbaar in de simulator.';

  @override
  String get trackActionPlayNext => 'Speel Volgende';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Toevoegen aan wachtrij';

  @override
  String get trackActionAddToPlaylist => 'Toevoegen aan afspeellijst';

  @override
  String get trackActionCancelDownload => 'Annuleer het downloaden';

  @override
  String get trackActionDeleteFromPlaylist => 'Verwijderen uit afspeellijst';

  @override
  String get trackActionMoveUp => 'Ga omhoog';

  @override
  String get trackActionMoveDown => 'Ga naar beneden';

  @override
  String get trackActionRemoveFromFavorites => 'Verwijderen uit Favorieten';

  @override
  String get trackActionAddToFavorites => 'Toevoegen aan Favorieten';

  @override
  String get trackActionGoToAlbum => 'Ga naar Album';

  @override
  String get trackActionGoToArtist => 'Ga naar Artiest';

  @override
  String trackActionDownloading(String name) {
    return '$name downloaden...';
  }

  @override
  String get trackActionDeletedFile => 'Gedownload bestand verwijderd';

  @override
  String get trackActionDeleteFileFailed =>
      'Kan het gedownloade bestand niet verwijderen';

  @override
  String get shuffleBy => 'Willekeurig door';

  @override
  String get shuffleSelectLibrary => 'Selecteer Bibliotheek';

  @override
  String get shuffleSelectGenre => 'Selecteer Genre';

  @override
  String get shuffleLibrary => 'Bibliotheek';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Geen compatibele bibliotheken beschikbaar.';

  @override
  String get shuffleNoGenres =>
      'Er zijn geen genres gevonden voor deze shuffle-modus.';

  @override
  String get posterDisplayTitle => 'Weergave';

  @override
  String get posterImageType => 'Afbeeldingstype';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatuur';

  @override
  String get imageTypeBanner => 'Banier';

  @override
  String get playlistAddFailed => 'Kan niet toevoegen aan afspeellijst';

  @override
  String get playlistCreateFailed => 'Kan afspeellijst niet maken';

  @override
  String get playlistNew => 'Nieuwe afspeellijst';

  @override
  String get playlistCreate => 'Creëren';

  @override
  String get playlistCreateNew => 'Maak een nieuwe afspeellijst';

  @override
  String get playlistNoneFound => 'Geen afspeellijsten gevonden';

  @override
  String get addToPlaylist => 'Toevoegen aan afspeellijst';

  @override
  String get lyricsNotAvailable => 'Geen songteksten beschikbaar';

  @override
  String get upNext => 'Volgende';

  @override
  String get playNext => 'Speel Volgende';

  @override
  String get stillWatchingContent =>
      'Het afspelen is gepauzeerd. Kijk je nog steeds?';

  @override
  String get stillWatchingStop => 'Stoppen';

  @override
  String get stillWatchingContinue => 'Doorgaan';

  @override
  String skipSegment(String segment) {
    return '$segment overslaan';
  }

  @override
  String get liveTv => 'Live-tv';

  @override
  String get continueWatchingAndNextUp => 'Ga door met kijken en ga verder';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total downloaden — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName downloaden';
  }

  @override
  String get nextEpisode => 'Volgende aflevering';

  @override
  String get moreFromThisSeason => 'Meer uit dit seizoen';

  @override
  String get playerTooltipPlaybackSpeed => 'Afspeelsnelheid';

  @override
  String get playerTooltipCastControls => 'Cast-besturing';

  @override
  String get playerTooltipPlaybackQuality => 'Bitsnelheid';

  @override
  String get playerTooltipEnterFullscreen => 'Voer volledig scherm in';

  @override
  String get playerTooltipExitFullscreen => 'Volledig scherm afsluiten';

  @override
  String get playerTooltipFloatOnTop => 'Zweef er bovenop';

  @override
  String get playerTooltipExitFloatOnTop => 'Schakel zweven bovenaan uit';

  @override
  String get playerTooltipLockLandscape => 'Landschap vergrendelen';

  @override
  String get playerTooltipUnlockOrientation => 'Rotatie toestaan';

  @override
  String get playerTooltipPrevious => 'Vorige';

  @override
  String get playerTooltipSeekBack => 'Zoek terug';

  @override
  String get playerTooltipSeekForward => 'Zoek vooruit';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Markeer als bekeken';

  @override
  String get contextMenuMarkUnwatched => 'Markeer als niet bekeken';

  @override
  String get contextMenuAddToFavorites => 'Toevoegen aan Favorieten';

  @override
  String get contextMenuRemoveFromFavorites => 'Verwijderen uit Favorieten';

  @override
  String get contextMenuGoToSeries => 'Ga naar Serie';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Verbergen uit Ga door met kijken';

  @override
  String get contextMenuHideFromNextUp => 'Verbergen uit Volgende omhoog';

  @override
  String get contextMenuAddToCollection => 'Toevoegen aan collectie';

  @override
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle => 'Open het serverbeheerpaneel';

  @override
  String get settingsDynamicContent => 'Dynamische inhoud';

  @override
  String get settingsDynamicContentSubtitle => 'Mediabalk en visuele overlays';

  @override
  String get settingsAboutSubtitle =>
      'App-versie, juridische informatie en tegoeden';

  @override
  String get settingsSortServersBy => 'Sorteer servers op';

  @override
  String get settingsLastUsed => 'Laatst gebruikt';

  @override
  String get settingsAlphabetical => 'Alfabetisch';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Zelfondertekende certificaten toestaan';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Vertrouw servers die zelfondertekende of privé-CA-TLS-certificaten gebruiken. Schakel dit alleen in voor servers die u zelf beheert. Hiermee wordt certificaatvalidatie voor alle verbindingen uitgeschakeld.';

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
  String get settingsHomePage => 'Startpagina';

  @override
  String get settingsTwentyFourHourClock => '24-uurs klok';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Gebruik 24-uurs tijdnotatie, waar de klok ook wordt weergegeven';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Toon de shuffle-knop in de navigatiebalk';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Toon de genreknop in de navigatiebalk';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Toon de favorietenknop in de navigatiebalk';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Toon de bibliothekenknop in de navigatiebalk';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Toon de Seerr-knop in de navigatiebalk';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Toon altijd tekstlabels in de bovenste navigatiebalk';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Schakel de zichtbaarheid van de startpagina per bibliotheek in. Start Moonfin opnieuw op zodat de wijzigingen van kracht worden.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Mediabalk en lokale voorbeelden';

  @override
  String get settingsVisualOverlays => 'Visuele overlays';

  @override
  String get settingsSeasonalSurprise => 'Seizoensgebonden verrassing';

  @override
  String get useNativeEmulator => 'Ingebouwde emulatie';

  @override
  String get useNativeEmulatorSubtitle =>
      'Speel spellen met ingebouwde kernen in plaats van de EmulatorJS webspeler';

  @override
  String get emulatorCores => 'Emulatorkernen';

  @override
  String get emulatorCoresSubtitle =>
      'Download systemen om spellen ingebouwd te spelen';

  @override
  String get emulatorCoresDescription =>
      'Kies welke systemen je wilt installeren. De cores worden geleverd door het libretro-project en zorgen ervoor dat games ingebouwd kunnen worden uitgevoerd in plaats van in een browserscherm.';

  @override
  String get emulatorCoreDownloading => 'Downloaden';

  @override
  String get emulatorCoreUnavailable => 'Niet beschikbaar voor dit apparaat';

  @override
  String get emulatorCoreDownloadFailed =>
      'Het downloaden van de core is mislukt. Controleer uw internetverbinding en probeer het opnieuw.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Zet instellingen $system terug naar standaardwaarden';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Instellingen terugzetten naar standaardwaarden.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Could not reset settings. Check your connection and try again.';

  @override
  String get downloadedGames => 'Gedownloade spellen';

  @override
  String get downloadedGamesSubtitle =>
      'Maak ruimte vrij die door spelbestanden wordt gebruikt';

  @override
  String get downloadedGamesDescription =>
      'De spellen worden naar dit apparaat gekopieerd voordat ze gespeeld kunnen worden. Verwijder de spellen die je hebt uitgespeeld om ruimte vrij te maken. Voortgangsbestanden worden op de server bewaard en niet verwijderd.';

  @override
  String get downloadedGamesEmpty =>
      'Er zijn nog geen spellen naar dit apparaat gedownload.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count spellen, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Alles verwijderen';

  @override
  String removeDownloadedGameConfirm(String title) {
    return '$title van dit apparaat verwijderen? De volgende keer dat u het speelt wordt het weer gedownloadt.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Alle gedownloade spellen van dit apparaat verwijderen? Ze worden de volgende keer dat je ze speelt opnieuw gedownload.';

  @override
  String get settingsHigh => 'Hoog';

  @override
  String get settingsLow => 'Laag';

  @override
  String get settingsCustomPath => 'Aangepast pad';

  @override
  String get settingsEnterDownloadFolderPath => 'Voer het downloadmappad in';

  @override
  String get settingsConcurrentDownloads => 'Gelijktijdige downloads';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maximaal aantal items dat in één keer kan worden gedownload.';

  @override
  String get settingsAppInfo => 'APP-INFO';

  @override
  String get settingsReportAnIssue => 'Rapporteer een probleem';

  @override
  String get settingsReportAnIssueSubtitle => 'Open de issuetracker op GitHub';

  @override
  String get settingsJoinDiscord => 'Sluit je aan bij Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chat met de gemeenschap';

  @override
  String get settingsJoinTheDiscord => 'Sluit je aan bij de Discord';

  @override
  String get settingsSupportMoonfin => 'Steun Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Doneer een kop koffie aan de ontwikkelaar';

  @override
  String get settingsLegal => 'JURIDISCH';

  @override
  String get settingsLicenses => 'Licenties';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Kennisgevingen over open-sourcelicenties';

  @override
  String get settingsPrivacyPolicy => 'Privacybeleid';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Hoe Moonfin met uw gegevens omgaat';

  @override
  String get settingsCheckForUpdates => 'Controleer op updates';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kijk voor de nieuwste Moonfin-release';

  @override
  String get settingsBoth => 'Beide';

  @override
  String get settingsShuffleContentTypeFilter => 'Shuffle inhoudstypefilter';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Opties voor audiotracks, verwerking en passthrough';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Geautomatiseerd afspelen en sequencen';

  @override
  String get settingsSyncplaySubtitle =>
      'Synchronisatielogica voor groepssessies';

  @override
  String get settingsSkipIntrosAndOutros => 'Intro\'s en Outro\'s overslaan?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment segmenten';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Aftellen bij mediasegmenten';

  @override
  String get settingsProgressBar => 'Voortgangsbalk';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Geen';

  @override
  String get settingsSkipButtonAutoHide =>
      'Verberg automatisch de overslaanknop';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Haal automatisch de knop om het intro en outro over te slaan weg na een paar seconde.';

  @override
  String get settingsPromptUser => 'Vraag gebruiker';

  @override
  String get settingsSkip => 'Overslaan';

  @override
  String get settingsDoNothing => 'Doe niets';

  @override
  String get settingsMaxBitrateDescription =>
      'Beperk de streamingbitsnelheid. Inhoud boven deze drempel wordt getranscodeerd zodat deze past.';

  @override
  String get settingsMaxResolutionDescription =>
      'Beperk de maximale resolutie die de speler zal vragen. Inhoud met een hogere resolutie wordt naar beneden getranscodeerd.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hoe video moet worden geschaald zodat deze op het scherm past.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Afspeelengine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Kies de standaard afspeelengine op Android TV-apparaten. Wijzigingen zijn van toepassing op de volgende afspeelsessie.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (aanbevolen)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (verouderd)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision-terugval';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Gedrag voor Dolby Vision-titels op apparaten zonder Dolby Vision-decodering.';

  @override
  String get settingsAskEachTime => 'Vraag het elke keer';

  @override
  String get settingsPreferHdr10Fallback =>
      'Geef de voorkeur aan HDR10-fallback';

  @override
  String get settingsPreferServerTranscode =>
      'Geef de voorkeur aan servertranscode';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision-profiel 7 Direct afspelen';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Bepaalt of Dolby Vision-profiel 7-verbeteringslaagstreams het afspelen moeten sturen.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatisch';

  @override
  String get settingsEnabledOnThisDevice => 'Ingeschakeld op dit apparaat';

  @override
  String get settingsDisabledPreferTranscode => 'Uitgeschakeld';

  @override
  String get settingsResumeRewindDescription =>
      'Hoeveel seconden moeten worden teruggespoeld bij het hervatten van het afspelen (via \'Doorgaan met kijken\' of een media-itempagina)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Hoeveel seconden moeten worden teruggespoeld als u het afspelen hervat nadat u op de pauzeknop hebt gedrukt?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hoeveel seconden moet er teruggesprongen worden nadat op de terugspoelknop is gedrukt.';

  @override
  String get settingsOneSecond => '1 seconde';

  @override
  String get settingsThreeSeconds => '3 seconden';

  @override
  String get settingsFortyFiveSeconds => '45 seconden';

  @override
  String get settingsSixtySeconds => '60 seconden';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hoeveel seconden moet je vooruit springen nadat je op de knop voor vooruitspoelen hebt gedrukt.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 naar externe decoder';

  @override
  String get settingsCinemaMode => 'Bioscoopmodus';

  @override
  String get settingsCinemaModeSubtitle =>
      'Speel trailers/prerolls vóór een hoofdfilm';

  @override
  String get settingsCinemaModeEpisodes => 'Bioscoopmodus voor afleveringen';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Speel ook trailers voor afleveringen af';

  @override
  String get settingsNextUpDisplayDescription =>
      'Uitgebreid toont een volledige kaart met illustraties en beschrijving van de aflevering. Minimaal toont een compacte afteloverlay. Uitgeschakeld verbergt de prompt volledig.';

  @override
  String get settingsShort => 'Kort';

  @override
  String get settingsLong => 'Lang';

  @override
  String get settingsVeryLong => 'Heel lang';

  @override
  String get settingsVideoStartDelay => 'Videostartvertraging';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live tv rechtstreeks';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Schakel direct afspelen voor live tv in';

  @override
  String get settingsOpenGroups => 'Groepen openen';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Maak, sluit u aan bij of beheer SyncPlay-groepen';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ingeschakeld';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Schakel functies voor groepskijken in';

  @override
  String get settingsSyncplayButton => 'SyncPlay-knop';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Toon de SyncPlay-knop op de navigatiebalk';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Geavanceerde correctie';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Schakel fijnmazige synchronisatielogica in';

  @override
  String get settingsSyncplaySyncCorrection => 'Synchronisatiecorrectie';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Pas het afspelen automatisch aan om gesynchroniseerd te blijven';

  @override
  String get settingsSyncplaySpeedToSync => 'Snelheid om te synchroniseren';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Gebruik afspeelsnelheidsaanpassing om te synchroniseren';

  @override
  String get settingsSyncplaySkipToSync => 'Ga naar Synchroniseren';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Gebruik zoeken om te synchroniseren';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimale snelheidsvertraging';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maximale snelheidsvertraging';

  @override
  String get settingsSyncplaySpeedDuration => 'Snelheid Duur';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimale vertraging bij overslaan';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra compensatie';

  @override
  String get onNow => 'Aan nu';

  @override
  String get collections => 'Collecties';

  @override
  String get lastPlayed => 'Laatst gespeeld';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Recent toegevoegd $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Onlangs uitgebracht: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Volgende aflevering automatisch afspelen';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Speel automatisch de volgende aflevering af wanneer die beschikbaar is.';

  @override
  String get skipSilenceTitle => 'Stilte overslaan';

  @override
  String get skipSilenceSubtitle =>
      'Sla automatisch stille audiofragmenten over wanneer de stream dit ondersteunt.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Externe audio-effecten toestaan';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Sta equalizer- en effect-apps (bijv. Wavelet) toe om te koppelen aan Media3-afspeelsessies.';

  @override
  String get disableTunnelingTitle => 'Tunneling uitschakelen';

  @override
  String get disableTunnelingSubtitle =>
      'Forceer afspelen zonder tunneling. Handig op apparaten met audio-/videohaperingen bij tunneling.';

  @override
  String get enableTunnelingTitle => 'Tunneling inschakelen';

  @override
  String get enableTunnelingSubtitle =>
      'Geavanceerd. Stuurt audio en video via een gekoppeld hardwarepad. Staat standaard uit omdat het op sommige apparaten audio-/video-uitval veroorzaakt.';

  @override
  String get mapDolbyVisionP7Title =>
      'Speel altijd Dolby Vision-profiel 7 als HDR10';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Sla de profiel 8 conversie over en haal het Dolby Vision profiel 7 op uit streams naar een HDR10-bruikbare HEVC. Gebruik deze optie als omgezette streams er vreemd uitzien.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Ingesloten ondertitelstijlen gebruiken';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Pas kleuren, lettertypen en positionering toe die in de ondertiteltrack zijn ingesloten. Schakel dit uit om in plaats daarvan uw eigen ondertitelstijlvoorkeuren te gebruiken.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Ingesloten lettergroottes voor ondertitels gebruiken';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Pas de lettergrootte-hints toe die in de ondertiteltrack zijn ingesloten. Schakel dit uit om de ondertitelgrootte uit uw stijlvoorkeuren te gebruiken.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mediadetails tonen';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Toon details van het geselecteerde item bovenaan bibliotheekpagina\'s.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Gedetailleerde subkoppen gebruiken';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Toon een gedetailleerde of minimale subrij op bibliotheekpagina\'s.';

  @override
  String get savedThemesDeleteDialogTitle => 'Opgeslagen thema verwijderen?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '\"$themeName\" uit de cache van dit apparaat verwijderen?';
  }

  @override
  String get themeStore => 'Themawinkel';

  @override
  String get themeStoreSubtitle =>
      'Blader door community-thema\'s en sla ze op';

  @override
  String get themeStoreDescription =>
      'Sla een thema op om het net als uw andere opgeslagen thema\'s te gebruiken.';

  @override
  String get themeStoreEmpty => 'Er zijn momenteel geen thema\'s beschikbaar.';

  @override
  String get themeStoreLoadFailed =>
      'Kan de Themawinkel niet laden. Controleer uw verbinding en probeer het opnieuw.';

  @override
  String get themeStoreSave => 'Opslaan';

  @override
  String get themeStoreSaveAndApply => 'Opslaan en toepassen';

  @override
  String get themeStoreSaved => 'Opgeslagen';

  @override
  String get themeStoreInvalidMessage => 'Dit thema kon niet worden geladen.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" opgeslagen.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" van dit apparaat verwijderd.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Kan \"$themeName\" niet verwijderen.';
  }

  @override
  String get savedThemesTitle => 'Opgeslagen thema\'s';

  @override
  String get savedThemesDescription =>
      'Dit zijn thema\'s die voor de huidige server zijn gedownload van de Moonfin-plug-in. Verwijderen wist alleen deze lokale kopie.';

  @override
  String get savedThemesEmpty =>
      'Er zijn geen opgeslagen thema\'s gevonden voor deze server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Momenteel actief';
  }

  @override
  String get savedThemesDeleteTooltip => 'Opgeslagen thema verwijderen';

  @override
  String get savedThemesManageSubtitle =>
      'Beheer gedownloade plug-in-thema\'s op dit apparaat';

  @override
  String get themeEditor => 'Thema-editor';

  @override
  String get themeEditorSubtitle =>
      'Open de Moonfin Thema-editor in uw browser';

  @override
  String get homeScreen => 'Startscherm';

  @override
  String get bottomBar => 'Onderste balk';

  @override
  String get homeRowsStyleClassic => 'Klassiek';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Startrijen';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassiek behoudt per rij het afbeeldingstype en de info-overlay. Modern gebruikt rijen die van portret naar achtergrond lopen.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

  @override
  String get sortOrder => 'Sorteervolgorde';

  @override
  String get ascending => 'Oplopend';

  @override
  String get descending => 'Aflopend';

  @override
  String get displayFavoritesRows => 'Favorietenrijen weergeven';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Toon Favoriete films, series en andere favorietenrijen in Home-secties.';

  @override
  String get favoritesRowSorting => 'Sortering van favorietenrijen';

  @override
  String get favoritesRowSortingDescription =>
      'Sorteer favorietenrijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Collectierijen weergeven';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Toon Collectie-rijen in Home-secties.';

  @override
  String get collectionsRowSorting => 'Sortering van collectierijen';

  @override
  String get collectionsRowSortingDescription =>
      'Sorteer collectierijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Laat individuele afleveringen zien';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Vergroot TV shows om elke aflevering te zien.';

  @override
  String get displayGenresRows => 'Genrerijen weergeven';

  @override
  String get displayGenresRowsSubtitle => 'Toon Genre-rijen in Home-secties.';

  @override
  String get genresRowSorting => 'Sortering van genrerijen';

  @override
  String get genresRowSortingDescription =>
      'Sorteer genrerijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Items in genrerijen';

  @override
  String get genresRowItemsDescription =>
      'Toon films, series of beide in genrerijen.';

  @override
  String get displayStudiosRows => 'Laat studiorij zien';

  @override
  String get displayStudiosRowsSubtitle =>
      'Laat studiorij zien in thuissecties.';

  @override
  String get studiosRowSorting => 'Studiorij sorteren';

  @override
  String get studiosRowSortingDescription =>
      'Studio row by name, recently added, and more.';

  @override
  String get studiosRowSortOrderDescription =>
      'Kies oplopende of aflopende sortering.';

  @override
  String get selectStudiosToInclude => 'Selecteer studio\'s om mee te nemen';

  @override
  String get selectStudiosToIncludeDescription =>
      'Select which studios should be included on the home row.';

  @override
  String get selectAllStudios => 'Alles selecteren';

  @override
  String get deselectAllStudios => 'Alles deselecteren';

  @override
  String get tvStudiosFilter => 'TV-studio\'s';

  @override
  String get movieStudiosFilter => 'Filmstudio\'s';

  @override
  String get selectedStudiosFilter => 'Geselecteerde studio\'s';

  @override
  String get unselectedStudiosFilter => 'Niet-geselecteerde studio\'s';

  @override
  String get filtersHeader => 'Filters';

  @override
  String get showHeader => 'Laat zien';

  @override
  String get displayPlaylistsRows => 'Afspeellijstrijen weergeven';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Toon Afspeellijst-rijen in Home-secties.';

  @override
  String get playlistsRowSorting => 'Sortering van afspeellijstrijen';

  @override
  String get playlistsRowSortingDescription =>
      'Sorteer afspeellijstrijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Laat individuele afleveringen zien';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Vergroot TV shows om elke aflevering te zien.';

  @override
  String get displayAudioRows => 'Audiorijen weergeven';

  @override
  String get displayAudioRowsSubtitle => 'Toon Audio-rijen in Home-secties.';

  @override
  String get audioRowsSorting => 'Sortering van audiorijen';

  @override
  String get audioRowsSortingDescription =>
      'Sorteer audiorijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

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
  String get audioPlaylists => 'Audio-afspeellijsten';

  @override
  String get appearance => 'Weergave';

  @override
  String get layout => 'Lay-out';

  @override
  String get theme => 'Thema';

  @override
  String get keyboard => 'Toetsenbord';

  @override
  String get navButtons => 'Knoppen';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV-configuratie';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Externe speler-app';

  @override
  String get externalPlayerAppDescription =>
      'Stel een externe speler in om de afspeeloptie bij lang indrukken te activeren';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Toon de app-kiezer wanneer het afspelen start.';

  @override
  String get loadingInstalledPlayers => 'Geïnstalleerde spelers laden...';

  @override
  String get connection => 'Verbinding';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Ondersteund op dit apparaat';

  @override
  String get notSupportedOnThisDevice => 'Niet ondersteund op dit apparaat';

  @override
  String get mediaPlayerBehavior => 'Gedrag van mediaspeler';

  @override
  String get playbackEnhancements => 'Afspeelverbeteringen';

  @override
  String get alwaysOn => 'Altijd aan.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Aftiteling overslaan vervangen door Volgende omhoog';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Toon de overlay Volgende omhoog in plaats van de knop Aftiteling overslaan.';

  @override
  String get playerRouting => 'Spelerroutering';

  @override
  String get preferSoftwareDecoders => 'Voorkeur voor softwaredecoders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Gebruik FFmpeg (audio) en libgav1 (AV1) vóór hardwaredecoders. Schakel dit uit als HDMI-audiopassthrough niet werkt.';

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
      'Open het afspelen van video\'s in de door u gekozen externe app op Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatisch in de wachtrij plaatsen';

  @override
  String get preferSdhSubtitles => 'Voorkeur voor SDH-ondertitels';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Geef bij automatische selectie voorrang aan SDH-/CC-ondertiteltracks.';

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
  String get webDiagnostics => 'Webdiagnostiek';

  @override
  String get webDiagnosticsTitle => 'Moonfin-webdiagnostiek';

  @override
  String get webDiagnosticsIntro =>
      'Gebruik deze pagina om verbindingsproblemen in de browser te onderzoeken (CORS, gemengde inhoud en detectie-instellingen).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Fout door gemengde inhoud gedetecteerd';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS-/preflight-fout gedetecteerd';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin heeft gedetecteerd dat een HTTPS-pagina een HTTP-server-URL probeert aan te roepen. Browsers blokkeren dit verzoek voordat het uw server bereikt.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin heeft een verzoekfout op browserniveau gedetecteerd die meestal wordt veroorzaakt door ontbrekende CORS- of preflight-headers op de mediaserver.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Doel-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Details: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Huidige runtimecontext';

  @override
  String get webDiagnosticsOrigin => 'Herkomst';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Plug-in-modus';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Afgedwongen server-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Standaard server-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL van detectieproxy';

  @override
  String get notConfigured => 'niet geconfigureerd';

  @override
  String get webDiagnosticsMixedContent => 'Gemengde inhoud';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Deze pagina wordt via HTTPS geladen, maar een of meer geconfigureerde URL\'s zijn HTTP. Browsers blokkeren HTTPS-pagina\'s die HTTP-API\'s aanroepen.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Oplossing: bied uw mediaserver of proxy-eindpunt via HTTPS aan, of laad Moonfin alleen via HTTP op vertrouwde lokale netwerken.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Geen duidelijke configuratie met gemengde inhoud gevonden in de huidige runtime-instellingen.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Sta de browser-origin toe in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Neem Authorization, X-Emby-Authorization en X-Emby-Token op in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Stel Content-Range en Accept-Ranges beschikbaar voor streaming en zoekgedrag.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Geef 204 terug op OPTIONS-preflightverzoeken.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Voorbeeld van een headerfragment (nginx-stijl)';

  @override
  String get note => 'Let op';

  @override
  String get webDiagnosticsNonWebNote =>
      'Deze diagnostiekroute is bedoeld voor webbuilds. Als u dit op een ander platform ziet, zijn deze controles mogelijk niet van toepassing.';

  @override
  String get backToServerSelect => 'Terug naar serverselectie';

  @override
  String get signOutAllUsers => 'Alle gebruikers afmelden';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Microfoontoestemming is permanent geweigerd. Schakel deze in bij de systeeminstellingen.';

  @override
  String get voiceSearchPermissionRequired =>
      'Microfoontoestemming is vereist voor zoeken met spraak.';

  @override
  String get voiceSearchNoMatch => 'Niet verstaan. Probeer het opnieuw.';

  @override
  String get voiceSearchNoSpeechDetected => 'Geen spraak gedetecteerd.';

  @override
  String get voiceSearchMicrophoneError => 'Microfoonfout.';

  @override
  String get voiceSearchNeedsInternet => 'Zoeken met spraak vereist internet.';

  @override
  String get voiceSearchServiceBusy =>
      'De spraakservice is bezet. Probeer het opnieuw.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Microfoontoestemming is permanent geweigerd.';

  @override
  String get microphonePermissionDenied => 'Microfoontoestemming is geweigerd.';

  @override
  String get speechRecognitionUnavailable =>
      'Spraakherkenning is niet beschikbaar op dit apparaat.';

  @override
  String get openIosRoutePicker => 'iOS-routekiezer openen';

  @override
  String get airPlayRoutePickerUnavailable =>
      'De AirPlay-routekiezer is niet beschikbaar op dit apparaat.';

  @override
  String get videos => 'Video\'s';

  @override
  String get programs => 'Programma\'s';

  @override
  String get songs => 'Nummers';

  @override
  String get photoAlbums => 'Fotoalbums';

  @override
  String get photos => 'Foto\'s';

  @override
  String get people => 'Personen';

  @override
  String get recentlyReleasedEpisodes => 'Onlangs uitgebrachte afleveringen';

  @override
  String get watchAgain => 'Opnieuw kijken';

  @override
  String get guestAppearances => 'Gastoptredens';

  @override
  String get appearancesSeerr => 'Optredens (Seerr)';

  @override
  String get crewContributionsSeerr => 'Bijdragen van de crew (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Samen met groep kijken';

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
  String get disk => 'Schijf';

  @override
  String get openInBrowser => 'Openen in browser';

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
      'De ingebouwde browser is niet beschikbaar op dit platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Weet u zeker dat u de server opnieuw wilt opstarten?';

  @override
  String get adminShutdownServerConfirmation =>
      'Weet u zeker dat u de server wilt afsluiten? U moet hem dan handmatig opnieuw opstarten.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Inactief';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Geen gebruikers gevonden';

  @override
  String get adminNoUsersMatchSearch =>
      'Er zijn geen gebruikers die overeenkomen met uw zoekopdracht';

  @override
  String get adminNoDevicesFound => 'Geen apparaten gevonden';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Er zijn geen apparaten die overeenkomen met de huidige filters';

  @override
  String get remoteAccess => 'Externe toegang';

  @override
  String get localOnly => 'Alleen lokaal';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Kan media-analyses niet laden';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Gecombineerde analyses van alle mediabibliotheken.';

  @override
  String get analyticsTopArtists => 'Topartiesten';

  @override
  String get analyticsTopAuthors => 'Topauteurs';

  @override
  String get analyticsTopContributors => 'Topbijdragers';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bibliotheken',
      one: '1 Bibliotheek',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Er zijn nog geen totalen van geïndexeerde media beschikbaar voor deze selectie.';

  @override
  String get analyticsLibraryDetails => 'Bibliotheekdetails';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotheekoverzicht';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Er zijn geen bibliotheken beschikbaar.';

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
  String get adminServerAdministrationTitle => 'Serverbeheer';

  @override
  String get adminServerPathData => 'Gegevens';

  @override
  String get adminServerPathImageCache => 'Afbeeldingscache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logboeken';

  @override
  String get adminServerPathMetadata => 'Metagegevens';

  @override
  String get adminServerPathTranscode => 'Transcodering';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Deze server heeft geen serverpaden teruggegeven.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% gebruikt';
  }

  @override
  String get userActivity => 'Gebruikersactiviteit';

  @override
  String get systemEvents => 'Systeemgebeurtenissen';

  @override
  String get needsAttention => 'Vereist aandacht';

  @override
  String get homeVideos => 'Thuisvideo\'s';

  @override
  String get mixedContent => 'Gemengde inhoud';

  @override
  String get homeVideosAndPhotos => 'Thuisvideo\'s en foto\'s';

  @override
  String get mixedMoviesAndShows => 'Gemengde films en series';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Geen opnames gevonden';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Geen afbeeldingspagina\'s gevonden in het .$extension-archief.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Ingesloten renderer mislukt ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-renderer mislukt ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Lokaal bestand voor de lezer ontbreekt: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status bij het openen van boekgegevens van $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Geen leesbaar boekeindpunt beschikbaar';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Niet-ondersteund striparchiefformaat: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'De plug-in voor CBR-extractie is niet beschikbaar op dit platform.';

  @override
  String get failedToExtractCbrArchive =>
      'Kan het .cbr-archief niet uitpakken.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-extractie is niet beschikbaar op dit platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'De plug-in voor CB7-extractie is niet beschikbaar op dit platform.';

  @override
  String get loadingShuffle => 'Willekeurige selectie laden...';

  @override
  String get libraryShuffleLabel => 'WILLEKEURIG UIT BIBLIOTHEEK';

  @override
  String get randomShuffleLabel => 'VOLLEDIG WILLEKEURIG';

  @override
  String get genresShuffleLabel => 'WILLEKEURIG UIT GENRES';

  @override
  String get autoHdrSwitching => 'Automatisch schakelen naar HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Schakel HDR automatisch in bij het afspelen van HDR-video en herstel de weergavemodus bij het afsluiten.';

  @override
  String get whenFullscreen => 'In volledig scherm';

  @override
  String get changeArtwork => 'Afbeelding wijzigen';

  @override
  String get missing => 'Ontbreekt';

  @override
  String get clearAllArtworkButton => 'Alle afbeeldingen wissen?';

  @override
  String get clearAllArtworkWarning =>
      'Weet u zeker dat u alle gedownloade afbeeldingen wilt wissen?';

  @override
  String get confirmClear => 'Wissen bevestigen';

  @override
  String confirmClearMessage(String itemType) {
    return 'Weet u zeker dat u deze $itemType wilt wissen?';
  }

  @override
  String get uploadButton => 'Uploaden?';

  @override
  String get resolutionLabel => 'Resolutie: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Alleen afbeeldingen in de interfacetaal tonen';

  @override
  String get confirmClearAll => 'Alles wissen bevestigen';

  @override
  String get imageUploadSuccess => 'Afbeelding is geüpload!';

  @override
  String imageUploadFailed(String error) {
    return 'Kan afbeelding niet uploaden: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Kan afbeelding niet instellen: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Kan afbeelding niet verwijderen: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Kan niet alle afbeeldingen wissen: $error';
  }

  @override
  String get yes => 'Ja';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Achtergronden';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatuur';

  @override
  String get artCategory => 'Illustratie';

  @override
  String get discArtCategory => 'Schijfillustratie';

  @override
  String get screenshotCategory => 'Schermafbeelding';

  @override
  String get boxCoverCategory => 'Voorkant doos';

  @override
  String get boxRearCoverCategory => 'Achterkant doos';

  @override
  String get menuArtCategory => 'Menu-illustratie';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'achtergrond';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatuur';

  @override
  String get confirmItemArt => 'illustratie';

  @override
  String get confirmItemDiscArt => 'schijfillustratie';

  @override
  String get confirmItemScreenshot => 'schermafbeelding';

  @override
  String get confirmItemBoxCover => 'voorkant van de doos';

  @override
  String get confirmItemBoxRearCover => 'achterkant van de doos';

  @override
  String get confirmItemMenuArt => 'menu-illustratie';

  @override
  String get resolutionAll => 'Alle';

  @override
  String get resolutionHigh => 'Hoog (1080p+)';

  @override
  String get resolutionMedium => 'Gemiddeld (720p)';

  @override
  String get resolutionLow => 'Laag (<720p)';

  @override
  String get sources => 'Bronnen';

  @override
  String get audiobookChapters => 'Hoofdstukken';

  @override
  String get audiobookBookmarks => 'Bladwijzers';

  @override
  String get audiobookNotes => 'Notities';

  @override
  String get audiobookQueue => 'Wachtrij';

  @override
  String get audiobookTimeline => 'Tijdlijn';

  @override
  String get audiobookTimelineEmpty => 'De tijdlijn is leeg';

  @override
  String get audiobookFocusedTimeline => 'Gerichte tijdlijn';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Bladwijzers exporteren';

  @override
  String get audiobookExportNotes => 'Notities exporteren';

  @override
  String get audiobookExportAll => 'Alles exporteren';

  @override
  String audiobookExportSuccess(String path) {
    return 'Geëxporteerd naar $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Exporteren mislukt: $error';
  }

  @override
  String get audiobookLyrics => 'Songteksten';

  @override
  String get audiobookAddBookmark => 'Bladwijzer toevoegen';

  @override
  String get audiobookAddNote => 'Notitie toevoegen';

  @override
  String get audiobookEditNote => 'Notitie bewerken';

  @override
  String get audiobookNoteHint => 'Schrijf een notitie voor dit moment';

  @override
  String get audiobookSleepTimer => 'Slaaptimer';

  @override
  String get audiobookSleepOff => 'Uit';

  @override
  String get audiobookSleepEndOfChapter => 'Einde van hoofdstuk';

  @override
  String get audiobookSleepCustom => 'Aangepast';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Nog $remaining';
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
  String get audiobookPlaybackSpeed => 'Afspeelsnelheid';

  @override
  String get audiobookRemainingTime => 'Resterend';

  @override
  String get audiobookElapsedTime => 'Verstreken';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '${seconds}s terug';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '${seconds}s vooruit';
  }

  @override
  String get audiobookPreviousChapter => 'Vorig hoofdstuk';

  @override
  String get audiobookNextChapter => 'Volgend hoofdstuk';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Hoofdstuk $current van $total';
  }

  @override
  String get audiobookNoChapters => 'Geen hoofdstukken';

  @override
  String get audiobookNoBookmarks => 'Nog geen bladwijzers';

  @override
  String get audiobookNoNotes => 'Nog geen notities';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bladwijzer toegevoegd bij $position';
  }

  @override
  String get audiobookSpeedReset => 'Terugzetten naar 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Opslaan';

  @override
  String get audiobookCancel => 'Annuleren';

  @override
  String get audiobookDelete => 'Verwijderen';

  @override
  String get subtitlePreferencesDescription =>
      'Wijzig ondertitelmodi, standaardtalen, weergave en renderopties.';

  @override
  String get subtitleRendering => 'Ondertitelweergave';

  @override
  String get displayOptions => 'Weergaveopties';

  @override
  String get releaseDateAscending => 'Releasedatum (oplopend)';

  @override
  String get releaseDateDescending => 'Releasedatum (aflopend)';

  @override
  String get groupContributions => 'Bijdragen groeperen';

  @override
  String get groupMultipleRoles => 'Meerdere rollen groeperen';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Waarschuwing over schrijftoegang tot bibliotheek';

  @override
  String get libraryWriteAccessHowToFix => 'Zo lost u dit op:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Geef de Jellyfin-servicegebruiker (bijv. jellyfin of Docker PUID/PGID) schrijfrechten voor de mappen van uw mediabibliotheek op de server.\n\n2. Of ga naar uw Jellyfin-dashboard -> Bibliotheken, bewerk deze bibliotheek en schakel \'Save artwork into media folders\' uit om afbeeldingen op te slaan in de interne database van Jellyfin.';

  @override
  String get dismiss => 'Sluiten';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Uw bibliotheek \'$libraryName\' is ingesteld om afbeeldingen rechtstreeks in de mediamappen op te slaan (\'Save artwork into media folders\' staat aan). Jellyfin heeft de schrijftoegang echter getest en heeft geen toestemming om bestanden naar deze map te schrijven:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Het lijkt erop dat Jellyfin de afbeelding niet heeft kunnen bijwerken. Uw bibliotheek is ingesteld om afbeeldingen rechtstreeks in de mediamappen op te slaan (\'Save artwork into media folders\' staat aan). Deze fout treedt meestal op wanneer het Jellyfin-serverproces geen toestemming heeft om bestanden naar uw mediamappen te schrijven.';

  @override
  String get replay => 'Opnieuw afspelen';

  @override
  String get fileInformation => 'Bestandsinformatie';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Grootte: $size  •  Formaat: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Alle ($count) audiotracks tonen';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Alle ($count) ondertiteltracks tonen';
  }

  @override
  String get checkingDirectPlay => 'Direct Play-mogelijkheid controleren...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play-mogelijkheid: ';

  @override
  String get forced => 'Geforceerd';

  @override
  String get transcodeContainerNotSupported =>
      'Het containerformaat wordt niet ondersteund door de speler.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'De videocodec wordt niet ondersteund.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'De audiocodec wordt niet ondersteund.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Het ondertitelformaat wordt niet ondersteund (moet worden ingebrand).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Het audioprofiel wordt niet ondersteund.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Het videoprofiel wordt niet ondersteund.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Het videoniveau wordt niet ondersteund.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'De videoresolutie wordt niet ondersteund door dit apparaat.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'De videobitdiepte wordt niet ondersteund.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'De videoframerate wordt niet ondersteund.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'De bitsnelheid van het bestand overschrijdt de streaminglimiet van de speler.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'De videobitsnelheid overschrijdt de streaminglimiet.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'De audiobitsnelheid overschrijdt de streaminglimiet.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Het aantal audiokanalen wordt niet ondersteund.';

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
  String get sortAlphabetical => 'Alfabetisch';

  @override
  String get sortReleaseAscending => 'Releasevolgorde (oplopend)';

  @override
  String get sortReleaseDescending => 'Releasevolgorde (aflopend)';

  @override
  String get sortCustomDragDrop => 'Aangepast (slepen en neerzetten)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Sorteeropties voor afspeellijst';

  @override
  String get resetSort => 'Sortering herstellen';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:A$episode opnieuw kijken';
  }

  @override
  String get rewatchPlaylist => 'Afspeellijst opnieuw kijken';

  @override
  String get noSubtitlesFound => 'Geen ondertitels gevonden.';

  @override
  String get adminControls => 'Beheerdersopties';

  @override
  String get impellerRendering => 'Rendering-engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is de moderne GPU-renderer van Flutter voor vloeiendere animaties en minder haperingen. Op sommige tv-boxen en oudere GPU\'s kan dit glitches of zwarte video veroorzaken; zet het dan Uit. Automatisch kiest de beste standaardinstelling voor uw apparaat. Start Moonfin opnieuw op om de wijziging toe te passen.';

  @override
  String get impellerAuto => 'Automatisch';

  @override
  String get impellerOn => 'Aan';

  @override
  String get impellerOff => 'Uit';

  @override
  String get impellerRestartTitle => 'Opnieuw opstarten vereist';

  @override
  String get impellerRestartMessage =>
      'Moonfin moet opnieuw worden opgestart om de rendering-engine te wijzigen. Sluit de app nu en open hem daarna opnieuw om de wijziging toe te passen.';

  @override
  String get impellerCloseNow => 'App nu sluiten';

  @override
  String get adminRefreshLibrary => 'Bibliotheek vernieuwen';

  @override
  String get adminRefreshAllLibraries => 'Alle bibliotheken vernieuwen';

  @override
  String get adminRepoSortDateOldest => 'Datum toegevoegd (oudste eerst)';

  @override
  String get adminRepoSortDateNewest => 'Datum toegevoegd (nieuwste eerst)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetisch (A tot Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetisch (Z tot A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Serveranalyses laden... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Gelijk aan bron';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 films';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 series';

  @override
  String get imdbMostPopularMovies => 'IMDb populairste films';

  @override
  String get imdbMostPopularTvShows => 'IMDb populairste series';

  @override
  String get imdbLowestRatedMovies => 'IMDb laagst beoordeelde films';

  @override
  String get imdbTopEnglishMovies => 'IMDb best beoordeelde Engelstalige films';

  @override
  String get addToWatchlist => 'Voeg aan kijklijst toe';

  @override
  String get removeFromWatchlist => 'Verwijder van kijklijst';

  @override
  String get watchlistUpdateFailed => 'Kon de kijklijst niet updaten';

  @override
  String get adminSearchParameters => 'Zoek in parameters';

  @override
  String get adminCurrentMetadata => 'Huidige metadata';

  @override
  String get adminLabelYear => 'Jaar';

  @override
  String get adminReplaceImages => 'Verander bestaande afbeeldingen';

  @override
  String get adminBackToSearch => 'Terug naar zoektermen';

  @override
  String get grouping => 'Groeperen';

  @override
  String get groupByType => 'Groepeer per type';

  @override
  String get playlistTypes => 'Playlisttypes';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Audio (Muziek)';

  @override
  String get playlistTypeAudiobook => 'Luisterboek';

  @override
  String get playlistTypeBook => 'Boek';

  @override
  String get playlistTypePhoto => 'Foto';

  @override
  String get playlistTypeMixed => 'Verschillend';

  @override
  String get videoPlaylistsSection => 'Videoafspeellijst';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Audioafspeellijst';

  @override
  String get audiobookPlaylistsSection => 'Luisterboekafspeellijst';

  @override
  String get bookPlaylistsSection => 'Boekafspeellijst';

  @override
  String get photoPlaylistsSection => 'Fotoafspeellijst';

  @override
  String get mixedPlaylistsSection => 'Algemene afspeellijst';

  @override
  String get currentTime => 'Current Time';

  @override
  String get playbackTimeDisplay => 'Tijd voortgangsbalk';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Kies wat voor tijdsaanduiding staat naast de voortgangsbalk.';

  @override
  String get playbackTimeTotal => 'Totale speelduur';

  @override
  String get playbackTimeRemaining => 'Resterende tijd';

  @override
  String get playbackTimeEndsAt => 'Eindigt om';

  @override
  String get playbackTimeElapsed => 'Afgespeelde tijd';

  @override
  String get playbackTimeVideoSection => 'Videospeler';

  @override
  String get playbackTimeMusicSection => 'Muziekspeler';

  @override
  String get playbackTimeSlotDescription =>
      'Kies wat hier te zien is, of verberg het.';

  @override
  String get playbackTimeAboveBarLeft => 'Boven balk, links';

  @override
  String get playbackTimeAboveBarCenter => 'Boven balk, in het midden';

  @override
  String get playbackTimeAboveBarRight => 'Boven balk, rechts';

  @override
  String get playbackTimeBelowBarLeft => 'Onder balk, links';

  @override
  String get playbackTimeBelowBarCenter => 'Onder balk, in het midden';

  @override
  String get playbackTimeBelowBarRight => 'Onder balk, rechts';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Kies wat rechts te zien is van de voortgangsbalk bij muziek.';

  @override
  String get groupByTitle => 'Groepeer op';

  @override
  String get groupByDecade => 'Decennium (jaar)';

  @override
  String get groupByParentalRating => 'Kijkwijzer';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Laat alfabet zien';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Persoonlijke beoordelingsstijl';

  @override
  String get personalRatingThumbs => 'Vind ik (niet) leuk';

  @override
  String get personalRatingStars => '5 sterren';

  @override
  String get personalRatingNumeric => 'Getalscore tot 10';

  @override
  String get rate => 'Beoordeel';

  @override
  String get like => 'Vind ik leuk';

  @override
  String get dislike => 'Vind ik niet leuk';

  @override
  String get personalRatingClear => 'Haal beoordeling weg';

  @override
  String get personalRatingRated => 'Beoordeeld';

  @override
  String get personalRatingMine => 'Mijn score';

  @override
  String get personalRatingSaveFailed => 'Kon de beoordeling niet opslaan';

  @override
  String get increase => 'Verhoog';

  @override
  String get decrease => 'Verlaag';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'Bezig';

  @override
  String get filterUnreleased => 'Onuitgebracht';

  @override
  String get filterTrailers => 'Trailers';

  @override
  String get filterExtras => 'Extra\'s';

  @override
  String get filterThemeSongs => 'Themaliedjes';

  @override
  String get filterThemeVideos => 'Themavideo\'s';

  @override
  String get source => 'Bron';

  @override
  String get years => 'Jaren';

  @override
  String get audioLanguage => 'Audiotaal';

  @override
  String get subtitleLanguage => 'Ondertiteltaal';

  @override
  String get clearFilters => 'Wis filters';

  @override
  String get seerrShortcutsRow => 'Seerr bladeren';

  @override
  String get seerrReleased => 'Uitgebracht';

  @override
  String get seerrMinRating => 'Minimale beoordeling';

  @override
  String get seerrMinVotes => 'Minimale stemmen';

  @override
  String get seerrOriginalLanguage => 'Oorspronkelijke taal';

  @override
  String get seerrRuntime => 'Looptijd';

  @override
  String get subtitleHdrSeparate => 'Aparte HDR-stijl';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'White is much brighter in HDR than in SDR, so a dimmer style here avoids the glare';

  @override
  String get scrollSensitivity => 'Scrollgevoeligheid';

  @override
  String get scrollSensitivitySubtitle =>
      'How far one mouse wheel notch scrolls';

  @override
  String get mediaDetailsAndSpoilers => 'Mediadetails en spoilers';

  @override
  String get openTrailersExternally => 'Open trailers in externe app';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailers open in the YouTube app or browser instead of the built-in player';

  @override
  String get hideDetailsMediaDescription =>
      'Verberg de mediabeschrijving op de detailpagina';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get detailUseSeriesThumbnails =>
      'Gebruik serieminiaturen op de detailpagina';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Replace all thumbnails on Classic details page with series thumbnail';

  @override
  String get hideHomeMediaDescription =>
      'Verberg mediaomschrijving op thuisscherm';

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
  String get continueWatchingAndNextUpHeader =>
      'Doorgaan met kijken en Volgende';

  @override
  String get setupSkip => 'Setup overslaan';

  @override
  String get setupNavbarQuestion => 'Waar moet de navigatie heen?';

  @override
  String get setupMediaBarQuestion =>
      'How should the top of your Home screen look?';

  @override
  String get setupHomeRowsQuestion => 'Hoe moeten uw rijen eruit zien?';

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
  String get setupStyleClassic => 'Klassiek';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint => 'Compact. More rows on screen at once.';

  @override
  String get setupRowsModernHint => 'Grotere kaarten met titels eronder.';

  @override
  String get setupDetailClassicHint => 'Alles gecentreerd in een stapel.';

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
  String get setupPickALook => 'Kies een look';

  @override
  String get setupTourMoreHeader => 'Er is meer onder Instellingen';

  @override
  String get setupTourBulletRequests => 'Seerr-aanvragen';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay kijkfeesten';

  @override
  String get setupTourBulletThemes => 'Aangepaste thema\'s';

  @override
  String get setupTourBulletDownloads => 'Offline downloads';

  @override
  String get setupTourBulletMore => 'En nog veel meer';

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
  String get runSetupAgain => 'Voer de installatie opnieuw uit';

  @override
  String get serverMessages => 'Berichten';

  @override
  String get serverMessagesEmpty => 'Nog geen berichten van uw server';

  @override
  String get serverMessagesMarkAllRead => 'Alles als gelezen markeren';

  @override
  String get serverMessagesShowButton => 'Laat berichtenknop zien';

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
  String get integrations => 'Integraties';

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
