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
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Inloggen';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Snel verbinden';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
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
    return 'Remove \"$serverName\" from your servers?';
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
      'Schakel tussen Moonfin en Neon Pulse zonder de app opnieuw te starten';

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
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Huidige Moonfin-look waar jullie allemaal van zijn gaan houden';

  @override
  String get themeNeonPulse => 'Neonpuls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-stijl met magenta gloed, cyaan tekst en sterker chroomcontrast';

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
    return 'Unable to connect to $target';
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
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Geen artikelen gevonden';

  @override
  String get home => 'Thuis';

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
    return 'Failed to load folder: $error';
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
    return '$count titles';
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
  String get readyWhenYouAre => 'Klaar wanneer jij dat bent';

  @override
  String get details => 'Details';

  @override
  String get listeningRoom => 'Luisterkamer';

  @override
  String get bookmarksAndProgress => 'Bladwijzers en voortgang';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Kan dit onderwerp nu niet laden.';

  @override
  String get audiobookDetails => 'Audioboekdetails';

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
  String get trackList => 'Tracklijst';

  @override
  String get itemListPlaceholder => 'De itemlijst verschijnt hier';

  @override
  String get favoriteTracksPlaceholder => 'Favoriete nummers verschijnen hier';

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
  String get nextUp => 'Volgende omhoog';

  @override
  String get seasons => 'Seizoenen';

  @override
  String get chapters => 'Hoofdstukken';

  @override
  String get features => 'Functies';

  @override
  String get movies => 'Films';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Datum van publicatie onbekend';

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
  String get view => 'Weergave';

  @override
  String get resumeReading => 'Hervat het lezen';

  @override
  String get read => 'Lezen';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
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
  String get cast => 'Cast';

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
  String get renamePlaylist => 'Hernoem de afspeellijst';

  @override
  String get playlistName => 'Naam van afspeellijst';

  @override
  String get deleteDownloadedAlbum => 'Verwijder het gedownloade album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Artikel verwijderd';

  @override
  String get noPlayableTrailerFound => 'Geen speelbare trailer gevonden.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Ondertitel gedownload. Het kan even duren voordat Jellyfin het item vernieuwt.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Selecteer Versie';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Verwijder gedownloade bestanden';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'SCHRIJVERS';

  @override
  String get studio => 'STUDIO';

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
  String get showLess => 'Toon minder';

  @override
  String get readMore => 'Lees meer';

  @override
  String get shuffle => 'Willekeurig';

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
  String get perfectMatch => 'Perfecte wedstrijd';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

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
  String get deviceVolume => 'Apparaatvolume';

  @override
  String get unavailable => 'Niet beschikbaar';

  @override
  String get pause => 'Pauze';

  @override
  String get syncPosition => 'Synchroniseer positie';

  @override
  String stopCast(String label) {
    return 'Stop $label';
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
    return '$seconds seconds';
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
  String get reset => 'Opnieuw instellen';

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
  String get track => 'Spoor';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-rendering in-app is nog niet beschikbaar op dit platform.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ingebedde documentweergave is niet beschikbaar op dit platform.';

  @override
  String get couldNotOpenExternalViewer => 'Kan externe viewer niet openen.';

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
      'Nog geen bladwijzers.\nTik tijdens het lezen op het bladwijzerpictogram om uw positie op te slaan.';

  @override
  String get noTableOfContentsAvailable => 'Geen inhoudsopgave beschikbaar';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Positie';

  @override
  String get bookReader => 'Boeklezer';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Geen kanalen gevonden';

  @override
  String get liveBadge => 'LIVE';

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
  String get watch => 'Bekijken';

  @override
  String get close => 'Sluiten';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
    return 'Remove \"$name\" and its files?';
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
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Serie niet gevonden';

  @override
  String get errorLoadingSeries => 'Fout bij laden van serie';

  @override
  String get downloadedEpisodes => 'Gedownloade afleveringen';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Muziek en audioboeken';

  @override
  String get images => 'Afbeeldingen';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
      'Detail pages, home rows, and volume';

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
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'Details Achtergrondvervaging';

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
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatisch bijsnijden';

  @override
  String get stretch => 'Strek';

  @override
  String get refreshRateSwitching => 'Wisselen van vernieuwingsfrequentie';

  @override
  String get disabled => 'Gehandicapt';

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
  String get chinese => 'Chinese';

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
    return 'After $episodes episodes / ${hours}h';
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
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Zichtbaarheid van de bibliotheek';

  @override
  String get libraryVisibilityDescription =>
      'Schakel de zichtbaarheid van de startpagina per bibliotheek in. Start Moonfin opnieuw op zodat de wijzigingen van kracht worden.';

  @override
  String get showInNavigation => 'Toon in navigatie';

  @override
  String get showInLatestMedia => 'Toon in de nieuwste media';

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
    return '$count selected';
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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get enablePreviewAudio =>
      'Schakel audio in voor previews van trailers en afleveringen';

  @override
  String get latestMedia => 'Nieuwste media';

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
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Per rij afbeeldingstype';

  @override
  String get perRowSettings => 'Instellingen per rij';

  @override
  String get autoLogin => 'Automatisch inloggen';

  @override
  String get lastUser => 'Laatste gebruiker';

  @override
  String get currentUser => '';

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
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get pluginLabel => 'Plug-in';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => '';

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
  String get discoverRows => 'Ontdek rijen';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Sleep om de volgorde te wijzigen. Rijen in- of uitschakelen. Synchronisatie van rijvolgorde ingeschakeld met de Moonfin-plug-in.';

  @override
  String get discoverRowsDescription =>
      'Sleep om de volgorde te wijzigen. Rijen in- of uitschakelen.';

  @override
  String get enabled => 'Ingeschakeld';

  @override
  String get hidden => 'Verborgen';

  @override
  String get aboutTitle => 'Over';

  @override
  String versionValue(String version) {
    return 'Version $version';
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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Meldingen bijwerken';

  @override
  String get showWhenUpdatesAvailable =>
      'Laat zien wanneer er updates beschikbaar zijn';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get reorderToggleHomeRows => 'Herschik de startrijen en schakel ze om';

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
  String get clear => 'Duidelijk';

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
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
    return 'age $age';
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
  String get remote => 'Op afstand';

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
  String get stop => 'Stop';

  @override
  String get streaming => 'Streamen';

  @override
  String get time => 'Tijd';

  @override
  String get trickplay => 'Trucspel';

  @override
  String get uninstall => 'Verwijderen';

  @override
  String get up => 'Omhoog';

  @override
  String get update => 'Update';

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
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'Transcoderen';

  @override
  String get adminDrawerResume => 'Hervatten';

  @override
  String get adminDrawerStreaming => 'Streamen';

  @override
  String get adminDrawerTrickplay => 'Trucspel';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Voltooiing';

  @override
  String get direct => 'Direct';

  @override
  String get adminDisconnect => 'Verbreek de verbinding';

  @override
  String get adminClearDates => 'Duidelijke data';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Apparaat verwijderen';

  @override
  String get adminDeviceDeleted => 'Apparaat verwijderd';

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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Naam bibliotheek wijzigen';

  @override
  String get adminNewName => 'Nieuwe naam';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Bibliotheek verwijderen';

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
  String get adminRemovePath => 'Pad verwijderen';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Bibliotheekopties opgeslagen';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Bibliotheeknaam is vereist';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Kan gebruikers niet laden';

  @override
  String get adminSearchUsers => 'Zoek gebruikers';

  @override
  String get adminEditUser => 'Gebruiker bewerken';

  @override
  String get adminAddUser => 'Gebruiker toevoegen';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Machtigingen opgeslagen';

  @override
  String get adminPasswordsMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
      'Hiermee wordt het wachtwoord verwijderd. De gebruiker kan inloggen zonder wachtwoord.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Sleuteltoken ontbreekt in serverreactie';

  @override
  String get adminRevokeApiKey => 'API-sleutel intrekken';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-sleutel ingetrokken';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
  String get adminCreatingBackup => 'Back-up maken...';

  @override
  String get adminBackupCreated => 'Back-up is succesvol gemaakt';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Back-uppad ontbreekt in serverreactie';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Bevestig Herstellen';

  @override
  String get adminRestoringBackup => 'Back-up herstellen...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Zoek in logboek';

  @override
  String get adminNoMatchingLines => 'Geen bijpassende lijnen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Geen geplande taken gevonden';

  @override
  String get adminNoTasksMatchFilter =>
      'Er zijn geen taken die overeenkomen met het huidige filter';

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
  String get adminRunNow => 'Ren nu';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dag van de week';

  @override
  String get adminSearchPlugins => 'Plug-ins zoeken...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Plug-in verwijderen';

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
      'Er zijn geen plug-ins die overeenkomen met uw zoekopdracht';

  @override
  String get adminNoPluginsInstalled => 'Geen plug-ins geïnstalleerd';

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
      'Kan de instellingen niet openen: er ontbreekt een authenticatietoken.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plug-in niet gevonden';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'bijv. Jellyfin-stal';

  @override
  String get adminRepositoryUrl => 'Repository-URL';

  @override
  String get adminAddEntry => 'Vermelding toevoegen';

  @override
  String get adminInvalidUrl => 'Ongeldige URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBaseUrlHint => 'bijv. /kwallen';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Geen externe overeenkomsten gevonden';

  @override
  String get adminRemoteResults => 'Resultaten op afstand';

  @override
  String get adminRemoteMetadataApplied => 'Metagegevens op afstand toegepast';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Inhoudstype bijwerken';

  @override
  String get adminContentType => 'Inhoudstype';

  @override
  String get adminContentTypeUpdated => 'Inhoudstype bijgewerkt';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Niet-ondersteund afbeeldingsformaat';

  @override
  String get adminImageReadFailed =>
      'Kan de geselecteerde afbeelding niet lezen';

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
  String get adminAllProviders => 'Alle aanbieders';

  @override
  String get adminNoRemoteImages => 'Geen externe afbeeldingen gevonden';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Tuner toevoegen';

  @override
  String get adminTunerType => 'Tunertype';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, anders';

  @override
  String get adminUrlPath => 'URL / Pad';

  @override
  String get adminNameOptional => 'Naam (optioneel)';

  @override
  String get adminTunerAdded => 'Tuner toegevoegd';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Gidsaanbieder toevoegen';

  @override
  String get adminProviderType => 'Type aanbieder';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect of XMLTV';

  @override
  String get adminUsernameOptional => 'Gebruikersnaam (optioneel)';

  @override
  String get adminRefreshInterval => 'Vernieuwingsinterval (uren)';

  @override
  String get adminProviderAdded => 'Aanbieder toegevoegd';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tunerreset aangevraagd';

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
  String get adminRecordingSettingsSaved => 'Opname-instellingen opgeslagen';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Aanbieder toevoegen';

  @override
  String get adminNoListingProviders =>
      'Er zijn geen vermeldingsproviders geconfigureerd';

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
    return 'Restore backup $name now?';
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
  String get adminReset => 'Opnieuw instellen';

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
    return 'Failed to load $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matches';
  }

  @override
  String get adminLogViewerNoMatches => 'Geen bijpassende lijnen';

  @override
  String get adminMetadataEditorTitle => 'Metagegevenseditor';

  @override
  String get adminMetadataIdentify => 'Identify';

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
      'Kan de geselecteerde afbeelding niet lezen';

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
      'Hiermee wordt de huidige afbeelding van het item verwijderd.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Uploaden';

  @override
  String get adminMetadataUpdate => 'Update';

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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Er zijn geen pakketten die overeenkomen met uw zoekopdracht';

  @override
  String get adminPluginsCatalogEmpty => 'Geen pakketten beschikbaar';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Verwijder de opslagplaats';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Verwijderen';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'Hardwareversnelling';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwareversnelling';

  @override
  String get adminPlaybackEnableHwEncoding => 'Schakel hardwarecodering in';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Schakel hardwaredecodering in voor:';

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
  String get adminTaskStop => 'Stop';

  @override
  String get adminRunningTasks => 'Running Tasks';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'nu';

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
      'Configureer het genereren van trickplay-afbeeldingen voor het zoeken naar voorbeeldminiaturen.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Openbare HTTPS-poort';

  @override
  String get adminNetworkingBaseUrl => 'Basis-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'bijv. /kwallen';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Drempel voor langzame respons (ms)';

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
  String get adminGeneralCachePath => 'Cache-pad';

  @override
  String get adminGeneralMetadataPath => 'Metagegevenspad';

  @override
  String get adminGeneralServerName => 'Servernaam';

  @override
  String get adminSettingsLoadFailed => 'Kan instellingen niet laden';

  @override
  String get adminDiscover => 'Ontdekken';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-toegang geweigerd';

  @override
  String get syncPlayAccessDeniedMessage =>
      'U heeft geen toegang tot een of meer items in deze SyncPlay-groep. Vraag de groepseigenaar om de bibliotheekmachtigingen te verifiëren of een andere wachtrij te kiezen.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get castRemotePlayback => 'Afspelen op afstand';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Apparaatvolume';

  @override
  String get castVolumeUnavailable => 'Niet beschikbaar';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Onjuiste pincode';

  @override
  String get pinMismatch => 'Pincodes komen niet overeen';

  @override
  String get pinForgot => 'Pincode vergeten?';

  @override
  String get pinClear => 'Duidelijk';

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
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Voer code in';

  @override
  String get quickConnectAuthorize => 'Autoriseren';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Doorgaan';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Live-tv';

  @override
  String get continueWatchingAndNextUp => 'Ga door met kijken en ga verder';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'Vorig';

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
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

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
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACY & VEILIGHEID';

  @override
  String get settingsBlockedRatings => 'Geblokkeerde beoordelingen';

  @override
  String get settingsGeneralStyle => 'Algemene stijl';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Thema-accenten, achtergronden, bekeken indicatoren en themamuziek';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

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
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (verouderd)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
