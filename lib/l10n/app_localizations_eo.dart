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
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Ensalutu';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Konektante al $serverName';
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
    return 'QuickConnect nedisponebla: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nedisponebla ($status): $detail';
  }

  @override
  String get whosWatching => 'Kiu rigardas?';

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
      'Ŝanĝu inter Moonfin kaj Neon Pulse sen rekomenci la apon';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Preferas sisteman klavaron';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Uzu vian aparatan enigmetodon defaŭlte por tekstoenigo';

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
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

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
    return 'Ne eblas konekti al $target';
  }

  @override
  String get exitApp => 'Eliri Moonfin?';

  @override
  String get exitAppConfirmation => 'Ĉu vi certas, ke vi volas eliri?';

  @override
  String get exit => 'Eliro';

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
    return '$count titoloj';
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
  String get noBooksFound => 'Neniuj libroj trovitaj por ĉi tiu aŭtoro.';

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
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Finiĝas ĉe $time';
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
  String get trailers => 'Antaŭfilmoj';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'SKRIBOJ';

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
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count elŝutas';
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
  String get guideTimeline => 'Gvida Kronologio';

  @override
  String failedToLoadGuide(String error) {
    return 'Malsukcesis ŝargi gvidilon: $error';
  }

  @override
  String get noChannelsFound => 'Neniuj kanaloj trovitaj';

  @override
  String get liveBadge => 'VIVU';

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
  String get record => 'Rekordo';

  @override
  String get cancelRecordingAction => 'Nuligi Registradon';

  @override
  String get programSetToRecord => 'Programo agordita por registri';

  @override
  String get recordingCancelled => 'Registrado nuligita';

  @override
  String get unableToCreateRecording => 'Ne eblas krei registradon';

  @override
  String get watch => 'Rigardu';

  @override
  String get close => 'Fermu';

  @override
  String failedToPlayChannel(String name) {
    return 'Malsukcesis ludi $name';
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
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temo Muziko sur Hejmaj Vicoj';

  @override
  String get playWhenBrowsingHomeScreen => 'Ludu dum foliumas hejman ekranon';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

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
  String get settingsAudioOutputMode => 'Reĝimo de Aŭdio-Eligo';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Trapaso';

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
  String get settingsAudioPassthroughAdvanced => 'Trapaso (Altnivela)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ebligu nur formatojn, kiujn via AVR aŭ HDMI-lavujo subtenas.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Trapaso';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Trapaso';

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
      'Bitstream Dolby Digital Plus (EAC3) al ekstera malĉifrilo.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos super EAC3 (JOC) al ekstera malĉifrilo.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (inkludas DTS-kernon) al ekstera malĉifrilo.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD kun Atmos-metadatenoj al ekstera malĉifrilo.';

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
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnozo';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Nivelo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Gamo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitolo Kodeko';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Permesitaj Aŭdiokodekoj';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Aŭdiokodekoj';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Aŭdiokodekoj';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktiva Aŭdio-Itinero';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Voja HD Audio-Subteno';

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
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
  String get localPreviews => 'Lokaj Antaŭrigardoj';

  @override
  String get localPreviewsDescription =>
      'Agordu antaŭfilmojn, amaskomunikilarojn kaj aŭdajn antaŭprezentojn.';

  @override
  String get mediaBarMode => 'Media Bar Stilo';

  @override
  String get mediaBarModeDescription =>
      'Elektu inter diversaj stiloj de amaskomunikila breto, aŭ malŝaltu la amaskomunikilan breton';

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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Per Vico Bilda Tipo';

  @override
  String get perRowSettings => 'Agordoj por vico';

  @override
  String get autoLogin => 'Aŭtomata Ensaluto';

  @override
  String get lastUser => 'Lasta Uzanto';

  @override
  String get currentUser => '';

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
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
    return '$status\nVersio: $version';
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
  String get seerrDiscoveryRows => '';

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
    return 'Ensalutinta kiel: $username';
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
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Eroj';
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
    return 'Petite de $name';
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
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

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
  String adminRecentAlertEntries(int count) {
    return 'Lastatempaj avertaj/eraraj enskriboj: $count';
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
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

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
  String get adminLibraryOptionsSaved => 'Biblioteko-opcioj konservitaj';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Malsukcesis konservi opciojn: $error';
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
  String get adminNoProfileChanges => 'Neniuj profilŝanĝoj por konservi';

  @override
  String get adminProfileSaved => 'Profilo konservita';

  @override
  String adminSaveFailed(String error) {
    return 'Malsukcesis konservi: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permesoj konservitaj';

  @override
  String get adminPasswordsMismatch => 'Pasvortoj ne kongruas';

  @override
  String adminFailed(String error) {
    return 'Malsukcesis: $error';
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
  String get adminTimeLimit => 'Tempolimo (laŭvola)';

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
  String get adminMissingAuthToken =>
      'Ne eblas malfermi agordojn: mankas aŭth-signon.';

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
    return 'Malsukcesis ŝargi metadatenojn: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Malsukcesis konservi metadatenojn: $error';
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
    return 'Malsukcesis aldoni agordilon: $error';
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
    return 'Malsukcesis aldoni provizanton: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Malsukcesis forigi agordilon: $error';
  }

  @override
  String get adminTunerResetRequested => 'Agordilo estas petita';

  @override
  String adminTunerResetFailed(String error) {
    return 'Malsukcesis restarigi agordilon: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Malsukcesis forigi provizanton: $error';
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
  String get adminRecordingSettingsSaved => 'Registradaj agordoj konservitaj';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Malsukcesis konservi agordojn: $error';
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
    return 'Malsukcesis ĝisdatigi mapadojn: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Aldoni Provizanto';

  @override
  String get adminNoListingProviders => 'Neniuj listigitaj provizantoj agordis';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Registradvojo: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Seria vojo: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Antaŭplenigo: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Postplenigo: $minutes min';
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
    return 'Ĉu restarigi sekurkopion $name nun?';
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
  String get adminMetadataIdentify => 'Identify';

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
  String get adminPluginsNoSearchResults =>
      'Neniuj kromprogramoj kongruas kun via serĉo';

  @override
  String get adminPluginsNoneInstalled => 'Neniuj kromprogramoj instalitaj';

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
  String get adminPlaybackHwAccel => 'Aparataro Akcelo';

  @override
  String get adminPlaybackHwAccelLabel => 'Akcelado de aparataro';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ebligu aparatan kodigon';

  @override
  String get adminPlaybackEnableHwDecoding => 'Ebligu aparatan malkodigon por:';

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
  String get adminRunningTasks => 'Running Tasks';

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
  String adminTaskTriggerInterval(String duration) {
    return 'Ĉiu $duration';
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
    return 'Malsukcesis ĝisdatigi enhavtipon: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Malrapida responda sojlo (ms)';

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
      other: '# rows discovered',
      one: '# row discovered',
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
    return 'Rapida Konekto malsukcesis: $message';
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
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

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
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

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
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

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
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (heredaĵo)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (heredaĵo)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (rekomendita)';

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
    return 'Plej nova $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
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
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title => 'Mapu Dolby Vision profilon 7 al HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Ludu Dolby Vision profilon 7 fluojn kiel HDR10-kongrua HEVC sur ne-DV-aparatoj.';

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
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

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
  String get rowsType => 'Vicoj Tipo';

  @override
  String get rowsTypeDescription =>
      'Klasika konservas po-vican bildspecon kaj informan tegmenton. Modernaj uzoj portret-al-fono vicoj.';

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
  String get genresRowItems => 'Ĝenroj Vico Eroj';

  @override
  String get genresRowItemsDescription =>
      'Montru Filmojn, Seriojn aŭ ambaŭ en Ĝenraj vicoj.';

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
  String get appearance => 'Aspekto';

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
  String get cardSize => 'Karto Grandeco';

  @override
  String get externalPlayerApp => 'Ekstera ludanta aplikaĵo';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Montru aplikan elektilon kiam reproduktado komenciĝas.';

  @override
  String get loadingInstalledPlayers => 'Ŝargante instalitajn ludantojn...';

  @override
  String get connection => 'Konekto';

  @override
  String get audioTranscodeTarget => 'Aŭdio Transkoda Celo';

  @override
  String get passthrough => 'Trapaso';

  @override
  String get supportedOnThisDevice => 'Subtenata sur ĉi tiu aparato';

  @override
  String get notSupportedOnThisDevice => 'Ne Subtenata sur ĉi tiu aparato';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Trapaso';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) al ekstera malĉifrilo.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD kun Atmos (JOC) Passthrough';

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
  String get useExternalPlayer => 'Uzu eksteran ludilon';

  @override
  String get useExternalPlayerSubtitle =>
      'Malfermu videoludadon en via elektita ekstera programo en Android TV.';

  @override
  String get automaticQueuing => 'Aŭtomata Vidovico';

  @override
  String get preferSdhSubtitles => 'Preferu SDH-subtekstojn';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorigu SDH/CC-subtitolojn dum aŭtomata elekto.';

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
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Rigardu kun grupo';

  @override
  String get errors => 'Eraroj';

  @override
  String get warnings => 'Avertoj';

  @override
  String get disk => 'Disko';

  @override
  String get openInBrowser => 'Malfermu en Retumilo';

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
  String get passwordSet => 'Pasvorto fiksita';

  @override
  String get noPasswordConfigured => 'Neniu pasvorto agordita';

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
      other: '$count Libraries',
      one: '1 Library',
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
  String get adminDrawerSectionServer => 'Servilo';

  @override
  String get adminDrawerSectionPlayback => 'Reproduktado';

  @override
  String get adminDrawerSectionDevices => 'Aparatoj';

  @override
  String get adminDrawerSectionAdvanced => 'Altnivela';

  @override
  String get adminDrawerSectionPlugins => 'Kromaĵoj';

  @override
  String get adminDrawerSectionLiveTv => 'Viva televido';

  @override
  String get homeVideos => 'Hejmaj Videoj';

  @override
  String get mixedContent => 'Miksita Enhavo';

  @override
  String get homeVideosAndPhotos => 'Hejmaj Videoj kaj Fotoj';

  @override
  String get mixedMoviesAndShows => 'Miksitaj Filmoj kaj Spektakloj';

  @override
  String get intelQuickSync => 'Intel Rapida Sinkronigo';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Fermu ĝenran panelon';

  @override
  String get loadingShuffle => 'Ŝargante miksadon...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Aŭtomata HDR Ŝanĝo';

  @override
  String get autoHdrSwitchingDescription =>
      'Aŭtomate ebligu HDR por HDR-video-reproduktado kaj restarigu ekranreĝimon ĉe eliro.';

  @override
  String get whenFullscreen => 'Kiam plenekrana';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Transkodigaj Limoj';

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
