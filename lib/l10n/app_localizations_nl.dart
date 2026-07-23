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
  String get accountPreferences => 'ACCOUNTVOORKEUREN';

  @override
  String get interfaceLanguage => 'Interfacetaal';

  @override
  String get systemLanguageDefault => 'Systeemstandaard';

  @override
  String get signIn => 'Inloggen';

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
  String get waitingForAuthorization => 'Wachten op toestemming...';

  @override
  String get back => 'Terug';

  @override
  String get serverUnavailable => 'Server is niet beschikbaar';

  @override
  String get loginFailed => 'Inloggen mislukt';

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
      'Moonfin heeft geen toegang tot uw systeemsleutelhanger. Inloggen kan doorgaan, maar veilige tokenopslag is mogelijk niet beschikbaar totdat de sleutelhanger wordt ontgrendeld.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-thema';

  @override
  String get detailScreenStyle => 'Stijl van detailscherm';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassiek is de oorspronkelijke gecentreerde moonfin-lay-out. Modern is een responsieve, filmische lay-out.';

  @override
  String get detailScreenStyleMoonfin => 'Klassiek';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

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
  String get glassQuality => 'Glaskwaliteit';

  @override
  String get glassQualitySubtitle =>
      'Auto kiest het beste glaseffect voor dit apparaat. Volledig dwingt echte vervaging af; Beperkt gebruikt een lichtgewicht glas dat GPU-vermogen bespaart.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Volledig';

  @override
  String get glassQualityReduced => 'Beperkt';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Pas een volledig aangepast thema toe en schakel tussen een op Apple of Material Design geïnspireerde gebruikersinterface.';

  @override
  String get customThemeTitle => 'Aangepast thema';

  @override
  String get customThemeSubtitle =>
      'Aangepaste thema\'s veranderen visuele elementen in heel Moonfin. Kies een van deze opties die bij uw stijl past.';

  @override
  String get keyboardPreferSystemIme => 'Voorkeur voor systeemtoetsenbord';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Gebruik standaard de invoermethode van uw apparaat voor tekstinvoer';

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
  String get themeGlass => 'Glass';

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
  String get gameEmulatorSettings => 'Emulatorinstellingen';

  @override
  String get gameNoCoreOptions => 'Deze core heeft geen aanpasbare opties.';

  @override
  String get gameHoldToOpenMenu => 'Houd ingedrukt om het menu te openen';

  @override
  String get gamePlaybackUnsupported =>
      'Games afspelen wordt op dit apparaat nog niet ondersteund.';

  @override
  String get noHomeRowsLoaded => 'Er konden geen thuisrijen worden geladen';

  @override
  String get noHomeRowsHint =>
      'Probeer actieve huisgedeelten te vernieuwen of te verminderen.';

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
  String get browseByLetter => 'Blader per brief';

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
  String get continuing => 'Voortzetting';

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
  String get pickDiscoverySubjects =>
      'Kies welke onderwerpfeeds u wilt weergeven in Discover.';

  @override
  String get apply => 'Toepassen';

  @override
  String get openLink => 'Link openen';

  @override
  String get scanWithYourPhone => 'Scannen met uw telefoon';

  @override
  String get audiobookGenres => 'Audioboek-genres';

  @override
  String get pickAudiobookGenres =>
      'Kies welke genres je wilt weergeven in Audioboek ontdekken.';

  @override
  String get discoverAudiobooks => 'Ontdek audioboeken';

  @override
  String get librivoxDescription =>
      'Populaire titels uit het publieke domein van LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titels';
  }

  @override
  String get scrollLeft => 'Scroll naar links';

  @override
  String get scrollRight => 'Scroll naar rechts';

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
  String get popularNow => 'Populair nu';

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
  String get handPickedFromLibrary => 'Met de hand geplukt uit uw bibliotheek.';

  @override
  String get handPickedFromListeningQueue =>
      'Met de hand geplukt uit uw luisterwachtrij.';

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
  String get trendingTitlesOpenLibrary =>
      'Populaire titels per onderwerp vanaf Open Library.';

  @override
  String get noBookmarkedItems => 'Er zijn nog geen items met bladwijzers';

  @override
  String get nothingMatchesSection =>
      'Er is nog niets dat overeenkomt met deze sectie. Probeer een ander tabblad of kom terug nadat de bibliotheeksynchronisatie is voltooid.';

  @override
  String get audiobooks => 'Audioboeken';

  @override
  String noLabelFound(String label) {
    return 'Geen $label gevonden';
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
  String get latestAudiobooks => 'Nieuwste audioboeken';

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
  String get bookFormatAudiobook => 'Audioboek';

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
  String get downloadZip => 'Zip downloaden';

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
  String get audiobookDetails => 'Audioboekdetails';

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
  String get noBooksFound => 'Er zijn geen boeken gevonden voor deze auteur.';

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
      other: '$count Seizoenen',
      one: '1 Seizoen',
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
  String get restart => 'Opnieuw opstarten';

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
  String get downloadAll => 'Alles downloaden';

  @override
  String get download => 'Downloaden';

  @override
  String get deleteDownloaded => 'Gedownload verwijderen';

  @override
  String get goToSeries => 'Ga naar Serie';

  @override
  String get editMetadata => 'Metagegevens bewerken';

  @override
  String get less => 'Minder';

  @override
  String get more => 'Meer';

  @override
  String get deleteItem => 'Artikel verwijderen';

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
    return 'Gedownloade tracks voor \"$title\" verwijderen?';
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
  String get itemDeleted => 'Artikel verwijderd';

  @override
  String get noPlayableTrailerFound => 'Geen speelbare trailer gevonden.';

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
  String get director => 'DIRECTEUR';

  @override
  String get directors => 'REGISSEURS';

  @override
  String get writer => 'SCHRIJVER';

  @override
  String get writers => 'SCENARISTEN';

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
  String get shuffleAll => 'Shuffle All';

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
  String channelsCount(int count) {
    return '$count kan.';
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
    return 'Track $number';
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
  String get bitrateOverride => 'Bitrate overschrijven';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video-bitsnelheid';

  @override
  String get track => 'Track';

  @override
  String get channels => 'Kanalen';

  @override
  String get audioBitrate => 'Audio-bitsnelheid';

  @override
  String get sampleRate => 'Proeffrequentie';

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
  String get guideTimeline => 'Gids Tijdlijn';

  @override
  String failedToLoadGuide(String error) {
    return 'Kan gids niet laden: $error';
  }

  @override
  String get noChannelsFound => 'Geen kanalen gevonden';

  @override
  String get liveBadge => 'LIVE';

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
  String get cancelRecordingAction => 'Opname annuleren';

  @override
  String get programSetToRecord => 'Programma wordt opgenomen';

  @override
  String get recordingCancelled => 'Opname geannuleerd';

  @override
  String get unableToCreateRecording => 'Kan opname niet aanmaken';

  @override
  String get watch => 'Kijken';

  @override
  String get close => 'Sluiten';

  @override
  String failedToPlayChannel(String name) {
    return 'Kan $name niet afspelen';
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
    return '$count tracks';
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
  String get serverSyncAndPluginStatus =>
      'Serversynchronisatie en plug-instatus';

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
  String get integrations => 'Integraties';

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
  String get backgroundBackdrops => 'Achtergrond Achtergronden';

  @override
  String get showBackdropImages =>
      'Toon achtergrondafbeeldingen achter de inhoud';

  @override
  String get seriesThumbnails => 'Serieminiaturen';

  @override
  String get seriesThumbnailsDescription =>
      'Alleen afleveringen: gebruik serieillustraties die overeenkomen met elk rijafbeeldingstype';

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
  String get snow => 'Sneeuw';

  @override
  String get fireworks => 'Vuurwerk';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'Vallende bladeren';

  @override
  String get themeMusic => 'Thema Muziek';

  @override
  String get playThemeMusicOnDetailPages =>
      'Speel themamuziek af op detailpagina\'s';

  @override
  String get themeMusicVolume => 'Themamuziekvolume';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detailpagina\'s, startrijen en volume';

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
  String get stretch => 'Strek';

  @override
  String get refreshRateSwitching => 'Wisselen van vernieuwingsfrequentie';

  @override
  String get disabled => 'Uitgeschakeld';

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
  String get showDescriptionOnPause => 'Beschrijving weergeven bij pauze';

  @override
  String get dimVideoShowOverview =>
      'Video dimmen en overzichtstekst weergeven tijdens pauze';

  @override
  String get osdLockButton => 'OSD-vergrendelknop';

  @override
  String get osdLockButtonDescription =>
      'Toon een vergrendelknop die aanraakinvoer blokkeert totdat deze lang wordt ingedrukt';

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
  String get transcodingAudio => 'Transcoderen (audio)';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoderen (bitsnelheid of resolutie)';

  @override
  String get transcodingVideoAndAudio => 'Transcoderen (video en audio)';

  @override
  String get transcodingVideo => 'Transcoderen (video)';

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
  String get enableTrueHdAudio =>
      'Schakel TrueHD-audio in (werkt mogelijk niet op alle platforms)';

  @override
  String get settingsAudioOutputMode => 'Audio-uitvoermodus';

  @override
  String get settingsAudioOutputModeDescription =>
      'Kies hoe audio wordt gedecodeerd. AVR Passthrough stuurt onbewerkte Dolby/DTS-streams naar uw receiver; Auto of Downmix decodeert lokaal.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Terugvalcodec voor audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selecteer het doelformaat waarnaar meerkanaalsaudio wordt getranscodeerd wanneer de bronstream niet direct kan worden afgespeeld of doorgegeven.';

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
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Verliesvrij)';

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
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos)-passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-passthrough';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos-passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) als bitstream naar een externe decoder sturen.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Dolby Atmos via EAC3 (JOC) als bitstream naar een externe decoder sturen.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (inclusief DTS-core) als bitstream naar een externe decoder sturen.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Dolby TrueHD met Atmos-metagegevens als bitstream naar een externe decoder sturen.';

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
  String get settingsAudioDiagnostics => 'Diagnostiek';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Videoniveau';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videobereik';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Ondertitelcodec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Toegestane audiocodecs';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS-audiocodecs';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4-audiocodecs';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Actieve audioroute';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'HD-audio-ondersteuning van route';

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
  String get defaultToNoSubtitles => 'Standaard ingesteld op Geen ondertitels';

  @override
  String get turnOffSubtitlesByDefault => 'Schakel ondertitels standaard uit';

  @override
  String get subtitleSize => 'Grootte ondertiteling';

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
  String get customizationProfile => 'Aanpassingsprofiel';

  @override
  String get customizationProfileDescription =>
      'Kies het profiel dat u wilt laden, bewerken en synchroniseren. Globaal is overal van toepassing tenzij een apparaatprofiel dit overschrijft. De groene stip markeert uw huidige apparaatprofiel.';

  @override
  String get loadProfile => 'Profiel laden';

  @override
  String get syncing => 'Synchroniseren...';

  @override
  String get syncToProfile => 'Synchroniseren met profiel';

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
      'Transcoding: Time Remaining Unavailable';

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
  String get showLibrariesInToolbar => 'Bibliotheken weergeven in de werkbalk';

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
  String get enableFolderView => 'Schakel Mapweergave in';

  @override
  String get showFolderBrowsingOption => 'Toon de mapzoekoptie';

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
  String get localPreviews => 'Lokale voorbeelden';

  @override
  String get localPreviewsDescription =>
      'Configureer trailer-, media- en audiovoorbeelden.';

  @override
  String get mediaBarMode => 'Mediabalkstijl';

  @override
  String get mediaBarModeDescription =>
      'Kies uit verschillende stijlen voor de mediabalk of schakel de mediabalk uit';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Uit';

  @override
  String get enableMediaBar => 'Mediabalk inschakelen';

  @override
  String get showFeaturedContentSlideshow =>
      'Toon diavoorstelling met uitgelichte inhoud op Home';

  @override
  String get contentType => 'Inhoudstype';

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
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription =>
      'Show captions on YouTube trailers in the media bar';

  @override
  String get episodePreview => 'Aflevering voorbeeld';

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
  String get latestMedia => 'Recent toegevoegde media';

  @override
  String get recentlyReleased => 'Onlangs uitgebracht';

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
  String get homeSections => 'Home-secties';

  @override
  String get resetToDefaults => 'Terugzetten naar standaardwaarden';

  @override
  String get homeRowPosterSize => 'Posterformaat thuisrij';

  @override
  String get perRowImageTypeSelection => 'Per rij beeldtypeselectie';

  @override
  String get configureImageTypeForEachRow =>
      'Configureer het afbeeldingstype voor elke ingeschakelde thuisrij';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Samenvoegen, doorgaan met kijken en volgende';

  @override
  String get combineBothRows => 'Combineer beide rijen tot één woongedeelte';

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
  String get perRowImageType => 'Per rij afbeeldingstype';

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
  String get showClock => 'Klok tonen';

  @override
  String get displayClockDuringScreensaver =>
      'Klok weergeven tijdens screensaver';

  @override
  String get clockModeStatic => 'Statisch';

  @override
  String get clockModeBouncing => 'Stuiterend';

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
  String get pluginLabel => 'Moonbase-plug-in';

  @override
  String get pluginDetected => 'Plug-in gedetecteerd';

  @override
  String get pluginNotDetected => 'Plug-in niet gedetecteerd';

  @override
  String get pluginDetectedDescription =>
      'Serverplug-in gedetecteerd. Synchronisatie wordt automatisch ingeschakeld wanneer de plug-in voor de eerste keer wordt gevonden.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplug-in wordt momenteel niet gedetecteerd. Lokale instellingen gebruiken nog steeds hun opgeslagen waarden of ingebouwde standaardinstellingen.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersie: $version';
  }

  @override
  String get availableServices => 'Beschikbare diensten';

  @override
  String get serverPluginSync => 'Synchronisatie van serverplug-ins';

  @override
  String get syncSettingsWithPlugin =>
      'Synchroniseer instellingen met de serverplug-in';

  @override
  String get whatSyncControls => 'Welke synchronisatiebedieningen';

  @override
  String get syncControlsDescription =>
      'Synchronisatie bepaalt alleen of door plug-ins ondersteunde instellingen naar de server worden gepusht en daaruit worden gehaald. Profielselectie en profielsynchronisatieacties bevinden zich in de aanpassingsinstellingen wanneer plug-insynchronisatie is ingeschakeld.';

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
  String get seerrDiscoveryRows => 'Seerr-ontdekkingsrijen';

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
  String get reorderToggleHomeRows =>
      'Herschik de bibliotheek- en externgebaseerde thuisrijen en schakel ze om';

  @override
  String get featuredContentAppearance => 'Uitgelichte inhoud, uiterlijk';

  @override
  String get posterSizeImageTypeFolderView =>
      'Posterformaat, afbeeldingstype, mapweergave';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList-, TMDB- en beoordelingsbronnen';

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
  String get request => 'Verzoek';

  @override
  String get cancelRequest => 'Aanvraag annuleren';

  @override
  String get playInMoonfin => 'Speel in Moonfin';

  @override
  String requestedByName(String name) {
    return 'Aangevraagd door $name';
  }

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
  String get submitRequest => 'Verzoek indienen';

  @override
  String get allSeasons => 'Alle seizoenen';

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
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analyses';

  @override
  String get adminDrawerSettings => 'Instellingen';

  @override
  String get adminDrawerBranding => 'Branding';

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
  String adminRecentAlertEntries(int count) {
    return 'Recente waarschuwings-/foutmeldingen: $count';
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
  String get adminScanLibraries => 'Bibliotheken scannen';

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
  String get direct => 'Direct';

  @override
  String get adminDisconnect => 'Verbreek de verbinding';

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
  String get adminLibraryOptionsSaved => 'Bibliotheekopties opgeslagen';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Kan opties niet opslaan: $error';
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
  String get adminSaveOptions => 'Opties opslaan';

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
  String get adminLibArchiveMediaFiles =>
      'Archieven behandelen als mediabestanden';

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
  String get adminNoPathsAdded =>
      'Geen paden toegevoegd (kan later worden toegevoegd)';

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
  String get adminNoProfileChanges =>
      'Er zijn geen profielwijzigingen om op te slaan';

  @override
  String get adminProfileSaved => 'Profiel opgeslagen';

  @override
  String adminSaveFailed(String error) {
    return 'Opslaan mislukt: $error';
  }

  @override
  String get adminPermissionsSaved => 'Machtigingen opgeslagen';

  @override
  String get adminPasswordsMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String adminFailed(String error) {
    return 'Mislukt: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kan gebruiker niet laden';

  @override
  String get adminBackToUsers => 'Terug naar Gebruikers';

  @override
  String get adminSaveProfile => 'Profiel opslaan';

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
  String get adminAllowContentDeletion => 'Sta verwijdering van inhoud toe';

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
  String get adminRemoteBitrateLimit =>
      'Bitratelimiet voor externe client (bps)';

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
  String get adminSavePermissions => 'Bewaar machtigingen';

  @override
  String get adminEnableAllLibraryAccess =>
      'Schakel toegang tot alle bibliotheken in';

  @override
  String get adminSaveAccess => 'Toegang opslaan';

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
  String get adminDeviceAndChannelAccess => 'Apparaat- en kanaaltoegang';

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
  String get adminEnabledDevices => 'Ingeschakelde apparaten';

  @override
  String get adminEnabledChannels => 'Ingeschakelde kanalen';

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
  String get adminBackupInclude => 'Kies wat u in de back-up wilt opnemen.';

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
  String get adminTimeLimit => 'Tijdslimiet (optioneel)';

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
  String get adminMissingAuthToken =>
      'Kan de instellingen niet openen: er ontbreekt een authenticatietoken.';

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
  String get adminBrandingSaved => 'Brandinginstellingen opgeslagen';

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
  String get adminStreamingSaved => 'Streaminginstellingen opgeslagen';

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
  String get adminPlaybackSaved => 'Afspeelinstellingen opgeslagen';

  @override
  String get adminPlaybackLoadFailed => 'Kan afspeelinstellingen niet laden';

  @override
  String get adminPlaybackTranscoding => 'Afspelen / transcoderen';

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
  String get adminTrickplaySaved => 'Trickplay-instellingen opgeslagen';

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
  String get adminResumeSaved => 'Hervat instellingen opgeslagen';

  @override
  String get adminResumeLoadFailed => 'Kan de CV-instellingen niet laden';

  @override
  String get adminResumeDescription =>
      'Configureer wanneer inhoud moet worden gemarkeerd als gedeeltelijk afgespeeld of volledig afgespeeld.';

  @override
  String get adminMinResumePercentage => 'Minimaal CV-percentage';

  @override
  String get adminMinResumeSubtitle =>
      'Content moet voorbij dit percentage worden afgespeeld om voortgang te besparen';

  @override
  String get adminMaxResumePercentage => 'Maximaal CV-percentage';

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
  String get adminNetworkingSaved =>
      'Netwerkinstellingen opgeslagen. Mogelijk is een herstart van de server vereist.';

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
  String get adminMetadataSaved => 'Metagegevens opgeslagen';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kan metagegevens niet laden: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Kan metagegevens niet opslaan: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metagegevens vernieuwen';

  @override
  String get recursive => 'Recursief';

  @override
  String get adminReplaceAllMetadata => 'Vervang alle metagegevens';

  @override
  String get adminReplaceAllImages => 'Vervang alle afbeeldingen';

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
  String get adminAddTuner => 'Tuner toevoegen';

  @override
  String get adminEditTuner => 'Tuner bewerken';

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
  String get adminEditProvider => 'Provider bewerken';

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
  String get adminSdGetListings => 'Overzichten ophalen';

  @override
  String get adminSdListings => 'Overzichten';

  @override
  String get adminEnableAllTuners => 'Alle tuners inschakelen';

  @override
  String get adminTunerType => 'Tunertype';

  @override
  String get adminTunerAdded => 'Tuner toegevoegd';

  @override
  String adminTunerAddFailed(String error) {
    return 'Kan tuner niet toevoegen: $error';
  }

  @override
  String get adminAddGuideProvider => 'Gidsaanbieder toevoegen';

  @override
  String get adminProviderType => 'Type aanbieder';

  @override
  String get adminProviderAdded => 'Aanbieder toegevoegd';

  @override
  String adminProviderAddFailed(String error) {
    return 'Kan provider niet toevoegen: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kan tuner niet verwijderen: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tunerreset aangevraagd';

  @override
  String adminTunerResetFailed(String error) {
    return 'Kan tuner niet resetten: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Dit tunertype ondersteunt resetten niet.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kan provider niet verwijderen: $error';
  }

  @override
  String get adminRecordingSettings => 'Opname-instellingen';

  @override
  String get adminPrePadding => 'Voorvulling (minuten)';

  @override
  String get adminPostPadding => 'Post-opvulling (minuten)';

  @override
  String get adminRecordingPath => 'Opnamepad';

  @override
  String get adminSeriesRecordingPath => 'Serie-opnamepad';

  @override
  String get adminMovieRecordingPath => 'Opnamepad voor films';

  @override
  String get adminGuideDays => 'Dagen gidsgegevens';

  @override
  String get adminGuideDaysAuto => 'Automatisch';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dagen';
  }

  @override
  String get adminRecordingPostProcessor => 'Pad naar nabewerkingsprogramma';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenten voor nabewerking';

  @override
  String get adminSaveRecordingNfo => 'NFO-metagegevens van opname opslaan';

  @override
  String get adminSaveRecordingImages => 'Opnameafbeeldingen opslaan';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Opnamepaden';

  @override
  String get adminLiveTvSectionPostProcessing => 'Nabewerking';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Gidsgegevens: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Opname-instellingen opgeslagen';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kan instellingen niet opslaan: $error';
  }

  @override
  String get adminSetChannelMappings => 'Kanaaltoewijzingen instellen';

  @override
  String get adminMappingJson => 'JSON in kaart brengen';

  @override
  String get adminMappingJsonHint => 'Voorbeeld: toewijzingen JSON-payload';

  @override
  String get adminChannelMappingsUpdated => 'Kanaaltoewijzingen bijgewerkt';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Kan toewijzingen niet bijwerken: $error';
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
  String get adminRefreshGuideData => 'Gidsgegevens vernieuwen';

  @override
  String get adminGuideRefreshStarted => 'Vernieuwen van gidsgegevens gestart';

  @override
  String get adminGuideRefreshUnavailable =>
      'De taak voor het vernieuwen van de gids is niet beschikbaar op deze server.';

  @override
  String get adminAddProvider => 'Aanbieder toevoegen';

  @override
  String get adminNoListingProviders =>
      'Er zijn geen vermeldingsproviders geconfigureerd';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Opnamepad: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Seriepad: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Marge vooraf: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Marge achteraf: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tuner-detectie';

  @override
  String get adminChannelMappings => 'Kanaaltoewijzingen';

  @override
  String get adminNoDiscoveredTuners => 'Nog geen ontdekte tuners';

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
  String get adminRestoreRequested =>
      'Herstel aangevraagd. Het opnieuw opstarten van de server kan deze sessie verbreken.';

  @override
  String get adminBackupsTitle => 'Back-ups';

  @override
  String get adminUnknownDate => 'Onbekende datum';

  @override
  String get adminUnnamedBackup => 'Naamloze back-up';

  @override
  String get adminLiveTvNotAvailable =>
      'Live TV-beheer is niet beschikbaar op deze serverbuild.';

  @override
  String get adminLiveTvTitle => 'Live tv-beheer';

  @override
  String get adminApply => 'Toepassen';

  @override
  String get adminNotSet => 'Niet ingesteld';

  @override
  String get adminReset => 'Resetten';

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
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Overzicht';

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
  String get adminMetadataRecursive => 'Recursief';

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
  String get adminPluginsNoSearchResults =>
      'Er zijn geen plug-ins die overeenkomen met uw zoekopdracht';

  @override
  String get adminPluginsNoneInstalled => 'Geen plug-ins geïnstalleerd';

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
  String get adminNetworkingRemoteAccess => 'Schakel externe toegang in';

  @override
  String get adminNetworkingPorts => 'Poorten';

  @override
  String get adminNetworkingHttpPort => 'HTTP-poort';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-poort';

  @override
  String get adminNetworkingEnableHttps => 'Schakel HTTPS in';

  @override
  String get adminNetworkingLocalNetwork => 'Lokaal netwerk';

  @override
  String get adminNetworkingLocalAddresses => 'Lokale netwerkadressen';

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
  String get adminBrandingTitle => 'Branding';

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
  String get adminPlaybackEnableHwDecoding =>
      'Schakel hardwaredecodering in voor:';

  @override
  String get adminPlaybackQsvDevice => 'QSV-apparaat';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Verbeterde NVDEC-decoder inschakelen';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Voorkeur voor de eigen hardwaredecoder van het systeem';

  @override
  String get adminPlaybackColorDepth => 'Kleurdiepte voor hardwaredecodering';

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
  String get adminPlaybackPresetsQuality => 'Presets en kwaliteit';

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
  String get adminResumeMinAudiobookPct => 'Minimaal audioboek-cv-percentage';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maximaal cv-percentage voor audioboeken';

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
  String adminTaskTriggerInterval(String duration) {
    return 'Elke $duration';
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
  String get adminTaskTriggerEvery6Hours => 'Elke 6 uur';

  @override
  String get adminTaskTriggerEvery12Hours => 'Elke 12 uur';

  @override
  String get adminTaskTriggerEvery24Hours => 'Elke 24 uur';

  @override
  String get adminTaskTriggerEvery2Days => 'Elke 2 dagen';

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
  String get adminTaskTriggerNoLimit => 'Geen limiet';

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
  String get adminNetworkingHttps => 'HTTPS';

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
  String get adminNetworkingIpSettings => 'IP-instellingen';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 inschakelen';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 inschakelen';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Automatische poorttoewijzing inschakelen';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-netwerken';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Lijst met IP-adressen of CIDR-subnetten, gescheiden door komma\'s of regels, die als lokaal netwerk worden beschouwd.';

  @override
  String get adminNetworkingPublishedUris => 'Gepubliceerde server-URI\'s';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Wijs een subnet of adres toe aan een gepubliceerde URL, bijv. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Certificaatpad';

  @override
  String get adminNetworkingRemoteIpFilter => 'Extern IP-filter';

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
  String get adminResumeMinPct => 'Minimaal CV-percentage';

  @override
  String get adminResumeMinPctSubtitle =>
      'Content moet voorbij dit percentage worden afgespeeld om voortgang te besparen';

  @override
  String get adminResumeMaxPct => 'Maximaal CV-percentage';

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
  String get adminDiscover => 'Ontdekken';

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
  String get offlineBannerAction => 'Downloads';

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
  String get pinIncorrect => 'Onjuiste pincode';

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
  String get settingsAdministrationSubtitle => 'Open het serverbeheerpaneel';

  @override
  String get settingsAccountSecurity => 'Account en beveiliging';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Authenticatie, pincode en ouderlijk toezicht';

  @override
  String get settingsPersonalization => 'Personalisatie';

  @override
  String get settingsPersonalizationSubtitle =>
      'Thema, navigatie, startrijen en zichtbaarheid van de bibliotheek';

  @override
  String get settingsDynamicContent => 'Dynamische inhoud';

  @override
  String get settingsDynamicContentSubtitle => 'Mediabalk en visuele overlays';

  @override
  String get settingsPlaybackSyncplay => 'Afspelen en SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Audio-/video-instellingen, ondertitels, downloads en SyncPlay-bedieningselementen';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plug-insynchronisatie, Seerr, beoordelingen en meer';

  @override
  String get settingsAboutSubtitle =>
      'App-versie, juridische informatie en tegoeden';

  @override
  String get settingsAuthenticationSection => 'AUTHENTICATIE';

  @override
  String get settingsSortServersBy => 'Sorteer servers op';

  @override
  String get settingsLastUsed => 'Laatst gebruikt';

  @override
  String get settingsAlphabetical => 'Alfabetisch';

  @override
  String get settingsConnectionSection => 'VERBINDING';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Zelfondertekende certificaten toestaan';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Vertrouw servers die zelfondertekende of privé-CA-TLS-certificaten gebruiken. Schakel dit alleen in voor servers die u zelf beheert. Hiermee wordt certificaatvalidatie voor alle verbindingen uitgeschakeld.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACY & VEILIGHEID';

  @override
  String get settingsBlockedRatings => 'Geblokkeerde beoordelingen';

  @override
  String get settingsGeneralStyle => 'Algemene stijl';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Thema-accenten, achtergronden, en bekeken indicatoren';

  @override
  String get settingsDetailsScreen => 'Detailscherm';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stijl, achtergrondvervaging en tabbladgedrag';

  @override
  String get settingsHomePage => 'Startpagina';

  @override
  String get settingsHomePageSubtitle =>
      'Secties, afbeeldingstypen, overlays en mediavoorbeelden';

  @override
  String get settingsLibrariesSubtitle =>
      'Zichtbaarheid van de bibliotheek, mapweergave en gedrag op meerdere servers';

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
  String get settingsMetadataAndRatings => 'Metagegevens en beoordelingen';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase maakt server-side integraties mogelijk, waaronder extra beoordelingsbronnen, Seerr-verzoeken en gesynchroniseerde voorkeuren.';

  @override
  String get settingsOfflineDownloads => 'Offlinedownloads';

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
  String get settingsPoweredByFlutter => 'Mogelijk gemaakt door Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# licentiemeldingen',
      one: '# licentiemelding',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Beide';

  @override
  String get settingsShuffleContentTypeFilter => 'Shuffle inhoudstypefilter';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Voorkeuren voor video afspelen';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Kernvideo-engine en instellingen voor streamingkwaliteit';

  @override
  String get settingsAudioPreferences => 'Audiovoorkeuren';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Opties voor audiotracks, verwerking en passthrough';

  @override
  String get settingsAutomationAndQueue => 'Automatisering en wachtrij';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Geautomatiseerd afspelen en sequencen';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Downloadkwaliteit, opslaglimieten en wachtrijgrootte';

  @override
  String get settingsSyncplaySubtitle =>
      'Synchronisatielogica voor groepssessies';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Gespecialiseerde spelerfuncties. Wees voorzichtig, aangezien sommige opties afspeelproblemen kunnen veroorzaken';

  @override
  String get settingsSkipIntrosAndOutros => 'Intro\'s en Outro\'s overslaan?';

  @override
  String get settingsMediaSegmentCountdown => 'Aftellen bij mediasegmenten';

  @override
  String get settingsProgressBar => 'Voortgangsbalk';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Geen';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (verouderd)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (verouderd)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (aanbevolen)';

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
  String get settingsAutoAftkrtEnabled => 'Automatisch (AFTKRT ingeschakeld)';

  @override
  String get settingsEnabledOnThisDevice => 'Ingeschakeld op dit apparaat';

  @override
  String get settingsDisabledPreferTranscode =>
      'Uitgeschakeld (voorkeur voor transcoderen)';

  @override
  String get settingsResumeRewindDescription =>
      'Hoeveel seconden moeten worden teruggespoeld bij het hervatten van het afspelen (via \'Doorgaan met kijken\' of een media-itempagina)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Hoeveel seconden moeten worden teruggespoeld als u het afspelen hervat nadat u op de pauzeknop hebt gedrukt?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hoeveel seconden moet je terugspringen nadat je op de terugspoelknop hebt gedrukt?';

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
      'Dolby Vision-profiel 7 toewijzen aan HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Speel Dolby Vision profiel 7-streams af als HDR10-compatibele HEVC op apparaten zonder Dolby Vision.';

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
  String get hideBackdropsInLibraries =>
      'Achtergronden verbergen tijdens bladeren?';

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
  String get homeRowDisplay => 'Weergave van startrijen';

  @override
  String get homeRowSections => 'Secties van startrijen';

  @override
  String get homeRowToggles => 'Startrijschakelaars';

  @override
  String get homeRowTogglesSubtitle =>
      'Schakel bibliotheekcategorieën voor startrijen in of uit';

  @override
  String get homeRowTogglesDescription =>
      'Schakel de volgende opties in om de rijen in Home-secties weer te geven.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassiek behoudt per rij het afbeeldingstype en de info-overlay. Modern gebruikt rijen die van portret naar achtergrond lopen.';

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
  String get displayGenresRows => 'Genrerijen weergeven';

  @override
  String get displayGenresRowsSubtitle => 'Toon Genre-rijen in Home-secties.';

  @override
  String get genresRowSorting => 'Sortering van genrerijen';

  @override
  String get genresRowSortingDescription =>
      'Sorteer genrerijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

  @override
  String get genresRowItems => 'Items in genrerijen';

  @override
  String get genresRowItemsDescription =>
      'Toon films, series of beide in genrerijen.';

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
  String get displayAudioRows => 'Audiorijen weergeven';

  @override
  String get displayAudioRowsSubtitle => 'Toon Audio-rijen in Home-secties.';

  @override
  String get audioRowsSorting => 'Sortering van audiorijen';

  @override
  String get audioRowsSortingDescription =>
      'Sorteer audiorijen op datum toegevoegd, releasedatum, alfabetisch en meer.';

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
  String get audioTranscodeTarget => 'Doelformaat voor audiotranscodering';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Ondersteund op dit apparaat';

  @override
  String get notSupportedOnThisDevice => 'Niet ondersteund op dit apparaat';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD)-passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) als bitstream naar een externe decoder sturen.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD met Atmos (JOC)-passthrough';

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
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Open het afspelen van video\'s in de door u gekozen externe app op Android TV.';

  @override
  String get automaticQueuing => 'Automatisch in de wachtrij plaatsen';

  @override
  String get preferSdhSubtitles => 'Voorkeur voor SDH-ondertitels';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Geef bij automatische selectie voorrang aan SDH-/CC-ondertiteltracks.';

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
  String get webDiagnosticsOrigin => 'Origin';

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
  String get watchWithGroup => 'Samen met groep kijken';

  @override
  String get errors => 'Fouten';

  @override
  String get warnings => 'Waarschuwingen';

  @override
  String get disk => 'Schijf';

  @override
  String get openInBrowser => 'Openen in browser';

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
  String get passwordSet => 'Wachtwoord ingesteld';

  @override
  String get noPasswordConfigured => 'Geen wachtwoord ingesteld';

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
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Afspelen';

  @override
  String get adminDrawerSectionDevices => 'Apparaten';

  @override
  String get adminDrawerSectionAdvanced => 'Geavanceerd';

  @override
  String get adminDrawerSectionPlugins => 'Plug-ins';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'Thuisvideo\'s';

  @override
  String get mixedContent => 'Gemengde inhoud';

  @override
  String get homeVideosAndPhotos => 'Thuisvideo\'s en foto\'s';

  @override
  String get mixedMoviesAndShows => 'Gemengde films en series';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Genrepaneel sluiten';

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
  String get transcodingLimits => 'Transcodeerlimieten';

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
  String get subtitlePreferences => 'Ondertitelvoorkeuren';

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
  String get externalLists => 'Externe lijsten';

  @override
  String get replay => 'Opnieuw afspelen';

  @override
  String get fileInformation => 'Bestandsinformatie';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Grootte: $size  •  Formaat: $format';
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
  String get sortAlphabetical => 'Alfabetisch';

  @override
  String get sortReleaseAscending => 'Releasevolgorde (oplopend)';

  @override
  String get sortReleaseDescending => 'Releasevolgorde (aflopend)';

  @override
  String get sortCustomDragDrop => 'Aangepast (slepen en neerzetten)';

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
}
