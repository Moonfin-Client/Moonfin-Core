// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'கணக்கு விருப்பங்கள்';

  @override
  String get interfaceLanguage => 'இடைமுக மொழி';

  @override
  String get systemLanguageDefault => 'சிஸ்டம் இயல்புநிலை';

  @override
  String get signIn => 'உள்நுழையவும்';

  @override
  String get empty => 'காலி';

  @override
  String connectingToServer(String serverName) {
    return '$serverName உடன் இணைக்கிறது';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get username => 'பயனர் பெயர்';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get quickConnectInstruction =>
      'உங்கள் சர்வரின் இணைய டாஷ்போர்டில் இந்தக் குறியீட்டை உள்ளிடவும்:';

  @override
  String get waitingForAuthorization => 'அங்கீகாரத்திற்காக காத்திருக்கிறது...';

  @override
  String get back => 'பின்செல்';

  @override
  String get serverUnavailable => 'சேவையகம் கிடைக்கவில்லை';

  @override
  String get loginFailed => 'உள்நுழைவு தோல்வியடைந்தது';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect கிடைக்கவில்லை: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect கிடைக்கவில்லை ($status): $detail';
  }

  @override
  String get whosWatching => 'யார் பார்க்கிறார்கள்?';

  @override
  String get addUser => 'பயனரைச் சேர்க்கவும்';

  @override
  String get selectServer => 'சேவையகத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin பதிப்பு $version';
  }

  @override
  String get savedServers => 'சேமிக்கப்பட்ட சேவையகங்கள்';

  @override
  String get discoveredServers => 'கண்டுபிடிக்கப்பட்ட சேவையகங்கள்';

  @override
  String get noneFound => 'எதுவும் கிடைக்கவில்லை';

  @override
  String get unableToConnectToServer => 'சேவையகத்துடன் இணைக்க முடியவில்லை';

  @override
  String get addServer => 'சேவையகத்தைச் சேர்க்கவும்';

  @override
  String get embyConnect => 'Emby இணைக்கவும்';

  @override
  String get removeServer => 'சேவையகத்தை அகற்று';

  @override
  String removeServerConfirmation(String serverName) {
    return 'உங்கள் சர்வர்களிலிருந்து \"$serverName\" ஐ அகற்றவா?';
  }

  @override
  String get cancel => 'ரத்து செய்';

  @override
  String get remove => 'அகற்று';

  @override
  String get connectToServer => 'சேவையகத்துடன் இணைக்கவும்';

  @override
  String get serverAddress => 'சேவையக முகவரி';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'இணைக்கவும்';

  @override
  String get secureStorageUnavailable => 'பாதுகாப்பான சேமிப்பு கிடைக்கவில்லை';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin உங்கள் கணினி கீரிங்கை அணுக முடியவில்லை. உள்நுழைவு தொடரலாம், ஆனால் கீரிங் திறக்கப்படும் வரை பாதுகாப்பான டோக்கன் சேமிப்பிடம் கிடைக்காமல் போகலாம்.';

  @override
  String get ok => 'சரி';

  @override
  String get settingsAppearanceTheme => 'பயன்பாட்டு தீம்';

  @override
  String get detailScreenStyle => 'விவரத் திரை பாணி';

  @override
  String get detailScreenStyleSubtitle =>
      'கிளாசிக் என்பது Moonfin இன் அசல் மையப்படுத்தப்பட்ட அமைப்பு. மாடர்ன் என்பது திரைக்கேற்ப மாறும் சினிமா பாணி அமைப்பு.';

  @override
  String get detailScreenStyleMoonfin => 'கிளாசிக்';

  @override
  String get detailScreenStyleModern => 'மாடர்ன்';

  @override
  String get expandedTabs => 'விரிவாக்கப்பட்ட தாவல்கள்';

  @override
  String get expandedTabsSubtitle =>
      'தாவல்களை உலாவும்போது அவற்றின் உள்ளடக்கத்தைத் தானாகக் காட்டும். ஒவ்வொரு தாவலையும் கைமுறையாகத் திறந்து மூட இதை அணைக்கவும்.';

  @override
  String get showTechnicalDetails => 'தொழில்நுட்ப விவரங்களைக் காட்டவா?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'பேனர் சுருக்கத்தில் கோடெக், தெளிவுத்திறன் மற்றும் ஸ்ட்ரீம் தகவலைக் காட்டும்';

  @override
  String get recommendationSystem => 'பரிந்துரை அமைப்பு';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin பரிந்துரைகள் என்ற உள்ளூர் நூலக அல்காரிதத்தையோ அல்லது ஆன்லைன் TMDb இன் ஒற்றுமை அளவீடுகளையோ பயன்படுத்தும். குறிப்பு: ஆன்லைன் பரிந்துரைகளுக்கு Seerr ஒருங்கிணைப்பு தேவை.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin பரிந்துரைகள்';

  @override
  String get recommendationSystemTmdb => 'TMDb ஒற்றுமை';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'பெற்றோர் மதிப்பீட்டு வரம்பைப் பயன்படுத்தவா?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'இலக்கு மீடியாவின் பெற்றோர் மதிப்பீட்டின்படி Moonfin பரிந்துரைகளை வரம்பிடும்';

  @override
  String get interfaceStyle => 'இடைமுக பாணி';

  @override
  String get interfaceStyleSubtitle =>
      'தானியங்கி உங்கள் சாதனத்திற்கு ஏற்ப அமையும். ஒரு தோற்றத்தைக் கட்டாயப்படுத்த Apple அல்லது Material ஐத் தேர்வுசெய்யவும்.';

  @override
  String get interfaceStyleAutomatic => 'தானியங்கி';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'கிளாஸ் தரம்';

  @override
  String get glassQualitySubtitle =>
      'தானியங்கி இந்தச் சாதனத்திற்கு ஏற்ற சிறந்த கிளாஸ் விளைவைத் தேர்வுசெய்யும். முழுமை உண்மையான மங்கலைக் கட்டாயப்படுத்தும்; குறைவு GPU ஆற்றலைச் சேமிக்கும் இலகுவான கிளாஸைப் பயன்படுத்தும்.';

  @override
  String get glassQualityAuto => 'தானியங்கி';

  @override
  String get glassQualityFull => 'முழுமை';

  @override
  String get glassQualityReduced => 'குறைவு';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'பயன்பாட்டை மறுதொடக்கம் செய்யாமல் Moonfin மற்றும் Neon Pulse இடையே மாறவும்';

  @override
  String get customThemeTitle => 'தனிப்பயன் தீம்';

  @override
  String get customThemeSubtitle =>
      'தனிப்பயன் தீம்கள் Moonfin முழுவதும் காட்சிக் கூறுகளை மாற்றும். உங்கள் பாணிக்கு ஏற்ற ஒன்றைத் தேர்வுசெய்யவும்.';

  @override
  String get keyboardPreferSystemIme => 'சிஸ்டம் விசைப்பலகையை விரும்பு';

  @override
  String get keyboardPreferSystemImeDescription =>
      'உரை உள்ளீட்டிற்கு உங்கள் சாதனத்தின் உள்ளீட்டு முறையை இயல்பாகப் பயன்படுத்தும்';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'தற்போதைய Moonfin நீங்கள் அனைவரும் விரும்பி இருக்கிறீர்கள்';

  @override
  String get themeNeonPulse => 'நியான் பல்ஸ்';

  @override
  String get themeNeonPulseSubtitle =>
      'மெஜந்தா பளபளப்பு, சியான் உரை மற்றும் வலுவான குரோம் மாறுபாடு கொண்ட சின்த்வேவ் ஸ்டைலிங்';

  @override
  String get themeGlass => 'கிளாஸ்';

  @override
  String get themeGlassSubtitle =>
      'நகரும் சாய்வுப் பின்னணி, பனிபடர்ந்த மேற்பரப்புகள் மற்றும் Apple-நீல நிற தனித்துவத்துடன் கூடிய திரவ-கிளாஸ் பாணி';

  @override
  String get theme8BitHero => '8-பிட் ஹீரோ';

  @override
  String get theme8BitHeroSubtitle =>
      'தடிமனான வண்ணத்தட்டு, சதுரமான ஓரங்கள், கூர்மையான நிழல்கள் மற்றும் பிக்சல் எழுத்துருவுடன் கூடிய ரெட்ரோ பிக்சல்-கலை பாணி';

  @override
  String get embyConnectSignInSubtitle =>
      'உங்கள் Emby Connect கணக்கில் உள்நுழையவும்';

  @override
  String get emailOrUsername => 'மின்னஞ்சல் அல்லது பயனர் பெயர்';

  @override
  String get selectAServer => 'ஒரு சேவையகத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get tryAgain => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get noLinkedServers =>
      'இந்த Emby Connect கணக்குடன் எந்த சேவையகமும் இணைக்கப்படவில்லை';

  @override
  String get invalidEmbyConnectCredentials => 'தவறான Emby இணைப்புச் சான்றுகள்';

  @override
  String get invalidEmbyConnectLogin =>
      'தவறான Emby Connect பயனர்பெயர் அல்லது கடவுச்சொல்';

  @override
  String get embyConnectExchangeNotSupported =>
      'சேவையகம் Emby இணைப்பு பரிமாற்றத்தை ஆதரிக்காது';

  @override
  String get embyConnectNetworkError =>
      'Emby இணைப்பு அல்லது தேர்ந்தெடுக்கப்பட்ட சேவையகத்தைத் தொடர்பு கொள்ளும்போது நெட்வொர்க் பிழை';

  @override
  String get loadingLinkedServers => 'இணைக்கப்பட்ட சேவையகங்களை ஏற்றுகிறது...';

  @override
  String get connectingToServerEllipsis => 'சேவையகத்துடன் இணைக்கிறது...';

  @override
  String get noReachableAddress => 'அணுகக்கூடிய முகவரி எதுவும் வழங்கப்படவில்லை';

  @override
  String get invalidServerExchangeResponse =>
      'சர்வர் எக்ஸ்சேஞ்ச் எண்ட்பாயிண்டிலிருந்து தவறான பதில்';

  @override
  String unableToConnectTo(String target) {
    return '$target உடன் இணைக்க முடியவில்லை';
  }

  @override
  String get exitApp => 'Moonfin இலிருந்து வெளியேறவா?';

  @override
  String get exitAppConfirmation => 'நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get exit => 'வெளியேறு';

  @override
  String get gameMenu => 'மெனு';

  @override
  String get gamePaused => 'இடைநிறுத்தப்பட்டது';

  @override
  String get gameSaveState => 'நிலையைச் சேமி';

  @override
  String get games => 'விளையாட்டுகள்';

  @override
  String get gameLoadState => 'நிலையை ஏற்று';

  @override
  String get gameFastForward => 'வேகமாக முன்னோக்கி';

  @override
  String get gameEmulatorSettings => 'எமுலேட்டர் அமைப்புகள்';

  @override
  String get gameNoCoreOptions =>
      'இந்தக் கோரில் மாற்றக்கூடிய விருப்பங்கள் எதுவும் இல்லை.';

  @override
  String get gameHoldToOpenMenu => 'மெனுவைத் திறக்க அழுத்திப் பிடிக்கவும்';

  @override
  String get gamePlaybackUnsupported =>
      'இந்தச் சாதனத்தில் விளையாட்டுகளை விளையாட இன்னும் ஆதரவு இல்லை.';

  @override
  String get noHomeRowsLoaded => 'முகப்பு வரிசைகளை ஏற்ற முடியவில்லை';

  @override
  String get noHomeRowsHint =>
      'செயலில் உள்ள வீட்டுப் பிரிவுகளைப் புதுப்பிக்க அல்லது குறைக்க முயற்சிக்கவும்.';

  @override
  String get retryHomeRows => 'முகப்பு வரிசைகளை மீண்டும் முயற்சிக்கவும்';

  @override
  String get guide => 'வழிகாட்டி';

  @override
  String get recordings => 'பதிவுகள்';

  @override
  String get schedule => 'அட்டவணை';

  @override
  String get series => 'தொடர்கள்';

  @override
  String get noItemsFound => 'பொருட்கள் எதுவும் கிடைக்கவில்லை';

  @override
  String get home => 'முகப்பு';

  @override
  String get browseAll => 'அனைத்தையும் உலாவவும்';

  @override
  String get genres => 'வகைகள்';

  @override
  String get collectionPlaceholder => 'சேகரிப்பு உருப்படிகள் இங்கே தோன்றும்';

  @override
  String get browseByLetter => 'கடிதம் மூலம் உலாவவும்';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'அகரவரிசையில் உலாவுதல் இங்கே தோன்றும்';

  @override
  String get suggestions => 'பரிந்துரைகள்';

  @override
  String get suggestionsPlaceholder =>
      'பரிந்துரைக்கப்பட்ட உருப்படிகள் இங்கே தோன்றும்';

  @override
  String get failedToLoadLibraries => 'நூலகங்களை ஏற்றுவதில் தோல்வி';

  @override
  String get noLibrariesFound => 'நூலகங்கள் இல்லை';

  @override
  String get library => 'நூலகம்';

  @override
  String get displaySettings => 'காட்சி அமைப்புகள்';

  @override
  String get allGenres => 'அனைத்து வகைகள்';

  @override
  String get noGenresFound => 'வகைகள் எதுவும் இல்லை';

  @override
  String failedToLoadFolderError(String error) {
    return 'கோப்புறையை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get thisFolderIsEmpty => 'இந்தக் கோப்புறை காலியாக உள்ளது';

  @override
  String itemCountLabel(int count) {
    return '$count உருப்படிகள்';
  }

  @override
  String get failedToLoadFavorites => 'பிடித்தவைகளை ஏற்ற முடியவில்லை';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get noFavoritesYet => 'இன்னும் பிடித்தவை இல்லை';

  @override
  String get favorites => 'பிடித்தவை';

  @override
  String totalCountItems(int count) {
    return '$count உருப்படிகள்';
  }

  @override
  String get continuing => 'தொடர்கிறது';

  @override
  String get ended => 'முடிந்தது';

  @override
  String get sortAndFilter => 'வரிசைப்படுத்தி வடிகட்டவும்';

  @override
  String get type => 'வகை';

  @override
  String get sortBy => 'வரிசைப்படுத்து';

  @override
  String get display => 'காட்சி';

  @override
  String get imageType => 'பட வகை';

  @override
  String get posterSize => 'போஸ்டர் அளவு';

  @override
  String get small => 'சிறியது';

  @override
  String get medium => 'நடுத்தர';

  @override
  String get large => 'பெரியது';

  @override
  String get extraLarge => 'கூடுதல் பெரியது';

  @override
  String libraryGenresTitle(String name) {
    return '$name — வகைகள்';
  }

  @override
  String get views => 'காட்சிகள்';

  @override
  String get albums => 'ஆல்பங்கள்';

  @override
  String get albumArtists => 'ஆல்பம் கலைஞர்கள்';

  @override
  String get artists => 'கலைஞர்கள்';

  @override
  String get bookmarks => 'புக்மார்க்குகள்';

  @override
  String get noSavedBookmarks =>
      'இந்தத் தலைப்புக்கான புக்மார்க்குகள் இதுவரை சேமிக்கப்படவில்லை.';

  @override
  String get openBook => 'புத்தகத்தைத் திற';

  @override
  String get chapter => 'அத்தியாயம்';

  @override
  String get page => 'பக்கம்';

  @override
  String get bookmark => 'புக்மார்க்';

  @override
  String get justNow => 'இப்போதுதான்';

  @override
  String minutesAgo(int count) {
    return '$count நிமி முன்';
  }

  @override
  String hoursAgo(int count) {
    return '$count மணி முன்';
  }

  @override
  String daysAgo(int count) {
    return '$count நாள் முன்';
  }

  @override
  String get discoverySubjects => 'கண்டுபிடிப்பு பாடங்கள்';

  @override
  String get pickDiscoverySubjects =>
      'டிஸ்கவரில் காட்ட வேண்டிய சப்ஜெக்ட் ஃபீட்களைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get apply => 'பயன்படுத்து';

  @override
  String get openLink => 'இணைப்பைத் திற';

  @override
  String get scanWithYourPhone => 'உங்கள் தொலைபேசி மூலம் ஸ்கேன் செய்யவும்';

  @override
  String get audiobookGenres => 'ஆடியோபுக் வகைகள்';

  @override
  String get pickAudiobookGenres =>
      'ஆடியோபுக் டிஸ்கவரில் எந்த வகைகளைக் காட்ட வேண்டும் என்பதைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get discoverAudiobooks => 'ஆடியோ புத்தகங்களைக் கண்டறியுங்கள்';

  @override
  String get librivoxDescription =>
      'LibriVox இலிருந்து பிரபலமான பொது டொமைன் தலைப்புகள்.';

  @override
  String titlesCount(int count) {
    return '$count தலைப்புகள்';
  }

  @override
  String get scrollLeft => 'இடதுபுறமாக உருட்டவும்';

  @override
  String get scrollRight => 'வலதுபுறமாக உருட்டவும்';

  @override
  String get couldNotLoadGenre => 'இந்த வகையை இப்போது ஏற்ற முடியவில்லை.';

  @override
  String get continueReading => 'தொடர்ந்து படிக்கவும்';

  @override
  String get savedHighlights => 'சேமிக்கப்பட்ட சிறப்பம்சங்கள்';

  @override
  String get continueListening => 'தொடர்ந்து கேளுங்கள்';

  @override
  String get listen => 'கேளுங்கள்';

  @override
  String get resume => 'தொடர்க';

  @override
  String get failedToLoadLibrary => 'நூலகத்தை ஏற்றுவதில் தோல்வி';

  @override
  String get popularNow => 'இப்போது பிரபலமானது';

  @override
  String get savedForLater => 'பின்னர் சேமிக்கப்பட்டது';

  @override
  String get topListens => 'அதிகம் கேட்பவர்கள்';

  @override
  String get unreadDiscoveries => 'படிக்காத கண்டுபிடிப்புகள்';

  @override
  String get pickUpAgain => 'மீண்டும் எடுக்கவும்';

  @override
  String get bookHighlightsDescription =>
      'சிறப்பம்சங்கள், பிடித்தவை அல்லது வாசிப்பு முன்னேற்றம் கொண்ட உங்கள் புத்தகங்கள்.';

  @override
  String get handPickedFromLibrary =>
      'உங்கள் நூலகத்திலிருந்து தேர்ந்தெடுக்கப்பட்டது.';

  @override
  String get handPickedFromListeningQueue =>
      'நீங்கள் கேட்கும் வரிசையில் இருந்து தேர்ந்தெடுக்கப்பட்டது.';

  @override
  String get booksWithHighlights =>
      'சிறப்பம்சங்கள், பிடித்தவை அல்லது வாசிப்பு முன்னேற்றம் கொண்ட புத்தகங்கள்.';

  @override
  String get jumpBackNarration =>
      'உங்கள் இடத்தை வேட்டையாடாமல் மீண்டும் கதைக்கு செல்லுங்கள்.';

  @override
  String get unreadBooksReady =>
      'அடுத்த அமைதியான நேரத்தில் படிக்காத புத்தகங்கள் தயார்.';

  @override
  String get quickAccessFavorites =>
      'நீங்கள் தொடர்ந்து வரும் புத்தகங்களுக்கு விரைவான அணுகல்.';

  @override
  String get searchAudiobooks => 'ஆடியோ புத்தகங்களைத் தேடுங்கள்';

  @override
  String get searchYourLibrary => 'உங்கள் நூலகத்தில் தேடவும்';

  @override
  String get pickUpStory => 'நீங்கள் விட்ட கதையை எடுங்கள்';

  @override
  String get savedPlacesChapters =>
      'நீங்கள் சேமித்த இடங்கள் மற்றும் முடிக்கப்படாத அத்தியாயங்கள்';

  @override
  String authorsCount(int count) {
    return '$count ஆசிரியர்கள்';
  }

  @override
  String genresCount(int count) {
    return '$count வகைகள்';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% முடிந்தது';
  }

  @override
  String get readyWhenYouAre => 'நீங்கள் இருக்கும் போது தயார்';

  @override
  String get details => 'விவரங்கள்';

  @override
  String get listeningRoom => 'கேட்கும் அறை';

  @override
  String get bookmarksAndProgress => 'புக்மார்க்குகள் & முன்னேற்றம்';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'வாசிப்பை முதன்மைப்படுத்தி உலாவ $count தலைப்புகள் வரிசைப்படுத்தப்பட்டுள்ளன.';
  }

  @override
  String get titles => 'தலைப்புகள்';

  @override
  String get allTitles => 'அனைத்து தலைப்புகள்';

  @override
  String get authors => 'ஆசிரியர்கள்';

  @override
  String get browseByAuthor => 'ஆசிரியர் மூலம் உலாவவும்';

  @override
  String get browseByGenre => 'வகையின்படி உலாவவும்';

  @override
  String get discover => 'கண்டறியவும்';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library இலிருந்து பாடத்தின் அடிப்படையில் பிரபலமான தலைப்புகள்.';

  @override
  String get noBookmarkedItems =>
      'இதுவரை புக்மார்க் செய்யப்பட்ட உருப்படிகள் எதுவும் இல்லை';

  @override
  String get nothingMatchesSection =>
      'இந்தப் பகுதிக்கு இன்னும் எதுவும் பொருந்தவில்லை. மற்றொரு தாவலை முயற்சிக்கவும் அல்லது நூலக ஒத்திசைவு முடிந்ததும் திரும்பி வரவும்.';

  @override
  String get audiobooks => 'ஆடியோ புத்தகங்கள்';

  @override
  String noLabelFound(String label) {
    return '$label எதுவும் இல்லை';
  }

  @override
  String get folder => 'கோப்புறை';

  @override
  String get filters => 'வடிப்பான்கள்';

  @override
  String get readingStatus => 'படிக்கும் நிலை';

  @override
  String get playedStatus => 'விளையாடிய நிலை';

  @override
  String get readStatus => 'படிக்கவும்';

  @override
  String get watched => 'பார்த்தவை';

  @override
  String get unread => 'படிக்காதது';

  @override
  String get unwatched => 'பார்க்காதவை';

  @override
  String get seriesStatus => 'தொடர் நிலை';

  @override
  String get allLibraries => 'அனைத்து நூலகங்கள்';

  @override
  String get books => 'புத்தகங்கள்';

  @override
  String get latestBooks => 'சமீபத்திய புத்தகங்கள்';

  @override
  String get latestAudiobooks => 'சமீபத்திய ஆடியோ புத்தகங்கள்';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count புத்தகங்கள்',
      one: '1 புத்தகம்',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'புத்தகம்';

  @override
  String get bookFormatAudiobook => 'ஆடியோ புத்தகம்';

  @override
  String bookPercentRead(int percent) {
    return '$percent% படித்தது';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time மீதம்';
  }

  @override
  String get bookHeroRead => 'படிக்க';

  @override
  String get bookHeroListen => 'கேட்க';

  @override
  String get author => 'ஆசிரியர்';

  @override
  String get unknownAuthor => 'அறியப்படாத ஆசிரியர்';

  @override
  String get uncategorized => 'வகைப்படுத்தப்படாத';

  @override
  String get overview => 'கண்ணோட்டம்';

  @override
  String get noLibrivoxDescription =>
      'இந்த தலைப்புக்கு இதுவரை LibriVox மூலம் எந்த விளக்கமும் வழங்கப்படவில்லை.';

  @override
  String get readers => 'வாசகர்கள்';

  @override
  String get openLinks => 'இணைப்புகளைத் திற';

  @override
  String get librivoxPage => 'LibriVox பக்கம்';

  @override
  String get internetArchive => 'இணைய காப்பகம்';

  @override
  String get rssFeed => 'ஆர்எஸ்எஸ் ஊட்டம்';

  @override
  String get downloadZip => 'ஜிப்பைப் பதிவிறக்கவும்';

  @override
  String sectionCountLabel(int count) {
    return '$count பிரிவுகள்';
  }

  @override
  String firstPublished(int year) {
    return 'முதல் வெளியீடு $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'இந்த தலைப்புக்கான மேலோட்டம் Open Library இலிருந்து இன்னும் கிடைக்கவில்லை.';

  @override
  String get subjects => 'பாடங்கள்';

  @override
  String get all => 'அனைத்து';

  @override
  String booksCount(int count) {
    return '$count புத்தகங்கள்';
  }

  @override
  String get couldNotLoadSubject => 'இந்த தலைப்பை இப்போது ஏற்ற முடியவில்லை.';

  @override
  String get audiobookDetails => 'ஆடியோ புத்தக விவரங்கள்';

  @override
  String authorsCountTitle(int count) {
    return '$count ஆசிரியர்கள்';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ஆடியோ புத்தகங்கள்',
      one: '1 ஆடியோ புத்தகம்',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ட்ராக் பட்டியல்';

  @override
  String get itemListPlaceholder => 'உருப்படி பட்டியல் இங்கே தோன்றும்';

  @override
  String get failedToLoad => 'ஏற்றுவதில் தோல்வி';

  @override
  String get delete => 'நீக்கு';

  @override
  String get save => 'சேமி';

  @override
  String get moreLikeThis => 'இது போன்ற மேலும்';

  @override
  String get castAndCrew => 'நடிகர்கள் & குழுவினர்';

  @override
  String get collection => 'சேகரிப்பு';

  @override
  String get episodes => 'அத்தியாயங்கள்';

  @override
  String get nextUp => 'அடுத்தது';

  @override
  String get seasons => 'சீசன்கள்';

  @override
  String get chapters => 'அத்தியாயங்கள்';

  @override
  String get features => 'அம்சங்கள்';

  @override
  String get movies => 'திரைப்படங்கள்';

  @override
  String get musicVideos => 'இசை வீடியோக்கள்';

  @override
  String get other => 'மற்றவை';

  @override
  String get discography => 'டிஸ்கோகிராபி';

  @override
  String get similarArtists => 'ஒத்த கலைஞர்கள்';

  @override
  String get tableOfContents => 'பொருளடக்கம்';

  @override
  String get tracklist => 'ட்ராக்லிஸ்ட்';

  @override
  String discNumber(int number) {
    return 'வட்டு $number';
  }

  @override
  String get biography => 'சுயசரிதை';

  @override
  String get authorDetails => 'ஆசிரியர் விவரங்கள்';

  @override
  String get noOverviewAvailable =>
      'இந்த தலைப்புக்கான மேலோட்டம் இன்னும் கிடைக்கவில்லை.';

  @override
  String get noBiographyAvailable =>
      'இந்த ஆசிரியரின் சுயசரிதை எதுவும் கிடைக்கவில்லை.';

  @override
  String get noBooksFound =>
      'இந்த ஆசிரியருக்கு புத்தகங்கள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get unableToLoadAuthorDetails =>
      'இப்போது ஆசிரியர் விவரங்களை ஏற்ற முடியவில்லை.';

  @override
  String published(int year) {
    return 'வெளியீடு $year';
  }

  @override
  String get publicationDateUnknown => 'வெளியீட்டு தேதி தெரியவில்லை';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சீசன்கள்',
      one: '1 சீசன்',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time க்கு முடியும்';
  }

  @override
  String get items => 'உருப்படிகள்';

  @override
  String get extras => 'கூடுதல் அம்சங்கள்';

  @override
  String get behindTheScenes => 'திரைக்குப் பின்னால்';

  @override
  String get deletedScenes => 'நீக்கப்பட்ட காட்சிகள்';

  @override
  String get featurettes => 'சிறப்புத் தொகுப்புகள்';

  @override
  String get interviews => 'நேர்காணல்கள்';

  @override
  String get scenes => 'காட்சிகள்';

  @override
  String get shorts => 'குறும்படங்கள்';

  @override
  String get trailers => 'டிரெய்லர்கள்';

  @override
  String timeRemaining(String time) {
    return '$time மீதம்';
  }

  @override
  String endsIn(String time) {
    return '$time இல் முடியும்';
  }

  @override
  String get view => 'காண்க';

  @override
  String get resumeReading => 'மீண்டும் படிக்கவும்';

  @override
  String get read => 'படிக்கவும்';

  @override
  String resumeFrom(String position) {
    return '$position இலிருந்து தொடரவும்';
  }

  @override
  String get play => 'இயக்கு';

  @override
  String get startOver => 'மீண்டும் தொடங்குங்கள்';

  @override
  String get restart => 'மறுதொடக்கம்';

  @override
  String get readOffline => 'ஆஃப்லைனில் படிக்கவும்';

  @override
  String get playOffline => 'ஆஃப்லைனில் விளையாடு';

  @override
  String get audio => 'ஆடியோ';

  @override
  String get subtitles => 'வசன வரிகள்';

  @override
  String get version => 'பதிப்பு';

  @override
  String get cast => 'அலைபரப்பு';

  @override
  String get trailer => 'டிரெய்லர்';

  @override
  String get finished => 'முடிந்தது';

  @override
  String get favorited => 'பிடித்தது';

  @override
  String get favorite => 'பிடித்தது';

  @override
  String get playlist => 'பிளேலிஸ்ட்';

  @override
  String get downloaded => 'பதிவிறக்கம் செய்யப்பட்டது';

  @override
  String get downloadAll => 'அனைத்தையும் பதிவிறக்கவும்';

  @override
  String get download => 'பதிவிறக்கவும்';

  @override
  String get deleteDownloaded => 'பதிவிறக்கியதை நீக்கு';

  @override
  String get goToSeries => 'தொடருக்குச் செல்லவும்';

  @override
  String get editMetadata => 'மெட்டாடேட்டாவைத் திருத்தவும்';

  @override
  String get less => 'குறைவாக';

  @override
  String get more => 'மேலும்';

  @override
  String get deleteItem => 'உருப்படியை நீக்கு';

  @override
  String get deletePlaylist => 'பிளேலிஸ்ட்டை நீக்கு';

  @override
  String get deletePlaylistMessage =>
      'இந்த பிளேலிஸ்ட்டை சர்வரில் இருந்து நீக்கவா?';

  @override
  String get deleteItemMessage => 'சேவையகத்திலிருந்து இந்த உருப்படியை நீக்கவா?';

  @override
  String get failedToDeletePlaylist => 'பிளேலிஸ்ட்டை நீக்க முடியவில்லை';

  @override
  String get failedToDeleteItem => 'உருப்படியை நீக்க முடியவில்லை';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'பிளேலிஸ்ட்டை மறுபெயரிடவும்';

  @override
  String get playlistName => 'பிளேலிஸ்ட் பெயர்';

  @override
  String get deleteDownloadedAlbum => 'பதிவிறக்கம் செய்யப்பட்ட ஆல்பத்தை நீக்கு';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" க்காகப் பதிவிறக்கிய தடங்களை நீக்கவா?';
  }

  @override
  String get downloadedTracksDeleted =>
      'பதிவிறக்கம் செய்யப்பட்ட தடங்கள் நீக்கப்பட்டன';

  @override
  String get downloadedTracksDeleteFailed =>
      'பதிவிறக்கம் செய்யப்பட்ட சில டிராக்குகளை நீக்க முடியவில்லை';

  @override
  String get noTracksLoaded => 'தடங்கள் ஏற்றப்படவில்லை';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel எதுவும் ஏற்றப்படவில்லை';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title பதிவிறக்குகிறது ($count உருப்படிகள்)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'சர்வரிலிருந்து \"$name\" ஐ நிச்சயமாக நீக்க வேண்டுமா? இந்தச் செயலைத் திரும்பப் பெற முடியாது.';
  }

  @override
  String get itemDeleted => 'உருப்படி நீக்கப்பட்டது';

  @override
  String get noPlayableTrailerFound => 'இயக்கக்கூடிய டிரெய்லர் எதுவும் இல்லை.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'ஆதரிக்கப்படாத புத்தக வடிவம்: .$extension';
  }

  @override
  String get audioTrack => 'ஆடியோ டிராக்';

  @override
  String get subtitleTrack => 'வசன வரி';

  @override
  String get none => 'எதுவுமில்லை';

  @override
  String get downloadSubtitlesLabel => 'வசனங்களைப் பதிவிறக்கவும்...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles செருகுநிரலைப் பயன்படுத்தி தேடவும்';

  @override
  String get downloadSubtitles => 'வசனங்களைப் பதிவிறக்கவும்';

  @override
  String get selectedSubtitleInvalid => 'தேர்ந்தெடுக்கப்பட்ட வசனம் தவறானது.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'வசன வரிகள் பதிவிறக்கப்பட்டு தேர்ந்தெடுக்கப்பட்டன: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'வசனம் பதிவிறக்கப்பட்டது. Jellyfin உருப்படியைப் புதுப்பிக்கும் போது தோன்றுவதற்கு சிறிது நேரம் ஆகலாம்.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language க்கான தொலைநிலை வசன வரிகள் எதுவும் இல்லை.';
  }

  @override
  String get selectVersion => 'பதிப்பைத் தேர்ந்தெடுக்கவும்';

  @override
  String versionNumber(int number) {
    return 'பதிப்பு $number';
  }

  @override
  String get downloadAllQuality => 'அனைத்தையும் பதிவிறக்கவும் - தரம்';

  @override
  String get downloadQuality => 'தரவிறக்கம்';

  @override
  String get originalFileNoReencoding => 'அசல் கோப்பு, மறு-குறியீடு இல்லை';

  @override
  String get originalFilesNoReencoding => 'அசல் கோப்புகள், மறு-குறியீடு இல்லை';

  @override
  String get noEpisodesLoaded => 'எபிசோடுகள் ஏற்றப்படவில்லை';

  @override
  String downloadingItem(String name, String quality) {
    return '$name பதிவிறக்குகிறது ($quality)...';
  }

  @override
  String get deleteDownloadedFiles =>
      'பதிவிறக்கம் செய்யப்பட்ட கோப்புகளை நீக்கவும்';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel க்கான உள்ளூர் கோப்புகளை நீக்கவா?\n\nஇது சேமிப்பிட இடத்தைக் காலி செய்யும். பின்னர் மீண்டும் பதிவிறக்கலாம்.';
  }

  @override
  String get downloadedFilesDeleted =>
      'பதிவிறக்கம் செய்யப்பட்ட கோப்புகள் நீக்கப்பட்டன';

  @override
  String get failedToDeleteFiles => 'கோப்புகளை நீக்க முடியவில்லை';

  @override
  String get deleteFiles => 'கோப்புகளை நீக்கு';

  @override
  String get director => 'இயக்குனர்';

  @override
  String get directors => 'இயக்குநர்கள்';

  @override
  String get writer => 'எழுத்தாளர்';

  @override
  String get writers => 'திரைக்கதை ஆசிரியர்கள்';

  @override
  String get studio => 'ஸ்டுடியோ';

  @override
  String studioMoreCount(int count) {
    return '+$count மேலும்';
  }

  @override
  String totalEpisodes(int count) {
    return '$count அத்தியாயங்கள்';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'அத்தியாயம் $number';
  }

  @override
  String chapterNumber(int number) {
    return 'அத்தியாயம் $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count தடங்கள்',
      one: '1 தடம்',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count அத்தியாயங்கள்',
      one: '1 அத்தியாயம்',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'பிறப்பு $date';
  }

  @override
  String died(String date) {
    return 'இறப்பு $date';
  }

  @override
  String age(int age) {
    return 'வயது $age';
  }

  @override
  String get showLess => 'குறைவாகக் காட்டு';

  @override
  String get readMore => 'மேலும் படிக்க';

  @override
  String get shuffle => 'ஷஃபிள்';

  @override
  String get shuffleAllMusic => 'எல்லா இசையையும் கலைத்து இயக்கு';

  @override
  String get carSignInPrompt => 'உங்கள் ஃபோனில் Moonfin இல் உள்நுழையவும்';

  @override
  String get carServerUnreachable => 'உங்கள் சர்வரை அணுக முடியவில்லை';

  @override
  String downloadsCount(int count) {
    return '$count பதிவிறக்கங்கள்';
  }

  @override
  String get perfectMatch => 'சரியான போட்டி';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'மோனோ';

  @override
  String get stereo => 'ஸ்டீரியோ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'தொலைநிலை வசன வரி $action செய்ய இந்தப் பயனருக்கு Jellyfin வசன வரி மேலாண்மை அனுமதி தேவை.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'தொலைநிலை வசன வரி $action செய்ய இந்த உருப்படி சர்வரில் கிடைக்கவில்லை.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'தொலைநிலை வசன வரி $action தோல்வியடைந்தது: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'தொலைநிலை வசன வரி $action தோல்வியடைந்தது (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'தொலைநிலை வசன வரிகளை $action செய்ய முடியவில்லை.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" க்காகப் பதிவிறக்கிய எல்லா அத்தியாயங்களும்';
  }

  @override
  String get deleteSeasonFiles =>
      'இந்த சீசனில் பதிவிறக்கம் செய்யப்பட்ட அனைத்து அத்தியாயங்களும்';

  @override
  String get stillWatching => 'இன்னும் பார்க்கிறதா?';

  @override
  String get unableToLoadTrailerStream =>
      'டிரெய்லர் ஸ்ட்ரீமை ஏற்ற முடியவில்லை.';

  @override
  String get trailerTimedOut => 'டிரெய்லர் ஏற்றும் போது நேரம் முடிந்தது.';

  @override
  String get playbackFailedForTrailer => 'இந்த டிரெய்லரை இயக்க முடியவில்லை.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ஆஃப்லைன் பிளேபேக்கின் போது அனுப்புதல் கிடைக்காது.';

  @override
  String castActionFailed(String label, String error) {
    return '$label செயல் தோல்வியடைந்தது: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'காஸ்ட் ஒலி அளவை அமைக்க முடியவில்லை: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label கட்டுப்பாடுகள்';
  }

  @override
  String get deviceVolume => 'சாதனத்தின் அளவு';

  @override
  String get unavailable => 'கிடைக்கவில்லை';

  @override
  String get pause => 'இடைநிறுத்து';

  @override
  String get syncPosition => 'ஒத்திசைவு நிலை';

  @override
  String stopCast(String label) {
    return '$label ஐ நிறுத்து';
  }

  @override
  String get queueIsEmpty => 'வரிசை காலியாக உள்ளது';

  @override
  String trackNumber(int number) {
    return 'தடம் $number';
  }

  @override
  String get remotePlayback => 'ரிமோட் பிளேபேக்';

  @override
  String get castingToGoogleCast => 'Google Castக்கு அனுப்புதல்';

  @override
  String get castingViaAirPlay => 'AirPlay வழியாக அனுப்புதல்';

  @override
  String get castingViaDlna => 'DLNA வழியாக அனுப்புதல்';

  @override
  String secondsCount(int seconds) {
    return '$seconds வினாடிகள்';
  }

  @override
  String get longPressToUnlock => 'திறக்க நீண்ட நேரம் அழுத்தவும்';

  @override
  String get off => 'ஆஃப்';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ஆட்டோ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'பிட்ரேட் ஓவர்ரைடு';

  @override
  String get audioDelay => 'ஆடியோ தாமதம்';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'வசனம் தாமதம்';

  @override
  String get reset => 'மீட்டமை';

  @override
  String get unknown => 'தெரியவில்லை';

  @override
  String get playbackInformation => 'பின்னணி தகவல்';

  @override
  String get playback => 'பின்னணி';

  @override
  String get playMethod => 'விளையாடும் முறை';

  @override
  String get directPlay => 'நேரடி விளையாட்டு';

  @override
  String get directStream => 'நேரடி ஸ்ட்ரீம்';

  @override
  String get transcoding => 'டிரான்ஸ்கோடிங்';

  @override
  String get transcodeReasons => 'டிரான்ஸ்கோட் காரணங்கள்';

  @override
  String get player => 'பிளேயர்';

  @override
  String get container => 'கொள்கலன்';

  @override
  String get bitrate => 'பிட்ரேட்';

  @override
  String get video => 'வீடியோ';

  @override
  String get resolution => 'தீர்மானம்';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'கோடெக்';

  @override
  String get videoBitrate => 'வீடியோ பிட்ரேட்';

  @override
  String get track => 'ட்ராக்';

  @override
  String get channels => 'சேனல்கள்';

  @override
  String get audioBitrate => 'ஆடியோ பிட்ரேட்';

  @override
  String get sampleRate => 'மாதிரி விகிதம்';

  @override
  String get format => 'வடிவம்';

  @override
  String get external => 'வெளி';

  @override
  String get embedded => 'உட்பொதிக்கப்பட்டது';

  @override
  String castSessionError(String protocol) {
    return '$protocol அமர்வுப் பிழை';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'புத்தக விவரங்களை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'பயன்பாட்டில் EPUB ரெண்டரிங் இன்னும் இந்த பிளாட்ஃபார்மில் கிடைக்கவில்லை.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'இந்த வடிவத்தை (.$extension) இன்னும் ஆப்ஸில் காட்ட முடியாது.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'உட்பொதிக்கப்பட்ட ஆவண ரெண்டரிங் இந்த மேடையில் இல்லை.';

  @override
  String get couldNotOpenExternalViewer =>
      'வெளிப்புற பார்வையாளரைத் திறக்க முடியவில்லை.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ஆப்ஸ் ரீடரைத் திறக்க முடியவில்லை: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label இல் புக்மார்க் ஏற்கனவே சேமிக்கப்பட்டுள்ளது.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'புக்மார்க் சேர்க்கப்பட்டது: $label';
  }

  @override
  String get noBookmarksYet =>
      'இதுவரை புக்மார்க்குகள் இல்லை.\nஉங்கள் நிலையைச் சேமிக்க, படிக்கும் போது புக்மார்க் ஐகானைத் தட்டவும்.';

  @override
  String get noTableOfContentsAvailable => 'உள்ளடக்க அட்டவணை இல்லை';

  @override
  String pageLabel(int number) {
    return 'பக்கம் $number';
  }

  @override
  String get position => 'பதவி';

  @override
  String get bookReader => 'புத்தக வாசிப்பாளர்';

  @override
  String formatExtension(String extension) {
    return 'வடிவம்: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% படித்தது';
  }

  @override
  String get updating => 'புதுப்பிக்கிறது...';

  @override
  String get markUnread => 'படிக்காததைக் குறிக்கவும்';

  @override
  String get markAsRead => 'படித்ததாகக் குறி';

  @override
  String get reloadReader => 'ரீடரை மீண்டும் ஏற்றவும்';

  @override
  String get noPagesFound => 'பக்கங்கள் எதுவும் இல்லை.';

  @override
  String get failedToDecodePageImage =>
      'பக்கப் படத்தை டிகோட் செய்வதில் தோல்வி.';

  @override
  String resetZoom(String zoom) {
    return 'ஜூமை மீட்டமை (${zoom}x)';
  }

  @override
  String get singlePage => 'ஒற்றை பக்கம்';

  @override
  String get twoPageSpread => 'இரண்டு பக்க பரவல்';

  @override
  String get addBookmark => 'புக்மார்க்கைச் சேர்க்கவும்';

  @override
  String get bookmarksEllipsis => 'புக்மார்க்குகள்...';

  @override
  String get markedAsRead => 'படித்ததாகக் குறிக்கப்பட்டது';

  @override
  String get markedAsUnread => 'படிக்காததாகக் குறிக்கப்பட்டது';

  @override
  String failedToUpdateReadState(String error) {
    return 'படித்த நிலையைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get themeSystem => 'தீம்: அமைப்பு';

  @override
  String get themeLight => 'தீம்: ஒளி';

  @override
  String get themeDark => 'தீம்: இருள்';

  @override
  String get themeSepia => 'தீம்: செபியா';

  @override
  String get invertColorsFixedLayout => 'தலைகீழ் நிறங்கள் (நிலையான தளவமைப்பு)';

  @override
  String get invertColorsPdf => 'தலைகீழ் நிறங்கள் (PDF)';

  @override
  String get preparingInAppReader => 'ஆப்ஸ் ரீடரை தயார் செய்கிறது...';

  @override
  String get pdfDataNotAvailable => 'PDF தரவு கிடைக்கவில்லை.';

  @override
  String get readerFallbackModeActive =>
      'ரீடர் ஃபால்பேக் பயன்முறை செயலில் உள்ளது';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return '$extension கோப்புகளுக்கான உள்ளமைந்த ஆவண எஞ்சினை இந்தத் தளத்தால் இயக்க முடியாது.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'ஆதரிக்கப்படும் இயங்குதள இலக்குக்கு (Android, iOS, macOS) மாறிய பிறகு ரீலோட் ரீடரைப் பயன்படுத்தவும்.';

  @override
  String get openExternally => 'வெளிப்புறமாக திறக்கவும்';

  @override
  String get noEpubChaptersFound => 'EPUB அத்தியாயங்கள் எதுவும் இல்லை.';

  @override
  String get readerNotReady => 'வாசகர் தயாராக இல்லை.';

  @override
  String get seriesRecordings => 'தொடர் பதிவுகள்';

  @override
  String get now => 'இப்போது';

  @override
  String get sports => 'விளையாட்டு';

  @override
  String get news => 'செய்தி';

  @override
  String get kids => 'குழந்தைகள்';

  @override
  String get premiere => 'பிரீமியர்';

  @override
  String get guideTimeline => 'வழிகாட்டி காலவரிசை';

  @override
  String failedToLoadGuide(String error) {
    return 'வழிகாட்டியை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get noChannelsFound => 'சேனல்கள் எதுவும் இல்லை';

  @override
  String get liveBadge => 'நேரலை';

  @override
  String guideNextProgram(String time, String title) {
    return 'அடுத்து: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes நிமி மீதம்';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours மணி மீதம்';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours மணி $minutes நிமி மீதம்';
  }

  @override
  String get movie => 'திரைப்படம்';

  @override
  String get removedFromFavoriteChannels =>
      'பிடித்த சேனல்களில் இருந்து அகற்றப்பட்டது';

  @override
  String get addedToFavoriteChannels => 'பிடித்த சேனல்களில் சேர்க்கப்பட்டது';

  @override
  String get failedToUpdateFavoriteChannel =>
      'பிடித்த சேனலைப் புதுப்பிக்க முடியவில்லை';

  @override
  String get unfavoriteChannel => 'பிடிக்காத சேனல்';

  @override
  String get favoriteChannel => 'பிடித்த சேனல்';

  @override
  String get record => 'பதிவு செய்';

  @override
  String get cancelRecordingAction => 'பதிவை ரத்துசெய்';

  @override
  String get programSetToRecord => 'நிகழ்ச்சி பதிவு செய்ய அமைக்கப்பட்டது';

  @override
  String get recordingCancelled => 'பதிவு ரத்துசெய்யப்பட்டது';

  @override
  String get unableToCreateRecording => 'பதிவை உருவாக்க முடியவில்லை';

  @override
  String get watch => 'பார்';

  @override
  String get close => 'மூடு';

  @override
  String failedToPlayChannel(String name) {
    return '$name ஐ இயக்க முடியவில்லை';
  }

  @override
  String get failedToLoadRecordings => 'பதிவுகளை ஏற்ற முடியவில்லை';

  @override
  String get scheduledInNext24Hours =>
      'அடுத்த 24 மணிநேரத்தில் திட்டமிடப்பட்டது';

  @override
  String get recentRecordings => 'சமீபத்திய பதிவுகள்';

  @override
  String get tvSeries => 'டிவி தொடர்';

  @override
  String get failedToLoadSchedule => 'அட்டவணையை ஏற்ற முடியவில்லை';

  @override
  String get noScheduledRecordings => 'திட்டமிடப்பட்ட பதிவுகள் இல்லை';

  @override
  String get cancelRecording => 'பதிவை ரத்துசெய்யவா?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" இன் திட்டமிட்ட பதிவை ரத்துசெய்யவா?';
  }

  @override
  String get no => 'இல்லை';

  @override
  String get yesCancel => 'ஆம், ரத்துசெய்';

  @override
  String get failedToCancelRecording => 'பதிவை ரத்துசெய்ய முடியவில்லை';

  @override
  String get failedToLoadSeriesRecordings => 'தொடர் பதிவுகளை ஏற்ற முடியவில்லை';

  @override
  String get noSeriesRecordings => 'தொடர் பதிவுகள் இல்லை';

  @override
  String get cancelSeriesRecording => 'தொடர் பதிவை ரத்துசெய்';

  @override
  String get cancelSeriesRecordingQuestion => 'தொடர் பதிவை ரத்துசெய்யவா?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" பதிவை நிறுத்தவா?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'தொடர் பதிவை ரத்து செய்ய முடியவில்லை';

  @override
  String get searchThisLibrary => 'இந்த நூலகத்தில் தேடவும்...';

  @override
  String get searchEllipsis => 'தேடு...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" க்கு முடிவுகள் எதுவும் இல்லை';
  }

  @override
  String searchFailedError(String error) {
    return 'தேடல் தோல்வியடைந்தது: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr கணக்கு வகை';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'உள்ளூர்';

  @override
  String get savedMedia => 'சேமிக்கப்பட்ட மீடியா';

  @override
  String get tvShows => 'தொலைக்காட்சி நிகழ்ச்சிகள்';

  @override
  String get music => 'இசை';

  @override
  String get musicAlbums => 'இசை ஆல்பங்கள்';

  @override
  String get noMediaInFilter => 'இந்த வடிப்பானில் மீடியா இல்லை';

  @override
  String get noDownloadedMediaYet =>
      'இதுவரை பதிவிறக்கம் செய்யப்பட்ட மீடியா எதுவும் இல்லை';

  @override
  String get browseLibrary => 'நூலகத்தை உலாவவும்';

  @override
  String get deleteDownload => 'பதிவிறக்கத்தை நீக்கு';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" ஐயும் அதன் கோப்புகளையும் அகற்றவா?';
  }

  @override
  String tracksCount(int count) {
    return '$count தடங்கள்';
  }

  @override
  String get album => 'ஆல்பம்';

  @override
  String get playAlbum => 'ஆல்பத்தை இயக்கவும்';

  @override
  String failedToLoadAlbum(String error) {
    return 'ஆல்பத்தை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name க்குப் பதிவிறக்கிய தடங்கள் எதுவும் இல்லை.';
  }

  @override
  String get season => 'சீசன்';

  @override
  String get errorLoadingEpisodes => 'அத்தியாயங்களை ஏற்றுவதில் பிழை';

  @override
  String get noDownloadedEpisodes => 'பதிவிறக்கம் செய்யப்பட்ட எபிசோடுகள் இல்லை';

  @override
  String get deleteEpisode => 'அத்தியாயத்தை நீக்கு';

  @override
  String removeName(String name) {
    return '\"$name\" ஐ அகற்றவா?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes நிமி';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'அத்தியாயம் $number';
  }

  @override
  String get seriesNotFound => 'தொடர் கிடைக்கவில்லை';

  @override
  String get errorLoadingSeries => 'தொடரை ஏற்றுவதில் பிழை';

  @override
  String get downloadedEpisodes => 'பதிவிறக்கம் செய்யப்பட்ட அத்தியாயங்கள்';

  @override
  String seasonNumber(int number) {
    return 'சீசன் $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'சிறப்புகள்';

  @override
  String get deleteSeason => 'சீசனை நீக்கு';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season இல் பதிவிறக்கிய எல்லா அத்தியாயங்களையும் நீக்கவா?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count அத்தியாயங்கள்',
      one: '1 அத்தியாயம்',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'சேமிப்பு மேலாண்மை';

  @override
  String get storageBreakdown => 'சேமிப்பக முறிவு';

  @override
  String get downloadedItems => 'பதிவிறக்கம் செய்யப்பட்ட பொருட்கள்';

  @override
  String get storageLimit => 'சேமிப்பு வரம்பு';

  @override
  String get noLimit => 'வரம்பு இல்லை';

  @override
  String get deleteAllDownloads => 'அனைத்து பதிவிறக்கங்களையும் நீக்கு';

  @override
  String get deleteAllDownloadsWarning =>
      'இது பதிவிறக்கம் செய்யப்பட்ட அனைத்து மீடியா கோப்புகளையும் அகற்றும் மற்றும் செயல்தவிர்க்க முடியாது.';

  @override
  String get deleteAll => 'அனைத்தையும் நீக்கு';

  @override
  String get deleteSelected => 'தேர்ந்தெடுக்கப்பட்டதை நீக்கு';

  @override
  String deleteSelectedCount(int count) {
    return 'பதிவிறக்கிய $count உருப்படிகளை நீக்கவா?';
  }

  @override
  String get musicAndAudiobooks => 'இசை & ஆடியோ புத்தகங்கள்';

  @override
  String get images => 'படங்கள்';

  @override
  String get database => 'தரவுத்தளம்';

  @override
  String ofStorageLimit(String limit) {
    return '$limit வரம்பில்';
  }

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get authentication => 'அங்கீகாரம்';

  @override
  String get autoLoginServerManagement =>
      'தானியங்கு உள்நுழைவு, சேவையக மேலாண்மை';

  @override
  String get pinCode => 'பின் குறியீடு';

  @override
  String get setUpPinCodeProtection => 'பின் குறியீடு பாதுகாப்பை அமைக்கவும்';

  @override
  String get parentalControls => 'பெற்றோர் கட்டுப்பாடுகள்';

  @override
  String get contentRatingRestrictions => 'உள்ளடக்க மதிப்பீடு கட்டுப்பாடுகள்';

  @override
  String get bitRateResolutionBehavior => 'பிட்ரேட், தீர்மானம், நடத்தை';

  @override
  String get languageSizeAppearance => 'மொழி, அளவு, தோற்றம்';

  @override
  String get qualityStorage => 'தரம், சேமிப்பு';

  @override
  String get serverSyncAndPluginStatus =>
      'சேவையக ஒத்திசைவு மற்றும் செருகுநிரல் நிலை';

  @override
  String get mediaRequestIntegration => 'மீடியா கோரிக்கை ஒருங்கிணைப்பு';

  @override
  String get switchServer => 'சேவையகத்தை மாற்றவும்';

  @override
  String get signOut => 'வெளியேறு';

  @override
  String get versionLicenses => 'பதிப்பு, உரிமங்கள்';

  @override
  String get account => 'கணக்கு';

  @override
  String get signInAndSecurity => 'உள்நுழைவு மற்றும் பாதுகாப்பு';

  @override
  String get administration => 'நிர்வாகம்';

  @override
  String get serverSettingsUsersLibraries =>
      'சேவையக அமைப்புகள், பயனர்கள், நூலகங்கள்';

  @override
  String get customization => 'தனிப்பயனாக்கம்';

  @override
  String get themeAndLayout => 'தீம் மற்றும் தளவமைப்பு';

  @override
  String get videoAndSubtitles => 'வீடியோ மற்றும் வசன வரிகள்';

  @override
  String get integrations => 'ஒருங்கிணைப்புகள்';

  @override
  String get pluginAndRequests => 'செருகுநிரல் மற்றும் கோரிக்கைகள்';

  @override
  String get customizeAccountPlaybackInterface =>
      'கணக்கு, பின்னணி மற்றும் இடைமுக நடத்தை ஆகியவற்றைத் தனிப்பயனாக்குங்கள்';

  @override
  String optionsCount(int count) {
    return '$count விருப்பங்கள்';
  }

  @override
  String get themeAndAppearance => 'தீம் & தோற்றம்';

  @override
  String get focusBorderColor => 'ஃபோகஸ் பார்டர் கலர்';

  @override
  String get watchedIndicators => 'குறிகாட்டிகளைப் பார்த்தேன்';

  @override
  String get always => 'எப்போதும்';

  @override
  String get hideUnwatched => 'பார்க்கப்படாததை மறை';

  @override
  String get episodesOnly => 'அத்தியாயங்கள் மட்டும்';

  @override
  String get never => 'ஒருபோதும் இல்லை';

  @override
  String get focusExpansionAnimation => 'ஃபோகஸ் விரிவாக்க அனிமேஷன்';

  @override
  String get desktopUiScale => 'டெஸ்க்டாப் UI அளவுகோல்';

  @override
  String get scaleFocusedCards =>
      'கவனம் செலுத்திய அல்லது வட்டமிடப்பட்ட அட்டைகள் மற்றும் ஓடுகளை அளவிடவும்';

  @override
  String get backgroundBackdrops => 'பின்னணி பின்னணிகள்';

  @override
  String get showBackdropImages =>
      'உள்ளடக்கத்திற்குப் பின்னால் பின்னணிப் படங்களைக் காட்டு';

  @override
  String get seriesThumbnails => 'தொடர் சிறுபடங்கள்';

  @override
  String get seriesThumbnailsDescription =>
      'எபிசோடுகள் மட்டும்: ஒவ்வொரு வரிசை பட வகைக்கும் பொருந்தும் தொடர் கலைப்படைப்புகளைப் பயன்படுத்தவும்';

  @override
  String get homeRowInfoOverlay => 'முகப்பு வரிசை தகவல் மேலடுக்கு';

  @override
  String get showTitleMetadataOnHomeRows =>
      'முகப்பு வரிசைகளை உலாவும்போது தலைப்பு மற்றும் மெட்டாடேட்டாவைக் காட்டு';

  @override
  String get clockDisplay => 'கடிகார காட்சி';

  @override
  String get inMenus => 'மெனுக்களில்';

  @override
  String get inVideo => 'வீடியோவில்';

  @override
  String get seasonalEffects => 'பருவகால விளைவுகள்';

  @override
  String get seasonalEffectsDescription =>
      'காட்சி விளைவுகள் மற்றும் பருவகால அலங்காரங்கள்';

  @override
  String get snow => 'பனி';

  @override
  String get fireworks => 'பட்டாசு';

  @override
  String get confetti => 'கான்ஃபெட்டி';

  @override
  String get fallingLeaves => 'விழும் இலைகள்';

  @override
  String get themeMusic => 'தீம் இசை';

  @override
  String get playThemeMusicOnDetailPages =>
      'விவரம் பக்கங்களில் தீம் இசையை இயக்கவும்';

  @override
  String get themeMusicVolume => 'தீம் இசை தொகுதி';

  @override
  String get themeMusicSettingsSubtitle =>
      'விவரப் பக்கங்கள், முகப்பு வரிசைகள் மற்றும் ஒலி அளவு';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'முகப்பு வரிசைகளில் தீம் மியூசிக்';

  @override
  String get playWhenBrowsingHomeScreen =>
      'முகப்புத் திரையில் உலாவும்போது விளையாடு';

  @override
  String get loopThemeMusic => 'தீம் இசையை லூப் செய்';

  @override
  String get loopThemeMusicSubtitle =>
      'தடத்தை ஒருமுறை இயக்குவதற்குப் பதிலாக மீண்டும் மீண்டும் இயக்கும்';

  @override
  String get detailsBackgroundBlur => 'விவரங்கள் பின்னணி தெளிவின்மை';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'உலாவல் பின்னணி மங்கல்';

  @override
  String get maxStreamingBitrate => 'அதிகபட்ச ஸ்ட்ரீமிங் பிட்ரேட்';

  @override
  String get maxResolution => 'அதிகபட்ச தெளிவுத்திறன்';

  @override
  String get playerZoomMode => 'பிளேயர் ஜூம் பயன்முறை';

  @override
  String get settingsScrollWheelAction => 'மவுஸ் ஸ்க்ரோல் சக்கரம்';

  @override
  String get settingsScrollWheelActionDescription =>
      'இயக்கத்தின்போது வீடியோ மீது மவுஸ் சக்கரத்தை உருட்டினால் என்ன நடக்க வேண்டும் என்பதைத் தேர்வுசெய்யவும்.';

  @override
  String get scrollWheelActionOff => 'ஆஃப்';

  @override
  String get scrollWheelActionSeek => 'நகர்த்தல் (முன் / பின்)';

  @override
  String get scrollWheelActionVolume => 'ஒலியளவு';

  @override
  String get playerTooltipVolume => 'ஒலியளவு';

  @override
  String get fit => 'பொருத்தம்';

  @override
  String get autoCrop => 'தானியங்கு பயிர்';

  @override
  String get stretch => 'நீட்டவும்';

  @override
  String get refreshRateSwitching => 'புதுப்பிப்பு விகிதம் மாறுதல்';

  @override
  String get disabled => 'முடக்கப்பட்டது';

  @override
  String get scaleOnTv => 'தொலைக்காட்சியில் அளவிடவும்';

  @override
  String get scaleOnDevice => 'சாதனத்தில் அளவிடவும்';

  @override
  String get trickPlay => 'ட்ரிக் ப்ளே';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'தேடும் போது முன்னோட்ட சிறுபடங்களைக் காட்டு';

  @override
  String get showDescriptionOnPause => 'இடைநிறுத்தத்தில் விளக்கத்தைக் காட்டு';

  @override
  String get dimVideoShowOverview =>
      'வீடியோவை மங்கலாக்கி, இடைநிறுத்தப்பட்டிருக்கும் போது மேலோட்ட உரையைக் காட்டு';

  @override
  String get osdLockButton => 'OSD பூட்டு பொத்தான்';

  @override
  String get osdLockButtonDescription =>
      'நீண்ட நேரம் அழுத்தும் வரை தொடு உள்ளீட்டைத் தடுக்கும் பூட்டு பொத்தானைக் காட்டு';

  @override
  String get audioBehavior => 'ஆடியோ நடத்தை';

  @override
  String get downmixToStereo => 'ஸ்டீரியோவில் கலக்கவும்';

  @override
  String get defaultAudioLanguage => 'இயல்புநிலை ஆடியோ மொழி';

  @override
  String get fallbackAudioLanguage => 'மாற்று ஆடியோ மொழி';

  @override
  String get preferDefaultAudioTrack => 'இயல்பு ஆடியோ தடத்தை விரும்பு';

  @override
  String get preferDefaultAudioTrackDescription =>
      'உள்ளூர் டப்பிங்கை விட அசல் ஆடியோ தடத்தை விரும்பும்.';

  @override
  String get preferAudioDescription => 'ஆடியோ விளக்கத் தடங்களை விரும்பு';

  @override
  String get preferAudioDescriptionDescription =>
      'சாதாரண தடங்களை விட ஆடியோ விளக்கத் தடங்களை விரும்பும்.';

  @override
  String get transcodingAudio => 'டிரான்ஸ்கோடிங் (ஆடியோ)';

  @override
  String get directStreamRemux => 'நேரடி ஸ்ட்ரீம் (ரீமக்ஸ்)';

  @override
  String get transcodingBitrateOrResolution =>
      'டிரான்ஸ்கோடிங் (பிட்ரேட் அல்லது தெளிவுத்திறன்)';

  @override
  String get transcodingVideoAndAudio => 'டிரான்ஸ்கோடிங் (வீடியோ & ஆடியோ)';

  @override
  String get transcodingVideo => 'டிரான்ஸ்கோடிங் (வீடியோ)';

  @override
  String get autoServerDefault => 'தானியங்கு (சர்வர் இயல்புநிலை)';

  @override
  String get english => 'ஆங்கிலம்';

  @override
  String get spanish => 'ஸ்பானிஷ்';

  @override
  String get french => 'பிரெஞ்சு';

  @override
  String get german => 'ஜெர்மன்';

  @override
  String get italian => 'இத்தாலியன்';

  @override
  String get portuguese => 'போர்த்துகீசியம்';

  @override
  String get japanese => 'ஜப்பானியர்';

  @override
  String get korean => 'கொரியன்';

  @override
  String get chinese => 'சீன';

  @override
  String get russian => 'ரஷ்யன்';

  @override
  String get arabic => 'அரபு';

  @override
  String get hindi => 'ஹிந்தி';

  @override
  String get dutch => 'டச்சு';

  @override
  String get swedish => 'ஸ்வீடிஷ்';

  @override
  String get norwegian => 'நார்வேஜியன்';

  @override
  String get danish => 'டேனிஷ்';

  @override
  String get finnish => 'ஃபின்னிஷ்';

  @override
  String get polish => 'போலிஷ்';

  @override
  String get ac3Passthrough => 'AC3 பாஸ்த்ரூ';

  @override
  String get dtsPassthrough => 'டிடிஎஸ் பாஸ்த்ரூ';

  @override
  String get trueHdSupport => 'TrueHD ஆதரவு';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ஆடியோ AVRக்கு மட்டும்; பெறுநர் ஆதரவு மற்றும் DTS மூலப் பாதை தேவை';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ஆடியோவை இயக்கு (எல்லா தளங்களிலும் வேலை செய்யாமல் போகலாம்)';

  @override
  String get settingsAudioOutputMode => 'ஆடியோ வெளியீட்டு முறை';

  @override
  String get settingsAudioOutputModeDescription =>
      'ஆடியோ எவ்வாறு டிகோட் செய்யப்படுகிறது என்பதைத் தேர்வுசெய்யவும். AVR பாஸ்த்ரூ உங்கள் ரிசீவருக்கு மூல Dolby/DTS ஸ்ட்ரீம்களை அனுப்பும்; தானியங்கி அல்லது டவுன்மிக்ஸ் உள்ளூரிலேயே டிகோட் செய்யும்.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR பாஸ்த்ரூ';

  @override
  String get settingsAudioFallbackCodec => 'மாற்று ஆடியோ கோடெக்';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'மூல ஸ்ட்ரீமை நேரடியாக இயக்கவோ பாஸ்த்ரூ செய்யவோ முடியாதபோது, பல-சேனல் ஆடியோவை டிரான்ஸ்கோட் செய்ய வேண்டிய இலக்கு வடிவத்தைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'தானாகக் கண்டறி\n(பரிந்துரைக்கப்படுகிறது)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(இயல்பு)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(இழப்பற்றது)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ஸ்டீரியோ மட்டும்)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(திறமையானது)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(இழப்பற்றது)';

  @override
  String get settingsMaxAudioChannels => 'அதிகபட்ச ஆடியோ சேனல்கள்';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'உங்கள் ஆடியோ அமைப்பின் அதிகபட்ச சேனல்களை உள்ளமைக்கவும். இந்த வரம்பைத் தாண்டும் பல-சேனல் ஸ்ட்ரீம்கள் டவுன்மிக்ஸ் அல்லது டிரான்ஸ்கோட் செய்யப்படும்.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'தானாகக் கண்டறி\n(வன்பொருள் இயல்பு)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 மோனோ';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ஸ்டீரியோ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 சரவுண்ட்';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 குவாட்ரஃபோனிக்';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 சரவுண்ட்';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 சரவுண்ட்';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 சரவுண்ட்';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 சரவுண்ட்';

  @override
  String get settingsAudioPassthroughAdvanced => 'பாஸ்த்ரூ (மேம்பட்டது)';

  @override
  String get settingsAudioCodecPassthrough => 'கோடெக் பாஸ்த்ரூ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'உங்கள் AVR அல்லது HDMI சாதனம் ஆதரிக்கும் வடிவங்களை மட்டும் இயக்கவும்.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 பாஸ்த்ரூ';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) பாஸ்த்ரூ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core பாஸ்த்ரூ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA பாஸ்த்ரூ';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD பாஸ்த்ரூ';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos பாஸ்த்ரூ';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) ஐ வெளிப்புற டிகோடருக்கு பிட்ஸ்ட்ரீம் செய்யும்.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) வழியாக Dolby Atmos ஐ வெளிப்புற டிகோடருக்கு பிட்ஸ்ட்ரீம் செய்யும்.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS Core உட்பட) ஐ வெளிப்புற டிகோடருக்கு பிட்ஸ்ட்ரீம் செய்யும்.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos மெட்டாடேட்டாவுடன் Dolby TrueHD ஐ வெளிப்புற டிகோடருக்கு பிட்ஸ்ட்ரீம் செய்யும்.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'கண்டறியப்பட்ட ஆடியோ திறன்கள்';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'இயக்க நேரத் திறன் தகவல் இன்னும் கிடைக்கவில்லை.';

  @override
  String get settingsAudioRouteLabel => 'வழி';

  @override
  String get settingsAudioDecodeLabel => 'டிகோட்';

  @override
  String get settingsAudioPassthroughLabel => 'பாஸ்த்ரூ';

  @override
  String get settingsAudioHdRoute => 'HD ஆடியோ வழி';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ஸ்பீக்கர்';

  @override
  String get settingsAudioRouteHeadphones => 'ஹெட்ஃபோன்கள்';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'கண்டறிதல்கள்';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'வீடியோ லெவல்';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'வீடியோ வரம்பு';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'வசன வரி கோடெக்';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'அனுமதிக்கப்பட்ட ஆடியோ கோடெக்குகள்';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ஆடியோ கோடெக்குகள்';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ஆடியோ கோடெக்குகள்';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif பாஸ்த்ரூ';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'செயலில் உள்ள ஆடியோ வழி';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'வழியின் HD ஆடியோ ஆதரவு';

  @override
  String get nightMode => 'இரவு முறை';

  @override
  String get compressDynamicRange => 'டைனமிக் வரம்பை சுருக்கவும்';

  @override
  String get advancedMpv => 'மேம்பட்ட mpv';

  @override
  String get enableCustomMpvConf => 'தனிப்பயன் mpv.conf ஐ இயக்கு';

  @override
  String get applyMpvConfBeforePlayback =>
      'பிளேபேக் தொடங்கும் முன் பயனர் குறிப்பிட்ட mpv.conf ஐப் பயன்படுத்தவும்';

  @override
  String get unsafeAdvancedMpvOptions =>
      'பாதுகாப்பற்ற மேம்பட்ட mpv விருப்பங்கள்';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv விருப்பங்களின் பரந்த தொகுப்பை அனுமதிக்கவும். பின்னணி நடத்தையை உடைக்கலாம்.';

  @override
  String get hardwareDecoding => 'வன்பொருள் டிகோடிங்';

  @override
  String get hardwareDecodingSubtitle =>
      'செயல்திறனை மேம்படுத்தலாம் ஆனால் சில சாதனங்களில் பிளேபேக் சிக்கல்களை ஏற்படுத்தலாம்.';

  @override
  String get nextUpAndQueuing => 'அடுத்து & வரிசை';

  @override
  String get nextUpDisplay => 'அடுத்த காட்சி';

  @override
  String get extended => 'நீட்டிக்கப்பட்டது';

  @override
  String get minimal => 'குறைந்தபட்சம்';

  @override
  String get nextUpTimeout => 'அடுத்தது காலக்கெடு';

  @override
  String secondsValue(int value) {
    return '$valueவி';
  }

  @override
  String get mediaQueuing => 'மீடியா வரிசை';

  @override
  String get autoQueueNextEpisodes =>
      'அடுத்த எபிசோட்களை தானாக வரிசைப்படுத்துங்கள்';

  @override
  String get stillWatchingPrompt => 'ஸ்டில் வாட்சிங் ப்ராம்ட்';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes அத்தியாயங்கள் / $hours மணி நேரத்திற்குப் பிறகு';
  }

  @override
  String get resumeAndSkip => 'ரெஸ்யூம் & ஸ்கிப்';

  @override
  String get resumeRewind => 'ரெஸ்யூம் ரிவைண்ட்';

  @override
  String get unpauseRewind => 'ரீவைண்டை நிறுத்து';

  @override
  String get fiveSeconds => '5 வினாடிகள்';

  @override
  String get tenSeconds => '10 வினாடிகள்';

  @override
  String get fifteenSeconds => '15 வினாடிகள்';

  @override
  String get thirtySeconds => '30 வினாடிகள்';

  @override
  String get skipBackLength => 'பின்னோக்கித் தாவும் நீளம்';

  @override
  String get skipForwardLength => 'முன்னோக்கி நீளத்தைத் தவிர்க்கவும்';

  @override
  String get customMpvConfPath => 'தனிப்பயன் mpv.conf பாதை';

  @override
  String get notSetMpvConf =>
      'அமைக்கப்படவில்லை. Moonfin பயன்பாடு/தரவு கோப்புறைகளில் இயல்புநிலை mpv.conf ஐ முயற்சிக்கும்.';

  @override
  String get selectMpvConf => 'mpv.conf ஐத் தேர்ந்தெடுக்கவும்';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'நடை அமைப்புகள் (அளவு, நிறம், ஆஃப்செட்) உரை அடிப்படையிலான வசனங்களுக்கு (SRT, VTT, TTML) பொருந்தும். ASS/SSA வசனங்கள் \"ASS/SSA டைரக்ட் ப்ளே\" முடக்கப்பட்டிருந்தால் தவிர, அவற்றின் சொந்த உட்பொதிக்கப்பட்ட ஸ்டைலிங்கைப் பயன்படுத்துகின்றன. பிட்மேப் வசனங்களை (PGS, DVB, VobSub) மறுசீரமைக்க முடியாது.';

  @override
  String get defaultSubtitleLanguage => 'இயல்புநிலை வசன மொழி';

  @override
  String get defaultToNoSubtitles => 'வசனங்கள் இல்லை என்பதற்கு இயல்புநிலை';

  @override
  String get turnOffSubtitlesByDefault => 'இயல்பாக வசன வரிகளை முடக்கவும்';

  @override
  String get subtitleSize => 'வசன அளவு';

  @override
  String get textFillColor => 'உரை நிரப்பு வண்ணம்';

  @override
  String get backgroundColor => 'பின்னணி நிறம்';

  @override
  String get textStrokeColor => 'உரை பக்கவாதம் நிறம்';

  @override
  String get subtitleCustomization => 'வசனத் தனிப்பயனாக்கம்';

  @override
  String get subtitleCustomizationDescription =>
      'வசனத் தோற்றத்தைத் தனிப்பயனாக்கு';

  @override
  String get subtitleMode => 'வசன வரி முறை';

  @override
  String get subtitleModeFlagged => 'குறியிடப்பட்டது';

  @override
  String get subtitleModeAlways => 'எப்போதும்';

  @override
  String get subtitleModeForeign => 'வெளிமொழி';

  @override
  String get subtitleModeForced => 'கட்டாயம்';

  @override
  String get subtitleModeFlaggedDescription =>
      'மீடியா கோப்பின் மெட்டாடேட்டாவில் \"default\" அல்லது \"forced\" எனக் குறியிடப்பட்ட தடங்களை இயக்கும்.';

  @override
  String get subtitleModeAlwaysDescription =>
      'வீடியோ தொடங்கும் ஒவ்வொரு முறையும் வசன வரிகளைத் தானாக ஏற்றிக் காட்டும்.';

  @override
  String get subtitleModeForeignDescription =>
      'இயல்பு ஆடியோ தடம் வெளிமொழியில் இருந்தால் வசன வரிகளைத் தானாக இயக்கும்.';

  @override
  String get subtitleModeForcedDescription =>
      'forced மெட்டாடேட்டா குறியுடன் வெளிப்படையாகக் குறிக்கப்பட்ட வசன வரிகளை மட்டும் ஏற்றும்.';

  @override
  String get subtitleModeNoneDescription =>
      'தானியங்கி வசன வரி ஏற்றலை முழுவதுமாக முடக்கும்.';

  @override
  String get fallbackSubtitleLanguage => 'மாற்று வசன வரி மொழி';

  @override
  String get subtitleStream => 'வசன வரி ஸ்ட்ரீம்';

  @override
  String get subtitlePreviewText =>
      'விரைவான பழுப்பு நரி சோம்பேறி நாய் மீது குதிக்கிறது';

  @override
  String get verticalOffset => 'செங்குத்து ஆஃப்செட்';

  @override
  String get pgsDirectPlay => 'PGS நேரடி விளையாட்டு';

  @override
  String get directPlayPgsSubtitles => 'நேரடி விளையாட்டு PGS வசன வரிகள்';

  @override
  String get assSsaDirectPlay => 'ASS/SSA நேரடி விளையாட்டு';

  @override
  String get directPlayAssSsaSubtitles => 'ASS/SSA வசனங்களை நேரடியாக இயக்கவும்';

  @override
  String get white => 'வெள்ளை';

  @override
  String get black => 'கருப்பு';

  @override
  String get yellow => 'மஞ்சள்';

  @override
  String get green => 'பச்சை';

  @override
  String get cyan => 'சியான்';

  @override
  String get red => 'சிவப்பு';

  @override
  String get transparent => 'வெளிப்படையானது';

  @override
  String get semiTransparentBlack => 'அரை-வெளிப்படையான கருப்பு';

  @override
  String get global => 'உலகளாவிய';

  @override
  String get desktop => 'டெஸ்க்டாப்';

  @override
  String get mobile => 'மொபைல்';

  @override
  String get tv => 'டி.வி';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile சுயவிவர அமைப்புகள் ஏற்றப்பட்டன.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile சுயவிவர அமைப்புகளை ஏற்ற முடியவில்லை.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'உள்ளூர் அமைப்புகள் $profile சுயவிவரத்துடன் ஒத்திசைக்கப்பட்டன.';
  }

  @override
  String get customizationProfile => 'தனிப்பயனாக்குதல் சுயவிவரம்';

  @override
  String get customizationProfileDescription =>
      'ஏற்ற, திருத்த மற்றும் ஒத்திசைக்க சுயவிவரத்தைத் தேர்ந்தெடுக்கவும். ஒரு சாதனச் சுயவிவரம் அதை மீறாத வரையில் Global எல்லா இடங்களிலும் பொருந்தும். பச்சைப் புள்ளி உங்கள் தற்போதைய சாதன சுயவிவரத்தைக் குறிக்கிறது.';

  @override
  String get loadProfile => 'சுயவிவரத்தை ஏற்றவும்';

  @override
  String get syncing => 'ஒத்திசைக்கிறது...';

  @override
  String get syncToProfile => 'சுயவிவரத்துடன் ஒத்திசைக்கவும்';

  @override
  String get profileSyncHidden => 'சுயவிவர ஒத்திசைவு மறைக்கப்பட்டது';

  @override
  String get enablePluginSyncDescription =>
      'சுயவிவரக் கட்டுப்பாடுகளை இங்கே காட்ட, செருகுநிரல் அமைப்புகளில் சர்வர் செருகுநிரல் ஒத்திசைவை இயக்கவும்.';

  @override
  String get quality => 'தரம்';

  @override
  String get defaultDownloadQuality => 'இயல்புநிலை பதிவிறக்க தரம்';

  @override
  String get network => 'நெட்வொர்க்';

  @override
  String get wifiOnlyDownloads => 'WiFi-மட்டும் பதிவிறக்கங்கள்';

  @override
  String get reportDownloadsActivity => 'சர்வரில் பதிவிறக்கங்களைக் காட்டு';

  @override
  String get reportDownloadsActivitySubtitle =>
      'உங்கள் டிரான்ஸ்கோட் செய்யப்பட்ட பதிவிறக்கங்களை டாஷ்போர்டில் சர்வர் நிர்வாகி பார்க்க அனுமதிக்கும்';

  @override
  String get onlyDownloadOnWifi =>
      'வைஃபையுடன் இணைக்கப்பட்டால் மட்டுமே பதிவிறக்கவும்';

  @override
  String get storage => 'சேமிப்பு';

  @override
  String get storageUsed => 'பயன்படுத்திய சேமிப்பு';

  @override
  String get manage => 'நிர்வகிக்கவும்';

  @override
  String get calculating => 'கணக்கிடுகிறது...';

  @override
  String get downloadLocation => 'இருப்பிடத்தைப் பதிவிறக்கவும்';

  @override
  String get defaultLabel => 'இயல்புநிலை';

  @override
  String get saveToDownloadsFolder => 'பதிவிறக்கங்கள் கோப்புறையில் சேமிக்கவும்';

  @override
  String get downloadsVisibleToOtherApps =>
      'பதிவிறக்கங்கள்/Moonfin — பிற பயன்பாடுகளுக்குத் தெரியும்';

  @override
  String get dangerZone => 'ஆபத்து மண்டலம்';

  @override
  String get clearAllDownloads => 'அனைத்து பதிவிறக்கங்களையும் அழிக்கவும்';

  @override
  String get original => 'அசல்';

  @override
  String get changeDownloadLocation => 'பதிவிறக்க இடத்தை மாற்றவும்';

  @override
  String get changeDownloadLocationDescription =>
      'புதிய பதிவிறக்கங்கள் தேர்ந்தெடுக்கப்பட்ட கோப்புறையில் சேமிக்கப்படும். ஏற்கனவே உள்ள பதிவிறக்கங்கள் அவற்றின் தற்போதைய இருப்பிடத்திலேயே இருக்கும் மற்றும் சேமிப்பக அமைப்புகளில் இருந்து நிர்வகிக்கலாம்.';

  @override
  String get confirm => 'உறுதிப்படுத்தவும்';

  @override
  String get cannotWriteToFolder =>
      'தேர்ந்தெடுக்கப்பட்ட கோப்புறையில் எழுத முடியாது. வேறொரு இடத்தைத் தேர்வு செய்யவும் அல்லது சேமிப்பக அனுமதிகளை வழங்கவும்.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'பதிவிறக்கங்கள் கோப்புறையில் சேமிக்கவா?';

  @override
  String get saveToDownloadsFolderDescription =>
      'பதிவிறக்கம் செய்யப்பட்ட மீடியா உங்கள் சாதனத்தில் பதிவிறக்கங்கள்/Moonfin இல் சேமிக்கப்படும். இந்தக் கோப்புகள் உங்கள் கேலரி அல்லது மியூசிக் பிளேயர் போன்ற பிற பயன்பாடுகளுக்குத் தெரியும்.\n\nஏற்கனவே உள்ள பதிவிறக்கங்கள் அவற்றின் தற்போதைய இருப்பிடத்திலேயே இருக்கும்.';

  @override
  String get enable => 'இயக்கு';

  @override
  String get clearAllDownloadsWarning =>
      'இது பதிவிறக்கம் செய்யப்பட்ட அனைத்து மீடியாவையும் நீக்கும் மற்றும் செயல்தவிர்க்க முடியாது.';

  @override
  String get clearAll => 'அனைத்தையும் அழி';

  @override
  String get navigationStyle => 'வழிசெலுத்தல் நடை';

  @override
  String get topBar => 'மேல் பட்டை';

  @override
  String get leftSidebar => 'இடது பக்கப்பட்டி';

  @override
  String get showShuffleButton => 'ஷஃபிள் பட்டனைக் காட்டு';

  @override
  String get showGenresButton => 'வகை பட்டனைக் காட்டு';

  @override
  String get showFavoritesButton => 'பிடித்தவை பட்டனைக் காட்டு';

  @override
  String get showLibrariesInToolbar => 'கருவிப்பட்டியில் நூலகங்களைக் காட்டு';

  @override
  String get navbarAlwaysExpanded => 'நேவ்பார் லேபிள்களை எப்போதும் விரிவாக்கு';

  @override
  String get showSeerrButton => 'Seerr பட்டனைக் காட்டு';

  @override
  String get navbarOpacity => 'நவ்பார் ஒளிபுகா';

  @override
  String get navbarColor => 'நவ்பார் நிறம்';

  @override
  String get gray => 'சாம்பல்';

  @override
  String get darkBlue => 'அடர் நீலம்';

  @override
  String get purple => 'ஊதா';

  @override
  String get teal => 'டீல்';

  @override
  String get navy => 'கடற்படை';

  @override
  String get charcoal => 'கரி';

  @override
  String get brown => 'பழுப்பு';

  @override
  String get darkRed => 'அடர் சிவப்பு';

  @override
  String get darkGreen => 'அடர் பச்சை';

  @override
  String get slate => 'ஸ்லேட்';

  @override
  String get indigo => 'இண்டிகோ';

  @override
  String get libraryDisplay => 'நூலகக் காட்சி';

  @override
  String get posterLabel => 'சுவரொட்டி';

  @override
  String get thumbnailLabel => 'சிறுபடம்';

  @override
  String get bannerLabel => 'பேனர்';

  @override
  String get overridePerLibrarySettings =>
      'ஒவ்வொரு நூலக அமைப்புகளையும் மேலெழுதவும்';

  @override
  String get applyImageTypeToAllLibraries =>
      'அனைத்து நூலகங்களுக்கும் பட வகையைப் பயன்படுத்தவும்';

  @override
  String get multiServerLibraries => 'பல சேவையக நூலகங்கள்';

  @override
  String get showLibrariesFromAllServers =>
      'இணைக்கப்பட்ட அனைத்து சேவையகங்களிலிருந்தும் நூலகங்களைக் காட்டு';

  @override
  String get enableFolderView => 'கோப்புறைக் காட்சியை இயக்கு';

  @override
  String get showFolderBrowsingOption => 'கோப்புறை உலாவல் விருப்பத்தைக் காட்டு';

  @override
  String get groupItemsIntoCollections =>
      'உருப்படிகளைத் தொகுப்புகளாகக் குழுவாக்கு';

  @override
  String get hideCollectionAssociatedItems =>
      'நூலகங்களை உலாவும்போது தொகுப்புடன் தொடர்புடைய நூலக உருப்படிகளை மறை';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'நூலகக் குழுவாக்கல் அறிவிப்பு';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'இந்த அமைப்பைப் பயன்படுத்த, உங்கள் Jellyfin அல்லது Emby சர்வரில் உங்கள் நூலகத்தின் Display அமைப்புகளின் கீழ் \"Group movies into collections\" மற்றும்/அல்லது \"Group shows into collections\" நூலக அமைப்புகள் இயக்கப்பட்டுள்ளதா என்பதை உறுதிசெய்யவும்.';

  @override
  String get libraryVisibility => 'நூலகத் தெரிவுநிலை';

  @override
  String get libraryVisibilityDescription =>
      'ஒரு நூலகத்திற்கு முகப்புப் பக்கத் தெரிவுநிலையை நிலைமாற்று. மாற்றங்கள் நடைமுறைக்கு வர Moonfin ஐ மீண்டும் தொடங்கவும்.';

  @override
  String get showInNavigation => 'வழிசெலுத்தலில் காட்டு';

  @override
  String get showInLatestMedia => 'சமீபத்திய மீடியாவில் காட்டு';

  @override
  String get sourceLibraries => 'மூல நூலகங்கள்';

  @override
  String get sourceCollections => 'மூலத் தொகுப்புகள்';

  @override
  String get excludedGenres => 'விலக்கப்பட்ட வகைகள்';

  @override
  String get selectAll => 'அனைத்தையும் தேர்ந்தெடுக்கவும்';

  @override
  String itemsSelected(int count) {
    return '$count தேர்ந்தெடுக்கப்பட்டது';
  }

  @override
  String get mediaBar => 'மீடியா பார்';

  @override
  String get mediaSources => 'ஊடக ஆதாரங்கள்';

  @override
  String get behavior => 'நடத்தை';

  @override
  String get seconds => 'வினாடிகள்';

  @override
  String get localPreviews => 'உள்ளூர் முன்னோட்டங்கள்';

  @override
  String get localPreviewsDescription =>
      'டிரெய்லர், மீடியா மற்றும் ஆடியோ மாதிரிக்காட்சிகளை உள்ளமைக்கவும்.';

  @override
  String get mediaBarMode => 'மீடியா பார் ஸ்டைல்';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD ஆகியவற்றிற்கு இடையே தேர்வு செய்யவும் அல்லது மீடியா பட்டியை அணைக்கவும்';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ஆஃப்';

  @override
  String get enableMediaBar => 'மீடியா பட்டியை இயக்கு';

  @override
  String get showFeaturedContentSlideshow =>
      'சிறப்பு உள்ளடக்க ஸ்லைடுஷோவை வீட்டில் காட்டு';

  @override
  String get contentType => 'உள்ளடக்க வகை';

  @override
  String get moviesAndTvShows => 'திரைப்படங்கள் & டிவி நிகழ்ச்சிகள்';

  @override
  String get moviesOnly => 'திரைப்படங்கள் மட்டும்';

  @override
  String get tvShowsOnly => 'டிவி நிகழ்ச்சிகள் மட்டும்';

  @override
  String get itemCount => 'பொருள் எண்ணிக்கை';

  @override
  String get noneSelected => 'எதுவும் தேர்ந்தெடுக்கப்படவில்லை';

  @override
  String get noneExcluded => 'எதுவும் விலக்கப்படவில்லை';

  @override
  String get autoAdvance => 'ஆட்டோ அட்வான்ஸ்';

  @override
  String get autoAdvanceSlides => 'அடுத்த ஸ்லைடிற்கு தானாக முன்னேறவும்';

  @override
  String get autoAdvanceInterval => 'ஆட்டோ அட்வான்ஸ் இடைவெளி';

  @override
  String get trailerPreview => 'டிரெய்லர் முன்னோட்டம்';

  @override
  String get autoPlayTrailers =>
      '3 வினாடிகளுக்குப் பிறகு மீடியா பட்டியில் டிரெய்லர்களைத் தானாக இயக்கவும்';

  @override
  String get trailerAudio => 'டிரெய்லர் ஆடியோ';

  @override
  String get enableTrailerAudio =>
      'மீடியா பட்டியில் டிரெய்லர்களுக்கு ஆடியோவை இயக்கும்';

  @override
  String get episodePreview => 'எபிசோட் முன்னோட்டம்';

  @override
  String get mediaPreview => 'மீடியா முன்னோட்டம்';

  @override
  String get episodePreviewDescription =>
      'ஃபோகஸ் செய்யப்பட்ட, நகர்த்தப்பட்ட அல்லது நீண்ட நேரம் அழுத்தப்பட்ட கார்டுகளில் 30-வினாடி இன்லைன் மாதிரிக்காட்சியை இயக்கவும்';

  @override
  String get mediaPreviewDescription =>
      'ஃபோகஸ் செய்யப்பட்ட, நகர்த்தப்பட்ட அல்லது நீண்ட நேரம் அழுத்தப்பட்ட கார்டுகளில் 30-வினாடி இன்லைன் மாதிரிக்காட்சியை இயக்கவும்';

  @override
  String get previewAudio => 'முன்னோட்ட ஆடியோ';

  @override
  String get enablePreviewAudio =>
      'டிரெய்லர் மற்றும் எபிசோட் மாதிரிக்காட்சிகளுக்கு ஆடியோவை இயக்கவும்';

  @override
  String get latestMedia => 'சமீபத்திய மீடியா';

  @override
  String get recentlyReleased => 'சமீபத்தில் வெளியானது';

  @override
  String get myMedia => 'என் மீடியா';

  @override
  String get myMediaSmall => 'எனது ஊடகம் (சிறியது)';

  @override
  String get continueWatching => 'தொடர்ந்து பார்க்கவும்';

  @override
  String get resumeAudio => 'ஆடியோவை மீண்டும் தொடங்கவும்';

  @override
  String get resumeBooks => 'ரெஸ்யூம் புத்தகங்கள்';

  @override
  String get activeRecordings => 'செயலில் உள்ள பதிவுகள்';

  @override
  String get playlists => 'பிளேலிஸ்ட்கள்';

  @override
  String get liveTV => 'நேரலை டிவி';

  @override
  String get homeSections => 'முகப்பு பிரிவுகள்';

  @override
  String get resetToDefaults => 'இயல்புநிலைக்கு மீட்டமைக்கவும்';

  @override
  String get homeRowPosterSize => 'முகப்பு வரிசை போஸ்டர் அளவு';

  @override
  String get perRowImageTypeSelection => 'ஒவ்வொரு வரிசை பட வகை தேர்வு';

  @override
  String get configureImageTypeForEachRow =>
      'ஒவ்வொரு இயக்கப்பட்ட முகப்பு வரிசைக்கும் பட வகையை உள்ளமைக்கவும்';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'தொடர்ந்து பார்த்தல் மற்றும் அடுத்ததை ஒன்றிணைக்கவும்';

  @override
  String get combineBothRows =>
      'இரண்டு வரிசைகளையும் ஒரு முகப்புப் பிரிவில் இணைக்கவும்';

  @override
  String get fullScreenRows => 'விரிவாக்கப்பட்ட முகப்பு வரிசைகள்';

  @override
  String get fullScreenRowsDescription =>
      'ஒரு திரைக்கு 1 முகப்பு வரிசை என வரம்பிடும்';

  @override
  String get modernHomeRowsPadding => 'Home Row Padding';

  @override
  String get modernHomeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'ஒவ்வொரு வரிசை பட வகை';

  @override
  String get perRowSettings => 'ஒரு வரிசை அமைப்புகள்';

  @override
  String get autoLogin => 'தானியங்கு உள்நுழைவு';

  @override
  String get lastUser => 'கடைசி பயனர்';

  @override
  String get currentUser => 'தற்போதைய பயனர்';

  @override
  String get alwaysAuthenticate => 'எப்போதும் அங்கீகரிக்கவும்';

  @override
  String get requirePasswordWithToken =>
      'சேமிக்கப்பட்ட டோக்கனுடன் கூட கடவுச்சொல் தேவை';

  @override
  String get confirmExit => 'வெளியேறுவதை உறுதிப்படுத்தவும்';

  @override
  String get showConfirmationBeforeExiting =>
      'வெளியேறும் முன் உறுதிப்படுத்தலைக் காட்டு';

  @override
  String get blockContentWithRatings =>
      'பின்வரும் மதிப்பீடுகளுடன் உள்ளடக்கத்தைத் தடு:';

  @override
  String get noContentRatingsFound =>
      'இந்த சர்வரில் இதுவரை உள்ளடக்க மதிப்பீடுகள் எதுவும் கண்டறியப்படவில்லை.';

  @override
  String get couldNotLoadServerRatings =>
      'சேவையக மதிப்பீடுகளை ஏற்ற முடியவில்லை. சேமிக்கப்பட்ட மதிப்பீடுகளை மட்டுமே காட்டுகிறது.';

  @override
  String get couldNotRefreshRatings =>
      'சேவையகத்திலிருந்து மதிப்பீடுகளைப் புதுப்பிக்க முடியவில்லை. சேமித்த மதிப்பீடுகளைக் காட்டுகிறது.';

  @override
  String get enablePinCode => 'பின் குறியீட்டை இயக்கவும்';

  @override
  String get requirePinToAccess => 'உங்கள் கணக்கை அணுக பின் தேவை';

  @override
  String get changePin => 'பின்னை மாற்றவும்';

  @override
  String get setNewPinCode => 'புதிய பின் குறியீட்டை அமைக்கவும்';

  @override
  String get removePin => 'பின்னை அகற்று';

  @override
  String get removePinProtection => 'பின் குறியீடு பாதுகாப்பை அகற்று';

  @override
  String get screensaver => 'ஸ்கிரீன்சேவர்';

  @override
  String get inAppScreensaver => 'இன்-ஆப் ஸ்கிரீன்சேவர்';

  @override
  String get enableBuiltInScreensaver =>
      'உள்ளமைக்கப்பட்ட ஸ்கிரீன்சேவரை இயக்கவும்';

  @override
  String get mode => 'பயன்முறை';

  @override
  String get libraryArt => 'நூலக கலை';

  @override
  String get logo => 'சின்னம்';

  @override
  String get clock => 'கடிகாரம்';

  @override
  String get timeout => 'நேரம் முடிந்தது';

  @override
  String minutesShort(int minutes) {
    return '$minutes நிமி';
  }

  @override
  String get dimmingLevel => 'மங்கலான நிலை';

  @override
  String get maxAgeRating => 'அதிகபட்ச வயது மதிப்பீடு';

  @override
  String get any => 'ஏதேனும்';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'வயது மதிப்பீடு தேவை';

  @override
  String get onlyShowRatedContent =>
      'மதிப்பிடப்பட்ட உள்ளடக்கத்தை மட்டும் காட்டு';

  @override
  String get showClock => 'கடிகாரத்தைக் காட்டு';

  @override
  String get displayClockDuringScreensaver =>
      'ஸ்கிரீன்சேவரின் போது காட்சி கடிகாரம்';

  @override
  String get clockModeStatic => 'நிலையானது';

  @override
  String get clockModeBouncing => 'துள்ளுவது';

  @override
  String get rottenTomatoesCritics => 'அழுகிய தக்காளி (விமர்சகர்கள்)';

  @override
  String get rottenTomatoesAudience => 'அழுகிய தக்காளி (பார்வையாளர்கள்)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'மெட்டாக்ரிடிக்';

  @override
  String get metacriticUser => 'மெட்டாக்ரிடிக் (பயனர்)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'கடிதப்பெட்டி';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'அனிலிஸ்ட்';

  @override
  String get communityRating => 'சமூக மதிப்பீடு';

  @override
  String get ratings => 'மதிப்பீடுகள்';

  @override
  String get additionalRatings => 'கூடுதல் மதிப்பீடுகள்';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList மற்றும் TMDB மதிப்பீடுகளைக் காட்டு';

  @override
  String get ratingLabels => 'மதிப்பீடு லேபிள்கள்';

  @override
  String get showLabelsNextToIcons =>
      'ரேட்டிங் ஐகான்களுக்கு அடுத்துள்ள லேபிள்களைக் காட்டு';

  @override
  String get ratingBadges => 'ரேட்டிங் பேட்ஜ்கள்';

  @override
  String get showDecorativeBadges =>
      'மதிப்பீடுகளுக்குப் பின்னால் அலங்கார பேட்ஜ்களைக் காட்டு';

  @override
  String get episodeRatings => 'அத்தியாய மதிப்பீடுகள்';

  @override
  String get showRatingsOnEpisodes =>
      'தனிப்பட்ட அத்தியாயங்களில் மதிப்பீடுகளைக் காட்டு';

  @override
  String get ratingSources => 'மதிப்பீட்டு ஆதாரங்கள்';

  @override
  String get ratingSourcesDescription =>
      'ஆப்ஸ் முழுவதும் காட்டப்படும் மதிப்பீட்டு ஆதாரங்களை இயக்கி மறுவரிசைப்படுத்தவும்';

  @override
  String get pluginLabel => 'Moonbase செருகுநிரல்';

  @override
  String get pluginDetected => 'செருகுநிரல் கண்டறியப்பட்டது';

  @override
  String get pluginNotDetected => 'செருகுநிரல் கண்டறியப்படவில்லை';

  @override
  String get pluginDetectedDescription =>
      'சர்வர் செருகுநிரல் கண்டறியப்பட்டது. முதல் முறையாக செருகுநிரல் கண்டறியப்படும்போது ஒத்திசைவு தானாகவே இயக்கப்படும்.';

  @override
  String get pluginNotDetectedDescription =>
      'சர்வர் செருகுநிரல் தற்போது கண்டறியப்படவில்லை. உள்ளூர் அமைப்புகள் இன்னும் சேமித்த மதிப்புகள் அல்லது உள்ளமைக்கப்பட்ட இயல்புநிலைகளைப் பயன்படுத்துகின்றன.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nபதிப்பு: $version';
  }

  @override
  String get availableServices => 'கிடைக்கும் சேவைகள்';

  @override
  String get serverPluginSync => 'சர்வர் செருகுநிரல் ஒத்திசைவு';

  @override
  String get syncSettingsWithPlugin =>
      'சேவையக செருகுநிரலுடன் அமைப்புகளை ஒத்திசைக்கவும்';

  @override
  String get whatSyncControls => 'என்ன ஒத்திசைவு கட்டுப்பாடுகள்';

  @override
  String get syncControlsDescription =>
      'செருகுநிரல்-ஆதரவு அமைப்புகள் சேவையகத்திற்குத் தள்ளப்பட்டு இழுக்கப்படுவதை மட்டுமே ஒத்திசைவு கட்டுப்படுத்துகிறது. செருகுநிரல் ஒத்திசைவு இயக்கப்பட்டிருக்கும் போது சுயவிவரத் தேர்வு மற்றும் சுயவிவர ஒத்திசைவு செயல்கள் தனிப்பயனாக்குதல் அமைப்புகளில் இருக்கும்.';

  @override
  String get recentRequests => 'சமீபத்திய கோரிக்கைகள்';

  @override
  String get recentlyAdded => 'சமீபத்தில் சேர்க்கப்பட்டது';

  @override
  String get trending => 'டிரெண்டிங்';

  @override
  String get popularMovies => 'பிரபலமான திரைப்படங்கள்';

  @override
  String get movieGenres => 'திரைப்பட வகைகள்';

  @override
  String get upcomingMovies => 'வரவிருக்கும் திரைப்படங்கள்';

  @override
  String get studios => 'ஸ்டுடியோக்கள்';

  @override
  String get popularSeries => 'பிரபலமான தொடர்';

  @override
  String get seriesGenres => 'தொடர் வகைகள்';

  @override
  String get upcomingSeries => 'வரவிருக்கும் தொடர்';

  @override
  String get networks => 'நெட்வொர்க்குகள்';

  @override
  String get seerrDiscoveryRows => 'Seerr கண்டுபிடிப்பு வரிசைகள்';

  @override
  String get resetRowsToDefaults => 'வரிசைகளை இயல்புநிலைக்கு மீட்டமைக்கவும்';

  @override
  String get enableSeerr => 'Seerr ஐ இயக்கு';

  @override
  String get showSeerrInNavigation =>
      'வழிசெலுத்தலில் Seerrஐக் காட்டு (சர்வர் செருகுநிரல் தேவை)';

  @override
  String get seerrUnavailable =>
      'சர்வர் சொருகி Seerr ஆதரவு முடக்கப்பட்டுள்ளதால் கிடைக்கவில்லை.';

  @override
  String get nsfwFilter => 'NSFW வடிகட்டி';

  @override
  String get hideAdultContent =>
      'முடிவுகளில் வயது வந்தோருக்கான உள்ளடக்கத்தை மறை';

  @override
  String get seerrNotificationsSection => 'அறிவிப்புகள்';

  @override
  String get seerrNotifyNewRequestsTitle => 'புதிய கோரிக்கை அறிவிப்புகள்';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'யாராவது கோரிக்கை சமர்ப்பிக்கும்போது எனக்கு அறிவிக்கவும்';

  @override
  String get seerrNotifyLibraryAddedTitle => 'கோரிக்கை புதுப்பிப்புகள்';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'அங்கீகரிக்கப்பட்டது, நிராகரிக்கப்பட்டது மற்றும் உங்கள் நூலகத்தில் சேர்க்கப்பட்டது';

  @override
  String get seerrNotifyIssuesTitle => 'சிக்கல் புதுப்பிப்புகள்';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'புதிய சிக்கல்கள், பதில்கள் மற்றும் தீர்வுகள்';

  @override
  String loggedInAs(String username) {
    return 'உள்நுழைந்துள்ளவர்: $username';
  }

  @override
  String get discoverRows => 'Seerr கண்டுபிடிப்புப் பக்கம்';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr முகப்புப் பக்கத்தில் காண வேண்டிய வரிசைகளை இயக்கவும். வரிசையை மாற்ற இழுக்கவும். தனிப்பயன் வரிசை Moonbase உடன் ஒத்திசைக்கப்படும்.';

  @override
  String get discoverRowsDescription =>
      'Seerr முகப்புப் பக்கத்தில் காண வேண்டிய வரிசைகளை இயக்கவும். வரிசையை மாற்ற இழுக்கவும். தனிப்பயன் வரிசை Moonbase உடன் ஒத்திசைக்கப்படும்.';

  @override
  String get enabled => 'இயக்கப்பட்டது';

  @override
  String get hidden => 'மறைக்கப்பட்டது';

  @override
  String get aboutTitle => 'பற்றி';

  @override
  String versionValue(String version) {
    return 'பதிப்பு $version';
  }

  @override
  String get openSourceLicenses => 'திறந்த மூல உரிமங்கள்';

  @override
  String get sourceCode => 'மூல குறியீடு';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'இப்போது புதுப்பிப்புகளைச் சரிபார்க்கவும்';

  @override
  String get checksLatestDesktopRelease =>
      'இந்த தளத்திற்கான சமீபத்திய டெஸ்க்டாப் வெளியீட்டை சரிபார்க்கிறது';

  @override
  String get youAreUpToDate => 'நீங்கள் புதுப்பித்த நிலையில் உள்ளீர்கள்.';

  @override
  String get couldNotCheckForUpdates =>
      'இப்போது புதுப்பிப்புகளைச் சரிபார்க்க முடியவில்லை.';

  @override
  String get noCompatibleUpdate =>
      'இந்த இயங்குதளத்திற்கு இணக்கமான புதுப்பிப்பு தொகுப்பு எதுவும் இல்லை.';

  @override
  String get updateChecksNotSupported =>
      'இந்த பிளாட்ஃபார்மில் புதுப்பிப்பு சரிபார்ப்புகள் ஆதரிக்கப்படவில்லை.';

  @override
  String get updateNotificationsDisabled =>
      'புதுப்பிப்பு அறிவிப்புகள் முடக்கப்பட்டுள்ளன.';

  @override
  String get pleaseWaitBeforeChecking =>
      'மீண்டும் சரிபார்க்கும் முன் காத்திருக்கவும்.';

  @override
  String get latestUpdateAlreadyShown =>
      'சமீபத்திய புதுப்பிப்பு ஏற்கனவே காட்டப்பட்டது.';

  @override
  String get updateAvailable => 'புதுப்பிப்பு கிடைக்கிறது.';

  @override
  String updateAvailableVersion(String version) {
    return 'புதுப்பிப்பு கிடைக்கிறது: v$version';
  }

  @override
  String get updateNotifications => 'அறிவிப்புகளைப் புதுப்பிக்கவும்';

  @override
  String get showWhenUpdatesAvailable =>
      'புதுப்பிப்புகள் எப்போது கிடைக்கும் என்பதைக் காட்டு';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version கிடைக்கிறது';
  }

  @override
  String get readReleaseNotes => 'வெளியீட்டு குறிப்புகளைப் படிக்கவும்';

  @override
  String get downloadingUpdate => 'புதுப்பிப்பைப் பதிவிறக்குகிறது...';

  @override
  String get updateDownloadFailed =>
      'புதுப்பித்தல் பதிவிறக்கம் தோல்வியடைந்தது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get openReleasesPage => 'வெளியீடுகள் பக்கத்தைத் திறக்கவும்';

  @override
  String get navigation => 'வழிசெலுத்தல்';

  @override
  String get watchedIndicatorsBackdrops =>
      'குறிகாட்டிகள், பின்புலங்களைப் பார்த்தேன்';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'கவனம் செலுத்தும் வண்ணம், பார்த்த குறிகாட்டிகள், பின்புலங்கள்';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar பாணி, கருவிப்பட்டி பொத்தான்கள், தோற்றம்';

  @override
  String get reorderToggleHomeRows =>
      'முகப்பு வரிசைகளை மறுவரிசைப்படுத்தி மாற்றவும்';

  @override
  String get featuredContentAppearance => 'சிறப்பு உள்ளடக்கம், தோற்றம்';

  @override
  String get posterSizeImageTypeFolderView =>
      'சுவரொட்டி அளவு, படத்தின் வகை, கோப்புறை காட்சி';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB மற்றும் மதிப்பீட்டு ஆதாரங்கள்';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'படக் கேச் வரம்பு';

  @override
  String get clearImageCache => 'படக் கேசை அழி';

  @override
  String get imageCacheCleared => 'படக் கேச் அழிக்கப்பட்டது';

  @override
  String get clear => 'அழி';

  @override
  String get browse => 'உலாவவும்';

  @override
  String get noResults => 'முடிவுகள் இல்லை';

  @override
  String get seerrAvailableStatus => 'கிடைக்கும்';

  @override
  String get seerrRequestedStatus => 'கோரப்பட்டது';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'பதிவிறக்குகிறது · $percent%';
  }

  @override
  String get seerrImportingStatus => 'இறக்குமதி செய்கிறது';

  @override
  String itemsCount(int count) {
    return '$count உருப்படிகள்';
  }

  @override
  String get seerrSettings => 'Seerr அமைப்புகள்';

  @override
  String get requestMore => 'மேலும் கோரிக்கை';

  @override
  String get request => 'கோரிக்கை';

  @override
  String get cancelRequest => 'கோரிக்கையை ரத்துசெய்';

  @override
  String get playInMoonfin => 'Moonfin இல் விளையாடு';

  @override
  String requestedByName(String name) {
    return '$name கோரியுள்ளார்';
  }

  @override
  String get approve => 'ஒப்புதல்';

  @override
  String get declineAction => 'நிராகரி';

  @override
  String get similar => 'ஒத்த';

  @override
  String get recommendations => 'பரிந்துரைகள்';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" க்கான கோரிக்கையை ரத்துசெய்யவா?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" க்கான $count கோரிக்கைகளை ரத்துசெய்யவா?';
  }

  @override
  String get keep => 'வைத்துக்கொள்';

  @override
  String get itemNotFoundInLibrary =>
      'உங்கள் Moonfin நூலகத்தில் உருப்படி இல்லை';

  @override
  String get errorSearchingLibrary => 'நூலகத்தைத் தேடுவதில் பிழை';

  @override
  String budgetAmount(String amount) {
    return 'பட்ஜெட்: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'வருவாய்: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type கோரவும்';
  }

  @override
  String get submitRequest => 'கோரிக்கையை சமர்ப்பிக்கவும்';

  @override
  String get allSeasons => 'அனைத்து பருவங்களும்';

  @override
  String get advancedOptions => 'மேம்பட்ட விருப்பங்கள்';

  @override
  String get noServiceServersConfigured =>
      'சேவை சேவையகங்கள் எதுவும் கட்டமைக்கப்படவில்லை';

  @override
  String get server => 'சேவையகம்';

  @override
  String get qualityProfile => 'தரமான சுயவிவரம்';

  @override
  String get rootFolder => 'ரூட் கோப்புறை';

  @override
  String get showMore => 'மேலும் காட்டு';

  @override
  String get appearances => 'தோற்றங்கள்';

  @override
  String get crewSection => 'குழுவினர்';

  @override
  String ageValue(int age) {
    return 'வயது $age';
  }

  @override
  String get noRequests => 'கோரிக்கைகள் இல்லை';

  @override
  String get pendingStatus => 'நிலுவையில் உள்ளது';

  @override
  String get declinedStatus => 'நிராகரிக்கப்பட்டது';

  @override
  String get partiallyAvailable => 'ஓரளவு கிடைக்கும்';

  @override
  String get downloadingStatus => 'பதிவிறக்குகிறது';

  @override
  String get approvedStatus => 'அங்கீகரிக்கப்பட்டது';

  @override
  String get notRequestedStatus => 'கோரப்படவில்லை';

  @override
  String get blocklistedStatus => 'தடைப்பட்டியலில்';

  @override
  String get deletedStatus => 'நீக்கப்பட்டது';

  @override
  String get failedStatus => 'தோல்வி';

  @override
  String get processingStatus => 'செயலாக்கத்தில்';

  @override
  String modifiedByName(String name) {
    return '$name மாற்றியுள்ளார்';
  }

  @override
  String get completedStatus => 'முடிந்தது';

  @override
  String get requestErrorDuplicate => 'இந்தத் தலைப்பு ஏற்கனவே கோரப்பட்டுள்ளது';

  @override
  String get requestErrorQuota => 'கோரிக்கை வரம்பை எட்டிவிட்டது';

  @override
  String get requestErrorBlocklisted =>
      'இந்தத் தலைப்பு தடுப்புப்பட்டியலில் உள்ளது';

  @override
  String get requestErrorNoSeasons => 'கோர எந்த சீசனும் மீதமில்லை';

  @override
  String get requestErrorPermission =>
      'இந்தக் கோரிக்கையை வைக்க உங்களுக்கு அனுமதி இல்லை';

  @override
  String get seerrRequestsTitle => 'கோரிக்கைகள்';

  @override
  String get seerrIssuesTitle => 'சிக்கல்கள்';

  @override
  String get sortNewest => 'புதியவை முதலில்';

  @override
  String get sortLastModified => 'கடைசியாக மாற்றியவை';

  @override
  String get noIssues => 'சிக்கல்கள் எதுவும் இல்லை';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit திரைப்படக் கோரிக்கைகளில் $remaining மீதம்';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit சீசன் கோரிக்கைகளில் $remaining மீதம்';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name இன் ஒரு பகுதி';
  }

  @override
  String get viewCollection => 'தொகுப்பைப் பார்';

  @override
  String get requestCollection => 'தொகுப்பைக் கோரவும்';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total திரைப்படங்கள் · $available கிடைக்கின்றன';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count திரைப்படங்களைக் கோரவும்';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total இல் $current கோரப்படுகிறது...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count திரைப்படங்கள் கோரப்பட்டன';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total திரைப்படங்களில் $ok கோரப்பட்டன';
  }

  @override
  String get collectionAllRequested =>
      'எல்லாத் திரைப்படங்களும் ஏற்கனவே கிடைக்கின்றன அல்லது கோரப்பட்டுள்ளன';

  @override
  String get reportIssue => 'சிக்கலைப் புகாரளி';

  @override
  String get issueTypeVideo => 'வீடியோ';

  @override
  String get issueTypeAudio => 'ஆடியோ';

  @override
  String get whatsWrong => 'என்ன பிரச்சினை?';

  @override
  String get allEpisodes => 'எல்லா அத்தியாயங்களும்';

  @override
  String get episode => 'அத்தியாயம்';

  @override
  String get openStatus => 'திறந்துள்ளது';

  @override
  String get resolvedStatus => 'தீர்க்கப்பட்டது';

  @override
  String get resolveAction => 'தீர்';

  @override
  String get reopenAction => 'மீண்டும் திற';

  @override
  String reportedByName(String name) {
    return '$name புகாரளித்துள்ளார்';
  }

  @override
  String commentsCount(int count) {
    return '$count கருத்துகள்';
  }

  @override
  String get addComment => 'கருத்தைச் சேர்க்கவும்';

  @override
  String get deleteIssueConfirm => 'இந்தச் சிக்கலை நீக்கவா?';

  @override
  String get submitReport => 'புகாரைச் சமர்ப்பி';

  @override
  String get tmdbScore => 'TMDB மதிப்பெண்';

  @override
  String get releaseDateLabel => 'வெளியீட்டு தேதி';

  @override
  String get firstAirDateLabel => 'முதல் ஒளிபரப்பு தேதி';

  @override
  String get revenueLabel => 'வருவாய்';

  @override
  String get runtimeLabel => 'இயக்க நேரம்';

  @override
  String get budgetLabel => 'பட்ஜெட்';

  @override
  String get originalLanguageLabel => 'அசல் மொழி';

  @override
  String get seasonsLabel => 'சீசன்கள்';

  @override
  String get episodesLabel => 'அத்தியாயங்கள்';

  @override
  String get access => 'அணுகல்';

  @override
  String get add => 'சேர்';

  @override
  String get address => 'முகவரி';

  @override
  String get analytics => 'பகுப்பாய்வு';

  @override
  String get catalog => 'பட்டியல்';

  @override
  String get content => 'உள்ளடக்கம்';

  @override
  String get copy => 'நகலெடுக்கவும்';

  @override
  String get create => 'உருவாக்கு';

  @override
  String get disable => 'முடக்கு';

  @override
  String get done => 'முடிந்தது';

  @override
  String get edit => 'திருத்து';

  @override
  String get encoding => 'குறியாக்கம்';

  @override
  String get error => 'பிழை';

  @override
  String get forward => 'முன்னோக்கி';

  @override
  String get general => 'பொது';

  @override
  String get go => 'போ';

  @override
  String get install => 'நிறுவவும்';

  @override
  String get installed => 'நிறுவப்பட்டது';

  @override
  String get interval => 'இடைவெளி';

  @override
  String get name => 'பெயர்';

  @override
  String get networking => 'நெட்வொர்க்கிங்';

  @override
  String get next => 'அடுத்து';

  @override
  String get path => 'பாதை';

  @override
  String get paused => 'இடைநிறுத்தப்பட்டது';

  @override
  String get permissions => 'அனுமதிகள்';

  @override
  String get processing => 'செயலாக்கம்';

  @override
  String get profile => 'சுயவிவரம்';

  @override
  String get provider => 'வழங்குபவர்';

  @override
  String get refresh => 'புதுப்பிக்கவும்';

  @override
  String get remote => 'ரிமோட்';

  @override
  String get rename => 'மறுபெயரிடவும்';

  @override
  String get revoke => 'திரும்பப் பெறு';

  @override
  String get role => 'பங்கு';

  @override
  String get root => 'வேர்';

  @override
  String get run => 'ஓடவும்';

  @override
  String get search => 'தேடு';

  @override
  String get select => 'தேர்ந்தெடு';

  @override
  String get send => 'அனுப்பு';

  @override
  String get sessions => 'அமர்வுகள்';

  @override
  String get set => 'அமைக்கவும்';

  @override
  String get status => 'நிலை';

  @override
  String get stop => 'நிறுத்து';

  @override
  String get streaming => 'ஸ்ட்ரீமிங்';

  @override
  String get time => 'நேரம்';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'நிறுவல் நீக்கவும்';

  @override
  String get up => 'மேலே';

  @override
  String get update => 'புதுப்பிக்கவும்';

  @override
  String get upload => 'பதிவேற்றவும்';

  @override
  String get unmute => 'ஒலியடக்கவும்';

  @override
  String get mute => 'ஒலியடக்கு';

  @override
  String get branding => 'பிராண்டிங்';

  @override
  String get adminDrawerDashboard => 'டாஷ்போர்டு';

  @override
  String get adminDrawerAnalytics => 'பகுப்பாய்வு';

  @override
  String get adminDrawerSettings => 'அமைப்புகள்';

  @override
  String get adminDrawerBranding => 'பிராண்டிங்';

  @override
  String get adminDrawerUsers => 'பயனர்கள்';

  @override
  String get adminDrawerLibraries => 'நூலகங்கள்';

  @override
  String get adminDrawerDisplay => 'காட்சி';

  @override
  String get adminDrawerMetadata => 'மெட்டாடேட்டா';

  @override
  String get adminDrawerNfo => 'NFO அமைப்புகள்';

  @override
  String get adminDrawerTranscoding => 'டிரான்ஸ்கோடிங்';

  @override
  String get adminDrawerResume => 'தொடர்க';

  @override
  String get adminDrawerStreaming => 'ஸ்ட்ரீமிங்';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'சாதனங்கள்';

  @override
  String get adminDrawerActivity => 'செயல்பாடு';

  @override
  String get adminDrawerNetworking => 'நெட்வொர்க்கிங்';

  @override
  String get adminDrawerApiKeys => 'API விசைகள்';

  @override
  String get adminDrawerBackups => 'காப்புப்பிரதிகள்';

  @override
  String get adminDrawerLogs => 'பதிவுகள்';

  @override
  String get adminDrawerScheduledTasks => 'திட்டமிடப்பட்ட பணிகள்';

  @override
  String get adminDrawerPlugins => 'செருகுநிரல்கள்';

  @override
  String get adminDrawerRepositories => 'களஞ்சியங்கள்';

  @override
  String get adminDrawerLiveTv => 'நேரலை டிவி';

  @override
  String get adminExitTooltip => 'நிர்வாகி வெளியேறு';

  @override
  String get adminDashboardLoadFailed => 'டாஷ்போர்டை ஏற்ற முடியவில்லை';

  @override
  String get adminMediaOverview => 'ஊடக கண்ணோட்டம்';

  @override
  String get adminMediaTotalsError =>
      'சர்வர் மீடியா மொத்தத்தை ஏற்ற முடியவில்லை.';

  @override
  String get adminMediaOverviewSubtitle =>
      'இந்த சர்வரில் எவ்வளவு உள்ளடக்கம் உள்ளது என்பதை விரைவாகப் படிக்கவும்.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'செருகுநிரல் புதுப்பிப்புகள் கிடைக்கின்றன: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'மறுதொடக்கம் தேவைப்படும் செருகுநிரல்கள்: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'தோல்வியடைந்த திட்டமிட்ட பணிகள்: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'சமீபத்திய எச்சரிக்கை/பிழை பதிவுகள்: $count';
  }

  @override
  String get analyticsMediaDistribution => 'ஊடக விநியோகம்';

  @override
  String get analyticsVideoCodecs => 'வீடியோ கோடெக்குகள்';

  @override
  String get analyticsAudioCodecs => 'ஆடியோ கோடெக்குகள்';

  @override
  String get analyticsContainers => 'கொள்கலன்கள்';

  @override
  String get analyticsTopGenres => 'சிறந்த வகைகள்';

  @override
  String get analyticsReleaseYears => 'வெளியீட்டு ஆண்டுகள்';

  @override
  String get analyticsContentRatings => 'உள்ளடக்க மதிப்பீடுகள்';

  @override
  String get analyticsRuntimeBuckets => 'இயக்க நேர வாளிகள்';

  @override
  String get analyticsFileFormats => 'கோப்பு வடிவங்கள்';

  @override
  String get analyticsNoData => 'தரவு எதுவும் கிடைக்கவில்லை.';

  @override
  String get adminServerInfo => 'சர்வர் தகவல்';

  @override
  String get adminRestartPending => 'மறுதொடக்கம் நிலுவையில் உள்ளது';

  @override
  String get adminServerPaths => 'சேவையக பாதைகள்';

  @override
  String get adminServerActions => 'சேவையக நடவடிக்கைகள்';

  @override
  String get adminRestartServer => 'சேவையகத்தை மறுதொடக்கம் செய்யுங்கள்';

  @override
  String get adminShutdownServer => 'பணிநிறுத்தம் சர்வர்';

  @override
  String get adminScanLibraries => 'நூலகங்களை ஸ்கேன் செய்யவும்';

  @override
  String get adminLibraryScanStarted => 'லைப்ரரி ஸ்கேன் தொடங்கியது';

  @override
  String errorGeneric(String error) {
    return 'பிழை: $error';
  }

  @override
  String get adminServerRebootInProgress => 'சேவையக மறுதொடக்கம் செயலில் உள்ளது';

  @override
  String get adminServerRebootMessage =>
      'சேவையக மறுதொடக்கம் செயலில் உள்ளது, Moonfin ஐ மீண்டும் தொடங்கவும்';

  @override
  String get adminActiveSessions => 'செயலில் உள்ள அமர்வுகள்';

  @override
  String get adminSessionsLoadFailed => 'அமர்வுகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNoActiveSessions => 'செயலில் அமர்வுகள் இல்லை';

  @override
  String get adminRecentActivity => 'சமீபத்திய செயல்பாடு';

  @override
  String get adminNoRecentActivity => 'சமீபத்திய செயல்பாடு இல்லை';

  @override
  String adminCommandFailed(String error) {
    return 'கட்டளை தோல்வியடைந்தது: $error';
  }

  @override
  String get adminSendMessage => 'செய்தி அனுப்பு';

  @override
  String get adminMessageTextHint => 'செய்தி உரை';

  @override
  String get adminSetVolume => 'தொகுதி அமைக்கவும்';

  @override
  String get sessionPrev => 'முந்தைய';

  @override
  String get sessionRewind => 'ரீவைண்ட்';

  @override
  String get sessionForward => 'முன்னோக்கி';

  @override
  String get sessionNext => 'அடுத்து';

  @override
  String get sessionVolumeDown => 'தொகுதி –';

  @override
  String get sessionVolumeUp => 'தொகுதி +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'இப்போது விளையாடுகிறது';

  @override
  String get volume => 'ஒலியளவு';

  @override
  String get actions => 'செயல்கள்';

  @override
  String get videoCodec => 'வீடியோ கோடெக்';

  @override
  String get audioCodec => 'ஆடியோ கோடெக்';

  @override
  String get hwAccel => 'HW முடுக்கம்';

  @override
  String get completion => 'நிறைவு';

  @override
  String get direct => 'நேரடி';

  @override
  String get adminDisconnect => 'துண்டிக்கவும்';

  @override
  String get adminClearDates => 'தெளிவான தேதிகள்';

  @override
  String get adminActivitySeverityAll => 'எல்லா தீவிரநிலைகளும்';

  @override
  String get adminActivityDateRange => 'தேதி வரம்பு';

  @override
  String adminActivityLoadFailed(String error) {
    return 'செயல்பாட்டுப் பதிவை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminNoActivityEntries => 'செயல்பாடு உள்ளீடுகள் இல்லை';

  @override
  String get adminEditDeviceName => 'சாதனத்தின் பெயரைத் திருத்தவும்';

  @override
  String get adminCustomName => 'விருப்ப பெயர்';

  @override
  String get adminDeviceNameUpdated => 'சாதனத்தின் பெயர் புதுப்பிக்கப்பட்டது';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'சாதனத்தைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminDeleteDevice => 'சாதனத்தை நீக்கு';

  @override
  String get adminDeviceDeleted => 'சாதனம் நீக்கப்பட்டது';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'சாதனத்தை நீக்க முடியவில்லை: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' சாதனத்தை அகற்றவா? இந்தச் சாதனத்தில் பயனர் மீண்டும் உள்நுழைய வேண்டியிருக்கும்.';
  }

  @override
  String get adminDeleteAllDevices => 'எல்லா சாதனங்களையும் நீக்கு';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count சாதனங்களை அகற்றவா? பாதிக்கப்படும் பயனர்கள் மீண்டும் உள்நுழைய வேண்டியிருக்கும். உங்கள் தற்போதைய சாதனம் பாதிக்கப்படாது.';
  }

  @override
  String get adminDevicesDeletedAll => 'சாதனங்கள் அகற்றப்பட்டன';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'சில சாதனங்கள் அகற்றப்பட்டன; $count அகற்ற முடியவில்லை.';
  }

  @override
  String get adminDevicesLoadFailed => 'சாதனங்களை ஏற்ற முடியவில்லை';

  @override
  String get adminSearchDevices => 'தேடல் சாதனங்கள்';

  @override
  String get adminThisDevice => 'இந்த சாதனம்';

  @override
  String get adminEditName => 'பெயரைத் திருத்தவும்';

  @override
  String get adminLibrariesLoadFailed => 'நூலகங்களை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNoLibraries => 'நூலகங்கள் எதுவும் கட்டமைக்கப்படவில்லை';

  @override
  String get adminScanAllLibraries => 'அனைத்து நூலகங்களையும் ஸ்கேன் செய்யவும்';

  @override
  String get adminAddLibrary => 'நூலகத்தைச் சேர்';

  @override
  String adminScanFailed(String error) {
    return 'ஸ்கேனைத் தொடங்க முடியவில்லை: $error';
  }

  @override
  String get adminRenameLibrary => 'நூலகத்திற்கு மறுபெயரிடவும்';

  @override
  String get adminNewName => 'புதிய பெயர்';

  @override
  String adminLibraryRenamed(String name) {
    return 'நூலகம் \"$name\" எனப் பெயர்மாற்றப்பட்டது';
  }

  @override
  String adminRenameFailed(String error) {
    return 'பெயர்மாற்ற முடியவில்லை: $error';
  }

  @override
  String get adminDeleteLibrary => 'நூலகத்தை நீக்கு';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" நூலகம் நீக்கப்பட்டது';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'நூலகத்தை நீக்க முடியவில்லை: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'பாதையைச் சேர்க்க முடியவில்லை: $error';
  }

  @override
  String get adminRemovePath => 'பாதையை அகற்று';

  @override
  String adminRemovePathConfirm(String path) {
    return 'இந்த நூலகத்திலிருந்து \"$path\" ஐ அகற்றவா?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'பாதையை அகற்ற முடியவில்லை: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'நூலக விருப்பங்கள் சேமிக்கப்பட்டன';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'விருப்பங்களைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'நூலகத்தை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNoMediaPaths => 'மீடியா பாதைகள் எதுவும் கட்டமைக்கப்படவில்லை';

  @override
  String get adminAddPath => 'பாதையைச் சேர்க்கவும்';

  @override
  String get adminBrowseFilesystem => 'சர்வர் கோப்பு முறைமையை உலாவுக:';

  @override
  String get adminSaveOptions => 'விருப்பங்களைச் சேமிக்கவும்';

  @override
  String get adminPreferredMetadataLanguage => 'விருப்பமான மெட்டாடேட்டா மொழி';

  @override
  String get adminMetadataLanguageHint => 'எ.கா. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'மெட்டாடேட்டா நாட்டின் குறியீடு';

  @override
  String get adminMetadataCountryHint => 'எ.கா. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'பாதைகள்';

  @override
  String get adminLibraryTabOptions => 'விருப்பங்கள்';

  @override
  String get adminLibraryTabDownloaders => 'பதிவிறக்கிகள்';

  @override
  String get adminLibMetadataSavers => 'மெட்டாடேட்டா சேமிப்பான்கள்';

  @override
  String get adminLibSubtitleDownloaders => 'வசன வரி பதிவிறக்கிகள்';

  @override
  String get adminLibLyricDownloaders => 'பாடல் வரி பதிவிறக்கிகள்';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'மெட்டாடேட்டா பதிவிறக்கிகள்: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'படம் பெறுவான்கள்: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'இந்த நூலக வகைக்கு இந்த சர்வர் எந்தப் பதிவிறக்கியையும் வழங்கவில்லை.';

  @override
  String get adminLibrarySectionGeneral => 'பொது';

  @override
  String get adminLibrarySectionMetadata => 'மெட்டாடேட்டா';

  @override
  String get adminLibrarySectionEmbedded => 'உள்ளமைந்த தகவல்';

  @override
  String get adminLibrarySectionSubtitles => 'வசன வரிகள்';

  @override
  String get adminLibrarySectionImages => 'படங்கள்';

  @override
  String get adminLibrarySectionSeries => 'தொடர்கள்';

  @override
  String get adminLibrarySectionMusic => 'இசை';

  @override
  String get adminLibrarySectionMovies => 'திரைப்படங்கள்';

  @override
  String get adminLibRealtimeMonitor => 'நிகழ்நேரக் கண்காணிப்பை இயக்கு';

  @override
  String get adminLibRealtimeMonitorHint =>
      'கோப்பு மாற்றங்களைக் கண்டறிந்து தானாகச் செயலாக்கும்.';

  @override
  String get adminLibArchiveMediaFiles =>
      'காப்பகங்களை மீடியா கோப்புகளாகக் கருது';

  @override
  String get adminLibEnablePhotos => 'புகைப்படங்களைக் காட்டு';

  @override
  String get adminLibSaveLocalMetadata =>
      'கலைப்படைப்புகளை மீடியா கோப்புறைகளில் சேமி';

  @override
  String get adminLibRefreshInterval => 'தானியங்கி மெட்டாடேட்டா புதுப்பிப்பு';

  @override
  String get adminLibRefreshNever => 'ஒருபோதும் இல்லை';

  @override
  String get adminLibDefault => 'இயல்பு';

  @override
  String get adminLibDisplayTitle => 'காட்சி';

  @override
  String get adminLibDisplaySection => 'நூலகக் காட்சி';

  @override
  String get adminLibFolderView =>
      'எளிய மீடியா கோப்புறைகளைக் காட்ட கோப்புறைக் காட்சியைக் காட்டு';

  @override
  String get adminLibSpecialsInSeasons =>
      'சிறப்பு அத்தியாயங்களை அவை ஒளிபரப்பான சீசன்களுக்குள் காட்டு';

  @override
  String get adminLibGroupMovies => 'திரைப்படங்களைத் தொகுப்புகளாகக் குழுவாக்கு';

  @override
  String get adminLibGroupShows => 'நிகழ்ச்சிகளைத் தொகுப்புகளாகக் குழுவாக்கு';

  @override
  String get adminLibExternalSuggestions =>
      'பரிந்துரைகளில் வெளிப்புற உள்ளடக்கத்தைக் காட்டு';

  @override
  String get adminLibDateAddedSection => 'சேர்க்கப்பட்ட தேதி நடத்தை';

  @override
  String get adminLibDateAddedLabel =>
      'சேர்க்கப்பட்ட தேதியை இதிலிருந்து பயன்படுத்து';

  @override
  String get adminLibDateAddedImport => 'நூலகத்தில் ஸ்கேன் செய்யப்பட்ட தேதி';

  @override
  String get adminLibDateAddedFile => 'கோப்பு உருவாக்கப்பட்ட தேதி';

  @override
  String get adminLibMetadataTitle => 'மெட்டாடேட்டா மற்றும் படங்கள்';

  @override
  String get adminLibMetadataLangSection => 'விருப்பமான மெட்டாடேட்டா மொழி';

  @override
  String get adminLibChaptersSection => 'அத்தியாயங்கள்';

  @override
  String get adminLibDummyChapterDuration =>
      'போலி அத்தியாய கால அளவு (வினாடிகள்)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'அத்தியாயங்கள் இல்லாத மீடியாவுக்கு உருவாக்கப்படும் அத்தியாயங்களின் நீளம். முடக்க 0 என அமைக்கவும்.';

  @override
  String get adminLibChapterImageResolution => 'அத்தியாயப் படத் தெளிவுத்திறன்';

  @override
  String get adminLibNfoTitle => 'NFO அமைப்புகள்';

  @override
  String get adminLibNfoHelp =>
      'NFO மெட்டாடேட்டா Kodi மற்றும் அது போன்ற கிளையண்டுகளுடன் இணக்கமானது. NFO மெட்டாடேட்டாவைச் சேமிக்கும் எல்லா நூலகங்களுக்கும் இந்த அமைப்புகள் பொருந்தும்.';

  @override
  String get adminLibKodiUser =>
      'NFO கோப்புகளில் பார்த்த தரவைச் சேமிக்க வேண்டிய பயனர்';

  @override
  String get adminLibSaveImagePaths =>
      'NFO கோப்புகளுக்குள் படப் பாதைகளைச் சேமி';

  @override
  String get adminLibPathSubstitution =>
      'NFO படப் பாதைகளுக்கு பாதை மாற்றீட்டை இயக்கு';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart படங்களை extrathumbs கோப்புறைக்கு நகலெடு';

  @override
  String get adminLibNone => 'எதுவுமில்லை';

  @override
  String adminLibRefreshDays(int days) {
    return '$days நாட்கள்';
  }

  @override
  String get adminLibEmbeddedTitles => 'உள்ளமைந்த தலைப்புகளைப் பயன்படுத்து';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'கூடுதல் அம்சங்களுக்கு உள்ளமைந்த தலைப்புகளைப் பயன்படுத்து';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'உள்ளமைந்த அத்தியாயத் தகவலைப் பயன்படுத்து';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'உள்ளமைந்த வசன வரிகளை அனுமதி';

  @override
  String get adminLibEmbeddedAllowAll => 'அனைத்தையும் அனுமதி';

  @override
  String get adminLibEmbeddedAllowText => 'உரை மட்டும்';

  @override
  String get adminLibEmbeddedAllowImage => 'படம் மட்டும்';

  @override
  String get adminLibEmbeddedAllowNone => 'எதுவுமில்லை';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'உள்ளமைந்த வசன வரிகள் இருந்தால் பதிவிறக்கத்தைத் தவிர்';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ஆடியோ தடம் பதிவிறக்க மொழியுடன் பொருந்தினால் பதிவிறக்கத்தைத் தவிர்';

  @override
  String get adminLibRequirePerfectMatch =>
      'வசன வரி முழுமையாகப் பொருந்த வேண்டும்';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'வசன வரிகளை மீடியா கோப்புறைகளில் சேமி';

  @override
  String get adminLibChapterImageExtraction =>
      'அத்தியாயப் படங்களைப் பிரித்தெடு';

  @override
  String get adminLibChapterImagesDuringScan =>
      'நூலக ஸ்கேனின்போது அத்தியாயப் படங்களைப் பிரித்தெடு';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay படப் பிரித்தெடுத்தலை இயக்கு';

  @override
  String get adminLibTrickplayDuringScan =>
      'நூலக ஸ்கேனின்போது Trickplay படங்களைப் பிரித்தெடு';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay படங்களை மீடியா கோப்புறைகளில் சேமி';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'பல கோப்புறைகளில் பரவியுள்ள தொடர்களைத் தானாக இணை';

  @override
  String get adminLibSeasonZeroName => 'பூஜ்ஜிய சீசன் காட்சிப் பெயர்';

  @override
  String get adminLibLufsScan => 'ஆடியோ சீரமைப்புக்கான LUFS ஸ்கேனை இயக்கு';

  @override
  String get adminLibPreferNonstandardArtist =>
      'தரமற்ற கலைஞர்கள் குறிச்சொல்லை விரும்பு';

  @override
  String get adminLibAutoAddToCollection =>
      'திரைப்படங்களைத் தொகுப்புகளில் தானாகச் சேர்';

  @override
  String get adminLibraryNameRequired => 'நூலகத்தின் பெயர் தேவை';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'நூலகத்தை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get adminLibraryName => 'நூலகத்தின் பெயர்';

  @override
  String get adminSelectedPaths => 'தேர்ந்தெடுக்கப்பட்ட பாதைகள்:';

  @override
  String get adminNoPathsAdded =>
      'பாதைகள் எதுவும் சேர்க்கப்படவில்லை (பின்னர் சேர்க்கலாம்)';

  @override
  String get adminCreateLibrary => 'நூலகத்தை உருவாக்கவும்';

  @override
  String get paths => 'பாதைகள்:';

  @override
  String get adminDisableUser => 'பயனரை முடக்கு';

  @override
  String get adminEnableUser => 'பயனரை இயக்கு';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name ஐ முடக்கவா? அவரால் உள்நுழைய முடியாது.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name ஐ இயக்கவா? அவர் மீண்டும் உள்நுழைய முடியும்.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" பயனர் முடக்கப்பட்டார்';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" பயனர் இயக்கப்பட்டார்';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'பயனர் கொள்கையைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminUsersLoadFailed => 'பயனர்களை ஏற்றுவதில் தோல்வி';

  @override
  String get adminSearchUsers => 'பயனர்களைத் தேடுங்கள்';

  @override
  String get adminEditUser => 'பயனரைத் திருத்து';

  @override
  String get adminAddUser => 'பயனரைச் சேர்க்கவும்';

  @override
  String adminUserCreateFailed(String error) {
    return 'பயனரை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get adminCreateUser => 'பயனரை உருவாக்கவும்';

  @override
  String get adminPasswordOptional => 'கடவுச்சொல் (விரும்பினால்)';

  @override
  String get adminUsernameRequired => 'பயனர் பெயர் காலியாக இருக்கக்கூடாது';

  @override
  String get adminNoProfileChanges => 'சேமிக்க சுயவிவர மாற்றங்கள் இல்லை';

  @override
  String get adminProfileSaved => 'சுயவிவரம் சேமிக்கப்பட்டது';

  @override
  String adminSaveFailed(String error) {
    return 'சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get adminPermissionsSaved => 'அனுமதிகள் சேமிக்கப்பட்டன';

  @override
  String get adminPasswordsMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String adminFailed(String error) {
    return 'தோல்வி: $error';
  }

  @override
  String get adminUserLoadFailed => 'பயனரை ஏற்ற முடியவில்லை';

  @override
  String get adminBackToUsers => 'பயனர்களுக்குத் திரும்பு';

  @override
  String get adminSaveProfile => 'சுயவிவரத்தை சேமிக்கவும்';

  @override
  String get adminDeleteUser => 'பயனரை நீக்கு';

  @override
  String get admin => 'நிர்வாகி';

  @override
  String get adminFullAccessWarning =>
      'நிர்வாகிகளுக்கு சேவையகத்திற்கான முழுமையான அணுகல் உள்ளது. எச்சரிக்கையுடன் வழங்கவும்.';

  @override
  String get administrator => 'நிர்வாகி';

  @override
  String get adminHiddenUser => 'மறைக்கப்பட்ட பயனர்';

  @override
  String get adminAllowMediaPlayback => 'மீடியா பிளேபேக்கை அனுமதிக்கவும்';

  @override
  String get adminAllowAudioTranscoding =>
      'ஆடியோ டிரான்ஸ்கோடிங்கை அனுமதிக்கவும்';

  @override
  String get adminAllowVideoTranscoding =>
      'வீடியோ டிரான்ஸ்கோடிங்கை அனுமதிக்கவும்';

  @override
  String get adminAllowRemuxing => 'ரீமக்ஸ் செய்வதை அனுமதிக்கவும்';

  @override
  String get adminForceRemoteTranscoding =>
      'ரிமோட் சோர்ஸ் டிரான்ஸ்கோடிங்கை கட்டாயப்படுத்தவும்';

  @override
  String get adminAllowContentDeletion => 'உள்ளடக்கத்தை நீக்க அனுமதி';

  @override
  String get adminAllowContentDownloading =>
      'உள்ளடக்கத்தைப் பதிவிறக்க அனுமதிக்கவும்';

  @override
  String get adminAllowPublicSharing => 'பொதுப் பகிர்வை அனுமதிக்கவும்';

  @override
  String get adminAllowRemoteControl =>
      'பிற பயனர்களின் ரிமோட் கண்ட்ரோலை அனுமதிக்கவும்';

  @override
  String get adminAllowSharedDeviceControl =>
      'பகிரப்பட்ட சாதனக் கட்டுப்பாட்டை அனுமதிக்கவும்';

  @override
  String get adminAllowRemoteAccess => 'தொலைநிலை அணுகலை அனுமதிக்கவும்';

  @override
  String get adminRemoteBitrateLimit =>
      'ரிமோட் கிளையன்ட் பிட்ரேட் வரம்பு (பிபிஎஸ்)';

  @override
  String get adminLeaveEmptyNoLimit => 'வரம்பு இல்லாமல் காலியாக விடவும்';

  @override
  String get adminMaxActiveSessions => 'அதிகபட்ச செயலில் அமர்வுகள்';

  @override
  String get adminAllowLiveTvAccess => 'நேரடி டிவி அணுகலை அனுமதிக்கவும்';

  @override
  String get adminAllowLiveTvManagement =>
      'நேரலை டிவி நிர்வாகத்தை அனுமதிக்கவும்';

  @override
  String get adminAllowCollectionManagement =>
      'சேகரிப்பு நிர்வாகத்தை அனுமதிக்கவும்';

  @override
  String get adminAllowSubtitleManagement => 'வசன நிர்வாகத்தை அனுமதிக்கவும்';

  @override
  String get adminAllowLyricManagement => 'பாடல் நிர்வாகத்தை அனுமதிக்கவும்';

  @override
  String get adminSavePermissions => 'அனுமதிகளைச் சேமிக்கவும்';

  @override
  String get adminEnableAllLibraryAccess =>
      'அனைத்து நூலகங்களுக்கும் அணுகலை இயக்கவும்';

  @override
  String get adminSaveAccess => 'அணுகலைச் சேமிக்கவும்';

  @override
  String get adminChangePassword => 'கடவுச்சொல்லை மாற்றவும்';

  @override
  String get adminNewPassword => 'புதிய கடவுச்சொல்';

  @override
  String get adminConfirmPassword => 'கடவுச்சொல்லை உறுதிப்படுத்தவும்';

  @override
  String get adminSetPassword => 'கடவுச்சொல்லை அமைக்கவும்';

  @override
  String get adminResetPassword => 'கடவுச்சொல்லை மீட்டமைக்கவும்';

  @override
  String get adminPasswordReset => 'கடவுச்சொல் மீட்டமைப்பு';

  @override
  String get adminPasswordUpdated => 'கடவுச்சொல் புதுப்பிக்கப்பட்டது';

  @override
  String get adminUserSettings => 'பயனர் அமைப்புகள்';

  @override
  String get adminLibraryAccess => 'நூலக அணுகல்';

  @override
  String get adminDeviceAndChannelAccess => 'சாதனம் மற்றும் சேனல் அணுகல்';

  @override
  String get adminEnableAllDevices => 'எல்லா சாதனங்களுக்கும் அணுகலை இயக்கவும்';

  @override
  String get adminEnableAllChannels => 'எல்லா சேனல்களுக்கும் அணுகலை இயக்கவும்';

  @override
  String get adminParentalControl => 'பெற்றோர் கட்டுப்பாடு';

  @override
  String get adminMaxParentalRating =>
      'அனுமதிக்கப்பட்ட அதிகபட்ச பெற்றோர் மதிப்பீடு';

  @override
  String get adminMaxParentalRatingHint =>
      'அதிக மதிப்பீடு கொண்ட உள்ளடக்கம் இந்தப் பயனரிடமிருந்து மறைக்கப்படும்.';

  @override
  String get adminParentalRatingNone => 'எதுவுமில்லை';

  @override
  String get adminBlockUnratedItems =>
      'மதிப்பீட்டுத் தகவல் இல்லாத அல்லது அடையாளம் காணப்படாத உருப்படிகளைத் தடு';

  @override
  String get adminUnratedBook => 'புத்தகங்கள்';

  @override
  String get adminUnratedChannelContent => 'சேனல்கள்';

  @override
  String get adminUnratedLiveTvChannel => 'நேரலை டிவி';

  @override
  String get adminUnratedMovie => 'திரைப்படங்கள்';

  @override
  String get adminUnratedMusic => 'இசை';

  @override
  String get adminUnratedTrailer => 'டிரெய்லர்கள்';

  @override
  String get adminUnratedSeries => 'நிகழ்ச்சிகள்';

  @override
  String get adminAccessSchedules => 'அணுகல் அட்டவணைகள்';

  @override
  String get adminAccessSchedulesHint =>
      'கீழே உள்ள திட்டமிட்ட நேரங்களில் மட்டும் அணுகலை அனுமதிக்கும். அட்டவணை எதுவும் அமைக்கப்படாதபோது நாள் முழுவதும் அணுகல் அனுமதிக்கப்படும்.';

  @override
  String get adminAddSchedule => 'அட்டவணையைச் சேர்';

  @override
  String get adminScheduleDay => 'நாள்';

  @override
  String get adminScheduleStart => 'தொடக்கம்';

  @override
  String get adminScheduleEnd => 'முடிவு';

  @override
  String get adminDayEveryday => 'தினமும்';

  @override
  String get adminDayWeekday => 'வார நாள்';

  @override
  String get adminDayWeekend => 'வார இறுதி';

  @override
  String get adminDaySunday => 'ஞாயிறு';

  @override
  String get adminDayMonday => 'திங்கள்';

  @override
  String get adminDayTuesday => 'செவ்வாய்';

  @override
  String get adminDayWednesday => 'புதன்';

  @override
  String get adminDayThursday => 'வியாழன்';

  @override
  String get adminDayFriday => 'வெள்ளி';

  @override
  String get adminDaySaturday => 'சனி';

  @override
  String get adminAllowedTags => 'அனுமதிக்கப்பட்ட குறிச்சொற்கள்';

  @override
  String get adminAllowedTagsHint =>
      'இந்தக் குறிச்சொற்கள் கொண்ட உள்ளடக்கம் மட்டுமே காட்டப்படும். அனைத்தையும் அனுமதிக்க காலியாக விடவும்.';

  @override
  String get adminBlockedTags => 'தடுக்கப்பட்ட குறிச்சொற்கள்';

  @override
  String get adminBlockedTagsHint =>
      'இந்தக் குறிச்சொற்கள் கொண்ட உள்ளடக்கம் இந்தப் பயனரிடமிருந்து மறைக்கப்படும்.';

  @override
  String get adminAddTag => 'குறிச்சொல்லைச் சேர்';

  @override
  String get adminEnabledDevices => 'இயக்கப்பட்ட சாதனங்கள்';

  @override
  String get adminEnabledChannels => 'இயக்கப்பட்ட சேனல்கள்';

  @override
  String get adminAuthProvider => 'அங்கீகார வழங்குநர்';

  @override
  String get adminPasswordResetProvider => 'கடவுச்சொல் மீட்டமைப்பு வழங்குநர்';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'பூட்டுவதற்கு முன் அதிகபட்ச தோல்வியுற்ற உள்நுழைவு முயற்சிகள்';

  @override
  String get adminLoginAttemptsHint =>
      'இயல்புநிலைக்கு 0 எனவும், பூட்டுதலை முடக்க -1 எனவும் அமைக்கவும்.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay அணுகல்';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'குழுக்களை உருவாக்கவும் சேரவும் அனுமதி';

  @override
  String get adminSyncPlayJoin => 'குழுக்களில் சேர அனுமதி';

  @override
  String get adminSyncPlayNone => 'அணுகல் இல்லை';

  @override
  String get adminContentDeletionFolders =>
      'இதிலிருந்து உள்ளடக்க நீக்கத்தை அனுமதி';

  @override
  String get adminResetPasswordWarning =>
      'இது கடவுச்சொல்லை நீக்கிவிடும். கடவுச்சொல் இல்லாமல் பயனர் உள்நுழைய முடியும்.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'சர்வர் HTTP $status ஐத் திருப்பியது';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name ஐ நிச்சயமாக நீக்க வேண்டுமா?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" பயனர் நீக்கப்பட்டார்';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'பயனரை நீக்க முடியவில்லை: $error';
  }

  @override
  String get adminCreateApiKey => 'API விசையை உருவாக்கவும்';

  @override
  String get adminAppName => 'பயன்பாட்டின் பெயர்';

  @override
  String get adminApiKeyCreated => 'API விசை உருவாக்கப்பட்டது';

  @override
  String get adminApiKeyCreatedNoToken =>
      'விசை வெற்றிகரமாக உருவாக்கப்பட்டது. சர்வர் டோக்கனை திருப்பி தரவில்லை. சேவையக API விசைகளைச் சரிபார்க்கவும்.';

  @override
  String get adminKeyCopied => 'கிளிப்போர்டுக்கு விசை நகலெடுக்கப்பட்டது';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'விசையை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get adminKeyTokenMissing => 'சர்வர் பதிலில் முக்கிய டோக்கன் இல்லை';

  @override
  String get adminRevokeApiKey => 'API விசையை ரத்துசெய்';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name க்கான விசையைத் திரும்பப் பெறவா?';
  }

  @override
  String get adminApiKeyRevoked => 'API விசை திரும்பப் பெறப்பட்டது';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'விசையைத் திரும்பப் பெற முடியவில்லை: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API விசைகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminApiKeysTitle => 'API விசைகள்';

  @override
  String get adminCreateKey => 'விசையை உருவாக்கவும்';

  @override
  String get adminNoApiKeys => 'API விசைகள் எதுவும் இல்லை';

  @override
  String get adminUnknownApp => 'தெரியாத ஆப்';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'டோக்கன்: $token\\nஉருவாக்கப்பட்டது: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'காப்புப்பிரதி உருவாக்கு';

  @override
  String get adminBackupInclude =>
      'காப்புப்பிரதியில் எதைச் சேர்க்க வேண்டும் என்பதைத் தேர்வுசெய்யவும்.';

  @override
  String get adminBackupDatabase => 'தரவுத்தளம்';

  @override
  String get adminBackupDatabaseAlways => 'எப்போதும் சேர்க்கப்படும்';

  @override
  String get adminBackupMetadata => 'மெட்டாடேட்டா';

  @override
  String get adminBackupSubtitles => 'வசன வரிகள்';

  @override
  String get adminBackupTrickplay => 'Trickplay படங்கள்';

  @override
  String get adminCreatingBackup => 'காப்புப்பிரதியை உருவாக்குகிறது...';

  @override
  String get adminBackupCreated => 'காப்புப்பிரதி வெற்றிகரமாக உருவாக்கப்பட்டது';

  @override
  String adminBackupCreateFailed(String error) {
    return 'காப்புப்பிரதியை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get adminBackupPathMissing => 'சேவையக பதிலில் காப்புப் பாதை இல்லை';

  @override
  String adminBackupManifest(String name) {
    return 'மேனிஃபெஸ்ட்: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'மேனிஃபெஸ்டை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminConfirmRestore => 'மீட்டமைப்பை உறுதிப்படுத்தவும்';

  @override
  String get adminRestoringBackup => 'காப்புப்பிரதியை மீட்டெடுக்கிறது...';

  @override
  String adminRestoreFailed(String error) {
    return 'காப்புப்பிரதியை மீட்டெடுக்க முடியவில்லை: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'காப்புப்பிரதிகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminCreateBackup => 'காப்புப்பிரதியை உருவாக்கவும்';

  @override
  String get adminNoBackups => 'காப்புப்பிரதிகள் எதுவும் இல்லை';

  @override
  String get adminViewDetails => 'விவரங்களைக் காண்க';

  @override
  String get restore => 'மீட்டமை';

  @override
  String get adminLogsLoadFailed => 'சர்வர் பதிவுகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNoLogFiles => 'பதிவு கோப்புகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get adminLogCopied => 'பதிவு கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';

  @override
  String get adminSaveLogFile => 'பதிவு கோப்பை சேமிக்கவும்';

  @override
  String adminSavedTo(String path) {
    return '$path இல் சேமிக்கப்பட்டது';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'கோப்பைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName ஐ ஏற்ற முடியவில்லை';
  }

  @override
  String get adminSearchInLog => 'பதிவில் தேடவும்';

  @override
  String get adminNoMatchingLines => 'பொருந்தக்கூடிய கோடுகள் இல்லை';

  @override
  String adminTasksLoadFailed(String error) {
    return 'பணிகளை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminNoScheduledTasks => 'திட்டமிடப்பட்ட பணிகள் எதுவும் இல்லை';

  @override
  String get adminNoTasksMatchFilter =>
      'தற்போதைய வடிப்பானுடன் எந்தப் பணியும் பொருந்தவில்லை';

  @override
  String adminTaskStartFailed(String error) {
    return 'பணியைத் தொடங்க முடியவில்லை: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'பணியை நிறுத்த முடியவில்லை: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'பணியை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminRunNow => 'இப்போது இயக்கவும்';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'தூண்டியை அகற்ற முடியவில்லை: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'தூண்டியைச் சேர்க்க முடியவில்லை: $error';
  }

  @override
  String get adminLastExecution => 'கடைசி மரணதண்டனை';

  @override
  String get adminTriggers => 'தூண்டுகிறது';

  @override
  String get adminAddTrigger => 'தூண்டுதலைச் சேர்க்கவும்';

  @override
  String get adminNoTriggers => 'தூண்டுதல்கள் எதுவும் உள்ளமைக்கப்படவில்லை';

  @override
  String get adminTriggerType => 'தூண்டுதல் வகை';

  @override
  String get adminTimeLimit => 'நேர வரம்பு (விரும்பினால்)';

  @override
  String get adminNoLimit => 'வரம்பு இல்லை';

  @override
  String adminHours(String hours) {
    return '$hours மணி நேரம்';
  }

  @override
  String get adminDayOfWeek => 'வாரத்தின் நாள்';

  @override
  String get adminSearchPlugins => 'செருகுநிரல்களைத் தேடு...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'செருகுநிரலை மாற்ற முடியவில்லை: $error';
  }

  @override
  String get adminUninstallPlugin => 'செருகுநிரலை நிறுவல் நீக்கவும்';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\" ஐ நிச்சயமாக நிறுவல் நீக்க வேண்டுமா?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'செருகுநிரலை நிறுவல் நீக்க முடியவில்லை: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'தொகுப்பை நிறுவ முடியவில்லை: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'புதுப்பிப்பை நிறுவ முடியவில்லை: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'செருகுநிரல்களை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'உங்கள் தேடலுடன் எந்த செருகுநிரல்களும் பொருந்தவில்லை';

  @override
  String get adminNoPluginsInstalled =>
      'செருகுநிரல்கள் எதுவும் நிறுவப்படவில்லை';

  @override
  String adminInstallUpdate(String version) {
    return 'புதுப்பிப்பை நிறுவு (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'பட்டியலை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'உங்கள் தேடலுக்குப் பொருத்தமான தொகுப்புகள் எதுவும் இல்லை';

  @override
  String get adminNoPackagesAvailable => 'தொகுப்புகள் இல்லை';

  @override
  String get adminExperimentalIntegration => 'பரிசோதனை ஒருங்கிணைப்பு';

  @override
  String get adminExperimentalWarning =>
      'செருகுநிரல் அமைப்புகளின் ஒருங்கிணைப்பு இன்னும் சோதனை நிலையில் உள்ளது. சில அமைப்புகளின் பக்கங்கள் சரியாக வழங்கப்படாமல் இருக்கலாம்.';

  @override
  String get continueAction => 'தொடரவும்';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'சர்வர் மறுதொடக்கத்திற்குப் பிறகு \"$name\" அகற்றப்படும்';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'நிறுவல் நீக்க முடியவில்லை: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" ஐ v$version க்குப் புதுப்பிக்கிறது...';
  }

  @override
  String get adminMissingAuthToken =>
      'அமைப்புகளைத் திறக்க முடியவில்லை: அங்கீகார டோக்கன் இல்லை.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'செருகுநிரலை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminPluginNotFound => 'செருகுநிரல் கிடைக்கவில்லை';

  @override
  String adminPluginVersion(String version) {
    return 'பதிப்பு $version';
  }

  @override
  String get adminEnablePlugin => 'செருகுநிரலை இயக்கு';

  @override
  String get adminPluginSettingsPage => 'செருகுநிரல் அமைப்புகள் பக்கம்';

  @override
  String get adminRevisionHistory => 'மீள்பார்வை வரலாறு';

  @override
  String get adminNoChangelog => 'சேஞ்ச்லாக் கிடைக்கவில்லை.';

  @override
  String get adminRemoveRepository => 'களஞ்சியத்தை அகற்று';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '\"$name\" ஐ நிச்சயமாக அகற்ற வேண்டுமா?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'களஞ்சியங்களைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'களஞ்சியங்களை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminRepositoryNameHint => 'எ.கா. Jellyfin நிலையானது';

  @override
  String get adminRepositoryUrl => 'களஞ்சிய URL';

  @override
  String get adminAddEntry => 'உள்ளீட்டைச் சேர்க்கவும்';

  @override
  String get adminInvalidUrl => 'தவறான URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'செருகுநிரல் அமைப்புகளை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ஐத் திறக்க முடியவில்லை';
  }

  @override
  String get adminOpenInBrowser => 'உலாவியில் திறக்கவும்';

  @override
  String get adminOpenExternally => 'வெளிப்புறமாக திறக்கவும்';

  @override
  String get adminGeneralSettings => 'பொது அமைப்புகள்';

  @override
  String get adminServerName => 'சர்வர் பெயர்';

  @override
  String get adminPreferredMetadataCountry => 'விருப்பமான மெட்டாடேட்டா நாடு';

  @override
  String get adminCachePath => 'கேச் பாதை';

  @override
  String get adminMetadataPath => 'மெட்டாடேட்டா பாதை';

  @override
  String get adminLibraryScanConcurrency => 'லைப்ரரி ஸ்கேன் ஒத்திசைவு';

  @override
  String get adminParallelImageEncodingLimit => 'இணையான பட குறியாக்க வரம்பு';

  @override
  String get adminSlowResponseThreshold => 'மெதுவான மறுமொழி வரம்பு (மிவி)';

  @override
  String get adminBrandingSaved => 'பிராண்டிங் அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminBrandingLoadFailed =>
      'பிராண்டிங் அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminLoginDisclaimer => 'உள்நுழைவு மறுப்பு';

  @override
  String get adminLoginDisclaimerHint =>
      'உள்நுழைவு படிவத்தின் கீழே HTML காட்டப்படும்';

  @override
  String get adminCustomCss => 'தனிப்பயன் CSS';

  @override
  String get adminCustomCssHint =>
      'தனிப்பயன் CSS இணைய இடைமுகத்தில் பயன்படுத்தப்பட்டது';

  @override
  String get adminEnableSplashScreen => 'ஸ்பிளாஸ் திரையை இயக்கவும்';

  @override
  String get adminStreamingSaved => 'ஸ்ட்ரீமிங் அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminStreamingLoadFailed =>
      'ஸ்ட்ரீமிங் அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminStreamingDescription =>
      'தொலைநிலை இணைப்புகளுக்கு உலகளாவிய ஸ்ட்ரீமிங் பிட்ரேட் வரம்புகளை அமைக்கவும்.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'ரிமோட் கிளையன்ட் பிட்ரேட் வரம்பு (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'வரம்பற்றதாக காலியாக அல்லது 0 ஐ விடவும்';

  @override
  String get adminPlaybackSaved => 'பின்னணி அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminPlaybackLoadFailed => 'பின்னணி அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminPlaybackTranscoding => 'பிளேபேக் / டிரான்ஸ்கோடிங்';

  @override
  String get adminHardwareAcceleration => 'வன்பொருள் முடுக்கம்';

  @override
  String get adminVaapiDevice => 'VA-API சாதனம்';

  @override
  String get adminEnableHardwareEncoding => 'வன்பொருள் குறியாக்கத்தை இயக்கு';

  @override
  String get adminEnableHardwareDecoding => 'வன்பொருள் டிகோடிங்கை இயக்கு:';

  @override
  String get adminEncodingThreads => 'என்கோடிங் நூல்கள்';

  @override
  String get adminAutomatic => '0 = தானியங்கி';

  @override
  String get adminTranscodingTempPath => 'டிரான்ஸ்கோடிங் டெம்ப் பாதை';

  @override
  String get adminEnableFallbackFont => 'ஃபால்பேக் எழுத்துருவை இயக்கு';

  @override
  String get adminFallbackFontPath => 'ஃபால்பேக் எழுத்துரு பாதை';

  @override
  String get adminAllowSegmentDeletion => 'பிரிவை நீக்க அனுமதி';

  @override
  String get adminSegmentKeepSeconds => 'பிரிவு வைத்திருத்தல் (வினாடிகள்)';

  @override
  String get adminThrottleBuffering => 'த்ரோட்டில் பஃபரிங்';

  @override
  String get adminTrickplaySaved => 'Trickplay அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay அமைப்புகளை ஏற்ற முடியவில்லை';

  @override
  String get adminEnableHardwareAcceleration => 'வன்பொருள் முடுக்கத்தை இயக்கு';

  @override
  String get adminEnableKeyFrameExtraction =>
      'விசை சட்டத்தை மட்டும் பிரித்தெடுப்பதை இயக்கு';

  @override
  String get adminKeyFrameSubtitle => 'வேகமான ஆனால் குறைவான துல்லியம்';

  @override
  String get adminScanBehavior => 'ஸ்கேன் நடத்தை';

  @override
  String get adminProcessPriority => 'செயல்முறை முன்னுரிமை';

  @override
  String get adminImageSettings => 'பட அமைப்புகள்';

  @override
  String get adminIntervalMs => 'இடைவெளி (மிவி)';

  @override
  String get adminCaptureFrameSubtitle =>
      'பிரேம்களை எவ்வளவு அடிக்கடி பிடிக்க வேண்டும்';

  @override
  String get adminWidthResolutions => 'அகலத் தீர்மானங்கள்';

  @override
  String get adminTileWidth => 'ஓடு அகலம்';

  @override
  String get adminTileHeight => 'ஓடு உயரம்';

  @override
  String get adminQualitySubtitle =>
      'குறைந்த மதிப்புகள் = சிறந்த தரம், பெரிய கோப்புகள்';

  @override
  String get adminProcessThreads => 'செயல்முறை நூல்கள்';

  @override
  String get adminResumeSaved => 'ரெஸ்யூம் அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminResumeLoadFailed => 'ரெஸ்யூம் அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminResumeDescription =>
      'உள்ளடக்கம் பகுதியளவு விளையாடியதாக அல்லது முழுமையாக இயக்கப்பட்டதாக எப்போது குறிக்கப்பட வேண்டும் என்பதை உள்ளமைக்கவும்.';

  @override
  String get adminMinResumePercentage => 'குறைந்தபட்ச விண்ணப்பம் சதவீதம்';

  @override
  String get adminMinResumeSubtitle =>
      'முன்னேற்றத்தைச் சேமிக்க, உள்ளடக்கம் இந்த சதவீதத்தைத் தாண்டி விளையாட வேண்டும்';

  @override
  String get adminMaxResumePercentage => 'அதிகபட்ச ரெஸ்யூம் சதவீதம்';

  @override
  String get adminMaxResumeSubtitle =>
      'இந்த சதவீதத்திற்குப் பிறகு உள்ளடக்கம் முழுமையாக விளையாடியதாகக் கருதப்படுகிறது';

  @override
  String get adminMinResumeDuration => 'குறைந்தபட்ச விண்ணப்ப காலம் (வினாடிகள்)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'இதை விடக் குறைவான பொருட்களை மீண்டும் தொடங்க முடியாது';

  @override
  String get adminMinAudiobookResume =>
      'குறைந்தபட்ச ஆடியோபுக் ரெஸ்யூம் சதவீதம்';

  @override
  String get adminMaxAudiobookResume => 'அதிகபட்ச ஆடியோபுக் ரெஸ்யூம் சதவீதம்';

  @override
  String get adminNetworkingSaved =>
      'நெட்வொர்க்கிங் அமைப்புகள் சேமிக்கப்பட்டன. சர்வர் மறுதொடக்கம் தேவைப்படலாம்.';

  @override
  String get adminNetworkingLoadFailed =>
      'நெட்வொர்க்கிங் அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNetworkingWarning =>
      'நெட்வொர்க்கிங் அமைப்புகளில் மாற்றங்களுக்கு சர்வர் மறுதொடக்கம் தேவைப்படலாம்.';

  @override
  String get adminEnableRemoteAccess => 'தொலைநிலை அணுகலை இயக்கு';

  @override
  String get ports => 'துறைமுகங்கள்';

  @override
  String get adminHttpPort => 'HTTP போர்ட்';

  @override
  String get adminHttpsPort => 'HTTPS போர்ட்';

  @override
  String get adminPublicHttpsPort => 'பொது HTTPS போர்ட்';

  @override
  String get adminBaseUrl => 'அடிப்படை URL';

  @override
  String get adminBaseUrlHint => 'எ.கா. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS ஐ இயக்கவும்';

  @override
  String get adminLocalNetwork => 'உள்ளூர் நெட்வொர்க்';

  @override
  String get adminLocalNetworkAddresses => 'உள்ளூர் நெட்வொர்க் முகவரிகள்';

  @override
  String get adminKnownProxies => 'அறியப்பட்ட பிரதிநிதிகள்';

  @override
  String get adminRemoteIpFilter => 'ரிமோட் ஐபி வடிகட்டி';

  @override
  String get adminRemoteIpFilterEntries => 'ரிமோட் ஐபி வடிகட்டி';

  @override
  String get adminCertificatePath => 'சான்றிதழ் பாதை';

  @override
  String get whitelist => 'ஏற்புப்பட்டியல்';

  @override
  String get blacklist => 'தடுப்புப்பட்டியல்';

  @override
  String get notSet => 'அமைக்கப்படவில்லை';

  @override
  String get adminMetadataSaved => 'மெட்டாடேட்டா சேமிக்கப்பட்டது';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'மெட்டாடேட்டாவை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'மெட்டாடேட்டாவைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get adminRefreshMetadata => 'மெட்டாடேட்டாவைப் புதுப்பிக்கவும்';

  @override
  String get recursive => 'சுழல்நிலை';

  @override
  String get adminReplaceAllMetadata => 'அனைத்து மெட்டாடேட்டாவையும் மாற்றவும்';

  @override
  String get adminReplaceAllImages => 'அனைத்து படங்களையும் மாற்றவும்';

  @override
  String get adminMetadataRefreshRequested =>
      'மெட்டாடேட்டா புதுப்பித்தல் கோரப்பட்டது';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'மெட்டாடேட்டாவைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ரிமோட் பொருத்தங்கள் எதுவும் இல்லை';

  @override
  String get adminRemoteResults => 'தொலைநிலை முடிவுகள்';

  @override
  String get adminRemoteMetadataApplied =>
      'தொலைநிலை மெட்டாடேட்டா பயன்படுத்தப்பட்டது';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'தொலைநிலைத் தேடல் தோல்வியடைந்தது: $error';
  }

  @override
  String get adminUpdateContentType => 'உள்ளடக்க வகையைப் புதுப்பிக்கவும்';

  @override
  String get adminContentType => 'உள்ளடக்க வகை';

  @override
  String get adminContentTypeUpdated => 'உள்ளடக்க வகை புதுப்பிக்கப்பட்டது';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'உள்ளடக்க வகையைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'மெட்டாடேட்டா எடிட்டரை ஏற்றுவதில் தோல்வி';

  @override
  String get adminNoPeopleEntries => 'மக்கள் உள்ளீடுகள் இல்லை';

  @override
  String get adminNoExternalIds => 'வெளிப்புற அடையாளங்கள் எதுவும் இல்லை';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType படம் புதுப்பிக்கப்பட்டது';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'படத்தைப் பதிவிறக்க முடியவில்லை: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ஆதரிக்கப்படாத பட வடிவம்';

  @override
  String get adminImageReadFailed =>
      'தேர்ந்தெடுக்கப்பட்ட படத்தைப் படிக்க முடியவில்லை';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType படம் பதிவேற்றப்பட்டது';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'படத்தைப் பதிவேற்ற முடியவில்லை: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType படத்தை நீக்கு';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType படம் நீக்கப்பட்டது';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'படத்தை நீக்க முடியவில்லை: $error';
  }

  @override
  String get adminAllProviders => 'அனைத்து வழங்குநர்கள்';

  @override
  String get adminNoRemoteImages => 'தொலை படங்கள் எதுவும் இல்லை';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'டியூனர் கண்டுபிடிப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String get adminAddTuner => 'ட்யூனரைச் சேர்க்கவும்';

  @override
  String get adminEditTuner => 'டியூனரைத் திருத்து';

  @override
  String get adminTunerTypeM3u => 'M3U டியூனர்';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'கோப்பு அல்லது URL';

  @override
  String get adminTunerIpAddress => 'டியூனர் IP முகவரி';

  @override
  String get adminTunerFriendlyName => 'எளிய பெயர்';

  @override
  String get adminTunerUserAgent => 'பயனர் ஏஜென்ட்';

  @override
  String get adminTunerCount => 'ஒரே நேரத்தில் இணைப்பு வரம்பு';

  @override
  String get adminTunerCountHelp =>
      'டியூனர் ஒரே நேரத்தில் அனுமதிக்கும் அதிகபட்ச ஸ்ட்ரீம்களின் எண்ணிக்கை. வரம்பின்றி இருக்க 0 என அமைக்கவும்.';

  @override
  String get adminTunerFallbackBitrate => 'மாற்று அதிகபட்ச ஸ்ட்ரீமிங் பிட்ரேட்';

  @override
  String get adminTunerImportFavoritesOnly =>
      'பிடித்த சேனல்களை மட்டும் இறக்குமதி செய்';

  @override
  String get adminTunerAllowHwTranscoding =>
      'வன்பொருள் டிரான்ஸ்கோடிங்கை அனுமதி';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 டிரான்ஸ்கோடிங் கண்டெய்னரை அனுமதி';

  @override
  String get adminTunerAllowStreamSharing => 'ஸ்ட்ரீம் பகிர்வை அனுமதி';

  @override
  String get adminTunerEnableStreamLooping => 'ஸ்ட்ரீம் லூப்பிங்கை இயக்கு';

  @override
  String get adminTunerIgnoreDts => 'DTS ஐப் புறக்கணி';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'உள்ளீட்டை நேட்டிவ் ஃபிரேம் ரேட்டில் படி';

  @override
  String get adminEditProvider => 'வழங்குநரைத் திருத்து';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'கோப்பு அல்லது URL';

  @override
  String get adminXmltvMoviePrefix => 'திரைப்பட முன்னொட்டு';

  @override
  String get adminXmltvMovieCategories => 'திரைப்பட வகைகள்';

  @override
  String get adminXmltvCategoriesHelp =>
      'பல வகைகளைச் செங்குத்துக் கோட்டால் பிரிக்கவும்.';

  @override
  String get adminXmltvKidsCategories => 'குழந்தைகள் வகைகள்';

  @override
  String get adminXmltvNewsCategories => 'செய்தி வகைகள்';

  @override
  String get adminXmltvSportsCategories => 'விளையாட்டு வகைகள்';

  @override
  String get adminSdUsername => 'பயனர் பெயர்';

  @override
  String get adminSdPassword => 'கடவுச்சொல்';

  @override
  String get adminSdCountry => 'நாடு';

  @override
  String get adminSdCountrySelect => 'ஒரு நாட்டைத் தேர்ந்தெடுக்கவும்';

  @override
  String get adminSdPostalCode => 'அஞ்சல் குறியீடு';

  @override
  String get adminSdGetListings => 'பட்டியல்களைப் பெறு';

  @override
  String get adminSdListings => 'பட்டியல்கள்';

  @override
  String get adminEnableAllTuners => 'எல்லா டியூனர்களையும் இயக்கு';

  @override
  String get adminTunerType => 'ட்யூனர் வகை';

  @override
  String get adminTunerAdded => 'ட்யூனர் சேர்க்கப்பட்டது';

  @override
  String adminTunerAddFailed(String error) {
    return 'டியூனரைச் சேர்க்க முடியவில்லை: $error';
  }

  @override
  String get adminAddGuideProvider => 'வழிகாட்டி வழங்குநரைச் சேர்க்கவும்';

  @override
  String get adminProviderType => 'வழங்குநர் வகை';

  @override
  String get adminProviderAdded => 'வழங்குநர் சேர்க்கப்பட்டார்';

  @override
  String adminProviderAddFailed(String error) {
    return 'வழங்குநரைச் சேர்க்க முடியவில்லை: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'டியூனரை அகற்ற முடியவில்லை: $error';
  }

  @override
  String get adminTunerResetRequested => 'ட்யூனர் மீட்டமைப்பு கோரப்பட்டது';

  @override
  String adminTunerResetFailed(String error) {
    return 'டியூனரை மீட்டமைக்க முடியவில்லை: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'இந்த டியூனர் வகை மீட்டமைப்பை ஆதரிக்கவில்லை.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'வழங்குநரை அகற்ற முடியவில்லை: $error';
  }

  @override
  String get adminRecordingSettings => 'பதிவு அமைப்புகள்';

  @override
  String get adminPrePadding => 'முன் திணிப்பு (நிமிடங்கள்)';

  @override
  String get adminPostPadding => 'போஸ்ட்-பேடிங் (நிமிடங்கள்)';

  @override
  String get adminRecordingPath => 'பதிவு செய்யும் பாதை';

  @override
  String get adminSeriesRecordingPath => 'தொடர் பதிவு பாதை';

  @override
  String get adminMovieRecordingPath => 'திரைப்படப் பதிவுப் பாதை';

  @override
  String get adminGuideDays => 'வழிகாட்டி தரவு நாட்கள்';

  @override
  String get adminGuideDaysAuto => 'தானியங்கி';

  @override
  String adminGuideDaysValue(int days) {
    return '$days நாட்கள்';
  }

  @override
  String get adminRecordingPostProcessor =>
      'பிந்தைய செயலாக்கப் பயன்பாட்டுப் பாதை';

  @override
  String get adminRecordingPostProcessorArgs => 'பிந்தைய செயலாக்கி அளபுருக்கள்';

  @override
  String get adminSaveRecordingNfo => 'பதிவின் NFO மெட்டாடேட்டாவைச் சேமி';

  @override
  String get adminSaveRecordingImages => 'பதிவின் படங்களைச் சேமி';

  @override
  String get adminLiveTvSectionTiming => 'நேரம்';

  @override
  String get adminLiveTvSectionPaths => 'பதிவுப் பாதைகள்';

  @override
  String get adminLiveTvSectionPostProcessing => 'பிந்தைய செயலாக்கம்';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'வழிகாட்டி தரவு: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'பதிவு அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'அமைப்புகளைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get adminSetChannelMappings => 'சேனல் மேப்பிங்கை அமைக்கவும்';

  @override
  String get adminMappingJson => 'JSON மேப்பிங்';

  @override
  String get adminMappingJsonHint => 'எடுத்துக்காட்டு: மேப்பிங்ஸ் JSON பேலோட்';

  @override
  String get adminChannelMappingsUpdated =>
      'சேனல் மேப்பிங் புதுப்பிக்கப்பட்டது';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'மேப்பிங்குகளைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'நேரலை டிவி நிர்வாகத்தை ஏற்றுவதில் தோல்வி';

  @override
  String get adminTunerDevices => 'ட்யூனர் சாதனங்கள்';

  @override
  String get adminNoTunerHosts =>
      'ட்யூனர் ஹோஸ்ட்கள் எதுவும் உள்ளமைக்கப்படவில்லை';

  @override
  String get adminGuideProviders => 'வழிகாட்டி வழங்குநர்கள்';

  @override
  String get adminRefreshGuideData => 'வழிகாட்டி தரவைப் புதுப்பி';

  @override
  String get adminGuideRefreshStarted =>
      'வழிகாட்டி தரவுப் புதுப்பிப்பு தொடங்கியது';

  @override
  String get adminGuideRefreshUnavailable =>
      'இந்த சர்வரில் வழிகாட்டி புதுப்பிப்புப் பணி கிடைக்கவில்லை.';

  @override
  String get adminAddProvider => 'வழங்குநரைச் சேர்க்கவும்';

  @override
  String get adminNoListingProviders =>
      'பட்டியல் வழங்குநர்கள் எதுவும் உள்ளமைக்கப்படவில்லை';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'பதிவுப் பாதை: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'தொடர்ப் பாதை: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'முன் இடைவெளி: $minutes நிமி';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'பின் இடைவெளி: $minutes நிமி';
  }

  @override
  String get adminTunerDiscovery => 'ட்யூனர் கண்டுபிடிப்பு';

  @override
  String get adminChannelMappings => 'சேனல் மேப்பிங்ஸ்';

  @override
  String get adminNoDiscoveredTuners =>
      'இதுவரை கண்டுபிடிக்கப்பட்ட ட்யூனர்கள் இல்லை';

  @override
  String get adminSettingsSaved => 'அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminBackupsNotAvailable =>
      'இந்த சர்வர் கட்டமைப்பில் காப்புப்பிரதிகள் கிடைக்காது.';

  @override
  String get adminRestoreWarning1 =>
      'மீட்டெடுப்பது அனைத்து தற்போதைய சேவையகத் தரவையும் காப்புப் பிரதி தரவுடன் மாற்றும்.';

  @override
  String get adminRestoreWarning2 =>
      'தற்போதைய சேவையக அமைப்புகள், பயனர்கள் மற்றும் நூலகத் தரவு மேலெழுதப்படும்.';

  @override
  String get adminRestoreWarning3 =>
      'மறுசீரமைக்கப்பட்ட பிறகு சேவையகம் மறுதொடக்கம் செய்யப்படும்.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name காப்புப்பிரதியை இப்போது மீட்டெடுக்கவா?';
  }

  @override
  String get adminRestoreRequested =>
      'மீட்டமைக்க கோரப்பட்டது. சேவையக மறுதொடக்கம் இந்த அமர்வின் இணைப்பை துண்டிக்கலாம்.';

  @override
  String get adminBackupsTitle => 'காப்புப்பிரதிகள்';

  @override
  String get adminUnknownDate => 'தெரியாத தேதி';

  @override
  String get adminUnnamedBackup => 'பெயரிடப்படாத காப்புப்பிரதி';

  @override
  String get adminLiveTvNotAvailable =>
      'இந்த சர்வர் பில்டில் லைவ் டிவி நிர்வாகம் இல்லை.';

  @override
  String get adminLiveTvTitle => 'நேரடி தொலைக்காட்சி நிர்வாகம்';

  @override
  String get adminApply => 'பயன்படுத்து';

  @override
  String get adminNotSet => 'அமைக்கப்படவில்லை';

  @override
  String get adminReset => 'மீட்டமை';

  @override
  String get adminLogsTitle => 'சேவையக பதிவுகள்';

  @override
  String get adminLogsNewestFirst => 'புதியது முதலில்';

  @override
  String get adminLogsOldestFirst => 'பழமையான முதல்';

  @override
  String get adminLogsJustNow => 'இப்போதுதான்';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes நிமி முன்';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours மணி முன்';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days நாள் முன்';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName ஐ ஏற்ற முடியவில்லை';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count பொருத்தங்கள்';
  }

  @override
  String get adminLogViewerNoMatches => 'பொருந்தக்கூடிய கோடுகள் இல்லை';

  @override
  String get adminMetadataEditorTitle => 'மெட்டாடேட்டா எடிட்டர்';

  @override
  String get adminMetadataIdentify => 'அடையாளம் காண்';

  @override
  String get adminMetadataType => 'வகை';

  @override
  String get adminMetadataDetails => 'விவரங்கள்';

  @override
  String get adminMetadataExternalIds => 'வெளிப்புற அடையாளங்கள்';

  @override
  String get adminMetadataImages => 'படங்கள்';

  @override
  String get adminMetadataFieldTitle => 'தலைப்பு';

  @override
  String get adminMetadataFieldSortTitle => 'தலைப்பை வரிசைப்படுத்து';

  @override
  String get adminMetadataFieldOriginalTitle => 'அசல் தலைப்பு';

  @override
  String get adminMetadataFieldPremiereDate => 'பிரீமியர் தேதி (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'முடிவுத் தேதி (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'உற்பத்தி ஆண்டு';

  @override
  String get adminMetadataFieldOfficialRating => 'அதிகாரப்பூர்வ மதிப்பீடு';

  @override
  String get adminMetadataFieldCommunityRating => 'சமூக மதிப்பீடு';

  @override
  String get adminMetadataFieldCriticRating => 'விமர்சகர் மதிப்பீடு';

  @override
  String get adminMetadataFieldTagline => 'கோஷம்';

  @override
  String get adminMetadataFieldOverview => 'கண்ணோட்டம்';

  @override
  String get adminMetadataGenres => 'வகைகள்';

  @override
  String get adminMetadataTags => 'குறிச்சொற்கள்';

  @override
  String get adminMetadataStudios => 'ஸ்டுடியோக்கள்';

  @override
  String get adminMetadataPeople => 'மக்கள்';

  @override
  String get adminMetadataAddGenre => 'வகையைச் சேர்க்கவும்';

  @override
  String get adminMetadataAddTag => 'குறிச்சொல்லைச் சேர்க்கவும்';

  @override
  String get adminMetadataAddStudio => 'ஸ்டுடியோவைச் சேர்க்கவும்';

  @override
  String get adminMetadataAddPerson => 'நபரைச் சேர்க்கவும்';

  @override
  String get adminMetadataEditPerson => 'நபரைத் திருத்து';

  @override
  String get adminMetadataRole => 'பங்கு';

  @override
  String get adminMetadataImagePrimary => 'முதன்மை';

  @override
  String get adminMetadataImageBackdrop => 'பின்னணி';

  @override
  String get adminMetadataImageLogo => 'சின்னம்';

  @override
  String get adminMetadataImageBanner => 'பேனர்';

  @override
  String get adminMetadataImageThumb => 'கட்டைவிரல்';

  @override
  String get adminMetadataRecursive => 'சுழல்நிலை';

  @override
  String get adminMetadataProvider => 'வழங்குபவர்';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType படம் புதுப்பிக்கப்பட்டது';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType படம் பதிவேற்றப்பட்டது';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType படம் நீக்கப்பட்டது';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'படத்தைப் பதிவிறக்க முடியவில்லை: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'தேர்ந்தெடுக்கப்பட்ட படத்தைப் படிக்க முடியவில்லை';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'படத்தைப் பதிவேற்ற முடியவில்லை: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType படத்தை நீக்கு';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'இது உருப்படியிலிருந்து தற்போதைய படத்தை நீக்குகிறது.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'படத்தை நீக்க முடியவில்லை: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType படத்தைத் தேர்வுசெய்';
  }

  @override
  String get adminMetadataUpload => 'பதிவேற்றவும்';

  @override
  String get adminMetadataUpdate => 'புதுப்பிக்கவும்';

  @override
  String get adminMetadataRemoteImage => 'தொலை படம்';

  @override
  String get adminPluginsInstalled => 'நிறுவப்பட்டது';

  @override
  String get adminPluginsCatalog => 'பட்டியல்';

  @override
  String get adminPluginsActive => 'செயலில்';

  @override
  String get adminPluginsRestart => 'மறுதொடக்கம்';

  @override
  String get adminPluginsNoSearchResults =>
      'உங்கள் தேடலுடன் எந்த செருகுநிரல்களும் பொருந்தவில்லை';

  @override
  String get adminPluginsNoneInstalled =>
      'செருகுநிரல்கள் எதுவும் நிறுவப்படவில்லை';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'புதுப்பிப்பு கிடைக்கிறது: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'புதுப்பிப்பு கிடைக்கிறது';

  @override
  String get adminPluginsPendingRemoval =>
      'மறுதொடக்கம் செய்யப்பட்ட பிறகு அகற்றுதல் நிலுவையில் உள்ளது';

  @override
  String get adminPluginsChangesPending =>
      'மறுதொடக்கம் நிலுவையில் உள்ள மாற்றங்கள்';

  @override
  String get adminPluginsEnable => 'இயக்கு';

  @override
  String get adminPluginsDisable => 'முடக்கு';

  @override
  String get adminPluginsInstallUpdate => 'புதுப்பிப்பை நிறுவவும்';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'புதுப்பிப்பை நிறுவு (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'உங்கள் தேடலுக்குப் பொருத்தமான தொகுப்புகள் எதுவும் இல்லை';

  @override
  String get adminPluginsCatalogEmpty => 'தொகுப்புகள் இல்லை';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" நிறுவப்படுகிறது...';
  }

  @override
  String get adminPluginDetailExperimental => 'பரிசோதனை ஒருங்கிணைப்பு';

  @override
  String get adminPluginDetailExperimentalContent =>
      'செருகுநிரல் அமைப்புகளின் ஒருங்கிணைப்பு இன்னும் சோதனை நிலையில் உள்ளது. சில புலங்கள் அல்லது தளவமைப்புகள் இன்னும் சரியாக வழங்கப்படாமல் இருக்கலாம்.';

  @override
  String get adminPluginDetailToggle404 =>
      'செருகுநிரலை மாற்றுவதில் தோல்வி. இந்த செருகுநிரல் பதிப்பை சர்வரால் கண்டுபிடிக்க முடியவில்லை. செருகுநிரல்களைப் புதுப்பித்து, மீண்டும் முயற்சிக்கவும்.';

  @override
  String get adminPluginDetailToggleDioError =>
      'செருகுநிரலை மாற்றுவதில் தோல்வி. விவரங்களுக்கு சர்வர் பதிவுகளைப் பார்க்கவும்.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name அமைப்புகள்';
  }

  @override
  String get adminPluginDetailDetails => 'விவரங்கள்';

  @override
  String get adminPluginDetailDeveloper => 'டெவலப்பர்';

  @override
  String get adminPluginDetailRepository => 'களஞ்சியம்';

  @override
  String get adminPluginDetailBundled => 'தொகுக்கப்பட்டது';

  @override
  String get adminPluginDetailEnablePlugin => 'செருகுநிரலை இயக்கு';

  @override
  String get adminPluginDetailRestartRequired =>
      'மாற்றங்கள் நடைமுறைக்கு வர, சேவையகத்தை மறுதொடக்கம் செய்ய வேண்டும்.';

  @override
  String get adminPluginDetailRemovalPending =>
      'சேவையகத்தை மறுதொடக்கம் செய்த பிறகு இந்த செருகுநிரல் அகற்றப்படும்.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'இந்தச் செருகுநிரல் செயலிழந்து, சரியாக வேலை செய்யாமல் போகலாம்.';

  @override
  String get adminPluginDetailNotSupported =>
      'இந்த செருகுநிரலை தற்போதைய சர்வர் பதிப்பு ஆதரிக்கவில்லை.';

  @override
  String get adminPluginDetailSuperseded =>
      'இந்த செருகுநிரல் புதிய பதிப்பால் மாற்றப்பட்டது.';

  @override
  String adminReposLoadFailed(String error) {
    return 'களஞ்சியங்களை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get adminReposRemoveTitle => 'களஞ்சியத்தை அகற்று';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\" ஐ நிச்சயமாக அகற்ற வேண்டுமா?';
  }

  @override
  String get adminReposRemove => 'அகற்று';

  @override
  String adminReposSaveFailed(String error) {
    return 'களஞ்சியங்களைச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get adminReposEmpty => 'களஞ்சியங்கள் எதுவும் கட்டமைக்கப்படவில்லை';

  @override
  String get adminReposEmptySubtitle =>
      'கிடைக்கக்கூடிய செருகுநிரல்களை உலவ ஒரு களஞ்சியத்தைச் சேர்க்கவும்';

  @override
  String get adminReposUnnamed => '(பெயரிடப்படாத)';

  @override
  String get adminReposEditTitle => 'களஞ்சியத்தைத் திருத்து';

  @override
  String get adminReposAddTitle => 'களஞ்சியத்தைச் சேர்க்கவும்';

  @override
  String get adminReposUrl => 'களஞ்சிய URL';

  @override
  String get adminReposNameHint => 'எ.கா. Jellyfin நிலையானது';

  @override
  String get adminPluginSettingsInvalidUrl => 'தவறான URL';

  @override
  String get adminGeneralSettingsTitle => 'பொது அமைப்புகள்';

  @override
  String get adminGeneralMetadataLanguage => 'விருப்பமான மெட்டாடேட்டா மொழி';

  @override
  String get adminGeneralMetadataLanguageHint => 'எ.கா. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'விருப்பமான மெட்டாடேட்டா நாடு';

  @override
  String get adminGeneralMetadataCountryHint => 'எ.கா. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'லைப்ரரி ஸ்கேன் ஒத்திசைவு';

  @override
  String get adminGeneralImageEncodingLimit => 'இணையான பட குறியாக்க வரம்பு';

  @override
  String get adminUnknownError => 'அறியப்படாத பிழை';

  @override
  String get adminBrowse => 'உலாவவும்';

  @override
  String get adminCloseBrowser => 'உலாவியை மூடு';

  @override
  String get adminNetworkingTitle => 'நெட்வொர்க்கிங்';

  @override
  String get adminNetworkingRestartWarning =>
      'நெட்வொர்க்கிங் அமைப்புகளில் மாற்றங்களுக்கு சர்வர் மறுதொடக்கம் தேவைப்படலாம்.';

  @override
  String get adminNetworkingRemoteAccess => 'தொலைநிலை அணுகலை இயக்கு';

  @override
  String get adminNetworkingPorts => 'துறைமுகங்கள்';

  @override
  String get adminNetworkingHttpPort => 'HTTP போர்ட்';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS போர்ட்';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS ஐ இயக்கவும்';

  @override
  String get adminNetworkingLocalNetwork => 'உள்ளூர் நெட்வொர்க்';

  @override
  String get adminNetworkingLocalAddresses => 'உள்ளூர் நெட்வொர்க் முகவரிகள்';

  @override
  String get adminNetworkingAddressHint => 'எ.கா. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'அறியப்பட்ட பிரதிநிதிகள்';

  @override
  String get adminNetworkingProxyHint => 'எ.கா. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ஏற்புப்பட்டியல்';

  @override
  String get adminNetworkingBlacklist => 'தடுப்புப்பட்டியல்';

  @override
  String get adminNetworkingAddEntry => 'உள்ளீட்டைச் சேர்க்கவும்';

  @override
  String get adminBrandingTitle => 'பிராண்டிங்';

  @override
  String get adminBrandingLoginDisclaimer => 'உள்நுழைவு மறுப்பு';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'உள்நுழைவு படிவத்தின் கீழே HTML காட்டப்படும்';

  @override
  String get adminBrandingCustomCss => 'தனிப்பயன் CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'தனிப்பயன் CSS இணைய இடைமுகத்தில் பயன்படுத்தப்பட்டது';

  @override
  String get adminBrandingEnableSplash => 'ஸ்பிளாஸ் திரையை இயக்கவும்';

  @override
  String get adminBrandingSplashUpload => 'படத்தைப் பதிவேற்று';

  @override
  String get adminBrandingSplashUploaded => 'ஸ்பிளாஸ் திரை புதுப்பிக்கப்பட்டது';

  @override
  String get adminBrandingSplashUploadFailed =>
      'ஸ்பிளாஸ் திரையைப் பதிவேற்ற முடியவில்லை';

  @override
  String get adminBrandingSplashDeleted => 'ஸ்பிளாஸ் திரை அகற்றப்பட்டது';

  @override
  String get adminBrandingNoSplash => 'தனிப்பயன் ஸ்பிளாஸ் திரை இல்லை';

  @override
  String get adminPlaybackHwAccel => 'வன்பொருள் முடுக்கம்';

  @override
  String get adminPlaybackHwAccelLabel => 'வன்பொருள் முடுக்கம்';

  @override
  String get adminPlaybackEnableHwEncoding => 'வன்பொருள் குறியாக்கத்தை இயக்கு';

  @override
  String get adminPlaybackEnableHwDecoding => 'வன்பொருள் டிகோடிங்கை இயக்கு:';

  @override
  String get adminPlaybackQsvDevice => 'QSV சாதனம்';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'மேம்படுத்தப்பட்ட NVDEC டிகோடரை இயக்கு';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'சிஸ்டத்தின் நேட்டிவ் வன்பொருள் டிகோடரை விரும்பு';

  @override
  String get adminPlaybackColorDepth => 'வன்பொருள் டிகோடிங் வண்ண ஆழம்';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-பிட் HEVC டிகோடிங்';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-பிட் VP9 டிகோடிங்';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-பிட் டிகோடிங்';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-பிட் டிகோடிங்';

  @override
  String get adminPlaybackHwEncodingSection => 'வன்பொருள் என்கோடிங்';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC என்கோடிங்கை அனுமதி';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 என்கோடிங்கை அனுமதி';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel குறைந்த-ஆற்றல் H.264 என்கோடரை இயக்கு';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel குறைந்த-ஆற்றல் HEVC என்கோடரை இயக்கு';

  @override
  String get adminPlaybackToneMapping => 'டோன் மேப்பிங்';

  @override
  String get adminPlaybackEnableTonemapping => 'டோன் மேப்பிங்கை இயக்கு';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP டோன் மேப்பிங்கை இயக்கு';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox டோன் மேப்பிங்கை இயக்கு';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'டோன் மேப்பிங் அல்காரிதம்';

  @override
  String get adminPlaybackTonemappingMode => 'டோன் மேப்பிங் முறை';

  @override
  String get adminPlaybackTonemappingRange => 'டோன் மேப்பிங் வரம்பு';

  @override
  String get adminPlaybackTonemappingDesat => 'டோன் மேப்பிங் நிறமிழப்பு';

  @override
  String get adminPlaybackTonemappingPeak => 'டோன் மேப்பிங் உச்சம்';

  @override
  String get adminPlaybackTonemappingParam => 'டோன் மேப்பிங் அளபுரு';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP டோன் மேப்பிங் பிரகாசம்';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP டோன் மேப்பிங் மாறுபாடு';

  @override
  String get adminPlaybackPresetsQuality => 'முன்னமைவுகள் & தரம்';

  @override
  String get adminPlaybackEncoderPreset => 'என்கோடர் முன்னமைவு';

  @override
  String get adminPlaybackH264Crf => 'H.264 என்கோடிங் CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) என்கோடிங் CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'டீஇன்டர்லேஸ் முறை';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'டீஇன்டர்லேஸ் செய்யும்போது ஃபிரேம் ரேட்டை இரட்டிப்பாக்கு';

  @override
  String get adminPlaybackAudioSection => 'ஆடியோ';

  @override
  String get adminPlaybackEnableAudioVbr => 'ஆடியோ VBR என்கோடிங்கை இயக்கு';

  @override
  String get adminPlaybackDownmixBoost => 'ஆடியோ டவுன்மிக்ஸ் அதிகரிப்பு';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ஸ்டீரியோ டவுன்மிக்ஸ் அல்காரிதம்';

  @override
  String get adminPlaybackMaxMuxingQueue => 'அதிகபட்ச மக்ஸிங் வரிசை அளவு';

  @override
  String get adminPlaybackAutoOption => 'தானியங்கி';

  @override
  String get adminPlaybackEncoding => 'குறியாக்கம்';

  @override
  String get adminPlaybackEncodingThreads => 'என்கோடிங் நூல்கள்';

  @override
  String get adminPlaybackFallbackFont => 'ஃபால்பேக் எழுத்துருவை இயக்கு';

  @override
  String get adminPlaybackFallbackFontPath => 'ஃபால்பேக் எழுத்துரு பாதை';

  @override
  String get adminPlaybackStreaming => 'ஸ்ட்ரீமிங்';

  @override
  String get adminResumeVideo => 'வீடியோ';

  @override
  String get adminResumeAudiobooks => 'ஆடியோ புத்தகங்கள்';

  @override
  String get adminResumeMinAudiobookPct =>
      'குறைந்தபட்ச ஆடியோபுக் ரெஸ்யூம் சதவீதம்';

  @override
  String get adminResumeMaxAudiobookPct =>
      'அதிகபட்ச ஆடியோபுக் ரெஸ்யூம் சதவீதம்';

  @override
  String get adminStreamingBitrateLimit =>
      'ரிமோட் கிளையன்ட் பிட்ரேட் வரம்பு (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'வரம்பற்றதாக காலியாக அல்லது 0 ஐ விடவும்';

  @override
  String get adminTrickplayHwAccel => 'வன்பொருள் முடுக்கத்தை இயக்கு';

  @override
  String get adminTrickplayHwEncoding => 'வன்பொருள் குறியாக்கத்தை இயக்கு';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'விசை சட்டத்தை மட்டும் பிரித்தெடுப்பதை இயக்கு';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'வேகமான ஆனால் குறைவான துல்லியம்';

  @override
  String get adminTrickplayNonBlocking => 'தடுக்காதது';

  @override
  String get adminTrickplayBlocking => 'தடுப்பது';

  @override
  String get adminTrickplayPriorityHigh => 'உயர்';

  @override
  String get adminTrickplayPriorityAboveNormal => 'இயல்பிற்கு மேல்';

  @override
  String get adminTrickplayPriorityNormal => 'இயல்பானது';

  @override
  String get adminTrickplayPriorityBelowNormal => 'இயல்பிற்கு கீழே';

  @override
  String get adminTrickplayPriorityIdle => 'சும்மா';

  @override
  String get adminTrickplayImageSettings => 'பட அமைப்புகள்';

  @override
  String get adminTrickplayInterval => 'இடைவெளி (மிவி)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'பிரேம்களை எவ்வளவு அடிக்கடி பிடிக்க வேண்டும்';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'கமாவால் பிரிக்கப்பட்ட பிக்சல் அகலங்கள் (எ.கா. 320)';

  @override
  String get adminTrickplayQuality => 'தரம்';

  @override
  String get adminTrickplayQScale => 'தர அளவுகோல்';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'குறைந்த மதிப்புகள் = சிறந்த தரம், பெரிய கோப்புகள்';

  @override
  String get adminTrickplayJpegQuality => 'JPEG தரம்';

  @override
  String get adminTrickplayProcessing => 'செயலாக்கம்';

  @override
  String get adminTasksEmpty => 'திட்டமிடப்பட்ட பணிகள் எதுவும் இல்லை';

  @override
  String get adminTasksNoFilterMatch =>
      'தற்போதைய வடிப்பானுடன் எந்தப் பணியும் பொருந்தவில்லை';

  @override
  String get adminTaskCancelling => 'ரத்துசெய்கிறது...';

  @override
  String get adminTaskRunning => 'இயங்குகிறது...';

  @override
  String get adminTaskNeverRun => 'ஒருபோதும் ஓடாதே';

  @override
  String get adminTaskStop => 'நிறுத்து';

  @override
  String get adminRunningTasks => 'இயங்கும் பணிகள்';

  @override
  String get adminTaskRun => 'ஓடவும்';

  @override
  String get adminTaskDetailLastExecution => 'கடைசி மரணதண்டனை';

  @override
  String get adminTaskDetailStarted => 'தொடங்கப்பட்டது';

  @override
  String get adminTaskDetailEnded => 'முடிந்தது';

  @override
  String get adminTaskDetailDuration => 'கால அளவு';

  @override
  String get adminTaskDetailErrorLabel => 'பிழை:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'தினமும் $time க்கு';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ஒவ்வொரு $day அன்று $time க்கு';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ஒவ்வொரு $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'பயன்பாடு தொடங்கும் போது';

  @override
  String get adminTaskTriggerTypeDaily => 'தினசரி';

  @override
  String get adminTaskTriggerTypeWeekly => 'வாரந்தோறும்';

  @override
  String get adminTaskTriggerTypeInterval => 'ஒரு இடைவெளியில்';

  @override
  String get adminTaskTriggerIntervalLabel => 'இடைவெளி';

  @override
  String get adminTaskTriggerEveryHour => 'ஒவ்வொரு மணி நேரமும்';

  @override
  String get adminTaskTriggerEvery6Hours => 'ஒவ்வொரு 6 மணிநேரமும்';

  @override
  String get adminTaskTriggerEvery12Hours => 'ஒவ்வொரு 12 மணிநேரமும்';

  @override
  String get adminTaskTriggerEvery24Hours => 'ஒவ்வொரு 24 மணிநேரமும்';

  @override
  String get adminTaskTriggerEvery2Days => 'ஒவ்வொரு 2 நாட்களுக்கும்';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count மணி நேரம்',
      one: '1 மணி நேரம்',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'நேரம்';

  @override
  String get adminTaskTriggerNoLimit => 'வரம்பு இல்லை';

  @override
  String get adminActivityJustNow => 'இப்போதுதான்';

  @override
  String get adminActivityLastHour => 'கடைசி மணிநேரம்';

  @override
  String get adminActivityToday => 'இன்று';

  @override
  String get adminActivityYesterday => 'நேற்று';

  @override
  String get adminActivityOlder => 'பழையது';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days நாள் முன்';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours மணி முன்';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes நிமி முன்';
  }

  @override
  String get adminActivityNow => 'இப்போது';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesநி';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursம';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysநா';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'தேடல் முன்னோட்டச் சிறுபடங்களுக்கான Trickplay படம் உருவாக்கத்தை உள்ளமைக்கவும்.';

  @override
  String get adminNetworkingPublicHttpsPort => 'பொது HTTPS போர்ட்';

  @override
  String get adminNetworkingBaseUrl => 'அடிப்படை URL';

  @override
  String get adminNetworkingBaseUrlHint => 'எ.கா. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'பொது HTTP போர்ட்';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS தேவை';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'எல்லா தொலைநிலைக் கோரிக்கைகளையும் HTTPS க்குத் திருப்பிவிடும். சர்வரில் செல்லுபடியாகும் சான்றிதழ் இல்லாவிட்டால் இதற்கு விளைவு இல்லை.';

  @override
  String get adminNetworkingCertPassword => 'சான்றிதழ் கடவுச்சொல்';

  @override
  String get adminNetworkingIpSettings => 'IP அமைப்புகள்';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 ஐ இயக்கு';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 ஐ இயக்கு';

  @override
  String get adminNetworkingAutoDiscovery =>
      'தானியங்கி போர்ட் மேப்பிங்கை இயக்கு';

  @override
  String get adminNetworkingLocalSubnets => 'LAN நெட்வொர்க்குகள்';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'உள்ளூர் நெட்வொர்க்கில் உள்ளதாகக் கருதப்படும் IP முகவரிகள் அல்லது CIDR சப்நெட்களின் பட்டியல், காற்புள்ளி அல்லது வரிவாரியாகப் பிரிக்கப்பட்டது.';

  @override
  String get adminNetworkingPublishedUris => 'வெளியிடப்பட்ட சர்வர் URI கள்';

  @override
  String get adminNetworkingPublishedUriHint =>
      'ஒரு சப்நெட் அல்லது முகவரியை வெளியிடப்பட்ட URL உடன் மேப் செய்யவும், எ.கா. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'சான்றிதழ் பாதை';

  @override
  String get adminNetworkingRemoteIpFilter => 'ரிமோட் ஐபி வடிகட்டி';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'ரிமோட் ஐபி வடிகட்டி';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API சாதனம்';

  @override
  String get adminPlaybackAutomatic => '0 = தானியங்கி';

  @override
  String get adminPlaybackTranscodeTempPath => 'டிரான்ஸ்கோடிங் டெம்ப் பாதை';

  @override
  String get adminPlaybackSegmentDeletion => 'பிரிவை நீக்க அனுமதி';

  @override
  String get adminPlaybackSegmentKeep => 'பிரிவு வைத்திருத்தல் (வினாடிகள்)';

  @override
  String get adminPlaybackThrottleBuffering => 'த்ரோட்டில் பஃபரிங்';

  @override
  String get adminPlaybackThrottleDelay => 'த்ராட்டில் தாமதம் (வினாடிகள்)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'உடனுக்குடன் வசன வரி பிரித்தெடுத்தலை அனுமதி';

  @override
  String get adminResumeMinPct => 'குறைந்தபட்ச விண்ணப்பம் சதவீதம்';

  @override
  String get adminResumeMinPctSubtitle =>
      'முன்னேற்றத்தைச் சேமிக்க, உள்ளடக்கம் இந்த சதவீதத்தைத் தாண்டி விளையாட வேண்டும்';

  @override
  String get adminResumeMaxPct => 'அதிகபட்ச ரெஸ்யூம் சதவீதம்';

  @override
  String get adminResumeMaxPctSubtitle =>
      'இந்த சதவீதத்திற்குப் பிறகு உள்ளடக்கம் முழுமையாக விளையாடியதாகக் கருதப்படுகிறது';

  @override
  String get adminResumeMinDuration => 'குறைந்தபட்ச விண்ணப்ப காலம் (வினாடிகள்)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'இதை விடக் குறைவான பொருட்களை மீண்டும் தொடங்க முடியாது';

  @override
  String get adminTrickplayScanBehavior => 'ஸ்கேன் நடத்தை';

  @override
  String get adminTrickplayProcessPriority => 'செயல்முறை முன்னுரிமை';

  @override
  String get adminTrickplayTileWidth => 'ஓடு அகலம்';

  @override
  String get adminTrickplayTileHeight => 'ஓடு உயரம்';

  @override
  String get adminTrickplayProcessThreads => 'செயல்முறை நூல்கள்';

  @override
  String get adminTrickplayWidthResolutions => 'அகலத் தீர்மானங்கள்';

  @override
  String get adminMetadataDefault => 'இயல்புநிலை';

  @override
  String get adminMetadataContentTypeUpdated =>
      'உள்ளடக்க வகை புதுப்பிக்கப்பட்டது';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'உள்ளடக்க வகையைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'மெதுவான மறுமொழி வரம்பு (மிவி)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'மெதுவான பதில் எச்சரிக்கைகளை இயக்கு';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect ஐ இயக்கு';

  @override
  String get adminGeneralSectionServer => 'சர்வர்';

  @override
  String get adminGeneralSectionMetadata => 'மெட்டாடேட்டா';

  @override
  String get adminGeneralSectionPaths => 'பாதைகள்';

  @override
  String get adminGeneralSectionPerformance => 'செயல்திறன்';

  @override
  String get adminGeneralCachePath => 'கேச் பாதை';

  @override
  String get adminGeneralMetadataPath => 'மெட்டாடேட்டா பாதை';

  @override
  String get adminGeneralServerName => 'சர்வர் பெயர்';

  @override
  String get adminGeneralDisplayLanguage => 'விருப்பமான காட்சி மொழி';

  @override
  String get adminSettingsLoadFailed => 'அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminDiscover => 'கண்டறியவும்';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'மேப்பிங்குகளைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'நேர வரம்பு: $duration';
  }

  @override
  String get folders => 'கோப்புறைகள்';

  @override
  String get libraries => 'நூலகங்கள்';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay முடக்கப்பட்டது';

  @override
  String get syncPlayDisabledMessage =>
      'ஒத்திசைக்கப்பட்ட பிளேபேக்கைப் பயன்படுத்த, SyncPlayஐ அமைப்புகளில் இயக்கவும்.';

  @override
  String get syncPlayServerUnsupportedTitle => 'சேவையகம் ஆதரிக்கப்படவில்லை';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlayக்கு Jellyfin சர்வர் தேவை. தற்போதைய சர்வர் அதை ஆதரிக்கவில்லை.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay குழு';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay குழு';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# பங்கேற்பாளர்கள்',
      one: '# பங்கேற்பாளர்',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'காத்திருப்பதை புறக்கணிக்கவும்';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'இந்தச் சாதனம் இடையகமாக இருக்கும்போது குழுவை நிறுத்த வேண்டாம்';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'மெதுவான உறுப்பினர்களுக்காக காத்திருக்காமல் உள்ளூரில் தொடரவும்';

  @override
  String get syncPlayRepeat => 'மீண்டும் செய்யவும்';

  @override
  String get syncPlayRepeatOne => 'ஒன்று';

  @override
  String get syncPlayShuffleModeShuffled => 'கலக்கப்பட்டது';

  @override
  String get syncPlayShuffleModeSorted => 'வரிசைப்படுத்தப்பட்டது';

  @override
  String get syncPlaySyncCurrentQueue =>
      'தற்போதைய பின்னணி வரிசையை ஒத்திசைக்கவும்';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'குழு வரிசையை உள்ளூரில் விளையாடுவதைக் கொண்டு மாற்றவும்';

  @override
  String get syncPlayLeaveGroup => 'குழுவிலிருந்து வெளியேறு';

  @override
  String get syncPlayGroupQueue => 'குழு வரிசை';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'உருப்படி $index';
  }

  @override
  String get syncPlayPlayNow => 'இப்போது விளையாடு';

  @override
  String get syncPlayCreateNewGroup => 'புதிய குழுவை உருவாக்கவும்';

  @override
  String get syncPlayGroupName => 'குழுவின் பெயர்';

  @override
  String get syncPlayDefaultGroupName => 'எனது SyncPlay குழு';

  @override
  String get syncPlayCreateGroup => 'குழுவை உருவாக்கவும்';

  @override
  String get syncPlayAvailableGroups => 'கிடைக்கும் குழுக்கள்';

  @override
  String get syncPlayNoGroupsAvailable => 'குழுக்கள் இல்லை';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay குழுவில் சேரவா?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay குழுவில் சேர்வது உங்கள் தற்போதைய பிளேபேக் வரிசையை மாற்றலாம். தொடரவா?';

  @override
  String get syncPlayJoin => 'சேருங்கள்';

  @override
  String get syncPlayStateIdle => 'சும்மா';

  @override
  String get syncPlayStateWaiting => 'காத்திருக்கிறது';

  @override
  String get syncPlayStatePaused => 'இடைநிறுத்தப்பட்டது';

  @override
  String get syncPlayStatePlaying => 'விளையாடுகிறது';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay குழுவில் சேர்ந்தார்';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay குழுவிலிருந்து வெளியேறினார்';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay அணுகல் மறுக்கப்பட்டது';

  @override
  String get syncPlayAccessDeniedMessage =>
      'இந்த SyncPlay குழுவில் ஒன்று அல்லது அதற்கு மேற்பட்ட உருப்படிகளுக்கான அணுகல் உங்களிடம் இல்லை. நூலக அனுமதிகளைச் சரிபார்க்க அல்லது வேறு வரிசையைத் தேர்வுசெய்ய குழு உரிமையாளரிடம் கேளுங்கள்.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName உடன் இயக்கத்தை ஒத்திசைக்கிறது';
  }

  @override
  String get voiceSearchUnavailable => 'குரல் தேடல் கிடைக்கவில்லை.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision நேரடியாக விளையாடுவது தோல்வியடைந்தது';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'இந்த Dolby Vision ஸ்ட்ரீமில் நேரடி விளையாட்டு தொடங்கவில்லை. சர்வர் டிரான்ஸ்கோடைப் பயன்படுத்தி மீண்டும் முயற்சிக்கவா?';

  @override
  String get retryWithTranscode => 'டிரான்ஸ்கோடு மூலம் மீண்டும் முயற்சிக்கவும்';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ஆதரிக்கப்படவில்லை';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'இந்தச் சாதனம் Dolby Vision உள்ளடக்கத்தை நேரடியாக டிகோட் செய்ய முடியாது. HDR10 ஃபால்பேக்கைப் பயன்படுத்தவும் அல்லது சர்வர் டிரான்ஸ்கோடிங்கைக் கோரவும்.';

  @override
  String get rememberMyChoice => 'என் விருப்பத்தை நினைவில் வையுங்கள்';

  @override
  String get playHdr10Fallback => 'HDR10 ஃபால்பேக்கை இயக்கவும்';

  @override
  String get requestTranscode => 'டிரான்ஸ்கோடு கோரிக்கை';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# வரிசைகள் கண்டறியப்பட்டன',
      one: '# வரிசை கண்டறியப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'அனைத்தையும் பார்க்கவும்';

  @override
  String get noItems => 'பொருட்கள் இல்லை';

  @override
  String get switchUser => 'பயனரை மாற்றவும்';

  @override
  String get remoteControl => 'ரிமோட் கண்ட்ரோல்';

  @override
  String get mediaBarLoading => 'மீடியா பட்டியை ஏற்றுகிறது...';

  @override
  String get mediaBarError => 'மீடியா பட்டியை ஏற்ற முடியவில்லை';

  @override
  String get offlineServerUnavailable =>
      'இணையத்துடன் இணைக்கப்பட்டுள்ளது, ஆனால் தற்போதைய சர்வர் கிடைக்கவில்லை.';

  @override
  String get offlineNoInternet =>
      'ஆஃப்லைனில் உள்ளீர்கள். பதிவிறக்கம் செய்யப்பட்ட உள்ளடக்கம் மட்டுமே உள்ளது.';

  @override
  String get offlineFileNotAvailable => 'கோப்பு கிடைக்கவில்லை';

  @override
  String get offlineSwitchServer => 'சேவையகத்தை மாற்றவும்';

  @override
  String get offlineSavedMedia => 'சேமிக்கப்பட்ட மீடியா';

  @override
  String get offlineBannerTitle => 'நீங்கள் ஆஃப்லைனில் உள்ளீர்கள்';

  @override
  String get offlineBannerSubtitle => 'உங்கள் பதிவிறக்கங்களைக் காட்டுகிறது';

  @override
  String get offlineBannerAction => 'பதிவிறக்கங்கள்';

  @override
  String get serverUnreachableBannerTitle => 'உங்கள் சர்வரை அணுக முடியவில்லை';

  @override
  String get serverUnreachableBannerSubtitle =>
      'அது திரும்பும் வரை பதிவிறக்கங்களிலிருந்து இயக்குகிறது';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'ரிமோட் பிளேபேக்';

  @override
  String castControlFailed(String error) {
    return 'காஸ்ட் கட்டுப்பாடு தோல்வியடைந்தது: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind கட்டுப்பாடுகள்';
  }

  @override
  String get castDeviceVolume => 'சாதனத்தின் அளவு';

  @override
  String get castVolumeUnavailable => 'கிடைக்கவில்லை';

  @override
  String castStopKind(String kind) {
    return '$kind ஐ நிறுத்து';
  }

  @override
  String get audioLabel => 'ஆடியோ';

  @override
  String get subtitlesLabel => 'வசன வரிகள்';

  @override
  String get pinConfirmTitle => 'பின்னை உறுதிப்படுத்தவும்';

  @override
  String get pinSetTitle => 'பின்னை அமைக்கவும்';

  @override
  String get pinEnterTitle => 'பின்னை உள்ளிடவும்';

  @override
  String get pinReenterToConfirm =>
      'உறுதிப்படுத்த உங்கள் பின்னை மீண்டும் உள்ளிடவும்';

  @override
  String pinEnterNDigit(int length) {
    return '$length-இலக்க PIN ஐ உள்ளிடவும்';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'உங்கள் $length-இலக்க PIN ஐ உள்ளிடவும்';
  }

  @override
  String get pinIncorrect => 'தவறான பின்';

  @override
  String get pinMismatch => 'பின்கள் பொருந்தவில்லை';

  @override
  String get pinForgot => 'பின்னை மறந்துவிட்டீர்களா?';

  @override
  String get pinClear => 'அழி';

  @override
  String get pinBackspace => 'பேக்ஸ்பேஸ்';

  @override
  String get quickConnectAuthorized =>
      'Quick Connect கோரிக்கை அங்கீகரிக்கப்பட்டது.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect குறியீடு தவறானது அல்லது காலாவதியானது.';

  @override
  String get quickConnectNotSupported =>
      'இந்த சர்வரில் Quick Connect ஆதரிக்கப்படவில்லை.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect குறியீட்டை அங்கீகரிக்க முடியவில்லை.';

  @override
  String get quickConnectDisabled =>
      'இந்த சர்வரில் Quick Connect முடக்கப்பட்டுள்ளது.';

  @override
  String get quickConnectForbidden =>
      'உங்கள் கணக்கால் இந்த Quick Connect கோரிக்கையை அங்கீகரிக்க முடியாது.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect குறியீடு கிடைக்கவில்லை. புதிய குறியீட்டை முயற்சிக்கவும்.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect தோல்வியடைந்தது: $message';
  }

  @override
  String get quickConnectEnterCode => 'குறியீட்டை உள்ளிடவும்';

  @override
  String get quickConnectAuthorize => 'அங்கீகரிக்கவும்';

  @override
  String remoteCommandFailed(String error) {
    return 'கட்டளை தோல்வியடைந்தது: $error';
  }

  @override
  String get remoteControlTitle => 'ரிமோட் கண்ட்ரோல்';

  @override
  String get remoteFailedToLoadSessions => 'அமர்வுகளை ஏற்றுவதில் தோல்வி';

  @override
  String get remoteNoSessions => 'கட்டுப்படுத்தக்கூடிய அமர்வுகள் இல்லை';

  @override
  String get remoteStartPlayback =>
      'மற்றொரு சாதனத்தில் பிளேபேக்கைத் தொடங்கவும்';

  @override
  String get unknownUser => 'தெரியவில்லை';

  @override
  String get unknownItem => 'தெரியவில்லை';

  @override
  String get remoteNothingPlaying => 'இந்த அமர்வில் எதுவும் விளையாடவில்லை';

  @override
  String get castingStarted => 'தேர்ந்தெடுத்த சாதனத்தில் அனுப்புதல் தொடங்கியது';

  @override
  String castingFailed(String error) {
    return 'காஸ்ட்டிங்கைத் தொடங்க முடியவில்லை: $error';
  }

  @override
  String get noRemoteDevices => 'ரிமோட் பிளேபேக் சாதனங்கள் இல்லை.';

  @override
  String get noRemoteDevicesIos =>
      'ரிமோட் பிளேபேக் சாதனங்கள் இல்லை.\n\niOS இல், சிமுலேட்டரில் AirPlay இலக்குகள் கிடைக்காமல் போகலாம்.';

  @override
  String get trackActionPlayNext => 'அடுத்து விளையாடு';

  @override
  String get trackActionAddToQueue => 'வரிசையில் சேர்க்கவும்';

  @override
  String get trackActionAddToPlaylist => 'பிளேலிஸ்ட்டில் சேர்க்கவும்';

  @override
  String get trackActionCancelDownload => 'பதிவிறக்கத்தை ரத்துசெய்';

  @override
  String get trackActionDeleteFromPlaylist => 'பிளேலிஸ்ட்டில் இருந்து நீக்கு';

  @override
  String get trackActionMoveUp => 'மேலே நகர்த்தவும்';

  @override
  String get trackActionMoveDown => 'கீழே நகர்த்தவும்';

  @override
  String get trackActionRemoveFromFavorites => 'பிடித்தவையிலிருந்து அகற்று';

  @override
  String get trackActionAddToFavorites => 'பிடித்தவைகளில் சேர்க்கவும்';

  @override
  String get trackActionGoToAlbum => 'ஆல்பத்திற்கு செல்க';

  @override
  String get trackActionGoToArtist => 'கலைஞரிடம் செல்லுங்கள்';

  @override
  String trackActionDownloading(String name) {
    return '$name பதிவிறக்குகிறது...';
  }

  @override
  String get trackActionDeletedFile =>
      'பதிவிறக்கம் செய்யப்பட்ட கோப்பு நீக்கப்பட்டது';

  @override
  String get trackActionDeleteFileFailed =>
      'பதிவிறக்கம் செய்யப்பட்ட கோப்பை நீக்க முடியவில்லை';

  @override
  String get shuffleBy => 'மூலம் கலக்கவும்';

  @override
  String get shuffleSelectLibrary => 'நூலகத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get shuffleSelectGenre => 'வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get shuffleLibrary => 'நூலகம்';

  @override
  String get shuffleGenre => 'வகை';

  @override
  String get shuffleNoLibraries => 'இணக்கமான நூலகங்கள் இல்லை.';

  @override
  String get shuffleNoGenres =>
      'இந்த ஷஃபிள் பயன்முறையில் வகைகள் எதுவும் இல்லை.';

  @override
  String get posterDisplayTitle => 'காட்சி';

  @override
  String get posterImageType => 'பட வகை';

  @override
  String get imageTypePoster => 'சுவரொட்டி';

  @override
  String get imageTypeThumbnail => 'சிறுபடம்';

  @override
  String get imageTypeBanner => 'பேனர்';

  @override
  String get playlistAddFailed => 'பிளேலிஸ்ட்டில் சேர்க்க முடியவில்லை';

  @override
  String get playlistCreateFailed => 'பிளேலிஸ்ட்டை உருவாக்க முடியவில்லை';

  @override
  String get playlistNew => 'புதிய பிளேலிஸ்ட்';

  @override
  String get playlistCreate => 'உருவாக்கு';

  @override
  String get playlistCreateNew => 'புதிய பிளேலிஸ்ட்டை உருவாக்கவும்';

  @override
  String get playlistNoneFound => 'பிளேலிஸ்ட்கள் எதுவும் இல்லை';

  @override
  String get addToPlaylist => 'பிளேலிஸ்ட்டில் சேர்க்கவும்';

  @override
  String get lyricsNotAvailable => 'பாடல் வரிகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get upNext => 'அடுத்து';

  @override
  String get playNext => 'அடுத்து விளையாடு';

  @override
  String get stillWatchingContent =>
      'பிளேபேக் இடைநிறுத்தப்பட்டது. நீங்கள் இன்னும் பார்க்கிறீர்களா?';

  @override
  String get stillWatchingStop => 'நிறுத்து';

  @override
  String get stillWatchingContinue => 'தொடரவும்';

  @override
  String skipSegment(String segment) {
    return '$segment ஐத் தவிர்';
  }

  @override
  String get liveTv => 'நேரலை டிவி';

  @override
  String get continueWatchingAndNextUp => 'தொடர்ந்து பார்த்து & அடுத்தது';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total பதிவிறக்குகிறது — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName பதிவிறக்குகிறது';
  }

  @override
  String get nextEpisode => 'அடுத்த எபிசோட்';

  @override
  String get moreFromThisSeason => 'இந்த சீசனில் இருந்து மேலும்';

  @override
  String get playerTooltipPlaybackSpeed => 'பின்னணி வேகம்';

  @override
  String get playerTooltipCastControls => 'காஸ்ட் கட்டுப்பாடுகள்';

  @override
  String get playerTooltipPlaybackQuality => 'பிட்ரேட்';

  @override
  String get playerTooltipEnterFullscreen => 'முழுத்திரையில் உள்ளிடவும்';

  @override
  String get playerTooltipExitFullscreen => 'முழுத்திரையிலிருந்து வெளியேறு';

  @override
  String get playerTooltipFloatOnTop => 'மேலே மிதக்க';

  @override
  String get playerTooltipExitFloatOnTop => 'மேலே மிதவை முடக்கு';

  @override
  String get playerTooltipLockLandscape => 'பூட்டு நிலப்பரப்பு';

  @override
  String get playerTooltipUnlockOrientation => 'சுழற்சியை அனுமதிக்கவும்';

  @override
  String get playerTooltipPrevious => 'முந்தையது';

  @override
  String get playerTooltipSeekBack => 'திரும்பி தேடுங்கள்';

  @override
  String get playerTooltipSeekForward => 'முன்னோக்கி தேடுங்கள்';

  @override
  String get contextMenuMarkWatched => 'பார்த்ததாகக் குறி';

  @override
  String get contextMenuMarkUnwatched => 'பார்க்கப்படாததாகக் குறிக்கவும்';

  @override
  String get contextMenuAddToFavorites => 'பிடித்தவைகளில் சேர்க்கவும்';

  @override
  String get contextMenuRemoveFromFavorites => 'பிடித்தவையிலிருந்து அகற்று';

  @override
  String get contextMenuGoToSeries => 'தொடருக்குச் செல்லவும்';

  @override
  String get contextMenuHideFromContinueWatching =>
      'தொடர்ந்து பார்க்கவும் பிரிவிலிருந்து மறை';

  @override
  String get contextMenuHideFromNextUp => 'அடுத்தது பிரிவிலிருந்து மறை';

  @override
  String get contextMenuAddToCollection => 'தொகுப்பில் சேர்';

  @override
  String get settingsAdministrationSubtitle => 'சேவையக நிர்வாக குழுவை அணுகவும்';

  @override
  String get settingsAccountSecurity => 'கணக்கு மற்றும் பாதுகாப்பு';

  @override
  String get settingsAccountSecuritySubtitle =>
      'அங்கீகாரம், பின் குறியீடு மற்றும் பெற்றோர் கட்டுப்பாடுகள்';

  @override
  String get settingsPersonalization => 'தனிப்பயனாக்கம்';

  @override
  String get settingsPersonalizationSubtitle =>
      'தீம், வழிசெலுத்தல், முகப்பு வரிசைகள் மற்றும் நூலகத் தெரிவுநிலை';

  @override
  String get settingsDynamicContent => 'டைனமிக் உள்ளடக்கம்';

  @override
  String get settingsDynamicContentSubtitle =>
      'மீடியா பார் மற்றும் காட்சி மேலடுக்குகள்';

  @override
  String get settingsPlaybackSyncplay => 'பின்னணி & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ஆடியோ/வீடியோ அமைப்புகள், வசன வரிகள், பதிவிறக்கங்கள் மற்றும் SyncPlay கட்டுப்பாடுகள்';

  @override
  String get settingsIntegrationsSubtitle =>
      'செருகுநிரல் ஒத்திசைவு, Seerr, மதிப்பீடுகள் மற்றும் பல';

  @override
  String get settingsAboutSubtitle =>
      'பயன்பாட்டின் பதிப்பு, சட்டத் தகவல் மற்றும் வரவுகள்';

  @override
  String get settingsAuthenticationSection => 'அங்கீகாரம்';

  @override
  String get settingsSortServersBy => 'சேவையகங்களை வரிசைப்படுத்தவும்';

  @override
  String get settingsLastUsed => 'கடைசியாக பயன்படுத்தப்பட்டது';

  @override
  String get settingsAlphabetical => 'அகரவரிசைப்படி';

  @override
  String get settingsConnectionSection => 'இணைப்பு';

  @override
  String get settingsAllowSelfSignedCerts =>
      'சுய-கையொப்பமிட்ட சான்றிதழ்களை அனுமதி';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'சுய-கையொப்பமிட்ட அல்லது தனிப்பட்ட-CA TLS சான்றிதழ்களைப் பயன்படுத்தும் சர்வர்களை நம்பும். நீங்கள் கட்டுப்படுத்தும் சர்வர்களுக்கு மட்டும் இயக்கவும். இது எல்லா இணைப்புகளுக்கும் சான்றிதழ் சரிபார்ப்பை முடக்கும்.';

  @override
  String get settingsPrivacyAndSafetySection => 'தனியுரிமை & பாதுகாப்பு';

  @override
  String get settingsBlockedRatings => 'தடுக்கப்பட்ட மதிப்பீடுகள்';

  @override
  String get settingsGeneralStyle => 'பொது உடை';

  @override
  String get settingsGeneralStyleSubtitle =>
      'தீம் உச்சரிப்புகள், பின்னணிகள், பார்த்த குறிகாட்டிகள் மற்றும் தீம் இசை';

  @override
  String get settingsDetailsScreen => 'விவரத் திரை';

  @override
  String get settingsDetailsScreenSubtitle =>
      'பாணி, பின்னணி மங்கல் மற்றும் தாவல் நடத்தை';

  @override
  String get settingsHomePage => 'முகப்பு பக்கம்';

  @override
  String get settingsHomePageSubtitle =>
      'பிரிவுகள், பட வகைகள், மேலடுக்குகள் மற்றும் மீடியா முன்னோட்டங்கள்';

  @override
  String get settingsLibrariesSubtitle =>
      'நூலகத் தெரிவுநிலை, கோப்புறைக் காட்சி மற்றும் பல சேவையக நடத்தை';

  @override
  String get settingsTwentyFourHourClock => '24 மணி நேர கடிகாரம்';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'கடிகாரம் எங்கு காட்டப்பட்டாலும் 24-மணி நேர வடிவமைப்பைப் பயன்படுத்தவும்';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'வழிசெலுத்தல் பட்டியில் ஷஃபிள் பட்டனைக் காட்டு';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'வழிசெலுத்தல் பட்டியில் வகைகள் பொத்தானைக் காட்டு';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'வழிசெலுத்தல் பட்டியில் பிடித்தவை பொத்தானைக் காட்டு';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'வழிசெலுத்தல் பட்டியில் நூலகங்கள் பொத்தானைக் காட்டு';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'வழிசெலுத்தல் பட்டியில் Seerr பட்டனைக் காட்டு';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'மேல் வழிசெலுத்தல் பட்டியில் உரை லேபிள்களை எப்போதும் காட்டு';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ஒரு நூலகத்திற்கு முகப்புப் பக்கத் தெரிவுநிலையை நிலைமாற்று. மாற்றங்கள் நடைமுறைக்கு வர Moonfin ஐ மீண்டும் தொடங்கவும்.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'மீடியா பார் & உள்ளூர் மாதிரிக்காட்சிகள்';

  @override
  String get settingsVisualOverlays => 'காட்சி மேலடுக்குகள்';

  @override
  String get settingsSeasonalSurprise => 'பருவகால ஆச்சரியம்';

  @override
  String get settingsMetadataAndRatings => 'மெட்டாடேட்டா & மதிப்பீடுகள்';

  @override
  String get settingsPluginScreenDescription =>
      'கூடுதல் மதிப்பீட்டு ஆதாரங்கள், Seerr கோரிக்கைகள் மற்றும் ஒத்திசைக்கப்பட்ட விருப்பங்கள் உட்பட சர்வர்-பக்க ஒருங்கிணைப்புகளை Moonbase இயக்குகிறது.';

  @override
  String get settingsOfflineDownloads => 'ஆஃப்லைன் பதிவிறக்கங்கள்';

  @override
  String get settingsHigh => 'உயர்';

  @override
  String get settingsLow => 'குறைந்த';

  @override
  String get settingsCustomPath => 'தனிப்பயன் பாதை';

  @override
  String get settingsEnterDownloadFolderPath =>
      'பதிவிறக்க கோப்புறை பாதையை உள்ளிடவும்';

  @override
  String get settingsConcurrentDownloads => 'ஒரே நேரத்தில் பதிவிறக்கங்கள்';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ஒரே நேரத்தில் பதிவிறக்குவதற்கான அதிகபட்ச உருப்படிகள்.';

  @override
  String get settingsAppInfo => 'பயன்பாட்டுத் தகவல்';

  @override
  String get settingsReportAnIssue => 'ஒரு சிக்கலைப் புகாரளிக்கவும்';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub இல் சிக்கல் டிராக்கரைத் திறக்கவும்';

  @override
  String get settingsJoinDiscord => 'Discord இல் சேரவும்';

  @override
  String get settingsJoinDiscordSubtitle => 'சமூகத்துடன் அரட்டையடிக்கவும்';

  @override
  String get settingsJoinTheDiscord => 'Discord இல் சேரவும்';

  @override
  String get settingsSupportMoonfin => 'ஆதரவு Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'டெவலப்பருக்கு ஒரு காபி வழங்குங்கள்';

  @override
  String get settingsLegal => 'சட்டபூர்வமானது';

  @override
  String get settingsLicenses => 'உரிமங்கள்';

  @override
  String get settingsOpenSourceLicenseNotices => 'திறந்த மூல உரிம அறிவிப்புகள்';

  @override
  String get settingsPrivacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin உங்கள் தரவை எவ்வாறு கையாள்கிறது';

  @override
  String get settingsCheckForUpdates => 'புதுப்பிப்புகளைச் சரிபார்க்கவும்';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'சமீபத்திய Moonfin வெளியீட்டைப் பார்க்கவும்';

  @override
  String get settingsPoweredByFlutter => 'Flutter மூலம் இயக்கப்படுகிறது';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# உரிம அறிவிப்புகள்',
      one: '# உரிம அறிவிப்பு',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'இரண்டும்';

  @override
  String get settingsShuffleContentTypeFilter =>
      'உள்ளடக்க வகை வடிகட்டியை கலக்கவும்';

  @override
  String get settingsVideoPlaybackPreferences =>
      'வீடியோ பின்னணி விருப்பத்தேர்வுகள்';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'முக்கிய வீடியோ இயந்திரம் மற்றும் ஸ்ட்ரீமிங் தர அமைப்புகள்';

  @override
  String get settingsAudioPreferences => 'ஆடியோ விருப்பத்தேர்வுகள்';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ஆடியோ டிராக்குகள், செயலாக்கம் மற்றும் பாஸ்த்ரூ விருப்பங்கள்';

  @override
  String get settingsAutomationAndQueue => 'ஆட்டோமேஷன் & வரிசை';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'தானியங்கு பின்னணி மற்றும் வரிசைமுறை';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'பதிவிறக்க தரம், சேமிப்பக வரம்புகள் மற்றும் வரிசை அளவு';

  @override
  String get settingsSyncplaySubtitle =>
      'குழு அமர்வுகளுக்கான ஒத்திசைவு தர்க்கம்';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'சிறப்பு வீரர் அம்சங்கள். சில விருப்பங்கள் பின்னணி சிக்கல்களை ஏற்படுத்தக்கூடும் என்பதால் எச்சரிக்கையுடன் பயன்படுத்தவும்';

  @override
  String get settingsSkipIntrosAndOutros =>
      'அறிமுகங்கள் மற்றும் அவுட்ரோக்களை தவிர்க்கவா?';

  @override
  String get settingsMediaSegmentCountdown => 'மீடியா பிரிவு கவுண்ட்டவுன்';

  @override
  String get settingsProgressBar => 'முன்னேற்றப் பட்டி';

  @override
  String get settingsTimer => 'டைமர்';

  @override
  String get settingsNone => 'எதுவுமில்லை';

  @override
  String get settingsPromptUser => 'உடனடி பயனர்';

  @override
  String get settingsSkip => 'தவிர்க்கவும்';

  @override
  String get settingsDoNothing => 'எதுவும் செய்யாதே';

  @override
  String get settingsMaxBitrateDescription =>
      'ஸ்ட்ரீமிங் பிட்ரேட்டை மூடவும். இந்த வரம்புக்கு மேலே உள்ள உள்ளடக்கம் பொருத்தமாக மாற்றியமைக்கப்படும்.';

  @override
  String get settingsMaxResolutionDescription =>
      'பிளேயர் கோரும் அதிகபட்ச தெளிவுத்திறனை வரம்பிடவும். உயர் தெளிவுத்திறன் உள்ளடக்கம் குறியிடப்படும்.';

  @override
  String get settingsPlayerZoomDescription =>
      'திரைக்கு ஏற்றவாறு வீடியோ எவ்வாறு அளவிடப்பட வேண்டும்.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'பிளேபேக் என்ஜின் (ஆண்ட்ராய்டு டிவி)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV சாதனங்களில் இயல்புநிலை பின்னணி இயந்திரத்தைத் தேர்வுசெய்யவும். மாற்றங்கள் அடுத்த பின்னணி அமர்வுக்கு பொருந்தும்.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (பரிந்துரைக்கப்பட்டது)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (பழையது)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (மரபு)';

  @override
  String get settingsPlaybackEngineMpvRecommended =>
      'mpv (பரிந்துரைக்கப்படுகிறது)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ஃபால்பேக்';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision டிகோடிங் இல்லாத சாதனங்களில் Dolby Vision தலைப்புகளுக்கான நடத்தை.';

  @override
  String get settingsAskEachTime => 'ஒவ்வொரு முறையும் கேளுங்கள்';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ஃபால்பேக்கை விரும்பு';

  @override
  String get settingsPreferServerTranscode => 'சர்வர் டிரான்ஸ்கோடை விரும்பு';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision சுயவிவரம் 7 நேரடி விளையாட்டு';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision சுயவிவரம் 7 மேம்படுத்தல்-அடுக்கு ஸ்ட்ரீம்கள் இயக்கப்பட வேண்டுமா என்பதைக் கட்டுப்படுத்துகிறது.';

  @override
  String get settingsAutoAftkrtEnabled => 'தானியங்கு (AFTKRT இயக்கப்பட்டது)';

  @override
  String get settingsEnabledOnThisDevice => 'இந்தச் சாதனத்தில் இயக்கப்பட்டது';

  @override
  String get settingsDisabledPreferTranscode =>
      'முடக்கப்பட்டது (டிரான்ஸ்கோடை விரும்பு)';

  @override
  String get settingsResumeRewindDescription =>
      'பிளேபேக்கை மீண்டும் தொடங்கும் போது (தொடர்ந்து பார்ப்பது அல்லது மீடியா உருப்படி பக்கத்திலிருந்து), எத்தனை வினாடிகள் திரும்பப் பெற வேண்டும்?';

  @override
  String get settingsUnpauseRewindDescription =>
      'இடைநிறுத்தம் பட்டனை அழுத்திய பின் பிளேபேக்கை மீண்டும் தொடங்கும் போது, ​​எத்தனை வினாடிகள் திரும்ப திரும்ப வேண்டும்?';

  @override
  String get settingsSkipBackLengthDescription =>
      'ரிவைண்ட் பட்டனை அழுத்திய பிறகு எத்தனை வினாடிகள் பின்வாங்க வேண்டும்.';

  @override
  String get settingsOneSecond => '1 வினாடி';

  @override
  String get settingsThreeSeconds => '3 வினாடிகள்';

  @override
  String get settingsFortyFiveSeconds => '45 வினாடிகள்';

  @override
  String get settingsSixtySeconds => '60 வினாடிகள்';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ஃபாஸ்ட் ஃபார்வர்ட் பட்டனை அழுத்திய பிறகு எத்தனை வினாடிகள் முன்னோக்கி குதிக்க வேண்டும்.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'வெளிப்புற குறிவிலக்கிக்கு பிட்ஸ்ட்ரீம் ஏசி3';

  @override
  String get settingsCinemaMode => 'சினிமா பயன்முறை';

  @override
  String get settingsCinemaModeSubtitle =>
      'முக்கிய அம்சத்திற்கு முன் டிரெய்லர்கள்/ப்ரீரோல்களை இயக்கவும்';

  @override
  String get settingsNextUpDisplayDescription =>
      'எபிசோட் கலைப்படைப்பு மற்றும் விளக்கத்துடன் கூடிய முழு அட்டையையும் நீட்டிக்கப்பட்டுள்ளது. மினிமல் ஒரு சிறிய கவுண்டவுன் மேலடுக்கைக் காட்டுகிறது. செயலிழந்தவர் ப்ராம்ட்டை முழுவதுமாக மறைக்கிறது.';

  @override
  String get settingsShort => 'குறுகிய';

  @override
  String get settingsLong => 'நீளமானது';

  @override
  String get settingsVeryLong => 'மிக நீளமானது';

  @override
  String get settingsVideoStartDelay => 'வீடியோ தொடங்குவதில் தாமதம்';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'நேரடி தொலைக்காட்சி நேரடி';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'நேரலை டிவியில் நேரடியாக விளையாடுவதை இயக்கு';

  @override
  String get settingsOpenGroups => 'குழுக்களைத் திற';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay குழுக்களை உருவாக்கவும், சேரவும் அல்லது நிர்வகிக்கவும்';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay இயக்கப்பட்டது';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'குழு பார்க்கும் அம்சங்களை இயக்கவும்';

  @override
  String get settingsSyncplayButton => 'SyncPlay பட்டன்';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'வழிசெலுத்தல் பட்டியில் SyncPlay பொத்தானைக் காட்டு';

  @override
  String get settingsSyncplayAdvancedCorrection => 'மேம்பட்ட திருத்தம்';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'நேர்த்தியான ஒத்திசைவு தர்க்கத்தை இயக்கு';

  @override
  String get settingsSyncplaySyncCorrection => 'ஒத்திசைவு திருத்தம்';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ஒத்திசைவில் இருக்க, பிளேபேக்கைத் தானாகச் சரிசெய்யவும்';

  @override
  String get settingsSyncplaySpeedToSync => 'ஒத்திசைவுக்கான வேகம்';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ஒத்திசைக்க, பின்னணி வேக சரிசெய்தலைப் பயன்படுத்தவும்';

  @override
  String get settingsSyncplaySkipToSync => 'ஒத்திசைவுக்குச் செல்லவும்';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'ஒத்திசைக்க தேடுவதைப் பயன்படுத்தவும்';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'குறைந்தபட்ச வேக தாமதம்';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'அதிகபட்ச வேக தாமதம்';

  @override
  String get settingsSyncplaySpeedDuration => 'வேக காலம்';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'குறைந்தபட்ச ஸ்கிப் தாமதம்';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay கூடுதல் ஆஃப்செட்';

  @override
  String get onNow => 'இப்போது';

  @override
  String get collections => 'தொகுப்புகள்';

  @override
  String get lastPlayed => 'கடைசியாக விளையாடியது';

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
    return 'சமீபத்தில் வெளியான $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'அடுத்த அத்தியாயத்தைத் தானாக இயக்கு';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'கிடைக்கும்போது அடுத்த அத்தியாயத்தைத் தானாக இயக்கும்.';

  @override
  String get skipSilenceTitle => 'அமைதியைத் தவிர்';

  @override
  String get skipSilenceSubtitle =>
      'ஸ்ட்ரீம் ஆதரிக்கும்போது அமைதியான ஆடியோ பிரிவுகளைத் தானாகத் தவிர்க்கும்.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'வெளிப்புற ஆடியோ விளைவுகளை அனுமதி';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'ஈக்வலைசர் மற்றும் விளைவு ஆப்ஸ் (எ.கா. Wavelet) Media3 இயக்க அமர்வுகளுடன் இணைய அனுமதிக்கும்.';

  @override
  String get disableTunnelingTitle => 'டன்னலிங்கை முடக்கு';

  @override
  String get disableTunnelingSubtitle =>
      'டன்னல் இல்லாத இயக்கத்தைக் கட்டாயப்படுத்தும். டன்னலிங் ஆடியோ/வீடியோ தடைகள் உள்ள சாதனங்களில் பயனுள்ளது.';

  @override
  String get enableTunnelingTitle => 'டன்னலிங்கை இயக்கு';

  @override
  String get enableTunnelingSubtitle =>
      'மேம்பட்டது. ஆடியோ மற்றும் வீடியோவை இணைந்த வன்பொருள் பாதை வழியாக அனுப்பும். சில சாதனங்களில் ஆடியோ/வீடியோ தடைகளை ஏற்படுத்துவதால் இயல்பாக அணைக்கப்பட்டுள்ளது.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision சுயவிவரம் 7 ஐ HEVC உடன் மேப் செய்';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV அல்லாத சாதனங்களில் Dolby Vision சுயவிவரம் 7 ஸ்ட்ரீம்களை HDR10-இணக்கமான HEVC ஆக இயக்கும்.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'உள்ளமைந்த வசன வரி பாணிகளைப் பயன்படுத்து';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'வசன வரி தடத்தில் உள்ளமைந்த வண்ணங்கள், எழுத்துருக்கள் மற்றும் இருப்பிடத்தைப் பயன்படுத்தும். உங்கள் வசன வரி பாணி விருப்பங்களைப் பயன்படுத்த இதை முடக்கவும்.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'உள்ளமைந்த வசன வரி எழுத்துரு அளவுகளைப் பயன்படுத்து';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'வசன வரி தடத்தில் உள்ளமைந்த எழுத்துரு-அளவு குறிப்புகளைப் பயன்படுத்தும். உங்கள் பாணி விருப்பங்களில் உள்ள வசன வரி அளவைப் பயன்படுத்த இதை முடக்கவும்.';

  @override
  String get showMediaDetailsOnLibraryPage => 'மீடியா விவரங்களைக் காட்டு';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'நூலகப் பக்கங்களின் மேலே தேர்ந்தெடுக்கப்பட்ட உருப்படியின் விவரங்களைக் காட்டும்.';

  @override
  String get hideBackdropsInLibraries =>
      'உலாவும்போது பின்னணிப் படங்களை மறைக்கவா?';

  @override
  String get useDetailedSubHeadings =>
      'விரிவான துணைத் தலைப்புகளைப் பயன்படுத்து';

  @override
  String get useDetailedSubHeadingsDescription =>
      'நூலகப் பக்கங்களில் விரிவான அல்லது எளிய துணை வரிசையைக் காட்டும்.';

  @override
  String get savedThemesDeleteDialogTitle => 'சேமித்த தீமை நீக்கவா?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'இந்தச் சாதனத்தின் கேசிலிருந்து \"$themeName\" ஐ அகற்றவா?';
  }

  @override
  String get themeStore => 'தீம் ஸ்டோர்';

  @override
  String get themeStoreSubtitle => 'சமூகத் தீம்களை உலாவிச் சேமிக்கவும்';

  @override
  String get themeStoreDescription =>
      'மற்ற சேமித்த தீம்களைப் போலப் பயன்படுத்த ஒரு தீமைச் சேமிக்கவும்.';

  @override
  String get themeStoreEmpty => 'இப்போது தீம்கள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get themeStoreLoadFailed =>
      'தீம் ஸ்டோரை ஏற்ற முடியவில்லை. உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get themeStoreSave => 'சேமி';

  @override
  String get themeStoreSaveAndApply => 'சேமித்துப் பயன்படுத்து';

  @override
  String get themeStoreSaved => 'சேமிக்கப்பட்டது';

  @override
  String get themeStoreInvalidMessage => 'இந்தத் தீமை ஏற்ற முடியவில்லை.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" சேமிக்கப்பட்டது.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'இந்தச் சாதனத்திலிருந்து \"$themeName\" நீக்கப்பட்டது.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ஐ நீக்க முடியவில்லை.';
  }

  @override
  String get savedThemesTitle => 'சேமித்த தீம்கள்';

  @override
  String get savedThemesDescription =>
      'இவை தற்போதைய சர்வருக்காக Moonfin செருகுநிரலிலிருந்து பதிவிறக்கப்பட்ட தீம்கள். நீக்குவது இந்த உள்ளூர் நகலை மட்டுமே அகற்றும்.';

  @override
  String get savedThemesEmpty =>
      'இந்த சர்வருக்கான சேமித்த தீம்கள் எதுவும் கிடைக்கவில்லை.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • தற்போது செயலில்';
  }

  @override
  String get savedThemesDeleteTooltip => 'சேமித்த தீமை நீக்கு';

  @override
  String get savedThemesManageSubtitle =>
      'இந்தச் சாதனத்தில் பதிவிறக்கிய செருகுநிரல் தீம்களை நிர்வகிக்கவும்';

  @override
  String get themeEditor => 'தீம் எடிட்டர்';

  @override
  String get themeEditorSubtitle =>
      'உங்கள் உலாவியில் Moonfin தீம் எடிட்டரைத் திறக்கும்';

  @override
  String get homeScreen => 'முகப்புத் திரை';

  @override
  String get bottomBar => 'கீழ்ப் பட்டி';

  @override
  String get homeRowsStyleClassic => 'கிளாசிக்';

  @override
  String get homeRowsStyleModern => 'மாடர்ன்';

  @override
  String get homeRowsSection => 'முகப்பு வரிசைகள்';

  @override
  String get homeRowDisplay => 'முகப்பு வரிசைக் காட்சி';

  @override
  String get homeRowSections => 'முகப்பு வரிசைப் பிரிவுகள்';

  @override
  String get homeRowToggles => 'முகப்பு வரிசை நிலைமாற்றிகள்';

  @override
  String get homeRowTogglesSubtitle =>
      'நூலகம் சார்ந்த முகப்பு வரிசை வகைகளை இயக்கவும் அல்லது முடக்கவும்';

  @override
  String get homeRowTogglesDescription =>
      'முகப்புப் பிரிவுகளில் வரிசைகளைக் காட்ட பின்வரும் நிலைமாற்றிகளை இயக்கவும்.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'கிளாசிக் ஒவ்வொரு வரிசைக்கும் படவகை மற்றும் தகவல் மேலடுக்கைத் தக்கவைக்கும். மாடர்ன் போர்ட்ரெய்ட்-டு-பேக்டிராப் வரிசைகளைப் பயன்படுத்தும்.';

  @override
  String get displayFavoritesRows => 'பிடித்தவை வரிசைகளைக் காட்டு';

  @override
  String get displayFavoritesRowsSubtitle =>
      'முகப்புப் பிரிவுகளில் பிடித்த திரைப்படங்கள், தொடர்கள் மற்றும் பிற பிடித்தவை வரிசைகளைக் காட்டும்.';

  @override
  String get favoritesRowSorting => 'பிடித்தவை வரிசை வரிசையாக்கம்';

  @override
  String get favoritesRowSortingDescription =>
      'பிடித்தவை வரிசைகளைச் சேர்த்த தேதி, வெளியீட்டுத் தேதி, அகர வரிசை மற்றும் பலவற்றின்படி வரிசைப்படுத்தும்.';

  @override
  String get displayCollectionsRows => 'தொகுப்பு வரிசைகளைக் காட்டு';

  @override
  String get displayCollectionsRowsSubtitle =>
      'முகப்புப் பிரிவுகளில் தொகுப்பு வரிசைகளைக் காட்டும்.';

  @override
  String get collectionsRowSorting => 'தொகுப்பு வரிசை வரிசையாக்கம்';

  @override
  String get collectionsRowSortingDescription =>
      'தொகுப்பு வரிசைகளைச் சேர்த்த தேதி, வெளியீட்டுத் தேதி, அகர வரிசை மற்றும் பலவற்றின்படி வரிசைப்படுத்தும்.';

  @override
  String get displayGenresRows => 'வகை வரிசைகளைக் காட்டு';

  @override
  String get displayGenresRowsSubtitle =>
      'முகப்புப் பிரிவுகளில் வகை வரிசைகளைக் காட்டும்.';

  @override
  String get genresRowSorting => 'வகை வரிசை வரிசையாக்கம்';

  @override
  String get genresRowSortingDescription =>
      'வகை வரிசைகளைச் சேர்த்த தேதி, வெளியீட்டுத் தேதி, அகர வரிசை மற்றும் பலவற்றின்படி வரிசைப்படுத்தும்.';

  @override
  String get genresRowItems => 'வகை வரிசை உருப்படிகள்';

  @override
  String get genresRowItemsDescription =>
      'வகை வரிசைகளில் திரைப்படங்கள், தொடர்கள் அல்லது இரண்டையும் காட்டும்.';

  @override
  String get displayPlaylistsRows => 'பிளேலிஸ்ட் வரிசைகளைக் காட்டு';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'முகப்புப் பிரிவுகளில் பிளேலிஸ்ட் வரிசைகளைக் காட்டும்.';

  @override
  String get playlistsRowSorting => 'பிளேலிஸ்ட் வரிசை வரிசையாக்கம்';

  @override
  String get playlistsRowSortingDescription =>
      'பிளேலிஸ்ட் வரிசைகளைச் சேர்த்த தேதி, வெளியீட்டுத் தேதி, அகர வரிசை மற்றும் பலவற்றின்படி வரிசைப்படுத்தும்.';

  @override
  String get displayAudioRows => 'ஆடியோ வரிசைகளைக் காட்டு';

  @override
  String get displayAudioRowsSubtitle =>
      'முகப்புப் பிரிவுகளில் ஆடியோ வரிசைகளைக் காட்டும்.';

  @override
  String get audioRowsSorting => 'ஆடியோ வரிசைகள் வரிசையாக்கம்';

  @override
  String get audioRowsSortingDescription =>
      'ஆடியோ வரிசைகளைச் சேர்த்த தேதி, வெளியீட்டுத் தேதி, அகர வரிசை மற்றும் பலவற்றின்படி வரிசைப்படுத்தும்.';

  @override
  String get audioPlaylists => 'ஆடியோ பிளேலிஸ்ட்கள்';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get layout => 'அமைப்பு';

  @override
  String get theme => 'தீம்';

  @override
  String get keyboard => 'விசைப்பலகை';

  @override
  String get navButtons => 'பட்டன்கள்';

  @override
  String get rendering => 'ரெண்டரிங்';

  @override
  String get mpvConfiguration => 'MPV உள்ளமைவு';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'வெளிப்புற பிளேயர் ஆப்';

  @override
  String get externalPlayerAppDescription =>
      'நீண்ட-அழுத்த இயக்க விருப்பத்தை இயக்க வெளிப்புற பிளேயரை அமைக்கவும்';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'இயக்கம் தொடங்கும்போது ஆப் தேர்வியைக் காட்டும்.';

  @override
  String get loadingInstalledPlayers =>
      'நிறுவப்பட்ட பிளேயர்கள் ஏற்றப்படுகின்றன...';

  @override
  String get connection => 'இணைப்பு';

  @override
  String get audioTranscodeTarget => 'ஆடியோ டிரான்ஸ்கோட் இலக்கு';

  @override
  String get passthrough => 'பாஸ்த்ரூ';

  @override
  String get supportedOnThisDevice => 'இந்தச் சாதனத்தில் ஆதரிக்கப்படுகிறது';

  @override
  String get notSupportedOnThisDevice => 'இந்தச் சாதனத்தில் ஆதரிக்கப்படவில்லை';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) பாஸ்த்ரூ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) ஐ வெளிப்புற டிகோடருக்கு பிட்ஸ்ட்ரீம் செய்யும்.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) உடன் TrueHD பாஸ்த்ரூ';

  @override
  String get mediaPlayerBehavior => 'மீடியா பிளேயர் நடத்தை';

  @override
  String get playbackEnhancements => 'இயக்க மேம்பாடுகள்';

  @override
  String get alwaysOn => 'எப்போதும் இயக்கத்தில்.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'தவிர் அவுட்ரோவை அடுத்தது காட்சியால் மாற்று';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'தவிர் அவுட்ரோ பட்டனுக்குப் பதிலாக அடுத்தது மேலடுக்கைக் காட்டும்.';

  @override
  String get playerRouting => 'பிளேயர் ரூட்டிங்';

  @override
  String get preferSoftwareDecoders => 'மென்பொருள் டிகோடர்களை விரும்பு';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'வன்பொருள் டிகோடர்களுக்கு முன் FFmpeg (ஆடியோ) மற்றும் libgav1 (AV1) ஐப் பயன்படுத்தும். HDMI ஆடியோ பாஸ்த்ரூ செயலிழந்தால் முடக்கவும்.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV இல் தேர்ந்தெடுத்த வெளிப்புற ஆப்பில் வீடியோ இயக்கத்தைத் திறக்கும்.';

  @override
  String get automaticQueuing => 'தானியங்கி வரிசைப்படுத்தல்';

  @override
  String get preferSdhSubtitles => 'SDH வசன வரிகளை விரும்பு';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'தானாகத் தேர்ந்தெடுக்கும்போது SDH/CC வசன வரி தடங்களுக்கு முன்னுரிமை அளிக்கும்.';

  @override
  String get webDiagnostics => 'வலை கண்டறிதல்கள்';

  @override
  String get webDiagnosticsTitle => 'Moonfin வலை கண்டறிதல்கள்';

  @override
  String get webDiagnosticsIntro =>
      'உலாவி இணைப்புச் சிக்கல்களை (CORS, கலப்பு உள்ளடக்கம் மற்றும் கண்டுபிடிப்பு அமைப்புகள்) கண்டறிய இந்தப் பக்கத்தைப் பயன்படுத்தவும்.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'கலப்பு-உள்ளடக்கத் தோல்வி கண்டறியப்பட்டது';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight தோல்வி கண்டறியப்பட்டது';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'ஒரு HTTPS பக்கம் HTTP சர்வர் URL ஐ அழைக்க முயல்வதை Moonfin கண்டறிந்தது. உங்கள் சர்வரை அடையும் முன்பே உலாவிகள் இந்தக் கோரிக்கையைத் தடுக்கின்றன.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'மீடியா சர்வரில் CORS அல்லது preflight தலைப்புகள் இல்லாததால் பொதுவாக ஏற்படும் உலாவி-நிலைக் கோரிக்கைத் தோல்வியை Moonfin கண்டறிந்தது.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'இலக்கு URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'விவரம்: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'தற்போதைய இயக்க நேரச் சூழல்';

  @override
  String get webDiagnosticsOrigin => 'மூலம்';

  @override
  String get webDiagnosticsScheme => 'திட்டம்';

  @override
  String get webDiagnosticsPluginMode => 'செருகுநிரல் முறை';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC ஸ்கேன்';

  @override
  String get webDiagnosticsForcedServerUrl => 'கட்டாய சர்வர் URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'இயல்பு சர்வர் URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'கண்டுபிடிப்பு ப்ராக்ஸி URL';

  @override
  String get notConfigured => 'உள்ளமைக்கப்படவில்லை';

  @override
  String get webDiagnosticsMixedContent => 'கலப்பு உள்ளடக்கம்';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'இந்தப் பக்கம் HTTPS வழியாக ஏற்றப்படுகிறது, ஆனால் உள்ளமைக்கப்பட்ட ஒன்று அல்லது அதற்கு மேற்பட்ட URL கள் HTTP ஆக உள்ளன. HTTPS பக்கங்கள் HTTP API களை அழைப்பதை உலாவிகள் தடுக்கின்றன.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'தீர்வு: உங்கள் மீடியா சர்வர் அல்லது ப்ராக்ஸி எண்ட்பாயின்ட்டை HTTPS வழியாக வழங்கவும், அல்லது நம்பகமான உள்ளூர் நெட்வொர்க்குகளில் மட்டும் Moonfin ஐ HTTP வழியாக ஏற்றவும்.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'தற்போதைய இயக்க நேர அமைப்புகளிலிருந்து வெளிப்படையான கலப்பு-உள்ளடக்க உள்ளமைவு எதுவும் கண்டறியப்படவில்லை.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS சரிபார்ப்புப் பட்டியல்';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin இல் உலாவி மூலத்தை அனுமதிக்கவும்.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers இல் Authorization, X-Emby-Authorization மற்றும் X-Emby-Token ஐச் சேர்க்கவும்.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ஸ்ட்ரீமிங் மற்றும் தேடல் நடத்தைக்காக Content-Range மற்றும் Accept-Ranges ஐ வெளிப்படுத்தவும்.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight கோரிக்கைகளுக்கு 204 ஐத் திருப்பவும்.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'எடுத்துக்காட்டு தலைப்புத் துணுக்கு (nginx-பாணி)';

  @override
  String get note => 'குறிப்பு';

  @override
  String get webDiagnosticsNonWebNote =>
      'இந்தக் கண்டறிதல் வழி வலை பதிப்புகளுக்காக உருவாக்கப்பட்டது. வேறு தளத்தில் இதைப் பார்த்தால், இந்தச் சரிபார்ப்புகள் பொருந்தாமல் போகலாம்.';

  @override
  String get backToServerSelect => 'சர்வர் தேர்வுக்குத் திரும்பு';

  @override
  String get signOutAllUsers => 'எல்லா பயனர்களையும் வெளியேற்று';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'மைக்ரோஃபோன் அனுமதி நிரந்தரமாக மறுக்கப்பட்டது. சிஸ்டம் அமைப்புகளில் அதை இயக்கவும்.';

  @override
  String get voiceSearchPermissionRequired =>
      'குரல் தேடலுக்கு மைக்ரோஃபோன் அனுமதி தேவை.';

  @override
  String get voiceSearchNoMatch => 'அது புரியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get voiceSearchNoSpeechDetected => 'பேச்சு எதுவும் கண்டறியப்படவில்லை.';

  @override
  String get voiceSearchMicrophoneError => 'மைக்ரோஃபோன் பிழை.';

  @override
  String get voiceSearchNeedsInternet => 'குரல் தேடலுக்கு இணையம் தேவை.';

  @override
  String get voiceSearchServiceBusy =>
      'குரல் சேவை பயன்பாட்டில் உள்ளது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'மைக்ரோஃபோன் அனுமதி நிரந்தரமாக மறுக்கப்பட்டது.';

  @override
  String get microphonePermissionDenied => 'மைக்ரோஃபோன் அனுமதி மறுக்கப்பட்டது.';

  @override
  String get speechRecognitionUnavailable =>
      'இந்தச் சாதனத்தில் பேச்சு அறிதல் கிடைக்கவில்லை.';

  @override
  String get openIosRoutePicker => 'iOS வழி தேர்வியைத் திற';

  @override
  String get airPlayRoutePickerUnavailable =>
      'இந்தச் சாதனத்தில் AirPlay வழி தேர்வி கிடைக்கவில்லை.';

  @override
  String get videos => 'வீடியோக்கள்';

  @override
  String get programs => 'நிகழ்ச்சிகள்';

  @override
  String get songs => 'பாடல்கள்';

  @override
  String get photoAlbums => 'புகைப்பட ஆல்பங்கள்';

  @override
  String get photos => 'புகைப்படங்கள்';

  @override
  String get people => 'நபர்கள்';

  @override
  String get recentlyReleasedEpisodes => 'சமீபத்தில் வெளியான அத்தியாயங்கள்';

  @override
  String get watchAgain => 'மீண்டும் பார்';

  @override
  String get guestAppearances => 'விருந்தினர் தோற்றங்கள்';

  @override
  String get appearancesSeerr => 'தோற்றங்கள் (Seerr)';

  @override
  String get crewContributionsSeerr => 'குழுப் பங்களிப்புகள் (Seerr)';

  @override
  String get watchWithGroup => 'குழுவுடன் பார்';

  @override
  String get errors => 'பிழைகள்';

  @override
  String get warnings => 'எச்சரிக்கைகள்';

  @override
  String get disk => 'வட்டு';

  @override
  String get openInBrowser => 'உலாவியில் திற';

  @override
  String get embeddedBrowserNotAvailable =>
      'இந்தத் தளத்தில் உள்ளமைந்த உலாவி கிடைக்கவில்லை.';

  @override
  String get adminRestartServerConfirmation =>
      'சர்வரை நிச்சயமாக மறுதொடக்கம் செய்ய வேண்டுமா?';

  @override
  String get adminShutdownServerConfirmation =>
      'சர்வரை நிச்சயமாக அணைக்க வேண்டுமா? அதை நீங்கள் கைமுறையாக மறுதொடக்கம் செய்ய வேண்டியிருக்கும்.';

  @override
  String get internal => 'உள்ளகம்';

  @override
  String get idle => 'செயலற்று';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'பயனர்கள் எவரும் இல்லை';

  @override
  String get adminNoUsersMatchSearch =>
      'உங்கள் தேடலுக்குப் பொருந்தும் பயனர்கள் இல்லை';

  @override
  String get adminNoDevicesFound => 'சாதனங்கள் எதுவும் இல்லை';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'தற்போதைய வடிகட்டிகளுக்குப் பொருந்தும் சாதனங்கள் இல்லை';

  @override
  String get passwordSet => 'கடவுச்சொல் அமைக்கப்பட்டது';

  @override
  String get noPasswordConfigured => 'கடவுச்சொல் உள்ளமைக்கப்படவில்லை';

  @override
  String get remoteAccess => 'தொலைநிலை அணுகல்';

  @override
  String get localOnly => 'உள்ளூர் மட்டும்';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'மீடியா அனலிட்டிக்ஸை ஏற்ற முடியவில்லை';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'எல்லா மீடியா நூலகங்களிலும் இணைந்த அனலிட்டிக்ஸ்.';

  @override
  String get analyticsTopArtists => 'சிறந்த கலைஞர்கள்';

  @override
  String get analyticsTopAuthors => 'சிறந்த ஆசிரியர்கள்';

  @override
  String get analyticsTopContributors => 'சிறந்த பங்களிப்பாளர்கள்';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count நூலகங்கள்',
      one: '1 நூலகம்',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'இந்தத் தேர்வுக்கான அட்டவணைப்படுத்தப்பட்ட மீடியா மொத்தங்கள் இன்னும் கிடைக்கவில்லை.';

  @override
  String get analyticsLibraryDetails => 'நூலக விவரங்கள்';

  @override
  String get analyticsLibraryBreakdown => 'நூலக விவரப்பகுப்பு';

  @override
  String get analyticsNoLibrariesAvailable =>
      'நூலகங்கள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get adminServerAdministrationTitle => 'சர்வர் நிர்வாகம்';

  @override
  String get adminServerPathData => 'தரவு';

  @override
  String get adminServerPathImageCache => 'படக் கேச்';

  @override
  String get adminServerPathCache => 'கேச்';

  @override
  String get adminServerPathLogs => 'பதிவுகள்';

  @override
  String get adminServerPathMetadata => 'மெட்டாடேட்டா';

  @override
  String get adminServerPathTranscode => 'டிரான்ஸ்கோட்';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'இந்த சர்வர் எந்த சர்வர் பாதைகளையும் திருப்பவில்லை.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% பயன்படுத்தப்பட்டது';
  }

  @override
  String get userActivity => 'பயனர் செயல்பாடு';

  @override
  String get systemEvents => 'சிஸ்டம் நிகழ்வுகள்';

  @override
  String get needsAttention => 'கவனம் தேவை';

  @override
  String get adminDrawerSectionServer => 'சர்வர்';

  @override
  String get adminDrawerSectionPlayback => 'இயக்கம்';

  @override
  String get adminDrawerSectionDevices => 'சாதனங்கள்';

  @override
  String get adminDrawerSectionAdvanced => 'மேம்பட்டது';

  @override
  String get adminDrawerSectionPlugins => 'செருகுநிரல்கள்';

  @override
  String get adminDrawerSectionLiveTv => 'நேரலை டிவி';

  @override
  String get homeVideos => 'வீட்டு வீடியோக்கள்';

  @override
  String get mixedContent => 'கலப்பு உள்ளடக்கம்';

  @override
  String get homeVideosAndPhotos => 'வீட்டு வீடியோக்கள் & புகைப்படங்கள்';

  @override
  String get mixedMoviesAndShows => 'கலப்பு திரைப்படங்கள் & நிகழ்ச்சிகள்';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'பதிவுகள் எதுவும் இல்லை';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension காப்பகத்தில் படப் பக்கங்கள் எதுவும் இல்லை.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'உள்ளமைந்த ரெண்டரர் தோல்வியடைந்தது ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB ரெண்டரர் தோல்வியடைந்தது ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ரீடருக்கான உள்ளூர் கோப்பு காணவில்லை: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri இலிருந்து புத்தகத் தரவைத் திறக்கும்போது HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'படிக்கக்கூடிய புத்தக எண்ட்பாயின்ட் எதுவும் கிடைக்கவில்லை';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'ஆதரிக்கப்படாத காமிக் காப்பக வடிவம்: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'இந்தத் தளத்தில் CBR பிரித்தெடுத்தல் செருகுநிரல் கிடைக்கவில்லை.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr காப்பகத்தைப் பிரித்தெடுக்க முடியவில்லை.';

  @override
  String get cb7ExtractionUnavailable =>
      'இந்தத் தளத்தில் CB7 பிரித்தெடுத்தல் கிடைக்கவில்லை.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'இந்தத் தளத்தில் CB7 பிரித்தெடுத்தல் செருகுநிரல் கிடைக்கவில்லை.';

  @override
  String get closeGenrePanel => 'வகைப் பலகத்தை மூடு';

  @override
  String get loadingShuffle => 'கலைத்தல் ஏற்றப்படுகிறது...';

  @override
  String get libraryShuffleLabel => 'நூலக கலைத்தல்';

  @override
  String get randomShuffleLabel => 'சீரற்ற கலைத்தல்';

  @override
  String get genresShuffleLabel => 'வகைகள் கலைத்தல்';

  @override
  String get autoHdrSwitching => 'தானியங்கி HDR மாற்றம்';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR வீடியோ இயக்கத்திற்கு HDR ஐத் தானாக இயக்கி, வெளியேறும்போது காட்சி முறையை மீட்டமைக்கும்.';

  @override
  String get whenFullscreen => 'முழுத்திரையில் இருக்கும்போது';

  @override
  String get changeArtwork => 'கலைப்படைப்பை மாற்று';

  @override
  String get missing => 'காணவில்லை';

  @override
  String get transcodingLimits => 'டிரான்ஸ்கோடிங் வரம்புகள்';

  @override
  String get clearAllArtworkButton => 'எல்லா கலைப்படைப்புகளையும் அழிக்கவா?';

  @override
  String get clearAllArtworkWarning =>
      'பதிவிறக்கிய எல்லா கலைப்படைப்புகளையும் நிச்சயமாக அழிக்க வேண்டுமா?';

  @override
  String get confirmClear => 'அழித்தலை உறுதிசெய்';

  @override
  String confirmClearMessage(String itemType) {
    return 'இந்த $itemType ஐ நிச்சயமாக அழிக்க வேண்டுமா?';
  }

  @override
  String get uploadButton => 'பதிவேற்றவா?';

  @override
  String get resolutionLabel => 'தெளிவுத்திறன்: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'இடைமுக மொழியில் மட்டும் கலைப்படைப்பைக் காட்டு';

  @override
  String get confirmClearAll => 'அனைத்தையும் அழித்தலை உறுதிசெய்';

  @override
  String get imageUploadSuccess => 'படம் வெற்றிகரமாகப் பதிவேற்றப்பட்டது!';

  @override
  String imageUploadFailed(String error) {
    return 'படத்தைப் பதிவேற்ற முடியவில்லை: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'படத்தை அமைக்க முடியவில்லை: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'படத்தை நீக்க முடியவில்லை: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'எல்லா கலைப்படைப்புகளையும் அழிக்க முடியவில்லை: $error';
  }

  @override
  String get yes => 'ஆம்';

  @override
  String get posterCategory => 'போஸ்டர்';

  @override
  String get backdropsCategory => 'பின்னணிப் படங்கள்';

  @override
  String get bannerCategory => 'பேனர்';

  @override
  String get logoCategory => 'லோகோ';

  @override
  String get thumbnailCategory => 'சிறுபடம்';

  @override
  String get artCategory => 'கலை';

  @override
  String get discArtCategory => 'வட்டுக் கலை';

  @override
  String get screenshotCategory => 'ஸ்கிரீன்ஷாட்';

  @override
  String get boxCoverCategory => 'பெட்டி அட்டை';

  @override
  String get boxRearCoverCategory => 'பெட்டி பின் அட்டை';

  @override
  String get menuArtCategory => 'மெனு கலை';

  @override
  String get confirmItemPoster => 'போஸ்டர்';

  @override
  String get confirmItemBackdrop => 'பின்னணிப் படம்';

  @override
  String get confirmItemBanner => 'பேனர்';

  @override
  String get confirmItemLogo => 'லோகோ';

  @override
  String get confirmItemThumbnail => 'சிறுபடம்';

  @override
  String get confirmItemArt => 'கலை';

  @override
  String get confirmItemDiscArt => 'வட்டுக் கலை';

  @override
  String get confirmItemScreenshot => 'ஸ்கிரீன்ஷாட்';

  @override
  String get confirmItemBoxCover => 'பெட்டி அட்டை';

  @override
  String get confirmItemBoxRearCover => 'பெட்டி பின் அட்டை';

  @override
  String get confirmItemMenuArt => 'மெனு கலை';

  @override
  String get resolutionAll => 'அனைத்தும்';

  @override
  String get resolutionHigh => 'உயர் (1080p+)';

  @override
  String get resolutionMedium => 'நடுத்தரம் (720p)';

  @override
  String get resolutionLow => 'குறைவு (<720p)';

  @override
  String get sources => 'ஆதாரங்கள்';

  @override
  String get audiobookChapters => 'அத்தியாயங்கள்';

  @override
  String get audiobookBookmarks => 'புக்மார்க்குகள்';

  @override
  String get audiobookNotes => 'குறிப்புகள்';

  @override
  String get audiobookQueue => 'வரிசை';

  @override
  String get audiobookTimeline => 'காலவரிசை';

  @override
  String get audiobookTimelineEmpty => 'காலவரிசை காலியாக உள்ளது';

  @override
  String get audiobookWholeBook => 'முழுப் புத்தகம்';

  @override
  String get audiobookFocusedTimeline => 'மையப்படுத்திய காலவரிசை';

  @override
  String get audiobookExportBookmarks => 'புக்மார்க்குகளை ஏற்றுமதி செய்';

  @override
  String get audiobookExportNotes => 'குறிப்புகளை ஏற்றுமதி செய்';

  @override
  String get audiobookExportAll => 'அனைத்தையும் ஏற்றுமதி செய்';

  @override
  String audiobookExportSuccess(String path) {
    return '$path இற்கு ஏற்றுமதி செய்யப்பட்டது';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'ஏற்றுமதி தோல்வியடைந்தது: $error';
  }

  @override
  String get audiobookLyrics => 'பாடல் வரிகள்';

  @override
  String get audiobookAddBookmark => 'புக்மார்க்கைச் சேர்';

  @override
  String get audiobookAddNote => 'குறிப்பைச் சேர்';

  @override
  String get audiobookEditNote => 'குறிப்பைத் திருத்து';

  @override
  String get audiobookNoteHint => 'இந்தத் தருணத்திற்கு ஒரு குறிப்பை எழுதவும்';

  @override
  String get audiobookSleepTimer => 'தூக்க டைமர்';

  @override
  String get audiobookSleepOff => 'ஆஃப்';

  @override
  String get audiobookSleepEndOfChapter => 'அத்தியாயத்தின் முடிவில்';

  @override
  String get audiobookSleepCustom => 'தனிப்பயன்';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining மீதம்';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count நிமி',
      one: '1 நிமி',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'இயக்க வேகம்';

  @override
  String get audiobookRemainingTime => 'மீதம்';

  @override
  String get audiobookElapsedTime => 'கடந்தது';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'பின் $secondsவி';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'முன் $secondsவி';
  }

  @override
  String get audiobookPreviousChapter => 'முந்தைய அத்தியாயம்';

  @override
  String get audiobookNextChapter => 'அடுத்த அத்தியாயம்';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'அத்தியாயம் $current / $total';
  }

  @override
  String get audiobookNoChapters => 'அத்தியாயங்கள் இல்லை';

  @override
  String get audiobookNoBookmarks => 'இன்னும் புக்மார்க்குகள் இல்லை';

  @override
  String get audiobookNoNotes => 'இன்னும் குறிப்புகள் இல்லை';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position இல் புக்மார்க் சேர்க்கப்பட்டது';
  }

  @override
  String get audiobookSpeedReset => '1.0x க்கு மீட்டமை';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'சேமி';

  @override
  String get audiobookCancel => 'ரத்துசெய்';

  @override
  String get audiobookDelete => 'நீக்கு';

  @override
  String get subtitlePreferences => 'வசன வரி விருப்பங்கள்';

  @override
  String get subtitlePreferencesDescription =>
      'வசன வரி முறைகள், இயல்பு மொழிகள், தோற்றம் மற்றும் ரெண்டரிங் விருப்பங்களை மாற்றவும்.';

  @override
  String get subtitleRendering => 'வசன வரி ரெண்டரிங்';

  @override
  String get displayOptions => 'காட்சி விருப்பங்கள்';

  @override
  String get releaseDateAscending => 'வெளியீட்டுத் தேதி (ஏறுவரிசை)';

  @override
  String get releaseDateDescending => 'வெளியீட்டுத் தேதி (இறங்குவரிசை)';

  @override
  String get groupContributions => 'பங்களிப்புகளைக் குழுவாக்கு';

  @override
  String get groupMultipleRoles => 'பல பங்குகளைக் குழுவாக்கு';

  @override
  String get libraryWriteAccessWarningTitle => 'நூலக எழுத்து அணுகல் எச்சரிக்கை';

  @override
  String get libraryWriteAccessHowToFix => 'இதை எப்படிச் சரிசெய்வது:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. சர்வரில் உங்கள் மீடியா நூலகக் கோப்புறைகளுக்கு Jellyfin சேவை பயனருக்கு (எ.கா. jellyfin அல்லது Docker PUID/PGID) எழுது அனுமதிகளை வழங்கவும்.\n\n2. அல்லது, உங்கள் Jellyfin டாஷ்போர்டு -> Libraries க்குச் சென்று, இந்த நூலகத்தைத் திருத்தி, கலைப்படைப்பை Jellyfin இன் உள்ளக தரவுத்தளத்தில் சேமிக்க \'Save artwork into media folders\' ஐ முடக்கவும்.';

  @override
  String get dismiss => 'நிராகரி';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'உங்கள் \'$libraryName\' நூலகம் கலைப்படைப்பை நேரடியாக மீடியா கோப்புறைகளில் சேமிக்க உள்ளமைக்கப்பட்டுள்ளது (\'Save artwork into media folders\' இயக்கப்பட்டுள்ளது). இருப்பினும், Jellyfin எழுது அணுகலைச் சோதித்தபோது இந்த அடைவில் கோப்புகளை எழுத அனுமதி இல்லை:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'கலைப்படைப்பைப் புதுப்பிக்க Jellyfin தோல்வியடைந்தது போல் தெரிகிறது. உங்கள் நூலகம் கலைப்படைப்பை நேரடியாக மீடியா கோப்புறைகளில் சேமிக்க உள்ளமைக்கப்பட்டுள்ளது (\'Save artwork into media folders\' இயக்கப்பட்டுள்ளது). உங்கள் மீடியா அடைவுகளில் கோப்புகளை எழுத Jellyfin சர்வர் செயலுக்கு அனுமதி இல்லாதபோது இந்தப் பிழை பொதுவாக ஏற்படுகிறது.';

  @override
  String get externalLists => 'வெளிப்புறப் பட்டியல்கள்';

  @override
  String get replay => 'மீண்டும் இயக்கு';

  @override
  String get fileInformation => 'கோப்புத் தகவல்';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'அளவு: $size  •  வடிவம்: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'எல்லா ($count) ஆடியோ தடங்களையும் காட்டு';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'எல்லா ($count) வசன வரி தடங்களையும் காட்டு';
  }

  @override
  String get checkingDirectPlay => 'நேரடி இயக்கத் திறனைச் சரிபார்க்கிறது...';

  @override
  String get directPlayCapabilityLabel => 'நேரடி இயக்கத் திறன்: ';

  @override
  String get forced => 'கட்டாயம்';

  @override
  String get transcodeContainerNotSupported =>
      'கண்டெய்னர் வடிவத்தை பிளேயர் ஆதரிக்கவில்லை.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'வீடியோ கோடெக் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'ஆடியோ கோடெக் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'வசன வரி வடிவம் ஆதரிக்கப்படவில்லை (பதிவு தேவை).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ஆடியோ சுயவிவரம் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'வீடியோ சுயவிவரம் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'வீடியோ லெவல் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'இந்தச் சாதனத்தில் வீடியோ தெளிவுத்திறன் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'வீடியோ பிட் ஆழம் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'வீடியோ ஃபிரேம் ரேட் ஆதரிக்கப்படவில்லை.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'கோப்பு பிட்ரேட் பிளேயர் ஸ்ட்ரீமிங் வரம்பை மீறுகிறது.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'வீடியோ பிட்ரேட் ஸ்ட்ரீமிங் வரம்பை மீறுகிறது.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ஆடியோ பிட்ரேட் ஸ்ட்ரீமிங் வரம்பை மீறுகிறது.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ஆடியோ சேனல்களின் எண்ணிக்கை ஆதரிக்கப்படவில்லை.';

  @override
  String get sortAlphabetical => 'அகர வரிசை';

  @override
  String get sortReleaseAscending => 'வெளியீட்டு வரிசை (ஏறுவரிசை)';

  @override
  String get sortReleaseDescending => 'வெளியீட்டு வரிசை (இறங்குவரிசை)';

  @override
  String get sortCustomDragDrop => 'தனிப்பயன் (இழுத்து விடு)';

  @override
  String get playlistSortOptions => 'பிளேலிஸ்ட் வரிசை விருப்பங்கள்';

  @override
  String get resetSort => 'வரிசையை மீட்டமை';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode ஐ மீண்டும் பார்';
  }

  @override
  String get rewatchPlaylist => 'பிளேலிஸ்ட்டை மீண்டும் பார்';

  @override
  String get noSubtitlesFound => 'வசன வரிகள் எதுவும் இல்லை.';

  @override
  String get adminControls => 'நிர்வாகக் கட்டுப்பாடுகள்';

  @override
  String get impellerRendering => 'ரெண்டரிங் எஞ்சின் (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller என்பது மென்மையான அனிமேஷன்கள் மற்றும் குறைவான தடங்கலுக்கான Flutter இன் நவீன GPU ரெண்டரர். சில TV பாக்ஸ்கள் மற்றும் பழைய GPU களில் இது கோளாறுகள் அல்லது கருப்பு வீடியோவை ஏற்படுத்தலாம்; அவற்றைக் கண்டால் இதை அணைக்கவும். தானியங்கி உங்கள் சாதனத்திற்கு ஏற்ற சிறந்த இயல்பைத் தேர்வுசெய்யும். பயன்படுத்த Moonfin ஐ மறுதொடக்கம் செய்யவும்.';

  @override
  String get impellerAuto => 'தானியங்கி';

  @override
  String get impellerOn => 'ஆன்';

  @override
  String get impellerOff => 'ஆஃப்';

  @override
  String get impellerRestartTitle => 'மறுதொடக்கம் தேவை';

  @override
  String get impellerRestartMessage =>
      'ரெண்டரிங் எஞ்சினை மாற்ற Moonfin மறுதொடக்கம் செய்ய வேண்டும். இப்போது ஆப்பை மூடி, பயன்படுத்த மீண்டும் திறக்கவும்.';

  @override
  String get impellerCloseNow => 'இப்போது ஆப்பை மூடு';

  @override
  String get adminRefreshLibrary => 'நூலகத்தைப் புதுப்பி';

  @override
  String get adminRefreshAllLibraries => 'எல்லா நூலகங்களையும் புதுப்பி';

  @override
  String get adminRepoSortDateOldest => 'சேர்த்த தேதி (பழையது முதலில்)';

  @override
  String get adminRepoSortDateNewest => 'சேர்த்த தேதி (புதியது முதலில்)';

  @override
  String get adminRepoSortNameAsc => 'அகர வரிசை (A முதல் Z)';

  @override
  String get adminRepoSortNameDesc => 'அகர வரிசை (Z முதல் A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'சர்வர் அனலிட்டிக்ஸ் ஏற்றப்படுகிறது... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'மூலத்துடன் பொருந்து';

  @override
  String get imdbTop250Movies => 'IMDb சிறந்த 250 திரைப்படங்கள்';

  @override
  String get imdbTop250TvShows => 'IMDb சிறந்த 250 டிவி நிகழ்ச்சிகள்';

  @override
  String get imdbMostPopularMovies => 'IMDb மிகவும் பிரபலமான திரைப்படங்கள்';

  @override
  String get imdbMostPopularTvShows =>
      'IMDb மிகவும் பிரபலமான டிவி நிகழ்ச்சிகள்';

  @override
  String get imdbLowestRatedMovies =>
      'IMDb குறைந்த மதிப்பிடப்பட்ட திரைப்படங்கள்';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb சிறந்த மதிப்பிடப்பட்ட ஆங்கிலத் திரைப்படங்கள்';
}
