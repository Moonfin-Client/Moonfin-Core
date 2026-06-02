// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Månefinne';

  @override
  String get signIn => 'Log ind';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Hurtig tilslutning';

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
  String get waitingForAuthorization => 'Venter på godkendelse...';

  @override
  String get back => 'Tilbage';

  @override
  String get serverUnavailable => 'Serveren er ikke tilgængelig';

  @override
  String get loginFailed => 'Login mislykkedes';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Hvem ser på?';

  @override
  String get addUser => 'Tilføj bruger';

  @override
  String get selectServer => 'Vælg Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Gemte servere';

  @override
  String get discoveredServers => 'Opdagede servere';

  @override
  String get noneFound => 'Ingen fundet';

  @override
  String get unableToConnectToServer =>
      'Kan ikke oprette forbindelse til serveren';

  @override
  String get addServer => 'Tilføj server';

  @override
  String get embyConnect => 'Emby Tilslut';

  @override
  String get removeServer => 'Fjern server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Ophæve';

  @override
  String get remove => 'Fjerne';

  @override
  String get connectToServer => 'Opret forbindelse til server';

  @override
  String get serverAddress => 'Server adresse';

  @override
  String get serverAddressHint => 'https://din-server.example.com';

  @override
  String get connect => 'Forbinde';

  @override
  String get secureStorageUnavailable =>
      'Sikker opbevaring er ikke tilgængelig';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin kunne ikke få adgang til dit systemnøglering. Login kan fortsætte, men sikker token-opbevaring er muligvis ikke tilgængelig, før nøgleringen er låst op.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-tema';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Skift mellem Moonfin og Neon Pulse uden at genstarte appen';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Månefinne';

  @override
  String get themeMoonfinSubtitle =>
      'Det nuværende Moonfin-look, som du alle er kommet til at elske';

  @override
  String get themeNeonPulse => 'Neon puls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-styling med magenta glød, cyan tekst og stærkere kromkontrast';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Forlade Moonfin?';

  @override
  String get exitAppConfirmation => 'Er du sikker på, at du vil afslutte?';

  @override
  String get exit => 'Udgang';

  @override
  String get noHomeRowsLoaded => 'Ingen hjemmerækker kunne indlæses';

  @override
  String get noHomeRowsHint =>
      'Prøv at opdatere eller reducere aktive hjemmesektioner.';

  @override
  String get retryHomeRows => 'Prøv Hjem-rækkerne igen';

  @override
  String get guide => 'Guide';

  @override
  String get recordings => 'Optagelser';

  @override
  String get schedule => 'Skema';

  @override
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Ingen varer fundet';

  @override
  String get home => 'Hjem';

  @override
  String get browseAll => 'Gennemse alle';

  @override
  String get genres => 'Genrer';

  @override
  String get collectionPlaceholder => 'Samlingsgenstande vises her';

  @override
  String get browseByLetter => 'Gennemse efter bogstav';

  @override
  String get alphabeticalBrowsePlaceholder => 'Alfabetisk browse vises her';

  @override
  String get suggestions => 'Forslag';

  @override
  String get suggestionsPlaceholder => 'Foreslåede varer vises her';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Denne mappe er tom';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
  }

  @override
  String get continuing => 'Fortsætter';

  @override
  String get ended => 'Afsluttet';

  @override
  String get sortAndFilter => 'Sorter og filtrer';

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
  String get medium => 'Medium';

  @override
  String get large => 'Stor';

  @override
  String get extraLarge => 'Ekstra stor';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Visninger';

  @override
  String get albums => 'Albums';

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
  String get discoverySubjects => 'Opdagelsesfag';

  @override
  String get pickDiscoverySubjects =>
      'Vælg, hvilke emnefeeds der skal vises i Discover.';

  @override
  String get apply => 'Anvende';

  @override
  String get openLink => 'Åbn link';

  @override
  String get scanWithYourPhone => 'Scan med din telefon';

  @override
  String get audiobookGenres => 'Lydbog genrer';

  @override
  String get pickAudiobookGenres =>
      'Vælg, hvilke genrer der skal vises i Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Opdag lydbøger';

  @override
  String get librivoxDescription =>
      'Populære public domain-titler fra LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Rul til venstre';

  @override
  String get scrollRight => 'Rul til højre';

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
  String get resume => 'Genoptage';

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
  String get readyWhenYouAre => 'Klar, når du er';

  @override
  String get details => 'Detaljer';

  @override
  String get listeningRoom => 'Lytterum';

  @override
  String get bookmarksAndProgress => 'Bogmærker og fremskridt';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
  String get trendingTitlesOpenLibrary =>
      'Populære titler efter emne fra Open Library.';

  @override
  String get noBookmarkedItems => 'Ingen bogmærkede varer endnu';

  @override
  String get nothingMatchesSection =>
      'Intet matcher dette afsnit endnu. Prøv en anden fane, eller kom tilbage, når bibliotekssynkroniseringen er afsluttet.';

  @override
  String get audiobooks => 'Lydbøger';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Læsestatus';

  @override
  String get playedStatus => 'Spillet status';

  @override
  String get readStatus => 'Læse';

  @override
  String get watched => 'Så';

  @override
  String get unread => 'Ulæst';

  @override
  String get unwatched => 'Uovervåget';

  @override
  String get seriesStatus => 'Seriestatus';

  @override
  String get allLibraries => 'Alle biblioteker';

  @override
  String get books => 'Bøger';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Kunne ikke indlæse dette emne lige nu.';

  @override
  String get audiobookDetails => 'Lydbog detaljer';

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
  String get trackList => 'Sporliste';

  @override
  String get itemListPlaceholder => 'Vareliste vises her';

  @override
  String get favoriteTracksPlaceholder => 'Yndlingsnumre vises her';

  @override
  String get failedToLoad => 'Kunne ikke indlæses';

  @override
  String get delete => 'Slet';

  @override
  String get save => 'Spare';

  @override
  String get moreLikeThis => 'Mere som denne';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Samling';

  @override
  String get episodes => 'Episoder';

  @override
  String get nextUp => 'Næste op';

  @override
  String get seasons => 'Årstider';

  @override
  String get chapters => 'kapitler';

  @override
  String get features => 'Funktioner';

  @override
  String get movies => 'Film';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
  String get noBooksFound => 'Ingen bøger fundet for denne forfatter.';

  @override
  String get unableToLoadAuthorDetails =>
      'Kan ikke indlæse forfatteroplysninger lige nu.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Udgivelsesdato ukendt';

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
  String get view => 'Udsigt';

  @override
  String get resumeReading => 'Genoptag læsning';

  @override
  String get read => 'Læse';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Spil';

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
  String get trailer => 'Anhænger';

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
  String get renamePlaylist => 'Omdøb afspilningsliste';

  @override
  String get playlistName => 'Afspilningslistenavn';

  @override
  String get deleteDownloadedAlbum => 'Slet downloadet album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Varen er slettet';

  @override
  String get noPlayableTrailerFound => 'Ingen spilbar trailer fundet.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
  String get selectedSubtitleInvalid => 'Den valgte undertekst er ugyldig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Undertekster downloadet. Det kan tage et øjeblik at dukke op, mens Jellyfin opdaterer elementet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
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
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Slet downloadede filer';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'SKRIFTERE';

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
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Læs mere';

  @override
  String get shuffle => 'Bland';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekt match';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereoanlæg';

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
  String get deleteSeasonFiles => 'alle downloadede afsnit i denne sæson';

  @override
  String get stillWatching => 'Ser du stadig?';

  @override
  String get unableToLoadTrailerStream => 'Kan ikke indlæse trailerstream.';

  @override
  String get trailerTimedOut => 'Traileren fik timeout under lastning.';

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
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Fjernafspilning';

  @override
  String get castingToGoogleCast => 'Caster til Google Cast';

  @override
  String get castingViaAirPlay => 'Casting via AirPlay';

  @override
  String get castingViaDlna => 'Casting via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Langt tryk for at låse op';

  @override
  String get off => 'Slukket';

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
  String get bitrateOverride => 'Bitrate Tilsidesættelse';

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
  String get player => 'Spiller';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video bitrate';

  @override
  String get track => 'Spore';

  @override
  String get channels => 'Kanaler';

  @override
  String get audioBitrate => 'Lyd bitrate';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get format => 'Format';

  @override
  String get external => 'Ekstern';

  @override
  String get embedded => 'Indlejret';

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
      'EPUB-gengivelse i appen er endnu ikke tilgængelig på denne platform.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Integreret dokumentgengivelse er ikke tilgængelig på denne platform.';

  @override
  String get couldNotOpenExternalViewer => 'Kunne ikke åbne ekstern fremviser.';

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
      'Ingen bogmærker endnu.\nTryk på bogmærkeikonet, mens du læser for at gemme din position.';

  @override
  String get noTableOfContentsAvailable =>
      'Ingen indholdsfortegnelse tilgængelig';

  @override
  String pageLabel(int number) {
    return 'Page $number';
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
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Ingen kanaler fundet';

  @override
  String get liveBadge => 'LEVENDE';

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
  String get watch => 'Ur';

  @override
  String get close => 'Tæt';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Ingen';

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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Afspil album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Serie ikke fundet';

  @override
  String get errorLoadingSeries => 'Fejl ved indlæsning af serien';

  @override
  String get downloadedEpisodes => 'Downloadede episoder';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
  String get storageManagement => 'Lagerstyring';

  @override
  String get storageBreakdown => 'Opbevaringssammenbrud';

  @override
  String get downloadedItems => 'Downloadede varer';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musik og lydbøger';

  @override
  String get images => 'Billeder';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Indstillinger';

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
  String get serverSyncAndPluginStatus =>
      'Serversynkronisering og plugin-status';

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
  String get integrations => 'Integrationer';

  @override
  String get pluginAndRequests => 'Plugin og anmodninger';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tilpas konto, afspilning og grænsefladeadfærd';

  @override
  String optionsCount(int count) {
    return '$count options';
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
  String get hideUnwatched => 'Skjul uovervåget';

  @override
  String get episodesOnly => 'Kun episoder';

  @override
  String get never => 'Aldrig';

  @override
  String get focusExpansionAnimation => 'Focus Expansion Animation';

  @override
  String get desktopUiScale => 'Desktop UI-skala';

  @override
  String get scaleFocusedCards =>
      'Skala fokuserede eller svævende kort og fliser';

  @override
  String get backgroundBackdrops => 'Baggrundsbaggrunde';

  @override
  String get showBackdropImages => 'Vis baggrundsbilleder bag indhold';

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
  String get snow => 'Sne';

  @override
  String get fireworks => 'Fyrværkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Faldende Blade';

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
  String get detailsBackgroundBlur => 'Detaljer Baggrundssløring';

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
  String get fit => 'Passe';

  @override
  String get autoCrop => 'Automatisk beskæring';

  @override
  String get stretch => 'Strække';

  @override
  String get refreshRateSwitching => 'Skift af opdateringshastighed';

  @override
  String get disabled => 'Handicappet';

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
  String get showDescriptionOnPause => 'Vis beskrivelse på pause';

  @override
  String get dimVideoShowOverview =>
      'Dæmp video, og vis oversigtstekst, mens den er sat på pause';

  @override
  String get osdLockButton => 'OSD-låseknap';

  @override
  String get osdLockButtonDescription =>
      'Vis en låseknap, der blokerer berøringsinput, indtil der trykkes længe';

  @override
  String get audioBehavior => 'Lydadfærd';

  @override
  String get downmixToStereo => 'Downmix til stereo';

  @override
  String get defaultAudioLanguage => 'Standard lydsprog';

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
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'TrueHD-understøttelse';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS-lyd kun til AVR; kræver modtagerunderstøttelse og DTS-kildespor';

  @override
  String get enableTrueHdAudio =>
      'Aktiver TrueHD-lyd (fungerer muligvis ikke på alle platforme)';

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
  String get nextUpDisplay => 'Next Up Display';

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
    return 'After $episodes episodes / ${hours}h';
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
  String get defaultToNoSubtitles => 'Standard til Ingen undertekster';

  @override
  String get turnOffSubtitlesByDefault => 'Slå undertekster fra som standard';

  @override
  String get subtitleSize => 'Undertekst størrelse';

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
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobil';

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
  String get customizationProfile => 'Tilpasningsprofil';

  @override
  String get customizationProfileDescription =>
      'Vælg den profil, der skal indlæses, redigere og synkronisere. Global gælder overalt, medmindre en enhedsprofil tilsidesætter det. Den grønne prik markerer din aktuelle enhedsprofil.';

  @override
  String get loadProfile => 'Indlæs profil';

  @override
  String get syncing => 'Synkroniserer...';

  @override
  String get syncToProfile => 'Synkroniser til profil';

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
  String get showLibrariesInToolbar => 'Vis biblioteker i værktøjslinjen';

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
  String get enableFolderView => 'Aktiver mappevisning';

  @override
  String get showFolderBrowsingOption => 'Vis mulighed for browsing af mapper';

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
  String get sourceLibraries => 'Kildebiblioteker';

  @override
  String get sourceCollections => 'Kildesamlinger';

  @override
  String get excludedGenres => 'Udelukkede genrer';

  @override
  String get selectAll => 'Vælg alle';

  @override
  String itemsSelected(int count) {
    return '$count selected';
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
  String get localPreviews => 'Lokale forhåndsvisninger';

  @override
  String get localPreviewsDescription =>
      'Konfigurer trailer-, medie- og lydeksempler.';

  @override
  String get mediaBarMode => 'Mediebar stil';

  @override
  String get mediaBarModeDescription =>
      'Vælg mellem Moonfin, MakD, eller sluk for medielinjen';

  @override
  String get mediaBarModeMoonfin => 'Månefinne';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Slukket';

  @override
  String get enableMediaBar => 'Aktiver Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Vis slideshow med fremhævet indhold hjemme';

  @override
  String get contentType => 'Indholdstype';

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
  String get latestMedia => 'Seneste medier';

  @override
  String get recentlyReleased => 'For nylig udgivet';

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
  String get homeSections => 'Hjem sektioner';

  @override
  String get resetToDefaults => 'Nulstil til standardindstillinger';

  @override
  String get homeRowPosterSize => 'Hjemmerække plakatstørrelse';

  @override
  String get perRowImageTypeSelection => 'Valg af billedtype pr. række';

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
  String get perRowImageType => 'Billedtype pr. række';

  @override
  String get perRowSettings => 'Indstillinger pr. række';

  @override
  String get autoLogin => 'Automatisk login';

  @override
  String get lastUser => 'Sidste bruger';

  @override
  String get specificUser => 'Specifik bruger';

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
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Bibliotekskunst';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Ur';

  @override
  String get timeout => 'Timeout';

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
  String get showClock => 'Vis ur';

  @override
  String get displayClockDuringScreensaver => 'Vis ur under pauseskærm';

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
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin fundet';

  @override
  String get pluginNotDetected => 'Plugin ikke fundet';

  @override
  String get pluginDetectedDescription =>
      'Server-plugin fundet. Synkronisering aktiveres automatisk, første gang pluginnet findes.';

  @override
  String get pluginNotDetectedDescription =>
      'Server-plugin er ikke fundet i øjeblikket. Lokale indstillinger bruger stadig deres gemte værdier eller indbyggede standarder.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Tilgængelige tjenester';

  @override
  String get serverPluginSync => 'Server Plugin Sync';

  @override
  String get syncSettingsWithPlugin =>
      'Synkroniser indstillinger med serverpluginnet';

  @override
  String get whatSyncControls => 'Hvad synkronisering styrer';

  @override
  String get syncControlsDescription =>
      'Synkronisering styrer kun, om plugin-støttede indstillinger skubbes til og trækkes fra serveren. Profilvalg og profilsynkroniseringshandlinger er i tilpasningsindstillingerne, når plugin-synkronisering er aktiveret.';

  @override
  String get recentRequests => 'Seneste anmodninger';

  @override
  String get recentlyAdded => 'Nyligt tilføjet';

  @override
  String get trending => 'Trending';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Opdag Rows';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Træk for at omarrangere. Aktiver eller deaktiver rækker. Aktiveret rækkefølge synkroniseres med Moonfin-pluginnet.';

  @override
  String get discoverRowsDescription =>
      'Træk for at omarrangere. Aktiver eller deaktiver rækker.';

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
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Opdater meddelelser';

  @override
  String get showWhenUpdatesAvailable =>
      'Vis, når opdateringer er tilgængelige';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get reorderToggleHomeRows => 'Omarranger og skift hjem-rækker';

  @override
  String get featuredContentAppearance => 'Udvalgt indhold, udseende';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakatstørrelse, billedtype, mappevisning';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB og ratingkilder';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Klar';

  @override
  String get browse => 'Gennemse';

  @override
  String get noResults => 'Ingen resultater';

  @override
  String get seerrAvailableStatus => 'Tilgængelig';

  @override
  String get seerrRequestedStatus => 'Anmodet';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr Indstillinger';

  @override
  String get requestMore => 'Anmod om mere';

  @override
  String get request => 'Anmodning';

  @override
  String get cancelRequest => 'Annuller anmodning';

  @override
  String get playInMoonfin => 'Spil i Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get submitRequest => 'Indsend anmodning';

  @override
  String get allSeasons => 'Alle årstider';

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
    return 'age $age';
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
  String get tmdbScore => 'TMDB-score';

  @override
  String get releaseDateLabel => 'Udgivelsesdato';

  @override
  String get firstAirDateLabel => 'Første luftdato';

  @override
  String get revenueLabel => 'Indtægter';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Originalsprog';

  @override
  String get seasonsLabel => 'Årstider';

  @override
  String get episodesLabel => 'Episoder';

  @override
  String get access => 'Adgang';

  @override
  String get add => 'Tilføje';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analytics';

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
  String get edit => 'Redigere';

  @override
  String get encoding => 'Kodning';

  @override
  String get error => 'Fejl';

  @override
  String get forward => 'Forward';

  @override
  String get general => 'Generel';

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
  String get remote => 'Fjern';

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
  String get search => 'Søge';

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
  String get trickplay => 'Trickspil';

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
  String get mute => 'Stum';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Indstillinger';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Brugere';

  @override
  String get adminDrawerLibraries => 'Biblioteker';

  @override
  String get adminDrawerTranscoding => 'Omkodning';

  @override
  String get adminDrawerResume => 'Genoptage';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickspil';

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
  String get adminDrawerLogs => 'Logs';

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
  String get analyticsRuntimeBuckets => 'Runtime Buckets';

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
  String get adminScanLibraries => 'Scan biblioteker';

  @override
  String get adminLibraryScanStarted => 'Biblioteksscanning startede';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'Forward';

  @override
  String get sessionNext => 'Næste';

  @override
  String get sessionVolumeDown => 'bind –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Spiller nu';

  @override
  String get volume => 'Bind';

  @override
  String get actions => 'Handlinger';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Audio Codec';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Fuldførelse';

  @override
  String get direct => 'Direkte';

  @override
  String get adminDisconnect => 'Afbryde';

  @override
  String get adminClearDates => 'Klare datoer';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Slet enhed';

  @override
  String get adminDeviceDeleted => 'Enheden er slettet';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Omdøb bibliotek';

  @override
  String get adminNewName => 'Nyt navn';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Slet bibliotek';

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
  String get adminRemovePath => 'Fjern sti';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Biblioteksindstillinger er gemt';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminSaveOptions => 'Gem indstillinger';

  @override
  String get adminPreferredMetadataLanguage => 'Foretrukken metadatasprog';

  @override
  String get adminMetadataLanguageHint => 'f.eks. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata landekode';

  @override
  String get adminMetadataCountryHint => 'f.eks. USA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Bibliotekets navn er påkrævet';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekets navn';

  @override
  String get adminSelectedPaths => 'Valgte stier:';

  @override
  String get adminNoPathsAdded => 'Ingen stier tilføjet (kan tilføjes senere)';

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
  String get adminUsersLoadFailed => 'Kunne ikke indlæse brugere';

  @override
  String get adminSearchUsers => 'Søg efter brugere';

  @override
  String get adminEditUser => 'Rediger bruger';

  @override
  String get adminAddUser => 'Tilføj bruger';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Opret bruger';

  @override
  String get adminPasswordOptional => 'Adgangskode (valgfrit)';

  @override
  String get adminUsernameRequired => 'Brugernavnet må ikke være tomt';

  @override
  String get adminNoProfileChanges => 'Ingen profilændringer at gemme';

  @override
  String get adminProfileSaved => 'Profil gemt';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Tilladelser gemt';

  @override
  String get adminPasswordsMismatch => 'Adgangskoder stemmer ikke overens';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Brugeren kunne ikke indlæses';

  @override
  String get adminBackToUsers => 'Tilbage til Brugere';

  @override
  String get adminSaveProfile => 'Gem profil';

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
  String get adminAllowContentDeletion => 'Tillad sletning af indhold';

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
  String get adminRemoteBitrateLimit => 'Fjernklientbithastighedsgrænse (bps)';

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
  String get adminSavePermissions => 'Gem tilladelser';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktiver adgang til alle biblioteker';

  @override
  String get adminSaveAccess => 'Gem adgang';

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
  String get adminDeviceAndChannelAccess => 'Enheds- og kanaladgang';

  @override
  String get adminEnableAllDevices => 'Aktiver adgang til alle enheder';

  @override
  String get adminEnableAllChannels => 'Aktiver adgang til alle kanaler';

  @override
  String get adminResetPasswordWarning =>
      'Dette vil fjerne adgangskoden. Brugeren vil være i stand til at logge på uden adgangskode.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Nøgletoken mangler fra serversvar';

  @override
  String get adminRevokeApiKey => 'Tilbagekald API-nøgle';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-nøgle tilbagekaldt';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Opretter backup...';

  @override
  String get adminBackupCreated => 'Sikkerhedskopien blev oprettet';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backupsti mangler i serversvar';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Bekræft gendannelse';

  @override
  String get adminRestoringBackup => 'Gendanner backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Søg i log';

  @override
  String get adminNoMatchingLines => 'Ingen matchende linjer';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ingen planlagte opgaver fundet';

  @override
  String get adminNoTasksMatchFilter =>
      'Ingen opgaver matcher det aktuelle filter';

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
  String get adminRunNow => 'Kør nu';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
  String get adminTimeLimit => 'Tidsgrænse (valgfrit)';

  @override
  String get adminNoLimit => 'Ingen grænse';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'ugedag';

  @override
  String get adminSearchPlugins => 'Søg plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Afinstaller plugin';

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
  String get adminNoPluginsMatchSearch => 'Ingen plugins matcher din søgning';

  @override
  String get adminNoPluginsInstalled => 'Ingen plugins installeret';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
      'Kan ikke åbne indstillinger: manglende godkendelsestoken.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
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
  String get adminRepositoryNameHint => 'f.eks. Jellyfin Stald';

  @override
  String get adminRepositoryUrl => 'Repository URL';

  @override
  String get adminAddEntry => 'Tilføj post';

  @override
  String get adminInvalidUrl => 'Ugyldig URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBrandingSaved => 'Indstillinger for branding er gemt';

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
  String get adminStreamingSaved => 'Streamingindstillinger gemt';

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
  String get adminPlaybackSaved => 'Afspilningsindstillinger gemt';

  @override
  String get adminPlaybackLoadFailed =>
      'Kunne ikke indlæse afspilningsindstillinger';

  @override
  String get adminPlaybackTranscoding => 'Afspilning / omkodning';

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
  String get adminTrickplaySaved => 'Trickplay-indstillinger gemt';

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
  String get adminResumeSaved => 'Genoptag indstillinger gemt';

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
  String get adminNetworkingSaved =>
      'Netværksindstillinger gemt. En servergenstart kan være påkrævet.';

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
  String get adminHttpsPort => 'HTTPS port';

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
  String get adminMetadataSaved => 'Metadata gemt';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Opdater metadata';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Erstat alle metadata';

  @override
  String get adminReplaceAllImages => 'Udskift alle billeder';

  @override
  String get adminMetadataRefreshRequested => 'Opdatering af metadata anmodet';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Søg fjernperson';

  @override
  String get adminNoRemoteMatches => 'Ingen fjernmatch fundet';

  @override
  String get adminRemoteResults => 'Fjernresultater';

  @override
  String get adminRemoteMetadataApplied => 'Fjernmetadata anvendt';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Opdater indholdstype';

  @override
  String get adminContentType => 'Indholdstype';

  @override
  String get adminContentTypeUpdated => 'Indholdstype opdateret';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Ikke-understøttet billedformat';

  @override
  String get adminImageReadFailed => 'Kunne ikke læse det valgte billede';

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
  String get adminAllProviders => 'Alle udbydere';

  @override
  String get adminNoRemoteImages => 'Ingen fjernbilleder fundet';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Tilføj Tuner';

  @override
  String get adminTunerType => 'Tuner type';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Andet';

  @override
  String get adminUrlPath => 'URL / sti';

  @override
  String get adminNameOptional => 'Navn (valgfrit)';

  @override
  String get adminTunerAdded => 'Tuner tilføjet';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Tilføj guideudbyder';

  @override
  String get adminProviderType => 'Udbyder type';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect eller XMLTV';

  @override
  String get adminUsernameOptional => 'Brugernavn (valgfrit)';

  @override
  String get adminRefreshInterval => 'Opdateringsinterval (timer)';

  @override
  String get adminProviderAdded => 'Udbyder tilføjet';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner-nulstilling anmodet';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Optagelsesindstillinger';

  @override
  String get adminPrePadding => 'Forudfyldning (minutter)';

  @override
  String get adminPostPadding => 'Efterpolstring (minutter)';

  @override
  String get adminRecordingPath => 'Optagelsessti';

  @override
  String get adminSeriesRecordingPath => 'Serieoptagelsessti';

  @override
  String get adminRecordingSettingsSaved => 'Optagelsesindstillinger gemt';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Indstil kanaltilknytninger';

  @override
  String get adminMappingJson => 'Kortlægning af JSON';

  @override
  String get adminMappingJsonHint =>
      'Eksempel: kortlægninger af JSON-nyttelast';

  @override
  String get adminChannelMappingsUpdated => 'Kanalkortlægninger opdateret';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Tilføj udbyder';

  @override
  String get adminNoListingProviders => 'Ingen listeudbydere konfigureret';

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
  String get adminChannelMappings => 'Kanalkortlægninger';

  @override
  String get adminNoDiscoveredTuners => 'Ingen opdagede tunere endnu';

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
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Gendannelse anmodet. Servergenstart kan muligvis afbryde forbindelsen til denne session.';

  @override
  String get adminBackupsTitle => 'Sikkerhedskopier';

  @override
  String get adminUnknownDate => 'Ukendt dato';

  @override
  String get adminUnnamedBackup => 'Unavngivet backup';

  @override
  String get adminLiveTvNotAvailable =>
      'Direkte tv-administration er ikke tilgængelig på denne serverbuild.';

  @override
  String get adminLiveTvTitle => 'Direkte tv-administration';

  @override
  String get adminApply => 'Anvende';

  @override
  String get adminNotSet => 'Ikke indstillet';

  @override
  String get adminReset => 'Nulstil';

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
  String get adminLogViewerNoMatches => 'Ingen matchende linjer';

  @override
  String get adminMetadataEditorTitle => 'Metadata Editor';

  @override
  String get adminMetadataRemote => 'Fjern';

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
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Oversigt';

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
  String get adminMetadataRecursive => 'Rekursiv';

  @override
  String get adminMetadataProvider => 'Udbyder';

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
      'Kunne ikke læse det valgte billede';

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
      'Dette fjerner det aktuelle billede fra elementet.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
  String get adminPluginsNoSearchResults => 'Ingen plugins matcher din søgning';

  @override
  String get adminPluginsNoneInstalled => 'Ingen plugins installeret';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ingen pakker matcher din søgning';

  @override
  String get adminPluginsCatalogEmpty => 'Ingen tilgængelige pakker';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Fjern repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Fjerne';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminReposUrl => 'Repository URL';

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
  String get adminNetworkingRemoteAccess => 'Aktiver fjernadgang';

  @override
  String get adminNetworkingPorts => 'Havne';

  @override
  String get adminNetworkingHttpPort => 'HTTP-port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS port';

  @override
  String get adminNetworkingEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokalt netværk';

  @override
  String get adminNetworkingLocalAddresses => 'Lokale netværksadresser';

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
  String get adminPlaybackHwAccel => 'Hardwareacceleration';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwareacceleration';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktiver hardwarekodning';

  @override
  String get adminPlaybackEnableHwDecoding => 'Aktiver hardwareafkodning for:';

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
  String get adminResumeMinAudiobookPct =>
      'Minimumsprocent for genoptagelse af lydbog';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimal procentdel for genoptagelse af lydbøger';

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
  String get adminTaskTriggerEvery6Hours => 'Hver 6. time';

  @override
  String get adminTaskTriggerEvery12Hours => 'Hver 12. time';

  @override
  String get adminTaskTriggerEvery24Hours => 'Hver 24 timer';

  @override
  String get adminTaskTriggerEvery2Days => 'Hver 2. dag';

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
  String get adminTaskTriggerTime => 'Tid';

  @override
  String get adminTaskTriggerNoLimit => 'Ingen grænse';

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
      'Konfigurer generering af trickplay-billeder til miniaturebilleder for søgeeksempler.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Basis URL';

  @override
  String get adminNetworkingBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Certifikatsti';

  @override
  String get adminNetworkingRemoteIpFilter => 'Eksternt IP-filter';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Tærskel for langsom respons (ms)';

  @override
  String get adminGeneralCachePath => 'Cache-sti';

  @override
  String get adminGeneralMetadataPath => 'Metadatasti';

  @override
  String get adminGeneralServerName => 'Servernavn';

  @override
  String get adminSettingsLoadFailed => 'Indstillingerne kunne ikke indlæses';

  @override
  String get adminDiscover => 'Opdage';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-adgang nægtet';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Du har ikke adgang til et eller flere elementer i denne SyncPlay-gruppe. Bed gruppeejeren om at bekræfte bibliotekstilladelser eller vælge en anden kø.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Registrer rækker afsløret af IAmParadox27\'s \"Home Screen Sections\" plugin. Rækker kan aktiveres og omarrangeres nedenfor.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Ingen Jellyfin-servere rapporterer pluginnet endnu.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Registrer rækker konfigureret via ranaldsgifts \"KefinTweaks\" plugin. Brugerdefinerede sektioner, for nylig udgivet, se igen, sæsonbestemt og for nylig tilføjet i biblioteket, spejles fra KefinTweaks-konfigurationen på hver Jellyfin-server.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Ingen Jellyfin-servere rapporterer KefinTweaks endnu.';

  @override
  String get integrationOpenHomeSections => 'Åbn Home Sektioner';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Aktiver, deaktiver og omarranger rækker';

  @override
  String get integrationInstalledButDisabled => 'Installeret men deaktiveret';

  @override
  String get integrationNotInstalled => 'Ikke installeret';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fjernafspilning';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Forkert pinkode';

  @override
  String get pinMismatch => 'PIN-koder stemmer ikke overens';

  @override
  String get pinForgot => 'Har du glemt PIN-koden?';

  @override
  String get pinClear => 'Klar';

  @override
  String get pinBackspace => 'Backspace';

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
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Indtast kode';

  @override
  String get quickConnectAuthorize => 'Bemyndige';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Ingen tilgængelige fjernafspilningsenheder.';

  @override
  String get noRemoteDevicesIos =>
      'Ingen tilgængelige fjernafspilningsenheder.\n\nPå iOS kan AirPlay-mål være utilgængelige i simulatoren.';

  @override
  String get trackActionPlayNext => 'Spil Næste';

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
    return 'Downloading $name...';
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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Live tv';

  @override
  String get continueWatchingAndNextUp => 'Fortsæt med at se og næste gang';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'Tidligere';

  @override
  String get playerTooltipSeekBack => 'Søg tilbage';

  @override
  String get playerTooltipSeekForward => 'Søg frem';

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
  String get settingsAdministrationSubtitle =>
      'Få adgang til serveradministrationspanelet';

  @override
  String get settingsAccountSecurity => 'Konto & Sikkerhed';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentificering, PIN-kode og forældrekontrol';

  @override
  String get settingsPersonalization => 'Personalisering';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigation, startrækker og bibliotekssynlighed';

  @override
  String get settingsDynamicContent => 'Dynamisk indhold';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Bar og visuelle overlejringer';

  @override
  String get settingsPlaybackSyncplay => 'Afspilning og SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Indstillinger for lyd/video, undertekster, downloads og SyncPlay-kontroller';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin-synkronisering, Seerr, vurderinger og mere';

  @override
  String get settingsAboutSubtitle =>
      'Appversion, juridiske oplysninger og kreditter';

  @override
  String get settingsAuthenticationSection => 'GODKENDELSE';

  @override
  String get settingsSortServersBy => 'Sorter servere efter';

  @override
  String get settingsLastUsed => 'Sidst brugt';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsPrivacyAndSafetySection => 'FORTROLIGHED OG SIKKERHED';

  @override
  String get settingsBlockedRatings => 'Blokerede vurderinger';

  @override
  String get settingsGeneralStyle => 'Generel stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Temaaccenter, baggrunde, sete indikatorer og temamusik';

  @override
  String get settingsHomePage => 'Hjemmeside';

  @override
  String get settingsHomePageSubtitle =>
      'Sektioner, billedtyper, overlejringer og medieforhåndsvisninger';

  @override
  String get settingsLibrariesSubtitle =>
      'Biblioteksynlighed, mappevisning og multiserveradfærd';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'Vis biblioteksknappen i navigationslinjen';

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
  String get settingsMetadataAndRatings => 'Metadata og vurderinger';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase driver integrationer på serversiden, herunder yderligere vurderingskilder, Seerr-anmodninger og synkroniserede præferencer.';

  @override
  String get settingsOfflineDownloads => 'Offline downloads';

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
  String get settingsAppInfo => 'APP INFO';

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
      'Stjerne projektet på GitHub eller bidrag';

  @override
  String get settingsLegal => 'LEGAL';

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
  String get settingsPoweredByFlutter => 'Drevet af Flutter';

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
  String get settingsBoth => 'Begge';

  @override
  String get settingsShuffleContentTypeFilter => 'Bland indholdstypefilter';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Præferencer for videoafspilning';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Indstillinger for kernevideomotor og streamingkvalitet';

  @override
  String get settingsAudioPreferences => 'Lydpræferencer';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Muligheder for lydspor, behandling og passthrough';

  @override
  String get settingsAutomationAndQueue => 'Automatisering & kø';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisk afspilning og sekventering';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Downloadkvalitet, lagergrænser og køstørrelse';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogik til gruppesessioner';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specialiserede afspillerfunktioner. Brug med forsigtighed, da nogle muligheder kan forårsage afspilningsproblemer';

  @override
  String get settingsSkipIntrosAndOutros => 'Springe introer og outros over?';

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
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Vælg standardafspilningsmotoren på Android TV-enheder. Ændringer gælder for den næste afspilningssession.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (anbefales)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (forældet)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Fallback';

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
  String get settingsCinemaModeSubtitle =>
      'Spil trailere/prerolls før en hovedfunktion';

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
