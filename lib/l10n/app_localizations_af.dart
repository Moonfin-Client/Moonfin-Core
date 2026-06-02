// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Maanvin';

  @override
  String get signIn => 'Meld aan';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Vinnige verbinding';

  @override
  String get password => 'Wagwoord';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get email => 'E-pos';

  @override
  String get quickConnectInstruction =>
      'Voer hierdie kode op jou bediener se webkontroleskerm in:';

  @override
  String get waitingForAuthorization => 'Wag tans vir magtiging …';

  @override
  String get back => 'Terug';

  @override
  String get serverUnavailable => 'Bediener is nie beskikbaar nie';

  @override
  String get loginFailed => 'Kon nie aanmeld nie';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Wie kyk?';

  @override
  String get addUser => 'Voeg gebruiker by';

  @override
  String get selectServer => 'Kies Bediener';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Gestoorde bedieners';

  @override
  String get discoveredServers => 'Ontdekte bedieners';

  @override
  String get noneFound => 'Geen gevind nie';

  @override
  String get unableToConnectToServer => 'Kan nie aan bediener koppel nie';

  @override
  String get addServer => 'Voeg bediener by';

  @override
  String get embyConnect => 'Emby Koppel';

  @override
  String get removeServer => 'Verwyder bediener';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Kanselleer';

  @override
  String get remove => 'Verwyder';

  @override
  String get connectToServer => 'Koppel aan bediener';

  @override
  String get serverAddress => 'Bedieneradres';

  @override
  String get serverAddressHint => 'https://jou-bediener.voorbeeld.com';

  @override
  String get connect => 'Koppel';

  @override
  String get secureStorageUnavailable => 'Veilige berging nie beskikbaar nie';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin kon nie toegang tot jou stelselsleutelring kry nie. Aanmelding kan voortgaan, maar veilige tokenberging is dalk onbeskikbaar totdat die sleutelring ontsluit is.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App Tema';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Skakel tussen Moonfin en Neon Pulse sonder om die toepassing te herbegin';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Maanvin';

  @override
  String get themeMoonfinSubtitle =>
      'Huidige Moonfin-voorkoms waarvan jy almal begin hou het';

  @override
  String get themeNeonPulse => 'Neon polsslag';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-stilering met magenta-gloed, siaan-teks en sterker chroomkontras';

  @override
  String get embyConnectSignInSubtitle =>
      'Meld aan met jou Emby Connect-rekening';

  @override
  String get emailOrUsername => 'E-pos of Gebruikersnaam';

  @override
  String get selectAServer => 'Kies \'n bediener';

  @override
  String get tryAgain => 'Probeer weer';

  @override
  String get noLinkedServers =>
      'Geen bedieners gekoppel aan hierdie Emby Connect-rekening nie';

  @override
  String get invalidEmbyConnectCredentials =>
      'Ongeldige Emby Connect-eiebewyse';

  @override
  String get invalidEmbyConnectLogin =>
      'Ongeldige Emby Connect-gebruikernaam of wagwoord';

  @override
  String get embyConnectExchangeNotSupported =>
      'Bediener ondersteun nie Emby Connect-uitruil nie';

  @override
  String get embyConnectNetworkError =>
      'Netwerkfout tydens kontak met Emby Connect of die geselekteerde bediener';

  @override
  String get loadingLinkedServers => 'Laai tans gekoppelde bedieners...';

  @override
  String get connectingToServerEllipsis => 'Koppel tans aan bediener …';

  @override
  String get noReachableAddress => 'Geen bereikbare adres verskaf nie';

  @override
  String get invalidServerExchangeResponse =>
      'Ongeldige antwoord vanaf bedieneruitruileindpunt';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Verlaat Moonfin?';

  @override
  String get exitAppConfirmation => 'Is jy seker jy wil uitgaan?';

  @override
  String get exit => 'Verlaat';

  @override
  String get noHomeRowsLoaded => 'Geen tuisrye kon gelaai word nie';

  @override
  String get noHomeRowsHint =>
      'Probeer aktiewe huisafdelings verfris of verminder.';

  @override
  String get retryHomeRows => 'Herprobeer Tuisrye';

  @override
  String get guide => 'Gids';

  @override
  String get recordings => 'Opnames';

  @override
  String get schedule => 'Skedule';

  @override
  String get series => 'Reeks';

  @override
  String get noItemsFound => 'Geen items gevind nie';

  @override
  String get home => 'Tuis';

  @override
  String get browseAll => 'Blaai deur alles';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Versamelingitems sal hier verskyn';

  @override
  String get browseByLetter => 'Blaai per letter';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alfabetiese blaai sal hier verskyn';

  @override
  String get suggestions => 'Voorstelle';

  @override
  String get suggestionsPlaceholder => 'Voorgestelde items sal hier verskyn';

  @override
  String get failedToLoadLibraries => 'Kon nie biblioteke laai nie';

  @override
  String get noLibrariesFound => 'Geen biblioteke gevind nie';

  @override
  String get library => 'Biblioteek';

  @override
  String get displaySettings => 'Vertoon instellings';

  @override
  String get allGenres => 'Alle genres';

  @override
  String get noGenresFound => 'Geen genres gevind nie';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Hierdie vouer is leeg';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Kon nie gunstelinge laai nie';

  @override
  String get retry => 'Probeer weer';

  @override
  String get noFavoritesYet => 'Nog geen gunstelinge nie';

  @override
  String get favorites => 'Gunstelinge';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Gaan voort';

  @override
  String get ended => 'Geëindig';

  @override
  String get sortAndFilter => 'Sorteer & Filter';

  @override
  String get type => 'Tik';

  @override
  String get sortBy => 'Sorteer volgens';

  @override
  String get display => 'Vertoon';

  @override
  String get imageType => 'Tipe beeld';

  @override
  String get posterSize => 'Plakkaat Grootte';

  @override
  String get small => 'Klein';

  @override
  String get medium => 'Medium';

  @override
  String get large => 'Groot';

  @override
  String get extraLarge => 'Ekstra groot';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Uitsigte';

  @override
  String get albums => 'Albums';

  @override
  String get albumArtists => 'Album Kunstenaars';

  @override
  String get artists => 'Kunstenaars';

  @override
  String get bookmarks => 'Boekmerke';

  @override
  String get noSavedBookmarks =>
      'Nog geen gestoorde boekmerke vir hierdie titel nie.';

  @override
  String get openBook => 'Maak Boek oop';

  @override
  String get chapter => 'Hoofstuk';

  @override
  String get page => 'Bladsy';

  @override
  String get bookmark => 'Boekmerk';

  @override
  String get justNow => 'Netnou';

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
  String get discoverySubjects => 'Ontdekkingsonderwerpe';

  @override
  String get pickDiscoverySubjects =>
      'Kies watter onderwerpstrome om in Ontdek te wys.';

  @override
  String get apply => 'Doen aansoek';

  @override
  String get openLink => 'Maak skakel oop';

  @override
  String get scanWithYourPhone => 'Skandeer met jou foon';

  @override
  String get audiobookGenres => 'Oudioboek genres';

  @override
  String get pickAudiobookGenres =>
      'Kies watter genres om in Oudioboek Ontdek te wys.';

  @override
  String get discoverAudiobooks => 'Ontdek oudioboeke';

  @override
  String get librivoxDescription =>
      'Gewilde publieke domein titels van LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Blaai links';

  @override
  String get scrollRight => 'Blaai regs';

  @override
  String get couldNotLoadGenre =>
      'Kon nie hierdie genre op die oomblik laai nie.';

  @override
  String get continueReading => 'Lees verder';

  @override
  String get savedHighlights => 'Gestoorde hoogtepunte';

  @override
  String get continueListening => 'Hou aan luister';

  @override
  String get listen => 'Luister';

  @override
  String get resume => 'Hervat';

  @override
  String get failedToLoadLibrary => 'Kon nie biblioteek laai nie';

  @override
  String get popularNow => 'Gewild Nou';

  @override
  String get savedForLater => 'Gestoor vir later';

  @override
  String get topListens => 'Top luister';

  @override
  String get unreadDiscoveries => 'Ongeleesde ontdekkings';

  @override
  String get pickUpAgain => 'Tel weer op';

  @override
  String get bookHighlightsDescription =>
      'Jou boeke met hoogtepunte, gunstelinge of leesvordering.';

  @override
  String get handPickedFromLibrary => 'Met die hand gekies uit jou biblioteek.';

  @override
  String get handPickedFromListeningQueue =>
      'Met die hand gekies uit jou luisterry.';

  @override
  String get booksWithHighlights =>
      'Boeke met hoogtepunte, gunstelinge of leesvordering.';

  @override
  String get jumpBackNarration =>
      'Spring terug in vertelling sonder om na jou plek te soek.';

  @override
  String get unreadBooksReady =>
      'Ongeleesde boeke gereed vir die volgende stil uur.';

  @override
  String get quickAccessFavorites =>
      'Vinnige toegang tot die boeke waarna jy telkens terugkom.';

  @override
  String get searchAudiobooks => 'Soek oudioboeke';

  @override
  String get searchYourLibrary => 'Soek jou biblioteek';

  @override
  String get pickUpStory => 'Tel die storie op waar jy opgehou het';

  @override
  String get savedPlacesChapters =>
      'Jou gestoorde plekke en onvoltooide hoofstukke';

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
  String get readyWhenYouAre => 'Klaar wanneer jy is';

  @override
  String get details => 'Besonderhede';

  @override
  String get listeningRoom => 'Luisterkamer';

  @override
  String get bookmarksAndProgress => 'Boekmerke en vordering';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Titels';

  @override
  String get allTitles => 'Alle titels';

  @override
  String get authors => 'Skrywers';

  @override
  String get browseByAuthor => 'Blaai deur Skrywer';

  @override
  String get browseByGenre => 'Blaai deur Genre';

  @override
  String get discover => 'Ontdek';

  @override
  String get trendingTitlesOpenLibrary =>
      'Gewilde titels volgens onderwerp vanaf Open Library.';

  @override
  String get noBookmarkedItems => 'Nog geen geboekmerkte items nie';

  @override
  String get nothingMatchesSection =>
      'Niks pas nog by hierdie afdeling nie. Probeer \'n ander oortjie of kom terug nadat die biblioteeksinkronisering voltooi is.';

  @override
  String get audiobooks => 'Oudioboeke';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Filters';

  @override
  String get readingStatus => 'Leesstatus';

  @override
  String get playedStatus => 'Gespeel Status';

  @override
  String get readStatus => 'Lees';

  @override
  String get watched => 'Gekyk';

  @override
  String get unread => 'Ongelees';

  @override
  String get unwatched => 'Ongekyk';

  @override
  String get seriesStatus => 'Reeks Status';

  @override
  String get allLibraries => 'Alle biblioteke';

  @override
  String get books => 'Boeke';

  @override
  String get author => 'Skrywer';

  @override
  String get unknownAuthor => 'Onbekende skrywer';

  @override
  String get uncategorized => 'Ongekategoriseer';

  @override
  String get overview => 'Oorsig';

  @override
  String get noLibrivoxDescription =>
      'Geen beskrywing verskaf deur LibriVox vir hierdie titel nog nie.';

  @override
  String get readers => 'Lesers';

  @override
  String get openLinks => 'Maak skakels oop';

  @override
  String get librivoxPage => 'LibriVox-bladsy';

  @override
  String get internetArchive => 'Internet Argief';

  @override
  String get rssFeed => 'RSS-stroom';

  @override
  String get downloadZip => 'Laai Zip af';

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
      'Geen oorsig beskikbaar vanaf Open Library vir hierdie titel nog nie.';

  @override
  String get subjects => 'Vakke';

  @override
  String get all => 'Almal';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Kon nie hierdie onderwerp op die oomblik laai nie.';

  @override
  String get audiobookDetails => 'Oudioboekbesonderhede';

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
  String get trackList => 'Snitlys';

  @override
  String get itemListPlaceholder => 'Itemlys sal hier verskyn';

  @override
  String get favoriteTracksPlaceholder => 'Gunstelingsnitte sal hier verskyn';

  @override
  String get failedToLoad => 'Kon nie laai nie';

  @override
  String get delete => 'Vee uit';

  @override
  String get save => 'Stoor';

  @override
  String get moreLikeThis => 'Meer soos hierdie';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Versameling';

  @override
  String get episodes => 'Episodes';

  @override
  String get nextUp => 'Volgende';

  @override
  String get seasons => 'Seisoene';

  @override
  String get chapters => 'Hoofstukke';

  @override
  String get features => 'Kenmerke';

  @override
  String get movies => 'Flieks';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Ander';

  @override
  String get discography => 'Diskografie';

  @override
  String get similarArtists => 'Soortgelyke kunstenaars';

  @override
  String get tableOfContents => 'Inhoudsopgawe';

  @override
  String get tracklist => 'Snitlys';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografie';

  @override
  String get authorDetails => 'Skrywer besonderhede';

  @override
  String get noOverviewAvailable =>
      'Nog geen oorsig beskikbaar vir hierdie titel nie.';

  @override
  String get noBiographyAvailable =>
      'Geen biografie beskikbaar vir hierdie skrywer nie.';

  @override
  String get noBooksFound => 'Geen boeke vir hierdie skrywer gevind nie.';

  @override
  String get unableToLoadAuthorDetails =>
      'Kan nie nou outeurbesonderhede laai nie.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Publikasiedatum onbekend';

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
  String get view => 'Uitsig';

  @override
  String get resumeReading => 'Hervat lees';

  @override
  String get read => 'Lees';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Speel';

  @override
  String get startOver => 'Begin oor';

  @override
  String get restart => 'Herbegin';

  @override
  String get readOffline => 'Lees Vanlyn';

  @override
  String get playOffline => 'Speel vanlyn';

  @override
  String get audio => 'Oudio';

  @override
  String get subtitles => 'Onderskrifte';

  @override
  String get version => 'Weergawe';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Sleepwa';

  @override
  String get finished => 'Klaar';

  @override
  String get favorited => 'Gunsteling';

  @override
  String get favorite => 'Gunsteling';

  @override
  String get playlist => 'Snitlys';

  @override
  String get downloaded => 'Afgelaai';

  @override
  String get downloadAll => 'Laai Alles af';

  @override
  String get download => 'Laai af';

  @override
  String get deleteDownloaded => 'Vee afgelaai uit';

  @override
  String get goToSeries => 'Gaan na Reeks';

  @override
  String get editMetadata => 'Wysig metadata';

  @override
  String get less => 'Minder';

  @override
  String get more => 'Meer';

  @override
  String get deleteItem => 'Vee Item uit';

  @override
  String get deletePlaylist => 'Vee snitlys uit';

  @override
  String get deletePlaylistMessage =>
      'Vee hierdie snitlys van die bediener uit?';

  @override
  String get deleteItemMessage => 'Vee hierdie item van die bediener af?';

  @override
  String get failedToDeletePlaylist => 'Kon nie snitlys uitvee nie';

  @override
  String get failedToDeleteItem => 'Kon nie item uitvee nie';

  @override
  String get renamePlaylist => 'Hernoem snitlys';

  @override
  String get playlistName => 'Snitlys naam';

  @override
  String get deleteDownloadedAlbum => 'Vee afgelaaide album uit';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Afgelaaide snitte is uitgevee';

  @override
  String get downloadedTracksDeleteFailed =>
      'Sommige afgelaaide snitte kon nie uitgevee word nie';

  @override
  String get noTracksLoaded => 'Geen snitte gelaai nie';

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
  String get itemDeleted => 'Item is uitgevee';

  @override
  String get noPlayableTrailerFound => 'Geen speelbare lokprent gevind nie.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Oudiosnit';

  @override
  String get subtitleTrack => 'Ondertitelsnit';

  @override
  String get none => 'Geen';

  @override
  String get downloadSubtitlesLabel => 'Laai onderskrifte af...';

  @override
  String get searchOpenSubtitlesPlugin => 'Soek met die OpenSubtitles-inprop';

  @override
  String get downloadSubtitles => 'Laai onderskrifte af';

  @override
  String get selectedSubtitleInvalid =>
      'Die geselekteerde onderskrif is ongeldig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Onderskrif afgelaai. Dit kan \'n oomblik neem om te verskyn terwyl Jellyfin die item verfris.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Kies Weergawe';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Laai alles af - kwaliteit';

  @override
  String get downloadQuality => 'Aflaai Kwaliteit';

  @override
  String get originalFileNoReencoding =>
      'Oorspronklike lêer, geen herkodering nie';

  @override
  String get originalFilesNoReencoding =>
      'Oorspronklike lêers, geen herkodering nie';

  @override
  String get noEpisodesLoaded => 'Geen episodes gelaai nie';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Vee afgelaaide lêers uit';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Afgelaaide lêers is uitgevee';

  @override
  String get failedToDeleteFiles => 'Kon nie lêers uitvee nie';

  @override
  String get deleteFiles => 'Vee lêers uit';

  @override
  String get director => 'DIREKTEUR';

  @override
  String get writers => 'SKRYWERS';

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
  String get showLess => 'Wys minder';

  @override
  String get readMore => 'Lees meer';

  @override
  String get shuffle => 'Skommel';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekte pasmaat';

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
  String get deleteSeasonFiles => 'alle afgelaaide episodes in hierdie seisoen';

  @override
  String get stillWatching => 'Kyk nog steeds?';

  @override
  String get unableToLoadTrailerStream => 'Kan nie sleepwastroom laai nie.';

  @override
  String get trailerTimedOut => 'Sleepwa het uitgetel tydens laai.';

  @override
  String get playbackFailedForTrailer =>
      'Terugspeel het vir hierdie lokprent misluk.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Uitsaai is nie beskikbaar tydens vanlyn terugspeel nie.';

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
  String get deviceVolume => 'Toestelvolume';

  @override
  String get unavailable => 'Onbeskikbaar';

  @override
  String get pause => 'Pouse';

  @override
  String get syncPosition => 'Sinkroniseer posisie';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Die tou is leeg';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Afstandweergawe';

  @override
  String get castingToGoogleCast => 'Saai tans uit na Google Cast';

  @override
  String get castingViaAirPlay => 'Uitsaai via AirPlay';

  @override
  String get castingViaDlna => 'Uitsaai via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Druk lank om te ontsluit';

  @override
  String get off => 'Af';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Outo';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bitrate ignoreer';

  @override
  String get audioDelay => 'Oudio Vertraging';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Subtitel vertraging';

  @override
  String get reset => 'Stel terug';

  @override
  String get unknown => 'Onbekend';

  @override
  String get playbackInformation => 'Afspeel inligting';

  @override
  String get playback => 'Afspeel';

  @override
  String get playMethod => 'Speel metode';

  @override
  String get directPlay => 'Direkte speel';

  @override
  String get directStream => 'Direkte stroom';

  @override
  String get transcoding => 'Transkodering';

  @override
  String get transcodeReasons => 'Transkodeerredes';

  @override
  String get player => 'Speler';

  @override
  String get container => 'Houer';

  @override
  String get bitrate => 'Bitsnelheid';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolusie';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Video bitrate';

  @override
  String get track => 'Spoor';

  @override
  String get channels => 'Kanale';

  @override
  String get audioBitrate => 'Oudio-bitsnelheid';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get format => 'Formaat';

  @override
  String get external => 'Ekstern';

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
      'EPUB-weergawe inprogram is nog nie op hierdie platform beskikbaar nie.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ingeboude dokumentweergawe is nie op hierdie platform beskikbaar nie.';

  @override
  String get couldNotOpenExternalViewer =>
      'Kon nie eksterne kyker oopmaak nie.';

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
      'Nog geen boekmerke nie.\nTik die boekmerkikoon terwyl jy lees om jou posisie te stoor.';

  @override
  String get noTableOfContentsAvailable => 'Geen inhoudsopgawe beskikbaar nie';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Posisie';

  @override
  String get bookReader => 'Boekleser';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Dateer tans op …';

  @override
  String get markUnread => 'Merk ongelees';

  @override
  String get markAsRead => 'Merk as gelees';

  @override
  String get reloadReader => 'Herlaai leser';

  @override
  String get noPagesFound => 'Geen bladsye gevind nie.';

  @override
  String get failedToDecodePageImage => 'Kon nie bladsyprent dekodeer nie.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Enkel bladsy';

  @override
  String get twoPageSpread => 'Twee-bladsy verspreiding';

  @override
  String get addBookmark => 'Voeg boekmerk by';

  @override
  String get bookmarksEllipsis => 'Boekmerke...';

  @override
  String get markedAsRead => 'Gemerk as gelees';

  @override
  String get markedAsUnread => 'Gemerk as ongelees';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Stelsel';

  @override
  String get themeLight => 'Tema: Lig';

  @override
  String get themeDark => 'Tema: Donker';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Keer kleure om (vaste uitleg)';

  @override
  String get invertColorsPdf => 'Keer kleure om (PDF)';

  @override
  String get preparingInAppReader => 'Berei tans inprogram-leser voor...';

  @override
  String get pdfDataNotAvailable => 'PDF-data nie beskikbaar nie.';

  @override
  String get readerFallbackModeActive => 'Leser-terugvalmodus aktief';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Gebruik Reload Reader nadat jy na \'n ondersteunde platformteiken oorgeskakel het (Android, iOS, macOS).';

  @override
  String get openExternally => 'Maak ekstern oop';

  @override
  String get noEpubChaptersFound => 'Geen EPUB-hoofstukke gevind nie.';

  @override
  String get readerNotReady => 'Leser nie gereed nie.';

  @override
  String get seriesRecordings => 'Reeks opnames';

  @override
  String get now => 'Nou';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nuus';

  @override
  String get kids => 'Kinders';

  @override
  String get premiere => 'Première';

  @override
  String get guideTimeline => 'Gids Tydlyn';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Geen kanale gevind nie';

  @override
  String get liveBadge => 'LEEF';

  @override
  String get movie => 'Fliek';

  @override
  String get removedFromFavoriteChannels => 'Van gunsteling kanale verwyder';

  @override
  String get addedToFavoriteChannels => 'By gunsteling kanale gevoeg';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Kon nie gunstelingkanaal opdateer nie';

  @override
  String get unfavoriteChannel => 'Ongegunste kanaal';

  @override
  String get favoriteChannel => 'Gunsteling kanaal';

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
  String get watch => 'Kyk';

  @override
  String get close => 'Maak toe';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Kon nie opnames laai nie';

  @override
  String get scheduledInNext24Hours => 'Geskeduleer in volgende 24 uur';

  @override
  String get recentRecordings => 'Onlangse opnames';

  @override
  String get tvSeries => 'TV-reeks';

  @override
  String get failedToLoadSchedule => 'Kon nie skedule laai nie';

  @override
  String get noScheduledRecordings => 'Geen geskeduleerde opnames nie';

  @override
  String get cancelRecording => 'Kanselleer opname?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nee';

  @override
  String get yesCancel => 'Ja, kanselleer';

  @override
  String get failedToCancelRecording => 'Kon nie opname kanselleer nie';

  @override
  String get failedToLoadSeriesRecordings => 'Kon nie reeksopnames laai nie';

  @override
  String get noSeriesRecordings => 'Geen reeksopnames nie';

  @override
  String get cancelSeriesRecording => 'Kanselleer reeksopname';

  @override
  String get cancelSeriesRecordingQuestion => 'Kanselleer reeksopname?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Kon nie reeksopname kanselleer nie';

  @override
  String get searchThisLibrary => 'Deursoek hierdie biblioteek...';

  @override
  String get searchEllipsis => 'Soek...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Siener';

  @override
  String get seerrAccountType => 'Seerr Rekening Tipe';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Plaaslik';

  @override
  String get savedMedia => 'Gestoorde media';

  @override
  String get tvShows => 'TV-programme';

  @override
  String get music => 'Musiek';

  @override
  String get musicAlbums => 'Musiek Albums';

  @override
  String get noMediaInFilter => 'Geen media in hierdie filter nie';

  @override
  String get noDownloadedMediaYet => 'Nog geen afgelaaide media nie';

  @override
  String get browseLibrary => 'Blaai deur biblioteek';

  @override
  String get deleteDownload => 'Vee aflaai uit';

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
  String get playAlbum => 'Speel Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Seisoen';

  @override
  String get errorLoadingEpisodes => 'Kon nie episodes laai nie';

  @override
  String get noDownloadedEpisodes => 'Geen afgelaaide episodes nie';

  @override
  String get deleteEpisode => 'Vee episode uit';

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
  String get seriesNotFound => 'Reeks nie gevind nie';

  @override
  String get errorLoadingSeries => 'Kon nie reeks laai nie';

  @override
  String get downloadedEpisodes => 'Afgelaaide episodes';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Spesiale aanbiedinge';

  @override
  String get deleteSeason => 'Vee seisoen uit';

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
  String get storageManagement => 'Bergingbestuur';

  @override
  String get storageBreakdown => 'Berging uiteensetting';

  @override
  String get downloadedItems => 'Afgelaaide items';

  @override
  String get storageLimit => 'Bergingslimiet';

  @override
  String get noLimit => 'Geen beperking nie';

  @override
  String get deleteAllDownloads => 'Vee alle aflaaie uit';

  @override
  String get deleteAllDownloadsWarning =>
      'Dit sal alle afgelaaide medialêers verwyder en kan nie ontdoen word nie.';

  @override
  String get deleteAll => 'Vee alles uit';

  @override
  String get deleteSelected => 'Vee geselekteerde uit';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musiek en oudioboeke';

  @override
  String get images => 'Beelde';

  @override
  String get database => 'Databasis';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Instellings';

  @override
  String get authentication => 'Stawing';

  @override
  String get autoLoginServerManagement => 'Outo-aanmelding, bedienerbestuur';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get setUpPinCodeProtection => 'Stel PIN-kodebeskerming op';

  @override
  String get parentalControls => 'Ouerkontroles';

  @override
  String get contentRatingRestrictions => 'Beperkings vir inhoudgradering';

  @override
  String get bitRateResolutionBehavior => 'Bitsnelheid, resolusie, gedrag';

  @override
  String get languageSizeAppearance => 'Taal, grootte, voorkoms';

  @override
  String get qualityStorage => 'Kwaliteit, berging';

  @override
  String get serverSyncAndPluginStatus =>
      'Bedienersinkronisering en inpropstatus';

  @override
  String get mediaRequestIntegration => 'Mediaversoekintegrasie';

  @override
  String get switchServer => 'Skakel bediener';

  @override
  String get signOut => 'Teken uit';

  @override
  String get versionLicenses => 'Weergawe, lisensies';

  @override
  String get account => 'Rekening';

  @override
  String get signInAndSecurity => 'Aanmelding en sekuriteit';

  @override
  String get administration => 'Administrasie';

  @override
  String get serverSettingsUsersLibraries =>
      'Bedienerinstellings, gebruikers, biblioteke';

  @override
  String get customization => 'Pasmaak';

  @override
  String get themeAndLayout => 'Tema en uitleg';

  @override
  String get videoAndSubtitles => 'Video en onderskrifte';

  @override
  String get integrations => 'Integrasies';

  @override
  String get pluginAndRequests => 'Inprop en versoeke';

  @override
  String get customizeAccountPlaybackInterface =>
      'Pas rekening-, afspeel- en koppelvlakgedrag aan';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tema & Voorkoms';

  @override
  String get focusBorderColor => 'Fokus grenskleur';

  @override
  String get watchedIndicators => 'Gekyk aanwysers';

  @override
  String get always => 'Altyd';

  @override
  String get hideUnwatched => 'Versteek ongekyk';

  @override
  String get episodesOnly => 'Slegs episodes';

  @override
  String get never => 'Nooit nie';

  @override
  String get focusExpansionAnimation => 'Fokus Uitbreidingsanimasie';

  @override
  String get desktopUiScale => 'Desktop UI-skaal';

  @override
  String get scaleFocusedCards =>
      'Skaal gefokusde of gesweefde kaarte en teëls';

  @override
  String get backgroundBackdrops => 'Agtergrond agtergronde';

  @override
  String get showBackdropImages => 'Wys agtergrondprente agter inhoud';

  @override
  String get seriesThumbnails => 'Reeks-kleinkiekies';

  @override
  String get seriesThumbnailsDescription =>
      'Slegs episodes: gebruik reekskunswerk wat by elke ry-beeldtipe pas';

  @override
  String get homeRowInfoOverlay => 'Tuisry-inligting-oorleg';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Wys titel en metadata wanneer u tuisrye blaai';

  @override
  String get clockDisplay => 'Horlosie vertoon';

  @override
  String get inMenus => 'In spyskaarte';

  @override
  String get inVideo => 'In Video';

  @override
  String get seasonalEffects => 'Seisoenale effekte';

  @override
  String get seasonalEffectsDescription =>
      'Visuele effekte en seisoenale versierings';

  @override
  String get snow => 'Sneeu';

  @override
  String get fireworks => 'Vuurwerke';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Vallende blare';

  @override
  String get themeMusic => 'Tema Musiek';

  @override
  String get playThemeMusicOnDetailPages => 'Speel temamusiek op detailbladsye';

  @override
  String get themeMusicVolume => 'Tema Musiek Volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temamusiek op Tuisrye';

  @override
  String get playWhenBrowsingHomeScreen => 'Speel wanneer u tuisskerm blaai';

  @override
  String get detailsBackgroundBlur => 'Besonderhede Agtergrond vervaag';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Blaai-agtergrondvervaag';

  @override
  String get maxStreamingBitrate => 'Maksimum stroom bitsnelheid';

  @override
  String get maxResolution => 'Maksimum resolusie';

  @override
  String get playerZoomMode => 'Spelerzoemmodus';

  @override
  String get fit => 'Gepas';

  @override
  String get autoCrop => 'Auto Crop';

  @override
  String get stretch => 'Strek';

  @override
  String get refreshRateSwitching => 'Verfriskoerswisseling';

  @override
  String get disabled => 'Gedeaktiveer';

  @override
  String get scaleOnTv => 'Skaal op TV';

  @override
  String get scaleOnDevice => 'Skaal op toestel';

  @override
  String get trickPlay => 'Truuk Speel';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Wys voorskou-kleinkiekies wanneer jy soek';

  @override
  String get showDescriptionOnPause => 'Wys beskrywing op pouse';

  @override
  String get dimVideoShowOverview =>
      'Verduister video en wys oorsigteks terwyl dit onderbreek word';

  @override
  String get osdLockButton => 'OSD-slotknoppie';

  @override
  String get osdLockButtonDescription =>
      'Wys \'n sluitknoppie wat aanraakinvoer blokkeer totdat dit lank ingedruk word';

  @override
  String get audioBehavior => 'Oudiogedrag';

  @override
  String get downmixToStereo => 'Downmix na Stereo';

  @override
  String get defaultAudioLanguage => 'Standaard oudiotaal';

  @override
  String get autoServerDefault => 'Outo (bedienerverstek)';

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
  String get japanese => 'Japannese';

  @override
  String get korean => 'Koreaans';

  @override
  String get chinese => 'Chinese';

  @override
  String get russian => 'Russies';

  @override
  String get arabic => 'Arabies';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Nederlands';

  @override
  String get swedish => 'Sweeds';

  @override
  String get norwegian => 'Noors';

  @override
  String get danish => 'Deens';

  @override
  String get finnish => 'Fins';

  @override
  String get polish => 'Pools';

  @override
  String get ac3Passthrough => 'AC3 deurlaat';

  @override
  String get dtsPassthrough => 'DTS deurlaat';

  @override
  String get trueHdSupport => 'TrueHD Ondersteuning';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS klank slegs na AVR; vereis ontvangerondersteuning en DTS-bronspoor';

  @override
  String get enableTrueHdAudio =>
      'Aktiveer TrueHD-oudio (werk dalk nie op alle platforms nie)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

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
  String get nightMode => 'Nagmodus';

  @override
  String get compressDynamicRange => 'Druk dinamiese reeks saam';

  @override
  String get advancedMpv => 'Gevorderde mpv';

  @override
  String get enableCustomMpvConf => 'Aktiveer pasgemaakte mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Pas \'n gebruiker-gespesifiseerde mpv.conf toe voordat afspeel begin';

  @override
  String get unsafeAdvancedMpvOptions => 'Onveilige Gevorderde mpv-opsies';

  @override
  String get unsafeMpvOptionsDescription =>
      'Laat \'n wyer stel mpv-opsies toe. Kan afspeelgedrag verbreek.';

  @override
  String get hardwareDecoding => 'Hardeware dekodering';

  @override
  String get hardwareDecodingSubtitle =>
      'Kan werkverrigting verbeter, maar kan afspeelprobleme op sommige toestelle veroorsaak.';

  @override
  String get nextUpAndQueuing => 'Volgende op & tou';

  @override
  String get nextUpDisplay => 'Volgende Vertoon';

  @override
  String get extended => 'Uitgebreid';

  @override
  String get minimal => 'Minimaal';

  @override
  String get nextUpTimeout => 'Volgende Time-out';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Media toustaan';

  @override
  String get autoQueueNextEpisodes =>
      'Stel volgende episodes outomaties in tou';

  @override
  String get stillWatchingPrompt => 'Kyk steeds na prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Hervat & Slaan oor';

  @override
  String get resumeRewind => 'Hervat Terugspoel';

  @override
  String get unpauseRewind => 'Hervat Terugspoel';

  @override
  String get fiveSeconds => '5 sekondes';

  @override
  String get tenSeconds => '10 sekondes';

  @override
  String get fifteenSeconds => '15 sekondes';

  @override
  String get thirtySeconds => '30 sekondes';

  @override
  String get skipBackLength => 'Slaan Terug Lengte';

  @override
  String get skipForwardLength => 'Slaan Voorwaartse Lengte oor';

  @override
  String get customMpvConfPath => 'Pasgemaakte mpv.conf-pad';

  @override
  String get notSetMpvConf =>
      'Nie gestel nie. Moonfin sal \'n verstek mpv.conf in app/data-vouers probeer.';

  @override
  String get selectMpvConf => 'Kies mpv.conf';

  @override
  String get pathToMpvConf => '/pad/na/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stylinstellings (grootte, kleur, offset) is van toepassing op teksgebaseerde onderskrifte (SRT, VTT, TTML). ASS/SSA-onderskrifte gebruik hul eie ingeboude stilering tensy \"ASS/SSA Direct Play\" afgeskakel is. Bitmap-onderskrifte (PGS, DVB, VobSub) kan nie herstileer word nie.';

  @override
  String get defaultSubtitleLanguage => 'Verstek ondertiteltaal';

  @override
  String get defaultToNoSubtitles => 'Verstek op Geen onderskrifte';

  @override
  String get turnOffSubtitlesByDefault => 'Skakel onderskrifte by verstek af';

  @override
  String get subtitleSize => 'Onderskrif grootte';

  @override
  String get textFillColor => 'Teksvulkleur';

  @override
  String get backgroundColor => 'Agtergrondkleur';

  @override
  String get textStrokeColor => 'Teksslagkleur';

  @override
  String get subtitleCustomization => 'Onderskrifaanpassing';

  @override
  String get subtitleCustomizationDescription => 'Pas subtitel voorkoms aan';

  @override
  String get subtitlePreviewText =>
      'Die vinnige bruin jakkals spring oor die lui hond';

  @override
  String get verticalOffset => 'Vertikale offset';

  @override
  String get pgsDirectPlay => 'PGS Direkte Speel';

  @override
  String get directPlayPgsSubtitles => 'Direkte speel PGS-onderskrifte';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles => 'Direkte speel ASS/SSA onderskrifte';

  @override
  String get white => 'Wit';

  @override
  String get black => 'Swart';

  @override
  String get yellow => 'Geel';

  @override
  String get green => 'Groen';

  @override
  String get cyan => 'Siaan';

  @override
  String get red => 'Rooi';

  @override
  String get transparent => 'Deursigtig';

  @override
  String get semiTransparentBlack => 'Semi-deursigtige Swart';

  @override
  String get global => 'Wêreldwyd';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Selfoon';

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
  String get customizationProfile => 'Pasmaakprofiel';

  @override
  String get customizationProfileDescription =>
      'Kies die profiel om te laai, te wysig en te sinkroniseer. Global is oral van toepassing, tensy \'n toestelprofiel dit ignoreer. Die groen kolletjie merk jou huidige toestelprofiel.';

  @override
  String get loadProfile => 'Laai profiel';

  @override
  String get syncing => 'Sinkroniseer tans …';

  @override
  String get syncToProfile => 'Sinkroniseer met profiel';

  @override
  String get profileSyncHidden => 'Profielsinkronisering versteek';

  @override
  String get enablePluginSyncDescription =>
      'Aktiveer Server Plugin Sync in Plugin-instellings om profielkontroles hier te wys.';

  @override
  String get quality => 'Kwaliteit';

  @override
  String get defaultDownloadQuality => 'Standaard aflaaikwaliteit';

  @override
  String get network => 'Netwerk';

  @override
  String get wifiOnlyDownloads => 'Slegs WiFi-aflaaie';

  @override
  String get onlyDownloadOnWifi =>
      'Laai slegs af wanneer dit aan WiFi gekoppel is';

  @override
  String get storage => 'Berging';

  @override
  String get storageUsed => 'Berging gebruik';

  @override
  String get manage => 'Bestuur';

  @override
  String get calculating => 'Bereken tans …';

  @override
  String get downloadLocation => 'Laai ligging af';

  @override
  String get defaultLabel => 'Verstek';

  @override
  String get saveToDownloadsFolder => 'Stoor in Downloads-lêergids';

  @override
  String get downloadsVisibleToOtherApps =>
      'Aflaaie/Moonfin — sigbaar vir ander toepassings';

  @override
  String get dangerZone => 'Gevaarsone';

  @override
  String get clearAllDownloads => 'Vee alle aflaaie uit';

  @override
  String get original => 'Oorspronklik';

  @override
  String get changeDownloadLocation => 'Verander aflaai-ligging';

  @override
  String get changeDownloadLocationDescription =>
      'Nuwe aflaaie sal in die geselekteerde vouer gestoor word. Bestaande aflaaie sal in hul huidige ligging bly en kan vanaf Berging-instellings bestuur word.';

  @override
  String get confirm => 'Bevestig';

  @override
  String get cannotWriteToFolder =>
      'Kan nie na geselekteerde vouer skryf nie. Kies asseblief \'n ander ligging of gee bergingtoestemmings.';

  @override
  String get saveToDownloadsFolderQuestion => 'Stoor in Downloads-lêergids?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Afgelaaide media sal na Downloads/Moonfin op jou toestel gestoor word. Hierdie lêers sal sigbaar wees vir ander programme soos jou gallery of musiekspeler.\n\nBestaande aflaaie sal op hul huidige ligging bly.';

  @override
  String get enable => 'Aktiveer';

  @override
  String get clearAllDownloadsWarning =>
      'Dit sal alle afgelaaide media uitvee en kan nie ontdoen word nie.';

  @override
  String get clearAll => 'Vee alles uit';

  @override
  String get navigationStyle => 'Navigasie styl';

  @override
  String get topBar => 'Top Bar';

  @override
  String get leftSidebar => 'Linkersybalk';

  @override
  String get showShuffleButton => 'Wys Skommel-knoppie';

  @override
  String get showGenresButton => 'Wys Genres-knoppie';

  @override
  String get showFavoritesButton => 'Wys gunstelinge-knoppie';

  @override
  String get showLibrariesInToolbar => 'Wys biblioteke in Toolbar';

  @override
  String get navbarOpacity => 'Navbar Ondeursigtigheid';

  @override
  String get navbarColor => 'Navbar kleur';

  @override
  String get gray => 'Grys';

  @override
  String get darkBlue => 'Donkerblou';

  @override
  String get purple => 'Pers';

  @override
  String get teal => 'Blauwgroen';

  @override
  String get navy => 'Vloot';

  @override
  String get charcoal => 'Houtskool';

  @override
  String get brown => 'Bruin';

  @override
  String get darkRed => 'Donker rooi';

  @override
  String get darkGreen => 'Donkergroen';

  @override
  String get slate => 'Leisteen';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Biblioteekvertoning';

  @override
  String get posterLabel => 'Plakkaat';

  @override
  String get thumbnailLabel => 'Kleinkiekie';

  @override
  String get bannerLabel => 'Banier';

  @override
  String get overridePerLibrarySettings =>
      'Ignoreer Per-biblioteek-instellings';

  @override
  String get applyImageTypeToAllLibraries =>
      'Pas beeldtipe toe op alle biblioteke';

  @override
  String get multiServerLibraries => 'Multi-bediener biblioteke';

  @override
  String get showLibrariesFromAllServers =>
      'Wys biblioteke vanaf alle gekoppelde bedieners';

  @override
  String get enableFolderView => 'Aktiveer gidsaansig';

  @override
  String get showFolderBrowsingOption => 'Wys gidsblaai-opsie';

  @override
  String get libraryVisibility => 'Biblioteeksigbaarheid';

  @override
  String get libraryVisibilityDescription =>
      'Wissel tuisbladsigbaarheid per biblioteek. Herbegin Moonfin vir veranderinge om in werking te tree.';

  @override
  String get showInNavigation => 'Wys in navigasie';

  @override
  String get showInLatestMedia => 'Wys in nuutste media';

  @override
  String get sourceLibraries => 'Bron biblioteke';

  @override
  String get sourceCollections => 'Bronversamelings';

  @override
  String get excludedGenres => 'Uitgesluit genres';

  @override
  String get selectAll => 'Kies Alles';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Mediabalk';

  @override
  String get mediaSources => 'Media bronne';

  @override
  String get behavior => 'Gedrag';

  @override
  String get seconds => 'sekondes';

  @override
  String get localPreviews => 'Plaaslike voorskoue';

  @override
  String get localPreviewsDescription =>
      'Stel voorskou-, media- en oudiovoorskoue op.';

  @override
  String get mediaBarMode => 'Media Bar Styl';

  @override
  String get mediaBarModeDescription =>
      'Kies tussen Moonfin, MakD, of skakel die mediabalk af';

  @override
  String get mediaBarModeMoonfin => 'Maanvin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Af';

  @override
  String get enableMediaBar => 'Aktiveer mediabalk';

  @override
  String get showFeaturedContentSlideshow =>
      'Wys vertoon-inhoud-skyfievertoning by die huis';

  @override
  String get contentType => 'Tipe inhoud';

  @override
  String get moviesAndTvShows => 'Flieks en TV-programme';

  @override
  String get moviesOnly => 'Slegs films';

  @override
  String get tvShowsOnly => 'Slegs TV-programme';

  @override
  String get itemCount => 'Item telling';

  @override
  String get noneSelected => 'Geen gekies nie';

  @override
  String get noneExcluded => 'Geen uitgesluit nie';

  @override
  String get autoAdvance => 'Auto Advance';

  @override
  String get autoAdvanceSlides => 'Gaan outomaties na die volgende skyfie';

  @override
  String get autoAdvanceInterval => 'Auto Advance Interval';

  @override
  String get trailerPreview => 'Voorskou van die sleepwa';

  @override
  String get autoPlayTrailers =>
      'Speel sleepwaens outomaties in die mediabalk na 3 sekondes';

  @override
  String get episodePreview => 'Episode Voorskou';

  @override
  String get mediaPreview => 'Mediavoorskou';

  @override
  String get episodePreviewDescription =>
      'Speel \'n 30-sekonde-inlynvoorskou op gefokusde, gesweefde of langgedrukte kaarte';

  @override
  String get mediaPreviewDescription =>
      'Speel \'n 30-sekonde-inlynvoorskou op gefokusde, gesweefde of langgedrukte kaarte';

  @override
  String get previewAudio => 'Voorskou oudio';

  @override
  String get enablePreviewAudio =>
      'Aktiveer oudio vir voorskou- en episodevoorskoue';

  @override
  String get latestMedia => 'Nuutste media';

  @override
  String get recentlyReleased => 'Onlangs vrygestel';

  @override
  String get myMedia => 'My Media';

  @override
  String get myMediaSmall => 'My media (klein)';

  @override
  String get continueWatching => 'Hou aan kyk';

  @override
  String get resumeAudio => 'Hervat oudio';

  @override
  String get resumeBooks => 'Hervat Boeke';

  @override
  String get activeRecordings => 'Aktiewe opnames';

  @override
  String get playlists => 'Snitlyste';

  @override
  String get liveTV => 'Regstreekse TV';

  @override
  String get homeSections => 'Tuisafdelings';

  @override
  String get resetToDefaults => 'Stel terug na verstek';

  @override
  String get homeRowPosterSize => 'Tuisry-plakkaatgrootte';

  @override
  String get perRowImageTypeSelection => 'Per ry beeldtipe seleksie';

  @override
  String get configureImageTypeForEachRow =>
      'Stel prenttipe op vir elke geaktiveerde tuisry';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Voeg saam Gaan voort kyk en volgende';

  @override
  String get combineBothRows =>
      'Kombineer albei rye in \'n enkele huisafdeling';

  @override
  String get perRowImageType => 'Per ry tipe beeld';

  @override
  String get perRowSettings => 'Per-ry-instellings';

  @override
  String get autoLogin => 'Outo-aanmelding';

  @override
  String get lastUser => 'Laaste gebruiker';

  @override
  String get specificUser => 'Spesifieke gebruiker';

  @override
  String get alwaysAuthenticate => 'Verifieer altyd';

  @override
  String get requirePasswordWithToken =>
      'Vereis wagwoord selfs met gestoor token';

  @override
  String get confirmExit => 'Bevestig uitgang';

  @override
  String get showConfirmationBeforeExiting =>
      'Toon bevestiging voor jy verlaat';

  @override
  String get blockContentWithRatings =>
      'Blokkeer inhoud met die volgende graderings:';

  @override
  String get noContentRatingsFound =>
      'Geen inhoudgraderings is nog op hierdie bediener gevind nie.';

  @override
  String get couldNotLoadServerRatings =>
      'Kon nie bedienergraderings laai nie. Wys tans net gestoorde graderings.';

  @override
  String get couldNotRefreshRatings =>
      'Kon nie graderings vanaf bediener herlaai nie. Wys tans gestoorde graderings.';

  @override
  String get enablePinCode => 'Aktiveer PIN-kode';

  @override
  String get requirePinToAccess =>
      'Vereis \'n PIN om toegang tot jou rekening te kry';

  @override
  String get changePin => 'Verander PIN';

  @override
  String get setNewPinCode => 'Stel \'n nuwe PIN-kode';

  @override
  String get removePin => 'Verwyder PIN';

  @override
  String get removePinProtection => 'Verwyder PIN-kodebeskerming';

  @override
  String get screensaver => 'Skermbeveiliging';

  @override
  String get inAppScreensaver => 'In-App skermbewaarder';

  @override
  String get enableBuiltInScreensaver =>
      'Aktiveer die ingeboude skermbewaarder';

  @override
  String get mode => 'Modus';

  @override
  String get libraryArt => 'Biblioteekkuns';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Horlosie';

  @override
  String get timeout => 'Uitteltyd';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Verduistering Vlak';

  @override
  String get maxAgeRating => 'Maksimum ouderdomsgradering';

  @override
  String get any => 'Enige';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Vereis ouderdomsgradering';

  @override
  String get onlyShowRatedContent => 'Wys slegs gegradeerde inhoud';

  @override
  String get showClock => 'Wys Klok';

  @override
  String get displayClockDuringScreensaver =>
      'Vertoon klok tydens skermbewaarder';

  @override
  String get rottenTomatoesCritics => 'Vrot tamaties (kritici)';

  @override
  String get rottenTomatoesAudience => 'Vrot tamaties (gehoor)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritiek';

  @override
  String get metacriticUser => 'Metakritiek (gebruiker)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Gemeenskapgradering';

  @override
  String get ratings => 'Graderings';

  @override
  String get additionalRatings => 'Bykomende graderings';

  @override
  String get showMdbListAndTmdbRatings => 'Wys MDBList- en TMDB-graderings';

  @override
  String get ratingLabels => 'Graderingsetikette';

  @override
  String get showLabelsNextToIcons => 'Wys etikette langs gradering-ikone';

  @override
  String get ratingBadges => 'Graderingskentekens';

  @override
  String get showDecorativeBadges =>
      'Wys dekoratiewe kentekens agter graderings';

  @override
  String get episodeRatings => 'Episode Graderings';

  @override
  String get showRatingsOnEpisodes => 'Wys graderings op individuele episodes';

  @override
  String get ratingSources => 'Beoordeling Bronne';

  @override
  String get ratingSourcesDescription =>
      'Aktiveer en herrangskik die graderingsbronne wat regdeur die toepassing gewys word';

  @override
  String get pluginLabel => 'Inprop';

  @override
  String get pluginDetected => 'Inprop bespeur';

  @override
  String get pluginNotDetected => 'Inprop nie opgespoor nie';

  @override
  String get pluginDetectedDescription =>
      'Bediener-inprop bespeur. Sinkronisering word outomaties geaktiveer die eerste keer dat die inprop gevind word.';

  @override
  String get pluginNotDetectedDescription =>
      'Bedienerinprop word nie tans bespeur nie. Plaaslike instellings gebruik steeds hul gestoorde waardes of ingeboude verstekke.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Beskikbare dienste';

  @override
  String get serverPluginSync => 'Bediener-inpropsinkronisering';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkroniseer instellings met die bedienerinprop';

  @override
  String get whatSyncControls => 'Wat sinchroniseer beheer';

  @override
  String get syncControlsDescription =>
      'Sinkronisering beheer slegs of inprop-gesteunde instellings na die bediener gedruk en van die bediener af getrek word. Profielkeuse en profielsinkroniseringsaksies is in Pasmaakinstellings wanneer inpropsinkronisering geaktiveer is.';

  @override
  String get recentRequests => 'Onlangse versoeke';

  @override
  String get recentlyAdded => 'Onlangs bygevoeg';

  @override
  String get trending => 'Trending';

  @override
  String get popularMovies => 'Gewilde flieks';

  @override
  String get movieGenres => 'Fliek Genres';

  @override
  String get upcomingMovies => 'Komende flieks';

  @override
  String get studios => 'Studios';

  @override
  String get popularSeries => 'Gewilde reeks';

  @override
  String get seriesGenres => 'Reeks Genres';

  @override
  String get upcomingSeries => 'Komende reeks';

  @override
  String get networks => 'Netwerke';

  @override
  String get resetRowsToDefaults => 'Stel rye terug na verstek';

  @override
  String get enableSeerr => 'Aktiveer Siener';

  @override
  String get showSeerrInNavigation =>
      'Wys Seerr in navigasie (vereis bedienerinprop)';

  @override
  String get seerrUnavailable =>
      'Onbeskikbaar omdat bedienerinprop Seerr-ondersteuning gedeaktiveer is.';

  @override
  String get nsfwFilter => 'NSFW-filter';

  @override
  String get hideAdultContent => 'Versteek volwasse inhoud in resultate';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Ontdek rye';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Sleep om te herrangskik. Aktiveer of deaktiveer rye. Geaktiveerde ryvolgorde sinchroniseer met die Moonfin-inprop.';

  @override
  String get discoverRowsDescription =>
      'Sleep om te herrangskik. Aktiveer of deaktiveer rye.';

  @override
  String get enabled => 'Geaktiveer';

  @override
  String get hidden => 'Versteek';

  @override
  String get aboutTitle => 'Oor';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Oopbron-lisensies';

  @override
  String get sourceCode => 'Bronkode';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Kyk nou vir opdaterings';

  @override
  String get checksLatestDesktopRelease =>
      'Gaan die nuutste rekenaarvrystelling vir hierdie platform na';

  @override
  String get youAreUpToDate => 'Jy is op datum.';

  @override
  String get couldNotCheckForUpdates => 'Kon nie nou vir opdaterings kyk nie.';

  @override
  String get noCompatibleUpdate =>
      'Geen versoenbare opdateringspakket vir hierdie platform gevind nie.';

  @override
  String get updateChecksNotSupported =>
      'Opdateringskontroles word nie op hierdie platform ondersteun nie.';

  @override
  String get updateNotificationsDisabled =>
      'Opdateringskennisgewings is gedeaktiveer.';

  @override
  String get pleaseWaitBeforeChecking => 'Wag asseblief voor jy weer nagaan.';

  @override
  String get latestUpdateAlreadyShown => 'Jongste opdatering is reeds gewys.';

  @override
  String get updateAvailable => 'Opdatering beskikbaar.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Dateer kennisgewings op';

  @override
  String get showWhenUpdatesAvailable =>
      'Wys wanneer opdaterings beskikbaar is';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Lees vrystellingsnotas';

  @override
  String get downloadingUpdate => 'Laai tans opdatering af...';

  @override
  String get updateDownloadFailed =>
      'Kon nie opdateer aflaai nie. Probeer asseblief weer.';

  @override
  String get openReleasesPage => 'Maak vrystellingsbladsy oop';

  @override
  String get navigation => 'Navigasie';

  @override
  String get watchedIndicatorsBackdrops => 'Gekykte aanwysers, agtergronde';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokuskleur, gekykte aanwysers, agtergronde';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar styl, nutsbalk knoppies, voorkoms';

  @override
  String get reorderToggleHomeRows => 'Herrangskik en wissel tuisrye';

  @override
  String get featuredContentAppearance => 'Uitgestalte inhoud, voorkoms';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakkaatgrootte, beeldtipe, voueraansig';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB en graderingsbronne';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Duidelik';

  @override
  String get browse => 'Blaai deur';

  @override
  String get noResults => 'Geen resultate nie';

  @override
  String get seerrAvailableStatus => 'Beskikbaar';

  @override
  String get seerrRequestedStatus => 'Versoek';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Siener-instellings';

  @override
  String get requestMore => 'Versoek meer';

  @override
  String get request => 'Versoek';

  @override
  String get cancelRequest => 'Kanselleer versoek';

  @override
  String get playInMoonfin => 'Speel in Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Keur goed';

  @override
  String get declineAction => 'Weier';

  @override
  String get similar => 'Soortgelyk';

  @override
  String get recommendations => 'Aanbevelings';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Hou';

  @override
  String get itemNotFoundInLibrary =>
      'Item nie in jou Moonfin-biblioteek gevind nie';

  @override
  String get errorSearchingLibrary => 'Kon nie biblioteek soek nie';

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
  String get submitRequest => 'Dien Versoek in';

  @override
  String get allSeasons => 'Alle Seisoene';

  @override
  String get advancedOptions => 'Gevorderde Opsies';

  @override
  String get noServiceServersConfigured =>
      'Geen diensbedieners is opgestel nie';

  @override
  String get server => 'Bediener';

  @override
  String get qualityProfile => 'Kwaliteit profiel';

  @override
  String get rootFolder => 'Wortelgids';

  @override
  String get showMore => 'Wys meer';

  @override
  String get appearances => 'Verskynings';

  @override
  String get crewSection => 'Bemanning';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Geen versoeke nie';

  @override
  String get pendingStatus => 'Hangende';

  @override
  String get declinedStatus => 'Geweier';

  @override
  String get partiallyAvailable => 'Gedeeltelik beskikbaar';

  @override
  String get downloadingStatus => 'Laai tans af';

  @override
  String get approvedStatus => 'Goedgekeur';

  @override
  String get notRequestedStatus => 'Nie versoek nie';

  @override
  String get blocklistedStatus => 'Geblokkeer';

  @override
  String get deletedStatus => 'Geskrap';

  @override
  String get tmdbScore => 'TMDB-telling';

  @override
  String get releaseDateLabel => 'Vrystellingsdatum';

  @override
  String get firstAirDateLabel => 'Eerste lugdatum';

  @override
  String get revenueLabel => 'Inkomste';

  @override
  String get runtimeLabel => 'Looptyd';

  @override
  String get budgetLabel => 'Begroting';

  @override
  String get originalLanguageLabel => 'Oorspronklike taal';

  @override
  String get seasonsLabel => 'Seisoene';

  @override
  String get episodesLabel => 'Episodes';

  @override
  String get access => 'Toegang';

  @override
  String get add => 'Voeg by';

  @override
  String get address => 'Adres';

  @override
  String get analytics => 'Ontleding';

  @override
  String get catalog => 'Katalogus';

  @override
  String get content => 'Inhoud';

  @override
  String get copy => 'Kopieer';

  @override
  String get create => 'Skep';

  @override
  String get disable => 'Deaktiveer';

  @override
  String get done => 'Klaar';

  @override
  String get edit => 'Wysig';

  @override
  String get encoding => 'Enkodering';

  @override
  String get error => 'Fout';

  @override
  String get forward => 'Vorentoe';

  @override
  String get general => 'Algemeen';

  @override
  String get go => 'Gaan';

  @override
  String get install => 'Installeer';

  @override
  String get installed => 'Geïnstalleer';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Naam';

  @override
  String get networking => 'Netwerk';

  @override
  String get next => 'Volgende';

  @override
  String get path => 'Pad';

  @override
  String get paused => 'Onderbreek';

  @override
  String get permissions => 'Toestemmings';

  @override
  String get processing => 'Verwerking';

  @override
  String get profile => 'Profiel';

  @override
  String get provider => 'Verskaffer';

  @override
  String get refresh => 'Verfris';

  @override
  String get remote => 'Afgeleë';

  @override
  String get rename => 'Hernoem';

  @override
  String get revoke => 'Herroep';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Wortel';

  @override
  String get run => 'Hardloop';

  @override
  String get search => 'Soek';

  @override
  String get select => 'Kies';

  @override
  String get send => 'Stuur';

  @override
  String get sessions => 'Sessies';

  @override
  String get set => 'Stel';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Stroom';

  @override
  String get time => 'Tyd';

  @override
  String get trickplay => 'Truukspel';

  @override
  String get uninstall => 'Deïnstalleer';

  @override
  String get up => 'Op';

  @override
  String get update => 'Dateer op';

  @override
  String get upload => 'Laai op';

  @override
  String get unmute => 'Ontdemp';

  @override
  String get mute => 'Demp';

  @override
  String get branding => 'Handelsmerk';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Ontleding';

  @override
  String get adminDrawerSettings => 'Instellings';

  @override
  String get adminDrawerBranding => 'Handelsmerk';

  @override
  String get adminDrawerUsers => 'Gebruikers';

  @override
  String get adminDrawerLibraries => 'Biblioteke';

  @override
  String get adminDrawerTranscoding => 'Transkodering';

  @override
  String get adminDrawerResume => 'Hervat';

  @override
  String get adminDrawerStreaming => 'Stroom';

  @override
  String get adminDrawerTrickplay => 'Truukspel';

  @override
  String get adminDrawerDevices => 'Toestelle';

  @override
  String get adminDrawerActivity => 'Aktiwiteit';

  @override
  String get adminDrawerNetworking => 'Netwerk';

  @override
  String get adminDrawerApiKeys => 'API-sleutels';

  @override
  String get adminDrawerBackups => 'Rugsteun';

  @override
  String get adminDrawerLogs => 'Logs';

  @override
  String get adminDrawerScheduledTasks => 'Geskeduleerde take';

  @override
  String get adminDrawerPlugins => 'Inproppe';

  @override
  String get adminDrawerRepositories => 'Bewaarplekke';

  @override
  String get adminDrawerLiveTv => 'Regstreekse TV';

  @override
  String get adminExitTooltip => 'Verlaat Admin';

  @override
  String get adminDashboardLoadFailed => 'Kon nie kontroleskerm laai nie';

  @override
  String get adminMediaOverview => 'Media-oorsig';

  @override
  String get adminMediaTotalsError => 'Kon nie bedienermediatotale laai nie.';

  @override
  String get adminMediaOverviewSubtitle =>
      '\'n Vinnige lees oor hoeveel inhoud op hierdie bediener is.';

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
  String get analyticsMediaDistribution => 'Mediaverspreiding';

  @override
  String get analyticsVideoCodecs => 'Video-kodeks';

  @override
  String get analyticsAudioCodecs => 'Oudio-kodeks';

  @override
  String get analyticsContainers => 'Houers';

  @override
  String get analyticsTopGenres => 'Top Genres';

  @override
  String get analyticsReleaseYears => 'Vrystellingsjare';

  @override
  String get analyticsContentRatings => 'Inhoudgraderings';

  @override
  String get analyticsRuntimeBuckets => 'Runtime Emmers';

  @override
  String get analyticsFileFormats => 'Lêerformate';

  @override
  String get analyticsNoData => 'Geen data beskikbaar nie.';

  @override
  String get adminServerInfo => 'Bediener inligting';

  @override
  String get adminRestartPending => 'Herbegin Hangende';

  @override
  String get adminServerPaths => 'Bedienerpaaie';

  @override
  String get adminServerActions => 'Bedieneraksies';

  @override
  String get adminRestartServer => 'Herbegin bediener';

  @override
  String get adminShutdownServer => 'Sluit bediener af';

  @override
  String get adminScanLibraries => 'Skandeer biblioteke';

  @override
  String get adminLibraryScanStarted => 'Biblioteekskandering het begin';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Bediener herlaai aan die gang';

  @override
  String get adminServerRebootMessage =>
      'Bediener herlaai aan die gang, herbegin asseblief Moonfin';

  @override
  String get adminActiveSessions => 'Aktiewe sessies';

  @override
  String get adminSessionsLoadFailed => 'Kon nie sessies laai nie';

  @override
  String get adminNoActiveSessions => 'Geen aktiewe sessies nie';

  @override
  String get adminRecentActivity => 'Onlangse aktiwiteit';

  @override
  String get adminNoRecentActivity => 'Geen onlangse aktiwiteit nie';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Stuur Boodskap';

  @override
  String get adminMessageTextHint => 'Boodskap teks';

  @override
  String get adminSetVolume => 'Stel volume';

  @override
  String get sessionPrev => 'Vorige';

  @override
  String get sessionRewind => 'Spoel terug';

  @override
  String get sessionForward => 'Vorentoe';

  @override
  String get sessionNext => 'Volgende';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Speel nou';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Aksies';

  @override
  String get videoCodec => 'Video-kodek';

  @override
  String get audioCodec => 'Oudio-kodek';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Voltooiing';

  @override
  String get direct => 'Direkte';

  @override
  String get adminDisconnect => 'Ontkoppel';

  @override
  String get adminClearDates => 'Duidelike datums';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Geen aktiwiteitsinskrywings nie';

  @override
  String get adminEditDeviceName => 'Wysig Toestelnaam';

  @override
  String get adminCustomName => 'Gepasmaakte naam';

  @override
  String get adminDeviceNameUpdated => 'Toestelnaam is opgedateer';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Vee Toestel uit';

  @override
  String get adminDeviceDeleted => 'Toestel is uitgevee';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Kon nie toestelle laai nie';

  @override
  String get adminSearchDevices => 'Soek toestelle';

  @override
  String get adminThisDevice => 'Hierdie Toestel';

  @override
  String get adminEditName => 'Wysig Naam';

  @override
  String get adminLibrariesLoadFailed => 'Kon nie biblioteke laai nie';

  @override
  String get adminNoLibraries => 'Geen biblioteke opgestel nie';

  @override
  String get adminScanAllLibraries => 'Skandeer alle biblioteke';

  @override
  String get adminAddLibrary => 'Voeg biblioteek by';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Hernoem biblioteek';

  @override
  String get adminNewName => 'Nuwe naam';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Vee biblioteek uit';

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
  String get adminRemovePath => 'Verwyder Pad';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Biblioteekopsies gestoor';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kon nie biblioteek laai nie';

  @override
  String get adminNoMediaPaths => 'Geen mediapaaie is opgestel nie';

  @override
  String get adminAddPath => 'Voeg pad by';

  @override
  String get adminBrowseFilesystem => 'Blaai deur bedienerlêerstelsel:';

  @override
  String get adminSaveOptions => 'Stoor opsies';

  @override
  String get adminPreferredMetadataLanguage => 'Voorkeur metadatataal';

  @override
  String get adminMetadataLanguageHint => 'bv. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata landkode';

  @override
  String get adminMetadataCountryHint => 'bv. VSA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Biblioteeknaam word vereis';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Biblioteek Naam';

  @override
  String get adminSelectedPaths => 'Geselekteerde paaie:';

  @override
  String get adminNoPathsAdded =>
      'Geen paaie bygevoeg nie (kan later bygevoeg word)';

  @override
  String get adminCreateLibrary => 'Skep biblioteek';

  @override
  String get paths => 'Paadjies:';

  @override
  String get adminDisableUser => 'Deaktiveer gebruiker';

  @override
  String get adminEnableUser => 'Aktiveer gebruiker';

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
  String get adminUsersLoadFailed => 'Kon nie gebruikers laai nie';

  @override
  String get adminSearchUsers => 'Soek gebruikers';

  @override
  String get adminEditUser => 'Wysig gebruiker';

  @override
  String get adminAddUser => 'Voeg gebruiker by';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Skep gebruiker';

  @override
  String get adminPasswordOptional => 'Wagwoord (opsioneel)';

  @override
  String get adminUsernameRequired => 'Gebruikersnaam kan nie leeg wees nie';

  @override
  String get adminNoProfileChanges =>
      'Geen profielveranderinge om te stoor nie';

  @override
  String get adminProfileSaved => 'Profiel gestoor';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Toestemmings gestoor';

  @override
  String get adminPasswordsMismatch => 'Wagwoorde stem nie ooreen nie';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kon nie gebruiker laai nie';

  @override
  String get adminBackToUsers => 'Terug na Gebruikers';

  @override
  String get adminSaveProfile => 'Stoor profiel';

  @override
  String get adminDeleteUser => 'Vee gebruiker uit';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administrateurs het volledige toegang tot die bediener. Gee met omsigtigheid.';

  @override
  String get administrator => 'Administrateur';

  @override
  String get adminHiddenUser => 'Versteekte gebruiker';

  @override
  String get adminAllowMediaPlayback => 'Laat mediaterugspeel toe';

  @override
  String get adminAllowAudioTranscoding => 'Laat oudio-transkodering toe';

  @override
  String get adminAllowVideoTranscoding => 'Laat video-transkodering toe';

  @override
  String get adminAllowRemuxing => 'Laat hermenging toe';

  @override
  String get adminForceRemoteTranscoding =>
      'Dwing afgeleë brontranskodering af';

  @override
  String get adminAllowContentDeletion => 'Laat inhouduitvee toe';

  @override
  String get adminAllowContentDownloading => 'Laat inhoud aflaai toe';

  @override
  String get adminAllowPublicSharing => 'Laat publieke deling toe';

  @override
  String get adminAllowRemoteControl =>
      'Laat afstandbeheer van ander gebruikers toe';

  @override
  String get adminAllowSharedDeviceControl => 'Laat gedeelde toestelbeheer toe';

  @override
  String get adminAllowRemoteAccess => 'Laat afstandtoegang toe';

  @override
  String get adminRemoteBitrateLimit =>
      'Afgeleë kliënt bitsnelheid limiet (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Laat leeg vir geen beperking nie';

  @override
  String get adminMaxActiveSessions => 'Maksimum aktiewe sessies';

  @override
  String get adminAllowLiveTvAccess => 'Laat regstreekse TV-toegang toe';

  @override
  String get adminAllowLiveTvManagement => 'Laat regstreekse TV-bestuur toe';

  @override
  String get adminAllowCollectionManagement => 'Laat versamelingsbestuur toe';

  @override
  String get adminAllowSubtitleManagement => 'Laat onderskrifbestuur toe';

  @override
  String get adminAllowLyricManagement => 'Laat liriekbestuur toe';

  @override
  String get adminSavePermissions => 'Stoor toestemmings';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktiveer toegang tot alle biblioteke';

  @override
  String get adminSaveAccess => 'Stoor toegang';

  @override
  String get adminChangePassword => 'Verander wagwoord';

  @override
  String get adminNewPassword => 'Nuwe wagwoord';

  @override
  String get adminConfirmPassword => 'Bevestig wagwoord';

  @override
  String get adminSetPassword => 'Stel wagwoord in';

  @override
  String get adminResetPassword => 'Stel wagwoord terug';

  @override
  String get adminPasswordReset => 'Wagwoord herstel';

  @override
  String get adminPasswordUpdated => 'Wagwoord is opgedateer';

  @override
  String get adminUserSettings => 'Gebruikerinstellings';

  @override
  String get adminLibraryAccess => 'Biblioteektoegang';

  @override
  String get adminDeviceAndChannelAccess => 'Toestel- en kanaaltoegang';

  @override
  String get adminEnableAllDevices => 'Aktiveer toegang tot alle toestelle';

  @override
  String get adminEnableAllChannels => 'Aktiveer toegang tot alle kanale';

  @override
  String get adminResetPasswordWarning =>
      'Dit sal die wagwoord verwyder. Die gebruiker sal sonder \'n wagwoord kan aanmeld.';

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
  String get adminCreateApiKey => 'Skep API-sleutel';

  @override
  String get adminAppName => 'Programnaam';

  @override
  String get adminApiKeyCreated => 'API-sleutel geskep';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Sleutel suksesvol geskep. Die bediener het nie die token teruggestuur nie. Gaan bediener API-sleutels na.';

  @override
  String get adminKeyCopied => 'Sleutel is na knipbord gekopieer';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Sleuteltoken ontbreek in bedienerantwoord';

  @override
  String get adminRevokeApiKey => 'Herroep API-sleutel';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-sleutel herroep';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Kon nie API-sleutels laai nie';

  @override
  String get adminApiKeysTitle => 'API-sleutels';

  @override
  String get adminCreateKey => 'Skep sleutel';

  @override
  String get adminNoApiKeys => 'Geen API-sleutels gevind nie';

  @override
  String get adminUnknownApp => 'Onbekende toepassing';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Skep tans rugsteun …';

  @override
  String get adminBackupCreated => 'Rugsteun suksesvol geskep';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Rugsteunpad ontbreek in bedienerantwoord';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Bevestig herstel';

  @override
  String get adminRestoringBackup => 'Laai tans rugsteun terug …';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Kon nie rugsteune laai nie';

  @override
  String get adminCreateBackup => 'Skep rugsteun';

  @override
  String get adminNoBackups => 'Geen rugsteun gevind nie';

  @override
  String get adminViewDetails => 'Bekyk besonderhede';

  @override
  String get restore => 'Herstel';

  @override
  String get adminLogsLoadFailed => 'Kon nie bedienerloglêers laai nie';

  @override
  String get adminNoLogFiles => 'Geen loglêers gevind nie';

  @override
  String get adminLogCopied => 'Logboek is na knipbord gekopieer';

  @override
  String get adminSaveLogFile => 'Stoor loglêer';

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
  String get adminSearchInLog => 'Soek in log';

  @override
  String get adminNoMatchingLines => 'Geen ooreenstemmende lyne nie';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Geen geskeduleerde take gevind nie';

  @override
  String get adminNoTasksMatchFilter =>
      'Geen take pas by die huidige filter nie';

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
  String get adminRunNow => 'Hardloop nou';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Laaste uitvoering';

  @override
  String get adminTriggers => 'Snellers';

  @override
  String get adminAddTrigger => 'Voeg sneller by';

  @override
  String get adminNoTriggers => 'Geen snellers is opgestel nie';

  @override
  String get adminTriggerType => 'Sneller tipe';

  @override
  String get adminTimeLimit => 'Tydsbeperking (opsioneel)';

  @override
  String get adminNoLimit => 'Geen beperking nie';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dag van die week';

  @override
  String get adminSearchPlugins => 'Soek inproppe...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Verwyder inprop';

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
  String get adminNoPluginsMatchSearch => 'Geen plugins pas by jou soektog nie';

  @override
  String get adminNoPluginsInstalled => 'Geen plugins geïnstalleer nie';

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
      'Geen pakkette pas by jou soektog nie';

  @override
  String get adminNoPackagesAvailable => 'Geen pakkette beskikbaar nie';

  @override
  String get adminExperimentalIntegration => 'Eksperimentele integrasie';

  @override
  String get adminExperimentalWarning =>
      'Inpropinstellingsintegrasie is steeds eksperimenteel. Sommige instellingsbladsye sal dalk nie korrek weergee nie.';

  @override
  String get continueAction => 'Gaan voort';

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
      'Kan nie instellings oopmaak nie: outoriteittoken ontbreek.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Inprop nie gevind nie';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Aktiveer inprop';

  @override
  String get adminPluginSettingsPage => 'Inpropinstellingsbladsy';

  @override
  String get adminRevisionHistory => 'Hersieningsgeskiedenis';

  @override
  String get adminNoChangelog => 'Geen veranderingslog beskikbaar nie.';

  @override
  String get adminRemoveRepository => 'Verwyder bewaarplek';

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
  String get adminRepositoryNameHint => 'bv. Jellyfin Stabiel';

  @override
  String get adminRepositoryUrl => 'Bewaar-URL';

  @override
  String get adminAddEntry => 'Voeg inskrywing by';

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
  String get adminOpenInBrowser => 'Maak oop in blaaier';

  @override
  String get adminOpenExternally => 'Maak ekstern oop';

  @override
  String get adminGeneralSettings => 'Algemene instellings';

  @override
  String get adminServerName => 'Bediener naam';

  @override
  String get adminPreferredMetadataCountry => 'Voorkeur metadata-land';

  @override
  String get adminCachePath => 'Kas pad';

  @override
  String get adminMetadataPath => 'Metadata pad';

  @override
  String get adminLibraryScanConcurrency => 'Biblioteekskandering gelyktydig';

  @override
  String get adminParallelImageEncodingLimit =>
      'Parallelle prentenkoderingslimiet';

  @override
  String get adminSlowResponseThreshold => 'Stadige reaksie drempel (ms)';

  @override
  String get adminBrandingSaved => 'Handelsmerkinstellings is gestoor';

  @override
  String get adminBrandingLoadFailed =>
      'Kon nie handelsmerkinstellings laai nie';

  @override
  String get adminLoginDisclaimer => 'Teken in vrywaring';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML wat onder die aanmeldvorm vertoon word';

  @override
  String get adminCustomCss => 'Pasgemaakte CSS';

  @override
  String get adminCustomCssHint =>
      'Pasgemaakte CSS toegepas op die webkoppelvlak';

  @override
  String get adminEnableSplashScreen => 'Aktiveer plonsskerm';

  @override
  String get adminStreamingSaved => 'Stroominstellings is gestoor';

  @override
  String get adminStreamingLoadFailed => 'Kon nie strominginstellings laai nie';

  @override
  String get adminStreamingDescription =>
      'Stel globale stroom-bitsnelheidlimiete vir afgeleë verbindings.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Afgeleë kliënt bitsnelheid limiet (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Laat leeg of 0 vir onbeperk';

  @override
  String get adminPlaybackSaved => 'Afspeelinstellings gestoor';

  @override
  String get adminPlaybackLoadFailed =>
      'Kon nie terugspeelinstellings laai nie';

  @override
  String get adminPlaybackTranscoding => 'Afspeel / Transkodering';

  @override
  String get adminHardwareAcceleration => 'Hardeware versnelling';

  @override
  String get adminVaapiDevice => 'VA-API toestel';

  @override
  String get adminEnableHardwareEncoding => 'Aktiveer hardeware-kodering';

  @override
  String get adminEnableHardwareDecoding =>
      'Aktiveer hardeware-dekodering vir:';

  @override
  String get adminEncodingThreads => 'Enkodering drade';

  @override
  String get adminAutomatic => '0 = outomaties';

  @override
  String get adminTranscodingTempPath => 'Transkodering temp pad';

  @override
  String get adminEnableFallbackFont => 'Aktiveer terugvalfont';

  @override
  String get adminFallbackFontPath => 'Terugval font pad';

  @override
  String get adminAllowSegmentDeletion => 'Laat segmentuitvee toe';

  @override
  String get adminSegmentKeepSeconds => 'Segment hou (sekondes)';

  @override
  String get adminThrottleBuffering => 'Throttle buffering';

  @override
  String get adminTrickplaySaved => 'Trickplay-instellings gestoor';

  @override
  String get adminTrickplayLoadFailed =>
      'Kon nie trickplay-instellings laai nie';

  @override
  String get adminEnableHardwareAcceleration => 'Aktiveer hardewareversnelling';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktiveer slegs sleutelraam-onttrekking';

  @override
  String get adminKeyFrameSubtitle => 'Vinniger maar laer akkuraatheid';

  @override
  String get adminScanBehavior => 'Skandeer gedrag';

  @override
  String get adminProcessPriority => 'Proses prioriteit';

  @override
  String get adminImageSettings => 'Beeldinstellings';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Hoe gereeld om rame vas te vang';

  @override
  String get adminWidthResolutions => 'Breedte resolusies';

  @override
  String get adminTileWidth => 'Teël breedte';

  @override
  String get adminTileHeight => 'Teël hoogte';

  @override
  String get adminQualitySubtitle =>
      'Laer waardes = beter kwaliteit, groter lêers';

  @override
  String get adminProcessThreads => 'Verwerk drade';

  @override
  String get adminResumeSaved => 'Hervat instellings gestoor';

  @override
  String get adminResumeLoadFailed => 'Kon nie CV-instellings laai nie';

  @override
  String get adminResumeDescription =>
      'Stel op wanneer inhoud gemerk moet word as gedeeltelik gespeel of volledig gespeel.';

  @override
  String get adminMinResumePercentage => 'Minimum hervat persentasie';

  @override
  String get adminMinResumeSubtitle =>
      'Inhoud moet verby hierdie persentasie gespeel word om vordering te bespaar';

  @override
  String get adminMaxResumePercentage => 'Maksimum hervat persentasie';

  @override
  String get adminMaxResumeSubtitle =>
      'Inhoud word beskou as volledig gespeel na hierdie persentasie';

  @override
  String get adminMinResumeDuration => 'Minimum duur van hervat (sekondes)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Items korter as dit kan nie hervat word nie';

  @override
  String get adminMinAudiobookResume => 'Minimum oudioboek hervat persentasie';

  @override
  String get adminMaxAudiobookResume => 'Maksimum oudioboek hervat persentasie';

  @override
  String get adminNetworkingSaved =>
      'Netwerkinstellings gestoor. \'n Bediener herbegin kan nodig wees.';

  @override
  String get adminNetworkingLoadFailed => 'Kon nie netwerkinstellings laai nie';

  @override
  String get adminNetworkingWarning =>
      'Veranderinge aan netwerkinstellings kan dalk \'n bediener herbegin vereis.';

  @override
  String get adminEnableRemoteAccess => 'Aktiveer afstandtoegang';

  @override
  String get ports => 'Hawens';

  @override
  String get adminHttpPort => 'HTTP-poort';

  @override
  String get adminHttpsPort => 'HTTPS-poort';

  @override
  String get adminPublicHttpsPort => 'Openbare HTTPS-poort';

  @override
  String get adminBaseUrl => 'Basis URL';

  @override
  String get adminBaseUrlHint => 'bv. /jellietjie';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktiveer HTTPS';

  @override
  String get adminLocalNetwork => 'Plaaslike netwerk';

  @override
  String get adminLocalNetworkAddresses => 'Plaaslike netwerkadresse';

  @override
  String get adminKnownProxies => 'Bekende gevolmagtigdes';

  @override
  String get adminRemoteIpFilter => 'Afgeleë IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'Afgeleë IP-filter';

  @override
  String get adminCertificatePath => 'Sertifikaat pad';

  @override
  String get whitelist => 'Witlys';

  @override
  String get blacklist => 'Swartlys';

  @override
  String get notSet => 'Nie gestel nie';

  @override
  String get adminMetadataSaved => 'Metadata gestoor';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Herlaai metadata';

  @override
  String get recursive => 'Rekursief';

  @override
  String get adminReplaceAllMetadata => 'Vervang alle metadata';

  @override
  String get adminReplaceAllImages => 'Vervang alle beelde';

  @override
  String get adminMetadataRefreshRequested => 'Metadata-herlaai is versoek';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Soek afgeleë persoon';

  @override
  String get adminNoRemoteMatches => 'Geen afstandpassings gevind nie';

  @override
  String get adminRemoteResults => 'Afgeleë resultate';

  @override
  String get adminRemoteMetadataApplied => 'Afgeleë metadata toegepas';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Dateer inhoudtipe op';

  @override
  String get adminContentType => 'Inhoud tipe';

  @override
  String get adminContentTypeUpdated => 'Inhoudtipe opgedateer';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Kon nie metadataredigeerder laai nie';

  @override
  String get adminNoPeopleEntries => 'Geen mense inskrywings nie';

  @override
  String get adminNoExternalIds => 'Geen eksterne ID\'s beskikbaar nie';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Onondersteunde prentformaat';

  @override
  String get adminImageReadFailed => 'Kon nie geselekteerde prent lees nie';

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
  String get adminAllProviders => 'Alle verskaffers';

  @override
  String get adminNoRemoteImages => 'Geen afgeleë prente gevind nie';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Voeg Tuner by';

  @override
  String get adminTunerType => 'Tuner Tipe';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Ander';

  @override
  String get adminUrlPath => 'URL / Pad';

  @override
  String get adminNameOptional => 'Naam (opsioneel)';

  @override
  String get adminTunerAdded => 'Tuner bygevoeg';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Voeg gidsverskaffer by';

  @override
  String get adminProviderType => 'Verskaffer tipe';

  @override
  String get adminProviderTypeHint => 'SkedulesDirect of XMLTV';

  @override
  String get adminUsernameOptional => 'Gebruikersnaam (opsioneel)';

  @override
  String get adminRefreshInterval => 'Herlaai interval (ure)';

  @override
  String get adminProviderAdded => 'Verskaffer bygevoeg';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tunerterugstelling versoek';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Opname-instellings';

  @override
  String get adminPrePadding => 'Voorafvulling (minute)';

  @override
  String get adminPostPadding => 'Na-opvulling (minute)';

  @override
  String get adminRecordingPath => 'Opname pad';

  @override
  String get adminSeriesRecordingPath => 'Reeks opname pad';

  @override
  String get adminRecordingSettingsSaved => 'Opname-instellings gestoor';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Stel kanaalkaarte in';

  @override
  String get adminMappingJson => 'Kartering van JSON';

  @override
  String get adminMappingJsonHint => 'Voorbeeld: kartering van JSON loonvrag';

  @override
  String get adminChannelMappingsUpdated => 'Kanaalkaarte is opgedateer';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Kon nie regstreekse TV-administrasie laai nie';

  @override
  String get adminTunerDevices => 'Tuner toestelle';

  @override
  String get adminNoTunerHosts => 'Geen ontvangergashere is opgestel nie';

  @override
  String get adminGuideProviders => 'Gidsverskaffers';

  @override
  String get adminAddProvider => 'Voeg verskaffer by';

  @override
  String get adminNoListingProviders => 'Geen lysverskaffers is opgestel nie';

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
  String get adminTunerDiscovery => 'Tuner Discovery';

  @override
  String get adminChannelMappings => 'Kanaalkaarte';

  @override
  String get adminNoDiscoveredTuners => 'Nog geen tuners ontdek nie';

  @override
  String get adminSettingsSaved => 'Instellings gestoor';

  @override
  String get adminBackupsNotAvailable =>
      'Rugsteun is nie beskikbaar op hierdie bedienerbou nie.';

  @override
  String get adminRestoreWarning1 =>
      'Herstel sal ALLE huidige bedienerdata vervang met die rugsteundata.';

  @override
  String get adminRestoreWarning2 =>
      'Huidige bedienerinstellings, gebruikers en biblioteekdata sal oorskryf word.';

  @override
  String get adminRestoreWarning3 => 'Die bediener sal na herstel herbegin.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Herstel versoek. Bediener herbegin kan hierdie sessie ontkoppel.';

  @override
  String get adminBackupsTitle => 'Rugsteun';

  @override
  String get adminUnknownDate => 'Onbekende datum';

  @override
  String get adminUnnamedBackup => 'Naamlose rugsteun';

  @override
  String get adminLiveTvNotAvailable =>
      'Regstreekse TV-administrasie is nie beskikbaar op hierdie bedienerbou nie.';

  @override
  String get adminLiveTvTitle => 'Regstreekse TV-administrasie';

  @override
  String get adminApply => 'Doen aansoek';

  @override
  String get adminNotSet => 'Nie gestel nie';

  @override
  String get adminReset => 'Stel terug';

  @override
  String get adminLogsTitle => 'Bediener logs';

  @override
  String get adminLogsNewestFirst => 'Nuutste Eerste';

  @override
  String get adminLogsOldestFirst => 'Oudste Eerste';

  @override
  String get adminLogsJustNow => 'Netnou';

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
  String get adminLogViewerNoMatches => 'Geen ooreenstemmende lyne nie';

  @override
  String get adminMetadataEditorTitle => 'Metadata-redigeerder';

  @override
  String get adminMetadataRemote => 'Afgeleë';

  @override
  String get adminMetadataType => 'Tik';

  @override
  String get adminMetadataDetails => 'Besonderhede';

  @override
  String get adminMetadataExternalIds => 'Eksterne ID\'s';

  @override
  String get adminMetadataImages => 'Beelde';

  @override
  String get adminMetadataFieldTitle => 'Titel';

  @override
  String get adminMetadataFieldSortTitle => 'Sorteer titel';

  @override
  String get adminMetadataFieldOriginalTitle => 'Oorspronklike titel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premièredatum (JJJJ-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Einddatum (JJJJ-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Produksie jaar';

  @override
  String get adminMetadataFieldOfficialRating => 'Amptelike gradering';

  @override
  String get adminMetadataFieldCommunityRating => 'Gemeenskapsgradering';

  @override
  String get adminMetadataFieldCriticRating => 'Kritici gradering';

  @override
  String get adminMetadataFieldTagline => 'Byskrif';

  @override
  String get adminMetadataFieldOverview => 'Oorsig';

  @override
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Merkers';

  @override
  String get adminMetadataStudios => 'Studios';

  @override
  String get adminMetadataPeople => 'Mense';

  @override
  String get adminMetadataAddGenre => 'Voeg genre by';

  @override
  String get adminMetadataAddTag => 'Voeg merker by';

  @override
  String get adminMetadataAddStudio => 'Voeg ateljee by';

  @override
  String get adminMetadataAddPerson => 'Voeg persoon by';

  @override
  String get adminMetadataEditPerson => 'Wysig persoon';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'Primêr';

  @override
  String get adminMetadataImageBackdrop => 'Agtergrond';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banier';

  @override
  String get adminMetadataImageThumb => 'Duim';

  @override
  String get adminMetadataRecursive => 'Rekursief';

  @override
  String get adminMetadataProvider => 'Verskaffer';

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
      'Kon nie geselekteerde prent lees nie';

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
      'Dit verwyder die huidige prent van die item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Laai op';

  @override
  String get adminMetadataUpdate => 'Dateer op';

  @override
  String get adminMetadataRemoteImage => 'Afgeleë beeld';

  @override
  String get adminPluginsInstalled => 'Geïnstalleer';

  @override
  String get adminPluginsCatalog => 'Katalogus';

  @override
  String get adminPluginsActive => 'Aktief';

  @override
  String get adminPluginsRestart => 'Herbegin';

  @override
  String get adminPluginsNoSearchResults =>
      'Geen plugins pas by jou soektog nie';

  @override
  String get adminPluginsNoneInstalled => 'Geen plugins geïnstalleer nie';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Opdatering beskikbaar';

  @override
  String get adminPluginsPendingRemoval => 'Hangende verwydering na herbegin';

  @override
  String get adminPluginsChangesPending => 'Veranderinge hangende herbegin';

  @override
  String get adminPluginsEnable => 'Aktiveer';

  @override
  String get adminPluginsDisable => 'Deaktiveer';

  @override
  String get adminPluginsInstallUpdate => 'Installeer opdatering';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Geen pakkette pas by jou soektog nie';

  @override
  String get adminPluginsCatalogEmpty => 'Geen pakkette beskikbaar nie';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentele integrasie';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Inpropinstellingsintegrasie is steeds eksperimenteel. Sommige velde of uitlegte sal dalk nog nie korrek weergee nie.';

  @override
  String get adminPluginDetailToggle404 =>
      'Kon nie inprop verander nie. Die bediener kon nie hierdie inpropweergawe vind nie. Probeer plugins te verfris en probeer dan weer.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Kon nie inprop verander nie. Gaan asseblief bedienerlogs na vir besonderhede.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Besonderhede';

  @override
  String get adminPluginDetailDeveloper => 'Ontwikkelaar';

  @override
  String get adminPluginDetailRepository => 'Bewaarplek';

  @override
  String get adminPluginDetailBundled => 'Gebondel';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktiveer inprop';

  @override
  String get adminPluginDetailRestartRequired =>
      '\'n Bediener herbegin word vereis vir veranderinge om in werking te tree.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Hierdie inprop sal verwyder word nadat die bediener herbegin het.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Hierdie inprop het wanfunksioneer en sal dalk nie reg werk nie.';

  @override
  String get adminPluginDetailNotSupported =>
      'Hierdie inprop word nie deur die huidige bedienerweergawe ondersteun nie.';

  @override
  String get adminPluginDetailSuperseded =>
      'Hierdie inprop is vervang deur \'n nuwer weergawe.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Verwyder bewaarplek';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Verwyder';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Geen bewaarplekke opgestel nie';

  @override
  String get adminReposEmptySubtitle =>
      'Voeg \'n bewaarplek by om deur beskikbare inproppe te blaai';

  @override
  String get adminReposUnnamed => '(onnaam)';

  @override
  String get adminReposEditTitle => 'Wysig bewaarplek';

  @override
  String get adminReposAddTitle => 'Voeg bewaarplek by';

  @override
  String get adminReposUrl => 'Bewaar-URL';

  @override
  String get adminReposNameHint => 'bv. Jellyfin Stabiel';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ongeldige URL';

  @override
  String get adminGeneralSettingsTitle => 'Algemene instellings';

  @override
  String get adminGeneralMetadataLanguage => 'Voorkeur metadatataal';

  @override
  String get adminGeneralMetadataLanguageHint => 'bv. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Voorkeur metadata-land';

  @override
  String get adminGeneralMetadataCountryHint => 'bv. VSA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Biblioteekskandering gelyktydig';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Parallelle prentenkoderingslimiet';

  @override
  String get adminUnknownError => 'Onbekende fout';

  @override
  String get adminBrowse => 'Blaai deur';

  @override
  String get adminCloseBrowser => 'Maak blaaier toe';

  @override
  String get adminNetworkingTitle => 'Netwerk';

  @override
  String get adminNetworkingRestartWarning =>
      'Veranderinge aan netwerkinstellings kan dalk \'n bediener herbegin vereis.';

  @override
  String get adminNetworkingRemoteAccess => 'Aktiveer afstandtoegang';

  @override
  String get adminNetworkingPorts => 'Hawens';

  @override
  String get adminNetworkingHttpPort => 'HTTP-poort';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-poort';

  @override
  String get adminNetworkingEnableHttps => 'Aktiveer HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Plaaslike netwerk';

  @override
  String get adminNetworkingLocalAddresses => 'Plaaslike netwerkadresse';

  @override
  String get adminNetworkingAddressHint => 'bv. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Bekende gevolmagtigdes';

  @override
  String get adminNetworkingProxyHint => 'bv. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Witlys';

  @override
  String get adminNetworkingBlacklist => 'Swartlys';

  @override
  String get adminNetworkingAddEntry => 'Voeg inskrywing by';

  @override
  String get adminBrandingTitle => 'Handelsmerk';

  @override
  String get adminBrandingLoginDisclaimer => 'Teken in vrywaring';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML wat onder die aanmeldvorm vertoon word';

  @override
  String get adminBrandingCustomCss => 'Pasgemaakte CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Pasgemaakte CSS toegepas op die webkoppelvlak';

  @override
  String get adminBrandingEnableSplash => 'Aktiveer plonsskerm';

  @override
  String get adminPlaybackHwAccel => 'Hardeware versnelling';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardeware versnelling';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktiveer hardeware-kodering';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aktiveer hardeware-dekodering vir:';

  @override
  String get adminPlaybackEncoding => 'Enkodering';

  @override
  String get adminPlaybackEncodingThreads => 'Enkodering drade';

  @override
  String get adminPlaybackFallbackFont => 'Aktiveer terugvalfont';

  @override
  String get adminPlaybackFallbackFontPath => 'Terugval font pad';

  @override
  String get adminPlaybackStreaming => 'Stroom';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Oudioboeke';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimum oudioboek hervat persentasie';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimum oudioboek hervat persentasie';

  @override
  String get adminStreamingBitrateLimit =>
      'Afgeleë kliënt bitsnelheid limiet (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Laat leeg of 0 vir onbeperk';

  @override
  String get adminTrickplayHwAccel => 'Aktiveer hardewareversnelling';

  @override
  String get adminTrickplayHwEncoding => 'Aktiveer hardeware-kodering';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Aktiveer slegs sleutelraam-onttrekking';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Vinniger maar laer akkuraatheid';

  @override
  String get adminTrickplayNonBlocking => 'Nie-Blokkering';

  @override
  String get adminTrickplayBlocking => 'Blokkering';

  @override
  String get adminTrickplayPriorityHigh => 'Hoog';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Bo Normaal';

  @override
  String get adminTrickplayPriorityNormal => 'Normaal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Onder Normaal';

  @override
  String get adminTrickplayPriorityIdle => 'Ledig';

  @override
  String get adminTrickplayImageSettings => 'Beeldinstellings';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Hoe gereeld om rame vas te vang';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Komma-geskeide piekselwydtes (bv. 320)';

  @override
  String get adminTrickplayQuality => 'Kwaliteit';

  @override
  String get adminTrickplayQScale => 'Kwaliteit skaal';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Laer waardes = beter kwaliteit, groter lêers';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kwaliteit';

  @override
  String get adminTrickplayProcessing => 'Verwerking';

  @override
  String get adminTasksEmpty => 'Geen geskeduleerde take gevind nie';

  @override
  String get adminTasksNoFilterMatch =>
      'Geen take pas by die huidige filter nie';

  @override
  String get adminTaskCancelling => 'Kanselleer tans …';

  @override
  String get adminTaskRunning => 'Aan die gang...';

  @override
  String get adminTaskNeverRun => 'Moet nooit hardloop nie';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Hardloop';

  @override
  String get adminTaskDetailLastExecution => 'Laaste uitvoering';

  @override
  String get adminTaskDetailStarted => 'Het begin';

  @override
  String get adminTaskDetailEnded => 'Geëindig';

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
  String get adminTaskTriggerStartup => 'By die opstart van die toepassing';

  @override
  String get adminTaskTriggerTypeDaily => 'Daagliks';

  @override
  String get adminTaskTriggerTypeWeekly => 'Weekliks';

  @override
  String get adminTaskTriggerTypeInterval => 'Op \'n interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Elke uur';

  @override
  String get adminTaskTriggerEvery6Hours => 'Elke 6 uur';

  @override
  String get adminTaskTriggerEvery12Hours => 'Elke 12 uur';

  @override
  String get adminTaskTriggerEvery24Hours => 'Elke 24 uur';

  @override
  String get adminTaskTriggerEvery2Days => 'Elke 2 dae';

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
  String get adminTaskTriggerTime => 'Tyd';

  @override
  String get adminTaskTriggerNoLimit => 'Geen beperking nie';

  @override
  String get adminActivityJustNow => 'Netnou';

  @override
  String get adminActivityLastHour => 'Laaste uur';

  @override
  String get adminActivityToday => 'Vandag';

  @override
  String get adminActivityYesterday => 'Gister';

  @override
  String get adminActivityOlder => 'Ouer';

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
  String get adminActivityNow => 'nou';

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
      'Stel trickplay-beeldgenerering op vir soekvoorskou-kleinkiekies.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Openbare HTTPS-poort';

  @override
  String get adminNetworkingBaseUrl => 'Basis URL';

  @override
  String get adminNetworkingBaseUrlHint => 'bv. /jellietjie';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Sertifikaat pad';

  @override
  String get adminNetworkingRemoteIpFilter => 'Afgeleë IP-filter';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Afgeleë IP-filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API toestel';

  @override
  String get adminPlaybackAutomatic => '0 = outomaties';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkodering temp pad';

  @override
  String get adminPlaybackSegmentDeletion => 'Laat segmentuitvee toe';

  @override
  String get adminPlaybackSegmentKeep => 'Segment hou (sekondes)';

  @override
  String get adminPlaybackThrottleBuffering => 'Throttle buffering';

  @override
  String get adminResumeMinPct => 'Minimum hervat persentasie';

  @override
  String get adminResumeMinPctSubtitle =>
      'Inhoud moet verby hierdie persentasie gespeel word om vordering te bespaar';

  @override
  String get adminResumeMaxPct => 'Maksimum hervat persentasie';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Inhoud word beskou as volledig gespeel na hierdie persentasie';

  @override
  String get adminResumeMinDuration => 'Minimum duur van hervat (sekondes)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Items korter as dit kan nie hervat word nie';

  @override
  String get adminTrickplayScanBehavior => 'Skandeer gedrag';

  @override
  String get adminTrickplayProcessPriority => 'Proses prioriteit';

  @override
  String get adminTrickplayTileWidth => 'Teël breedte';

  @override
  String get adminTrickplayTileHeight => 'Teël hoogte';

  @override
  String get adminTrickplayProcessThreads => 'Verwerk drade';

  @override
  String get adminTrickplayWidthResolutions => 'Breedte resolusies';

  @override
  String get adminMetadataDefault => 'Verstek';

  @override
  String get adminMetadataContentTypeUpdated => 'Inhoudtipe opgedateer';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Stadige reaksie drempel (ms)';

  @override
  String get adminGeneralCachePath => 'Kas pad';

  @override
  String get adminGeneralMetadataPath => 'Metadata pad';

  @override
  String get adminGeneralServerName => 'Bediener naam';

  @override
  String get adminSettingsLoadFailed => 'Kon nie instellings laai nie';

  @override
  String get adminDiscover => 'Ontdek';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Dopsies';

  @override
  String get libraries => 'Biblioteke';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay gedeaktiveer';

  @override
  String get syncPlayDisabledMessage =>
      'Aktiveer SyncPlay in Instellings om gesinchroniseerde terugspeel te gebruik.';

  @override
  String get syncPlayServerUnsupportedTitle =>
      'Bediener word nie ondersteun nie';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay vereis \'n Jellyfin-bediener. Die huidige bediener ondersteun dit nie.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Groep';

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
  String get syncPlayIgnoreWait => 'Ignoreer wag';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Moenie die groep omhoog hou terwyl hierdie toestel buffer nie';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Gaan plaaslik voort sonder om te wag vir stadige lede';

  @override
  String get syncPlayRepeat => 'Herhaal';

  @override
  String get syncPlayRepeatOne => 'Een';

  @override
  String get syncPlayShuffleModeShuffled => 'Geskommel';

  @override
  String get syncPlayShuffleModeSorted => 'Gesorteer';

  @override
  String get syncPlaySyncCurrentQueue => 'Sinkroniseer huidige afspeelwag';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Vervang die groep tou met wat plaaslik speel';

  @override
  String get syncPlayLeaveGroup => 'Verlaat groep';

  @override
  String get syncPlayGroupQueue => 'Groep tou';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Speel nou';

  @override
  String get syncPlayCreateNewGroup => 'Skep \'n nuwe groep';

  @override
  String get syncPlayGroupName => 'Groepnaam';

  @override
  String get syncPlayDefaultGroupName => 'My SyncPlay-groep';

  @override
  String get syncPlayCreateGroup => 'Skep groep';

  @override
  String get syncPlayAvailableGroups => 'Beskikbare groepe';

  @override
  String get syncPlayNoGroupsAvailable => 'Geen groepe beskikbaar nie';

  @override
  String get syncPlayJoinGroupQuestion => 'Sluit aan by SyncPlay-groep?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Om by \'n SyncPlay-groep aan te sluit, kan dalk jou huidige terugspeelwaglys vervang. Gaan voort?';

  @override
  String get syncPlayJoin => 'Sluit aan';

  @override
  String get syncPlayStateIdle => 'Ledig';

  @override
  String get syncPlayStateWaiting => 'Wag';

  @override
  String get syncPlayStatePaused => 'Onderbreek';

  @override
  String get syncPlayStatePlaying => 'Speel';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-toegang geweier';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Jy het nie toegang tot een of meer items in hierdie SyncPlay-groep nie. Vra die groepeienaar om biblioteektoestemmings te verifieer of om \'n ander tou te kies.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Stemsoektog is nie beskikbaar nie.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play het misluk';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direkte speel kon nie vir hierdie Dolby Vision-stroom begin nie. Probeer weer om bedienertranskodeer te gebruik?';

  @override
  String get retryWithTranscode => 'Probeer weer met transkodeer';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision word nie ondersteun nie';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Hierdie toestel kan nie Dolby Vision-inhoud direk dekodeer nie. Gebruik HDR10-terugval of versoek bedienertranskodering.';

  @override
  String get rememberMyChoice => 'Onthou my keuse';

  @override
  String get playHdr10Fallback => 'Speel HDR10 terugval';

  @override
  String get requestTranscode => 'Versoek transkodeer';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Bespeur rye wat blootgestel is deur IAmParadox27 se \"Tuisskermafdelings\"-inprop. Rye kan hieronder geaktiveer en herrangskik word.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Geen Jellyfin-bedieners wat die inprop nog rapporteer nie.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Bespeur rye wat gekonfigureer is via ranaldsgift se \"KefinTweaks\"-inprop. Gepasmaakte afdelings, wat onlangs vrygestel is, weer kyk, seisoenaal en onlangs in die biblioteek bygevoeg is, word weerspieël vanaf die KefinTweaks-konfigurasie op elke Jellyfin-bediener.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Geen Jellyfin-bedieners wat KefinTweaks rapporteer nie.';

  @override
  String get integrationOpenHomeSections => 'Maak Tuisafdelings oop';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Aktiveer, deaktiveer en herrangskik rye';

  @override
  String get integrationInstalledButDisabled =>
      'Geïnstalleer maar gedeaktiveer';

  @override
  String get integrationNotInstalled => 'Nie geïnstalleer nie';

  @override
  String integrationSectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sections',
      one: '# section',
    );
    return '$_temp0';
  }

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
  String get jellyseerr => 'Jellyseerr';

  @override
  String get seeAll => 'Sien Alles';

  @override
  String get noItems => 'Geen items nie';

  @override
  String get switchUser => 'Verander gebruiker';

  @override
  String get remoteControl => 'Afstandbeheer';

  @override
  String get mediaBarLoading => 'Laai tans mediabalk …';

  @override
  String get mediaBarError => 'Mediabalk kon nie laai nie';

  @override
  String get offlineServerUnavailable =>
      'Gekoppel aan die internet, maar die huidige bediener is nie beskikbaar nie.';

  @override
  String get offlineNoInternet =>
      'Jy is vanlyn. Slegs afgelaaide inhoud is beskikbaar.';

  @override
  String get offlineFileNotAvailable => 'Lêer nie beskikbaar nie';

  @override
  String get offlineSwitchServer => 'Skakel bediener';

  @override
  String get offlineSavedMedia => 'Gestoorde media';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Afstandweergawe';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Toestelvolume';

  @override
  String get castVolumeUnavailable => 'Onbeskikbaar';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Oudio';

  @override
  String get subtitlesLabel => 'Onderskrifte';

  @override
  String get pinConfirmTitle => 'Bevestig PIN';

  @override
  String get pinSetTitle => 'Stel PIN';

  @override
  String get pinEnterTitle => 'Voer PIN in';

  @override
  String get pinReenterToConfirm => 'Voer jou PIN weer in om te bevestig';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Verkeerde PIN';

  @override
  String get pinMismatch => 'PIN\'s stem nie ooreen nie';

  @override
  String get pinForgot => 'PIN vergeet?';

  @override
  String get pinClear => 'Duidelik';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Quick Connect-versoek gemagtig.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-kode is ongeldig of het verval.';

  @override
  String get quickConnectNotSupported =>
      'Vinnige verbinding word nie op hierdie bediener ondersteun nie.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kon nie Quick Connect-kode magtig nie.';

  @override
  String get quickConnectDisabled =>
      'Vinnige verbinding is op hierdie bediener gedeaktiveer.';

  @override
  String get quickConnectForbidden =>
      'Jou rekening kan nie hierdie Quick Connect-versoek magtig nie.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-kode is nie gevind nie. Probeer \'n nuwe kode.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Voer kode in';

  @override
  String get quickConnectAuthorize => 'Magtig';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Afstandbeheer';

  @override
  String get remoteFailedToLoadSessions => 'Kon nie sessies laai nie';

  @override
  String get remoteNoSessions => 'Geen beheerbare sessies nie';

  @override
  String get remoteStartPlayback => 'Begin afspeel op \'n ander toestel';

  @override
  String get unknownUser => 'Onbekend';

  @override
  String get unknownItem => 'Onbekend';

  @override
  String get remoteNothingPlaying => 'Niks speel op hierdie sessie nie';

  @override
  String get castingStarted => 'Uitsaai het op geselekteerde toestel begin';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Geen afgeleë afspeeltoestelle beskikbaar nie.';

  @override
  String get noRemoteDevicesIos =>
      'Geen afgeleë afspeeltoestelle beskikbaar nie.\n\nOp iOS kan AirPlay-teikens dalk nie in die simulator beskikbaar wees nie.';

  @override
  String get trackActionPlayNext => 'Speel Volgende';

  @override
  String get trackActionAddToQueue => 'Voeg by waglys';

  @override
  String get trackActionAddToPlaylist => 'Voeg by snitlys';

  @override
  String get trackActionCancelDownload => 'Kanselleer aflaai';

  @override
  String get trackActionDeleteFromPlaylist => 'Vee uit snitlys';

  @override
  String get trackActionMoveUp => 'Beweeg op';

  @override
  String get trackActionMoveDown => 'Beweeg af';

  @override
  String get trackActionRemoveFromFavorites => 'Verwyder uit gunstelinge';

  @override
  String get trackActionAddToFavorites => 'Voeg by gunstelinge';

  @override
  String get trackActionGoToAlbum => 'Gaan na Album';

  @override
  String get trackActionGoToArtist => 'Gaan na Kunstenaar';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Het afgelaaide lêer uitgevee';

  @override
  String get trackActionDeleteFileFailed =>
      'Kon nie afgelaaide lêer uitvee nie';

  @override
  String get shuffleBy => 'Skommel deur';

  @override
  String get shuffleSelectLibrary => 'Kies Biblioteek';

  @override
  String get shuffleSelectGenre => 'Kies Genre';

  @override
  String get shuffleLibrary => 'Biblioteek';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries =>
      'Geen versoenbare biblioteke beskikbaar nie.';

  @override
  String get shuffleNoGenres =>
      'Geen genres gevind vir hierdie skuifmodus nie.';

  @override
  String get posterDisplayTitle => 'Vertoon';

  @override
  String get posterImageType => 'Tipe beeld';

  @override
  String get imageTypePoster => 'Plakkaat';

  @override
  String get imageTypeThumbnail => 'Kleinkiekie';

  @override
  String get imageTypeBanner => 'Banier';

  @override
  String get playlistAddFailed => 'Kon nie by snitlys voeg nie';

  @override
  String get playlistCreateFailed => 'Kon nie snitlys skep nie';

  @override
  String get playlistNew => 'Nuwe snitlys';

  @override
  String get playlistCreate => 'Skep';

  @override
  String get playlistCreateNew => 'Skep nuwe snitlys';

  @override
  String get playlistNoneFound => 'Geen snitlyste gevind nie';

  @override
  String get addToPlaylist => 'Voeg by snitlys';

  @override
  String get lyricsNotAvailable => 'Geen lirieke beskikbaar nie';

  @override
  String get upNext => 'Volgende';

  @override
  String get playNext => 'Speel Volgende';

  @override
  String get stillWatchingContent => 'Afspeel is onderbreek. Kyk jy nog?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Gaan voort';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Regstreekse TV';

  @override
  String get continueWatchingAndNextUp => 'Hou aan kyk en volgende';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Volgende episode';

  @override
  String get moreFromThisSeason => 'Meer van hierdie seisoen';

  @override
  String get playerTooltipPlaybackSpeed => 'Speelspoed';

  @override
  String get playerTooltipCastControls => 'Cast kontroles';

  @override
  String get playerTooltipPlaybackQuality => 'Bitsnelheid';

  @override
  String get playerTooltipEnterFullscreen => 'Voer volskerm in';

  @override
  String get playerTooltipExitFullscreen => 'Verlaat volskerm';

  @override
  String get playerTooltipFloatOnTop => 'Vryf bo-op';

  @override
  String get playerTooltipExitFloatOnTop => 'Deaktiveer vlotter bo-op';

  @override
  String get playerTooltipLockLandscape => 'Sluit landskap';

  @override
  String get playerTooltipUnlockOrientation => 'Laat rotasie toe';

  @override
  String get playerTooltipPrevious => 'Vorige';

  @override
  String get playerTooltipSeekBack => 'Soek terug';

  @override
  String get playerTooltipSeekForward => 'Soek vorentoe';

  @override
  String get contextMenuMarkWatched => 'Merk as gekyk';

  @override
  String get contextMenuMarkUnwatched => 'Merk as ongekyk';

  @override
  String get contextMenuAddToFavorites => 'Voeg by gunstelinge';

  @override
  String get contextMenuRemoveFromFavorites => 'Verwyder uit gunstelinge';

  @override
  String get contextMenuGoToSeries => 'Gaan na Reeks';

  @override
  String get settingsAdministrationSubtitle =>
      'Toegang tot die bedieneradministrasiepaneel';

  @override
  String get settingsAccountSecurity => 'Rekening en sekuriteit';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Stawing, PIN-kode en ouerkontroles';

  @override
  String get settingsPersonalization => 'Verpersoonliking';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigasie, tuisrye en biblioteeksigbaarheid';

  @override
  String get settingsDynamicContent => 'Dinamiese inhoud';

  @override
  String get settingsDynamicContentSubtitle =>
      'Mediabalk en visuele oorlegsels';

  @override
  String get settingsPlaybackSyncplay => 'Speel en SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Oudio/video-instellings, onderskrifte, aflaaie en SyncPlay-kontroles';

  @override
  String get settingsIntegrationsSubtitle =>
      'Inpropsinkronisering, Seerr, graderings en meer';

  @override
  String get settingsAboutSubtitle =>
      'Programweergawe, regsinligting en krediete';

  @override
  String get settingsAuthenticationSection => 'STASIFIKASIE';

  @override
  String get settingsSortServersBy => 'Sorteer bedieners volgens';

  @override
  String get settingsLastUsed => 'Laas gebruik';

  @override
  String get settingsAlphabetical => 'Alfabeties';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVAATHEID EN VEILIGHEID';

  @override
  String get settingsBlockedRatings => 'Geblokkeerde graderings';

  @override
  String get settingsGeneralStyle => 'Algemene styl';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Tema-aksente, agtergronde, gekykte aanwysers en temamusiek';

  @override
  String get settingsHomePage => 'Tuisblad';

  @override
  String get settingsHomePageSubtitle =>
      'Afdelings, beeldtipes, oorlegsels en mediavoorskoue';

  @override
  String get settingsLibrariesSubtitle =>
      'Biblioteeksigbaarheid, voueraansig en multibedienergedrag';

  @override
  String get settingsTwentyFourHourClock => '24-uur klok';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Gebruik 24-uur tydformatering waar ook al die horlosie gewys word';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Wys die skuifknoppie in die navigasiebalk';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Wys die genres-knoppie in die navigasiebalk';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Wys die gunstelinge-knoppie in die navigasiebalk';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Wys die biblioteke-knoppie in die navigasiebalk';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Wissel tuisbladsigbaarheid per biblioteek. Herbegin Moonfin vir veranderinge om in werking te tree.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Mediabalk en plaaslike voorskoue';

  @override
  String get settingsVisualOverlays => 'Visuele oorlegsels';

  @override
  String get settingsSeasonalSurprise => 'Seisoenale verrassing';

  @override
  String get settingsMetadataAndRatings => 'Metadata en graderings';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase dryf bedienerkant-integrasies aan, insluitend bykomende graderingsbronne, Seerr-versoeke en gesinkroniseerde voorkeure.';

  @override
  String get settingsOfflineDownloads => 'Vanlyn aflaaie';

  @override
  String get settingsHigh => 'Hoog';

  @override
  String get settingsLow => 'Laag';

  @override
  String get settingsCustomPath => 'Pasgemaakte pad';

  @override
  String get settingsEnterDownloadFolderPath => 'Voer aflaai-vouerpad in';

  @override
  String get settingsConcurrentDownloads => 'Gelyktydige aflaaie';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimum aantal items om gelyktydig af te laai.';

  @override
  String get settingsAppInfo => 'APP INLIGTING';

  @override
  String get settingsReportAnIssue => 'Rapporteer \'n probleem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Maak die probleemspoorder op GitHub oop';

  @override
  String get settingsJoinDiscord => 'Sluit aan by Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Gesels met die gemeenskap';

  @override
  String get settingsJoinTheDiscord => 'Sluit aan by die Discord';

  @override
  String get settingsSupportMoonfin => 'Ondersteun Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Ster die projek op GitHub of dra by';

  @override
  String get settingsLegal => 'WETLIK';

  @override
  String get settingsLicenses => 'Lisensies';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Oopbron lisensie kennisgewings';

  @override
  String get settingsPrivacyPolicy => 'Privaatheidsbeleid';

  @override
  String get settingsPrivacyPolicySubtitle => 'Hoe Moonfin jou data hanteer';

  @override
  String get settingsCheckForUpdates => 'Kyk vir opdaterings';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kyk vir die nuutste Moonfin-vrystelling';

  @override
  String get settingsPoweredByFlutter => 'Aangedryf deur Flutter';

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
  String get settingsBoth => 'Albei';

  @override
  String get settingsShuffleContentTypeFilter => 'Skommel inhoudtipe filter';

  @override
  String get settingsVideoPlaybackPreferences => 'Videospeelvoorkeure';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Kern video-enjin en streaming kwaliteit instellings';

  @override
  String get settingsAudioPreferences => 'Oudiovoorkeure';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Oudiosnitte, verwerking en deurlaatopsies';

  @override
  String get settingsAutomationAndQueue => 'Outomatisering en tou';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Outomatiese afspeel en volgordebepaling';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Aflaaikwaliteit, bergingslimiete en tougrootte';

  @override
  String get settingsSyncplaySubtitle =>
      'Sinchronisasie logika vir groepsessies';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Gespesialiseerde speler kenmerke. Gebruik met omsigtigheid, aangesien sommige opsies terugspeelprobleme kan veroorsaak';

  @override
  String get settingsSkipIntrosAndOutros => 'Slaan Intro\'s en Outros oor?';

  @override
  String get settingsPromptUser => 'Vinnige gebruiker';

  @override
  String get settingsSkip => 'Slaan oor';

  @override
  String get settingsDoNothing => 'Doen niks';

  @override
  String get settingsMaxBitrateDescription =>
      'Beperk die stroom-bitsnelheid. Inhoud bo hierdie drempel sal getranskodeer word om te pas.';

  @override
  String get settingsMaxResolutionDescription =>
      'Beperk die maksimum resolusie wat die speler sal versoek. Hoër resolusie inhoud sal af getranskodeer word.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hoe video geskaal moet word om by die skerm te pas.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Afspeel-enjin (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Kies die verstekterugspeelenjin op Android TV-toestelle. Veranderinge geld vir die volgende terugspeelsessie.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (aanbeveel)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (nalatenskap)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Terugval';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Gedrag vir Dolby Vision-titels op toestelle sonder Dolby Vision-dekodering.';

  @override
  String get settingsAskEachTime => 'Vra elke keer';

  @override
  String get settingsPreferHdr10Fallback => 'Verkies HDR10-terugval';

  @override
  String get settingsPreferServerTranscode => 'Verkies bediener transkodeer';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profiel 7 Direkte speel';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Beheer of Dolby Vision-profiel 7-verbeteringslaagstrome speel moet rig.';

  @override
  String get settingsAutoAftkrtEnabled => 'Outo (AFTKRT geaktiveer)';

  @override
  String get settingsEnabledOnThisDevice => 'Geaktiveer op hierdie toestel';

  @override
  String get settingsDisabledPreferTranscode =>
      'Gedeaktiveer (verkies transkodeer)';

  @override
  String get settingsResumeRewindDescription =>
      'Hoeveel sekondes moet teruggedraai word wanneer terugspeel (vanaf Hou aan kyk of \'n media-itembladsy af) hervat word?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Hoeveel sekondes moet teruggedraai word wanneer die afspeel hervat word nadat die pouse-knoppie gedruk is?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hoeveel sekondes om terug te spring nadat jy die terugspoelknoppie gedruk het.';

  @override
  String get settingsOneSecond => '1 sekonde';

  @override
  String get settingsThreeSeconds => '3 sekondes';

  @override
  String get settingsFortyFiveSeconds => '45 sekondes';

  @override
  String get settingsSixtySeconds => '60 sekondes';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hoeveel sekondes om vorentoe te spring nadat jy die vinnig vorentoe-knoppie gedruk het.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstroom AC3 na eksterne dekodeerder';

  @override
  String get settingsCinemaMode => 'Bioskoopmodus';

  @override
  String get settingsCinemaModeSubtitle =>
      'Speel lokprente/prerolls voor \'n hoofkenmerk';

  @override
  String get settingsNextUpDisplayDescription =>
      'Uitgebreid wys \'n volledige kaart met episodekunswerk en beskrywing. Minimaal toon \'n kompakte aftelling-oorleg. Gedeaktiveer versteek die boodskap heeltemal.';

  @override
  String get settingsShort => 'Kort';

  @override
  String get settingsLong => 'Lank';

  @override
  String get settingsVeryLong => 'Baie lank';

  @override
  String get settingsVideoStartDelay => 'Video begin vertraging';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Regstreekse TV';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktiveer direkte speel vir regstreekse TV';

  @override
  String get settingsOpenGroups => 'Maak Groepe oop';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Skep, sluit aan of bestuur SyncPlay-groepe';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay geaktiveer';

  @override
  String get settingsSyncplayEnabledSubtitle => 'Aktiveer groepkykkenmerke';

  @override
  String get settingsSyncplayButton => 'SyncPlay-knoppie';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Wys die SyncPlay-knoppie op die navigasiebalk';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Gevorderde regstelling';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktiveer fynkorrelige sinkroniseringslogika';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinkronisering regstelling';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Pas afspeel outomaties aan om gesinchroniseer te bly';

  @override
  String get settingsSyncplaySpeedToSync => 'Spoed om te sinkroniseer';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Gebruik terugspeelspoedaanpassing om te sinkroniseer';

  @override
  String get settingsSyncplaySkipToSync => 'Slaan oor na sinkronisering';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Gebruik soek om te sinkroniseer';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimum spoed vertraging';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimum spoed vertraging';

  @override
  String get settingsSyncplaySpeedDuration => 'Spoed Duur';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimum oorslaan vertraging';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ekstra offset';

  @override
  String get onNow => 'Aan Nou';

  @override
  String get collections => 'Versamelings';

  @override
  String get lastPlayed => 'Laas gespeel';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Latest $libraryName';
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
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Home Screen Sections';

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
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

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
  String get trailers => 'Trailers';

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
  String get transcodingLimits => 'Transcoding Limits';
}
