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
  String get signIn => 'Ensalutu';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Rapida Konekto';

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
  String get waitingForAuthorization => 'Atendante rajtigon...';

  @override
  String get back => 'Reen';

  @override
  String get serverUnavailable => 'Servilo estas nedisponebla';

  @override
  String get loginFailed => 'Ensaluto malsukcesis';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kiu rigardas?';

  @override
  String get addUser => 'Aldoni Uzanton';

  @override
  String get selectServer => 'Elektu Servilon';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
  String get settingsAppearanceThemeSubtitle =>
      'Ŝanĝu inter Moonfin kaj Neon Pulse sen rekomenci la apon';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Eliri Moonfin?';

  @override
  String get exitAppConfirmation => 'Ĉu vi certas, ke vi volas eliri?';

  @override
  String get exit => 'Eliro';

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
  String get recordings => 'Registradoj';

  @override
  String get schedule => 'Horaro';

  @override
  String get series => 'Serio';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ĉi tiu dosierujo estas malplena';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
  String libraryGenresTitle(String name) {
    return '$name — Genres';
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
  String get discoverySubjects => 'Malkovraj Temoj';

  @override
  String get pickDiscoverySubjects =>
      'Elektu kiajn temajn fontojn montri en Discover.';

  @override
  String get apply => 'Apliki';

  @override
  String get openLink => 'Malfermu Ligon';

  @override
  String get scanWithYourPhone => 'Skanu per via telefono';

  @override
  String get audiobookGenres => 'Aŭdlibroj Ĝenroj';

  @override
  String get pickAudiobookGenres =>
      'Elektu kiajn ĝenrojn montri en Aŭdlibro Discover.';

  @override
  String get discoverAudiobooks => 'Malkovru Aŭdlibrojn';

  @override
  String get librivoxDescription => 'Popularaj publikaj titoloj de LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Rulumu maldekstren';

  @override
  String get scrollRight => 'Rulumu dekstren';

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
  String get resume => 'Rekomenci';

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
  String get readyWhenYouAre => 'Preta kiam vi estos';

  @override
  String get details => 'Detaloj';

  @override
  String get listeningRoom => 'Aŭskultejo';

  @override
  String get bookmarksAndProgress => 'Legosignoj & Progreso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
  String get trendingTitlesOpenLibrary =>
      'Tendencaj titoloj laŭ temo de Open Library.';

  @override
  String get noBookmarkedItems => 'Ankoraŭ neniuj legosignitaj eroj';

  @override
  String get nothingMatchesSection =>
      'Nenio ankoraŭ kongruas kun ĉi tiu sekcio. Provu alian langeton aŭ revenu post kiam la biblioteksinkroniĝo finiĝos.';

  @override
  String get audiobooks => 'Aŭdlibroj';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
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
  String get watched => 'Rigardis';

  @override
  String get unread => 'Nelegita';

  @override
  String get unwatched => 'Nerigardita';

  @override
  String get seriesStatus => 'Serio Statuso';

  @override
  String get allLibraries => 'Ĉiuj Bibliotekoj';

  @override
  String get books => 'Libroj';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Ne eblis ŝargi ĉi tiun temon nun.';

  @override
  String get audiobookDetails => 'Detaloj de Aŭdlibro';

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
  String get trackList => 'Trako Listo';

  @override
  String get itemListPlaceholder => 'Listo de eroj aperos ĉi tie';

  @override
  String get favoriteTracksPlaceholder => 'Plej ŝatataj trakoj aperos ĉi tie';

  @override
  String get failedToLoad => 'Malsukcesis ŝargi';

  @override
  String get delete => 'Forigi';

  @override
  String get save => 'Konservu';

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
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
  String get noBooksFound => 'Neniuj libroj trovitaj por ĉi tiu aŭtoro.';

  @override
  String get unableToLoadAuthorDetails =>
      'Ne eblas ŝargi detalojn pri aŭtoro nun.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Dato de publikigo nekonata';

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
  String get view => 'Vido';

  @override
  String get resumeReading => 'Rekomencu Legado';

  @override
  String get read => 'Legu';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Ludu';

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
  String get cast => 'Rolantaro';

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
  String get renamePlaylist => 'Alinomi Ludliston';

  @override
  String get playlistName => 'Nomo de ludlisto';

  @override
  String get deleteDownloadedAlbum => 'Forigi Elŝutitan Albumon';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Ero forigita';

  @override
  String get noPlayableTrailerFound => 'Neniu ludebla antaŭfilmo trovita.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
  String get selectedSubtitleInvalid =>
      'La elektita subteksto estas malvalida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitolo elŝutita. Povas preni momenton por aperi dum Jellyfin refreŝigas la objekton.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Elektu Version';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Forigu elŝutitajn dosierojn';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'SKRIBOJ';

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
  String get showLess => 'Montru Malpli';

  @override
  String get readMore => 'Legu Pli';

  @override
  String get shuffle => 'Miksi';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekta matĉo';

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
  String get deviceVolume => 'Aparato Volumo';

  @override
  String get unavailable => 'Nedisponebla';

  @override
  String get pause => 'Paŭzo';

  @override
  String get syncPosition => 'Sinkronigi Pozicion';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Vico estas malplena';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
  String get bitrateOverride => 'Bitrate Override';

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
  String get player => 'Ludanto';

  @override
  String get container => 'Ujo';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezolucio';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodeko';

  @override
  String get videoBitrate => 'Video Bitrate';

  @override
  String get track => 'Trako';

  @override
  String get channels => 'Kanaloj';

  @override
  String get audioBitrate => 'Audio Bitrate';

  @override
  String get sampleRate => 'Ekzempla indico';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Ekstera';

  @override
  String get embedded => 'Enigita';

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
      'EPUB-bildado en-apo ankoraŭ ne haveblas sur ĉi tiu platformo.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Enigita dokumentoprezento ne haveblas sur ĉi tiu platformo.';

  @override
  String get couldNotOpenExternalViewer =>
      'Ne eblis malfermi eksteran rigardilon.';

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
      'Ankoraŭ neniuj legosignoj.\nFrapu la legosignikon dum legado por konservi vian pozicion.';

  @override
  String get noTableOfContentsAvailable => 'Neniu enhavtabelo havebla';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Pozicio';

  @override
  String get bookReader => 'Libroleganto';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
  String get guideTimeline => 'Gvida Kronologio';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Neniuj kanaloj trovitaj';

  @override
  String get liveBadge => 'VIVU';

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
  String get watch => 'Rigardu';

  @override
  String get close => 'Fermu';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Albumo';

  @override
  String get playAlbum => 'Ludu Albumon';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Serio ne trovita';

  @override
  String get errorLoadingSeries => 'Eraro dum ŝarĝo de serio';

  @override
  String get downloadedEpisodes => 'Elŝutitaj Epizodoj';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
  String get storageManagement => 'Stokado-Administrado';

  @override
  String get storageBreakdown => 'Stokado Panas';

  @override
  String get downloadedItems => 'Elŝutitaj Eroj';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Muziko kaj Aŭdlibroj';

  @override
  String get images => 'Bildoj';

  @override
  String get database => 'Datumbazo';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Agordoj';

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
  String get serverSyncAndPluginStatus => 'Servilo-sinkronigo kaj kromprogramo';

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
  String get integrations => 'Integriĝoj';

  @override
  String get pluginAndRequests => 'Kromaĵo kaj petoj';

  @override
  String get customizeAccountPlaybackInterface =>
      'Agordu konton, reproduktadon kaj interfacan konduton';

  @override
  String optionsCount(int count) {
    return '$count options';
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
  String get backgroundBackdrops => 'Fonaj Fonoj';

  @override
  String get showBackdropImages => 'Montru fonbildojn malantaŭ enhavo';

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
  String get snow => 'Neĝo';

  @override
  String get fireworks => 'Artfajraĵo';

  @override
  String get confetti => 'Konfetoj';

  @override
  String get fallingLeaves => 'Falantaj Folioj';

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
  String get detailsBackgroundBlur => 'Detaloj Fona Blur';

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
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Aŭtomata Tondado';

  @override
  String get stretch => 'Streĉi';

  @override
  String get refreshRateSwitching => 'Refreŝiga Indice Ŝanĝado';

  @override
  String get disabled => 'Malebligita';

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
  String get showDescriptionOnPause => 'Montri Priskribon ĉe Paŭzo';

  @override
  String get dimVideoShowOverview =>
      'Malklarigu videon kaj montru superrigardan tekston dum paŭzo';

  @override
  String get osdLockButton => 'OSD Ŝlosa Butono';

  @override
  String get osdLockButtonDescription =>
      'Montru ŝlosilbutonon, kiu blokas tuŝan enigon ĝis longe premata';

  @override
  String get audioBehavior => 'Aŭdio-Konduto';

  @override
  String get downmixToStereo => 'Downmix al Stereo';

  @override
  String get defaultAudioLanguage => 'Defaŭlta Audio Lingvo';

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
  String get enableTrueHdAudio =>
      'Ebligu TrueHD-audion (eble ne funkcias sur ĉiuj platformoj)';

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
  String get mediaQueuing => 'Media Queuing';

  @override
  String get autoQueueNextEpisodes => 'Aŭtovigu sekvajn epizodojn';

  @override
  String get stillWatchingPrompt => 'Ankoraŭ Rigardas Prompton';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
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
  String get defaultToNoSubtitles => 'Defaŭlte al Neniuj Subtekstoj';

  @override
  String get turnOffSubtitlesByDefault => 'Malŝaltu subtekstojn defaŭlte';

  @override
  String get subtitleSize => 'Subtitolo Grandeco';

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
  String get global => 'Tutmonda';

  @override
  String get desktop => 'Labortablo';

  @override
  String get mobile => 'Poŝtelefono';

  @override
  String get tv => 'televido';

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
  String get customizationProfile => 'Personigo Profilo';

  @override
  String get customizationProfileDescription =>
      'Elektu la profilon por ŝargi, redakti kaj sinkronigi. Tutmonda validas ĉie krom se aparata profilo superregas ĝin. La verda punkto markas vian nunan aparatan profilon.';

  @override
  String get loadProfile => 'Ŝargi Profilon';

  @override
  String get syncing => 'Sinkronigante...';

  @override
  String get syncToProfile => 'Sinkronigi al Profilo';

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
  String get showLibrariesInToolbar => 'Montru Bibliotekojn en Ilobreto';

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
  String get enableFolderView => 'Ebligu Dosierujon';

  @override
  String get showFolderBrowsingOption => 'Montru dosierujan foliumadan opcion';

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
  String get sourceLibraries => 'Fontaj Bibliotekoj';

  @override
  String get sourceCollections => 'Fontaj Kolektoj';

  @override
  String get excludedGenres => 'Ekskluditaj Ĝenroj';

  @override
  String get selectAll => 'Elektu Ĉiujn';

  @override
  String itemsSelected(int count) {
    return '$count selected';
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
  String get localPreviews => 'Lokaj Antaŭrigardoj';

  @override
  String get localPreviewsDescription =>
      'Agordu antaŭfilmojn, amaskomunikilarojn kaj aŭdajn antaŭprezentojn.';

  @override
  String get mediaBarMode => 'Media Bar Stilo';

  @override
  String get mediaBarModeDescription =>
      'Elektu inter Moonfin, MakD aŭ malŝaltu la amaskomunikilaron';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Malŝaltita';

  @override
  String get enableMediaBar => 'Ebligu Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Montru elstaran enhavo-bildaron hejme';

  @override
  String get contentType => 'Enhavo Tipo';

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
  String get latestMedia => 'Plej novaj Amaskomunikiloj';

  @override
  String get recentlyReleased => 'Lastatempe Liberigita';

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
  String get homeSections => 'Hejmaj Sekcioj';

  @override
  String get resetToDefaults => 'Restarigi al defaŭltoj';

  @override
  String get homeRowPosterSize => 'Hejma Vico Afiŝo Grandeco';

  @override
  String get perRowImageTypeSelection => 'Per Vico Bilda Tipo Elekto';

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
  String get perRowImageType => 'Per Vico Bilda Tipo';

  @override
  String get perRowSettings => 'Agordoj por vico';

  @override
  String get autoLogin => 'Aŭtomata Ensaluto';

  @override
  String get lastUser => 'Lasta Uzanto';

  @override
  String get specificUser => 'Specifa Uzanto';

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
  String get logo => 'Logo';

  @override
  String get clock => 'Horloĝo';

  @override
  String get timeout => 'Timeout';

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
  String get showClock => 'Montru Horloĝon';

  @override
  String get displayClockDuringScreensaver => 'Montru horloĝon dum ekranŝparo';

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
  String get pluginLabel => 'Kromaĵo';

  @override
  String get pluginDetected => 'Kromaĵo Detektita';

  @override
  String get pluginNotDetected => 'Kromaĵo Ne Detektita';

  @override
  String get pluginDetectedDescription =>
      'Serla kromaĵo detektita. Sinkronigo estas ebligita aŭtomate la unuan fojon kiam la kromprogramo estas trovita.';

  @override
  String get pluginNotDetectedDescription =>
      'Servila kromaĵo ne estas nuntempe detektita. Lokaj agordoj ankoraŭ uzas siajn konservitajn valorojn aŭ enkonstruitajn defaŭltojn.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Disponeblaj Servoj';

  @override
  String get serverPluginSync => 'Servila Kromaĵo Sync';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkronigi agordojn kun la servila kromaĵo';

  @override
  String get whatSyncControls => 'Kio sinkronigas kontrolojn';

  @override
  String get syncControlsDescription =>
      'Sinkronigi nur kontrolas ĉu kromprogramoj apogitaj agordoj estas puŝitaj al kaj tiritaj de la servilo. Profilelekto kaj profilsinkronigaj agoj estas en Personigo-agordoj kiam kromprogramo sinkronigas estas ebligita.';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Malkovru Vicojn';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Trenu por reordigi. Ebligu aŭ malŝalti vicojn. Ebligitaj vic-ordo sinkronigas kun la kromaĵo Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Trenu por reordigi. Ebligu aŭ malŝalti vicojn.';

  @override
  String get enabled => 'Ebligita';

  @override
  String get hidden => 'Kaŝita';

  @override
  String get aboutTitle => 'Pri';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Malfermfontaj Licencoj';

  @override
  String get sourceCode => 'Fontkodo';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Ĝisdatigi Sciigojn';

  @override
  String get showWhenUpdatesAvailable => 'Montru kiam ĝisdatigoj disponeblas';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get reorderToggleHomeRows => 'Reordu kaj ŝanĝu hejmajn vicojn';

  @override
  String get featuredContentAppearance => 'Elstara enhavo, aspekto';

  @override
  String get posterSizeImageTypeFolderView =>
      'Afiŝo grandeco, bildtipo, dosierujo vido';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, kaj taksaj fontoj';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Klara';

  @override
  String get browse => 'Foliumi';

  @override
  String get noResults => 'Neniuj rezultoj';

  @override
  String get seerrAvailableStatus => 'Disponebla';

  @override
  String get seerrRequestedStatus => 'Petita';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr Agordoj';

  @override
  String get requestMore => 'Petu Pli';

  @override
  String get request => 'Peto';

  @override
  String get cancelRequest => 'Nuligi Peton';

  @override
  String get playInMoonfin => 'Ludu en Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get submitRequest => 'Sendu Peton';

  @override
  String get allSeasons => 'Ĉiuj Sezonoj';

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
    return 'age $age';
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
  String get tmdbScore => 'TMDB-Poentaro';

  @override
  String get releaseDateLabel => 'Eldondato';

  @override
  String get firstAirDateLabel => 'Unua Aera Dato';

  @override
  String get revenueLabel => 'Enspezo';

  @override
  String get runtimeLabel => 'Runtime';

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
  String get general => 'Generalo';

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
  String get next => 'Poste';

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
  String get remote => 'Malproksima';

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
  String get search => 'Serĉu';

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
  String get stop => 'Haltu';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Ruzludo';

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
  String get mute => 'Mute';

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
  String get adminDrawerTranscoding => 'Transkodigo';

  @override
  String get adminDrawerResume => 'Rekomenci';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Ruzludo';

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
  String get adminScanLibraries => 'Skanaj Bibliotekoj';

  @override
  String get adminLibraryScanStarted => 'Biblioteko-skanado komenciĝis';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionNext => 'Poste';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Nun Ludante';

  @override
  String get volume => 'Volumo';

  @override
  String get actions => 'Agoj';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Aŭdiokodeko';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Kompletigo';

  @override
  String get direct => 'Rekta';

  @override
  String get adminDisconnect => 'Malkonekti';

  @override
  String get adminClearDates => 'Klaraj datoj';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Forigi aparaton';

  @override
  String get adminDeviceDeleted => 'Aparato forigita';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Alinomi Biblioteko';

  @override
  String get adminNewName => 'Nova nomo';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Forigi Bibliotekon';

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
  String get adminRemovePath => 'Forigi Vojon';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Biblioteko-opcioj konservitaj';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminSaveOptions => 'Konservi Opciojn';

  @override
  String get adminPreferredMetadataLanguage => 'Preferata metadatuma lingvo';

  @override
  String get adminMetadataLanguageHint => 'ekz. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Landkodo de metadatumoj';

  @override
  String get adminMetadataCountryHint => 'ekz. Usono, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Biblioteko nomo estas postulata';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Biblioteko Nomo';

  @override
  String get adminSelectedPaths => 'Elektitaj Vojetoj:';

  @override
  String get adminNoPathsAdded =>
      'Neniuj vojoj aldonitaj (povas esti aldonitaj poste)';

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
  String get adminUsersLoadFailed => 'Malsukcesis ŝargi uzantojn';

  @override
  String get adminSearchUsers => 'Serĉu uzantojn';

  @override
  String get adminEditUser => 'Redaktu Uzanton';

  @override
  String get adminAddUser => 'Aldoni Uzanton';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Krei Uzanton';

  @override
  String get adminPasswordOptional => 'Pasvorto (laŭvola)';

  @override
  String get adminUsernameRequired => 'Uzantnomo ne povas esti malplena';

  @override
  String get adminNoProfileChanges => 'Neniuj profilŝanĝoj por konservi';

  @override
  String get adminProfileSaved => 'Profilo konservita';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permesoj konservitaj';

  @override
  String get adminPasswordsMismatch => 'Pasvortoj ne kongruas';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Malsukcesis ŝargi uzanton';

  @override
  String get adminBackToUsers => 'Reen al Uzantoj';

  @override
  String get adminSaveProfile => 'Konservi Profilon';

  @override
  String get adminDeleteUser => 'Forigi Uzanton';

  @override
  String get admin => 'Admin';

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
  String get adminAllowContentDeletion => 'Permesu forigon de enhavo';

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
  String get adminRemoteBitrateLimit => 'Fora klienta bitrapida limo (bps)';

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
  String get adminSavePermissions => 'Konservi Permesojn';

  @override
  String get adminEnableAllLibraryAccess => 'Ebligu aliron al ĉiuj bibliotekoj';

  @override
  String get adminSaveAccess => 'Konservu Aliron';

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
  String get adminDeviceAndChannelAccess => 'Aparato & Kanala Aliro';

  @override
  String get adminEnableAllDevices => 'Ebligu aliron al ĉiuj aparatoj';

  @override
  String get adminEnableAllChannels => 'Ebligu aliron al ĉiuj kanaloj';

  @override
  String get adminResetPasswordWarning =>
      'Ĉi tio forigos la pasvorton. La uzanto povos ensaluti sen pasvorto.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Ŝlosilĵetono mankas de servila respondo';

  @override
  String get adminRevokeApiKey => 'Revoki API-Ŝlosilon';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-ŝlosilo revokita';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Kreante sekurkopion...';

  @override
  String get adminBackupCreated => 'Rezervo kreita sukcese';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Rezerva vojo mankas en servila respondo';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmu Restarigon';

  @override
  String get adminRestoringBackup => 'Restarigante sekurkopion...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Serĉu en protokolo';

  @override
  String get adminNoMatchingLines => 'Neniuj kongruaj linioj';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Neniuj planitaj taskoj trovitaj';

  @override
  String get adminNoTasksMatchFilter =>
      'Neniuj taskoj kongruas kun la nuna filtrilo';

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
  String get adminRunNow => 'Kuru Nun';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
  String get adminTimeLimit => 'Tempolimo (laŭvola)';

  @override
  String get adminNoLimit => 'Neniu limo';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Tago de semajno';

  @override
  String get adminSearchPlugins => 'Serĉu kromaĵojn...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Malinstali kromprogramon';

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
      'Neniuj kromprogramoj kongruas kun via serĉo';

  @override
  String get adminNoPluginsInstalled => 'Neniuj kromprogramoj instalitaj';

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
      'Ne eblas malfermi agordojn: mankas aŭth-signon.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Kromaĵo ne trovita';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'ekz. Jellyfin Stalo';

  @override
  String get adminRepositoryUrl => 'Deponejo URL';

  @override
  String get adminAddEntry => 'Aldonu eniron';

  @override
  String get adminInvalidUrl => 'Nevalida URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBrandingSaved => 'Markaj agordoj konservitaj';

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
  String get adminStreamingSaved => 'Elfluaj agordoj konservitaj';

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
  String get adminPlaybackSaved => 'Reproduktaj agordoj konservitaj';

  @override
  String get adminPlaybackLoadFailed =>
      'Malsukcesis ŝargi reproduktajn agordojn';

  @override
  String get adminPlaybackTranscoding => 'Reproduktado / Transkodigo';

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
  String get adminTrickplaySaved => 'Trickplay-agordoj konservitaj';

  @override
  String get adminTrickplayLoadFailed =>
      'Malsukcesis ŝargi trukludajn agordojn';

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
  String get adminResumeSaved => 'Rekomencu agordojn konservitajn';

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
  String get adminNetworkingSaved =>
      'Retaj agordoj konservitaj. Eble necesas rekomenco de servilo.';

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
  String get adminBaseUrlHint => 'ekz. /mezulo';

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
  String get adminMetadataSaved => 'Metadatumoj konservitaj';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Refreŝigi Metadatumojn';

  @override
  String get recursive => 'Rekursiva';

  @override
  String get adminReplaceAllMetadata => 'Anstataŭigi ĉiujn metadatumojn';

  @override
  String get adminReplaceAllImages => 'Anstataŭigu ĉiujn bildojn';

  @override
  String get adminMetadataRefreshRequested => 'Refreŝigo de metadatumoj petis';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Serĉu Foran Personon';

  @override
  String get adminNoRemoteMatches => 'Neniuj foraj kongruoj trovitaj';

  @override
  String get adminRemoteResults => 'Foraj Rezultoj';

  @override
  String get adminRemoteMetadataApplied => 'Foraj metadatenoj aplikitaj';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Ĝisdatigu Enhavan Tipon';

  @override
  String get adminContentType => 'Enhavo tipo';

  @override
  String get adminContentTypeUpdated => 'Enhavo-tipo ĝisdatigita';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nesubtenata bildformato';

  @override
  String get adminImageReadFailed => 'Malsukcesis legi elektitan bildon';

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
  String get adminAllProviders => 'Ĉiuj provizantoj';

  @override
  String get adminNoRemoteImages => 'Neniuj malproksimaj bildoj trovitaj';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Aldonu Agordilon';

  @override
  String get adminTunerType => 'Tuner Tipo';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Aliaj';

  @override
  String get adminUrlPath => 'URL / Vojo';

  @override
  String get adminNameOptional => 'Nomo (laŭvola)';

  @override
  String get adminTunerAdded => 'Tuner aldonis';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Aldonu Gvidprovizanton';

  @override
  String get adminProviderType => 'Tipo de provizanto';

  @override
  String get adminProviderTypeHint => 'HorarojDirect aŭ XMLTV';

  @override
  String get adminUsernameOptional => 'Uzantnomo (laŭvola)';

  @override
  String get adminRefreshInterval => 'Refreŝiga intervalo (horoj)';

  @override
  String get adminProviderAdded => 'Provizanto aldonis';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Agordilo estas petita';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Registradaj Agordoj';

  @override
  String get adminPrePadding => 'Antaŭplenigo (minutoj)';

  @override
  String get adminPostPadding => 'Postplenigo (minutoj)';

  @override
  String get adminRecordingPath => 'Vojo de registrado';

  @override
  String get adminSeriesRecordingPath => 'Seria registra vojo';

  @override
  String get adminRecordingSettingsSaved => 'Registradaj agordoj konservitaj';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Agordu Kanalajn Mapojn';

  @override
  String get adminMappingJson => 'Mapado de JSON';

  @override
  String get adminMappingJsonHint => 'Ekzemplo: mapadoj JSON utila ŝarĝo';

  @override
  String get adminChannelMappingsUpdated => 'Kanalaj mapadoj ĝisdatigitaj';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Aldoni Provizanto';

  @override
  String get adminNoListingProviders => 'Neniuj listigitaj provizantoj agordis';

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
  String get adminChannelMappings => 'Kanalaj Mapoj';

  @override
  String get adminNoDiscoveredTuners => 'Ankoraŭ neniuj malkovritaj agordiloj';

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
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Restarigo petita. Servila rekomenco povas malkonekti ĉi tiun seancon.';

  @override
  String get adminBackupsTitle => 'Rezervoj';

  @override
  String get adminUnknownDate => 'Nekonata dato';

  @override
  String get adminUnnamedBackup => 'Nenomita Rezervo';

  @override
  String get adminLiveTvNotAvailable =>
      'Viva TV-administrado ne disponeblas en ĉi tiu servila konstruo.';

  @override
  String get adminLiveTvTitle => 'Live TV Administrado';

  @override
  String get adminApply => 'Apliki';

  @override
  String get adminNotSet => 'Ne fiksita';

  @override
  String get adminReset => 'Restarigi';

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
  String get adminLogViewerNoMatches => 'Neniuj kongruaj linioj';

  @override
  String get adminMetadataEditorTitle => 'Redaktilo de metadatumoj';

  @override
  String get adminMetadataRemote => 'Malproksima';

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
  String get adminMetadataFieldTagline => 'Slogano';

  @override
  String get adminMetadataFieldOverview => 'Superrigardo';

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
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Standardo';

  @override
  String get adminMetadataImageThumb => 'Dikfingro';

  @override
  String get adminMetadataRecursive => 'Rekursiva';

  @override
  String get adminMetadataProvider => 'Provizanto';

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
      'Malsukcesis legi elektitan bildon';

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
      'Ĉi tio forigas la nunan bildon de la ero.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
  String get adminPluginsNoSearchResults =>
      'Neniuj kromprogramoj kongruas kun via serĉo';

  @override
  String get adminPluginsNoneInstalled => 'Neniuj kromprogramoj instalitaj';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Neniuj pakoj kongruas kun via serĉo';

  @override
  String get adminPluginsCatalogEmpty => 'Neniuj pakoj haveblaj';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Forigi Deponejon';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Forigi';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminNetworkingRemoteAccess => 'Ebligu foran aliron';

  @override
  String get adminNetworkingPorts => 'Havenoj';

  @override
  String get adminNetworkingHttpPort => 'HTTP-haveno';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-haveno';

  @override
  String get adminNetworkingEnableHttps => 'Ebligu HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Loka Reto';

  @override
  String get adminNetworkingLocalAddresses => 'Lokaj retaj adresoj';

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
  String get adminPlaybackHwAccel => 'Aparataro Akcelo';

  @override
  String get adminPlaybackHwAccelLabel => 'Akcelado de aparataro';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ebligu aparatan kodigon';

  @override
  String get adminPlaybackEnableHwDecoding => 'Ebligu aparatan malkodigon por:';

  @override
  String get adminPlaybackEncoding => 'Kodigado';

  @override
  String get adminPlaybackEncodingThreads => 'Kodi fadenojn';

  @override
  String get adminPlaybackFallbackFont => 'Ebligu rezervan tiparon';

  @override
  String get adminPlaybackFallbackFontPath => 'Retipara vojo';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Aŭdlibroj';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimuma aŭdlibro-rekomenca procento';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimuma aŭdlibro-rekomencprocento';

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
  String get adminTaskStop => 'Haltu';

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
  String get adminTaskTriggerEvery6Hours => 'Ĉiujn 6 horojn';

  @override
  String get adminTaskTriggerEvery12Hours => 'Ĉiujn 12 horojn';

  @override
  String get adminTaskTriggerEvery24Hours => 'Ĉiujn 24 horojn';

  @override
  String get adminTaskTriggerEvery2Days => 'Ĉiujn 2 tagojn';

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
  String get adminTaskTriggerTime => 'Tempo';

  @override
  String get adminTaskTriggerNoLimit => 'Neniu limo';

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
    return '${days}d';
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
  String get adminNetworkingBaseUrlHint => 'ekz. /mezulo';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Vojo de atestilo';

  @override
  String get adminNetworkingRemoteIpFilter => 'Fora IP-Filtrilo';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Malrapida responda sojlo (ms)';

  @override
  String get adminGeneralCachePath => 'Cache vojo';

  @override
  String get adminGeneralMetadataPath => 'Metadatuma vojo';

  @override
  String get adminGeneralServerName => 'Servilonomo';

  @override
  String get adminSettingsLoadFailed => 'Malsukcesis ŝargi agordojn';

  @override
  String get adminDiscover => 'Malkovru';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-aliro malakceptita';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Vi ne havas aliron al unu aŭ pluraj eroj en ĉi tiu SyncPlay-grupo. Petu al la grupposedanto kontroli bibliotekajn permesojn aŭ elekti alian vicon.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Detektu vicojn elmontritajn per la kromaĵo \"Hejkranaj Sekcioj\" de IAmParadox27. Vicoj povas esti ebligitaj kaj reordigeblaj sube.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Ankoraŭ neniuj Jellyfin-serviloj raportantaj la kromaĵon.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detektu vicojn agorditajn per la kromaĵo \"KefinTweaks\" de ranaldsgift. Propraj sekcioj, lastatempe liberigitaj, rigardataj denove, laŭsezonaj, kaj lastatempe aldonitaj en biblioteko estas spegulitaj de la KefinTweaks-agordo sur ĉiu Jellyfin-servilo.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Ankoraŭ neniuj Jellyfin-serviloj raportantaj KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Malfermu Hejmajn Sekciojn';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ebligu, malŝaltu kaj reordigu vicojn';

  @override
  String get integrationInstalledButDisabled => 'Instalita sed malŝaltita';

  @override
  String get integrationNotInstalled => 'Ne instalita';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fora Reproduktado';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Aparato Volumo';

  @override
  String get castVolumeUnavailable => 'Nedisponebla';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Malĝusta PIN';

  @override
  String get pinMismatch => 'PIN-oj ne kongruas';

  @override
  String get pinForgot => 'Ĉu vi forgesis PIN?';

  @override
  String get pinClear => 'Klara';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Peto de Rapida Konekto rajtigita.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Rapida Konekto-kodo estas nevalida aŭ eksvalidiĝis.';

  @override
  String get quickConnectNotSupported =>
      'Rapida Konekto ne estas subtenata sur ĉi tiu servilo.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Malsukcesis rajtigi Quick Connect-kodon.';

  @override
  String get quickConnectDisabled =>
      'Rapida Konekto estas malŝaltita en ĉi tiu servilo.';

  @override
  String get quickConnectForbidden =>
      'Via konto ne povas rajtigi ĉi tiun peton de Rapida Konekto.';

  @override
  String get quickConnectNotFound =>
      'Rapida Konekto-kodo ne estis trovita. Provu novan kodon.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Enigu kodon';

  @override
  String get quickConnectAuthorize => 'Rajtigi';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Neniuj foraj reproduktaj aparatoj haveblaj.';

  @override
  String get noRemoteDevicesIos =>
      'Neniuj foraj reproduktaj aparatoj haveblaj.\n\nEn iOS, AirPlay-celoj povas esti neatingeblaj en la simulilo.';

  @override
  String get trackActionPlayNext => 'Ludu Poste';

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
    return 'Downloading $name...';
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
  String get upNext => 'Up Next';

  @override
  String get playNext => 'Ludu Poste';

  @override
  String get stillWatchingContent =>
      'La reprodukto estas paŭzita. Ĉu vi ankoraŭ rigardas?';

  @override
  String get stillWatchingStop => 'Haltu';

  @override
  String get stillWatchingContinue => 'Daŭrigu';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Viva televido';

  @override
  String get continueWatchingAndNextUp => 'Daŭrigu Rigardi kaj Poste';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPlaybackQuality => 'Bitrate';

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
  String get settingsAdministrationSubtitle =>
      'Aliru la servilan administradan panelon';

  @override
  String get settingsAccountSecurity => 'Konto kaj Sekureco';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Aŭtentigo, PIN-kodo kaj gepatra kontrolo';

  @override
  String get settingsPersonalization => 'Personigo';

  @override
  String get settingsPersonalizationSubtitle =>
      'Temo, navigado, hejmaj vicoj kaj bibliotekvidebleco';

  @override
  String get settingsDynamicContent => 'Dinamika Enhavo';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Trinkejo kaj vidaj supermetaĵoj';

  @override
  String get settingsPlaybackSyncplay => 'Reproduktado & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Aŭdio/video agordoj, subtekstoj, elŝutoj, kaj SyncPlay kontroloj';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinkronigo de kromprogramoj, Seerr, taksoj kaj pli';

  @override
  String get settingsAboutSubtitle => 'App-versio, juraj informoj kaj kreditoj';

  @override
  String get settingsAuthenticationSection => 'AUTENTICO';

  @override
  String get settingsSortServersBy => 'Ordigi Servilojn Laŭ';

  @override
  String get settingsLastUsed => 'Laste Uzita';

  @override
  String get settingsAlphabetical => 'Alfabeta';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVATECO & SEKURECO';

  @override
  String get settingsBlockedRatings => 'Blokitaj Taksoj';

  @override
  String get settingsGeneralStyle => 'Ĝenerala Stilo';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Temaj akĉentoj, fonoj, spektitaj indikiloj kaj temomuziko';

  @override
  String get settingsHomePage => 'Hejmpaĝo';

  @override
  String get settingsHomePageSubtitle =>
      'Sekcioj, bildspecoj, supermetaĵoj kaj amaskomunikilaj antaŭrigardoj';

  @override
  String get settingsLibrariesSubtitle =>
      'Biblioteko videbleco, dosierujo vido, kaj plur-servila konduto';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'Montru la butonon de bibliotekoj en la navigadbreto';

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
  String get settingsMetadataAndRatings => 'Metadatumoj kaj Taksoj';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase funkciigas servilflankajn integriĝojn inkluzive de kromaj taksaj fontoj, Seerr-petoj kaj sinkronigitaj preferoj.';

  @override
  String get settingsOfflineDownloads => 'Senkonektaj Elŝutoj';

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
  String get settingsSupportMoonfinSubtitle =>
      'Stelu la projekton en GitHub aŭ kontribuu';

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
  String get settingsPoweredByFlutter => 'Funkciigita de Flutter';

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
  String get settingsBoth => 'Ambaŭ';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Miksi Enhavan Tipon Filtrilon';

  @override
  String get settingsVideoPlaybackPreferences => 'Preferoj de Videoludado';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Kerna videomotoro kaj streaming-kvalitaj agordoj';

  @override
  String get settingsAudioPreferences => 'Sonaj Preferoj';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Sondaj spuroj, prilaborado kaj trapasaj elektoj';

  @override
  String get settingsAutomationAndQueue => 'Aŭtomatigo & Vico';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Aŭtomatigita reproduktado kaj sinsekvo';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kvalito de elŝutoj, limoj de konservado kaj grandeco de vosto';

  @override
  String get settingsSyncplaySubtitle =>
      'Sinkroniga logiko por grupaj kunsidoj';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specialaj ludantaj trajtoj. Uzu singarde, ĉar iuj opcioj povas kaŭzi problemojn pri reprodukto';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ĉu preterpasi enkondukojn kaj aliajn?';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (heredaĵo)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
