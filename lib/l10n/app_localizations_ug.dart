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
  String get accountPreferences => 'ھېسابات مايىللىقلىرى';

  @override
  String get interfaceLanguage => 'كۆرۈنمە يۈز تىلى';

  @override
  String get systemLanguageDefault => 'سىستېما سۈكۈتتىكىسى';

  @override
  String get signIn => 'تىزىملىتىڭ';

  @override
  String get empty => 'قۇرۇق';

  @override
  String connectingToServer(String serverName) {
    return '$serverName غا ئۇلىنىۋاتىدۇ';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
    return 'QuickConnect نى ئىشلەتكىلى بولمايدۇ: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect نى ئىشلەتكىلى بولمايدۇ ($status): $detail';
  }

  @override
  String get whosWatching => 'كىم كۆرۈۋاتىدۇ؟';

  @override
  String get addUser => 'ئىشلەتكۈچى قوشۇڭ';

  @override
  String get selectServer => 'مۇلازىمېتىرنى تاللاڭ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin نەشرى $version';
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
    return '«$serverName» مۇلازىمېتىرلىرىڭىزدىن چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String get cancel => 'بىكار قىلىش';

  @override
  String get remove => 'چىقىرىۋېتىش';

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
  String get settingsAppearanceTheme => 'ئەپ تېمىسى';

  @override
  String get detailScreenStyle => 'تەپسىلات ئېكرانى ئۇسلۇبى';

  @override
  String get detailScreenStyleSubtitle =>
      'كلاسسىك — moonfin نىڭ ئەسلى ئوتتۇرىغا توغرىلانغان ئورۇنلاشتۇرۇلۇشى. زامانىۋى — ماسلىشىشچان كىنو ئۇسلۇبىدىكى ئورۇنلاشتۇرۇلۇش.';

  @override
  String get detailScreenStyleMoonfin => 'كلاسسىك';

  @override
  String get detailScreenStyleModern => 'زامانىۋى';

  @override
  String get expandedTabs => 'كېڭەيتىلگەن بەتكۈچلەر';

  @override
  String get expandedTabsSubtitle =>
      'بەتكۈچلەرنى كۆرگەندە مەزمۇنىنى ئۆزلۈكىدىن كۆرسىتىدۇ. تاقىۋەتسىڭىز، ھەر بىر بەتكۈچنى قولدا ئېچىپ-ياپىسىز.';

  @override
  String get showTechnicalDetails => 'تېخنىكىلىق تەپسىلاتلار كۆرسىتىلسۇنمۇ؟';

  @override
  String get showTechnicalDetailsSubtitle =>
      'لەۋھە خۇلاسىسىدە كودېك، ئېنىقلىق ۋە ئېقىم ئۇچۇرلىرىنى كۆرسىتىدۇ';

  @override
  String get recommendationSystem => 'تەۋسىيە سىستېمىسى';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends يەرلىك ئامبار ئالگورىتمىنى ياكى توردىكى TMDb ئوخشاشلىق ئۆلچەملىرىنى ئىشلىتىڭ. ئەسكەرتىش: توردىكى تەۋسىيەلەرگە Seerr بىرىكمىسى كېرەك.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb ئوخشاشلىقى';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'ياش چەكلىمىسى چېكى قوللىنىلسۇنمۇ؟';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin Recommends تەۋسىيەلىرىنى نىشان مېدىيانىڭ ياش چەكلىمىسى بويىچە چەكلەيدۇ';

  @override
  String get interfaceStyle => 'كۆرۈنمە يۈز ئۇسلۇبى';

  @override
  String get interfaceStyleSubtitle =>
      'ئاپتوماتىك ئۈسكۈنىڭىزگە ماسلىشىدۇ. مۇئەييەن كۆرۈنۈشنى تاللاش ئۈچۈن Apple ياكى Material نى تاللاڭ.';

  @override
  String get interfaceStyleAutomatic => 'ئاپتوماتىك';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'ئەينەك سۈپىتى';

  @override
  String get glassQualitySubtitle =>
      'ئاپتوماتىك بۇ ئۈسكۈنىگە ئەڭ ماس ئەينەك ئۈنۈمىنى تاللايدۇ. تولۇق ھەقىقىي گۇڭگالاشتۇرۇشنى ئىشلىتىدۇ؛ يېنىكلىتىلگەن GPU قۇۋۋىتىنى تېجەيدىغان يېنىك ئەينەكنى ئىشلىتىدۇ.';

  @override
  String get glassQualityAuto => 'ئاپتوماتىك';

  @override
  String get glassQualityFull => 'تولۇق';

  @override
  String get glassQualityReduced => 'يېنىكلىتىلگەن';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'بۇ دېتالنى قايتا قوزغىماي Moonfin بىلەن Neon Pulse نى ئالماشتۇرۇڭ';

  @override
  String get customThemeTitle => 'ئىختىيارى تېما';

  @override
  String get customThemeSubtitle =>
      'ئىختىيارى تېمىلار Moonfin نىڭ كۆرۈنۈش ئېلېمېنتلىرىنى ئۆزگەرتىدۇ. ئۇسلۇبىڭىزغا ماس بىرىنى تاللاڭ.';

  @override
  String get keyboardPreferSystemIme => 'سىستېما ھەرپتاختىسىنى ئالدىن ئىشلىتىش';

  @override
  String get keyboardPreferSystemImeDescription =>
      'تېكىست كىرگۈزۈشتە سۈكۈتتە ئۈسكۈنىڭىزنىڭ كىرگۈزگۈچىنى ئىشلىتىدۇ';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ھازىرقى Moonfin قارىسىڭىز ھەممىڭىز ياخشى كۆرۈپ قالدىڭىز';

  @override
  String get themeNeonPulse => 'نېئون پۇلس';

  @override
  String get themeNeonPulseSubtitle =>
      'Magenta پارقىراقلىقى ، سىئەن تېكىستى ۋە تېخىمۇ كۈچلۈك خروم سېلىشتۇرمىسى بىلەن Synthwave ئۇسلۇبى';

  @override
  String get themeGlass => 'ئەينەك';

  @override
  String get themeGlassSubtitle =>
      'لەيلىمە گىرادىيېنت تەگلىك، تۇمانلاشقان يۈزلەر ۋە Apple كۆكى بېزىكى بار سۇيۇق ئەينەك ئۇسلۇبى';

  @override
  String get theme8BitHero => '8-بىت قەھرىمان';

  @override
  String get theme8BitHeroSubtitle =>
      'قويۇق رەڭ تاختىسى، بۆلەكسىمان گىرۋەكلەر، قاتتىق سايىلەر ۋە پىكسېل خەت نۇسخىسى بار رېترو پىكسېل ئۇسلۇبى';

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
    return '$target غا ئۇلانغىلى بولمىدى';
  }

  @override
  String get exitApp => 'چىقىش Moonfin?';

  @override
  String get exitAppConfirmation => 'چېكىنىشنى خالامسىز؟';

  @override
  String get exit => 'چىقىش';

  @override
  String get gameMenu => 'تىزىملىك';

  @override
  String get gamePaused => 'ۋاقىتلىق توختىتىلدى';

  @override
  String get gameSaveState => 'ھالەتنى ساقلاش';

  @override
  String get games => 'ئويۇنلار';

  @override
  String get gameLoadState => 'ھالەتنى يۈكلەش';

  @override
  String get gameFastForward => 'تېز ئالدىغا سۈرۈش';

  @override
  String get gameEmulatorSettings => 'ئېمۇلياتور تەڭشەكلىرى';

  @override
  String get gameNoCoreOptions =>
      'بۇ يادرونىڭ تەڭشىگىلى بولىدىغان تاللانمىلىرى يوق.';

  @override
  String get gameHoldToOpenMenu => 'تىزىملىكنى ئېچىش ئۈچۈن بېسىپ تۇرۇڭ';

  @override
  String get gamePlaybackUnsupported =>
      'بۇ ئۈسكۈنە ئويۇن ئوينىتىشنى تېخى قوللىمايدۇ.';

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
  String get recordings => 'خاتىرىلەنگەن پروگراممىلار';

  @override
  String get schedule => 'ۋاقىت جەدۋىلى';

  @override
  String get series => 'تېلېۋىزىيە تىياتىرلىرى';

  @override
  String get noItemsFound => 'ھېچقانداق نەرسە تېپىلمىدى';

  @override
  String get home => 'باش بەت';

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
  String get library => 'مېدىيا ئامبىرى';

  @override
  String get displaySettings => 'تەڭشەكلەرنى كۆرسىتىش';

  @override
  String get allGenres => 'بارلىق ژانىرلار';

  @override
  String get noGenresFound => 'ھېچقانداق ژانىر تېپىلمىدى';

  @override
  String failedToLoadFolderError(String error) {
    return 'قىسقۇچ يۈكلىنەلمىدى: $error';
  }

  @override
  String get thisFolderIsEmpty => 'بۇ ھۆججەت قىسقۇچ قۇرۇق';

  @override
  String itemCountLabel(int count) {
    return '$count تۈر';
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
    return '$count تۈر';
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
  String get sortBy => 'تەرتىپلەش ئاساسى';

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
    return '$name — ژانىرلار';
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
    return '$count مىنۇت ئىلگىرى';
  }

  @override
  String hoursAgo(int count) {
    return '$count سائەت ئىلگىرى';
  }

  @override
  String daysAgo(int count) {
    return '$count كۈن ئىلگىرى';
  }

  @override
  String get discoverySubjects => 'بايقاش سۇبيېكتى';

  @override
  String get pickDiscoverySubjects =>
      '«بايقاش» تا قايسى مەزمۇننى كۆرسىتىدىغانلىقىنى تاللاڭ.';

  @override
  String get apply => 'قوللىنىش';

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
    return '$count ئەسەر';
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
  String get resume => 'داۋاملاشتۇرۇش';

  @override
  String get failedToLoadLibrary => 'كۈتۈپخانىنى يۈكلىيەلمىدى';

  @override
  String get popularNow => 'ھازىر مودا';

  @override
  String get savedForLater => 'كېيىن ساقلاندى';

  @override
  String get topListens => 'ئەڭ كۆپ ئاڭلانغانلار';

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
    return '$count ئاپتور';
  }

  @override
  String genresCount(int count) {
    return '$count ژانىر';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% تاماملاندى';
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
    return 'ئوقۇشقا قولايلىق كۆرۈش ئۈچۈن $count ئەسەر تىزىلدى.';
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
    return '$label تېپىلمىدى';
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
  String get watched => 'كۆرۈلگەن';

  @override
  String get unread => 'ئوقۇمىغان';

  @override
  String get unwatched => 'كۆرۈلمىگەن';

  @override
  String get seriesStatus => 'يۈرۈشلۈك ھالىتى';

  @override
  String get allLibraries => 'بارلىق كۇتۇپخانىلار';

  @override
  String get books => 'كىتابلار';

  @override
  String get latestBooks => 'ئەڭ يېڭى كىتابلار';

  @override
  String get latestAudiobooks => 'ئەڭ يېڭى ئاۋازلىق كىتابلار';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كىتاب',
      one: '1 كىتاب',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'كىتاب';

  @override
  String get bookFormatAudiobook => 'ئاۋازلىق كىتاب';

  @override
  String bookPercentRead(int percent) {
    return '$percent% ئوقۇلدى';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time قالدى';
  }

  @override
  String get bookHeroRead => 'ئوقۇش';

  @override
  String get bookHeroListen => 'ئاڭلاش';

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
  String get rssFeed => 'RSS قانىلى';

  @override
  String get downloadZip => 'Zip نى چۈشۈرۈڭ';

  @override
  String sectionCountLabel(int count) {
    return '$count بۆلەك';
  }

  @override
  String firstPublished(int year) {
    return 'تۇنجى نەشرى $year';
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
    return '$count كىتاب';
  }

  @override
  String get couldNotLoadSubject => 'بۇ تېمىنى ھازىرچە يۈكلىيەلمىدى.';

  @override
  String get audiobookDetails => 'ئۈندىدار تەپسىلاتى';

  @override
  String authorsCountTitle(int count) {
    return '$count ئاپتور';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ئاۋازلىق كىتاب',
      one: '1 ئاۋازلىق كىتاب',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ئىز تىزىملىكى';

  @override
  String get itemListPlaceholder => 'تۈر تىزىملىكى بۇ يەردە كۆرۈنىدۇ';

  @override
  String get failedToLoad => 'يۈكلەش مەغلۇپ بولدى';

  @override
  String get delete => 'ئۆچۈرۈش';

  @override
  String get save => 'ساقلاش';

  @override
  String get moreLikeThis => 'بۇنىڭغا ئوخشاش';

  @override
  String get castAndCrew => 'ئارتىسلار ۋە خادىملار';

  @override
  String get collection => 'توپلام';

  @override
  String get episodes => 'بۆلۈملەر';

  @override
  String get nextUp => 'كېيىنكىسى';

  @override
  String get seasons => 'پەسىللەر';

  @override
  String get chapters => 'باب';

  @override
  String get features => 'ئالاھىدە مەزمۇنلار';

  @override
  String get movies => 'كىنولار';

  @override
  String get musicVideos => 'مۇزىكا سىنلىرى';

  @override
  String get other => 'باشقىلىرى';

  @override
  String get discography => 'ئالبوملار';

  @override
  String get similarArtists => 'مۇشۇنىڭغا ئوخشاش سەنئەتكارلار';

  @override
  String get tableOfContents => 'مەزمۇن جەدۋىلى';

  @override
  String get tracklist => 'ئىز قوغلاش تىزىملىكى';

  @override
  String discNumber(int number) {
    return 'دىسكا $number';
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
    return 'نەشرى $year';
  }

  @override
  String get publicationDateUnknown => 'ئېلان قىلىنغان ۋاقتى نامەلۇم';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پەسىل',
      one: '1 پەسىل',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time دە ئاخىرلىشىدۇ';
  }

  @override
  String get items => 'تۈرلەر';

  @override
  String get extras => 'قوشۇمچىلار';

  @override
  String get behindTheScenes => 'سەھنە ئارقىسى';

  @override
  String get deletedScenes => 'ئۆچۈرۈلگەن كۆرۈنۈشلەر';

  @override
  String get featurettes => 'قىسقا تونۇشتۇرمىلار';

  @override
  String get interviews => 'سۆھبەتلەر';

  @override
  String get scenes => 'كۆرۈنۈشلەر';

  @override
  String get shorts => 'قىسقا فىلىملەر';

  @override
  String get trailers => 'ئالدىن كۆرۈنۈشلەر';

  @override
  String timeRemaining(String time) {
    return '$time قالدى';
  }

  @override
  String endsIn(String time) {
    return '$time دىن كېيىن ئاخىرلىشىدۇ';
  }

  @override
  String get view => 'كۆرۈش';

  @override
  String get resumeReading => 'ئوقۇشنى ئەسلىگە كەلتۈرۈش';

  @override
  String get read => 'ئوقۇ';

  @override
  String resumeFrom(String position) {
    return '$position دىن داۋاملاشتۇرۇش';
  }

  @override
  String get play => 'قويۇش';

  @override
  String get startOver => 'باشلاش';

  @override
  String get restart => 'قايتا قوزغىتىڭ';

  @override
  String get readOffline => 'تورسىز ئوقۇش';

  @override
  String get playOffline => 'Offline نى ئويناڭ';

  @override
  String get audio => 'ئاۋاز';

  @override
  String get subtitles => 'ئېكران خېتى';

  @override
  String get version => 'نەشرى';

  @override
  String get cast => 'ئېكرانغا چىقىرىش';

  @override
  String get trailer => 'ئالدىن كۆرۈنۈش';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'قويۇش تىزىملىكىنىڭ نامىنى ئۆزگەرتىڭ';

  @override
  String get playlistName => 'قويۇش تىزىملىكى';

  @override
  String get deleteDownloadedAlbum => 'چۈشۈرۈلگەن پىلاستىنكىنى ئۆچۈرۈڭ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '«$title» نىڭ چۈشۈرۈلگەن ناخشىلىرى ئۆچۈرۈلسۇنمۇ؟';
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
    return '$itemLabel يۈكلەنمىدى';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title چۈشۈرۈلۈۋاتىدۇ ($count تۈر)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '«$name» مۇلازىمېتىردىن راستىنلا ئۆچۈرۈلسۇنمۇ؟ بۇ مەشغۇلاتنى ئەسلىگە قايتۇرغىلى بولمايدۇ.';
  }

  @override
  String get itemDeleted => 'تۈر ئۆچۈرۈلدى';

  @override
  String get noPlayableTrailerFound =>
      'قويغىلى بولىدىغان يۈك ماشىنىسى تېپىلمىدى.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'قوللىمايدىغان كىتاب فورماتى: .$extension';
  }

  @override
  String get audioTrack => 'ئاۋاز يولى';

  @override
  String get subtitleTrack => 'ئېكران خېتى يولى';

  @override
  String get none => 'يوق';

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
    return 'ئېكران خېتى چۈشۈرۈلۈپ تاللاندى: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitle download. Jellyfin بۇ نەرسىنى يېڭىلىغاندا بىر ئاز ۋاقىت كېتىشى مۇمكىن.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language ئۈچۈن توردىن ئېكران خېتى تېپىلمىدى.';
  }

  @override
  String get selectVersion => 'نەشرىنى تاللاڭ';

  @override
  String versionNumber(int number) {
    return 'نەشر $number';
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
    return '$name چۈشۈرۈلۈۋاتىدۇ ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'چۈشۈرۈلگەن ھۆججەتلەرنى ئۆچۈرۈڭ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel نىڭ يەرلىك ھۆججەتلىرى ئۆچۈرۈلسۇنمۇ؟\n\nبۇ ساقلاش بوشلۇقىنى بىكارلايدۇ. كېيىن قايتا چۈشۈرەلەيسىز.';
  }

  @override
  String get downloadedFilesDeleted => 'چۈشۈرۈلگەن ھۆججەتلەر ئۆچۈرۈلدى';

  @override
  String get failedToDeleteFiles => 'ھۆججەتلەرنى ئۆچۈرەلمىدى';

  @override
  String get deleteFiles => 'ھۆججەتلەرنى ئۆچۈرۈڭ';

  @override
  String get director => 'رېژىسسور';

  @override
  String get directors => 'رېژىسسورلار';

  @override
  String get writer => 'سىنارىيەچى';

  @override
  String get writers => 'يازغۇچىلار';

  @override
  String get studio => 'ئىستۇدىيە';

  @override
  String studioMoreCount(int count) {
    return 'يەنە +$count';
  }

  @override
  String totalEpisodes(int count) {
    return '$count بۆلۈم';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number-بۆلۈم';
  }

  @override
  String chapterNumber(int number) {
    return '$number-باب';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ناخشا',
      one: '1 ناخشا',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count باب',
      one: '1 باب',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'تۇغۇلغان: $date';
  }

  @override
  String died(String date) {
    return 'ۋاپات بولغان: $date';
  }

  @override
  String age(int age) {
    return 'يېشى: $age';
  }

  @override
  String get showLess => 'ئازراق كۆرسەت';

  @override
  String get readMore => 'تېخىمۇ كۆپ ئوقۇڭ';

  @override
  String get shuffle => 'تەرتىپسىز قويۇش';

  @override
  String get shuffleAllMusic => 'بارلىق مۇزىكىنى تەرتىپسىز قويۇش';

  @override
  String get carSignInPrompt => 'تېلېفونىڭىزدا Moonfin غا كىرىڭ';

  @override
  String get carServerUnreachable => 'مۇلازىمېتىرىڭىزغا ئۇلانغىلى بولمىدى';

  @override
  String downloadsCount(int count) {
    return '$count قېتىم چۈشۈرۈلگەن';
  }

  @override
  String get perfectMatch => 'مۇكەممەل ماسلاشتۇرۇش';

  @override
  String channelsCount(int count) {
    return '$count قانال';
  }

  @override
  String get mono => 'مونو';

  @override
  String get stereo => 'ستېرېئو';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'توردىن ئېكران خېتى $action مەشغۇلاتىغا بۇ ئىشلەتكۈچىنىڭ Jellyfin ئېكران خېتى باشقۇرۇش ھوقۇقى كېرەك.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'توردىن ئېكران خېتى $action ئۈچۈن بۇ تۈر مۇلازىمېتىردىن تېپىلمىدى.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'توردىن ئېكران خېتى $action مەغلۇپ بولدى: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'توردىن ئېكران خېتى $action مەغلۇپ بولدى (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'توردىكى ئېكران خېتىنى $action قىلىش مەغلۇپ بولدى.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '«$name» نىڭ بارلىق چۈشۈرۈلگەن بۆلۈملىرى';
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
    return '$label مەشغۇلاتى مەغلۇپ بولدى: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'ئېكرانغا يوللاش ئاۋاز مىقدارىنى تەڭشەش مەغلۇپ بولدى: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label كونتروللىرى';
  }

  @override
  String get deviceVolume => 'ئۈسكۈنىنىڭ ھەجىمى';

  @override
  String get unavailable => 'ئىشلەتكىلى بولمايدۇ';

  @override
  String get pause => 'ۋاقىتلىق توختىتىش';

  @override
  String get syncPosition => 'ماس قەدەم ئورنى';

  @override
  String stopCast(String label) {
    return '$label نى توختىتىش';
  }

  @override
  String get queueIsEmpty => 'ئۆچرەت قۇرۇق';

  @override
  String trackNumber(int number) {
    return '$number-ناخشا';
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
    return '$seconds سېكۇنت';
  }

  @override
  String get longPressToUnlock => 'قۇلۇپنى ئۇزۇن بېسىڭ';

  @override
  String get off => 'تاقاق';

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
  String get bitrateOverride => 'بىت نىسبىتى قولدا بەلگىلەنگەن';

  @override
  String get audioDelay => 'ئاۋاز كېچىكتۈرۈش';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'ئېكران خېتى كېچىكتۈرۈش';

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
  String get directPlay => 'بىۋاسىتە قويۇش';

  @override
  String get directStream => 'بىۋاسىتە ئېقىم';

  @override
  String get transcoding => 'كود ئۆزگەرتىش';

  @override
  String get transcodeReasons => 'Transcode سەۋەبلىرى';

  @override
  String get player => 'قويغۇچ';

  @override
  String get container => 'كونتېينېر';

  @override
  String get bitrate => 'بىت نىسبىتى';

  @override
  String get video => 'سىن';

  @override
  String get resolution => 'قارار';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'كودېك';

  @override
  String get videoBitrate => 'سىن بىت نىسبىتى';

  @override
  String get track => 'ئاۋاز يولى';

  @override
  String get channels => 'قاناللار';

  @override
  String get audioBitrate => 'ئاۋاز بىت نىسبىتى';

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
    return '$protocol سېئانس خاتالىقى';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'كىتاب تەپسىلاتلىرى يۈكلىنەلمىدى: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'بۇ سۇپىدا EPUB نى كۆرسىتىش تېخىچە يوق.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'بۇ فورماتنى (.$extension) ئەپ ئىچىدە تېخى كۆرسەتكىلى بولمايدۇ.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'قىستۇرما ھۆججەتلەرنى بۇ سۇپىدا ئىشلەتكىلى بولمايدۇ.';

  @override
  String get couldNotOpenExternalViewer => 'سىرتقى كۆرگۈچنى ئاچالمىدى.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ئەپ ئىچىدىكى ئوقۇغۇچ ئېچىلمىدى: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label دا خەتكۈش ئاللىبۇرۇن ساقلانغان.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'خەتكۈش قوشۇلدى: $label';
  }

  @override
  String get noBookmarksYet =>
      'خەتكۈچ يوق.\nئورنىڭىزنى ساقلاش ئۈچۈن ئوقۇۋاتقاندا خەتكۈچ سىنبەلگىسىنى چېكىڭ.';

  @override
  String get noTableOfContentsAvailable => 'جەدۋەل يوق';

  @override
  String pageLabel(int number) {
    return '$number-بەت';
  }

  @override
  String get position => 'ئورنى';

  @override
  String get bookReader => 'كىتاب ئوقۇغۇچ';

  @override
  String formatExtension(String extension) {
    return 'فورماتى: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% ئوقۇلدى';
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
    return 'چوڭايتىشنى ئەسلىگە قايتۇرۇش (${zoom}x)';
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
    return 'ئوقۇلغان ھالەتنى يېڭىلاش مەغلۇپ بولدى: $error';
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
    return 'بۇ سۇپا $extension ھۆججەتلىرى ئۈچۈن قىستۇرما پۈتۈك ماتورىنى قوللىمايدۇ.';
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
  String get seriesRecordings => 'تىياتىر خاتىرىلەنمىلىرى';

  @override
  String get now => 'ھازىر';

  @override
  String get sports => 'تەنھەرىكەت';

  @override
  String get news => 'خەۋەرلەر';

  @override
  String get kids => 'بالىلار';

  @override
  String get premiere => 'تۇنجى قويۇلۇش';

  @override
  String get guideTimeline => 'يېتەكچى ۋاقىت';

  @override
  String failedToLoadGuide(String error) {
    return 'پروگرامما جەدۋىلى يۈكلىنەلمىدى: $error';
  }

  @override
  String get noChannelsFound => 'ھېچقانداق قانال تېپىلمىدى';

  @override
  String get liveBadge => 'بىۋاسىتە';

  @override
  String guideNextProgram(String time, String title) {
    return 'كېيىنكىسى: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes مىنۇت قالدى';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours سائەت قالدى';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours سائەت $minutes مىنۇت قالدى';
  }

  @override
  String get movie => 'كىنو';

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
  String get record => 'خاتىرىلەش';

  @override
  String get cancelRecordingAction => 'خاتىرىلەشنى بىكار قىلىش';

  @override
  String get programSetToRecord => 'پروگرامما خاتىرىلەشكە بەلگىلەندى';

  @override
  String get recordingCancelled => 'خاتىرىلەش بىكار قىلىندى';

  @override
  String get unableToCreateRecording => 'خاتىرىلەش قۇرغىلى بولمىدى';

  @override
  String get watch => 'كۆرۈش';

  @override
  String get close => 'تاقاش';

  @override
  String failedToPlayChannel(String name) {
    return '$name نى قويغىلى بولمىدى';
  }

  @override
  String get failedToLoadRecordings => 'خاتىرىلەرنى يۈكلىيەلمىدى';

  @override
  String get scheduledInNext24Hours =>
      'كېيىنكى 24 سائەت ئىچىدە ئورۇنلاشتۇرۇلغان';

  @override
  String get recentRecordings => 'يېقىنقى خاتىرىلەر';

  @override
  String get tvSeries => 'تېلېۋىزىيە تىياتىرلىرى';

  @override
  String get failedToLoadSchedule => 'ۋاقىت جەدۋىلىنى يۈكلىيەلمىدى';

  @override
  String get noScheduledRecordings => 'پىلانلانغان خاتىرىلەر يوق';

  @override
  String get cancelRecording => 'خاتىرىلەشنى ئەمەلدىن قالدۇرامسىز؟';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '«$name» نىڭ پىلانلانغان خاتىرىلىشى بىكار قىلىنسۇنمۇ؟';
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
    return '«$name» نى خاتىرىلەش توختىتىلسۇنمۇ؟';
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
    return '«$query» ئۈچۈن نەتىجە يوق';
  }

  @override
  String searchFailedError(String error) {
    return 'ئىزدەش مەغلۇپ بولدى: $error';
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
    return '«$name» ۋە ھۆججەتلىرى چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String tracksCount(int count) {
    return '$count ناخشا';
  }

  @override
  String get album => 'ئالبوم';

  @override
  String get playAlbum => 'پىلاستىنكا قويۇڭ';

  @override
  String failedToLoadAlbum(String error) {
    return 'ئالبوم يۈكلىنەلمىدى: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name ئۈچۈن چۈشۈرۈلگەن ناخشا تېپىلمىدى.';
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
    return '«$name» چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes مىنۇت';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number-بۆلۈم';
  }

  @override
  String get seriesNotFound => 'يۈرۈشلۈك تېپىلمىدى';

  @override
  String get errorLoadingSeries => 'يۈكلەش يۈرۈشلۈكلىرى';

  @override
  String get downloadedEpisodes => 'چۈشۈرۈلگەن بۆلەكلەر';

  @override
  String seasonNumber(int number) {
    return '$number-پەسىل';
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
    return '$season دىكى بارلىق چۈشۈرۈلگەن بۆلۈملەر ئۆچۈرۈلسۇنمۇ؟';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بۆلۈم',
      one: '1 بۆلۈم',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ساقلاش باشقۇرۇش';

  @override
  String get storageBreakdown => 'ساقلاش بوشلۇقى تەپسىلاتى';

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
    return '$count چۈشۈرۈلگەن تۈر ئۆچۈرۈلسۇنمۇ؟';
  }

  @override
  String get musicAndAudiobooks => 'مۇزىكا ۋە ئاۋازلىق كىتاب';

  @override
  String get images => 'سۈرەتلەر';

  @override
  String get database => 'ساندان';

  @override
  String ofStorageLimit(String limit) {
    return '$limit چېكىدىن';
  }

  @override
  String get settings => 'تەڭشەك';

  @override
  String get authentication => 'دەلىللەش';

  @override
  String get autoLoginServerManagement =>
      'ئاپتوماتىك كىرىش ، مۇلازىمېتىر باشقۇرۇش';

  @override
  String get pinCode => 'PIN كودى';

  @override
  String get setUpPinCodeProtection => 'PIN كود قوغداشنى تەڭشەڭ';

  @override
  String get parentalControls => 'ئاتا-ئانىلارنىڭ كونتروللۇقى';

  @override
  String get contentRatingRestrictions => 'مەزمۇن دەرىجىسىنى چەكلەش';

  @override
  String get bitRateResolutionBehavior => 'بىت نىسبىتى، ئېنىقلىق، ھەرىكەت';

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
  String get administration => 'باشقۇرۇش';

  @override
  String get serverSettingsUsersLibraries =>
      'مۇلازىمېتىر تەڭشىكى ، ئىشلەتكۈچى ، كۈتۈپخانىلار';

  @override
  String get customization => 'خاسلاشتۇرۇش';

  @override
  String get themeAndLayout => 'تېما ۋە ئورۇنلاشتۇرۇش';

  @override
  String get videoAndSubtitles => 'سىن ۋە ئېكران خېتى';

  @override
  String get integrations => 'بىرىكتۈرۈش';

  @override
  String get pluginAndRequests => 'قىستۇرما ۋە تەلەپلەر';

  @override
  String get customizeAccountPlaybackInterface =>
      'ھېسابات ، قويۇش ۋە كۆرۈنمە يۈز ھەرىكىتىنى خاسلاشتۇرۇڭ';

  @override
  String optionsCount(int count) {
    return '$count تاللانما';
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
  String get episodesOnly => 'بۆلۈملەرلا';

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
  String get confetti => 'رەڭلىك قەغەزلەر';

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
  String get themeMusicSettingsSubtitle =>
      'تەپسىلات بەتلىرى، باش بەت قۇرلىرى ۋە ئاۋاز مىقدارى';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ئائىلە قۇرلىرىدىكى تېما مۇزىكىسى';

  @override
  String get playWhenBrowsingHomeScreen => 'ئائىلە ئېكرانىنى كۆرگەندە ئويناڭ';

  @override
  String get loopThemeMusic => 'تېما مۇزىكىسىنى تەكرارلاش';

  @override
  String get loopThemeMusicSubtitle =>
      'بىر قېتىملا قويماي، ناخشىنى تەكرار قويىدۇ';

  @override
  String get detailsBackgroundBlur => 'تەپسىلاتى ئارقا كۆرۈنۈش';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ئارقا كۆرۈنۈشنى كۆرۈش';

  @override
  String get maxStreamingBitrate => 'ئەڭ يۇقىرى ئېقىم بىت نىسبىتى';

  @override
  String get maxResolution => 'ئەڭ يۇقىرى ئېنىقلىق';

  @override
  String get playerZoomMode => 'قويغۇچ چوڭايتىش ھالىتى';

  @override
  String get settingsScrollWheelAction => 'مائۇس سىيرىش چاقى';

  @override
  String get settingsScrollWheelActionDescription =>
      'قويۇش جەريانىدا مائۇس چاقىنى سىن ئۈستىدە سىيرىغاندا نېمە بولىدىغانلىقىنى تاللاڭ.';

  @override
  String get scrollWheelActionOff => 'تاقاق';

  @override
  String get scrollWheelActionSeek => 'ئاتلاش (ئالدىغا / كەينىگە)';

  @override
  String get scrollWheelActionVolume => 'ئاۋاز مىقدارى';

  @override
  String get playerTooltipVolume => 'ئاۋاز مىقدارى';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'ئاپتوماتىك كېسىش';

  @override
  String get stretch => 'سوزۇش';

  @override
  String get refreshRateSwitching => 'باھا ئالماشتۇرۇشنى يېڭىلاش';

  @override
  String get disabled => 'تاقالغان';

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
  String get audioBehavior => 'ئاۋاز ھەرىكىتى';

  @override
  String get downmixToStereo => 'ستېرېئوغا تۆۋەنلىتىش';

  @override
  String get defaultAudioLanguage => 'كۆڭۈلدىكى ئاۋاز تىلى';

  @override
  String get fallbackAudioLanguage => 'زاپاس ئاۋاز تىلى';

  @override
  String get preferDefaultAudioTrack => 'سۈكۈتتىكى ئاۋاز يولىنى ئالدىن تاللاش';

  @override
  String get preferDefaultAudioTrackDescription =>
      'يەرلىكلەشتۈرۈلگەن دۇبلياژدىن كۆرە ئەسلى ئاۋاز يولىنى ئالدىن تاللايدۇ.';

  @override
  String get preferAudioDescription =>
      'ئاۋازلىق چۈشەندۈرۈش يوللىرىنى ئالدىن تاللاش';

  @override
  String get preferAudioDescriptionDescription =>
      'نورمال يوللاردىن كۆرە ئاۋازلىق چۈشەندۈرۈش يوللىرىنى ئالدىن تاللايدۇ.';

  @override
  String get transcodingAudio => 'كود ئۆزگەرتىش (ئاۋاز)';

  @override
  String get directStreamRemux => 'بىۋاسىتە ئېقىم (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'كود ئۆزگەرتىش (بىت نىسبىتى ياكى ئېنىقلىق)';

  @override
  String get transcodingVideoAndAudio => 'كود ئۆزگەرتىش (سىن ۋە ئاۋاز)';

  @override
  String get transcodingVideo => 'كود ئۆزگەرتىش (سىن)';

  @override
  String get autoServerDefault => 'ئاپتوماتىك (مۇلازىمېتىر سۈكۈتتىكى)';

  @override
  String get english => 'ئىنگىلىزچە';

  @override
  String get spanish => 'ئىسپانچە';

  @override
  String get french => 'فىرانسۇزچە';

  @override
  String get german => 'گېرمانچە';

  @override
  String get italian => 'ئىتالىيانچە';

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
  String get hindi => 'ھىندىچە';

  @override
  String get dutch => 'گوللاندىيە';

  @override
  String get swedish => 'شىۋىتسىيە';

  @override
  String get norwegian => 'نورۋېگچە';

  @override
  String get danish => 'دانىيەچە';

  @override
  String get finnish => 'فىنلاندىيە';

  @override
  String get polish => 'پولشا';

  @override
  String get ac3Passthrough => 'AC3 بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get dtsPassthrough => 'DTS بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get trueHdSupport => 'TrueHD قوللاش';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ئاۋاز پەقەت AVR غا; قوبۇللىغۇچنى قوللاش ۋە DTS مەنبە يولىنى تەلەپ قىلىدۇ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ئاۋازىنى قوزغىتىڭ (بارلىق سۇپىلاردا ئىشلىمەسلىكى مۇمكىن)';

  @override
  String get settingsAudioOutputMode => 'ئاۋاز چىقىرىش ھالىتى';

  @override
  String get settingsAudioOutputModeDescription =>
      'ئاۋازنىڭ قانداق كودسىزلىنىدىغانلىقىنى تاللاڭ. AVR بىۋاسىتە ئۆتكۈزۈش خام Dolby/DTS ئېقىملىرىنى قوبۇللىغۇچىڭىزغا ئەۋەتىدۇ؛ ئاپتوماتىك ياكى تۆۋەنلىتىش يەرلىك كودسىزلايدۇ.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioFallbackCodec => 'زاپاس ئاۋاز كودېكى';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'مەنبە ئېقىمنى بىۋاسىتە قويغىلى ياكى بىۋاسىتە ئۆتكۈزگىلى بولمىغاندا، كۆپ قاناللىق ئاۋازنى كود ئۆزگەرتىدىغان نىشان فورماتنى تاللاڭ.';

  @override
  String get settingsAudioFallbackCodecAuto => 'ئاپتوماتىك تونۇش\n(تەۋسىيە)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(سۈكۈتتىكى)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(يوقىتىشسىز)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(پەقەت ستېرېئو)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ئۈنۈملۈك)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(يوقىتىشسىز)';

  @override
  String get settingsMaxAudioChannels => 'ئەڭ كۆپ ئاۋاز قاناللىرى';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'ئاۋاز ئۈسكۈنىڭىزنىڭ ئەڭ كۆپ قانال سانىنى تەڭشەڭ. بۇ چەكتىن ئاشقان كۆپ قاناللىق ئېقىملار تۆۋەنلىتىلىدۇ ياكى كود ئۆزگەرتىلىدۇ.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ئاپتوماتىك تونۇش\n(قاتتىق دېتال سۈكۈتتىكىسى)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 مونو';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ستېرېئو';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 ئورام ئاۋاز';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 تۆت قاناللىق';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 ئورام ئاۋاز';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 ئورام ئاۋاز';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 ئورام ئاۋاز';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 ئورام ئاۋاز';

  @override
  String get settingsAudioPassthroughAdvanced => 'بىۋاسىتە ئۆتكۈزۈش (ئالىي)';

  @override
  String get settingsAudioCodecPassthrough => 'كودېك بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'پەقەت AVR ياكى HDMI ئۈسكۈنىڭىز قوللايدىغان فورماتلارنىلا قوزغىتىڭ.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioEac3JocPassthrough =>
      'EAC3 JOC (Atmos) بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS يادرو بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioTrueHdAtmosPassthrough =>
      'TrueHD Atmos بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) بىت ئېقىمىنى سىرتقى كودسىزلىغۇچقا ئەۋەتىدۇ.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) ئۈستىدىكى Dolby Atmos بىت ئېقىمىنى سىرتقى كودسىزلىغۇچقا ئەۋەتىدۇ.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS يادروسى بىلەن) بىت ئېقىمىنى سىرتقى كودسىزلىغۇچقا ئەۋەتىدۇ.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos مېتا ئۇچۇرلۇق Dolby TrueHD بىت ئېقىمىنى سىرتقى كودسىزلىغۇچقا ئەۋەتىدۇ.';

  @override
  String get settingsDetectedAudioCapabilities => 'تونۇلغان ئاۋاز ئىقتىدارلىرى';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ئىجرا ۋاقتى ئىقتىدار كۆرۈنۈشى تېخى يوق.';

  @override
  String get settingsAudioRouteLabel => 'يۆنىلىش';

  @override
  String get settingsAudioDecodeLabel => 'كودسىزلاش';

  @override
  String get settingsAudioPassthroughLabel => 'بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioHdRoute => 'HD ئاۋاز يۆنىلىشى';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ياڭراتقۇ';

  @override
  String get settingsAudioRouteHeadphones => 'تىڭشىغۇچ';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count قانال PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'دىئاگنوز';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'سىن دەرىجىسى';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'سىن دائىرىسى';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'ئېكران خېتى كودېكى';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'رۇخسەت قىلىنغان ئاۋاز كودېكلىرى';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ئاۋاز كودېكلىرى';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ئاۋاز كودېكلىرى';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'ئاكتىپ ئاۋاز يۆنىلىشى';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'يۆنىلىشنىڭ HD ئاۋاز قوللىشى';

  @override
  String get nightMode => 'كېچە ھالىتى';

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
  String get nextUpDisplay => 'كېيىنكىسى كۆرسىتىلىشى';

  @override
  String get extended => 'كېڭەيتىلگەن';

  @override
  String get minimal => 'ئاددىي';

  @override
  String get nextUpTimeout => 'كېيىنكىسى ۋاقىت چېكى';

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
    return '$episodes بۆلۈم / $hours سائەتتىن كېيىن';
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
  String get customMpvConfPath => 'خاسلاشتۇرۇلغان mpv.conf يولى';

  @override
  String get notSetMpvConf =>
      'تەڭشەلمىدى. Moonfin ئەپ / سانلىق مەلۇمات قىسقۇچتا سۈكۈتتىكى mpv.conf نى سىنايدۇ.';

  @override
  String get selectMpvConf => 'mpv.conf نى تاللاڭ';

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
  String get subtitleSize => 'ئېكران خېتى چوڭلۇقى';

  @override
  String get textFillColor => 'تېكىست تولدۇرۇش رەڭگى';

  @override
  String get backgroundColor => 'تەگلىك رەڭگى';

  @override
  String get textStrokeColor => 'خەت گىرۋەك رەڭگى';

  @override
  String get subtitleCustomization => 'ئېكران خېتىنى خاسلاشتۇرۇش';

  @override
  String get subtitleCustomizationDescription => 'تارماق كۆرۈنۈشنى خاسلاشتۇرۇڭ';

  @override
  String get subtitleMode => 'ئېكران خېتى ھالىتى';

  @override
  String get subtitleModeFlagged => 'بەلگىلەنگەن';

  @override
  String get subtitleModeAlways => 'ھەمىشە';

  @override
  String get subtitleModeForeign => 'چەت تىلى';

  @override
  String get subtitleModeForced => 'مەجبۇرىي';

  @override
  String get subtitleModeFlaggedDescription =>
      'مېدىيا ھۆججىتىنىڭ مېتا ئۇچۇرىدا «سۈكۈتتىكى» ياكى «مەجبۇرىي» دەپ بەلگىلەنگەن يوللارنى قويىدۇ.';

  @override
  String get subtitleModeAlwaysDescription =>
      'سىن ھەر قېتىم باشلانغاندا ئېكران خېتىنى ئۆزلۈكىدىن يۈكلەپ كۆرسىتىدۇ.';

  @override
  String get subtitleModeForeignDescription =>
      'سۈكۈتتىكى ئاۋاز يولى چەت تىلىدا بولسا، ئېكران خېتىنى ئۆزلۈكىدىن ئاچىدۇ.';

  @override
  String get subtitleModeForcedDescription =>
      'پەقەت مەجبۇرىي مېتا بەلگىسى قويۇلغان ئېكران خەتلىرىنىلا يۈكلەيدۇ.';

  @override
  String get subtitleModeNoneDescription =>
      'ئېكران خېتىنى ئۆزلۈكىدىن يۈكلەشنى پۈتۈنلەي تاقايدۇ.';

  @override
  String get fallbackSubtitleLanguage => 'زاپاس ئېكران خېتى تىلى';

  @override
  String get subtitleStream => 'ئېكران خېتى ئېقىمى';

  @override
  String get subtitlePreviewText =>
      'تېز قوڭۇر تۈلكە ھورۇن ئىتنىڭ ئۈستىگە سەكرىدى';

  @override
  String get verticalOffset => 'تىك يۆنىلىشتىكى ئېغىش';

  @override
  String get pgsDirectPlay => 'PGS بىۋاسىتە قويۇش';

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
  String get cyan => 'يېشىل كۆك';

  @override
  String get red => 'قىزىل';

  @override
  String get transparent => 'سۈزۈك';

  @override
  String get semiTransparentBlack => 'يېرىم سۈزۈك قارا';

  @override
  String get global => 'ئومۇمىي';

  @override
  String get desktop => 'ئۈستەل يۈزى';

  @override
  String get mobile => 'كۆچمە';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile ئارخىپىنىڭ تەڭشەكلىرى يۈكلەندى.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile ئارخىپىنىڭ تەڭشەكلىرىنى يۈكلەش مەغلۇپ بولدى.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'يەرلىك تەڭشەكلەر $profile ئارخىپىغا ماسقەدەملەندى.';
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
  String get reportDownloadsActivity => 'چۈشۈرۈشلەرنى مۇلازىمېتىردا كۆرسىتىش';

  @override
  String get reportDownloadsActivitySubtitle =>
      'مۇلازىمېتىر باشقۇرغۇچىسىنىڭ كود ئۆزگەرتىلگەن چۈشۈرۈشلىرىڭىزنى باشقۇرۇش تاختىسىدا كۆرۈشىگە يول قويىدۇ';

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
  String get navbarAlwaysExpanded =>
      'يولباشچى بالداق خەتلىرىنى ھەمىشە كۆرسىتىش';

  @override
  String get showSeerrButton => 'Seerr كۇنۇپكىسىنى كۆرسىتىش';

  @override
  String get navbarOpacity => 'يولباشچى بالداق تۇتۇقلۇقى';

  @override
  String get navbarColor => 'Navbar رەڭ';

  @override
  String get gray => 'كۈلرەڭ';

  @override
  String get darkBlue => 'قېنىق كۆك';

  @override
  String get purple => 'بىنەپشە';

  @override
  String get teal => 'كۆكۈش يېشىل';

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
  String get slate => 'تاش كۈلرەڭ';

  @override
  String get indigo => 'كۆك بىنەپشە';

  @override
  String get libraryDisplay => 'كۈتۈپخانا كۆرسىتىش';

  @override
  String get posterLabel => 'پوستېر';

  @override
  String get thumbnailLabel => 'كىچىك كۆرۈنۈش';

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
  String get groupItemsIntoCollections => 'تۈرلەرنى توپلاملارغا گۇرۇپپىلاش';

  @override
  String get hideCollectionAssociatedItems =>
      'ئامبارلارنى كۆرگەندە توپلامغا تەۋە تۈرلەرنى يوشۇرىدۇ';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'ئامبار گۇرۇپپىلاش ئەسكەرتىشى';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'بۇ تەڭشەكنى ئىشلىتىش ئۈچۈن، Jellyfin ياكى Emby مۇلازىمېتىرىڭىزدىكى ئامبارنىڭ كۆرسىتىش تەڭشەكلىرىدە «كىنولارنى توپلاملارغا گۇرۇپپىلاش» ۋە/ياكى «تىياتىرلارنى توپلاملارغا گۇرۇپپىلاش» تاللانمىلىرىنىڭ قوزغىتىلغانلىقىنى جەزملەڭ.';

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
    return '$count تاللاندى';
  }

  @override
  String get mediaBar => 'مېدىيا بالدىقى';

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
  String get mediaBarMode => 'مېدىيا بالدىقى ئۇسلۇبى';

  @override
  String get mediaBarModeDescription =>
      'Moonfin ، MakD نى تاللاڭ ياكى مېدىيا بالدىقىنى ئېتىۋېتىڭ';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'تاقاق';

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
  String get autoAdvance => 'ئاپتوماتىك ئىلگىرىلەش';

  @override
  String get autoAdvanceSlides =>
      'كېيىنكى تام تەسۋىرگە ئاپتوماتىك ئىلگىرىلەيدۇ';

  @override
  String get autoAdvanceInterval => 'ئاپتوماتىك ئىلگىرىلەش ئارىلىقى';

  @override
  String get trailerPreview => 'ئالدىن كۆرسىتىلمە قويۇش';

  @override
  String get autoPlayTrailers =>
      'مېدىيا ستونىدا 3 سېكۇنتتىن كېيىن ئاپتوماتىك ئويناش';

  @override
  String get trailerAudio => 'ئالدىن كۆرسىتىلمە ئاۋازى';

  @override
  String get enableTrailerAudio =>
      'مېدىيا بالداقتىكى ئالدىن كۆرسىتىلمىلەرنىڭ ئاۋازىنى قوزغىتىدۇ';

  @override
  String get episodePreview => 'بۆلۈمنى ئالدىن كۆرۈش';

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
  String get liveTV => 'بىۋاسىتە تېلېۋىزىيە';

  @override
  String get homeSections => 'ئائىلە بۆلەكلىرى';

  @override
  String get resetToDefaults => 'سۈكۈتتىكى ھالەتكە قايتىڭ';

  @override
  String get homeRowPosterSize => 'باش بەت قۇرى پوستېر چوڭلۇقى';

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
  String get fullScreenRows => 'كېڭەيتىلگەن باش بەت قۇرلىرى';

  @override
  String get fullScreenRowsDescription =>
      'ھەر ئېكرانغا باش بەت قۇرىنى 1 قۇر بىلەن چەكلەيدۇ';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'ھەر بىر قۇر رەسىم تىپى';

  @override
  String get perRowSettings => 'ھەر بىر قۇر تەڭشىكى';

  @override
  String get autoLogin => 'ئاپتوماتىك كىرىش';

  @override
  String get lastUser => 'ئاخىرقى ئىشلەتكۈچى';

  @override
  String get currentUser => 'نۆۋەتتىكى ئىشلەتكۈچى';

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
  String get mode => 'ھالەت';

  @override
  String get libraryArt => 'كۈتۈپخانا سەنئىتى';

  @override
  String get logo => 'لوگو';

  @override
  String get clock => 'سائەت';

  @override
  String get timeout => 'ۋاقىت';

  @override
  String minutesShort(int minutes) {
    return '$minutes مىنۇت';
  }

  @override
  String get dimmingLevel => 'غۇۋالاشتۇرۇش دەرىجىسى';

  @override
  String get maxAgeRating => 'ئەڭ يۇقىرى ياش چەكلىمىسى';

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
  String get clockModeStatic => 'مۇقىم';

  @override
  String get clockModeBouncing => 'سەكرەيدىغان';

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
  String get ratings => 'باھالار';

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
  String get episodeRatings => 'بۆلۈم باھالىرى';

  @override
  String get showRatingsOnEpisodes => 'ئايرىم بۆلەكلەرگە باھا كۆرسەت';

  @override
  String get ratingSources => 'باھا مەنبەسى';

  @override
  String get ratingSourcesDescription =>
      'پۈتۈن دېتالدا كۆرسىتىلگەن باھالاش مەنبەلىرىنى قوزغىتىڭ ۋە رەتلەڭ';

  @override
  String get pluginLabel => 'Moonbase قىستۇرمىسى';

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
    return '$status\nنەشرى: $version';
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
  String get movieGenres => 'كىنو ژانىرلىرى';

  @override
  String get upcomingMovies => 'كەلگۈسىدىكى كىنولار';

  @override
  String get studios => 'ئىستۇدىيەلەر';

  @override
  String get popularSeries => 'ئاممىباب يۈرۈشلۈكلىرى';

  @override
  String get seriesGenres => 'تىياتىر ژانىرلىرى';

  @override
  String get upcomingSeries => 'كېلەچەك';

  @override
  String get networks => 'تور';

  @override
  String get seerrDiscoveryRows => 'Seerr بايقاش قۇرلىرى';

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
  String get seerrNotificationsSection => 'ئۇقتۇرۇشلار';

  @override
  String get seerrNotifyNewRequestsTitle => 'يېڭى ئىلتىماس ئۇقتۇرۇشلىرى';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'بىرسى ئىلتىماس يوللىغاندا ماڭا ئۇقتۇرسۇن';

  @override
  String get seerrNotifyLibraryAddedTitle => 'ئىلتىماس يېڭىلانمىلىرى';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'تەستىقلانغان، رەت قىلىنغان ۋە ئامبىرىڭىزغا قوشۇلغانلار';

  @override
  String get seerrNotifyIssuesTitle => 'مەسىلە يېڭىلانمىلىرى';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'يېڭى مەسىلىلەر، جاۋابلار ۋە ھەل قىلىنىشلار';

  @override
  String loggedInAs(String username) {
    return 'كىرگەن ھېسابات: $username';
  }

  @override
  String get discoverRows => 'Seerr بايقاش بېتى';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr باش بېتىدە كۆرسىتىلىدىغان قۇرلارنى قوزغىتىڭ. تەرتىپىنى سۆرەپ ئۆزگەرتىڭ. ئىختىيارى تەرتىپ Moonbase بىلەن ماسقەدەملىنىدۇ.';

  @override
  String get discoverRowsDescription =>
      'Seerr باش بېتىدە كۆرسىتىلىدىغان قۇرلارنى قوزغىتىڭ. تەرتىپىنى سۆرەپ ئۆزگەرتىڭ. ئىختىيارى تەرتىپ Moonbase بىلەن ماسقەدەملىنىدۇ.';

  @override
  String get enabled => 'قوزغىتىلغان';

  @override
  String get hidden => 'يۇشۇرۇن';

  @override
  String get aboutTitle => 'ھەققىدە';

  @override
  String versionValue(String version) {
    return 'نەشر $version';
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
    return 'يېڭىلانما بار: v$version';
  }

  @override
  String get updateNotifications => 'ئۇقتۇرۇشلارنى يېڭىلاش';

  @override
  String get showWhenUpdatesAvailable =>
      'يېڭىلانمىلارنىڭ قاچان بولىدىغانلىقىنى كۆرسىتىڭ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version چىقتى';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'رەسىم غەملەك چېكى';

  @override
  String get clearImageCache => 'رەسىم غەملىكىنى تازىلاش';

  @override
  String get imageCacheCleared => 'رەسىم غەملىكى تازىلاندى';

  @override
  String get clear => 'تازىلاش';

  @override
  String get browse => 'توركۆرگۈ';

  @override
  String get noResults => 'ھېچقانداق نەتىجە يوق';

  @override
  String get seerrAvailableStatus => 'ئىشلەتكىلى بولىدۇ';

  @override
  String get seerrRequestedStatus => 'تەلەپ قىلىندى';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'چۈشۈرۈلۈۋاتىدۇ · $percent%';
  }

  @override
  String get seerrImportingStatus => 'ئەكىرىلىۋاتىدۇ';

  @override
  String itemsCount(int count) {
    return '$count تۈر';
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
    return '$name ئىلتىماس قىلغان';
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
    return '«$title» ئۈچۈن ئىلتىماس بىكار قىلىنسۇنمۇ؟';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '«$title» ئۈچۈن $count ئىلتىماس بىكار قىلىنسۇنمۇ؟';
  }

  @override
  String get keep => 'ساقلاڭ';

  @override
  String get itemNotFoundInLibrary => 'Moonfin كۈتۈپخانىسىدا تېپىلمىغان تۈر';

  @override
  String get errorSearchingLibrary => 'كۈتۈپخانىنى ئىزدەشتە خاتالىق';

  @override
  String budgetAmount(String amount) {
    return 'مەبلىغى: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'كىرىمى: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type ئىلتىماس قىلىش';
  }

  @override
  String get submitRequest => 'تەلەپنى يوللاش';

  @override
  String get allSeasons => 'بارلىق پەسىللەر';

  @override
  String get advancedOptions => 'ئالىي تاللانمىلار';

  @override
  String get noServiceServersConfigured => 'ھېچقانداق مۇلازىمېتىر سەپلەنمىگەن';

  @override
  String get server => 'مۇلازىمېتىر';

  @override
  String get qualityProfile => 'سۈپەت ئارخىپى';

  @override
  String get rootFolder => 'غول قىسقۇچ';

  @override
  String get showMore => 'تېخىمۇ كۆپ كۆرسىتىش';

  @override
  String get appearances => 'قاتناشقان ئەسەرلەر';

  @override
  String get crewSection => 'خادىملار';

  @override
  String ageValue(int age) {
    return 'يېشى $age';
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
  String get failedStatus => 'مەغلۇپ بولدى';

  @override
  String get processingStatus => 'بىر تەرەپ قىلىنىۋاتىدۇ';

  @override
  String modifiedByName(String name) {
    return '$name ئۆزگەرتكەن';
  }

  @override
  String get completedStatus => 'تاماملاندى';

  @override
  String get requestErrorDuplicate => 'بۇ ئەسەر ئاللىبۇرۇن ئىلتىماس قىلىنغان';

  @override
  String get requestErrorQuota => 'ئىلتىماس چېكىگە يېتىلدى';

  @override
  String get requestErrorBlocklisted => 'بۇ ئەسەر قارا تىزىملىكتە';

  @override
  String get requestErrorNoSeasons => 'ئىلتىماس قىلغۇدەك پەسىل قالمىدى';

  @override
  String get requestErrorPermission => 'بۇ ئىلتىماسنى قىلىش ھوقۇقىڭىز يوق';

  @override
  String get seerrRequestsTitle => 'ئىلتىماسلار';

  @override
  String get seerrIssuesTitle => 'مەسىلىلەر';

  @override
  String get sortNewest => 'ئەڭ يېڭى';

  @override
  String get sortLastModified => 'ئەڭ يېڭى ئۆزگەرتىلگەن';

  @override
  String get noIssues => 'مەسىلە يوق';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit كىنو ئىلتىماسىدىن $remaining قالدى';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit پەسىل ئىلتىماسىدىن $remaining قالدى';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name نىڭ بىر قىسمى';
  }

  @override
  String get viewCollection => 'توپلامنى كۆرۈش';

  @override
  String get requestCollection => 'توپلامنى ئىلتىماس قىلىش';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total كىنو · $available بار';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count كىنونى ئىلتىماس قىلىش';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total دىن $current ئىلتىماس قىلىنىۋاتىدۇ...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count كىنو ئىلتىماس قىلىندى';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total كىنودىن $ok سى ئىلتىماس قىلىندى';
  }

  @override
  String get collectionAllRequested =>
      'بارلىق كىنولار ئاللىبۇرۇن بار ياكى ئىلتىماس قىلىنغان';

  @override
  String get reportIssue => 'مەسىلە مەلۇم قىلىش';

  @override
  String get issueTypeVideo => 'سىن';

  @override
  String get issueTypeAudio => 'ئاۋاز';

  @override
  String get whatsWrong => 'نېمە مەسىلە بار؟';

  @override
  String get allEpisodes => 'بارلىق بۆلۈملەر';

  @override
  String get episode => 'بۆلۈم';

  @override
  String get openStatus => 'ئوچۇق';

  @override
  String get resolvedStatus => 'ھەل قىلىندى';

  @override
  String get resolveAction => 'ھەل قىلىش';

  @override
  String get reopenAction => 'قايتا ئېچىش';

  @override
  String reportedByName(String name) {
    return '$name مەلۇم قىلغان';
  }

  @override
  String commentsCount(int count) {
    return '$count ئىنكاس';
  }

  @override
  String get addComment => 'ئىنكاس يېزىڭ';

  @override
  String get deleteIssueConfirm => 'بۇ مەسىلە ئۆچۈرۈلسۇنمۇ؟';

  @override
  String get submitReport => 'دوكلات يوللاش';

  @override
  String get tmdbScore => 'TMDB نومۇر';

  @override
  String get releaseDateLabel => 'ئېلان قىلىنغان ۋاقىت';

  @override
  String get firstAirDateLabel => 'تۇنجى ھاۋا ۋاقتى';

  @override
  String get revenueLabel => 'كىرىم';

  @override
  String get runtimeLabel => 'ئۇزۇنلۇقى';

  @override
  String get budgetLabel => 'خامچوت';

  @override
  String get originalLanguageLabel => 'ئەسلى تىل';

  @override
  String get seasonsLabel => 'پەسىللەر';

  @override
  String get episodesLabel => 'بۆلۈملەر';

  @override
  String get access => 'زىيارەت';

  @override
  String get add => 'قوشۇش';

  @override
  String get address => 'ئادرېس';

  @override
  String get analytics => 'ئىستاتىستىكا';

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
  String get edit => 'تەھرىرلەش';

  @override
  String get encoding => 'كودلاش';

  @override
  String get error => 'خاتالىق';

  @override
  String get forward => 'ئالغا سۈرۈش';

  @override
  String get general => 'ئادەتتىكى';

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
  String get path => 'يول';

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
  String get remote => 'يىراقتىن باشقۇرۇش';

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
  String get stop => 'توختىتىش';

  @override
  String get streaming => 'ئېقىم قويۇش';

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
  String get unmute => 'ئاۋازنى ئېچىش';

  @override
  String get mute => 'ئۈنسىز';

  @override
  String get branding => 'ماركا';

  @override
  String get adminDrawerDashboard => 'باش تاختا';

  @override
  String get adminDrawerAnalytics => 'ئىستاتىستىكا';

  @override
  String get adminDrawerSettings => 'تەڭشەك';

  @override
  String get adminDrawerBranding => 'ماركا';

  @override
  String get adminDrawerUsers => 'ئىشلەتكۈچى';

  @override
  String get adminDrawerLibraries => 'مېدىيا ئامبارلىرى';

  @override
  String get adminDrawerDisplay => 'كۆرسىتىش';

  @override
  String get adminDrawerMetadata => 'مېتا ئۇچۇر';

  @override
  String get adminDrawerNfo => 'NFO تەڭشەكلىرى';

  @override
  String get adminDrawerTranscoding => 'كود ئۆزگەرتىش';

  @override
  String get adminDrawerResume => 'داۋاملاشتۇرۇش';

  @override
  String get adminDrawerStreaming => 'ئېقىم قويۇش';

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
  String get adminDrawerLiveTv => 'بىۋاسىتە تېلېۋىزىيە';

  @override
  String get adminExitTooltip => 'باشقۇرغۇچىدىن چېكىنىش';

  @override
  String get adminDashboardLoadFailed => 'باشقۇرۇش تاختىسىنى يۈكلىيەلمىدى';

  @override
  String get adminMediaOverview => 'مېدىيا ئومۇمىي كۆرۈنۈشى';

  @override
  String get adminMediaTotalsError =>
      'مۇلازىمېتىر مېدىيا ئومۇمىي مىقدارىنى يۈكلىيەلمىدى.';

  @override
  String get adminMediaOverviewSubtitle =>
      'بۇ مۇلازىمېتىردا قانچىلىك مەزمۇن بارلىقىنى تېز ئوقۇڭ.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'يېڭىلانمىسى بار قىستۇرمىلار: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'قايتا قوزغىتىش كېرەك قىستۇرمىلار: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'مەغلۇپ بولغان پىلانلىق ۋەزىپىلەر: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'يېقىنقى ئاگاھلاندۇرۇش/خاتالىق خاتىرىلىرى: $count';
  }

  @override
  String get analyticsMediaDistribution => 'مېدىيا تەقسىماتى';

  @override
  String get analyticsVideoCodecs => 'سىن كودېكلىرى';

  @override
  String get analyticsAudioCodecs => 'ئاۋاز كودېكلىرى';

  @override
  String get analyticsContainers => 'كونتېينېر';

  @override
  String get analyticsTopGenres => 'ئالدىنقى ژانىرلار';

  @override
  String get analyticsReleaseYears => 'يىللارنى قويۇپ بېرىش';

  @override
  String get analyticsContentRatings => 'مەزمۇن دەرىجىسى';

  @override
  String get analyticsRuntimeBuckets => 'ئۇزۇنلۇق ئارىلىقلىرى';

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
    return 'خاتالىق: $error';
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
    return 'بۇيرۇق مەغلۇپ بولدى: $error';
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
  String get sessionForward => 'ئالغا سۈرۈش';

  @override
  String get sessionNext => 'كېيىنكى';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'ئاۋاز +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ھازىر ئويناۋاتىدۇ';

  @override
  String get volume => 'ئاۋاز مىقدارى';

  @override
  String get actions => 'ھەرىكەتلەر';

  @override
  String get videoCodec => 'سىن كودېكى';

  @override
  String get audioCodec => 'ئاۋاز كودېكى';

  @override
  String get hwAccel => 'قاتتىق دېتال تېزلىتىش';

  @override
  String get completion => 'تامام';

  @override
  String get direct => 'بىۋاسىتە';

  @override
  String get adminDisconnect => 'ئۈزۈڭ';

  @override
  String get adminClearDates => 'چېسلانى ئېنىقلاش';

  @override
  String get adminActivitySeverityAll => 'بارلىق دەرىجىلەر';

  @override
  String get adminActivityDateRange => 'چېسلا دائىرىسى';

  @override
  String adminActivityLoadFailed(String error) {
    return 'پائالىيەت خاتىرىسى يۈكلىنەلمىدى: $error';
  }

  @override
  String get adminNoActivityEntries => 'ھېچقانداق پائالىيەت تۈرى يوق';

  @override
  String get adminEditDeviceName => 'ئۈسكۈنىنىڭ نامىنى تەھرىرلەش';

  @override
  String get adminCustomName => 'ئىختىيارى ئىسىم';

  @override
  String get adminDeviceNameUpdated => 'ئۈسكۈنىنىڭ ئىسمى يېڭىلاندى';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'ئۈسكۈنىنى يېڭىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminDeleteDevice => 'ئۈسكۈنىنى ئۆچۈرۈڭ';

  @override
  String get adminDeviceDeleted => 'ئۈسكۈنى ئۆچۈرۈلدى';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ئۈسكۈنىنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '«$name» ئۈسكۈنىسى چىقىرىۋېتىلسۇنمۇ؟ ئىشلەتكۈچى بۇ ئۈسكۈنىدە قايتا كىرىشى كېرەك بولىدۇ.';
  }

  @override
  String get adminDeleteAllDevices => 'بارلىق ئۈسكۈنىلەرنى ئۆچۈرۈش';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count ئۈسكۈنە چىقىرىۋېتىلسۇنمۇ؟ مۇناسىۋەتلىك ئىشلەتكۈچىلەر قايتا كىرىشى كېرەك بولىدۇ. نۆۋەتتىكى ئۈسكۈنىڭىزگە تەسىر يەتمەيدۇ.';
  }

  @override
  String get adminDevicesDeletedAll => 'ئۈسكۈنىلەر چىقىرىۋېتىلدى';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'بىر قىسىم ئۈسكۈنىلەر چىقىرىۋېتىلدى؛ $count ئۈسكۈنىنى چىقىرىۋەتكىلى بولمىدى.';
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
    return 'سايىلەشنى باشلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminRenameLibrary => 'كۈتۈپخانىنىڭ نامىنى ئۆزگەرتىڭ';

  @override
  String get adminNewName => 'يېڭى ئىسىم';

  @override
  String adminLibraryRenamed(String name) {
    return 'ئامبار ئىسمى «$name» غا ئۆزگەرتىلدى';
  }

  @override
  String adminRenameFailed(String error) {
    return 'ئىسىم ئۆزگەرتىش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminDeleteLibrary => 'كۈتۈپخانىنى ئۆچۈرۈڭ';

  @override
  String adminLibraryDeleted(String name) {
    return '«$name» ئامبىرى ئۆچۈرۈلدى';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ئامبارنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'يول قوشۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminRemovePath => 'يولنى ئۆچۈرۈڭ';

  @override
  String adminRemovePathConfirm(String path) {
    return '«$path» بۇ ئامباردىن چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'يولنى چىقىرىۋېتىش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'كۈتۈپخانىنىڭ تاللانمىلىرى ساقلاندى';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'تاللانمىلارنى ساقلاش مەغلۇپ بولدى: $error';
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
  String get adminLibraryTabPaths => 'يوللار';

  @override
  String get adminLibraryTabOptions => 'تاللانمىلار';

  @override
  String get adminLibraryTabDownloaders => 'چۈشۈرگۈچلەر';

  @override
  String get adminLibMetadataSavers => 'مېتا ئۇچۇر ساقلىغۇچلار';

  @override
  String get adminLibSubtitleDownloaders => 'ئېكران خېتى چۈشۈرگۈچلەر';

  @override
  String get adminLibLyricDownloaders => 'ناخشا تېكىستى چۈشۈرگۈچلەر';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'مېتا ئۇچۇر چۈشۈرگۈچلەر: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'رەسىم ئالغۇچلار: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'بۇ مۇلازىمېتىر بۇ ئامبار تىپى ئۈچۈن چۈشۈرگۈچ تەمىنلىمەيدۇ.';

  @override
  String get adminLibrarySectionGeneral => 'ئادەتتىكى';

  @override
  String get adminLibrarySectionMetadata => 'مېتا ئۇچۇر';

  @override
  String get adminLibrarySectionEmbedded => 'سىڭدۈرۈلگەن ئۇچۇر';

  @override
  String get adminLibrarySectionSubtitles => 'ئېكران خېتى';

  @override
  String get adminLibrarySectionImages => 'رەسىملەر';

  @override
  String get adminLibrarySectionSeries => 'تېلېۋىزىيە تىياتىرلىرى';

  @override
  String get adminLibrarySectionMusic => 'مۇزىكا';

  @override
  String get adminLibrarySectionMovies => 'كىنولار';

  @override
  String get adminLibRealtimeMonitor => 'دەل ۋاقىتلىق كۆزىتىشنى قوزغىتىش';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ھۆججەت ئۆزگىرىشلىرىنى بايقاپ ئۆزلۈكىدىن بىر تەرەپ قىلىدۇ.';

  @override
  String get adminLibArchiveMediaFiles =>
      'ئارخىپ ھۆججەتلىرىنى مېدىيا ھۆججىتى دەپ قاراش';

  @override
  String get adminLibEnablePhotos => 'سۈرەتلەرنى كۆرسىتىش';

  @override
  String get adminLibSaveLocalMetadata =>
      'بېزەك رەسىملىرىنى مېدىيا قىسقۇچلىرىغا ساقلاش';

  @override
  String get adminLibRefreshInterval => 'مېتا ئۇچۇرنى ئاپتوماتىك يېڭىلاش';

  @override
  String get adminLibRefreshNever => 'ھەرگىز';

  @override
  String get adminLibDefault => 'سۈكۈتتىكى';

  @override
  String get adminLibDisplayTitle => 'كۆرسىتىش';

  @override
  String get adminLibDisplaySection => 'ئامبار كۆرسىتىلىشى';

  @override
  String get adminLibFolderView =>
      'ئاددىي مېدىيا قىسقۇچلىرىنى كۆرسىتىدىغان قىسقۇچ كۆرۈنۈشىنى كۆرسىتىش';

  @override
  String get adminLibSpecialsInSeasons =>
      'ئالاھىدە بۆلۈملەرنى تارقىتىلغان پەسىللىرى ئىچىدە كۆرسىتىش';

  @override
  String get adminLibGroupMovies => 'كىنولارنى توپلاملارغا گۇرۇپپىلاش';

  @override
  String get adminLibGroupShows => 'تىياتىرلارنى توپلاملارغا گۇرۇپپىلاش';

  @override
  String get adminLibExternalSuggestions =>
      'تەۋسىيەلەردە سىرتقى مەزمۇنلارنى كۆرسىتىش';

  @override
  String get adminLibDateAddedSection => 'قوشۇلغان چېسلا ھەرىكىتى';

  @override
  String get adminLibDateAddedLabel => 'قوشۇلغان چېسلا مەنبەسى';

  @override
  String get adminLibDateAddedImport => 'ئامبارغا سايىلانغان چېسلا';

  @override
  String get adminLibDateAddedFile => 'ھۆججەت قۇرۇلغان چېسلا';

  @override
  String get adminLibMetadataTitle => 'مېتا ئۇچۇر ۋە رەسىملەر';

  @override
  String get adminLibMetadataLangSection => 'ئالدىن تاللانغان مېتا ئۇچۇر تىلى';

  @override
  String get adminLibChaptersSection => 'بابلار';

  @override
  String get adminLibDummyChapterDuration => 'ساختا باب ئۇزۇنلۇقى (سېكۇنت)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'بابى يوق مېدىيا ئۈچۈن ھاسىللىنىدىغان بابلارنىڭ ئۇزۇنلۇقى. تاقاش ئۈچۈن 0 قىلىڭ.';

  @override
  String get adminLibChapterImageResolution => 'باب رەسىمى ئېنىقلىقى';

  @override
  String get adminLibNfoTitle => 'NFO تەڭشەكلىرى';

  @override
  String get adminLibNfoHelp =>
      'NFO مېتا ئۇچۇرى Kodi ۋە شۇنىڭغا ئوخشاش خېرىدارلار بىلەن ماس كېلىدۇ. تەڭشەكلەر NFO مېتا ئۇچۇرى ساقلايدىغان بارلىق ئامبارلارغا قوللىنىلىدۇ.';

  @override
  String get adminLibKodiUser =>
      'NFO ھۆججەتلىرىدە كۆرۈش سانلىق مەلۇماتى ساقلىنىدىغان ئىشلەتكۈچى';

  @override
  String get adminLibSaveImagePaths =>
      'رەسىم يوللىرىنى NFO ھۆججەتلىرى ئىچىگە ساقلاش';

  @override
  String get adminLibPathSubstitution =>
      'NFO رەسىم يوللىرى ئۈچۈن يول ئالماشتۇرۇشنى قوزغىتىش';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart رەسىملىرىنى extrathumbs قىسقۇچىغا كۆچۈرۈش';

  @override
  String get adminLibNone => 'يوق';

  @override
  String adminLibRefreshDays(int days) {
    return '$days كۈن';
  }

  @override
  String get adminLibEmbeddedTitles => 'سىڭدۈرۈلگەن ماۋزۇلارنى ئىشلىتىش';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'قوشۇمچىلار ئۈچۈن سىڭدۈرۈلگەن ماۋزۇلارنى ئىشلىتىش';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'سىڭدۈرۈلگەن بۆلۈم ئۇچۇرىنى ئىشلىتىش';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'سىڭدۈرۈلگەن ئېكران خېتىگە يول قويۇش';

  @override
  String get adminLibEmbeddedAllowAll => 'ھەممىسىگە يول قويۇش';

  @override
  String get adminLibEmbeddedAllowText => 'پەقەت تېكىست';

  @override
  String get adminLibEmbeddedAllowImage => 'پەقەت رەسىم';

  @override
  String get adminLibEmbeddedAllowNone => 'يوق';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'سىڭدۈرۈلگەن ئېكران خېتى بولسا چۈشۈرۈشتىن ئاتلاش';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ئاۋاز يولى چۈشۈرۈش تىلىغا ماس كەلسە چۈشۈرۈشتىن ئاتلاش';

  @override
  String get adminLibRequirePerfectMatch =>
      'ئېكران خېتىنىڭ پۈتۈنلەي ماس كېلىشىنى تەلەپ قىلىش';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'ئېكران خېتىنى مېدىيا قىسقۇچلىرىغا ساقلاش';

  @override
  String get adminLibChapterImageExtraction => 'باب رەسىملىرىنى ئاجرىتىش';

  @override
  String get adminLibChapterImagesDuringScan =>
      'ئامبار سايىلەش جەريانىدا باب رەسىملىرىنى ئاجرىتىش';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay رەسىم ئاجرىتىشنى قوزغىتىش';

  @override
  String get adminLibTrickplayDuringScan =>
      'ئامبار سايىلەش جەريانىدا trickplay رەسىملىرىنى ئاجرىتىش';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay رەسىملىرىنى مېدىيا قىسقۇچلىرىغا ساقلاش';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'كۆپ قىسقۇچقا تارقالغان تىياتىرلارنى ئاپتوماتىك بىرلەشتۈرۈش';

  @override
  String get adminLibSeasonZeroName => 'نۆل-پەسىل كۆرسىتىلىش ئىسمى';

  @override
  String get adminLibLufsScan => 'ئاۋاز نورمىلاش ئۈچۈن LUFS سايىلەشنى قوزغىتىش';

  @override
  String get adminLibPreferNonstandardArtist =>
      'ئۆلچەمدىن باشقا سەنئەتكار بەلگىسىنى ئالدىن تاللاش';

  @override
  String get adminLibAutoAddToCollection =>
      'كىنولارنى توپلاملارغا ئاپتوماتىك قوشۇش';

  @override
  String get adminLibraryNameRequired => 'كۈتۈپخانىنىڭ ئىسمى تەلەپ قىلىنىدۇ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ئامبار قۇرۇش مەغلۇپ بولدى: $error';
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
    return '$name چەكلەنسۇنمۇ؟ ئۇ كىرەلمەيدىغان بولىدۇ.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name قوزغىتىلسۇنمۇ؟ ئۇ قايتا كىرەلەيدىغان بولىدۇ.';
  }

  @override
  String adminUserDisabled(String name) {
    return '«$name» ئىشلەتكۈچى چەكلەندى';
  }

  @override
  String adminUserEnabled(String name) {
    return '«$name» ئىشلەتكۈچى قوزغىتىلدى';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ئىشلەتكۈچى تۈزۈمىنى يېڭىلاش مەغلۇپ بولدى: $error';
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
    return 'ئىشلەتكۈچى قۇرۇش مەغلۇپ بولدى: $error';
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
    return 'ساقلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminPermissionsSaved => 'ئىجازەتلەر ساقلاندى';

  @override
  String get adminPasswordsMismatch => 'پارول ماس كەلمەيدۇ';

  @override
  String adminFailed(String error) {
    return 'مەغلۇپ بولدى: $error';
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
  String get adminParentalControl => 'ئاتا-ئانا كونتروللۇقى';

  @override
  String get adminMaxParentalRating =>
      'يول قويۇلىدىغان ئەڭ يۇقىرى ياش چەكلىمىسى';

  @override
  String get adminMaxParentalRatingHint =>
      'بۇنىڭدىن يۇقىرى باھالانغان مەزمۇنلار بۇ ئىشلەتكۈچىدىن يوشۇرۇلىدۇ.';

  @override
  String get adminParentalRatingNone => 'يوق';

  @override
  String get adminBlockUnratedItems =>
      'باھا ئۇچۇرى يوق ياكى تونۇلمايدىغان تۈرلەرنى چەكلەش';

  @override
  String get adminUnratedBook => 'كىتابلار';

  @override
  String get adminUnratedChannelContent => 'قاناللار';

  @override
  String get adminUnratedLiveTvChannel => 'بىۋاسىتە تېلېۋىزىيە';

  @override
  String get adminUnratedMovie => 'كىنولار';

  @override
  String get adminUnratedMusic => 'مۇزىكا';

  @override
  String get adminUnratedTrailer => 'ئالدىن كۆرۈنۈشلەر';

  @override
  String get adminUnratedSeries => 'تىياتىرلار';

  @override
  String get adminAccessSchedules => 'زىيارەت ۋاقىت جەدۋەللىرى';

  @override
  String get adminAccessSchedulesHint =>
      'پەقەت تۆۋەندىكى بەلگىلەنگەن ۋاقىتلاردىلا زىيارەتكە يول قويىدۇ. جەدۋەل بەلگىلەنمىسە پۈتۈن كۈن زىيارەتكە يول قويۇلىدۇ.';

  @override
  String get adminAddSchedule => 'جەدۋەل قوشۇش';

  @override
  String get adminScheduleDay => 'كۈن';

  @override
  String get adminScheduleStart => 'باشلىنىش';

  @override
  String get adminScheduleEnd => 'ئاخىرلىشىش';

  @override
  String get adminDayEveryday => 'ھەر كۈنى';

  @override
  String get adminDayWeekday => 'خىزمەت كۈنلىرى';

  @override
  String get adminDayWeekend => 'ھەپتە ئاخىرى';

  @override
  String get adminDaySunday => 'يەكشەنبە';

  @override
  String get adminDayMonday => 'دۈشەنبە';

  @override
  String get adminDayTuesday => 'سەيشەنبە';

  @override
  String get adminDayWednesday => 'چارشەنبە';

  @override
  String get adminDayThursday => 'پەيشەنبە';

  @override
  String get adminDayFriday => 'جۈمە';

  @override
  String get adminDaySaturday => 'شەنبە';

  @override
  String get adminAllowedTags => 'يول قويۇلغان بەلگىلەر';

  @override
  String get adminAllowedTagsHint =>
      'پەقەت بۇ بەلگىلەر بار مەزمۇنلارلا كۆرسىتىلىدۇ. ھەممىسىگە يول قويۇش ئۈچۈن قۇرۇق قويۇڭ.';

  @override
  String get adminBlockedTags => 'چەكلەنگەن بەلگىلەر';

  @override
  String get adminBlockedTagsHint =>
      'بۇ بەلگىلەر بار مەزمۇنلار بۇ ئىشلەتكۈچىدىن يوشۇرۇلىدۇ.';

  @override
  String get adminAddTag => 'بەلگە قوشۇش';

  @override
  String get adminEnabledDevices => 'قوزغىتىلغان ئۈسكۈنىلەر';

  @override
  String get adminEnabledChannels => 'قوزغىتىلغان قاناللار';

  @override
  String get adminAuthProvider => 'كىملىك دەلىللەش تەمىنلىگۈچى';

  @override
  String get adminPasswordResetProvider => 'پارول ئەسلىگە قايتۇرۇش تەمىنلىگۈچى';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'قۇلۇپلىنىشتىن بۇرۇنقى ئەڭ كۆپ مەغلۇپ كىرىش سىنىقى';

  @override
  String get adminLoginAttemptsHint =>
      'سۈكۈتتىكى ئۈچۈن 0، قۇلۇپلاشنى تاقاش ئۈچۈن -1 قىلىڭ.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay زىيارىتى';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'گۇرۇپپا قۇرۇش ۋە قوشۇلۇشقا يول قويۇش';

  @override
  String get adminSyncPlayJoin => 'گۇرۇپپىغا قوشۇلۇشقا يول قويۇش';

  @override
  String get adminSyncPlayNone => 'زىيارەت يوق';

  @override
  String get adminContentDeletionFolders =>
      'مەزمۇن ئۆچۈرۈشكە يول قويۇلىدىغان جايلار';

  @override
  String get adminResetPasswordWarning =>
      'بۇ پارولنى ئۆچۈرۈۋېتىدۇ. ئىشلەتكۈچى پارولسىز كىرەلەيدۇ.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'مۇلازىمېتىر HTTP $status قايتۇردى';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name نى راستىنلا ئۆچۈرەمسىز؟';
  }

  @override
  String adminUserDeleted(String name) {
    return '«$name» ئىشلەتكۈچى ئۆچۈرۈلدى';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ئىشلەتكۈچىنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
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
    return 'ئاچقۇچ قۇرۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'مۇلازىمېتىرنىڭ ئىنكاسىدىن يوقاپ كەتكەن ئاچقۇچ بەلگىسى';

  @override
  String get adminRevokeApiKey => 'API ئاچقۇچىنى بىكار قىلىڭ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name نىڭ ئاچقۇچى بىكار قىلىنسۇنمۇ؟';
  }

  @override
  String get adminApiKeyRevoked => 'API ئاچقۇچى بىكار قىلىندى';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ئاچقۇچنى بىكار قىلىش مەغلۇپ بولدى: $error';
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
    return 'Token: $token\\nقۇرۇلغان: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'زاپاس نۇسخا قۇرۇش';

  @override
  String get adminBackupInclude =>
      'زاپاس نۇسخىغا نېمىلەرنىڭ كىرىدىغانلىقىنى تاللاڭ.';

  @override
  String get adminBackupDatabase => 'ساندان';

  @override
  String get adminBackupDatabaseAlways => 'ھەمىشە كىرىدۇ';

  @override
  String get adminBackupMetadata => 'مېتا ئۇچۇر';

  @override
  String get adminBackupSubtitles => 'ئېكران خېتى';

  @override
  String get adminBackupTrickplay => 'Trickplay رەسىملىرى';

  @override
  String get adminCreatingBackup => 'زاپاسلاش ...';

  @override
  String get adminBackupCreated => 'زاپاسلاش مۇۋەپپەقىيەتلىك قۇرۇلدى';

  @override
  String adminBackupCreateFailed(String error) {
    return 'زاپاس نۇسخا قۇرۇش مەغلۇپ بولدى: $error';
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
    return 'Manifest نى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminConfirmRestore => 'ئەسلىگە كەلتۈرۈشنى جەزملەشتۈرۈڭ';

  @override
  String get adminRestoringBackup => 'زاپاسلاشنى ئەسلىگە كەلتۈرۈش ...';

  @override
  String adminRestoreFailed(String error) {
    return 'زاپاس نۇسخىنى ئەسلىگە كەلتۈرۈش مەغلۇپ بولدى: $error';
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
    return '$path غا ساقلاندى';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ھۆججەتنى ساقلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName نى يۈكلەش مەغلۇپ بولدى';
  }

  @override
  String get adminSearchInLog => 'تىزىمدىن ئىزدەڭ';

  @override
  String get adminNoMatchingLines => 'ماس كېلىدىغان قۇر يوق';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ۋەزىپىلەرنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminNoScheduledTasks => 'پىلانلانغان ۋەزىپە تېپىلمىدى';

  @override
  String get adminNoTasksMatchFilter =>
      'نۆۋەتتىكى سۈزگۈچكە ھېچقانداق ۋەزىپە ماس كەلمەيدۇ';

  @override
  String adminTaskStartFailed(String error) {
    return 'ۋەزىپىنى باشلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ۋەزىپىنى توختىتىش مەغلۇپ بولدى: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ۋەزىپىنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminRunNow => 'ھازىر ئىجرا قىلىڭ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'قوزغاتقۇچنى چىقىرىۋېتىش مەغلۇپ بولدى: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'قوزغاتقۇچ قوشۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminLastExecution => 'ئاخىرقى ئىجرا';

  @override
  String get adminTriggers => 'قوزغاتقۇچلار';

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
    return '$hours سائەت';
  }

  @override
  String get adminDayOfWeek => 'ھەپتە';

  @override
  String get adminSearchPlugins => 'قىستۇرمىلارنى ئىزدەش ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'قىستۇرمىنى ئالماشتۇرۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminUninstallPlugin => 'قىستۇرمىنى ئۆچۈرۈڭ';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '«$name» راستىنلا قاچىلاشتىن چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'قىستۇرمىنى چىقىرىۋېتىش مەغلۇپ بولدى: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'بوغچىنى قاچىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'يېڭىلانمىنى قاچىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'قىستۇرمىلارنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ھېچقانداق قىستۇرما ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminNoPluginsInstalled => 'قىستۇرما ئورنىتىلمىدى';

  @override
  String adminInstallUpdate(String version) {
    return 'يېڭىلانمىنى قاچىلاش (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'كاتالوگنى يۈكلەش مەغلۇپ بولدى: $error';
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
    return '«$name» مۇلازىمېتىر قايتا قوزغىتىلغاندىن كېيىن چىقىرىۋېتىلىدۇ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'چىقىرىۋېتىش مەغلۇپ بولدى: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '«$name» v$version گە يېڭىلىنىۋاتىدۇ...';
  }

  @override
  String get adminMissingAuthToken =>
      'تەڭشەكلەرنى ئاچقىلى بولمايدۇ: ئاپتور بەلگىسى يوق.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'قىستۇرمىنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminPluginNotFound => 'قىستۇرما تېپىلمىدى';

  @override
  String adminPluginVersion(String version) {
    return 'نەشر $version';
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
    return '«$name» نى راستىنلا چىقىرىۋېتەمسىز؟';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'خەزىنىلەرنى ساقلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'خەزىنىلەرنى يۈكلەش مەغلۇپ بولدى: $error';
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
    return 'قىستۇرما تەڭشەكلىرىنى يۈكلىگىلى بولمىدى: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri نى ئاچقىلى بولمىدى';
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
  String get adminMetadataPath => 'مېتا ئۇچۇر يولى';

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
  String get adminCustomCss => 'ئىختىيارى CSS';

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
  String get adminThrottleBuffering => 'غەملەشنى چەكلەش';

  @override
  String get adminTrickplaySaved => 'Trickplay تەڭشەكلىرى ساقلاندى';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay تەڭشەكلىرىنى يۈكلەش مەغلۇپ بولدى';

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
  String get adminIntervalMs => 'ئارىلىق (ms)';

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
  String get whitelist => 'ئاق تىزىملىك';

  @override
  String get blacklist => 'قارا تىزىملىك';

  @override
  String get notSet => 'تەڭشەلمىدى';

  @override
  String get adminMetadataSaved => 'Metadata ساقلاندى';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'مېتا ئۇچۇرنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'مېتا ئۇچۇرنى ساقلاش مەغلۇپ بولدى: $error';
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
    return 'مېتا ئۇچۇرنى يېڭىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminNoRemoteMatches => 'يىراقتىن ماس كېلىدىغان تېپىلمىدى';

  @override
  String get adminRemoteResults => 'يىراقتىن نەتىجە';

  @override
  String get adminRemoteMetadataApplied =>
      'يىراقتىكى مېتا سانلىق مەلۇمات قوللىنىلدى';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'يىراقتىن ئىزدەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminUpdateContentType => 'مەزمۇن تىپىنى يېڭىلاش';

  @override
  String get adminContentType => 'مەزمۇن تىپى';

  @override
  String get adminContentTypeUpdated => 'مەزمۇن تىپى يېڭىلاندى';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'مەزمۇن تىپىنى يېڭىلاش مەغلۇپ بولدى: $error';
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
    return '$imageType رەسىمى يېڭىلاندى';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'رەسىم چۈشۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'قوللىمايدىغان رەسىم فورماتى';

  @override
  String get adminImageReadFailed => 'تاللانغان رەسىمنى ئوقۇش مەغلۇب بولدى';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType رەسىمى يوللاندى';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'رەسىم يوللاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType رەسىمىنى ئۆچۈرۈش';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType رەسىمى ئۆچۈرۈلدى';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'رەسىمنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminAllProviders => 'بارلىق تەمىنلىگۈچىلەر';

  @override
  String get adminNoRemoteImages => 'يىراقتىن رەسىم تېپىلمىدى';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'تيۇنېر بايقاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminAddTuner => 'Tuner نى قوشۇڭ';

  @override
  String get adminEditTuner => 'تيۇنېرنى تەھرىرلەش';

  @override
  String get adminTunerTypeM3u => 'M3U تيۇنېرى';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ھۆججەت ياكى URL';

  @override
  String get adminTunerIpAddress => 'تيۇنېر IP ئادرېسى';

  @override
  String get adminTunerFriendlyName => 'قولايلىق ئىسىم';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'بىرلا ۋاقىتتىكى ئۇلىنىش چېكى';

  @override
  String get adminTunerCountHelp =>
      'تيۇنېرنىڭ بىرلا ۋاقىتتا يول قويىدىغان ئەڭ كۆپ ئېقىم سانى. چەكسىز ئۈچۈن 0 قىلىڭ.';

  @override
  String get adminTunerFallbackBitrate => 'زاپاس ئەڭ يۇقىرى ئېقىم بىت نىسبىتى';

  @override
  String get adminTunerImportFavoritesOnly =>
      'پەقەت ئامراق قاناللارنىلا ئەكىرىش';

  @override
  String get adminTunerAllowHwTranscoding =>
      'قاتتىق دېتاللىق كود ئۆزگەرتىشكە يول قويۇش';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 كود ئۆزگەرتىش قاچىسىغا يول قويۇش';

  @override
  String get adminTunerAllowStreamSharing => 'ئېقىم ھەمبەھىرلەشكە يول قويۇش';

  @override
  String get adminTunerEnableStreamLooping => 'ئېقىم دەۋرىيلىكىنى قوزغىتىش';

  @override
  String get adminTunerIgnoreDts => 'DTS نى نەزەردىن ساقىت قىلىش';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'كىرگۈزۈشنى ئەسلى كادر تېزلىكىدە ئوقۇش';

  @override
  String get adminEditProvider => 'تەمىنلىگۈچىنى تەھرىرلەش';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ھۆججەت ياكى URL';

  @override
  String get adminXmltvMoviePrefix => 'كىنو ئالدى قوشۇلغۇچىسى';

  @override
  String get adminXmltvMovieCategories => 'كىنو تۈرلىرى';

  @override
  String get adminXmltvCategoriesHelp => 'كۆپ تۈرنى تىك سىزىق بىلەن ئايرىڭ.';

  @override
  String get adminXmltvKidsCategories => 'بالىلار تۈرلىرى';

  @override
  String get adminXmltvNewsCategories => 'خەۋەر تۈرلىرى';

  @override
  String get adminXmltvSportsCategories => 'تەنتەربىيە تۈرلىرى';

  @override
  String get adminSdUsername => 'ئىشلەتكۈچى ئىسمى';

  @override
  String get adminSdPassword => 'پارول';

  @override
  String get adminSdCountry => 'دۆلەت';

  @override
  String get adminSdCountrySelect => 'دۆلەت تاللاڭ';

  @override
  String get adminSdPostalCode => 'پوچتا نومۇرى';

  @override
  String get adminSdGetListings => 'پروگرامما تىزىملىكىنى ئېلىش';

  @override
  String get adminSdListings => 'پروگرامما تىزىملىكلىرى';

  @override
  String get adminEnableAllTuners => 'بارلىق تيۇنېرلارنى قوزغىتىش';

  @override
  String get adminTunerType => 'تەڭشىگۈچ تىپى';

  @override
  String get adminTunerAdded => 'Tuner قوشۇلدى';

  @override
  String adminTunerAddFailed(String error) {
    return 'تيۇنېر قوشۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminAddGuideProvider => 'يېتەكچى تەمىنلىگۈچىنى قوشۇڭ';

  @override
  String get adminProviderType => 'تەمىنلىگۈچى تىپى';

  @override
  String get adminProviderAdded => 'تەمىنلىگۈچى قوشۇلدى';

  @override
  String adminProviderAddFailed(String error) {
    return 'تەمىنلىگۈچى قوشۇش مەغلۇپ بولدى: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'تيۇنېرنى چىقىرىۋېتىش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'تەڭشىگۈچنى ئەسلىگە كەلتۈرۈش تەلەپ قىلىندى';

  @override
  String adminTunerResetFailed(String error) {
    return 'تيۇنېرنى ئەسلىگە قايتۇرۇش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'بۇ تيۇنېر تىپى ئەسلىگە قايتۇرۇشنى قوللىمايدۇ.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'تەمىنلىگۈچىنى چىقىرىۋېتىش مەغلۇپ بولدى: $error';
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
  String get adminMovieRecordingPath => 'كىنو خاتىرىلەش يولى';

  @override
  String get adminGuideDays => 'جەدۋەل سانلىق مەلۇمات كۈنلىرى';

  @override
  String get adminGuideDaysAuto => 'ئاپتوماتىك';

  @override
  String adminGuideDaysValue(int days) {
    return '$days كۈن';
  }

  @override
  String get adminRecordingPostProcessor =>
      'كېيىنكى بىر تەرەپ قىلىش پروگراممىسىنىڭ يولى';

  @override
  String get adminRecordingPostProcessorArgs =>
      'كېيىنكى بىر تەرەپ قىلغۇچ پارامېتىرلىرى';

  @override
  String get adminSaveRecordingNfo => 'خاتىرىلەنمە NFO مېتا ئۇچۇرىنى ساقلاش';

  @override
  String get adminSaveRecordingImages => 'خاتىرىلەنمە رەسىملىرىنى ساقلاش';

  @override
  String get adminLiveTvSectionTiming => 'ۋاقىت تەڭشىكى';

  @override
  String get adminLiveTvSectionPaths => 'خاتىرىلەش يوللىرى';

  @override
  String get adminLiveTvSectionPostProcessing => 'كېيىنكى بىر تەرەپ قىلىش';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'جەدۋەل سانلىق مەلۇماتى: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'خاتىرىلەش تەڭشەكلىرى ساقلاندى';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'تەڭشەكلەرنى ساقلاش مەغلۇپ بولدى: $error';
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
    return 'ماسلاشتۇرۇشلارنى يېڭىلاش مەغلۇپ بولدى: $error';
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
  String get adminRefreshGuideData => 'جەدۋەل سانلىق مەلۇماتىنى يېڭىلاش';

  @override
  String get adminGuideRefreshStarted =>
      'جەدۋەل سانلىق مەلۇماتىنى يېڭىلاش باشلاندى';

  @override
  String get adminGuideRefreshUnavailable =>
      'بۇ مۇلازىمېتىردا جەدۋەل يېڭىلاش ۋەزىپىسى يوق.';

  @override
  String get adminAddProvider => 'تەمىنلىگۈچىنى قوشۇڭ';

  @override
  String get adminNoListingProviders => 'تىزىملىك ​​تەمىنلىگۈچىلەر سەپلەنمىگەن';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'خاتىرىلەش يولى: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'تىياتىر يولى: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'ئالدى قوشۇمچە ۋاقىت: $minutes مىنۇت';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'ئارقا قوشۇمچە ۋاقىت: $minutes مىنۇت';
  }

  @override
  String get adminTunerDiscovery => 'تيۇنېر بايقاش';

  @override
  String get adminChannelMappings => 'قانال ماسلاشتۇرۇشلىرى';

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
    return '$name زاپاس نۇسخىسى ھازىر ئەسلىگە كەلتۈرۈلسۇنمۇ؟';
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
  String get adminApply => 'قوللىنىش';

  @override
  String get adminNotSet => 'تەڭشەلمىدى';

  @override
  String get adminReset => 'ئەسلىگە قايتۇرۇش';

  @override
  String get adminLogsTitle => 'مۇلازىمېتىر خاتىرىسى';

  @override
  String get adminLogsNewestFirst => 'ئەڭ يېڭى بىرىنچى';

  @override
  String get adminLogsOldestFirst => 'كونىسى ئالدىدا';

  @override
  String get adminLogsJustNow => 'ھازىر';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes مىنۇت ئىلگىرى';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours سائەت ئىلگىرى';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days كۈن ئىلگىرى';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName نى يۈكلەش مەغلۇپ بولدى';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count نەتىجە';
  }

  @override
  String get adminLogViewerNoMatches => 'ماس كېلىدىغان قۇر يوق';

  @override
  String get adminMetadataEditorTitle => 'مېتا ئۇچۇر تەھرىرلىگۈچ';

  @override
  String get adminMetadataIdentify => 'تونۇش';

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
  String get adminMetadataStudios => 'ئىستۇدىيەلەر';

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
  String get adminMetadataImagePrimary => 'ئاساسىي';

  @override
  String get adminMetadataImageBackdrop => 'ئارقا كۆرۈنۈش';

  @override
  String get adminMetadataImageLogo => 'لوگو';

  @override
  String get adminMetadataImageBanner => 'بايراق';

  @override
  String get adminMetadataImageThumb => 'كىچىك كۆرۈنۈش';

  @override
  String get adminMetadataRecursive => 'تەكرار';

  @override
  String get adminMetadataProvider => 'تەمىنلىگۈچى';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType رەسىمى يېڭىلاندى';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType رەسىمى يوللاندى';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType رەسىمى ئۆچۈرۈلدى';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'رەسىم چۈشۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'تاللانغان رەسىمنى ئوقۇش مەغلۇب بولدى';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'رەسىم يوللاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType رەسىمىنى ئۆچۈرۈش';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'بۇ نۆۋەتتىكى رەسىمنى تۈردىن چىقىرىپ تاشلايدۇ.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'رەسىمنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType رەسىمى تاللاش';
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
    return 'يېڭىلانما بار: v$version';
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
    return 'يېڭىلانمىنى قاچىلاش (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ھېچقانداق ئورالما سىزنىڭ ئىزدىشىڭىزگە ماس كەلمەيدۇ';

  @override
  String get adminPluginsCatalogEmpty => 'ئورالما يوق';

  @override
  String adminPluginsInstalling(String name) {
    return '«$name» قاچىلىنىۋاتىدۇ...';
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
    return '$name تەڭشەكلىرى';
  }

  @override
  String get adminPluginDetailDetails => 'تەپسىلاتى';

  @override
  String get adminPluginDetailDeveloper => 'ئىجادىيەتچى';

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
    return 'خەزىنىلەرنى يۈكلەش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ئامبارنى ئۆچۈرۈڭ';

  @override
  String adminReposRemoveConfirm(String name) {
    return '«$name» نى راستىنلا چىقىرىۋېتەمسىز؟';
  }

  @override
  String get adminReposRemove => 'چىقىرىۋېتىش';

  @override
  String adminReposSaveFailed(String error) {
    return 'خەزىنىلەرنى ساقلاش مەغلۇپ بولدى: $error';
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
  String get adminNetworkingWhitelist => 'ئاق تىزىملىك';

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
  String get adminBrandingCustomCss => 'ئىختىيارى CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ئىختىيارى CSS تور كۆرۈنمە يۈزىگە قوللىنىلدى';

  @override
  String get adminBrandingEnableSplash => 'چاقماق ئېكرانىنى قوزغىتىڭ';

  @override
  String get adminBrandingSplashUpload => 'رەسىم يوللاش';

  @override
  String get adminBrandingSplashUploaded => 'قوزغىلىش ئېكرانى يېڭىلاندى';

  @override
  String get adminBrandingSplashUploadFailed =>
      'قوزغىلىش ئېكرانىنى يوللاش مەغلۇپ بولدى';

  @override
  String get adminBrandingSplashDeleted => 'قوزغىلىش ئېكرانى چىقىرىۋېتىلدى';

  @override
  String get adminBrandingNoSplash => 'ئىختىيارى قوزغىلىش ئېكرانى يوق';

  @override
  String get adminPlaybackHwAccel => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminPlaybackHwAccelLabel => 'قاتتىق دېتالنى تېزلىتىش';

  @override
  String get adminPlaybackEnableHwEncoding => 'قاتتىق دېتال كودلاشنى قوزغىتىڭ';

  @override
  String get adminPlaybackEnableHwDecoding => 'قاتتىق دېتال يېشىشنى قوزغىتىڭ:';

  @override
  String get adminPlaybackQsvDevice => 'QSV ئۈسكۈنىسى';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'كۈچەيتىلگەن NVDEC كودسىزلىغۇچنى قوزغىتىش';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'سىستېمىنىڭ ئۆز قاتتىق دېتال كودسىزلىغۇچىنى ئالدىن تاللاش';

  @override
  String get adminPlaybackColorDepth => 'قاتتىق دېتال كودسىزلاش رەڭ چوڭقۇرلۇقى';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 بىتلىق HEVC كودسىزلاش';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 بىتلىق VP9 كودسىزلاش';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 بىتلىق كودسىزلاش';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 بىتلىق كودسىزلاش';

  @override
  String get adminPlaybackHwEncodingSection => 'قاتتىق دېتال كودلاش';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC كودلاشقا يول قويۇش';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 كودلاشقا يول قويۇش';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel تۆۋەن قۇۋۋەتلىك H.264 كودلىغۇچنى قوزغىتىش';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel تۆۋەن قۇۋۋەتلىك HEVC كودلىغۇچنى قوزغىتىش';

  @override
  String get adminPlaybackToneMapping => 'رەڭ تونى خەرىتىلەش';

  @override
  String get adminPlaybackEnableTonemapping => 'رەڭ تونى خەرىتىلەشنى قوزغىتىش';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP رەڭ تونى خەرىتىلەشنى قوزغىتىش';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox رەڭ تونى خەرىتىلەشنى قوزغىتىش';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'رەڭ تونى خەرىتىلەش ئالگورىتمى';

  @override
  String get adminPlaybackTonemappingMode => 'رەڭ تونى خەرىتىلەش ھالىتى';

  @override
  String get adminPlaybackTonemappingRange => 'رەڭ تونى خەرىتىلەش دائىرىسى';

  @override
  String get adminPlaybackTonemappingDesat =>
      'رەڭ تونى خەرىتىلەش رەڭسىزلەندۈرۈشى';

  @override
  String get adminPlaybackTonemappingPeak => 'رەڭ تونى خەرىتىلەش چوققىسى';

  @override
  String get adminPlaybackTonemappingParam => 'رەڭ تونى خەرىتىلەش پارامېتىرى';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP رەڭ تونى خەرىتىلەش يورۇقلۇقى';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP رەڭ تونى خەرىتىلەش سېلىشتۇرمىسى';

  @override
  String get adminPlaybackPresetsQuality => 'ئالدىن تەڭشەكلەر ۋە سۈپەت';

  @override
  String get adminPlaybackEncoderPreset => 'كودلىغۇچ ئالدىن تەڭشىكى';

  @override
  String get adminPlaybackH264Crf => 'H.264 كودلاش CRF قىممىتى';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) كودلاش CRF قىممىتى';

  @override
  String get adminPlaybackDeinterlaceMethod =>
      'ئارىلاشما سىزىقنى يوقىتىش ئۇسۇلى';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'ئارىلاشما سىزىقنى يوقىتىشتا كادر تېزلىكىنى ھەسسىلەش';

  @override
  String get adminPlaybackAudioSection => 'ئاۋاز';

  @override
  String get adminPlaybackEnableAudioVbr => 'ئاۋاز VBR كودلاشنى قوزغىتىش';

  @override
  String get adminPlaybackDownmixBoost => 'ئاۋاز تۆۋەنلىتىش كۈچەيتىشى';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ستېرېئوغا تۆۋەنلىتىش ئالگورىتمى';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'ئەڭ چوڭ بىرلەشتۈرۈش ئۆچرىتىنىڭ چوڭلۇقى';

  @override
  String get adminPlaybackAutoOption => 'ئاپتوماتىك';

  @override
  String get adminPlaybackEncoding => 'كودلاش';

  @override
  String get adminPlaybackEncodingThreads => 'كودلاش';

  @override
  String get adminPlaybackFallbackFont => 'چۈشۈش خەت نۇسخىسىنى قوزغىتىڭ';

  @override
  String get adminPlaybackFallbackFontPath => 'خاتالىق خەت شەكلى';

  @override
  String get adminPlaybackStreaming => 'ئېقىم قويۇش';

  @override
  String get adminResumeVideo => 'سىن';

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
  String get adminTrickplayInterval => 'ئارىلىق (ms)';

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
  String get adminTaskStop => 'توختىتىش';

  @override
  String get adminRunningTasks => 'ئىجرا بولۇۋاتقان ۋەزىپىلەر';

  @override
  String get adminTaskRun => 'ئىجرا';

  @override
  String get adminTaskDetailLastExecution => 'ئاخىرقى ئىجرا';

  @override
  String get adminTaskDetailStarted => 'باشلاندى';

  @override
  String get adminTaskDetailEnded => 'ئاخىرلاشتى';

  @override
  String get adminTaskDetailDuration => 'داۋاملىشىش ۋاقتى';

  @override
  String get adminTaskDetailErrorLabel => 'خاتالىق:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'ھەر كۈنى $time دە';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ھەر $day $time دە';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ھەر $duration';
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
      other: '$count سائەت',
      one: '1 سائەت',
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
  String get adminActivityOlder => 'بۇرۇنقىلار';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days كۈن ئىلگىرى';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours سائەت ئىلگىرى';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes مىنۇت ئىلگىرى';
  }

  @override
  String get adminActivityNow => 'ھازىر';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes مىنۇت';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours سائەت';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days كۈن';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'ئاتلاپ كۆرۈشتىكى ئالدىن كۆرۈش كىچىك رەسىملىرى ئۈچۈن trickplay رەسىم ھاسىللاشنى تەڭشەڭ.';

  @override
  String get adminNetworkingPublicHttpsPort => 'ئاممىۋى HTTPS ئېغىزى';

  @override
  String get adminNetworkingBaseUrl => 'ئاساسى URL';

  @override
  String get adminNetworkingBaseUrlHint => 'مەسىلەن / jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'ئاممىۋى HTTP ئېغىزى';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS تەلەپ قىلىش';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'بارلىق يىراقتىن كەلگەن تەلەپلەرنى HTTPS قا يۆتكەيدۇ. مۇلازىمېتىردا ئىناۋەتلىك گۇۋاھنامە بولمىسا كۈچكە ئىگە ئەمەس.';

  @override
  String get adminNetworkingCertPassword => 'گۇۋاھنامە پارولى';

  @override
  String get adminNetworkingIpSettings => 'IP تەڭشەكلىرى';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 نى قوزغىتىش';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 نى قوزغىتىش';

  @override
  String get adminNetworkingAutoDiscovery =>
      'ئاپتوماتىك ئېغىز خەرىتىلەشنى قوزغىتىش';

  @override
  String get adminNetworkingLocalSubnets => 'LAN تورلىرى';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'يەرلىك توردا دەپ قارىلىدىغان IP ئادرېسلار ياكى CIDR تارماق تورلىرىنىڭ پەش ياكى قۇر بىلەن ئايرىلغان تىزىملىكى.';

  @override
  String get adminNetworkingPublishedUris =>
      'ئېلان قىلىنغان مۇلازىمېتىر URI لىرى';

  @override
  String get adminNetworkingPublishedUriHint =>
      'تارماق تور ياكى ئادرېسنى ئېلان قىلىنغان URL غا خەرىتىلەڭ، مەسىلەن all=https://example.com';

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
  String get adminPlaybackThrottleBuffering => 'غەملەشنى چەكلەش';

  @override
  String get adminPlaybackThrottleDelay => 'چەكلەش كېچىكتۈرۈشى (سېكۇنت)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'ئېكران خېتىنى شۇئان ئاجرىتىشقا يول قويۇش';

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
    return 'مەزمۇن تىپىنى يېڭىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ئاستا جاۋاب قايتۇرۇش چېكى (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'ئاستا ئىنكاس ئاگاھلاندۇرۇشلىرىنى قوزغىتىش';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect نى قوزغىتىش';

  @override
  String get adminGeneralSectionServer => 'مۇلازىمېتىر';

  @override
  String get adminGeneralSectionMetadata => 'مېتا ئۇچۇر';

  @override
  String get adminGeneralSectionPaths => 'يوللار';

  @override
  String get adminGeneralSectionPerformance => 'ئۈنۈم';

  @override
  String get adminGeneralCachePath => 'كەش يولى';

  @override
  String get adminGeneralMetadataPath => 'مېتا ئۇچۇر يولى';

  @override
  String get adminGeneralServerName => 'مۇلازىمېتىر ئىسمى';

  @override
  String get adminGeneralDisplayLanguage => 'ئالدىن تاللانغان كۆرسىتىش تىلى';

  @override
  String get adminSettingsLoadFailed => 'تەڭشەكلەرنى يۈكلىيەلمىدى';

  @override
  String get adminDiscover => 'بايقاش';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ماسلاشتۇرۇشلارنى يېڭىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'ۋاقىت چېكى: $duration';
  }

  @override
  String get folders => 'ھۆججەت قىسقۇچ';

  @override
  String get libraries => 'مېدىيا ئامبارلىرى';

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
      other: '# قاتناشقۇچى',
      one: '# قاتناشقۇچى',
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
  String get syncPlayShuffleModeShuffled => 'تەرتىپسىز';

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
    return 'تۈر $index';
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
    return '$userName SyncPlay گۇرۇپپىسىغا قوشۇلدى';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay گۇرۇپپىسىدىن ئايرىلدى';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay زىيارەت قىلىش رەت قىلىندى';

  @override
  String get syncPlayAccessDeniedMessage =>
      'بۇ SyncPlay گۇرۇپپىسىدىكى بىر ياكى بىر نەچچە تۈرنى زىيارەت قىلالمايسىز. گۇرۇپپا ئىگىسىدىن كۈتۈپخانىنىڭ ئىجازىتىنى دەلىللەشنى ياكى باشقىچە ئۆچرەت تاللاشنى تەلەپ قىلىڭ.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'قويۇش $groupName بىلەن ماسقەدەملىنىۋاتىدۇ';
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
      other: '# قۇر بايقالدى',
      one: '# قۇر بايقالدى',
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
  String get offlineBannerTitle => 'توردا ئەمەسسىز';

  @override
  String get offlineBannerSubtitle => 'چۈشۈرۈلمىلىرىڭىز كۆرسىتىلىۋاتىدۇ';

  @override
  String get offlineBannerAction => 'چۈشۈرۈلمىلەر';

  @override
  String get serverUnreachableBannerTitle =>
      'مۇلازىمېتىرىڭىزغا ئۇلانغىلى بولمىدى';

  @override
  String get serverUnreachableBannerSubtitle =>
      'قايتا ئۇلانغۇچە چۈشۈرۈلمىلەردىن قويۇلىدۇ';

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
    return 'ئېكرانغا يوللاش كونترولى مەغلۇپ بولدى: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind كونتروللىرى';
  }

  @override
  String get castDeviceVolume => 'ئۈسكۈنىنىڭ ھەجىمى';

  @override
  String get castVolumeUnavailable => 'ئىشلەتكىلى بولمايدۇ';

  @override
  String castStopKind(String kind) {
    return '$kind نى توختىتىش';
  }

  @override
  String get audioLabel => 'ئاۋاز';

  @override
  String get subtitlesLabel => 'ئېكران خېتى';

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
    return '$length خانىلىق PIN كىرگۈزۈڭ';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ئۆزىڭىزنىڭ $length خانىلىق PIN كودىنى كىرگۈزۈڭ';
  }

  @override
  String get pinIncorrect => 'PIN خاتا';

  @override
  String get pinMismatch => 'PIN ماس كەلمەيدۇ';

  @override
  String get pinForgot => 'PIN نى ئۇنتۇپ قالدىڭىزمۇ؟';

  @override
  String get pinClear => 'تازىلاش';

  @override
  String get pinBackspace => 'ئۆچۈرۈش كۇنۇپكىسى';

  @override
  String get quickConnectAuthorized => 'Quick Connect تەلىپى تەستىقلاندى.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect كودى ئىناۋەتسىز ياكى ۋاقتى ئۆتكەن.';

  @override
  String get quickConnectNotSupported =>
      'بۇ مۇلازىمېتىر Quick Connect نى قوللىمايدۇ.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect كودىنى تەستىقلاش مەغلۇپ بولدى.';

  @override
  String get quickConnectDisabled => 'بۇ مۇلازىمېتىردا Quick Connect تاقالغان.';

  @override
  String get quickConnectForbidden =>
      'ھېساباتىڭىز بۇ Quick Connect تەلىپىنى تەستىقلىيالمايدۇ.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect كودى تېپىلمىدى. يېڭى كود سىناڭ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect مەغلۇپ بولدى: $message';
  }

  @override
  String get quickConnectEnterCode => 'كود كىرگۈزۈڭ';

  @override
  String get quickConnectAuthorize => 'ھوقۇق بېرىش';

  @override
  String remoteCommandFailed(String error) {
    return 'بۇيرۇق مەغلۇپ بولدى: $error';
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
    return 'ئېكرانغا يوللاشنى باشلاش مەغلۇپ بولدى: $error';
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
    return '$name چۈشۈرۈلۈۋاتىدۇ...';
  }

  @override
  String get trackActionDeletedFile => 'چۈشۈرۈلگەن ھۆججەت ئۆچۈرۈلدى';

  @override
  String get trackActionDeleteFileFailed => 'چۈشۈرۈلگەن ھۆججەتنى ئۆچۈرەلمىدى';

  @override
  String get shuffleBy => 'تەرتىپسىز قويۇش ئاساسى';

  @override
  String get shuffleSelectLibrary => 'كۈتۈپخانىنى تاللاڭ';

  @override
  String get shuffleSelectGenre => 'ژانىرنى تاللاڭ';

  @override
  String get shuffleLibrary => 'مېدىيا ئامبىرى';

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
  String get imageTypePoster => 'پوستېر';

  @override
  String get imageTypeThumbnail => 'كىچىك كۆرۈنۈش';

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
  String get upNext => 'كېيىنكىسى';

  @override
  String get playNext => 'كېيىنكى ئوينى';

  @override
  String get stillWatchingContent => 'قويۇش توختىتىلدى. ھازىرمۇ كۆرۈۋاتامسىز؟';

  @override
  String get stillWatchingStop => 'توختىتىش';

  @override
  String get stillWatchingContinue => 'داۋاملاشتۇر';

  @override
  String skipSegment(String segment) {
    return '$segment دىن ئاتلاش';
  }

  @override
  String get liveTv => 'بىۋاسىتە تېلېۋىزىيە';

  @override
  String get continueWatchingAndNextUp => 'داۋاملىق كۆرۈش ۋە كېيىنكى باسقۇچ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'چۈشۈرۈلۈۋاتىدۇ $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName چۈشۈرۈلۈۋاتىدۇ';
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
  String get playerTooltipPlaybackQuality => 'بىت نىسبىتى';

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
  String get contextMenuHideFromContinueWatching =>
      'كۆرۈشنى داۋاملاشتۇرۇشتىن يوشۇرۇش';

  @override
  String get contextMenuHideFromNextUp => 'كېيىنكىسىدىن يوشۇرۇش';

  @override
  String get contextMenuAddToCollection => 'توپلامغا قوشۇش';

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
  String get settingsAuthenticationSection => 'كىملىك دەلىللەش';

  @override
  String get settingsSortServersBy => 'مۇلازىمېتىرلارنى تەرتىپلەش';

  @override
  String get settingsLastUsed => 'ئاخىرقى قېتىم ئىشلىتىلگەن';

  @override
  String get settingsAlphabetical => 'ئېلىپبە';

  @override
  String get settingsConnectionSection => 'ئۇلىنىش';

  @override
  String get settingsAllowSelfSignedCerts =>
      'ئۆزى ئىمزالانغان گۇۋاھنامىلەرگە يول قويۇش';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'ئۆزى ئىمزالانغان ياكى شەخسىي CA TLS گۇۋاھنامىسى ئىشلىتىدىغان مۇلازىمېتىرلارغا ئىشىنىدۇ. پەقەت ئۆزىڭىز باشقۇرىدىغان مۇلازىمېتىرلار ئۈچۈنلا قوزغىتىڭ. بۇ بارلىق ئۇلىنىشلاردا گۇۋاھنامە دەلىللەشنى تاقايدۇ.';

  @override
  String get settingsPrivacyAndSafetySection => 'شەخسىيەت ۋە بىخەتەرلىك';

  @override
  String get settingsBlockedRatings => 'چەكلەنگەن باھا';

  @override
  String get settingsGeneralStyle => 'ئادەتتىكى ئۇسلۇب';

  @override
  String get settingsGeneralStyleSubtitle =>
      'تېما تەلەپپۇزى ، ئارقا كۆرۈنۈش ، كۆرگەن كۆرسەتكۈچ ۋە تېما مۇزىكىسى';

  @override
  String get settingsDetailsScreen => 'تەپسىلات ئېكرانى';

  @override
  String get settingsDetailsScreenSubtitle =>
      'ئۇسلۇب، تەگلىك گۇڭگالاشتۇرۇش ۋە بەتكۈچ ھەرىكىتى';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Seerr كۇنۇپكىسىنى يولباشچى بالداقتا كۆرسىتىش';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ئۈستى يولباشچى بالداقتا تېكىست خەتلىرىنى ھەمىشە كۆرسىتىش';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ھەر بىر كۈتۈپخانىنىڭ باش بېتىنىڭ كۆرۈنۈشىنى توغرىلاڭ. ئۆزگەرتىشنىڭ كۈچكە ئىگە بولۇشى ئۈچۈن Moonfin نى قايتا قوزغىتىڭ.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'مېدىيا بالدىقى ۋە يەرلىك ئالدىن كۆرۈشلەر';

  @override
  String get settingsVisualOverlays => 'كۆرۈنۈش قاپلىمىلىرى';

  @override
  String get settingsSeasonalSurprise => 'پەسىل خاراكتېرلىك ھەيران قېلىش';

  @override
  String get settingsMetadataAndRatings => 'مېتا ئۇچۇر ۋە باھالار';

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
  String get settingsCustomPath => 'ئىختىيارى يول';

  @override
  String get settingsEnterDownloadFolderPath =>
      'چۈشۈرۈش قىسقۇچ يولىنى كىرگۈزۈڭ';

  @override
  String get settingsConcurrentDownloads => 'ماس قەدەملىك چۈشۈرۈش';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'بىراقلا چۈشۈرەلەيدىغان ئەڭ كۆپ تۈر.';

  @override
  String get settingsAppInfo => 'ئەپ ئۇچۇرى';

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
      'ئىجادىيەتچىگە بىر چىنە قەھۋە ئىئانە قىلىڭ';

  @override
  String get settingsLegal => 'قانۇنىي ئۇچۇرلار';

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
      other: '# ئىجازەتنامە ئۇقتۇرۇشى',
      one: '# ئىجازەتنامە ئۇقتۇرۇشى',
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
  String get settingsMediaSegmentCountdown => 'مېدىيا بۆلىكى تەتۈر ساناش';

  @override
  String get settingsProgressBar => 'ئىلگىرىلەش بالدىقى';

  @override
  String get settingsTimer => 'ۋاقىت ساناقچىسى';

  @override
  String get settingsNone => 'يوق';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (كونا)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (مىراس)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (تەۋسىيە)';

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
  String get settingsCinemaMode => 'كىنوخانا ھالىتى';

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
  String get settingsVideoStartDelay => 'سىن باشلىنىش كېچىكتۈرۈشى';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'بىۋاسىتە تېلېۋىزىيەنى بىۋاسىتە قويۇش';

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
  String get settingsSyncplayAdvancedCorrection => 'ئالىي تۈزىتىش';

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
  String get lastPlayed => 'ئەڭ ئاخىرقى قويۇلغان';

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
    return 'يېقىندا تارقىتىلغان $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'كېيىنكى بۆلۈمنى ئاپتوماتىك قويۇش';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'كېيىنكى بۆلۈم بار بولسا ئۆزلۈكىدىن قويىدۇ.';

  @override
  String get skipSilenceTitle => 'جىمجىتلىقتىن ئاتلاش';

  @override
  String get skipSilenceSubtitle =>
      'ئېقىم قوللىغاندا ئۈنسىز ئاۋاز بۆلەكلىرىدىن ئۆزلۈكىدىن ئاتلايدۇ.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'سىرتقى ئاۋاز ئۈنۈملىرىگە يول قويۇش';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'تەڭشىگۈچ ۋە ئۈنۈم ئەپلىرىنىڭ (مەسىلەن Wavelet) Media3 قويۇش سېئانسلىرىغا ئۇلىنىشىغا يول قويىدۇ.';

  @override
  String get disableTunnelingTitle => 'تونېللاشنى تاقاش';

  @override
  String get disableTunnelingSubtitle =>
      'تونېلسىز قويۇشقا زورلايدۇ. تونېللىق ئاۋاز/سىن ئۈزۈلۈشى بار ئۈسكۈنىلەردە پايدىلىق.';

  @override
  String get enableTunnelingTitle => 'تونېللاشنى قوزغىتىش';

  @override
  String get enableTunnelingSubtitle =>
      'ئالىي تەڭشەك. ئاۋاز ۋە سىننى ماسلاشقان قاتتىق دېتال يولى ئارقىلىق ئۆتكۈزىدۇ. بەزى ئۈسكۈنىلەردە ئاۋاز/سىن ئۈزۈلۈشى پەيدا قىلغاچقا، سۈكۈتتە تاقاق.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision profile 7 نى HEVC قا خەرىتىلەش';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision profile 7 ئېقىملىرىنى DV يوق ئۈسكۈنىلەردە HDR10 غا ماس HEVC سۈپىتىدە قويىدۇ.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'سىڭدۈرۈلگەن ئېكران خېتى ئۇسلۇبلىرىنى ئىشلىتىش';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ئېكران خېتى يولىغا سىڭدۈرۈلگەن رەڭ، خەت نۇسخىسى ۋە ئورۇنلاشتۇرۇشنى قوللىنىدۇ. ئۆزىڭىزنىڭ ئۇسلۇب مايىللىقلىرىنى ئىشلىتىش ئۈچۈن تاقاڭ.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'سىڭدۈرۈلگەن ئېكران خېتى خەت چوڭلۇقىنى ئىشلىتىش';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ئېكران خېتى يولىغا سىڭدۈرۈلگەن خەت چوڭلۇقى ئۇچۇرلىرىنى قوللىنىدۇ. ئۇسلۇب مايىللىقىڭىزدىكى ئېكران خېتى چوڭلۇقىنى ئىشلىتىش ئۈچۈن تاقاڭ.';

  @override
  String get showMediaDetailsOnLibraryPage => 'مېدىيا تەپسىلاتلىرىنى كۆرسىتىش';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'ئامبار بەتلىرىنىڭ ئۈستىدە تاللانغان تۈرنىڭ تەپسىلاتلىرىنى كۆرسىتىدۇ.';

  @override
  String get hideBackdropsInLibraries =>
      'كۆرگەندە تەگلىك رەسىملىرى يوشۇرۇلسۇنمۇ؟';

  @override
  String get useDetailedSubHeadings => 'تەپسىلىي تارماق ماۋزۇلارنى ئىشلىتىش';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ئامبار بەتلىرىدە تەپسىلىي ياكى ئاددىي تارماق قۇرنى كۆرسىتىدۇ.';

  @override
  String get savedThemesDeleteDialogTitle => 'ساقلانغان تېما ئۆچۈرۈلسۇنمۇ؟';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '«$themeName» بۇ ئۈسكۈنىنىڭ غەملىكىدىن چىقىرىۋېتىلسۇنمۇ؟';
  }

  @override
  String get themeStore => 'تېما دۇكىنى';

  @override
  String get themeStoreSubtitle => 'جامائەت تېمىلىرىنى كۆرۈپ ساقلاڭ';

  @override
  String get themeStoreDescription =>
      'تېمىنى ساقلىسىڭىز، باشقا ساقلانغان تېمىلىرىڭىزدەك ئىشلىتەلەيسىز.';

  @override
  String get themeStoreEmpty => 'ھازىرچە تېما يوق.';

  @override
  String get themeStoreLoadFailed =>
      'تېما دۇكىنىنى يۈكلىگىلى بولمىدى. ئۇلىنىشىڭىزنى تەكشۈرۈپ قايتا سىناڭ.';

  @override
  String get themeStoreSave => 'ساقلاش';

  @override
  String get themeStoreSaveAndApply => 'ساقلاپ قوللىنىش';

  @override
  String get themeStoreSaved => 'ساقلاندى';

  @override
  String get themeStoreInvalidMessage => 'بۇ تېمىنى يۈكلىگىلى بولمىدى.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '«$themeName» ساقلاندى.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '«$themeName» بۇ ئۈسكۈنىدىن ئۆچۈرۈلدى.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '«$themeName» نى ئۆچۈرگىلى بولمىدى.';
  }

  @override
  String get savedThemesTitle => 'ساقلانغان تېمىلار';

  @override
  String get savedThemesDescription =>
      'بۇلار نۆۋەتتىكى مۇلازىمېتىرنىڭ Moonfin قىستۇرمىسىدىن چۈشۈرۈلگەن تېمىلار. ئۆچۈرسىڭىز پەقەت بۇ يەرلىك نۇسخىلا چىقىرىۋېتىلىدۇ.';

  @override
  String get savedThemesEmpty =>
      'بۇ مۇلازىمېتىر ئۈچۈن ساقلانغان تېما تېپىلمىدى.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ھازىر ئاكتىپ';
  }

  @override
  String get savedThemesDeleteTooltip => 'ساقلانغان تېمىنى ئۆچۈرۈش';

  @override
  String get savedThemesManageSubtitle =>
      'بۇ ئۈسكۈنىدىكى چۈشۈرۈلگەن قىستۇرما تېمىلىرىنى باشقۇرۇش';

  @override
  String get themeEditor => 'تېما تەھرىرلىگۈچ';

  @override
  String get themeEditorSubtitle =>
      'Moonfin تېما تەھرىرلىگۈچىنى تور كۆرگۈچىڭىزدە ئېچىش';

  @override
  String get homeScreen => 'باش ئېكران';

  @override
  String get bottomBar => 'ئاستى بالداق';

  @override
  String get homeRowsStyleClassic => 'كلاسسىك';

  @override
  String get homeRowsStyleModern => 'زامانىۋى';

  @override
  String get homeRowsSection => 'باش بەت قۇرلىرى';

  @override
  String get homeRowDisplay => 'باش بەت قۇرى كۆرسىتىلىشى';

  @override
  String get homeRowSections => 'باش بەت قۇر بۆلەكلىرى';

  @override
  String get homeRowToggles => 'باش بەت قۇر ئۈزچاتلىرى';

  @override
  String get homeRowTogglesSubtitle =>
      'ئامبار ئاساسىدىكى باش بەت قۇر تۈرلىرىنى قوزغىتىڭ ياكى تاقاڭ';

  @override
  String get homeRowTogglesDescription =>
      'باش بەت بۆلەكلىرىدە قۇرلارنى كۆرسىتىش ئۈچۈن تۆۋەندىكى ئۈزچاتلارنى قوزغىتىڭ.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'كلاسسىك ھەر قۇرنىڭ رەسىم تىپى ۋە ئۇچۇر قاپلىمىسىنى ساقلايدۇ. زامانىۋى بوي پوستېردىن تەگلىككە ئۆتىدىغان قۇرلارنى ئىشلىتىدۇ.';

  @override
  String get displayFavoritesRows => 'ئامراقلار قۇرلىرىنى كۆرسىتىش';

  @override
  String get displayFavoritesRowsSubtitle =>
      'باش بەت بۆلەكلىرىدە ئامراق كىنولار، تىياتىرلار ۋە باشقا ئامراق قۇرلارنى كۆرسىتىدۇ.';

  @override
  String get favoritesRowSorting => 'ئامراقلار قۇرى تەرتىپلىنىشى';

  @override
  String get favoritesRowSortingDescription =>
      'ئامراقلار قۇرلىرىنى قوشۇلغان چېسلا، تارقىتىلغان چېسلا، ئېلىپبە تەرتىپى ۋە باشقىلار بويىچە تەرتىپلەيدۇ.';

  @override
  String get displayCollectionsRows => 'توپلام قۇرلىرىنى كۆرسىتىش';

  @override
  String get displayCollectionsRowsSubtitle =>
      'باش بەت بۆلەكلىرىدە توپلام قۇرلىرىنى كۆرسىتىدۇ.';

  @override
  String get collectionsRowSorting => 'توپلام قۇرى تەرتىپلىنىشى';

  @override
  String get collectionsRowSortingDescription =>
      'توپلام قۇرلىرىنى قوشۇلغان چېسلا، تارقىتىلغان چېسلا، ئېلىپبە تەرتىپى ۋە باشقىلار بويىچە تەرتىپلەيدۇ.';

  @override
  String get displayGenresRows => 'ژانىر قۇرلىرىنى كۆرسىتىش';

  @override
  String get displayGenresRowsSubtitle =>
      'باش بەت بۆلەكلىرىدە ژانىر قۇرلىرىنى كۆرسىتىدۇ.';

  @override
  String get genresRowSorting => 'ژانىر قۇرى تەرتىپلىنىشى';

  @override
  String get genresRowSortingDescription =>
      'ژانىر قۇرلىرىنى قوشۇلغان چېسلا، تارقىتىلغان چېسلا، ئېلىپبە تەرتىپى ۋە باشقىلار بويىچە تەرتىپلەيدۇ.';

  @override
  String get genresRowItems => 'ژانىر قۇرى تۈرلىرى';

  @override
  String get genresRowItemsDescription =>
      'ژانىر قۇرلىرىدا كىنو، تىياتىر ياكى ھەر ئىككىسىنى كۆرسىتىدۇ.';

  @override
  String get displayPlaylistsRows => 'قويۇش تىزىملىكى قۇرلىرىنى كۆرسىتىش';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'باش بەت بۆلەكلىرىدە قويۇش تىزىملىكى قۇرلىرىنى كۆرسىتىدۇ.';

  @override
  String get playlistsRowSorting => 'قويۇش تىزىملىكى قۇرى تەرتىپلىنىشى';

  @override
  String get playlistsRowSortingDescription =>
      'قويۇش تىزىملىكى قۇرلىرىنى قوشۇلغان چېسلا، تارقىتىلغان چېسلا، ئېلىپبە تەرتىپى ۋە باشقىلار بويىچە تەرتىپلەيدۇ.';

  @override
  String get displayAudioRows => 'ئاۋاز قۇرلىرىنى كۆرسىتىش';

  @override
  String get displayAudioRowsSubtitle =>
      'باش بەت بۆلەكلىرىدە ئاۋاز قۇرلىرىنى كۆرسىتىدۇ.';

  @override
  String get audioRowsSorting => 'ئاۋاز قۇرلىرى تەرتىپلىنىشى';

  @override
  String get audioRowsSortingDescription =>
      'ئاۋاز قۇرلىرىنى قوشۇلغان چېسلا، تارقىتىلغان چېسلا، ئېلىپبە تەرتىپى ۋە باشقىلار بويىچە تەرتىپلەيدۇ.';

  @override
  String get audioPlaylists => 'ئاۋاز قويۇش تىزىملىكلىرى';

  @override
  String get appearance => 'كۆرۈنۈش';

  @override
  String get layout => 'ئورۇنلاشتۇرۇش';

  @override
  String get theme => 'تېما';

  @override
  String get keyboard => 'ھەرپتاختا';

  @override
  String get navButtons => 'كۇنۇپكىلار';

  @override
  String get rendering => 'سىزىش';

  @override
  String get mpvConfiguration => 'MPV سەپلىمىسى';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'سىرتقى قويغۇچ ئەپ';

  @override
  String get externalPlayerAppDescription =>
      'ئۇزۇن بېسىپ قويۇش تاللانمىسىنى ئېچىش ئۈچۈن سىرتقى قويغۇچنى تەڭشەڭ';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'قويۇش باشلانغاندا ئەپ تاللىغۇچنى كۆرسىتىدۇ.';

  @override
  String get loadingInstalledPlayers => 'قاچىلانغان قويغۇچلار يۈكلىنىۋاتىدۇ...';

  @override
  String get connection => 'ئۇلىنىش';

  @override
  String get audioTranscodeTarget => 'ئاۋاز كود ئۆزگەرتىش نىشانى';

  @override
  String get passthrough => 'بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get supportedOnThisDevice => 'بۇ ئۈسكۈنە قوللايدۇ';

  @override
  String get notSupportedOnThisDevice => 'بۇ ئۈسكۈنە قوللىمايدۇ';

  @override
  String get settingsAudioDtsXPassthrough =>
      'DTS:X (DTS UHD) بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) بىت ئېقىمىنى سىرتقى كودسىزلىغۇچقا ئەۋەتىدۇ.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) لىق TrueHD بىۋاسىتە ئۆتكۈزۈش';

  @override
  String get mediaPlayerBehavior => 'مېدىيا قويغۇچ ھەرىكىتى';

  @override
  String get playbackEnhancements => 'قويۇش كۈچەيتمىلىرى';

  @override
  String get alwaysOn => 'ھەمىشە ئوچۇق.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'ئاخىرقى قىسىمدىن ئاتلاشنى كېيىنكىسى كۆرسىتىلىشىگە ئالماشتۇرۇش';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'ئاخىرقى قىسىمدىن ئاتلاش كۇنۇپكىسىنىڭ ئورنىغا كېيىنكىسى قاپلىمىسىنى كۆرسىتىدۇ.';

  @override
  String get playerRouting => 'قويغۇچ يۆنىلىشى';

  @override
  String get preferSoftwareDecoders =>
      'يۇمشاق دېتال كودسىزلىغۇچلارنى ئالدىن تاللاش';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'قاتتىق دېتال كودسىزلىغۇچتىن بۇرۇن FFmpeg (ئاۋاز) ۋە libgav1 (AV1) نى ئىشلىتىدۇ. HDMI ئاۋاز بىۋاسىتە ئۆتكۈزۈش بۇزۇلسا تاقاڭ.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV دا سىن قويۇشنى تاللانغان سىرتقى ئەپتە ئاچىدۇ.';

  @override
  String get automaticQueuing => 'ئاپتوماتىك ئۆچرەتكە قوشۇش';

  @override
  String get preferSdhSubtitles => 'SDH ئېكران خېتىنى ئالدىن تاللاش';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'ئۆزلۈكىدىن تاللىغاندا SDH/CC ئېكران خېتى يوللىرىنى ئالدىنقى ئورۇنغا قويىدۇ.';

  @override
  String get webDiagnostics => 'تور دىئاگنوزى';

  @override
  String get webDiagnosticsTitle => 'Moonfin تور دىئاگنوزى';

  @override
  String get webDiagnosticsIntro =>
      'بۇ بەتنى تور كۆرگۈچ ئۇلىنىش مەسىلىلىرىنى (CORS، ئارىلاش مەزمۇن ۋە بايقاش تەڭشەكلىرى) دىئاگنوز قىلىشقا ئىشلىتىڭ.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'ئارىلاش مەزمۇن خاتالىقى بايقالدى';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight خاتالىقى بايقالدى';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin بىر HTTPS بەتنىڭ HTTP مۇلازىمېتىر URL ئادرېسىنى چاقىرماقچى بولغانلىقىنى بايقىدى. تور كۆرگۈچلەر بۇ تەلەپنى مۇلازىمېتىرىڭىزغا يېتىشتىن بۇرۇن توسىدۇ.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin كۆپىنچە مېدىيا مۇلازىمېتىرىدا CORS ياكى preflight قېشى كەم بولغاندا كۆرۈلىدىغان تور كۆرگۈچ دەرىجىلىك تەلەپ خاتالىقىنى بايقىدى.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'نىشان URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'تەپسىلات: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'نۆۋەتتىكى ئىجرا مۇھىتى';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Scheme';

  @override
  String get webDiagnosticsPluginMode => 'قىستۇرما ھالىتى';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC سايىلەش';

  @override
  String get webDiagnosticsForcedServerUrl => 'مەجبۇرىي مۇلازىمېتىر URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'سۈكۈتتىكى مۇلازىمېتىر URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'بايقاش ۋاكالەتچى URL';

  @override
  String get notConfigured => 'سەپلەنمىگەن';

  @override
  String get webDiagnosticsMixedContent => 'ئارىلاش مەزمۇن';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'بۇ بەت HTTPS ئارقىلىق يۈكلەنگەن، ئەمما سەپلەنگەن بىر ياكى بىرنەچچە URL بولسا HTTP. تور كۆرگۈچلەر HTTPS بەتلەرنىڭ HTTP API چاقىرىشىنى توسىدۇ.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'ھەل قىلىش: مېدىيا مۇلازىمېتىرىڭىز ياكى ۋاكالەتچى ئېغىزىڭىزنى HTTPS ئارقىلىق تەمىنلەڭ، ياكى Moonfin نى پەقەت ئىشەنچلىك يەرلىك تورلاردىلا HTTP ئارقىلىق ئېچىڭ.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'نۆۋەتتىكى ئىجرا تەڭشەكلىرىدىن ئېنىق ئارىلاش مەزمۇن سەپلىمىسى بايقالمىدى.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS تەكشۈرۈش تىزىملىكى';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• تور كۆرگۈچ Origin نى Access-Control-Allow-Origin غا كىرگۈزۈڭ.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Authorization، X-Emby-Authorization ۋە X-Emby-Token نى Access-Control-Allow-Headers غا كىرگۈزۈڭ.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ئېقىم قويۇش ۋە ئاتلاش ئۈچۈن Content-Range ۋە Accept-Ranges نى ئاشكارىلاڭ.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight تەلەپلىرىگە 204 قايتۇرۇڭ.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'قاش مىسال پارچىسى (nginx ئۇسلۇبى)';

  @override
  String get note => 'ئەسكەرتىش';

  @override
  String get webDiagnosticsNonWebNote =>
      'بۇ دىئاگنوز بېتى تور نەشرى ئۈچۈن. باشقا سۇپىدا كۆرۈۋاتقان بولسىڭىز، بۇ تەكشۈرۈشلەر ماس كەلمەسلىكى مۇمكىن.';

  @override
  String get backToServerSelect => 'مۇلازىمېتىر تاللاشقا قايتىش';

  @override
  String get signOutAllUsers => 'بارلىق ئىشلەتكۈچىلەرنى چىقىرىش';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'مىكروفون ھوقۇقى مەڭگۈلۈك رەت قىلىنغان. سىستېما تەڭشەكلىرىدىن قوزغىتىڭ.';

  @override
  String get voiceSearchPermissionRequired =>
      'ئاۋازلىق ئىزدەشكە مىكروفون ھوقۇقى كېرەك.';

  @override
  String get voiceSearchNoMatch => 'ئېنىق ئاڭلانمىدى. قايتا سىناڭ.';

  @override
  String get voiceSearchNoSpeechDetected => 'سۆز بايقالمىدى.';

  @override
  String get voiceSearchMicrophoneError => 'مىكروفون خاتالىقى.';

  @override
  String get voiceSearchNeedsInternet => 'ئاۋازلىق ئىزدەشكە تور كېرەك.';

  @override
  String get voiceSearchServiceBusy =>
      'ئاۋاز مۇلازىمىتى ئالدىراش. قايتا سىناڭ.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'مىكروفون ھوقۇقى مەڭگۈلۈك رەت قىلىنغان.';

  @override
  String get microphonePermissionDenied => 'مىكروفون ھوقۇقى رەت قىلىندى.';

  @override
  String get speechRecognitionUnavailable =>
      'بۇ ئۈسكۈنىدە سۆز تونۇش ئىقتىدارى يوق.';

  @override
  String get openIosRoutePicker => 'iOS يۆنىلىش تاللىغۇچنى ئېچىش';

  @override
  String get airPlayRoutePickerUnavailable =>
      'بۇ ئۈسكۈنىدە AirPlay يۆنىلىش تاللىغۇچ يوق.';

  @override
  String get videos => 'سىنلار';

  @override
  String get programs => 'پروگراممىلار';

  @override
  String get songs => 'ناخشىلار';

  @override
  String get photoAlbums => 'سۈرەت ئالبوملىرى';

  @override
  String get photos => 'سۈرەتلەر';

  @override
  String get people => 'كىشىلەر';

  @override
  String get recentlyReleasedEpisodes => 'يېقىندا تارقىتىلغان بۆلۈملەر';

  @override
  String get watchAgain => 'قايتا كۆرۈش';

  @override
  String get guestAppearances => 'مېھمان روللىرى';

  @override
  String get appearancesSeerr => 'قاتناشقان ئەسەرلەر (Seerr)';

  @override
  String get crewContributionsSeerr => 'خادىم تۆھپىلىرى (Seerr)';

  @override
  String get watchWithGroup => 'گۇرۇپپا بىلەن كۆرۈش';

  @override
  String get errors => 'خاتالىقلار';

  @override
  String get warnings => 'ئاگاھلاندۇرۇشلار';

  @override
  String get disk => 'دىسكا';

  @override
  String get openInBrowser => 'تور كۆرگۈچتە ئېچىش';

  @override
  String get embeddedBrowserNotAvailable =>
      'بۇ سۇپىدا قىستۇرما تور كۆرگۈچ يوق.';

  @override
  String get adminRestartServerConfirmation =>
      'مۇلازىمېتىرنى راستىنلا قايتا قوزغىتامسىز؟';

  @override
  String get adminShutdownServerConfirmation =>
      'مۇلازىمېتىرنى راستىنلا تاقامسىز؟ ئۇنى قولدا قايتا قوزغىتىشىڭىز كېرەك بولىدۇ.';

  @override
  String get internal => 'ئىچكى';

  @override
  String get idle => 'بىكار';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ئىشلەتكۈچى تېپىلمىدى';

  @override
  String get adminNoUsersMatchSearch => 'ئىزدىگىنىڭىزگە ماس ئىشلەتكۈچى يوق';

  @override
  String get adminNoDevicesFound => 'ئۈسكۈنە تېپىلمىدى';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'نۆۋەتتىكى سۈزگۈچلەرگە ماس ئۈسكۈنە يوق';

  @override
  String get passwordSet => 'پارول تەڭشەلگەن';

  @override
  String get noPasswordConfigured => 'پارول تەڭشەلمىگەن';

  @override
  String get remoteAccess => 'يىراقتىن زىيارەت';

  @override
  String get localOnly => 'پەقەت يەرلىك';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'مېدىيا ئىستاتىستىكىسىنى يۈكلەش مەغلۇپ بولدى';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'بارلىق مېدىيا ئامبارلىرىنىڭ بىرلەشتۈرۈلگەن ئىستاتىستىكىسى.';

  @override
  String get analyticsTopArtists => 'ئالدىنقى سەنئەتكارلار';

  @override
  String get analyticsTopAuthors => 'ئالدىنقى ئاپتورلار';

  @override
  String get analyticsTopContributors => 'ئالدىنقى تۆھپىكارلار';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ئامبار',
      one: '1 ئامبار',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'بۇ تاللاش ئۈچۈن ئىندېكسلانغان مېدىيا ئومۇمىي سانلىرى تېخى يوق.';

  @override
  String get analyticsLibraryDetails => 'ئامبار تەپسىلاتلىرى';

  @override
  String get analyticsLibraryBreakdown => 'ئامبار تەقسىماتى';

  @override
  String get analyticsNoLibrariesAvailable => 'ئامبار يوق.';

  @override
  String get adminServerAdministrationTitle => 'مۇلازىمېتىر باشقۇرۇش';

  @override
  String get adminServerPathData => 'سانلىق مەلۇمات';

  @override
  String get adminServerPathImageCache => 'رەسىم غەملىكى';

  @override
  String get adminServerPathCache => 'غەملەك';

  @override
  String get adminServerPathLogs => 'خاتىرىلەر';

  @override
  String get adminServerPathMetadata => 'مېتا ئۇچۇر';

  @override
  String get adminServerPathTranscode => 'كود ئۆزگەرتىش';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'بۇ مۇلازىمېتىر ھېچقانداق يول قايتۇرمىدى.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ئىشلىتىلگەن';
  }

  @override
  String get userActivity => 'ئىشلەتكۈچى پائالىيىتى';

  @override
  String get systemEvents => 'سىستېما ھادىسىلىرى';

  @override
  String get needsAttention => 'دىققەت تەلەپ قىلىدۇ';

  @override
  String get adminDrawerSectionServer => 'مۇلازىمېتىر';

  @override
  String get adminDrawerSectionPlayback => 'قويۇش';

  @override
  String get adminDrawerSectionDevices => 'ئۈسكۈنىلەر';

  @override
  String get adminDrawerSectionAdvanced => 'ئالىي';

  @override
  String get adminDrawerSectionPlugins => 'قىستۇرمىلار';

  @override
  String get adminDrawerSectionLiveTv => 'بىۋاسىتە تېلېۋىزىيە';

  @override
  String get homeVideos => 'ئائىلە سىنلىرى';

  @override
  String get mixedContent => 'ئارىلاش مەزمۇن';

  @override
  String get homeVideosAndPhotos => 'ئائىلە سىنلىرى ۋە سۈرەتلەر';

  @override
  String get mixedMoviesAndShows => 'ئارىلاش كىنو ۋە تىياتىرلار';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'خاتىرىلەنمە تېپىلمىدى';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ئارخىپىدىن رەسىم بەتلىرى تېپىلمىدى.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'قىستۇرما سىزغۇچ مەغلۇپ بولدى ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB سىزغۇچى مەغلۇپ بولدى ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ئوقۇغۇچ ئۈچۈن يەرلىك ھۆججەت كەم: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri دىن كىتاب سانلىق مەلۇماتىنى ئېچىۋاتقاندا HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'ئوقۇغىلى بولىدىغان كىتاب ئېغىزى يوق';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'قوللىمايدىغان كومىكس ئارخىپى فورماتى: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'بۇ سۇپىدا CBR ئاجرىتىش قىستۇرمىسى يوق.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr ئارخىپىنى ئاجرىتىش مەغلۇپ بولدى.';

  @override
  String get cb7ExtractionUnavailable =>
      'بۇ سۇپىدا CB7 ئاجرىتىش ئىقتىدارى يوق.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'بۇ سۇپىدا CB7 ئاجرىتىش قىستۇرمىسى يوق.';

  @override
  String get closeGenrePanel => 'ژانىر تاختىسىنى تاقاش';

  @override
  String get loadingShuffle => 'تەرتىپسىز قويۇش يۈكلىنىۋاتىدۇ...';

  @override
  String get libraryShuffleLabel => 'ئامبار تەرتىپسىز قويۇش';

  @override
  String get randomShuffleLabel => 'خالىغانچە تەرتىپسىز قويۇش';

  @override
  String get genresShuffleLabel => 'ژانىر تەرتىپسىز قويۇش';

  @override
  String get autoHdrSwitching => 'ئاپتوماتىك HDR ئالماشتۇرۇش';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR سىن قويۇلغاندا HDR نى ئۆزلۈكىدىن قوزغىتىپ، چېكىنگەندە ئېكران ھالىتىنى ئەسلىگە قايتۇرىدۇ.';

  @override
  String get whenFullscreen => 'پۈتۈن ئېكران بولغاندا';

  @override
  String get changeArtwork => 'بېزەك رەسىمىنى ئۆزگەرتىش';

  @override
  String get missing => 'كەم';

  @override
  String get transcodingLimits => 'كود ئۆزگەرتىش چەكلىمىلىرى';

  @override
  String get clearAllArtworkButton => 'بارلىق بېزەك رەسىملىرى تازىلانسۇنمۇ؟';

  @override
  String get clearAllArtworkWarning =>
      'بارلىق چۈشۈرۈلگەن بېزەك رەسىملىرىنى راستىنلا تازىلامسىز؟';

  @override
  String get confirmClear => 'تازىلاشنى جەزملەش';

  @override
  String confirmClearMessage(String itemType) {
    return 'بۇ $itemType نى راستىنلا تازىلامسىز؟';
  }

  @override
  String get uploadButton => 'يوللامسىز؟';

  @override
  String get resolutionLabel => 'ئېنىقلىق: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'پەقەت كۆرۈنمە يۈز تىلىدىكى بېزەك رەسىملىرىنىلا كۆرسىتىش';

  @override
  String get confirmClearAll => 'ھەممىنى تازىلاشنى جەزملەش';

  @override
  String get imageUploadSuccess => 'رەسىم مۇۋەپپەقىيەتلىك يوللاندى!';

  @override
  String imageUploadFailed(String error) {
    return 'رەسىم يوللاش مەغلۇپ بولدى: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'رەسىمنى تەڭشەش مەغلۇپ بولدى: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'رەسىمنى ئۆچۈرۈش مەغلۇپ بولدى: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'بارلىق بېزەك رەسىملىرىنى تازىلاش مەغلۇپ بولدى: $error';
  }

  @override
  String get yes => 'ھەئە';

  @override
  String get posterCategory => 'پوستېر';

  @override
  String get backdropsCategory => 'تەگلىكلەر';

  @override
  String get bannerCategory => 'لەۋھە';

  @override
  String get logoCategory => 'لوگو';

  @override
  String get thumbnailCategory => 'كىچىك كۆرۈنۈش';

  @override
  String get artCategory => 'بېزەك';

  @override
  String get discArtCategory => 'دىسكا بېزىكى';

  @override
  String get screenshotCategory => 'ئېكران كۆرۈنۈشى';

  @override
  String get boxCoverCategory => 'قاپ مۇقاۋىسى';

  @override
  String get boxRearCoverCategory => 'قاپ ئارقا مۇقاۋىسى';

  @override
  String get menuArtCategory => 'تىزىملىك بېزىكى';

  @override
  String get confirmItemPoster => 'پوستېر';

  @override
  String get confirmItemBackdrop => 'تەگلىك';

  @override
  String get confirmItemBanner => 'لەۋھە';

  @override
  String get confirmItemLogo => 'لوگو';

  @override
  String get confirmItemThumbnail => 'كىچىك كۆرۈنۈش';

  @override
  String get confirmItemArt => 'بېزەك';

  @override
  String get confirmItemDiscArt => 'دىسكا بېزىكى';

  @override
  String get confirmItemScreenshot => 'ئېكران كۆرۈنۈشى';

  @override
  String get confirmItemBoxCover => 'قاپ مۇقاۋىسى';

  @override
  String get confirmItemBoxRearCover => 'قاپ ئارقا مۇقاۋىسى';

  @override
  String get confirmItemMenuArt => 'تىزىملىك بېزىكى';

  @override
  String get resolutionAll => 'ھەممىسى';

  @override
  String get resolutionHigh => 'يۇقىرى (1080p+)';

  @override
  String get resolutionMedium => 'ئوتتۇرا (720p)';

  @override
  String get resolutionLow => 'تۆۋەن (<720p)';

  @override
  String get sources => 'مەنبەلەر';

  @override
  String get audiobookChapters => 'بابلار';

  @override
  String get audiobookBookmarks => 'خەتكۈشلەر';

  @override
  String get audiobookNotes => 'ئىزاھاتلار';

  @override
  String get audiobookQueue => 'ئۆچرەت';

  @override
  String get audiobookTimeline => 'ۋاقىت ئوقى';

  @override
  String get audiobookTimelineEmpty => 'ۋاقىت ئوقى قۇرۇق';

  @override
  String get audiobookWholeBook => 'پۈتۈن كىتاب';

  @override
  String get audiobookFocusedTimeline => 'مەركەزلەشكەن ۋاقىت ئوقى';

  @override
  String get audiobookExportBookmarks => 'خەتكۈشلەرنى چىقىرىش';

  @override
  String get audiobookExportNotes => 'ئىزاھاتلارنى چىقىرىش';

  @override
  String get audiobookExportAll => 'ھەممىنى چىقىرىش';

  @override
  String audiobookExportSuccess(String path) {
    return '$path غا چىقىرىلدى';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'چىقىرىش مەغلۇپ بولدى: $error';
  }

  @override
  String get audiobookLyrics => 'ناخشا تېكىستى';

  @override
  String get audiobookAddBookmark => 'خەتكۈش قوشۇش';

  @override
  String get audiobookAddNote => 'ئىزاھات قوشۇش';

  @override
  String get audiobookEditNote => 'ئىزاھاتنى تەھرىرلەش';

  @override
  String get audiobookNoteHint => 'بۇ پەيت ئۈچۈن ئىزاھات يېزىڭ';

  @override
  String get audiobookSleepTimer => 'ئۇيقۇ ۋاقىت ساناقچىسى';

  @override
  String get audiobookSleepOff => 'تاقاق';

  @override
  String get audiobookSleepEndOfChapter => 'باب ئاخىرى';

  @override
  String get audiobookSleepCustom => 'ئىختىيارى';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining قالدى';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مىنۇت',
      one: '1 مىنۇت',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'قويۇش سۈرئىتى';

  @override
  String get audiobookRemainingTime => 'قالغىنى';

  @override
  String get audiobookElapsedTime => 'ئۆتكىنى';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds سېكۇنت كەينىگە';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds سېكۇنت ئالدىغا';
  }

  @override
  String get audiobookPreviousChapter => 'ئالدىنقى باب';

  @override
  String get audiobookNextChapter => 'كېيىنكى باب';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total بابتىن $current-باب';
  }

  @override
  String get audiobookNoChapters => 'باب يوق';

  @override
  String get audiobookNoBookmarks => 'تېخى خەتكۈش يوق';

  @override
  String get audiobookNoNotes => 'تېخى ئىزاھات يوق';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position غا خەتكۈش قوشۇلدى';
  }

  @override
  String get audiobookSpeedReset => '1.0x قا قايتۇرۇش';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'ساقلاش';

  @override
  String get audiobookCancel => 'بىكار قىلىش';

  @override
  String get audiobookDelete => 'ئۆچۈرۈش';

  @override
  String get subtitlePreferences => 'ئېكران خېتى مايىللىقلىرى';

  @override
  String get subtitlePreferencesDescription =>
      'ئېكران خېتى ھالەتلىرى، سۈكۈتتىكى تىللار، كۆرۈنۈش ۋە سىزىش تاللانمىلىرىنى ئۆزگەرتىڭ.';

  @override
  String get subtitleRendering => 'ئېكران خېتى سىزىلىشى';

  @override
  String get displayOptions => 'كۆرسىتىش تاللانمىلىرى';

  @override
  String get releaseDateAscending => 'تارقىتىلغان چېسلا (ئۆسۈش تەرتىپى)';

  @override
  String get releaseDateDescending => 'تارقىتىلغان چېسلا (كېمىيىش تەرتىپى)';

  @override
  String get groupContributions => 'تۆھپىلەرنى گۇرۇپپىلاش';

  @override
  String get groupMultipleRoles => 'كۆپ روللارنى گۇرۇپپىلاش';

  @override
  String get libraryWriteAccessWarningTitle =>
      'ئامبارغا يېزىش ھوقۇقى ئاگاھلاندۇرۇشى';

  @override
  String get libraryWriteAccessHowToFix => 'ھەل قىلىش ئۇسۇلى:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. مۇلازىمېتىردىكى مېدىيا ئامبار قىسقۇچلىرىڭىز ئۈچۈن Jellyfin مۇلازىمەت ئىشلەتكۈچىسىگە (مەسىلەن jellyfin ياكى Docker PUID/PGID) يېزىش ھوقۇقى بېرىڭ.\n\n2. ياكى Jellyfin باشقۇرۇش تاختىسى -> ئامبارلار غا بېرىپ، بۇ ئامبارنى تەھرىرلەپ، بېزەك رەسىملىرىنى Jellyfin نىڭ ئىچكى ساندانىدا ساقلاش ئۈچۈن «بېزەك رەسىملىرىنى مېدىيا قىسقۇچلىرىغا ساقلاش» نى تاقاڭ.';

  @override
  String get dismiss => 'يېپىش';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '«$libraryName» ئامبىرىڭىز بېزەك رەسىملىرىنى بىۋاسىتە مېدىيا قىسقۇچلىرىغا ساقلايدىغان قىلىپ سەپلەنگەن («بېزەك رەسىملىرىنى مېدىيا قىسقۇچلىرىغا ساقلاش» قوزغىتىلغان). ئەمما Jellyfin يېزىش ھوقۇقىنى سىناپ كۆردى ۋە بۇ مۇندەرىجىگە ھۆججەت يازالمايدۇ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin بېزەك رەسىمىنى يېڭىلىيالمىغاندەك قىلىدۇ. ئامبىرىڭىز بېزەك رەسىملىرىنى بىۋاسىتە مېدىيا قىسقۇچلىرىغا ساقلايدىغان قىلىپ سەپلەنگەن («بېزەك رەسىملىرىنى مېدىيا قىسقۇچلىرىغا ساقلاش» قوزغىتىلغان). بۇ خاتالىق ئادەتتە Jellyfin مۇلازىمېتىر جەريانىنىڭ مېدىيا مۇندەرىجىلىرىڭىزگە ھۆججەت يېزىش ھوقۇقى بولمىغاندا كۆرۈلىدۇ.';

  @override
  String get externalLists => 'سىرتقى تىزىملىكلەر';

  @override
  String get replay => 'قايتا قويۇش';

  @override
  String get fileInformation => 'ھۆججەت ئۇچۇرى';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'چوڭلۇقى: $size  •  فورماتى: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'بارلىق ($count) ئاۋاز يوللىرىنى كۆرسىتىش';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'بارلىق ($count) ئېكران خېتى يوللىرىنى كۆرسىتىش';
  }

  @override
  String get checkingDirectPlay =>
      'بىۋاسىتە قويۇش ئىقتىدارى تەكشۈرۈلۈۋاتىدۇ...';

  @override
  String get directPlayCapabilityLabel => 'بىۋاسىتە قويۇش ئىقتىدارى: ';

  @override
  String get forced => 'مەجبۇرىي';

  @override
  String get transcodeContainerNotSupported =>
      'قاچا فورماتىنى قويغۇچ قوللىمايدۇ.';

  @override
  String get transcodeVideoCodecNotSupported => 'سىن كودېكىنى قوللىمايدۇ.';

  @override
  String get transcodeAudioCodecNotSupported => 'ئاۋاز كودېكىنى قوللىمايدۇ.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'ئېكران خېتى فورماتىنى قوللىمايدۇ (كۆيدۈرۈش كېرەك).';

  @override
  String get transcodeAudioProfileNotSupported => 'ئاۋاز پروفىلىنى قوللىمايدۇ.';

  @override
  String get transcodeVideoProfileNotSupported => 'سىن پروفىلىنى قوللىمايدۇ.';

  @override
  String get transcodeVideoLevelNotSupported => 'سىن دەرىجىسىنى قوللىمايدۇ.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'بۇ ئۈسكۈنە سىن ئېنىقلىقىنى قوللىمايدۇ.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'سىن بىت چوڭقۇرلۇقىنى قوللىمايدۇ.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'سىن كادر تېزلىكىنى قوللىمايدۇ.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ھۆججەت بىت نىسبىتى قويغۇچنىڭ ئېقىم چېكىدىن ئېشىپ كەتتى.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'سىن بىت نىسبىتى ئېقىم چېكىدىن ئېشىپ كەتتى.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ئاۋاز بىت نىسبىتى ئېقىم چېكىدىن ئېشىپ كەتتى.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ئاۋاز قاناللىرىنىڭ سانىنى قوللىمايدۇ.';

  @override
  String get sortAlphabetical => 'ئېلىپبە تەرتىپى';

  @override
  String get sortReleaseAscending => 'تارقىتىلىش تەرتىپى (ئۆسۈش)';

  @override
  String get sortReleaseDescending => 'تارقىتىلىش تەرتىپى (كېمىيىش)';

  @override
  String get sortCustomDragDrop => 'ئىختىيارى (سۆرەپ-تاشلاش)';

  @override
  String get playlistSortOptions => 'قويۇش تىزىملىكى تەرتىپلەش تاللانمىلىرى';

  @override
  String get resetSort => 'تەرتىپنى ئەسلىگە قايتۇرۇش';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode نى قايتا كۆرۈش';
  }

  @override
  String get rewatchPlaylist => 'قايتا كۆرۈش تىزىملىكى';

  @override
  String get noSubtitlesFound => 'ئېكران خېتى تېپىلمىدى.';

  @override
  String get adminControls => 'باشقۇرغۇچى كونتروللىرى';

  @override
  String get impellerRendering => 'سىزىش ماتورى (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller بولسا Flutter نىڭ زامانىۋى GPU سىزغۇچى بولۇپ، ھەرىكەتلەرنى تېخىمۇ سىلىق قىلىپ توختاپ قېلىشنى ئازايتىدۇ. بەزى TV قۇتىلىرى ۋە كونا GPU لاردا خاتالىق ياكى قارا سىن پەيدا قىلىشى مۇمكىن؛ شۇنداق ئەھۋال كۆرۈلسە ئۇنى تاقاق قىلىڭ. ئاپتوماتىك ئۈسكۈنىڭىزگە ئەڭ ماس سۈكۈتتىكىنى تاللايدۇ. قوللىنىش ئۈچۈن Moonfin نى قايتا قوزغىتىڭ.';

  @override
  String get impellerAuto => 'ئاپتوماتىك';

  @override
  String get impellerOn => 'ئوچۇق';

  @override
  String get impellerOff => 'تاقاق';

  @override
  String get impellerRestartTitle => 'قايتا قوزغىتىش كېرەك';

  @override
  String get impellerRestartMessage =>
      'سىزىش ماتورىنى ئۆزگەرتىش ئۈچۈن Moonfin قايتا قوزغىتىلىشى كېرەك. ئەپنى ھازىر تاقاپ، ئاندىن قايتا ئېچىڭ.';

  @override
  String get impellerCloseNow => 'ئەپنى ھازىر تاقاش';

  @override
  String get adminRefreshLibrary => 'ئامبارنى يېڭىلاش';

  @override
  String get adminRefreshAllLibraries => 'بارلىق ئامبارلارنى يېڭىلاش';

  @override
  String get adminRepoSortDateOldest => 'قوشۇلغان چېسلا (كونىسى ئالدىدا)';

  @override
  String get adminRepoSortDateNewest => 'قوشۇلغان چېسلا (يېڭىسى ئالدىدا)';

  @override
  String get adminRepoSortNameAsc => 'ئېلىپبە تەرتىپى (A دىن Z گە)';

  @override
  String get adminRepoSortNameDesc => 'ئېلىپبە تەرتىپى (Z دىن A غا)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'مۇلازىمېتىر ئىستاتىستىكىسى يۈكلىنىۋاتىدۇ... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'مەنبەگە ماسلاش';

  @override
  String get imdbTop250Movies => 'IMDb ئالدىنقى 250 كىنو';

  @override
  String get imdbTop250TvShows => 'IMDb ئالدىنقى 250 تېلېۋىزىيە تىياتىرى';

  @override
  String get imdbMostPopularMovies => 'IMDb ئەڭ ئالقىشلانغان كىنولار';

  @override
  String get imdbMostPopularTvShows =>
      'IMDb ئەڭ ئالقىشلانغان تېلېۋىزىيە تىياتىرلىرى';

  @override
  String get imdbLowestRatedMovies => 'IMDb ئەڭ تۆۋەن باھالانغان كىنولار';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ئەڭ يۇقىرى باھالانغان ئىنگلىزچە كىنولار';
}
