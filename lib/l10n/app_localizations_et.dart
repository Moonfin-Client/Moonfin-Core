// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Kuufin';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Logi sisse';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Ühenduse loomine aadressiga $serverName';
  }

  @override
  String get quickConnect => 'Kiirühendus';

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
  String get waitingForAuthorization => 'Autoriseerimise ootel...';

  @override
  String get back => 'Tagasi';

  @override
  String get serverUnavailable => 'Server pole saadaval';

  @override
  String get loginFailed => 'Sisselogimine ebaõnnestus';

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
      'Lülitage Moonfini ja Neon Pulse vahel ilma rakendust taaskäivitamata';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Eelista süsteemiklaviatuuri';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Kasutage teksti sisestamiseks vaikimisi seadme sisestusmeetodit';

  @override
  String get themeMoonfin => 'Kuufin';

  @override
  String get themeMoonfinSubtitle =>
      'Praegune Moonfin välimus, mida olete kõik armastama hakanud';

  @override
  String get themeNeonPulse => 'Neoonpulss';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stiil magenta sära, tsüaani teksti ja tugevama kroomitud kontrastiga';

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
  String get series => 'seeria';

  @override
  String get noItemsFound => 'Üksusi ei leitud';

  @override
  String get home => 'Kodu';

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
  String get library => 'Raamatukogu';

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
  String get artists => 'Kunstnikud';

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
  String get pickDiscoverySubjects =>
      'Valige, milliseid teemavooge Discoveris kuvada.';

  @override
  String get apply => 'Rakenda';

  @override
  String get openLink => 'Ava link';

  @override
  String get scanWithYourPhone => 'Skannige oma telefoniga';

  @override
  String get audiobookGenres => 'Audioraamatu žanrid';

  @override
  String get pickAudiobookGenres =>
      'Valige, milliseid žanre Audiobook Discoveris kuvada.';

  @override
  String get discoverAudiobooks => 'Avastage heliraamatuid';

  @override
  String get librivoxDescription =>
      'LibriVoxi populaarsed üldkasutatavad pealkirjad.';

  @override
  String titlesCount(int count) {
    return '$count pealkirjad';
  }

  @override
  String get scrollLeft => 'Kerige vasakule';

  @override
  String get scrollRight => 'Kerige paremale';

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
  String get trendingTitlesOpenLibrary =>
      'Populaarsed pealkirjad teemade kaupa Open Libraryst.';

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
  String get watched => 'Vaadati';

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
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lugude loend';

  @override
  String get itemListPlaceholder => 'Siin kuvatakse üksuste loend';

  @override
  String get favoriteTracksPlaceholder => 'Siin kuvatakse lemmiklood';

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
  String get seasons => 'Aastaajad';

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
  String get noBooksFound => 'Selle autori jaoks ei leitud ühtegi raamatut.';

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
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Lõpeb $time';
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
  String get trailers => 'Haagised';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
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
  String get play => 'Mängi';

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
  String get none => 'Mitte ühtegi';

  @override
  String get downloadSubtitlesLabel => 'Laadi alla subtiitrid...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Otsige OpenSubtitlesi pistikprogrammi abil';

  @override
  String get downloadSubtitles => 'Laadige alla subtiitrid';

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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'KIRJANIKUD';

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
  String get shuffle => 'Segamine';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count allalaadimised';
  }

  @override
  String get perfectMatch => 'Ideaalne sobivus';

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
  String get bitrateOverride => 'Bitikiiruse alistamine';

  @override
  String get audioDelay => 'Heli viivitus';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Mängija';

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
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Video bitikiirus';

  @override
  String get track => 'Rada';

  @override
  String get channels => 'Kanalid';

  @override
  String get audioBitrate => 'Heli bitikiirus';

  @override
  String get sampleRate => 'Proovi sagedus';

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
  String get guideTimeline => 'Juhend ajaskaala';

  @override
  String failedToLoadGuide(String error) {
    return 'Juhendi laadimine ebaõnnestus: $error';
  }

  @override
  String get noChannelsFound => 'Ühtegi kanalit ei leitud';

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
  String get record => 'Salvestus';

  @override
  String get cancelRecordingAction => 'Tühista salvestamine';

  @override
  String get programSetToRecord => 'Programm on seadistatud salvestama';

  @override
  String get recordingCancelled => 'Salvestamine tühistati';

  @override
  String get unableToCreateRecording => 'Salvestist ei saa luua';

  @override
  String get watch => 'Vaata';

  @override
  String get close => 'Sule';

  @override
  String failedToPlayChannel(String name) {
    return '$name esitamine nurjus';
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
  String get seerrAccountType => 'Nägija konto tüüp';

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
    return 'S$season E$episode';
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
    return 'S$number';
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
      other: '$count episodes',
      one: '1 episode',
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
  String get serverSyncAndPluginStatus =>
      'Serveri sünkroonimine ja pistikprogrammi olek';

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
  String get integrations => 'Integratsioonid';

  @override
  String get pluginAndRequests => 'Plugin ja taotlused';

  @override
  String get customizeAccountPlaybackInterface =>
      'Kohandage konto, taasesituse ja liidese käitumist';

  @override
  String optionsCount(int count) {
    return '$count valikud';
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
  String get backgroundBackdrops => 'Tausta taustad';

  @override
  String get showBackdropImages => 'Kuva sisu taga taustapildid';

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
  String get snow => 'Lumi';

  @override
  String get fireworks => 'Ilutulestik';

  @override
  String get confetti => 'Konfettid';

  @override
  String get fallingLeaves => 'Langevad lehed';

  @override
  String get themeMusic => 'Teema Muusika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Esitage teemamuusikat üksikasjade lehtedel';

  @override
  String get themeMusicVolume => 'Teema muusika helitugevus';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Teemamuusika koduridadel';

  @override
  String get playWhenBrowsingHomeScreen => 'Esita avakuva sirvimisel';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'Üksikasjad Tausta hägu';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get fit => 'Sobivad';

  @override
  String get autoCrop => 'Automaatne kärpimine';

  @override
  String get stretch => 'Venitada';

  @override
  String get refreshRateSwitching => 'Värskendussageduse vahetamine';

  @override
  String get disabled => 'Keelatud';

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
  String get showDescriptionOnPause => 'Kuva kirjeldus pausil';

  @override
  String get dimVideoShowOverview =>
      'Hämardage video ja kuvage ülevaateteksti peatamise ajal';

  @override
  String get osdLockButton => 'OSD lukustusnupp';

  @override
  String get osdLockButtonDescription =>
      'Kuva lukustusnupp, mis blokeerib puutesisendi, kuni seda pikalt vajutatakse';

  @override
  String get audioBehavior => 'Heli käitumine';

  @override
  String get downmixToStereo => 'Mikserda alla stereoks';

  @override
  String get defaultAudioLanguage => 'Heli vaikekeel';

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
  String get enableTrueHdAudio =>
      'Luba TrueHD heli (ei pruugi kõigil platvormidel töötada)';

  @override
  String get settingsAudioOutputMode => 'Heli väljundrežiim';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Heli varukoodek';

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
  String get settingsAudioPassthroughAdvanced => 'Läbimine (täpsem)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Lubage ainult vormingud, mida teie AVR- või HDMI-pistikupesa toetab.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 läbipääs';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) läbipääs';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA läbilaskevõime';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitivoog Dolby Digital Plus (EAC3) välisele dekoodrile.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitivoog Dolby Atmos üle EAC3 (JOC) välisele dekoodrile.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitivoog DTS-HD MA (sisaldab DTS-tuuma) välisele dekoodrile.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD koos Atmose metaandmetega välisele dekoodrile.';

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
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video tase';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videovahemik';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtiitrite kodek';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Lubatud helikoodekid';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS helikoodekid';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 helikoodekid';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif läbipääs';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktiivne heli marsruut';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Marsruudi HD-heli tugi';

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
  String get nextUpTimeout => 'Next Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
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
  String get defaultToNoSubtitles => 'Vaikimisi Subtiitreid pole';

  @override
  String get turnOffSubtitlesByDefault => 'Lülitage subtiitrid vaikimisi välja';

  @override
  String get subtitleSize => 'Subtiitrite suurus';

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
  String get customizationProfile => 'Kohandamise profiil';

  @override
  String get customizationProfileDescription =>
      'Valige laadimiseks, muutmiseks ja sünkroonimiseks profiil. Globaalne kehtib kõikjal, välja arvatud juhul, kui seadme profiil seda alistab. Roheline punkt tähistab teie praegust seadme profiili.';

  @override
  String get loadProfile => 'Laadi profiil';

  @override
  String get syncing => 'Sünkroonimine...';

  @override
  String get syncToProfile => 'Sünkrooni profiiliga';

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
  String get showLibrariesInToolbar => 'Näita teeke tööriistaribal';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get enableFolderView => 'Luba kaustavaade';

  @override
  String get showFolderBrowsingOption => 'Kuva kaustade sirvimise valik';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
  String get localPreviews => 'Kohalikud eelvaated';

  @override
  String get localPreviewsDescription =>
      'Treileri, meedia ja heli eelvaate seadistamine.';

  @override
  String get mediaBarMode => 'Meediumiriba stiil';

  @override
  String get mediaBarModeDescription =>
      'Valige erinevate meediariba stiilide vahel või lülitage meediariba välja';

  @override
  String get mediaBarModeMoonfin => 'Kuufin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Väljas';

  @override
  String get enableMediaBar => 'Luba meediariba';

  @override
  String get showFeaturedContentSlideshow =>
      'Kuva esiletõstetud sisu slaidiseanss kodus';

  @override
  String get contentType => 'Sisu tüüp';

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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get latestMedia => 'Uusim meedia';

  @override
  String get recentlyReleased => 'Hiljuti välja antud';

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
  String get homeSections => 'Avaleht Sektsioonid';

  @override
  String get resetToDefaults => 'Lähtestage vaikeseadetele';

  @override
  String get homeRowPosterSize => 'Kodurea plakati suurus';

  @override
  String get perRowImageTypeSelection => 'Pilditüübi valik rea kohta';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigureerige iga lubatud kodurea pilditüüp';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Ühendage Jätka vaatamist ja Edasi';

  @override
  String get combineBothRows => 'Ühendage mõlemad read üheks koduosaks';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Rea pilditüübi kohta';

  @override
  String get perRowSettings => 'Reapõhised sätted';

  @override
  String get autoLogin => 'Automaatne sisselogimine';

  @override
  String get lastUser => 'Viimane kasutaja';

  @override
  String get currentUser => '';

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
  String get showClock => 'Näita kella';

  @override
  String get displayClockDuringScreensaver => 'Kuva kella ekraanisäästja ajal';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Tuvastati plugin';

  @override
  String get pluginNotDetected => 'Pluginat ei tuvastatud';

  @override
  String get pluginDetectedDescription =>
      'Tuvastati serveri pistikprogramm. Sünkroonimine lubatakse pistikprogrammi esmakordsel leidmisel automaatselt.';

  @override
  String get pluginNotDetectedDescription =>
      'Serveri pistikprogrammi ei tuvastata praegu. Kohalikud seaded kasutavad endiselt oma salvestatud väärtusi või sisseehitatud vaikeseadeid.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersioon: $version';
  }

  @override
  String get availableServices => 'Saadaolevad teenused';

  @override
  String get serverPluginSync => 'Serveri pistikprogrammi sünkroonimine';

  @override
  String get syncSettingsWithPlugin =>
      'Sünkroonige seaded serveri pistikprogrammiga';

  @override
  String get whatSyncControls => 'Millised sünkroonimise juhised';

  @override
  String get syncControlsDescription =>
      'Sünkroonimine juhib ainult seda, kas pistikprogrammide tagatud seaded lükatakse serverisse ja tõmmatakse sealt. Kui pistikprogrammi sünkroonimine on lubatud, on profiili valik ja profiili sünkroonimistoimingud jaotises Kohandamise seaded.';

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
  String get studios => 'Stuudiokorterid';

  @override
  String get popularSeries => 'Populaarne sari';

  @override
  String get seriesGenres => 'Sarja žanrid';

  @override
  String get upcomingSeries => 'Tulevane seeria';

  @override
  String get networks => 'Võrgud';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'Lähtestage read vaikeseadetele';

  @override
  String get enableSeerr => 'Luba Seerr';

  @override
  String get showSeerrInNavigation =>
      'Kuva Nägija navigeerimisel (vaja on serveri pistikprogrammi)';

  @override
  String get seerrUnavailable =>
      'Pole saadaval, kuna serveri pistikprogrammi Seerr tugi on keelatud.';

  @override
  String get nsfwFilter => 'NSFW filter';

  @override
  String get hideAdultContent =>
      'Peida tulemustes täiskasvanutele mõeldud sisu';

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
    return 'Sisse logitud kui: $username';
  }

  @override
  String get discoverRows => 'Avasta read';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Lohistage ümberjärjestamiseks. Lubage või keelake read. Lubatud ridade järjestus sünkroonitakse Moonfini pistikprogrammiga.';

  @override
  String get discoverRowsDescription =>
      'Lohistage ümberjärjestamiseks. Lubage või keelake read.';

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
  String get reorderToggleHomeRows =>
      'Koduridade ümberjärjestamine ja vahetamine';

  @override
  String get featuredContentAppearance => 'Esiletõstetud sisu, välimus';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakati suurus, pildi tüüp, kausta vaade';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB ja reitinguallikad';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Selge';

  @override
  String get browse => 'Sirvige';

  @override
  String get noResults => 'Tulemusi pole';

  @override
  String get seerrAvailableStatus => 'Saadaval';

  @override
  String get seerrRequestedStatus => 'Soovitud';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Üksused';
  }

  @override
  String get seerrSettings => 'Nägija seaded';

  @override
  String get requestMore => 'Küsi lisa';

  @override
  String get request => 'Taotlus';

  @override
  String get cancelRequest => 'Tühista taotlus';

  @override
  String get playInMoonfin => 'Mängi Moonfinis';

  @override
  String requestedByName(String name) {
    return 'Taotleja $name';
  }

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
  String get submitRequest => 'Esitage taotlus';

  @override
  String get allSeasons => 'Kõik aastaajad';

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
  String get seasonsLabel => 'Aastaajad';

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
  String get general => 'Kindral';

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
  String get next => 'Edasi';

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
  String get stop => 'Peatus';

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
  String get adminDrawerLibraries => 'raamatukogud';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

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
  String adminRecentAlertEntries(int count) {
    return 'Viimased hoiatus-/veakirjed: $count';
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
  String get adminScanLibraries => 'Skanni raamatukogud';

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
  String get sessionNext => 'Edasi';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

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
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Lõpetamine';

  @override
  String get direct => 'Otsene';

  @override
  String get adminDisconnect => 'Katkesta ühendus';

  @override
  String get adminClearDates => 'Selged kuupäevad';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

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
  String get adminLibraryOptionsSaved => 'Teegi valikud on salvestatud';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Valikute salvestamine ebaõnnestus: $error';
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
  String get adminSaveOptions => 'Salvesta Valikud';

  @override
  String get adminPreferredMetadataLanguage => 'Eelistatud metaandmete keel';

  @override
  String get adminMetadataLanguageHint => 'nt. et, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metaandmete riigikood';

  @override
  String get adminMetadataCountryHint => 'nt. USA, DE, FR';

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
  String get adminNoPathsAdded => 'Teed pole lisatud (saab hiljem lisada)';

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
  String get adminNoProfileChanges => 'Salvestatavaid profiilimuudatusi pole';

  @override
  String get adminProfileSaved => 'Profiil salvestatud';

  @override
  String adminSaveFailed(String error) {
    return 'Salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminPermissionsSaved => 'Load salvestatud';

  @override
  String get adminPasswordsMismatch => 'Paroolid ei ühti';

  @override
  String adminFailed(String error) {
    return 'Ebaõnnestunud: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kasutaja laadimine ebaõnnestus';

  @override
  String get adminBackToUsers => 'Tagasi kasutajate juurde';

  @override
  String get adminSaveProfile => 'Salvesta profiil';

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
  String get adminAllowContentDeletion => 'Luba sisu kustutamine';

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
  String get adminRemoteBitrateLimit => 'Kaugkliendi bitikiiruse limiit (bps)';

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
  String get adminSavePermissions => 'Salvesta load';

  @override
  String get adminEnableAllLibraryAccess =>
      'Luba juurdepääs kõikidele raamatukogudele';

  @override
  String get adminSaveAccess => 'Salvesta juurdepääs';

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
  String get adminDeviceAndChannelAccess => 'Juurdepääs seadmele ja kanalile';

  @override
  String get adminEnableAllDevices => 'Luba juurdepääs kõikidele seadmetele';

  @override
  String get adminEnableAllChannels => 'Luba juurdepääs kõikidele kanalitele';

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
  String get adminTimeLimit => 'Ajapiirang (valikuline)';

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
  String get adminMissingAuthToken =>
      'Seadeid ei saa avada: autentimisluba puudub.';

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
  String get adminBrandingSaved => 'Brändiseaded on salvestatud';

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
  String get adminStreamingSaved => 'Voogesituse seaded on salvestatud';

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
  String get adminPlaybackSaved => 'Taasesituse seaded on salvestatud';

  @override
  String get adminPlaybackLoadFailed =>
      'Taasesituse seadete laadimine ebaõnnestus';

  @override
  String get adminPlaybackTranscoding => 'Taasesitus / ümberkodeerimine';

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
  String get adminTrickplaySaved => 'Trickplay seaded on salvestatud';

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
  String get adminResumeSaved => 'Jätkamisseaded on salvestatud';

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
  String get adminNetworkingSaved =>
      'Võrguseaded on salvestatud. Vajalik võib olla serveri taaskäivitamine.';

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
  String get adminBaseUrlHint => 'nt. /tarretis';

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
  String get adminMetadataSaved => 'Metaandmed salvestatud';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Metaandmete laadimine ebaõnnestus: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Metaandmete salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminRefreshMetadata => 'Värskenda metaandmeid';

  @override
  String get recursive => 'Rekursiivne';

  @override
  String get adminReplaceAllMetadata => 'Asendage kõik metaandmed';

  @override
  String get adminReplaceAllImages => 'Asenda kõik pildid';

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
  String get adminAddTuner => 'Lisage tuuner';

  @override
  String get adminTunerType => 'Tuneri tüüp';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, muu';

  @override
  String get adminUrlPath => 'URL / tee';

  @override
  String get adminNameOptional => 'Nimi (valikuline)';

  @override
  String get adminTunerAdded => 'Tuner lisatud';

  @override
  String adminTunerAddFailed(String error) {
    return 'Tuneri lisamine nurjus: $error';
  }

  @override
  String get adminAddGuideProvider => 'Lisage juhendi pakkuja';

  @override
  String get adminProviderType => 'Pakkuja tüüp';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect või XMLTV';

  @override
  String get adminUsernameOptional => 'Kasutajanimi (valikuline)';

  @override
  String get adminRefreshInterval => 'Värskendusintervall (tunnid)';

  @override
  String get adminProviderAdded => 'Pakkuja lisatud';

  @override
  String adminProviderAddFailed(String error) {
    return 'Teenusepakkuja lisamine ebaõnnestus: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tuneri eemaldamine ebaõnnestus: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuneri lähtestamist taotleti';

  @override
  String adminTunerResetFailed(String error) {
    return 'Tuneri lähtestamine ebaõnnestus: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Teenusepakkuja eemaldamine ebaõnnestus: $error';
  }

  @override
  String get adminRecordingSettings => 'Salvestusseaded';

  @override
  String get adminPrePadding => 'Eelpolster (minutites)';

  @override
  String get adminPostPadding => 'Järeltäide (minutites)';

  @override
  String get adminRecordingPath => 'Salvestustee';

  @override
  String get adminSeriesRecordingPath => 'Sarja salvestustee';

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
  String get adminRecordingSettingsSaved => 'Salvestusseaded on salvestatud';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Seadete salvestamine ebaõnnestus: $error';
  }

  @override
  String get adminSetChannelMappings => 'Kanalite vastendamise määramine';

  @override
  String get adminMappingJson => 'JSON-i kaardistamine';

  @override
  String get adminMappingJsonHint =>
      'Näide: JSON-i kasuliku koormuse vastendamine';

  @override
  String get adminChannelMappingsUpdated => 'Kanalite vastendusi värskendati';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Vastendite värskendamine ebaõnnestus: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Lisa teenusepakkuja';

  @override
  String get adminNoListingProviders =>
      'Ühtegi loendi pakkujat pole konfigureeritud';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Salvestustee: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Sarja tee: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Eeltäitmine: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Järeltäide: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tuneri avastus';

  @override
  String get adminChannelMappings => 'Kanalite kaardistused';

  @override
  String get adminNoDiscoveredTuners => 'Veel pole avastatud tuunereid';

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
  String get adminRestoreRequested =>
      'Taastamist taotleti. Serveri taaskäivitamine võib selle seansi katkestada.';

  @override
  String get adminBackupsTitle => 'Varukoopiad';

  @override
  String get adminUnknownDate => 'Tundmatu kuupäev';

  @override
  String get adminUnnamedBackup => 'Nimetu varukoopia';

  @override
  String get adminLiveTvNotAvailable =>
      'Otsetelevisiooni haldamine pole selles serverijärgus saadaval.';

  @override
  String get adminLiveTvTitle => 'Otseülekande administreerimine';

  @override
  String get adminApply => 'Rakenda';

  @override
  String get adminNotSet => 'Pole määratud';

  @override
  String get adminReset => 'Lähtesta';

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
  String get adminMetadataIdentify => 'Identify';

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
  String get adminMetadataFieldTagline => 'Tunnuslause';

  @override
  String get adminMetadataFieldOverview => 'Ülevaade';

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
  String get adminMetadataRecursive => 'Rekursiivne';

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
  String get adminPluginsNoSearchResults =>
      'Ükski pistikprogramm ei vasta teie otsingule';

  @override
  String get adminPluginsNoneInstalled => 'Pluginaid pole installitud';

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
  String get adminNetworkingRemoteAccess => 'Luba kaugjuurdepääs';

  @override
  String get adminNetworkingPorts => 'Sadamad';

  @override
  String get adminNetworkingHttpPort => 'HTTP port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-port';

  @override
  String get adminNetworkingEnableHttps => 'Luba HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Kohalik võrk';

  @override
  String get adminNetworkingLocalAddresses => 'Kohaliku võrgu aadressid';

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
  String get adminPlaybackHwAccel => 'Riistvaraline kiirendus';

  @override
  String get adminPlaybackHwAccelLabel => 'Riistvaraline kiirendus';

  @override
  String get adminPlaybackEnableHwEncoding => 'Luba riistvaraline kodeering';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Riistvara dekodeerimise lubamine:';

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
  String get adminResumeMinAudiobookPct =>
      'Audioraamatute jätkamise minimaalne protsent';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimaalne audioraamatu jätkamise protsent';

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
  String get adminTaskStop => 'Peatus';

  @override
  String get adminRunningTasks => 'Running Tasks';

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
  String adminTaskTriggerInterval(String duration) {
    return 'Iga $duration';
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
  String get adminTaskTriggerEvery6Hours => 'Iga 6 tunni järel';

  @override
  String get adminTaskTriggerEvery12Hours => 'Iga 12 tunni järel';

  @override
  String get adminTaskTriggerEvery24Hours => 'Iga 24 tunni järel';

  @override
  String get adminTaskTriggerEvery2Days => 'Iga 2 päeva järel';

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
  String get adminTaskTriggerTime => 'Aeg';

  @override
  String get adminTaskTriggerNoLimit => 'Piiramata';

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
      'Konfigureerige eelvaate pisipiltide jaoks trickplay-piltide genereerimine.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Avalik HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Baas-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'nt. /tarretis';

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
  String get adminNetworkingCertPath => 'Sertifikaadi tee';

  @override
  String get adminNetworkingRemoteIpFilter => 'Kaug-IP-filter';

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
  String get adminGeneralCachePath => 'Vahemälu tee';

  @override
  String get adminGeneralMetadataPath => 'Metaandmete tee';

  @override
  String get adminGeneralServerName => 'Serveri nimi';

  @override
  String get adminSettingsLoadFailed => 'Seadete laadimine ebaõnnestus';

  @override
  String get adminDiscover => 'Avasta';

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
  String get libraries => 'raamatukogud';

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
      other: '# participants',
      one: '# participant',
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get pinIncorrect => 'Vale PIN-kood';

  @override
  String get pinMismatch => 'PIN-koodid ei ühti';

  @override
  String get pinForgot => 'Unustasite PIN-koodi?';

  @override
  String get pinClear => 'Selge';

  @override
  String get pinBackspace => 'Tagasilükkeklahv';

  @override
  String get quickConnectAuthorized => 'Kiirühenduse taotlus on lubatud.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kiirühenduse kood on kehtetu või aegunud.';

  @override
  String get quickConnectNotSupported =>
      'Kiirühendust selles serveris ei toetata.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kiirühenduse koodi autoriseerimine ebaõnnestus.';

  @override
  String get quickConnectDisabled => 'Kiirühendus on selles serveris keelatud.';

  @override
  String get quickConnectForbidden =>
      'Teie konto ei saa seda kiirühenduse taotlust autoriseerida.';

  @override
  String get quickConnectNotFound =>
      'Kiirühenduse koodi ei leitud. Proovige uut koodi.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Kiirühendus ebaõnnestus: $message';
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
  String get shuffleLibrary => 'Raamatukogu';

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
  String get stillWatchingStop => 'Peatus';

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
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Juurdepääs serveri halduspaneelile';

  @override
  String get settingsAccountSecurity => 'Konto ja turvalisus';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentimine, PIN-kood ja vanemlik järelevalve';

  @override
  String get settingsPersonalization => 'Isikupärastamine';

  @override
  String get settingsPersonalizationSubtitle =>
      'Teema, navigeerimine, avaread ja teegi nähtavus';

  @override
  String get settingsDynamicContent => 'Dünaamiline sisu';

  @override
  String get settingsDynamicContentSubtitle =>
      'Meediumiriba ja visuaalsed ülekatted';

  @override
  String get settingsPlaybackSyncplay => 'Taasesitus ja SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Heli/video seaded, subtiitrid, allalaadimised ja SyncPlay juhtnupud';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugina sünkroonimine, seerr, hinnangud ja palju muud';

  @override
  String get settingsAboutSubtitle =>
      'Rakenduse versioon, juriidiline teave ja krediidid';

  @override
  String get settingsAuthenticationSection => 'AUTENTISEERIMINE';

  @override
  String get settingsSortServersBy => 'Sorteeri serverid';

  @override
  String get settingsLastUsed => 'Viimati kasutatud';

  @override
  String get settingsAlphabetical => 'Tähestikuline';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVAATSUS JA OHUTUS';

  @override
  String get settingsBlockedRatings => 'Blokeeritud reitingud';

  @override
  String get settingsGeneralStyle => 'Üldine stiil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Teema aktsendid, taustad, vaadatud indikaatorid ja teemamuusika';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'Avaleht';

  @override
  String get settingsHomePageSubtitle =>
      'Jaotised, pilditüübid, ülekatted ja meedia eelvaated';

  @override
  String get settingsLibrariesSubtitle =>
      'Teegi nähtavus, kaustavaade ja mitme serveri käitumine';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'Kuvage navigeerimisribal teekide nupp';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
  String get settingsMetadataAndRatings => 'Metaandmed ja hinnangud';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase võimaldab serveripoolseid integratsioone, sealhulgas täiendavaid reitinguallikaid, Seerr-i päringuid ja sünkroonitud eelistusi.';

  @override
  String get settingsOfflineDownloads => 'Võrguühenduseta allalaadimised';

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
  String get settingsPoweredByFlutter => 'Powered by Flutter';

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
  String get settingsBoth => 'Mõlemad';

  @override
  String get settingsShuffleContentTypeFilter => 'Juhusliku sisutüübi filter';

  @override
  String get settingsVideoPlaybackPreferences => 'Video taasesituse eelistused';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Põhivideomootori ja voogesituse kvaliteedi seaded';

  @override
  String get settingsAudioPreferences => 'Heli eelistused';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Helirajad, töötlemine ja läbipääsuvalikud';

  @override
  String get settingsAutomationAndQueue => 'Automatiseerimine ja järjekord';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automaatne taasesitus ja järjestus';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Allalaadimise kvaliteet, salvestuspiirangud ja järjekorra suurus';

  @override
  String get settingsSyncplaySubtitle => 'Grupiseansside sünkroonimisloogika';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Spetsiaalsed mängija funktsioonid. Kasutage ettevaatlikult, kuna mõned valikud võivad põhjustada taasesitusprobleeme';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Kas jätta sissejuhatused ja välised vahele?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (pärand)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (soovitatav)';

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
    return '';
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
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title =>
      'Kaardistada Dolby Vision profiil 7 HEVC-ga';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Esitage Dolby Vision profiili 7 voogusid HDR10-ühilduva HEVC-na mitte-DV-seadmetes.';

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
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

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
  String get rowsType => 'Ridade tüüp';

  @override
  String get rowsTypeDescription =>
      'Classic säilitab reapõhise pilditüübi ja teabe ülekatte. Modern kasutab portree-taustadekoratsiooni ridu.';

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
  String get genresRowItems => 'Žanrid rea elemendid';

  @override
  String get genresRowItemsDescription =>
      'Kuva filmid, seriaalid või mõlemad žanrite ridadel.';

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
  String get appearance => 'Välimus';

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
  String get cardSize => 'Kaardi suurus';

  @override
  String get externalPlayerApp => 'Väline mängija rakendus';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Kuva rakenduse valija, kui taasesitus algab.';

  @override
  String get loadingInstalledPlayers => 'Installitud mängijate laadimine...';

  @override
  String get connection => 'Ühendus';

  @override
  String get audioTranscodeTarget => 'Heli ümberkodeerimise sihtmärk';

  @override
  String get passthrough => 'Läbipääs';

  @override
  String get supportedOnThisDevice => 'Selles seadmes toetatud';

  @override
  String get notSupportedOnThisDevice => 'Selles seadmes ei toetata';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) läbilaskevõime';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitivoog DTS:X (DTS UHD) välisele dekoodrile.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD koos Atmose (JOC) läbipääsuga';

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
  String get useExternalPlayer => 'Kasutage välist mängijat';

  @override
  String get useExternalPlayerSubtitle =>
      'Avage Android TV valitud välisrakenduses video taasesitus.';

  @override
  String get automaticQueuing => 'Automaatne järjekord';

  @override
  String get preferSdhSubtitles => 'Eelista SDH subtiitreid';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Seadistage automaatsel valimisel prioriteediks SDH/CC subtiitrirajad.';

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
  String get appearancesSeerr => 'Esinemised (nägija)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Vaadake koos rühmaga';

  @override
  String get errors => 'Vead';

  @override
  String get warnings => 'Hoiatused';

  @override
  String get disk => 'Ketas';

  @override
  String get openInBrowser => 'Avage brauseris';

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
  String get passwordSet => 'Parool määratud';

  @override
  String get noPasswordConfigured => 'Parool pole konfigureeritud';

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
      other: '$count Libraries',
      one: '1 Library',
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
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Taasesitus';

  @override
  String get adminDrawerSectionDevices => 'Seadmed';

  @override
  String get adminDrawerSectionAdvanced => 'Täiustatud';

  @override
  String get adminDrawerSectionPlugins => 'Pluginad';

  @override
  String get adminDrawerSectionLiveTv => 'Otse-TV';

  @override
  String get homeVideos => 'Koduvideod';

  @override
  String get mixedContent => 'Segatud sisu';

  @override
  String get homeVideosAndPhotos => 'Koduvideod ja fotod';

  @override
  String get mixedMoviesAndShows => 'Segafilmid ja -saated';

  @override
  String get intelQuickSync => 'Inteli kiire sünkroonimine';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Sule žanri paneel';

  @override
  String get loadingShuffle => 'Juhusliku esituse laadimine...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Automaatne HDR-i vahetamine';

  @override
  String get autoHdrSwitchingDescription =>
      'Lubage HDR-i automaatselt HDR-video taasesitamiseks ja taastage väljumisel kuvarežiim.';

  @override
  String get whenFullscreen => 'Täisekraanil';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Ümberkodeerimise piirangud';

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
