// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AppLocalizationsUg extends AppLocalizations {
  AppLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'تىزىملىتىڭ';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'تېز ئۇلىنىش';

  @override
  String get password => 'پارول';

  @override
  String get username => 'ئىشلەتكۈچى ئىسمى';

  @override
  String get email => 'ئېلخەت';

  @override
  String get quickConnectInstruction =>
      'مۇلازىمېتىرنىڭ تور باشقۇرۇش سۇپىسىغا بۇ كودنى كىرگۈزۈڭ:';

  @override
  String get waitingForAuthorization => 'ھوقۇقنى ساقلاش ...';

  @override
  String get back => 'قايتىش';

  @override
  String get serverUnavailable => 'مۇلازىمېتىرنى ئىشلەتكىلى بولمايدۇ';

  @override
  String get loginFailed => 'كىرىش مەغلۇب بولدى';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'كىم كۆرۈۋاتىدۇ؟';

  @override
  String get addUser => 'ئىشلەتكۈچى قوشۇڭ';

  @override
  String get selectServer => 'مۇلازىمېتىرنى تاللاڭ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'ساقلانغان مۇلازىمېتىرلار';

  @override
  String get discoveredServers => 'مۇلازىمېتىرنى بايقىدى';

  @override
  String get noneFound => 'تېپىلمىدى';

  @override
  String get unableToConnectToServer => 'مۇلازىمېتىرغا ئۇلىنالمىدى';

  @override
  String get addServer => 'مۇلازىمېتىرنى قوشۇڭ';

  @override
  String get embyConnect => 'Emby ئۇلىنىش';

  @override
  String get removeServer => 'مۇلازىمېتىرنى ئۆچۈرۈڭ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'بىكار قىلىش';

  @override
  String get remove => 'ئۆچۈرۈڭ';

  @override
  String get connectToServer => 'مۇلازىمېتىرغا ئۇلاڭ';

  @override
  String get serverAddress => 'مۇلازىمېتىر ئادرېسى';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'ئۇلاڭ';

  @override
  String get secureStorageUnavailable => 'بىخەتەر ساقلاشنى ئىشلەتكىلى بولمايدۇ';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin سىستېمىڭىزنىڭ ئاچقۇچلىرىنى زىيارەت قىلالمىدى. كىرىشنى داۋاملاشتۇرغىلى بولىدۇ ، ئەمما ئاچقۇچ ئېچىلمىغۇچە بىخەتەر بەلگە ساقلاشنى ئىشلەتكىلى بولمايدۇ.';

  @override
  String get ok => 'ماقۇل';

  @override
  String get settingsAppearanceTheme => 'App Theme';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin is the classic layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get settingsAppearanceThemeSubtitle =>
      'بۇ دېتالنى قايتا قوزغىماي Moonfin بىلەن Neon Pulse نى ئالماشتۇرۇڭ';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ھازىرقى Moonfin قارىسىڭىز ھەممىڭىز ياخشى كۆرۈپ قالدىڭىز';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Magenta پارقىراقلىقى ، سىئەن تېكىستى ۋە تېخىمۇ كۈچلۈك خروم سېلىشتۇرمىسى بىلەن Synthwave ئۇسلۇبى';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby ئۇلىنىش ھېساباتىڭىز بىلەن كىرىڭ';

  @override
  String get emailOrUsername => 'ئېلېكترونلۇق خەت ياكى ئىشلەتكۈچى ئىسمى';

  @override
  String get selectAServer => 'مۇلازىمېتىرنى تاللاڭ';

  @override
  String get tryAgain => 'قايتا سىناڭ';

  @override
  String get noLinkedServers =>
      'بۇ Emby ئۇلىنىش ھېساباتىغا ئۇلانغان مۇلازىمېتىر يوق';

  @override
  String get invalidEmbyConnectCredentials => 'ئىناۋەتسىز Emby كىنىشكىنى ئۇلاڭ';

  @override
  String get invalidEmbyConnectLogin =>
      'ئىناۋەتسىز Emby ئۇلىنىش ئىشلەتكۈچى ئىسمى ياكى پارولى';

  @override
  String get embyConnectExchangeNotSupported =>
      'مۇلازىمېتىر Emby Connect ئالماشتۇرۇشنى قوللىمايدۇ';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect ياكى تاللانغان مۇلازىمېتىر بىلەن ئالاقىلاشقاندا تور خاتالىقى';

  @override
  String get loadingLinkedServers =>
      'ئۇلانغان مۇلازىمېتىرلارنى يۈكلەۋاتىدۇ ...';

  @override
  String get connectingToServerEllipsis => 'مۇلازىمېتىرغا ئۇلىنىش ...';

  @override
  String get noReachableAddress => 'يەتكىلى بولىدىغان ئادرېس تەمىنلەنمىدى';

  @override
  String get invalidServerExchangeResponse =>
      'مۇلازىمېتىر ئالماشتۇرۇش نۇقتىسىنىڭ ئىناۋەتسىز ئىنكاسى';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'چىقىش Moonfin?';

  @override
  String get exitAppConfirmation => 'چېكىنىشنى خالامسىز؟';

  @override
  String get exit => 'چىقىش';

  @override
  String get noHomeRowsLoaded => 'ھېچقانداق ئۆي قۇرلىرىنى يۈكلەشكە بولمايدۇ';

  @override
  String get noHomeRowsHint =>
      'ئاكتىپ ئائىلە بۆلەكلىرىنى يېڭىلاش ياكى ئازايتىشنى سىناپ بېقىڭ.';

  @override
  String get retryHomeRows => 'ئۆي قۇرلىرىنى قايتا سىناڭ';

  @override
  String get guide => 'يېتەكچى';

  @override
  String get recordings => 'Recordings';

  @override
  String get schedule => 'ۋاقىت جەدۋىلى';

  @override
  String get series => 'Series';

  @override
  String get noItemsFound => 'ھېچقانداق نەرسە تېپىلمىدى';

  @override
  String get home => 'ئۆي';

  @override
  String get browseAll => 'ھەممىنى كۆرۈڭ';

  @override
  String get genres => 'ژانىرلار';

  @override
  String get collectionPlaceholder => 'يىغىش تۈرلىرى بۇ يەردە كۆرۈنىدۇ';

  @override
  String get browseByLetter => 'خەت ئارقىلىق كۆرۈڭ';

  @override
  String get alphabeticalBrowsePlaceholder => 'ئېلىپبە كۆرۈش بۇ يەردە كۆرۈنىدۇ';

  @override
  String get suggestions => 'تەكلىپ';

  @override
  String get suggestionsPlaceholder =>
      'تەكلىپ قىلىنغان تۈرلەر بۇ يەردە كۆرۈنىدۇ';

  @override
  String get failedToLoadLibraries => 'كۈتۈپخانىلارنى يۈكلىيەلمىدى';

  @override
  String get noLibrariesFound => 'كۈتۈپخانىلار تېپىلمىدى';

  @override
  String get library => 'كۈتۈپخانا';

  @override
  String get displaySettings => 'تەڭشەكلەرنى كۆرسىتىش';

  @override
  String get allGenres => 'بارلىق ژانىرلار';

  @override
  String get noGenresFound => 'ھېچقانداق ژانىر تېپىلمىدى';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'بۇ ھۆججەت قىسقۇچ قۇرۇق';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'ياقتۇرىدىغانلارنى يۈكلىيەلمىدى';

  @override
  String get retry => 'قايتا سىناڭ';

  @override
  String get noFavoritesYet => 'ياقتۇرىدىغانلار تېخى يوق';

  @override
  String get favorites => 'ياقتۇرىدىغانلار';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'داۋاملاشتۇرۇش';

  @override
  String get ended => 'ئاخىرلاشتى';

  @override
  String get sortAndFilter => 'تەرتىپلەش ۋە سۈزۈش';

  @override
  String get type => 'تىپ';

  @override
  String get sortBy => 'Sort By';

  @override
  String get display => 'كۆرسىتىش';

  @override
  String get imageType => 'رەسىم تىپى';

  @override
  String get posterSize => 'ئېلان چوڭلۇقى';

  @override
  String get small => 'كىچىك';

  @override
  String get medium => 'ئوتتۇراھال';

  @override
  String get large => 'چوڭ';

  @override
  String get extraLarge => 'قوشۇمچە چوڭ';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'كۆرۈنۈشلەر';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'پىلاستىنكا سەنئەتكارلىرى';

  @override
  String get artists => 'سەنئەتكارلار';

  @override
  String get bookmarks => 'خەتكۈچلەر';

  @override
  String get noSavedBookmarks =>
      'بۇ ماۋزۇ ئۈچۈن ھازىرغىچە ساقلانغان خەتكۈچ يوق.';

  @override
  String get openBook => 'ئوچۇق كىتاب';

  @override
  String get chapter => 'باب';

  @override
  String get page => 'بەت';

  @override
  String get bookmark => 'خەتكۈچ';

  @override
  String get justNow => 'ھازىر';

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
  String get discoverySubjects => 'بايقاش سۇبيېكتى';

  @override
  String get pickDiscoverySubjects =>
      '«بايقاش» تا قايسى مەزمۇننى كۆرسىتىدىغانلىقىنى تاللاڭ.';

  @override
  String get apply => 'ئىلتىماس قىلىڭ';

  @override
  String get openLink => 'ئۇلىنىشنى ئېچىڭ';

  @override
  String get scanWithYourPhone => 'تېلېفونىڭىز بىلەن سايىلەڭ';

  @override
  String get audiobookGenres => 'ئۈندىدار ژانىرى';

  @override
  String get pickAudiobookGenres =>
      'Audiobook بايقاشتا قايسى ژانىرلارنى كۆرسىتىشنى تاللاڭ.';

  @override
  String get discoverAudiobooks => 'ئۈندىدارنى بايقاش';

  @override
  String get librivoxDescription => 'LibriVox دىكى داڭلىق ئاممىۋى تور نامى.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'سولغا يۆتكەڭ';

  @override
  String get scrollRight => 'ئوڭغا يۆتكەڭ';

  @override
  String get couldNotLoadGenre => 'ھازىر بۇ ژانىرنى يۈكلىيەلمىدى.';

  @override
  String get continueReading => 'داۋاملىق ئوقۇش';

  @override
  String get savedHighlights => 'ساقلانغان يارقىن نۇقتىلار';

  @override
  String get continueListening => 'داۋاملىق ئاڭلاڭ';

  @override
  String get listen => 'ئاڭلاڭ';

  @override
  String get resume => 'ئەسلىگە كەلتۈرۈش';

  @override
  String get failedToLoadLibrary => 'كۈتۈپخانىنى يۈكلىيەلمىدى';

  @override
  String get popularNow => 'ھازىر مودا';

  @override
  String get savedForLater => 'كېيىن ساقلاندى';

  @override
  String get topListens => 'Top Listens';

  @override
  String get unreadDiscoveries => 'ئوقۇلمىغان بايقاشلار';

  @override
  String get pickUpAgain => 'قايتا تاللاڭ';

  @override
  String get bookHighlightsDescription =>
      'كىتابلىرىڭىز يارقىن نۇقتىلار ، ياقتۇرىدىغان ياكى ئوقۇش ئىلگىرىلەشلىرى بار.';

  @override
  String get handPickedFromLibrary => 'كۈتۈپخانىڭىزدىن قولدا تاللانغان.';

  @override
  String get handPickedFromListeningQueue =>
      'ئاڭلاش سېپىڭىزدىن قولدا تاللانغان.';

  @override
  String get booksWithHighlights =>
      'يارقىن نۇقتىلار ، ياقتۇرىدىغانلار ياكى ئوقۇش ئىلگىرىلەشلىرى بار كىتابلار.';

  @override
  String get jumpBackNarration => 'ئورنىڭىزنى ئوۋلىماي بايانغا قايتىڭ.';

  @override
  String get unreadBooksReady =>
      'ئوقۇلمىغان كىتابلار كېيىنكى جىمجىت سائەت ئۈچۈن تەييار.';

  @override
  String get quickAccessFavorites =>
      'سىز قايتىپ كەلگەن كىتابلارنى تېز زىيارەت قىلىڭ.';

  @override
  String get searchAudiobooks => 'ئۈندىدارنى ئىزدەڭ';

  @override
  String get searchYourLibrary => 'كۈتۈپخانىڭىزنى ئىزدەڭ';

  @override
  String get pickUpStory => 'سىز قالدۇرغان ھېكايىنى ئېلىڭ';

  @override
  String get savedPlacesChapters =>
      'ساقلىغان جايلىرىڭىز ۋە تاماملانمىغان بابلىرىڭىز';

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
  String get readyWhenYouAre => 'تەييار بولغاندا تەييار';

  @override
  String get details => 'تەپسىلاتى';

  @override
  String get listeningRoom => 'ئاڭلاش ئۆيى';

  @override
  String get bookmarksAndProgress => 'خەتكۈچ ۋە ئىلگىرىلەش';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'ماۋزۇلار';

  @override
  String get allTitles => 'بارلىق ماۋزۇلار';

  @override
  String get authors => 'ئاپتورلار';

  @override
  String get browseByAuthor => 'ئاپتور تەرىپىدىن كۆرۈڭ';

  @override
  String get browseByGenre => 'ژانىرغا قاراڭ';

  @override
  String get discover => 'بايقاش';

  @override
  String get trendingTitlesOpenLibrary =>
      'تېما Open Library دىن تېما بويىچە يۈزلىنىش.';

  @override
  String get noBookmarkedItems => 'تېخى خەتكۈچلەنمىگەن تۈرلەر يوق';

  @override
  String get nothingMatchesSection =>
      'بۇ بۆلەككە تېخى ماس كەلمەيدۇ. باشقا بەتكۈچنى سىناپ بېقىڭ ياكى كۈتۈپخانا ماسقەدەملەش ئاخىرلاشقاندىن كېيىن قايتىپ كېلىڭ.';

  @override
  String get audiobooks => 'ئۈندىدار';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'ھۆججەت قىسقۇچ';

  @override
  String get filters => 'سۈزگۈچ';

  @override
  String get readingStatus => 'ئوقۇش ھالىتى';

  @override
  String get playedStatus => 'ئوينىغان ھالەت';

  @override
  String get readStatus => 'ئوقۇ';

  @override
  String get watched => 'كۆزىتىلدى';

  @override
  String get unread => 'ئوقۇمىغان';

  @override
  String get unwatched => 'كۆزىتىلمىگەن';

  @override
  String get seriesStatus => 'يۈرۈشلۈك ھالىتى';

  @override
  String get allLibraries => 'بارلىق كۇتۇپخانىلار';

  @override
  String get books => 'كىتابلار';

  @override
  String get author => 'ئاپتور';

  @override
  String get unknownAuthor => 'نامەلۇم ئاپتور';

  @override
  String get uncategorized => 'تۈرگە ئايرىلمىغان';

  @override
  String get overview => 'ئومۇمىي چۈشەنچە';

  @override
  String get noLibrivoxDescription =>
      'بۇ ماۋزۇ ئۈچۈن LibriVox تەمىنلىگەن ھېچقانداق چۈشەندۈرۈش يوق.';

  @override
  String get readers => 'ئوقۇرمەنلەر';

  @override
  String get openLinks => 'ئۇلىنىشلارنى ئېچىڭ';

  @override
  String get librivoxPage => 'LibriVox بېتى';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'RSS Feed';

  @override
  String get downloadZip => 'Zip نى چۈشۈرۈڭ';

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
      'بۇ ماۋزۇ ئۈچۈن Open Library دىن ئومۇمىي چۈشەنچە يوق.';

  @override
  String get subjects => 'تېما';

  @override
  String get all => 'ھەممىسى';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'بۇ تېمىنى ھازىرچە يۈكلىيەلمىدى.';

  @override
  String get audiobookDetails => 'ئۈندىدار تەپسىلاتى';

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
  String get trackList => 'ئىز تىزىملىكى';

  @override
  String get itemListPlaceholder => 'تۈر تىزىملىكى بۇ يەردە كۆرۈنىدۇ';

  @override
  String get favoriteTracksPlaceholder =>
      'ياقتۇرىدىغان ئىزلار بۇ يەردە كۆرۈنىدۇ';

  @override
  String get failedToLoad => 'يۈكلەش مەغلۇپ بولدى';

  @override
  String get delete => 'ئۆچۈرۈش';

  @override
  String get save => 'ساقلاش';

  @override
  String get moreLikeThis => 'بۇنىڭغا ئوخشاش';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Collection';

  @override
  String get episodes => 'Episodes';

  @override
  String get nextUp => 'Next Up';

  @override
  String get seasons => 'پەسىللەر';

  @override
  String get chapters => 'باب';

  @override
  String get features => 'Features';

  @override
  String get movies => 'كىنولار';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'باشقىلىرى';

  @override
  String get discography => 'Discography';

  @override
  String get similarArtists => 'مۇشۇنىڭغا ئوخشاش سەنئەتكارلار';

  @override
  String get tableOfContents => 'مەزمۇن جەدۋىلى';

  @override
  String get tracklist => 'ئىز قوغلاش تىزىملىكى';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'تەرجىمىھالى';

  @override
  String get authorDetails => 'ئاپتور تەپسىلاتلىرى';

  @override
  String get noOverviewAvailable => 'بۇ ماۋزۇغا ھازىرچە ئومۇمىي چۈشەنچە يوق.';

  @override
  String get noBiographyAvailable => 'بۇ ئاپتورنىڭ تەرجىمىھالى يوق.';

  @override
  String get noBooksFound => 'بۇ ئاپتور ئۈچۈن ھېچقانداق كىتاب تېپىلمىدى.';

  @override
  String get unableToLoadAuthorDetails =>
      'ئاپتور تەپسىلاتلىرىنى ھازىرچە يۈكلىيەلمىدى.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'ئېلان قىلىنغان ۋاقتى نامەلۇم';

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
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'كۆرۈش';

  @override
  String get resumeReading => 'ئوقۇشنى ئەسلىگە كەلتۈرۈش';

  @override
  String get read => 'ئوقۇ';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'ئويناش';

  @override
  String get startOver => 'باشلاش';

  @override
  String get restart => 'قايتا قوزغىتىڭ';

  @override
  String get readOffline => 'تورسىز ئوقۇش';

  @override
  String get playOffline => 'Offline نى ئويناڭ';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitles';

  @override
  String get version => 'نەشرى';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'تاماملاندى';

  @override
  String get favorited => 'ياقتۇرىدىغان';

  @override
  String get favorite => 'ئامراق';

  @override
  String get playlist => 'قويۇش تىزىملىكى';

  @override
  String get downloaded => 'چۈشۈرۈلدى';

  @override
  String get downloadAll => 'ھەممىنى چۈشۈرۈڭ';

  @override
  String get download => 'چۈشۈرۈش';

  @override
  String get deleteDownloaded => 'چۈشۈرۈشنى ئۆچۈرۈڭ';

  @override
  String get goToSeries => 'يۈرۈشلۈككە بېرىڭ';

  @override
  String get editMetadata => 'Metadata نى تەھرىرلەڭ';

  @override
  String get less => 'ئاز';

  @override
  String get more => 'تېخىمۇ كۆپ';

  @override
  String get deleteItem => 'تۈرنى ئۆچۈرۈڭ';

  @override
  String get deletePlaylist => 'Playlist نى ئۆچۈرۈڭ';

  @override
  String get deletePlaylistMessage =>
      'بۇ قويۇش تىزىملىكىنى مۇلازىمېتىردىن ئۆچۈرەمسىز؟';

  @override
  String get deleteItemMessage => 'بۇ تۈرنى مۇلازىمېتىردىن ئۆچۈرەمسىز؟';

  @override
  String get failedToDeletePlaylist => 'قويۇش تىزىملىكىنى ئۆچۈرەلمىدى';

  @override
  String get failedToDeleteItem => 'تۈرنى ئۆچۈرەلمىدى';

  @override
  String get renamePlaylist => 'قويۇش تىزىملىكىنىڭ نامىنى ئۆزگەرتىڭ';

  @override
  String get playlistName => 'قويۇش تىزىملىكى';

  @override
  String get deleteDownloadedAlbum => 'چۈشۈرۈلگەن پىلاستىنكىنى ئۆچۈرۈڭ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'چۈشۈرۈلگەن ئىزلار ئۆچۈرۈلدى';

  @override
  String get downloadedTracksDeleteFailed =>
      'چۈشۈرۈلگەن بەزى ئىزلارنى ئۆچۈرگىلى بولمىدى';

  @override
  String get noTracksLoaded => 'ھېچقانداق يۈك يوق';

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
  String get itemDeleted => 'تۈر ئۆچۈرۈلدى';

  @override
  String get noPlayableTrailerFound =>
      'قويغىلى بولىدىغان يۈك ماشىنىسى تېپىلمىدى.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Audio Track';

  @override
  String get subtitleTrack => 'Subtitle Track';

  @override
  String get none => 'ياق';

  @override
  String get downloadSubtitlesLabel => 'Subtitles نى چۈشۈرۈڭ ...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles قىستۇرمىسىنى ئىشلىتىپ ئىزدەڭ';

  @override
  String get downloadSubtitles => 'Subtitles نى چۈشۈرۈڭ';

  @override
  String get selectedSubtitleInvalid => 'تاللانغان تارماق ئىناۋەتسىز.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitle download. Jellyfin بۇ نەرسىنى يېڭىلىغاندا بىر ئاز ۋاقىت كېتىشى مۇمكىن.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'نەشرىنى تاللاڭ';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'ھەممىنى چۈشۈرۈش - سۈپەت';

  @override
  String get downloadQuality => 'سۈپەتنى چۈشۈرۈش';

  @override
  String get originalFileNoReencoding => 'ئەسلى ھۆججەت ، قايتا كودلاش يوق';

  @override
  String get originalFilesNoReencoding => 'ئەسلى ھۆججەتلەر ، قايتا كودلاش يوق';

  @override
  String get noEpisodesLoaded => 'ھېچقانداق بۆلەك يۈكلەنمىدى';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'چۈشۈرۈلگەن ھۆججەتلەرنى ئۆچۈرۈڭ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'چۈشۈرۈلگەن ھۆججەتلەر ئۆچۈرۈلدى';

  @override
  String get failedToDeleteFiles => 'ھۆججەتلەرنى ئۆچۈرەلمىدى';

  @override
  String get deleteFiles => 'ھۆججەتلەرنى ئۆچۈرۈڭ';

  @override
  String get director => 'DIRECTOR';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'يازغۇچىلار';

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
  String get showLess => 'ئازراق كۆرسەت';

  @override
  String get readMore => 'تېخىمۇ كۆپ ئوقۇڭ';

  @override
  String get shuffle => 'Shuffle';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'مۇكەممەل ماسلاشتۇرۇش';

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
  String get deleteSeasonFiles => 'بۇ مەۋسۇمدىكى بارلىق چۈشۈرۈلگەن بۆلەكلەر';

  @override
  String get stillWatching => 'يەنىلا كۆرۈۋاتامسىز؟';

  @override
  String get unableToLoadTrailerStream => 'يول ئېقىمىنى يۈكلىيەلمىدى.';

  @override
  String get trailerTimedOut => 'يۈك ماشىنىسى يۈكلەۋاتقاندا ۋاقتى ئۆتۈپ كەتتى.';

  @override
  String get playbackFailedForTrailer => 'بۇ يولدا قويۇش مەغلۇب بولدى.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'تورسىز قويۇش جەريانىدا رول ئالغىلى بولمايدۇ.';

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
  String get deviceVolume => 'ئۈسكۈنىنىڭ ھەجىمى';

  @override
  String get unavailable => 'Unavailable';

  @override
  String get pause => 'Pause';

  @override
  String get syncPosition => 'ماس قەدەم ئورنى';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'ئۆچرەت قۇرۇق';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'يىراقتىن قويۇش';

  @override
  String get castingToGoogleCast => 'Google Cast غا قۇيۇش';

  @override
  String get castingViaAirPlay => 'AirPlay ئارقىلىق قۇيۇش';

  @override
  String get castingViaDlna => 'DLNA ئارقىلىق قۇيۇش';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'قۇلۇپنى ئۇزۇن بېسىڭ';

  @override
  String get off => 'Off';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ئاپتوماتىك';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bitrate Override';

  @override
  String get audioDelay => 'Audio Delay';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Subtitle Delay';

  @override
  String get reset => 'ئەسلىگە قايتۇرۇش';

  @override
  String get unknown => 'نامەلۇم';

  @override
  String get playbackInformation => 'قويۇش ئۇچۇرى';

  @override
  String get playback => 'قويۇش';

  @override
  String get playMethod => 'ئويناش ئۇسۇلى';

  @override
  String get directPlay => 'Direct Play';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcoding => 'Transcoding';

  @override
  String get transcodeReasons => 'Transcode سەۋەبلىرى';

  @override
  String get player => 'قويغۇچ';

  @override
  String get container => 'كونتېينېر';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'قارار';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video Bitrate';

  @override
  String get track => 'ئىز قوغلاش';

  @override
  String get channels => 'قاناللار';

  @override
  String get audioBitrate => 'Audio Bitrate';

  @override
  String get sampleRate => 'ئۈلگە نىسبىتى';

  @override
  String get format => 'فورماتى';

  @override
  String get external => 'سىرتقى';

  @override
  String get embedded => 'قىستۇرما';

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
      'بۇ سۇپىدا EPUB نى كۆرسىتىش تېخىچە يوق.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'قىستۇرما ھۆججەتلەرنى بۇ سۇپىدا ئىشلەتكىلى بولمايدۇ.';

  @override
  String get couldNotOpenExternalViewer => 'سىرتقى كۆرگۈچنى ئاچالمىدى.';

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
      'خەتكۈچ يوق.\nئورنىڭىزنى ساقلاش ئۈچۈن ئوقۇۋاتقاندا خەتكۈچ سىنبەلگىسىنى چېكىڭ.';

  @override
  String get noTableOfContentsAvailable => 'جەدۋەل يوق';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'ئورنى';

  @override
  String get bookReader => 'كىتاب ئوقۇغۇچ';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'يېڭىلاش ...';

  @override
  String get markUnread => 'ئوقۇلمىغان بەلگە';

  @override
  String get markAsRead => 'ئوقۇش دەپ بەلگە قويۇڭ';

  @override
  String get reloadReader => 'Reader Reader';

  @override
  String get noPagesFound => 'ھېچقانداق بەت تېپىلمىدى.';

  @override
  String get failedToDecodePageImage => 'بەت رەسىمىنى يېشىش مەغلۇب بولدى.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'يەككە بەت';

  @override
  String get twoPageSpread => 'ئىككى بەتلىك تارقىلىش';

  @override
  String get addBookmark => 'خەتكۈچ قوشۇڭ';

  @override
  String get bookmarksEllipsis => 'خەتكۈچلەر ...';

  @override
  String get markedAsRead => 'ئوقۇشقا بەلگە قويۇلغان';

  @override
  String get markedAsUnread => 'ئوقۇلمىغان دەپ بەلگە قويۇلغان';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'تېما: سىستېما';

  @override
  String get themeLight => 'تېما: نۇر';

  @override
  String get themeDark => 'تېما: قاراڭغۇ';

  @override
  String get themeSepia => 'تېما: سېپىيە';

  @override
  String get invertColorsFixedLayout =>
      'رەڭلەرنى ئۆزگەرتىش (مۇقىم ئورۇنلاشتۇرۇش)';

  @override
  String get invertColorsPdf => 'رەڭلەرنى ئۆزگەرتىش (PDF)';

  @override
  String get preparingInAppReader => 'ئەپ ئوقۇغۇچ تەييارلاش ...';

  @override
  String get pdfDataNotAvailable => 'PDF سانلىق مەلۇماتلىرى يوق.';

  @override
  String get readerFallbackModeActive => 'ئوقۇرمەنلەرنىڭ چېكىنىش ھالىتى ئاكتىپ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'قوللايدىغان سۇپا نىشانىغا (ئاندىرويىد ، iOS ، macOS) غا ئالماشتۇرغاندىن كېيىن قايتا يۈكلىگۈچنى ئىشلىتىڭ.';

  @override
  String get openExternally => 'سىرتقا ئېچىڭ';

  @override
  String get noEpubChaptersFound => 'EPUB بابى تېپىلمىدى.';

  @override
  String get readerNotReady => 'ئوقۇرمەن تەييار ئەمەس.';

  @override
  String get seriesRecordings => 'Series Recordings';

  @override
  String get now => 'ھازىر';

  @override
  String get sports => 'تەنھەرىكەت';

  @override
  String get news => 'خەۋەرلەر';

  @override
  String get kids => 'بالىلار';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideTimeline => 'يېتەكچى ۋاقىت';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'ھېچقانداق قانال تېپىلمىدى';

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
  String get movie => 'Movie';

  @override
  String get removedFromFavoriteChannels =>
      'ياقتۇرىدىغان قاناللاردىن چىقىرىۋېتىلدى';

  @override
  String get addedToFavoriteChannels => 'ياقتۇرىدىغان قاناللارغا قوشۇلدى';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ياقتۇرىدىغان قانالنى يېڭىلاش مەغلۇب بولدى';

  @override
  String get unfavoriteChannel => 'ياقتۇرمايدىغان قانال';

  @override
  String get favoriteChannel => 'ياقتۇرىدىغان قانال';

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
  String get watch => 'قاراڭ';

  @override
  String get close => 'تاقاش';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'خاتىرىلەرنى يۈكلىيەلمىدى';

  @override
  String get scheduledInNext24Hours =>
      'كېيىنكى 24 سائەت ئىچىدە ئورۇنلاشتۇرۇلغان';

  @override
  String get recentRecordings => 'يېقىنقى خاتىرىلەر';

  @override
  String get tvSeries => 'TV Series';

  @override
  String get failedToLoadSchedule => 'ۋاقىت جەدۋىلىنى يۈكلىيەلمىدى';

  @override
  String get noScheduledRecordings => 'پىلانلانغان خاتىرىلەر يوق';

  @override
  String get cancelRecording => 'خاتىرىلەشنى ئەمەلدىن قالدۇرامسىز؟';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'ياق';

  @override
  String get yesCancel => 'ھەئە ، بىكار قىلىڭ';

  @override
  String get failedToCancelRecording => 'خاتىرىلەشنى ئەمەلدىن قالدۇرمىدى';

  @override
  String get failedToLoadSeriesRecordings =>
      'يۈرۈشلۈك خاتىرىلەرنى يۈكلىيەلمىدى';

  @override
  String get noSeriesRecordings => 'يۈرۈشلۈك خاتىرىلەر يوق';

  @override
  String get cancelSeriesRecording => 'يۈرۈشلۈك خاتىرىلەرنى ئەمەلدىن قالدۇرۇڭ';

  @override
  String get cancelSeriesRecordingQuestion =>
      'يۈرۈشلۈك خاتىرىلەرنى بىكار قىلامسىز؟';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'يۈرۈشلۈك خاتىرىلەرنى ئەمەلدىن قالدۇرمىدى';

  @override
  String get searchThisLibrary => 'بۇ كۇتۇپخانىنى ئىزدەڭ ...';

  @override
  String get searchEllipsis => 'ئىزدەش ...';

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
  String get seerrAccountType => 'Seerr ھېسابات تىپى';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'يەرلىك';

  @override
  String get savedMedia => 'ساقلانغان مېدىيا';

  @override
  String get tvShows => 'TV Show';

  @override
  String get music => 'مۇزىكا';

  @override
  String get musicAlbums => 'مۇزىكا پىلاستىنكىسى';

  @override
  String get noMediaInFilter => 'بۇ سۈزگۈچتە ھېچقانداق مېدىيا يوق';

  @override
  String get noDownloadedMediaYet => 'تېخى چۈشۈرۈلگەن مېدىيا يوق';

  @override
  String get browseLibrary => 'كۈتۈپخانىنى كۆرۈڭ';

  @override
  String get deleteDownload => 'چۈشۈرۈشنى ئۆچۈرۈڭ';

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
  String get playAlbum => 'پىلاستىنكا قويۇڭ';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'پەسىل';

  @override
  String get errorLoadingEpisodes => 'بۆلەكلەرنى يۈكلەشتە خاتالىق';

  @override
  String get noDownloadedEpisodes => 'چۈشۈرۈلگەن قىسىم يوق';

  @override
  String get deleteEpisode => 'بۆلەكنى ئۆچۈرۈڭ';

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
  String get seriesNotFound => 'يۈرۈشلۈك تېپىلمىدى';

  @override
  String get errorLoadingSeries => 'يۈكلەش يۈرۈشلۈكلىرى';

  @override
  String get downloadedEpisodes => 'چۈشۈرۈلگەن بۆلەكلەر';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'ئالاھىدە';

  @override
  String get deleteSeason => 'مەۋسۇمنى ئۆچۈرۈڭ';

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
  String get storageManagement => 'ساقلاش باشقۇرۇش';

  @override
  String get storageBreakdown => 'Storage Breakdown';

  @override
  String get downloadedItems => 'چۈشۈرۈلگەن تۈرلەر';

  @override
  String get storageLimit => 'ساقلاش چەكلىمىسى';

  @override
  String get noLimit => 'چەكلىمىسى يوق';

  @override
  String get deleteAllDownloads => 'بارلىق چۈشۈرۈشلەرنى ئۆچۈرۈڭ';

  @override
  String get deleteAllDownloadsWarning =>
      'بۇ چۈشۈرۈلگەن بارلىق مېدىيا ھۆججەتلىرىنى ئۆچۈرۈۋېتىدۇ ، ئەمەلدىن قالدۇرغىلى بولمايدۇ.';

  @override
  String get deleteAll => 'ھەممىنى ئۆچۈرۈڭ';

  @override
  String get deleteSelected => 'تاللانغاننى ئۆچۈرۈڭ';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'مۇزىكا ۋە ئاۋازلىق كىتاب';

  @override
  String get images => 'سۈرەتلەر';

  @override
  String get database => 'ساندان';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'تەڭشەك';

  @override
  String get authentication => 'دەلىللەش';

  @override
  String get autoLoginServerManagement =>
      'ئاپتوماتىك كىرىش ، مۇلازىمېتىر باشقۇرۇش';

  @override
  String get pinCode => 'PIN Code';

  @override
  String get setUpPinCodeProtection => 'PIN كود قوغداشنى تەڭشەڭ';

  @override
  String get parentalControls => 'ئاتا-ئانىلارنىڭ كونتروللۇقى';

  @override
  String get contentRatingRestrictions => 'مەزمۇن دەرىجىسىنى چەكلەش';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolution, behavior';

  @override
  String get languageSizeAppearance => 'تىل ، چوڭ-كىچىكلىكى ، كۆرۈنۈشى';

  @override
  String get qualityStorage => 'سۈپەت ، ساقلاش';

  @override
  String get serverSyncAndPluginStatus =>
      'مۇلازىمېتىر ماسقەدەملەش ۋە قىستۇرما ھالىتى';

  @override
  String get mediaRequestIntegration => 'مېدىيا بىر گەۋدىلىشىشنى تەلەپ قىلىدۇ';

  @override
  String get switchServer => 'مۇلازىمېتىرنى ئالماشتۇرۇش';

  @override
  String get signOut => 'چېكىنىش';

  @override
  String get versionLicenses => 'نەشرى ، ئىجازەتنامە';

  @override
  String get account => 'ھېسابات';

  @override
  String get signInAndSecurity => 'كىرىش ۋە بىخەتەرلىك';

  @override
  String get administration => 'Administration';

  @override
  String get serverSettingsUsersLibraries =>
      'مۇلازىمېتىر تەڭشىكى ، ئىشلەتكۈچى ، كۈتۈپخانىلار';

  @override
  String get customization => 'خاسلاشتۇرۇش';

  @override
  String get themeAndLayout => 'تېما ۋە ئورۇنلاشتۇرۇش';

  @override
  String get videoAndSubtitles => 'Video and subtitles';

  @override
  String get integrations => 'بىرىكتۈرۈش';

  @override
  String get pluginAndRequests => 'قىستۇرما ۋە تەلەپلەر';

  @override
  String get customizeAccountPlaybackInterface =>
      'ھېسابات ، قويۇش ۋە كۆرۈنمە يۈز ھەرىكىتىنى خاسلاشتۇرۇڭ';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'تېما ۋە كۆرۈنۈش';

  @override
  String get focusBorderColor => 'فوكۇس چېگرا رەڭگى';

  @override
  String get watchedIndicators => 'كۆزىتىلگەن كۆرسەتكۈچ';

  @override
  String get always => 'ھەمىشە';

  @override
  String get hideUnwatched => 'كۆزىتىلمىگەننى يوشۇر';

  @override
  String get episodesOnly => 'Episodes Only';

  @override
  String get never => 'ھەرگىز بولمايدۇ';

  @override
  String get focusExpansionAnimation => 'فوكۇس كېڭەيتىش كارتون فىلىمى';

  @override
  String get desktopUiScale => 'ئۈستەل يۈزى UI ئۆلچىمى';

  @override
  String get scaleFocusedCards =>
      'تارازا فوكۇسلانغان ياكى يانتۇ كارتا ۋە كاھىش';

  @override
  String get backgroundBackdrops => 'تەگلىك ئارقا كۆرۈنۈش';

  @override
  String get showBackdropImages =>
      'ئارقا كۆرۈنۈشتىكى رەسىملەرنى مەزمۇننىڭ ئارقىسىدا كۆرسىتىڭ';

  @override
  String get seriesThumbnails => 'Series Thumbnails';

  @override
  String get seriesThumbnailsDescription =>
      'پەقەت بۆلەكلەر: ھەر بىر قۇر رەسىم تىپىغا ماس كېلىدىغان يۈرۈشلۈك سەنئەت ئەسەرلىرىنى ئىشلىتىڭ';

  @override
  String get homeRowInfoOverlay => 'باش بەت ئۇچۇرى';

  @override
  String get showTitleMetadataOnHomeRows =>
      'ئائىلە قۇرلىرىنى كۆرگەندە ماۋزۇ ۋە مېتا سانلىق مەلۇماتنى كۆرسىتىڭ';

  @override
  String get clockDisplay => 'سائەت كۆرسىتىش';

  @override
  String get inMenus => 'تىزىملىكلەردە';

  @override
  String get inVideo => 'سىندا';

  @override
  String get seasonalEffects => 'پەسىل خاراكتېرلىك ئۈنۈم';

  @override
  String get seasonalEffectsDescription =>
      'كۆرۈنۈش ئۈنۈمى ۋە پەسىللىك بېزەكلەر';

  @override
  String get snow => 'قار';

  @override
  String get fireworks => 'پوجاڭزا';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'يىقىلىپ چۈشۈش';

  @override
  String get themeMusic => 'تېما مۇزىكىسى';

  @override
  String get playThemeMusicOnDetailPages =>
      'باشتېما مۇزىكىسىنى تەپسىلىي بەتلەردە قويۇڭ';

  @override
  String get themeMusicVolume => 'تېما مۇزىكا ھەجىمى';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ئائىلە قۇرلىرىدىكى تېما مۇزىكىسى';

  @override
  String get playWhenBrowsingHomeScreen => 'ئائىلە ئېكرانىنى كۆرگەندە ئويناڭ';

  @override
  String get detailsBackgroundBlur => 'تەپسىلاتى ئارقا كۆرۈنۈش';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ئارقا كۆرۈنۈشنى كۆرۈش';

  @override
  String get maxStreamingBitrate => 'Max Streaming Bitrate';

  @override
  String get maxResolution => 'Max Resolution';

  @override
  String get playerZoomMode => 'قويغۇچ چوڭايتىش ھالىتى';

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
  String get autoCrop => 'Auto Crop';

  @override
  String get stretch => 'Stretch';

  @override
  String get refreshRateSwitching => 'باھا ئالماشتۇرۇشنى يېڭىلاش';

  @override
  String get disabled => 'چەكلەنگەن';

  @override
  String get scaleOnTv => 'تېلېۋىزوردىكى كۆلەم';

  @override
  String get scaleOnDevice => 'ئۈسكۈنىدىكى كۆلەم';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'ئىزدىگەندە ئالدىن كۆرۈش كىچىك كۆرۈنۈشىنى كۆرسىتىڭ';

  @override
  String get showDescriptionOnPause => 'توختاپ قېلىشنى چۈشەندۈرۈڭ';

  @override
  String get dimVideoShowOverview =>
      'توختاپ قالغاندا سىننى كۆرسىتىش ۋە ئومۇمىي تېكىستنى كۆرسىتىش';

  @override
  String get osdLockButton => 'OSD قۇلۇپلاش كۇنۇپكىسى';

  @override
  String get osdLockButtonDescription =>
      'ئۇزۇن ۋاقىت بېسىلغۇچە چەكمە كىرگۈزۈشنى چەكلەيدىغان قۇلۇپ كۇنۇپكىسىنى كۆرسىتىڭ';

  @override
  String get audioBehavior => 'Audio Behavior';

  @override
  String get downmixToStereo => 'Downmix to Stereo';

  @override
  String get defaultAudioLanguage => 'كۆڭۈلدىكى ئاۋاز تىلى';

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
  String get autoServerDefault => 'ئاپتوماتىك (مۇلازىمېتىر سۈكۈتتىكى)';

  @override
  String get english => 'ئىنگىلىزچە';

  @override
  String get spanish => 'ئىسپانچە';

  @override
  String get french => 'فىرانسۇزچە';

  @override
  String get german => 'German';

  @override
  String get italian => 'Italian';

  @override
  String get portuguese => 'پورتۇگال تىلى';

  @override
  String get japanese => 'ياپون';

  @override
  String get korean => 'كورېيە';

  @override
  String get chinese => 'خەنزۇچە';

  @override
  String get russian => 'رۇسچە';

  @override
  String get arabic => 'ئەرەبچە';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'گوللاندىيە';

  @override
  String get swedish => 'شىۋىتسىيە';

  @override
  String get norwegian => 'نورۋېگچە';

  @override
  String get danish => 'Danish';

  @override
  String get finnish => 'فىنلاندىيە';

  @override
  String get polish => 'پولشا';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'TrueHD قوللاش';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ئاۋاز پەقەت AVR غا; قوبۇللىغۇچنى قوللاش ۋە DTS مەنبە يولىنى تەلەپ قىلىدۇ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ئاۋازىنى قوزغىتىڭ (بارلىق سۇپىلاردا ئىشلىمەسلىكى مۇمكىن)';

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
  String get nightMode => 'Night Mode';

  @override
  String get compressDynamicRange => 'ھەرىكەتچان دائىرىنى پىرىسلاش';

  @override
  String get advancedMpv => 'ئىلغار mpv';

  @override
  String get enableCustomMpvConf => 'Custom mpv.conf نى قوزغىتىڭ';

  @override
  String get applyMpvConfBeforePlayback =>
      'قويۇش باشلىنىشتىن بۇرۇن ئىشلەتكۈچى بەلگىلىگەن mpv.conf نى ئىشلىتىڭ';

  @override
  String get unsafeAdvancedMpvOptions => 'بىخەتەر ئىلغار mpv تاللانمىلىرى';

  @override
  String get unsafeMpvOptionsDescription =>
      'تېخىمۇ كەڭ بولغان mpv تاللانمىلىرىغا يول قويۇڭ. ئويناش ھەرىكىتىنى بۇزۇشى مۇمكىن.';

  @override
  String get hardwareDecoding => 'قاتتىق دېتال يېشىش';

  @override
  String get hardwareDecodingSubtitle =>
      'ئىقتىدارنى ئۆستۈرۈشى مۇمكىن ، ئەمما بەزى ئۈسكۈنىلەردە قويۇش مەسىلىسى كېلىپ چىقىشى مۇمكىن.';

  @override
  String get nextUpAndQueuing => 'كېيىنكى Up & ئۆچرەت';

  @override
  String get nextUpDisplay => 'Next Up Display';

  @override
  String get extended => 'كېڭەيتىلگەن';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Next Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'مېدىيا ئۆچرەت';

  @override
  String get autoQueueNextEpisodes => 'كېيىنكى بۆلەكلەر ئاپتوماتىك ئۆچرەت';

  @override
  String get stillWatchingPrompt => 'يەنىلا كۆزىتىۋاتىدۇ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'ئەسلىگە كەلتۈرۈش ۋە ئاتلاش';

  @override
  String get resumeRewind => 'ئەسلىگە كەلتۈرۈش';

  @override
  String get unpauseRewind => 'Rewind نى توختىتىڭ';

  @override
  String get fiveSeconds => '5 سېكۇنت';

  @override
  String get tenSeconds => '10 سېكۇنت';

  @override
  String get fifteenSeconds => '15 سېكۇنت';

  @override
  String get thirtySeconds => '30 سېكۇنت';

  @override
  String get skipBackLength => 'كەينىگە قايتىش';

  @override
  String get skipForwardLength => 'ئالغا ئىلگىرىلەش ئۇزۇنلۇقىدىن ئاتلاڭ';

  @override
  String get customMpvConfPath => 'Custom __ARB_TERM_0 __. يول';

  @override
  String get notSetMpvConf =>
      'تەڭشەلمىدى. Moonfin ئەپ / سانلىق مەلۇمات قىسقۇچتا سۈكۈتتىكى mpv.conf نى سىنايدۇ.';

  @override
  String get selectMpvConf => '__ARB_TERM_0 __ نى تاللاڭ';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'ئۇسلۇب تەڭشىكى (چوڭ-كىچىكلىكى ، رەڭگى ، offset) تېكىستنى ئاساس قىلغان تارماق مەزمۇنلارغا ئىشلىتىلىدۇ (SRT, VTT, TTML). «ASS / SSA Direct Play» ئېتىۋېتىلمىسە ، ASS / SSA تارماق تېمىسى ئۆزىگە قىستۇرۇلغان ئۇسلۇبنى ئىشلىتىدۇ. Bitmap subtitles (PGS, DVB, VobSub) نى ئەسلىگە كەلتۈرگىلى بولمايدۇ.';

  @override
  String get defaultSubtitleLanguage => 'سۈكۈتتىكى تېما تىلى';

  @override
  String get defaultToNoSubtitles => 'سۈكۈتتىكى مەزمۇن يوق';

  @override
  String get turnOffSubtitlesByDefault => 'سۈكۈتتىكى مەزمۇنلارنى ئېتىۋېتىڭ';

  @override
  String get subtitleSize => 'Subtitle Size';

  @override
  String get textFillColor => 'تېكىست تولدۇرۇش رەڭگى';

  @override
  String get backgroundColor => 'تەگلىك رەڭگى';

  @override
  String get textStrokeColor => 'Text Stroke Color';

  @override
  String get subtitleCustomization => 'Subtitle Customization';

  @override
  String get subtitleCustomizationDescription => 'تارماق كۆرۈنۈشنى خاسلاشتۇرۇڭ';

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
      'تېز قوڭۇر تۈلكە ھورۇن ئىتنىڭ ئۈستىگە سەكرىدى';

  @override
  String get verticalOffset => 'Vertical Offset';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'بىۋاسىتە PGS تارماق تېمىسى';

  @override
  String get assSsaDirectPlay => 'ASS / SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles =>
      'بىۋاسىتە ئويناش ASS / SSA تارماق تېما';

  @override
  String get white => 'ئاق';

  @override
  String get black => 'قارا';

  @override
  String get yellow => 'سېرىق';

  @override
  String get green => 'يېشىل';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'قىزىل';

  @override
  String get transparent => 'سۈزۈك';

  @override
  String get semiTransparentBlack => 'يېرىم سۈزۈك قارا';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'ئۈستەل يۈزى';

  @override
  String get mobile => 'كۆچمە';

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
  String get customizationProfile => 'خاسلاشتۇرۇش ئارخىپى';

  @override
  String get customizationProfileDescription =>
      'يۈكلەش ، تەھرىرلەش ۋە ماسقەدەملەش ئۈچۈن ئارخىپنى تاللاڭ. ئۈسكۈنىنىڭ ئارخىپى ئۇنى بېسىپ قويمىسىلا يەرشارى ھەممە يەردە قوللىنىلىدۇ. يېشىل چېكىت نۆۋەتتىكى ئۈسكۈنىنىڭ ئارخىپىنى كۆرسىتىدۇ.';

  @override
  String get loadProfile => 'ئارخىپنى يۈكلەڭ';

  @override
  String get syncing => 'ماسقەدەملەش ...';

  @override
  String get syncToProfile => 'ئارخىپقا ماسقەدەملەش';

  @override
  String get profileSyncHidden => 'ئارخىپ ماسقەدەملەش يوشۇرۇنغان';

  @override
  String get enablePluginSyncDescription =>
      'قىستۇرما تەڭشەكلىرىدە مۇلازىمېتىر قىستۇرما ماسقەدەملەشنى قوزغىتىپ ، بۇ يەردىكى ئارخىپ كونتروللىرىنى كۆرسىتىدۇ.';

  @override
  String get quality => 'سۈپەت';

  @override
  String get defaultDownloadQuality => 'سۈكۈتتىكى چۈشۈرۈش سۈپىتى';

  @override
  String get network => 'تور';

  @override
  String get wifiOnlyDownloads => 'پەقەت WiFi نىلا چۈشۈرۈش';

  @override
  String get onlyDownloadOnWifi => 'پەقەت WiFi غا ئۇلانغاندىلا چۈشۈرۈڭ';

  @override
  String get storage => 'ساقلاش';

  @override
  String get storageUsed => 'ساقلاش بوشلۇقى ئىشلىتىلىدۇ';

  @override
  String get manage => 'باشقۇرۇش';

  @override
  String get calculating => 'ھېسابلاش ...';

  @override
  String get downloadLocation => 'ئورنى چۈشۈرۈڭ';

  @override
  String get defaultLabel => 'سۈكۈتتىكى';

  @override
  String get saveToDownloadsFolder => 'چۈشۈرۈش قىسقۇچىغا ساقلاڭ';

  @override
  String get downloadsVisibleToOtherApps =>
      'چۈشۈرۈش / Moonfin - باشقا ئەپلەرگە كۆرۈنىدۇ';

  @override
  String get dangerZone => 'خەتەر رايونى';

  @override
  String get clearAllDownloads => 'بارلىق چۈشۈرۈشلەرنى تازىلاڭ';

  @override
  String get original => 'ئەسلى';

  @override
  String get changeDownloadLocation => 'چۈشۈرۈش ئورنىنى ئۆزگەرتىش';

  @override
  String get changeDownloadLocationDescription =>
      'يېڭى چۈشۈرۈشلەر تاللانغان ھۆججەت قىسقۇچقا ساقلىنىدۇ. ھازىر بار بولغان چۈشۈرۈشلەر ھازىرقى ئورنىدا ساقلىنىدۇ ، ساقلاش تەڭشىكىدىن باشقۇرغىلى بولىدۇ.';

  @override
  String get confirm => 'جەزملەشتۈرۈڭ';

  @override
  String get cannotWriteToFolder =>
      'تاللانغان قىسقۇچقا يازغىلى بولمايدۇ. باشقا ئورۇننى تاللاڭ ياكى ساقلاش ئىجازەتنامىسى بېرىڭ.';

  @override
  String get saveToDownloadsFolderQuestion => 'چۈشۈرۈش قىسقۇچىغا ساقلامسىز؟';

  @override
  String get saveToDownloadsFolderDescription =>
      'چۈشۈرۈلگەن مېدىيا ئۈسكۈنىڭىزدىكى چۈشۈرۈش / Moonfin غا ساقلىنىدۇ. بۇ ھۆججەتلەر سىزنىڭ رەسىم ئامبىرىڭىز ياكى مۇزىكا قويغۇچ قاتارلىق باشقا ئەپلەرگە كۆرۈنىدۇ.\n\nھازىر بار بولغان چۈشۈرۈشلەر ھازىرقى ئورنىدا قالىدۇ.';

  @override
  String get enable => 'قوزغىتىش';

  @override
  String get clearAllDownloadsWarning =>
      'بۇ چۈشۈرۈلگەن بارلىق مېدىيانى ئۆچۈرۈۋېتىدۇ ، ئەمەلدىن قالدۇرغىلى بولمايدۇ.';

  @override
  String get clearAll => 'ھەممىنى تازىلاش';

  @override
  String get navigationStyle => 'يول باشلاش ئۇسلۇبى';

  @override
  String get topBar => 'ئۈستى بالداق';

  @override
  String get leftSidebar => 'سول تەرەپ يانبالدىقى';

  @override
  String get showShuffleButton => 'Shuffle كۇنۇپكىسىنى كۆرسەت';

  @override
  String get showGenresButton => 'ژانىر كۇنۇپكىسىنى كۆرسەت';

  @override
  String get showFavoritesButton => 'ياقتۇرىدىغان كۇنۇپكىنى كۆرسەت';

  @override
  String get showLibrariesInToolbar => 'قورالبالدىقىدا كۈتۈپخانىلارنى كۆرسەت';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'Navbar Opacity';

  @override
  String get navbarColor => 'Navbar رەڭ';

  @override
  String get gray => 'كۈلرەڭ';

  @override
  String get darkBlue => 'قېنىق كۆك';

  @override
  String get purple => 'بىنەپشە';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'دېڭىز ئارمىيىسى';

  @override
  String get charcoal => 'كۆمۈر';

  @override
  String get brown => 'قوڭۇر';

  @override
  String get darkRed => 'قېنىق قىزىل';

  @override
  String get darkGreen => 'قېنىق يېشىل';

  @override
  String get slate => 'Slate';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'كۈتۈپخانا كۆرسىتىش';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Thumbnail';

  @override
  String get bannerLabel => 'بايراق';

  @override
  String get overridePerLibrarySettings =>
      'كۈتۈپخانىنىڭ تەڭشەكلىرىنى قاپلىۋېتىڭ';

  @override
  String get applyImageTypeToAllLibraries =>
      'رەسىم ئامبىرىنى بارلىق كۈتۈپخانىلارغا ئىشلىتىڭ';

  @override
  String get multiServerLibraries => 'كۆپ مۇلازىمېتىر كۈتۈپخانىلىرى';

  @override
  String get showLibrariesFromAllServers =>
      'بارلىق ئۇلانغان مۇلازىمېتىرلاردىكى كۈتۈپخانىلارنى كۆرسەت';

  @override
  String get enableFolderView => 'ھۆججەت قىسقۇچنى قوزغىتىش';

  @override
  String get showFolderBrowsingOption =>
      'ھۆججەت قىسقۇچنى كۆرۈش تاللانمىسىنى كۆرسەت';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'كۈتۈپخانىنىڭ كۆرۈنۈشچانلىقى';

  @override
  String get libraryVisibilityDescription =>
      'ھەر بىر كۈتۈپخانىنىڭ باش بېتىنىڭ كۆرۈنۈشىنى توغرىلاڭ. ئۆزگەرتىشنىڭ كۈچكە ئىگە بولۇشى ئۈچۈن Moonfin نى قايتا قوزغىتىڭ.';

  @override
  String get showInNavigation => 'يول باشلاش';

  @override
  String get showInLatestMedia => 'ئەڭ يېڭى تاراتقۇلاردا كۆرسىتىڭ';

  @override
  String get sourceLibraries => 'مەنبە كۈتۈپخانىلار';

  @override
  String get sourceCollections => 'مەنبە توپلىمى';

  @override
  String get excludedGenres => 'چىقىرىۋېتىلگەن ژانىرلار';

  @override
  String get selectAll => 'ھەممىنى تاللاڭ';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Media Source';

  @override
  String get behavior => 'ھەرىكەت';

  @override
  String get seconds => 'سېكۇنت';

  @override
  String get localPreviews => 'يەرلىك ئالدىن كۆرۈش';

  @override
  String get localPreviewsDescription =>
      'يوللانما ، مېدىيا ۋە ئاۋازلىق ئالدىن كۆرۈشنى سەپلەڭ.';

  @override
  String get mediaBarMode => 'Media Bar Style';

  @override
  String get mediaBarModeDescription =>
      'Moonfin ، MakD نى تاللاڭ ياكى مېدىيا بالدىقىنى ئېتىۋېتىڭ';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Off';

  @override
  String get enableMediaBar => 'Media Bar نى قوزغىتىڭ';

  @override
  String get showFeaturedContentSlideshow =>
      'ئۆيدە ئالاھىدە مەزمۇن تام تەسۋىرىنى كۆرسىتىڭ';

  @override
  String get contentType => 'مەزمۇن تىپى';

  @override
  String get moviesAndTvShows => 'كىنو ۋە تېلېۋىزىيە پروگراممىلىرى';

  @override
  String get moviesOnly => 'پەقەت كىنو';

  @override
  String get tvShowsOnly => 'پەقەت تېلېۋىزىيە پروگراممىلىرى';

  @override
  String get itemCount => 'تۈر سانى';

  @override
  String get noneSelected => 'ھېچقايسىسى تاللانمىدى';

  @override
  String get noneExcluded => 'ھېچكىم چىقىرىۋېتىلمىدى';

  @override
  String get autoAdvance => 'Auto Advance';

  @override
  String get autoAdvanceSlides =>
      'كېيىنكى تام تەسۋىرگە ئاپتوماتىك ئىلگىرىلەيدۇ';

  @override
  String get autoAdvanceInterval => 'ئاپتوماتىك ئىلگىرىلەش ئارىلىقى';

  @override
  String get trailerPreview => 'Trailer Preview';

  @override
  String get autoPlayTrailers =>
      'مېدىيا ستونىدا 3 سېكۇنتتىن كېيىن ئاپتوماتىك ئويناش';

  @override
  String get episodePreview => 'Episode Preview';

  @override
  String get mediaPreview => 'مېدىيا ئالدىن كورۇش';

  @override
  String get episodePreviewDescription =>
      'فوكۇسلانغان ، يانتۇ ياكى ئۇزۇن بېسىلغان كارتىلاردا 30 سېكۇنتلۇق ئالدىن كۆرۈشنى ئويناڭ';

  @override
  String get mediaPreviewDescription =>
      'فوكۇسلانغان ، يانتۇ ياكى ئۇزۇن بېسىلغان كارتىلاردا 30 سېكۇنتلۇق ئالدىن كۆرۈشنى ئويناڭ';

  @override
  String get previewAudio => 'ئالدىن كۆرۈش';

  @override
  String get enablePreviewAudio =>
      'يوللانما ۋە بۆلەكلەرنى ئالدىن كۆرۈش ئۈچۈن ئاۋاز قوزغىتىڭ';

  @override
  String get latestMedia => 'ئەڭ يېڭى مېدىيا';

  @override
  String get recentlyReleased => 'يېقىندا ئېلان قىلىندى';

  @override
  String get myMedia => 'مېنىڭ مېدىيا';

  @override
  String get myMediaSmall => 'مېنىڭ مېدىيا (كىچىك)';

  @override
  String get continueWatching => 'داۋاملىق كۆزىتىڭ';

  @override
  String get resumeAudio => 'ئاۋازنى ئەسلىگە كەلتۈرۈش';

  @override
  String get resumeBooks => 'كىتابلارنى ئەسلىگە كەلتۈرۈش';

  @override
  String get activeRecordings => 'ئاكتىپ خاتىرىلەر';

  @override
  String get playlists => 'قويۇش تىزىملىكى';

  @override
  String get liveTV => 'Live TV';

  @override
  String get homeSections => 'ئائىلە بۆلەكلىرى';

  @override
  String get resetToDefaults => 'سۈكۈتتىكى ھالەتكە قايتىڭ';

  @override
  String get homeRowPosterSize => 'Home Row Poster Size';

  @override
  String get perRowImageTypeSelection => 'ھەر بىر قۇر رەسىم تىپى تاللاش';

  @override
  String get configureImageTypeForEachRow =>
      'ھەر بىر قوزغىتىلغان ئائىلە قۇرنىڭ رەسىم تىپىنى سەپلەڭ';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'بىرلەشتۈرۈش داۋاملىق كۆزىتىش ۋە كېيىنكى باسقۇچ';

  @override
  String get combineBothRows => 'ھەر ئىككى قۇرنى بىر ئۆي بۆلىكىگە بىرلەشتۈرۈڭ';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'ھەر بىر قۇر رەسىم تىپى';

  @override
  String get perRowSettings => 'ھەر بىر قۇر تەڭشىكى';

  @override
  String get autoLogin => 'ئاپتوماتىك كىرىش';

  @override
  String get lastUser => 'ئاخىرقى ئىشلەتكۈچى';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'ھەمىشە دەلىللەش';

  @override
  String get requirePasswordWithToken =>
      'ساقلانغان بەلگە بىلەنمۇ پارول تەلەپ قىلىڭ';

  @override
  String get confirmExit => 'چېكىنىشنى جەزملەشتۈرۈڭ';

  @override
  String get showConfirmationBeforeExiting =>
      'چىقىشتىن بۇرۇن جەزملەشتۈرۈشنى كۆرسىتىڭ';

  @override
  String get blockContentWithRatings => 'تۆۋەندىكى باھا بىلەن مەزمۇننى چەكلەڭ:';

  @override
  String get noContentRatingsFound =>
      'بۇ مۇلازىمېتىردا ھېچقانداق مەزمۇن دەرىجىسى تېپىلمىدى.';

  @override
  String get couldNotLoadServerRatings =>
      'مۇلازىمېتىر دەرىجىسىنى يۈكلىيەلمىدى. پەقەت ساقلانغان باھانىلا كۆرسىتىش.';

  @override
  String get couldNotRefreshRatings =>
      'مۇلازىمېتىرنىڭ باھاسىنى يېڭىلىيالمىدى. ساقلانغان باھانى كۆرسىتىش.';

  @override
  String get enablePinCode => 'PIN كودىنى قوزغىتىڭ';

  @override
  String get requirePinToAccess => 'ھېساباتىڭىزغا كىرىش ئۈچۈن PIN تەلەپ قىلىڭ';

  @override
  String get changePin => 'PIN نى ئۆزگەرتىڭ';

  @override
  String get setNewPinCode => 'يېڭى PIN كودى بەلگىلەڭ';

  @override
  String get removePin => 'PIN نى ئۆچۈرۈڭ';

  @override
  String get removePinProtection => 'PIN كود قوغداشنى ئۆچۈرۈڭ';

  @override
  String get screensaver => 'ئېكران ئېكرانى';

  @override
  String get inAppScreensaver => 'App-Screenaver';

  @override
  String get enableBuiltInScreensaver => 'قاچىلانغان ئېكراننى قوزغىتىڭ';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'كۈتۈپخانا سەنئىتى';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'سائەت';

  @override
  String get timeout => 'ۋاقىت';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Dimming Level';

  @override
  String get maxAgeRating => 'Max Age Rating';

  @override
  String get any => 'ھەر قانداق';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'ياش دەرىجىسىنى تەلەپ قىلىڭ';

  @override
  String get onlyShowRatedContent => 'پەقەت باھالانغان مەزمۇننىلا كۆرسىتىدۇ';

  @override
  String get showClock => 'سائەتنى كۆرسىتىش';

  @override
  String get displayClockDuringScreensaver =>
      'ئېكران ئېكرانىدا سائەتنى كۆرسىتىش';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'چىرىگەن پەمىدۇر (تەنقىدچىلەر)';

  @override
  String get rottenTomatoesAudience => 'چىرىگەن پەمىدۇر (تاماشىبىنلار)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (ئىشلەتكۈچى)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'خەت ساندۇقى';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'مەھەللە دەرىجىسى';

  @override
  String get ratings => 'Ratings';

  @override
  String get additionalRatings => 'قوشۇمچە باھا';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList ۋە TMDB دەرىجىسىنى كۆرسەت';

  @override
  String get ratingLabels => 'باھا بەلگىسى';

  @override
  String get showLabelsNextToIcons =>
      'باھالاش سىنبەلگىسىنىڭ يېنىدىكى بەلگىلەرنى كۆرسەت';

  @override
  String get ratingBadges => 'باھا بەلگىسى';

  @override
  String get showDecorativeBadges =>
      'باھانىڭ ئارقىسىدىكى بېزەك بەلگىسىنى كۆرسىتىڭ';

  @override
  String get episodeRatings => 'Episode Ratings';

  @override
  String get showRatingsOnEpisodes => 'ئايرىم بۆلەكلەرگە باھا كۆرسەت';

  @override
  String get ratingSources => 'باھا مەنبەسى';

  @override
  String get ratingSourcesDescription =>
      'پۈتۈن دېتالدا كۆرسىتىلگەن باھالاش مەنبەلىرىنى قوزغىتىڭ ۋە رەتلەڭ';

  @override
  String get pluginLabel => 'قىستۇرما';

  @override
  String get pluginDetected => 'قىستۇرما بايقالدى';

  @override
  String get pluginNotDetected => 'قىستۇرما بايقالمىدى';

  @override
  String get pluginDetectedDescription =>
      'مۇلازىمېتىر قىستۇرمىسى بايقالدى. قىستۇرما تۇنجى قېتىم تېپىلغاندا ماسقەدەملەش ئاپتوماتىك قوزغىتىلىدۇ.';

  @override
  String get pluginNotDetectedDescription =>
      'مۇلازىمېتىر قىستۇرمىسى ھازىرچە بايقالمىدى. يەرلىك تەڭشەكلەر يەنىلا ساقلانغان قىممەتلىرىنى ياكى كۆڭۈلدىكى كۆڭۈلدىكى قىممەتنى ئىشلىتىدۇ.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'ئىشلەتكىلى بولىدىغان مۇلازىمەتلەر';

  @override
  String get serverPluginSync => 'مۇلازىمېتىر قىستۇرمىسى ماسقەدەملەش';

  @override
  String get syncSettingsWithPlugin =>
      'مۇلازىمېتىر قىستۇرمىسى بىلەن تەڭشەكلەرنى ماسقەدەملەڭ';

  @override
  String get whatSyncControls => 'ماسقەدەملەشنى كونترول قىلىدۇ';

  @override
  String get syncControlsDescription =>
      'ماسقەدەملەش پەقەت قىستۇرما قوللايدىغان تەڭشەكلەرنىڭ مۇلازىمېتىرغا ئىتتىرىلىپ تارتىپ چىقىرىلىشىنى كونترول قىلىدۇ. قىستۇرما ماسقەدەملەش قوزغىتىلغاندا ئارخىپ تاللاش ۋە ئارخىپ ماسقەدەملەش ھەرىكىتى خاسلاشتۇرۇش تەڭشىكىدە بولىدۇ.';

  @override
  String get recentRequests => 'يېقىنقى تەلەپلەر';

  @override
  String get recentlyAdded => 'يېقىندا قوشۇلدى';

  @override
  String get trending => 'يۈزلىنىش';

  @override
  String get popularMovies => 'داڭلىق كىنولار';

  @override
  String get movieGenres => 'Movie Genres';

  @override
  String get upcomingMovies => 'كەلگۈسىدىكى كىنولار';

  @override
  String get studios => 'Studios';

  @override
  String get popularSeries => 'ئاممىباب يۈرۈشلۈكلىرى';

  @override
  String get seriesGenres => 'Series Genres';

  @override
  String get upcomingSeries => 'كېلەچەك';

  @override
  String get networks => 'تور';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'قۇرلارنى سۈكۈتتىكى ھالەتكە قايتۇرۇش';

  @override
  String get enableSeerr => 'Seerr نى قوزغىتىڭ';

  @override
  String get showSeerrInNavigation =>
      'يول باشلاشتا Seerr نى كۆرسەت (مۇلازىمېتىر قىستۇرمىسىنى تەلەپ قىلىدۇ)';

  @override
  String get seerrUnavailable =>
      'مۇلازىمېتىر قىستۇرمىسى Seerr قوللاش ئىقتىدارى چەكلەنگەنلىكى ئۈچۈن ئىشلەتكىلى بولمايدۇ.';

  @override
  String get nsfwFilter => 'NSFW سۈزگۈچ';

  @override
  String get hideAdultContent => 'نەتىجىدە چوڭلارنىڭ مەزمۇنىنى يوشۇرۇش';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'قۇرلارنى بايقاش';

  @override
  String get discoverRowsDescriptionPlugin =>
      'قايتا تەرتىپكە سېلىش. قۇرلارنى قوزغىتىش ياكى چەكلەش. Moonfin قىستۇرمىسى بىلەن قۇر رەت تەرتىپى ماسقەدەملىنىدۇ.';

  @override
  String get discoverRowsDescription =>
      'قايتا تەرتىپكە سېلىش. قۇرلارنى قوزغىتىش ياكى چەكلەش.';

  @override
  String get enabled => 'قوزغىتىلدى';

  @override
  String get hidden => 'يۇشۇرۇن';

  @override
  String get aboutTitle => 'ھەققىدە';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'ئوچۇق كود ئىجازەتنامىسى';

  @override
  String get sourceCode => 'مەنبە كودى';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'يېڭىلانمىلارنى تەكشۈرۈڭ';

  @override
  String get checksLatestDesktopRelease =>
      'بۇ سۇپىنىڭ ئەڭ يېڭى ئۈستەل يۈزى ئېلان قىلىنىشىنى تەكشۈرىدۇ';

  @override
  String get youAreUpToDate => 'سىز ئەڭ يېڭى.';

  @override
  String get couldNotCheckForUpdates => 'ھازىر يېڭىلانمىلارنى تەكشۈرەلمىدىم.';

  @override
  String get noCompatibleUpdate =>
      'بۇ سۇپىغا ماس كېلىدىغان يېڭىلاش بولىقى تېپىلمىدى.';

  @override
  String get updateChecksNotSupported =>
      'يېڭىلاش تەكشۈرۈشى بۇ سۇپىدا قوللىمايدۇ.';

  @override
  String get updateNotificationsDisabled => 'يېڭىلاش ئۇقتۇرۇشى چەكلەنگەن.';

  @override
  String get pleaseWaitBeforeChecking =>
      'قايتا تەكشۈرۈشتىن بۇرۇن ساقلاپ تۇرۇڭ.';

  @override
  String get latestUpdateAlreadyShown =>
      'ئەڭ يېڭى يېڭىلاش ئاللىبۇرۇن كۆرسىتىلدى.';

  @override
  String get updateAvailable => 'يېڭىلاشنى ئىشلەتكىلى بولىدۇ.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'ئۇقتۇرۇشلارنى يېڭىلاش';

  @override
  String get showWhenUpdatesAvailable =>
      'يېڭىلانمىلارنىڭ قاچان بولىدىغانلىقىنى كۆرسىتىڭ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'ئېلان قىلىش خاتىرىسىنى ئوقۇڭ';

  @override
  String get downloadingUpdate => 'يېڭىلاشنى چۈشۈرۈش ...';

  @override
  String get updateDownloadFailed =>
      'چۈشۈرۈش چۈشۈرۈش مەغلۇب بولدى. قايتا سىناڭ.';

  @override
  String get openReleasesPage => 'ئېلان قىلىش بېتى';

  @override
  String get navigation => 'يول باشلاش';

  @override
  String get watchedIndicatorsBackdrops =>
      'كۆزىتىلگەن كۆرسەتكۈچ ، ئارقا كۆرۈنۈش';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'فوكۇس رەڭ ، كۆزىتىلگەن كۆرسەتكۈچ ، ئارقا كۆرۈنۈش';

  @override
  String get navbarStyleToolbarAppearance =>
      'يولباشچى ئۇسلۇبى ، قورالبالدىقى كۇنۇپكىسى ، كۆرۈنۈشى';

  @override
  String get reorderToggleHomeRows => 'ئۆي قۇرلىرىنى رەتلەش ۋە ئالماشتۇرۇش';

  @override
  String get featuredContentAppearance => 'ئالاھىدە مەزمۇن ، كۆرۈنۈش';

  @override
  String get posterSizeImageTypeFolderView =>
      'ئېلاننىڭ چوڭلۇقى ، رەسىم تىپى ، ھۆججەت قىسقۇچ كۆرۈنۈشى';

  @override
  String get mdbListTmdbRatingSources => 'MDBList ، TMDB ۋە باھالاش مەنبەسى';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ئېنىق';

  @override
  String get browse => 'توركۆرگۈ';

  @override
  String get noResults => 'ھېچقانداق نەتىجە يوق';

  @override
  String get seerrAvailableStatus => 'ئىشلەتكىلى بولىدۇ';

  @override
  String get seerrRequestedStatus => 'تەلەپ قىلىندى';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr تەڭشەكلىرى';

  @override
  String get requestMore => 'تېخىمۇ كۆپ تەلەپ';

  @override
  String get request => 'تەلەپ';

  @override
  String get cancelRequest => 'تەلەپنى بىكار قىلىش';

  @override
  String get playInMoonfin => 'Moonfin دە ئويناڭ';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'تەستىق';

  @override
  String get declineAction => 'رەت قىلىش';

  @override
  String get similar => 'مۇشۇنىڭغا ئوخشاش';

  @override
  String get recommendations => 'تەۋسىيە';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'ساقلاڭ';

  @override
  String get itemNotFoundInLibrary => 'Moonfin كۈتۈپخانىسىدا تېپىلمىغان تۈر';

  @override
  String get errorSearchingLibrary => 'كۈتۈپخانىنى ئىزدەشتە خاتالىق';

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
  String get submitRequest => 'تەلەپنى يوللاش';

  @override
  String get allSeasons => 'بارلىق پەسىللەر';

  @override
  String get advancedOptions => 'Advanced Options';

  @override
  String get noServiceServersConfigured => 'ھېچقانداق مۇلازىمېتىر سەپلەنمىگەن';

  @override
  String get server => 'مۇلازىمېتىر';

  @override
  String get qualityProfile => 'سۈپەت ئارخىپى';

  @override
  String get rootFolder => 'Root Folder';

  @override
  String get showMore => 'تېخىمۇ كۆپ كۆرسىتىش';

  @override
  String get appearances => 'تاشقى كۆرۈنۈش';

  @override
  String get crewSection => 'Crew';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'تەلەپ يوق';

  @override
  String get pendingStatus => 'ساقلىنىۋاتىدۇ';

  @override
  String get declinedStatus => 'رەت قىلىندى';

  @override
  String get partiallyAvailable => 'قىسمەن ئىشلەتكىلى بولىدۇ';

  @override
  String get downloadingStatus => 'چۈشۈرۈش';

  @override
  String get approvedStatus => 'تەستىقلاندى';

  @override
  String get notRequestedStatus => 'تەلەپ قىلىنمايدۇ';

  @override
  String get blocklistedStatus => 'چەكلەنگەن';

  @override
  String get deletedStatus => 'ئۆچۈرۈلدى';

  @override
  String get tmdbScore => 'TMDB نومۇر';

  @override
  String get releaseDateLabel => 'ئېلان قىلىنغان ۋاقىت';

  @override
  String get firstAirDateLabel => 'تۇنجى ھاۋا ۋاقتى';

  @override
  String get revenueLabel => 'كىرىم';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'خامچوت';

  @override
  String get originalLanguageLabel => 'ئەسلى تىل';

  @override
  String get seasonsLabel => 'پەسىللەر';

  @override
  String get episodesLabel => 'Episodes';

  @override
  String get access => 'زىيارەت';

  @override
  String get add => 'قوش';

  @override
  String get address => 'ئادرېس';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'مۇندەرىجە';

  @override
  String get content => 'مەزمۇن';

  @override
  String get copy => 'كۆچۈرۈڭ';

  @override
  String get create => 'قۇرۇش';

  @override
  String get disable => 'چەكلەش';

  @override
  String get done => 'تامام';

  @override
  String get edit => 'تەھرىر';

  @override
  String get encoding => 'كودلاش';

  @override
  String get error => 'خاتالىق';

  @override
  String get forward => 'ئالدىغا';

  @override
  String get general => 'General';

  @override
  String get go => 'كەت';

  @override
  String get install => 'قاچىلاش';

  @override
  String get installed => 'قاچىلاندى';

  @override
  String get interval => 'ئارىلىق';

  @override
  String get name => 'ئىسمى';

  @override
  String get networking => 'تور';

  @override
  String get next => 'كېيىنكى';

  @override
  String get path => 'Path';

  @override
  String get paused => 'توختاپ قالدى';

  @override
  String get permissions => 'ئىجازەت';

  @override
  String get processing => 'بىر تەرەپ قىلىش';

  @override
  String get profile => 'ئارخىپ';

  @override
  String get provider => 'تەمىنلىگۈچى';

  @override
  String get refresh => 'يېڭىلاش';

  @override
  String get remote => 'Remote';

  @override
  String get rename => 'ئىسىم ئۆزگەرتىش';

  @override
  String get revoke => 'بىكار قىلىش';

  @override
  String get role => 'رولى';

  @override
  String get root => 'يىلتىز';

  @override
  String get run => 'ئىجرا';

  @override
  String get search => 'ئىزدەش';

  @override
  String get select => 'تاللاڭ';

  @override
  String get send => 'ئەۋەتىڭ';

  @override
  String get sessions => 'يىغىن';

  @override
  String get set => 'Set';

  @override
  String get status => 'ھالەت';

  @override
  String get stop => 'توختاڭ';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'ۋاقىت';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'ئۆچۈرۈۋېتىڭ';

  @override
  String get up => 'Up';

  @override
  String get update => 'يېڭىلاش';

  @override
  String get upload => 'يۈكلەش';

  @override
  String get unmute => 'Unmute';

  @override
  String get mute => 'Mute';

  @override
  String get branding => 'ماركا';

  @override
  String get adminDrawerDashboard => 'باش تاختا';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'تەڭشەك';

  @override
  String get adminDrawerBranding => 'ماركا';

  @override
  String get adminDrawerUsers => 'ئىشلەتكۈچى';

  @override
  String get adminDrawerLibraries => 'كۈتۈپخانىلار';

  @override
  String get adminDrawerTranscoding => 'Transcoding';

  @override
  String get adminDrawerResume => 'ئەسلىگە كەلتۈرۈش';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'ئۈسكۈنىلەر';

  @override
  String get adminDrawerActivity => 'پائالىيەت';

  @override
  String get adminDrawerNetworking => 'تور';

  @override
  String get adminDrawerApiKeys => 'API ئاچقۇچ';

  @override
  String get adminDrawerBackups => 'زاپاسلاش';

  @override
  String get adminDrawerLogs => 'خاتىرە';

  @override
  String get adminDrawerScheduledTasks => 'پىلانلانغان ۋەزىپە';

  @override
  String get adminDrawerPlugins => 'قىستۇرمىلار';

  @override
  String get adminDrawerRepositories => 'ئامبار';

  @override
  String get adminDrawerLiveTv => 'Live TV';

  @override
  String get adminExitTooltip => 'باشقۇرغۇچىدىن چېكىنىش';

  @override
  String get adminDashboardLoadFailed => 'باشقۇرۇش تاختىسىنى يۈكلىيەلمىدى';

  @override
  String get adminMediaOverview => 'Media Overview';

  @override
  String get adminMediaTotalsError =>
      'مۇلازىمېتىر مېدىيا ئومۇمىي مىقدارىنى يۈكلىيەلمىدى.';

  @override
  String get adminMediaOverviewSubtitle =>
      'بۇ مۇلازىمېتىردا قانچىلىك مەزمۇن بارلىقىنى تېز ئوقۇڭ.';

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
  String get analyticsMediaDistribution => 'Media Distribution';

  @override
  String get analyticsVideoCodecs => 'Video Codecs';

  @override
  String get analyticsAudioCodecs => 'Audio Codecs';

  @override
  String get analyticsContainers => 'كونتېينېر';

  @override
  String get analyticsTopGenres => 'Top Genres';

  @override
  String get analyticsReleaseYears => 'يىللارنى قويۇپ بېرىش';

  @override
  String get analyticsContentRatings => 'مەزمۇن دەرىجىسى';

  @override
  String get analyticsRuntimeBuckets => 'Runtime Buckets';

  @override
  String get analyticsFileFormats => 'ھۆججەت فورماتى';

  @override
  String get analyticsNoData => 'سانلىق مەلۇمات يوق.';

  @override
  String get adminServerInfo => 'مۇلازىمېتىر ئۇچۇرى';

  @override
  String get adminRestartPending => 'ساقلىنىۋاتىدۇ';

  @override
  String get adminServerPaths => 'مۇلازىمېتىر يوللىرى';

  @override
  String get adminServerActions => 'مۇلازىمېتىر ھەرىكىتى';

  @override
  String get adminRestartServer => 'مۇلازىمېتىرنى قايتا قوزغىتىڭ';

  @override
  String get adminShutdownServer => 'مۇلازىمېتىرنى تاقاش';

  @override
  String get adminScanLibraries => 'كۈتۈپخانىلارنى سايىلەڭ';

  @override
  String get adminLibraryScanStarted => 'كۈتۈپخانىنى تەكشۈرۈش باشلاندى';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'مۇلازىمېتىر قايتا قوزغىتىلىۋاتىدۇ';

  @override
  String get adminServerRebootMessage =>
      'مۇلازىمېتىرنى قايتا قوزغىتىش باسقۇچىدا ، Moonfin نى قايتا قوزغىتىڭ';

  @override
  String get adminActiveSessions => 'ئاكتىپ يىغىن';

  @override
  String get adminSessionsLoadFailed => 'ئولتۇرۇشنى يۈكلىيەلمىدى';

  @override
  String get adminNoActiveSessions => 'ئاكتىپ يىغىن يوق';

  @override
  String get adminRecentActivity => 'يېقىنقى پائالىيەت';

  @override
  String get adminNoRecentActivity => 'يېقىنقى پائالىيەت يوق';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'ئۇچۇر ئەۋەتىش';

  @override
  String get adminMessageTextHint => 'ئۇچۇر تېكىستى';

  @override
  String get adminSetVolume => 'ھەجىمىنى تەڭشەش';

  @override
  String get sessionPrev => 'ئالدىنقى';

  @override
  String get sessionRewind => 'مۇكاپاتلاش';

  @override
  String get sessionForward => 'ئالدىغا';

  @override
  String get sessionNext => 'كېيىنكى';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ھازىر ئويناۋاتىدۇ';

  @override
  String get volume => 'ھەجىم';

  @override
  String get actions => 'ھەرىكەتلەر';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Audio Codec';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'تامام';

  @override
  String get direct => 'بىۋاسىتە';

  @override
  String get adminDisconnect => 'ئۈزۈڭ';

  @override
  String get adminClearDates => 'چېسلانى ئېنىقلاش';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'ھېچقانداق پائالىيەت تۈرى يوق';

  @override
  String get adminEditDeviceName => 'ئۈسكۈنىنىڭ نامىنى تەھرىرلەش';

  @override
  String get adminCustomName => 'Custom Name';

  @override
  String get adminDeviceNameUpdated => 'ئۈسكۈنىنىڭ ئىسمى يېڭىلاندى';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'ئۈسكۈنىنى ئۆچۈرۈڭ';

  @override
  String get adminDeviceDeleted => 'ئۈسكۈنى ئۆچۈرۈلدى';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'ئۈسكۈنىلەرنى يۈكلىيەلمىدى';

  @override
  String get adminSearchDevices => 'ئىزدەش ئۈسكۈنىلىرى';

  @override
  String get adminThisDevice => 'بۇ ئۈسكۈنە';

  @override
  String get adminEditName => 'ئىسىمنى تەھرىرلەش';

  @override
  String get adminLibrariesLoadFailed => 'كۈتۈپخانىلارنى يۈكلىيەلمىدى';

  @override
  String get adminNoLibraries => 'كۈتۈپخانىلار سەپلەنمىدى';

  @override
  String get adminScanAllLibraries => 'بارلىق كۈتۈپخانىلارنى سايىلەڭ';

  @override
  String get adminAddLibrary => 'كۈتۈپخانىنى قوشۇڭ';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'كۈتۈپخانىنىڭ نامىنى ئۆزگەرتىڭ';

  @override
  String get adminNewName => 'يېڭى ئىسىم';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'كۈتۈپخانىنى ئۆچۈرۈڭ';

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
  String get adminRemovePath => 'يولنى ئۆچۈرۈڭ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'كۈتۈپخانىنىڭ تاللانمىلىرى ساقلاندى';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'كۈتۈپخانىنى يۈكلىيەلمىدى';

  @override
  String get adminNoMediaPaths => 'ھېچقانداق مېدىيا يولى سەپلەنمىدى';

  @override
  String get adminAddPath => 'يول قوشۇڭ';

  @override
  String get adminBrowseFilesystem => 'مۇلازىمېتىر ھۆججەت سىستېمىسىنى كۆرۈڭ:';

  @override
  String get adminSaveOptions => 'تاللانمىلارنى ساقلاش';

  @override
  String get adminPreferredMetadataLanguage =>
      'ياقتۇرىدىغان مېتا سانلىق مەلۇمات تىلى';

  @override
  String get adminMetadataLanguageHint => 'مەسىلەن en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata دۆلەت كودى';

  @override
  String get adminMetadataCountryHint => 'مەسىلەن US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'كۈتۈپخانىنىڭ ئىسمى تەلەپ قىلىنىدۇ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'كۈتۈپخانىنىڭ ئىسمى';

  @override
  String get adminSelectedPaths => 'تاللانغان يوللار:';

  @override
  String get adminNoPathsAdded =>
      'ھېچقانداق يول قوشۇلمىدى (كېيىن قوشقىلى بولىدۇ)';

  @override
  String get adminCreateLibrary => 'كۈتۈپخانا قۇرۇش';

  @override
  String get paths => 'يول:';

  @override
  String get adminDisableUser => 'ئىشلەتكۈچىنى چەكلەش';

  @override
  String get adminEnableUser => 'ئىشلەتكۈچىنى قوزغىتىش';

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
  String get adminUsersLoadFailed => 'ئىشلەتكۈچىنى يۈكلىيەلمىدى';

  @override
  String get adminSearchUsers => 'ئىشلەتكۈچىنى ئىزدە';

  @override
  String get adminEditUser => 'ئىشلەتكۈچىنى تەھرىرلەش';

  @override
  String get adminAddUser => 'ئىشلەتكۈچى قوشۇڭ';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'ئىشلەتكۈچى قۇرۇش';

  @override
  String get adminPasswordOptional => 'پارول (ئىختىيارى)';

  @override
  String get adminUsernameRequired => 'ئىشلەتكۈچى ئىسمى قۇرۇق بولمايدۇ';

  @override
  String get adminNoProfileChanges => 'ساقلاشقا ھېچقانداق ئارخىپ ئۆزگەرمەيدۇ';

  @override
  String get adminProfileSaved => 'ئارخىپ ساقلاندى';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'ئىجازەتلەر ساقلاندى';

  @override
  String get adminPasswordsMismatch => 'پارول ماس كەلمەيدۇ';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'ئىشلەتكۈچىنى يۈكلىيەلمىدى';

  @override
  String get adminBackToUsers => 'ئىشلەتكۈچىگە قايتىش';

  @override
  String get adminSaveProfile => 'ئارخىپنى ساقلاش';

  @override
  String get adminDeleteUser => 'ئىشلەتكۈچىنى ئۆچۈرۈڭ';

  @override
  String get admin => 'باشقۇرغۇچى';

  @override
  String get adminFullAccessWarning =>
      'باشقۇرغۇچى مۇلازىمېتىرنى تولۇق زىيارەت قىلالايدۇ. ئېھتىيات بىلەن بېرىڭ.';

  @override
  String get administrator => 'باشقۇرغۇچى';

  @override
  String get adminHiddenUser => 'يوشۇرۇن ئىشلەتكۈچى';

  @override
  String get adminAllowMediaPlayback => 'مېدىيا قويۇشقا يول قويۇڭ';

  @override
  String get adminAllowAudioTranscoding => 'ئاۋازنىڭ كودلىنىشىغا يول قويۇڭ';

  @override
  String get adminAllowVideoTranscoding => 'سىننىڭ يۆتكىلىشىگە يول قويۇڭ';

  @override
  String get adminAllowRemuxing => 'قايتا ئىشلەشكە يول قويۇڭ';

  @override
  String get adminForceRemoteTranscoding =>
      'يىراق مۇساپىلىك مەنبەدىن ھالقىشنى زورلاش';

  @override
  String get adminAllowContentDeletion => 'مەزمۇننى ئۆچۈرۈشىگە يول قويۇڭ';

  @override
  String get adminAllowContentDownloading => 'مەزمۇن چۈشۈرۈشكە يول قويۇڭ';

  @override
  String get adminAllowPublicSharing => 'ئاممىۋى ئورتاقلىشىشقا يول قويۇڭ';

  @override
  String get adminAllowRemoteControl =>
      'باشقا ئىشلەتكۈچىلەرنىڭ يىراقتىن كونترول قىلىشىغا يول قويۇڭ';

  @override
  String get adminAllowSharedDeviceControl =>
      'ئورتاق ئۈسكۈنىنى كونترول قىلىشقا يول قويۇڭ';

  @override
  String get adminAllowRemoteAccess => 'يىراقتىن زىيارەت قىلىشقا يول قويۇڭ';

  @override
  String get adminRemoteBitrateLimit => 'يىراقتىكى خېرىدار بىت چەكلىمىسى (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'چەكسىز بوش قويۇڭ';

  @override
  String get adminMaxActiveSessions => 'ئاكتىپ يىغىنلار';

  @override
  String get adminAllowLiveTvAccess => 'Live TV زىيارەت قىلىشىغا يول قويۇڭ';

  @override
  String get adminAllowLiveTvManagement =>
      'نەق مەيدان تېلېۋىزىيە باشقۇرۇشىغا يول قويۇڭ';

  @override
  String get adminAllowCollectionManagement => 'يىغىپ باشقۇرۇشقا يول قويۇڭ';

  @override
  String get adminAllowSubtitleManagement => 'تېما باشقۇرۇشقا يول قويۇڭ';

  @override
  String get adminAllowLyricManagement => 'لىرىك باشقۇرۇشقا يول قويۇڭ';

  @override
  String get adminSavePermissions => 'ئىجازەتنى ساقلاش';

  @override
  String get adminEnableAllLibraryAccess =>
      'بارلىق كۈتۈپخانىلارنى زىيارەت قىلالايسىز';

  @override
  String get adminSaveAccess => 'زىيارەتنى ساقلاش';

  @override
  String get adminChangePassword => 'پارولنى ئۆزگەرتىش';

  @override
  String get adminNewPassword => 'يېڭى پارول';

  @override
  String get adminConfirmPassword => 'پارولنى جەزملەشتۈرۈڭ';

  @override
  String get adminSetPassword => 'پارول بەلگىلەڭ';

  @override
  String get adminResetPassword => 'پارولنى ئەسلىگە كەلتۈرۈش';

  @override
  String get adminPasswordReset => 'پارولنى ئەسلىگە كەلتۈرۈش';

  @override
  String get adminPasswordUpdated => 'پارول يېڭىلاندى';

  @override
  String get adminUserSettings => 'ئىشلەتكۈچى تەڭشەكلىرى';

  @override
  String get adminLibraryAccess => 'كۈتۈپخانىغا كىرىش';

  @override
  String get adminDeviceAndChannelAccess => 'ئۈسكۈنە ۋە قانال زىيارەت';

  @override
  String get adminEnableAllDevices => 'بارلىق ئۈسكۈنىلەرنى زىيارەت قىلالايسىز';

  @override
  String get adminEnableAllChannels => 'بارلىق قاناللارنى زىيارەت قىلىڭ';

  @override
  String get adminResetPasswordWarning =>
      'بۇ پارولنى ئۆچۈرۈۋېتىدۇ. ئىشلەتكۈچى پارولسىز كىرەلەيدۇ.';

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
  String get adminCreateApiKey => 'API ئاچقۇچى قۇرۇش';

  @override
  String get adminAppName => 'ئەپ ئىسمى';

  @override
  String get adminApiKeyCreated => 'API ئاچقۇچ قۇرۇلدى';

  @override
  String get adminApiKeyCreatedNoToken =>
      'ئاچقۇچ مۇۋەپپەقىيەتلىك قۇرۇلدى. مۇلازىمېتىر بەلگە قايتۇرمىدى. مۇلازىمېتىر API كۇنۇپكىسىنى تەكشۈرۈڭ.';

  @override
  String get adminKeyCopied => 'كۇنۇپكا تاختىسىغا كۆچۈرۈلگەن';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'مۇلازىمېتىرنىڭ ئىنكاسىدىن يوقاپ كەتكەن ئاچقۇچ بەلگىسى';

  @override
  String get adminRevokeApiKey => 'API ئاچقۇچىنى بىكار قىلىڭ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ئاچقۇچى بىكار قىلىندى';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API كۇنۇپكىسىنى يۈكلىيەلمىدى';

  @override
  String get adminApiKeysTitle => 'API ئاچقۇچ';

  @override
  String get adminCreateKey => 'ئاچقۇچ قۇرۇش';

  @override
  String get adminNoApiKeys => 'API كۇنۇپكىسى تېپىلمىدى';

  @override
  String get adminUnknownApp => 'نامەلۇم ئەپ';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'زاپاسلاش ...';

  @override
  String get adminBackupCreated => 'زاپاسلاش مۇۋەپپەقىيەتلىك قۇرۇلدى';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'مۇلازىمېتىرنىڭ ئىنكاسىدا زاپاسلاش يولى يوقاپ كەتتى';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'ئەسلىگە كەلتۈرۈشنى جەزملەشتۈرۈڭ';

  @override
  String get adminRestoringBackup => 'زاپاسلاشنى ئەسلىگە كەلتۈرۈش ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'زاپاسلاشنى يۈكلىيەلمىدى';

  @override
  String get adminCreateBackup => 'زاپاسلاش';

  @override
  String get adminNoBackups => 'زاپاسلاش تېپىلمىدى';

  @override
  String get adminViewDetails => 'تەپسىلاتلارنى كۆرۈش';

  @override
  String get restore => 'ئەسلىگە كەلتۈرۈش';

  @override
  String get adminLogsLoadFailed => 'مۇلازىمېتىر خاتىرىسىنى يۈكلىيەلمىدى';

  @override
  String get adminNoLogFiles => 'خاتىرە ھۆججەت تېپىلمىدى';

  @override
  String get adminLogCopied => 'چاپلاش تاختىسىغا كۆچۈرۈلدى';

  @override
  String get adminSaveLogFile => 'خاتىرە ھۆججىتىنى ساقلاڭ';

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
  String get adminSearchInLog => 'تىزىمدىن ئىزدەڭ';

  @override
  String get adminNoMatchingLines => 'ماس كېلىدىغان قۇر يوق';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'پىلانلانغان ۋەزىپە تېپىلمىدى';

  @override
  String get adminNoTasksMatchFilter =>
      'نۆۋەتتىكى سۈزگۈچكە ھېچقانداق ۋەزىپە ماس كەلمەيدۇ';

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
  String get adminRunNow => 'ھازىر ئىجرا قىلىڭ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'ئاخىرقى ئىجرا';

  @override
  String get adminTriggers => 'Triggers';

  @override
  String get adminAddTrigger => 'Trigger نى قوشۇڭ';

  @override
  String get adminNoTriggers => 'قوزغاتقۇچ سەپلەنمىدى';

  @override
  String get adminTriggerType => 'قوزغاتقۇچ تىپى';

  @override
  String get adminTimeLimit => 'ۋاقىت چەكلىمىسى (ئىختىيارى)';

  @override
  String get adminNoLimit => 'چەكلىمىسى يوق';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'ھەپتە';

  @override
  String get adminSearchPlugins => 'قىستۇرمىلارنى ئىزدەش ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'قىستۇرمىنى ئۆچۈرۈڭ';

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
      'ھېچقانداق قىستۇرما ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminNoPluginsInstalled => 'قىستۇرما ئورنىتىلمىدى';

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
      'ھېچقانداق ئورالما سىزنىڭ ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminNoPackagesAvailable => 'ئورالما يوق';

  @override
  String get adminExperimentalIntegration => 'تەجرىبە بىر گەۋدىلەشتۈرۈش';

  @override
  String get adminExperimentalWarning =>
      'قىستۇرما تەڭشەكلىرىنى بىرلەشتۈرۈش يەنىلا سىناق. بەزى تەڭشەك بەتلىرى توغرا كۆرسىتىلمەسلىكى مۇمكىن.';

  @override
  String get continueAction => 'داۋاملاشتۇر';

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
      'تەڭشەكلەرنى ئاچقىلى بولمايدۇ: ئاپتور بەلگىسى يوق.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'قىستۇرما تېپىلمىدى';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'قىستۇرمىنى قوزغىتىڭ';

  @override
  String get adminPluginSettingsPage => 'قىستۇرما تەڭشەك بېتى';

  @override
  String get adminRevisionHistory => 'تۈزىتىش تارىخى';

  @override
  String get adminNoChangelog => 'ئۆزگەرتكىلى بولمايدۇ.';

  @override
  String get adminRemoveRepository => 'ئامبارنى ئۆچۈرۈڭ';

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
  String get adminRepositoryNameHint => 'مەسىلەن Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'ئامبار ئادرېسى';

  @override
  String get adminAddEntry => 'كىرگۈزۈش';

  @override
  String get adminInvalidUrl => 'ئىناۋەتسىز URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'توركۆرگۈدە ئېچىڭ';

  @override
  String get adminOpenExternally => 'سىرتقا ئېچىڭ';

  @override
  String get adminGeneralSettings => 'ئادەتتىكى تەڭشەكلەر';

  @override
  String get adminServerName => 'مۇلازىمېتىر ئىسمى';

  @override
  String get adminPreferredMetadataCountry =>
      'ياقتۇرىدىغان مېتا سانلىق مەلۇمات دۆلىتى';

  @override
  String get adminCachePath => 'كەش يولى';

  @override
  String get adminMetadataPath => 'Metadata path';

  @override
  String get adminLibraryScanConcurrency => 'كۈتۈپخانىنى سىكانىرلاش';

  @override
  String get adminParallelImageEncodingLimit => 'پاراللېل رەسىم كودلاش چېكى';

  @override
  String get adminSlowResponseThreshold => 'ئاستا جاۋاب قايتۇرۇش چېكى (ms)';

  @override
  String get adminBrandingSaved => 'ماركا تەڭشەكلىرى ساقلاندى';

  @override
  String get adminBrandingLoadFailed => 'ماركا تەڭشىكىنى يۈكلىيەلمىدى';

  @override
  String get adminLoginDisclaimer => 'كىرىشنى رەت قىلىش';

  @override
  String get adminLoginDisclaimerHint =>
      'كىرىش جەدۋىلىنىڭ ئاستىدا HTML كۆرسىتىلدى';

  @override
  String get adminCustomCss => 'Custom CSS';

  @override
  String get adminCustomCssHint =>
      'ئىختىيارى CSS تور كۆرۈنمە يۈزىگە قوللىنىلدى';

  @override
  String get adminEnableSplashScreen => 'چاقماق ئېكرانىنى قوزغىتىڭ';

  @override
  String get adminStreamingSaved => 'ئاقما تەڭشەكلەر ساقلاندى';

  @override
  String get adminStreamingLoadFailed => 'ئېقىم تەڭشىكىنى يۈكلىيەلمىدى';

  @override
  String get adminStreamingDescription =>
      'يىراقتىن ئۇلىنىش ئۈچۈن يەرشارى ئېقىمى bitrate چەكلىمىسىنى بەلگىلەڭ.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'يىراقتىكى خېرىدار بىت چەكلىمىسى (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'بوش قالدۇرۇڭ ياكى 0 چەكسىز';

  @override
  String get adminPlaybackSaved => 'قويۇش تەڭشەكلىرى ساقلاندى';

  @override
  String get adminPlaybackLoadFailed => 'قويۇش تەڭشەكلىرىنى يۈكلىيەلمىدى';

  @override
  String get adminPlaybackTranscoding => 'قويۇش / Transcoding';

  @override
  String get adminHardwareAcceleration => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminVaapiDevice => 'VA-API ئۈسكۈنىسى';

  @override
  String get adminEnableHardwareEncoding => 'قاتتىق دېتال كودلاشنى قوزغىتىڭ';

  @override
  String get adminEnableHardwareDecoding => 'قاتتىق دېتال يېشىشنى قوزغىتىڭ:';

  @override
  String get adminEncodingThreads => 'كودلاش';

  @override
  String get adminAutomatic => '0 = ئاپتوماتىك';

  @override
  String get adminTranscodingTempPath => 'Transpoding temp path';

  @override
  String get adminEnableFallbackFont => 'چۈشۈش خەت نۇسخىسىنى قوزغىتىڭ';

  @override
  String get adminFallbackFontPath => 'خاتالىق خەت شەكلى';

  @override
  String get adminAllowSegmentDeletion => 'بۆلەكنى ئۆچۈرۈشىگە يول قويۇڭ';

  @override
  String get adminSegmentKeepSeconds => 'بۆلەك ساقلاش (سېكۇنت)';

  @override
  String get adminThrottleBuffering => 'Throttle buffering';

  @override
  String get adminTrickplaySaved => 'Trickplay تەڭشەكلىرى ساقلاندى';

  @override
  String get adminTrickplayLoadFailed =>
      'ئالدامچىلىق تەڭشەكلىرىنى يۈكلىيەلمىدى';

  @override
  String get adminEnableHardwareAcceleration => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminEnableKeyFrameExtraction =>
      'ئاچقۇچ رامكىسىنىلا چىقىرىشنى قوزغىتىڭ';

  @override
  String get adminKeyFrameSubtitle =>
      'تېخىمۇ تېز ، ئەمما ئېنىقلىق دەرىجىسى تۆۋەن';

  @override
  String get adminScanBehavior => 'سىكانېرلاش ھەرىكىتى';

  @override
  String get adminProcessPriority => 'جەرياننىڭ مۇھىم نۇقتىسى';

  @override
  String get adminImageSettings => 'رەسىم تەڭشىكى';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'رامكىنى قانچە قېتىم تۇتۇش';

  @override
  String get adminWidthResolutions => 'كەڭلىك ئېنىقلىق';

  @override
  String get adminTileWidth => 'كاھىش كەڭلىكى';

  @override
  String get adminTileHeight => 'كاھىش ئېگىزلىكى';

  @override
  String get adminQualitySubtitle =>
      'تۆۋەن قىممەت = تېخىمۇ سۈپەتلىك ، چوڭ ھۆججەتلەر';

  @override
  String get adminProcessThreads => 'تېما بىر تەرەپ قىلىش';

  @override
  String get adminResumeSaved => 'تەڭشەكلەرنى ئەسلىگە كەلتۈرۈڭ';

  @override
  String get adminResumeLoadFailed => 'ئەسلىگە كەلتۈرۈش تەڭشىكىنى يۈكلىيەلمىدى';

  @override
  String get adminResumeDescription =>
      'مەزمۇننى قىسمەن ئوينىغان ياكى تولۇق ئوينىغان دەپ بەلگىلەڭ.';

  @override
  String get adminMinResumePercentage => 'ئەڭ تۆۋەن ئەسلىگە كەلتۈرۈش نىسبىتى';

  @override
  String get adminMinResumeSubtitle =>
      'ئىلگىرىلەشنى تېجەش ئۈچۈن مەزمۇن چوقۇم بۇ پىرسەنتتىن ئېشىپ كېتىشى كېرەك';

  @override
  String get adminMaxResumePercentage => 'ئەڭ يۇقىرى ئەسلىگە كەلتۈرۈش نىسبىتى';

  @override
  String get adminMaxResumeSubtitle =>
      'بۇ نىسبەتتىن كېيىن مەزمۇن تولۇق ئوينىلىدۇ';

  @override
  String get adminMinResumeDuration =>
      'ئەڭ تۆۋەن ئەسلىگە كەلتۈرۈش ۋاقتى (سېكۇنت)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'بۇنىڭدىن قىسقا تۈرلەر ئەسلىگە كەلتۈرۈلمەيدۇ';

  @override
  String get adminMinAudiobookResume =>
      'ئەڭ تۆۋەن ئاۋازلىق كىتابنىڭ ئەسلىگە كېلىش نىسبىتى';

  @override
  String get adminMaxAudiobookResume =>
      'ئەڭ يۇقىرى ئاۋازلىق كىتابنىڭ ئەسلىگە كېلىش نىسبىتى';

  @override
  String get adminNetworkingSaved =>
      'تور تەڭشىكى ساقلاندى. مۇلازىمېتىرنى قايتا قوزغىتىش تەلەپ قىلىنىدۇ.';

  @override
  String get adminNetworkingLoadFailed => 'تور تەڭشىكىنى يۈكلىيەلمىدى';

  @override
  String get adminNetworkingWarning =>
      'تور تەڭشىكىنى ئۆزگەرتىش مۇلازىمېتىرنى قايتا قوزغىتىشنى تەلەپ قىلىشى مۇمكىن.';

  @override
  String get adminEnableRemoteAccess => 'يىراقتىن زىيارەت قىلىشنى قوزغىتىڭ';

  @override
  String get ports => 'ئېغىزلار';

  @override
  String get adminHttpPort => 'HTTP ئېغىزى';

  @override
  String get adminHttpsPort => 'HTTPS ئېغىزى';

  @override
  String get adminPublicHttpsPort => 'ئاممىۋى HTTPS ئېغىزى';

  @override
  String get adminBaseUrl => 'ئاساسى URL';

  @override
  String get adminBaseUrlHint => 'مەسىلەن / jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS نى قوزغىتىڭ';

  @override
  String get adminLocalNetwork => 'يەرلىك تور';

  @override
  String get adminLocalNetworkAddresses => 'يەرلىك تور ئادرېسلىرى';

  @override
  String get adminKnownProxies => 'داڭلىق ۋاكالەتچىلەر';

  @override
  String get adminRemoteIpFilter => 'يىراقتىكى IP سۈزگۈچ';

  @override
  String get adminRemoteIpFilterEntries => 'يىراقتىكى IP سۈزگۈچ';

  @override
  String get adminCertificatePath => 'گۇۋاھنامە يولى';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get blacklist => 'قارا تىزىملىك';

  @override
  String get notSet => 'تەڭشەلمىدى';

  @override
  String get adminMetadataSaved => 'Metadata ساقلاندى';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metadata نى يېڭىلاڭ';

  @override
  String get recursive => 'تەكرار';

  @override
  String get adminReplaceAllMetadata =>
      'بارلىق مېتا سانلىق مەلۇماتلارنى ئالماشتۇرۇڭ';

  @override
  String get adminReplaceAllImages => 'بارلىق رەسىملەرنى ئالماشتۇرۇڭ';

  @override
  String get adminMetadataRefreshRequested => 'Metadata يېڭىلاش تەلەپ قىلىندى';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'يىراقتىن ئىزدەش';

  @override
  String get adminNoRemoteMatches => 'يىراقتىن ماس كېلىدىغان تېپىلمىدى';

  @override
  String get adminRemoteResults => 'يىراقتىن نەتىجە';

  @override
  String get adminRemoteMetadataApplied =>
      'يىراقتىكى مېتا سانلىق مەلۇمات قوللىنىلدى';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'مەزمۇن تىپىنى يېڭىلاش';

  @override
  String get adminContentType => 'مەزمۇن تىپى';

  @override
  String get adminContentTypeUpdated => 'مەزمۇن تىپى يېڭىلاندى';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'مېتا سانلىق مەلۇمات تەھرىرلىگۈچنى يۈكلىيەلمىدى';

  @override
  String get adminNoPeopleEntries => 'ئادەم كىرگۈزمەيدۇ';

  @override
  String get adminNoExternalIds => 'سىرتقى كىملىك ​​يوق';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'قوللىمايدىغان رەسىم فورماتى';

  @override
  String get adminImageReadFailed => 'تاللانغان رەسىمنى ئوقۇش مەغلۇب بولدى';

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
  String get adminAllProviders => 'بارلىق تەمىنلىگۈچىلەر';

  @override
  String get adminNoRemoteImages => 'يىراقتىن رەسىم تېپىلمىدى';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Tuner نى قوشۇڭ';

  @override
  String get adminTunerType => 'تەڭشىگۈچ تىپى';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Other';

  @override
  String get adminUrlPath => 'URL / يول';

  @override
  String get adminNameOptional => 'ئىسمى (ئىختىيارى)';

  @override
  String get adminTunerAdded => 'Tuner قوشۇلدى';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'يېتەكچى تەمىنلىگۈچىنى قوشۇڭ';

  @override
  String get adminProviderType => 'تەمىنلىگۈچى تىپى';

  @override
  String get adminProviderTypeHint => 'خىزمەت يۆنىلىشى ياكى XMLTV';

  @override
  String get adminUsernameOptional => 'ئىشلەتكۈچى ئىسمى (ئىختىيارى)';

  @override
  String get adminRefreshInterval => 'ئارىلىقنى يېڭىلاش (سائەت)';

  @override
  String get adminProviderAdded => 'تەمىنلىگۈچى قوشۇلدى';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'تەڭشىگۈچنى ئەسلىگە كەلتۈرۈش تەلەپ قىلىندى';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'خاتىرىلەش تەڭشەكلىرى';

  @override
  String get adminPrePadding => 'ئالدىن چاپلاش (مىنۇت)';

  @override
  String get adminPostPadding => 'چاپلاشتىن كېيىنكى (مىنۇت)';

  @override
  String get adminRecordingPath => 'خاتىرىلەش يولى';

  @override
  String get adminSeriesRecordingPath => 'يۈرۈشلۈك خاتىرىلەش يولى';

  @override
  String get adminRecordingSettingsSaved => 'خاتىرىلەش تەڭشەكلىرى ساقلاندى';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'قانال خەرىتىسىنى بەلگىلەڭ';

  @override
  String get adminMappingJson => 'خەرىتە JSON';

  @override
  String get adminMappingJsonHint => 'مىسال: خەرىتە سىزىلغان JSON يۈك يۈكى';

  @override
  String get adminChannelMappingsUpdated => 'قانال خەرىتىسى يېڭىلاندى';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'نەق مەيدان تېلېۋىزىيە باشقۇرۇشنى يۈكلىيەلمىدى';

  @override
  String get adminTunerDevices => 'تەڭشىگۈچ ئۈسكۈنىلىرى';

  @override
  String get adminNoTunerHosts => 'ھېچقانداق تەڭشىگۈچ ئورۇنلاشتۇرۇلمىدى';

  @override
  String get adminGuideProviders => 'يېتەكچى تەمىنلىگۈچىلەر';

  @override
  String get adminAddProvider => 'تەمىنلىگۈچىنى قوشۇڭ';

  @override
  String get adminNoListingProviders => 'تىزىملىك ​​تەمىنلىگۈچىلەر سەپلەنمىگەن';

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
  String get adminChannelMappings => 'Channel Mappings';

  @override
  String get adminNoDiscoveredTuners => 'تېخى بايقالمىغان تەڭشىگۈچ يوق';

  @override
  String get adminSettingsSaved => 'تەڭشەكلەر ساقلاندى';

  @override
  String get adminBackupsNotAvailable =>
      'بۇ مۇلازىمېتىردا زاپاسلاشنى ئىشلەتكىلى بولمايدۇ.';

  @override
  String get adminRestoreWarning1 =>
      'ئەسلىگە كەلتۈرۈش نۆۋەتتىكى بارلىق مۇلازىمېتىر سانلىق مەلۇماتلىرىنى زاپاس سانلىق مەلۇمات بىلەن ئالماشتۇرىدۇ.';

  @override
  String get adminRestoreWarning2 =>
      'نۆۋەتتىكى مۇلازىمېتىر تەڭشىكى ، ئىشلەتكۈچى ۋە كۈتۈپخانا سانلىق مەلۇماتلىرى يېزىلىدۇ.';

  @override
  String get adminRestoreWarning3 =>
      'ئەسلىگە كەلگەندىن كېيىن مۇلازىمېتىر قايتا قوزغىلىدۇ.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'تەلەپ قىلىنغان ئەسلىگە كەلتۈرۈش. مۇلازىمېتىرنى قايتا قوزغىتىش بۇ يىغىننى ئۈزۈۋېتىشى مۇمكىن.';

  @override
  String get adminBackupsTitle => 'زاپاسلاش';

  @override
  String get adminUnknownDate => 'نامەلۇم ۋاقىت';

  @override
  String get adminUnnamedBackup => 'نامسىز زاپاسلاش';

  @override
  String get adminLiveTvNotAvailable =>
      'بۇ مۇلازىمېتىردا نەق مەيدان تېلېۋىزىيە باشقۇرۇشنى ئىشلەتكىلى بولمايدۇ.';

  @override
  String get adminLiveTvTitle => 'نەق مەيدان تېلېۋىزىيە باشقۇرۇش';

  @override
  String get adminApply => 'ئىلتىماس قىلىڭ';

  @override
  String get adminNotSet => 'تەڭشەلمىدى';

  @override
  String get adminReset => 'ئەسلىگە قايتۇرۇش';

  @override
  String get adminLogsTitle => 'مۇلازىمېتىر خاتىرىسى';

  @override
  String get adminLogsNewestFirst => 'ئەڭ يېڭى بىرىنچى';

  @override
  String get adminLogsOldestFirst => 'Oldest First';

  @override
  String get adminLogsJustNow => 'ھازىر';

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
  String get adminLogViewerNoMatches => 'ماس كېلىدىغان قۇر يوق';

  @override
  String get adminMetadataEditorTitle => 'Metadata Editor';

  @override
  String get adminMetadataRemote => 'Remote';

  @override
  String get adminMetadataType => 'تىپ';

  @override
  String get adminMetadataDetails => 'تەپسىلاتى';

  @override
  String get adminMetadataExternalIds => 'سىرتقى كىملىك';

  @override
  String get adminMetadataImages => 'سۈرەتلەر';

  @override
  String get adminMetadataFieldTitle => 'ماۋزۇ';

  @override
  String get adminMetadataFieldSortTitle => 'ماۋزۇ تىزىش';

  @override
  String get adminMetadataFieldOriginalTitle => 'ئەسلى ئىسمى';

  @override
  String get adminMetadataFieldPremiereDate => 'قويۇلۇش ۋاقتى (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'ئاخىرلىشىش ۋاقتى (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ئىشلەپچىقىرىش يىلى';

  @override
  String get adminMetadataFieldOfficialRating => 'رەسمىي باھا';

  @override
  String get adminMetadataFieldCommunityRating => 'مەھەللە دەرىجىسى';

  @override
  String get adminMetadataFieldCriticRating => 'تەنقىد دەرىجىسى';

  @override
  String get adminMetadataFieldTagline => 'خەتكۈچ';

  @override
  String get adminMetadataFieldOverview => 'ئومۇمىي چۈشەنچە';

  @override
  String get adminMetadataGenres => 'ژانىرلار';

  @override
  String get adminMetadataTags => 'خەتكۈچ';

  @override
  String get adminMetadataStudios => 'Studios';

  @override
  String get adminMetadataPeople => 'كىشىلەر';

  @override
  String get adminMetadataAddGenre => 'ژانىر قوشۇڭ';

  @override
  String get adminMetadataAddTag => 'خەتكۈچ قوشۇڭ';

  @override
  String get adminMetadataAddStudio => 'ستۇدېنت قوشۇڭ';

  @override
  String get adminMetadataAddPerson => 'ئادەم قوشۇڭ';

  @override
  String get adminMetadataEditPerson => 'تەھرىرلەش';

  @override
  String get adminMetadataRole => 'رولى';

  @override
  String get adminMetadataImagePrimary => 'Primary';

  @override
  String get adminMetadataImageBackdrop => 'ئارقا كۆرۈنۈش';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'بايراق';

  @override
  String get adminMetadataImageThumb => 'Thumb';

  @override
  String get adminMetadataRecursive => 'تەكرار';

  @override
  String get adminMetadataProvider => 'تەمىنلىگۈچى';

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
      'تاللانغان رەسىمنى ئوقۇش مەغلۇب بولدى';

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
      'بۇ نۆۋەتتىكى رەسىمنى تۈردىن چىقىرىپ تاشلايدۇ.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'يۈكلەش';

  @override
  String get adminMetadataUpdate => 'يېڭىلاش';

  @override
  String get adminMetadataRemoteImage => 'يىراقتىكى رەسىم';

  @override
  String get adminPluginsInstalled => 'قاچىلاندى';

  @override
  String get adminPluginsCatalog => 'مۇندەرىجە';

  @override
  String get adminPluginsActive => 'ئاكتىپ';

  @override
  String get adminPluginsRestart => 'قايتا قوزغىتىڭ';

  @override
  String get adminPluginsNoSearchResults =>
      'ھېچقانداق قىستۇرما ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminPluginsNoneInstalled => 'قىستۇرما ئورنىتىلمىدى';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric =>
      'يېڭىلاشنى ئىشلەتكىلى بولىدۇ';

  @override
  String get adminPluginsPendingRemoval =>
      'قايتا قوزغىتىلغاندىن كېيىن ئېلىۋېتىشنى ساقلاۋاتىدۇ';

  @override
  String get adminPluginsChangesPending => 'قايتا قوزغىتىشنى ساقلاۋاتىدۇ';

  @override
  String get adminPluginsEnable => 'قوزغىتىش';

  @override
  String get adminPluginsDisable => 'چەكلەش';

  @override
  String get adminPluginsInstallUpdate => 'يېڭىلاشنى قاچىلاڭ';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ھېچقانداق ئورالما سىزنىڭ ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminPluginsCatalogEmpty => 'ئورالما يوق';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'تەجرىبە بىر گەۋدىلەشتۈرۈش';

  @override
  String get adminPluginDetailExperimentalContent =>
      'قىستۇرما تەڭشەكلىرىنى بىرلەشتۈرۈش يەنىلا سىناق. بەزى ساھە ياكى ئورۇنلاشتۇرۇشلار تېخى توغرا كۆرسىتىلمەسلىكى مۇمكىن.';

  @override
  String get adminPluginDetailToggle404 =>
      'قىستۇرمىنى ئالماشتۇرۇش مەغلۇب بولدى. مۇلازىمېتىر بۇ قىستۇرما نۇسخىسىنى تاپالمىدى. قىستۇرمىلارنى يېڭىلاپ سىناپ بېقىڭ.';

  @override
  String get adminPluginDetailToggleDioError =>
      'قىستۇرمىنى ئالماشتۇرۇش مەغلۇب بولدى. تەپسىلاتلار ئۈچۈن مۇلازىمېتىر خاتىرىسىنى تەكشۈرۈپ بېقىڭ.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'تەپسىلاتى';

  @override
  String get adminPluginDetailDeveloper => 'Developer';

  @override
  String get adminPluginDetailRepository => 'ئامبار';

  @override
  String get adminPluginDetailBundled => 'باغلاندى';

  @override
  String get adminPluginDetailEnablePlugin => 'قىستۇرمىنى قوزغىتىڭ';

  @override
  String get adminPluginDetailRestartRequired =>
      'ئۆزگەرتىشلەرنىڭ كۈچكە ئىگە بولۇشى ئۈچۈن مۇلازىمېتىرنى قايتا قوزغىتىش تەلەپ قىلىنىدۇ.';

  @override
  String get adminPluginDetailRemovalPending =>
      'مۇلازىمېتىر قايتا قوزغىتىلغاندىن كېيىن بۇ قىستۇرما ئۆچۈرۈلىدۇ.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'بۇ قىستۇرما كاشىلا كۆرۈلگەن بولۇپ ، نورمال ئىشلىمەسلىكى مۇمكىن.';

  @override
  String get adminPluginDetailNotSupported =>
      'بۇ قىستۇرمىنى نۆۋەتتىكى مۇلازىمېتىر نەشرى قوللىمايدۇ.';

  @override
  String get adminPluginDetailSuperseded =>
      'بۇ قىستۇرما يېڭى نەشرىگە ئالماشتۇرۇلدى.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ئامبارنى ئۆچۈرۈڭ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'ئۆچۈرۈڭ';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'ئامبار سەپلەنمىدى';

  @override
  String get adminReposEmptySubtitle =>
      'ئىشلەتكىلى بولىدىغان قىستۇرمىلارنى كۆرۈش ئۈچۈن ئامبار قوشۇڭ';

  @override
  String get adminReposUnnamed => '(نامسىز)';

  @override
  String get adminReposEditTitle => 'ئامبارنى تەھرىرلەش';

  @override
  String get adminReposAddTitle => 'ئامبار قوشۇڭ';

  @override
  String get adminReposUrl => 'ئامبار ئادرېسى';

  @override
  String get adminReposNameHint => 'مەسىلەن Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'ئىناۋەتسىز URL';

  @override
  String get adminGeneralSettingsTitle => 'ئادەتتىكى تەڭشەكلەر';

  @override
  String get adminGeneralMetadataLanguage =>
      'ياقتۇرىدىغان مېتا سانلىق مەلۇمات تىلى';

  @override
  String get adminGeneralMetadataLanguageHint => 'مەسىلەن en, de, fr';

  @override
  String get adminGeneralMetadataCountry =>
      'ياقتۇرىدىغان مېتا سانلىق مەلۇمات دۆلىتى';

  @override
  String get adminGeneralMetadataCountryHint => 'مەسىلەن US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'كۈتۈپخانىنى سىكانىرلاش';

  @override
  String get adminGeneralImageEncodingLimit => 'پاراللېل رەسىم كودلاش چېكى';

  @override
  String get adminUnknownError => 'نامەلۇم خاتالىق';

  @override
  String get adminBrowse => 'توركۆرگۈ';

  @override
  String get adminCloseBrowser => 'توركۆرگۈنى تاقاڭ';

  @override
  String get adminNetworkingTitle => 'تور';

  @override
  String get adminNetworkingRestartWarning =>
      'تور تەڭشىكىنى ئۆزگەرتىش مۇلازىمېتىرنى قايتا قوزغىتىشنى تەلەپ قىلىشى مۇمكىن.';

  @override
  String get adminNetworkingRemoteAccess => 'يىراقتىن زىيارەت قىلىشنى قوزغىتىڭ';

  @override
  String get adminNetworkingPorts => 'ئېغىزلار';

  @override
  String get adminNetworkingHttpPort => 'HTTP ئېغىزى';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS ئېغىزى';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS نى قوزغىتىڭ';

  @override
  String get adminNetworkingLocalNetwork => 'يەرلىك تور';

  @override
  String get adminNetworkingLocalAddresses => 'يەرلىك تور ئادرېسلىرى';

  @override
  String get adminNetworkingAddressHint => 'مەسىلەن 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'داڭلىق ۋاكالەتچىلەر';

  @override
  String get adminNetworkingProxyHint => 'مەسىلەن 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Whitelist';

  @override
  String get adminNetworkingBlacklist => 'قارا تىزىملىك';

  @override
  String get adminNetworkingAddEntry => 'كىرگۈزۈش';

  @override
  String get adminBrandingTitle => 'ماركا';

  @override
  String get adminBrandingLoginDisclaimer => 'كىرىشنى رەت قىلىش';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'كىرىش جەدۋىلىنىڭ ئاستىدا HTML كۆرسىتىلدى';

  @override
  String get adminBrandingCustomCss => 'Custom CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ئىختىيارى CSS تور كۆرۈنمە يۈزىگە قوللىنىلدى';

  @override
  String get adminBrandingEnableSplash => 'چاقماق ئېكرانىنى قوزغىتىڭ';

  @override
  String get adminPlaybackHwAccel => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminPlaybackHwAccelLabel => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminPlaybackEnableHwEncoding => 'قاتتىق دېتال كودلاشنى قوزغىتىڭ';

  @override
  String get adminPlaybackEnableHwDecoding => 'قاتتىق دېتال يېشىشنى قوزغىتىڭ:';

  @override
  String get adminPlaybackEncoding => 'كودلاش';

  @override
  String get adminPlaybackEncodingThreads => 'كودلاش';

  @override
  String get adminPlaybackFallbackFont => 'چۈشۈش خەت نۇسخىسىنى قوزغىتىڭ';

  @override
  String get adminPlaybackFallbackFontPath => 'خاتالىق خەت شەكلى';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'ئۈندىدار';

  @override
  String get adminResumeMinAudiobookPct =>
      'ئەڭ تۆۋەن ئاۋازلىق كىتابنىڭ ئەسلىگە كېلىش نىسبىتى';

  @override
  String get adminResumeMaxAudiobookPct =>
      'ئەڭ يۇقىرى ئاۋازلىق كىتابنىڭ ئەسلىگە كېلىش نىسبىتى';

  @override
  String get adminStreamingBitrateLimit =>
      'يىراقتىكى خېرىدار بىت چەكلىمىسى (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'بوش قالدۇرۇڭ ياكى 0 چەكسىز';

  @override
  String get adminTrickplayHwAccel => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminTrickplayHwEncoding => 'قاتتىق دېتال كودلاشنى قوزغىتىڭ';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'ئاچقۇچ رامكىسىنىلا چىقىرىشنى قوزغىتىڭ';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'تېخىمۇ تېز ، ئەمما ئېنىقلىق دەرىجىسى تۆۋەن';

  @override
  String get adminTrickplayNonBlocking => 'توسۇۋالماسلىق';

  @override
  String get adminTrickplayBlocking => 'توسۇش';

  @override
  String get adminTrickplayPriorityHigh => 'ئېگىز';

  @override
  String get adminTrickplayPriorityAboveNormal => 'ئۈستىدىكى نورمال';

  @override
  String get adminTrickplayPriorityNormal => 'نورمال';

  @override
  String get adminTrickplayPriorityBelowNormal => 'تۆۋەندە نورمال';

  @override
  String get adminTrickplayPriorityIdle => 'بىكار';

  @override
  String get adminTrickplayImageSettings => 'رەسىم تەڭشىكى';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'رامكىنى قانچە قېتىم تۇتۇش';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'پەش بىلەن ئايرىلغان پېكسىل كەڭلىكى (مەسىلەن 320)';

  @override
  String get adminTrickplayQuality => 'سۈپەت';

  @override
  String get adminTrickplayQScale => 'سۈپەت ئۆلچىمى';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'تۆۋەن قىممەت = تېخىمۇ سۈپەتلىك ، چوڭ ھۆججەتلەر';

  @override
  String get adminTrickplayJpegQuality => 'JPEG سۈپىتى';

  @override
  String get adminTrickplayProcessing => 'بىر تەرەپ قىلىش';

  @override
  String get adminTasksEmpty => 'پىلانلانغان ۋەزىپە تېپىلمىدى';

  @override
  String get adminTasksNoFilterMatch =>
      'نۆۋەتتىكى سۈزگۈچكە ھېچقانداق ۋەزىپە ماس كەلمەيدۇ';

  @override
  String get adminTaskCancelling => 'بىكار قىلىش ...';

  @override
  String get adminTaskRunning => 'يۈگۈرۈش ...';

  @override
  String get adminTaskNeverRun => 'ھەرگىز يۈگۈرمەڭ';

  @override
  String get adminTaskStop => 'توختاڭ';

  @override
  String get adminTaskRun => 'ئىجرا';

  @override
  String get adminTaskDetailLastExecution => 'ئاخىرقى ئىجرا';

  @override
  String get adminTaskDetailStarted => 'باشلاندى';

  @override
  String get adminTaskDetailEnded => 'ئاخىرلاشتى';

  @override
  String get adminTaskDetailDuration => 'Duration';

  @override
  String get adminTaskDetailErrorLabel => 'خاتالىق:';

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
  String get adminTaskTriggerStartup => 'قوللىنىشچان پروگراممىدا';

  @override
  String get adminTaskTriggerTypeDaily => 'كۈندىلىك';

  @override
  String get adminTaskTriggerTypeWeekly => 'ھەپتىلىك';

  @override
  String get adminTaskTriggerTypeInterval => 'ئارىلىقتا';

  @override
  String get adminTaskTriggerIntervalLabel => 'ئارىلىق';

  @override
  String get adminTaskTriggerEveryHour => 'ھەر سائەت';

  @override
  String get adminTaskTriggerEvery6Hours => 'ھەر 6 سائەتتە';

  @override
  String get adminTaskTriggerEvery12Hours => 'ھەر 12 سائەتتە';

  @override
  String get adminTaskTriggerEvery24Hours => 'ھەر 24 سائەتتە';

  @override
  String get adminTaskTriggerEvery2Days => 'ھەر 2 كۈندە';

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
  String get adminTaskTriggerTime => 'ۋاقىت';

  @override
  String get adminTaskTriggerNoLimit => 'چەكلىمىسى يوق';

  @override
  String get adminActivityJustNow => 'ھازىر';

  @override
  String get adminActivityLastHour => 'ئالدىنقى سائەت';

  @override
  String get adminActivityToday => 'بۈگۈن';

  @override
  String get adminActivityYesterday => 'تۈنۈگۈن';

  @override
  String get adminActivityOlder => 'Older';

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
  String get adminActivityNow => 'ھازىر';

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
      'كىچىك كۆرۈنۈشلۈك كۆرۈنۈش ھاسىل قىلىش ئۈچۈن ئالدامچىلىق رەسىم ھاسىل قىلىڭ.';

  @override
  String get adminNetworkingPublicHttpsPort => 'ئاممىۋى HTTPS ئېغىزى';

  @override
  String get adminNetworkingBaseUrl => 'ئاساسى URL';

  @override
  String get adminNetworkingBaseUrlHint => 'مەسىلەن / jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'گۇۋاھنامە يولى';

  @override
  String get adminNetworkingRemoteIpFilter => 'يىراقتىكى IP سۈزگۈچ';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'يىراقتىكى IP سۈزگۈچ';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ئۈسكۈنىسى';

  @override
  String get adminPlaybackAutomatic => '0 = ئاپتوماتىك';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transpoding temp path';

  @override
  String get adminPlaybackSegmentDeletion => 'بۆلەكنى ئۆچۈرۈشىگە يول قويۇڭ';

  @override
  String get adminPlaybackSegmentKeep => 'بۆلەك ساقلاش (سېكۇنت)';

  @override
  String get adminPlaybackThrottleBuffering => 'Throttle buffering';

  @override
  String get adminResumeMinPct => 'ئەڭ تۆۋەن ئەسلىگە كەلتۈرۈش نىسبىتى';

  @override
  String get adminResumeMinPctSubtitle =>
      'ئىلگىرىلەشنى تېجەش ئۈچۈن مەزمۇن چوقۇم بۇ پىرسەنتتىن ئېشىپ كېتىشى كېرەك';

  @override
  String get adminResumeMaxPct => 'ئەڭ يۇقىرى ئەسلىگە كەلتۈرۈش نىسبىتى';

  @override
  String get adminResumeMaxPctSubtitle =>
      'بۇ نىسبەتتىن كېيىن مەزمۇن تولۇق ئوينىلىدۇ';

  @override
  String get adminResumeMinDuration =>
      'ئەڭ تۆۋەن ئەسلىگە كەلتۈرۈش ۋاقتى (سېكۇنت)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'بۇنىڭدىن قىسقا تۈرلەر ئەسلىگە كەلتۈرۈلمەيدۇ';

  @override
  String get adminTrickplayScanBehavior => 'سىكانېرلاش ھەرىكىتى';

  @override
  String get adminTrickplayProcessPriority => 'جەرياننىڭ مۇھىم نۇقتىسى';

  @override
  String get adminTrickplayTileWidth => 'كاھىش كەڭلىكى';

  @override
  String get adminTrickplayTileHeight => 'كاھىش ئېگىزلىكى';

  @override
  String get adminTrickplayProcessThreads => 'تېما بىر تەرەپ قىلىش';

  @override
  String get adminTrickplayWidthResolutions => 'كەڭلىك ئېنىقلىق';

  @override
  String get adminMetadataDefault => 'سۈكۈتتىكى';

  @override
  String get adminMetadataContentTypeUpdated => 'مەزمۇن تىپى يېڭىلاندى';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ئاستا جاۋاب قايتۇرۇش چېكى (ms)';

  @override
  String get adminGeneralCachePath => 'كەش يولى';

  @override
  String get adminGeneralMetadataPath => 'Metadata path';

  @override
  String get adminGeneralServerName => 'مۇلازىمېتىر ئىسمى';

  @override
  String get adminSettingsLoadFailed => 'تەڭشەكلەرنى يۈكلىيەلمىدى';

  @override
  String get adminDiscover => 'بايقاش';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'ھۆججەت قىسقۇچ';

  @override
  String get libraries => 'كۈتۈپخانىلار';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay چەكلەنگەن';

  @override
  String get syncPlayDisabledMessage =>
      'ماس قەدەملىك قويۇشنى ئىشلىتىش ئۈچۈن تەڭشەكتىكى SyncPlay نى قوزغىتىڭ.';

  @override
  String get syncPlayServerUnsupportedTitle => 'مۇلازىمېتىر قوللىمايدۇ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay Jellyfin مۇلازىمېتىرىنى تەلەپ قىلىدۇ. نۆۋەتتىكى مۇلازىمېتىر ئۇنى قوللىمايدۇ.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay گۇرۇپپىسى';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay گۇرۇپپىسى';

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
  String get syncPlayIgnoreWait => 'ساقلاشقا پەرۋا قىلماڭ';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'بۇ ئۈسكۈنىنى بۇففېر قىلغاندا گۇرۇپپىنى تۇتماڭ';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ئاستا ئەزالارنى ساقلىماي يەرلىكنى داۋاملاشتۇرۇڭ';

  @override
  String get syncPlayRepeat => 'تەكرارلاڭ';

  @override
  String get syncPlayRepeatOne => 'بىرى';

  @override
  String get syncPlayShuffleModeShuffled => 'Shuffled';

  @override
  String get syncPlayShuffleModeSorted => 'تەرتىپلەنگەن';

  @override
  String get syncPlaySyncCurrentQueue =>
      'نۆۋەتتىكى قويۇش لىنىيىسىنى ماسقەدەملەڭ';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'گۇرۇپپا ئۆچرەتلىرىنى يەرلىكتە ئويناۋاتقان نەرسىگە ئالماشتۇرۇڭ';

  @override
  String get syncPlayLeaveGroup => 'گۇرۇپپىدىن ئايرىلىش';

  @override
  String get syncPlayGroupQueue => 'گۇرۇپپا ئۆچرەت';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'ھازىر ئويناڭ';

  @override
  String get syncPlayCreateNewGroup => 'يېڭى گۇرۇپپا قۇرۇڭ';

  @override
  String get syncPlayGroupName => 'گۇرۇپپا ئىسمى';

  @override
  String get syncPlayDefaultGroupName => 'مېنىڭ SyncPlay گۇرۇپپىسى';

  @override
  String get syncPlayCreateGroup => 'گۇرۇپپا قۇرۇش';

  @override
  String get syncPlayAvailableGroups => 'ئىشلەتكىلى بولىدىغان گۇرۇپپىلار';

  @override
  String get syncPlayNoGroupsAvailable => 'گۇرۇپپا يوق';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay گۇرۇپپىسىغا قوشۇلۇڭ؟';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay گۇرۇپپىسىغا قوشۇلسىڭىز نۆۋەتتىكى قويۇش ئۆچرەتلىرىڭىزنىڭ ئورنىنى ئېلىشى مۇمكىن. داۋاملاشتۇرامسىز؟';

  @override
  String get syncPlayJoin => 'قوشۇلۇڭ';

  @override
  String get syncPlayStateIdle => 'بىكار';

  @override
  String get syncPlayStateWaiting => 'ساقلاش';

  @override
  String get syncPlayStatePaused => 'توختاپ قالدى';

  @override
  String get syncPlayStatePlaying => 'ئويناش';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay زىيارەت قىلىش رەت قىلىندى';

  @override
  String get syncPlayAccessDeniedMessage =>
      'بۇ SyncPlay گۇرۇپپىسىدىكى بىر ياكى بىر نەچچە تۈرنى زىيارەت قىلالمايسىز. گۇرۇپپا ئىگىسىدىن كۈتۈپخانىنىڭ ئىجازىتىنى دەلىللەشنى ياكى باشقىچە ئۆچرەت تاللاشنى تەلەپ قىلىڭ.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'ئاۋازلىق ئىزدەش مۇمكىن ئەمەس.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play مەغلۇب بولدى';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'بۇ Dolby Vision ئېقىمىغا بىۋاسىتە ئويناش مەغلۇپ بولدى. مۇلازىمېتىر كودنى ئىشلىتىپ قايتا سىناڭ؟';

  @override
  String get retryWithTranscode => 'Transcode بىلەن قايتا سىناڭ';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision قوللىمايدۇ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'بۇ ئۈسكۈنە Dolby Vision مەزمۇنىنى بىۋاسىتە يېشىپ بېرەلمەيدۇ. HDR10 چۈشۈشنى ئىشلىتىڭ ياكى مۇلازىمېتىرنىڭ كودلاشتۇرۇشىنى تەلەپ قىلىڭ.';

  @override
  String get rememberMyChoice => 'مېنىڭ تاللىشىمنى ئېسىڭىزدە تۇتۇڭ';

  @override
  String get playHdr10Fallback => 'HDR10 چۈشۈشنى ئويناڭ';

  @override
  String get requestTranscode => 'كودنى تەلەپ قىلىڭ';

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
  String get seeAll => 'ھەممىنى كۆرۈڭ';

  @override
  String get noItems => 'ھېچقانداق نەرسە يوق';

  @override
  String get switchUser => 'ئىشلەتكۈچىنى ئالماشتۇرۇش';

  @override
  String get remoteControl => 'يىراقتىن كونترول قىلىش';

  @override
  String get mediaBarLoading => 'مېدىيا بالدىقىنى يۈكلەۋاتىدۇ ...';

  @override
  String get mediaBarError => 'مېدىيا بالدىقى يۈكلەنمىدى';

  @override
  String get offlineServerUnavailable =>
      'تورغا ئۇلانغان ، ئەمما نۆۋەتتىكى مۇلازىمېتىرنى ئىشلەتكىلى بولمايدۇ.';

  @override
  String get offlineNoInternet =>
      'سىز تورسىز. پەقەت چۈشۈرۈلگەن مەزمۇنلارنىلا ئىشلەتكىلى بولىدۇ.';

  @override
  String get offlineFileNotAvailable => 'ھۆججەت يوق';

  @override
  String get offlineSwitchServer => 'مۇلازىمېتىرنى ئالماشتۇرۇش';

  @override
  String get offlineSavedMedia => 'ساقلانغان مېدىيا';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'يىراقتىن قويۇش';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'ئۈسكۈنىنىڭ ھەجىمى';

  @override
  String get castVolumeUnavailable => 'Unavailable';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitles';

  @override
  String get pinConfirmTitle => 'PIN نى جەزملەشتۈرۈڭ';

  @override
  String get pinSetTitle => 'PIN نى تەڭشەڭ';

  @override
  String get pinEnterTitle => 'PIN نى كىرگۈزۈڭ';

  @override
  String get pinReenterToConfirm => 'جەزملەشتۈرۈش ئۈچۈن PIN نى قايتا كىرگۈزۈڭ';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN خاتا';

  @override
  String get pinMismatch => 'PIN ماس كەلمەيدۇ';

  @override
  String get pinForgot => 'PIN نى ئۇنتۇپ قالدىڭىزمۇ؟';

  @override
  String get pinClear => 'ئېنىق';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'تېز ئۇلىنىش تەلىپى ھوقۇق بېرىلگەن.';

  @override
  String get quickConnectInvalidOrExpired =>
      'تېز ئۇلىنىش كودى ئىناۋەتسىز ياكى ۋاقتى ئۆتكەن.';

  @override
  String get quickConnectNotSupported =>
      'بۇ مۇلازىمېتىردا تېز ئۇلىنىش قوللىمايدۇ.';

  @override
  String get quickConnectAuthorizeFailed =>
      'تېز ئۇلىنىش كودىغا ھوقۇق بېرىلمىدى.';

  @override
  String get quickConnectDisabled => 'بۇ مۇلازىمېتىردا تېز ئۇلىنىش چەكلەنگەن.';

  @override
  String get quickConnectForbidden =>
      'ھېساباتىڭىز بۇ تېز ئۇلىنىش تەلىپىگە ھوقۇق بېرەلمەيدۇ.';

  @override
  String get quickConnectNotFound =>
      'تېز ئۇلىنىش كودى تېپىلمىدى. يېڭى كودنى سىناپ بېقىڭ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'كود كىرگۈزۈڭ';

  @override
  String get quickConnectAuthorize => 'ھوقۇق بېرىش';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'يىراقتىن كونترول قىلىش';

  @override
  String get remoteFailedToLoadSessions => 'ئولتۇرۇشنى يۈكلىيەلمىدى';

  @override
  String get remoteNoSessions => 'كونترول قىلغىلى بولىدىغان يىغىن يوق';

  @override
  String get remoteStartPlayback => 'باشقا ئۈسكۈنىدە قويۇشنى باشلاڭ';

  @override
  String get unknownUser => 'نامەلۇم';

  @override
  String get unknownItem => 'نامەلۇم';

  @override
  String get remoteNothingPlaying => 'بۇ ئولتۇرۇشتا ھېچ نەرسە ئوينىمايدۇ';

  @override
  String get castingStarted => 'تاللانغان ئۈسكۈنىدە قۇيۇش باشلاندى';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'يىراقتىن قويۇش ئۈسكۈنىسى يوق.';

  @override
  String get noRemoteDevicesIos =>
      'يىراقتىن قويۇش ئۈسكۈنىسى يوق.\n\nIOS دا ، تەقلىدلىگۈچتە AirPlay نىشانلىرى يوق بولۇشى مۇمكىن.';

  @override
  String get trackActionPlayNext => 'كېيىنكى ئوينى';

  @override
  String get trackActionAddToQueue => 'ئۆچرەتكە قوشۇڭ';

  @override
  String get trackActionAddToPlaylist => 'قويۇش تىزىملىكىگە قوشۇڭ';

  @override
  String get trackActionCancelDownload => 'چۈشۈرۈشنى ئەمەلدىن قالدۇرۇڭ';

  @override
  String get trackActionDeleteFromPlaylist => 'قويۇش تىزىملىكىدىن ئۆچۈرۈڭ';

  @override
  String get trackActionMoveUp => 'يۆتكەڭ';

  @override
  String get trackActionMoveDown => 'تۆۋەنگە يۆتكەڭ';

  @override
  String get trackActionRemoveFromFavorites => 'ياقتۇرىدىغانلاردىن ئۆچۈرۈڭ';

  @override
  String get trackActionAddToFavorites => 'ياقتۇرىدىغانلارغا قوشۇڭ';

  @override
  String get trackActionGoToAlbum => 'ئالبۇمغا بېرىڭ';

  @override
  String get trackActionGoToArtist => 'سەنئەتكارغا بېرىڭ';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'چۈشۈرۈلگەن ھۆججەت ئۆچۈرۈلدى';

  @override
  String get trackActionDeleteFileFailed => 'چۈشۈرۈلگەن ھۆججەتنى ئۆچۈرەلمىدى';

  @override
  String get shuffleBy => 'Shuffle By';

  @override
  String get shuffleSelectLibrary => 'كۈتۈپخانىنى تاللاڭ';

  @override
  String get shuffleSelectGenre => 'ژانىرنى تاللاڭ';

  @override
  String get shuffleLibrary => 'كۈتۈپخانا';

  @override
  String get shuffleGenre => 'ژانىر';

  @override
  String get shuffleNoLibraries => 'ماس كېلىدىغان كۈتۈپخانىلار يوق.';

  @override
  String get shuffleNoGenres =>
      'بۇ تەۋرىنىش ھالىتى ئۈچۈن ھېچقانداق ژانىر تېپىلمىدى.';

  @override
  String get posterDisplayTitle => 'كۆرسىتىش';

  @override
  String get posterImageType => 'رەسىم تىپى';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Thumbnail';

  @override
  String get imageTypeBanner => 'بايراق';

  @override
  String get playlistAddFailed => 'قويۇش تىزىملىكىگە قوشۇلمىدى';

  @override
  String get playlistCreateFailed => 'قويۇش تىزىملىكى قۇرالمىدى';

  @override
  String get playlistNew => 'يېڭى قويۇش تىزىملىكى';

  @override
  String get playlistCreate => 'قۇرۇش';

  @override
  String get playlistCreateNew => 'يېڭى قويۇش تىزىملىكى قۇرۇش';

  @override
  String get playlistNoneFound => 'قويغۇچ تىزىملىكى تېپىلمىدى';

  @override
  String get addToPlaylist => 'قويۇش تىزىملىكىگە قوشۇڭ';

  @override
  String get lyricsNotAvailable => 'تېكىست يوق';

  @override
  String get upNext => 'Up Next';

  @override
  String get playNext => 'كېيىنكى ئوينى';

  @override
  String get stillWatchingContent => 'قويۇش توختىتىلدى. ھازىرمۇ كۆرۈۋاتامسىز؟';

  @override
  String get stillWatchingStop => 'توختاڭ';

  @override
  String get stillWatchingContinue => 'داۋاملاشتۇر';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Live TV';

  @override
  String get continueWatchingAndNextUp => 'داۋاملىق كۆرۈش ۋە كېيىنكى باسقۇچ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'كېيىنكى بۆلۈم';

  @override
  String get moreFromThisSeason => 'بۇ پەسىلدىن تېخىمۇ كۆپ';

  @override
  String get playerTooltipPlaybackSpeed => 'قويۇش سۈرئىتى';

  @override
  String get playerTooltipCastControls => 'كونترول كونتروللىرى';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'پۈتۈن ئېكراننى كىرگۈزۈڭ';

  @override
  String get playerTooltipExitFullscreen => 'پۈتۈن ئېكراندىن چىقىڭ';

  @override
  String get playerTooltipFloatOnTop => 'ئۈستىدە لەيلەپ تۇرۇڭ';

  @override
  String get playerTooltipExitFloatOnTop => 'ئۈستىدىكى لەيلىمىنى چەكلەڭ';

  @override
  String get playerTooltipLockLandscape => 'قۇلۇپ مەنزىرىسى';

  @override
  String get playerTooltipUnlockOrientation => 'ئايلىنىشقا يول قويۇڭ';

  @override
  String get playerTooltipPrevious => 'ئالدىنقى';

  @override
  String get playerTooltipSeekBack => 'قايتا ئىزدەڭ';

  @override
  String get playerTooltipSeekForward => 'ئالدىغا قاراپ بېقىڭ';

  @override
  String get contextMenuMarkWatched => 'كۆزىتىلگەندەك بەلگە';

  @override
  String get contextMenuMarkUnwatched => 'كۆزىتىلمىگەن دەپ بەلگە قويۇڭ';

  @override
  String get contextMenuAddToFavorites => 'ياقتۇرىدىغانلارغا قوشۇڭ';

  @override
  String get contextMenuRemoveFromFavorites => 'ياقتۇرىدىغانلاردىن ئۆچۈرۈڭ';

  @override
  String get contextMenuGoToSeries => 'يۈرۈشلۈككە بېرىڭ';

  @override
  String get settingsAdministrationSubtitle =>
      'مۇلازىمېتىر باشقۇرۇش تاختىسىغا كىرىڭ';

  @override
  String get settingsAccountSecurity => 'ھېسابات ۋە بىخەتەرلىك';

  @override
  String get settingsAccountSecuritySubtitle =>
      'دەلىللەش ، PIN كودى ۋە ئاتا-ئانىلارنىڭ كونتروللۇقى';

  @override
  String get settingsPersonalization => 'خاسلاشتۇرۇش';

  @override
  String get settingsPersonalizationSubtitle =>
      'تېما ، يول باشلاش ، ئائىلە قۇرلىرى ۋە كۈتۈپخانىنىڭ كۆرۈنۈشچانلىقى';

  @override
  String get settingsDynamicContent => 'ھەرىكەتچان مەزمۇن';

  @override
  String get settingsDynamicContentSubtitle => 'Media Bar ۋە كۆرۈنۈش قاپلاش';

  @override
  String get settingsPlaybackSyncplay => 'قويۇش ۋە SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ئاۋاز / سىن تەڭشىكى ، تېما ، چۈشۈرۈش ۋە SyncPlay كونتروللىرى';

  @override
  String get settingsIntegrationsSubtitle =>
      'قىستۇرما ماسقەدەملەش ، Seerr ، باھالاش ۋە باشقىلار';

  @override
  String get settingsAboutSubtitle =>
      'ئەپ نۇسخىسى ، قانۇنىي ئۇچۇرلار ۋە ئىناۋەت';

  @override
  String get settingsAuthenticationSection => 'AUTHENTICATION';

  @override
  String get settingsSortServersBy => 'مۇلازىمېتىرلارنى تەرتىپلەش';

  @override
  String get settingsLastUsed => 'ئاخىرقى قېتىم ئىشلىتىلگەن';

  @override
  String get settingsAlphabetical => 'ئېلىپبە';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACY & SAFETY';

  @override
  String get settingsBlockedRatings => 'چەكلەنگەن باھا';

  @override
  String get settingsGeneralStyle => 'ئادەتتىكى ئۇسلۇب';

  @override
  String get settingsGeneralStyleSubtitle =>
      'تېما تەلەپپۇزى ، ئارقا كۆرۈنۈش ، كۆرگەن كۆرسەتكۈچ ۋە تېما مۇزىكىسى';

  @override
  String get settingsHomePage => 'باش بەت';

  @override
  String get settingsHomePageSubtitle =>
      'بۆلەكلەر ، رەسىم تىپلىرى ، قاپلاش ۋە مېدىيا ئالدىن كۆرۈش';

  @override
  String get settingsLibrariesSubtitle =>
      'كۈتۈپخانىنىڭ كۆرۈنۈشچانلىقى ، ھۆججەت قىسقۇچ كۆرۈنۈشى ۋە كۆپ مۇلازىمېتىر ھەرىكىتى';

  @override
  String get settingsTwentyFourHourClock => '24 سائەتلىك سائەت';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'سائەت كۆرسىتىلگەن يەردە 24 سائەت ۋاقىت فورماتىنى ئىشلىتىڭ';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'يولباشچى ستونىدا ئالماشتۇرۇش كۇنۇپكىسىنى كۆرسىتىڭ';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'يولباشچى ستونىدا ژانىر كۇنۇپكىسىنى كۆرسىتىڭ';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'يولباشچى ستونىدا ياقتۇرىدىغان كۇنۇپكىنى كۆرسىتىڭ';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'يولباشچى ستونىدىكى كۈتۈپخانىلار كۇنۇپكىسىنى كۆرسەت';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ھەر بىر كۈتۈپخانىنىڭ باش بېتىنىڭ كۆرۈنۈشىنى توغرىلاڭ. ئۆزگەرتىشنىڭ كۈچكە ئىگە بولۇشى ئۈچۈن Moonfin نى قايتا قوزغىتىڭ.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Media Bar & Local Previews';

  @override
  String get settingsVisualOverlays => 'Visual Overlays';

  @override
  String get settingsSeasonalSurprise => 'پەسىل خاراكتېرلىك ھەيران قېلىش';

  @override
  String get settingsMetadataAndRatings => 'Metadata & Ratings';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase قوشۇمچە مۇلازىمېتىر مەنبەلىرى ، Seerr تەلىپى ۋە ماس قەدەملىك تاللاشلارنى ئۆز ئىچىگە ئالىدۇ.';

  @override
  String get settingsOfflineDownloads => 'تورسىز چۈشۈرۈش';

  @override
  String get settingsHigh => 'ئېگىز';

  @override
  String get settingsLow => 'تۆۋەن';

  @override
  String get settingsCustomPath => 'Custom Path';

  @override
  String get settingsEnterDownloadFolderPath =>
      'چۈشۈرۈش قىسقۇچ يولىنى كىرگۈزۈڭ';

  @override
  String get settingsConcurrentDownloads => 'ماس قەدەملىك چۈشۈرۈش';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'بىراقلا چۈشۈرەلەيدىغان ئەڭ كۆپ تۈر.';

  @override
  String get settingsAppInfo => 'APP INFO';

  @override
  String get settingsReportAnIssue => 'مەلۇم بىر مەسىلىنى دوكلات قىلىڭ';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub دا مەسىلە ئىز قوغلىغۇچنى ئېچىڭ';

  @override
  String get settingsJoinDiscord => 'Discord غا قوشۇلۇڭ';

  @override
  String get settingsJoinDiscordSubtitle => 'مەھەللە بىلەن پاراڭلىشىڭ';

  @override
  String get settingsJoinTheDiscord => 'Discord غا قوشۇلۇڭ';

  @override
  String get settingsSupportMoonfin => 'Moonfin نى قوللاڭ';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'LEGAL';

  @override
  String get settingsLicenses => 'ئىجازەتنامە';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'ئوچۇق كودلۇق ئىجازەتنامە ئۇقتۇرۇشى';

  @override
  String get settingsPrivacyPolicy => 'مەخپىيەتلىك تۈزۈمى';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin سانلىق مەلۇماتلىرىڭىزنى قانداق بىر تەرەپ قىلىدۇ';

  @override
  String get settingsCheckForUpdates => 'يېڭىلانمىلارنى تەكشۈرۈڭ';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Moonfin نىڭ ئەڭ يېڭى تارقىتىلغانلىقىنى تەكشۈرۈڭ';

  @override
  String get settingsPoweredByFlutter => 'Flutter تەرىپىدىن ئىشلەنگەن';

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
  String get settingsBoth => 'ھەر ئىككىلىسى';

  @override
  String get settingsShuffleContentTypeFilter => 'Shuffle مەزمۇن تىپى سۈزگۈچ';

  @override
  String get settingsVideoPlaybackPreferences => 'سىن قويۇش مايىللىقى';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'يادرولۇق سىن ماتورى ۋە ئاقما سۈپەت تەڭشىكى';

  @override
  String get settingsAudioPreferences => 'ئاۋازلىق مايىللىق';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ئاۋاز يولى ، بىر تەرەپ قىلىش ۋە ئۆتكەلدىن ئۆتۈش تاللانمىلىرى';

  @override
  String get settingsAutomationAndQueue => 'ئاپتوماتلاشتۇرۇش ۋە ئۆچرەت';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ئاپتوماتىك قويۇش ۋە تەرتىپلەش';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'سۈپەت ، ساقلاش چەكلىمىسى ۋە ئۆچرەت چوڭلۇقىنى چۈشۈرۈڭ';

  @override
  String get settingsSyncplaySubtitle =>
      'گۇرۇپپا يىغىنلىرىنىڭ ماس قەدەملىك لوگىكىسى';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ئالاھىدە قويغۇچ ئىقتىدارلىرى. ئېھتىيات بىلەن ئىشلىتىڭ ، چۈنكى بەزى تاللاشلار قويۇش مەسىلىلىرىنى كەلتۈرۈپ چىقىرىشى مۇمكىن';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Intros ۋە Outros نى ئاتلاپ ئۆتۈپ كېتەمسىز؟';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'تېز ئىشلەتكۈچى';

  @override
  String get settingsSkip => 'ئاتلاش';

  @override
  String get settingsDoNothing => 'ھېچ ئىش قىلماڭ';

  @override
  String get settingsMaxBitrateDescription =>
      'ئاقما بىتنى قاپلاڭ. بۇ چەكتىن يۇقىرى مەزمۇنلار ماسلاشتۇرۇلىدۇ.';

  @override
  String get settingsMaxResolutionDescription =>
      'قويغۇچ تەلەپ قىلىدىغان ئەڭ چوڭ ئېنىقلىقنى چەكلەڭ. تېخىمۇ يۇقىرى ئېنىقلىقتىكى مەزمۇنلار كودلىنىدۇ.';

  @override
  String get settingsPlayerZoomDescription =>
      'سىننى ئېكرانغا قانداق ماسلاشتۇرۇش كېرەك.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'قويۇش ماتورى (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'ئاندىرويىد تېلېۋىزور ئۈسكۈنىلىرىدە سۈكۈتتىكى قويۇش ماتورىنى تاللاڭ. كېيىنكى قېتىملىق قويۇش يىغىنىغا ئۆزگەرتىشلەر قوللىنىلىدۇ.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (تەۋسىيە قىلىنغان)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (مىراس)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision چۈشۈش';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision كودلاش ئۈسكۈنىسى بولمىغان ئۈسكۈنىلەردە Dolby Vision ماۋزۇسىنىڭ ھەرىكىتى.';

  @override
  String get settingsAskEachTime => 'ھەر قېتىم سوراڭ';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 چۈشۈشنى ياخشى كۆرۈڭ';

  @override
  String get settingsPreferServerTranscode =>
      'مۇلازىمېتىرنىڭ كود نومۇرىنى تاللاڭ';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision ئارخىپى 7 بىۋاسىتە ئويۇن';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision ئارخىپى 7 كۈچەيتمە قەۋەت ئېقىمىنىڭ بىۋاسىتە ئوينىشى كېرەكلىكىنى كونترول قىلىدۇ.';

  @override
  String get settingsAutoAftkrtEnabled => 'ئاپتوماتىك (AFTKRT قوزغىتىلدى)';

  @override
  String get settingsEnabledOnThisDevice => 'بۇ ئۈسكۈنىدە قوزغىتىلدى';

  @override
  String get settingsDisabledPreferTranscode =>
      'چەكلەنگەن (transcode نى ياخشى كۆرۈڭ)';

  @override
  String get settingsResumeRewindDescription =>
      'قويۇشنى ئەسلىگە كەلتۈرگەندە (داۋاملىق كۆرۈشنى ياكى مېدىيا تۈر بېتىدىن) ، قانچە سېكۇنتنى قايتۇرۇش كېرەك؟';

  @override
  String get settingsUnpauseRewindDescription =>
      'ۋاقىتلىق توختىتىش كۇنۇپكىسىنى باسقاندىن كېيىن قايتا ئويناشنى ئەسلىگە كەلتۈرگەندە ، قانچە سېكۇنت قايتىشى كېرەك؟';

  @override
  String get settingsSkipBackLengthDescription =>
      'كەينىگە قايتۇرۇش كۇنۇپكىسىنى باسقاندىن كېيىن قانچە سېكۇنت كەينىگە سەكرىگىلى بولىدۇ.';

  @override
  String get settingsOneSecond => '1 سېكۇنت';

  @override
  String get settingsThreeSeconds => '3 سېكۇنت';

  @override
  String get settingsFortyFiveSeconds => '45 سېكۇنت';

  @override
  String get settingsSixtySeconds => '60 سېكۇنت';

  @override
  String get settingsSkipForwardLengthDescription =>
      'تېز ئىلگىرىلەش كۇنۇپكىسىنى باسقاندىن كېيىن قانچە سېكۇنت سەكرەش.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 دىن سىرتقى كود يەشكۈچ';

  @override
  String get settingsCinemaMode => 'Cinema Mode';

  @override
  String get settingsCinemaModeSubtitle =>
      'ئاساسلىق ئىقتىداردىن بۇرۇن يول باشلاش / ئالدىن ئويناش';

  @override
  String get settingsNextUpDisplayDescription =>
      'كېڭەيتىلگەن بۆلەك سەنئەت ئەسەرلىرى ۋە تەسۋىرلىرى تولۇق كارتىنى كۆرسىتىدۇ. Minimal ئىخچام تەتۈر ساناقنى كۆرسىتىدۇ. چەكلەنگەنلەر ئەسكەرتىشنى پۈتۈنلەي يوشۇرىدۇ.';

  @override
  String get settingsShort => 'قىسقا';

  @override
  String get settingsLong => 'ئۇزۇن';

  @override
  String get settingsVeryLong => 'بەك ئۇزۇن';

  @override
  String get settingsVideoStartDelay => 'Video Start Delay';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'نەق مەيدان تېلېۋىزىيە ئۈچۈن بىۋاسىتە قويۇشنى قوزغىتىڭ';

  @override
  String get settingsOpenGroups => 'گۇرۇپپىلارنى ئېچىڭ';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay گۇرۇپپىسىنى قۇرۇش ، قوشۇش ياكى باشقۇرۇش';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay قوزغىتىلدى';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'گۇرۇپپا كۆرۈش ئىقتىدارىنى قوزغىتىڭ';

  @override
  String get settingsSyncplayButton => 'SyncPlay كۇنۇپكىسى';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'يولباشچى ستونىدا SyncPlay كۇنۇپكىسىنى كۆرسەت';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Advanced Correction';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'ئىنچىكە ماس قەدەملىك لوگىكىنى قوزغىتىڭ';

  @override
  String get settingsSyncplaySyncCorrection => 'ماسقەدەملەش';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ماس قەدەمدە تۇرۇش ئۈچۈن قويۇشنى ئاپتوماتىك تەڭشەڭ';

  @override
  String get settingsSyncplaySpeedToSync => 'ماسقەدەملەش';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ماس قەدەمدە قويۇش سۈرئىتىنى تەڭشەشنى ئىشلىتىڭ';

  @override
  String get settingsSyncplaySkipToSync => 'ماسقەدەملەش';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'ماسقەدەملەشنى ئىزدەڭ';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ئەڭ تۆۋەن سۈرئەت كېچىكىشى';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'ئەڭ تېز سۈرئەتنى كېچىكتۈرۈش';

  @override
  String get settingsSyncplaySpeedDuration => 'سۈرئەت ۋاقتى';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ئەڭ تۆۋەن ئاتلاپ كېچىكىش';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay قوشۇمچە Offset';

  @override
  String get onNow => 'ھازىر';

  @override
  String get collections => 'توپلام';

  @override
  String get lastPlayed => 'Last Played';

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
  String get externalLists => 'External Home Row Lists';

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
}
