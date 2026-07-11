// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'மூன்ஃபின்';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'உள்நுழையவும்';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'விரைவான இணைப்பு';

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
  String get back => 'மீண்டும்';

  @override
  String get serverUnavailable => 'சேவையகம் கிடைக்கவில்லை';

  @override
  String get loginFailed => 'உள்நுழைவு தோல்வியடைந்தது';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'யார் பார்க்கிறார்கள்?';

  @override
  String get addUser => 'பயனரைச் சேர்க்கவும்';

  @override
  String get selectServer => 'சேவையகத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
      'பயன்பாட்டை மறுதொடக்கம் செய்யாமல் Moonfin மற்றும் Neon Pulse இடையே மாறவும்';

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
  String get themeMoonfin => 'மூன்ஃபின்';

  @override
  String get themeMoonfinSubtitle =>
      'தற்போதைய Moonfin நீங்கள் அனைவரும் விரும்பி இருக்கிறீர்கள்';

  @override
  String get themeNeonPulse => 'நியான் பல்ஸ்';

  @override
  String get themeNeonPulseSubtitle =>
      'மெஜந்தா பளபளப்பு, சியான் உரை மற்றும் வலுவான குரோம் மாறுபாடு கொண்ட சின்த்வேவ் ஸ்டைலிங்';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin இலிருந்து வெளியேறவா?';

  @override
  String get exitAppConfirmation => 'நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get exit => 'வெளியேறு';

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
  String get series => 'தொடர்';

  @override
  String get noItemsFound => 'பொருட்கள் எதுவும் கிடைக்கவில்லை';

  @override
  String get home => 'வீடு';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'இந்தக் கோப்புறை காலியாக உள்ளது';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
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
  String get discoverySubjects => 'கண்டுபிடிப்பு பாடங்கள்';

  @override
  String get pickDiscoverySubjects =>
      'டிஸ்கவரில் காட்ட வேண்டிய சப்ஜெக்ட் ஃபீட்களைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get apply => 'விண்ணப்பிக்கவும்';

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
    return '$count titles';
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
  String get resume => 'ரெஸ்யூம்';

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
  String get readyWhenYouAre => 'நீங்கள் இருக்கும் போது தயார்';

  @override
  String get details => 'விவரங்கள்';

  @override
  String get listeningRoom => 'கேட்கும் அறை';

  @override
  String get bookmarksAndProgress => 'புக்மார்க்குகள் & முன்னேற்றம்';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
  String get watched => 'பார்த்தேன்';

  @override
  String get unread => 'படிக்காதது';

  @override
  String get unwatched => 'பார்க்கப்படாதது';

  @override
  String get seriesStatus => 'தொடர் நிலை';

  @override
  String get allLibraries => 'அனைத்து நூலகங்கள்';

  @override
  String get books => 'புத்தகங்கள்';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'இந்த தலைப்பை இப்போது ஏற்ற முடியவில்லை.';

  @override
  String get audiobookDetails => 'ஆடியோ புத்தக விவரங்கள்';

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
  String get trackList => 'ட்ராக் பட்டியல்';

  @override
  String get itemListPlaceholder => 'உருப்படி பட்டியல் இங்கே தோன்றும்';

  @override
  String get favoriteTracksPlaceholder => 'பிடித்த டிராக்குகள் இங்கே தோன்றும்';

  @override
  String get failedToLoad => 'ஏற்றுவதில் தோல்வி';

  @override
  String get delete => 'நீக்கு';

  @override
  String get save => 'சேமிக்கவும்';

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
  String get seasons => 'பருவங்கள்';

  @override
  String get chapters => 'அத்தியாயங்கள்';

  @override
  String get features => 'அம்சங்கள்';

  @override
  String get movies => 'திரைப்படங்கள்';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'வெளியீட்டு தேதி தெரியவில்லை';

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
  String get view => 'காண்க';

  @override
  String get resumeReading => 'மீண்டும் படிக்கவும்';

  @override
  String get read => 'படிக்கவும்';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'விளையாடு';

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
  String get cast => 'நடிகர்கள்';

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
  String get renamePlaylist => 'பிளேலிஸ்ட்டை மறுபெயரிடவும்';

  @override
  String get playlistName => 'பிளேலிஸ்ட் பெயர்';

  @override
  String get deleteDownloadedAlbum => 'பதிவிறக்கம் செய்யப்பட்ட ஆல்பத்தை நீக்கு';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'உருப்படி நீக்கப்பட்டது';

  @override
  String get noPlayableTrailerFound => 'இயக்கக்கூடிய டிரெய்லர் எதுவும் இல்லை.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'ஆடியோ டிராக்';

  @override
  String get subtitleTrack => 'வசன வரி';

  @override
  String get none => 'இல்லை';

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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'வசனம் பதிவிறக்கப்பட்டது. Jellyfin உருப்படியைப் புதுப்பிக்கும் போது தோன்றுவதற்கு சிறிது நேரம் ஆகலாம்.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'பதிப்பைத் தேர்ந்தெடுக்கவும்';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles =>
      'பதிவிறக்கம் செய்யப்பட்ட கோப்புகளை நீக்கவும்';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'எழுத்தாளர்கள்';

  @override
  String get studio => 'ஸ்டுடியோ';

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
  String get showLess => 'குறைவாகக் காட்டு';

  @override
  String get readMore => 'மேலும் படிக்க';

  @override
  String get shuffle => 'கலக்கு';

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
  String get deviceVolume => 'சாதனத்தின் அளவு';

  @override
  String get unavailable => 'கிடைக்கவில்லை';

  @override
  String get pause => 'இடைநிறுத்தம்';

  @override
  String get syncPosition => 'ஒத்திசைவு நிலை';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'வரிசை காலியாக உள்ளது';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
  String get player => 'வீரர்';

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
  String get track => 'தடம்';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'பயன்பாட்டில் EPUB ரெண்டரிங் இன்னும் இந்த பிளாட்ஃபார்மில் கிடைக்கவில்லை.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'உட்பொதிக்கப்பட்ட ஆவண ரெண்டரிங் இந்த மேடையில் இல்லை.';

  @override
  String get couldNotOpenExternalViewer =>
      'வெளிப்புற பார்வையாளரைத் திறக்க முடியவில்லை.';

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
      'இதுவரை புக்மார்க்குகள் இல்லை.\nஉங்கள் நிலையைச் சேமிக்க, படிக்கும் போது புக்மார்க் ஐகானைத் தட்டவும்.';

  @override
  String get noTableOfContentsAvailable => 'உள்ளடக்க அட்டவணை இல்லை';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'பதவி';

  @override
  String get bookReader => 'புத்தக வாசிப்பாளர்';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'சேனல்கள் எதுவும் இல்லை';

  @override
  String get liveBadge => 'நேரலை';

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
  String get watch => 'பார்க்கவும்';

  @override
  String get close => 'மூடு';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'சீர் கணக்கு வகை';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'ஆல்பம்';

  @override
  String get playAlbum => 'ஆல்பத்தை இயக்கவும்';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'பருவம்';

  @override
  String get errorLoadingEpisodes => 'அத்தியாயங்களை ஏற்றுவதில் பிழை';

  @override
  String get noDownloadedEpisodes => 'பதிவிறக்கம் செய்யப்பட்ட எபிசோடுகள் இல்லை';

  @override
  String get deleteEpisode => 'அத்தியாயத்தை நீக்கு';

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
  String get seriesNotFound => 'தொடர் கிடைக்கவில்லை';

  @override
  String get errorLoadingSeries => 'தொடரை ஏற்றுவதில் பிழை';

  @override
  String get downloadedEpisodes => 'பதிவிறக்கம் செய்யப்பட்ட அத்தியாயங்கள்';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'இசை & ஆடியோ புத்தகங்கள்';

  @override
  String get images => 'படங்கள்';

  @override
  String get database => 'தரவுத்தளம்';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
      'Detail pages, home rows, and volume';

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
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get skipBackLength => 'Skip Back Length';

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
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'மூன்ஃபின்';

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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'ஒவ்வொரு வரிசை பட வகை';

  @override
  String get perRowSettings => 'ஒரு வரிசை அமைப்புகள்';

  @override
  String get autoLogin => 'தானியங்கு உள்நுழைவு';

  @override
  String get lastUser => 'கடைசி பயனர்';

  @override
  String get currentUser => '';

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
    return '$minutes min';
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
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'அழுகிய தக்காளி (விமர்சகர்கள்)';

  @override
  String get rottenTomatoesAudience => 'அழுகிய தக்காளி (பார்வையாளர்கள்)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'டிஎம்டிபி';

  @override
  String get metacritic => 'மெட்டாக்ரிடிக்';

  @override
  String get metacriticUser => 'மெட்டாக்ரிடிக் (பயனர்)';

  @override
  String get trakt => 'டிராக்ட்';

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
  String get pluginLabel => 'செருகுநிரல்';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => '';

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
  String get discoverRows => 'வரிசைகளைக் கண்டறியவும்';

  @override
  String get discoverRowsDescriptionPlugin =>
      'மறுவரிசைப்படுத்த இழுக்கவும். வரிசைகளை இயக்கவும் அல்லது முடக்கவும். இயக்கப்பட்ட வரிசை ஒழுங்கு Moonfin செருகுநிரலுடன் ஒத்திசைக்கப்படுகிறது.';

  @override
  String get discoverRowsDescription =>
      'மறுவரிசைப்படுத்த இழுக்கவும். வரிசைகளை இயக்கவும் அல்லது முடக்கவும்.';

  @override
  String get enabled => 'இயக்கப்பட்டது';

  @override
  String get hidden => 'மறைக்கப்பட்டது';

  @override
  String get aboutTitle => 'பற்றி';

  @override
  String versionValue(String version) {
    return 'Version $version';
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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'அறிவிப்புகளைப் புதுப்பிக்கவும்';

  @override
  String get showWhenUpdatesAvailable =>
      'புதுப்பிப்புகள் எப்போது கிடைக்கும் என்பதைக் காட்டு';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get clear => 'தெளிவு';

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
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'சீர் அமைப்புகள்';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
    return 'age $age';
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
  String get seasonsLabel => 'பருவங்கள்';

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
  String get edit => 'திருத்தவும்';

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
  String get trickplay => 'தந்திரம்';

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
  String get mute => 'முடக்கு';

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
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'டிரான்ஸ்கோடிங்';

  @override
  String get adminDrawerResume => 'ரெஸ்யூம்';

  @override
  String get adminDrawerStreaming => 'ஸ்ட்ரீமிங்';

  @override
  String get adminDrawerTrickplay => 'தந்திரம்';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get volume => 'தொகுதி';

  @override
  String get actions => 'செயல்கள்';

  @override
  String get videoCodec => 'வீடியோ கோடெக்';

  @override
  String get audioCodec => 'ஆடியோ கோடெக்';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'நிறைவு';

  @override
  String get direct => 'நேரடி';

  @override
  String get adminDisconnect => 'துண்டிக்கவும்';

  @override
  String get adminClearDates => 'தெளிவான தேதிகள்';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'சாதனத்தை நீக்கு';

  @override
  String get adminDeviceDeleted => 'சாதனம் நீக்கப்பட்டது';

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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'நூலகத்திற்கு மறுபெயரிடவும்';

  @override
  String get adminNewName => 'புதிய பெயர்';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'நூலகத்தை நீக்கு';

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
  String get adminRemovePath => 'பாதையை அகற்று';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'நூலக விருப்பங்கள் சேமிக்கப்பட்டன';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'நூலகத்தின் பெயர் தேவை';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'பயனர்களை ஏற்றுவதில் தோல்வி';

  @override
  String get adminSearchUsers => 'பயனர்களைத் தேடுங்கள்';

  @override
  String get adminEditUser => 'பயனரைத் திருத்து';

  @override
  String get adminAddUser => 'பயனரைச் சேர்க்கவும்';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'அனுமதிகள் சேமிக்கப்பட்டன';

  @override
  String get adminPasswordsMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
      'இது கடவுச்சொல்லை நீக்கிவிடும். கடவுச்சொல் இல்லாமல் பயனர் உள்நுழைய முடியும்.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'சர்வர் பதிலில் முக்கிய டோக்கன் இல்லை';

  @override
  String get adminRevokeApiKey => 'API விசையை ரத்துசெய்';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API விசை திரும்பப் பெறப்பட்டது';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
  String get adminCreatingBackup => 'காப்புப்பிரதியை உருவாக்குகிறது...';

  @override
  String get adminBackupCreated => 'காப்புப்பிரதி வெற்றிகரமாக உருவாக்கப்பட்டது';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'சேவையக பதிலில் காப்புப் பாதை இல்லை';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'மீட்டமைப்பை உறுதிப்படுத்தவும்';

  @override
  String get adminRestoringBackup => 'காப்புப்பிரதியை மீட்டெடுக்கிறது...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'பதிவில் தேடவும்';

  @override
  String get adminNoMatchingLines => 'பொருந்தக்கூடிய கோடுகள் இல்லை';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'திட்டமிடப்பட்ட பணிகள் எதுவும் இல்லை';

  @override
  String get adminNoTasksMatchFilter =>
      'தற்போதைய வடிப்பானுடன் எந்தப் பணியும் பொருந்தவில்லை';

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
  String get adminRunNow => 'இப்போது இயக்கவும்';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'வாரத்தின் நாள்';

  @override
  String get adminSearchPlugins => 'செருகுநிரல்களைத் தேடு...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'செருகுநிரலை நிறுவல் நீக்கவும்';

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
      'உங்கள் தேடலுடன் எந்த செருகுநிரல்களும் பொருந்தவில்லை';

  @override
  String get adminNoPluginsInstalled =>
      'செருகுநிரல்கள் எதுவும் நிறுவப்படவில்லை';

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
      'அமைப்புகளைத் திறக்க முடியவில்லை: அங்கீகார டோக்கன் இல்லை.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'செருகுநிரல் கிடைக்கவில்லை';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'எ.கா. Jellyfin நிலையானது';

  @override
  String get adminRepositoryUrl => 'களஞ்சிய URL';

  @override
  String get adminAddEntry => 'உள்ளீட்டைச் சேர்க்கவும்';

  @override
  String get adminInvalidUrl => 'தவறான URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved => 'ட்ரிக்ப்ளே அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get adminTrickplayLoadFailed =>
      'ட்ரிக்ப்ளே அமைப்புகளை ஏற்றுவதில் தோல்வி';

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
  String get adminBaseUrlHint => 'எ.கா. /ஜெல்லிஃபின்';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
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
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'உள்ளடக்க வகையைப் புதுப்பிக்கவும்';

  @override
  String get adminContentType => 'உள்ளடக்க வகை';

  @override
  String get adminContentTypeUpdated => 'உள்ளடக்க வகை புதுப்பிக்கப்பட்டது';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ஆதரிக்கப்படாத பட வடிவம்';

  @override
  String get adminImageReadFailed =>
      'தேர்ந்தெடுக்கப்பட்ட படத்தைப் படிக்க முடியவில்லை';

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
  String get adminAllProviders => 'அனைத்து வழங்குநர்கள்';

  @override
  String get adminNoRemoteImages => 'தொலை படங்கள் எதுவும் இல்லை';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'ட்யூனரைச் சேர்க்கவும்';

  @override
  String get adminTunerType => 'ட்யூனர் வகை';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, மற்றவை';

  @override
  String get adminUrlPath => 'URL / பாதை';

  @override
  String get adminNameOptional => 'பெயர் (விரும்பினால்)';

  @override
  String get adminTunerAdded => 'ட்யூனர் சேர்க்கப்பட்டது';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'வழிகாட்டி வழங்குநரைச் சேர்க்கவும்';

  @override
  String get adminProviderType => 'வழங்குநர் வகை';

  @override
  String get adminProviderTypeHint =>
      'அட்டவணைகள் டைரக்ட் அல்லது எக்ஸ்எம்எல்டிவி';

  @override
  String get adminUsernameOptional => 'பயனர்பெயர் (விரும்பினால்)';

  @override
  String get adminRefreshInterval => 'புதுப்பிப்பு இடைவெளி (மணிநேரம்)';

  @override
  String get adminProviderAdded => 'வழங்குநர் சேர்க்கப்பட்டார்';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'ட்யூனர் மீட்டமைப்பு கோரப்பட்டது';

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
  String get adminRecordingSettingsSaved => 'பதிவு அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'வழங்குநரைச் சேர்க்கவும்';

  @override
  String get adminNoListingProviders =>
      'பட்டியல் வழங்குநர்கள் எதுவும் உள்ளமைக்கப்படவில்லை';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'விண்ணப்பிக்கவும்';

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
  String get adminLogViewerNoMatches => 'பொருந்தக்கூடிய கோடுகள் இல்லை';

  @override
  String get adminMetadataEditorTitle => 'மெட்டாடேட்டா எடிட்டர்';

  @override
  String get adminMetadataIdentify => 'Identify';

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
      'தேர்ந்தெடுக்கப்பட்ட படத்தைப் படிக்க முடியவில்லை';

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
      'இது உருப்படியிலிருந்து தற்போதைய படத்தை நீக்குகிறது.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'உங்கள் தேடலுக்குப் பொருத்தமான தொகுப்புகள் எதுவும் இல்லை';

  @override
  String get adminPluginsCatalogEmpty => 'தொகுப்புகள் இல்லை';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'களஞ்சியத்தை அகற்று';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'அகற்று';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'வன்பொருள் முடுக்கம்';

  @override
  String get adminPlaybackHwAccelLabel => 'வன்பொருள் முடுக்கம்';

  @override
  String get adminPlaybackEnableHwEncoding => 'வன்பொருள் குறியாக்கத்தை இயக்கு';

  @override
  String get adminPlaybackEnableHwDecoding => 'வன்பொருள் டிகோடிங்கை இயக்கு:';

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
  String get adminRunningTasks => 'Running Tasks';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'இப்போது';

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
      'முன்னோட்ட சிறுபடங்களை தேடுவதற்கு ட்ரிக்பிளே பட உருவாக்கத்தை உள்ளமைக்கவும்.';

  @override
  String get adminNetworkingPublicHttpsPort => 'பொது HTTPS போர்ட்';

  @override
  String get adminNetworkingBaseUrl => 'அடிப்படை URL';

  @override
  String get adminNetworkingBaseUrlHint => 'எ.கா. /ஜெல்லிஃபின்';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'மெதுவான மறுமொழி வரம்பு (மிவி)';

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
  String get adminGeneralCachePath => 'கேச் பாதை';

  @override
  String get adminGeneralMetadataPath => 'மெட்டாடேட்டா பாதை';

  @override
  String get adminGeneralServerName => 'சர்வர் பெயர்';

  @override
  String get adminSettingsLoadFailed => 'அமைப்புகளை ஏற்றுவதில் தோல்வி';

  @override
  String get adminDiscover => 'கண்டறியவும்';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay அணுகல் மறுக்கப்பட்டது';

  @override
  String get syncPlayAccessDeniedMessage =>
      'இந்த SyncPlay குழுவில் ஒன்று அல்லது அதற்கு மேற்பட்ட உருப்படிகளுக்கான அணுகல் உங்களிடம் இல்லை. நூலக அனுமதிகளைச் சரிபார்க்க அல்லது வேறு வரிசையைத் தேர்வுசெய்ய குழு உரிமையாளரிடம் கேளுங்கள்.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get castRemotePlayback => 'ரிமோட் பிளேபேக்';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'சாதனத்தின் அளவு';

  @override
  String get castVolumeUnavailable => 'கிடைக்கவில்லை';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'தவறான பின்';

  @override
  String get pinMismatch => 'பின்கள் பொருந்தவில்லை';

  @override
  String get pinForgot => 'பின்னை மறந்துவிட்டீர்களா?';

  @override
  String get pinClear => 'தெளிவு';

  @override
  String get pinBackspace => 'பேக்ஸ்பேஸ்';

  @override
  String get quickConnectAuthorized =>
      'விரைவு இணைப்பு கோரிக்கை அங்கீகரிக்கப்பட்டது.';

  @override
  String get quickConnectInvalidOrExpired =>
      'விரைவு இணைப்பு குறியீடு தவறானது அல்லது காலாவதியானது.';

  @override
  String get quickConnectNotSupported =>
      'இந்த சர்வரில் Quick Connect ஆதரிக்கப்படவில்லை.';

  @override
  String get quickConnectAuthorizeFailed =>
      'விரைவு இணைப்புக் குறியீட்டை அங்கீகரிக்க முடியவில்லை.';

  @override
  String get quickConnectDisabled =>
      'இந்த சர்வரில் Quick Connect முடக்கப்பட்டுள்ளது.';

  @override
  String get quickConnectForbidden =>
      'இந்த விரைவு இணைப்பு கோரிக்கையை உங்கள் கணக்கால் அங்கீகரிக்க முடியாது.';

  @override
  String get quickConnectNotFound =>
      'விரைவு இணைப்புக் குறியீடு கிடைக்கவில்லை. புதிய குறியீட்டை முயற்சிக்கவும்.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'குறியீட்டை உள்ளிடவும்';

  @override
  String get quickConnectAuthorize => 'அங்கீகரிக்கவும்';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'நேரலை டிவி';

  @override
  String get continueWatchingAndNextUp => 'தொடர்ந்து பார்த்து & அடுத்தது';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'முந்தைய';

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
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

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
      'செருகுநிரல் ஒத்திசைவு, சீர், மதிப்பீடுகள் மற்றும் பல';

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
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

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
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

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
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
      'Moonbase கூடுதல் மதிப்பீட்டு ஆதாரங்கள், சீர் கோரிக்கைகள் மற்றும் ஒத்திசைக்கப்பட்ட விருப்பத்தேர்வுகள் உட்பட சர்வர் பக்க ஒருங்கிணைப்புகளை வழங்குகிறது.';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (மரபு)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
