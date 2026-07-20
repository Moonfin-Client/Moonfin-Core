// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'खाता प्राथमिकताएँ';

  @override
  String get interfaceLanguage => 'इंटरफ़ेस भाषा';

  @override
  String get systemLanguageDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get signIn => 'दाखिल करना';

  @override
  String get empty => 'खाली';

  @override
  String connectingToServer(String serverName) {
    return '$serverName से कनेक्ट हो रहा है';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get back => 'वापस';

  @override
  String get serverUnavailable => 'सर्वर अनुपलब्ध है';

  @override
  String get loginFailed => 'लॉगिन विफल';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect उपलब्ध नहीं: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect उपलब्ध नहीं ($status): $detail';
  }

  @override
  String get whosWatching => 'कौन देख रहा है?';

  @override
  String get addUser => 'उपयोगकर्ता जोड़ें';

  @override
  String get selectServer => 'सर्वर का चयन करें';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin वर्शन $version';
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
    return '\"$serverName\" को अपने सर्वर से हटाएँ?';
  }

  @override
  String get cancel => 'रद्द करना';

  @override
  String get remove => 'हटाएँ';

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
  String get detailScreenStyle => 'विवरण स्क्रीन शैली';

  @override
  String get detailScreenStyleSubtitle =>
      'क्लासिक मूल, केंद्र में सजा moonfin लेआउट है। मॉडर्न एक रिस्पॉन्सिव सिनेमैटिक लेआउट है।';

  @override
  String get detailScreenStyleMoonfin => 'क्लासिक';

  @override
  String get detailScreenStyleModern => 'मॉडर्न';

  @override
  String get expandedTabs => 'विस्तृत टैब';

  @override
  String get expandedTabsSubtitle =>
      'टैब ब्राउज़ करते समय टैब की सामग्री अपने आप दिखाएँ। हर टैब को खुद खोलने और बंद करने के लिए इसे बंद करें।';

  @override
  String get showTechnicalDetails => 'तकनीकी विवरण दिखाएँ?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'बैनर सारांश में कोडेक, रिज़ॉल्यूशन और स्ट्रीम जानकारी दिखाएँ';

  @override
  String get recommendationSystem => 'अनुशंसा सिस्टम';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends का लोकल-लाइब्रेरी एल्गोरिदम या ऑनलाइन TMDb की समानता मेट्रिक्स इस्तेमाल करें। ध्यान दें: ऑनलाइन अनुशंसाओं के लिए Seerr इंटीग्रेशन ज़रूरी है।';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb समानता';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'पैरेंटल रेटिंग सीमा लागू करें?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin Recommends के सुझावों को लक्षित मीडिया की पैरेंटल रेटिंग के अनुसार सीमित करें';

  @override
  String get interfaceStyle => 'इंटरफ़ेस शैली';

  @override
  String get interfaceStyleSubtitle =>
      'स्वचालित आपके डिवाइस के अनुसार चलता है। कोई खास लुक चाहिए तो Apple या Material चुनें।';

  @override
  String get interfaceStyleAutomatic => 'स्वचालित';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Glass क्वालिटी';

  @override
  String get glassQualitySubtitle =>
      'ऑटो इस डिवाइस के लिए सबसे अच्छा Glass इफ़ेक्ट चुनता है। फ़ुल असली ब्लर लागू करता है; रिड्यूस्ड हल्का Glass इस्तेमाल करता है जो GPU पावर बचाता है।';

  @override
  String get glassQualityAuto => 'ऑटो';

  @override
  String get glassQualityFull => 'फ़ुल';

  @override
  String get glassQualityReduced => 'रिड्यूस्ड';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ऐप को पुनरारंभ किए बिना Moonfin और Neon Pulse के बीच स्विच करें';

  @override
  String get customThemeTitle => 'कस्टम थीम';

  @override
  String get customThemeSubtitle =>
      'कस्टम थीम पूरे Moonfin में विज़ुअल एलिमेंट बदल देती हैं। अपनी पसंद के अनुसार इनमें से कोई विकल्प चुनें।';

  @override
  String get keyboardPreferSystemIme => 'सिस्टम कीबोर्ड को प्राथमिकता दें';

  @override
  String get keyboardPreferSystemImeDescription =>
      'टेक्स्ट लिखने के लिए डिफ़ॉल्ट रूप से अपने डिवाइस की इनपुट विधि इस्तेमाल करें';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'वर्तमान Moonfin देखो आप सभी को पसंद आ गया है';

  @override
  String get themeNeonPulse => 'नियॉन पल्स';

  @override
  String get themeNeonPulseSubtitle =>
      'मैजेंटा चमक, सियान टेक्स्ट और मजबूत क्रोम कंट्रास्ट के साथ सिंथवेव स्टाइल';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'लिक्विड-ग्लास स्टाइलिंग, बहते ग्रेडिएंट बैकड्रॉप, फ़्रॉस्टेड सतहों और Apple-ब्लू एक्सेंट के साथ';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'रेट्रो पिक्सेल-आर्ट स्टाइलिंग, चंकी पैलेट, ब्लॉकी बॉर्डर, गहरे ड्रॉप-शैडो और पिक्सेल फ़ॉन्ट के साथ';

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
    return '$target से कनेक्ट नहीं हो सका';
  }

  @override
  String get exitApp => 'Moonfin से बाहर निकलें?';

  @override
  String get exitAppConfirmation =>
      'क्या आप निश्चित हैं आपकी बाहर निकलने की इच्छा है?';

  @override
  String get exit => 'बाहर निकलना';

  @override
  String get gameMenu => 'मेन्यू';

  @override
  String get gamePaused => 'पॉज़ किया गया';

  @override
  String get gameSaveState => 'स्टेट सेव करें';

  @override
  String get games => 'गेम्स';

  @override
  String get gameLoadState => 'स्टेट लोड करें';

  @override
  String get gameFastForward => 'फ़ास्ट-फ़ॉरवर्ड';

  @override
  String get gameEmulatorSettings => 'एमुलेटर सेटिंग्स';

  @override
  String get gameNoCoreOptions =>
      'इस कोर में कोई एडजस्ट करने लायक विकल्प नहीं है।';

  @override
  String get gameHoldToOpenMenu => 'मेन्यू खोलने के लिए दबाए रखें';

  @override
  String get gamePlaybackUnsupported =>
      'इस डिवाइस पर अभी गेम खेलना समर्थित नहीं है।';

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
  String get series => 'सीरीज़';

  @override
  String get noItemsFound => 'कोई आइटम नहीं मिला';

  @override
  String get home => 'होम';

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
  String get library => 'लाइब्रेरी';

  @override
  String get displaySettings => 'प्रदर्शन सेटिंग्स';

  @override
  String get allGenres => 'सभी शैलियाँ';

  @override
  String get noGenresFound => 'कोई शैलियाँ नहीं मिलीं';

  @override
  String failedToLoadFolderError(String error) {
    return 'फ़ोल्डर लोड नहीं हो सका: $error';
  }

  @override
  String get thisFolderIsEmpty => 'यह फ़ोल्डर खाली है';

  @override
  String itemCountLabel(int count) {
    return '$count आइटम';
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
    return '$count आइटम';
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
    return '$name — शैलियाँ';
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
    return '$countमि पहले';
  }

  @override
  String hoursAgo(int count) {
    return '$countघं पहले';
  }

  @override
  String daysAgo(int count) {
    return '$countदि पहले';
  }

  @override
  String get discoverySubjects => 'खोज विषय';

  @override
  String get pickDiscoverySubjects =>
      'चुनें कि डिस्कवर में कौन सा विषय फ़ीड दिखाना है।';

  @override
  String get apply => 'लागू करें';

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
    return '$count टाइटल';
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
  String get resume => 'जारी रखें';

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
    return '$count लेखक';
  }

  @override
  String genresCount(int count) {
    return '$count शैलियाँ';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% पूरा';
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
    return 'पढ़ने को प्राथमिकता देकर सजाए गए $count टाइटल।';
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
    return 'कोई $label नहीं मिला';
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
  String get watched => 'देखा गया';

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
  String get latestBooks => 'नवीनतम किताबें';

  @override
  String get latestAudiobooks => 'नवीनतम ऑडियोबुक';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count किताबें',
      one: '1 किताब',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'किताब';

  @override
  String get bookFormatAudiobook => 'ऑडियोबुक';

  @override
  String bookPercentRead(int percent) {
    return '$percent% पढ़ा';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time बाकी';
  }

  @override
  String get bookHeroRead => 'पढ़ें';

  @override
  String get bookHeroListen => 'सुनें';

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
    return '$count सेक्शन';
  }

  @override
  String firstPublished(int year) {
    return 'पहली बार प्रकाशित $year';
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
    return '$count किताबें';
  }

  @override
  String get couldNotLoadSubject => 'इस विषय को अभी लोड नहीं किया जा सका.';

  @override
  String get audiobookDetails => 'ऑडियोबुक विवरण';

  @override
  String authorsCountTitle(int count) {
    return '$count लेखक';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ऑडियोबुक',
      one: '1 ऑडियोबुक',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ट्रैक सूची';

  @override
  String get itemListPlaceholder => 'आइटम सूची यहां दिखाई देगी';

  @override
  String get failedToLoad => 'लोड करने में विफल';

  @override
  String get delete => 'मिटाएँ';

  @override
  String get save => 'सहेजें';

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
  String get seasons => 'सीज़न';

  @override
  String get chapters => 'अध्याय';

  @override
  String get features => 'विशेषताएँ';

  @override
  String get movies => 'चलचित्र';

  @override
  String get musicVideos => 'म्यूज़िक वीडियो';

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
    return 'डिस्क $number';
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
    return 'प्रकाशित $year';
  }

  @override
  String get publicationDateUnknown => 'प्रकाशन तिथि अज्ञात';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सीज़न',
      one: '1 सीज़न',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time पर खत्म';
  }

  @override
  String get items => 'आइटम';

  @override
  String get extras => 'एक्स्ट्रा';

  @override
  String get behindTheScenes => 'बिहाइंड द सीन्स';

  @override
  String get deletedScenes => 'डिलीट किए गए सीन';

  @override
  String get featurettes => 'फ़ीचरेट';

  @override
  String get interviews => 'इंटरव्यू';

  @override
  String get scenes => 'सीन';

  @override
  String get shorts => 'शॉर्ट्स';

  @override
  String get trailers => 'ट्रेलर';

  @override
  String timeRemaining(String time) {
    return '$time बाकी';
  }

  @override
  String endsIn(String time) {
    return '$time में खत्म';
  }

  @override
  String get view => 'देखना';

  @override
  String get resumeReading => 'पढ़ना फिर से शुरू करें';

  @override
  String get read => 'पढ़ना';

  @override
  String resumeFrom(String position) {
    return '$position से जारी रखें';
  }

  @override
  String get play => 'चलाएँ';

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
  String get cast => 'कास्ट करें';

  @override
  String get castMembers => 'Cast';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'प्लेलिस्ट का नाम बदलें';

  @override
  String get playlistName => 'प्लेलिस्ट का नाम';

  @override
  String get deleteDownloadedAlbum => 'डाउनलोड किया गया एल्बम हटाएँ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" के डाउनलोड किए गए ट्रैक हटाएँ?';
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
    return 'कोई $itemLabel लोड नहीं हुआ';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title डाउनलोड हो रहा है ($count आइटम)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'क्या आप वाकई \"$name\" को सर्वर से हटाना चाहते हैं? यह क्रिया वापस नहीं ली जा सकती।';
  }

  @override
  String get itemDeleted => 'आइटम हटा दिया गया';

  @override
  String get noPlayableTrailerFound => 'कोई चलाने योग्य ट्रेलर नहीं मिला.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'असमर्थित किताब फ़ॉर्मैट: .$extension';
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
    return 'सबटाइटल डाउनलोड होकर चुना गया: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'उपशीर्षक डाउनलोड किया गया. Jellyfin आइटम को रीफ्रेश करते समय इसे प्रदर्शित होने में कुछ समय लग सकता है।';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language के लिए कोई रिमोट सबटाइटल नहीं मिला।';
  }

  @override
  String get selectVersion => 'संस्करण चुनें';

  @override
  String versionNumber(int number) {
    return 'वर्शन $number';
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
    return '$name डाउनलोड हो रहा है ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'डाउनलोड की गई फ़ाइलें हटाएँ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel की लोकल फ़ाइलें हटाएँ?\n\nइससे स्टोरेज खाली होगा। आप बाद में फिर से डाउनलोड कर सकते हैं।';
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
  String get directors => 'निर्देशक';

  @override
  String get writer => 'लेखक';

  @override
  String get writers => 'लेखक';

  @override
  String get studio => 'स्टूडियो';

  @override
  String studioMoreCount(int count) {
    return '+$count और';
  }

  @override
  String totalEpisodes(int count) {
    return '$count एपिसोड';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'एपिसोड $number';
  }

  @override
  String chapterNumber(int number) {
    return 'अध्याय $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ट्रैक',
      one: '1 ट्रैक',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count अध्याय',
      one: '1 अध्याय',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'जन्म $date';
  }

  @override
  String died(String date) {
    return 'निधन $date';
  }

  @override
  String age(int age) {
    return 'उम्र $age';
  }

  @override
  String get showLess => 'कम दिखाएँ';

  @override
  String get readMore => 'और पढ़ें';

  @override
  String get shuffle => 'शफ़ल';

  @override
  String get shuffleAllMusic => 'सारा संगीत शफ़ल करें';

  @override
  String get carSignInPrompt => 'अपने फ़ोन पर Moonfin में साइन इन करें';

  @override
  String get carServerUnreachable => 'आपका सर्वर नहीं मिल रहा';

  @override
  String downloadsCount(int count) {
    return '$count डाउनलोड';
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
    return 'रिमोट सबटाइटल $action के लिए इस उपयोगकर्ता को Jellyfin की सबटाइटल प्रबंधन अनुमति चाहिए।';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'रिमोट सबटाइटल $action के लिए यह आइटम सर्वर पर नहीं मिला।';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'रिमोट सबटाइटल $action विफल: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'रिमोट सबटाइटल $action विफल (HTTP $status)।';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'रिमोट सबटाइटल $action करने में विफल।';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" के सभी डाउनलोड किए गए एपिसोड';
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
    return '$label क्रिया विफल: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'कास्ट वॉल्यूम सेट नहीं हो सका: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label नियंत्रण';
  }

  @override
  String get deviceVolume => 'डिवाइस वॉल्यूम';

  @override
  String get unavailable => 'अनुपलब्ध';

  @override
  String get pause => 'पॉज़ करें';

  @override
  String get syncPosition => 'सिंक स्थिति';

  @override
  String stopCast(String label) {
    return '$label रोकें';
  }

  @override
  String get queueIsEmpty => 'कतार खाली है';

  @override
  String trackNumber(int number) {
    return 'ट्रैक $number';
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
    return '$seconds सेकंड';
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
  String get player => 'प्लेयर';

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
  String get track => 'ट्रैक';

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
    return '$protocol सत्र त्रुटि';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'किताब का विवरण लोड नहीं हो सका: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB रेंडरिंग इन-ऐप अभी इस प्लेटफ़ॉर्म पर उपलब्ध नहीं है।';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'यह फ़ॉर्मैट (.$extension) अभी ऐप में नहीं दिखाया जा सकता।';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'इस प्लेटफ़ॉर्म पर एंबेडेड दस्तावेज़ रेंडरिंग उपलब्ध नहीं है।';

  @override
  String get couldNotOpenExternalViewer => 'बाहरी व्यूअर नहीं खुल सका.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'इन-ऐप रीडर नहीं खुल सका: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label पर बुकमार्क पहले से सहेजा है।';
  }

  @override
  String bookmarkAdded(String label) {
    return 'बुकमार्क जोड़ा गया: $label';
  }

  @override
  String get noBookmarksYet =>
      'अभी तक कोई बुकमार्क नहीं.\nअपनी स्थिति बचाने के लिए पढ़ते समय बुकमार्क आइकन पर टैप करें।';

  @override
  String get noTableOfContentsAvailable =>
      'सामग्री की कोई तालिका उपलब्ध नहीं है';

  @override
  String pageLabel(int number) {
    return 'पेज $number';
  }

  @override
  String get position => 'पद';

  @override
  String get bookReader => 'पुस्तक पाठक';

  @override
  String formatExtension(String extension) {
    return 'फ़ॉर्मैट: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% पढ़ा';
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
    return 'ज़ूम रीसेट करें (${zoom}x)';
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
    return 'पढ़ने की स्थिति अपडेट नहीं हो सकी: $error';
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
    return 'यह प्लेटफ़ॉर्म $extension फ़ाइलों के लिए एम्बेडेड डॉक्यूमेंट इंजन नहीं चला सकता।';
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
  String get premiere => 'प्रीमियर';

  @override
  String get guideTimeline => 'गाइड टाइमलाइन';

  @override
  String failedToLoadGuide(String error) {
    return 'गाइड लोड नहीं हो सकी: $error';
  }

  @override
  String get noChannelsFound => 'कोई चैनल नहीं मिला';

  @override
  String get liveBadge => 'रहना';

  @override
  String guideNextProgram(String time, String title) {
    return 'अगला: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesमि बाकी';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursघं बाकी';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursघं $minutesमि बाकी';
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
  String get record => 'रिकॉर्ड करें';

  @override
  String get cancelRecordingAction => 'रिकॉर्डिंग रद्द करें';

  @override
  String get programSetToRecord => 'प्रोग्राम रिकॉर्ड करने के लिए सेट किया गया';

  @override
  String get recordingCancelled => 'रिकॉर्डिंग रद्द की गई';

  @override
  String get unableToCreateRecording => 'रिकॉर्डिंग नहीं बनाई जा सकी';

  @override
  String get watch => 'देखें';

  @override
  String get close => 'बंद करें';

  @override
  String failedToPlayChannel(String name) {
    return '$name चलाया नहीं जा सका';
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
    return '\"$name\" की निर्धारित रिकॉर्डिंग रद्द करें?';
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
    return '\"$name\" की रिकॉर्डिंग रोकें?';
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
    return '\"$query\" के लिए कोई नतीजा नहीं';
  }

  @override
  String searchFailedError(String error) {
    return 'खोज विफल: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr खाता प्रकार';

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
    return '\"$name\" और इसकी फ़ाइलें हटाएँ?';
  }

  @override
  String tracksCount(int count) {
    return '$count ट्रैक';
  }

  @override
  String get album => 'एल्बम';

  @override
  String get playAlbum => 'एल्बम चलायें';

  @override
  String failedToLoadAlbum(String error) {
    return 'एल्बम लोड नहीं हो सका: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name के लिए कोई डाउनलोड किया गया ट्रैक नहीं मिला।';
  }

  @override
  String get season => 'सीज़न';

  @override
  String get errorLoadingEpisodes => 'एपिसोड लोड करने में त्रुटि';

  @override
  String get noDownloadedEpisodes => 'कोई डाउनलोड किया गया एपिसोड नहीं';

  @override
  String get deleteEpisode => 'एपिसोड हटाएँ';

  @override
  String removeName(String name) {
    return '\"$name\" हटाएँ?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'एपिसोड $number';
  }

  @override
  String get seriesNotFound => 'श्रृंखला नहीं मिली';

  @override
  String get errorLoadingSeries => 'श्रृंखला लोड करने में त्रुटि';

  @override
  String get downloadedEpisodes => 'डाउनलोड किए गए एपिसोड';

  @override
  String seasonNumber(int number) {
    return 'सीज़न $number';
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
    return '$season के सभी डाउनलोड किए गए एपिसोड हटाएँ?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count एपिसोड',
      one: '1 एपिसोड',
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
    return '$count डाउनलोड किए गए आइटम हटाएँ?';
  }

  @override
  String get musicAndAudiobooks => 'संगीत और ऑडियोबुक';

  @override
  String get images => 'इमेजिस';

  @override
  String get database => 'डेटाबेस';

  @override
  String ofStorageLimit(String limit) {
    return '$limit की सीमा में से';
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
    return '$count विकल्प';
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
  String get themeMusicSettingsSubtitle => 'विवरण पेज, होम रो और वॉल्यूम';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'होम रो पर थीम संगीत';

  @override
  String get playWhenBrowsingHomeScreen => 'होम स्क्रीन ब्राउज़ करते समय चलाएं';

  @override
  String get loopThemeMusic => 'थीम संगीत लूप करें';

  @override
  String get loopThemeMusicSubtitle => 'ट्रैक को एक बार चलाने के बजाय दोहराएँ';

  @override
  String get detailsBackgroundBlur => 'विवरण पृष्ठभूमि धुंधला';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

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
  String get settingsScrollWheelAction => 'माउस स्क्रॉल व्हील';

  @override
  String get settingsScrollWheelActionDescription =>
      'चुनें कि प्लेबैक के दौरान वीडियो पर माउस व्हील स्क्रॉल करने से क्या हो।';

  @override
  String get scrollWheelActionOff => 'बंद';

  @override
  String get scrollWheelActionSeek => 'सीक (आगे / पीछे)';

  @override
  String get scrollWheelActionVolume => 'वॉल्यूम';

  @override
  String get playerTooltipVolume => 'वॉल्यूम';

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
  String get fallbackAudioLanguage => 'फ़ॉलबैक ऑडियो भाषा';

  @override
  String get preferDefaultAudioTrack =>
      'डिफ़ॉल्ट ऑडियो ट्रैक को प्राथमिकता दें';

  @override
  String get preferDefaultAudioTrackDescription =>
      'लोकलाइज़्ड डब के बजाय मूल ऑडियो ट्रैक को प्राथमिकता दें।';

  @override
  String get preferAudioDescription =>
      'ऑडियो डिस्क्रिप्शन ट्रैक को प्राथमिकता दें';

  @override
  String get preferAudioDescriptionDescription =>
      'सामान्य ट्रैक के बजाय ऑडियो डिस्क्रिप्शन ट्रैक को प्राथमिकता दें।';

  @override
  String get transcodingAudio => 'ट्रांसकोडिंग (ऑडियो)';

  @override
  String get directStreamRemux => 'डायरेक्ट स्ट्रीम (रीमक्स)';

  @override
  String get transcodingBitrateOrResolution =>
      'ट्रांसकोडिंग (बिटरेट या रिज़ॉल्यूशन)';

  @override
  String get transcodingVideoAndAudio => 'ट्रांसकोडिंग (वीडियो और ऑडियो)';

  @override
  String get transcodingVideo => 'ट्रांसकोडिंग (वीडियो)';

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
  String get trueHdSupport => 'TrueHD समर्थन';

  @override
  String get enableDtsPassthrough =>
      'बिटस्ट्रीम डीटीएस ऑडियो केवल एवीआर के लिए; रिसीवर समर्थन और डीटीएस स्रोत ट्रैक की आवश्यकता है';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ऑडियो चालू करें (सभी प्लेटफ़ॉर्म पर काम न करे)';

  @override
  String get settingsAudioOutputMode => 'ऑडियो आउटपुट मोड';

  @override
  String get settingsAudioOutputModeDescription =>
      'चुनें कि ऑडियो कैसे डिकोड हो। AVR पासथ्रू रॉ Dolby/DTS स्ट्रीम आपके रिसीवर को भेजता है; ऑटो या डाउनमिक्स लोकल रूप से डिकोड करता है।';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR पासथ्रू';

  @override
  String get settingsAudioFallbackCodec => 'ऑडियो फ़ॉलबैक कोडेक';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'जब सोर्स स्ट्रीम डायरेक्ट-प्ले या पासथ्रू न हो सके, तो मल्टी-चैनल ऑडियो को ट्रांसकोड करने का लक्ष्य फ़ॉर्मैट चुनें।';

  @override
  String get settingsAudioFallbackCodecAuto => 'ऑटो डिटेक्ट\n(अनुशंसित)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(डिफ़ॉल्ट)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(लॉसलेस)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(केवल स्टीरियो)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(कुशल)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(लॉसलेस)';

  @override
  String get settingsMaxAudioChannels => 'अधिकतम ऑडियो चैनल';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'अपने ऑडियो सेटअप के अधिकतम चैनल कॉन्फ़िगर करें। इस सीमा से ज़्यादा चैनल वाली स्ट्रीम डाउनमिक्स या ट्रांसकोड होंगी।';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ऑटो डिटेक्ट\n(हार्डवेयर डिफ़ॉल्ट)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 मोनो';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 स्टीरियो';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 सराउंड';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 क्वाड्राफ़ोनिक';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 सराउंड';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 सराउंड';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 सराउंड';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 सराउंड';

  @override
  String get settingsAudioPassthroughAdvanced => 'पासथ्रू (उन्नत)';

  @override
  String get settingsAudioCodecPassthrough => 'कोडेक पासथ्रू';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'केवल वही फ़ॉर्मैट चालू करें जो आपका AVR या HDMI सिंक सपोर्ट करता है।';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 पासथ्रू';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) पासथ्रू';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core पासथ्रू';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA पासथ्रू';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD पासथ्रू';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos पासथ्रू';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) को बाहरी डिकोडर पर बिटस्ट्रीम करें।';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Dolby Atmos को EAC3 (JOC) पर बाहरी डिकोडर तक बिटस्ट्रीम करें।';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS core सहित) को बाहरी डिकोडर पर बिटस्ट्रीम करें।';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos मेटाडेटा वाले Dolby TrueHD को बाहरी डिकोडर पर बिटस्ट्रीम करें।';

  @override
  String get settingsDetectedAudioCapabilities => 'पहचानी गई ऑडियो क्षमताएँ';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'अभी तक कोई रनटाइम क्षमता स्नैपशॉट उपलब्ध नहीं है।';

  @override
  String get settingsAudioRouteLabel => 'रूट';

  @override
  String get settingsAudioDecodeLabel => 'डिकोड';

  @override
  String get settingsAudioPassthroughLabel => 'पासथ्रू';

  @override
  String get settingsAudioHdRoute => 'HD ऑडियो रूट';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'स्पीकर';

  @override
  String get settingsAudioRouteHeadphones => 'हेडफ़ोन';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count चैनल PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'डायग्नोस्टिक्स';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'वीडियो लेवल';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'वीडियो रेंज';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'सबटाइटल कोडेक';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => 'अनुमत ऑडियो कोडेक';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ऑडियो कोडेक';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ऑडियो कोडेक';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif पासथ्रू';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'सक्रिय ऑडियो रूट';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'रूट HD ऑडियो सपोर्ट';

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
    return '$value सेकंड';
  }

  @override
  String get mediaQueuing => 'मीडिया कतार';

  @override
  String get autoQueueNextEpisodes => 'अगले एपिसोड स्वतः कतारबद्ध करें';

  @override
  String get stillWatchingPrompt => 'अभी भी प्रॉम्प्ट देख रहा हूँ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes एपिसोड / $hours घंटे के बाद';
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
  String get subtitleMode => 'सबटाइटल मोड';

  @override
  String get subtitleModeFlagged => 'फ़्लैग किए गए';

  @override
  String get subtitleModeAlways => 'हमेशा';

  @override
  String get subtitleModeForeign => 'विदेशी भाषा';

  @override
  String get subtitleModeForced => 'फ़ोर्स्ड';

  @override
  String get subtitleModeFlaggedDescription =>
      'मीडिया फ़ाइल के मेटाडेटा में \"default\" या \"forced\" के रूप में फ़्लैग किए गए ट्रैक चलाता है।';

  @override
  String get subtitleModeAlwaysDescription =>
      'हर बार वीडियो शुरू होने पर सबटाइटल अपने आप लोड करके दिखाता है।';

  @override
  String get subtitleModeForeignDescription =>
      'अगर डिफ़ॉल्ट ऑडियो ट्रैक किसी विदेशी भाषा में है, तो सबटाइटल अपने आप चालू कर देता है।';

  @override
  String get subtitleModeForcedDescription =>
      'सिर्फ़ वही सबटाइटल लोड करता है जिन पर स्पष्ट रूप से forced मेटाडेटा फ़्लैग लगा हो।';

  @override
  String get subtitleModeNoneDescription =>
      'सबटाइटल की स्वचालित लोडिंग पूरी तरह बंद कर देता है।';

  @override
  String get fallbackSubtitleLanguage => 'फ़ॉलबैक सबटाइटल भाषा';

  @override
  String get subtitleStream => 'सबटाइटल स्ट्रीम';

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
    return '$profile प्रोफ़ाइल सेटिंग्स लोड हो गईं।';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile प्रोफ़ाइल सेटिंग्स लोड नहीं हो सकीं।';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'स्थानीय सेटिंग्स $profile प्रोफ़ाइल से सिंक हो गईं।';
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
  String get reportDownloadsActivity => 'सर्वर पर डाउनलोड दिखाएँ';

  @override
  String get reportDownloadsActivitySubtitle =>
      'सर्वर एडमिन को डैशबोर्ड में आपके ट्रांसकोड किए गए डाउनलोड देखने दें';

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
  String get navbarAlwaysExpanded => 'नेवबार लेबल हमेशा दिखाएँ';

  @override
  String get showSeerrButton => 'Seerr बटन दिखाएँ';

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
  String get groupItemsIntoCollections => 'आइटम को कलेक्शन में समूहित करें';

  @override
  String get hideCollectionAssociatedItems =>
      'लाइब्रेरी ब्राउज़ करते समय कलेक्शन से जुड़े लाइब्रेरी आइटम छिपाएँ';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'लाइब्रेरी ग्रुपिंग सूचना';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'इस सेटिंग का उपयोग करने के लिए, कृपया सुनिश्चित करें कि आपके Jellyfin या Emby सर्वर पर आपकी लाइब्रेरी की Display सेटिंग्स में \"Group movies into collections\" और/या \"Group shows into collections\" लाइब्रेरी सेटिंग्स चालू हैं।';

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
    return '$count चुने गए';
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
  String get mediaBarModeMoonfin => 'Moonfin';

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
  String get trailerAudio => 'ट्रेलर ऑडियो';

  @override
  String get enableTrailerAudio =>
      'मीडिया बार में ट्रेलर के लिए ऑडियो चालू करें';

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
  String get fullScreenRows => 'विस्तृत होम पंक्तियाँ';

  @override
  String get fullScreenRowsDescription =>
      'प्रति स्क्रीन होम पंक्तियाँ 1 तक सीमित करें';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'प्रति पंक्ति छवि प्रकार';

  @override
  String get perRowSettings => 'प्रति-पंक्ति सेटिंग्स';

  @override
  String get autoLogin => 'स्व - लॉगिन';

  @override
  String get lastUser => 'अंतिम उपयोगकर्ता';

  @override
  String get currentUser => 'मौजूदा उपयोगकर्ता';

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
  String get mode => 'मोड';

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
    return '$minutes मिनट';
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
  String get clockModeStatic => 'स्थिर';

  @override
  String get clockModeBouncing => 'उछलती हुई';

  @override
  String get rottenTomatoesCritics => 'सड़े हुए टमाटर (आलोचक)';

  @override
  String get rottenTomatoesAudience => 'सड़े हुए टमाटर (दर्शक)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

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
  String get showMdbListAndTmdbRatings => 'MDBList और TMDB रेटिंग दिखाएँ';

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
  String get pluginLabel => 'Moonbase प्लगइन';

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
    return '$status\nसंस्करण: $version';
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
  String get seerrDiscoveryRows => 'Seerr डिस्कवरी पंक्तियाँ';

  @override
  String get resetRowsToDefaults => 'पंक्तियों को डिफ़ॉल्ट पर रीसेट करें';

  @override
  String get enableSeerr => 'Seerr चालू करें';

  @override
  String get showSeerrInNavigation =>
      'नेविगेशन में Seerr दिखाएँ (सर्वर प्लगइन ज़रूरी है)';

  @override
  String get seerrUnavailable =>
      'उपलब्ध नहीं, क्योंकि सर्वर प्लगइन में Seerr सपोर्ट बंद है।';

  @override
  String get nsfwFilter => 'एनएसएफडब्ल्यू फ़िल्टर';

  @override
  String get hideAdultContent => 'परिणामों में वयस्क सामग्री छिपाएँ';

  @override
  String get seerrNotificationsSection => 'सूचनाएँ';

  @override
  String get seerrNotifyNewRequestsTitle => 'नई अनुरोध सूचनाएँ';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'जब कोई अनुरोध भेजे तो मुझे बताएँ';

  @override
  String get seerrNotifyLibraryAddedTitle => 'अनुरोध अपडेट';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'स्वीकृत, अस्वीकृत, और आपकी लाइब्रेरी में जोड़े गए';

  @override
  String get seerrNotifyIssuesTitle => 'समस्या अपडेट';

  @override
  String get seerrNotifyIssuesSubtitle => 'नई समस्याएँ, जवाब, और समाधान';

  @override
  String loggedInAs(String username) {
    return 'इस रूप में लॉग इन: $username';
  }

  @override
  String get discoverRows => 'Seerr डिस्कवरी पेज';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr मुख्य पेज पर दिखाने के लिए पंक्तियाँ चालू करें। क्रम बदलने के लिए खींचें। कस्टम क्रम Moonbase के साथ सिंक होता है।';

  @override
  String get discoverRowsDescription =>
      'Seerr मुख्य पेज पर दिखाने के लिए पंक्तियाँ चालू करें। क्रम बदलने के लिए खींचें। कस्टम क्रम Moonbase के साथ सिंक होता है।';

  @override
  String get enabled => 'सक्षम';

  @override
  String get hidden => 'छिपा हुआ';

  @override
  String get aboutTitle => 'के बारे में';

  @override
  String versionValue(String version) {
    return 'संस्करण $version';
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
    return 'अपडेट उपलब्ध: v$version';
  }

  @override
  String get updateNotifications => 'अद्यतन सूचनाएं';

  @override
  String get showWhenUpdatesAvailable => 'अपडेट उपलब्ध होने पर दिखाएं';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version उपलब्ध है';
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
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, और रेटिंग स्रोत';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'इमेज कैश सीमा';

  @override
  String get clearImageCache => 'इमेज कैश साफ़ करें';

  @override
  String get imageCacheCleared => 'इमेज कैश साफ़ हो गया';

  @override
  String get clear => 'साफ़ करें';

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
    return 'डाउनलोड हो रहा है · $percent%';
  }

  @override
  String get seerrImportingStatus => 'इंपोर्ट हो रहा है';

  @override
  String itemsCount(int count) {
    return '$count आइटम';
  }

  @override
  String get seerrSettings => 'Seerr सेटिंग्स';

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
    return '$name द्वारा अनुरोधित';
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
    return '\"$title\" का अनुरोध रद्द करें?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" के $count अनुरोध रद्द करें?';
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
    return 'बजट: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'आय: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type का अनुरोध करें';
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
  String get appearances => 'भूमिकाएँ';

  @override
  String get crewSection => 'कर्मी दल';

  @override
  String ageValue(int age) {
    return 'उम्र $age';
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
  String get failedStatus => 'विफल';

  @override
  String get processingStatus => 'प्रोसेस हो रहा है';

  @override
  String modifiedByName(String name) {
    return '$name द्वारा संशोधित';
  }

  @override
  String get completedStatus => 'पूरा हुआ';

  @override
  String get requestErrorDuplicate =>
      'इस टाइटल का अनुरोध पहले ही किया जा चुका है';

  @override
  String get requestErrorQuota => 'अनुरोध की सीमा पूरी हो गई';

  @override
  String get requestErrorBlocklisted => 'यह टाइटल ब्लॉकलिस्ट में है';

  @override
  String get requestErrorNoSeasons =>
      'अनुरोध करने के लिए कोई सीज़न बाकी नहीं है';

  @override
  String get requestErrorPermission =>
      'आपके पास यह अनुरोध करने की अनुमति नहीं है';

  @override
  String get seerrRequestsTitle => 'अनुरोध';

  @override
  String get seerrIssuesTitle => 'समस्याएँ';

  @override
  String get sortNewest => 'सबसे नए';

  @override
  String get sortLastModified => 'अंतिम बार संशोधित';

  @override
  String get noIssues => 'कोई समस्या नहीं';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit में से $remaining फ़िल्म अनुरोध बाकी';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit में से $remaining सीज़न अनुरोध बाकी';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name का हिस्सा';
  }

  @override
  String get viewCollection => 'कलेक्शन देखें';

  @override
  String get requestCollection => 'कलेक्शन का अनुरोध करें';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total फ़िल्में · $available उपलब्ध';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count फ़िल्मों का अनुरोध करें';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total में से $current का अनुरोध हो रहा है...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count फ़िल्मों का अनुरोध किया गया';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total में से $ok फ़िल्मों का अनुरोध किया गया';
  }

  @override
  String get collectionAllRequested =>
      'सभी फ़िल्में पहले से उपलब्ध या अनुरोधित हैं';

  @override
  String get reportIssue => 'समस्या बताएँ';

  @override
  String get issueTypeVideo => 'वीडियो';

  @override
  String get issueTypeAudio => 'ऑडियो';

  @override
  String get whatsWrong => 'क्या समस्या है?';

  @override
  String get allEpisodes => 'सभी एपिसोड';

  @override
  String get episode => 'एपिसोड';

  @override
  String get openStatus => 'खुला';

  @override
  String get resolvedStatus => 'हल हो गई';

  @override
  String get resolveAction => 'हल करें';

  @override
  String get reopenAction => 'फिर से खोलें';

  @override
  String reportedByName(String name) {
    return '$name द्वारा रिपोर्ट की गई';
  }

  @override
  String commentsCount(int count) {
    return '$count टिप्पणियाँ';
  }

  @override
  String get addComment => 'टिप्पणी जोड़ें';

  @override
  String get deleteIssueConfirm => 'यह समस्या हटाएँ?';

  @override
  String get submitReport => 'रिपोर्ट भेजें';

  @override
  String get tmdbScore => 'TMDB स्कोर';

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
  String get seasonsLabel => 'सीज़न';

  @override
  String get episodesLabel => 'एपिसोड';

  @override
  String get access => 'पहुँच';

  @override
  String get add => 'जोड़ें';

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
  String get edit => 'संपादित करें';

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
  String get remote => 'रिमोट';

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
  String get search => 'खोजें';

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
  String get stop => 'रोकें';

  @override
  String get streaming => 'स्ट्रीमिंग';

  @override
  String get time => 'समय';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'म्यूट करें';

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
  String get adminDrawerLibraries => 'लाइब्रेरीज़';

  @override
  String get adminDrawerDisplay => 'डिस्प्ले';

  @override
  String get adminDrawerMetadata => 'मेटाडेटा';

  @override
  String get adminDrawerNfo => 'NFO सेटिंग्स';

  @override
  String get adminDrawerTranscoding => 'ट्रांसकोडिंग';

  @override
  String get adminDrawerResume => 'जारी रखें';

  @override
  String get adminDrawerStreaming => 'स्ट्रीमिंग';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'प्लगइन अपडेट उपलब्ध: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'पुनः आरंभ की ज़रूरत वाले प्लगइन: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'विफल शेड्यूल्ड कार्य: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'हाल की चेतावनी/त्रुटि प्रविष्टियाँ: $count';
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
    return 'त्रुटि: $error';
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
    return 'कमांड विफल: $error';
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
  String get volume => 'वॉल्यूम';

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
  String get adminActivitySeverityAll => 'सभी गंभीरता स्तर';

  @override
  String get adminActivityDateRange => 'तारीख़ की सीमा';

  @override
  String adminActivityLoadFailed(String error) {
    return 'गतिविधि लॉग लोड नहीं हो सका: $error';
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
    return 'डिवाइस अपडेट नहीं हो सका: $error';
  }

  @override
  String get adminDeleteDevice => 'डिवाइस हटाएँ';

  @override
  String get adminDeviceDeleted => 'डिवाइस हटा दिया गया';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'डिवाइस हटाया नहीं जा सका: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'डिवाइस \'$name\' हटाएँ? उपयोगकर्ता को इस डिवाइस पर फिर से साइन इन करना होगा।';
  }

  @override
  String get adminDeleteAllDevices => 'सभी डिवाइस हटाएँ';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count डिवाइस हटाएँ? प्रभावित उपयोगकर्ताओं को फिर से साइन इन करना होगा। आपका मौजूदा डिवाइस प्रभावित नहीं होगा।';
  }

  @override
  String get adminDevicesDeletedAll => 'डिवाइस हटा दिए गए';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'कुछ डिवाइस हटा दिए गए; $count नहीं हटाए जा सके।';
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
    return 'स्कैन शुरू नहीं हो सका: $error';
  }

  @override
  String get adminRenameLibrary => 'लाइब्रेरी का नाम बदलें';

  @override
  String get adminNewName => 'नया नाम';

  @override
  String adminLibraryRenamed(String name) {
    return 'लाइब्रेरी का नाम बदलकर \"$name\" किया गया';
  }

  @override
  String adminRenameFailed(String error) {
    return 'नाम नहीं बदला जा सका: $error';
  }

  @override
  String get adminDeleteLibrary => 'लाइब्रेरी हटाएँ';

  @override
  String adminLibraryDeleted(String name) {
    return 'लाइब्रेरी \"$name\" हटा दी गई';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'लाइब्रेरी हटाई नहीं जा सकी: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'पथ जोड़ा नहीं जा सका: $error';
  }

  @override
  String get adminRemovePath => 'पथ हटाएँ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'इस लाइब्रेरी से \"$path\" हटाएँ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'पथ हटाया नहीं जा सका: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'लाइब्रेरी विकल्प सहेजे गए';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'विकल्प सहेजे नहीं जा सके: $error';
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
  String get adminLibraryTabPaths => 'पथ';

  @override
  String get adminLibraryTabOptions => 'विकल्प';

  @override
  String get adminLibraryTabDownloaders => 'डाउनलोडर';

  @override
  String get adminLibMetadataSavers => 'मेटाडेटा सेवर';

  @override
  String get adminLibSubtitleDownloaders => 'सबटाइटल डाउनलोडर';

  @override
  String get adminLibLyricDownloaders => 'लिरिक्स डाउनलोडर';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'मेटाडेटा डाउनलोडर: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'इमेज फ़ेचर: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'यह सर्वर इस लाइब्रेरी प्रकार के लिए कोई डाउनलोडर उपलब्ध नहीं कराता।';

  @override
  String get adminLibrarySectionGeneral => 'सामान्य';

  @override
  String get adminLibrarySectionMetadata => 'मेटाडेटा';

  @override
  String get adminLibrarySectionEmbedded => 'एम्बेडेड जानकारी';

  @override
  String get adminLibrarySectionSubtitles => 'सबटाइटल';

  @override
  String get adminLibrarySectionImages => 'इमेज';

  @override
  String get adminLibrarySectionSeries => 'सीरीज़';

  @override
  String get adminLibrarySectionMusic => 'संगीत';

  @override
  String get adminLibrarySectionMovies => 'फ़िल्में';

  @override
  String get adminLibRealtimeMonitor => 'रीयल-टाइम मॉनिटरिंग चालू करें';

  @override
  String get adminLibRealtimeMonitorHint =>
      'फ़ाइल बदलावों का पता लगाकर उन्हें अपने आप प्रोसेस करें।';

  @override
  String get adminLibArchiveMediaFiles =>
      'आर्काइव को मीडिया फ़ाइलों की तरह मानें';

  @override
  String get adminLibEnablePhotos => 'फ़ोटो दिखाएँ';

  @override
  String get adminLibSaveLocalMetadata => 'आर्टवर्क मीडिया फ़ोल्डर में सहेजें';

  @override
  String get adminLibRefreshInterval => 'स्वचालित मेटाडेटा रीफ़्रेश';

  @override
  String get adminLibRefreshNever => 'कभी नहीं';

  @override
  String get adminLibDefault => 'डिफ़ॉल्ट';

  @override
  String get adminLibDisplayTitle => 'डिस्प्ले';

  @override
  String get adminLibDisplaySection => 'लाइब्रेरी डिस्प्ले';

  @override
  String get adminLibFolderView =>
      'सादे मीडिया फ़ोल्डर दिखाने के लिए फ़ोल्डर व्यू दिखाएँ';

  @override
  String get adminLibSpecialsInSeasons =>
      'स्पेशल एपिसोड उसी सीज़न में दिखाएँ जिसमें वे प्रसारित हुए थे';

  @override
  String get adminLibGroupMovies => 'फ़िल्मों को कलेक्शन में समूहित करें';

  @override
  String get adminLibGroupShows => 'शो को कलेक्शन में समूहित करें';

  @override
  String get adminLibExternalSuggestions => 'सुझावों में बाहरी सामग्री दिखाएँ';

  @override
  String get adminLibDateAddedSection => 'जोड़ने की तारीख़ का व्यवहार';

  @override
  String get adminLibDateAddedLabel => 'जोड़ने की तारीख़ यहाँ से लें';

  @override
  String get adminLibDateAddedImport => 'लाइब्रेरी में स्कैन होने की तारीख़';

  @override
  String get adminLibDateAddedFile => 'फ़ाइल बनने की तारीख़';

  @override
  String get adminLibMetadataTitle => 'मेटाडेटा और इमेज';

  @override
  String get adminLibMetadataLangSection => 'पसंदीदा मेटाडेटा भाषा';

  @override
  String get adminLibChaptersSection => 'चैप्टर';

  @override
  String get adminLibDummyChapterDuration => 'डमी चैप्टर अवधि (सेकंड)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'जिस मीडिया में चैप्टर नहीं हैं, उसके लिए बनाए गए चैप्टर की लंबाई। बंद करने के लिए 0 सेट करें।';

  @override
  String get adminLibChapterImageResolution => 'चैप्टर इमेज रिज़ॉल्यूशन';

  @override
  String get adminLibNfoTitle => 'NFO सेटिंग्स';

  @override
  String get adminLibNfoHelp =>
      'NFO मेटाडेटा Kodi और इस तरह के अन्य क्लाइंट के साथ काम करता है। ये सेटिंग्स उन सभी लाइब्रेरी पर लागू होती हैं जो NFO मेटाडेटा सहेजती हैं।';

  @override
  String get adminLibKodiUser =>
      'वह उपयोगकर्ता जिसका देखने का डेटा NFO फ़ाइलों में सहेजा जाए';

  @override
  String get adminLibSaveImagePaths => 'NFO फ़ाइलों में इमेज पथ सहेजें';

  @override
  String get adminLibPathSubstitution =>
      'NFO इमेज पथ के लिए पथ प्रतिस्थापन चालू करें';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart इमेज को extrathumbs फ़ोल्डर में कॉपी करें';

  @override
  String get adminLibNone => 'कोई नहीं';

  @override
  String adminLibRefreshDays(int days) {
    return '$days दिन';
  }

  @override
  String get adminLibEmbeddedTitles => 'एम्बेडेड टाइटल का उपयोग करें';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'एक्स्ट्रा के लिए एम्बेडेड टाइटल का उपयोग करें';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'एम्बेडेड एपिसोड जानकारी का उपयोग करें';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'एम्बेडेड सबटाइटल की अनुमति दें';

  @override
  String get adminLibEmbeddedAllowAll => 'सभी की अनुमति दें';

  @override
  String get adminLibEmbeddedAllowText => 'केवल टेक्स्ट';

  @override
  String get adminLibEmbeddedAllowImage => 'केवल इमेज';

  @override
  String get adminLibEmbeddedAllowNone => 'कोई नहीं';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'एम्बेडेड सबटाइटल मौजूद होने पर डाउनलोड छोड़ दें';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ऑडियो ट्रैक डाउनलोड भाषा से मेल खाने पर डाउनलोड छोड़ दें';

  @override
  String get adminLibRequirePerfectMatch =>
      'सबटाइटल का पूरी तरह मेल खाना ज़रूरी करें';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'सबटाइटल मीडिया फ़ोल्डर में सहेजें';

  @override
  String get adminLibChapterImageExtraction => 'चैप्टर इमेज निकालें';

  @override
  String get adminLibChapterImagesDuringScan =>
      'लाइब्रेरी स्कैन के दौरान चैप्टर इमेज निकालें';

  @override
  String get adminLibTrickplayExtraction => 'Trickplay इमेज निकालना चालू करें';

  @override
  String get adminLibTrickplayDuringScan =>
      'लाइब्रेरी स्कैन के दौरान Trickplay इमेज निकालें';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay इमेज मीडिया फ़ोल्डर में सहेजें';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'कई फ़ोल्डर में फैली सीरीज़ को अपने आप मर्ज करें';

  @override
  String get adminLibSeasonZeroName => 'सीज़न शून्य का प्रदर्शित नाम';

  @override
  String get adminLibLufsScan =>
      'ऑडियो नॉर्मलाइज़ेशन के लिए LUFS स्कैन चालू करें';

  @override
  String get adminLibPreferNonstandardArtist =>
      'गैर-मानक आर्टिस्ट टैग को प्राथमिकता दें';

  @override
  String get adminLibAutoAddToCollection =>
      'फ़िल्मों को अपने आप कलेक्शन में जोड़ें';

  @override
  String get adminLibraryNameRequired => 'लाइब्रेरी का नाम आवश्यक है';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'लाइब्रेरी बनाई नहीं जा सकी: $error';
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
    return '$name को बंद करें? वे साइन इन नहीं कर पाएँगे।';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name को चालू करें? वे फिर से साइन इन कर पाएँगे।';
  }

  @override
  String adminUserDisabled(String name) {
    return 'उपयोगकर्ता \"$name\" बंद कर दिया गया';
  }

  @override
  String adminUserEnabled(String name) {
    return 'उपयोगकर्ता \"$name\" चालू कर दिया गया';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'उपयोगकर्ता नीति अपडेट नहीं हो सकी: $error';
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
    return 'उपयोगकर्ता नहीं बनाया जा सका: $error';
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
    return 'सहेजा नहीं जा सका: $error';
  }

  @override
  String get adminPermissionsSaved => 'अनुमतियाँ सहेजी गईं';

  @override
  String get adminPasswordsMismatch => 'सांकेतिक शब्द मेल नहीं खाते';

  @override
  String adminFailed(String error) {
    return 'विफल: $error';
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
  String get adminParentalControl => 'अभिभावक नियंत्रण';

  @override
  String get adminMaxParentalRating => 'अधिकतम अनुमत आयु रेटिंग';

  @override
  String get adminMaxParentalRatingHint =>
      'इससे ऊँची रेटिंग वाला कॉन्टेंट इस उपयोगकर्ता से छिपा रहेगा।';

  @override
  String get adminParentalRatingNone => 'कोई नहीं';

  @override
  String get adminBlockUnratedItems =>
      'बिना रेटिंग या अपरिचित रेटिंग वाली आइटम ब्लॉक करें';

  @override
  String get adminUnratedBook => 'किताबें';

  @override
  String get adminUnratedChannelContent => 'चैनल';

  @override
  String get adminUnratedLiveTvChannel => 'लाइव TV';

  @override
  String get adminUnratedMovie => 'फ़िल्में';

  @override
  String get adminUnratedMusic => 'संगीत';

  @override
  String get adminUnratedTrailer => 'ट्रेलर';

  @override
  String get adminUnratedSeries => 'शोज़';

  @override
  String get adminAccessSchedules => 'एक्सेस शेड्यूल';

  @override
  String get adminAccessSchedulesHint =>
      'केवल नीचे दिए गए शेड्यूल के समय पर ही एक्सेस दें। कोई शेड्यूल न होने पर पूरे दिन एक्सेस मिलता है।';

  @override
  String get adminAddSchedule => 'शेड्यूल जोड़ें';

  @override
  String get adminScheduleDay => 'दिन';

  @override
  String get adminScheduleStart => 'शुरू';

  @override
  String get adminScheduleEnd => 'समाप्त';

  @override
  String get adminDayEveryday => 'हर दिन';

  @override
  String get adminDayWeekday => 'कार्यदिवस';

  @override
  String get adminDayWeekend => 'सप्ताहांत';

  @override
  String get adminDaySunday => 'रविवार';

  @override
  String get adminDayMonday => 'सोमवार';

  @override
  String get adminDayTuesday => 'मंगलवार';

  @override
  String get adminDayWednesday => 'बुधवार';

  @override
  String get adminDayThursday => 'गुरुवार';

  @override
  String get adminDayFriday => 'शुक्रवार';

  @override
  String get adminDaySaturday => 'शनिवार';

  @override
  String get adminAllowedTags => 'अनुमत टैग';

  @override
  String get adminAllowedTagsHint =>
      'केवल इन टैग वाला कॉन्टेंट दिखेगा। सब कुछ दिखाने के लिए खाली छोड़ें।';

  @override
  String get adminBlockedTags => 'ब्लॉक किए गए टैग';

  @override
  String get adminBlockedTagsHint =>
      'इन टैग वाला कॉन्टेंट इस उपयोगकर्ता से छिपा रहेगा।';

  @override
  String get adminAddTag => 'टैग जोड़ें';

  @override
  String get adminEnabledDevices => 'सक्षम डिवाइस';

  @override
  String get adminEnabledChannels => 'सक्षम चैनल';

  @override
  String get adminAuthProvider => 'प्रमाणीकरण प्रदाता';

  @override
  String get adminPasswordResetProvider => 'पासवर्ड रीसेट प्रदाता';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'लॉकआउट से पहले अधिकतम विफल लॉगिन प्रयास';

  @override
  String get adminLoginAttemptsHint =>
      'डिफ़ॉल्ट के लिए 0 सेट करें, या लॉकआउट बंद करने के लिए -1।';

  @override
  String get adminSyncPlayAccess => 'SyncPlay एक्सेस';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'ग्रुप बनाने और उनमें शामिल होने की अनुमति दें';

  @override
  String get adminSyncPlayJoin => 'ग्रुप में शामिल होने की अनुमति दें';

  @override
  String get adminSyncPlayNone => 'कोई एक्सेस नहीं';

  @override
  String get adminContentDeletionFolders =>
      'यहाँ से कॉन्टेंट हटाने की अनुमति दें';

  @override
  String get adminResetPasswordWarning =>
      'इससे पासवर्ड हट जाएगा. यूजर बिना पासवर्ड के लॉग इन कर सकेगा।';

  @override
  String adminServerReturnedHttp(int status) {
    return 'सर्वर ने HTTP $status लौटाया';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'उपयोगकर्ता \"$name\" हटा दिया गया';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'उपयोगकर्ता हटाया नहीं जा सका: $error';
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
    return 'की नहीं बनाई जा सकी: $error';
  }

  @override
  String get adminKeyTokenMissing => 'सर्वर प्रतिक्रिया से कुंजी टोकन गायब है';

  @override
  String get adminRevokeApiKey => 'एपीआई कुंजी निरस्त करें';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name की की रद्द करें?';
  }

  @override
  String get adminApiKeyRevoked => 'एपीआई कुंजी निरस्त कर दी गई';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'की रद्द नहीं की जा सकी: $error';
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
    return 'टोकन: $token\\nबनाया गया: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'बैकअप बनाएँ';

  @override
  String get adminBackupInclude => 'चुनें कि बैकअप में क्या शामिल करना है।';

  @override
  String get adminBackupDatabase => 'डेटाबेस';

  @override
  String get adminBackupDatabaseAlways => 'हमेशा शामिल';

  @override
  String get adminBackupMetadata => 'मेटाडेटा';

  @override
  String get adminBackupSubtitles => 'सबटाइटल';

  @override
  String get adminBackupTrickplay => 'Trickplay इमेज';

  @override
  String get adminCreatingBackup => 'बैकअप बनाया जा रहा है...';

  @override
  String get adminBackupCreated => 'बैकअप सफलतापूर्वक बनाया गया';

  @override
  String adminBackupCreateFailed(String error) {
    return 'बैकअप नहीं बनाया जा सका: $error';
  }

  @override
  String get adminBackupPathMissing => 'सर्वर प्रतिक्रिया में बैकअप पथ गायब है';

  @override
  String adminBackupManifest(String name) {
    return 'मैनिफ़ेस्ट: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'मैनिफ़ेस्ट लोड नहीं हो सका: $error';
  }

  @override
  String get adminConfirmRestore => 'पुनर्स्थापना की पुष्टि करें';

  @override
  String get adminRestoringBackup => 'बैकअप बहाल किया जा रहा है...';

  @override
  String adminRestoreFailed(String error) {
    return 'बैकअप रीस्टोर नहीं हो सका: $error';
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
    return '$path में सहेजा गया';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'फ़ाइल सहेजी नहीं जा सकी: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName लोड नहीं हो सकी';
  }

  @override
  String get adminSearchInLog => 'लॉग में खोजें';

  @override
  String get adminNoMatchingLines => 'कोई मेल खाती पंक्तियाँ नहीं';

  @override
  String adminTasksLoadFailed(String error) {
    return 'टास्क लोड नहीं हो सके: $error';
  }

  @override
  String get adminNoScheduledTasks => 'कोई निर्धारित कार्य नहीं मिला';

  @override
  String get adminNoTasksMatchFilter =>
      'कोई भी कार्य वर्तमान फ़िल्टर से मेल नहीं खाता';

  @override
  String adminTaskStartFailed(String error) {
    return 'टास्क शुरू नहीं हो सका: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'टास्क रोका नहीं जा सका: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'टास्क लोड नहीं हो सका: $error';
  }

  @override
  String get adminRunNow => 'अब दौड़े';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ट्रिगर हटाया नहीं जा सका: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ट्रिगर जोड़ा नहीं जा सका: $error';
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
    return '$hours घंटे';
  }

  @override
  String get adminDayOfWeek => 'सप्ताह का दिन';

  @override
  String get adminSearchPlugins => 'प्लगइन्स खोजें...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'प्लगइन चालू/बंद नहीं हो सका: $error';
  }

  @override
  String get adminUninstallPlugin => 'प्लगइन अनइंस्टॉल करें';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'क्या आप वाकई \"$name\" अनइंस्टॉल करना चाहते हैं?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'प्लगइन अनइंस्टॉल नहीं हो सका: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'पैकेज इंस्टॉल नहीं हो सका: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'अपडेट इंस्टॉल नहीं हो सका: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'प्लगइन लोड नहीं हो सके: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'कोई भी प्लगइन आपकी खोज से मेल नहीं खाता';

  @override
  String get adminNoPluginsInstalled => 'कोई प्लगइन्स स्थापित नहीं है';

  @override
  String adminInstallUpdate(String version) {
    return 'अपडेट इंस्टॉल करें (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'कैटलॉग लोड नहीं हो सका: $error';
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
    return 'सर्वर रीस्टार्ट होने के बाद \"$name\" हटा दिया जाएगा';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'अनइंस्टॉल नहीं हो सका: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" को v$version पर अपडेट किया जा रहा है...';
  }

  @override
  String get adminMissingAuthToken =>
      'सेटिंग्स खोलने में असमर्थ: प्रमाणीकरण टोकन गायब है।';

  @override
  String adminPluginLoadFailed(String error) {
    return 'प्लगइन लोड नहीं हो सका: $error';
  }

  @override
  String get adminPluginNotFound => 'प्लगइन नहीं मिला';

  @override
  String adminPluginVersion(String version) {
    return 'वर्शन $version';
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
    return 'क्या आप वाकई \"$name\" हटाना चाहते हैं?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'रिपॉज़िटरी सहेजी नहीं जा सकीं: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'रिपॉज़िटरी लोड नहीं हो सकीं: $error';
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
    return 'प्लगइन सेटिंग्स लोड नहीं हो सकीं: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri नहीं खोला जा सका';
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
  String get adminTrickplaySaved => 'Trickplay सेटिंग्स सहेजी गईं';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay सेटिंग्स लोड नहीं हो सकीं';

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
  String get adminBaseUrlHint => 'उदा. /jellyfin';

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
    return 'मेटाडेटा लोड नहीं हो सका: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'मेटाडेटा सहेजा नहीं जा सका: $error';
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
    return 'मेटाडेटा रीफ़्रेश नहीं हो सका: $error';
  }

  @override
  String get adminNoRemoteMatches => 'कोई दूरस्थ मिलान नहीं मिला';

  @override
  String get adminRemoteResults => 'दूरस्थ परिणाम';

  @override
  String get adminRemoteMetadataApplied => 'दूरस्थ मेटाडेटा लागू किया गया';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'रिमोट खोज विफल रही: $error';
  }

  @override
  String get adminUpdateContentType => 'सामग्री प्रकार अद्यतन करें';

  @override
  String get adminContentType => 'सामग्री प्रकार';

  @override
  String get adminContentTypeUpdated => 'सामग्री प्रकार अद्यतन किया गया';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'कॉन्टेंट टाइप अपडेट नहीं हो सका: $error';
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
    return '$imageType इमेज अपडेट हो गई';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'इमेज डाउनलोड नहीं हो सकी: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'असमर्थित छवि प्रारूप';

  @override
  String get adminImageReadFailed => 'चयनित छवि पढ़ने में विफल';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType इमेज अपलोड हो गई';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'इमेज अपलोड नहीं हो सकी: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType इमेज हटाएँ';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType इमेज हटा दी गई';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'इमेज हटाई नहीं जा सकी: $error';
  }

  @override
  String get adminAllProviders => 'सभी प्रदाता';

  @override
  String get adminNoRemoteImages => 'कोई दूरस्थ चित्र नहीं मिला';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ट्यूनर खोज विफल रही: $error';
  }

  @override
  String get adminAddTuner => 'ट्यूनर जोड़ें';

  @override
  String get adminEditTuner => 'ट्यूनर संपादित करें';

  @override
  String get adminTunerTypeM3u => 'M3U ट्यूनर';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'फ़ाइल या URL';

  @override
  String get adminTunerIpAddress => 'ट्यूनर का IP पता';

  @override
  String get adminTunerFriendlyName => 'फ़्रेंडली नाम';

  @override
  String get adminTunerUserAgent => 'यूज़र एजेंट';

  @override
  String get adminTunerCount => 'एक साथ कनेक्शन की सीमा';

  @override
  String get adminTunerCountHelp =>
      'ट्यूनर एक साथ जितनी अधिकतम स्ट्रीम की अनुमति देता है। असीमित के लिए 0 सेट करें।';

  @override
  String get adminTunerFallbackBitrate => 'फ़ॉलबैक अधिकतम स्ट्रीमिंग बिटरेट';

  @override
  String get adminTunerImportFavoritesOnly => 'केवल पसंदीदा चैनल इंपोर्ट करें';

  @override
  String get adminTunerAllowHwTranscoding =>
      'हार्डवेयर ट्रांसकोडिंग की अनुमति दें';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 ट्रांसकोडिंग कंटेनर की अनुमति दें';

  @override
  String get adminTunerAllowStreamSharing => 'स्ट्रीम शेयरिंग की अनुमति दें';

  @override
  String get adminTunerEnableStreamLooping => 'स्ट्रीम लूपिंग चालू करें';

  @override
  String get adminTunerIgnoreDts => 'DTS अनदेखा करें';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'इनपुट को नेटिव फ़्रेम रेट पर पढ़ें';

  @override
  String get adminEditProvider => 'प्रदाता संपादित करें';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'फ़ाइल या URL';

  @override
  String get adminXmltvMoviePrefix => 'फ़िल्म प्रीफ़िक्स';

  @override
  String get adminXmltvMovieCategories => 'फ़िल्म श्रेणियाँ';

  @override
  String get adminXmltvCategoriesHelp =>
      'एक से ज़्यादा श्रेणियों को वर्टिकल बार से अलग करें।';

  @override
  String get adminXmltvKidsCategories => 'बच्चों की श्रेणियाँ';

  @override
  String get adminXmltvNewsCategories => 'समाचार श्रेणियाँ';

  @override
  String get adminXmltvSportsCategories => 'खेल श्रेणियाँ';

  @override
  String get adminSdUsername => 'उपयोगकर्ता नाम';

  @override
  String get adminSdPassword => 'पासवर्ड';

  @override
  String get adminSdCountry => 'देश';

  @override
  String get adminSdCountrySelect => 'देश चुनें';

  @override
  String get adminSdPostalCode => 'पिन कोड';

  @override
  String get adminSdGetListings => 'लिस्टिंग पाएँ';

  @override
  String get adminSdListings => 'लिस्टिंग';

  @override
  String get adminEnableAllTuners => 'सभी ट्यूनर चालू करें';

  @override
  String get adminTunerType => 'ट्यूनर प्रकार';

  @override
  String get adminTunerAdded => 'ट्यूनर जोड़ा गया';

  @override
  String adminTunerAddFailed(String error) {
    return 'ट्यूनर जोड़ा नहीं जा सका: $error';
  }

  @override
  String get adminAddGuideProvider => 'गाइड प्रदाता जोड़ें';

  @override
  String get adminProviderType => 'प्रदाता प्रकार';

  @override
  String get adminProviderAdded => 'प्रदाता जोड़ा गया';

  @override
  String adminProviderAddFailed(String error) {
    return 'प्रदाता जोड़ा नहीं जा सका: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ट्यूनर हटाया नहीं जा सका: $error';
  }

  @override
  String get adminTunerResetRequested => 'ट्यूनर रीसेट का अनुरोध किया गया';

  @override
  String adminTunerResetFailed(String error) {
    return 'ट्यूनर रीसेट नहीं हो सका: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'यह ट्यूनर टाइप रीसेट करना सपोर्ट नहीं करता।';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'प्रदाता हटाया नहीं जा सका: $error';
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
  String get adminMovieRecordingPath => 'फ़िल्म रिकॉर्डिंग पथ';

  @override
  String get adminGuideDays => 'गाइड डेटा के दिन';

  @override
  String get adminGuideDaysAuto => 'स्वचालित';

  @override
  String adminGuideDaysValue(int days) {
    return '$days दिन';
  }

  @override
  String get adminRecordingPostProcessor => 'पोस्ट-प्रोसेसिंग एप्लिकेशन का पथ';

  @override
  String get adminRecordingPostProcessorArgs => 'पोस्ट-प्रोसेसर आर्ग्युमेंट';

  @override
  String get adminSaveRecordingNfo => 'रिकॉर्डिंग का NFO मेटाडेटा सहेजें';

  @override
  String get adminSaveRecordingImages => 'रिकॉर्डिंग की इमेज सहेजें';

  @override
  String get adminLiveTvSectionTiming => 'टाइमिंग';

  @override
  String get adminLiveTvSectionPaths => 'रिकॉर्डिंग पथ';

  @override
  String get adminLiveTvSectionPostProcessing => 'पोस्ट-प्रोसेसिंग';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'गाइड डेटा: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'रिकॉर्डिंग सेटिंग सहेजी गईं';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'सेटिंग्स सहेजी नहीं जा सकीं: $error';
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
    return 'मैपिंग अपडेट नहीं हो सकीं: $error';
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
  String get adminRefreshGuideData => 'गाइड डेटा रीफ़्रेश करें';

  @override
  String get adminGuideRefreshStarted => 'गाइड डेटा रीफ़्रेश शुरू हुआ';

  @override
  String get adminGuideRefreshUnavailable =>
      'इस सर्वर पर गाइड रीफ़्रेश टास्क उपलब्ध नहीं है।';

  @override
  String get adminAddProvider => 'प्रदाता जोड़ें';

  @override
  String get adminNoListingProviders =>
      'कोई लिस्टिंग प्रदाता कॉन्फ़िगर नहीं किया गया';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'रिकॉर्डिंग पथ: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'सीरीज़ पथ: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'प्री-पैडिंग: $minutes मिनट';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'पोस्ट-पैडिंग: $minutes मिनट';
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
    return 'बैकअप $name अभी रीस्टोर करें?';
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
  String get adminApply => 'लागू करें';

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
    return '$minutes मि पहले';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours घं पहले';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days दि पहले';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName लोड नहीं हो सकी';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count मैच';
  }

  @override
  String get adminLogViewerNoMatches => 'कोई मेल खाती पंक्तियाँ नहीं';

  @override
  String get adminMetadataEditorTitle => 'मेटाडेटा संपादक';

  @override
  String get adminMetadataIdentify => 'पहचानें';

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
    return '$imageType इमेज अपडेट हो गई';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType इमेज अपलोड हो गई';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType इमेज हटा दी गई';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'इमेज डाउनलोड नहीं हो सकी: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'चयनित छवि पढ़ने में विफल';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'इमेज अपलोड नहीं हो सकी: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType इमेज हटाएँ';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'यह आइटम से वर्तमान छवि को हटा देता है।';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'इमेज हटाई नहीं जा सकी: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType इमेज चुनें';
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
    return 'अपडेट उपलब्ध है: v$version';
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
    return 'अपडेट इंस्टॉल करें (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'कोई भी पैकेज आपकी खोज से मेल नहीं खाता';

  @override
  String get adminPluginsCatalogEmpty => 'कोई पैकेज उपलब्ध नहीं है';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" इंस्टॉल हो रहा है...';
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
    return '$name सेटिंग्स';
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
    return 'रिपॉज़िटरी लोड नहीं हो सकीं: $error';
  }

  @override
  String get adminReposRemoveTitle => 'रिपोजिटरी हटाएँ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'क्या आप वाकई \"$name\" हटाना चाहते हैं?';
  }

  @override
  String get adminReposRemove => 'हटाएँ';

  @override
  String adminReposSaveFailed(String error) {
    return 'रिपॉज़िटरी सहेजी नहीं जा सकीं: $error';
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
  String get adminBrandingSplashUpload => 'इमेज अपलोड करें';

  @override
  String get adminBrandingSplashUploaded => 'स्प्लैशस्क्रीन अपडेट हो गई';

  @override
  String get adminBrandingSplashUploadFailed =>
      'स्प्लैशस्क्रीन अपलोड नहीं हो सकी';

  @override
  String get adminBrandingSplashDeleted => 'स्प्लैशस्क्रीन हटा दी गई';

  @override
  String get adminBrandingNoSplash => 'कोई कस्टम स्प्लैशस्क्रीन नहीं';

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
  String get adminPlaybackQsvDevice => 'QSV डिवाइस';

  @override
  String get adminPlaybackEnhancedNvdec => 'एन्हांस्ड NVDEC डिकोडर चालू करें';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'सिस्टम के नेटिव हार्डवेयर डिकोडर को प्राथमिकता दें';

  @override
  String get adminPlaybackColorDepth => 'हार्डवेयर डिकोडिंग कलर डेप्थ';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-बिट HEVC डिकोडिंग';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-बिट VP9 डिकोडिंग';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-बिट डिकोडिंग';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-बिट डिकोडिंग';

  @override
  String get adminPlaybackHwEncodingSection => 'हार्डवेयर एन्कोडिंग';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC एन्कोडिंग की अनुमति दें';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 एन्कोडिंग की अनुमति दें';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel लो-पावर H.264 एन्कोडर चालू करें';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel लो-पावर HEVC एन्कोडर चालू करें';

  @override
  String get adminPlaybackToneMapping => 'टोन मैपिंग';

  @override
  String get adminPlaybackEnableTonemapping => 'टोन मैपिंग चालू करें';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP टोन मैपिंग चालू करें';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox टोन मैपिंग चालू करें';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'टोन मैपिंग एल्गोरिदम';

  @override
  String get adminPlaybackTonemappingMode => 'टोन मैपिंग मोड';

  @override
  String get adminPlaybackTonemappingRange => 'टोन मैपिंग रेंज';

  @override
  String get adminPlaybackTonemappingDesat => 'टोन मैपिंग डीसैचुरेशन';

  @override
  String get adminPlaybackTonemappingPeak => 'टोन मैपिंग पीक';

  @override
  String get adminPlaybackTonemappingParam => 'टोन मैपिंग पैरामीटर';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP टोन मैपिंग ब्राइटनेस';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP टोन मैपिंग कंट्रास्ट';

  @override
  String get adminPlaybackPresetsQuality => 'प्रीसेट और क्वालिटी';

  @override
  String get adminPlaybackEncoderPreset => 'एन्कोडर प्रीसेट';

  @override
  String get adminPlaybackH264Crf => 'H.264 एन्कोडिंग CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) एन्कोडिंग CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'डीइंटरलेस विधि';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'डीइंटरलेस करते समय फ़्रेम रेट दोगुना करें';

  @override
  String get adminPlaybackAudioSection => 'ऑडियो';

  @override
  String get adminPlaybackEnableAudioVbr => 'ऑडियो VBR एन्कोडिंग चालू करें';

  @override
  String get adminPlaybackDownmixBoost => 'ऑडियो डाउनमिक्स बूस्ट';

  @override
  String get adminPlaybackDownmixAlgorithm => 'स्टीरियो डाउनमिक्स एल्गोरिदम';

  @override
  String get adminPlaybackMaxMuxingQueue => 'अधिकतम मक्सिंग क्यू साइज़';

  @override
  String get adminPlaybackAutoOption => 'ऑटो';

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
  String get adminTaskStop => 'रोकें';

  @override
  String get adminRunningTasks => 'चल रहे टास्क';

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
    return 'रोज़ $time पर';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'हर $day को $time पर';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'हर $duration';
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
      other: '$count घंटे',
      one: '1 घंटा',
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
    return '$days दि पहले';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours घं पहले';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes मि पहले';
  }

  @override
  String get adminActivityNow => 'अब';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes मि';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours घं';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days दि';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'सीक प्रीव्यू थंबनेल के लिए trickplay इमेज जनरेशन कॉन्फ़िगर करें।';

  @override
  String get adminNetworkingPublicHttpsPort => 'सार्वजनिक HTTPS पोर्ट';

  @override
  String get adminNetworkingBaseUrl => 'आधार यूआरएल';

  @override
  String get adminNetworkingBaseUrlHint => 'जैसे /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS के';

  @override
  String get adminNetworkingPublicHttpPort => 'सार्वजनिक HTTP पोर्ट';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS अनिवार्य करें';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'सभी रिमोट अनुरोधों को HTTPS पर रीडायरेक्ट करें। यदि सर्वर पर वैध प्रमाणपत्र नहीं है तो इसका कोई असर नहीं होगा।';

  @override
  String get adminNetworkingCertPassword => 'प्रमाणपत्र पासवर्ड';

  @override
  String get adminNetworkingIpSettings => 'IP सेटिंग्स';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 चालू करें';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 चालू करें';

  @override
  String get adminNetworkingAutoDiscovery => 'स्वचालित पोर्ट मैपिंग चालू करें';

  @override
  String get adminNetworkingLocalSubnets => 'LAN नेटवर्क';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'IP पतों या CIDR सबनेट की कॉमा या लाइन से अलग की गई सूची, जिन्हें लोकल नेटवर्क का माना जाएगा।';

  @override
  String get adminNetworkingPublishedUris => 'प्रकाशित सर्वर URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'किसी सबनेट या पते को प्रकाशित URL से मैप करें, जैसे all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'थ्रॉटल देरी (सेकंड)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'चलते समय सबटाइटल निकालने की अनुमति दें';

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
    return 'कंटेंट टाइप अपडेट नहीं हो सका: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'धीमी प्रतिक्रिया सीमा (एमएस)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'धीमी प्रतिक्रिया की चेतावनियाँ चालू करें';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect चालू करें';

  @override
  String get adminGeneralSectionServer => 'सर्वर';

  @override
  String get adminGeneralSectionMetadata => 'मेटाडेटा';

  @override
  String get adminGeneralSectionPaths => 'पाथ';

  @override
  String get adminGeneralSectionPerformance => 'प्रदर्शन';

  @override
  String get adminGeneralCachePath => 'कैश पथ';

  @override
  String get adminGeneralMetadataPath => 'मेटाडेटा पथ';

  @override
  String get adminGeneralServerName => 'सर्वर का नाम';

  @override
  String get adminGeneralDisplayLanguage => 'पसंदीदा डिस्प्ले भाषा';

  @override
  String get adminSettingsLoadFailed => 'सेटिंग्स लोड करने में विफल';

  @override
  String get adminDiscover => 'खोज करना';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'मैपिंग अपडेट नहीं हो सकी: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'समय सीमा: $duration';
  }

  @override
  String get folders => 'फ़ोल्डर';

  @override
  String get libraries => 'लाइब्रेरीज़';

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
      other: '# प्रतिभागी',
      one: '# प्रतिभागी',
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
    return 'आइटम $index';
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
    return '$userName SyncPlay ग्रुप में शामिल हुए';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ने SyncPlay ग्रुप छोड़ा';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay पहुंच अस्वीकृत';

  @override
  String get syncPlayAccessDeniedMessage =>
      'आपके पास इस SyncPlay समूह में एक या अधिक आइटम तक पहुंच नहीं है। समूह स्वामी से लाइब्रेरी अनुमतियों को सत्यापित करने या एक अलग कतार चुनने के लिए कहें।';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName के साथ प्लेबैक सिंक हो रहा है';
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
      other: '# पंक्तियाँ मिलीं',
      one: '# पंक्ति मिली',
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
  String get offlineBannerTitle => 'आप ऑफ़लाइन हैं';

  @override
  String get offlineBannerSubtitle => 'आपके डाउनलोड दिखाए जा रहे हैं';

  @override
  String get offlineBannerAction => 'डाउनलोड';

  @override
  String get serverUnreachableBannerTitle => 'आपके सर्वर तक नहीं पहुँच पा रहे';

  @override
  String get serverUnreachableBannerSubtitle =>
      'वापस आने तक डाउनलोड से चलाया जा रहा है';

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
    return 'कास्ट नियंत्रण विफल: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind नियंत्रण';
  }

  @override
  String get castDeviceVolume => 'डिवाइस वॉल्यूम';

  @override
  String get castVolumeUnavailable => 'अनुपलब्ध';

  @override
  String castStopKind(String kind) {
    return '$kind रोकें';
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
    return '$length अंकों का PIN डालें';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'अपना $length अंकों का PIN डालें';
  }

  @override
  String get pinIncorrect => 'ग़लत पिन';

  @override
  String get pinMismatch => 'पिन मेल नहीं खाते';

  @override
  String get pinForgot => 'पिन भूल गए?';

  @override
  String get pinClear => 'साफ़ करें';

  @override
  String get pinBackspace => 'बैकस्पेस';

  @override
  String get quickConnectAuthorized => 'Quick Connect अनुरोध अधिकृत हो गया।';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect कोड अमान्य है या उसकी अवधि समाप्त हो चुकी है।';

  @override
  String get quickConnectNotSupported =>
      'इस सर्वर पर Quick Connect समर्थित नहीं है।';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect कोड अधिकृत नहीं हो सका।';

  @override
  String get quickConnectDisabled => 'इस सर्वर पर Quick Connect बंद है।';

  @override
  String get quickConnectForbidden =>
      'आपका खाता इस Quick Connect अनुरोध को अधिकृत नहीं कर सकता।';

  @override
  String get quickConnectNotFound =>
      'Quick Connect कोड नहीं मिला। नया कोड आज़माएँ।';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect विफल: $message';
  }

  @override
  String get quickConnectEnterCode => 'कोड दर्ज करें';

  @override
  String get quickConnectAuthorize => 'अधिकृत';

  @override
  String remoteCommandFailed(String error) {
    return 'कमांड विफल: $error';
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
    return 'कास्ट शुरू नहीं हो सका: $error';
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
    return '$name डाउनलोड हो रहा है...';
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
  String get shuffleLibrary => 'लाइब्रेरी';

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
  String get stillWatchingStop => 'रोकें';

  @override
  String get stillWatchingContinue => 'जारी रखना';

  @override
  String skipSegment(String segment) {
    return '$segment स्किप करें';
  }

  @override
  String get liveTv => 'लाइव टीवी';

  @override
  String get continueWatchingAndNextUp => 'देखना जारी रखें और आगे बढ़ें';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total डाउनलोड हो रहा है — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName डाउनलोड हो रहा है';
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
  String get playerTooltipPrevious => 'पिछला';

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
      'Continue Watching से छिपाएँ';

  @override
  String get contextMenuHideFromNextUp => 'Next Up से छिपाएँ';

  @override
  String get contextMenuAddToCollection => 'कलेक्शन में जोड़ें';

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
      'प्लगइन सिंक, Seerr, रेटिंग और बहुत कुछ';

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
  String get settingsConnectionSection => 'कनेक्शन';

  @override
  String get settingsAllowSelfSignedCerts =>
      'सेल्फ़-साइन्ड प्रमाणपत्रों की अनुमति दें';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'सेल्फ़-साइन्ड या निजी-CA TLS प्रमाणपत्र वाले सर्वरों पर भरोसा करें। इसे केवल अपने नियंत्रण वाले सर्वरों के लिए चालू करें। इससे सभी कनेक्शनों के लिए प्रमाणपत्र सत्यापन बंद हो जाता है।';

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
  String get settingsDetailsScreen => 'विवरण स्क्रीन';

  @override
  String get settingsDetailsScreenSubtitle =>
      'स्टाइल, बैकग्राउंड ब्लर और टैब व्यवहार';

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
  String get settingsShowSeerrButtonInNavigation =>
      'नेविगेशन बार में Seerr बटन दिखाएँ';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ऊपरी नेविगेशन बार में टेक्स्ट लेबल हमेशा दिखाएँ';

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
      'Moonbase सर्वर-साइड इंटीग्रेशन को सक्षम बनाता है, जिनमें अतिरिक्त रेटिंग स्रोत, Seerr अनुरोध और सिंक की गई प्राथमिकताएँ शामिल हैं।';

  @override
  String get settingsOfflineDownloads => 'ऑफ़लाइन डाउनलोड';

  @override
  String get useNativeEmulator => 'Native Emulation';

  @override
  String get useNativeEmulatorSubtitle =>
      'Play games with native cores instead of the EmulatorJS web player';

  @override
  String get emulatorCores => 'Emulator Cores';

  @override
  String get emulatorCoresSubtitle => 'Download systems to play games natively';

  @override
  String get emulatorCoresDescription =>
      'Choose which systems to install. Cores are provided by the libretro project and let games run natively instead of in a browser view.';

  @override
  String get emulatorCoreDownloading => 'Downloading';

  @override
  String get emulatorCoreUnavailable => 'Not available for this device';

  @override
  String get emulatorCoreDownloadFailed =>
      'Could not download the core. Check your connection and try again.';

  @override
  String get downloadedGames => 'Downloaded Games';

  @override
  String get downloadedGamesSubtitle => 'Free up space used by game files';

  @override
  String get downloadedGamesDescription =>
      'Games are copied to this device before they play. Remove the ones you have finished to free up space. Saves are kept on the server and are not deleted.';

  @override
  String get downloadedGamesEmpty =>
      'No games have been downloaded to this device yet.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count games, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Remove All';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Remove $title from this device? It will download again the next time you play it.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Remove all downloaded games from this device? They will download again the next time you play them.';

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
  String get settingsSupportMoonfinSubtitle => 'डेवलपर को एक कॉफ़ी दान करें';

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
      other: '# लाइसेंस सूचनाएँ',
      one: '# लाइसेंस सूचना',
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
  String get settingsMediaSegmentCountdown => 'मीडिया सेगमेंट काउंटडाउन';

  @override
  String get settingsProgressBar => 'प्रोग्रेस बार';

  @override
  String get settingsTimer => 'टाइमर';

  @override
  String get settingsNone => 'कोई नहीं';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (लेगेसी)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (विरासत)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (अनुशंसित)';

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
    return 'हाल ही में रिलीज़ हुए $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'अगला एपिसोड अपने आप चलाएँ';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'उपलब्ध होने पर अगला एपिसोड अपने आप चलाएँ।';

  @override
  String get skipSilenceTitle => 'ख़ामोशी स्किप करें';

  @override
  String get skipSilenceSubtitle =>
      'स्ट्रीम में समर्थित होने पर ऑडियो के ख़ामोश हिस्से अपने आप स्किप करें।';

  @override
  String get allowExternalAudioEffectsTitle =>
      'बाहरी ऑडियो इफ़ेक्ट की अनुमति दें';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'इक्वलाइज़र और इफ़ेक्ट ऐप्स (जैसे Wavelet) को Media3 प्लेबैक सेशन से जुड़ने दें।';

  @override
  String get disableTunnelingTitle => 'टनलिंग बंद करें';

  @override
  String get disableTunnelingSubtitle =>
      'बिना टनलिंग वाला प्लेबैक ज़बरदस्ती करें। उन डिवाइस पर उपयोगी है जहाँ टनलिंग से ऑडियो/वीडियो में रुकावट आती है।';

  @override
  String get enableTunnelingTitle => 'टनलिंग चालू करें';

  @override
  String get enableTunnelingSubtitle =>
      'उन्नत। ऑडियो और वीडियो को एक जुड़े हुए हार्डवेयर पथ से भेजता है। डिफ़ॉल्ट रूप से बंद है क्योंकि कुछ डिवाइस पर इससे ऑडियो/वीडियो कट जाता है।';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision प्रोफ़ाइल 7 को HEVC पर मैप करें';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'गैर-DV डिवाइस पर Dolby Vision प्रोफ़ाइल 7 स्ट्रीम को HDR10-संगत HEVC के रूप में चलाएँ।';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'एम्बेडेड सबटाइटल स्टाइल इस्तेमाल करें';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'सबटाइटल ट्रैक में एम्बेड किए गए रंग, फ़ॉन्ट और पोज़िशनिंग लागू करें। इसके बजाय अपनी कैप्शन स्टाइल प्राथमिकताएँ इस्तेमाल करने के लिए इसे बंद करें।';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'एम्बेडेड सबटाइटल फ़ॉन्ट आकार इस्तेमाल करें';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'सबटाइटल ट्रैक में एम्बेड किए गए फ़ॉन्ट-आकार संकेत लागू करें। अपनी स्टाइल प्राथमिकताओं का सबटाइटल आकार इस्तेमाल करने के लिए इसे बंद करें।';

  @override
  String get showMediaDetailsOnLibraryPage => 'मीडिया विवरण दिखाएँ';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'लाइब्रेरी पेजों के शीर्ष पर चुने गए आइटम का विवरण दिखाएँ।';

  @override
  String get hideBackdropsInLibraries => 'ब्राउज़ करते समय बैकड्रॉप छिपाएँ?';

  @override
  String get useDetailedSubHeadings => 'विस्तृत उप-शीर्षक इस्तेमाल करें';

  @override
  String get useDetailedSubHeadingsDescription =>
      'लाइब्रेरी पेजों पर विस्तृत या न्यूनतम सब-रो दिखाएँ।';

  @override
  String get savedThemesDeleteDialogTitle => 'सहेजी गई थीम हटाएँ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '\"$themeName\" को इस डिवाइस के कैश से हटाएँ?';
  }

  @override
  String get themeStore => 'थीम स्टोर';

  @override
  String get themeStoreSubtitle => 'कम्युनिटी थीम ब्राउज़ करें और सहेजें';

  @override
  String get themeStoreDescription =>
      'थीम को अपनी दूसरी सहेजी गई थीम की तरह इस्तेमाल करने के लिए उसे सहेजें।';

  @override
  String get themeStoreEmpty => 'अभी कोई थीम उपलब्ध नहीं है।';

  @override
  String get themeStoreLoadFailed =>
      'थीम स्टोर लोड नहीं हो सका। अपना कनेक्शन जाँचें और फिर कोशिश करें।';

  @override
  String get themeStoreSave => 'सहेजें';

  @override
  String get themeStoreSaveAndApply => 'सहेजें और लागू करें';

  @override
  String get themeStoreSaved => 'सहेजी गई';

  @override
  String get themeStoreInvalidMessage => 'यह थीम लोड नहीं हो सकी।';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" सहेजी गई।';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" इस डिवाइस से हटा दी गई।';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" को हटाया नहीं जा सका।';
  }

  @override
  String get savedThemesTitle => 'सहेजी गई थीम';

  @override
  String get savedThemesDescription =>
      'ये मौजूदा सर्वर के लिए Moonfin प्लगइन से डाउनलोड की गई थीम हैं। हटाने पर सिर्फ़ यह लोकल कॉपी हटती है।';

  @override
  String get savedThemesEmpty => 'इस सर्वर के लिए कोई सहेजी गई थीम नहीं मिली।';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • अभी सक्रिय';
  }

  @override
  String get savedThemesDeleteTooltip => 'सहेजी गई थीम हटाएँ';

  @override
  String get savedThemesManageSubtitle =>
      'इस डिवाइस पर डाउनलोड की गई प्लगइन थीम प्रबंधित करें';

  @override
  String get themeEditor => 'थीम एडिटर';

  @override
  String get themeEditorSubtitle => 'अपने ब्राउज़र में Moonfin थीम एडिटर खोलें';

  @override
  String get homeScreen => 'होम स्क्रीन';

  @override
  String get bottomBar => 'नीचे का बार';

  @override
  String get homeRowsStyleClassic => 'क्लासिक';

  @override
  String get homeRowsStyleModern => 'मॉडर्न';

  @override
  String get homeRowsSection => 'होम पंक्तियाँ';

  @override
  String get homeRowDisplay => 'होम पंक्ति डिस्प्ले';

  @override
  String get homeRowSections => 'होम पंक्ति सेक्शन';

  @override
  String get homeRowToggles => 'होम पंक्ति टॉगल';

  @override
  String get homeRowTogglesSubtitle =>
      'लाइब्रेरी आधारित होम पंक्ति श्रेणियाँ चालू या बंद करें';

  @override
  String get homeRowTogglesDescription =>
      'होम सेक्शन में पंक्तियाँ दिखाने के लिए नीचे दिए टॉगल चालू करें।';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'क्लासिक में हर पंक्ति का इमेज टाइप और इन्फ़ो ओवरले बना रहता है। मॉडर्न पोर्ट्रेट-से-बैकड्रॉप पंक्तियों का उपयोग करता है।';

  @override
  String get displayFavoritesRows => 'पसंदीदा पंक्तियाँ दिखाएँ';

  @override
  String get displayFavoritesRowsSubtitle =>
      'होम सेक्शन में पसंदीदा फ़िल्में, सीरीज़ और अन्य पसंदीदा पंक्तियाँ दिखाएँ।';

  @override
  String get favoritesRowSorting => 'पसंदीदा पंक्ति क्रम';

  @override
  String get favoritesRowSortingDescription =>
      'पसंदीदा पंक्तियों को जोड़ने की तारीख़, रिलीज़ तारीख़, वर्णक्रम और अन्य आधार पर क्रमबद्ध करें।';

  @override
  String get displayCollectionsRows => 'कलेक्शन पंक्तियाँ दिखाएँ';

  @override
  String get displayCollectionsRowsSubtitle =>
      'होम सेक्शन में कलेक्शन पंक्तियाँ दिखाएँ।';

  @override
  String get collectionsRowSorting => 'कलेक्शन पंक्ति क्रम';

  @override
  String get collectionsRowSortingDescription =>
      'कलेक्शन पंक्तियों को जोड़ने की तारीख़, रिलीज़ तारीख़, वर्णक्रम और अन्य आधार पर क्रमबद्ध करें।';

  @override
  String get displayGenresRows => 'शैली पंक्तियाँ दिखाएँ';

  @override
  String get displayGenresRowsSubtitle =>
      'होम सेक्शन में शैली पंक्तियाँ दिखाएँ।';

  @override
  String get genresRowSorting => 'शैली पंक्ति क्रम';

  @override
  String get genresRowSortingDescription =>
      'शैली पंक्तियों को जोड़ने की तारीख़, रिलीज़ तारीख़, वर्णक्रम और अन्य आधार पर क्रमबद्ध करें।';

  @override
  String get genresRowItems => 'शैली पंक्ति आइटम';

  @override
  String get genresRowItemsDescription =>
      'शैली पंक्तियों में फ़िल्में, सीरीज़ या दोनों दिखाएँ।';

  @override
  String get displayPlaylistsRows => 'प्लेलिस्ट पंक्तियाँ दिखाएँ';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'होम सेक्शन में प्लेलिस्ट पंक्तियाँ दिखाएँ।';

  @override
  String get playlistsRowSorting => 'प्लेलिस्ट पंक्ति क्रम';

  @override
  String get playlistsRowSortingDescription =>
      'प्लेलिस्ट पंक्तियों को जोड़ने की तारीख़, रिलीज़ तारीख़, वर्णक्रम और अन्य आधार पर क्रमबद्ध करें।';

  @override
  String get displayAudioRows => 'ऑडियो पंक्तियाँ दिखाएँ';

  @override
  String get displayAudioRowsSubtitle =>
      'होम सेक्शन में ऑडियो पंक्तियाँ दिखाएँ।';

  @override
  String get audioRowsSorting => 'ऑडियो पंक्तियों का क्रम';

  @override
  String get audioRowsSortingDescription =>
      'ऑडियो पंक्तियों को जोड़ने की तारीख़, रिलीज़ तारीख़, वर्णक्रम और अन्य आधार पर क्रमबद्ध करें।';

  @override
  String get audioPlaylists => 'ऑडियो प्लेलिस्ट';

  @override
  String get appearance => 'दिखावट';

  @override
  String get layout => 'लेआउट';

  @override
  String get theme => 'थीम';

  @override
  String get keyboard => 'कीबोर्ड';

  @override
  String get navButtons => 'बटन';

  @override
  String get rendering => 'रेंडरिंग';

  @override
  String get mpvConfiguration => 'MPV कॉन्फ़िगरेशन';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'बाहरी प्लेयर ऐप';

  @override
  String get externalPlayerAppDescription =>
      'लंबे प्रेस पर चलाने का विकल्प पाने के लिए बाहरी प्लेयर सेट करें';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'प्लेबैक शुरू होने पर ऐप चुनने का विकल्प दिखाएँ।';

  @override
  String get loadingInstalledPlayers =>
      'इंस्टॉल किए गए प्लेयर लोड हो रहे हैं...';

  @override
  String get connection => 'कनेक्शन';

  @override
  String get audioTranscodeTarget => 'ऑडियो ट्रांसकोड लक्ष्य';

  @override
  String get passthrough => 'पासथ्रू';

  @override
  String get supportedOnThisDevice => 'इस डिवाइस पर समर्थित';

  @override
  String get notSupportedOnThisDevice => 'इस डिवाइस पर समर्थित नहीं';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) पासथ्रू';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) को बाहरी डिकोडर पर बिटस्ट्रीम करें।';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) के साथ TrueHD पासथ्रू';

  @override
  String get mediaPlayerBehavior => 'मीडिया प्लेयर व्यवहार';

  @override
  String get playbackEnhancements => 'प्लेबैक सुधार';

  @override
  String get alwaysOn => 'हमेशा चालू।';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Skip Outro की जगह Next Up डिस्प्ले दिखाएँ';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Skip Outro बटन के बजाय Next Up ओवरले दिखाएँ।';

  @override
  String get playerRouting => 'प्लेयर रूटिंग';

  @override
  String get preferSoftwareDecoders => 'सॉफ़्टवेयर डिकोडर को प्राथमिकता दें';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'हार्डवेयर डिकोडर से पहले FFmpeg (ऑडियो) और libgav1 (AV1) इस्तेमाल करें। अगर HDMI ऑडियो पासथ्रू काम न करे तो इसे बंद करें।';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV पर वीडियो प्लेबैक आपके चुने हुए बाहरी ऐप में खोलें।';

  @override
  String get automaticQueuing => 'स्वचालित क्यूइंग';

  @override
  String get preferSdhSubtitles => 'SDH सबटाइटल को प्राथमिकता दें';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'अपने आप चुनते समय SDH/CC सबटाइटल ट्रैक को प्राथमिकता दें।';

  @override
  String get webDiagnostics => 'वेब डायग्नोस्टिक्स';

  @override
  String get webDiagnosticsTitle => 'Moonfin वेब डायग्नोस्टिक्स';

  @override
  String get webDiagnosticsIntro =>
      'ब्राउज़र कनेक्टिविटी समस्याओं (CORS, मिक्स्ड कंटेंट और डिस्कवरी सेटिंग्स) की जाँच के लिए इस पेज का उपयोग करें।';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'मिक्स्ड-कंटेंट विफलता मिली';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/प्रीफ़्लाइट विफलता मिली';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ने पाया कि कोई HTTPS पेज किसी HTTP सर्वर URL को कॉल करने की कोशिश कर रहा है। ब्राउज़र यह अनुरोध आपके सर्वर तक पहुँचने से पहले ही रोक देते हैं।';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin ने ब्राउज़र-स्तर की अनुरोध विफलता पाई, जो आमतौर पर मीडिया सर्वर पर CORS या प्रीफ़्लाइट हेडर न होने से होती है।';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'लक्ष्य URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'विवरण: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'मौजूदा रनटाइम संदर्भ';

  @override
  String get webDiagnosticsOrigin => 'ऑरिजिन';

  @override
  String get webDiagnosticsScheme => 'स्कीम';

  @override
  String get webDiagnosticsPluginMode => 'प्लगइन मोड';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC स्कैन';

  @override
  String get webDiagnosticsForcedServerUrl => 'फ़ोर्स्ड सर्वर URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'डिफ़ॉल्ट सर्वर URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'डिस्कवरी प्रॉक्सी URL';

  @override
  String get notConfigured => 'कॉन्फ़िगर नहीं है';

  @override
  String get webDiagnosticsMixedContent => 'मिक्स्ड कंटेंट';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'यह पेज HTTPS पर लोड हुआ है, लेकिन एक या अधिक कॉन्फ़िगर किए गए URL HTTP हैं। ब्राउज़र HTTPS पेजों को HTTP API कॉल करने से रोकते हैं।';

  @override
  String get webDiagnosticsMixedContentFix =>
      'समाधान: अपने मीडिया सर्वर या प्रॉक्सी एंडपॉइंट को HTTPS पर चलाएँ, या Moonfin को HTTP पर सिर्फ़ भरोसेमंद लोकल नेटवर्क पर ही लोड करें।';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'मौजूदा रनटाइम सेटिंग्स में मिक्स्ड-कंटेंट से जुड़ी कोई स्पष्ट गड़बड़ी नहीं मिली।';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS चेकलिस्ट';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin में ब्राउज़र ऑरिजिन को अनुमति दें।';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers में Authorization, X-Emby-Authorization और X-Emby-Token शामिल करें।';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• स्ट्रीमिंग और सीक व्यवहार के लिए Content-Range और Accept-Ranges को एक्सपोज़ करें।';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS प्रीफ़्लाइट अनुरोधों पर 204 लौटाएँ।';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'उदाहरण हेडर स्निपेट (nginx-शैली)';

  @override
  String get note => 'नोट';

  @override
  String get webDiagnosticsNonWebNote =>
      'यह डायग्नोस्टिक्स रूट वेब बिल्ड के लिए है। अगर आप इसे किसी दूसरे प्लेटफ़ॉर्म पर देख रहे हैं, तो ये जाँचें लागू नहीं हो सकतीं।';

  @override
  String get backToServerSelect => 'सर्वर चुनने पर वापस जाएँ';

  @override
  String get signOutAllUsers => 'सभी उपयोगकर्ताओं को साइन आउट करें';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'माइक्रोफ़ोन की अनुमति स्थायी रूप से अस्वीकृत है। इसे सिस्टम सेटिंग्स में चालू करें।';

  @override
  String get voiceSearchPermissionRequired =>
      'वॉइस सर्च के लिए माइक्रोफ़ोन की अनुमति ज़रूरी है।';

  @override
  String get voiceSearchNoMatch => 'यह समझ नहीं आया। फिर कोशिश करें।';

  @override
  String get voiceSearchNoSpeechDetected => 'कोई आवाज़ नहीं मिली।';

  @override
  String get voiceSearchMicrophoneError => 'माइक्रोफ़ोन त्रुटि।';

  @override
  String get voiceSearchNeedsInternet => 'वॉइस सर्च के लिए इंटरनेट ज़रूरी है।';

  @override
  String get voiceSearchServiceBusy => 'वॉइस सेवा व्यस्त है। फिर कोशिश करें।';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'माइक्रोफ़ोन की अनुमति स्थायी रूप से अस्वीकृत है।';

  @override
  String get microphonePermissionDenied => 'माइक्रोफ़ोन की अनुमति अस्वीकृत है।';

  @override
  String get speechRecognitionUnavailable =>
      'इस डिवाइस पर वाक् पहचान उपलब्ध नहीं है।';

  @override
  String get openIosRoutePicker => 'iOS रूट पिकर खोलें';

  @override
  String get airPlayRoutePickerUnavailable =>
      'इस डिवाइस पर AirPlay रूट पिकर उपलब्ध नहीं है।';

  @override
  String get videos => 'वीडियो';

  @override
  String get programs => 'प्रोग्राम';

  @override
  String get songs => 'गाने';

  @override
  String get photoAlbums => 'फ़ोटो एल्बम';

  @override
  String get photos => 'फ़ोटो';

  @override
  String get people => 'लोग';

  @override
  String get recentlyReleasedEpisodes => 'हाल ही में रिलीज़ हुए एपिसोड';

  @override
  String get watchAgain => 'फिर से देखें';

  @override
  String get guestAppearances => 'अतिथि भूमिकाएँ';

  @override
  String get appearancesSeerr => 'भूमिकाएँ (Seerr)';

  @override
  String get crewContributionsSeerr => 'क्रू योगदान (Seerr)';

  @override
  String get watchWithGroup => 'ग्रुप के साथ देखें';

  @override
  String get errors => 'त्रुटियाँ';

  @override
  String get warnings => 'चेतावनियाँ';

  @override
  String get disk => 'डिस्क';

  @override
  String get openInBrowser => 'ब्राउज़र में खोलें';

  @override
  String get embeddedBrowserNotAvailable =>
      'इस प्लेटफ़ॉर्म पर एम्बेडेड ब्राउज़र उपलब्ध नहीं है।';

  @override
  String get adminRestartServerConfirmation =>
      'क्या आप वाकई सर्वर को रीस्टार्ट करना चाहते हैं?';

  @override
  String get adminShutdownServerConfirmation =>
      'क्या आप वाकई सर्वर को बंद करना चाहते हैं? आपको इसे मैन्युअल रूप से फिर से शुरू करना होगा।';

  @override
  String get internal => 'आंतरिक';

  @override
  String get idle => 'निष्क्रिय';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'कोई उपयोगकर्ता नहीं मिला';

  @override
  String get adminNoUsersMatchSearch =>
      'आपकी खोज से कोई उपयोगकर्ता मेल नहीं खाता';

  @override
  String get adminNoDevicesFound => 'कोई डिवाइस नहीं मिला';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'मौजूदा फ़िल्टर से कोई डिवाइस मेल नहीं खाता';

  @override
  String get passwordSet => 'पासवर्ड सेट है';

  @override
  String get noPasswordConfigured => 'कोई पासवर्ड कॉन्फ़िगर नहीं है';

  @override
  String get remoteAccess => 'रिमोट एक्सेस';

  @override
  String get localOnly => 'केवल लोकल';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'मीडिया एनालिटिक्स लोड नहीं हो सका';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'सभी मीडिया लाइब्रेरी का संयुक्त एनालिटिक्स।';

  @override
  String get analyticsTopArtists => 'टॉप कलाकार';

  @override
  String get analyticsTopAuthors => 'टॉप लेखक';

  @override
  String get analyticsTopContributors => 'टॉप योगदानकर्ता';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लाइब्रेरी',
      one: '1 लाइब्रेरी',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'इस चयन के लिए अभी कोई इंडेक्स किया गया मीडिया कुल उपलब्ध नहीं है।';

  @override
  String get analyticsLibraryDetails => 'लाइब्रेरी विवरण';

  @override
  String get analyticsLibraryBreakdown => 'लाइब्रेरी ब्रेकडाउन';

  @override
  String get analyticsNoLibrariesAvailable => 'कोई लाइब्रेरी उपलब्ध नहीं है।';

  @override
  String get adminServerAdministrationTitle => 'सर्वर प्रशासन';

  @override
  String get adminServerPathData => 'डेटा';

  @override
  String get adminServerPathImageCache => 'इमेज कैश';

  @override
  String get adminServerPathCache => 'कैश';

  @override
  String get adminServerPathLogs => 'लॉग';

  @override
  String get adminServerPathMetadata => 'मेटाडेटा';

  @override
  String get adminServerPathTranscode => 'ट्रांसकोड';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'इस सर्वर ने कोई सर्वर पाथ नहीं लौटाया।';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% उपयोग में';
  }

  @override
  String get userActivity => 'उपयोगकर्ता गतिविधि';

  @override
  String get systemEvents => 'सिस्टम इवेंट';

  @override
  String get needsAttention => 'ध्यान देने की ज़रूरत';

  @override
  String get adminDrawerSectionServer => 'सर्वर';

  @override
  String get adminDrawerSectionPlayback => 'प्लेबैक';

  @override
  String get adminDrawerSectionDevices => 'डिवाइस';

  @override
  String get adminDrawerSectionAdvanced => 'उन्नत';

  @override
  String get adminDrawerSectionPlugins => 'प्लगइन';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'होम वीडियो';

  @override
  String get mixedContent => 'मिश्रित सामग्री';

  @override
  String get homeVideosAndPhotos => 'होम वीडियो और फ़ोटो';

  @override
  String get mixedMoviesAndShows => 'मिश्रित फ़िल्में और शो';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'कोई रिकॉर्डिंग नहीं मिली';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension आर्काइव में कोई इमेज पेज नहीं मिला।';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'एम्बेडेड रेंडरर विफल ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB रेंडरर विफल ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'रीडर के लिए लोकल फ़ाइल नहीं मिली: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri से बुक डेटा खोलते समय HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'कोई पठनीय बुक एंडपॉइंट उपलब्ध नहीं';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'असमर्थित कॉमिक आर्काइव फ़ॉर्मेट: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'इस प्लेटफ़ॉर्म पर CBR एक्सट्रैक्शन प्लगइन उपलब्ध नहीं है।';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr आर्काइव एक्सट्रैक्ट नहीं हो सका।';

  @override
  String get cb7ExtractionUnavailable =>
      'इस प्लेटफ़ॉर्म पर CB7 एक्सट्रैक्शन उपलब्ध नहीं है।';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'इस प्लेटफ़ॉर्म पर CB7 एक्सट्रैक्शन प्लगइन उपलब्ध नहीं है।';

  @override
  String get closeGenrePanel => 'शैली पैनल बंद करें';

  @override
  String get loadingShuffle => 'शफ़ल लोड हो रहा है...';

  @override
  String get libraryShuffleLabel => 'लाइब्रेरी शफ़ल';

  @override
  String get randomShuffleLabel => 'रैंडम शफ़ल';

  @override
  String get genresShuffleLabel => 'शैली शफ़ल';

  @override
  String get autoHdrSwitching => 'ऑटो HDR स्विचिंग';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR वीडियो प्लेबैक के लिए HDR अपने आप चालू करें और बाहर निकलने पर डिस्प्ले मोड बहाल करें।';

  @override
  String get whenFullscreen => 'फ़ुलस्क्रीन में';

  @override
  String get changeArtwork => 'आर्टवर्क बदलें';

  @override
  String get missing => 'अनुपलब्ध';

  @override
  String get transcodingLimits => 'ट्रांसकोडिंग सीमाएँ';

  @override
  String get clearAllArtworkButton => 'सारा आर्टवर्क हटाएँ?';

  @override
  String get clearAllArtworkWarning =>
      'क्या आप वाकई सारा डाउनलोड किया गया आर्टवर्क हटाना चाहते हैं?';

  @override
  String get confirmClear => 'हटाने की पुष्टि करें';

  @override
  String confirmClearMessage(String itemType) {
    return 'क्या आप वाकई यह $itemType हटाना चाहते हैं?';
  }

  @override
  String get uploadButton => 'अपलोड करें?';

  @override
  String get resolutionLabel => 'रिज़ॉल्यूशन: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'केवल इंटरफ़ेस भाषा वाला आर्टवर्क दिखाएँ';

  @override
  String get confirmClearAll => 'सब हटाने की पुष्टि करें';

  @override
  String get imageUploadSuccess => 'इमेज सफलतापूर्वक अपलोड हो गई!';

  @override
  String imageUploadFailed(String error) {
    return 'इमेज अपलोड नहीं हो सकी: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'इमेज सेट नहीं हो सकी: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'इमेज हटाई नहीं जा सकी: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'सारा आर्टवर्क हटाया नहीं जा सका: $error';
  }

  @override
  String get yes => 'हाँ';

  @override
  String get posterCategory => 'पोस्टर';

  @override
  String get backdropsCategory => 'बैकड्रॉप';

  @override
  String get bannerCategory => 'बैनर';

  @override
  String get logoCategory => 'लोगो';

  @override
  String get thumbnailCategory => 'थंबनेल';

  @override
  String get artCategory => 'आर्ट';

  @override
  String get discArtCategory => 'डिस्क आर्ट';

  @override
  String get screenshotCategory => 'स्क्रीनशॉट';

  @override
  String get boxCoverCategory => 'बॉक्स कवर';

  @override
  String get boxRearCoverCategory => 'बॉक्स रियर कवर';

  @override
  String get menuArtCategory => 'मेन्यू आर्ट';

  @override
  String get confirmItemPoster => 'पोस्टर';

  @override
  String get confirmItemBackdrop => 'बैकड्रॉप';

  @override
  String get confirmItemBanner => 'बैनर';

  @override
  String get confirmItemLogo => 'लोगो';

  @override
  String get confirmItemThumbnail => 'थंबनेल';

  @override
  String get confirmItemArt => 'आर्ट';

  @override
  String get confirmItemDiscArt => 'डिस्क आर्ट';

  @override
  String get confirmItemScreenshot => 'स्क्रीनशॉट';

  @override
  String get confirmItemBoxCover => 'बॉक्स कवर';

  @override
  String get confirmItemBoxRearCover => 'बॉक्स रियर कवर';

  @override
  String get confirmItemMenuArt => 'मेन्यू आर्ट';

  @override
  String get resolutionAll => 'सभी';

  @override
  String get resolutionHigh => 'उच्च (1080p+)';

  @override
  String get resolutionMedium => 'मध्यम (720p)';

  @override
  String get resolutionLow => 'निम्न (<720p)';

  @override
  String get sources => 'स्रोत';

  @override
  String get audiobookChapters => 'अध्याय';

  @override
  String get audiobookBookmarks => 'बुकमार्क';

  @override
  String get audiobookNotes => 'नोट्स';

  @override
  String get audiobookQueue => 'कतार';

  @override
  String get audiobookTimeline => 'टाइमलाइन';

  @override
  String get audiobookTimelineEmpty => 'टाइमलाइन खाली है';

  @override
  String get audiobookWholeBook => 'पूरी किताब';

  @override
  String get audiobookFocusedTimeline => 'केंद्रित टाइमलाइन';

  @override
  String get audiobookExportBookmarks => 'बुकमार्क एक्सपोर्ट करें';

  @override
  String get audiobookExportNotes => 'नोट्स एक्सपोर्ट करें';

  @override
  String get audiobookExportAll => 'सब एक्सपोर्ट करें';

  @override
  String audiobookExportSuccess(String path) {
    return '$path में एक्सपोर्ट हो गया';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'एक्सपोर्ट विफल: $error';
  }

  @override
  String get audiobookLyrics => 'बोल';

  @override
  String get audiobookAddBookmark => 'बुकमार्क जोड़ें';

  @override
  String get audiobookAddNote => 'नोट जोड़ें';

  @override
  String get audiobookEditNote => 'नोट संपादित करें';

  @override
  String get audiobookNoteHint => 'इस पल के लिए एक नोट लिखें';

  @override
  String get audiobookSleepTimer => 'स्लीप टाइमर';

  @override
  String get audiobookSleepOff => 'बंद';

  @override
  String get audiobookSleepEndOfChapter => 'अध्याय के अंत में';

  @override
  String get audiobookSleepCustom => 'कस्टम';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining बचे';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मिनट',
      one: '1 मिनट',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'प्लेबैक गति';

  @override
  String get audiobookRemainingTime => 'शेष';

  @override
  String get audiobookElapsedTime => 'बीता समय';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds से॰ पीछे';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds से॰ आगे';
  }

  @override
  String get audiobookPreviousChapter => 'पिछला अध्याय';

  @override
  String get audiobookNextChapter => 'अगला अध्याय';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'अध्याय $current / $total';
  }

  @override
  String get audiobookNoChapters => 'कोई अध्याय नहीं';

  @override
  String get audiobookNoBookmarks => 'अभी कोई बुकमार्क नहीं';

  @override
  String get audiobookNoNotes => 'अभी कोई नोट नहीं';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position पर बुकमार्क जोड़ा गया';
  }

  @override
  String get audiobookSpeedReset => '1.0x पर रीसेट करें';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'सहेजें';

  @override
  String get audiobookCancel => 'रद्द करें';

  @override
  String get audiobookDelete => 'मिटाएँ';

  @override
  String get subtitlePreferences => 'सबटाइटल प्राथमिकताएँ';

  @override
  String get subtitlePreferencesDescription =>
      'सबटाइटल मोड, डिफ़ॉल्ट भाषाएँ, दिखावट और रेंडरिंग विकल्प बदलें।';

  @override
  String get subtitleRendering => 'सबटाइटल रेंडरिंग';

  @override
  String get displayOptions => 'प्रदर्शन विकल्प';

  @override
  String get releaseDateAscending => 'रिलीज़ तिथि (बढ़ते क्रम में)';

  @override
  String get releaseDateDescending => 'रिलीज़ तिथि (घटते क्रम में)';

  @override
  String get groupContributions => 'योगदान समूहित करें';

  @override
  String get groupMultipleRoles => 'एकाधिक भूमिकाएँ समूहित करें';

  @override
  String get libraryWriteAccessWarningTitle => 'लाइब्रेरी राइट एक्सेस चेतावनी';

  @override
  String get libraryWriteAccessHowToFix => 'इसे कैसे ठीक करें:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. सर्वर पर अपने मीडिया लाइब्रेरी फ़ोल्डर के लिए Jellyfin सेवा उपयोगकर्ता (जैसे jellyfin या Docker PUID/PGID) को राइट अनुमतियाँ दें।\n\n2. या, अपने Jellyfin Dashboard -> Libraries पर जाएँ, इस लाइब्रेरी को संपादित करें, और आर्टवर्क को Jellyfin के आंतरिक डेटाबेस में सहेजने के लिए \'Save artwork into media folders\' बंद करें।';

  @override
  String get dismiss => 'खारिज करें';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'आपकी \'$libraryName\' लाइब्रेरी आर्टवर्क को सीधे मीडिया फ़ोल्डर में सहेजने के लिए कॉन्फ़िगर है (\'Save artwork into media folders\' चालू है)। हालाँकि, Jellyfin ने राइट एक्सेस जाँचा और उसे इस डायरेक्टरी में फ़ाइलें लिखने की अनुमति नहीं है:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'लगता है Jellyfin आर्टवर्क अपडेट नहीं कर सका। आपकी लाइब्रेरी आर्टवर्क को सीधे मीडिया फ़ोल्डर में सहेजने के लिए कॉन्फ़िगर है (\'Save artwork into media folders\' चालू है)। यह त्रुटि आम तौर पर तब होती है जब Jellyfin सर्वर प्रोसेस के पास आपकी मीडिया डायरेक्टरी में फ़ाइलें लिखने की अनुमति नहीं होती।';

  @override
  String get externalLists => 'बाहरी सूचियाँ';

  @override
  String get replay => 'फिर से चलाएँ';

  @override
  String get fileInformation => 'फ़ाइल जानकारी';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'आकार: $size  •  फ़ॉर्मेट: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'सभी ($count) ऑडियो ट्रैक दिखाएँ';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'सभी ($count) सबटाइटल ट्रैक दिखाएँ';
  }

  @override
  String get checkingDirectPlay => 'Direct Play क्षमता जाँची जा रही है...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play क्षमता: ';

  @override
  String get forced => 'फ़ोर्स्ड';

  @override
  String get transcodeContainerNotSupported =>
      'प्लेयर इस कंटेनर फ़ॉर्मेट का समर्थन नहीं करता।';

  @override
  String get transcodeVideoCodecNotSupported => 'वीडियो कोडेक समर्थित नहीं है।';

  @override
  String get transcodeAudioCodecNotSupported => 'ऑडियो कोडेक समर्थित नहीं है।';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'सबटाइटल फ़ॉर्मेट समर्थित नहीं है (बर्निंग ज़रूरी है)।';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ऑडियो प्रोफ़ाइल समर्थित नहीं है।';

  @override
  String get transcodeVideoProfileNotSupported =>
      'वीडियो प्रोफ़ाइल समर्थित नहीं है।';

  @override
  String get transcodeVideoLevelNotSupported => 'वीडियो लेवल समर्थित नहीं है।';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'यह डिवाइस इस वीडियो रिज़ॉल्यूशन का समर्थन नहीं करता।';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'वीडियो बिट डेप्थ समर्थित नहीं है।';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'वीडियो फ़्रेमरेट समर्थित नहीं है।';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'फ़ाइल बिटरेट प्लेयर की स्ट्रीमिंग सीमा से अधिक है।';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'वीडियो बिटरेट स्ट्रीमिंग सीमा से अधिक है।';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ऑडियो बिटरेट स्ट्रीमिंग सीमा से अधिक है।';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ऑडियो चैनलों की संख्या समर्थित नहीं है।';

  @override
  String get sortAlphabetical => 'वर्णानुक्रम';

  @override
  String get sortReleaseAscending => 'रिलीज़ क्रम (बढ़ते क्रम में)';

  @override
  String get sortReleaseDescending => 'रिलीज़ क्रम (घटते क्रम में)';

  @override
  String get sortCustomDragDrop => 'कस्टम (ड्रैग-एंड-ड्रॉप)';

  @override
  String get playlistSortOptions => 'प्लेलिस्ट क्रम विकल्प';

  @override
  String get resetSort => 'क्रम रीसेट करें';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode फिर से देखें';
  }

  @override
  String get rewatchPlaylist => 'प्लेलिस्ट फिर से देखें';

  @override
  String get noSubtitlesFound => 'कोई सबटाइटल नहीं मिला।';

  @override
  String get adminControls => 'एडमिन नियंत्रण';

  @override
  String get impellerRendering => 'रेंडरिंग इंजन (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller, Flutter का आधुनिक GPU रेंडरर है जो एनिमेशन को स्मूद बनाता है और अटकन कम करता है। कुछ TV बॉक्स और पुराने GPU पर यह ग्लिच या ब्लैक वीडियो दे सकता है; ऐसा दिखे तो इसे बंद कर दें। स्वचालित आपके डिवाइस के लिए सबसे अच्छा डिफ़ॉल्ट चुनता है। लागू करने के लिए Moonfin को फिर से शुरू करें।';

  @override
  String get impellerAuto => 'स्वचालित';

  @override
  String get impellerOn => 'चालू';

  @override
  String get impellerOff => 'बंद';

  @override
  String get impellerRestartTitle => 'पुनः आरंभ ज़रूरी';

  @override
  String get impellerRestartMessage =>
      'रेंडरिंग इंजन बदलने के लिए Moonfin को फिर से शुरू करना होगा। ऐप अभी बंद करें, फिर लागू करने के लिए उसे दोबारा खोलें।';

  @override
  String get impellerCloseNow => 'ऐप अभी बंद करें';

  @override
  String get adminRefreshLibrary => 'लाइब्रेरी रिफ़्रेश करें';

  @override
  String get adminRefreshAllLibraries => 'सभी लाइब्रेरी रिफ़्रेश करें';

  @override
  String get adminRepoSortDateOldest => 'जोड़ने की तिथि (सबसे पुराना पहले)';

  @override
  String get adminRepoSortDateNewest => 'जोड़ने की तिथि (सबसे नया पहले)';

  @override
  String get adminRepoSortNameAsc => 'वर्णानुक्रम (A से Z)';

  @override
  String get adminRepoSortNameDesc => 'वर्णानुक्रम (Z से A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'सर्वर एनालिटिक्स लोड हो रहा है... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'स्रोत के अनुसार';

  @override
  String get imdbTop250Movies => 'IMDb टॉप 250 फ़िल्में';

  @override
  String get imdbTop250TvShows => 'IMDb टॉप 250 टीवी शो';

  @override
  String get imdbMostPopularMovies => 'IMDb सबसे लोकप्रिय फ़िल्में';

  @override
  String get imdbMostPopularTvShows => 'IMDb सबसे लोकप्रिय टीवी शो';

  @override
  String get imdbLowestRatedMovies => 'IMDb सबसे कम रेटेड फ़िल्में';

  @override
  String get imdbTopEnglishMovies => 'IMDb टॉप रेटेड अंग्रेज़ी फ़िल्में';
}
