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
  String get accountPreferences => 'MAPENDELEO YA AKAUNTI';

  @override
  String get interfaceLanguage => 'Lugha ya Kiolesura';

  @override
  String get systemLanguageDefault => 'Chaguo-msingi la Mfumo';

  @override
  String get signIn => 'Ingia';

  @override
  String get empty => 'Tupu';

  @override
  String connectingToServer(String serverName) {
    return 'Inaunganisha kwenye $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
    return 'QuickConnect haipatikani: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect haipatikani ($status): $detail';
  }

  @override
  String get whosWatching => 'Nani anatazama?';

  @override
  String get addUser => 'Ongeza Mtumiaji';

  @override
  String get selectServer => 'Chagua Seva';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin toleo $version';
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
    return 'Ondoa \"$serverName\" kutoka kwa seva zako?';
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
  String get detailScreenStyle => 'Mtindo wa skrini ya maelezo';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasiki ni mpangilio asili wa Moonfin ulio katikati. Kisasa ni mpangilio wa kisinema unaojirekebisha.';

  @override
  String get detailScreenStyleMoonfin => 'Klasiki';

  @override
  String get detailScreenStyleModern => 'Kisasa';

  @override
  String get expandedTabs => 'Vichupo Vilivyopanuliwa';

  @override
  String get expandedTabsSubtitle =>
      'Onyesha maudhui ya kichupo kiotomatiki unapovinjari vichupo. Zima ili kufungua na kufunga kila kichupo mwenyewe.';

  @override
  String get showTechnicalDetails => 'Onyesha Maelezo ya Kiufundi?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Onyesha maelezo ya kodeki, mwonekano, na mtiririko katika muhtasari wa bango';

  @override
  String get recommendationSystem => 'Mfumo wa Mapendekezo';

  @override
  String get recommendationSystemSubtitle =>
      'Tumia algoriti ya maktaba ya ndani ya Moonfin Recommends au Vipimo vya Ufanano vya TMDb mtandaoni. Kumbuka: Mapendekezo ya mtandaoni yanahitaji muunganisho wa Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Ufanano wa TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Tumia Kikomo cha Ukadiriaji wa Wazazi?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Punguza mapendekezo ya Moonfin Recommends kulingana na ukadiriaji wa wazazi wa maudhui lengwa';

  @override
  String get interfaceStyle => 'Mtindo wa Kiolesura';

  @override
  String get interfaceStyleSubtitle =>
      'Kiotomatiki hulingana na kifaa chako. Chagua Apple au Material ili kulazimisha muonekano.';

  @override
  String get interfaceStyleAutomatic => 'Kiotomatiki';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Ubora wa Glass';

  @override
  String get glassQualitySubtitle =>
      'Otomatiki huchagua athari bora ya glass kwa kifaa hiki. Kamili hulazimisha ukungu halisi; Iliyopunguzwa hutumia glass nyepesi inayookoa nguvu ya GPU.';

  @override
  String get glassQualityAuto => 'Otomatiki';

  @override
  String get glassQualityFull => 'Kamili';

  @override
  String get glassQualityReduced => 'Iliyopunguzwa';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Badili kati ya Moonfin na Neon Pulse bila kuanzisha upya programu';

  @override
  String get customThemeTitle => 'Mandhari Maalum';

  @override
  String get customThemeSubtitle =>
      'Mandhari maalum hubadilisha vipengele vya kuonekana katika Moonfin nzima. Chagua mojawapo ya chaguo hizi ili kuendana na mtindo wako.';

  @override
  String get keyboardPreferSystemIme => 'Pendelea kibodi ya mfumo';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Tumia mbinu ya kuingiza maandishi ya kifaa chako kama chaguo-msingi';

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
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Mtindo wa glasi-tiririka wenye mandharinyuma ya rangi inayosogea, nyuso zenye ukungu, na rangi ya samawati ya Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Mtindo wa sanaa ya pikseli wa zamani wenye rangi nzito, mipaka ya vitalu, vivuli vikali, na fonti ya pikseli';

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
    return 'Imeshindwa kuunganisha kwenye $target';
  }

  @override
  String get exitApp => 'Ungependa kufunga Moonfin?';

  @override
  String get exitAppConfirmation => 'Je, una uhakika unataka kuondoka?';

  @override
  String get exit => 'Utgång';

  @override
  String get gameMenu => 'Menyu';

  @override
  String get gamePaused => 'Imesitishwa';

  @override
  String get gameSaveState => 'Hifadhi hali';

  @override
  String get games => 'Michezo';

  @override
  String get gameLoadState => 'Pakia hali';

  @override
  String get gameFastForward => 'Sogeza mbele haraka';

  @override
  String get gameEmulatorSettings => 'Mipangilio ya emulator';

  @override
  String get gameNoCoreOptions =>
      'Kiini hiki hakina chaguo zinazoweza kurekebishwa.';

  @override
  String get gameHoldToOpenMenu => 'Shikilia ili kufungua menyu';

  @override
  String get gamePlaybackUnsupported =>
      'Kucheza michezo hakutumiki kwenye kifaa hiki bado.';

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
  String get series => 'Mifululizo';

  @override
  String get noItemsFound => 'Hakuna vipengee vilivyopatikana';

  @override
  String get home => 'Mwanzo';

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
    return 'Imeshindwa kupakia folda: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Folda hii haina chochote';

  @override
  String itemCountLabel(int count) {
    return 'vipengee $count';
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
    return 'Vipengee $count';
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
    return '$name — Aina';
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
    return 'dk $count zilizopita';
  }

  @override
  String hoursAgo(int count) {
    return 'saa $count zilizopita';
  }

  @override
  String daysAgo(int count) {
    return 'siku $count zilizopita';
  }

  @override
  String get discoverySubjects => 'Masomo ya Ugunduzi';

  @override
  String get pickDiscoverySubjects =>
      'Chagua milisho ya mada ya kuonyesha katika Dokezo.';

  @override
  String get apply => 'Tumia';

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
    return 'vichwa $count';
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
    return 'waandishi $count';
  }

  @override
  String genresCount(int count) {
    return 'aina $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% imekamilika';
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
    return 'Vichwa $count vimepangwa kwa uvinjari unaotanguliza usomaji.';
  }

  @override
  String get titles => 'Vichwa';

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
    return 'Hakuna $label';
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
  String get watched => 'Zilizotazamwa';

  @override
  String get unread => 'Haijasomwa';

  @override
  String get unwatched => 'Zisizotazamwa';

  @override
  String get seriesStatus => 'Hali ya Mfululizo';

  @override
  String get allLibraries => 'Maktaba Zote';

  @override
  String get books => 'Vitabu';

  @override
  String get latestBooks => 'Vitabu vya Hivi Punde';

  @override
  String get latestAudiobooks => 'Vitabu vya Sauti vya Hivi Punde';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vitabu $count',
      one: 'kitabu 1',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Kitabu';

  @override
  String get bookFormatAudiobook => 'Kitabu cha Sauti';

  @override
  String bookPercentRead(int percent) {
    return '$percent% kimesomwa';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time zimesalia';
  }

  @override
  String get bookHeroRead => 'Soma';

  @override
  String get bookHeroListen => 'Sikiliza';

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
    return 'sehemu $count';
  }

  @override
  String firstPublished(int year) {
    return 'Ilichapishwa kwa mara ya kwanza $year';
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
    return 'vitabu $count';
  }

  @override
  String get couldNotLoadSubject => 'Haikuweza kupakia mada hii sasa hivi.';

  @override
  String get audiobookDetails => 'Maelezo ya Kitabu cha Sauti';

  @override
  String authorsCountTitle(int count) {
    return 'Waandishi $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vitabu $count vya sauti',
      one: 'kitabu 1 cha sauti',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Orodha ya Orodha';

  @override
  String get itemListPlaceholder => 'Orodha ya bidhaa itaonekana hapa';

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
  String get musicVideos => 'Video za Muziki';

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
    return 'Diski $number';
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
    return 'Ilichapishwa $year';
  }

  @override
  String get publicationDateUnknown => 'Tarehe ya kuchapishwa haijulikani';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Misimu $count',
      one: 'Msimu 1',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Inaisha $time';
  }

  @override
  String get items => 'Vipengee';

  @override
  String get extras => 'Nyongeza';

  @override
  String get behindTheScenes => 'Nyuma ya Pazia';

  @override
  String get deletedScenes => 'Matukio Yaliyofutwa';

  @override
  String get featurettes => 'Vipengele Vifupi';

  @override
  String get interviews => 'Mahojiano';

  @override
  String get scenes => 'Matukio';

  @override
  String get shorts => 'Filamu Fupi';

  @override
  String get trailers => 'Trela';

  @override
  String timeRemaining(String time) {
    return '$time zimesalia';
  }

  @override
  String endsIn(String time) {
    return 'Inaisha baada ya $time';
  }

  @override
  String get view => 'Tazama';

  @override
  String get resumeReading => 'Endelea Kusoma';

  @override
  String get read => 'Soma';

  @override
  String resumeFrom(String position) {
    return 'Endelea kutoka $position';
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
    return 'Futa nyimbo zilizopakuliwa za \"$title\"?';
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
    return 'Hakuna $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Inapakua $title (vipengee $count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Una uhakika unataka kufuta \"$name\" kutoka kwa seva? Kitendo hiki hakiwezi kutenduliwa.';
  }

  @override
  String get itemDeleted => 'Kipengee kimefutwa';

  @override
  String get noPlayableTrailerFound =>
      'Hakuna trela inayoweza kucheza iliyopatikana.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Muundo wa kitabu hauhimiliwi: .$extension';
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
    return 'Manukuu yamepakuliwa na kuchaguliwa: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Manukuu yamepakuliwa. Inaweza kuchukua muda kuonekana Jellyfin inapoonyesha upya kipengee.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Hakuna manukuu ya mbali yaliyopatikana kwa $language.';
  }

  @override
  String get selectVersion => 'Chagua Toleo';

  @override
  String versionNumber(int number) {
    return 'Toleo $number';
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
    return 'Inapakua $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Futa Faili Zilizopakuliwa';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Futa faili za ndani za $typeLabel?\n\nHii itaachilia nafasi ya hifadhi. Unaweza kupakua tena baadaye.';
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
  String get directors => 'WAKURUGENZI';

  @override
  String get writer => 'MWANDISHI';

  @override
  String get writers => 'WAANDISHI';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count zaidi';
  }

  @override
  String totalEpisodes(int count) {
    return 'Vipindi $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Kipindi $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Sura $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'nyimbo $count',
      one: 'wimbo 1',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sura $count',
      one: 'sura 1',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Alizaliwa $date';
  }

  @override
  String died(String date) {
    return 'Alifariki $date';
  }

  @override
  String age(int age) {
    return 'Umri $age';
  }

  @override
  String get showLess => 'Onyesha Chini';

  @override
  String get readMore => 'Soma Zaidi';

  @override
  String get shuffle => 'Changanya';

  @override
  String get shuffleAllMusic => 'Changanya muziki wote';

  @override
  String get carSignInPrompt => 'Ingia kwenye Moonfin kwenye simu yako';

  @override
  String get carServerUnreachable => 'Haiwezi kufikia seva yako';

  @override
  String downloadsCount(int count) {
    return 'vipakuliwa $count';
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
    return '$action ya manukuu ya mbali inahitaji ruhusa ya usimamizi wa manukuu ya Jellyfin kwa mtumiaji huyu.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Kipengee hiki hakikupatikana kwenye seva kwa $action ya manukuu ya mbali.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action ya manukuu ya mbali imeshindwa: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action ya manukuu ya mbali imeshindwa (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Imeshindwa kufanya $action ya manukuu ya mbali.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'vipindi vyote vilivyopakuliwa vya \"$name\"';
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
    return 'Kitendo cha $label kimeshindwa: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Imeshindwa kuweka sauti ya utumaji: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Vidhibiti vya $label';
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
    return 'Simamisha $label';
  }

  @override
  String get queueIsEmpty => 'Foleni ni tupu';

  @override
  String trackNumber(int number) {
    return 'Wimbo $number';
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
    return 'sekunde $seconds';
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
  String get player => 'Kichezaji';

  @override
  String get container => 'Chombo';

  @override
  String get bitrate => 'Kasi ya biti';

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
    return 'Hitilafu ya kipindi cha $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Imeshindwa kupakia maelezo ya kitabu: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Utoaji wa EPUB ndani ya programu bado haupatikani kwenye mfumo huu.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Muundo huu (.$extension) hauwezi kuonyeshwa ndani ya programu bado.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Utoaji wa hati iliyopachikwa haupatikani kwenye jukwaa hili.';

  @override
  String get couldNotOpenExternalViewer =>
      'Haikuweza kufungua kitazamaji cha nje.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Imeshindwa kufungua kisomaji cha ndani ya programu: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Alamisho tayari limehifadhiwa kwenye $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Alamisho limeongezwa: $label';
  }

  @override
  String get noBookmarksYet =>
      'Bado hakuna alamisho.\nGusa aikoni ya alamisho unaposoma ili kuhifadhi nafasi yako.';

  @override
  String get noTableOfContentsAvailable =>
      'Hakuna jedwali la yaliyomo linalopatikana';

  @override
  String pageLabel(int number) {
    return 'Ukurasa $number';
  }

  @override
  String get position => 'Nafasi';

  @override
  String get bookReader => 'Msomaji wa Kitabu';

  @override
  String formatExtension(String extension) {
    return 'Muundo: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% kimesomwa';
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
    return 'Weka Upya Ukuzaji (${zoom}x)';
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
    return 'Imeshindwa kusasisha hali ya kusoma: $error';
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
    return 'Jukwaa hili haliwezi kuendesha injini ya hati iliyopachikwa kwa faili za $extension.';
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
    return 'Imeshindwa kupakia mwongozo: $error';
  }

  @override
  String get noChannelsFound => 'Hakuna vituo vilivyopatikana';

  @override
  String get liveBadge => 'MUBASHARA';

  @override
  String guideNextProgram(String time, String title) {
    return 'Inayofuata: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'dk $minutes zimesalia';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'saa $hours zimesalia';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'saa $hours dk $minutes zimesalia';
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
  String get record => 'Rekodi';

  @override
  String get cancelRecordingAction => 'Ghairi Kurekodi';

  @override
  String get programSetToRecord => 'Kipindi kimewekwa kurekodiwa';

  @override
  String get recordingCancelled => 'Kurekodi kumeghairiwa';

  @override
  String get unableToCreateRecording => 'Imeshindwa kuunda rekodi';

  @override
  String get watch => 'Tazama';

  @override
  String get close => 'Funga';

  @override
  String failedToPlayChannel(String name) {
    return 'Imeshindwa kucheza $name';
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
    return 'Ghairi kurekodi kulikopangwa kwa \"$name\"?';
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
    return 'Simamisha kurekodi \"$name\"?';
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
    return 'Hakuna matokeo ya \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Utafutaji umeshindwa: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Aina ya Akaunti ya Seerr';

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
    return 'Ondoa \"$name\" na faili zake?';
  }

  @override
  String tracksCount(int count) {
    return 'nyimbo $count';
  }

  @override
  String get album => 'Albamu';

  @override
  String get playAlbum => 'Cheza Albamu';

  @override
  String failedToLoadAlbum(String error) {
    return 'Imeshindwa kupakia albamu: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Hakuna nyimbo zilizopakuliwa zilizopatikana za $name.';
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
    return 'Ondoa \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return 'dk $minutes';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'M$season K$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Kipindi $number';
  }

  @override
  String get seriesNotFound => 'Mfululizo haujapatikana';

  @override
  String get errorLoadingSeries => 'Hitilafu katika kupakia mfululizo';

  @override
  String get downloadedEpisodes => 'Vipindi Vilivyopakuliwa';

  @override
  String seasonNumber(int number) {
    return 'Msimu $number';
  }

  @override
  String seasonChip(int number) {
    return 'M$number';
  }

  @override
  String get specials => 'Maalum';

  @override
  String get deleteSeason => 'Futa Msimu';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Futa vipindi vyote vilivyopakuliwa katika $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vipindi $count',
      one: 'kipindi 1',
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
    return 'Futa vipengee $count vilivyopakuliwa?';
  }

  @override
  String get musicAndAudiobooks => 'Vitabu vya Muziki na Sikizi';

  @override
  String get images => 'Picha';

  @override
  String get database => 'Hifadhidata';

  @override
  String ofStorageLimit(String limit) {
    return 'kati ya kikomo cha $limit';
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
    return 'chaguo $count';
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
  String get confetti => 'Konfeti';

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
      'Kurasa za maelezo, safu za nyumbani, na sauti';

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
  String get loopThemeMusic => 'Rudia Muziki wa Mandhari';

  @override
  String get loopThemeMusicSubtitle =>
      'Rudia wimbo badala ya kuucheza mara moja';

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
  String get settingsScrollWheelAction => 'Gurudumu la kusogeza la kipanya';

  @override
  String get settingsScrollWheelActionDescription =>
      'Chagua kitendo cha kusogeza gurudumu la kipanya juu ya video wakati wa uchezaji.';

  @override
  String get scrollWheelActionOff => 'Imezimwa';

  @override
  String get scrollWheelActionSeek => 'Sogeza (mbele / nyuma)';

  @override
  String get scrollWheelActionVolume => 'Sauti';

  @override
  String get playerTooltipVolume => 'Sauti';

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
  String get fallbackAudioLanguage => 'Lugha Mbadala ya Sauti';

  @override
  String get preferDefaultAudioTrack =>
      'Pendelea Mkondo Chaguo-msingi wa Sauti';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Pendelea mkondo asili wa sauti kuliko udubu uliotafsiriwa.';

  @override
  String get preferAudioDescription => 'Pendelea Mikondo ya Maelezo ya Sauti';

  @override
  String get preferAudioDescriptionDescription =>
      'Pendelea mikondo ya maelezo ya sauti kuliko mikondo ya kawaida.';

  @override
  String get transcodingAudio => 'Kubadilisha Msimbo (Sauti)';

  @override
  String get directStreamRemux => 'Mtiririko wa Moja kwa Moja (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Kubadilisha Msimbo (Kasi ya Biti au Mwonekano)';

  @override
  String get transcodingVideoAndAudio => 'Kubadilisha Msimbo (Video na Sauti)';

  @override
  String get transcodingVideo => 'Kubadilisha Msimbo (Video)';

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
  String get settingsAudioOutputMode => 'Modi ya Utoaji wa Sauti';

  @override
  String get settingsAudioOutputModeDescription =>
      'Chagua jinsi sauti inavyosimbuliwa. AVR Passthrough hutuma mikondo ghafi ya Dolby/DTS kwa risiva yako; Otomatiki au Downmix husimbua ndani ya kifaa.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Kodeki Mbadala ya Sauti';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Chagua muundo lengwa wa kubadilisha msimbo wa sauti ya chaneli nyingi wakati mkondo asili hauwezi kuchezwa moja kwa moja au kupitishwa.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Tambua Kiotomatiki\n(Inapendekezwa)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Chaguo-msingi)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Bila Hasara)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Pekee)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Yenye Ufanisi)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Bila Hasara)';

  @override
  String get settingsMaxAudioChannels => 'Chaneli za Juu za Sauti';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Sanidi idadi ya juu ya chaneli za mfumo wako wa sauti. Mikondo ya chaneli nyingi inayozidi kikomo hiki itapunguzwa au kubadilishwa msimbo.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Tambua Kiotomatiki\n(Chaguo-msingi la Maunzi)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Ya Kina)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough ya Kodeki';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Washa miundo ambayo AVR au kifaa chako cha HDMI kinaunga mkono pekee.';

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
      'Tuma mtiririko wa biti wa Dolby Digital Plus (EAC3) kwa kisimbuzi cha nje.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Tuma mtiririko wa biti wa Dolby Atmos kupitia EAC3 (JOC) kwa kisimbuzi cha nje.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Tuma mtiririko wa biti wa DTS-HD MA (pamoja na DTS core) kwa kisimbuzi cha nje.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Tuma mtiririko wa biti wa Dolby TrueHD wenye metadata ya Atmos kwa kisimbuzi cha nje.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Uwezo wa Sauti Uliotambuliwa';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Hakuna muhtasari wa uwezo wa wakati wa utekelezaji unaopatikana bado.';

  @override
  String get settingsAudioRouteLabel => 'Njia';

  @override
  String get settingsAudioDecodeLabel => 'Usimbuaji';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Njia ya sauti ya HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Spika';

  @override
  String get settingsAudioRouteHeadphones => 'Vipokea sauti';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Uchunguzi';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Kiwango cha Video';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Masafa ya Video';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Kodeki ya Manukuu';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Kodeki za Sauti Zinazoruhusiwa';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Kodeki za Sauti za HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Kodeki za Sauti za HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Njia ya Sauti Inayotumika';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Uwezo wa Njia Kutumia Sauti ya HD';

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
    return 'Baada ya vipindi $episodes / saa $hours';
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
  String get subtitleMode => 'Modi ya Manukuu';

  @override
  String get subtitleModeFlagged => 'Yaliyoalamishwa';

  @override
  String get subtitleModeAlways => 'Kila Wakati';

  @override
  String get subtitleModeForeign => 'Lugha ya Kigeni';

  @override
  String get subtitleModeForced => 'Yaliyolazimishwa';

  @override
  String get subtitleModeFlaggedDescription =>
      'Hucheza mikondo iliyoalamishwa katika metadata ya faili la maudhui kama \"default\" au \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Hupakia na kuonyesha manukuu kiotomatiki kila video inapoanza.';

  @override
  String get subtitleModeForeignDescription =>
      'Huwasha manukuu kiotomatiki ikiwa mkondo chaguo-msingi wa sauti uko katika lugha ya kigeni.';

  @override
  String get subtitleModeForcedDescription =>
      'Hupakia manukuu yaliyowekwa alama ya \"forced\" pekee.';

  @override
  String get subtitleModeNoneDescription =>
      'Huzima kabisa upakiaji wa manukuu wa kiotomatiki.';

  @override
  String get fallbackSubtitleLanguage => 'Lugha Mbadala ya Manukuu';

  @override
  String get subtitleStream => 'Mkondo wa Manukuu';

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
  String get cyan => 'Samawati';

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
    return 'Mipangilio ya wasifu wa $profile imepakiwa.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Imeshindwa kupakia mipangilio ya wasifu wa $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Mipangilio ya ndani imesawazishwa na wasifu wa $profile.';
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
  String get reportDownloadsActivity => 'Onyesha vipakuliwa kwenye seva';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Ruhusu msimamizi wa seva aone vipakuliwa vyako vilivyobadilishwa msimbo kwenye dashibodi';

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
  String get navbarAlwaysExpanded =>
      'Panua Lebo za Upau wa Urambazaji Kila Wakati';

  @override
  String get showSeerrButton => 'Onyesha Kitufe cha Seerr';

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
  String get teal => 'Kijani-buluu';

  @override
  String get navy => 'Buluu Nyeusi';

  @override
  String get charcoal => 'Mkaa';

  @override
  String get brown => 'Kahawia';

  @override
  String get darkRed => 'Nyekundu Iliyokolea';

  @override
  String get darkGreen => 'Kijani Kijani';

  @override
  String get slate => 'Kijivu-buluu';

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
  String get groupItemsIntoCollections => 'Panga Vipengee katika Makusanyo';

  @override
  String get hideCollectionAssociatedItems =>
      'Ficha vipengee vya maktaba vinavyohusiana na Mkusanyo unapovinjari maktaba';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'Ilani ya Kupanga Maktaba';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Ili kutumia mpangilio huu, tafadhali hakikisha mipangilio ya maktaba ya \"Panga filamu katika makusanyo\" na/au \"Panga vipindi katika makusanyo\" imewashwa chini ya mipangilio ya Onyesho ya maktaba yako kwenye seva yako ya Jellyfin au Emby.';

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
    return '$count vimechaguliwa';
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
  String get trailerAudio => 'Sauti ya Trela';

  @override
  String get enableTrailerAudio =>
      'Washa sauti ya trela kwenye upau wa maudhui';

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
  String get fullScreenRows => 'Safu za Nyumbani Zilizopanuliwa';

  @override
  String get fullScreenRowsDescription =>
      'Punguza safu za nyumbani hadi safu 1 kwa kila skrini';

  @override
  String get perRowImageType => 'Aina ya Picha kwa Safu Mlalo';

  @override
  String get perRowSettings => 'Mipangilio ya Kila Safu';

  @override
  String get autoLogin => 'Ingia kiotomatiki';

  @override
  String get lastUser => 'Mtumiaji wa Mwisho';

  @override
  String get currentUser => 'Mtumiaji wa Sasa';

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
  String get mode => 'Modi';

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
    return 'dk $minutes';
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
  String get clockModeStatic => 'Tuli';

  @override
  String get clockModeBouncing => 'Inayoruka';

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
      'Onyesha ukadiriaji wa MDBList na TMDB';

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
  String get pluginLabel => 'Programu-jalizi ya Moonbase';

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
    return '$status\nToleo: $version';
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
  String get studios => 'Studio';

  @override
  String get popularSeries => 'Mfululizo Maarufu';

  @override
  String get seriesGenres => 'Aina za Msururu';

  @override
  String get upcomingSeries => 'Msururu Ujao';

  @override
  String get networks => 'Mitandao';

  @override
  String get seerrDiscoveryRows => 'Safu za Ugunduzi za Seerr';

  @override
  String get resetRowsToDefaults => 'Weka upya safu mlalo ziwe chaguomsingi';

  @override
  String get enableSeerr => 'Washa Seerr';

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
  String get seerrNotificationsSection => 'Arifa';

  @override
  String get seerrNotifyNewRequestsTitle => 'Arifa za maombi mapya';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Nijulishe mtu anapowasilisha ombi';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Masasisho ya maombi';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Yaliyoidhinishwa, yaliyokataliwa, na yaliyoongezwa kwenye maktaba yako';

  @override
  String get seerrNotifyIssuesTitle => 'Masasisho ya matatizo';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Matatizo mapya, majibu, na masuluhisho';

  @override
  String loggedInAs(String username) {
    return 'Umeingia kama: $username';
  }

  @override
  String get discoverRows => 'Ukurasa wa Ugunduzi wa Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Washa safu za kuonyesha kwenye ukurasa mkuu wa Seerr. Buruta ili kupanga upya. Mpangilio maalum husawazishwa na Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Washa safu za kuonyesha kwenye ukurasa mkuu wa Seerr. Buruta ili kupanga upya. Mpangilio maalum husawazishwa na Moonbase.';

  @override
  String get enabled => 'Imewashwa';

  @override
  String get hidden => 'Imefichwa';

  @override
  String get aboutTitle => 'Kuhusu';

  @override
  String versionValue(String version) {
    return 'Toleo $version';
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
    return 'Sasisho linapatikana: v$version';
  }

  @override
  String get updateNotifications => 'Sasisha Arifa';

  @override
  String get showWhenUpdatesAvailable =>
      'Onyesha wakati masasisho yanapatikana';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Inapatikana';
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
      'MDBList, TMDB, na vyanzo vya ukadiriaji';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Kikomo cha akiba ya picha';

  @override
  String get clearImageCache => 'Futa akiba ya picha';

  @override
  String get imageCacheCleared => 'Akiba ya picha imefutwa';

  @override
  String get clear => 'Futa';

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
    return 'Inapakua · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Inaingiza';

  @override
  String itemsCount(int count) {
    return 'Vipengee $count';
  }

  @override
  String get seerrSettings => 'Mipangilio ya Seerr';

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
    return 'Imeombwa na $name';
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
    return 'Ghairi ombi la \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Ghairi maombi $count ya \"$title\"?';
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
    return 'Bajeti: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Mapato: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$label $count';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Omba $type';
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
  String get appearances => 'Mionekano';

  @override
  String get crewSection => 'Wafanyakazi';

  @override
  String ageValue(int age) {
    return 'umri $age';
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
  String get failedStatus => 'Imeshindwa';

  @override
  String get processingStatus => 'Inachakatwa';

  @override
  String modifiedByName(String name) {
    return 'Imebadilishwa na $name';
  }

  @override
  String get completedStatus => 'Imekamilika';

  @override
  String get requestErrorDuplicate => 'Kichwa hiki tayari kimeombwa';

  @override
  String get requestErrorQuota => 'Umefikia kikomo cha maombi';

  @override
  String get requestErrorBlocklisted => 'Kichwa hiki kimezuiwa';

  @override
  String get requestErrorNoSeasons => 'Hakuna misimu iliyosalia ya kuomba';

  @override
  String get requestErrorPermission => 'Huna ruhusa ya kufanya ombi hili';

  @override
  String get seerrRequestsTitle => 'Maombi';

  @override
  String get seerrIssuesTitle => 'Matatizo';

  @override
  String get sortNewest => 'Mapya Zaidi';

  @override
  String get sortLastModified => 'Yaliyobadilishwa Mwisho';

  @override
  String get noIssues => 'Hakuna matatizo';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Maombi $remaining kati ya $limit ya filamu yamesalia';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Maombi $remaining kati ya $limit ya misimu yamesalia';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Sehemu ya $name';
  }

  @override
  String get viewCollection => 'Angalia Mkusanyo';

  @override
  String get requestCollection => 'Omba Mkusanyo';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Filamu $total · $available zinapatikana';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Omba filamu $count';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Inaomba $current kati ya $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Filamu $count zimeombwa';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Filamu $ok kati ya $total zimeombwa';
  }

  @override
  String get collectionAllRequested =>
      'Filamu zote tayari zinapatikana au zimeombwa';

  @override
  String get reportIssue => 'Ripoti Tatizo';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Sauti';

  @override
  String get whatsWrong => 'Kuna tatizo gani?';

  @override
  String get allEpisodes => 'Vipindi Vyote';

  @override
  String get episode => 'Kipindi';

  @override
  String get openStatus => 'Imefunguliwa';

  @override
  String get resolvedStatus => 'Limetatuliwa';

  @override
  String get resolveAction => 'Tatua';

  @override
  String get reopenAction => 'Fungua Tena';

  @override
  String reportedByName(String name) {
    return 'Imeripotiwa na $name';
  }

  @override
  String commentsCount(int count) {
    return 'maoni $count';
  }

  @override
  String get addComment => 'Ongeza maoni';

  @override
  String get deleteIssueConfirm => 'Futa tatizo hili?';

  @override
  String get submitReport => 'Wasilisha Ripoti';

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
  String get general => 'Jumla';

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
  String get remote => 'Rimoti';

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
  String get stop => 'Simamisha';

  @override
  String get streaming => 'Kutiririsha';

  @override
  String get time => 'Muda';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'Zima sauti';

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
  String get adminDrawerDisplay => 'Onyesho';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'Mipangilio ya NFO';

  @override
  String get adminDrawerTranscoding => 'Kubadilisha msimbo';

  @override
  String get adminDrawerResume => 'Endelea';

  @override
  String get adminDrawerStreaming => 'Kutiririsha';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'Masasisho ya programu-jalizi yanayopatikana: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Programu-jalizi zinazohitaji kuanzishwa upya: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Kazi zilizoratibiwa zilizoshindwa: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Maingizo ya hivi karibuni ya onyo/hitilafu: $count';
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
    return 'Hitilafu: $error';
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
    return 'Amri imeshindwa: $error';
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
  String get volume => 'Sauti';

  @override
  String get actions => 'Vitendo';

  @override
  String get videoCodec => 'Kodeki ya Video';

  @override
  String get audioCodec => 'Kodeki ya Sauti';

  @override
  String get hwAccel => 'Kasi ya Maunzi';

  @override
  String get completion => 'Kukamilika';

  @override
  String get direct => 'Moja kwa moja';

  @override
  String get adminDisconnect => 'Tenganisha';

  @override
  String get adminClearDates => 'Tarehe wazi';

  @override
  String get adminActivitySeverityAll => 'Viwango vyote vya ukali';

  @override
  String get adminActivityDateRange => 'Kipindi cha tarehe';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Imeshindwa kupakia kumbukumbu ya shughuli: $error';
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
    return 'Imeshindwa kusasisha kifaa: $error';
  }

  @override
  String get adminDeleteDevice => 'Futa Kifaa';

  @override
  String get adminDeviceDeleted => 'Kifaa kimefutwa';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Imeshindwa kufuta kifaa: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ondoa kifaa \'$name\'? Mtumiaji atahitaji kuingia tena kwenye kifaa hiki.';
  }

  @override
  String get adminDeleteAllDevices => 'Futa vifaa vyote';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Ondoa vifaa $count? Watumiaji walioathirika watahitaji kuingia tena. Kifaa chako cha sasa hakiathiriwi.';
  }

  @override
  String get adminDevicesDeletedAll => 'Vifaa vimeondolewa';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Baadhi ya vifaa vimeondolewa; $count havikuweza kuondolewa.';
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
    return 'Imeshindwa kuanza kuchanganua: $error';
  }

  @override
  String get adminRenameLibrary => 'Badilisha jina la Maktaba';

  @override
  String get adminNewName => 'Jina jipya';

  @override
  String adminLibraryRenamed(String name) {
    return 'Maktaba imepewa jina jipya \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Imeshindwa kubadilisha jina: $error';
  }

  @override
  String get adminDeleteLibrary => 'Futa Maktaba';

  @override
  String adminLibraryDeleted(String name) {
    return 'Maktaba \"$name\" imefutwa';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Imeshindwa kufuta maktaba: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Imeshindwa kuongeza njia: $error';
  }

  @override
  String get adminRemovePath => 'Ondoa Njia';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ondoa \"$path\" kutoka kwa maktaba hii?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Imeshindwa kuondoa njia: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Chaguo za maktaba zimehifadhiwa';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi chaguo: $error';
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
  String get adminLibraryTabPaths => 'Njia';

  @override
  String get adminLibraryTabOptions => 'Chaguo';

  @override
  String get adminLibraryTabDownloaders => 'Vipakuzi';

  @override
  String get adminLibMetadataSavers => 'Vihifadhi vya metadata';

  @override
  String get adminLibSubtitleDownloaders => 'Vipakuzi vya manukuu';

  @override
  String get adminLibLyricDownloaders => 'Vipakuzi vya maneno ya nyimbo';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Vipakuzi vya metadata: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Vichukuzi vya picha: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Seva hii haitoi vipakuzi vyovyote kwa aina hii ya maktaba.';

  @override
  String get adminLibrarySectionGeneral => 'Jumla';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Maelezo Yaliyopachikwa';

  @override
  String get adminLibrarySectionSubtitles => 'Manukuu';

  @override
  String get adminLibrarySectionImages => 'Picha';

  @override
  String get adminLibrarySectionSeries => 'Mifululizo';

  @override
  String get adminLibrarySectionMusic => 'Muziki';

  @override
  String get adminLibrarySectionMovies => 'Filamu';

  @override
  String get adminLibRealtimeMonitor => 'Washa ufuatiliaji wa wakati halisi';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Tambua mabadiliko ya faili na uyachakate kiotomatiki.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Chukulia kumbukumbu kama faili za maudhui';

  @override
  String get adminLibEnablePhotos => 'Onyesha picha';

  @override
  String get adminLibSaveLocalMetadata =>
      'Hifadhi sanaa katika folda za maudhui';

  @override
  String get adminLibRefreshInterval => 'Kuonyesha upya metadata kiotomatiki';

  @override
  String get adminLibRefreshNever => 'Kamwe';

  @override
  String get adminLibDefault => 'Chaguo-msingi';

  @override
  String get adminLibDisplayTitle => 'Onyesho';

  @override
  String get adminLibDisplaySection => 'Onyesho la maktaba';

  @override
  String get adminLibFolderView =>
      'Onyesha mwonekano wa folda ili kuonyesha folda za maudhui za kawaida';

  @override
  String get adminLibSpecialsInSeasons =>
      'Onyesha vipindi maalum ndani ya misimu vilivyorushwa';

  @override
  String get adminLibGroupMovies => 'Panga filamu katika makusanyo';

  @override
  String get adminLibGroupShows => 'Panga vipindi katika makusanyo';

  @override
  String get adminLibExternalSuggestions =>
      'Onyesha maudhui ya nje katika mapendekezo';

  @override
  String get adminLibDateAddedSection => 'Tabia ya tarehe ya kuongezwa';

  @override
  String get adminLibDateAddedLabel => 'Tumia tarehe ya kuongezwa kutoka';

  @override
  String get adminLibDateAddedImport =>
      'Tarehe iliyochanganuliwa kwenye maktaba';

  @override
  String get adminLibDateAddedFile => 'Tarehe faili lilipoundwa';

  @override
  String get adminLibMetadataTitle => 'Metadata na Picha';

  @override
  String get adminLibMetadataLangSection => 'Lugha inayopendelewa ya metadata';

  @override
  String get adminLibChaptersSection => 'Sura';

  @override
  String get adminLibDummyChapterDuration => 'Muda wa sura bandia (sekunde)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Urefu wa sura zinazotengenezwa kwa maudhui yasiyo na sura. Weka 0 ili kuzima.';

  @override
  String get adminLibChapterImageResolution => 'Mwonekano wa picha za sura';

  @override
  String get adminLibNfoTitle => 'Mipangilio ya NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadata ya NFO inaoana na Kodi na programu-mteja zinazofanana. Mipangilio hutumika kwa maktaba zote zinazohifadhi metadata ya NFO.';

  @override
  String get adminLibKodiUser =>
      'Mtumiaji wa kuhifadhia data ya utazamaji katika faili za NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Hifadhi njia za picha ndani ya faili za NFO';

  @override
  String get adminLibPathSubstitution =>
      'Washa ubadilishaji wa njia kwa njia za picha za NFO';

  @override
  String get adminLibExtraThumbs =>
      'Nakili picha za extrafanart kwenye folda ya extrathumbs';

  @override
  String get adminLibNone => 'Hakuna';

  @override
  String adminLibRefreshDays(int days) {
    return 'siku $days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Tumia vichwa vilivyopachikwa';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Tumia vichwa vilivyopachikwa kwa nyongeza';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Tumia maelezo ya kipindi yaliyopachikwa';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Ruhusu manukuu yaliyopachikwa';

  @override
  String get adminLibEmbeddedAllowAll => 'Ruhusu yote';

  @override
  String get adminLibEmbeddedAllowText => 'Maandishi pekee';

  @override
  String get adminLibEmbeddedAllowImage => 'Picha pekee';

  @override
  String get adminLibEmbeddedAllowNone => 'Hakuna';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ruka upakuaji ikiwa manukuu yaliyopachikwa yapo';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ruka upakuaji ikiwa mkondo wa sauti unalingana na lugha ya upakuaji';

  @override
  String get adminLibRequirePerfectMatch =>
      'Hitaji ulinganifu kamili wa manukuu';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Hifadhi manukuu katika folda za maudhui';

  @override
  String get adminLibChapterImageExtraction => 'Toa picha za sura';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Toa picha za sura wakati wa kuchanganua maktaba';

  @override
  String get adminLibTrickplayExtraction =>
      'Washa utoaji wa picha za Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Toa picha za Trickplay wakati wa kuchanganua maktaba';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Hifadhi picha za Trickplay katika folda za maudhui';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Unganisha kiotomatiki mifululizo iliyosambaa katika folda nyingi';

  @override
  String get adminLibSeasonZeroName => 'Jina la kuonyesha la msimu sifuri';

  @override
  String get adminLibLufsScan =>
      'Washa uchanganuzi wa LUFS kwa usawazishaji wa sauti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Pendelea lebo isiyo ya kawaida ya wasanii';

  @override
  String get adminLibAutoAddToCollection =>
      'Ongeza filamu kwenye makusanyo kiotomatiki';

  @override
  String get adminLibraryNameRequired => 'Jina la maktaba linahitajika';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Imeshindwa kuunda maktaba: $error';
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
    return 'Zima $name? Hataweza kuingia.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Washa $name? Ataweza kuingia tena.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Mtumiaji \"$name\" amezimwa';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Mtumiaji \"$name\" amewashwa';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Imeshindwa kusasisha sera ya mtumiaji: $error';
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
    return 'Imeshindwa kuunda mtumiaji: $error';
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
    return 'Imeshindwa kuhifadhi: $error';
  }

  @override
  String get adminPermissionsSaved => 'Ruhusa zimehifadhiwa';

  @override
  String get adminPasswordsMismatch => 'Manenosiri hayalingani';

  @override
  String adminFailed(String error) {
    return 'Imeshindwa: $error';
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
  String get adminParentalControl => 'Udhibiti wa Wazazi';

  @override
  String get adminMaxParentalRating =>
      'Ukadiriaji wa juu wa wazazi unaoruhusiwa';

  @override
  String get adminMaxParentalRatingHint =>
      'Maudhui yenye ukadiriaji wa juu zaidi yatafichwa kwa mtumiaji huyu.';

  @override
  String get adminParentalRatingNone => 'Hakuna';

  @override
  String get adminBlockUnratedItems =>
      'Zuia vipengee visivyo na maelezo ya ukadiriaji au visivyotambulika';

  @override
  String get adminUnratedBook => 'Vitabu';

  @override
  String get adminUnratedChannelContent => 'Chaneli';

  @override
  String get adminUnratedLiveTvChannel => 'TV ya moja kwa moja';

  @override
  String get adminUnratedMovie => 'Filamu';

  @override
  String get adminUnratedMusic => 'Muziki';

  @override
  String get adminUnratedTrailer => 'Trela';

  @override
  String get adminUnratedSeries => 'Vipindi';

  @override
  String get adminAccessSchedules => 'Ratiba za Ufikiaji';

  @override
  String get adminAccessSchedulesHint =>
      'Ruhusu ufikiaji wakati wa nyakati zilizoratibiwa hapa chini pekee. Ufikiaji unaruhusiwa siku nzima wakati hakuna ratiba iliyowekwa.';

  @override
  String get adminAddSchedule => 'Ongeza Ratiba';

  @override
  String get adminScheduleDay => 'Siku';

  @override
  String get adminScheduleStart => 'Mwanzo';

  @override
  String get adminScheduleEnd => 'Mwisho';

  @override
  String get adminDayEveryday => 'Kila siku';

  @override
  String get adminDayWeekday => 'Siku ya kazi';

  @override
  String get adminDayWeekend => 'Wikendi';

  @override
  String get adminDaySunday => 'Jumapili';

  @override
  String get adminDayMonday => 'Jumatatu';

  @override
  String get adminDayTuesday => 'Jumanne';

  @override
  String get adminDayWednesday => 'Jumatano';

  @override
  String get adminDayThursday => 'Alhamisi';

  @override
  String get adminDayFriday => 'Ijumaa';

  @override
  String get adminDaySaturday => 'Jumamosi';

  @override
  String get adminAllowedTags => 'Lebo zinazoruhusiwa';

  @override
  String get adminAllowedTagsHint =>
      'Maudhui yenye lebo hizi pekee ndiyo yanaonyeshwa. Acha wazi ili kuruhusu yote.';

  @override
  String get adminBlockedTags => 'Lebo zilizozuiwa';

  @override
  String get adminBlockedTagsHint =>
      'Maudhui yenye lebo hizi yamefichwa kwa mtumiaji huyu.';

  @override
  String get adminAddTag => 'Ongeza lebo';

  @override
  String get adminEnabledDevices => 'Vifaa vilivyowashwa';

  @override
  String get adminEnabledChannels => 'Chaneli zilizowashwa';

  @override
  String get adminAuthProvider => 'Mtoa huduma wa uthibitishaji';

  @override
  String get adminPasswordResetProvider =>
      'Mtoa huduma wa kuweka upya nenosiri';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Idadi ya juu ya majaribio ya kuingia yaliyoshindwa kabla ya kufungiwa';

  @override
  String get adminLoginAttemptsHint =>
      'Weka 0 kwa chaguo-msingi, au -1 ili kuzima kufungiwa.';

  @override
  String get adminSyncPlayAccess => 'Ufikiaji wa SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Ruhusu kuunda na kujiunga na vikundi';

  @override
  String get adminSyncPlayJoin => 'Ruhusu kujiunga na vikundi';

  @override
  String get adminSyncPlayNone => 'Hakuna ufikiaji';

  @override
  String get adminContentDeletionFolders => 'Ruhusu kufuta maudhui kutoka';

  @override
  String get adminResetPasswordWarning =>
      'Hii itaondoa nenosiri. Mtumiaji ataweza kuingia bila nenosiri.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Seva imerudisha HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Una uhakika unataka kufuta $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Mtumiaji \"$name\" amefutwa';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Imeshindwa kufuta mtumiaji: $error';
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
    return 'Imeshindwa kuunda ufunguo: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Tokeni muhimu haipo kwenye jibu la seva';

  @override
  String get adminRevokeApiKey => 'Batilisha Ufunguo wa API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Batilisha ufunguo wa $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kitufe cha API kimebatilishwa';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Imeshindwa kubatilisha ufunguo: $error';
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
    return 'Tokeni: $token\\nImeundwa: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Unda Nakala Rudufu';

  @override
  String get adminBackupInclude =>
      'Chagua cha kujumuisha katika nakala rudufu.';

  @override
  String get adminBackupDatabase => 'Hifadhidata';

  @override
  String get adminBackupDatabaseAlways => 'Hujumuishwa kila wakati';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Manukuu';

  @override
  String get adminBackupTrickplay => 'Picha za Trickplay';

  @override
  String get adminCreatingBackup => 'Inaunda nakala rudufu...';

  @override
  String get adminBackupCreated => 'Hifadhi rudufu imeundwa';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Imeshindwa kuunda nakala rudufu: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Njia mbadala haipo katika majibu ya seva';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesti: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Imeshindwa kupakia manifesti: $error';
  }

  @override
  String get adminConfirmRestore => 'Thibitisha Kurejesha';

  @override
  String get adminRestoringBackup => 'Inarejesha nakala rudufu...';

  @override
  String adminRestoreFailed(String error) {
    return 'Imeshindwa kurejesha nakala rudufu: $error';
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
    return 'Imehifadhiwa kwenye $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi faili: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Imeshindwa kupakia $fileName';
  }

  @override
  String get adminSearchInLog => 'Tafuta kwenye logi';

  @override
  String get adminNoMatchingLines => 'Hakuna mistari inayolingana';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Imeshindwa kupakia kazi: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Hakuna kazi zilizoratibiwa kupatikana';

  @override
  String get adminNoTasksMatchFilter =>
      'Hakuna kazi zinazolingana na kichujio cha sasa';

  @override
  String adminTaskStartFailed(String error) {
    return 'Imeshindwa kuanzisha kazi: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Imeshindwa kusimamisha kazi: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Imeshindwa kupakia kazi: $error';
  }

  @override
  String get adminRunNow => 'Endesha Sasa';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Imeshindwa kuondoa kichochezi: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Imeshindwa kuongeza kichochezi: $error';
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
    return 'saa $hours';
  }

  @override
  String get adminDayOfWeek => 'Siku ya wiki';

  @override
  String get adminSearchPlugins => 'Tafuta programu jalizi...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Imeshindwa kubadilisha programu-jalizi: $error';
  }

  @override
  String get adminUninstallPlugin => 'Sanidua programu-jalizi';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Imeshindwa kuondoa programu-jalizi: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Imeshindwa kusakinisha kifurushi: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Imeshindwa kusakinisha sasisho: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Imeshindwa kupakia programu-jalizi: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Hakuna programu-jalizi zinazolingana na utafutaji wako';

  @override
  String get adminNoPluginsInstalled =>
      'Hakuna programu-jalizi zilizosakinishwa';

  @override
  String adminInstallUpdate(String version) {
    return 'Sakinisha sasisho (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Imeshindwa kupakia katalogi: $error';
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
    return '\"$name\" itaondolewa baada ya seva kuanzishwa upya';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Imeshindwa kuondoa: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Inasasisha \"$name\" hadi v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Haiwezi kufungua mipangilio: tokeni ya uthibitishaji inakosa.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Imeshindwa kupakia programu-jalizi: $error';
  }

  @override
  String get adminPluginNotFound => 'Programu-jalizi haijapatikana';

  @override
  String adminPluginVersion(String version) {
    return 'Toleo $version';
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
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi hazina: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Imeshindwa kupakia hazina: $error';
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
    return 'Imeshindwa kupakia mipangilio ya programu-jalizi: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Imeshindwa kufungua $uri';
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
  String get adminTrickplaySaved => 'Mipangilio ya Trickplay imehifadhiwa';

  @override
  String get adminTrickplayLoadFailed =>
      'Imeshindwa kupakia mipangilio ya Trickplay';

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
    return 'Imeshindwa kupakia metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi metadata: $error';
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
    return 'Imeshindwa kuonyesha upya metadata: $error';
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
    return 'Utafutaji wa mbali umeshindwa: $error';
  }

  @override
  String get adminUpdateContentType => 'Sasisha Aina ya Maudhui';

  @override
  String get adminContentType => 'Aina ya maudhui';

  @override
  String get adminContentTypeUpdated => 'Aina ya maudhui imesasishwa';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Imeshindwa kusasisha aina ya maudhui: $error';
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
    return 'Picha ya $imageType imesasishwa';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Imeshindwa kupakua picha: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Umbizo la picha lisilotumika';

  @override
  String get adminImageReadFailed => 'Imeshindwa kusoma picha iliyochaguliwa';

  @override
  String adminImageUploaded(String imageType) {
    return 'Picha ya $imageType imepakiwa';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Futa picha ya $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Picha ya $imageType imefutwa';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String get adminAllProviders => 'Watoa huduma wote';

  @override
  String get adminNoRemoteImages => 'Hakuna picha za mbali zilizopatikana';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Ugunduzi wa Tuner umeshindwa: $error';
  }

  @override
  String get adminAddTuner => 'Ongeza Tuner';

  @override
  String get adminEditTuner => 'Hariri Tuner';

  @override
  String get adminTunerTypeM3u => 'Tuner ya M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Faili au URL';

  @override
  String get adminTunerIpAddress => 'Anwani ya IP ya Tuner';

  @override
  String get adminTunerFriendlyName => 'Jina rafiki';

  @override
  String get adminTunerUserAgent => 'Wakala wa mtumiaji';

  @override
  String get adminTunerCount => 'Kikomo cha miunganisho ya wakati mmoja';

  @override
  String get adminTunerCountHelp =>
      'Idadi ya juu ya mitiririko ambayo Tuner huruhusu kwa wakati mmoja. Weka 0 kwa isiyo na kikomo.';

  @override
  String get adminTunerFallbackBitrate =>
      'Kasi ya juu mbadala ya biti ya utiririshaji';

  @override
  String get adminTunerImportFavoritesOnly => 'Ingiza chaneli vipendwa pekee';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Ruhusu kubadilisha msimbo kwa maunzi';

  @override
  String get adminTunerAllowFmp4 =>
      'Ruhusu kontena la kubadilisha msimbo la fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Ruhusu kushiriki mtiririko';

  @override
  String get adminTunerEnableStreamLooping => 'Washa kurudia mtiririko';

  @override
  String get adminTunerIgnoreDts => 'Puuza DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Soma ingizo kwa kasi asili ya fremu';

  @override
  String get adminEditProvider => 'Hariri Mtoa Huduma';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Faili au URL';

  @override
  String get adminXmltvMoviePrefix => 'Kiambishi awali cha filamu';

  @override
  String get adminXmltvMovieCategories => 'Kategoria za filamu';

  @override
  String get adminXmltvCategoriesHelp =>
      'Tenganisha kategoria nyingi kwa mstari wima.';

  @override
  String get adminXmltvKidsCategories => 'Kategoria za watoto';

  @override
  String get adminXmltvNewsCategories => 'Kategoria za habari';

  @override
  String get adminXmltvSportsCategories => 'Kategoria za michezo';

  @override
  String get adminSdUsername => 'Jina la mtumiaji';

  @override
  String get adminSdPassword => 'Nenosiri';

  @override
  String get adminSdCountry => 'Nchi';

  @override
  String get adminSdCountrySelect => 'Chagua nchi';

  @override
  String get adminSdPostalCode => 'Msimbo wa posta';

  @override
  String get adminSdGetListings => 'Pata orodha';

  @override
  String get adminSdListings => 'Orodha';

  @override
  String get adminEnableAllTuners => 'Washa Tuner zote';

  @override
  String get adminTunerType => 'Aina ya Kitafuta njia';

  @override
  String get adminTunerAdded => 'Kitafuta sauti kimeongezwa';

  @override
  String adminTunerAddFailed(String error) {
    return 'Imeshindwa kuongeza Tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Ongeza Mtoa Mwongozo';

  @override
  String get adminProviderType => 'Aina ya Mtoa huduma';

  @override
  String get adminProviderAdded => 'Mtoa huduma ameongezwa';

  @override
  String adminProviderAddFailed(String error) {
    return 'Imeshindwa kuongeza mtoa huduma: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Imeshindwa kuondoa Tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Umeomba kuweka upya kitafuta njia';

  @override
  String adminTunerResetFailed(String error) {
    return 'Imeshindwa kuweka upya Tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Aina hii ya Tuner haitumii kuweka upya.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Imeshindwa kuondoa mtoa huduma: $error';
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
  String get adminMovieRecordingPath => 'Njia ya kurekodi filamu';

  @override
  String get adminGuideDays => 'Siku za data ya mwongozo';

  @override
  String get adminGuideDaysAuto => 'Kiotomatiki';

  @override
  String adminGuideDaysValue(int days) {
    return 'siku $days';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Njia ya programu ya uchakataji-baadaye';

  @override
  String get adminRecordingPostProcessorArgs => 'Hoja za kichakataji-baadaye';

  @override
  String get adminSaveRecordingNfo => 'Hifadhi metadata ya NFO ya rekodi';

  @override
  String get adminSaveRecordingImages => 'Hifadhi picha za rekodi';

  @override
  String get adminLiveTvSectionTiming => 'Muda';

  @override
  String get adminLiveTvSectionPaths => 'Njia za kurekodi';

  @override
  String get adminLiveTvSectionPostProcessing => 'Uchakataji-baadaye';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Data ya mwongozo: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'Mipangilio ya kurekodi imehifadhiwa';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi mipangilio: $error';
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
    return 'Imeshindwa kusasisha ulinganishaji: $error';
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
  String get adminRefreshGuideData => 'Onyesha Upya Data ya Mwongozo';

  @override
  String get adminGuideRefreshStarted =>
      'Kuonyesha upya data ya mwongozo kumeanza';

  @override
  String get adminGuideRefreshUnavailable =>
      'Kazi ya kuonyesha upya mwongozo haipatikani kwenye seva hii.';

  @override
  String get adminAddProvider => 'Ongeza Mtoa Huduma';

  @override
  String get adminNoListingProviders =>
      'Hakuna watoa huduma za uorodheshaji waliosanidiwa';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Njia ya kurekodi: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Njia ya mfululizo: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Muda wa ziada kabla: dk $minutes';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Muda wa ziada baada: dk $minutes';
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
    return 'Rejesha nakala rudufu $name sasa?';
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
  String get adminApply => 'Tumia';

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
    return 'dk $minutes zilizopita';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'saa $hours zilizopita';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'siku $days zilizopita';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Imeshindwa kupakia $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'matokeo $count';
  }

  @override
  String get adminLogViewerNoMatches => 'Hakuna mistari inayolingana';

  @override
  String get adminMetadataEditorTitle => 'Mhariri wa Metadata';

  @override
  String get adminMetadataIdentify => 'Tambua';

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
  String get adminMetadataStudios => 'Studio';

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
    return 'Picha ya $imageType imesasishwa';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Picha ya $imageType imepakiwa';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Picha ya $imageType imefutwa';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Imeshindwa kupakua picha: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Imeshindwa kusoma picha iliyochaguliwa';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Futa picha ya $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Hii huondoa picha ya sasa kutoka kwa kipengee.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Chagua picha ya $imageType';
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
    return 'Sasisho linapatikana: v$version';
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
    return 'Sakinisha sasisho (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Hakuna vifurushi vinavyolingana na utafutaji wako';

  @override
  String get adminPluginsCatalogEmpty => 'Hakuna vifurushi vinavyopatikana';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" inasakinishwa...';
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
    return 'Mipangilio ya $name';
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
    return 'Imeshindwa kupakia hazina: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ondoa Hifadhi';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Ondoa';

  @override
  String adminReposSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi hazina: $error';
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
  String get adminBrandingSplashUpload => 'Pakia picha';

  @override
  String get adminBrandingSplashUploaded => 'Skrini ya utangulizi imesasishwa';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Imeshindwa kupakia skrini ya utangulizi';

  @override
  String get adminBrandingSplashDeleted => 'Skrini ya utangulizi imeondolewa';

  @override
  String get adminBrandingNoSplash => 'Hakuna skrini maalum ya utangulizi';

  @override
  String get adminPlaybackHwAccel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackHwAccelLabel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackEnableHwEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminPlaybackEnableHwDecoding => 'Washa usimbaji maunzi kwa:';

  @override
  String get adminPlaybackQsvDevice => 'Kifaa cha QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Washa kisimbuzi cha NVDEC kilichoboreshwa';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Pendelea kisimbuzi asili cha maunzi cha mfumo';

  @override
  String get adminPlaybackColorDepth =>
      'Kina cha rangi cha usimbuaji wa maunzi';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Usimbuaji wa HEVC wa biti 10';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Usimbuaji wa VP9 wa biti 10';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Usimbuaji wa HEVC RExt wa biti 8/10';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Usimbuaji wa HEVC RExt wa biti 12';

  @override
  String get adminPlaybackHwEncodingSection => 'Usimbaji wa maunzi';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Ruhusu usimbaji wa HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Ruhusu usimbaji wa AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Washa kisimbaji cha Intel cha nguvu ndogo cha H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Washa kisimbaji cha Intel cha nguvu ndogo cha HEVC';

  @override
  String get adminPlaybackToneMapping => 'Uchoraji wa Toni';

  @override
  String get adminPlaybackEnableTonemapping => 'Washa uchoraji wa toni';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Washa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Washa uchoraji wa toni wa VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoriti ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingMode => 'Modi ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingRange => 'Masafa ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Upunguzaji wa ukolezi wa uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingPeak => 'Kilele cha uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingParam => 'Kigezo cha uchoraji wa toni';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Mwangaza wa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Utofautishaji wa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackPresetsQuality =>
      'Mipangilio Iliyowekwa Awali na Ubora';

  @override
  String get adminPlaybackEncoderPreset => 'Mpangilio wa awali wa kisimbaji';

  @override
  String get adminPlaybackH264Crf => 'CRF ya usimbaji wa H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF ya usimbaji wa H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Mbinu ya kuondoa mwingiliano';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Maradufu kasi ya fremu wakati wa kuondoa mwingiliano';

  @override
  String get adminPlaybackAudioSection => 'Sauti';

  @override
  String get adminPlaybackEnableAudioVbr => 'Washa usimbaji wa VBR wa sauti';

  @override
  String get adminPlaybackDownmixBoost =>
      'Nyongeza ya upunguzaji wa chaneli za sauti';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Algoriti ya upunguzaji hadi stereo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Ukubwa wa juu wa foleni ya muxing';

  @override
  String get adminPlaybackAutoOption => 'Otomatiki';

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
  String get adminTaskStop => 'Simamisha';

  @override
  String get adminRunningTasks => 'Kazi Zinazoendelea';

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
    return 'Kila siku saa $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Kila $day saa $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Kila $duration';
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
      other: 'saa $count',
      one: 'saa 1',
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
    return 'siku $days zilizopita';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'saa $hours zilizopita';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'dk $minutes zilizopita';
  }

  @override
  String get adminActivityNow => 'sasa';

  @override
  String adminActivityMinutesShort(int minutes) {
    return 'dk $minutes';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return 'saa $hours';
  }

  @override
  String adminActivityDaysShort(int days) {
    return 'siku $days';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Sanidi utengenezaji wa picha za Trickplay kwa vijipicha vya onyesho la kutafuta.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Mlango wa HTTPS wa umma';

  @override
  String get adminNetworkingBaseUrl => 'URL ya msingi';

  @override
  String get adminNetworkingBaseUrlHint => 'k.m. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Mlango wa umma wa HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Hitaji HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Elekeza maombi yote ya mbali kwa HTTPS. Haina athari ikiwa seva haina cheti halali.';

  @override
  String get adminNetworkingCertPassword => 'Nenosiri la cheti';

  @override
  String get adminNetworkingIpSettings => 'Mipangilio ya IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Washa IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Washa IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Washa uchoraji wa milango wa kiotomatiki';

  @override
  String get adminNetworkingLocalSubnets => 'Mitandao ya LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Orodha ya anwani za IP au subneti za CIDR zilizotenganishwa kwa koma au mstari, zinazochukuliwa kuwa kwenye mtandao wa ndani.';

  @override
  String get adminNetworkingPublishedUris => 'URI za seva zilizochapishwa';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Unganisha subneti au anwani na URL iliyochapishwa, k.m. all=https://example.com';

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
  String get adminPlaybackThrottleDelay =>
      'Ucheleweshaji wa kupunguza kasi (sekunde)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Ruhusu utoaji wa manukuu papo hapo';

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
    return 'Imeshindwa kusasisha aina ya maudhui: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Kiwango cha chini cha majibu (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Washa maonyo ya majibu ya polepole';

  @override
  String get adminGeneralQuickConnect => 'Washa Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Seva';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Njia';

  @override
  String get adminGeneralSectionPerformance => 'Utendaji';

  @override
  String get adminGeneralCachePath => 'Njia ya akiba';

  @override
  String get adminGeneralMetadataPath => 'Njia ya metadata';

  @override
  String get adminGeneralServerName => 'Jina la seva';

  @override
  String get adminGeneralDisplayLanguage => 'Lugha inayopendelewa ya kuonyesha';

  @override
  String get adminSettingsLoadFailed => 'Imeshindwa kupakia mipangilio';

  @override
  String get adminDiscover => 'Gundua';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Imeshindwa kusasisha ulinganishaji: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Kikomo cha muda: $duration';
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
      other: 'washiriki #',
      one: 'mshiriki #',
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
    return 'Kipengee $index';
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
    return '$userName amejiunga na kikundi cha SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ameondoka kwenye kikundi cha SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Ufikiaji wa SyncPlay umekataliwa';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Huna ufikiaji wa kipengee kimoja au zaidi katika kikundi hiki cha SyncPlay. Uliza mmiliki wa kikundi athibitishe ruhusa za maktaba au achague foleni tofauti.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Inasawazisha uchezaji na $groupName';
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
      other: 'safu # zimegunduliwa',
      one: 'safu # imegunduliwa',
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
  String get offlineBannerTitle => 'Uko nje ya mtandao';

  @override
  String get offlineBannerSubtitle => 'Inaonyesha vipakuliwa vyako';

  @override
  String get offlineBannerAction => 'Vipakuliwa';

  @override
  String get serverUnreachableBannerTitle => 'Haiwezi kufikia seva yako';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Inacheza kutoka kwa vipakuliwa hadi itakaporejea';

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
    return 'Udhibiti wa utumaji umeshindwa: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Vidhibiti vya $kind';
  }

  @override
  String get castDeviceVolume => 'Kiasi cha Kifaa';

  @override
  String get castVolumeUnavailable => 'Haipatikani';

  @override
  String castStopKind(String kind) {
    return 'Simamisha $kind';
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
    return 'Weka PIN ya tarakimu $length';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Weka PIN yako ya tarakimu $length';
  }

  @override
  String get pinIncorrect => 'PIN si sahihi';

  @override
  String get pinMismatch => 'PIN hazilingani';

  @override
  String get pinForgot => 'Je, umesahau PIN?';

  @override
  String get pinClear => 'Futa';

  @override
  String get pinBackspace => 'Futa nyuma';

  @override
  String get quickConnectAuthorized => 'Ombi la Quick Connect limeidhinishwa.';

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
    return 'Quick Connect imeshindwa: $message';
  }

  @override
  String get quickConnectEnterCode => 'Weka msimbo';

  @override
  String get quickConnectAuthorize => 'Kuidhinisha';

  @override
  String remoteCommandFailed(String error) {
    return 'Amri imeshindwa: $error';
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
    return 'Imeshindwa kuanza kutuma: $error';
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
    return 'Inapakua $name...';
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
  String get stillWatchingStop => 'Simamisha';

  @override
  String get stillWatchingContinue => 'Endelea';

  @override
  String skipSegment(String segment) {
    return 'Ruka $segment';
  }

  @override
  String get liveTv => 'TV ya moja kwa moja';

  @override
  String get continueWatchingAndNextUp => 'Endelea Kutazama & Inayofuata';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Inapakua $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Inapakua $fileName';
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
  String get playerTooltipPlaybackQuality => 'Kasi ya biti';

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
      'Ficha kutoka Endelea Kutazama';

  @override
  String get contextMenuHideFromNextUp => 'Ficha kutoka Inayofuata';

  @override
  String get contextMenuAddToCollection => 'Ongeza kwenye Mkusanyo';

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
  String get settingsConnectionSection => 'MUUNGANISHO';

  @override
  String get settingsAllowSelfSignedCerts => 'Ruhusu vyeti vilivyojitia saini';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Amini seva zinazotumia vyeti vya TLS vilivyojitia saini au vya CA binafsi. Washa kwa seva unazodhibiti pekee. Hii huzima uthibitishaji wa vyeti kwa miunganisho yote.';

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
  String get settingsDetailsScreen => 'Skrini ya Maelezo';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Mtindo, ukungu wa mandharinyuma, na tabia ya vichupo';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Onyesha kitufe cha Seerr kwenye upau wa urambazaji';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Onyesha lebo za maandishi kwenye upau wa juu wa urambazaji kila wakati';

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
  String get settingsSupportMoonfinSubtitle => 'Mchangie msanidi kahawa';

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
      other: 'ilani # za leseni',
      one: 'ilani # ya leseni',
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
  String get settingsMediaSegmentCountdown =>
      'Hesabu ya Kurudi Nyuma ya Sehemu ya Maudhui';

  @override
  String get settingsProgressBar => 'Upau wa Maendeleo';

  @override
  String get settingsTimer => 'Kipima Muda';

  @override
  String get settingsNone => 'Hakuna';

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
  String get settingsPlaybackEngineAndroidTv =>
      'Injini ya Uchezaji (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Chagua injini chaguo-msingi ya kucheza kwenye vifaa vya Android TV. Mabadiliko yatatumika kwa kipindi kijacho cha kucheza tena.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (inapendekezwa)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (ya zamani)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (urithi)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (inapendekezwa)';

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
    return 'Zilizotolewa Hivi Karibuni katika $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Cheza Kipindi Kinachofuata Kiotomatiki';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Cheza kipindi kinachofuata kiotomatiki kinapopatikana.';

  @override
  String get skipSilenceTitle => 'Ruka ukimya';

  @override
  String get skipSilenceSubtitle =>
      'Ruka kiotomatiki sehemu za sauti zenye ukimya inapotumika na mtiririko.';

  @override
  String get allowExternalAudioEffectsTitle => 'Ruhusu athari za sauti za nje';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Ruhusu programu za kisawazishi na athari (k.m. Wavelet) zijiunganishe na vipindi vya uchezaji vya Media3.';

  @override
  String get disableTunnelingTitle => 'Zima tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Lazimisha uchezaji usio wa tunneling. Ni muhimu kwenye vifaa vyenye mikatizo ya sauti/video ya tunneling.';

  @override
  String get enableTunnelingTitle => 'Washa tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Ya kina. Huelekeza sauti na video kupitia njia ya maunzi iliyounganishwa. Imezimwa kwa chaguo-msingi kwa sababu husababisha mikatizo ya sauti/video kwenye baadhi ya vifaa.';

  @override
  String get mapDolbyVisionP7Title => 'Unganisha Dolby Vision wasifu 7 na HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Cheza mitiririko ya Dolby Vision wasifu 7 kama HEVC inayooana na HDR10 kwenye vifaa visivyo vya DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Tumia mitindo ya manukuu iliyopachikwa';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Tumia rangi, fonti, na uwekaji vilivyopachikwa katika mkondo wa manukuu. Zima ili kutumia mapendeleo yako ya mtindo wa manukuu badala yake.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Tumia saizi za fonti za manukuu zilizopachikwa';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Tumia vidokezo vya saizi ya fonti vilivyopachikwa katika mkondo wa manukuu. Zima ili kutumia saizi ya manukuu kutoka kwa mapendeleo yako ya mtindo.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Onyesha Maelezo ya Maudhui';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Onyesha maelezo ya kipengee kilichochaguliwa juu ya kurasa za Maktaba.';

  @override
  String get hideBackdropsInLibraries => 'Ficha Mandharinyuma Unapovinjari?';

  @override
  String get useDetailedSubHeadings => 'Tumia Vichwa Vidogo vya Kina';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Onyesha safu ndogo ya kina au ya kawaida kwenye kurasa za Maktaba.';

  @override
  String get savedThemesDeleteDialogTitle => 'Futa mandhari iliyohifadhiwa?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ondoa \"$themeName\" kutoka kwa akiba ya kifaa hiki?';
  }

  @override
  String get themeStore => 'Duka la Mandhari';

  @override
  String get themeStoreSubtitle => 'Vinjari na uhifadhi mandhari za jamii';

  @override
  String get themeStoreDescription =>
      'Hifadhi mandhari ili kuitumia kama mandhari zako nyingine zilizohifadhiwa.';

  @override
  String get themeStoreEmpty => 'Hakuna mandhari zinazopatikana kwa sasa.';

  @override
  String get themeStoreLoadFailed =>
      'Imeshindwa kupakia Duka la Mandhari. Angalia muunganisho wako na ujaribu tena.';

  @override
  String get themeStoreSave => 'Hifadhi';

  @override
  String get themeStoreSaveAndApply => 'Hifadhi na utumie';

  @override
  String get themeStoreSaved => 'Imehifadhiwa';

  @override
  String get themeStoreInvalidMessage => 'Mandhari hii haikuweza kupakiwa.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" imehifadhiwa.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" imefutwa kutoka kwa kifaa hiki.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Imeshindwa kufuta \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Mandhari zilizohifadhiwa';

  @override
  String get savedThemesDescription =>
      'Hizi ni mandhari zilizopakuliwa kutoka kwa programu-jalizi ya Moonfin kwa seva ya sasa. Kufuta huondoa nakala hii ya ndani pekee.';

  @override
  String get savedThemesEmpty =>
      'Hakuna mandhari zilizohifadhiwa zilizopatikana kwa seva hii.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Inatumika sasa';
  }

  @override
  String get savedThemesDeleteTooltip => 'Futa mandhari iliyohifadhiwa';

  @override
  String get savedThemesManageSubtitle =>
      'Dhibiti mandhari za programu-jalizi zilizopakuliwa kwenye kifaa hiki';

  @override
  String get themeEditor => 'Kihariri cha Mandhari';

  @override
  String get themeEditorSubtitle =>
      'Fungua Kihariri cha Mandhari cha Moonfin kwenye kivinjari chako';

  @override
  String get homeScreen => 'Skrini ya Nyumbani';

  @override
  String get bottomBar => 'Upau wa Chini';

  @override
  String get homeRowsStyleClassic => 'Klasiki';

  @override
  String get homeRowsStyleModern => 'Kisasa';

  @override
  String get homeRowsSection => 'Safu za Nyumbani';

  @override
  String get homeRowDisplay => 'Onyesho la Safu za Nyumbani';

  @override
  String get homeRowSections => 'Sehemu za Safu za Nyumbani';

  @override
  String get homeRowToggles => 'Vibadilishi vya Safu za Nyumbani';

  @override
  String get homeRowTogglesSubtitle =>
      'Washa au zima kategoria za safu za nyumbani zinazotegemea maktaba';

  @override
  String get homeRowTogglesDescription =>
      'Washa vibadilishi vifuatavyo ili kuonyesha safu katika Sehemu za Nyumbani.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasiki huhifadhi aina ya picha ya kila safu na kifuniko cha maelezo. Kisasa hutumia safu za wima hadi mandharinyuma.';

  @override
  String get displayFavoritesRows => 'Onyesha Safu za Vipendwa';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Onyesha Filamu Vipendwa, Mifululizo, na safu nyingine za vipendwa katika Sehemu za Nyumbani.';

  @override
  String get favoritesRowSorting => 'Upangaji wa Safu za Vipendwa';

  @override
  String get favoritesRowSortingDescription =>
      'Panga safu za Vipendwa kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get displayCollectionsRows => 'Onyesha Safu za Makusanyo';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Onyesha safu za Makusanyo katika Sehemu za Nyumbani.';

  @override
  String get collectionsRowSorting => 'Upangaji wa Safu za Makusanyo';

  @override
  String get collectionsRowSortingDescription =>
      'Panga safu za Makusanyo kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get displayGenresRows => 'Onyesha Safu za Aina';

  @override
  String get displayGenresRowsSubtitle =>
      'Onyesha safu za Aina katika Sehemu za Nyumbani.';

  @override
  String get genresRowSorting => 'Upangaji wa Safu za Aina';

  @override
  String get genresRowSortingDescription =>
      'Panga safu za Aina kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get genresRowItems => 'Vipengee vya Safu za Aina';

  @override
  String get genresRowItemsDescription =>
      'Onyesha Filamu, Mifululizo, au vyote viwili katika safu za Aina.';

  @override
  String get displayPlaylistsRows => 'Onyesha Safu za Orodha za Kucheza';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Onyesha safu za Orodha za Kucheza katika Sehemu za Nyumbani.';

  @override
  String get playlistsRowSorting => 'Upangaji wa Safu za Orodha za Kucheza';

  @override
  String get playlistsRowSortingDescription =>
      'Panga safu za Orodha za Kucheza kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get displayAudioRows => 'Onyesha Safu za Sauti';

  @override
  String get displayAudioRowsSubtitle =>
      'Onyesha safu za Sauti katika Sehemu za Nyumbani.';

  @override
  String get audioRowsSorting => 'Upangaji wa Safu za Sauti';

  @override
  String get audioRowsSortingDescription =>
      'Panga safu za Sauti kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get audioPlaylists => 'Orodha za Kucheza za Sauti';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get layout => 'Mpangilio';

  @override
  String get theme => 'Mandhari';

  @override
  String get keyboard => 'Kibodi';

  @override
  String get navButtons => 'Vitufe';

  @override
  String get rendering => 'Uonyeshaji';

  @override
  String get mpvConfiguration => 'Usanidi wa MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Programu ya kicheza cha nje';

  @override
  String get externalPlayerAppDescription =>
      'Weka kicheza cha nje ili kuwezesha chaguo la kucheza kwa kubonyeza kwa muda mrefu';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Onyesha kichagua programu uchezaji unapoanza.';

  @override
  String get loadingInstalledPlayers => 'Inapakia vicheza vilivyosakinishwa...';

  @override
  String get connection => 'Muunganisho';

  @override
  String get audioTranscodeTarget => 'Lengo la Kubadilisha Msimbo wa Sauti';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Inatumika kwenye kifaa hiki';

  @override
  String get notSupportedOnThisDevice => 'Haitumiki kwenye kifaa hiki';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Tuma mtiririko wa biti wa DTS:X (DTS UHD) kwa kisimbuzi cha nje.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD yenye Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Tabia ya Kicheza Maudhui';

  @override
  String get playbackEnhancements => 'Maboresho ya Uchezaji';

  @override
  String get alwaysOn => 'Imewashwa kila wakati.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Badilisha Ruka Hitimisho na Onyesho la Inayofuata';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Onyesha kifuniko cha Inayofuata badala ya kitufe cha Ruka Hitimisho.';

  @override
  String get playerRouting => 'Uelekezaji wa Kicheza';

  @override
  String get preferSoftwareDecoders => 'Pendelea visimbuzi vya programu';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Tumia FFmpeg (sauti) na libgav1 (AV1) kabla ya visimbuzi vya maunzi. Zima ikiwa passthrough ya sauti ya HDMI inaharibika.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Fungua uchezaji wa video katika programu ya nje uliyochagua kwenye Android TV.';

  @override
  String get automaticQueuing => 'Upangaji Foleni wa Kiotomatiki';

  @override
  String get preferSdhSubtitles => 'Pendelea manukuu ya SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Tanguliza mikondo ya manukuu ya SDH/CC wakati wa kuchagua kiotomatiki.';

  @override
  String get webDiagnostics => 'Uchunguzi wa wavuti';

  @override
  String get webDiagnosticsTitle => 'Uchunguzi wa Wavuti wa Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Tumia ukurasa huu kuchunguza matatizo ya muunganisho wa kivinjari (CORS, maudhui mchanganyiko, na mipangilio ya ugunduzi).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Hitilafu ya Maudhui Mchanganyiko Imetambuliwa';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Hitilafu ya CORS/Preflight Imetambuliwa';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin imetambua ukurasa wa HTTPS unaojaribu kupiga simu kwa URL ya seva ya HTTP. Vivinjari huzuia ombi hili kabla halijafika kwenye seva yako.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin imetambua hitilafu ya ombi katika kiwango cha kivinjari ambayo mara nyingi husababishwa na vichwa vya CORS au preflight vinavyokosekana kwenye seva ya maudhui.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL lengwa: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Maelezo: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Muktadha wa Sasa wa Utekelezaji';

  @override
  String get webDiagnosticsOrigin => 'Asili';

  @override
  String get webDiagnosticsScheme => 'Skimu';

  @override
  String get webDiagnosticsPluginMode => 'Modi ya Programu-jalizi';

  @override
  String get webDiagnosticsWebRtcScan => 'Uchanganuzi wa WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL ya Seva Iliyolazimishwa';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Chaguo-msingi ya Seva';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL ya Proksi ya Ugunduzi';

  @override
  String get notConfigured => 'haijasanidiwa';

  @override
  String get webDiagnosticsMixedContent => 'Maudhui Mchanganyiko';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ukurasa huu umepakiwa kupitia HTTPS, lakini URL moja au zaidi zilizosanidiwa ni za HTTP. Vivinjari huzuia kurasa za HTTPS kupiga simu kwa API za HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Suluhisho: toa seva yako ya maudhui au ncha ya proksi kupitia HTTPS, au pakia Moonfin kupitia HTTP kwenye mitandao ya ndani inayoaminika pekee.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Hakuna usanidi dhahiri wa maudhui mchanganyiko uliotambuliwa kutoka kwa mipangilio ya sasa ya utekelezaji.';

  @override
  String get webDiagnosticsCorsChecklist => 'Orodha ya Kukagua ya CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Ruhusu asili ya kivinjari katika Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Jumuisha Authorization, X-Emby-Authorization, na X-Emby-Token katika Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Fichua Content-Range na Accept-Ranges kwa utiririshaji na tabia ya kutafuta.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Rudisha 204 kwa maombi ya preflight ya OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Mfano wa Kijisehemu cha Kichwa (mtindo wa nginx)';

  @override
  String get note => 'Kumbuka';

  @override
  String get webDiagnosticsNonWebNote =>
      'Njia hii ya uchunguzi imekusudiwa kwa ujenzi wa wavuti. Ikiwa unaiona kwenye jukwaa lingine, ukaguzi huu huenda usitumike.';

  @override
  String get backToServerSelect => 'Rudi kwa Uteuzi wa Seva';

  @override
  String get signOutAllUsers => 'Toa Watumiaji Wote';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Ruhusa ya maikrofoni imekataliwa kabisa. Iwashe katika mipangilio ya mfumo.';

  @override
  String get voiceSearchPermissionRequired =>
      'Ruhusa ya maikrofoni inahitajika kwa utafutaji wa sauti.';

  @override
  String get voiceSearchNoMatch => 'Sikuelewa. Jaribu tena.';

  @override
  String get voiceSearchNoSpeechDetected => 'Hakuna usemi uliotambuliwa.';

  @override
  String get voiceSearchMicrophoneError => 'Hitilafu ya maikrofoni.';

  @override
  String get voiceSearchNeedsInternet =>
      'Utafutaji wa sauti unahitaji intaneti.';

  @override
  String get voiceSearchServiceBusy =>
      'Huduma ya sauti ina shughuli nyingi. Jaribu tena.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Ruhusa ya maikrofoni imekataliwa kabisa.';

  @override
  String get microphonePermissionDenied => 'Ruhusa ya maikrofoni imekataliwa.';

  @override
  String get speechRecognitionUnavailable =>
      'Utambuzi wa usemi haupatikani kwenye kifaa hiki.';

  @override
  String get openIosRoutePicker => 'Fungua kichagua njia cha iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Kichagua njia cha AirPlay hakipatikani kwenye kifaa hiki.';

  @override
  String get videos => 'Video';

  @override
  String get programs => 'Vipindi';

  @override
  String get songs => 'Nyimbo';

  @override
  String get photoAlbums => 'Albamu za Picha';

  @override
  String get photos => 'Picha';

  @override
  String get people => 'Watu';

  @override
  String get recentlyReleasedEpisodes => 'Vipindi Vilivyotolewa Hivi Karibuni';

  @override
  String get watchAgain => 'Tazama Tena';

  @override
  String get guestAppearances => 'Kujitokeza kwa Wageni';

  @override
  String get appearancesSeerr => 'Kujitokeza (Seerr)';

  @override
  String get crewContributionsSeerr => 'Michango ya Wafanyakazi (Seerr)';

  @override
  String get watchWithGroup => 'Tazama na kikundi';

  @override
  String get errors => 'Hitilafu';

  @override
  String get warnings => 'Maonyo';

  @override
  String get disk => 'Diski';

  @override
  String get openInBrowser => 'Fungua kwenye Kivinjari';

  @override
  String get embeddedBrowserNotAvailable =>
      'Kivinjari kilichopachikwa hakipatikani kwenye jukwaa hili.';

  @override
  String get adminRestartServerConfirmation =>
      'Una uhakika unataka kuanzisha upya seva?';

  @override
  String get adminShutdownServerConfirmation =>
      'Una uhakika unataka kuzima seva? Utahitaji kuianzisha upya mwenyewe.';

  @override
  String get internal => 'Ya ndani';

  @override
  String get idle => 'Haifanyi kazi';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Hakuna watumiaji waliopatikana';

  @override
  String get adminNoUsersMatchSearch =>
      'Hakuna watumiaji wanaolingana na utafutaji wako';

  @override
  String get adminNoDevicesFound => 'Hakuna vifaa vilivyopatikana';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Hakuna vifaa vinavyolingana na vichujio vya sasa';

  @override
  String get passwordSet => 'Nenosiri limewekwa';

  @override
  String get noPasswordConfigured => 'Hakuna nenosiri lililosanidiwa';

  @override
  String get remoteAccess => 'Ufikiaji wa Mbali';

  @override
  String get localOnly => 'Ya Ndani Pekee';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Imeshindwa kupakia takwimu za maudhui';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Takwimu zilizounganishwa katika maktaba zote za maudhui.';

  @override
  String get analyticsTopArtists => 'Wasanii Bora';

  @override
  String get analyticsTopAuthors => 'Waandishi Bora';

  @override
  String get analyticsTopContributors => 'Wachangiaji Bora';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Maktaba $count',
      one: 'Maktaba 1',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Hakuna jumla za maudhui yaliyoorodheshwa zinazopatikana kwa uteuzi huu bado.';

  @override
  String get analyticsLibraryDetails => 'Maelezo ya Maktaba';

  @override
  String get analyticsLibraryBreakdown => 'Mchanganuo wa Maktaba';

  @override
  String get analyticsNoLibrariesAvailable => 'Hakuna maktaba zinazopatikana.';

  @override
  String get adminServerAdministrationTitle => 'Usimamizi wa Seva';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Akiba ya Picha';

  @override
  String get adminServerPathCache => 'Akiba';

  @override
  String get adminServerPathLogs => 'Kumbukumbu';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Kubadilisha Msimbo';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Hakuna njia za seva zilizorudishwa na seva hii.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% imetumika';
  }

  @override
  String get userActivity => 'Shughuli za Mtumiaji';

  @override
  String get systemEvents => 'Matukio ya Mfumo';

  @override
  String get needsAttention => 'Inahitaji Uangalizi';

  @override
  String get adminDrawerSectionServer => 'Seva';

  @override
  String get adminDrawerSectionPlayback => 'Uchezaji';

  @override
  String get adminDrawerSectionDevices => 'Vifaa';

  @override
  String get adminDrawerSectionAdvanced => 'Ya Kina';

  @override
  String get adminDrawerSectionPlugins => 'Programu-jalizi';

  @override
  String get adminDrawerSectionLiveTv => 'TV ya moja kwa moja';

  @override
  String get homeVideos => 'Video za Nyumbani';

  @override
  String get mixedContent => 'Maudhui Mchanganyiko';

  @override
  String get homeVideosAndPhotos => 'Video na Picha za Nyumbani';

  @override
  String get mixedMoviesAndShows => 'Filamu na Vipindi Mchanganyiko';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Hakuna rekodi zilizopatikana';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Hakuna kurasa za picha zilizopatikana ndani ya kumbukumbu ya .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Kionyeshi kilichopachikwa kimeshindwa ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Kionyeshi cha EPUB kimeshindwa ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Faili la ndani la kisomaji halipo: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status wakati wa kufungua data ya kitabu kutoka $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Hakuna ncha ya kitabu inayoweza kusomwa inayopatikana';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Muundo wa kumbukumbu ya katuni hauhimiliwi: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Programu-jalizi ya kutoa CBR haipatikani kwenye jukwaa hili.';

  @override
  String get failedToExtractCbrArchive =>
      'Imeshindwa kutoa kumbukumbu ya .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Utoaji wa CB7 haupatikani kwenye jukwaa hili.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Programu-jalizi ya kutoa CB7 haipatikani kwenye jukwaa hili.';

  @override
  String get closeGenrePanel => 'Funga paneli ya aina';

  @override
  String get loadingShuffle => 'Inapakia mchanganyiko...';

  @override
  String get libraryShuffleLabel => 'MCHANGANYIKO WA MAKTABA';

  @override
  String get randomShuffleLabel => 'MCHANGANYIKO NASIBU';

  @override
  String get genresShuffleLabel => 'MCHANGANYIKO WA AINA';

  @override
  String get autoHdrSwitching => 'Kubadilisha HDR Kiotomatiki';

  @override
  String get autoHdrSwitchingDescription =>
      'Washa HDR kiotomatiki kwa uchezaji wa video ya HDR na urejeshe modi ya onyesho unapotoka.';

  @override
  String get whenFullscreen => 'Wakati wa skrini nzima';

  @override
  String get changeArtwork => 'Badilisha Sanaa';

  @override
  String get missing => 'Haipo';

  @override
  String get transcodingLimits => 'Vikomo vya Kubadilisha Msimbo';

  @override
  String get clearAllArtworkButton => 'Futa sanaa yote?';

  @override
  String get clearAllArtworkWarning =>
      'Una uhakika unataka kufuta sanaa yote iliyopakuliwa?';

  @override
  String get confirmClear => 'Thibitisha Kufuta';

  @override
  String confirmClearMessage(String itemType) {
    return 'Una uhakika ungependa kufuta $itemType?';
  }

  @override
  String get uploadButton => 'Pakia?';

  @override
  String get resolutionLabel => 'Mwonekano: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Onyesha sanaa katika lugha ya kiolesura pekee';

  @override
  String get confirmClearAll => 'Thibitisha Kufuta Yote';

  @override
  String get imageUploadSuccess => 'Picha imepakiwa kwa mafanikio!';

  @override
  String imageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Imeshindwa kuweka picha: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Imeshindwa kufuta sanaa yote: $error';
  }

  @override
  String get yes => 'Ndiyo';

  @override
  String get posterCategory => 'Bango';

  @override
  String get backdropsCategory => 'Mandharinyuma';

  @override
  String get bannerCategory => 'Utepe';

  @override
  String get logoCategory => 'Nembo';

  @override
  String get thumbnailCategory => 'Kijipicha';

  @override
  String get artCategory => 'Sanaa';

  @override
  String get discArtCategory => 'Sanaa ya Diski';

  @override
  String get screenshotCategory => 'Picha ya Skrini';

  @override
  String get boxCoverCategory => 'Jalada la Kisanduku';

  @override
  String get boxRearCoverCategory => 'Jalada la Nyuma la Kisanduku';

  @override
  String get menuArtCategory => 'Sanaa ya Menyu';

  @override
  String get confirmItemPoster => 'bango';

  @override
  String get confirmItemBackdrop => 'mandharinyuma';

  @override
  String get confirmItemBanner => 'utepe';

  @override
  String get confirmItemLogo => 'nembo';

  @override
  String get confirmItemThumbnail => 'kijipicha';

  @override
  String get confirmItemArt => 'sanaa';

  @override
  String get confirmItemDiscArt => 'sanaa ya diski';

  @override
  String get confirmItemScreenshot => 'picha ya skrini';

  @override
  String get confirmItemBoxCover => 'jalada la kisanduku';

  @override
  String get confirmItemBoxRearCover => 'jalada la nyuma la kisanduku';

  @override
  String get confirmItemMenuArt => 'sanaa ya menyu';

  @override
  String get resolutionAll => 'Zote';

  @override
  String get resolutionHigh => 'Juu (1080p+)';

  @override
  String get resolutionMedium => 'Wastani (720p)';

  @override
  String get resolutionLow => 'Chini (<720p)';

  @override
  String get sources => 'Vyanzo';

  @override
  String get audiobookChapters => 'Sura';

  @override
  String get audiobookBookmarks => 'Alamisho';

  @override
  String get audiobookNotes => 'Vidokezo';

  @override
  String get audiobookQueue => 'Foleni';

  @override
  String get audiobookTimeline => 'Ratiba ya Muda';

  @override
  String get audiobookTimelineEmpty => 'Ratiba ya muda ni tupu';

  @override
  String get audiobookWholeBook => 'Kitabu Kizima';

  @override
  String get audiobookFocusedTimeline => 'Ratiba ya Muda Iliyolengwa';

  @override
  String get audiobookExportBookmarks => 'Hamisha Alamisho';

  @override
  String get audiobookExportNotes => 'Hamisha Vidokezo';

  @override
  String get audiobookExportAll => 'Hamisha Yote';

  @override
  String audiobookExportSuccess(String path) {
    return 'Imehamishiwa $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Kuhamisha kumeshindwa: $error';
  }

  @override
  String get audiobookLyrics => 'Maneno ya Wimbo';

  @override
  String get audiobookAddBookmark => 'Ongeza alamisho';

  @override
  String get audiobookAddNote => 'Ongeza kidokezo';

  @override
  String get audiobookEditNote => 'Hariri kidokezo';

  @override
  String get audiobookNoteHint => 'Andika kidokezo cha wakati huu';

  @override
  String get audiobookSleepTimer => 'Kipima muda cha kulala';

  @override
  String get audiobookSleepOff => 'Imezimwa';

  @override
  String get audiobookSleepEndOfChapter => 'Mwisho wa sura';

  @override
  String get audiobookSleepCustom => 'Maalum';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining zimesalia';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dk $count',
      one: 'dk 1',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Kasi ya uchezaji';

  @override
  String get audiobookRemainingTime => 'Zilizosalia';

  @override
  String get audiobookElapsedTime => 'Zilizopita';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Nyuma ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Mbele ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Sura iliyotangulia';

  @override
  String get audiobookNextChapter => 'Sura inayofuata';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Sura $current kati ya $total';
  }

  @override
  String get audiobookNoChapters => 'Hakuna sura';

  @override
  String get audiobookNoBookmarks => 'Hakuna alamisho bado';

  @override
  String get audiobookNoNotes => 'Hakuna vidokezo bado';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Alamisho limeongezwa kwenye $position';
  }

  @override
  String get audiobookSpeedReset => 'Weka upya hadi 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Hifadhi';

  @override
  String get audiobookCancel => 'Ghairi';

  @override
  String get audiobookDelete => 'Futa';

  @override
  String get subtitlePreferences => 'Mapendeleo ya Manukuu';

  @override
  String get subtitlePreferencesDescription =>
      'Badilisha modi za manukuu, lugha chaguo-msingi, muonekano, na chaguo za uonyeshaji.';

  @override
  String get subtitleRendering => 'Uonyeshaji wa Manukuu';

  @override
  String get displayOptions => 'Chaguo za Onyesho';

  @override
  String get releaseDateAscending => 'Tarehe ya Kutolewa (Kupanda)';

  @override
  String get releaseDateDescending => 'Tarehe ya Kutolewa (Kushuka)';

  @override
  String get groupContributions => 'Panga Michango';

  @override
  String get groupMultipleRoles => 'Panga majukumu mengi pamoja';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Onyo la Ufikiaji wa Kuandika kwenye Maktaba';

  @override
  String get libraryWriteAccessHowToFix => 'Jinsi ya kurekebisha hili:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Mpe mtumiaji wa huduma ya Jellyfin (k.m. jellyfin au PUID/PGID ya Docker) ruhusa za kuandika kwenye folda za maktaba yako ya maudhui kwenye seva.\n\n2. Au, nenda kwenye Dashibodi yako ya Jellyfin -> Maktaba, hariri maktaba hii, na uzime \'Hifadhi sanaa katika folda za maudhui\' ili kuhifadhi sanaa katika hifadhidata ya ndani ya Jellyfin.';

  @override
  String get dismiss => 'Ondoa';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Maktaba yako ya \'$libraryName\' imesanidiwa kuhifadhi sanaa moja kwa moja katika folda za maudhui (\'Hifadhi sanaa katika folda za maudhui\' imewashwa). Hata hivyo, Jellyfin imejaribu ufikiaji wa kuandika na haina ruhusa ya kuandika faili katika saraka hii:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Inaonekana Jellyfin imeshindwa kusasisha sanaa. Maktaba yako imesanidiwa kuhifadhi sanaa moja kwa moja katika folda za maudhui (\'Hifadhi sanaa katika folda za maudhui\' imewashwa). Hitilafu hii hutokea mara nyingi wakati mchakato wa seva ya Jellyfin hauna ruhusa ya kuandika faili katika saraka zako za maudhui.';

  @override
  String get externalLists => 'Orodha za Nje';

  @override
  String get replay => 'Cheza Tena';

  @override
  String get fileInformation => 'Maelezo ya Faili';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Ukubwa: $size  •  Muundo: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Onyesha Mikondo Yote ($count) ya Sauti';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Onyesha Mikondo Yote ($count) ya Manukuu';
  }

  @override
  String get checkingDirectPlay =>
      'Inakagua uwezo wa Uchezaji wa Moja kwa Moja...';

  @override
  String get directPlayCapabilityLabel =>
      'Uwezo wa Uchezaji wa Moja kwa Moja: ';

  @override
  String get forced => 'Yaliyolazimishwa';

  @override
  String get transcodeContainerNotSupported =>
      'Muundo wa kontena hauhimiliwi na kicheza.';

  @override
  String get transcodeVideoCodecNotSupported => 'Kodeki ya video haihimiliwi.';

  @override
  String get transcodeAudioCodecNotSupported => 'Kodeki ya sauti haihimiliwi.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Muundo wa manukuu hauhimiliwi (unahitaji kuchomwa).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Wasifu wa sauti hauhimiliwi.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Wasifu wa video hauhimiliwi.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Kiwango cha video hakihimiliwi.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Mwonekano wa video hauhimiliwi na kifaa hiki.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Kina cha biti cha video hakihimiliwi.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Kasi ya fremu ya video haihimiliwi.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Kasi ya biti ya faili inazidi kikomo cha utiririshaji cha kicheza.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Kasi ya biti ya video inazidi kikomo cha utiririshaji.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Kasi ya biti ya sauti inazidi kikomo cha utiririshaji.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Idadi ya chaneli za sauti haihimiliwi.';

  @override
  String get sortAlphabetical => 'Kialfabeti';

  @override
  String get sortReleaseAscending => 'Mpangilio wa Kutolewa (Kupanda)';

  @override
  String get sortReleaseDescending => 'Mpangilio wa Kutolewa (Kushuka)';

  @override
  String get sortCustomDragDrop => 'Maalum (Buruta-na-Dondosha)';

  @override
  String get playlistSortOptions => 'Chaguo za Kupanga Orodha ya Kucheza';

  @override
  String get resetSort => 'Weka Upya Upangaji';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Tazama Tena M$season:K$episode';
  }

  @override
  String get rewatchPlaylist => 'Tazama Tena Orodha ya Kucheza';

  @override
  String get noSubtitlesFound => 'Hakuna manukuu yaliyopatikana.';

  @override
  String get adminControls => 'Vidhibiti vya Msimamizi';

  @override
  String get impellerRendering => 'Injini ya uonyeshaji (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ni kionyeshi cha kisasa cha GPU cha Flutter kwa uhuishaji laini na mkwaruzo mdogo. Kwenye baadhi ya visanduku vya TV na GPU za zamani inaweza kusababisha hitilafu au video nyeusi; izime ikiwa unaona hayo. Kiotomatiki huchagua chaguo-msingi bora kwa kifaa chako. Anzisha upya Moonfin ili kutumia.';

  @override
  String get impellerAuto => 'Kiotomatiki';

  @override
  String get impellerOn => 'Imewashwa';

  @override
  String get impellerOff => 'Imezimwa';

  @override
  String get impellerRestartTitle => 'Kuanzisha upya kunahitajika';

  @override
  String get impellerRestartMessage =>
      'Moonfin inahitaji kuanzishwa upya ili kubadilisha injini ya uonyeshaji. Funga programu sasa, kisha uifungue tena ili kutumia.';

  @override
  String get impellerCloseNow => 'Funga programu sasa';

  @override
  String get adminRefreshLibrary => 'Onyesha Upya Maktaba';

  @override
  String get adminRefreshAllLibraries => 'Onyesha Upya Maktaba Zote';

  @override
  String get adminRepoSortDateOldest =>
      'Tarehe ya Kuongezwa (Za Zamani Kwanza)';

  @override
  String get adminRepoSortDateNewest => 'Tarehe ya Kuongezwa (Mpya Kwanza)';

  @override
  String get adminRepoSortNameAsc => 'Kialfabeti (A hadi Z)';

  @override
  String get adminRepoSortNameDesc => 'Kialfabeti (Z hadi A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Inapakia Takwimu za Seva... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Linganisha na chanzo';

  @override
  String get imdbTop250Movies => 'Filamu 250 Bora za IMDb';

  @override
  String get imdbTop250TvShows => 'Vipindi 250 Bora vya TV vya IMDb';

  @override
  String get imdbMostPopularMovies => 'Filamu Maarufu Zaidi za IMDb';

  @override
  String get imdbMostPopularTvShows => 'Vipindi Maarufu Zaidi vya TV vya IMDb';

  @override
  String get imdbLowestRatedMovies =>
      'Filamu Zenye Ukadiriaji wa Chini Zaidi za IMDb';

  @override
  String get imdbTopEnglishMovies => 'Filamu Bora za Kiingereza za IMDb';
}
