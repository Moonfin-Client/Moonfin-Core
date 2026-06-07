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
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Meld aan';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Koppel tans aan $serverName';
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
    return 'QuickConnect nie beskikbaar nie: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nie beskikbaar nie ($status): $detail';
  }

  @override
  String get whosWatching => 'Wie kyk?';

  @override
  String get addUser => 'Voeg gebruiker by';

  @override
  String get selectServer => 'Kies Bediener';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin weergawe $version';
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
    return 'Verwyder \"$serverName\" van jou bedieners?';
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
  String get keyboardPreferSystemIme => 'Verkies stelselsleutelbord';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Gebruik jou toestelinvoermetode by verstek vir teksinvoer';

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
    return 'Kan nie aan $target koppel nie';
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
    return 'Kon nie vouer laai nie: $error';
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
    return '${count}m gelede';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h gelede';
  }

  @override
  String daysAgo(int count) {
    return '${count}d gelede';
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
    return '$count titels';
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
    return '$count skrywers';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% voltooi';
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
    return '$count titels gereël vir lees-eerste blaai.';
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
    return 'Geen $label gevind nie';
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
    return '$count afdelings';
  }

  @override
  String firstPublished(int year) {
    return 'Eerste gepubliseer $year';
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
    return '$count boeke';
  }

  @override
  String get couldNotLoadSubject =>
      'Kon nie hierdie onderwerp op die oomblik laai nie.';

  @override
  String get audiobookDetails => 'Oudioboekbesonderhede';

  @override
  String authorsCountTitle(int count) {
    return '$count Skrywers';
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
  String get musicVideos => 'Musiekvideo\'s';

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
    return 'Skyf $number';
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
    return 'Gepubliseer $year';
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
    return 'Eindig by $time';
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'Uitsig';

  @override
  String get resumeReading => 'Hervat lees';

  @override
  String get read => 'Lees';

  @override
  String resumeFrom(String position) {
    return 'Hervat vanaf $position';
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
    return 'Vee afgelaaide snitte vir \"$title\" uit?';
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
    return 'Geen $itemLabel gelaai nie';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Laai tans $title ($count items af) af...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Is jy seker jy wil \"$name\" van die bediener verwyder? Hierdie handeling kan nie ontdoen word nie.';
  }

  @override
  String get itemDeleted => 'Item is uitgevee';

  @override
  String get noPlayableTrailerFound => 'Geen speelbare lokprent gevind nie.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Ongesteunde boekformaat: .$extension';
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
    return 'Ondertitel afgelaai en gekies: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Onderskrif afgelaai. Dit kan \'n oomblik neem om te verskyn terwyl Jellyfin die item verfris.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Geen afgeleë onderskrifte gevind vir $language nie.';
  }

  @override
  String get selectVersion => 'Kies Weergawe';

  @override
  String versionNumber(int number) {
    return 'Weergawe $number';
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
    return 'Laai tans $name af ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Vee afgelaaide lêers uit';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Vee plaaslike lêers vir $typeLabel uit?\n\nDit sal stoorplek vrystel. Jy kan later weer aflaai.';
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
    return '+$count meer';
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
    return 'Hoofstuk $number';
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
    return 'Gebore $date';
  }

  @override
  String died(String date) {
    return 'Oorlede $date';
  }

  @override
  String age(int age) {
    return 'Ouderdom $age';
  }

  @override
  String get showLess => 'Wys minder';

  @override
  String get readMore => 'Lees meer';

  @override
  String get shuffle => 'Skommel';

  @override
  String downloadsCount(int count) {
    return '$count aflaaie';
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
    return 'Afgeleë onderskrif $action vereis die Jellyfin onderskrifbestuurtoestemming vir hierdie gebruiker.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Hierdie item kon nie op die bediener vir afgeleë onderskrif $action gevind word nie.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Afgeleë onderskrif $action het misluk: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Afgeleë onderskrif $action het misluk (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Kon nie $action afgeleë onderskrifte gebruik nie.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alle afgelaaide episodes vir \"$name\"';
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
    return '$label aksie het misluk: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Kon nie rolverdelingsvolume stel nie: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Kontroles';
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
    return 'Volg $number';
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
    return '$seconds sekondes';
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
    return '$protocol sessiefout';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kon nie boekbesonderhede laai nie: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-weergawe inprogram is nog nie op hierdie platform beskikbaar nie.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Hierdie formaat (.$extension) kan nog nie in die toepassing gelewer word nie.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ingeboude dokumentweergawe is nie op hierdie platform beskikbaar nie.';

  @override
  String get couldNotOpenExternalViewer =>
      'Kon nie eksterne kyker oopmaak nie.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Kon nie inprogram-leser oopmaak nie: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Boekmerk is reeds gestoor by $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Boekmerk bygevoeg: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nog geen boekmerke nie.\nTik die boekmerkikoon terwyl jy lees om jou posisie te stoor.';

  @override
  String get noTableOfContentsAvailable => 'Geen inhoudsopgawe beskikbaar nie';

  @override
  String pageLabel(int number) {
    return 'Bladsy $number';
  }

  @override
  String get position => 'Posisie';

  @override
  String get bookReader => 'Boekleser';

  @override
  String formatExtension(String extension) {
    return 'Formaat: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% gelees';
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
    return 'Stel zoom terug (${zoom}x)';
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
    return 'Kon nie leesstatus opdateer nie: $error';
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
    return 'Hierdie platform kan nie die ingebedde dokumentenjin vir $extension-lêers huisves nie.';
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
    return 'Kon nie gids laai nie: $error';
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
  String get record => 'Rekord';

  @override
  String get cancelRecordingAction => 'Kanselleer opname';

  @override
  String get programSetToRecord => 'Program gestel om op te neem';

  @override
  String get recordingCancelled => 'Opname gekanselleer';

  @override
  String get unableToCreateRecording => 'Kan nie opname skep nie';

  @override
  String get watch => 'Kyk';

  @override
  String get close => 'Maak toe';

  @override
  String failedToPlayChannel(String name) {
    return 'Kon nie $name speel nie';
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
    return 'Kanselleer geskeduleerde opname van \"$name\"?';
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
    return 'Hou op om \"$name\" op te neem?';
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
    return 'Geen resultate vir \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Soek het misluk: $error';
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
    return 'Verwyder \"$name\" en sy lêers?';
  }

  @override
  String tracksCount(int count) {
    return '$count snitte';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Speel Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Kon nie album laai nie: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Geen afgelaaide snitte gevind vir $name nie.';
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
    return 'Verwyder \"$name\"?';
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
    return 'Seisoen $number';
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
    return 'Vee alle afgelaaide episodes in $season uit?';
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
    return 'Vee $count afgelaaide items uit?';
  }

  @override
  String get musicAndAudiobooks => 'Musiek en oudioboeke';

  @override
  String get images => 'Beelde';

  @override
  String get database => 'Databasis';

  @override
  String ofStorageLimit(String limit) {
    return 'van $limit limiet';
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
    return '$count opsies';
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
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choose what scrolling the mouse wheel over the video does during playback.';

  @override
  String get scrollWheelActionOff => 'Off';

  @override
  String get scrollWheelActionSeek => 'Seek (forward / back)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

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
  String get settingsAudioOutputMode => 'Oudio-uitvoermodus';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR deurlaat';

  @override
  String get settingsAudioFallbackCodec => 'Oudio-terugvalkodek';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Deurloop (Gevorderd)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodek deurlaat';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktiveer slegs formate wat jou AVR of HDMI-wasbak ondersteun.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 deurlaat';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) deurlaat';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Deurvoer';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA deurlaat';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD deurlaat';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Deurgang';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) na eksterne dekodeerder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos oor EAC3 (JOC) na eksterne dekodeerder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (sluit DTS-kern in) na eksterne dekodeerder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD met Atmos-metadata na eksterne dekodeerder.';

  @override
  String get settingsDetectedAudioCapabilities => 'Bespeur oudio-vermoëns';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nog geen momentopname van looptydvermoë beskikbaar nie.';

  @override
  String get settingsAudioRouteLabel => 'Roete';

  @override
  String get settingsAudioDecodeLabel => 'Dekodeer';

  @override
  String get settingsAudioPassthroughLabel => 'Deurloop';

  @override
  String get settingsAudioHdRoute => 'HD klank roete';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Spreker';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostiek';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video vlak';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videoreeks';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Ondertitelkodek';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Toegelate oudio-kodeks';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS oudio-kodeks';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 oudio-kodeks';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'oudio-spdif deurlaat';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktiewe oudioroete';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Roete HD-klankondersteuning';

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
    return 'Na $episodes episodes / ${hours}h';
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
    return '$profile profielinstellings gelaai.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Kon nie $profile profielinstellings laai nie.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Gesinkroniseer plaaslike instellings met $profile profiel.';
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
  String get showSeerrButton => 'Show Seerr Button';

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
    return '$count gekies';
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
      'Kies tussen verskeie mediabalkstyle, of skakel die mediabalk af';

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
  String get currentUser => 'Current User';

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
    return '$status\nWeergawe: $version';
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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

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
    return 'Aangeteken as: $username';
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
    return 'Weergawe $version';
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
    return 'Opdatering beskikbaar: v$version';
  }

  @override
  String get updateNotifications => 'Dateer kennisgewings op';

  @override
  String get showWhenUpdatesAvailable =>
      'Wys wanneer opdaterings beskikbaar is';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Beskikbaar';
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
    return 'Versoek deur $name';
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
    return 'Kanselleer versoek vir \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Kanselleer $count versoeke vir \"$title\"?';
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
    return 'Begroting: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Inkomste: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Versoek $type';
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
    return 'ouderdom $age';
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
    return 'Inpropopdaterings beskikbaar: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Inproppe wat herbegin vereis: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Mislukte geskeduleerde take: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Onlangse waarskuwing/foutinskrywings: $count';
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
    return 'Fout: $error';
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
    return 'Opdrag misluk: $error';
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
    return 'Kon nie aktiwiteitlogboek laai nie: $error';
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
    return 'Kon nie toestel opdateer nie: $error';
  }

  @override
  String get adminDeleteDevice => 'Vee Toestel uit';

  @override
  String get adminDeviceDeleted => 'Toestel is uitgevee';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Kon nie toestel uitvee nie: $error';
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
    return 'Kon nie skandering begin nie: $error';
  }

  @override
  String get adminRenameLibrary => 'Hernoem biblioteek';

  @override
  String get adminNewName => 'Nuwe naam';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteek hernoem na \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Kon nie hernoem nie: $error';
  }

  @override
  String get adminDeleteLibrary => 'Vee biblioteek uit';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteek \"$name\" is uitgevee';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kon nie biblioteek uitvee nie: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Kon nie pad byvoeg nie: $error';
  }

  @override
  String get adminRemovePath => 'Verwyder Pad';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Verwyder \"$path\" uit hierdie biblioteek?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Kon nie pad verwyder nie: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Biblioteekopsies gestoor';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Kon nie opsies stoor nie: $error';
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
    return 'Kon nie biblioteek skep nie: $error';
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
    return 'Deaktiveer $name? Hulle sal nie kan aanmeld nie.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Aktiveer $name? Hulle sal weer kan aanmeld.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Gebruiker \"$name\" gedeaktiveer';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Gebruiker \"$name\" geaktiveer';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kon nie gebruikersbeleid opdateer nie: $error';
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
    return 'Kon nie gebruiker skep nie: $error';
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
    return 'Kon nie stoor nie: $error';
  }

  @override
  String get adminPermissionsSaved => 'Toestemmings gestoor';

  @override
  String get adminPasswordsMismatch => 'Wagwoorde stem nie ooreen nie';

  @override
  String adminFailed(String error) {
    return 'Misluk: $error';
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
    return 'Bediener het HTTP $status teruggestuur';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Is jy seker jy wil $name uitvee?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Gebruiker \"$name\" is uitgevee';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kon nie gebruiker uitvee nie: $error';
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
    return 'Kon nie sleutel skep nie: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Sleuteltoken ontbreek in bedienerantwoord';

  @override
  String get adminRevokeApiKey => 'Herroep API-sleutel';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Herroep sleutel vir $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-sleutel herroep';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Kon nie sleutel herroep nie: $error';
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
    return 'Teken: $token\\nGeskep: $created';
  }

  @override
  String get adminCreatingBackup => 'Skep tans rugsteun …';

  @override
  String get adminBackupCreated => 'Rugsteun suksesvol geskep';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Kon nie rugsteun skep nie: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Rugsteunpad ontbreek in bedienerantwoord';

  @override
  String adminBackupManifest(String name) {
    return 'Manifes: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Kon nie manifes laai nie: $error';
  }

  @override
  String get adminConfirmRestore => 'Bevestig herstel';

  @override
  String get adminRestoringBackup => 'Laai tans rugsteun terug …';

  @override
  String adminRestoreFailed(String error) {
    return 'Kon nie rugsteun herstel nie: $error';
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
    return 'Gestoor na $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Kon nie lêer stoor nie: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Kon nie $fileName laai nie';
  }

  @override
  String get adminSearchInLog => 'Soek in log';

  @override
  String get adminNoMatchingLines => 'Geen ooreenstemmende lyne nie';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Kon nie take laai nie: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Geen geskeduleerde take gevind nie';

  @override
  String get adminNoTasksMatchFilter =>
      'Geen take pas by die huidige filter nie';

  @override
  String adminTaskStartFailed(String error) {
    return 'Kon nie taak begin nie: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Kon nie taak stop nie: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Kon nie taak laai nie: $error';
  }

  @override
  String get adminRunNow => 'Hardloop nou';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Kon nie sneller verwyder nie: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Kon nie sneller byvoeg nie: $error';
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
    return '$hours uur(te)';
  }

  @override
  String get adminDayOfWeek => 'Dag van die week';

  @override
  String get adminSearchPlugins => 'Soek inproppe...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Kon nie inprop verander nie: $error';
  }

  @override
  String get adminUninstallPlugin => 'Verwyder inprop';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Is jy seker jy wil \"$name\" deïnstalleer?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Kon nie inprop deïnstalleer nie: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Kon nie pakket installeer: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Kon nie opdatering installeer nie: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Kon nie inproppe laai nie: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'Geen plugins pas by jou soektog nie';

  @override
  String get adminNoPluginsInstalled => 'Geen plugins geïnstalleer nie';

  @override
  String adminInstallUpdate(String version) {
    return 'Installeer opdatering (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kon nie katalogus laai nie: $error';
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
    return '\"$name\" sal verwyder word nadat bediener herbegin het';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Kon nie deïnstalleer nie: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Dateer tans \"$name\" op na v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Kan nie instellings oopmaak nie: outoriteittoken ontbreek.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Kon nie inprop laai nie: $error';
  }

  @override
  String get adminPluginNotFound => 'Inprop nie gevind nie';

  @override
  String adminPluginVersion(String version) {
    return 'Weergawe $version';
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
    return 'Is jy seker jy wil \"$name\" verwyder?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Kon nie bewaarplekke stoor nie: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Kon nie bewaarplekke laai nie: $error';
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
    return 'Kan nie inpropinstellings laai nie: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Kon nie $uri oopmaak nie';
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
    return 'Kon nie metadata laai nie: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Kon nie metadata stoor nie: $error';
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
    return 'Kon nie metadata herlaai nie: $error';
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
    return 'Afstandsoektog het misluk: $error';
  }

  @override
  String get adminUpdateContentType => 'Dateer inhoudtipe op';

  @override
  String get adminContentType => 'Inhoud tipe';

  @override
  String get adminContentTypeUpdated => 'Inhoudtipe opgedateer';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Kon nie inhoudtipe opdateer nie: $error';
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
    return '$imageType beeld opgedateer';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kon nie prent aflaai nie: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Onondersteunde prentformaat';

  @override
  String get adminImageReadFailed => 'Kon nie geselekteerde prent lees nie';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType prent opgelaai';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kon nie prent oplaai nie: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Vee $imageType prent uit';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType prent uitgevee';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kon nie prent uitvee nie: $error';
  }

  @override
  String get adminAllProviders => 'Alle verskaffers';

  @override
  String get adminNoRemoteImages => 'Geen afgeleë prente gevind nie';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Ontdekking van ontvanger het misluk: $error';
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
    return 'Kon nie ontvanger byvoeg nie: $error';
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
    return 'Kon nie verskaffer byvoeg nie: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kon nie ontvanger verwyder nie: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tunerterugstelling versoek';

  @override
  String adminTunerResetFailed(String error) {
    return 'Kon nie ontvanger terugstel nie: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kon nie verskaffer verwyder nie: $error';
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
    return 'Kon nie instellings stoor nie: $error';
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
    return 'Kon nie kartering opdateer nie: $error';
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
    return 'Opnamepad: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Reekspad: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Voorafvulling: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Navulling: $minutes min';
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
    return 'Herstel rugsteun $name nou?';
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
    return '${minutes}m gelede';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h gelede';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d gelede';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Kon nie $fileName laai nie';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count pas by';
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
    return '$imageType beeld opgedateer';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType prent opgelaai';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType prent uitgevee';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kon nie prent aflaai nie: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Kon nie geselekteerde prent lees nie';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kon nie prent oplaai nie: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Vee $imageType prent uit';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Dit verwyder die huidige prent van die item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kon nie prent uitvee nie: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Kies $imageType prent';
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
    return 'Opdatering beskikbaar: v$version';
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
    return 'Installeer opdatering (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Geen pakkette pas by jou soektog nie';

  @override
  String get adminPluginsCatalogEmpty => 'Geen pakkette beskikbaar nie';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" word geïnstalleer...';
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
    return '$name Instellings';
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
    return 'Kon nie bewaarplekke laai nie: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Verwyder bewaarplek';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Is jy seker jy wil \"$name\" verwyder?';
  }

  @override
  String get adminReposRemove => 'Verwyder';

  @override
  String adminReposSaveFailed(String error) {
    return 'Kon nie bewaarplekke stoor nie: $error';
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
    return 'Daagliks by $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Elke $day by $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Elke $duration';
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
    return '${days}d gelede';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h gelede';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m gelede';
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
    return 'Kon nie inhoudtipe opdateer nie: $error';
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
    return 'Kon nie kartering opdateer nie: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tydsbeperking: $duration';
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
    return '$userName het by SyncPlay-groep aangesluit';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName links SyncPlay groep';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-toegang geweier';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Jy het nie toegang tot een of meer items in hierdie SyncPlay-groep nie. Vra die groepeienaar om biblioteektoestemmings te verifieer of om \'n ander tou te kies.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinkroniseer tans terugspeel na $groupName';
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
    return 'Uitsaaibeheer het misluk: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Kontroles';
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
    return 'Voer \'n $length-syfer-PIN in';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Voer jou $length-syfer-PIN in';
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
    return 'Vinnige verbinding het misluk: $message';
  }

  @override
  String get quickConnectEnterCode => 'Voer kode in';

  @override
  String get quickConnectAuthorize => 'Magtig';

  @override
  String remoteCommandFailed(String error) {
    return 'Opdrag misluk: $error';
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
    return 'Kon nie begin uitsaai nie: $error';
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
    return 'Laai tans $name af...';
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
    return 'Slaan $segment oor';
  }

  @override
  String get liveTv => 'Regstreekse TV';

  @override
  String get continueWatchingAndNextUp => 'Hou aan kyk en volgende';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Laai tans af $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Laai tans af $fileName';
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
  String get settingsShowSeerrButtonInNavigation =>
      'Show the Seerr button in the navigation bar';

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
      'Skenk \'n koffie aan die ontwikkelaar';

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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (nalatenskap)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (nalatenskap)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (aanbeveel)';

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
    return 'Nuutste $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Outospeel volgende episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Speel die volgende episode outomaties wanneer beskikbaar.';

  @override
  String get skipSilenceTitle => 'Slaan stilte oor';

  @override
  String get skipSilenceSubtitle =>
      'Slaan stil oudio-segmente outomaties oor wanneer dit deur die stroom ondersteun word.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Laat eksterne oudio-effekte toe';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Laat gelykmaker- en effekteprogramme (bv. Wavelet) toe om aan Media3 terugspeelsessies te heg.';

  @override
  String get disableTunnelingTitle => 'Deaktiveer tonnel';

  @override
  String get disableTunnelingSubtitle =>
      'Forseer nie-getonnelde afspeel. Nuttig op toestelle met klank-/videodiskontinuïteite.';

  @override
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

  @override
  String get mapDolbyVisionP7Title => 'Kaart Dolby Vision profiel 7 aan HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Speel Dolby Vision profiel 7-strome as HDR10-versoenbare HEVC op nie-DV-toestelle.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Gebruik ingebedde onderskrifstyle';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Pas kleure, lettertipes en posisionering toe wat in die ondertitelsnit ingebed is. Deaktiveer om eerder jou onderskrifstylvoorkeure te gebruik.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Gebruik ingeboude onderskriflettertipes';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Pas lettergrootte-wenke toe wat in die onderskrifsnit ingebed is. Deaktiveer om die ondertitelgrootte van jou stylvoorkeure te gebruik.';

  @override
  String get useDetailedSubHeadings => 'Gebruik gedetailleerde subopskrifte';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Wys gedetailleerde of minimale subry op Biblioteekbladsye.';

  @override
  String get savedThemesDeleteDialogTitle => 'Vee gestoorde tema uit?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Verwyder \"$themeName\" uit hierdie toestelkas?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Het \"$themeName\" van hierdie toestel uitgevee.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Kon nie \"$themeName\" uitvee nie.';
  }

  @override
  String get savedThemesTitle => 'Gestoorde temas';

  @override
  String get savedThemesDescription =>
      'Dit is temas wat afgelaai is vanaf die Moonfin-inprop vir die huidige bediener. Deur uitvee word slegs hierdie plaaslike kopie verwyder.';

  @override
  String get savedThemesEmpty =>
      'Geen gestoorde temas is vir hierdie bediener gevind nie.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Tans aktief';
  }

  @override
  String get savedThemesDeleteTooltip => 'Vee gestoorde tema uit';

  @override
  String get savedThemesManageSubtitle =>
      'Bestuur afgelaaide inprop-temas op hierdie toestel';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Tuisskerm-afdelings';

  @override
  String get themeEditor => 'Tema Editor';

  @override
  String get themeEditorSubtitle =>
      'Maak die Moonfin Theme Editor in jou blaaier oop';

  @override
  String get homeScreen => 'Tuisskerm';

  @override
  String get bottomBar => 'Onderste balk';

  @override
  String get homeRowsStyleClassic => 'Klassiek';

  @override
  String get homeRowsStyleModern => 'Moderne';

  @override
  String get homeRowsSection => 'Tuis Rye';

  @override
  String get rowsType => 'Tipe rye';

  @override
  String get rowsTypeDescription =>
      'Klassiek hou per-ry beeldtipe en inligting-oorleg. Moderne gebruik portret-na-agtergrond-rye.';

  @override
  String get displayFavoritesRows => 'Wys gunstelinge-rye';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Wys gunstelingflieks, -reekse en ander gunstelingrye in Tuisafdelings.';

  @override
  String get favoritesRowSorting => 'Gunstelinge ry sortering';

  @override
  String get favoritesRowSortingDescription =>
      'Sorteer gunstelinge-rye volgens bygevoegde datum, vrystellingdatum, alfabeties, en meer.';

  @override
  String get displayCollectionsRows => 'Wys versamelingsrye';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Wys versamelingsrye in tuisafdelings.';

  @override
  String get collectionsRowSorting => 'Versamelings ry sortering';

  @override
  String get collectionsRowSortingDescription =>
      'Sorteer versamelingsrye volgens bygevoegde datum, vrystellingdatum, alfabeties, en meer.';

  @override
  String get displayGenresRows => 'Wys Genres Rye';

  @override
  String get displayGenresRowsSubtitle => 'Wys Genres-rye in Tuisafdelings.';

  @override
  String get genresRowSorting => 'Genres Ry Sorteer';

  @override
  String get genresRowSortingDescription =>
      'Sorteer Genres-rye volgens bygevoegde datum, vrystellingsdatum, alfabeties, en meer.';

  @override
  String get genresRowItems => 'Genres ry-items';

  @override
  String get genresRowItemsDescription =>
      'Wys flieks, reekse of albei in genres-rye.';

  @override
  String get displayPlaylistsRows => 'Display Playlist Rows';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Show Playlist rows in Home Sections.';

  @override
  String get playlistsRowSorting => 'Playlist Row Sorting';

  @override
  String get playlistsRowSortingDescription =>
      'Sort Playlist rows by date added, release date, alphabetically, and more.';

  @override
  String get displaySeerrRows => 'Display Seerr Discovery Rows';

  @override
  String get displaySeerrRowsSubtitle =>
      'Show Seerr discovery rows in Home Sections.';

  @override
  String get appearance => 'Voorkoms';

  @override
  String get cardSize => 'Kaart grootte';

  @override
  String get externalPlayerApp => 'Eksterne speler-app';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Wys programkieser wanneer afspeel begin.';

  @override
  String get loadingInstalledPlayers => 'Laai tans geïnstalleerde spelers...';

  @override
  String get connection => 'Verbinding';

  @override
  String get audioTranscodeTarget => 'Oudio-transkodeerteiken';

  @override
  String get passthrough => 'Deurloop';

  @override
  String get supportedOnThisDevice => 'Ondersteun op hierdie toestel';

  @override
  String get notSupportedOnThisDevice =>
      'Word nie op hierdie toestel ondersteun nie';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) deurlaat';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) na eksterne dekodeerder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD met Atmos (JOC) deurlaat';

  @override
  String get mediaPlayerBehavior => 'Mediaspeler-gedrag';

  @override
  String get playbackEnhancements => 'Terugspeelverbeterings';

  @override
  String get alwaysOn => 'Altyd aan.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Vervang Skip Outro met Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Wys die Next Up-oorleg in plaas van die Skip Outro-knoppie.';

  @override
  String get playerRouting => 'Spelerroetering';

  @override
  String get preferSoftwareDecoders => 'Verkies sagteware-dekodeerders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Gebruik FFmpeg (klank) en libgav1 (AV1) voor hardeware-dekodeerders. Deaktiveer as HDMI-oudio-deurlaat breek.';

  @override
  String get useExternalPlayer => 'Gebruik eksterne speler';

  @override
  String get useExternalPlayerSubtitle =>
      'Maak videoterugspeel oop in jou geselekteerde eksterne toepassing op Android TV.';

  @override
  String get automaticQueuing => 'Outomatiese toustaan';

  @override
  String get preferSdhSubtitles => 'Verkies SDH-onderskrifte';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritiseer SDH/CC-onderskrifsnitte wanneer u outomaties kies.';

  @override
  String get webDiagnostics => 'Web diagnostiek';

  @override
  String get webDiagnosticsTitle => 'Moonfin Webdiagnostiek';

  @override
  String get webDiagnosticsIntro =>
      'Gebruik hierdie bladsy om blaaierverbindingskwessies (CORS, gemengde inhoud en ontdekkinginstellings) te diagnoseer.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Bespeur gemengde inhoud mislukking';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Bespeur CORS/Voorvlug-mislukking';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin het \'n HTTPS-bladsy bespeur wat probeer om \'n HTTP-bediener-URL te bel. Blaaiers blokkeer hierdie versoek voordat dit jou bediener bereik.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin het \'n blaaiervlakversoekfout bespeur wat algemeen veroorsaak word deur ontbrekende CORS of voorafvlugopskrifte op die mediabediener.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Teiken-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Besonderhede: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Huidige looptydkonteks';

  @override
  String get webDiagnosticsOrigin => 'Oorsprong';

  @override
  String get webDiagnosticsScheme => 'Skema';

  @override
  String get webDiagnosticsPluginMode => 'Inpropmodus';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-skandering';

  @override
  String get webDiagnosticsForcedServerUrl => 'Geforseerde bediener-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Verstek bediener URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'nie gekonfigureer nie';

  @override
  String get webDiagnosticsMixedContent => 'Gemengde inhoud';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Hierdie bladsy word oor HTTPS gelaai, maar een of meer gekonfigureerde URL\'s is HTTP. Blaaiers blokkeer HTTPS-bladsye om HTTP API\'s te roep.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Stel reg: bedien jou mediabediener of instaanbediener-eindpunt via HTTPS, of laai Moonfin slegs oor HTTP op vertroude plaaslike netwerke.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Geen ooglopende konfigurasie vir gemengde inhoud bespeur vanaf huidige looptydinstellings nie.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Kontrolelys';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Laat die blaaier oorsprong toe in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Sluit magtiging, X-Emby-Magtiging en X-Emby-token in by Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ontbloot Inhoud-reeks en Aanvaar-reekse vir stroom- en soekgedrag.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Stel 204 terug na OPTIONS voorafvlugversoeke.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Voorbeeldkopkopstuk (nginx-styl)';

  @override
  String get note => 'Let wel';

  @override
  String get webDiagnosticsNonWebNote =>
      'Hierdie diagnostiese roete is bedoel vir webbou. As jy dit op \'n ander platform sien, is hierdie tjeks dalk nie van toepassing nie.';

  @override
  String get backToServerSelect => 'Terug na bediener kies';

  @override
  String get signOutAllUsers => 'Meld alle gebruikers uit';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofoontoestemming word permanent geweier. Aktiveer dit in stelselinstellings.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mikrofoontoestemming word vereis vir stemsoektog.';

  @override
  String get voiceSearchNoMatch => 'Het dit nie gevang nie. Probeer weer.';

  @override
  String get voiceSearchNoSpeechDetected => 'Geen spraak bespeur nie.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofoonfout.';

  @override
  String get voiceSearchNeedsInternet => 'Stemsoektog benodig internet.';

  @override
  String get voiceSearchServiceBusy => 'Stemdiens is besig. Probeer weer.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofoontoestemming word permanent geweier.';

  @override
  String get microphonePermissionDenied => 'Mikrofoontoestemming word geweier.';

  @override
  String get speechRecognitionUnavailable =>
      'Spraakherkenning is nie op hierdie toestel beskikbaar nie.';

  @override
  String get openIosRoutePicker => 'Maak iOS-roetekieser oop';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay roetekieser is nie op hierdie toestel beskikbaar nie.';

  @override
  String get videos => 'Video\'s';

  @override
  String get trailers => 'Sleepwaens';

  @override
  String get programs => 'Programme';

  @override
  String get songs => 'Liedjies';

  @override
  String get photoAlbums => 'Foto Albums';

  @override
  String get photos => 'Foto\'s';

  @override
  String get people => 'Mense';

  @override
  String get recentlyReleasedEpisodes => 'Onlangs vrygestelde episodes';

  @override
  String get watchAgain => 'Kyk weer';

  @override
  String get guestAppearances => 'Gasverskynings';

  @override
  String get appearancesSeerr => 'Voorkoms (Siener)';

  @override
  String get watchWithGroup => 'Kyk saam met die groep';

  @override
  String get errors => 'Foute';

  @override
  String get warnings => 'Waarskuwings';

  @override
  String get disk => 'Skyf';

  @override
  String get openInBrowser => 'Maak oop in blaaier';

  @override
  String get embeddedBrowserNotAvailable =>
      'Ingebedde blaaier is nie op hierdie platform beskikbaar nie.';

  @override
  String get adminRestartServerConfirmation =>
      'Is jy seker jy wil die bediener herbegin?';

  @override
  String get adminShutdownServerConfirmation =>
      'Is jy seker jy wil die bediener afskakel? Jy sal dit handmatig moet herbegin.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Ledig';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Geen gebruikers gevind nie';

  @override
  String get adminNoUsersMatchSearch =>
      'Geen gebruikers pas by jou soektog nie';

  @override
  String get adminNoDevicesFound => 'Geen toestelle gevind nie';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Geen toestelle pas by die huidige filters nie';

  @override
  String get passwordSet => 'Wagwoord gestel';

  @override
  String get noPasswordConfigured => 'Geen wagwoord opgestel nie';

  @override
  String get remoteAccess => 'Afstandtoegang';

  @override
  String get localOnly => 'Slegs plaaslik';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Kon nie mediaontledings laai nie';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Gekombineerde analise oor alle mediabiblioteke.';

  @override
  String get analyticsTopArtists => 'Top kunstenaars';

  @override
  String get analyticsTopAuthors => 'Top Skrywers';

  @override
  String get analyticsTopContributors => 'Top bydraers';

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
      'Geen geïndekseerde mediatotale is nog vir hierdie keuse beskikbaar nie.';

  @override
  String get analyticsLibraryDetails => 'Biblioteekbesonderhede';

  @override
  String get analyticsLibraryBreakdown => 'Biblioteek-ontleding';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Geen biblioteke is beskikbaar nie.';

  @override
  String get adminServerAdministrationTitle => 'Bedieneradministrasie';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Beeldkas';

  @override
  String get adminServerPathCache => 'Kas';

  @override
  String get adminServerPathLogs => 'Logs';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transkodeer';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Geen bedienerpaaie word deur hierdie bediener teruggestuur nie.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% gebruik';
  }

  @override
  String get userActivity => 'Gebruikersaktiwiteit';

  @override
  String get systemEvents => 'Stelselgebeurtenisse';

  @override
  String get needsAttention => 'Benodig aandag';

  @override
  String get adminDrawerSectionServer => 'Bediener';

  @override
  String get adminDrawerSectionPlayback => 'Afspeel';

  @override
  String get adminDrawerSectionDevices => 'Toestelle';

  @override
  String get adminDrawerSectionAdvanced => 'Gevorderd';

  @override
  String get adminDrawerSectionPlugins => 'Inproppe';

  @override
  String get adminDrawerSectionLiveTv => 'Regstreekse TV';

  @override
  String get homeVideos => 'Tuisvideo\'s';

  @override
  String get mixedContent => 'Gemengde inhoud';

  @override
  String get homeVideosAndPhotos => 'Tuisvideo\'s en foto\'s';

  @override
  String get mixedMoviesAndShows => 'Gemengde flieks en programme';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Geen opnames gevind nie';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Geen beeldbladsye in .$extension-argief gevind nie.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Ingebedde weergawe het misluk ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-weergawe het misluk ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Ontbrekende plaaslike lêer vir leser: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status terwyl boekdata vanaf $uri oopgemaak word';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Geen leesbare boekeindpunt beskikbaar nie';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Onondersteunde strokiesprentargiefformaat: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR-onttrekking-inprop is nie op hierdie platform beskikbaar nie.';

  @override
  String get failedToExtractCbrArchive => 'Kon nie .cbr-argief onttrek nie.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-onttrekking is nie op hierdie platform beskikbaar nie.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7-onttrekking-inprop is nie op hierdie platform beskikbaar nie.';

  @override
  String get closeGenrePanel => 'Maak genrepaneel toe';

  @override
  String get loadingShuffle => 'Laai tans shuffle …';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Outo-HDR-skakeling';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktiveer HDR outomaties vir HDR-videoterugspeel en herstel vertoonmodus by uitgang.';

  @override
  String get whenFullscreen => 'Wanneer volskerm';

  @override
  String get transcodingLimits => 'Transkoderingslimiete';
}
