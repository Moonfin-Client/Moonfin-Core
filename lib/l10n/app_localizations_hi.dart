// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'मूनफ़िन';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'दाखिल करना';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'त्वरित कनेक्ट';

  @override
  String get password => 'पासवर्ड';

  @override
  String get username => 'उपयोगकर्ता नाम';

  @override
  String get email => 'ईमेल';

  @override
  String get quickConnectInstruction =>
      'इस कोड को अपने सर्वर के वेब डैशबोर्ड पर दर्ज करें:';

  @override
  String get waitingForAuthorization => 'प्राधिकरण के लिए इंतजार करो...';

  @override
  String get back => 'पीछे';

  @override
  String get serverUnavailable => 'सर्वर अनुपलब्ध है';

  @override
  String get loginFailed => 'लॉगिन विफल';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'कौन देख रहा है?';

  @override
  String get addUser => 'उपयोगकर्ता जोड़ें';

  @override
  String get selectServer => 'सर्वर का चयन करें';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'सहेजे गए सर्वर';

  @override
  String get discoveredServers => 'खोजे गए सर्वर';

  @override
  String get noneFound => 'कोई नहीं मिला';

  @override
  String get unableToConnectToServer => 'सर्वर से कनेक्ट करने में असमर्थ है';

  @override
  String get addServer => 'सर्वर जोड़ें';

  @override
  String get embyConnect => 'Emby कनेक्ट करें';

  @override
  String get removeServer => 'सर्वर हटाएँ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'रद्द करना';

  @override
  String get remove => 'निकालना';

  @override
  String get connectToServer => 'सर्वर से कनेक्ट करें';

  @override
  String get serverAddress => 'सर्वर पता';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'जोड़ना';

  @override
  String get secureStorageUnavailable => 'सुरक्षित भंडारण अनुपलब्ध';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin आपके सिस्टम कीरिंग तक नहीं पहुंच सका। लॉगिन जारी रह सकता है, लेकिन कीरिंग अनलॉक होने तक सुरक्षित टोकन संग्रहण अनुपलब्ध हो सकता है।';

  @override
  String get ok => 'ठीक है';

  @override
  String get settingsAppearanceTheme => 'ऐप थीम';

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
      'ऐप को पुनरारंभ किए बिना Moonfin और Neon Pulse के बीच स्विच करें';

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
  String get themeMoonfin => 'मूनफ़िन';

  @override
  String get themeMoonfinSubtitle =>
      'वर्तमान Moonfin देखो आप सभी को पसंद आ गया है';

  @override
  String get themeNeonPulse => 'नियॉन पल्स';

  @override
  String get themeNeonPulseSubtitle =>
      'मैजेंटा चमक, सियान टेक्स्ट और मजबूत क्रोम कंट्रास्ट के साथ सिंथवेव स्टाइल';

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
      'Emby कनेक्ट या चयनित सर्वर से संपर्क करते समय नेटवर्क त्रुटि';

  @override
  String get emailOrUsername => 'ईमेल या उपयोगकर्ता का नाम';

  @override
  String get selectAServer => 'एक सर्वर चुनें';

  @override
  String get tryAgain => 'पुनः प्रयास करें';

  @override
  String get noLinkedServers => 'इस Emby कनेक्ट खाते से कोई सर्वर लिंक नहीं है';

  @override
  String get invalidEmbyConnectCredentials =>
      'अमान्य Emby क्रेडेंशियल कनेक्ट करें';

  @override
  String get invalidEmbyConnectLogin =>
      'अमान्य Emby उपयोगकर्ता नाम या पासवर्ड कनेक्ट करें';

  @override
  String get embyConnectExchangeNotSupported =>
      'सर्वर Emby कनेक्ट एक्सचेंज का समर्थन नहीं करता है';

  @override
  String get embyConnectNetworkError =>
      'Emby कनेक्ट या चयनित सर्वर से संपर्क करते समय नेटवर्क त्रुटि';

  @override
  String get loadingLinkedServers => 'लिंक किए गए सर्वर लोड हो रहे हैं...';

  @override
  String get connectingToServerEllipsis => 'सर्वर से कनेक्ट हो रहा है...';

  @override
  String get noReachableAddress => 'कोई पहुंच योग्य पता नहीं दिया गया';

  @override
  String get invalidServerExchangeResponse =>
      'सर्वर एक्सचेंज एंडपॉइंट से अमान्य प्रतिक्रिया';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin से बाहर निकलें?';

  @override
  String get exitAppConfirmation =>
      'क्या आप निश्चित हैं आपकी बाहर निकलने की इच्छा है?';

  @override
  String get exit => 'बाहर निकलना';

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
  String get noHomeRowsLoaded => 'कोई होम रो लोड नहीं किया जा सका';

  @override
  String get noHomeRowsHint =>
      'सक्रिय होम अनुभागों को ताज़ा करने या कम करने का प्रयास करें।';

  @override
  String get retryHomeRows => 'होम पंक्तियाँ पुनः प्रयास करें';

  @override
  String get guide => 'मार्गदर्शक';

  @override
  String get recordings => 'रिकॉर्डिंग';

  @override
  String get schedule => 'अनुसूची';

  @override
  String get series => 'शृंखला';

  @override
  String get noItemsFound => 'कोई आइटम नहीं मिला';

  @override
  String get home => 'घर';

  @override
  String get browseAll => 'सभी ब्राउज़ करें';

  @override
  String get genres => 'शैलियां';

  @override
  String get collectionPlaceholder => 'संग्रह आइटम यहां दिखाई देंगे';

  @override
  String get browseByLetter => 'पत्र द्वारा ब्राउज़ करें';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'यहां वर्णमाला क्रम में ब्राउज़ दिखाई देगा';

  @override
  String get suggestions => 'सुझाव';

  @override
  String get suggestionsPlaceholder => 'सुझाए गए आइटम यहां दिखाई देंगे';

  @override
  String get failedToLoadLibraries => 'लाइब्रेरीज़ लोड करने में विफल';

  @override
  String get noLibrariesFound => 'कोई लाइब्रेरी नहीं मिली';

  @override
  String get library => 'पुस्तकालय';

  @override
  String get displaySettings => 'प्रदर्शन सेटिंग्स';

  @override
  String get allGenres => 'सभी शैलियाँ';

  @override
  String get noGenresFound => 'कोई शैलियाँ नहीं मिलीं';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'यह फ़ोल्डर खाली है';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'पसंदीदा लोड करने में विफल';

  @override
  String get retry => 'पुन: प्रयास करें';

  @override
  String get noFavoritesYet => 'अभी तक कोई पसंदीदा नहीं';

  @override
  String get favorites => 'पसंदीदा';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'सतत';

  @override
  String get ended => 'समाप्त';

  @override
  String get sortAndFilter => 'क्रमबद्ध एवं फ़िल्टर करें';

  @override
  String get type => 'प्रकार';

  @override
  String get sortBy => 'इसके अनुसार क्रमबद्ध करें';

  @override
  String get display => 'प्रदर्शन';

  @override
  String get imageType => 'छवि प्रकार';

  @override
  String get posterSize => 'पोस्टर का आकार';

  @override
  String get small => 'छोटा';

  @override
  String get medium => 'मध्यम';

  @override
  String get large => 'बड़ा';

  @override
  String get extraLarge => 'एक्स्ट्रा लार्ज';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'दृश्य';

  @override
  String get albums => 'एलबम';

  @override
  String get albumArtists => 'एल्बम कलाकार';

  @override
  String get artists => 'कलाकार';

  @override
  String get bookmarks => 'बुकमार्क';

  @override
  String get noSavedBookmarks =>
      'इस शीर्षक के लिए अभी तक कोई सहेजा गया बुकमार्क नहीं है.';

  @override
  String get openBook => 'किताब खोलें';

  @override
  String get chapter => 'अध्याय';

  @override
  String get page => 'पेज';

  @override
  String get bookmark => 'बुकमार्क';

  @override
  String get justNow => 'बस अब';

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
  String get discoverySubjects => 'खोज विषय';

  @override
  String get pickDiscoverySubjects =>
      'चुनें कि डिस्कवर में कौन सा विषय फ़ीड दिखाना है।';

  @override
  String get apply => 'आवेदन करना';

  @override
  String get openLink => 'खुला लिंक';

  @override
  String get scanWithYourPhone => 'अपने फ़ोन से स्कैन करें';

  @override
  String get audiobookGenres => 'ऑडियोबुक शैलियाँ';

  @override
  String get pickAudiobookGenres =>
      'चुनें कि ऑडियोबुक डिस्कवर में कौन सी शैलियाँ दिखानी हैं।';

  @override
  String get discoverAudiobooks => 'ऑडियोबुक खोजें';

  @override
  String get librivoxDescription =>
      'LibriVox से लोकप्रिय सार्वजनिक डोमेन शीर्षक।';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'बाएँ स्क्रॉल करें';

  @override
  String get scrollRight => 'दाईं ओर स्क्रॉल करें';

  @override
  String get couldNotLoadGenre => 'अभी इस शैली को लोड नहीं किया जा सका.';

  @override
  String get continueReading => 'जारी रखें पढ़ रहे हैं';

  @override
  String get savedHighlights => 'सहेजे गए हाइलाइट्स';

  @override
  String get continueListening => 'सुनना जारी रखें';

  @override
  String get listen => 'सुनना';

  @override
  String get resume => 'फिर शुरू करना';

  @override
  String get failedToLoadLibrary => 'लाइब्रेरी लोड करने में विफल';

  @override
  String get popularNow => 'अब लोकप्रिय';

  @override
  String get savedForLater => 'बाद के लिए सहेजा गया';

  @override
  String get topListens => 'शीर्ष श्रोता';

  @override
  String get unreadDiscoveries => 'अपठित खोजें';

  @override
  String get pickUpAgain => 'फिर से उठाओ';

  @override
  String get bookHighlightsDescription =>
      'हाइलाइट्स, पसंदीदा या पढ़ने की प्रगति वाली आपकी किताबें।';

  @override
  String get handPickedFromLibrary => 'आपकी लाइब्रेरी से हाथ से चुना गया।';

  @override
  String get handPickedFromListeningQueue =>
      'आपकी सुनने वाली कतार से हाथ से चुना गया।';

  @override
  String get booksWithHighlights =>
      'हाइलाइट्स, पसंदीदा या पढ़ने की प्रगति वाली किताबें।';

  @override
  String get jumpBackNarration => 'अपनी जगह की तलाश किए बिना कथन में वापस आएँ।';

  @override
  String get unreadBooksReady =>
      'अपठित पुस्तकें अगले शांत घंटे के लिए तैयार हैं।';

  @override
  String get quickAccessFavorites =>
      'जिन पुस्तकों पर आप बार-बार आते हैं उन तक त्वरित पहुंच।';

  @override
  String get searchAudiobooks => 'ऑडियोबुक खोजें';

  @override
  String get searchYourLibrary => 'अपनी लाइब्रेरी खोजें';

  @override
  String get pickUpStory => 'कहानी वहीं से शुरू करें जहां आपने छोड़ी थी';

  @override
  String get savedPlacesChapters => 'आपके सहेजे गए स्थान और अधूरे अध्याय';

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
  String get readyWhenYouAre => 'तैयार जब आप हैं';

  @override
  String get details => 'विवरण';

  @override
  String get listeningRoom => 'श्रवण कक्ष';

  @override
  String get bookmarksAndProgress => 'बुकमार्क और प्रगति';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'टाइटल';

  @override
  String get allTitles => 'सभी शीर्षक';

  @override
  String get authors => 'लेखक';

  @override
  String get browseByAuthor => 'लेखक द्वारा ब्राउज़ करें';

  @override
  String get browseByGenre => 'शैली के अनुसार ब्राउज़ करें';

  @override
  String get discover => 'खोज करना';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library से विषय के अनुसार रुझान वाले शीर्षक।';

  @override
  String get noBookmarkedItems => 'अभी तक कोई बुकमार्क किया गया आइटम नहीं';

  @override
  String get nothingMatchesSection =>
      'अभी तक इस अनुभाग से कुछ भी मेल नहीं खाता है. कोई अन्य टैब आज़माएँ या लाइब्रेरी सिंक समाप्त होने के बाद वापस आएँ।';

  @override
  String get audiobooks => 'ऑडियो पुस्तकें';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'फ़ोल्डर';

  @override
  String get filters => 'फिल्टर';

  @override
  String get readingStatus => 'पढ़ने की स्थिति';

  @override
  String get playedStatus => 'खेला स्थिति';

  @override
  String get readStatus => 'पढ़ना';

  @override
  String get watched => 'देखे';

  @override
  String get unread => 'अपठित ग';

  @override
  String get unwatched => 'नहीं देखा गया';

  @override
  String get seriesStatus => 'शृंखला स्थिति';

  @override
  String get allLibraries => 'सभी पुस्तकालय';

  @override
  String get books => 'किताबें';

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
  String get author => 'लेखक';

  @override
  String get unknownAuthor => 'अज्ञात लेखक';

  @override
  String get uncategorized => 'अवर्गीकृत';

  @override
  String get overview => 'सिंहावलोकन';

  @override
  String get noLibrivoxDescription =>
      'इस शीर्षक के लिए LibriVox द्वारा अभी तक कोई विवरण उपलब्ध नहीं कराया गया है।';

  @override
  String get readers => 'पाठकों';

  @override
  String get openLinks => 'लिंक खोलें';

  @override
  String get librivoxPage => 'LibriVox पेज';

  @override
  String get internetArchive => 'इंटरनेट पुरालेख';

  @override
  String get rssFeed => 'आरएसएस फीड';

  @override
  String get downloadZip => 'ज़िप डाउनलोड करें';

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
      'इस शीर्षक के लिए Open Library से अभी तक कोई अवलोकन उपलब्ध नहीं है।';

  @override
  String get subjects => 'विषयों';

  @override
  String get all => 'सभी';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'इस विषय को अभी लोड नहीं किया जा सका.';

  @override
  String get audiobookDetails => 'ऑडियोबुक विवरण';

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
  String get trackList => 'ट्रैक सूची';

  @override
  String get itemListPlaceholder => 'आइटम सूची यहां दिखाई देगी';

  @override
  String get favoriteTracksPlaceholder => 'पसंदीदा ट्रैक यहां दिखाई देंगे';

  @override
  String get failedToLoad => 'लोड करने में विफल';

  @override
  String get delete => 'मिटाना';

  @override
  String get save => 'बचाना';

  @override
  String get moreLikeThis => 'इसे और भी पसंद करें';

  @override
  String get castAndCrew => 'कलाकार समूह';

  @override
  String get collection => 'संग्रह';

  @override
  String get episodes => 'एपिसोड';

  @override
  String get nextUp => 'अगला ऊपर';

  @override
  String get seasons => 'मौसम के';

  @override
  String get chapters => 'अध्याय';

  @override
  String get features => 'विशेषताएँ';

  @override
  String get movies => 'चलचित्र';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'अन्य';

  @override
  String get discography => 'डिस्कोग्राफी';

  @override
  String get similarArtists => 'समान कलाकार';

  @override
  String get tableOfContents => 'विषयसूची';

  @override
  String get tracklist => 'ट्रैकलिस्ट';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'जीवनी';

  @override
  String get authorDetails => 'लेखक विवरण';

  @override
  String get noOverviewAvailable =>
      'इस शीर्षक के लिए अभी तक कोई अवलोकन उपलब्ध नहीं है.';

  @override
  String get noBiographyAvailable => 'इस लेखक की कोई जीवनी उपलब्ध नहीं है.';

  @override
  String get noBooksFound => 'इस लेखक के लिए कोई पुस्तक नहीं मिली.';

  @override
  String get unableToLoadAuthorDetails => 'अभी लेखक विवरण लोड करने में असमर्थ.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'प्रकाशन तिथि अज्ञात';

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
  String get view => 'देखना';

  @override
  String get resumeReading => 'पढ़ना फिर से शुरू करें';

  @override
  String get read => 'पढ़ना';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'खेल';

  @override
  String get startOver => 'प्रारंभ करें';

  @override
  String get restart => 'पुनः आरंभ करें';

  @override
  String get readOffline => 'ऑफ़लाइन पढ़ें';

  @override
  String get playOffline => 'ऑफ़लाइन खेले';

  @override
  String get audio => 'ऑडियो';

  @override
  String get subtitles => 'उपशीर्षक';

  @override
  String get version => 'संस्करण';

  @override
  String get cast => 'ढालना';

  @override
  String get trailer => 'ट्रेलर';

  @override
  String get finished => 'खत्म';

  @override
  String get favorited => 'पसंदीदा';

  @override
  String get favorite => 'पसंदीदा';

  @override
  String get playlist => 'प्लेलिस्ट';

  @override
  String get downloaded => 'डाउनलोड';

  @override
  String get downloadAll => 'सभी डाउनलोड करें';

  @override
  String get download => 'डाउनलोड करना';

  @override
  String get deleteDownloaded => 'डाउनलोड हटाएँ';

  @override
  String get goToSeries => 'श्रृंखला पर जाएँ';

  @override
  String get editMetadata => 'मेटाडेटा संपादित करें';

  @override
  String get less => 'कम';

  @override
  String get more => 'अधिक';

  @override
  String get deleteItem => 'आइटम हटाएँ';

  @override
  String get deletePlaylist => 'प्लेलिस्ट हटाएँ';

  @override
  String get deletePlaylistMessage => 'सर्वर से यह प्लेलिस्ट हटाएं?';

  @override
  String get deleteItemMessage => 'सर्वर से यह आइटम हटाएं?';

  @override
  String get failedToDeletePlaylist => 'प्लेलिस्ट हटाने में विफल';

  @override
  String get failedToDeleteItem => 'आइटम हटाने में विफल';

  @override
  String get renamePlaylist => 'प्लेलिस्ट का नाम बदलें';

  @override
  String get playlistName => 'प्लेलिस्ट का नाम';

  @override
  String get deleteDownloadedAlbum => 'डाउनलोड किया गया एल्बम हटाएँ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'डाउनलोड किए गए ट्रैक हटा दिए गए';

  @override
  String get downloadedTracksDeleteFailed =>
      'कुछ डाउनलोड किए गए ट्रैक हटाए नहीं जा सके';

  @override
  String get noTracksLoaded => 'कोई ट्रैक लोड नहीं किया गया';

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
  String get itemDeleted => 'आइटम हटा दिया गया';

  @override
  String get noPlayableTrailerFound => 'कोई चलाने योग्य ट्रेलर नहीं मिला.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'ऑडियो ट्रैक';

  @override
  String get subtitleTrack => 'उपशीर्षक ट्रैक';

  @override
  String get none => 'कोई नहीं';

  @override
  String get downloadSubtitlesLabel => 'उपशीर्षक डाउनलोड करें...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles प्लगइन का उपयोग करके खोजें';

  @override
  String get downloadSubtitles => 'उपशीर्षक डाउनलोड करें';

  @override
  String get selectedSubtitleInvalid => 'चयनित उपशीर्षक अमान्य है.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'उपशीर्षक डाउनलोड किया गया. Jellyfin आइटम को रीफ्रेश करते समय इसे प्रदर्शित होने में कुछ समय लग सकता है।';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'संस्करण चुनें';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'सभी डाउनलोड करें - गुणवत्ता';

  @override
  String get downloadQuality => 'गुणवत्ता डाउनलोड करें';

  @override
  String get originalFileNoReencoding => 'मूल फ़ाइल, कोई पुनः एन्कोडिंग नहीं';

  @override
  String get originalFilesNoReencoding =>
      'मूल फ़ाइलें, कोई पुनः एन्कोडिंग नहीं';

  @override
  String get noEpisodesLoaded => 'कोई एपिसोड लोड नहीं किया गया';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'डाउनलोड की गई फ़ाइलें हटाएँ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'डाउनलोड की गई फ़ाइलें हटा दी गईं';

  @override
  String get failedToDeleteFiles => 'फ़ाइलें हटाने में विफल';

  @override
  String get deleteFiles => 'फाइलों को नष्ट';

  @override
  String get director => 'निदेशक';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'लेखक';

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
  String get showLess => 'कम दिखाएँ';

  @override
  String get readMore => 'और पढ़ें';

  @override
  String get shuffle => 'मिश्रण';

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
  String get perfectMatch => 'बहतरीन मैच';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'मोनो';

  @override
  String get stereo => 'स्टीरियो';

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
  String get deleteSeasonFiles => 'इस सीज़न में सभी डाउनलोड किए गए एपिसोड';

  @override
  String get stillWatching => 'अभी भी देख रहे हैं?';

  @override
  String get unableToLoadTrailerStream => 'ट्रेलर स्ट्रीम लोड करने में असमर्थ.';

  @override
  String get trailerTimedOut => 'लोड करते समय ट्रेलर का समय समाप्त हो गया।';

  @override
  String get playbackFailedForTrailer => 'इस ट्रेलर के लिए प्लेबैक विफल रहा.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ऑफ़लाइन प्लेबैक के दौरान कास्टिंग अनुपलब्ध है.';

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
  String get deviceVolume => 'डिवाइस वॉल्यूम';

  @override
  String get unavailable => 'अनुपलब्ध';

  @override
  String get pause => 'विराम';

  @override
  String get syncPosition => 'सिंक स्थिति';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'कतार खाली है';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'रिमोट प्लेबैक';

  @override
  String get castingToGoogleCast => 'Google Cast पर कास्टिंग';

  @override
  String get castingViaAirPlay => 'AirPlay के माध्यम से कास्टिंग';

  @override
  String get castingViaDlna => 'DLNA के माध्यम से कास्टिंग';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'अनलॉक करने के लिए देर तक दबाएं';

  @override
  String get off => 'बंद';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ऑटो';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'बिटरेट ओवरराइड';

  @override
  String get audioDelay => 'ऑडियो विलंब';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'उपशीर्षक विलंब';

  @override
  String get reset => 'रीसेट करें';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get playbackInformation => 'प्लेबैक सूचना';

  @override
  String get playback => 'प्लेबैक';

  @override
  String get playMethod => 'खेलने की विधि';

  @override
  String get directPlay => 'डायरेक्ट प्ले';

  @override
  String get directStream => 'सीधी धारा';

  @override
  String get transcoding => 'ट्रांसकोडिंग';

  @override
  String get transcodeReasons => 'ट्रांसकोड कारण';

  @override
  String get player => 'खिलाड़ी';

  @override
  String get container => 'पात्र';

  @override
  String get bitrate => 'बिटरेट';

  @override
  String get video => 'वीडियो';

  @override
  String get resolution => 'संकल्प';

  @override
  String get hdr => 'एचडीआर';

  @override
  String get codec => 'कोडेक';

  @override
  String get videoBitrate => 'वीडियो बिटरेट';

  @override
  String get track => 'रास्ता';

  @override
  String get channels => 'चैनल';

  @override
  String get audioBitrate => 'ऑडियो बिटरेट';

  @override
  String get sampleRate => 'नमूना दर';

  @override
  String get format => 'प्रारूप';

  @override
  String get external => 'बाहरी';

  @override
  String get embedded => 'अंतर्निहित';

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
      'EPUB रेंडरिंग इन-ऐप अभी इस प्लेटफ़ॉर्म पर उपलब्ध नहीं है।';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'इस प्लेटफ़ॉर्म पर एंबेडेड दस्तावेज़ रेंडरिंग उपलब्ध नहीं है।';

  @override
  String get couldNotOpenExternalViewer => 'बाहरी व्यूअर नहीं खुल सका.';

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
      'अभी तक कोई बुकमार्क नहीं.\nअपनी स्थिति बचाने के लिए पढ़ते समय बुकमार्क आइकन पर टैप करें।';

  @override
  String get noTableOfContentsAvailable =>
      'सामग्री की कोई तालिका उपलब्ध नहीं है';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'पद';

  @override
  String get bookReader => 'पुस्तक पाठक';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'अद्यतन किया जा रहा है...';

  @override
  String get markUnread => 'अपठित चिन्हित करो';

  @override
  String get markAsRead => 'पढ़े हुए का चिह्न';

  @override
  String get reloadReader => 'रीडर पुनः लोड करें';

  @override
  String get noPagesFound => 'कोई पेज नहीं मिला.';

  @override
  String get failedToDecodePageImage => 'पृष्ठ छवि को डिकोड करने में विफल.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'एकल पृष्ठ';

  @override
  String get twoPageSpread => 'दो पेज का प्रसार';

  @override
  String get addBookmark => 'बुकमार्क जोड़ें';

  @override
  String get bookmarksEllipsis => 'बुकमार्क...';

  @override
  String get markedAsRead => 'पठित के रूप में चिह्नित किया गया';

  @override
  String get markedAsUnread => 'अपठित के रूप में चिह्नित किया गया';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'थीम: सिस्टम';

  @override
  String get themeLight => 'थीम: प्रकाश';

  @override
  String get themeDark => 'थीम: अंधेरा';

  @override
  String get themeSepia => 'थीम: सीपिया';

  @override
  String get invertColorsFixedLayout => 'रंग उलटा करें (निश्चित लेआउट)';

  @override
  String get invertColorsPdf => 'रंग उलटें (पीडीएफ)';

  @override
  String get preparingInAppReader => 'इन-ऐप रीडर तैयार किया जा रहा है...';

  @override
  String get pdfDataNotAvailable => 'पीडीएफ डेटा उपलब्ध नहीं है.';

  @override
  String get readerFallbackModeActive => 'रीडर फ़ॉलबैक मोड सक्रिय';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'समर्थित प्लेटफ़ॉर्म लक्ष्य (एंड्रॉइड, आईओएस, मैकओएस) पर स्विच करने के बाद रीलोड रीडर का उपयोग करें।';

  @override
  String get openExternally => 'बाह्य रूप से खोलें';

  @override
  String get noEpubChaptersFound => 'कोई EPUB अध्याय नहीं मिला.';

  @override
  String get readerNotReady => 'पाठक तैयार नहीं.';

  @override
  String get seriesRecordings => 'श्रृंखला रिकॉर्डिंग';

  @override
  String get now => 'अब';

  @override
  String get sports => 'खेल';

  @override
  String get news => 'समाचार';

  @override
  String get kids => 'बच्चे';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideTimeline => 'गाइड टाइमलाइन';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'कोई चैनल नहीं मिला';

  @override
  String get liveBadge => 'रहना';

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
  String get movie => 'चलचित्र';

  @override
  String get removedFromFavoriteChannels => 'पसंदीदा चैनलों से हटा दिया गया';

  @override
  String get addedToFavoriteChannels => 'पसंदीदा चैनलों में जोड़ा गया';

  @override
  String get failedToUpdateFavoriteChannel =>
      'पसंदीदा चैनल अपडेट करने में विफल';

  @override
  String get unfavoriteChannel => 'पसंदीदा चैनल';

  @override
  String get favoriteChannel => 'पसंदीदा चैनल';

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
  String get watch => 'घड़ी';

  @override
  String get close => 'बंद करना';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'रिकॉर्डिंग लोड करने में विफल';

  @override
  String get scheduledInNext24Hours => 'अगले 24 घंटों में शेड्यूल किया गया';

  @override
  String get recentRecordings => 'हाल की रिकॉर्डिंग';

  @override
  String get tvSeries => 'टीवी श्रृंखला';

  @override
  String get failedToLoadSchedule => 'शेड्यूल लोड करने में विफल';

  @override
  String get noScheduledRecordings => 'कोई निर्धारित रिकॉर्डिंग नहीं';

  @override
  String get cancelRecording => 'रिकॉर्डिंग रद्द करें?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'नहीं';

  @override
  String get yesCancel => 'हाँ, रद्द करें';

  @override
  String get failedToCancelRecording => 'रिकॉर्डिंग रद्द करने में विफल';

  @override
  String get failedToLoadSeriesRecordings =>
      'श्रृंखला रिकॉर्डिंग लोड करने में विफल';

  @override
  String get noSeriesRecordings => 'कोई श्रृंखला रिकॉर्डिंग नहीं';

  @override
  String get cancelSeriesRecording => 'सीरीज रिकॉर्डिंग रद्द करें';

  @override
  String get cancelSeriesRecordingQuestion => 'श्रृंखला रिकॉर्डिंग रद्द करें?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'श्रृंखला रिकॉर्डिंग रद्द करने में विफल';

  @override
  String get searchThisLibrary => 'यह लाइब्रेरी खोजें...';

  @override
  String get searchEllipsis => 'खोज...';

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
  String get seerrAccountType => 'द्रष्टा खाता प्रकार';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'स्थानीय';

  @override
  String get savedMedia => 'सहेजा गया मीडिया';

  @override
  String get tvShows => 'टीवी शो';

  @override
  String get music => 'संगीत';

  @override
  String get musicAlbums => 'संगीत एलबम';

  @override
  String get noMediaInFilter => 'इस फ़िल्टर में कोई मीडिया नहीं';

  @override
  String get noDownloadedMediaYet => 'अभी तक कोई डाउनलोड किया गया मीडिया नहीं';

  @override
  String get browseLibrary => 'लाइब्रेरी ब्राउज़ करें';

  @override
  String get deleteDownload => 'डाउनलोड हटाएँ';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'एल्बम';

  @override
  String get playAlbum => 'एल्बम चलायें';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'मौसम';

  @override
  String get errorLoadingEpisodes => 'एपिसोड लोड करने में त्रुटि';

  @override
  String get noDownloadedEpisodes => 'कोई डाउनलोड किया गया एपिसोड नहीं';

  @override
  String get deleteEpisode => 'एपिसोड हटाएँ';

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
  String get seriesNotFound => 'श्रृंखला नहीं मिली';

  @override
  String get errorLoadingSeries => 'श्रृंखला लोड करने में त्रुटि';

  @override
  String get downloadedEpisodes => 'डाउनलोड किए गए एपिसोड';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'स्पेशल';

  @override
  String get deleteSeason => 'सीज़न हटाएँ';

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
  String get storageManagement => 'भंडारण प्रबंधन';

  @override
  String get storageBreakdown => 'भंडारण टूटना';

  @override
  String get downloadedItems => 'डाउनलोड किए गए आइटम';

  @override
  String get storageLimit => 'भंडारण सीमा';

  @override
  String get noLimit => 'कोई सीमा नहीं';

  @override
  String get deleteAllDownloads => 'सभी डाउनलोड हटाएँ';

  @override
  String get deleteAllDownloadsWarning =>
      'यह सभी डाउनलोड की गई मीडिया फ़ाइलों को हटा देगा और इसे पूर्ववत नहीं किया जा सकेगा।';

  @override
  String get deleteAll => 'सभी हटा दो';

  @override
  String get deleteSelected => 'चयनित को हटाओ';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'संगीत और ऑडियोबुक';

  @override
  String get images => 'इमेजिस';

  @override
  String get database => 'डेटाबेस';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get authentication => 'प्रमाणीकरण';

  @override
  String get autoLoginServerManagement => 'ऑटो लॉगिन, सर्वर प्रबंधन';

  @override
  String get pinCode => 'पिन कोड';

  @override
  String get setUpPinCodeProtection => 'पिन कोड सुरक्षा सेट करें';

  @override
  String get parentalControls => 'माता-पिता का नियंत्रण';

  @override
  String get contentRatingRestrictions => 'सामग्री रेटिंग प्रतिबंध';

  @override
  String get bitRateResolutionBehavior => 'बिटरेट, रिज़ॉल्यूशन, व्यवहार';

  @override
  String get languageSizeAppearance => 'भाषा, आकार, रूप';

  @override
  String get qualityStorage => 'गुणवत्ता, भंडारण';

  @override
  String get serverSyncAndPluginStatus => 'सर्वर सिंक और प्लगइन स्थिति';

  @override
  String get mediaRequestIntegration => 'मीडिया अनुरोध एकीकरण';

  @override
  String get switchServer => 'सर्वर स्विच करें';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get versionLicenses => 'संस्करण, लाइसेंस';

  @override
  String get account => 'खाता';

  @override
  String get signInAndSecurity => 'साइन-इन और सुरक्षा';

  @override
  String get administration => 'प्रशासन';

  @override
  String get serverSettingsUsersLibraries =>
      'सर्वर सेटिंग्स, उपयोगकर्ता, लाइब्रेरीज़';

  @override
  String get customization => 'अनुकूलन';

  @override
  String get themeAndLayout => 'थीम और लेआउट';

  @override
  String get videoAndSubtitles => 'वीडियो और उपशीर्षक';

  @override
  String get integrations => 'एकीकरण';

  @override
  String get pluginAndRequests => 'प्लगइन और अनुरोध';

  @override
  String get customizeAccountPlaybackInterface =>
      'खाता, प्लेबैक और इंटरफ़ेस व्यवहार अनुकूलित करें';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'थीम और उपस्थिति';

  @override
  String get focusBorderColor => 'फोकस बॉर्डर रंग';

  @override
  String get watchedIndicators => 'संकेतक देखे';

  @override
  String get always => 'हमेशा';

  @override
  String get hideUnwatched => 'बिना देखे छिपाएँ';

  @override
  String get episodesOnly => 'केवल एपिसोड';

  @override
  String get never => 'कभी नहीं';

  @override
  String get focusExpansionAnimation => 'फोकस विस्तार एनीमेशन';

  @override
  String get desktopUiScale => 'डेस्कटॉप यूआई स्केल';

  @override
  String get scaleFocusedCards => 'स्केल केंद्रित या मँडरा कार्ड और टाइल्स';

  @override
  String get backgroundBackdrops => 'पृष्ठभूमि पृष्ठभूमि';

  @override
  String get showBackdropImages => 'सामग्री के पीछे पृष्ठभूमि छवियाँ दिखाएँ';

  @override
  String get seriesThumbnails => 'श्रृंखला थंबनेल';

  @override
  String get seriesThumbnailsDescription =>
      'केवल एपिसोड: श्रृंखला कलाकृति का उपयोग करें जो प्रत्येक पंक्ति छवि प्रकार से मेल खाती हो';

  @override
  String get homeRowInfoOverlay => 'होम पंक्ति जानकारी ओवरले';

  @override
  String get showTitleMetadataOnHomeRows =>
      'होम पंक्तियाँ ब्राउज़ करते समय शीर्षक और मेटाडेटा दिखाएँ';

  @override
  String get clockDisplay => 'घड़ी का प्रदर्शन';

  @override
  String get inMenus => 'मेनू में';

  @override
  String get inVideo => 'वीडियो में';

  @override
  String get seasonalEffects => 'मौसमी प्रभाव';

  @override
  String get seasonalEffectsDescription => 'दृश्य प्रभाव और मौसमी सजावट';

  @override
  String get snow => 'बर्फ';

  @override
  String get fireworks => 'आतिशबाजी';

  @override
  String get confetti => 'कंफ़ेद्दी';

  @override
  String get fallingLeaves => 'गिरते पत्ते';

  @override
  String get themeMusic => 'थीम संगीत';

  @override
  String get playThemeMusicOnDetailPages => 'विवरण पृष्ठों पर थीम संगीत चलाएँ';

  @override
  String get themeMusicVolume => 'थीम संगीत वॉल्यूम';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'होम रो पर थीम संगीत';

  @override
  String get playWhenBrowsingHomeScreen => 'होम स्क्रीन ब्राउज़ करते समय चलाएं';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'विवरण पृष्ठभूमि धुंधला';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ब्राउज़िंग पृष्ठभूमि धुंधला';

  @override
  String get maxStreamingBitrate => 'अधिकतम स्ट्रीमिंग बिटरेट';

  @override
  String get maxResolution => 'अधिकतम रिज़ॉल्यूशन';

  @override
  String get playerZoomMode => 'प्लेयर ज़ूम मोड';

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
  String get fit => 'उपयुक्त';

  @override
  String get autoCrop => 'ऑटो क्रॉप';

  @override
  String get stretch => 'खींचना';

  @override
  String get refreshRateSwitching => 'ताज़ा दर स्विचिंग';

  @override
  String get disabled => 'अक्षम';

  @override
  String get scaleOnTv => 'टीवी पर स्केल';

  @override
  String get scaleOnDevice => 'डिवाइस पर स्केल';

  @override
  String get trickPlay => 'ट्रिक प्ले';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'मांगते समय पूर्वावलोकन थंबनेल दिखाएं';

  @override
  String get showDescriptionOnPause => 'विराम पर विवरण दिखाएँ';

  @override
  String get dimVideoShowOverview =>
      'वीडियो को मंद करें और रुके रहने पर अवलोकन टेक्स्ट दिखाएं';

  @override
  String get osdLockButton => 'ओएसडी लॉक बटन';

  @override
  String get osdLockButtonDescription =>
      'एक लॉक बटन दिखाएं जो लंबे समय तक दबाए जाने तक टच इनपुट को ब्लॉक कर देता है';

  @override
  String get audioBehavior => 'ऑडियो व्यवहार';

  @override
  String get downmixToStereo => 'स्टीरियो में डाउनमिक्स';

  @override
  String get defaultAudioLanguage => 'डिफ़ॉल्ट ऑडियो भाषा';

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
  String get autoServerDefault => 'ऑटो (सर्वर डिफ़ॉल्ट)';

  @override
  String get english => 'अंग्रेज़ी';

  @override
  String get spanish => 'स्पैनिश';

  @override
  String get french => 'फ़्रेंच';

  @override
  String get german => 'जर्मन';

  @override
  String get italian => 'इतालवी';

  @override
  String get portuguese => 'पुर्तगाली';

  @override
  String get japanese => 'जापानी';

  @override
  String get korean => 'कोरियाई';

  @override
  String get chinese => 'चीनी';

  @override
  String get russian => 'रूसी';

  @override
  String get arabic => 'अरबी';

  @override
  String get hindi => 'हिंदी';

  @override
  String get dutch => 'डच';

  @override
  String get swedish => 'स्वीडिश';

  @override
  String get norwegian => 'नार्वेजियन';

  @override
  String get danish => 'डेनिश';

  @override
  String get finnish => 'फिनिश';

  @override
  String get polish => 'पोलिश';

  @override
  String get ac3Passthrough => 'AC3 पासथ्रू';

  @override
  String get dtsPassthrough => 'डीटीएस पासथ्रू';

  @override
  String get trueHdSupport => 'ट्रूएचडी सपोर्ट';

  @override
  String get enableDtsPassthrough =>
      'बिटस्ट्रीम डीटीएस ऑडियो केवल एवीआर के लिए; रिसीवर समर्थन और डीटीएस स्रोत ट्रैक की आवश्यकता है';

  @override
  String get enableTrueHdAudio =>
      'ट्रूएचडी ऑडियो सक्षम करें (सभी प्लेटफ़ॉर्म पर काम नहीं कर सकता)';

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
  String get nightMode => 'रात का मोड';

  @override
  String get compressDynamicRange => 'गतिशील रेंज को संपीड़ित करें';

  @override
  String get advancedMpv => 'उन्नत mpv';

  @override
  String get enableCustomMpvConf => 'कस्टम mpv.conf सक्षम करें';

  @override
  String get applyMpvConfBeforePlayback =>
      'प्लेबैक शुरू होने से पहले उपयोगकर्ता द्वारा निर्दिष्ट mpv.conf लागू करें';

  @override
  String get unsafeAdvancedMpvOptions => 'असुरक्षित उन्नत mpv विकल्प';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv विकल्पों के व्यापक सेट की अनुमति दें। प्लेबैक व्यवहार ख़राब हो सकता है.';

  @override
  String get hardwareDecoding => 'हार्डवेयर डिकोडिंग';

  @override
  String get hardwareDecodingSubtitle =>
      'प्रदर्शन में सुधार हो सकता है लेकिन कुछ उपकरणों पर प्लेबैक समस्याएँ पैदा हो सकती हैं।';

  @override
  String get nextUpAndQueuing => 'अगला ऊपर और कतारबद्ध';

  @override
  String get nextUpDisplay => 'अगला प्रदर्शन';

  @override
  String get extended => 'विस्तारित';

  @override
  String get minimal => 'न्यूनतम';

  @override
  String get nextUpTimeout => 'अगला अप टाइमआउट';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'मीडिया कतार';

  @override
  String get autoQueueNextEpisodes => 'अगले एपिसोड स्वतः कतारबद्ध करें';

  @override
  String get stillWatchingPrompt => 'अभी भी प्रॉम्प्ट देख रहा हूँ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'फिर से शुरू करें और छोड़ें';

  @override
  String get resumeRewind => 'रिवाइंड फिर से शुरू करें';

  @override
  String get unpauseRewind => 'रिवाइंड को रोकें';

  @override
  String get fiveSeconds => '5 सेकंड';

  @override
  String get tenSeconds => '10 सेकंड';

  @override
  String get fifteenSeconds => '15 सेकंड';

  @override
  String get thirtySeconds => '30 सेकंड';

  @override
  String get skipBackLength => 'पीछे की लंबाई छोड़ें';

  @override
  String get skipForwardLength => 'आगे की लंबाई छोड़ें';

  @override
  String get customMpvConfPath => 'कस्टम mpv.conf पथ';

  @override
  String get notSetMpvConf =>
      'सेट नहीं। Moonfin ऐप/डेटा फ़ोल्डर में एक डिफ़ॉल्ट mpv.conf आज़माएगा।';

  @override
  String get selectMpvConf => 'mpv.conf चुनें';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'शैली सेटिंग्स (आकार, रंग, ऑफसेट) पाठ-आधारित उपशीर्षक (एसआरटी, वीटीटी, टीटीएमएल) पर लागू होती हैं। जब तक \"एएसएस/एसएसए डायरेक्ट प्ले\" बंद न हो, एएसएस/एसएसए उपशीर्षक अपनी स्वयं की एम्बेडेड स्टाइल का उपयोग करते हैं। बिटमैप उपशीर्षक (PGS, DVB, VobSub) को पुनः स्टाइल नहीं किया जा सकता।';

  @override
  String get defaultSubtitleLanguage => 'डिफ़ॉल्ट उपशीर्षक भाषा';

  @override
  String get defaultToNoSubtitles => 'कोई उपशीर्षक नहीं के लिए डिफ़ॉल्ट';

  @override
  String get turnOffSubtitlesByDefault =>
      'उपशीर्षक को डिफ़ॉल्ट रूप से बंद करें';

  @override
  String get subtitleSize => 'उपशीर्षक आकार';

  @override
  String get textFillColor => 'टेक्स्ट भरें रंग';

  @override
  String get backgroundColor => 'पृष्ठभूमि का रंग';

  @override
  String get textStrokeColor => 'टेक्स्ट स्ट्रोक रंग';

  @override
  String get subtitleCustomization => 'उपशीर्षक अनुकूलन';

  @override
  String get subtitleCustomizationDescription =>
      'उपशीर्षक उपस्थिति को अनुकूलित करें';

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
  String get subtitlePreviewText => 'तेज, भूरी लोमडी आलसी कुत्ते के उपर कूद गई';

  @override
  String get verticalOffset => 'लंबवत ऑफसेट';

  @override
  String get pgsDirectPlay => 'पीजीएस डायरेक्ट प्ले';

  @override
  String get directPlayPgsSubtitles => 'सीधे प्ले पीजीएस उपशीर्षक';

  @override
  String get assSsaDirectPlay => 'एएसएस/एसएसए डायरेक्ट प्ले';

  @override
  String get directPlayAssSsaSubtitles => 'एएसएस/एसएसए उपशीर्षक सीधे चलाएं';

  @override
  String get white => 'सफ़ेद';

  @override
  String get black => 'काला';

  @override
  String get yellow => 'पीला';

  @override
  String get green => 'हरा';

  @override
  String get cyan => 'सियान';

  @override
  String get red => 'लाल';

  @override
  String get transparent => 'पारदर्शी';

  @override
  String get semiTransparentBlack => 'अर्ध-पारदर्शी काला';

  @override
  String get global => 'वैश्विक';

  @override
  String get desktop => 'डेस्कटॉप';

  @override
  String get mobile => 'गतिमान';

  @override
  String get tv => 'टीवी';

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
  String get customizationProfile => 'अनुकूलन प्रोफ़ाइल';

  @override
  String get customizationProfileDescription =>
      'लोड करने, संपादित करने और सिंक करने के लिए प्रोफ़ाइल चुनें। ग्लोबल हर जगह लागू होता है जब तक कि कोई डिवाइस प्रोफ़ाइल इसे ओवरराइड न कर दे। हरा बिंदु आपके वर्तमान डिवाइस प्रोफ़ाइल को चिह्नित करता है।';

  @override
  String get loadProfile => 'प्रोफ़ाइल लोड करें';

  @override
  String get syncing => 'सिंक हो रहा है...';

  @override
  String get syncToProfile => 'प्रोफ़ाइल से सिंक करें';

  @override
  String get profileSyncHidden => 'प्रोफ़ाइल सिंक छिपा हुआ';

  @override
  String get enablePluginSyncDescription =>
      'यहां प्रोफ़ाइल नियंत्रण दिखाने के लिए प्लगइन सेटिंग्स में सर्वर प्लगइन सिंक सक्षम करें।';

  @override
  String get quality => 'गुणवत्ता';

  @override
  String get defaultDownloadQuality => 'डिफ़ॉल्ट डाउनलोड गुणवत्ता';

  @override
  String get network => 'नेटवर्क';

  @override
  String get wifiOnlyDownloads => 'वाईफ़ाई-केवल डाउनलोड';

  @override
  String get onlyDownloadOnWifi => 'वाईफाई से कनेक्ट होने पर ही डाउनलोड करें';

  @override
  String get storage => 'भंडारण';

  @override
  String get storageUsed => 'उपयोग किया गया भंडारण';

  @override
  String get manage => 'प्रबंधित करना';

  @override
  String get calculating => 'हिसाब लगाया जा रहा है...';

  @override
  String get downloadLocation => 'स्थान डाउनलोड करें';

  @override
  String get defaultLabel => 'गलती करना';

  @override
  String get saveToDownloadsFolder => 'डाउनलोड फ़ोल्डर में सहेजें';

  @override
  String get downloadsVisibleToOtherApps =>
      'डाउनलोड/Moonfin — अन्य ऐप्स के लिए दृश्यमान';

  @override
  String get dangerZone => 'खतरा क्षेत्र';

  @override
  String get clearAllDownloads => 'सभी डाउनलोड साफ़ करें';

  @override
  String get original => 'मूल';

  @override
  String get changeDownloadLocation => 'डाउनलोड स्थान बदलें';

  @override
  String get changeDownloadLocationDescription =>
      'नए डाउनलोड चयनित फ़ोल्डर में सहेजे जाएंगे. मौजूदा डाउनलोड अपने वर्तमान स्थान पर बने रहेंगे और स्टोरेज सेटिंग्स से प्रबंधित किए जा सकते हैं।';

  @override
  String get confirm => 'पुष्टि करना';

  @override
  String get cannotWriteToFolder =>
      'चयनित फ़ोल्डर में नहीं लिखा जा सकता. कृपया कोई भिन्न स्थान चुनें या भंडारण की अनुमति प्रदान करें।';

  @override
  String get saveToDownloadsFolderQuestion => 'डाउनलोड फ़ोल्डर में सहेजें?';

  @override
  String get saveToDownloadsFolderDescription =>
      'डाउनलोड किया गया मीडिया आपके डिवाइस पर डाउनलोड/Moonfin में सहेजा जाएगा। ये फ़ाइलें आपकी गैलरी या म्यूज़िक प्लेयर जैसे अन्य ऐप्स पर दिखाई देंगी।\n\nमौजूदा डाउनलोड अपने वर्तमान स्थान पर बने रहेंगे.';

  @override
  String get enable => 'सक्षम';

  @override
  String get clearAllDownloadsWarning =>
      'यह सभी डाउनलोड किए गए मीडिया को हटा देगा और इसे पूर्ववत नहीं किया जा सकेगा।';

  @override
  String get clearAll => 'सभी साफ करें';

  @override
  String get navigationStyle => 'नेविगेशन शैली';

  @override
  String get topBar => 'शीर्ष बार';

  @override
  String get leftSidebar => 'बाईं साइडबार';

  @override
  String get showShuffleButton => 'शफ़ल बटन दिखाएँ';

  @override
  String get showGenresButton => 'शैलियाँ बटन दिखाएँ';

  @override
  String get showFavoritesButton => 'पसंदीदा बटन दिखाएँ';

  @override
  String get showLibrariesInToolbar => 'टूलबार में लाइब्रेरी दिखाएं';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'नेवबार अपारदर्शिता';

  @override
  String get navbarColor => 'नेवबार रंग';

  @override
  String get gray => 'स्लेटी';

  @override
  String get darkBlue => 'गहरा नीला';

  @override
  String get purple => 'बैंगनी';

  @override
  String get teal => 'टील';

  @override
  String get navy => 'नौसेना';

  @override
  String get charcoal => 'लकड़ी का कोयला';

  @override
  String get brown => 'भूरा';

  @override
  String get darkRed => 'गहरा लाल';

  @override
  String get darkGreen => 'गहरा हरा';

  @override
  String get slate => 'स्लेट';

  @override
  String get indigo => 'नील';

  @override
  String get libraryDisplay => 'पुस्तकालय प्रदर्शन';

  @override
  String get posterLabel => 'पोस्टर';

  @override
  String get thumbnailLabel => 'थंबनेल';

  @override
  String get bannerLabel => 'बैनर';

  @override
  String get overridePerLibrarySettings =>
      'प्रति-लाइब्रेरी सेटिंग्स को ओवरराइड करें';

  @override
  String get applyImageTypeToAllLibraries =>
      'सभी पुस्तकालयों में छवि प्रकार लागू करें';

  @override
  String get multiServerLibraries => 'मल्टी-सर्वर लाइब्रेरीज़';

  @override
  String get showLibrariesFromAllServers =>
      'सभी कनेक्टेड सर्वर से लाइब्रेरी दिखाएं';

  @override
  String get enableFolderView => 'फ़ोल्डर दृश्य सक्षम करें';

  @override
  String get showFolderBrowsingOption => 'फ़ोल्डर ब्राउज़िंग विकल्प दिखाएँ';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'पुस्तकालय दृश्यता';

  @override
  String get libraryVisibilityDescription =>
      'प्रति लाइब्रेरी होम पेज दृश्यता टॉगल करें। परिवर्तनों को प्रभावी करने के लिए Moonfin को पुनः आरंभ करें।';

  @override
  String get showInNavigation => 'नेविगेशन में दिखाएँ';

  @override
  String get showInLatestMedia => 'नवीनतम मीडिया में दिखाएँ';

  @override
  String get sourceLibraries => 'स्रोत पुस्तकालय';

  @override
  String get sourceCollections => 'स्रोत संग्रह';

  @override
  String get excludedGenres => 'बहिष्कृत शैलियाँ';

  @override
  String get selectAll => 'सबका चयन करें';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'मीडिया बार';

  @override
  String get mediaSources => 'मीडिया स्रोत';

  @override
  String get behavior => 'व्यवहार';

  @override
  String get seconds => 'सेकंड';

  @override
  String get localPreviews => 'स्थानीय पूर्वावलोकन';

  @override
  String get localPreviewsDescription =>
      'ट्रेलर, मीडिया और ऑडियो पूर्वावलोकन कॉन्फ़िगर करें।';

  @override
  String get mediaBarMode => 'मीडिया बार शैली';

  @override
  String get mediaBarModeDescription =>
      'अलग-अलग मीडिया बार स्टाइल में से चुनें, या मीडिया बार को बंद कर दें।';

  @override
  String get mediaBarModeMoonfin => 'मूनफ़िन';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'बंद';

  @override
  String get enableMediaBar => 'मीडिया बार सक्षम करें';

  @override
  String get showFeaturedContentSlideshow =>
      'होम पर विशेष सामग्री स्लाइड शो दिखाएं';

  @override
  String get contentType => 'सामग्री प्रकार';

  @override
  String get moviesAndTvShows => 'फ़िल्में और टीवी शो';

  @override
  String get moviesOnly => 'केवल फिल्में';

  @override
  String get tvShowsOnly => 'केवल टीवी शो';

  @override
  String get itemCount => 'चीज़ों की गिनती';

  @override
  String get noneSelected => 'कोई भी चयनित नहीं';

  @override
  String get noneExcluded => 'किसी को भी बहिष्कृत नहीं किया गया';

  @override
  String get autoAdvance => 'ऑटो एडवांस';

  @override
  String get autoAdvanceSlides => 'स्वचालित रूप से अगली स्लाइड पर आगे बढ़ें';

  @override
  String get autoAdvanceInterval => 'ऑटो एडवांस अंतराल';

  @override
  String get trailerPreview => 'ट्रेलर पूर्वावलोकन';

  @override
  String get autoPlayTrailers =>
      '3 सेकंड के बाद मीडिया बार में ट्रेलरों को ऑटो-प्ले करें';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => 'एपिसोड पूर्वावलोकन';

  @override
  String get mediaPreview => 'मीडिया पूर्वावलोकन';

  @override
  String get episodePreviewDescription =>
      'फ़ोकस किए गए, होवर किए गए या लंबे समय से दबाए गए कार्डों पर 30 सेकंड का इनलाइन पूर्वावलोकन चलाएं';

  @override
  String get mediaPreviewDescription =>
      'फ़ोकस किए गए, होवर किए गए या लंबे समय से दबाए गए कार्डों पर 30 सेकंड का इनलाइन पूर्वावलोकन चलाएं';

  @override
  String get previewAudio => 'ऑडियो का पूर्वावलोकन करें';

  @override
  String get enablePreviewAudio =>
      'ट्रेलर और एपिसोड पूर्वावलोकन के लिए ऑडियो सक्षम करें';

  @override
  String get latestMedia => 'नवीनतम मीडिया';

  @override
  String get recentlyReleased => 'हाल ही में जारी किया गया';

  @override
  String get myMedia => 'मेरा मीडिया';

  @override
  String get myMediaSmall => 'मेरा मीडिया (छोटा)';

  @override
  String get continueWatching => 'देखना जारी रखें';

  @override
  String get resumeAudio => 'ऑडियो फिर से शुरू करें';

  @override
  String get resumeBooks => 'पुस्तकें फिर से शुरू करें';

  @override
  String get activeRecordings => 'सक्रिय रिकॉर्डिंग';

  @override
  String get playlists => 'प्लेलिस्ट';

  @override
  String get liveTV => 'लाइव टीवी';

  @override
  String get homeSections => 'गृह अनुभाग';

  @override
  String get resetToDefaults => 'डिफ़ॉल्ट पर पुनः सेट करें';

  @override
  String get homeRowPosterSize => 'होम रो पोस्टर का आकार';

  @override
  String get perRowImageTypeSelection => 'प्रति पंक्ति छवि प्रकार चयन';

  @override
  String get configureImageTypeForEachRow =>
      'प्रत्येक सक्षम होम पंक्ति के लिए छवि प्रकार कॉन्फ़िगर करें';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'मर्ज करें, देखना जारी रखें और आगे बढ़ें';

  @override
  String get combineBothRows =>
      'दोनों पंक्तियों को एक ही होम सेक्शन में संयोजित करें';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'प्रति पंक्ति छवि प्रकार';

  @override
  String get perRowSettings => 'प्रति-पंक्ति सेटिंग्स';

  @override
  String get autoLogin => 'स्व - लॉगिन';

  @override
  String get lastUser => 'अंतिम उपयोगकर्ता';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'हमेशा प्रमाणित करें';

  @override
  String get requirePasswordWithToken =>
      'संग्रहीत टोकन के साथ भी पासवर्ड की आवश्यकता होती है';

  @override
  String get confirmExit => 'बाहर निकलने की पुष्टि करें';

  @override
  String get showConfirmationBeforeExiting =>
      'बाहर निकलने से पहले पुष्टि दिखाएँ';

  @override
  String get blockContentWithRatings =>
      'निम्नलिखित रेटिंग वाली सामग्री को ब्लॉक करें:';

  @override
  String get noContentRatingsFound =>
      'इस सर्वर पर अभी तक कोई सामग्री रेटिंग नहीं मिली।';

  @override
  String get couldNotLoadServerRatings =>
      'सर्वर रेटिंग लोड नहीं हो सकी. केवल सहेजी गई रेटिंग दिखा रहा है।';

  @override
  String get couldNotRefreshRatings =>
      'सर्वर से रेटिंग ताज़ा नहीं की जा सकी. सहेजी गई रेटिंग दिखाई जा रही हैं.';

  @override
  String get enablePinCode => 'पिन कोड सक्षम करें';

  @override
  String get requirePinToAccess =>
      'अपने खाते तक पहुंचने के लिए एक पिन की आवश्यकता है';

  @override
  String get changePin => 'पिन बदलें';

  @override
  String get setNewPinCode => 'एक नया पिन कोड सेट करें';

  @override
  String get removePin => 'पिन निकालें';

  @override
  String get removePinProtection => 'पिन कोड सुरक्षा हटाएँ';

  @override
  String get screensaver => 'स्क्रीन सेवर';

  @override
  String get inAppScreensaver => 'इन-ऐप स्क्रीनसेवर';

  @override
  String get enableBuiltInScreensaver => 'अंतर्निर्मित स्क्रीनसेवर सक्षम करें';

  @override
  String get mode => 'तरीका';

  @override
  String get libraryArt => 'पुस्तकालय कला';

  @override
  String get logo => 'प्रतीक चिन्ह';

  @override
  String get clock => 'घड़ी';

  @override
  String get timeout => 'समयबाह्य';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'डिमिंग लेवल';

  @override
  String get maxAgeRating => 'अधिकतम आयु रेटिंग';

  @override
  String get any => 'कोई';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'आयु रेटिंग की आवश्यकता है';

  @override
  String get onlyShowRatedContent => 'केवल रेटेड सामग्री दिखाएं';

  @override
  String get showClock => 'घड़ी दिखाओ';

  @override
  String get displayClockDuringScreensaver =>
      'स्क्रीनसेवर के दौरान घड़ी प्रदर्शित करें';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'सड़े हुए टमाटर (आलोचक)';

  @override
  String get rottenTomatoesAudience => 'सड़े हुए टमाटर (दर्शक)';

  @override
  String get imdb => 'आईएमडीबी';

  @override
  String get tmdb => 'टीएमडीबी';

  @override
  String get metacritic => 'मेटाक्रिटिक';

  @override
  String get metacriticUser => 'मेटाक्रिटिक (उपयोगकर्ता)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'एनीलिस्ट';

  @override
  String get communityRating => 'सामुदायिक रेटिंग';

  @override
  String get ratings => 'रेटिंग';

  @override
  String get additionalRatings => 'अतिरिक्त रेटिंग';

  @override
  String get showMdbListAndTmdbRatings =>
      'एमडीबीलिस्ट और टीएमडीबी रेटिंग दिखाएं';

  @override
  String get ratingLabels => 'रेटिंग लेबल';

  @override
  String get showLabelsNextToIcons => 'रेटिंग आइकन के आगे लेबल दिखाएँ';

  @override
  String get ratingBadges => 'रेटिंग बैज';

  @override
  String get showDecorativeBadges => 'रेटिंग के पीछे सजावटी बैज दिखाएँ';

  @override
  String get episodeRatings => 'एपिसोड रेटिंग';

  @override
  String get showRatingsOnEpisodes => 'अलग-अलग एपिसोड पर रेटिंग दिखाएं';

  @override
  String get ratingSources => 'रेटिंग स्रोत';

  @override
  String get ratingSourcesDescription =>
      'पूरे ऐप में दिखाए गए रेटिंग स्रोतों को सक्षम और पुन: व्यवस्थित करें';

  @override
  String get pluginLabel => 'लगाना';

  @override
  String get pluginDetected => 'प्लगइन का पता चला';

  @override
  String get pluginNotDetected => 'प्लगइन का पता नहीं चला';

  @override
  String get pluginDetectedDescription =>
      'सर्वर प्लगइन का पता चला. पहली बार प्लगइन मिलने पर सिंक स्वचालित रूप से सक्षम हो जाता है।';

  @override
  String get pluginNotDetectedDescription =>
      'सर्वर प्लगइन फिलहाल पता नहीं चला है. स्थानीय सेटिंग्स अभी भी अपने सहेजे गए मानों या अंतर्निहित डिफ़ॉल्ट का उपयोग करती हैं।';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'उपलब्ध सेवाएँ';

  @override
  String get serverPluginSync => 'सर्वर प्लगइन सिंक';

  @override
  String get syncSettingsWithPlugin => 'सर्वर प्लगइन के साथ सेटिंग्स सिंक करें';

  @override
  String get whatSyncControls => 'कौन सा सिंक नियंत्रित करता है';

  @override
  String get syncControlsDescription =>
      'सिंक केवल यह नियंत्रित करता है कि प्लगइन-समर्थित सेटिंग्स को सर्वर पर धकेला और खींचा गया है या नहीं। प्लगइन सिंक सक्षम होने पर प्रोफ़ाइल चयन और प्रोफ़ाइल सिंक क्रियाएं अनुकूलन सेटिंग्स में होती हैं।';

  @override
  String get recentRequests => 'हाल के अनुरोध';

  @override
  String get recentlyAdded => 'हाल ही में जोड़ा';

  @override
  String get trending => 'रुझान';

  @override
  String get popularMovies => 'लोकप्रिय फ़िल्में';

  @override
  String get movieGenres => 'मूवी शैलियाँ';

  @override
  String get upcomingMovies => 'आने वाली फिल्में';

  @override
  String get studios => 'स्टूडियो';

  @override
  String get popularSeries => 'लोकप्रिय श्रृंखला';

  @override
  String get seriesGenres => 'शृंखला शैलियाँ';

  @override
  String get upcomingSeries => 'आगामी शृंखला';

  @override
  String get networks => 'नेटवर्क';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'पंक्तियों को डिफ़ॉल्ट पर रीसेट करें';

  @override
  String get enableSeerr => 'सीरर सक्षम करें';

  @override
  String get showSeerrInNavigation =>
      'नेविगेशन में सीरर दिखाएं (सर्वर प्लगइन की आवश्यकता है)';

  @override
  String get seerrUnavailable =>
      'अनुपलब्ध है क्योंकि सर्वर प्लगइन सीरर समर्थन अक्षम है।';

  @override
  String get nsfwFilter => 'एनएसएफडब्ल्यू फ़िल्टर';

  @override
  String get hideAdultContent => 'परिणामों में वयस्क सामग्री छिपाएँ';

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
  String get discoverRows => 'पंक्तियों की खोज करें';

  @override
  String get discoverRowsDescriptionPlugin =>
      'पुन: व्यवस्थित करने के लिए खींचें। पंक्तियों को सक्षम या अक्षम करें. सक्षम पंक्ति क्रम Moonfin प्लगइन के साथ समन्वयित होता है।';

  @override
  String get discoverRowsDescription =>
      'पुन: व्यवस्थित करने के लिए खींचें। पंक्तियों को सक्षम या अक्षम करें.';

  @override
  String get enabled => 'सक्रिय';

  @override
  String get hidden => 'छिपा हुआ';

  @override
  String get aboutTitle => 'के बारे में';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'ओपन सोर्स लाइसेंस';

  @override
  String get sourceCode => 'सोर्स कोड';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'अभी अपडेट की जाँच करें';

  @override
  String get checksLatestDesktopRelease =>
      'इस प्लेटफ़ॉर्म के लिए नवीनतम डेस्कटॉप रिलीज़ की जाँच करता है';

  @override
  String get youAreUpToDate => 'आप अद्यतन हैं।';

  @override
  String get couldNotCheckForUpdates => 'अभी अपडेट की जांच नहीं की जा सकी.';

  @override
  String get noCompatibleUpdate =>
      'इस प्लेटफ़ॉर्म के लिए कोई संगत अद्यतन पैकेज़ नहीं मिला।';

  @override
  String get updateChecksNotSupported =>
      'इस प्लेटफ़ॉर्म पर अद्यतन जाँच समर्थित नहीं हैं।';

  @override
  String get updateNotificationsDisabled => 'अद्यतन सूचनाएं अक्षम हैं.';

  @override
  String get pleaseWaitBeforeChecking =>
      'कृपया दोबारा जाँच करने से पहले प्रतीक्षा करें।';

  @override
  String get latestUpdateAlreadyShown =>
      'नवीनतम अपडेट पहले ही दिखाया जा चुका था.';

  @override
  String get updateAvailable => 'उपलब्ध अद्यतन।';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'अद्यतन सूचनाएं';

  @override
  String get showWhenUpdatesAvailable => 'अपडेट उपलब्ध होने पर दिखाएं';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'रिलीज़ नोट्स पढ़ें';

  @override
  String get downloadingUpdate => 'अद्यतन स्थिति डाउनलोड हो रही है...';

  @override
  String get updateDownloadFailed =>
      'अद्यतन डाउनलोड विफल रहा. कृपया पुन: प्रयास करें।';

  @override
  String get openReleasesPage => 'रिलीज़ पेज खोलें';

  @override
  String get navigation => 'मार्गदर्शन';

  @override
  String get watchedIndicatorsBackdrops => 'संकेतक, पृष्ठभूमियाँ देखीं';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'फोकस रंग, देखे गए संकेतक, पृष्ठभूमि';

  @override
  String get navbarStyleToolbarAppearance =>
      'नेवबार शैली, टूलबार बटन, उपस्थिति';

  @override
  String get reorderToggleHomeRows =>
      'घरेलू पंक्तियों को पुन: व्यवस्थित करें और टॉगल करें';

  @override
  String get featuredContentAppearance =>
      'विशेष रुप से प्रदर्शित सामग्री, उपस्थिति';

  @override
  String get posterSizeImageTypeFolderView =>
      'पोस्टर का आकार, छवि प्रकार, फ़ोल्डर दृश्य';

  @override
  String get mdbListTmdbRatingSources =>
      'एमडीबीलिस्ट, टीएमडीबी, और रेटिंग स्रोत';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'स्पष्ट';

  @override
  String get browse => 'ब्राउज़';

  @override
  String get noResults => 'कोई परिणाम नहीं';

  @override
  String get seerrAvailableStatus => 'उपलब्ध';

  @override
  String get seerrRequestedStatus => 'अनुरोध किया';

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
  String get seerrSettings => 'द्रष्टा सेटिंग्स';

  @override
  String get requestMore => 'अधिक अनुरोध करें';

  @override
  String get request => 'अनुरोध';

  @override
  String get cancelRequest => 'अनुरोध को रद्द करें';

  @override
  String get playInMoonfin => 'Moonfin में खेलें';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'मंज़ूरी देना';

  @override
  String get declineAction => 'गिरावट';

  @override
  String get similar => 'समान';

  @override
  String get recommendations => 'सिफारिशों';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'रखना';

  @override
  String get itemNotFoundInLibrary =>
      'आपकी Moonfin लाइब्रेरी में आइटम नहीं मिला';

  @override
  String get errorSearchingLibrary => 'लाइब्रेरी खोजने में त्रुटि';

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
  String get submitRequest => 'अनुरोध सबमिट करें';

  @override
  String get allSeasons => 'सभी मौसम';

  @override
  String get advancedOptions => 'उन्नत विकल्प';

  @override
  String get noServiceServersConfigured =>
      'कोई सेवा सर्वर कॉन्फ़िगर नहीं किया गया';

  @override
  String get server => 'सर्वर';

  @override
  String get qualityProfile => 'गुणवत्ता प्रोफ़ाइल';

  @override
  String get rootFolder => 'रूट फ़ोल्डर';

  @override
  String get showMore => 'और दिखाएँ';

  @override
  String get appearances => 'दिखावे';

  @override
  String get crewSection => 'कर्मी दल';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'कोई अनुरोध नहीं';

  @override
  String get pendingStatus => 'लंबित';

  @override
  String get declinedStatus => 'अस्वीकृत';

  @override
  String get partiallyAvailable => 'आंशिक रूप से उपलब्ध';

  @override
  String get downloadingStatus => 'डाउनलोड';

  @override
  String get approvedStatus => 'अनुमत';

  @override
  String get notRequestedStatus => 'अनुरोधित नहीं';

  @override
  String get blocklistedStatus => 'ब्लॉकलिस्टेड';

  @override
  String get deletedStatus => 'हटाए गए';

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
  String get tmdbScore => 'टीएमडीबी स्कोर';

  @override
  String get releaseDateLabel => 'रिलीज़ की तारीख';

  @override
  String get firstAirDateLabel => 'पहली हवाई तारीख';

  @override
  String get revenueLabel => 'आय';

  @override
  String get runtimeLabel => 'क्रम';

  @override
  String get budgetLabel => 'बजट';

  @override
  String get originalLanguageLabel => 'मूल भाषा';

  @override
  String get seasonsLabel => 'मौसम के';

  @override
  String get episodesLabel => 'एपिसोड';

  @override
  String get access => 'पहुँच';

  @override
  String get add => 'जोड़ना';

  @override
  String get address => 'पता';

  @override
  String get analytics => 'एनालिटिक्स';

  @override
  String get catalog => 'सूची';

  @override
  String get content => 'सामग्री';

  @override
  String get copy => 'प्रतिलिपि';

  @override
  String get create => 'बनाएं';

  @override
  String get disable => 'अक्षम करना';

  @override
  String get done => 'हो गया';

  @override
  String get edit => 'संपादन करना';

  @override
  String get encoding => 'एन्कोडिंग';

  @override
  String get error => 'गलती';

  @override
  String get forward => 'आगे';

  @override
  String get general => 'सामान्य';

  @override
  String get go => 'जाना';

  @override
  String get install => 'स्थापित करना';

  @override
  String get installed => 'स्थापित';

  @override
  String get interval => 'अंतराल';

  @override
  String get name => 'नाम';

  @override
  String get networking => 'नेटवर्किंग';

  @override
  String get next => 'अगला';

  @override
  String get path => 'पथ';

  @override
  String get paused => 'रुका हुआ';

  @override
  String get permissions => 'अनुमतियां';

  @override
  String get processing => 'प्रसंस्करण';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get provider => 'प्रदाता';

  @override
  String get refresh => 'ताज़ा करना';

  @override
  String get remote => 'दूर';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get revoke => 'रद्द करना';

  @override
  String get role => 'भूमिका';

  @override
  String get root => 'जड़';

  @override
  String get run => 'दौड़ना';

  @override
  String get search => 'खोज';

  @override
  String get select => 'चुनना';

  @override
  String get send => 'भेजना';

  @override
  String get sessions => 'सत्र';

  @override
  String get set => 'तय करना';

  @override
  String get status => 'स्थिति';

  @override
  String get stop => 'रुकना';

  @override
  String get streaming => 'स्ट्रीमिंग';

  @override
  String get time => 'समय';

  @override
  String get trickplay => 'चालाकी';

  @override
  String get uninstall => 'अनइंस्टॉल करें';

  @override
  String get up => 'ऊपर';

  @override
  String get update => 'अद्यतन';

  @override
  String get upload => 'अपलोड करें';

  @override
  String get unmute => 'अनम्यूट';

  @override
  String get mute => 'आवाज़ बंद करना';

  @override
  String get branding => 'ब्रांडिंग';

  @override
  String get adminDrawerDashboard => 'डैशबोर्ड';

  @override
  String get adminDrawerAnalytics => 'एनालिटिक्स';

  @override
  String get adminDrawerSettings => 'सेटिंग्स';

  @override
  String get adminDrawerBranding => 'ब्रांडिंग';

  @override
  String get adminDrawerUsers => 'उपयोगकर्ताओं';

  @override
  String get adminDrawerLibraries => 'पुस्तकालय';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'ट्रांसकोडिंग';

  @override
  String get adminDrawerResume => 'फिर शुरू करना';

  @override
  String get adminDrawerStreaming => 'स्ट्रीमिंग';

  @override
  String get adminDrawerTrickplay => 'चालाकी';

  @override
  String get adminDrawerDevices => 'उपकरण';

  @override
  String get adminDrawerActivity => 'गतिविधि';

  @override
  String get adminDrawerNetworking => 'नेटवर्किंग';

  @override
  String get adminDrawerApiKeys => 'एपीआई कुंजी';

  @override
  String get adminDrawerBackups => 'बैकअप';

  @override
  String get adminDrawerLogs => 'लॉग्स';

  @override
  String get adminDrawerScheduledTasks => 'नियत कार्य';

  @override
  String get adminDrawerPlugins => 'प्लग-इन';

  @override
  String get adminDrawerRepositories => 'डेटा संग्रह स्थान';

  @override
  String get adminDrawerLiveTv => 'लाइव टीवी';

  @override
  String get adminExitTooltip => 'व्यवस्थापक से बाहर निकलें';

  @override
  String get adminDashboardLoadFailed => 'डैशबोर्ड लोड करने में विफल';

  @override
  String get adminMediaOverview => 'मीडिया अवलोकन';

  @override
  String get adminMediaTotalsError => 'सर्वर मीडिया योग लोड नहीं किया जा सका.';

  @override
  String get adminMediaOverviewSubtitle =>
      'इस सर्वर पर कितनी सामग्री है, इस पर एक त्वरित नज़र डालें।';

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
  String get analyticsMediaDistribution => 'मीडिया वितरण';

  @override
  String get analyticsVideoCodecs => 'वीडियो कोडेक्स';

  @override
  String get analyticsAudioCodecs => 'ऑडियो कोडेक्स';

  @override
  String get analyticsContainers => 'कंटेनरों';

  @override
  String get analyticsTopGenres => 'शीर्ष शैलियाँ';

  @override
  String get analyticsReleaseYears => 'रिलीज़ वर्ष';

  @override
  String get analyticsContentRatings => 'सामग्री रेटिंग';

  @override
  String get analyticsRuntimeBuckets => 'रनटाइम बकेट';

  @override
  String get analyticsFileFormats => 'फ़ाइल प्रारूप';

  @override
  String get analyticsNoData => 'कोई डेटा मौजूद नहीं।';

  @override
  String get adminServerInfo => 'सर्वर जानकारी';

  @override
  String get adminRestartPending => 'पुनः आरंभ लंबित';

  @override
  String get adminServerPaths => 'सर्वर पथ';

  @override
  String get adminServerActions => 'सर्वर क्रियाएँ';

  @override
  String get adminRestartServer => 'सर्वर पुनः प्रारंभ करें';

  @override
  String get adminShutdownServer => 'सर्वर बंद करें';

  @override
  String get adminScanLibraries => 'पुस्तकालयों को स्कैन करें';

  @override
  String get adminLibraryScanStarted => 'लाइब्रेरी स्कैन प्रारंभ हुआ';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'सर्वर रीबूट प्रगति पर है';

  @override
  String get adminServerRebootMessage =>
      'सर्वर रीबूट प्रगति पर है, कृपया पुनः आरंभ करें Moonfin';

  @override
  String get adminActiveSessions => 'सक्रिय सत्र';

  @override
  String get adminSessionsLoadFailed => 'सत्र लोड करने में विफल';

  @override
  String get adminNoActiveSessions => 'कोई सक्रिय सत्र नहीं';

  @override
  String get adminRecentActivity => 'हाल की गतिविधि';

  @override
  String get adminNoRecentActivity => 'कोई हालिया गतिविधि नहीं';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'मेसेज भेजें';

  @override
  String get adminMessageTextHint => 'संदेश पाठ';

  @override
  String get adminSetVolume => 'वॉल्यूम सेट करें';

  @override
  String get sessionPrev => 'पिछला';

  @override
  String get sessionRewind => 'रिवाइंड';

  @override
  String get sessionForward => 'आगे';

  @override
  String get sessionNext => 'अगला';

  @override
  String get sessionVolumeDown => 'वॉल्यूम -';

  @override
  String get sessionVolumeUp => 'वॉल्यूम +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'अब खेल रहे हैं';

  @override
  String get volume => 'आयतन';

  @override
  String get actions => 'कार्रवाई';

  @override
  String get videoCodec => 'वीडियो कोडेक';

  @override
  String get audioCodec => 'ऑडियो कोडेक';

  @override
  String get hwAccel => 'एचडब्ल्यू एक्सेल';

  @override
  String get completion => 'समापन';

  @override
  String get direct => 'प्रत्यक्ष';

  @override
  String get adminDisconnect => 'डिस्कनेक्ट';

  @override
  String get adminClearDates => 'स्पष्ट तिथियाँ';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'कोई गतिविधि प्रविष्टियाँ नहीं';

  @override
  String get adminEditDeviceName => 'डिवाइस का नाम संपादित करें';

  @override
  String get adminCustomName => 'प्रचलित नाम';

  @override
  String get adminDeviceNameUpdated => 'डिवाइस का नाम अपडेट किया गया';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'डिवाइस हटाएँ';

  @override
  String get adminDeviceDeleted => 'डिवाइस हटा दिया गया';

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
  String get adminDevicesLoadFailed => 'डिवाइस लोड करने में विफल';

  @override
  String get adminSearchDevices => 'उपकरण खोजें';

  @override
  String get adminThisDevice => 'यह डिवाइस';

  @override
  String get adminEditName => 'नाम संपादित करें';

  @override
  String get adminLibrariesLoadFailed => 'लाइब्रेरीज़ लोड करने में विफल';

  @override
  String get adminNoLibraries => 'कोई लाइब्रेरी कॉन्फ़िगर नहीं की गई';

  @override
  String get adminScanAllLibraries => 'सभी पुस्तकालयों को स्कैन करें';

  @override
  String get adminAddLibrary => 'लाइब्रेरी जोड़ें';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'लाइब्रेरी का नाम बदलें';

  @override
  String get adminNewName => 'नया नाम';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'लाइब्रेरी हटाएँ';

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
  String get adminRemovePath => 'पथ हटाएँ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'लाइब्रेरी विकल्प सहेजे गए';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'लाइब्रेरी लोड करने में विफल';

  @override
  String get adminNoMediaPaths => 'कोई मीडिया पथ कॉन्फ़िगर नहीं किया गया';

  @override
  String get adminAddPath => 'पथ जोड़ें';

  @override
  String get adminBrowseFilesystem => 'सर्वर फ़ाइल सिस्टम ब्राउज़ करें:';

  @override
  String get adminSaveOptions => 'विकल्प सहेजें';

  @override
  String get adminPreferredMetadataLanguage => 'पसंदीदा मेटाडेटा भाषा';

  @override
  String get adminMetadataLanguageHint => 'जैसे एन, डे, फ्र';

  @override
  String get adminMetadataCountryCode => 'मेटाडेटा देश कोड';

  @override
  String get adminMetadataCountryHint => 'जैसे यूएस, डीई, एफआर';

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
  String get adminLibraryNameRequired => 'लाइब्रेरी का नाम आवश्यक है';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'पुस्तकालय का नाम';

  @override
  String get adminSelectedPaths => 'चयनित पथ:';

  @override
  String get adminNoPathsAdded =>
      'कोई पथ नहीं जोड़ा गया (बाद में जोड़ा जा सकता है)';

  @override
  String get adminCreateLibrary => 'लाइब्रेरी बनाएं';

  @override
  String get paths => 'पथ:';

  @override
  String get adminDisableUser => 'उपयोगकर्ता को अक्षम करें';

  @override
  String get adminEnableUser => 'उपयोगकर्ता सक्षम करें';

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
  String get adminUsersLoadFailed => 'उपयोगकर्ताओं को लोड करने में विफल';

  @override
  String get adminSearchUsers => 'उपयोगकर्ता खोजें';

  @override
  String get adminEditUser => 'यूजर को संपादित करो';

  @override
  String get adminAddUser => 'उपयोगकर्ता जोड़ें';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'उपयोगकर्ता बनाएं';

  @override
  String get adminPasswordOptional => 'पासवर्ड (वैकल्पिक)';

  @override
  String get adminUsernameRequired => 'उपयोक्तानाम खाली नहीं हो सकता';

  @override
  String get adminNoProfileChanges =>
      'सहेजने के लिए कोई प्रोफ़ाइल परिवर्तन नहीं';

  @override
  String get adminProfileSaved => 'प्रोफ़ाइल सहेजी गई';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'अनुमतियाँ सहेजी गईं';

  @override
  String get adminPasswordsMismatch => 'सांकेतिक शब्द मेल नहीं खाते';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'उपयोगकर्ता लोड करने में विफल';

  @override
  String get adminBackToUsers => 'उपयोगकर्ताओं के पास वापस जाएँ';

  @override
  String get adminSaveProfile => 'प्रोफ़ाइल बचा';

  @override
  String get adminDeleteUser => 'उपयोगकर्ता हटाएँ';

  @override
  String get admin => 'व्यवस्थापक';

  @override
  String get adminFullAccessWarning =>
      'प्रशासकों के पास सर्वर तक पूरी पहुंच होती है. सावधानी से अनुदान दें.';

  @override
  String get administrator => 'प्रशासक';

  @override
  String get adminHiddenUser => 'छिपा हुआ उपयोगकर्ता';

  @override
  String get adminAllowMediaPlayback => 'मीडिया प्लेबैक की अनुमति दें';

  @override
  String get adminAllowAudioTranscoding => 'ऑडियो ट्रांसकोडिंग की अनुमति दें';

  @override
  String get adminAllowVideoTranscoding => 'वीडियो ट्रांसकोडिंग की अनुमति दें';

  @override
  String get adminAllowRemuxing => 'रीमक्सिंग की अनुमति दें';

  @override
  String get adminForceRemoteTranscoding =>
      'दूरस्थ स्रोत ट्रांसकोडिंग को बाध्य करें';

  @override
  String get adminAllowContentDeletion => 'सामग्री हटाने की अनुमति दें';

  @override
  String get adminAllowContentDownloading =>
      'सामग्री डाउनलोड करने की अनुमति दें';

  @override
  String get adminAllowPublicSharing => 'सार्वजनिक साझाकरण की अनुमति दें';

  @override
  String get adminAllowRemoteControl =>
      'अन्य उपयोगकर्ताओं को रिमोट कंट्रोल की अनुमति दें';

  @override
  String get adminAllowSharedDeviceControl =>
      'साझा डिवाइस नियंत्रण की अनुमति दें';

  @override
  String get adminAllowRemoteAccess => 'रिमोट एक्सेस की अनुमति दें';

  @override
  String get adminRemoteBitrateLimit => 'दूरस्थ क्लाइंट बिटरेट सीमा (बीपीएस)';

  @override
  String get adminLeaveEmptyNoLimit => 'बिना किसी सीमा के खाली छोड़ दें';

  @override
  String get adminMaxActiveSessions => 'अधिकतम सक्रिय सत्र';

  @override
  String get adminAllowLiveTvAccess => 'लाइव टीवी एक्सेस की अनुमति दें';

  @override
  String get adminAllowLiveTvManagement => 'लाइव टीवी प्रबंधन की अनुमति दें';

  @override
  String get adminAllowCollectionManagement => 'संग्रह प्रबंधन की अनुमति दें';

  @override
  String get adminAllowSubtitleManagement => 'उपशीर्षक प्रबंधन की अनुमति दें';

  @override
  String get adminAllowLyricManagement => 'गीत प्रबंधन की अनुमति दें';

  @override
  String get adminSavePermissions => 'अनुमतियाँ सहेजें';

  @override
  String get adminEnableAllLibraryAccess =>
      'सभी पुस्तकालयों तक पहुंच सक्षम करें';

  @override
  String get adminSaveAccess => 'पहुंच सहेजें';

  @override
  String get adminChangePassword => 'पासवर्ड बदलें';

  @override
  String get adminNewPassword => 'नया पासवर्ड';

  @override
  String get adminConfirmPassword => 'पासवर्ड की पुष्टि कीजिये';

  @override
  String get adminSetPassword => 'सांकेतिक शब्द लगना';

  @override
  String get adminResetPassword => 'पासवर्ड रीसेट';

  @override
  String get adminPasswordReset => 'पासवर्ड रीसेट';

  @override
  String get adminPasswordUpdated => 'पासवर्ड अपडेट किया गया';

  @override
  String get adminUserSettings => 'उपयोगकर्ता सेटिंग्स';

  @override
  String get adminLibraryAccess => 'पुस्तकालय प्रवेश';

  @override
  String get adminDeviceAndChannelAccess => 'डिवाइस और चैनल एक्सेस';

  @override
  String get adminEnableAllDevices => 'सभी डिवाइस तक पहुंच सक्षम करें';

  @override
  String get adminEnableAllChannels => 'सभी चैनलों तक पहुंच सक्षम करें';

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
      'इससे पासवर्ड हट जाएगा. यूजर बिना पासवर्ड के लॉग इन कर सकेगा।';

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
  String get adminCreateApiKey => 'एपीआई कुंजी बनाएं';

  @override
  String get adminAppName => 'ऐप का नाम';

  @override
  String get adminApiKeyCreated => 'एपीआई कुंजी बनाई गई';

  @override
  String get adminApiKeyCreatedNoToken =>
      'कुंजी सफलतापूर्वक बनाई गई. सर्वर ने टोकन वापस नहीं किया. सर्वर एपीआई कुंजियाँ जाँचें।';

  @override
  String get adminKeyCopied => 'कुंजी को क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'सर्वर प्रतिक्रिया से कुंजी टोकन गायब है';

  @override
  String get adminRevokeApiKey => 'एपीआई कुंजी निरस्त करें';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'एपीआई कुंजी निरस्त कर दी गई';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'एपीआई कुंजियाँ लोड करने में विफल';

  @override
  String get adminApiKeysTitle => 'एपीआई कुंजी';

  @override
  String get adminCreateKey => 'कुंजी बनाएँ';

  @override
  String get adminNoApiKeys => 'कोई एपीआई कुंजी नहीं मिली';

  @override
  String get adminUnknownApp => 'अज्ञात ऐप';

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
  String get adminCreatingBackup => 'बैकअप बनाया जा रहा है...';

  @override
  String get adminBackupCreated => 'बैकअप सफलतापूर्वक बनाया गया';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'सर्वर प्रतिक्रिया में बैकअप पथ गायब है';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'पुनर्स्थापना की पुष्टि करें';

  @override
  String get adminRestoringBackup => 'बैकअप बहाल किया जा रहा है...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'बैकअप लोड करने में विफल';

  @override
  String get adminCreateBackup => 'बैकअप बनाएं';

  @override
  String get adminNoBackups => 'कोई बैकअप नहीं मिला';

  @override
  String get adminViewDetails => 'विवरण देखें';

  @override
  String get restore => 'पुनर्स्थापित करना';

  @override
  String get adminLogsLoadFailed => 'सर्वर लॉग लोड करने में विफल';

  @override
  String get adminNoLogFiles => 'कोई लॉग फ़ाइल नहीं मिली';

  @override
  String get adminLogCopied => 'लॉग क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get adminSaveLogFile => 'लॉग फ़ाइल सहेजें';

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
  String get adminSearchInLog => 'लॉग में खोजें';

  @override
  String get adminNoMatchingLines => 'कोई मेल खाती पंक्तियाँ नहीं';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'कोई निर्धारित कार्य नहीं मिला';

  @override
  String get adminNoTasksMatchFilter =>
      'कोई भी कार्य वर्तमान फ़िल्टर से मेल नहीं खाता';

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
  String get adminRunNow => 'अब दौड़े';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'अंतिम निष्पादन';

  @override
  String get adminTriggers => 'चलाता है';

  @override
  String get adminAddTrigger => 'ट्रिगर जोड़ें';

  @override
  String get adminNoTriggers => 'कोई ट्रिगर कॉन्फ़िगर नहीं किया गया';

  @override
  String get adminTriggerType => 'ट्रिगर प्रकार';

  @override
  String get adminTimeLimit => 'समय सीमा (वैकल्पिक)';

  @override
  String get adminNoLimit => 'कोई सीमा नहीं';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'सप्ताह का दिन';

  @override
  String get adminSearchPlugins => 'प्लगइन्स खोजें...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'प्लगइन अनइंस्टॉल करें';

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
      'कोई भी प्लगइन आपकी खोज से मेल नहीं खाता';

  @override
  String get adminNoPluginsInstalled => 'कोई प्लगइन्स स्थापित नहीं है';

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
      'कोई भी पैकेज आपकी खोज से मेल नहीं खाता';

  @override
  String get adminNoPackagesAvailable => 'कोई पैकेज उपलब्ध नहीं है';

  @override
  String get adminExperimentalIntegration => 'प्रायोगिक एकीकरण';

  @override
  String get adminExperimentalWarning =>
      'प्लगइन सेटिंग्स एकीकरण अभी भी प्रयोगात्मक है। हो सकता है कि कुछ सेटिंग पृष्ठ ठीक से प्रस्तुत न हों.';

  @override
  String get continueAction => 'जारी रखना';

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
      'सेटिंग्स खोलने में असमर्थ: प्रमाणीकरण टोकन गायब है।';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'प्लगइन नहीं मिला';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'प्लगइन सक्षम करें';

  @override
  String get adminPluginSettingsPage => 'प्लगइन सेटिंग पृष्ठ';

  @override
  String get adminRevisionHistory => 'संशोधन इतिहास';

  @override
  String get adminNoChangelog => 'कोई चेंजलॉग उपलब्ध नहीं है.';

  @override
  String get adminRemoveRepository => 'रिपोजिटरी हटाएँ';

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
  String get adminRepositoryNameHint => 'जैसे Jellyfin स्थिर';

  @override
  String get adminRepositoryUrl => 'रिपोजिटरी यूआरएल';

  @override
  String get adminAddEntry => 'प्रविष्टि जोड़ें';

  @override
  String get adminInvalidUrl => 'असामान्य यूआरएल';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'ब्राउज़र में खोलें';

  @override
  String get adminOpenExternally => 'बाह्य रूप से खोलें';

  @override
  String get adminGeneralSettings => 'सामान्य सेटिंग्स';

  @override
  String get adminServerName => 'सर्वर का नाम';

  @override
  String get adminPreferredMetadataCountry => 'पसंदीदा मेटाडेटा देश';

  @override
  String get adminCachePath => 'कैश पथ';

  @override
  String get adminMetadataPath => 'मेटाडेटा पथ';

  @override
  String get adminLibraryScanConcurrency => 'लाइब्रेरी स्कैन समवर्ती';

  @override
  String get adminParallelImageEncodingLimit => 'समानांतर छवि एन्कोडिंग सीमा';

  @override
  String get adminSlowResponseThreshold => 'धीमी प्रतिक्रिया सीमा (एमएस)';

  @override
  String get adminBrandingSaved => 'ब्रांडिंग सेटिंग सहेजी गईं';

  @override
  String get adminBrandingLoadFailed => 'ब्रांडिंग सेटिंग लोड करने में विफल';

  @override
  String get adminLoginDisclaimer => 'लॉगिन अस्वीकरण';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML लॉगिन फॉर्म के नीचे प्रदर्शित होता है';

  @override
  String get adminCustomCss => 'कस्टम सीएसएस';

  @override
  String get adminCustomCssHint => 'कस्टम सीएसएस वेब इंटरफ़ेस पर लागू किया गया';

  @override
  String get adminEnableSplashScreen => 'स्प्लैश स्क्रीन सक्षम करें';

  @override
  String get adminStreamingSaved => 'स्ट्रीमिंग सेटिंग्स सहेजी गईं';

  @override
  String get adminStreamingLoadFailed => 'स्ट्रीमिंग सेटिंग लोड करने में विफल';

  @override
  String get adminStreamingDescription =>
      'दूरस्थ कनेक्शन के लिए वैश्विक स्ट्रीमिंग बिटरेट सीमाएँ निर्धारित करें।';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'दूरस्थ क्लाइंट बिटरेट सीमा (एमबीपीएस)';

  @override
  String get adminLeaveEmptyForUnlimited => 'असीमित के लिए खाली या 0 छोड़ें';

  @override
  String get adminPlaybackSaved => 'प्लेबैक सेटिंग सहेजी गईं';

  @override
  String get adminPlaybackLoadFailed => 'प्लेबैक सेटिंग लोड करने में विफल';

  @override
  String get adminPlaybackTranscoding => 'प्लेबैक/ट्रांसकोडिंग';

  @override
  String get adminHardwareAcceleration => 'हार्डवेयर एक्सिलरेशन';

  @override
  String get adminVaapiDevice => 'वीए-एपीआई डिवाइस';

  @override
  String get adminEnableHardwareEncoding => 'हार्डवेयर एन्कोडिंग सक्षम करें';

  @override
  String get adminEnableHardwareDecoding =>
      'इसके लिए हार्डवेयर डिकोडिंग सक्षम करें:';

  @override
  String get adminEncodingThreads => 'एन्कोडिंग धागे';

  @override
  String get adminAutomatic => '0 = स्वचालित';

  @override
  String get adminTranscodingTempPath => 'ट्रांसकोडिंग अस्थायी पथ';

  @override
  String get adminEnableFallbackFont => 'फ़ॉलबैक फ़ॉन्ट सक्षम करें';

  @override
  String get adminFallbackFontPath => 'फ़ॉलबैक फ़ॉन्ट पथ';

  @override
  String get adminAllowSegmentDeletion => 'खंड हटाने की अनुमति दें';

  @override
  String get adminSegmentKeepSeconds => 'खंड रखें (सेकंड)';

  @override
  String get adminThrottleBuffering => 'थ्रॉटल बफ़रिंग';

  @override
  String get adminTrickplaySaved => 'ट्रिकप्ले सेटिंग्स सहेजी गईं';

  @override
  String get adminTrickplayLoadFailed => 'ट्रिकप्ले सेटिंग लोड करने में विफल';

  @override
  String get adminEnableHardwareAcceleration => 'हार्डवेयर त्वरण सक्षम करें';

  @override
  String get adminEnableKeyFrameExtraction =>
      'केवल कुंजी फ़्रेम निष्कर्षण सक्षम करें';

  @override
  String get adminKeyFrameSubtitle => 'तेज़ लेकिन कम सटीकता';

  @override
  String get adminScanBehavior => 'व्यवहार को स्कैन करें';

  @override
  String get adminProcessPriority => 'प्रक्रिया प्राथमिकता';

  @override
  String get adminImageSettings => 'छवि सेटिंग्स';

  @override
  String get adminIntervalMs => 'अंतराल (एमएस)';

  @override
  String get adminCaptureFrameSubtitle => 'फ़्रेम को कितनी बार कैप्चर करना है';

  @override
  String get adminWidthResolutions => 'चौड़ाई संकल्प';

  @override
  String get adminTileWidth => 'टाइल की चौड़ाई';

  @override
  String get adminTileHeight => 'टाइल की ऊंचाई';

  @override
  String get adminQualitySubtitle => 'कम मान = बेहतर गुणवत्ता, बड़ी फ़ाइलें';

  @override
  String get adminProcessThreads => 'प्रक्रिया धागे';

  @override
  String get adminResumeSaved => 'बायोडाटा सेटिंग्स सहेजी गईं';

  @override
  String get adminResumeLoadFailed => 'बायोडाटा सेटिंग लोड करने में विफल';

  @override
  String get adminResumeDescription =>
      'कॉन्फ़िगर करें जब सामग्री को आंशिक रूप से चलाया गया या पूरी तरह से चलाया गया के रूप में चिह्नित किया जाना चाहिए।';

  @override
  String get adminMinResumePercentage => 'न्यूनतम बायोडाटा प्रतिशत';

  @override
  String get adminMinResumeSubtitle =>
      'प्रगति को बचाने के लिए सामग्री को इस प्रतिशत से पहले चलाया जाना चाहिए';

  @override
  String get adminMaxResumePercentage => 'अधिकतम बायोडाटा प्रतिशत';

  @override
  String get adminMaxResumeSubtitle =>
      'इस प्रतिशत के बाद सामग्री को पूरी तरह से चलाया हुआ माना जाता है';

  @override
  String get adminMinResumeDuration => 'न्यूनतम बायोडाटा अवधि (सेकंड)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'इससे छोटे आइटम दोबारा शुरू नहीं किए जा सकते';

  @override
  String get adminMinAudiobookResume => 'न्यूनतम ऑडियोबुक बायोडाटा प्रतिशत';

  @override
  String get adminMaxAudiobookResume => 'अधिकतम ऑडियोबुक बायोडाटा प्रतिशत';

  @override
  String get adminNetworkingSaved =>
      'नेटवर्किंग सेटिंग्स सहेजी गईं. सर्वर पुनरारंभ की आवश्यकता हो सकती है.';

  @override
  String get adminNetworkingLoadFailed => 'नेटवर्किंग सेटिंग लोड करने में विफल';

  @override
  String get adminNetworkingWarning =>
      'नेटवर्किंग सेटिंग्स में बदलाव के लिए सर्वर को पुनरारंभ करने की आवश्यकता हो सकती है।';

  @override
  String get adminEnableRemoteAccess => 'रिमोट एक्सेस सक्षम करें';

  @override
  String get ports => 'बंदरगाहों';

  @override
  String get adminHttpPort => 'HTTP पोर्ट';

  @override
  String get adminHttpsPort => 'HTTPS पोर्ट';

  @override
  String get adminPublicHttpsPort => 'सार्वजनिक HTTPS पोर्ट';

  @override
  String get adminBaseUrl => 'आधार यूआरएल';

  @override
  String get adminBaseUrlHint => 'जैसे /जेलीफ़िन';

  @override
  String get https => 'HTTPS के';

  @override
  String get adminEnableHttps => 'HTTPS सक्षम करें';

  @override
  String get adminLocalNetwork => 'स्थानीय नेटवर्क';

  @override
  String get adminLocalNetworkAddresses => 'स्थानीय नेटवर्क पते';

  @override
  String get adminKnownProxies => 'ज्ञात प्रॉक्सी';

  @override
  String get adminRemoteIpFilter => 'रिमोट आईपी फ़िल्टर';

  @override
  String get adminRemoteIpFilterEntries => 'रिमोट आईपी फ़िल्टर';

  @override
  String get adminCertificatePath => 'प्रमाणपत्र पथ';

  @override
  String get whitelist => 'श्वेतसूची';

  @override
  String get blacklist => 'काला सूची में डालना';

  @override
  String get notSet => 'सेट नहीं';

  @override
  String get adminMetadataSaved => 'मेटाडेटा सहेजा गया';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'मेटाडेटा ताज़ा करें';

  @override
  String get recursive => 'पुनरावर्ती';

  @override
  String get adminReplaceAllMetadata => 'सभी मेटाडेटा बदलें';

  @override
  String get adminReplaceAllImages => 'सभी छवियाँ बदलें';

  @override
  String get adminMetadataRefreshRequested =>
      'मेटाडेटा ताज़ा करने का अनुरोध किया गया';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'कोई दूरस्थ मिलान नहीं मिला';

  @override
  String get adminRemoteResults => 'दूरस्थ परिणाम';

  @override
  String get adminRemoteMetadataApplied => 'दूरस्थ मेटाडेटा लागू किया गया';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'सामग्री प्रकार अद्यतन करें';

  @override
  String get adminContentType => 'सामग्री प्रकार';

  @override
  String get adminContentTypeUpdated => 'सामग्री प्रकार अद्यतन किया गया';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'मेटाडेटा संपादक लोड करने में विफल';

  @override
  String get adminNoPeopleEntries => 'कोई भी व्यक्ति प्रवेश नहीं करता';

  @override
  String get adminNoExternalIds => 'कोई बाहरी आईडी उपलब्ध नहीं है';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'असमर्थित छवि प्रारूप';

  @override
  String get adminImageReadFailed => 'चयनित छवि पढ़ने में विफल';

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
  String get adminAllProviders => 'सभी प्रदाता';

  @override
  String get adminNoRemoteImages => 'कोई दूरस्थ चित्र नहीं मिला';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'ट्यूनर जोड़ें';

  @override
  String get adminTunerType => 'ट्यूनर प्रकार';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, अन्य';

  @override
  String get adminUrlPath => 'यूआरएल/पथ';

  @override
  String get adminNameOptional => 'नाम: (वैकल्पिक)';

  @override
  String get adminTunerAdded => 'ट्यूनर जोड़ा गया';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'गाइड प्रदाता जोड़ें';

  @override
  String get adminProviderType => 'प्रदाता प्रकार';

  @override
  String get adminProviderTypeHint => 'शेड्यूलडायरेक्ट या एक्सएमएलटीवी';

  @override
  String get adminUsernameOptional => 'उपयोगकर्ता नाम (वैकल्पिक)';

  @override
  String get adminRefreshInterval => 'ताज़ा अंतराल (घंटे)';

  @override
  String get adminProviderAdded => 'प्रदाता जोड़ा गया';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'ट्यूनर रीसेट का अनुरोध किया गया';

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
  String get adminRecordingSettings => 'रिकॉर्डिंग सेटिंग्स';

  @override
  String get adminPrePadding => 'प्री-पैडिंग (मिनट)';

  @override
  String get adminPostPadding => 'पोस्ट-पैडिंग (मिनट)';

  @override
  String get adminRecordingPath => 'रिकॉर्डिंग पथ';

  @override
  String get adminSeriesRecordingPath => 'श्रृंखला रिकॉर्डिंग पथ';

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
  String get adminRecordingSettingsSaved => 'रिकॉर्डिंग सेटिंग सहेजी गईं';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'चैनल मैपिंग सेट करें';

  @override
  String get adminMappingJson => 'JSON मैपिंग';

  @override
  String get adminMappingJsonHint => 'उदाहरण: मैपिंग JSON पेलोड';

  @override
  String get adminChannelMappingsUpdated => 'चैनल मैपिंग अपडेट की गई';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'लाइव टीवी प्रशासन लोड करने में विफल';

  @override
  String get adminTunerDevices => 'ट्यूनर उपकरण';

  @override
  String get adminNoTunerHosts => 'कोई ट्यूनर होस्ट कॉन्फ़िगर नहीं किया गया';

  @override
  String get adminGuideProviders => 'मार्गदर्शक प्रदाता';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'प्रदाता जोड़ें';

  @override
  String get adminNoListingProviders =>
      'कोई लिस्टिंग प्रदाता कॉन्फ़िगर नहीं किया गया';

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
  String get adminTunerDiscovery => 'ट्यूनर डिस्कवरी';

  @override
  String get adminChannelMappings => 'चैनल मैपिंग';

  @override
  String get adminNoDiscoveredTuners => 'अभी तक कोई ट्यूनर खोजा नहीं गया';

  @override
  String get adminSettingsSaved => 'सेटिंग्स को सहेजा गया';

  @override
  String get adminBackupsNotAvailable =>
      'इस सर्वर बिल्ड पर बैकअप उपलब्ध नहीं हैं।';

  @override
  String get adminRestoreWarning1 =>
      'पुनर्स्थापित करने से सभी मौजूदा सर्वर डेटा को बैकअप डेटा से बदल दिया जाएगा।';

  @override
  String get adminRestoreWarning2 =>
      'वर्तमान सर्वर सेटिंग्स, उपयोगकर्ता और लाइब्रेरी डेटा को अधिलेखित कर दिया जाएगा।';

  @override
  String get adminRestoreWarning3 =>
      'पुनर्स्थापना के बाद सर्वर पुनः आरंभ होगा।';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'पुनर्स्थापित करने का अनुरोध किया गया. सर्वर पुनरारंभ इस सत्र को डिस्कनेक्ट कर सकता है।';

  @override
  String get adminBackupsTitle => 'बैकअप';

  @override
  String get adminUnknownDate => 'अज्ञात तिथि';

  @override
  String get adminUnnamedBackup => 'अनाम बैकअप';

  @override
  String get adminLiveTvNotAvailable =>
      'इस सर्वर बिल्ड पर लाइव टीवी प्रशासन उपलब्ध नहीं है।';

  @override
  String get adminLiveTvTitle => 'लाइव टीवी प्रशासन';

  @override
  String get adminApply => 'आवेदन करना';

  @override
  String get adminNotSet => 'सेट नहीं';

  @override
  String get adminReset => 'रीसेट करें';

  @override
  String get adminLogsTitle => 'सर्वर लॉग';

  @override
  String get adminLogsNewestFirst => 'नवीनतम प्रथम';

  @override
  String get adminLogsOldestFirst => 'सबसे पुराना पहले';

  @override
  String get adminLogsJustNow => 'बस अब';

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
  String get adminLogViewerNoMatches => 'कोई मेल खाती पंक्तियाँ नहीं';

  @override
  String get adminMetadataEditorTitle => 'मेटाडेटा संपादक';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => 'प्रकार';

  @override
  String get adminMetadataDetails => 'विवरण';

  @override
  String get adminMetadataExternalIds => 'बाहरी आईडी';

  @override
  String get adminMetadataImages => 'इमेजिस';

  @override
  String get adminMetadataFieldTitle => 'शीर्षक';

  @override
  String get adminMetadataFieldSortTitle => 'शीर्षक क्रमबद्ध करें';

  @override
  String get adminMetadataFieldOriginalTitle => 'मूल शीर्षक';

  @override
  String get adminMetadataFieldPremiereDate => 'प्रीमियर तिथि (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'समाप्ति तिथि (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'उत्पादन वर्ष';

  @override
  String get adminMetadataFieldOfficialRating => 'आधिकारिक रेटिंग';

  @override
  String get adminMetadataFieldCommunityRating => 'सामुदायिक रेटिंग';

  @override
  String get adminMetadataFieldCriticRating => 'आलोचक रेटिंग';

  @override
  String get adminMetadataFieldTagline => 'TAGLINE';

  @override
  String get adminMetadataFieldOverview => 'सिंहावलोकन';

  @override
  String get adminMetadataGenres => 'शैलियां';

  @override
  String get adminMetadataTags => 'टैग';

  @override
  String get adminMetadataStudios => 'स्टूडियो';

  @override
  String get adminMetadataPeople => 'लोग';

  @override
  String get adminMetadataAddGenre => 'शैली जोड़ें';

  @override
  String get adminMetadataAddTag => 'टैग जोड़ें';

  @override
  String get adminMetadataAddStudio => 'स्टूडियो जोड़ें';

  @override
  String get adminMetadataAddPerson => 'व्यक्ति जोड़ें';

  @override
  String get adminMetadataEditPerson => 'व्यक्ति संपादित करें';

  @override
  String get adminMetadataRole => 'भूमिका';

  @override
  String get adminMetadataImagePrimary => 'प्राथमिक';

  @override
  String get adminMetadataImageBackdrop => 'पृष्ठभूमि';

  @override
  String get adminMetadataImageLogo => 'प्रतीक चिन्ह';

  @override
  String get adminMetadataImageBanner => 'बैनर';

  @override
  String get adminMetadataImageThumb => 'अँगूठा';

  @override
  String get adminMetadataRecursive => 'पुनरावर्ती';

  @override
  String get adminMetadataProvider => 'प्रदाता';

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
  String get adminMetadataImageReadFailed => 'चयनित छवि पढ़ने में विफल';

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
      'यह आइटम से वर्तमान छवि को हटा देता है।';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'अपलोड करें';

  @override
  String get adminMetadataUpdate => 'अद्यतन';

  @override
  String get adminMetadataRemoteImage => 'दूरस्थ छवि';

  @override
  String get adminPluginsInstalled => 'स्थापित';

  @override
  String get adminPluginsCatalog => 'सूची';

  @override
  String get adminPluginsActive => 'सक्रिय';

  @override
  String get adminPluginsRestart => 'पुनः आरंभ करें';

  @override
  String get adminPluginsNoSearchResults =>
      'कोई भी प्लगइन आपकी खोज से मेल नहीं खाता';

  @override
  String get adminPluginsNoneInstalled => 'कोई प्लगइन्स स्थापित नहीं है';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'उपलब्ध अद्यतन';

  @override
  String get adminPluginsPendingRemoval => 'पुनरारंभ के बाद निष्कासन लंबित है';

  @override
  String get adminPluginsChangesPending =>
      'परिवर्तन पुनः आरंभ होने तक लंबित हैं';

  @override
  String get adminPluginsEnable => 'सक्षम';

  @override
  String get adminPluginsDisable => 'अक्षम करना';

  @override
  String get adminPluginsInstallUpdate => 'अद्यतन स्थापित करें';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'कोई भी पैकेज आपकी खोज से मेल नहीं खाता';

  @override
  String get adminPluginsCatalogEmpty => 'कोई पैकेज उपलब्ध नहीं है';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'प्रायोगिक एकीकरण';

  @override
  String get adminPluginDetailExperimentalContent =>
      'प्लगइन सेटिंग्स एकीकरण अभी भी प्रयोगात्मक है। हो सकता है कि कुछ फ़ील्ड या लेआउट अभी तक सही ढंग से प्रस्तुत न हों।';

  @override
  String get adminPluginDetailToggle404 =>
      'प्लगइन टॉगल करने में विफल. सर्वर को यह प्लगइन संस्करण नहीं मिल सका। प्लगइन्स को ताज़ा करने का प्रयास करें, फिर पुनः प्रयास करें।';

  @override
  String get adminPluginDetailToggleDioError =>
      'प्लगइन टॉगल करने में विफल. विवरण के लिए कृपया सर्वर लॉग जांचें।';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'विवरण';

  @override
  String get adminPluginDetailDeveloper => 'डेवलपर';

  @override
  String get adminPluginDetailRepository => 'कोष';

  @override
  String get adminPluginDetailBundled => 'बंडल';

  @override
  String get adminPluginDetailEnablePlugin => 'प्लगइन सक्षम करें';

  @override
  String get adminPluginDetailRestartRequired =>
      'परिवर्तनों को प्रभावी करने के लिए सर्वर पुनरारंभ की आवश्यकता होती है।';

  @override
  String get adminPluginDetailRemovalPending =>
      'सर्वर पुनरारंभ होने के बाद यह प्लगइन हटा दिया जाएगा.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'यह प्लगइन ख़राब हो गया है और हो सकता है कि ठीक से काम न करे।';

  @override
  String get adminPluginDetailNotSupported =>
      'यह प्लगइन वर्तमान सर्वर संस्करण द्वारा समर्थित नहीं है।';

  @override
  String get adminPluginDetailSuperseded =>
      'इस प्लगइन को एक नए संस्करण द्वारा प्रतिस्थापित कर दिया गया है।';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'रिपोजिटरी हटाएँ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'निकालना';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'कोई रिपॉजिटरी कॉन्फ़िगर नहीं की गई';

  @override
  String get adminReposEmptySubtitle =>
      'उपलब्ध प्लगइन्स ब्राउज़ करने के लिए एक रिपॉजिटरी जोड़ें';

  @override
  String get adminReposUnnamed => '(अनाम)';

  @override
  String get adminReposEditTitle => 'रिपोजिटरी संपादित करें';

  @override
  String get adminReposAddTitle => 'रिपोजिटरी जोड़ें';

  @override
  String get adminReposUrl => 'रिपोजिटरी यूआरएल';

  @override
  String get adminReposNameHint => 'जैसे Jellyfin स्थिर';

  @override
  String get adminPluginSettingsInvalidUrl => 'असामान्य यूआरएल';

  @override
  String get adminGeneralSettingsTitle => 'सामान्य सेटिंग्स';

  @override
  String get adminGeneralMetadataLanguage => 'पसंदीदा मेटाडेटा भाषा';

  @override
  String get adminGeneralMetadataLanguageHint => 'जैसे एन, डे, फ्र';

  @override
  String get adminGeneralMetadataCountry => 'पसंदीदा मेटाडेटा देश';

  @override
  String get adminGeneralMetadataCountryHint => 'जैसे यूएस, डीई, एफआर';

  @override
  String get adminGeneralLibraryScanConcurrency => 'लाइब्रेरी स्कैन समवर्ती';

  @override
  String get adminGeneralImageEncodingLimit => 'समानांतर छवि एन्कोडिंग सीमा';

  @override
  String get adminUnknownError => 'अज्ञात त्रुटि';

  @override
  String get adminBrowse => 'ब्राउज़';

  @override
  String get adminCloseBrowser => 'ब्राउज़र बंद करें';

  @override
  String get adminNetworkingTitle => 'नेटवर्किंग';

  @override
  String get adminNetworkingRestartWarning =>
      'नेटवर्किंग सेटिंग्स में बदलाव के लिए सर्वर को पुनरारंभ करने की आवश्यकता हो सकती है।';

  @override
  String get adminNetworkingRemoteAccess => 'रिमोट एक्सेस सक्षम करें';

  @override
  String get adminNetworkingPorts => 'बंदरगाहों';

  @override
  String get adminNetworkingHttpPort => 'HTTP पोर्ट';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS पोर्ट';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS सक्षम करें';

  @override
  String get adminNetworkingLocalNetwork => 'स्थानीय नेटवर्क';

  @override
  String get adminNetworkingLocalAddresses => 'स्थानीय नेटवर्क पते';

  @override
  String get adminNetworkingAddressHint => 'जैसे 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'ज्ञात प्रॉक्सी';

  @override
  String get adminNetworkingProxyHint => 'जैसे 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'श्वेतसूची';

  @override
  String get adminNetworkingBlacklist => 'काला सूची में डालना';

  @override
  String get adminNetworkingAddEntry => 'प्रविष्टि जोड़ें';

  @override
  String get adminBrandingTitle => 'ब्रांडिंग';

  @override
  String get adminBrandingLoginDisclaimer => 'लॉगिन अस्वीकरण';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML लॉगिन फॉर्म के नीचे प्रदर्शित होता है';

  @override
  String get adminBrandingCustomCss => 'कस्टम सीएसएस';

  @override
  String get adminBrandingCustomCssHint =>
      'कस्टम सीएसएस वेब इंटरफ़ेस पर लागू किया गया';

  @override
  String get adminBrandingEnableSplash => 'स्प्लैश स्क्रीन सक्षम करें';

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
  String get adminPlaybackHwAccel => 'हार्डवेयर एक्सिलरेशन';

  @override
  String get adminPlaybackHwAccelLabel => 'हार्डवेयर एक्सिलरेशन';

  @override
  String get adminPlaybackEnableHwEncoding => 'हार्डवेयर एन्कोडिंग सक्षम करें';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'इसके लिए हार्डवेयर डिकोडिंग सक्षम करें:';

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
  String get adminPlaybackEncoding => 'एन्कोडिंग';

  @override
  String get adminPlaybackEncodingThreads => 'एन्कोडिंग धागे';

  @override
  String get adminPlaybackFallbackFont => 'फ़ॉलबैक फ़ॉन्ट सक्षम करें';

  @override
  String get adminPlaybackFallbackFontPath => 'फ़ॉलबैक फ़ॉन्ट पथ';

  @override
  String get adminPlaybackStreaming => 'स्ट्रीमिंग';

  @override
  String get adminResumeVideo => 'वीडियो';

  @override
  String get adminResumeAudiobooks => 'ऑडियो पुस्तकें';

  @override
  String get adminResumeMinAudiobookPct => 'न्यूनतम ऑडियोबुक बायोडाटा प्रतिशत';

  @override
  String get adminResumeMaxAudiobookPct => 'अधिकतम ऑडियोबुक बायोडाटा प्रतिशत';

  @override
  String get adminStreamingBitrateLimit =>
      'दूरस्थ क्लाइंट बिटरेट सीमा (एमबीपीएस)';

  @override
  String get adminStreamingBitrateLimitHint => 'असीमित के लिए खाली या 0 छोड़ें';

  @override
  String get adminTrickplayHwAccel => 'हार्डवेयर त्वरण सक्षम करें';

  @override
  String get adminTrickplayHwEncoding => 'हार्डवेयर एन्कोडिंग सक्षम करें';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'केवल कुंजी फ़्रेम निष्कर्षण सक्षम करें';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'तेज़ लेकिन कम सटीकता';

  @override
  String get adminTrickplayNonBlocking => 'गैर अवरुद्ध';

  @override
  String get adminTrickplayBlocking => 'ब्लॉक कर रहा है';

  @override
  String get adminTrickplayPriorityHigh => 'उच्च';

  @override
  String get adminTrickplayPriorityAboveNormal => 'सामान्य से उपर';

  @override
  String get adminTrickplayPriorityNormal => 'सामान्य';

  @override
  String get adminTrickplayPriorityBelowNormal => 'सामान्य से नीचे';

  @override
  String get adminTrickplayPriorityIdle => 'निठल्ला';

  @override
  String get adminTrickplayImageSettings => 'छवि सेटिंग्स';

  @override
  String get adminTrickplayInterval => 'अंतराल (एमएस)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'फ़्रेम को कितनी बार कैप्चर करना है';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'अल्पविराम से अलग की गई पिक्सेल चौड़ाई (उदा. 320)';

  @override
  String get adminTrickplayQuality => 'गुणवत्ता';

  @override
  String get adminTrickplayQScale => 'गुणवत्ता पैमाना';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'कम मान = बेहतर गुणवत्ता, बड़ी फ़ाइलें';

  @override
  String get adminTrickplayJpegQuality => 'जेपीईजी गुणवत्ता';

  @override
  String get adminTrickplayProcessing => 'प्रसंस्करण';

  @override
  String get adminTasksEmpty => 'कोई निर्धारित कार्य नहीं मिला';

  @override
  String get adminTasksNoFilterMatch =>
      'कोई भी कार्य वर्तमान फ़िल्टर से मेल नहीं खाता';

  @override
  String get adminTaskCancelling => 'रद्द किया जा रहा है...';

  @override
  String get adminTaskRunning => 'दौड़ना...';

  @override
  String get adminTaskNeverRun => 'कभी नहीं चला';

  @override
  String get adminTaskStop => 'रुकना';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => 'दौड़ना';

  @override
  String get adminTaskDetailLastExecution => 'अंतिम निष्पादन';

  @override
  String get adminTaskDetailStarted => 'शुरू कर दिया';

  @override
  String get adminTaskDetailEnded => 'समाप्त';

  @override
  String get adminTaskDetailDuration => 'अवधि';

  @override
  String get adminTaskDetailErrorLabel => 'गलती:';

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
  String get adminTaskTriggerStartup => 'एप्लिकेशन स्टार्टअप पर';

  @override
  String get adminTaskTriggerTypeDaily => 'दैनिक';

  @override
  String get adminTaskTriggerTypeWeekly => 'साप्ताहिक';

  @override
  String get adminTaskTriggerTypeInterval => 'एक अंतराल पर';

  @override
  String get adminTaskTriggerIntervalLabel => 'अंतराल';

  @override
  String get adminTaskTriggerEveryHour => 'हर घंटे';

  @override
  String get adminTaskTriggerEvery6Hours => 'हर 6 घंटे में';

  @override
  String get adminTaskTriggerEvery12Hours => 'हर 12 घंटे में';

  @override
  String get adminTaskTriggerEvery24Hours => 'हर 24 घंटे';

  @override
  String get adminTaskTriggerEvery2Days => 'हर 2 दिन में';

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
  String get adminTaskTriggerTime => 'समय';

  @override
  String get adminTaskTriggerNoLimit => 'कोई सीमा नहीं';

  @override
  String get adminActivityJustNow => 'बस अब';

  @override
  String get adminActivityLastHour => 'आखिरी घंटा';

  @override
  String get adminActivityToday => 'आज';

  @override
  String get adminActivityYesterday => 'कल';

  @override
  String get adminActivityOlder => 'पुराने';

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
  String get adminActivityNow => 'अब';

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
      'पूर्वावलोकन थंबनेल खोजने के लिए ट्रिकप्ले छवि निर्माण कॉन्फ़िगर करें।';

  @override
  String get adminNetworkingPublicHttpsPort => 'सार्वजनिक HTTPS पोर्ट';

  @override
  String get adminNetworkingBaseUrl => 'आधार यूआरएल';

  @override
  String get adminNetworkingBaseUrlHint => 'जैसे /जेलीफ़िन';

  @override
  String get adminNetworkingHttps => 'HTTPS के';

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
  String get adminNetworkingCertPath => 'प्रमाणपत्र पथ';

  @override
  String get adminNetworkingRemoteIpFilter => 'रिमोट आईपी फ़िल्टर';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'रिमोट आईपी फ़िल्टर';

  @override
  String get adminPlaybackVaapiDevice => 'वीए-एपीआई डिवाइस';

  @override
  String get adminPlaybackAutomatic => '0 = स्वचालित';

  @override
  String get adminPlaybackTranscodeTempPath => 'ट्रांसकोडिंग अस्थायी पथ';

  @override
  String get adminPlaybackSegmentDeletion => 'खंड हटाने की अनुमति दें';

  @override
  String get adminPlaybackSegmentKeep => 'खंड रखें (सेकंड)';

  @override
  String get adminPlaybackThrottleBuffering => 'थ्रॉटल बफ़रिंग';

  @override
  String get adminResumeMinPct => 'न्यूनतम बायोडाटा प्रतिशत';

  @override
  String get adminResumeMinPctSubtitle =>
      'प्रगति को बचाने के लिए सामग्री को इस प्रतिशत से पहले चलाया जाना चाहिए';

  @override
  String get adminResumeMaxPct => 'अधिकतम बायोडाटा प्रतिशत';

  @override
  String get adminResumeMaxPctSubtitle =>
      'इस प्रतिशत के बाद सामग्री को पूरी तरह से चलाया हुआ माना जाता है';

  @override
  String get adminResumeMinDuration => 'न्यूनतम बायोडाटा अवधि (सेकंड)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'इससे छोटे आइटम दोबारा शुरू नहीं किए जा सकते';

  @override
  String get adminTrickplayScanBehavior => 'व्यवहार को स्कैन करें';

  @override
  String get adminTrickplayProcessPriority => 'प्रक्रिया प्राथमिकता';

  @override
  String get adminTrickplayTileWidth => 'टाइल की चौड़ाई';

  @override
  String get adminTrickplayTileHeight => 'टाइल की ऊंचाई';

  @override
  String get adminTrickplayProcessThreads => 'प्रक्रिया धागे';

  @override
  String get adminTrickplayWidthResolutions => 'चौड़ाई संकल्प';

  @override
  String get adminMetadataDefault => 'गलती करना';

  @override
  String get adminMetadataContentTypeUpdated =>
      'सामग्री प्रकार अद्यतन किया गया';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'धीमी प्रतिक्रिया सीमा (एमएस)';

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
  String get adminGeneralCachePath => 'कैश पथ';

  @override
  String get adminGeneralMetadataPath => 'मेटाडेटा पथ';

  @override
  String get adminGeneralServerName => 'सर्वर का नाम';

  @override
  String get adminSettingsLoadFailed => 'सेटिंग्स लोड करने में विफल';

  @override
  String get adminDiscover => 'खोज करना';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'फ़ोल्डर';

  @override
  String get libraries => 'पुस्तकालय';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay अक्षम';

  @override
  String get syncPlayDisabledMessage =>
      'सिंक्रनाइज़ प्लेबैक का उपयोग करने के लिए सेटिंग्स में SyncPlay सक्षम करें।';

  @override
  String get syncPlayServerUnsupportedTitle => 'सर्वर असमर्थित';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay को Jellyfin सर्वर की आवश्यकता है। वर्तमान सर्वर इसका समर्थन नहीं करता.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay समूह';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay समूह';

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
  String get syncPlayIgnoreWait => 'प्रतीक्षा पर ध्यान न दें';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'इस डिवाइस के बफ़र होने पर समूह को पकड़कर न रखें';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'धीमे सदस्यों की प्रतीक्षा किए बिना स्थानीय रूप से जारी रखें';

  @override
  String get syncPlayRepeat => 'दोहराना';

  @override
  String get syncPlayRepeatOne => 'एक';

  @override
  String get syncPlayShuffleModeShuffled => 'फेरबदल';

  @override
  String get syncPlayShuffleModeSorted => 'क्रमबद्ध';

  @override
  String get syncPlaySyncCurrentQueue => 'वर्तमान प्लेबैक कतार को सिंक करें';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'समूह कतार को स्थानीय स्तर पर जो चल रहा है उससे बदलें';

  @override
  String get syncPlayLeaveGroup => 'समूह छोड़ दें';

  @override
  String get syncPlayGroupQueue => 'समूह कतार';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'अब खेलते हैं';

  @override
  String get syncPlayCreateNewGroup => 'एक नया समूह बनाएं';

  @override
  String get syncPlayGroupName => 'समूह नाम';

  @override
  String get syncPlayDefaultGroupName => 'मेरा SyncPlay समूह';

  @override
  String get syncPlayCreateGroup => 'समूह बनाना';

  @override
  String get syncPlayAvailableGroups => 'उपलब्ध समूह';

  @override
  String get syncPlayNoGroupsAvailable => 'कोई समूह उपलब्ध नहीं';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay समूह में शामिल हों?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay समूह में शामिल होने से आपकी वर्तमान प्लेबैक कतार प्रतिस्थापित हो सकती है। जारी रखना?';

  @override
  String get syncPlayJoin => 'जोड़ना';

  @override
  String get syncPlayStateIdle => 'निठल्ला';

  @override
  String get syncPlayStateWaiting => 'इंतज़ार में';

  @override
  String get syncPlayStatePaused => 'रुका हुआ';

  @override
  String get syncPlayStatePlaying => 'खेलना';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay पहुंच अस्वीकृत';

  @override
  String get syncPlayAccessDeniedMessage =>
      'आपके पास इस SyncPlay समूह में एक या अधिक आइटम तक पहुंच नहीं है। समूह स्वामी से लाइब्रेरी अनुमतियों को सत्यापित करने या एक अलग कतार चुनने के लिए कहें।';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'ध्वनि खोज अनुपलब्ध है.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision डायरेक्ट प्ले विफल';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'इस Dolby Vision स्ट्रीम के लिए सीधा प्ले शुरू होने में विफल रहा। सर्वर ट्रांसकोड का उपयोग करके पुनः प्रयास करें?';

  @override
  String get retryWithTranscode => 'ट्रांसकोड के साथ पुनः प्रयास करें';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision समर्थित नहीं';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'यह डिवाइस Dolby Vision सामग्री को सीधे डीकोड नहीं कर सकता। HDR10 फ़ॉलबैक का उपयोग करें या सर्वर ट्रांसकोडिंग का अनुरोध करें।';

  @override
  String get rememberMyChoice => 'मेरी पसंद याद रखें';

  @override
  String get playHdr10Fallback => 'HDR10 फ़ॉलबैक चलाएं';

  @override
  String get requestTranscode => 'ट्रांसकोड का अनुरोध करें';

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
  String get seeAll => 'सभी देखें';

  @override
  String get noItems => 'कोई आइटम नहीं';

  @override
  String get switchUser => 'उपयोगकर्ता बदलें';

  @override
  String get remoteControl => 'रिमोट कंट्रोल';

  @override
  String get mediaBarLoading => 'मीडिया बार लोड हो रहा है...';

  @override
  String get mediaBarError => 'मीडिया बार लोड होने में विफल रहा';

  @override
  String get offlineServerUnavailable =>
      'इंटरनेट से कनेक्ट है, लेकिन वर्तमान सर्वर अनुपलब्ध है।';

  @override
  String get offlineNoInternet =>
      'आप संपर्क में नहीं हैं। केवल डाउनलोड की गई सामग्री ही उपलब्ध है।';

  @override
  String get offlineFileNotAvailable => 'फ़ाइल उपलब्ध नहीं है';

  @override
  String get offlineSwitchServer => 'सर्वर स्विच करें';

  @override
  String get offlineSavedMedia => 'सहेजा गया मीडिया';

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
  String get castRemotePlayback => 'रिमोट प्लेबैक';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'डिवाइस वॉल्यूम';

  @override
  String get castVolumeUnavailable => 'अनुपलब्ध';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'ऑडियो';

  @override
  String get subtitlesLabel => 'उपशीर्षक';

  @override
  String get pinConfirmTitle => 'पिन की पुष्टि करें';

  @override
  String get pinSetTitle => 'पिन सेट करें';

  @override
  String get pinEnterTitle => 'पिन दर्ज करें';

  @override
  String get pinReenterToConfirm =>
      'पुष्टि करने के लिए अपना पिन पुनः दर्ज करें';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'ग़लत पिन';

  @override
  String get pinMismatch => 'पिन मेल नहीं खाते';

  @override
  String get pinForgot => 'पिन भूल गए?';

  @override
  String get pinClear => 'स्पष्ट';

  @override
  String get pinBackspace => 'बैकस्पेस';

  @override
  String get quickConnectAuthorized => 'त्वरित कनेक्ट अनुरोध अधिकृत।';

  @override
  String get quickConnectInvalidOrExpired =>
      'क्विक कनेक्ट कोड अमान्य है या समाप्त हो गया है।';

  @override
  String get quickConnectNotSupported =>
      'इस सर्वर पर क्विक कनेक्ट समर्थित नहीं है.';

  @override
  String get quickConnectAuthorizeFailed =>
      'त्वरित कनेक्ट कोड को अधिकृत करने में विफल।';

  @override
  String get quickConnectDisabled => 'इस सर्वर पर त्वरित कनेक्ट अक्षम है.';

  @override
  String get quickConnectForbidden =>
      'आपका खाता इस त्वरित कनेक्ट अनुरोध को अधिकृत नहीं कर सकता.';

  @override
  String get quickConnectNotFound =>
      'त्वरित कनेक्ट कोड नहीं मिला. नया कोड आज़माएँ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'कोड दर्ज करें';

  @override
  String get quickConnectAuthorize => 'अधिकृत';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'रिमोट कंट्रोल';

  @override
  String get remoteFailedToLoadSessions => 'सत्र लोड करने में विफल';

  @override
  String get remoteNoSessions => 'कोई नियंत्रणीय सत्र नहीं';

  @override
  String get remoteStartPlayback => 'किसी अन्य डिवाइस पर प्लेबैक प्रारंभ करें';

  @override
  String get unknownUser => 'अज्ञात';

  @override
  String get unknownItem => 'अज्ञात';

  @override
  String get remoteNothingPlaying => 'इस सत्र में कुछ भी नहीं चल रहा है';

  @override
  String get castingStarted => 'चयनित डिवाइस पर कास्टिंग प्रारंभ हो गई';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'कोई रिमोट प्लेबैक डिवाइस उपलब्ध नहीं है.';

  @override
  String get noRemoteDevicesIos =>
      'कोई रिमोट प्लेबैक डिवाइस उपलब्ध नहीं है.\n\niOS पर, सिम्युलेटर में AirPlay लक्ष्य अनुपलब्ध हो सकते हैं।';

  @override
  String get trackActionPlayNext => 'अगला खेलें';

  @override
  String get trackActionAddToQueue => 'क़तार में जोड़ें';

  @override
  String get trackActionAddToPlaylist => 'प्लेलिस्ट में जोड़ें';

  @override
  String get trackActionCancelDownload => 'डाउनलोड रद्द करें';

  @override
  String get trackActionDeleteFromPlaylist => 'प्लेलिस्ट से हटाएँ';

  @override
  String get trackActionMoveUp => 'बढ़ाना';

  @override
  String get trackActionMoveDown => 'नीचे की ओर';

  @override
  String get trackActionRemoveFromFavorites => 'पसंदीदा से हटाएँ';

  @override
  String get trackActionAddToFavorites => 'पसंदीदा में जोड़े';

  @override
  String get trackActionGoToAlbum => 'एल्बम पर जाएँ';

  @override
  String get trackActionGoToArtist => 'कलाकार के पास जाएँ';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'डाउनलोड की गई फ़ाइल हटा दी गई';

  @override
  String get trackActionDeleteFileFailed =>
      'डाउनलोड की गई फ़ाइल को हटाया नहीं जा सका';

  @override
  String get shuffleBy => 'द्वारा शफ़ल करें';

  @override
  String get shuffleSelectLibrary => 'लाइब्रेरी का चयन करें';

  @override
  String get shuffleSelectGenre => 'शैली चुनें';

  @override
  String get shuffleLibrary => 'पुस्तकालय';

  @override
  String get shuffleGenre => 'शैली';

  @override
  String get shuffleNoLibraries => 'कोई संगत लाइब्रेरी उपलब्ध नहीं है.';

  @override
  String get shuffleNoGenres => 'इस शफ़ल मोड के लिए कोई शैली नहीं मिली.';

  @override
  String get posterDisplayTitle => 'प्रदर्शन';

  @override
  String get posterImageType => 'छवि प्रकार';

  @override
  String get imageTypePoster => 'पोस्टर';

  @override
  String get imageTypeThumbnail => 'थंबनेल';

  @override
  String get imageTypeBanner => 'बैनर';

  @override
  String get playlistAddFailed => 'प्लेलिस्ट में जोड़ने में विफल';

  @override
  String get playlistCreateFailed => 'प्लेलिस्ट बनाने में विफल';

  @override
  String get playlistNew => 'नई प्लेलिस्ट';

  @override
  String get playlistCreate => 'बनाएं';

  @override
  String get playlistCreateNew => 'नई प्लेलिस्ट बनाएं';

  @override
  String get playlistNoneFound => 'कोई प्लेलिस्ट नहीं मिली';

  @override
  String get addToPlaylist => 'प्लेलिस्ट में जोड़ें';

  @override
  String get lyricsNotAvailable => 'कोई गीत उपलब्ध नहीं';

  @override
  String get upNext => 'अगला';

  @override
  String get playNext => 'अगला खेलें';

  @override
  String get stillWatchingContent =>
      'प्लेबैक रोक दिया गया है. क्या आप अभी भी देख रहे हैं?';

  @override
  String get stillWatchingStop => 'रुकना';

  @override
  String get stillWatchingContinue => 'जारी रखना';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'लाइव टीवी';

  @override
  String get continueWatchingAndNextUp => 'देखना जारी रखें और आगे बढ़ें';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'अगला एपिसोड';

  @override
  String get moreFromThisSeason => 'इस सीज़न से अधिक';

  @override
  String get playerTooltipPlaybackSpeed => 'प्लेबैक गति';

  @override
  String get playerTooltipCastControls => 'कास्ट नियंत्रण';

  @override
  String get playerTooltipPlaybackQuality => 'बिटरेट';

  @override
  String get playerTooltipEnterFullscreen => 'फ़ुलस्क्रीन दर्ज करें';

  @override
  String get playerTooltipExitFullscreen => 'फ़ुलस्क्रीन से बाहर निकलें';

  @override
  String get playerTooltipFloatOnTop => 'शीर्ष पर तैरें';

  @override
  String get playerTooltipExitFloatOnTop => 'शीर्ष पर फ़्लोट अक्षम करें';

  @override
  String get playerTooltipLockLandscape => 'परिदृश्य लॉक करें';

  @override
  String get playerTooltipUnlockOrientation => 'घूमने की अनुमति दें';

  @override
  String get playerTooltipPrevious => 'पहले का';

  @override
  String get playerTooltipSeekBack => 'वापस खोजो';

  @override
  String get playerTooltipSeekForward => 'आगे की तलाश करो';

  @override
  String get contextMenuMarkWatched => 'देखे गए के रूप में चिह्नित करें';

  @override
  String get contextMenuMarkUnwatched => 'न देखे गए के रूप में चिह्नित करें';

  @override
  String get contextMenuAddToFavorites => 'पसंदीदा में जोड़े';

  @override
  String get contextMenuRemoveFromFavorites => 'पसंदीदा से हटाएँ';

  @override
  String get contextMenuGoToSeries => 'श्रृंखला पर जाएँ';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle => 'सर्वर प्रशासन पैनल तक पहुंचें';

  @override
  String get settingsAccountSecurity => 'खाता एवं सुरक्षा';

  @override
  String get settingsAccountSecuritySubtitle =>
      'प्रमाणीकरण, पिन कोड और माता-पिता का नियंत्रण';

  @override
  String get settingsPersonalization => 'वैयक्तिकरण';

  @override
  String get settingsPersonalizationSubtitle =>
      'थीम, नेविगेशन, होम पंक्तियाँ और लाइब्रेरी दृश्यता';

  @override
  String get settingsDynamicContent => 'गतिशील सामग्री';

  @override
  String get settingsDynamicContentSubtitle => 'मीडिया बार और विज़ुअल ओवरले';

  @override
  String get settingsPlaybackSyncplay => 'प्लेबैक और SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ऑडियो/वीडियो सेटिंग्स, उपशीर्षक, डाउनलोड और SyncPlay नियंत्रण';

  @override
  String get settingsIntegrationsSubtitle =>
      'प्लगइन सिंक, सीयर, रेटिंग और बहुत कुछ';

  @override
  String get settingsAboutSubtitle => 'ऐप संस्करण, कानूनी जानकारी और क्रेडिट';

  @override
  String get settingsAuthenticationSection => 'प्रमाणीकरण';

  @override
  String get settingsSortServersBy => 'सर्वर को इसके अनुसार क्रमित करें';

  @override
  String get settingsLastUsed => 'अंतिम समय प्रयोग हुआ';

  @override
  String get settingsAlphabetical => 'वर्णमाला';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'गोपनीयता एवं सुरक्षा';

  @override
  String get settingsBlockedRatings => 'अवरुद्ध रेटिंग';

  @override
  String get settingsGeneralStyle => 'सामान्य शैली';

  @override
  String get settingsGeneralStyleSubtitle =>
      'थीम उच्चारण, पृष्ठभूमि, देखे गए संकेतक और थीम संगीत';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'होम पेज';

  @override
  String get settingsHomePageSubtitle =>
      'अनुभाग, छवि प्रकार, ओवरले और मीडिया पूर्वावलोकन';

  @override
  String get settingsLibrariesSubtitle =>
      'लाइब्रेरी दृश्यता, फ़ोल्डर दृश्य और बहु-सर्वर व्यवहार';

  @override
  String get settingsTwentyFourHourClock => '24 घंटे की घड़ी';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'जहां भी घड़ी दिखाई दे, वहां 24-घंटे के समय स्वरूपण का उपयोग करें';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'नेविगेशन बार में शफ़ल बटन दिखाएँ';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'नेविगेशन बार में शैलियाँ बटन दिखाएँ';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'नेविगेशन बार में पसंदीदा बटन दिखाएँ';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'नेविगेशन बार में लाइब्रेरीज़ बटन दिखाएँ';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'प्रति लाइब्रेरी होम पेज दृश्यता टॉगल करें। परिवर्तनों को प्रभावी करने के लिए Moonfin को पुनः आरंभ करें।';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'मीडिया बार एवं स्थानीय पूर्वावलोकन';

  @override
  String get settingsVisualOverlays => 'दृश्य ओवरले';

  @override
  String get settingsSeasonalSurprise => 'मौसमी आश्चर्य';

  @override
  String get settingsMetadataAndRatings => 'मेटाडेटा और रेटिंग';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase अतिरिक्त रेटिंग स्रोतों, सीयर अनुरोधों और सिंक की गई प्राथमिकताओं सहित सर्वर-साइड एकीकरण को शक्ति प्रदान करता है।';

  @override
  String get settingsOfflineDownloads => 'ऑफ़लाइन डाउनलोड';

  @override
  String get settingsHigh => 'उच्च';

  @override
  String get settingsLow => 'कम';

  @override
  String get settingsCustomPath => 'कस्टम पथ';

  @override
  String get settingsEnterDownloadFolderPath => 'डाउनलोड फ़ोल्डर पथ दर्ज करें';

  @override
  String get settingsConcurrentDownloads => 'समवर्ती डाउनलोड';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'एक बार में डाउनलोड करने के लिए आइटम की अधिकतम संख्या.';

  @override
  String get settingsAppInfo => 'अनुप्रयोग की जानकारी';

  @override
  String get settingsReportAnIssue => 'किसी समस्या की रिपोर्ट करें';

  @override
  String get settingsReportAnIssueSubtitle => 'GitHub पर इश्यू ट्रैकर खोलें';

  @override
  String get settingsJoinDiscord => 'Discord से जुड़ें';

  @override
  String get settingsJoinDiscordSubtitle => 'समुदाय के साथ चैट करें';

  @override
  String get settingsJoinTheDiscord => 'Discord (विरासत)';

  @override
  String get settingsSupportMoonfin => 'समर्थन Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'कानूनी';

  @override
  String get settingsLicenses => 'लाइसेंस';

  @override
  String get settingsOpenSourceLicenseNotices => 'ओपन-सोर्स लाइसेंस नोटिस';

  @override
  String get settingsPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin आपके डेटा को कैसे संभालता है';

  @override
  String get settingsCheckForUpdates => 'अद्यतन के लिए जाँच';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'नवीनतम Moonfin रिलीज़ की जाँच करें';

  @override
  String get settingsPoweredByFlutter => 'स्पंदन द्वारा संचालित';

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
  String get settingsBoth => 'दोनों';

  @override
  String get settingsShuffleContentTypeFilter =>
      'सामग्री प्रकार फ़िल्टर को शफ़ल करें';

  @override
  String get settingsVideoPlaybackPreferences => 'वीडियो प्लेबैक प्राथमिकताएँ';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'कोर वीडियो इंजन और स्ट्रीमिंग गुणवत्ता सेटिंग्स';

  @override
  String get settingsAudioPreferences => 'ऑडियो प्राथमिकताएँ';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ऑडियो ट्रैक, प्रोसेसिंग और पासथ्रू विकल्प';

  @override
  String get settingsAutomationAndQueue => 'स्वचालन एवं कतार';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'स्वचालित प्लेबैक और अनुक्रमण';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'डाउनलोड गुणवत्ता, भंडारण सीमा और कतार का आकार';

  @override
  String get settingsSyncplaySubtitle => 'समूह सत्रों के लिए तुल्यकालन तर्क';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'विशिष्ट खिलाड़ी सुविधाएँ. सावधानी से प्रयोग करें, क्योंकि कुछ विकल्प प्लेबैक समस्याएँ पैदा कर सकते हैं';

  @override
  String get settingsSkipIntrosAndOutros => 'परिचय और बाह्य को छोड़ें?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'शीघ्र उपयोगकर्ता';

  @override
  String get settingsSkip => 'छोडना';

  @override
  String get settingsDoNothing => 'कुछ भी नहीं है';

  @override
  String get settingsMaxBitrateDescription =>
      'स्ट्रीमिंग बिटरेट को कैप करें. इस सीमा से ऊपर की सामग्री को फिट करने के लिए ट्रांसकोड किया जाएगा।';

  @override
  String get settingsMaxResolutionDescription =>
      'खिलाड़ी द्वारा अनुरोधित अधिकतम रिज़ॉल्यूशन को सीमित करें। उच्च-रिज़ॉल्यूशन सामग्री को नीचे ट्रांसकोड किया जाएगा।';

  @override
  String get settingsPlayerZoomDescription =>
      'स्क्रीन पर फ़िट होने के लिए वीडियो को कैसे स्केल किया जाना चाहिए.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'प्लेबैक इंजन (एंड्रॉइड टीवी)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'एंड्रॉइड टीवी उपकरणों पर डिफ़ॉल्ट प्लेबैक इंजन चुनें। परिवर्तन अगले प्लेबैक सत्र पर लागू होते हैं।';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (अनुशंसित)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (विरासत)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision फ़ॉलबैक';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision डिकोडिंग के बिना उपकरणों पर Dolby Vision शीर्षकों के लिए व्यवहार।';

  @override
  String get settingsAskEachTime => 'हर बार पूछें';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 फ़ॉलबैक को प्राथमिकता दें';

  @override
  String get settingsPreferServerTranscode =>
      'सर्वर ट्रांसकोड को प्राथमिकता दें';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision प्रोफ़ाइल 7 डायरेक्ट प्ले';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'नियंत्रित करता है कि क्या Dolby Vision प्रोफ़ाइल 7 एन्हांसमेंट-लेयर स्ट्रीम को निर्देशित करना चाहिए।';

  @override
  String get settingsAutoAftkrtEnabled => 'स्वतः (AFTKRT सक्षम)';

  @override
  String get settingsEnabledOnThisDevice => 'इस डिवाइस पर सक्षम है';

  @override
  String get settingsDisabledPreferTranscode =>
      'अक्षम (ट्रांसकोड को प्राथमिकता दें)';

  @override
  String get settingsResumeRewindDescription =>
      'प्लेबैक फिर से शुरू करते समय (कंटिन्यू वॉचिंग या मीडिया आइटम पेज से), कितने सेकंड रीवाइंड किया जाना चाहिए?';

  @override
  String get settingsUnpauseRewindDescription =>
      'पॉज़ बटन दबाने के बाद प्लेबैक फिर से शुरू करते समय, कितने सेकंड तक रिवाइंड किया जाना चाहिए?';

  @override
  String get settingsSkipBackLengthDescription =>
      'रिवाइंड बटन दबाने के बाद कितने सेकंड पीछे कूदना है।';

  @override
  String get settingsOneSecond => '1 सेकंड';

  @override
  String get settingsThreeSeconds => '3 सेकंड';

  @override
  String get settingsFortyFiveSeconds => '45 सेकंड';

  @override
  String get settingsSixtySeconds => '60 सेकंड';

  @override
  String get settingsSkipForwardLengthDescription =>
      'फ़ास्ट फ़ॉरवर्ड बटन दबाने के बाद कितने सेकंड आगे कूदना है।';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'बाहरी डिकोडर के लिए बिटस्ट्रीम AC3';

  @override
  String get settingsCinemaMode => 'सिनेमा मोड';

  @override
  String get settingsCinemaModeSubtitle =>
      'मुख्य फीचर से पहले ट्रेलर/प्रीरोल चलाएं';

  @override
  String get settingsNextUpDisplayDescription =>
      'विस्तारित एपिसोड कलाकृति और विवरण के साथ एक पूरा कार्ड दिखाता है। मिनिमल एक कॉम्पैक्ट काउंटडाउन ओवरले दिखाता है। अक्षम प्रॉम्प्ट को पूरी तरह छुपा देता है.';

  @override
  String get settingsShort => 'छोटा';

  @override
  String get settingsLong => 'लंबा';

  @override
  String get settingsVeryLong => 'बहुत लंबा';

  @override
  String get settingsVideoStartDelay => 'वीडियो प्रारंभ विलंब';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'लाइव टीवी डायरेक्ट';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'लाइव टीवी के लिए सीधा प्ले सक्षम करें';

  @override
  String get settingsOpenGroups => 'समूह खोलें';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay समूह बनाएं, शामिल हों या प्रबंधित करें';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay सक्षम';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'समूह देखने की सुविधाएँ सक्षम करें';

  @override
  String get settingsSyncplayButton => 'SyncPlay बटन';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'नेविगेशन बार पर SyncPlay बटन दिखाएँ';

  @override
  String get settingsSyncplayAdvancedCorrection => 'उन्नत सुधार';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'सुक्ष्म सिंक तर्क सक्षम करें';

  @override
  String get settingsSyncplaySyncCorrection => 'समन्वयन सुधार';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'सिंक में बने रहने के लिए प्लेबैक को स्वचालित रूप से समायोजित करें';

  @override
  String get settingsSyncplaySpeedToSync => 'सिंक करने की गति';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'सिंक करने के लिए प्लेबैक गति समायोजन का उपयोग करें';

  @override
  String get settingsSyncplaySkipToSync => 'सिंक करने के लिए आगे बढ़ें';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'सिंक करने के लिए खोज का उपयोग करें';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'न्यूनतम गति विलंब';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'अधिकतम गति विलंब';

  @override
  String get settingsSyncplaySpeedDuration => 'गति अवधि';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'न्यूनतम स्किप विलंब';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay अतिरिक्त ऑफसेट';

  @override
  String get onNow => 'अब चालू';

  @override
  String get collections => 'संग्रह';

  @override
  String get lastPlayed => 'अंतिम बार खेला गया';

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
