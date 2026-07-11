// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Ingia';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Unganisha Haraka';

  @override
  String get password => 'Nenosiri';

  @override
  String get username => 'Jina la mtumiaji';

  @override
  String get email => 'Barua pepe';

  @override
  String get quickConnectInstruction =>
      'Ingiza msimbo huu kwenye dashibodi ya wavuti ya seva yako:';

  @override
  String get waitingForAuthorization => 'Inasubiri idhini...';

  @override
  String get back => 'Nyuma';

  @override
  String get serverUnavailable => 'Seva haipatikani';

  @override
  String get loginFailed => 'Kuingia kumeshindwa';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Nani anatazama?';

  @override
  String get addUser => 'Ongeza Mtumiaji';

  @override
  String get selectServer => 'Chagua Seva';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Seva Zilizohifadhiwa';

  @override
  String get discoveredServers => 'Seva Zilizogunduliwa';

  @override
  String get noneFound => 'Hakuna iliyopatikana';

  @override
  String get unableToConnectToServer => 'Imeshindwa kuunganisha kwenye seva';

  @override
  String get addServer => 'Ongeza Seva';

  @override
  String get embyConnect => 'Emby Unganisha';

  @override
  String get removeServer => 'Ondoa Seva';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Ghairi';

  @override
  String get remove => 'Ondoa';

  @override
  String get connectToServer => 'Unganisha kwa Seva';

  @override
  String get serverAddress => 'Anwani ya Seva';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Unganisha';

  @override
  String get secureStorageUnavailable => 'Hifadhi Salama Haipatikani';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin haikuweza kufikia ufunguo wa mfumo wako. Kuingia kunaweza kuendelea, lakini hifadhi salama ya tokeni huenda isipatikane hadi ufunguo ufunguliwe.';

  @override
  String get ok => 'Sawa';

  @override
  String get settingsAppearanceTheme => 'Mandhari ya Programu';

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
      'Badili kati ya Moonfin na Neon Pulse bila kuanzisha upya programu';

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
      'Mwonekano wa sasa wa Moonfin nyote mmependa';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Mtindo wa Synthwave wenye mng\'ao wa magenta, maandishi ya samawati na utofautishaji thabiti wa chrome';

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
      'Ingia ukitumia akaunti yako ya Emby Connect';

  @override
  String get emailOrUsername => 'Barua pepe au Jina la mtumiaji';

  @override
  String get selectAServer => 'Chagua Seva';

  @override
  String get tryAgain => 'Jaribu Tena';

  @override
  String get noLinkedServers =>
      'Hakuna seva zilizounganishwa kwenye akaunti hii ya Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Kitambulisho batili cha Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Emby batili Unganisha jina la mtumiaji au nenosiri';

  @override
  String get embyConnectExchangeNotSupported =>
      'Seva haitumii ubadilishaji wa Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Hitilafu ya mtandao wakati unawasiliana na Emby Connect au seva iliyochaguliwa';

  @override
  String get loadingLinkedServers => 'Inapakia seva zilizounganishwa...';

  @override
  String get connectingToServerEllipsis => 'Inaunganisha kwenye seva...';

  @override
  String get noReachableAddress =>
      'Hakuna anwani inayoweza kufikiwa iliyotolewa';

  @override
  String get invalidServerExchangeResponse =>
      'Jibu batili kutoka kwa sehemu ya mwisho ya ubadilishaji wa seva';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Ungependa kufunga Moonfin?';

  @override
  String get exitAppConfirmation => 'Je, una uhakika unataka kuondoka?';

  @override
  String get exit => 'Utgång';

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
  String get noHomeRowsLoaded =>
      'Hakuna safu mlalo za mwanzo zilizoweza kupakiwa';

  @override
  String get noHomeRowsHint =>
      'Jaribu kuonyesha upya au kupunguza sehemu za nyumbani zinazotumika.';

  @override
  String get retryHomeRows => 'Jaribu tena Safu Mlalo za Nyumbani';

  @override
  String get guide => 'Mwongozo';

  @override
  String get recordings => 'Rekodi';

  @override
  String get schedule => 'Ratiba';

  @override
  String get series => 'Mfululizo';

  @override
  String get noItemsFound => 'Hakuna vipengee vilivyopatikana';

  @override
  String get home => 'Nyumbani';

  @override
  String get browseAll => 'Vinjari Vyote';

  @override
  String get genres => 'Aina';

  @override
  String get collectionPlaceholder =>
      'Vipengee vya mkusanyiko vitaonekana hapa';

  @override
  String get browseByLetter => 'Vinjari kwa Barua';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Kuvinjari kwa alfabeti kutaonekana hapa';

  @override
  String get suggestions => 'Mapendekezo';

  @override
  String get suggestionsPlaceholder =>
      'Vipengee vilivyopendekezwa vitaonekana hapa';

  @override
  String get failedToLoadLibraries => 'Imeshindwa kupakia maktaba';

  @override
  String get noLibrariesFound => 'Hakuna maktaba zilizopatikana';

  @override
  String get library => 'Maktaba';

  @override
  String get displaySettings => 'Mipangilio ya Maonyesho';

  @override
  String get allGenres => 'Aina Zote';

  @override
  String get noGenresFound => 'Hakuna aina zilizopatikana';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Folda hii haina chochote';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Imeshindwa kupakia vipendwa';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get noFavoritesYet => 'Bado hakuna vipendwa';

  @override
  String get favorites => 'Vipendwa';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Kuendelea';

  @override
  String get ended => 'Imeisha';

  @override
  String get sortAndFilter => 'Panga & Chuja';

  @override
  String get type => 'Aina';

  @override
  String get sortBy => 'Panga Kwa';

  @override
  String get display => 'Onyesho';

  @override
  String get imageType => 'Aina ya Picha';

  @override
  String get posterSize => 'Ukubwa wa Bango';

  @override
  String get small => 'Ndogo';

  @override
  String get medium => 'Kati';

  @override
  String get large => 'Kubwa';

  @override
  String get extraLarge => 'Kubwa Zaidi';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Maoni';

  @override
  String get albums => 'Albamu';

  @override
  String get albumArtists => 'Wasanii wa Albamu';

  @override
  String get artists => 'Wasanii';

  @override
  String get bookmarks => 'Alamisho';

  @override
  String get noSavedBookmarks =>
      'Bado hakuna alamisho zilizohifadhiwa za kichwa hiki.';

  @override
  String get openBook => 'Fungua Kitabu';

  @override
  String get chapter => 'Sura';

  @override
  String get page => 'Ukurasa';

  @override
  String get bookmark => 'Alamisho';

  @override
  String get justNow => 'Sasa hivi';

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
  String get discoverySubjects => 'Masomo ya Ugunduzi';

  @override
  String get pickDiscoverySubjects =>
      'Chagua milisho ya mada ya kuonyesha katika Dokezo.';

  @override
  String get apply => 'Omba';

  @override
  String get openLink => 'Fungua Kiungo';

  @override
  String get scanWithYourPhone => 'Changanua kwa simu yako';

  @override
  String get audiobookGenres => 'Aina za vitabu vya sauti';

  @override
  String get pickAudiobookGenres =>
      'Chagua aina za muziki za kuonyesha katika Gundua Kitabu cha Sauti.';

  @override
  String get discoverAudiobooks => 'Gundua Vitabu vya Sauti';

  @override
  String get librivoxDescription =>
      'Majina maarufu ya kikoa cha umma kutoka LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Sogeza kushoto';

  @override
  String get scrollRight => 'Sogeza kulia';

  @override
  String get couldNotLoadGenre => 'Haikuweza kupakia aina hii kwa sasa.';

  @override
  String get continueReading => 'Endelea Kusoma';

  @override
  String get savedHighlights => 'Vivutio Vilivyohifadhiwa';

  @override
  String get continueListening => 'Endelea Kusikiliza';

  @override
  String get listen => 'Sikiliza';

  @override
  String get resume => 'Endelea';

  @override
  String get failedToLoadLibrary => 'Imeshindwa kupakia maktaba';

  @override
  String get popularNow => 'Maarufu Sasa';

  @override
  String get savedForLater => 'Imehifadhiwa Baadaye';

  @override
  String get topListens => 'Usikilizaji wa Juu';

  @override
  String get unreadDiscoveries => 'Uvumbuzi ambao haujasomwa';

  @override
  String get pickUpAgain => 'Chukua Tena';

  @override
  String get bookHighlightsDescription =>
      'Vitabu vyako vilivyo na vivutio, vipendwa au maendeleo ya usomaji.';

  @override
  String get handPickedFromLibrary =>
      'Imechaguliwa kwa mkono kutoka kwa maktaba yako.';

  @override
  String get handPickedFromListeningQueue =>
      'Imechaguliwa kwa mkono kutoka kwenye foleni yako ya kusikiliza.';

  @override
  String get booksWithHighlights =>
      'Vitabu vilivyo na vivutio, vipendwa au maendeleo ya usomaji.';

  @override
  String get jumpBackNarration =>
      'Rudi kwenye simulizi bila kuwinda eneo lako.';

  @override
  String get unreadBooksReady =>
      'Vitabu ambavyo havijasomwa tayari kwa saa inayofuata ya utulivu.';

  @override
  String get quickAccessFavorites =>
      'Ufikiaji wa haraka wa vitabu unavyoendelea kurejea.';

  @override
  String get searchAudiobooks => 'Tafuta vitabu vya sauti';

  @override
  String get searchYourLibrary => 'Tafuta maktaba yako';

  @override
  String get pickUpStory => 'Endelea hadithi pale ulipoishia';

  @override
  String get savedPlacesChapters =>
      'Maeneo uliyohifadhi na sura ambazo hazijakamilika';

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
  String get readyWhenYouAre => 'Tayari wakati wewe ni';

  @override
  String get details => 'Maelezo';

  @override
  String get listeningRoom => 'Chumba cha Kusikiliza';

  @override
  String get bookmarksAndProgress => 'Alamisho na Maendeleo';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Majina';

  @override
  String get allTitles => 'Majina Yote';

  @override
  String get authors => 'Waandishi';

  @override
  String get browseByAuthor => 'Vinjari Kwa Mwandishi';

  @override
  String get browseByGenre => 'Vinjari Kwa Aina';

  @override
  String get discover => 'Gundua';

  @override
  String get trendingTitlesOpenLibrary =>
      'Vichwa vinavyovuma kulingana na mada kutoka Open Library.';

  @override
  String get noBookmarkedItems => 'Bado hakuna vipengee vilivyoalamishwa';

  @override
  String get nothingMatchesSection =>
      'Bado hakuna kinacholingana na sehemu hii. Jaribu kichupo kingine au urudi baada ya kusawazisha maktaba kukamilika.';

  @override
  String get audiobooks => 'Vitabu vya sauti';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Folda';

  @override
  String get filters => 'Vichujio';

  @override
  String get readingStatus => 'Hali ya Kusoma';

  @override
  String get playedStatus => 'Hali Iliyochezwa';

  @override
  String get readStatus => 'Soma';

  @override
  String get watched => 'Imetazamwa';

  @override
  String get unread => 'Haijasomwa';

  @override
  String get unwatched => 'Isiyotazamwa';

  @override
  String get seriesStatus => 'Hali ya Mfululizo';

  @override
  String get allLibraries => 'Maktaba Zote';

  @override
  String get books => 'Vitabu';

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
  String get author => 'Mwandishi';

  @override
  String get unknownAuthor => 'Mwandishi asiyejulikana';

  @override
  String get uncategorized => 'Isiyowekwa katika kundi';

  @override
  String get overview => 'Muhtasari';

  @override
  String get noLibrivoxDescription =>
      'Bado hakuna maelezo yaliyotolewa na LibriVox kwa jina hili.';

  @override
  String get readers => 'Wasomaji';

  @override
  String get openLinks => 'Fungua Viungo';

  @override
  String get librivoxPage => 'Ukurasa wa LibriVox';

  @override
  String get internetArchive => 'Hifadhi ya Mtandao';

  @override
  String get rssFeed => 'Mlisho wa RSS';

  @override
  String get downloadZip => 'Pakua Zip';

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
      'Bado hakuna muhtasari unaopatikana kutoka Open Library wa mada hii.';

  @override
  String get subjects => 'Masomo';

  @override
  String get all => 'Wote';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Haikuweza kupakia mada hii sasa hivi.';

  @override
  String get audiobookDetails => 'Maelezo ya Kitabu cha Sauti';

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
  String get trackList => 'Orodha ya Orodha';

  @override
  String get itemListPlaceholder => 'Orodha ya bidhaa itaonekana hapa';

  @override
  String get favoriteTracksPlaceholder =>
      'Nyimbo unazozipenda zaidi zitaonekana hapa';

  @override
  String get failedToLoad => 'Imeshindwa kupakia';

  @override
  String get delete => 'Futa';

  @override
  String get save => 'Hifadhi';

  @override
  String get moreLikeThis => 'Zaidi Kama Hii';

  @override
  String get castAndCrew => 'Waigizaji na Wafanyakazi';

  @override
  String get collection => 'Mkusanyiko';

  @override
  String get episodes => 'Vipindi';

  @override
  String get nextUp => 'Inayofuata';

  @override
  String get seasons => 'Misimu';

  @override
  String get chapters => 'Sura';

  @override
  String get features => 'Vipengele';

  @override
  String get movies => 'Filamu';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Nyingine';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Wasanii Wanaofanana';

  @override
  String get tableOfContents => 'Jedwali la Yaliyomo';

  @override
  String get tracklist => 'Orodha ya nyimbo';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Wasifu';

  @override
  String get authorDetails => 'Maelezo ya Mwandishi';

  @override
  String get noOverviewAvailable => 'Bado hakuna muhtasari wa mada hii.';

  @override
  String get noBiographyAvailable =>
      'Hakuna wasifu unaopatikana kwa mwandishi huyu.';

  @override
  String get noBooksFound =>
      'Hakuna vitabu vilivyopatikana vya mwandishi huyu.';

  @override
  String get unableToLoadAuthorDetails =>
      'Imeshindwa kupakia maelezo ya mwandishi kwa sasa.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Tarehe ya kuchapishwa haijulikani';

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
  String get view => 'Tazama';

  @override
  String get resumeReading => 'Endelea Kusoma';

  @override
  String get read => 'Soma';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Cheza';

  @override
  String get startOver => 'Anza upya';

  @override
  String get restart => 'Anzisha upya';

  @override
  String get readOffline => 'Soma Nje ya Mtandao';

  @override
  String get playOffline => 'Cheza Nje ya Mtandao';

  @override
  String get audio => 'Sauti';

  @override
  String get subtitles => 'Manukuu';

  @override
  String get version => 'Toleo';

  @override
  String get cast => 'Tuma';

  @override
  String get trailer => 'Trela';

  @override
  String get finished => 'Imekamilika';

  @override
  String get favorited => 'Imependekezwa';

  @override
  String get favorite => 'Kipendwa';

  @override
  String get playlist => 'Orodha ya kucheza';

  @override
  String get downloaded => 'Imepakuliwa';

  @override
  String get downloadAll => 'Pakua Zote';

  @override
  String get download => 'Pakua';

  @override
  String get deleteDownloaded => 'Futa Iliyopakuliwa';

  @override
  String get goToSeries => 'Nenda kwenye Series';

  @override
  String get editMetadata => 'Hariri Metadata';

  @override
  String get less => 'Chini';

  @override
  String get more => 'Zaidi';

  @override
  String get deleteItem => 'Futa Kipengee';

  @override
  String get deletePlaylist => 'Futa Orodha ya Kucheza';

  @override
  String get deletePlaylistMessage =>
      'Je, ungependa kufuta orodha hii ya kucheza kutoka kwa seva?';

  @override
  String get deleteItemMessage =>
      'Ungependa kufuta kipengee hiki kutoka kwa seva?';

  @override
  String get failedToDeletePlaylist => 'Imeshindwa kufuta orodha ya kucheza';

  @override
  String get failedToDeleteItem => 'Imeshindwa kufuta kipengee';

  @override
  String get renamePlaylist => 'Badilisha Jina la Orodha ya Kucheza';

  @override
  String get playlistName => 'Jina la orodha ya kucheza';

  @override
  String get deleteDownloadedAlbum => 'Futa Albamu Iliyopakuliwa';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Nyimbo zilizopakuliwa zimefutwa';

  @override
  String get downloadedTracksDeleteFailed =>
      'Baadhi ya nyimbo zilizopakuliwa hazikuweza kufutwa';

  @override
  String get noTracksLoaded => 'Hakuna nyimbo zilizopakiwa';

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
  String get itemDeleted => 'Kipengee kimefutwa';

  @override
  String get noPlayableTrailerFound =>
      'Hakuna trela inayoweza kucheza iliyopatikana.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Wimbo wa Sauti';

  @override
  String get subtitleTrack => 'Wimbo wa Manukuu';

  @override
  String get none => 'Hakuna';

  @override
  String get downloadSubtitlesLabel => 'Pakua manukuu...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Tafuta kwa kutumia programu-jalizi ya OpenSubtitles';

  @override
  String get downloadSubtitles => 'Pakua Manukuu';

  @override
  String get selectedSubtitleInvalid => 'Manukuu yaliyochaguliwa ni batili.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Manukuu yamepakuliwa. Inaweza kuchukua muda kuonekana Jellyfin inapoonyesha upya kipengee.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Chagua Toleo';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Pakua Zote - Ubora';

  @override
  String get downloadQuality => 'Ubora wa Kupakua';

  @override
  String get originalFileNoReencoding => 'Faili asili, hakuna usimbaji upya';

  @override
  String get originalFilesNoReencoding => 'Faili asili, hakuna usimbaji upya';

  @override
  String get noEpisodesLoaded => 'Hakuna vipindi vilivyopakiwa';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Futa Faili Zilizopakuliwa';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Faili zilizopakuliwa zimefutwa';

  @override
  String get failedToDeleteFiles => 'Imeshindwa kufuta faili';

  @override
  String get deleteFiles => 'Futa Faili';

  @override
  String get director => 'MKURUGENZI';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'WAANDISHI';

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
  String get showLess => 'Onyesha Chini';

  @override
  String get readMore => 'Soma Zaidi';

  @override
  String get shuffle => 'Changanya';

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
  String get perfectMatch => 'Mechi kamili';

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
      'vipindi vyote vilivyopakuliwa katika msimu huu';

  @override
  String get stillWatching => 'Bado Unatazama?';

  @override
  String get unableToLoadTrailerStream =>
      'Imeshindwa kupakia mtiririko wa trela.';

  @override
  String get trailerTimedOut => 'Muda wa trela umeisha wakati wa kupakia.';

  @override
  String get playbackFailedForTrailer => 'Uchezaji haujafaulu kwa trela hii.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Kutuma hakupatikani wakati wa kucheza nje ya mtandao.';

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
  String get deviceVolume => 'Kiasi cha Kifaa';

  @override
  String get unavailable => 'Haipatikani';

  @override
  String get pause => 'Sitisha';

  @override
  String get syncPosition => 'Nafasi ya Usawazishaji';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Foleni ni tupu';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Uchezaji wa Mbali';

  @override
  String get castingToGoogleCast => 'Inatuma kwenye Google Cast';

  @override
  String get castingViaAirPlay => 'Inatuma kupitia AirPlay';

  @override
  String get castingViaDlna => 'Inatuma kupitia DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Bonyeza kwa muda mrefu ili kufungua';

  @override
  String get off => 'Imezimwa';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Otomatiki';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Ubatilishaji wa Bitrate';

  @override
  String get audioDelay => 'Kuchelewa kwa Sauti';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Ucheleweshaji wa Manukuu';

  @override
  String get reset => 'Weka upya';

  @override
  String get unknown => 'Haijulikani';

  @override
  String get playbackInformation => 'Maelezo ya Uchezaji';

  @override
  String get playback => 'Uchezaji';

  @override
  String get playMethod => 'Mbinu ya Kucheza';

  @override
  String get directPlay => 'Kucheza moja kwa moja';

  @override
  String get directStream => 'Mtiririko wa moja kwa moja';

  @override
  String get transcoding => 'Kubadilisha msimbo';

  @override
  String get transcodeReasons => 'Sababu za Transcode';

  @override
  String get player => 'Mchezaji';

  @override
  String get container => 'Chombo';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Azimio';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodeki';

  @override
  String get videoBitrate => 'Bitrate ya Video';

  @override
  String get track => 'Wimbo';

  @override
  String get channels => 'Vituo';

  @override
  String get audioBitrate => 'Bitrate ya Sauti';

  @override
  String get sampleRate => 'Kiwango cha Sampuli';

  @override
  String get format => 'Umbizo';

  @override
  String get external => 'Nje';

  @override
  String get embedded => 'Imepachikwa';

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
      'Utoaji wa EPUB ndani ya programu bado haupatikani kwenye mfumo huu.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Utoaji wa hati iliyopachikwa haupatikani kwenye jukwaa hili.';

  @override
  String get couldNotOpenExternalViewer =>
      'Haikuweza kufungua kitazamaji cha nje.';

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
      'Bado hakuna alamisho.\nGusa aikoni ya alamisho unaposoma ili kuhifadhi nafasi yako.';

  @override
  String get noTableOfContentsAvailable =>
      'Hakuna jedwali la yaliyomo linalopatikana';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Nafasi';

  @override
  String get bookReader => 'Msomaji wa Kitabu';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Inasasisha...';

  @override
  String get markUnread => 'Weka alama kuwa haijasomwa';

  @override
  String get markAsRead => 'Weka alama kama Imesomwa';

  @override
  String get reloadReader => 'Pakia upya Kisomaji';

  @override
  String get noPagesFound => 'Hakuna kurasa zilizopatikana.';

  @override
  String get failedToDecodePageImage => 'Imeshindwa kusimbua picha ya ukurasa.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Ukurasa Mmoja';

  @override
  String get twoPageSpread => 'Kuenea kwa Kurasa Mbili';

  @override
  String get addBookmark => 'Ongeza Alamisho';

  @override
  String get bookmarksEllipsis => 'Alamisho...';

  @override
  String get markedAsRead => 'Imetiwa alama kuwa imesomwa';

  @override
  String get markedAsUnread => 'Imetiwa alama kuwa haijasomwa';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Mada: Mfumo';

  @override
  String get themeLight => 'Mandhari: Mwanga';

  @override
  String get themeDark => 'Mandhari: Giza';

  @override
  String get themeSepia => 'Mandhari: Sepia';

  @override
  String get invertColorsFixedLayout => 'Geuza Rangi (mpangilio thabiti)';

  @override
  String get invertColorsPdf => 'Geuza Rangi (PDF)';

  @override
  String get preparingInAppReader =>
      'Inatayarisha kisomaji cha ndani ya programu...';

  @override
  String get pdfDataNotAvailable => 'Data ya PDF haipatikani.';

  @override
  String get readerFallbackModeActive => 'Hali mbadala ya kisomaji imewashwa';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Tumia Kisomaji Upya baada ya kuhamia lengwa la jukwaa linalotumika (Android, iOS, macOS).';

  @override
  String get openExternally => 'Fungua Nje';

  @override
  String get noEpubChaptersFound => 'Hakuna sura za EPUB zilizopatikana.';

  @override
  String get readerNotReady => 'Msomaji hayuko tayari.';

  @override
  String get seriesRecordings => 'Rekodi za Mfululizo';

  @override
  String get now => 'Sasa';

  @override
  String get sports => 'Michezo';

  @override
  String get news => 'Habari';

  @override
  String get kids => 'Watoto';

  @override
  String get premiere => 'Onyesho la kwanza';

  @override
  String get guideTimeline => 'Mwongozo wa kalenda';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Hakuna vituo vilivyopatikana';

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
  String get movie => 'Filamu';

  @override
  String get removedFromFavoriteChannels =>
      'Imeondolewa kwenye vituo unavyopenda';

  @override
  String get addedToFavoriteChannels => 'Imeongezwa kwa vituo unavyopenda';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Imeshindwa kusasisha kituo unachokipenda';

  @override
  String get unfavoriteChannel => 'Chaneli Usiyoipenda';

  @override
  String get favoriteChannel => 'Idhaa Unayoipenda';

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
  String get watch => 'Tazama';

  @override
  String get close => 'Funga';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Imeshindwa kupakia rekodi';

  @override
  String get scheduledInNext24Hours => 'Imepangwa katika Saa 24 Zinazofuata';

  @override
  String get recentRecordings => 'Rekodi za Hivi Punde';

  @override
  String get tvSeries => 'Mfululizo wa TV';

  @override
  String get failedToLoadSchedule => 'Imeshindwa kupakia ratiba';

  @override
  String get noScheduledRecordings => 'Hakuna rekodi zilizoratibiwa';

  @override
  String get cancelRecording => 'Ungependa Kughairi Kurekodi?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Hapana';

  @override
  String get yesCancel => 'Ndiyo, Ghairi';

  @override
  String get failedToCancelRecording => 'Imeshindwa kughairi kurekodi';

  @override
  String get failedToLoadSeriesRecordings =>
      'Imeshindwa kupakia rekodi za mfululizo';

  @override
  String get noSeriesRecordings => 'Hakuna rekodi za mfululizo';

  @override
  String get cancelSeriesRecording => 'Ghairi Kurekodi Mfululizo';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Ungependa Kughairi Kurekodi Mfululizo?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Imeshindwa kughairi kurekodi mfululizo';

  @override
  String get searchThisLibrary => 'Tafuta maktaba hii...';

  @override
  String get searchEllipsis => 'Tafuta...';

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
  String get seerrAccountType => 'Aina ya Akaunti ya Mtazamaji';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Ndani';

  @override
  String get savedMedia => 'Media Iliyohifadhiwa';

  @override
  String get tvShows => 'Vipindi vya Televisheni';

  @override
  String get music => 'Muziki';

  @override
  String get musicAlbums => 'Albamu za Muziki';

  @override
  String get noMediaInFilter => 'Hakuna midia katika kichujio hiki';

  @override
  String get noDownloadedMediaYet => 'Bado hakuna media iliyopakuliwa';

  @override
  String get browseLibrary => 'Vinjari Maktaba';

  @override
  String get deleteDownload => 'Futa Upakuaji';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Albamu';

  @override
  String get playAlbum => 'Cheza Albamu';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Msimu';

  @override
  String get errorLoadingEpisodes => 'Hitilafu katika kupakia vipindi';

  @override
  String get noDownloadedEpisodes => 'Hakuna vipindi vilivyopakuliwa';

  @override
  String get deleteEpisode => 'Futa Kipindi';

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
  String get seriesNotFound => 'Mfululizo haujapatikana';

  @override
  String get errorLoadingSeries => 'Hitilafu katika kupakia mfululizo';

  @override
  String get downloadedEpisodes => 'Vipindi Vilivyopakuliwa';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Maalum';

  @override
  String get deleteSeason => 'Futa Msimu';

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
  String get storageManagement => 'Usimamizi wa Hifadhi';

  @override
  String get storageBreakdown => 'Uchanganuzi wa Hifadhi';

  @override
  String get downloadedItems => 'Vipengee Vilivyopakuliwa';

  @override
  String get storageLimit => 'Kikomo cha Hifadhi';

  @override
  String get noLimit => 'Hakuna kikomo';

  @override
  String get deleteAllDownloads => 'Futa Vipakuliwa Vyote';

  @override
  String get deleteAllDownloadsWarning =>
      'Hii itaondoa faili zote za midia zilizopakuliwa na haiwezi kutenduliwa.';

  @override
  String get deleteAll => 'Futa Zote';

  @override
  String get deleteSelected => 'Futa Uliochaguliwa';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Vitabu vya Muziki na Sikizi';

  @override
  String get images => 'Picha';

  @override
  String get database => 'Hifadhidata';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Mipangilio';

  @override
  String get authentication => 'Uthibitishaji';

  @override
  String get autoLoginServerManagement =>
      'Kuingia kiotomatiki, usimamizi wa seva';

  @override
  String get pinCode => 'Msimbo wa PIN';

  @override
  String get setUpPinCodeProtection => 'Weka ulinzi wa msimbo wa PIN';

  @override
  String get parentalControls => 'Udhibiti wa Wazazi';

  @override
  String get contentRatingRestrictions => 'Vikwazo vya ukadiriaji wa maudhui';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, azimio, tabia';

  @override
  String get languageSizeAppearance => 'Lugha, ukubwa, muonekano';

  @override
  String get qualityStorage => 'Ubora, uhifadhi';

  @override
  String get serverSyncAndPluginStatus =>
      'Usawazishaji wa seva na hali ya programu-jalizi';

  @override
  String get mediaRequestIntegration => 'Ujumuishaji wa ombi la media';

  @override
  String get switchServer => 'Badilisha Seva';

  @override
  String get signOut => 'Ondoka';

  @override
  String get versionLicenses => 'Toleo, leseni';

  @override
  String get account => 'Akaunti';

  @override
  String get signInAndSecurity => 'Ingia na usalama';

  @override
  String get administration => 'Utawala';

  @override
  String get serverSettingsUsersLibraries =>
      'Mipangilio ya seva, watumiaji, maktaba';

  @override
  String get customization => 'Kubinafsisha';

  @override
  String get themeAndLayout => 'Mandhari na mpangilio';

  @override
  String get videoAndSubtitles => 'Video na manukuu';

  @override
  String get integrations => 'Ushirikiano';

  @override
  String get pluginAndRequests => 'Programu-jalizi na maombi';

  @override
  String get customizeAccountPlaybackInterface =>
      'Geuza kukufaa akaunti, uchezaji na tabia ya kiolesura';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Mandhari na Mwonekano';

  @override
  String get focusBorderColor => 'Lenga Rangi ya Mpaka';

  @override
  String get watchedIndicators => 'Viashiria Vilivyotazamwa';

  @override
  String get always => 'Daima';

  @override
  String get hideUnwatched => 'Ficha Isiyotazamwa';

  @override
  String get episodesOnly => 'Vipindi Pekee';

  @override
  String get never => 'Kamwe';

  @override
  String get focusExpansionAnimation => 'Lenga Upanuzi Uhuishaji';

  @override
  String get desktopUiScale => 'Kiwango cha UI cha Kompyuta ya Mezani';

  @override
  String get scaleFocusedCards => 'Kadi na vigae vilivyolengwa au kuelea juu';

  @override
  String get backgroundBackdrops => 'Mandharinyuma';

  @override
  String get showBackdropImages => 'Onyesha picha za mandhari nyuma ya maudhui';

  @override
  String get seriesThumbnails => 'Vijipicha vya mfululizo';

  @override
  String get seriesThumbnailsDescription =>
      'Vipindi pekee: tumia mchoro wa mfululizo unaolingana na kila aina ya picha ya safu mlalo';

  @override
  String get homeRowInfoOverlay => 'Uwekeleaji wa Taarifa za Safu ya Nyumbani';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Onyesha kichwa na metadata unapovinjari safu mlalo za mwanzo';

  @override
  String get clockDisplay => 'Onyesho la Saa';

  @override
  String get inMenus => 'Katika Menyu';

  @override
  String get inVideo => 'Katika Video';

  @override
  String get seasonalEffects => 'Athari za Msimu';

  @override
  String get seasonalEffectsDescription =>
      'Athari za kuona na mapambo ya msimu';

  @override
  String get snow => 'Theluji';

  @override
  String get fireworks => 'Fataki';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'Kuanguka Majani';

  @override
  String get themeMusic => 'Muziki wa Mandhari';

  @override
  String get playThemeMusicOnDetailPages =>
      'Cheza muziki wa mandhari kwenye kurasa za maelezo';

  @override
  String get themeMusicVolume => 'Sauti ya Muziki wa Mandhari';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows =>
      'Muziki wa Mandhari kwenye Safu Mlalo za Nyumbani';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Cheza unapovinjari skrini ya nyumbani';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'Ukungu wa Mandharinyuma ya Maelezo';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Ukungu wa Mandharinyuma ya Kuvinjari';

  @override
  String get maxStreamingBitrate => 'Upeo wa Bitrate ya Utiririshaji';

  @override
  String get maxResolution => 'Azimio la Juu';

  @override
  String get playerZoomMode => 'Modi ya Kukuza Mchezaji';

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
  String get fit => 'Inafaa';

  @override
  String get autoCrop => 'Mazao ya Kiotomatiki';

  @override
  String get stretch => 'Nyosha';

  @override
  String get refreshRateSwitching => 'Onyesha upya Kiwango cha Kubadilisha';

  @override
  String get disabled => 'Imezimwa';

  @override
  String get scaleOnTv => 'Kiwango kwenye TV';

  @override
  String get scaleOnDevice => 'Kupima kwenye Kifaa';

  @override
  String get trickPlay => 'Mchezo wa hila';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Onyesha vijipicha vya kukagua unapotafuta';

  @override
  String get showDescriptionOnPause => 'Onyesha Maelezo kuhusu Kusitisha';

  @override
  String get dimVideoShowOverview =>
      'Fifisha video na uonyeshe maandishi ya muhtasari huku umesitishwa';

  @override
  String get osdLockButton => 'Kitufe cha Kufunga OSD';

  @override
  String get osdLockButtonDescription =>
      'Onyesha kitufe cha kufunga kinachozuia ingizo la mguso hadi kibonyezwe kwa muda mrefu';

  @override
  String get audioBehavior => 'Tabia ya Sauti';

  @override
  String get downmixToStereo => 'Mchanganyiko wa chini hadi Stereo';

  @override
  String get defaultAudioLanguage => 'Lugha Chaguomsingi ya Sauti';

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
  String get autoServerDefault => 'Otomatiki (Chaguomsingi ya Seva)';

  @override
  String get english => 'Kiingereza';

  @override
  String get spanish => 'Kihispania';

  @override
  String get french => 'Kifaransa';

  @override
  String get german => 'Kijerumani';

  @override
  String get italian => 'Kiitaliano';

  @override
  String get portuguese => 'Kireno';

  @override
  String get japanese => 'Kijapani';

  @override
  String get korean => 'Kikorea';

  @override
  String get chinese => 'Kichina';

  @override
  String get russian => 'Kirusi';

  @override
  String get arabic => 'Kiarabu';

  @override
  String get hindi => 'Kihindi';

  @override
  String get dutch => 'Kiholanzi';

  @override
  String get swedish => 'Kiswidi';

  @override
  String get norwegian => 'Kinorwe';

  @override
  String get danish => 'Kideni';

  @override
  String get finnish => 'Kifini';

  @override
  String get polish => 'Kipolandi';

  @override
  String get ac3Passthrough => 'Njia ya AC3';

  @override
  String get dtsPassthrough => 'Njia ya DTS';

  @override
  String get trueHdSupport => 'Msaada wa TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Sauti ya Bitstream DTS kwa AVR pekee; inahitaji usaidizi wa mpokeaji na wimbo wa chanzo wa DTS';

  @override
  String get enableTrueHdAudio =>
      'Washa sauti ya TrueHD (huenda isifanye kazi kwenye mifumo yote)';

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
  String get nightMode => 'Hali ya Usiku';

  @override
  String get compressDynamicRange => 'Finyaza masafa yanayobadilika';

  @override
  String get advancedMpv => 'mpv ya hali ya juu';

  @override
  String get enableCustomMpvConf => 'Washa Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Tumia mpv.conf iliyoainishwa na mtumiaji kabla ya uchezaji kuanza';

  @override
  String get unsafeAdvancedMpvOptions => 'Chaguo za Kina za mpv zisizo salama';

  @override
  String get unsafeMpvOptionsDescription =>
      'Ruhusu seti pana ya chaguzi za mpv. Inaweza kuvunja tabia ya kucheza tena.';

  @override
  String get hardwareDecoding => 'Usimbuaji wa maunzi';

  @override
  String get hardwareDecodingSubtitle =>
      'Inaweza kuboresha utendakazi lakini inaweza kusababisha matatizo ya kucheza kwenye baadhi ya vifaa.';

  @override
  String get nextUpAndQueuing => 'Inayofuata na Kuweka Foleni';

  @override
  String get nextUpDisplay => 'Onyesho linalofuata';

  @override
  String get extended => 'Imepanuliwa';

  @override
  String get minimal => 'Ndogo';

  @override
  String get nextUpTimeout => 'Muda Unaofuata Umekwisha';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Kuweka Foleni kwa Vyombo vya Habari';

  @override
  String get autoQueueNextEpisodes => 'Panga vipindi vifuatavyo';

  @override
  String get stillWatchingPrompt => 'Bado Unatazama Uhakika';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Endelea na Uruke';

  @override
  String get resumeRewind => 'Endelea Kurudisha nyuma';

  @override
  String get unpauseRewind => 'Acha Kurejesha nyuma';

  @override
  String get fiveSeconds => '5 sekunde';

  @override
  String get tenSeconds => 'Sekunde 10';

  @override
  String get fifteenSeconds => 'Sekunde 15';

  @override
  String get thirtySeconds => 'Sekunde 30';

  @override
  String get skipBackLength => 'Ruka Urefu wa Nyuma';

  @override
  String get skipForwardLength => 'Ruka Urefu wa Mbele';

  @override
  String get customMpvConfPath => 'Njia maalum ya mpv.conf';

  @override
  String get notSetMpvConf =>
      'Haijawekwa. Moonfin itajaribu mpv.conf chaguo-msingi katika folda za programu/data.';

  @override
  String get selectMpvConf => 'Chagua mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Mipangilio ya mtindo (ukubwa, rangi, mkato) inatumika kwa manukuu yanayotegemea maandishi (SRT, VTT, TTML). Manukuu ya ASS/SSA hutumia mtindo wao wenyewe uliopachikwa isipokuwa \"ASS/SSA Direct Play\" imezimwa. Manukuu ya Bitmap (PGS, DVB, VobSub) hayawezi kubadilishwa mtindo.';

  @override
  String get defaultSubtitleLanguage => 'Lugha Chaguomsingi ya Manukuu';

  @override
  String get defaultToNoSubtitles => 'Chaguomsingi kwa Hakuna Manukuu';

  @override
  String get turnOffSubtitlesByDefault => 'Zima manukuu kwa chaguomsingi';

  @override
  String get subtitleSize => 'Ukubwa wa Manukuu';

  @override
  String get textFillColor => 'Rangi ya Kujaza Maandishi';

  @override
  String get backgroundColor => 'Rangi ya Mandharinyuma';

  @override
  String get textStrokeColor => 'Rangi ya Kiharusi cha Maandishi';

  @override
  String get subtitleCustomization => 'Kubinafsisha Manukuu';

  @override
  String get subtitleCustomizationDescription =>
      'Badilisha mwonekano wa manukuu kukufaa';

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
      'Mbweha wa kahawia haraka anaruka juu ya mbwa mvivu';

  @override
  String get verticalOffset => 'Wima Offset';

  @override
  String get pgsDirectPlay => 'Uchezaji wa moja kwa moja wa PGS';

  @override
  String get directPlayPgsSubtitles => 'Cheza manukuu ya PGS moja kwa moja';

  @override
  String get assSsaDirectPlay => 'Uchezaji wa moja kwa moja wa ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Cheza manukuu ya ASS/SSA moja kwa moja';

  @override
  String get white => 'Nyeupe';

  @override
  String get black => 'Nyeusi';

  @override
  String get yellow => 'Njano';

  @override
  String get green => 'Kijani';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Nyekundu';

  @override
  String get transparent => 'Uwazi';

  @override
  String get semiTransparentBlack => 'Nusu-wazi Nyeusi';

  @override
  String get global => 'Ulimwenguni';

  @override
  String get desktop => 'Eneo-kazi';

  @override
  String get mobile => 'Simu ya Mkononi';

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
  String get customizationProfile => 'Wasifu wa Kubinafsisha';

  @override
  String get customizationProfileDescription =>
      'Chagua wasifu wa kupakia, kuhariri na kusawazisha. Global inatumika kila mahali isipokuwa wasifu wa kifaa uubatilishe. Kitone cha kijani kinaonyesha wasifu wako wa sasa wa kifaa.';

  @override
  String get loadProfile => 'Pakia Wasifu';

  @override
  String get syncing => 'Inasawazisha...';

  @override
  String get syncToProfile => 'Sawazisha kwa Wasifu';

  @override
  String get profileSyncHidden => 'Usawazishaji wa Wasifu Umefichwa';

  @override
  String get enablePluginSyncDescription =>
      'Washa Usawazishaji wa Programu-jalizi ya Seva katika mipangilio ya Programu-jalizi ili kuonyesha vidhibiti vya wasifu hapa.';

  @override
  String get quality => 'Ubora';

  @override
  String get defaultDownloadQuality => 'Ubora Chaguomsingi wa Upakuaji';

  @override
  String get network => 'Mtandao';

  @override
  String get wifiOnlyDownloads => 'Vipakuliwa vya WiFi Pekee';

  @override
  String get onlyDownloadOnWifi => 'Pakua tu wakati umeunganishwa kwenye WiFi';

  @override
  String get storage => 'Hifadhi';

  @override
  String get storageUsed => 'Hifadhi Imetumika';

  @override
  String get manage => 'Dhibiti';

  @override
  String get calculating => 'Inakokotoa...';

  @override
  String get downloadLocation => 'Pakua Mahali';

  @override
  String get defaultLabel => 'Chaguomsingi';

  @override
  String get saveToDownloadsFolder => 'Hifadhi kwenye folda ya Vipakuliwa';

  @override
  String get downloadsVisibleToOtherApps =>
      'Vipakuliwa/Moonfin — inaonekana kwa programu zingine';

  @override
  String get dangerZone => 'Eneo la Hatari';

  @override
  String get clearAllDownloads => 'Futa Vipakuliwa Vyote';

  @override
  String get original => 'Asili';

  @override
  String get changeDownloadLocation => 'Badilisha Mahali pa Kupakua';

  @override
  String get changeDownloadLocationDescription =>
      'Vipakuliwa vipya vitahifadhiwa kwenye folda iliyochaguliwa. Vipakuliwa vilivyopo vitasalia katika eneo vilipo sasa na vinaweza kudhibitiwa kutoka kwa mipangilio ya Hifadhi.';

  @override
  String get confirm => 'Thibitisha';

  @override
  String get cannotWriteToFolder =>
      'Haiwezi kuandika kwa folda iliyochaguliwa. Tafadhali chagua eneo tofauti au toa vibali vya kuhifadhi.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Ungependa kuhifadhi kwenye folda ya Vipakuliwa?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Midia iliyopakuliwa itahifadhiwa kwenye Vipakuliwa/Moonfin kwenye kifaa chako. Faili hizi zitaonekana kwa programu zingine kama vile ghala yako au kicheza muziki.\n\nVipakuliwa vilivyopo vitasalia katika eneo vilipo sasa.';

  @override
  String get enable => 'Wezesha';

  @override
  String get clearAllDownloadsWarning =>
      'Hii itafuta midia yote iliyopakuliwa na haiwezi kutenduliwa.';

  @override
  String get clearAll => 'Futa Zote';

  @override
  String get navigationStyle => 'Mtindo wa Urambazaji';

  @override
  String get topBar => 'Upau wa Juu';

  @override
  String get leftSidebar => 'Utepe wa Kushoto';

  @override
  String get showShuffleButton => 'Onyesha Kitufe cha Changanya';

  @override
  String get showGenresButton => 'Onyesha Kitufe cha Aina';

  @override
  String get showFavoritesButton => 'Onyesha Kitufe cha Vipendwa';

  @override
  String get showLibrariesInToolbar => 'Onyesha Maktaba kwenye Upauzana';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'Uwazi wa Upau wa Urambazaji';

  @override
  String get navbarColor => 'Rangi ya Upau wa Urambazaji';

  @override
  String get gray => 'Kijivu';

  @override
  String get darkBlue => 'Bluu iliyokolea';

  @override
  String get purple => 'Zambarau';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Navy';

  @override
  String get charcoal => 'Mkaa';

  @override
  String get brown => 'Brown';

  @override
  String get darkRed => 'Nyekundu Iliyokolea';

  @override
  String get darkGreen => 'Kijani Kijani';

  @override
  String get slate => 'Slate';

  @override
  String get indigo => 'Kihindi';

  @override
  String get libraryDisplay => 'Onyesho la Maktaba';

  @override
  String get posterLabel => 'Bango';

  @override
  String get thumbnailLabel => 'Kijipicha';

  @override
  String get bannerLabel => 'Bango';

  @override
  String get overridePerLibrarySettings =>
      'Batilisha Mipangilio ya Kila Maktaba';

  @override
  String get applyImageTypeToAllLibraries =>
      'Tumia aina ya picha kwenye maktaba zote';

  @override
  String get multiServerLibraries => 'Maktaba za Seva nyingi';

  @override
  String get showLibrariesFromAllServers =>
      'Onyesha maktaba kutoka kwa seva zote zilizounganishwa';

  @override
  String get enableFolderView => 'Washa Mwonekano wa Folda';

  @override
  String get showFolderBrowsingOption =>
      'Onyesha chaguo la kuvinjari kwenye folda';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Mwonekano wa Maktaba';

  @override
  String get libraryVisibilityDescription =>
      'Geuza mwonekano wa ukurasa wa nyumbani kwa kila maktaba. Anzisha tena Moonfin ili mabadiliko yaanze kutumika.';

  @override
  String get showInNavigation => 'Onyesha katika urambazaji';

  @override
  String get showInLatestMedia => 'Onyesha kwenye media za hivi punde';

  @override
  String get sourceLibraries => 'Maktaba za Chanzo';

  @override
  String get sourceCollections => 'Makusanyo ya Chanzo';

  @override
  String get excludedGenres => 'Aina Zisizojumuishwa';

  @override
  String get selectAll => 'Chagua Zote';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Upau wa Vyombo vya habari';

  @override
  String get mediaSources => 'Vyanzo vya Vyombo vya Habari';

  @override
  String get behavior => 'Tabia';

  @override
  String get seconds => 'sekunde';

  @override
  String get localPreviews => 'Muhtasari wa Karibu Nawe';

  @override
  String get localPreviewsDescription =>
      'Sanidi trela, midia na onyesho la kukagua sauti.';

  @override
  String get mediaBarMode => 'Mtindo wa Baa ya Vyombo vya habari';

  @override
  String get mediaBarModeDescription =>
      'Chagua kati ya mitindo mbalimbali ya upau wa midia, au zima upau wa midia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Imezimwa';

  @override
  String get enableMediaBar => 'Washa Upau wa Midia';

  @override
  String get showFeaturedContentSlideshow =>
      'Onyesha onyesho la slaidi la maudhui yaliyoangaziwa nyumbani';

  @override
  String get contentType => 'Aina ya Maudhui';

  @override
  String get moviesAndTvShows => 'Filamu na Vipindi vya Televisheni';

  @override
  String get moviesOnly => 'Filamu Pekee';

  @override
  String get tvShowsOnly => 'Vipindi vya Televisheni Pekee';

  @override
  String get itemCount => 'Hesabu ya Bidhaa';

  @override
  String get noneSelected => 'Hakuna iliyochaguliwa';

  @override
  String get noneExcluded => 'Hakuna iliyotengwa';

  @override
  String get autoAdvance => 'Maendeleo ya Kiotomatiki';

  @override
  String get autoAdvanceSlides =>
      'Sogeza kiotomatiki hadi kwenye slaidi inayofuata';

  @override
  String get autoAdvanceInterval => 'Muda wa Mapema Otomatiki';

  @override
  String get trailerPreview => 'Onyesho la Kuchungulia Trela';

  @override
  String get autoPlayTrailers =>
      'Cheza trela kiotomatiki kwenye upau wa midia baada ya sekunde 3';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => 'Muhtasari wa Kipindi';

  @override
  String get mediaPreview => 'Hakiki ya Vyombo vya Habari';

  @override
  String get episodePreviewDescription =>
      'Cheza onyesho la kuchungulia la ndani la sekunde 30 kwenye kadi zilizolengwa, zinazoelea au zilizobonyezwa kwa muda mrefu';

  @override
  String get mediaPreviewDescription =>
      'Cheza onyesho la kuchungulia la ndani la sekunde 30 kwenye kadi zilizolengwa, zinazoelea au zilizobonyezwa kwa muda mrefu';

  @override
  String get previewAudio => 'Hakiki Sauti';

  @override
  String get enablePreviewAudio =>
      'Washa sauti kwa maonyesho ya trela na vipindi';

  @override
  String get latestMedia => 'Vyombo vya Habari vya Hivi Punde';

  @override
  String get recentlyReleased => 'Iliyotolewa Hivi Karibuni';

  @override
  String get myMedia => 'Vyombo vya Habari Vyangu';

  @override
  String get myMediaSmall => 'Vyombo vya Habari Vyangu (Ndogo)';

  @override
  String get continueWatching => 'Endelea Kutazama';

  @override
  String get resumeAudio => 'Rejesha Sauti';

  @override
  String get resumeBooks => 'Rejesha Vitabu';

  @override
  String get activeRecordings => 'Rekodi Zinazotumika';

  @override
  String get playlists => 'Orodha za kucheza';

  @override
  String get liveTV => 'TV ya moja kwa moja';

  @override
  String get homeSections => 'Sehemu za Nyumbani';

  @override
  String get resetToDefaults => 'Weka upya kwa chaguomsingi';

  @override
  String get homeRowPosterSize => 'Ukubwa wa Bango la Safu ya Nyumbani';

  @override
  String get perRowImageTypeSelection =>
      'Uteuzi wa Aina ya Picha kwa Safu Mlalo';

  @override
  String get configureImageTypeForEachRow =>
      'Sanidi aina ya picha kwa kila safu mlalo ya nyumbani iliyowezeshwa';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Unganisha Endelea Kutazama na Inayofuata';

  @override
  String get combineBothRows =>
      'Changanya safu zote mbili kwenye sehemu moja ya nyumbani';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Aina ya Picha kwa Safu Mlalo';

  @override
  String get perRowSettings => 'Mipangilio ya Kila Safu';

  @override
  String get autoLogin => 'Ingia kiotomatiki';

  @override
  String get lastUser => 'Mtumiaji wa Mwisho';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'Thibitisha kila wakati';

  @override
  String get requirePasswordWithToken =>
      'Inahitaji nenosiri hata kwa tokeni iliyohifadhiwa';

  @override
  String get confirmExit => 'Thibitisha Toka';

  @override
  String get showConfirmationBeforeExiting =>
      'Onyesha uthibitisho kabla ya kuondoka';

  @override
  String get blockContentWithRatings => 'Zuia maudhui kwa ukadiriaji ufuatao:';

  @override
  String get noContentRatingsFound =>
      'Bado hakuna ukadiriaji wa maudhui uliopatikana kwenye seva hii.';

  @override
  String get couldNotLoadServerRatings =>
      'Haikuweza kupakia ukadiriaji wa seva. Inaonyesha ukadiriaji uliohifadhiwa pekee.';

  @override
  String get couldNotRefreshRatings =>
      'Haikuweza kuonyesha upya ukadiriaji kutoka kwa seva. Inaonyesha ukadiriaji uliohifadhiwa.';

  @override
  String get enablePinCode => 'Washa Msimbo wa PIN';

  @override
  String get requirePinToAccess => 'Inahitaji PIN ili kufikia akaunti yako';

  @override
  String get changePin => 'Badilisha PIN';

  @override
  String get setNewPinCode => 'Weka msimbo mpya wa PIN';

  @override
  String get removePin => 'Ondoa PIN';

  @override
  String get removePinProtection => 'Ondoa ulinzi wa msimbo wa PIN';

  @override
  String get screensaver => 'Bongo';

  @override
  String get inAppScreensaver => 'Kiokoa skrini cha Ndani ya Programu';

  @override
  String get enableBuiltInScreensaver =>
      'Washa kihifadhi skrini kilichojengewa ndani';

  @override
  String get mode => 'Hali';

  @override
  String get libraryArt => 'Sanaa ya Maktaba';

  @override
  String get logo => 'Nembo';

  @override
  String get clock => 'Saa';

  @override
  String get timeout => 'Muda umekwisha';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Kiwango cha Kufifia';

  @override
  String get maxAgeRating => 'Ukadiriaji wa Umri wa Juu';

  @override
  String get any => 'Yoyote';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Inahitaji Ukadiriaji wa Umri';

  @override
  String get onlyShowRatedContent => 'Onyesha maudhui yaliyokadiriwa pekee';

  @override
  String get showClock => 'Onyesha Saa';

  @override
  String get displayClockDuringScreensaver => 'Onyesha saa wakati wa skrini';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'Nyanya zilizooza (Wakosoaji)';

  @override
  String get rottenTomatoesAudience => 'Nyanya zilizooza (Hadhira)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Mtumiaji)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ukadiriaji wa Jumuiya';

  @override
  String get ratings => 'Ukadiriaji';

  @override
  String get additionalRatings => 'Ukadiriaji wa Ziada';

  @override
  String get showMdbListAndTmdbRatings =>
      'Onyesha ukadiriaji wa MDBLlist na TMDB';

  @override
  String get ratingLabels => 'Lebo za Ukadiriaji';

  @override
  String get showLabelsNextToIcons =>
      'Onyesha lebo karibu na aikoni za ukadiriaji';

  @override
  String get ratingBadges => 'Beji za Ukadiriaji';

  @override
  String get showDecorativeBadges =>
      'Onyesha beji za mapambo nyuma ya ukadiriaji';

  @override
  String get episodeRatings => 'Ukadiriaji wa Vipindi';

  @override
  String get showRatingsOnEpisodes =>
      'Onyesha ukadiriaji kwenye vipindi mahususi';

  @override
  String get ratingSources => 'Vyanzo vya Ukadiriaji';

  @override
  String get ratingSourcesDescription =>
      'Washa na upange upya vyanzo vya ukadiriaji vinavyoonyeshwa kwenye programu nzima';

  @override
  String get pluginLabel => 'Programu-jalizi';

  @override
  String get pluginDetected => 'Programu-jalizi Imegunduliwa';

  @override
  String get pluginNotDetected => 'Programu-jalizi Haijagunduliwa';

  @override
  String get pluginDetectedDescription =>
      'Programu-jalizi ya seva imegunduliwa. Usawazishaji umewashwa kiotomatiki mara ya kwanza programu-jalizi inapopatikana.';

  @override
  String get pluginNotDetectedDescription =>
      'Programu-jalizi ya seva haijatambuliwa kwa sasa. Mipangilio ya ndani bado inatumia thamani zilizohifadhiwa au chaguomsingi zilizojumuishwa.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Huduma Zinazopatikana';

  @override
  String get serverPluginSync => 'Usawazishaji wa Programu-jalizi ya Seva';

  @override
  String get syncSettingsWithPlugin =>
      'Sawazisha mipangilio na programu-jalizi ya seva';

  @override
  String get whatSyncControls => 'Vidhibiti vipi vya kusawazisha';

  @override
  String get syncControlsDescription =>
      'Usawazishaji hudhibiti tu ikiwa mipangilio inayoungwa mkono na programu-jalizi inasukumwa hadi na kuvutwa kutoka kwa seva. Uteuzi wa wasifu na vitendo vya kusawazisha wasifu viko katika mipangilio ya Kubinafsisha wakati usawazishaji wa programu-jalizi umewashwa.';

  @override
  String get recentRequests => 'Maombi ya Hivi Karibuni';

  @override
  String get recentlyAdded => 'Iliyoongezwa Hivi Karibuni';

  @override
  String get trending => 'Zinazovuma';

  @override
  String get popularMovies => 'Filamu Maarufu';

  @override
  String get movieGenres => 'Aina za Filamu';

  @override
  String get upcomingMovies => 'Filamu Zinazokuja';

  @override
  String get studios => 'Studios';

  @override
  String get popularSeries => 'Mfululizo Maarufu';

  @override
  String get seriesGenres => 'Aina za Msururu';

  @override
  String get upcomingSeries => 'Msururu Ujao';

  @override
  String get networks => 'Mitandao';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'Weka upya safu mlalo ziwe chaguomsingi';

  @override
  String get enableSeerr => 'Washa Kionaji';

  @override
  String get showSeerrInNavigation =>
      'Onyesha Seerr katika urambazaji (inahitaji programu-jalizi ya seva)';

  @override
  String get seerrUnavailable =>
      'Haipatikani kwa sababu utumizi wa programu-jalizi ya seva ya Seerr umezimwa.';

  @override
  String get nsfwFilter => 'Kichujio cha NSFW';

  @override
  String get hideAdultContent => 'Ficha maudhui ya watu wazima katika matokeo';

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
  String get discoverRows => 'Gundua Safu';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Buruta ili kupanga upya. Washa au uzime safu mlalo. Usawazishaji wa mpangilio wa safu mlalo uliowezeshwa na programu-jalizi ya Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Buruta ili kupanga upya. Washa au uzime safu mlalo.';

  @override
  String get enabled => 'Imewashwa';

  @override
  String get hidden => 'Imefichwa';

  @override
  String get aboutTitle => 'Kuhusu';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Leseni za Chanzo Huria';

  @override
  String get sourceCode => 'Msimbo wa Chanzo';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Angalia Sasisho Sasa';

  @override
  String get checksLatestDesktopRelease =>
      'Huangalia toleo jipya zaidi la eneo-kazi la jukwaa hili';

  @override
  String get youAreUpToDate => 'Umesasishwa.';

  @override
  String get couldNotCheckForUpdates =>
      'Haikuweza kuangalia masasisho kwa sasa.';

  @override
  String get noCompatibleUpdate =>
      'Hakuna kifurushi kinachooana cha sasisho kilichopatikana kwa mfumo huu.';

  @override
  String get updateChecksNotSupported =>
      'Ukaguzi wa sasisho hautumiki kwenye mfumo huu.';

  @override
  String get updateNotificationsDisabled => 'Arifa za sasisho zimezimwa.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Tafadhali subiri kabla ya kuangalia tena.';

  @override
  String get latestUpdateAlreadyShown =>
      'Sasisho la hivi punde tayari limeonyeshwa.';

  @override
  String get updateAvailable => 'Sasisho linapatikana.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Sasisha Arifa';

  @override
  String get showWhenUpdatesAvailable =>
      'Onyesha wakati masasisho yanapatikana';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Soma Vidokezo vya Kutolewa';

  @override
  String get downloadingUpdate => 'Inapakua sasisho...';

  @override
  String get updateDownloadFailed =>
      'Imeshindwa kupakua. Tafadhali jaribu tena.';

  @override
  String get openReleasesPage => 'Fungua Ukurasa wa Matoleo';

  @override
  String get navigation => 'Urambazaji';

  @override
  String get watchedIndicatorsBackdrops => 'Viashiria vilivyotazamwa, mandhari';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Rangi ya kuzingatia, viashiria vilivyotazamwa, mandhari';

  @override
  String get navbarStyleToolbarAppearance =>
      'Mtindo wa Upau wa Uelekezaji, vifungo vya upau wa vidhibiti, mwonekano';

  @override
  String get reorderToggleHomeRows =>
      'Panga upya na ugeuze safu mlalo za nyumbani';

  @override
  String get featuredContentAppearance => 'Maudhui yaliyoangaziwa, mwonekano';

  @override
  String get posterSizeImageTypeFolderView =>
      'Saizi ya bango, aina ya picha, mwonekano wa folda';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBLlist, TMDB, na vyanzo vya ukadiriaji';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Wazi';

  @override
  String get browse => 'Vinjari';

  @override
  String get noResults => 'Hakuna matokeo';

  @override
  String get seerrAvailableStatus => 'Inapatikana';

  @override
  String get seerrRequestedStatus => 'Umeomba';

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
  String get seerrSettings => 'Mipangilio ya Mtazamaji';

  @override
  String get requestMore => 'Omba Zaidi';

  @override
  String get request => 'Ombi';

  @override
  String get cancelRequest => 'Ghairi Ombi';

  @override
  String get playInMoonfin => 'Cheza katika Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Idhinisha';

  @override
  String get declineAction => 'Kataa';

  @override
  String get similar => 'Sawa';

  @override
  String get recommendations => 'Mapendekezo';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Weka';

  @override
  String get itemNotFoundInLibrary =>
      'Kipengee hakipatikani kwenye maktaba yako ya Moonfin';

  @override
  String get errorSearchingLibrary => 'Hitilafu katika kutafuta maktaba';

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
  String get submitRequest => 'Wasilisha Ombi';

  @override
  String get allSeasons => 'Misimu Yote';

  @override
  String get advancedOptions => 'Chaguzi za Juu';

  @override
  String get noServiceServersConfigured =>
      'Hakuna seva za huduma zilizosanidiwa';

  @override
  String get server => 'Seva';

  @override
  String get qualityProfile => 'Wasifu wa Ubora';

  @override
  String get rootFolder => 'Folda ya Mizizi';

  @override
  String get showMore => 'Onyesha Zaidi';

  @override
  String get appearances => 'Mwonekano';

  @override
  String get crewSection => 'Wafanyakazi';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Hakuna maombi';

  @override
  String get pendingStatus => 'Inasubiri';

  @override
  String get declinedStatus => 'Imekataliwa';

  @override
  String get partiallyAvailable => 'Inapatikana kwa Kiasi';

  @override
  String get downloadingStatus => 'Inapakua';

  @override
  String get approvedStatus => 'Imeidhinishwa';

  @override
  String get notRequestedStatus => 'Haijaombwa';

  @override
  String get blocklistedStatus => 'Imezuiwa';

  @override
  String get deletedStatus => 'Imefutwa';

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
  String get tmdbScore => 'Alama ya TMDB';

  @override
  String get releaseDateLabel => 'Tarehe ya Kutolewa';

  @override
  String get firstAirDateLabel => 'Tarehe ya Kwanza ya Hewa';

  @override
  String get revenueLabel => 'Mapato';

  @override
  String get runtimeLabel => 'Muda wa kukimbia';

  @override
  String get budgetLabel => 'Bajeti';

  @override
  String get originalLanguageLabel => 'Lugha Asilia';

  @override
  String get seasonsLabel => 'Misimu';

  @override
  String get episodesLabel => 'Vipindi';

  @override
  String get access => 'Ufikiaji';

  @override
  String get add => 'Ongeza';

  @override
  String get address => 'Anwani';

  @override
  String get analytics => 'Uchanganuzi';

  @override
  String get catalog => 'Katalogi';

  @override
  String get content => 'Maudhui';

  @override
  String get copy => 'Nakili';

  @override
  String get create => 'Unda';

  @override
  String get disable => 'Zima';

  @override
  String get done => 'Imekamilika';

  @override
  String get edit => 'Hariri';

  @override
  String get encoding => 'Usimbaji';

  @override
  String get error => 'Hitilafu';

  @override
  String get forward => 'Mbele';

  @override
  String get general => 'Mkuu';

  @override
  String get go => 'Nenda';

  @override
  String get install => 'Sakinisha';

  @override
  String get installed => 'Imesakinishwa';

  @override
  String get interval => 'Muda';

  @override
  String get name => 'Jina';

  @override
  String get networking => 'Mtandao';

  @override
  String get next => 'Inayofuata';

  @override
  String get path => 'Njia';

  @override
  String get paused => 'Imesitishwa';

  @override
  String get permissions => 'Ruhusa';

  @override
  String get processing => 'Inachakata';

  @override
  String get profile => 'Wasifu';

  @override
  String get provider => 'Mtoa huduma';

  @override
  String get refresh => 'Onyesha upya';

  @override
  String get remote => 'Mbali';

  @override
  String get rename => 'Badilisha jina';

  @override
  String get revoke => 'Batilisha';

  @override
  String get role => 'Jukumu';

  @override
  String get root => 'Mzizi';

  @override
  String get run => 'Kimbia';

  @override
  String get search => 'Tafuta';

  @override
  String get select => 'Chagua';

  @override
  String get send => 'Tuma';

  @override
  String get sessions => 'Vikao';

  @override
  String get set => 'Weka';

  @override
  String get status => 'Hali';

  @override
  String get stop => 'Acha';

  @override
  String get streaming => 'Kutiririsha';

  @override
  String get time => 'Muda';

  @override
  String get trickplay => 'Mchezo wa hila';

  @override
  String get uninstall => 'Sanidua';

  @override
  String get up => 'Juu';

  @override
  String get update => 'Sasisha';

  @override
  String get upload => 'Pakia';

  @override
  String get unmute => 'Rejesha sauti';

  @override
  String get mute => 'Nyamazisha';

  @override
  String get branding => 'Kuweka chapa';

  @override
  String get adminDrawerDashboard => 'Dashibodi';

  @override
  String get adminDrawerAnalytics => 'Uchanganuzi';

  @override
  String get adminDrawerSettings => 'Mipangilio';

  @override
  String get adminDrawerBranding => 'Kuweka chapa';

  @override
  String get adminDrawerUsers => 'Watumiaji';

  @override
  String get adminDrawerLibraries => 'Maktaba';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'Kubadilisha msimbo';

  @override
  String get adminDrawerResume => 'Endelea';

  @override
  String get adminDrawerStreaming => 'Kutiririsha';

  @override
  String get adminDrawerTrickplay => 'Mchezo wa hila';

  @override
  String get adminDrawerDevices => 'Vifaa';

  @override
  String get adminDrawerActivity => 'Shughuli';

  @override
  String get adminDrawerNetworking => 'Mtandao';

  @override
  String get adminDrawerApiKeys => 'Vifunguo vya API';

  @override
  String get adminDrawerBackups => 'Hifadhi rudufu';

  @override
  String get adminDrawerLogs => 'Kumbukumbu';

  @override
  String get adminDrawerScheduledTasks => 'Kazi Zilizoratibiwa';

  @override
  String get adminDrawerPlugins => 'Programu-jalizi';

  @override
  String get adminDrawerRepositories => 'hazina';

  @override
  String get adminDrawerLiveTv => 'TV ya moja kwa moja';

  @override
  String get adminExitTooltip => 'Ondoka kwa Msimamizi';

  @override
  String get adminDashboardLoadFailed => 'Imeshindwa kupakia dashibodi';

  @override
  String get adminMediaOverview => 'Muhtasari wa Vyombo vya Habari';

  @override
  String get adminMediaTotalsError =>
      'Haikuweza kupakia jumla ya midia ya seva.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Usomaji wa haraka wa ni kiasi gani cha maudhui kwenye seva hii.';

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
  String get analyticsMediaDistribution => 'Usambazaji wa Vyombo vya Habari';

  @override
  String get analyticsVideoCodecs => 'Codecs za Video';

  @override
  String get analyticsAudioCodecs => 'Kodeki za Sauti';

  @override
  String get analyticsContainers => 'Vyombo';

  @override
  String get analyticsTopGenres => 'Aina za Juu';

  @override
  String get analyticsReleaseYears => 'Miaka ya Kutolewa';

  @override
  String get analyticsContentRatings => 'Ukadiriaji wa Maudhui';

  @override
  String get analyticsRuntimeBuckets => 'Ndoo za Runtime';

  @override
  String get analyticsFileFormats => 'Miundo ya Faili';

  @override
  String get analyticsNoData => 'Hakuna Data Inayopatikana.';

  @override
  String get adminServerInfo => 'Taarifa za Seva';

  @override
  String get adminRestartPending => 'Anzisha tena Inasubiri';

  @override
  String get adminServerPaths => 'Njia za seva';

  @override
  String get adminServerActions => 'Vitendo vya Seva';

  @override
  String get adminRestartServer => 'Anzisha tena Seva';

  @override
  String get adminShutdownServer => 'Zima Seva';

  @override
  String get adminScanLibraries => 'Changanua Maktaba';

  @override
  String get adminLibraryScanStarted => 'Uchanganuzi wa maktaba umeanza';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Kuwasha upya seva kunaendelea';

  @override
  String get adminServerRebootMessage =>
      'Kuwasha upya seva kunaendelea, tafadhali anzisha upya Moonfin';

  @override
  String get adminActiveSessions => 'Vipindi Amilifu';

  @override
  String get adminSessionsLoadFailed => 'Imeshindwa kupakia vipindi';

  @override
  String get adminNoActiveSessions => 'Hakuna vipindi vinavyotumika';

  @override
  String get adminRecentActivity => 'Shughuli ya Hivi Karibuni';

  @override
  String get adminNoRecentActivity => 'Hakuna shughuli za hivi majuzi';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Tuma Ujumbe';

  @override
  String get adminMessageTextHint => 'Nakala ya ujumbe';

  @override
  String get adminSetVolume => 'Weka Kiasi';

  @override
  String get sessionPrev => 'Iliyotangulia';

  @override
  String get sessionRewind => 'Rudisha nyuma';

  @override
  String get sessionForward => 'Mbele';

  @override
  String get sessionNext => 'Inayofuata';

  @override
  String get sessionVolumeDown => 'Volu -';

  @override
  String get sessionVolumeUp => 'Juzuu +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sasa Inacheza';

  @override
  String get volume => 'Kiasi';

  @override
  String get actions => 'Vitendo';

  @override
  String get videoCodec => 'Kodeki ya Video';

  @override
  String get audioCodec => 'Kodeki ya Sauti';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Kukamilika';

  @override
  String get direct => 'Moja kwa moja';

  @override
  String get adminDisconnect => 'Tenganisha';

  @override
  String get adminClearDates => 'Tarehe wazi';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Hakuna maingizo ya shughuli';

  @override
  String get adminEditDeviceName => 'Hariri Jina la Kifaa';

  @override
  String get adminCustomName => 'Jina Maalum';

  @override
  String get adminDeviceNameUpdated => 'Jina la kifaa limesasishwa';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Futa Kifaa';

  @override
  String get adminDeviceDeleted => 'Kifaa kimefutwa';

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
  String get adminDevicesLoadFailed => 'Imeshindwa kupakia vifaa';

  @override
  String get adminSearchDevices => 'Tafuta vifaa';

  @override
  String get adminThisDevice => 'Kifaa hiki';

  @override
  String get adminEditName => 'Hariri Jina';

  @override
  String get adminLibrariesLoadFailed => 'Imeshindwa kupakia maktaba';

  @override
  String get adminNoLibraries => 'Hakuna maktaba zilizosanidiwa';

  @override
  String get adminScanAllLibraries => 'Changanua Maktaba Zote';

  @override
  String get adminAddLibrary => 'Ongeza Maktaba';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Badilisha jina la Maktaba';

  @override
  String get adminNewName => 'Jina jipya';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Futa Maktaba';

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
  String get adminRemovePath => 'Ondoa Njia';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Chaguo za maktaba zimehifadhiwa';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Imeshindwa kupakia maktaba';

  @override
  String get adminNoMediaPaths => 'Hakuna njia za midia zilizosanidiwa';

  @override
  String get adminAddPath => 'Ongeza Njia';

  @override
  String get adminBrowseFilesystem => 'Vinjari mfumo wa faili wa seva:';

  @override
  String get adminSaveOptions => 'Hifadhi Chaguo';

  @override
  String get adminPreferredMetadataLanguage =>
      'Lugha ya metadata inayopendekezwa';

  @override
  String get adminMetadataLanguageHint => 'k.m. sw, de, fr';

  @override
  String get adminMetadataCountryCode => 'Msimbo wa nchi wa metadata';

  @override
  String get adminMetadataCountryHint => 'k.m. Marekani, DE, FR';

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
  String get adminLibraryNameRequired => 'Jina la maktaba linahitajika';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Jina la Maktaba';

  @override
  String get adminSelectedPaths => 'Njia Zilizochaguliwa:';

  @override
  String get adminNoPathsAdded =>
      'Hakuna njia zilizoongezwa (zinaweza kuongezwa baadaye)';

  @override
  String get adminCreateLibrary => 'Unda Maktaba';

  @override
  String get paths => 'Njia:';

  @override
  String get adminDisableUser => 'Zima Mtumiaji';

  @override
  String get adminEnableUser => 'Wezesha Mtumiaji';

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
  String get adminUsersLoadFailed => 'Imeshindwa kupakia watumiaji';

  @override
  String get adminSearchUsers => 'Tafuta watumiaji';

  @override
  String get adminEditUser => 'Badilisha Mtumiaji';

  @override
  String get adminAddUser => 'Ongeza Mtumiaji';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Unda Mtumiaji';

  @override
  String get adminPasswordOptional => 'Nenosiri (si lazima)';

  @override
  String get adminUsernameRequired => 'Jina la mtumiaji haliwezi kuwa tupu';

  @override
  String get adminNoProfileChanges =>
      'Hakuna mabadiliko ya wasifu ya kuhifadhi';

  @override
  String get adminProfileSaved => 'Wasifu umehifadhiwa';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Ruhusa zimehifadhiwa';

  @override
  String get adminPasswordsMismatch => 'Manenosiri hayalingani';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Imeshindwa kupakia mtumiaji';

  @override
  String get adminBackToUsers => 'Rudi kwa Watumiaji';

  @override
  String get adminSaveProfile => 'Hifadhi Wasifu';

  @override
  String get adminDeleteUser => 'Futa Mtumiaji';

  @override
  String get admin => 'Msimamizi';

  @override
  String get adminFullAccessWarning =>
      'Wasimamizi wana ufikiaji kamili kwa seva. Toa kwa tahadhari.';

  @override
  String get administrator => 'Msimamizi';

  @override
  String get adminHiddenUser => 'Mtumiaji aliyefichwa';

  @override
  String get adminAllowMediaPlayback => 'Ruhusu uchezaji wa maudhui';

  @override
  String get adminAllowAudioTranscoding => 'Ruhusu upitishaji wa sauti';

  @override
  String get adminAllowVideoTranscoding => 'Ruhusu upitishaji msimbo wa video';

  @override
  String get adminAllowRemuxing => 'Ruhusu remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Lazimisha upitishaji wa chanzo cha mbali';

  @override
  String get adminAllowContentDeletion => 'Ruhusu ufutaji wa maudhui';

  @override
  String get adminAllowContentDownloading => 'Ruhusu upakuaji wa maudhui';

  @override
  String get adminAllowPublicSharing => 'Ruhusu kushiriki kwa umma';

  @override
  String get adminAllowRemoteControl =>
      'Ruhusu udhibiti wa mbali wa watumiaji wengine';

  @override
  String get adminAllowSharedDeviceControl =>
      'Ruhusu udhibiti wa kifaa kilichoshirikiwa';

  @override
  String get adminAllowRemoteAccess => 'Ruhusu ufikiaji wa mbali';

  @override
  String get adminRemoteBitrateLimit =>
      'Kikomo cha kasi ya biti ya mteja wa mbali (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Acha tupu bila kikomo';

  @override
  String get adminMaxActiveSessions => 'Upeo wa vipindi vinavyotumika';

  @override
  String get adminAllowLiveTvAccess => 'Ruhusu ufikiaji wa TV ya Moja kwa Moja';

  @override
  String get adminAllowLiveTvManagement =>
      'Ruhusu udhibiti wa TV ya Moja kwa Moja';

  @override
  String get adminAllowCollectionManagement => 'Ruhusu usimamizi wa mkusanyiko';

  @override
  String get adminAllowSubtitleManagement => 'Ruhusu usimamizi wa manukuu';

  @override
  String get adminAllowLyricManagement => 'Ruhusu usimamizi wa sauti';

  @override
  String get adminSavePermissions => 'Hifadhi Ruhusa';

  @override
  String get adminEnableAllLibraryAccess => 'Washa ufikiaji wa maktaba zote';

  @override
  String get adminSaveAccess => 'Hifadhi Ufikiaji';

  @override
  String get adminChangePassword => 'Badilisha Nenosiri';

  @override
  String get adminNewPassword => 'Nenosiri Mpya';

  @override
  String get adminConfirmPassword => 'Thibitisha Nenosiri';

  @override
  String get adminSetPassword => 'Weka Nenosiri';

  @override
  String get adminResetPassword => 'Weka upya Nenosiri';

  @override
  String get adminPasswordReset => 'Weka upya nenosiri';

  @override
  String get adminPasswordUpdated => 'Nenosiri limesasishwa';

  @override
  String get adminUserSettings => 'Mipangilio ya Mtumiaji';

  @override
  String get adminLibraryAccess => 'Ufikiaji wa Maktaba';

  @override
  String get adminDeviceAndChannelAccess => 'Ufikiaji wa Kifaa na Kituo';

  @override
  String get adminEnableAllDevices => 'Washa ufikiaji wa vifaa vyote';

  @override
  String get adminEnableAllChannels => 'Washa ufikiaji wa vituo vyote';

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
      'Hii itaondoa nenosiri. Mtumiaji ataweza kuingia bila nenosiri.';

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
  String get adminCreateApiKey => 'Unda Ufunguo wa API';

  @override
  String get adminAppName => 'Jina la programu';

  @override
  String get adminApiKeyCreated => 'Ufunguo wa API Umeundwa';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ufunguo umeundwa. Seva haikurudisha tokeni. Angalia funguo za API za seva.';

  @override
  String get adminKeyCopied => 'Ufunguo umenakiliwa kwenye ubao wa kunakili';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Tokeni muhimu haipo kwenye jibu la seva';

  @override
  String get adminRevokeApiKey => 'Batilisha Ufunguo wa API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kitufe cha API kimebatilishwa';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Imeshindwa kupakia vitufe vya API';

  @override
  String get adminApiKeysTitle => 'Vifunguo vya API';

  @override
  String get adminCreateKey => 'Unda Ufunguo';

  @override
  String get adminNoApiKeys => 'Hakuna funguo za API zilizopatikana';

  @override
  String get adminUnknownApp => 'Programu Isiyojulikana';

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
  String get adminCreatingBackup => 'Inaunda nakala rudufu...';

  @override
  String get adminBackupCreated => 'Hifadhi rudufu imeundwa';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Njia mbadala haipo katika majibu ya seva';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Thibitisha Kurejesha';

  @override
  String get adminRestoringBackup => 'Inarejesha nakala rudufu...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Imeshindwa kupakia nakala rudufu';

  @override
  String get adminCreateBackup => 'Unda Hifadhi Nakala';

  @override
  String get adminNoBackups => 'Hakuna chelezo zilizopatikana';

  @override
  String get adminViewDetails => 'Tazama Maelezo';

  @override
  String get restore => 'Rejesha';

  @override
  String get adminLogsLoadFailed => 'Imeshindwa kupakia kumbukumbu za seva';

  @override
  String get adminNoLogFiles => 'Hakuna faili za kumbukumbu zilizopatikana';

  @override
  String get adminLogCopied => 'Kumbukumbu imenakiliwa kwenye ubao wa kunakili';

  @override
  String get adminSaveLogFile => 'Hifadhi faili ya kumbukumbu';

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
  String get adminSearchInLog => 'Tafuta kwenye logi';

  @override
  String get adminNoMatchingLines => 'Hakuna mistari inayolingana';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Hakuna kazi zilizoratibiwa kupatikana';

  @override
  String get adminNoTasksMatchFilter =>
      'Hakuna kazi zinazolingana na kichujio cha sasa';

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
  String get adminRunNow => 'Endesha Sasa';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Utekelezaji wa Mwisho';

  @override
  String get adminTriggers => 'Vichochezi';

  @override
  String get adminAddTrigger => 'Ongeza Kichochezi';

  @override
  String get adminNoTriggers => 'Hakuna vichochezi vilivyosanidiwa';

  @override
  String get adminTriggerType => 'Anzisha Aina';

  @override
  String get adminTimeLimit => 'Kikomo cha muda (si lazima)';

  @override
  String get adminNoLimit => 'Hakuna kikomo';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Siku ya wiki';

  @override
  String get adminSearchPlugins => 'Tafuta programu jalizi...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Sanidua programu-jalizi';

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
      'Hakuna programu-jalizi zinazolingana na utafutaji wako';

  @override
  String get adminNoPluginsInstalled =>
      'Hakuna programu-jalizi zilizosakinishwa';

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
      'Hakuna vifurushi vinavyolingana na utafutaji wako';

  @override
  String get adminNoPackagesAvailable => 'Hakuna vifurushi vinavyopatikana';

  @override
  String get adminExperimentalIntegration => 'Ujumuishaji wa Majaribio';

  @override
  String get adminExperimentalWarning =>
      'Muunganisho wa mipangilio ya programu-jalizi bado ni wa majaribio. Baadhi ya kurasa za mipangilio haziwezi kutoa ipasavyo.';

  @override
  String get continueAction => 'Endelea';

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
      'Haiwezi kufungua mipangilio: tokeni ya uthibitishaji inakosa.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Programu-jalizi haijapatikana';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Washa Programu-jalizi';

  @override
  String get adminPluginSettingsPage =>
      'Ukurasa wa mipangilio ya programu-jalizi';

  @override
  String get adminRevisionHistory => 'Historia ya Marekebisho';

  @override
  String get adminNoChangelog => 'Hakuna logi inayopatikana.';

  @override
  String get adminRemoveRepository => 'Ondoa Hifadhi';

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
  String get adminRepositoryNameHint => 'k.m. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL ya hifadhi';

  @override
  String get adminAddEntry => 'Ongeza kiingilio';

  @override
  String get adminInvalidUrl => 'URL batili';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Fungua katika Kivinjari';

  @override
  String get adminOpenExternally => 'Fungua nje';

  @override
  String get adminGeneralSettings => 'Mipangilio ya Jumla';

  @override
  String get adminServerName => 'Jina la seva';

  @override
  String get adminPreferredMetadataCountry => 'Nchi ya metadata inayopendelewa';

  @override
  String get adminCachePath => 'Njia ya akiba';

  @override
  String get adminMetadataPath => 'Njia ya metadata';

  @override
  String get adminLibraryScanConcurrency => 'Uchanganuzi wa sarafu ya maktaba';

  @override
  String get adminParallelImageEncodingLimit =>
      'Kikomo cha usimbaji wa picha sambamba';

  @override
  String get adminSlowResponseThreshold => 'Kiwango cha chini cha majibu (ms)';

  @override
  String get adminBrandingSaved => 'Mipangilio ya chapa imehifadhiwa';

  @override
  String get adminBrandingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya chapa';

  @override
  String get adminLoginDisclaimer => 'Kanusho la kuingia';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML iliyoonyeshwa chini ya fomu ya kuingia';

  @override
  String get adminCustomCss => 'CSS maalum';

  @override
  String get adminCustomCssHint =>
      'CSS maalum inatumika kwenye kiolesura cha wavuti';

  @override
  String get adminEnableSplashScreen => 'Washa skrini ya Splash';

  @override
  String get adminStreamingSaved => 'Mipangilio ya utiririshaji imehifadhiwa';

  @override
  String get adminStreamingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya utiririshaji';

  @override
  String get adminStreamingDescription =>
      'Weka vikomo vya kasi biti ya utiririshaji ulimwenguni kwa miunganisho ya mbali.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Kikomo cha kasi ya biti ya mteja wa mbali (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Acha tupu au 0 kwa ukomo';

  @override
  String get adminPlaybackSaved => 'Mipangilio ya kucheza imehifadhiwa';

  @override
  String get adminPlaybackLoadFailed =>
      'Imeshindwa kupakia mipangilio ya kucheza tena';

  @override
  String get adminPlaybackTranscoding => 'Uchezaji / Ubadilishaji msimbo';

  @override
  String get adminHardwareAcceleration => 'Kuongeza kasi ya vifaa';

  @override
  String get adminVaapiDevice => 'Kifaa cha VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminEnableHardwareDecoding => 'Washa usimbaji maunzi kwa:';

  @override
  String get adminEncodingThreads => 'Usimbaji nyuzi';

  @override
  String get adminAutomatic => '0 = moja kwa moja';

  @override
  String get adminTranscodingTempPath => 'Njia ya joto ya kubadilisha msimbo';

  @override
  String get adminEnableFallbackFont => 'Washa fonti mbadala';

  @override
  String get adminFallbackFontPath => 'Njia ya fonti ya kurudi nyuma';

  @override
  String get adminAllowSegmentDeletion => 'Ruhusu kufutwa kwa sehemu';

  @override
  String get adminSegmentKeepSeconds => 'Weka sehemu (sekunde)';

  @override
  String get adminThrottleBuffering => 'Kuakibisha kaba';

  @override
  String get adminTrickplaySaved => 'Mipangilio ya mchezo wa hila imehifadhiwa';

  @override
  String get adminTrickplayLoadFailed =>
      'Imeshindwa kupakia mipangilio ya mchezo wa hila';

  @override
  String get adminEnableHardwareAcceleration => 'Washa kuongeza kasi ya maunzi';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Washa uchimbaji wa fremu muhimu pekee';

  @override
  String get adminKeyFrameSubtitle => 'Usahihi wa haraka lakini wa chini';

  @override
  String get adminScanBehavior => 'Skena tabia';

  @override
  String get adminProcessPriority => 'Kipaumbele cha mchakato';

  @override
  String get adminImageSettings => 'Mipangilio ya Picha';

  @override
  String get adminIntervalMs => 'Muda (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Ni mara ngapi kunasa fremu';

  @override
  String get adminWidthResolutions => 'Maamuzi ya upana';

  @override
  String get adminTileWidth => 'Upana wa tile';

  @override
  String get adminTileHeight => 'Urefu wa tile';

  @override
  String get adminQualitySubtitle =>
      'Thamani za chini = ubora bora, faili kubwa';

  @override
  String get adminProcessThreads => 'Mchakato wa nyuzi';

  @override
  String get adminResumeSaved => 'Mipangilio ya kuendelea imehifadhiwa';

  @override
  String get adminResumeLoadFailed =>
      'Imeshindwa kupakia mipangilio ya kuendelea';

  @override
  String get adminResumeDescription =>
      'Sanidi wakati maudhui yanapaswa kutiwa alama kuwa yamechezwa kwa kiasi au kuchezwa kikamilifu.';

  @override
  String get adminMinResumePercentage => 'Asilimia ya chini ya wasifu';

  @override
  String get adminMinResumeSubtitle =>
      'Ni lazima maudhui yachezwe kupita asilimia hii ili kuokoa maendeleo';

  @override
  String get adminMaxResumePercentage => 'Asilimia ya juu zaidi ya wasifu';

  @override
  String get adminMaxResumeSubtitle =>
      'Maudhui yanazingatiwa kuchezwa kikamilifu baada ya asilimia hii';

  @override
  String get adminMinResumeDuration => 'Muda wa chini wa kuendelea (sekunde)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Vipengee vifupi kuliko hivi havitumiki tena';

  @override
  String get adminMinAudiobookResume =>
      'Asilimia ya chini ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminMaxAudiobookResume =>
      'Upeo wa asilimia ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminNetworkingSaved =>
      'Mipangilio ya mtandao imehifadhiwa. Kuanzisha upya seva kunaweza kuhitajika.';

  @override
  String get adminNetworkingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya mtandao';

  @override
  String get adminNetworkingWarning =>
      'Mabadiliko ya mipangilio ya mtandao yanaweza kuhitaji kuanzishwa upya kwa seva.';

  @override
  String get adminEnableRemoteAccess => 'Washa ufikiaji wa mbali';

  @override
  String get ports => 'Bandari';

  @override
  String get adminHttpPort => 'Mlango wa HTTP';

  @override
  String get adminHttpsPort => 'Mlango wa HTTPS';

  @override
  String get adminPublicHttpsPort => 'Mlango wa HTTPS wa umma';

  @override
  String get adminBaseUrl => 'URL ya msingi';

  @override
  String get adminBaseUrlHint => 'k.m. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Washa HTTPS';

  @override
  String get adminLocalNetwork => 'Mtandao wa Ndani';

  @override
  String get adminLocalNetworkAddresses => 'Anwani za mtandao wa ndani';

  @override
  String get adminKnownProxies => 'Wawakilishi wanaojulikana';

  @override
  String get adminRemoteIpFilter => 'Kichujio cha IP cha mbali';

  @override
  String get adminRemoteIpFilterEntries => 'Kichujio cha IP cha mbali';

  @override
  String get adminCertificatePath => 'Njia ya cheti';

  @override
  String get whitelist => 'Orodha iliyoidhinishwa';

  @override
  String get blacklist => 'Orodha nyeusi';

  @override
  String get notSet => 'Haijawekwa';

  @override
  String get adminMetadataSaved => 'Metadata imehifadhiwa';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Onyesha upya Metadata';

  @override
  String get recursive => 'Inajirudia';

  @override
  String get adminReplaceAllMetadata => 'Badilisha metadata zote';

  @override
  String get adminReplaceAllImages => 'Badilisha picha zote';

  @override
  String get adminMetadataRefreshRequested => 'Ombi la kuonyesha upya metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminNoRemoteMatches =>
      'Hakuna zinazolingana za mbali zilizopatikana';

  @override
  String get adminRemoteResults => 'Matokeo ya Mbali';

  @override
  String get adminRemoteMetadataApplied => 'Metadata ya mbali imetumika';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Sasisha Aina ya Maudhui';

  @override
  String get adminContentType => 'Aina ya maudhui';

  @override
  String get adminContentTypeUpdated => 'Aina ya maudhui imesasishwa';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Imeshindwa kupakia kihariri cha metadata';

  @override
  String get adminNoPeopleEntries => 'Hakuna maingizo ya watu';

  @override
  String get adminNoExternalIds =>
      'Hakuna vitambulisho vya nje vinavyopatikana';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Umbizo la picha lisilotumika';

  @override
  String get adminImageReadFailed => 'Imeshindwa kusoma picha iliyochaguliwa';

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
  String get adminAllProviders => 'Watoa huduma wote';

  @override
  String get adminNoRemoteImages => 'Hakuna picha za mbali zilizopatikana';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Ongeza Tuner';

  @override
  String get adminTunerType => 'Aina ya Kitafuta njia';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Nyingine';

  @override
  String get adminUrlPath => 'URL / Njia';

  @override
  String get adminNameOptional => 'Jina (si lazima)';

  @override
  String get adminTunerAdded => 'Kitafuta sauti kimeongezwa';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Ongeza Mtoa Mwongozo';

  @override
  String get adminProviderType => 'Aina ya Mtoa huduma';

  @override
  String get adminProviderTypeHint => 'RatibaDirect au XMLTV';

  @override
  String get adminUsernameOptional => 'Jina la mtumiaji (si lazima)';

  @override
  String get adminRefreshInterval => 'Kipindi cha kuonyesha upya (saa)';

  @override
  String get adminProviderAdded => 'Mtoa huduma ameongezwa';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Umeomba kuweka upya kitafuta njia';

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
  String get adminRecordingSettings => 'Mipangilio ya Kurekodi';

  @override
  String get adminPrePadding => 'Kuweka pedi mapema (dakika)';

  @override
  String get adminPostPadding => 'Ufungaji wa posta (dakika)';

  @override
  String get adminRecordingPath => 'Njia ya kurekodi';

  @override
  String get adminSeriesRecordingPath => 'Njia ya kurekodi mfululizo';

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
  String get adminRecordingSettingsSaved =>
      'Mipangilio ya kurekodi imehifadhiwa';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Weka Ramani za Kituo';

  @override
  String get adminMappingJson => 'Kuchora ramani ya JSON';

  @override
  String get adminMappingJsonHint => 'Mfano: upangaji wa malipo ya JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mipangilio ya vituo imesasishwa';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Imeshindwa kupakia usimamizi wa TV ya Moja kwa Moja';

  @override
  String get adminTunerDevices => 'Vifaa vya Kitafuta sauti';

  @override
  String get adminNoTunerHosts =>
      'Hakuna seva pangishi za kitafuta njia zilizosanidiwa';

  @override
  String get adminGuideProviders => 'Watoa Mwongozo';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Ongeza Mtoa Huduma';

  @override
  String get adminNoListingProviders =>
      'Hakuna watoa huduma za uorodheshaji waliosanidiwa';

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
  String get adminTunerDiscovery => 'Ugunduzi wa Tuner';

  @override
  String get adminChannelMappings => 'Ramani za Kituo';

  @override
  String get adminNoDiscoveredTuners =>
      'Bado hakuna vitafuta vituo vilivyogunduliwa';

  @override
  String get adminSettingsSaved => 'Mipangilio imehifadhiwa';

  @override
  String get adminBackupsNotAvailable =>
      'Hifadhi rudufu hazipatikani kwenye muundo huu wa seva.';

  @override
  String get adminRestoreWarning1 =>
      'Kurejesha kutabadilisha data YOTE ya sasa ya seva na data mbadala.';

  @override
  String get adminRestoreWarning2 =>
      'Mipangilio ya sasa ya seva, watumiaji, na data ya maktaba itafutwa.';

  @override
  String get adminRestoreWarning3 => 'Seva itaanza upya baada ya kurejeshwa.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Rejesha ombi. Kuanzisha tena seva kunaweza kutenganisha kipindi hiki.';

  @override
  String get adminBackupsTitle => 'Hifadhi rudufu';

  @override
  String get adminUnknownDate => 'Tarehe isiyojulikana';

  @override
  String get adminUnnamedBackup => 'Hifadhi Nakala Isiyo na Jina';

  @override
  String get adminLiveTvNotAvailable =>
      'Udhibiti wa TV ya moja kwa moja haupatikani kwenye muundo huu wa seva.';

  @override
  String get adminLiveTvTitle => 'Utawala wa TV ya moja kwa moja';

  @override
  String get adminApply => 'Omba';

  @override
  String get adminNotSet => 'Haijawekwa';

  @override
  String get adminReset => 'Weka upya';

  @override
  String get adminLogsTitle => 'Kumbukumbu za Seva';

  @override
  String get adminLogsNewestFirst => 'Mpya Zaidi Kwanza';

  @override
  String get adminLogsOldestFirst => 'Mzee Kwanza';

  @override
  String get adminLogsJustNow => 'Sasa hivi';

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
  String get adminLogViewerNoMatches => 'Hakuna mistari inayolingana';

  @override
  String get adminMetadataEditorTitle => 'Mhariri wa Metadata';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => 'Aina';

  @override
  String get adminMetadataDetails => 'Maelezo';

  @override
  String get adminMetadataExternalIds => 'Vitambulisho vya nje';

  @override
  String get adminMetadataImages => 'Picha';

  @override
  String get adminMetadataFieldTitle => 'Kichwa';

  @override
  String get adminMetadataFieldSortTitle => 'Panga kichwa';

  @override
  String get adminMetadataFieldOriginalTitle => 'Kichwa asili';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Tarehe ya onyesho la kwanza (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Tarehe ya mwisho (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Mwaka wa uzalishaji';

  @override
  String get adminMetadataFieldOfficialRating => 'Ukadiriaji rasmi';

  @override
  String get adminMetadataFieldCommunityRating => 'Ukadiriaji wa jumuiya';

  @override
  String get adminMetadataFieldCriticRating => 'Ukadiriaji mkosoaji';

  @override
  String get adminMetadataFieldTagline => 'Mstari wa tagi';

  @override
  String get adminMetadataFieldOverview => 'Muhtasari';

  @override
  String get adminMetadataGenres => 'Aina';

  @override
  String get adminMetadataTags => 'Lebo';

  @override
  String get adminMetadataStudios => 'Studios';

  @override
  String get adminMetadataPeople => 'Watu';

  @override
  String get adminMetadataAddGenre => 'Ongeza aina';

  @override
  String get adminMetadataAddTag => 'Ongeza lebo';

  @override
  String get adminMetadataAddStudio => 'Ongeza studio';

  @override
  String get adminMetadataAddPerson => 'Ongeza Mtu';

  @override
  String get adminMetadataEditPerson => 'Hariri Mtu';

  @override
  String get adminMetadataRole => 'Jukumu';

  @override
  String get adminMetadataImagePrimary => 'Msingi';

  @override
  String get adminMetadataImageBackdrop => 'Mandhari';

  @override
  String get adminMetadataImageLogo => 'Nembo';

  @override
  String get adminMetadataImageBanner => 'Bango';

  @override
  String get adminMetadataImageThumb => 'Kidole gumba';

  @override
  String get adminMetadataRecursive => 'Inajirudia';

  @override
  String get adminMetadataProvider => 'Mtoa huduma';

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
      'Imeshindwa kusoma picha iliyochaguliwa';

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
      'Hii huondoa picha ya sasa kutoka kwa kipengee.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Pakia';

  @override
  String get adminMetadataUpdate => 'Sasisha';

  @override
  String get adminMetadataRemoteImage => 'Picha ya mbali';

  @override
  String get adminPluginsInstalled => 'Imesakinishwa';

  @override
  String get adminPluginsCatalog => 'Katalogi';

  @override
  String get adminPluginsActive => 'Inayotumika';

  @override
  String get adminPluginsRestart => 'Anzisha upya';

  @override
  String get adminPluginsNoSearchResults =>
      'Hakuna programu-jalizi zinazolingana na utafutaji wako';

  @override
  String get adminPluginsNoneInstalled =>
      'Hakuna programu-jalizi zilizosakinishwa';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Sasisho linapatikana';

  @override
  String get adminPluginsPendingRemoval =>
      'Inasubiri kuondolewa baada ya kuanza upya';

  @override
  String get adminPluginsChangesPending =>
      'Mabadiliko yanasubiri kuanzishwa upya';

  @override
  String get adminPluginsEnable => 'Wezesha';

  @override
  String get adminPluginsDisable => 'Zima';

  @override
  String get adminPluginsInstallUpdate => 'Sakinisha sasisho';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Hakuna vifurushi vinavyolingana na utafutaji wako';

  @override
  String get adminPluginsCatalogEmpty => 'Hakuna vifurushi vinavyopatikana';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Ujumuishaji wa Majaribio';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Muunganisho wa mipangilio ya programu-jalizi bado ni wa majaribio. Baadhi ya sehemu au miundo huenda isitoe ipasavyo bado.';

  @override
  String get adminPluginDetailToggle404 =>
      'Imeshindwa kugeuza programu-jalizi. Seva haikuweza kupata toleo hili la programu-jalizi. Jaribu kuonyesha upya programu-jalizi, kisha ujaribu tena.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Imeshindwa kugeuza programu-jalizi. Tafadhali angalia kumbukumbu za seva kwa maelezo.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Maelezo';

  @override
  String get adminPluginDetailDeveloper => 'Msanidi';

  @override
  String get adminPluginDetailRepository => 'Hifadhi';

  @override
  String get adminPluginDetailBundled => 'Imeunganishwa';

  @override
  String get adminPluginDetailEnablePlugin => 'Washa Programu-jalizi';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kuanzisha upya seva kunahitajika ili mabadiliko yaanze kutumika.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Programu-jalizi hii itaondolewa baada ya seva kuwasha upya.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Programu-jalizi hii imeharibika na huenda isifanye kazi ipasavyo.';

  @override
  String get adminPluginDetailNotSupported =>
      'Programu-jalizi hii haitumiki na toleo la sasa la seva.';

  @override
  String get adminPluginDetailSuperseded =>
      'Programu-jalizi hii imebadilishwa na toleo jipya zaidi.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ondoa Hifadhi';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Ondoa';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Hakuna hazina zilizosanidiwa';

  @override
  String get adminReposEmptySubtitle =>
      'Ongeza hazina ili kuvinjari programu-jalizi zinazopatikana';

  @override
  String get adminReposUnnamed => '(bila jina)';

  @override
  String get adminReposEditTitle => 'Hariri Hifadhi';

  @override
  String get adminReposAddTitle => 'Ongeza Hifadhi';

  @override
  String get adminReposUrl => 'URL ya hifadhi';

  @override
  String get adminReposNameHint => 'k.m. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL batili';

  @override
  String get adminGeneralSettingsTitle => 'Mipangilio ya Jumla';

  @override
  String get adminGeneralMetadataLanguage =>
      'Lugha ya metadata inayopendekezwa';

  @override
  String get adminGeneralMetadataLanguageHint => 'k.m. sw, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Nchi ya metadata inayopendelewa';

  @override
  String get adminGeneralMetadataCountryHint => 'k.m. Marekani, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Uchanganuzi wa sarafu ya maktaba';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Kikomo cha usimbaji wa picha sambamba';

  @override
  String get adminUnknownError => 'Hitilafu isiyojulikana';

  @override
  String get adminBrowse => 'Vinjari';

  @override
  String get adminCloseBrowser => 'Funga kivinjari';

  @override
  String get adminNetworkingTitle => 'Mtandao';

  @override
  String get adminNetworkingRestartWarning =>
      'Mabadiliko ya mipangilio ya mtandao yanaweza kuhitaji kuanzisha upya seva.';

  @override
  String get adminNetworkingRemoteAccess => 'Washa ufikiaji wa mbali';

  @override
  String get adminNetworkingPorts => 'Bandari';

  @override
  String get adminNetworkingHttpPort => 'Mlango wa HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Mlango wa HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Washa HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Mtandao wa Ndani';

  @override
  String get adminNetworkingLocalAddresses => 'Anwani za mtandao wa ndani';

  @override
  String get adminNetworkingAddressHint => 'k.m. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Wawakilishi wanaojulikana';

  @override
  String get adminNetworkingProxyHint => 'k.m. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Orodha iliyoidhinishwa';

  @override
  String get adminNetworkingBlacklist => 'Orodha nyeusi';

  @override
  String get adminNetworkingAddEntry => 'Ongeza kiingilio';

  @override
  String get adminBrandingTitle => 'Kuweka chapa';

  @override
  String get adminBrandingLoginDisclaimer => 'Kanusho la kuingia';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML iliyoonyeshwa chini ya fomu ya kuingia';

  @override
  String get adminBrandingCustomCss => 'CSS maalum';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS maalum inatumika kwenye kiolesura cha wavuti';

  @override
  String get adminBrandingEnableSplash => 'Washa skrini ya Splash';

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
  String get adminPlaybackHwAccel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackHwAccelLabel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackEnableHwEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminPlaybackEnableHwDecoding => 'Washa usimbaji maunzi kwa:';

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
  String get adminPlaybackEncoding => 'Usimbaji';

  @override
  String get adminPlaybackEncodingThreads => 'Usimbaji nyuzi';

  @override
  String get adminPlaybackFallbackFont => 'Washa fonti mbadala';

  @override
  String get adminPlaybackFallbackFontPath => 'Njia ya fonti ya kurudi nyuma';

  @override
  String get adminPlaybackStreaming => 'Kutiririsha';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Vitabu vya sauti';

  @override
  String get adminResumeMinAudiobookPct =>
      'Asilimia ya chini ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Upeo wa asilimia ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminStreamingBitrateLimit =>
      'Kikomo cha kasi ya biti ya mteja wa mbali (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Acha tupu au 0 kwa ukomo';

  @override
  String get adminTrickplayHwAccel => 'Washa kuongeza kasi ya maunzi';

  @override
  String get adminTrickplayHwEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Washa uchimbaji wa fremu muhimu pekee';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Usahihi wa haraka lakini wa chini';

  @override
  String get adminTrickplayNonBlocking => 'Isiyo ya Kuzuia';

  @override
  String get adminTrickplayBlocking => 'Kuzuia';

  @override
  String get adminTrickplayPriorityHigh => 'Juu';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Juu ya Kawaida';

  @override
  String get adminTrickplayPriorityNormal => 'Kawaida';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Chini ya Kawaida';

  @override
  String get adminTrickplayPriorityIdle => 'Bila kufanya kitu';

  @override
  String get adminTrickplayImageSettings => 'Mipangilio ya Picha';

  @override
  String get adminTrickplayInterval => 'Muda (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Ni mara ngapi kunasa fremu';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Upana wa pikseli uliotenganishwa kwa koma (k.m. 320)';

  @override
  String get adminTrickplayQuality => 'Ubora';

  @override
  String get adminTrickplayQScale => 'Kiwango cha ubora';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Thamani za chini = ubora bora, faili kubwa';

  @override
  String get adminTrickplayJpegQuality => 'Ubora wa JPEG';

  @override
  String get adminTrickplayProcessing => 'Inachakata';

  @override
  String get adminTasksEmpty => 'Hakuna kazi zilizoratibiwa kupatikana';

  @override
  String get adminTasksNoFilterMatch =>
      'Hakuna kazi zinazolingana na kichujio cha sasa';

  @override
  String get adminTaskCancelling => 'Inaghairi...';

  @override
  String get adminTaskRunning => 'Inakimbia...';

  @override
  String get adminTaskNeverRun => 'Usiwahi kukimbia';

  @override
  String get adminTaskStop => 'Acha';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => 'Kimbia';

  @override
  String get adminTaskDetailLastExecution => 'Utekelezaji wa Mwisho';

  @override
  String get adminTaskDetailStarted => 'Imeanza';

  @override
  String get adminTaskDetailEnded => 'Imeisha';

  @override
  String get adminTaskDetailDuration => 'Muda';

  @override
  String get adminTaskDetailErrorLabel => 'Hitilafu:';

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
  String get adminTaskTriggerStartup => 'Wakati wa kuanza maombi';

  @override
  String get adminTaskTriggerTypeDaily => 'Kila siku';

  @override
  String get adminTaskTriggerTypeWeekly => 'Kila wiki';

  @override
  String get adminTaskTriggerTypeInterval => 'Kwa muda';

  @override
  String get adminTaskTriggerIntervalLabel => 'Muda';

  @override
  String get adminTaskTriggerEveryHour => 'Kila saa';

  @override
  String get adminTaskTriggerEvery6Hours => 'Kila masaa 6';

  @override
  String get adminTaskTriggerEvery12Hours => 'Kila masaa 12';

  @override
  String get adminTaskTriggerEvery24Hours => 'Kila masaa 24';

  @override
  String get adminTaskTriggerEvery2Days => 'Kila siku 2';

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
  String get adminTaskTriggerTime => 'Muda';

  @override
  String get adminTaskTriggerNoLimit => 'Hakuna kikomo';

  @override
  String get adminActivityJustNow => 'Sasa hivi';

  @override
  String get adminActivityLastHour => 'Saa iliyopita';

  @override
  String get adminActivityToday => 'Leo';

  @override
  String get adminActivityYesterday => 'Jana';

  @override
  String get adminActivityOlder => 'Mzee';

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
  String get adminActivityNow => 'sasa';

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
      'Sanidi utengenezaji wa taswira ya hila kwa vijipicha vya onyesho la kukagua.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Mlango wa HTTPS wa umma';

  @override
  String get adminNetworkingBaseUrl => 'URL ya msingi';

  @override
  String get adminNetworkingBaseUrlHint => 'k.m. /jellyfin';

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
  String get adminNetworkingCertPath => 'Njia ya cheti';

  @override
  String get adminNetworkingRemoteIpFilter => 'Kichujio cha IP cha mbali';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Kichujio cha IP cha mbali';

  @override
  String get adminPlaybackVaapiDevice => 'Kifaa cha VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = moja kwa moja';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Njia ya joto ya kubadilisha msimbo';

  @override
  String get adminPlaybackSegmentDeletion => 'Ruhusu kufutwa kwa sehemu';

  @override
  String get adminPlaybackSegmentKeep => 'Weka sehemu (sekunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Kuakibisha kaba';

  @override
  String get adminResumeMinPct => 'Asilimia ya chini ya wasifu';

  @override
  String get adminResumeMinPctSubtitle =>
      'Ni lazima maudhui yachezwe kupita asilimia hii ili kuokoa maendeleo';

  @override
  String get adminResumeMaxPct => 'Asilimia ya juu zaidi ya wasifu';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Maudhui yanazingatiwa kuchezwa kikamilifu baada ya asilimia hii';

  @override
  String get adminResumeMinDuration => 'Muda wa chini wa kuendelea (sekunde)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Vipengee vifupi kuliko hivi havitumiki tena';

  @override
  String get adminTrickplayScanBehavior => 'Skena tabia';

  @override
  String get adminTrickplayProcessPriority => 'Kipaumbele cha mchakato';

  @override
  String get adminTrickplayTileWidth => 'Upana wa tile';

  @override
  String get adminTrickplayTileHeight => 'Urefu wa tile';

  @override
  String get adminTrickplayProcessThreads => 'Mchakato wa nyuzi';

  @override
  String get adminTrickplayWidthResolutions => 'Maamuzi ya upana';

  @override
  String get adminMetadataDefault => 'Chaguomsingi';

  @override
  String get adminMetadataContentTypeUpdated => 'Aina ya maudhui imesasishwa';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Kiwango cha chini cha majibu (ms)';

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
  String get adminGeneralCachePath => 'Njia ya akiba';

  @override
  String get adminGeneralMetadataPath => 'Njia ya metadata';

  @override
  String get adminGeneralServerName => 'Jina la seva';

  @override
  String get adminSettingsLoadFailed => 'Imeshindwa kupakia mipangilio';

  @override
  String get adminDiscover => 'Gundua';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Folda';

  @override
  String get libraries => 'Maktaba';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay imezimwa';

  @override
  String get syncPlayDisabledMessage =>
      'Washa SyncPlay katika Mipangilio ili kutumia uchezaji uliosawazishwa.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Seva haitumiki';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay inahitaji seva ya Jellyfin. Seva ya sasa haiauni.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Kikundi';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay kikundi';

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
  String get syncPlayIgnoreWait => 'Puuza kusubiri';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Usisimamishe kikundi wakati kifaa hiki kinaakibishwa';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Endelea ndani ya nchi bila kusubiri wanachama wa polepole';

  @override
  String get syncPlayRepeat => 'Rudia';

  @override
  String get syncPlayRepeatOne => 'Moja';

  @override
  String get syncPlayShuffleModeShuffled => 'Imechanganyikiwa';

  @override
  String get syncPlayShuffleModeSorted => 'Imepangwa';

  @override
  String get syncPlaySyncCurrentQueue => 'Sawazisha foleni ya kucheza ya sasa';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Badilisha foleni ya kikundi na kile kinachocheza ndani ya nchi';

  @override
  String get syncPlayLeaveGroup => 'Ondoka kwenye kikundi';

  @override
  String get syncPlayGroupQueue => 'Foleni ya kikundi';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Cheza sasa';

  @override
  String get syncPlayCreateNewGroup => 'Unda kikundi kipya';

  @override
  String get syncPlayGroupName => 'Jina la kikundi';

  @override
  String get syncPlayDefaultGroupName => 'Kikundi changu cha SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Unda kikundi';

  @override
  String get syncPlayAvailableGroups => 'Vikundi vinavyopatikana';

  @override
  String get syncPlayNoGroupsAvailable => 'Hakuna vikundi vinavyopatikana';

  @override
  String get syncPlayJoinGroupQuestion =>
      'Je, ungependa kujiunga na kikundi cha SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Kujiunga na kikundi cha SyncPlay kunaweza kuchukua nafasi ya foleni yako ya uchezaji ya sasa. Ungependa kuendelea?';

  @override
  String get syncPlayJoin => 'Jiunge';

  @override
  String get syncPlayStateIdle => 'Bila kufanya kitu';

  @override
  String get syncPlayStateWaiting => 'Kusubiri';

  @override
  String get syncPlayStatePaused => 'Imesitishwa';

  @override
  String get syncPlayStatePlaying => 'Inacheza';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Ufikiaji wa SyncPlay umekataliwa';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Huna ufikiaji wa kipengee kimoja au zaidi katika kikundi hiki cha SyncPlay. Uliza mmiliki wa kikundi athibitishe ruhusa za maktaba au achague foleni tofauti.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Utafutaji wa sauti haupatikani.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Kucheza kwa Moja kwa Moja kwa Dolby Vision Imeshindwa';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Uchezaji wa moja kwa moja umeshindwa kuanza kwa mtiririko huu wa Dolby Vision. Ungependa kujaribu tena kutumia msimbo wa kusambaza seva?';

  @override
  String get retryWithTranscode => 'Jaribu tena kwa kutumia msimbo';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Haitumiki';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Kifaa hiki hakiwezi kusimbua maudhui ya Dolby Vision moja kwa moja. Tumia njia mbadala ya HDR10 au uombe upitishaji wa msimbo wa seva.';

  @override
  String get rememberMyChoice => 'Kumbuka chaguo langu';

  @override
  String get playHdr10Fallback => 'Cheza njia mbadala ya HDR10';

  @override
  String get requestTranscode => 'Omba transcode';

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
  String get seeAll => 'Tazama Yote';

  @override
  String get noItems => 'Hakuna vitu';

  @override
  String get switchUser => 'Badilisha Mtumiaji';

  @override
  String get remoteControl => 'Udhibiti wa Kijijini';

  @override
  String get mediaBarLoading => 'Inapakia upau wa midia...';

  @override
  String get mediaBarError => 'Upau wa midia imeshindwa kupakia';

  @override
  String get offlineServerUnavailable =>
      'Imeunganishwa kwenye mtandao, lakini seva ya sasa haipatikani.';

  @override
  String get offlineNoInternet =>
      'Hauko mtandaoni. Maudhui yaliyopakuliwa pekee yanapatikana.';

  @override
  String get offlineFileNotAvailable => 'Faili haipatikani';

  @override
  String get offlineSwitchServer => 'Badilisha Seva';

  @override
  String get offlineSavedMedia => 'Media Iliyohifadhiwa';

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
  String get castRemotePlayback => 'Uchezaji wa Mbali';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Kiasi cha Kifaa';

  @override
  String get castVolumeUnavailable => 'Haipatikani';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Sauti';

  @override
  String get subtitlesLabel => 'Manukuu';

  @override
  String get pinConfirmTitle => 'Thibitisha PIN';

  @override
  String get pinSetTitle => 'Weka PIN';

  @override
  String get pinEnterTitle => 'Weka PIN';

  @override
  String get pinReenterToConfirm => 'Weka tena PIN yako ili kuthibitisha';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN si sahihi';

  @override
  String get pinMismatch => 'PIN hazilingani';

  @override
  String get pinForgot => 'Je, umesahau PIN?';

  @override
  String get pinClear => 'Wazi';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Ombi la Kuunganisha Haraka limeidhinishwa.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Msimbo wa Quick Connect ni batili au muda wake umeisha.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect haitumiki kwenye seva hii.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Imeshindwa kuidhinisha msimbo wa Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect imezimwa kwenye seva hii.';

  @override
  String get quickConnectForbidden =>
      'Akaunti yako haiwezi kuidhinisha ombi hili la Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Msimbo wa Quick Connect haukupatikana. Jaribu nambari mpya ya kuthibitisha.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Weka msimbo';

  @override
  String get quickConnectAuthorize => 'Kuidhinisha';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Udhibiti wa Kijijini';

  @override
  String get remoteFailedToLoadSessions => 'Imeshindwa kupakia vipindi';

  @override
  String get remoteNoSessions => 'Hakuna vipindi vinavyoweza kudhibitiwa';

  @override
  String get remoteStartPlayback => 'Anza kucheza kwenye kifaa kingine';

  @override
  String get unknownUser => 'Haijulikani';

  @override
  String get unknownItem => 'Haijulikani';

  @override
  String get remoteNothingPlaying => 'Hakuna kinachocheza kwenye kipindi hiki';

  @override
  String get castingStarted => 'Utumaji umeanza kwenye kifaa ulichochagua';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Hakuna vifaa vya kucheza kwa mbali vinavyopatikana.';

  @override
  String get noRemoteDevicesIos =>
      'Hakuna vifaa vya kucheza kwa mbali vinavyopatikana.\n\nKwenye iOS, malengo ya AirPlay yanaweza yasipatikane kwenye kiigaji.';

  @override
  String get trackActionPlayNext => 'Cheza Inayofuata';

  @override
  String get trackActionAddToQueue => 'Ongeza kwenye Foleni';

  @override
  String get trackActionAddToPlaylist => 'Ongeza kwenye Orodha ya kucheza';

  @override
  String get trackActionCancelDownload => 'Ghairi Upakuaji';

  @override
  String get trackActionDeleteFromPlaylist => 'Futa kwenye Orodha ya kucheza';

  @override
  String get trackActionMoveUp => 'Sogeza Juu';

  @override
  String get trackActionMoveDown => 'Sogeza Chini';

  @override
  String get trackActionRemoveFromFavorites => 'Ondoa kutoka kwa Vipendwa';

  @override
  String get trackActionAddToFavorites => 'Ongeza kwa Vipendwa';

  @override
  String get trackActionGoToAlbum => 'Nenda kwa Albamu';

  @override
  String get trackActionGoToArtist => 'Nenda kwa Msanii';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Faili iliyopakuliwa imefutwa';

  @override
  String get trackActionDeleteFileFailed =>
      'Haikuweza kufuta faili iliyopakuliwa';

  @override
  String get shuffleBy => 'Changanya Kwa';

  @override
  String get shuffleSelectLibrary => 'Chagua Maktaba';

  @override
  String get shuffleSelectGenre => 'Chagua Aina';

  @override
  String get shuffleLibrary => 'Maktaba';

  @override
  String get shuffleGenre => 'Aina';

  @override
  String get shuffleNoLibraries => 'Hakuna maktaba sambamba zinazopatikana.';

  @override
  String get shuffleNoGenres =>
      'Hakuna aina zilizopatikana kwa modi hii ya kuchanganua.';

  @override
  String get posterDisplayTitle => 'Onyesho';

  @override
  String get posterImageType => 'Aina ya Picha';

  @override
  String get imageTypePoster => 'Bango';

  @override
  String get imageTypeThumbnail => 'Kijipicha';

  @override
  String get imageTypeBanner => 'Bango';

  @override
  String get playlistAddFailed =>
      'Imeshindwa kuongeza kwenye orodha ya kucheza';

  @override
  String get playlistCreateFailed => 'Imeshindwa kuunda orodha ya kucheza';

  @override
  String get playlistNew => 'Orodha Mpya ya Kucheza';

  @override
  String get playlistCreate => 'Unda';

  @override
  String get playlistCreateNew => 'Unda Orodha Mpya ya Kucheza';

  @override
  String get playlistNoneFound => 'Hakuna orodha za kucheza zilizopatikana';

  @override
  String get addToPlaylist => 'Ongeza kwenye Orodha ya kucheza';

  @override
  String get lyricsNotAvailable => 'Hakuna maneno yanayopatikana';

  @override
  String get upNext => 'Juu Inayofuata';

  @override
  String get playNext => 'Cheza Inayofuata';

  @override
  String get stillWatchingContent =>
      'Uchezaji umesitishwa. Je, bado unatazama?';

  @override
  String get stillWatchingStop => 'Acha';

  @override
  String get stillWatchingContinue => 'Endelea';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV ya moja kwa moja';

  @override
  String get continueWatchingAndNextUp => 'Endelea Kutazama & Inayofuata';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Kipindi Kinachofuata';

  @override
  String get moreFromThisSeason => 'Zaidi Kutoka Msimu Huu';

  @override
  String get playerTooltipPlaybackSpeed => 'Kasi ya uchezaji';

  @override
  String get playerTooltipCastControls => 'Vidhibiti vya kutuma';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Ingiza skrini nzima';

  @override
  String get playerTooltipExitFullscreen => 'Ondoka kwenye skrini nzima';

  @override
  String get playerTooltipFloatOnTop => 'Kuelea juu';

  @override
  String get playerTooltipExitFloatOnTop => 'Lemaza kuelea juu';

  @override
  String get playerTooltipLockLandscape => 'Funga mandhari';

  @override
  String get playerTooltipUnlockOrientation => 'Ruhusu mzunguko';

  @override
  String get playerTooltipPrevious => 'Iliyotangulia';

  @override
  String get playerTooltipSeekBack => 'Tafuta nyuma';

  @override
  String get playerTooltipSeekForward => 'Tafuta mbele';

  @override
  String get contextMenuMarkWatched => 'Weka alama kama Imetazamwa';

  @override
  String get contextMenuMarkUnwatched => 'Weka alama kuwa haijatazamwa';

  @override
  String get contextMenuAddToFavorites => 'Ongeza kwa Vipendwa';

  @override
  String get contextMenuRemoveFromFavorites => 'Ondoa kutoka kwa Vipendwa';

  @override
  String get contextMenuGoToSeries => 'Nenda kwenye Series';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Fikia paneli ya usimamizi wa seva';

  @override
  String get settingsAccountSecurity => 'Akaunti na Usalama';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Uthibitishaji, msimbo wa PIN na vidhibiti vya wazazi';

  @override
  String get settingsPersonalization => 'Ubinafsishaji';

  @override
  String get settingsPersonalizationSubtitle =>
      'Mandhari, urambazaji, safu mlalo za nyumbani na mwonekano wa maktaba';

  @override
  String get settingsDynamicContent => 'Maudhui Yanayobadilika';

  @override
  String get settingsDynamicContentSubtitle =>
      'Upau wa Midia na viwekeleo vya kuona';

  @override
  String get settingsPlaybackSyncplay => 'Uchezaji & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Mipangilio ya sauti/video, manukuu, vipakuliwa na vidhibiti vya SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Usawazishaji wa programu-jalizi, Seerr, ukadiriaji, na zaidi';

  @override
  String get settingsAboutSubtitle =>
      'Toleo la programu, maelezo ya kisheria na mikopo';

  @override
  String get settingsAuthenticationSection => 'UTHIBITISHO';

  @override
  String get settingsSortServersBy => 'Panga Seva Kwa';

  @override
  String get settingsLastUsed => 'Iliyotumika Mwisho';

  @override
  String get settingsAlphabetical => 'Kialfabeti';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'FARAGHA NA USALAMA';

  @override
  String get settingsBlockedRatings => 'Ukadiriaji Umezuiwa';

  @override
  String get settingsGeneralStyle => 'Mtindo wa Jumla';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Lafudhi za mandhari, mandhari, viashirio vilivyotazamwa na muziki wa mandhari';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'Ukurasa wa Nyumbani';

  @override
  String get settingsHomePageSubtitle =>
      'Sehemu, aina za picha, viwekeleo, na muhtasari wa midia';

  @override
  String get settingsLibrariesSubtitle =>
      'Mwonekano wa maktaba, mwonekano wa folda, na tabia ya seva nyingi';

  @override
  String get settingsTwentyFourHourClock => 'Saa ya Saa 24';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Tumia uumbizaji wa muda wa saa 24 popote saa inapoonyeshwa';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Onyesha kitufe cha kuchanganya kwenye upau wa kusogeza';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Onyesha kitufe cha aina kwenye upau wa kusogeza';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Onyesha kitufe cha vipendwa kwenye upau wa kusogeza';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Onyesha kitufe cha maktaba kwenye upau wa kusogeza';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Geuza mwonekano wa ukurasa wa nyumbani kwa kila maktaba. Anzisha tena Moonfin ili mabadiliko yaanze kutumika.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Upau wa Midia na Uhakiki wa Karibu Nawe';

  @override
  String get settingsVisualOverlays => 'Viwekeleo vya Kuonekana';

  @override
  String get settingsSeasonalSurprise => 'Mshangao wa Msimu';

  @override
  String get settingsMetadataAndRatings => 'Metadata na Ukadiriaji';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase huwezesha miunganisho ya upande wa seva ikijumuisha vyanzo vya ziada vya ukadiriaji, maombi ya Seerr na mapendeleo yaliyosawazishwa.';

  @override
  String get settingsOfflineDownloads => 'Vipakuliwa vya Nje ya Mtandao';

  @override
  String get settingsHigh => 'Juu';

  @override
  String get settingsLow => 'Chini';

  @override
  String get settingsCustomPath => 'Njia Maalum';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ingiza njia ya folda ya kupakua';

  @override
  String get settingsConcurrentDownloads => 'Vipakuliwa kwa Pamoja';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Idadi ya juu zaidi ya vipengee vya kupakua mara moja.';

  @override
  String get settingsAppInfo => 'MAELEZO YA APP';

  @override
  String get settingsReportAnIssue => 'Ripoti Tatizo';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Fungua tracker ya suala kwenye GitHub';

  @override
  String get settingsJoinDiscord => 'Jiunge na Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Piga gumzo na jumuiya';

  @override
  String get settingsJoinTheDiscord => 'Jiunge na Discord';

  @override
  String get settingsSupportMoonfin => 'Msaada Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'KISHERIA';

  @override
  String get settingsLicenses => 'Leseni';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Notisi za leseni ya chanzo huria';

  @override
  String get settingsPrivacyPolicy => 'Sera ya Faragha';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Jinsi Moonfin hushughulikia data yako';

  @override
  String get settingsCheckForUpdates => 'Angalia Usasisho';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Angalia toleo jipya zaidi la Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Inaendeshwa na Flutter';

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
  String get settingsBoth => 'Zote mbili';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Changanya Kichujio cha Aina ya Maudhui';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Mapendeleo ya Uchezaji wa Video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Injini kuu ya video na mipangilio ya ubora wa utiririshaji';

  @override
  String get settingsAudioPreferences => 'Mapendeleo ya Sauti';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Nyimbo za sauti, kuchakata na chaguzi za upitishaji';

  @override
  String get settingsAutomationAndQueue => 'Otomatiki & Foleni';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Uchezaji na mpangilio wa kiotomatiki';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Ubora wa upakuaji, vikomo vya hifadhi, na ukubwa wa foleni';

  @override
  String get settingsSyncplaySubtitle =>
      'Mantiki ya ulandanishi kwa vikao vya kikundi';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Vipengele maalum vya mchezaji. Tumia kwa tahadhari, kwani baadhi ya chaguo zinaweza kusababisha matatizo ya kucheza tena';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ungependa Kuruka Utambulisho na Outros?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'Mtumiaji wa haraka';

  @override
  String get settingsSkip => 'Ruka';

  @override
  String get settingsDoNothing => 'Usifanye Chochote';

  @override
  String get settingsMaxBitrateDescription =>
      'Zuia kasi ya utiririshaji. Maudhui yaliyo juu ya kiwango hiki yatabadilishwa ili yatoshee.';

  @override
  String get settingsMaxResolutionDescription =>
      'Weka kiwango cha juu cha azimio ambacho mchezaji ataomba. Maudhui ya ubora wa juu yatapitishwa chini.';

  @override
  String get settingsPlayerZoomDescription =>
      'Jinsi video inapaswa kuongezwa ili kutoshea skrini.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Chagua injini chaguo-msingi ya kucheza kwenye vifaa vya Android TV. Mabadiliko yatatumika kwa kipindi kijacho cha kucheza tena.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (inapendekezwa)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (urithi)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Njia mbadala';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Tabia ya mada za Dolby Vision kwenye vifaa visivyo na usimbaji wa Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Uliza kila wakati';

  @override
  String get settingsPreferHdr10Fallback => 'Pendelea njia mbadala ya HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Pendelea msimbo wa kupitisha seva';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Wasifu 7 Uchezaji wa Moja kwa Moja';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Hudhibiti ikiwa mitiririko ya safu 7 ya uboreshaji wa wasifu wa Dolby Vision inapaswa kuelekeza kucheza.';

  @override
  String get settingsAutoAftkrtEnabled => 'Otomatiki (AFTKRT imewezeshwa)';

  @override
  String get settingsEnabledOnThisDevice => 'Imewashwa kwenye kifaa hiki';

  @override
  String get settingsDisabledPreferTranscode => 'Imezimwa (pendelea transcode)';

  @override
  String get settingsResumeRewindDescription =>
      'Unaporejesha uchezaji (kutoka Endelea Kutazama au ukurasa wa kipengee cha maudhui), ni sekunde ngapi zinapaswa kurejeshwa?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Unapoanza kucheza tena baada ya kubofya kitufe cha kusitisha, ni sekunde ngapi zinapaswa kurejeshwa?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Sekunde ngapi za kuruka nyuma baada ya kubonyeza kitufe cha kurejesha nyuma.';

  @override
  String get settingsOneSecond => 'Sekunde 1';

  @override
  String get settingsThreeSeconds => '3 sekunde';

  @override
  String get settingsFortyFiveSeconds => 'Sekunde 45';

  @override
  String get settingsSixtySeconds => 'Sekunde 60';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Sekunde ngapi za kuruka mbele baada ya kubonyeza kitufe cha kusonga mbele kwa haraka.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 hadi avkodare ya nje';

  @override
  String get settingsCinemaMode => 'Njia ya Sinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Cheza vionjo/vionjo kabla ya kipengele kikuu';

  @override
  String get settingsNextUpDisplayDescription =>
      'Iliyopanuliwa inaonyesha kadi kamili iliyo na mchoro wa kipindi na maelezo. Ndogo inaonyesha kuwekelea kwa kuhesabu kurudi nyuma. Imezimwa huficha kidokezo kabisa.';

  @override
  String get settingsShort => 'Mfupi';

  @override
  String get settingsLong => 'Muda mrefu';

  @override
  String get settingsVeryLong => 'Mrefu Sana';

  @override
  String get settingsVideoStartDelay => 'Kuchelewa Kuanza kwa Video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV ya moja kwa moja';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Washa uchezaji wa moja kwa moja kwa Live TV';

  @override
  String get settingsOpenGroups => 'Fungua Vikundi';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Unda, jiunge au udhibiti vikundi vya SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Imewashwa';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Washa vipengele vya kutazama kikundi';

  @override
  String get settingsSyncplayButton => 'Kitufe cha SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Onyesha kitufe cha SyncPlay kwenye upau wa kusogeza';

  @override
  String get settingsSyncplayAdvancedCorrection =>
      'Urekebishaji wa hali ya juu';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Washa mantiki ya usawazishaji iliyoboreshwa';

  @override
  String get settingsSyncplaySyncCorrection => 'Usahihishaji wa Usawazishaji';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Rekebisha uchezaji kiotomatiki ili uendelee kusawazisha';

  @override
  String get settingsSyncplaySpeedToSync => 'Kasi ya Kusawazisha';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Tumia marekebisho ya kasi ya uchezaji kusawazisha';

  @override
  String get settingsSyncplaySkipToSync => 'Ruka hadi Usawazishaji';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'Tumia kutafuta kusawazisha';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Kiwango cha Chini cha Kuchelewa kwa Kasi';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Ucheleweshaji wa Kasi ya Juu';

  @override
  String get settingsSyncplaySpeedDuration => 'Muda wa Kasi';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Kiwango cha Chini cha Kuchelewa Kuruka';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Upungufu wa Ziada';

  @override
  String get onNow => 'Ipo Sasa';

  @override
  String get collections => 'Mikusanyiko';

  @override
  String get lastPlayed => 'Iliyochezwa Mwisho';

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
