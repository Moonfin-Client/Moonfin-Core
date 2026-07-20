// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ТІРКЕЛГІ ПАРАМЕТРЛЕРІ';

  @override
  String get interfaceLanguage => 'Интерфейс тілі';

  @override
  String get systemLanguageDefault => 'Жүйе бойынша';

  @override
  String get signIn => 'Кіру';

  @override
  String get empty => 'Бос';

  @override
  String connectingToServer(String serverName) {
    return '$serverName серверіне қосылуда';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Құпия сөз';

  @override
  String get username => 'Пайдаланушы аты';

  @override
  String get email => 'Электрондық пошта';

  @override
  String get quickConnectInstruction =>
      'Бұл кодты серверіңіздің веб-бақылау тақтасына енгізіңіз:';

  @override
  String get waitingForAuthorization => 'Авторизация күтілуде...';

  @override
  String get back => 'Артқа';

  @override
  String get serverUnavailable => 'Сервер қолжетімсіз';

  @override
  String get loginFailed => 'Логин кірмеді';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect қолжетімсіз: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect қолжетімсіз ($status): $detail';
  }

  @override
  String get whosWatching => 'Кім қарап отыр?';

  @override
  String get addUser => 'Пайдаланушы қосу';

  @override
  String get selectServer => 'Серверді таңдаңыз';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin нұсқасы $version';
  }

  @override
  String get savedServers => 'Сақталған серверлер';

  @override
  String get discoveredServers => 'Табылған серверлер';

  @override
  String get noneFound => 'Ешқайсысы табылмады';

  @override
  String get unableToConnectToServer => 'Серверге қосылу мүмкін емес';

  @override
  String get addServer => 'Сервер қосу';

  @override
  String get embyConnect => 'Emby Қосылу';

  @override
  String get removeServer => 'Серверді жою';

  @override
  String removeServerConfirmation(String serverName) {
    return '«$serverName» серверлер тізімінен жойылсын ба?';
  }

  @override
  String get cancel => 'Болдырмау';

  @override
  String get remove => 'Алып тастау';

  @override
  String get connectToServer => 'Серверге қосылу';

  @override
  String get serverAddress => 'Сервер мекенжайы';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Қосылу';

  @override
  String get secureStorageUnavailable => 'Қауіпсіз жад қолжетімсіз';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin жүйе кілттеріне қол жеткізе алмады. Жүйеге кіруді жалғастыруға болады, бірақ кілт сақинасының құлпы ашылғанша қауіпсіз таңбалауыш қоймасы қолжетімсіз болуы мүмкін.';

  @override
  String get ok => 'Жарайды';

  @override
  String get settingsAppearanceTheme => 'Қолданба тақырыбы';

  @override
  String get detailScreenStyle => 'Мәліметтер экранының стилі';

  @override
  String get detailScreenStyleSubtitle =>
      '«Классикалық» — Moonfin бағдарламасының бастапқы, ортаға тураланған қалыбы. «Заманауи» — бейімделгіш кинематографиялық қалып.';

  @override
  String get detailScreenStyleMoonfin => 'Классикалық';

  @override
  String get detailScreenStyleModern => 'Заманауи';

  @override
  String get expandedTabs => 'Жайылған қойындылар';

  @override
  String get expandedTabsSubtitle =>
      'Қойындыларды шолу кезінде олардың мазмұнын автоматты түрде көрсету. Әр қойындыны қолмен ашып-жабу үшін өшіріңіз.';

  @override
  String get showTechnicalDetails => 'Техникалық мәліметтер көрсетілсін бе?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Баннер түйіндемесінде кодек, ажыратымдылық және ағын туралы мәліметтерді көрсету';

  @override
  String get recommendationSystem => 'Ұсыныс жүйесі';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin ұсынады жергілікті кітапхана алгоритмін немесе TMDb ұсынатын желілік ұқсастық метрикаларын пайдаланыңыз. Ескертпе: желілік ұсыныстар Seerr интеграциясын талап етеді.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin ұсынады';

  @override
  String get recommendationSystemTmdb => 'TMDb ұқсастығы';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Жас шектеуі бойынша шек қойылсын ба?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin ұсынады тізіміндегі ұсыныстарды таңдалған медиафайлдың жас шектеуі бойынша шектеу';

  @override
  String get interfaceStyle => 'Интерфейс стилі';

  @override
  String get interfaceStyleSubtitle =>
      '«Автоматты» құрылғыңызға сәйкес келеді. Белгілі бір көріністі мәжбүрлеп орнату үшін Apple немесе Material таңдаңыз.';

  @override
  String get interfaceStyleAutomatic => 'Автоматты';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Шыны сапасы';

  @override
  String get glassQualitySubtitle =>
      '«Авто» осы құрылғыға ең қолайлы шыны әсерін таңдайды. «Толық» нақты бұлдырлатуды қосады, «Азайтылған» GPU қуатын үнемдейтін жеңіл шыныны пайдаланады.';

  @override
  String get glassQualityAuto => 'Авто';

  @override
  String get glassQualityFull => 'Толық';

  @override
  String get glassQualityReduced => 'Азайтылған';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Қолданбаны қайта іске қоспай, Moonfin және Neon Pulse арасында ауысыңыз';

  @override
  String get customThemeTitle => 'Жеке тақырып';

  @override
  String get customThemeSubtitle =>
      'Жеке тақырыптар Moonfin бойынша визуалды элементтерді өзгертеді. Өз стиліңізге сай нұсқаны таңдаңыз.';

  @override
  String get keyboardPreferSystemIme => 'Жүйелік пернетақтаны таңдау';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Мәтін енгізу үшін әдепкіде құрылғыңыздың енгізу әдісін пайдалану';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'Ағымдағы Moonfin келбеті бәріңізге ұнады';

  @override
  String get themeNeonPulse => 'Неон импульсі';

  @override
  String get themeNeonPulseSubtitle =>
      'Күлгін түсті жарқыл, көгілдір мәтін және күшті хром контрастымен Synthwave стилі';

  @override
  String get themeGlass => 'Шыны';

  @override
  String get themeGlassSubtitle =>
      'Сұйық шыны стилі: жылжымалы градиент фоны, күңгірт беттер және Apple көк екпіні';

  @override
  String get theme8BitHero => '8-биттік батыр';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро пиксель-арт стилі: ірі палитра, блокты жиектер, қатты көлеңкелер және пиксельдік қаріп';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby Connect есептік жазбасымен кіріңіз';

  @override
  String get emailOrUsername => 'Электрондық пошта немесе пайдаланушы аты';

  @override
  String get selectAServer => 'Серверді таңдаңыз';

  @override
  String get tryAgain => 'Қайтадан байқап көріңіз';

  @override
  String get noLinkedServers =>
      'Осы Emby Connect тіркелгісімен байланыстырылған серверлер жоқ';

  @override
  String get invalidEmbyConnectCredentials =>
      'Жарамсыз Emby Connect тіркелгі деректері';

  @override
  String get invalidEmbyConnectLogin =>
      'Жарамсыз Emby Connect пайдаланушы аты немесе құпия сөз';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер Emby Connect алмасуын қолдамайды';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect немесе таңдалған сервермен байланысу кезінде желі қатесі';

  @override
  String get loadingLinkedServers => 'Байланыстырылған серверлер жүктелуде...';

  @override
  String get connectingToServerEllipsis => 'Серверге қосылуда...';

  @override
  String get noReachableAddress => 'Қолжетімді мекенжай көрсетілмеген';

  @override
  String get invalidServerExchangeResponse =>
      'Сервер алмасудың соңғы нүктесінен жарамсыз жауап';

  @override
  String unableToConnectTo(String target) {
    return '$target серверіне қосылу мүмкін болмады';
  }

  @override
  String get exitApp => 'Moonfin шығу керек пе?';

  @override
  String get exitAppConfirmation => 'Шығыңыз келетініне сенімдісіз бе?';

  @override
  String get exit => 'Шығу';

  @override
  String get gameMenu => 'Мәзір';

  @override
  String get gamePaused => 'Кідіртілді';

  @override
  String get gameSaveState => 'Күйді сақтау';

  @override
  String get games => 'Ойындар';

  @override
  String get gameLoadState => 'Күйді жүктеу';

  @override
  String get gameFastForward => 'Жылдам алға';

  @override
  String get gameEmulatorSettings => 'Эмулятор параметрлері';

  @override
  String get gameNoCoreOptions => 'Бұл ядроның реттелетін параметрлері жоқ.';

  @override
  String get gameHoldToOpenMenu => 'Мәзірді ашу үшін басып тұрыңыз';

  @override
  String get gamePlaybackUnsupported =>
      'Ойындар бұл құрылғыда әзірге қолдау таппайды.';

  @override
  String get noHomeRowsLoaded => 'Ешбір негізгі жолдарды жүктеу мүмкін болмады';

  @override
  String get noHomeRowsHint =>
      'Белсенді үй бөлімдерін жаңартып немесе азайтып көріңіз.';

  @override
  String get retryHomeRows => 'Басты жолдарды қайталап көріңіз';

  @override
  String get guide => 'Гид';

  @override
  String get recordings => 'Жазбалар';

  @override
  String get schedule => 'Кесте';

  @override
  String get series => 'Сериалдар';

  @override
  String get noItemsFound => 'Ешбір элемент табылмады';

  @override
  String get home => 'Басты бет';

  @override
  String get browseAll => 'Барлығын шолу';

  @override
  String get genres => 'Жанрлар';

  @override
  String get collectionPlaceholder =>
      'Жинақ элементтері осы жерде пайда болады';

  @override
  String get browseByLetter => 'Хат бойынша шолу';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Мұнда алфавиттік шолу пайда болады';

  @override
  String get suggestions => 'Ұсыныстар';

  @override
  String get suggestionsPlaceholder =>
      'Ұсынылған элементтер осы жерде пайда болады';

  @override
  String get failedToLoadLibraries => 'Кітапханалар жүктелмеді';

  @override
  String get noLibrariesFound => 'Ешқандай кітапхана табылмады';

  @override
  String get library => 'Медиатека';

  @override
  String get displaySettings => 'Дисплей параметрлері';

  @override
  String get allGenres => 'Барлық жанрлар';

  @override
  String get noGenresFound => 'Жанрлар табылмады';

  @override
  String failedToLoadFolderError(String error) {
    return 'Қалтаны жүктеу мүмкін болмады: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Бұл қалта бос';

  @override
  String itemCountLabel(int count) {
    return '$count элемент';
  }

  @override
  String get failedToLoadFavorites => 'Таңдаулылар жүктелмеді';

  @override
  String get retry => 'Қайталап көріңіз';

  @override
  String get noFavoritesYet => 'Таңдаулылар әлі жоқ';

  @override
  String get favorites => 'Таңдаулылар';

  @override
  String totalCountItems(int count) {
    return '$count Элемент';
  }

  @override
  String get continuing => 'Жалғастыруда';

  @override
  String get ended => 'Аяқталды';

  @override
  String get sortAndFilter => 'Сұрыптау және сүзу';

  @override
  String get type => 'Түр';

  @override
  String get sortBy => 'Бойынша сұрыптау';

  @override
  String get display => 'Дисплей';

  @override
  String get imageType => 'Кескін түрі';

  @override
  String get posterSize => 'Постер өлшемі';

  @override
  String get small => 'Кішкентай';

  @override
  String get medium => 'Орташа';

  @override
  String get large => 'Үлкен';

  @override
  String get extraLarge => 'Өте үлкен';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Жанрлар';
  }

  @override
  String get views => 'Көрулер';

  @override
  String get albums => 'Альбомдар';

  @override
  String get albumArtists => 'Альбом әртістері';

  @override
  String get artists => 'Орындаушылар';

  @override
  String get bookmarks => 'Бетбелгілер';

  @override
  String get noSavedBookmarks =>
      'Бұл тақырып үшін әлі сақталған бетбелгілер жоқ.';

  @override
  String get openBook => 'Ашық кітап';

  @override
  String get chapter => 'тарау';

  @override
  String get page => 'Бет';

  @override
  String get bookmark => 'Бетбелгі';

  @override
  String get justNow => 'Жаңа ғана';

  @override
  String minutesAgo(int count) {
    return '$count мин бұрын';
  }

  @override
  String hoursAgo(int count) {
    return '$count сағ бұрын';
  }

  @override
  String daysAgo(int count) {
    return '$count күн бұрын';
  }

  @override
  String get discoverySubjects => 'Ашу тақырыптары';

  @override
  String get pickDiscoverySubjects =>
      'Discover қолданбасында көрсетілетін тақырып арналарын таңдаңыз.';

  @override
  String get apply => 'Қолдану';

  @override
  String get openLink => 'Сілтемені ашу';

  @override
  String get scanWithYourPhone => 'Телефонмен сканерлеңіз';

  @override
  String get audiobookGenres => 'Аудиокітап жанрлары';

  @override
  String get pickAudiobookGenres =>
      'Аудиокітапты табуда көрсетілетін жанрларды таңдаңыз.';

  @override
  String get discoverAudiobooks => 'Аудиокітаптарды ашыңыз';

  @override
  String get librivoxDescription =>
      'LibriVox ұсынған танымал қоғамдық домен атаулары.';

  @override
  String titlesCount(int count) {
    return '$count атау';
  }

  @override
  String get scrollLeft => 'Солға айналдырыңыз';

  @override
  String get scrollRight => 'Оңға айналдырыңыз';

  @override
  String get couldNotLoadGenre => 'Дәл қазір бұл жанрды жүктеу мүмкін емес.';

  @override
  String get continueReading => 'Оқуды жалғастыру';

  @override
  String get savedHighlights => 'Сақталған ерекшеліктер';

  @override
  String get continueListening => 'Тыңдауды жалғастыру';

  @override
  String get listen => 'Тыңда';

  @override
  String get resume => 'Жалғастыру';

  @override
  String get failedToLoadLibrary => 'Кітапхана жүктелмеді';

  @override
  String get popularNow => 'Қазір танымал';

  @override
  String get savedForLater => 'Кейінірек үшін сақталды';

  @override
  String get topListens => 'Үздік тыңдаушылар';

  @override
  String get unreadDiscoveries => 'Оқылмаған жаңалықтар';

  @override
  String get pickUpAgain => 'Қайтадан алыңыз';

  @override
  String get bookHighlightsDescription =>
      'Маңызды жерлері, таңдаулылары немесе оқылу барысы бар кітаптарыңыз.';

  @override
  String get handPickedFromLibrary => 'Кітапханаңыздан таңдалған.';

  @override
  String get handPickedFromListeningQueue =>
      'Тыңдау кезегінен қолмен таңдалды.';

  @override
  String get booksWithHighlights =>
      'Маңызды жерлері, таңдаулылары немесе оқылу барысы бар кітаптар.';

  @override
  String get jumpBackNarration => 'Орныңызды іздемей, әңгімеге қайта оралыңыз.';

  @override
  String get unreadBooksReady =>
      'Оқылмаған кітаптар келесі тыныш сағатқа дайын.';

  @override
  String get quickAccessFavorites =>
      'Қайта оралатын кітаптарға жылдам қол жеткізу.';

  @override
  String get searchAudiobooks => 'Аудиокітаптарды іздеу';

  @override
  String get searchYourLibrary => 'Кітапханаңызды іздеңіз';

  @override
  String get pickUpStory => 'Әңгімені тоқтаған жерден жалғастырыңыз';

  @override
  String get savedPlacesChapters =>
      'Сақталған орындарыңыз бен аяқталмаған тарауларыңыз';

  @override
  String authorsCount(int count) {
    return '$count автор';
  }

  @override
  String genresCount(int count) {
    return '$count жанр';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% аяқталды';
  }

  @override
  String get readyWhenYouAre => 'Бар кезде дайын';

  @override
  String get details => 'Мәліметтер';

  @override
  String get listeningRoom => 'Тыңдау бөлмесі';

  @override
  String get bookmarksAndProgress => 'Бетбелгілер және орындалу барысы';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Оқуға бағытталған шолу үшін $count атау реттелген.';
  }

  @override
  String get titles => 'Атаулар';

  @override
  String get allTitles => 'Барлық тақырыптар';

  @override
  String get authors => 'Авторлар';

  @override
  String get browseByAuthor => 'Авторы бойынша шолу';

  @override
  String get browseByGenre => 'Жанр бойынша шолу';

  @override
  String get discover => 'Ашу';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library тақырыбы бойынша танымал тақырыптар.';

  @override
  String get noBookmarkedItems => 'Әлі бетбелгі қойылған элементтер жоқ';

  @override
  String get nothingMatchesSection =>
      'Бұл бөлімге әлі ештеңе сәйкес келмейді. Басқа қойындыны қолданып көріңіз немесе кітапхана синхрондауы аяқталғаннан кейін қайта оралыңыз.';

  @override
  String get audiobooks => 'Аудиокітаптар';

  @override
  String noLabelFound(String label) {
    return '$label табылмады';
  }

  @override
  String get folder => 'Қалта';

  @override
  String get filters => 'Сүзгілер';

  @override
  String get readingStatus => 'Оқу күйі';

  @override
  String get playedStatus => 'Ойналған күй';

  @override
  String get readStatus => 'Оқы';

  @override
  String get watched => 'Қаралған';

  @override
  String get unread => 'Оқылмаған';

  @override
  String get unwatched => 'Қаралмаған';

  @override
  String get seriesStatus => 'Серия күйі';

  @override
  String get allLibraries => 'Барлық кітапханалар';

  @override
  String get books => 'Кітаптар';

  @override
  String get latestBooks => 'Соңғы кітаптар';

  @override
  String get latestAudiobooks => 'Соңғы аудиокітаптар';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кітап',
      one: '$count кітап',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Кітап';

  @override
  String get bookFormatAudiobook => 'Аудиокітап';

  @override
  String bookPercentRead(int percent) {
    return '$percent% оқылды';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time қалды';
  }

  @override
  String get bookHeroRead => 'Оқу';

  @override
  String get bookHeroListen => 'Тыңдау';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Белгісіз автор';

  @override
  String get uncategorized => 'Санатсыз';

  @override
  String get overview => 'Шолу';

  @override
  String get noLibrivoxDescription =>
      'Бұл тақырып үшін LibriVox әлі сипаттама бермеген.';

  @override
  String get readers => 'Оқырмандар';

  @override
  String get openLinks => 'Сілтемелерді ашу';

  @override
  String get librivoxPage => 'LibriVox беті';

  @override
  String get internetArchive => 'Интернет мұрағаты';

  @override
  String get rssFeed => 'RSS арнасы';

  @override
  String get downloadZip => 'Zip жүктеп алыңыз';

  @override
  String sectionCountLabel(int count) {
    return '$count бөлім';
  }

  @override
  String firstPublished(int year) {
    return 'Алғаш $year жылы жарық көрген';
  }

  @override
  String get noOpenLibraryOverview =>
      'Бұл тақырып үшін Open Library шолу әлі жоқ.';

  @override
  String get subjects => 'Тақырыптар';

  @override
  String get all => 'Барлығы';

  @override
  String booksCount(int count) {
    return '$count кітап';
  }

  @override
  String get couldNotLoadSubject =>
      'Бұл тақырыпты дәл қазір жүктеу мүмкін емес.';

  @override
  String get audiobookDetails => 'Аудиокітап туралы мәліметтер';

  @override
  String authorsCountTitle(int count) {
    return '$count Автор';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудиокітап',
      one: '$count аудиокітап',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Трек тізімі';

  @override
  String get itemListPlaceholder => 'Элемент тізімі осы жерде пайда болады';

  @override
  String get failedToLoad => 'Жүктелмеді';

  @override
  String get delete => 'Жою';

  @override
  String get save => 'Сақтау';

  @override
  String get moreLikeThis => 'Осыған ұқсас';

  @override
  String get castAndCrew => 'Рөлдер және түсірілім тобы';

  @override
  String get collection => 'Жинақ';

  @override
  String get episodes => 'Эпизодтар';

  @override
  String get nextUp => 'Келесі';

  @override
  String get seasons => 'Маусымдар';

  @override
  String get chapters => 'тараулар';

  @override
  String get features => 'Ерекше өзгешеліктері';

  @override
  String get movies => 'Фильмдер';

  @override
  String get musicVideos => 'Музыкалық бейнелер';

  @override
  String get other => 'Басқа';

  @override
  String get discography => 'Дискография';

  @override
  String get similarArtists => 'Ұқсас суретшілер';

  @override
  String get tableOfContents => 'Мазмұны';

  @override
  String get tracklist => 'Трек тізімі';

  @override
  String discNumber(int number) {
    return '$number-диск';
  }

  @override
  String get biography => 'Өмірбаяны';

  @override
  String get authorDetails => 'Автор туралы мәліметтер';

  @override
  String get noOverviewAvailable => 'Бұл тақырыпқа шолу әлі жоқ.';

  @override
  String get noBiographyAvailable => 'Бұл автордың өмірбаяны жоқ.';

  @override
  String get noBooksFound => 'Бұл авторға арналған кітаптар табылмады.';

  @override
  String get unableToLoadAuthorDetails =>
      'Дәл қазір автор туралы мәліметтерді жүктеу мүмкін емес.';

  @override
  String published(int year) {
    return '$year жылы жарық көрген';
  }

  @override
  String get publicationDateUnknown => 'Жарияланатын күні белгісіз';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Маусым',
      one: '$count Маусым',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time аяқталады';
  }

  @override
  String get items => 'Элементтер';

  @override
  String get extras => 'Қосымшалар';

  @override
  String get behindTheScenes => 'Сахна артында';

  @override
  String get deletedScenes => 'Жойылған көріністер';

  @override
  String get featurettes => 'Қысқа сюжеттер';

  @override
  String get interviews => 'Сұхбаттар';

  @override
  String get scenes => 'Көріністер';

  @override
  String get shorts => 'Қысқаметражды фильмдер';

  @override
  String get trailers => 'Трейлерлер';

  @override
  String timeRemaining(String time) {
    return '$time қалды';
  }

  @override
  String endsIn(String time) {
    return '$time кейін аяқталады';
  }

  @override
  String get view => 'Көру';

  @override
  String get resumeReading => 'Оқуды жалғастыру';

  @override
  String get read => 'Оқы';

  @override
  String resumeFrom(String position) {
    return '$position орнынан жалғастыру';
  }

  @override
  String get play => 'Ойнату';

  @override
  String get startOver => 'Қайтадан бастау';

  @override
  String get restart => 'Қайтадан қосу';

  @override
  String get readOffline => 'Офлайн оқу';

  @override
  String get playOffline => 'Офлайн ойнаңыз';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Субтитрлер';

  @override
  String get version => 'Нұсқа';

  @override
  String get cast => 'Трансляциялау';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Трейлер';

  @override
  String get finished => 'Аяқталды';

  @override
  String get favorited => 'Таңдаулы';

  @override
  String get favorite => 'Таңдаулы';

  @override
  String get playlist => 'Ойнату тізімі';

  @override
  String get downloaded => 'Жүктеп алынды';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Барлығын жүктеп алыңыз';

  @override
  String get download => 'Жүктеп алу';

  @override
  String get deleteDownloaded => 'Жүктеп алынғанды ​​жою';

  @override
  String get goToSeries => 'Серияға өтіңіз';

  @override
  String get editMetadata => 'Метадеректерді өңдеу';

  @override
  String get less => 'Аздау';

  @override
  String get more => 'Көбірек';

  @override
  String get deleteItem => 'Элементті жою';

  @override
  String get deletePlaylist => 'Ойнату тізімін жою';

  @override
  String get deletePlaylistMessage =>
      'Бұл ойнату тізімін серверден жою керек пе?';

  @override
  String get deleteItemMessage => 'Бұл элементті серверден жою керек пе?';

  @override
  String get failedToDeletePlaylist => 'Ойнату тізімін жою мүмкін болмады';

  @override
  String get failedToDeleteItem => 'Элементті жою мүмкін болмады';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Ойнату тізімінің атын өзгерту';

  @override
  String get playlistName => 'Ойнату тізімінің аты';

  @override
  String get deleteDownloadedAlbum => 'Жүктеп алынған альбомды жою';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '«$title» үшін жүктелген тректер жойылсын ба?';
  }

  @override
  String get downloadedTracksDeleted => 'Жүктеп алынған тректер жойылды';

  @override
  String get downloadedTracksDeleteFailed =>
      'Кейбір жүктеп алынған тректерді жою мүмкін болмады';

  @override
  String get noTracksLoaded => 'Жүктелген тректер жоқ';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel жүктелмеген';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title жүктелуде ($count элемент)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '«$name» серверден жойылсын ба? Бұл әрекетті қайтару мүмкін емес.';
  }

  @override
  String get itemDeleted => 'Элемент жойылды';

  @override
  String get noPlayableTrailerFound => 'Ойналатын трейлер табылмады.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Қолдау көрсетілмейтін кітап пішімі: .$extension';
  }

  @override
  String get audioTrack => 'Аудио трек';

  @override
  String get subtitleTrack => 'Субтитр жолы';

  @override
  String get none => 'Жоқ';

  @override
  String get downloadSubtitlesLabel => 'Субтитрлерді жүктеп алу...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles плагинін пайдаланып іздеңіз';

  @override
  String get downloadSubtitles => 'Субтитрлерді жүктеп алыңыз';

  @override
  String get selectedSubtitleInvalid => 'Таңдалған субтитр жарамсыз.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Субтитр жүктелді және таңдалды: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитр жүктеп алынды. Jellyfin элементті жаңартқанда пайда болуына біраз уақыт кетуі мүмкін.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language тілі үшін қашықтағы субтитрлер табылмады.';
  }

  @override
  String get selectVersion => 'Нұсқа таңдаңыз';

  @override
  String versionNumber(int number) {
    return '$number-нұсқа';
  }

  @override
  String get downloadAllQuality => 'Барлығын жүктеп алу — сапалы';

  @override
  String get downloadQuality => 'Жүктеп алу сапасы';

  @override
  String get originalFileNoReencoding => 'Түпнұсқа файл, қайта кодтау жоқ';

  @override
  String get originalFilesNoReencoding => 'Түпнұсқа файлдар, қайта кодтау жоқ';

  @override
  String get noEpisodesLoaded => 'Жүктелген эпизодтар жоқ';

  @override
  String downloadingItem(String name, String quality) {
    return '$name жүктелуде ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Жүктелген файлдарды жою';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel үшін жергілікті файлдар жойылсын ба?\n\nБұл жад орнын босатады. Кейінірек қайта жүктей аласыз.';
  }

  @override
  String get downloadedFilesDeleted => 'Жүктеп алынған файлдар жойылды';

  @override
  String get failedToDeleteFiles => 'Файлдарды жою мүмкін болмады';

  @override
  String get deleteFiles => 'Файлдарды жою';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get directors => 'РЕЖИССЁРЛЕР';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТЕР';

  @override
  String get studio => 'СТУДИЯ';

  @override
  String studioMoreCount(int count) {
    return '+$count тағы';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Эпизод';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number-эпизод';
  }

  @override
  String chapterNumber(int number) {
    return '$number-тарау';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count трек',
      one: '$count трек',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тарау',
      one: '$count тарау',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Туған күні: $date';
  }

  @override
  String died(String date) {
    return 'Қайтыс болған күні: $date';
  }

  @override
  String age(int age) {
    return 'Жасы: $age';
  }

  @override
  String get showLess => 'Аз көрсету';

  @override
  String get readMore => 'Толығырақ оқу';

  @override
  String get shuffle => 'Араластыру';

  @override
  String get shuffleAllMusic => 'Барлық музыканы араластыру';

  @override
  String get carSignInPrompt => 'Телефоныңызда Moonfin-ге кіріңіз';

  @override
  String get carServerUnreachable => 'Серверге қосылу мүмкін емес';

  @override
  String downloadsCount(int count) {
    return '$count жүктеу';
  }

  @override
  String get perfectMatch => 'Керемет сәйкестік';

  @override
  String channelsCount(int count) {
    return '$count арна';
  }

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Қашықтағы субтитрді $action үшін бұл пайдаланушыға Jellyfin субтитрлерін басқару рұқсаты қажет.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Қашықтағы субтитрді $action үшін бұл элемент серверде табылмады.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Қашықтағы субтитрді $action орындалмады: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Қашықтағы субтитрді $action орындалмады (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Қашықтағы субтитрлерді $action мүмкін болмады.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '«$name» үшін жүктелген барлық эпизодтар';
  }

  @override
  String get deleteSeasonFiles =>
      'осы маусымдағы барлық жүктеп алынған эпизодтар';

  @override
  String get stillWatching => 'Әлі қарайсыз ба?';

  @override
  String get unableToLoadTrailerStream => 'Трейлер ағынын жүктеу мүмкін емес.';

  @override
  String get trailerTimedOut =>
      'Жүктеу кезінде трейлердің күту уақыты аяқталды.';

  @override
  String get playbackFailedForTrailer => 'Бұл трейлер ойнатылмады.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Офлайн ойнату кезінде трансляциялау мүмкін емес.';

  @override
  String castActionFailed(String label, String error) {
    return '$label әрекеті орындалмады: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Cast дыбыс деңгейін орнату мүмкін болмады: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label басқару элементтері';
  }

  @override
  String get deviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get unavailable => 'Қолжетімсіз';

  @override
  String get pause => 'Кідірту';

  @override
  String get syncPosition => 'Синхрондау орны';

  @override
  String stopCast(String label) {
    return '$label тоқтату';
  }

  @override
  String get queueIsEmpty => 'Кезек бос';

  @override
  String trackNumber(int number) {
    return '$number-трек';
  }

  @override
  String get remotePlayback => 'Қашықтан ойнату';

  @override
  String get castingToGoogleCast => 'Google Cast қызметіне трансляциялау';

  @override
  String get castingViaAirPlay => 'AirPlay арқылы трансляциялау';

  @override
  String get castingViaDlna => 'DLNA арқылы трансляция';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get longPressToUnlock => 'Құлыпты ашу үшін ұзақ басыңыз';

  @override
  String get off => 'Өшірулі';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Авто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Бит жылдамдығын қайта анықтау';

  @override
  String get audioDelay => 'Дыбыс кідірісі';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
  }

  @override
  String get subtitleDelay => 'Субтитрді кешіктіру';

  @override
  String get reset => 'Қалпына келтіру';

  @override
  String get unknown => 'Белгісіз';

  @override
  String get playbackInformation => 'Ойнату туралы ақпарат';

  @override
  String get playback => 'Ойнату';

  @override
  String get playMethod => 'Ойын әдісі';

  @override
  String get directPlay => 'Тікелей ойнату';

  @override
  String get directStream => 'Тікелей ағын';

  @override
  String get transcoding => 'Транскодтау';

  @override
  String get transcodeReasons => 'Транскодтың себептері';

  @override
  String get player => 'Ойнатқыш';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Бит жылдамдығы';

  @override
  String get video => 'Бейне';

  @override
  String get resolution => 'Ажыратымдылық';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Бейне бит жылдамдығы';

  @override
  String get track => 'Трек';

  @override
  String get channels => 'Арналар';

  @override
  String get audioBitrate => 'Аудио бит жылдамдығы';

  @override
  String get sampleRate => 'Үлгі жылдамдығы';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Сыртқы';

  @override
  String get embedded => 'Ендірілген';

  @override
  String castSessionError(String protocol) {
    return '$protocol сеансының қатесі';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Кітап мәліметтерін жүктеу мүмкін болмады: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Қолданбада EPUB көрсету бұл платформада әлі қолжетімді емес.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Бұл пішім (.$extension) қолданбада әзірге көрсетілмейді.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Бұл платформада ендірілген құжатты көрсету мүмкін емес.';

  @override
  String get couldNotOpenExternalViewer =>
      'Сыртқы қарау құралын ашу мүмкін болмады.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Кірістірілген оқу құралын ашу мүмкін болмады: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label орнында бетбелгі бұрыннан сақталған.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Бетбелгі қосылды: $label';
  }

  @override
  String get noBookmarksYet =>
      'Әлі бетбелгілер жоқ.\nОрныңызды сақтау үшін оқу кезінде бетбелгі белгішесін түртіңіз.';

  @override
  String get noTableOfContentsAvailable => 'Мазмұны жоқ';

  @override
  String pageLabel(int number) {
    return '$number-бет';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Кітап оқу құралы';

  @override
  String formatExtension(String extension) {
    return 'Пішім: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% оқылды';
  }

  @override
  String get updating => 'Жаңарту...';

  @override
  String get markUnread => 'Оқылмаған деп белгілеу';

  @override
  String get markAsRead => 'Оқылған деп белгілеңіз';

  @override
  String get reloadReader => 'Оқу құралын қайта жүктеңіз';

  @override
  String get noPagesFound => 'Ешбір бет табылмады.';

  @override
  String get failedToDecodePageImage => 'Бет кескінін декодтау мүмкін болмады.';

  @override
  String resetZoom(String zoom) {
    return 'Масштабты ысыру (${zoom}x)';
  }

  @override
  String get singlePage => 'Бір бет';

  @override
  String get twoPageSpread => 'Екі беттік тарату';

  @override
  String get addBookmark => 'Бетбелгі қосу';

  @override
  String get bookmarksEllipsis => 'Бетбелгілер...';

  @override
  String get markedAsRead => 'Оқылған деп белгіленген';

  @override
  String get markedAsUnread => 'Оқылмаған деп белгіленді';

  @override
  String failedToUpdateReadState(String error) {
    return 'Оқылу күйін жаңарту мүмкін болмады: $error';
  }

  @override
  String get themeSystem => 'Тақырыбы: Жүйе';

  @override
  String get themeLight => 'Тақырыбы: Жарық';

  @override
  String get themeDark => 'Тақырыбы: Қараңғы';

  @override
  String get themeSepia => 'Тақырыбы: Сепия';

  @override
  String get invertColorsFixedLayout =>
      'Түстерді инверттеу (бекітілген орналасу)';

  @override
  String get invertColorsPdf => 'Түстерді өзгерту (PDF)';

  @override
  String get preparingInAppReader => 'Қолданбадағы оқу құралы дайындалуда...';

  @override
  String get pdfDataNotAvailable => 'PDF деректері қолжетімді емес.';

  @override
  String get readerFallbackModeActive =>
      'Оқырманның қалпына келтіру режимі белсенді';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Бұл платформа $extension файлдары үшін кірістірілген құжат жүйесін іске қоса алмайды.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Қолдау көрсетілетін платформа мақсатына (Android, iOS, macOS) ауысқаннан кейін Reload Reader бағдарламасын пайдаланыңыз.';

  @override
  String get openExternally => 'Сырттай ашу';

  @override
  String get noEpubChaptersFound => 'EPUB тараулары табылмады.';

  @override
  String get readerNotReady => 'Оқырман дайын емес.';

  @override
  String get seriesRecordings => 'Сериялық жазбалар';

  @override
  String get now => 'Қазір';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Жаңалықтар';

  @override
  String get kids => 'Балалар';

  @override
  String get premiere => 'Премьера';

  @override
  String get guideTimeline => 'Нұсқаулық хронологиясы';

  @override
  String failedToLoadGuide(String error) {
    return 'Бағдарламаны жүктеу мүмкін болмады: $error';
  }

  @override
  String get noChannelsFound => 'Ешбір арна табылмады';

  @override
  String get liveBadge => 'ТІКЕЛЕЙ ЭФИР';

  @override
  String guideNextProgram(String time, String title) {
    return 'Келесі: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes мин қалды';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours сағ қалды';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours сағ $minutes мин қалды';
  }

  @override
  String get movie => 'Фильм';

  @override
  String get removedFromFavoriteChannels => 'Таңдаулы арналардан жойылды';

  @override
  String get addedToFavoriteChannels => 'Таңдаулы арналарға қосылды';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Таңдаулы арнаны жаңарту мүмкін болмады';

  @override
  String get unfavoriteChannel => 'Таңдаулы емес арна';

  @override
  String get favoriteChannel => 'Сүйікті арна';

  @override
  String get record => 'Жазу';

  @override
  String get cancelRecordingAction => 'Жазуды болдырмау';

  @override
  String get programSetToRecord => 'Бағдарлама жазуға қойылды';

  @override
  String get recordingCancelled => 'Жазу болдырылмады';

  @override
  String get unableToCreateRecording => 'Жазу жасау мүмкін болмады';

  @override
  String get watch => 'Қарау';

  @override
  String get close => 'Жабу';

  @override
  String failedToPlayChannel(String name) {
    return '$name ойнату мүмкін болмады';
  }

  @override
  String get failedToLoadRecordings => 'Жазбалар жүктелмеді';

  @override
  String get scheduledInNext24Hours => 'Келесі 24 сағатта жоспарланған';

  @override
  String get recentRecordings => 'Соңғы жазбалар';

  @override
  String get tvSeries => 'Телехикая';

  @override
  String get failedToLoadSchedule => 'Кесте жүктелмеді';

  @override
  String get noScheduledRecordings => 'Жоспарланған жазбалар жоқ';

  @override
  String get cancelRecording => 'Жазуды тоқтату керек пе?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '«$name» жоспарланған жазуы болдырылмасын ба?';
  }

  @override
  String get no => 'Жоқ';

  @override
  String get yesCancel => 'Иә, Бас тарту';

  @override
  String get failedToCancelRecording => 'Жазудан бас тарту мүмкін болмады';

  @override
  String get failedToLoadSeriesRecordings => 'Сериялық жазбалар жүктелмеді';

  @override
  String get noSeriesRecordings => 'Сериялық жазбалар жоқ';

  @override
  String get cancelSeriesRecording => 'Сериялық жазудан бас тарту';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Сериялық жазудан бас тарту керек пе?';

  @override
  String stopRecordingName(String name) {
    return '«$name» жазуы тоқтатылсын ба?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Сериялық жазудан бас тарту мүмкін болмады';

  @override
  String get searchThisLibrary => 'Осы кітапхананы іздеу...';

  @override
  String get searchEllipsis => 'Іздеу...';

  @override
  String noResultsForQuery(String query) {
    return '«$query» бойынша нәтиже жоқ';
  }

  @override
  String searchFailedError(String error) {
    return 'Іздеу орындалмады: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr тіркелгі түрі';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Жергілікті';

  @override
  String get savedMedia => 'Сақталған медиа';

  @override
  String get tvShows => 'Телешоулар';

  @override
  String get music => 'Музыка';

  @override
  String get musicAlbums => 'Музыкалық альбомдар';

  @override
  String get noMediaInFilter => 'Бұл сүзгіде медиа жоқ';

  @override
  String get noDownloadedMediaYet => 'Жүктеп алынған медиа әлі жоқ';

  @override
  String get browseLibrary => 'Кітапхананы шолу';

  @override
  String get deleteDownload => 'Жүктеп алуды жою';

  @override
  String removeItemAndFiles(String name) {
    return '«$name» және оның файлдары жойылсын ба?';
  }

  @override
  String tracksCount(int count) {
    return '$count трек';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Альбомды ойнату';

  @override
  String failedToLoadAlbum(String error) {
    return 'Альбомды жүктеу мүмкін болмады: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name үшін жүктелген тректер табылмады.';
  }

  @override
  String get season => 'Маусым';

  @override
  String get errorLoadingEpisodes => 'Эпизодтарды жүктеу қатесі';

  @override
  String get noDownloadedEpisodes => 'Жүктеп алынған эпизодтар жоқ';

  @override
  String get deleteEpisode => 'Эпизодты жою';

  @override
  String removeName(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'М$season Э$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number-эпизод';
  }

  @override
  String get seriesNotFound => 'Серия табылмады';

  @override
  String get errorLoadingSeries => 'Серияларды жүктеу қатесі';

  @override
  String get downloadedEpisodes => 'Жүктеп алынған эпизодтар';

  @override
  String seasonNumber(int number) {
    return '$number-маусым';
  }

  @override
  String seasonChip(int number) {
    return 'М$number';
  }

  @override
  String get specials => 'Ерекшеліктер';

  @override
  String get deleteSeason => 'Маусымды жою';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season ішіндегі барлық жүктелген эпизодтар жойылсын ба?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count эпизод',
      one: '$count эпизод',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Сақтауды басқару';

  @override
  String get storageBreakdown => 'Жадтың бұзылуы';

  @override
  String get downloadedItems => 'Жүктеп алынған элементтер';

  @override
  String get storageLimit => 'Сақтау шегі';

  @override
  String get noLimit => 'Шектеу жоқ';

  @override
  String get deleteAllDownloads => 'Барлық жүктеулерді жою';

  @override
  String get deleteAllDownloadsWarning =>
      'Бұл барлық жүктелген медиа файлдарды жояды және оны қайтару мүмкін емес.';

  @override
  String get deleteAll => 'Барлығын жою';

  @override
  String get deleteSelected => 'Таңдалғанды ​​жою';

  @override
  String deleteSelectedCount(int count) {
    return '$count жүктелген элемент жойылсын ба?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка және аудиокітаптар';

  @override
  String get images => 'Суреттер';

  @override
  String get database => 'Мәліметтер қоры';

  @override
  String ofStorageLimit(String limit) {
    return '$limit шегінен';
  }

  @override
  String get settings => 'Параметрлер';

  @override
  String get authentication => 'Аутентификация';

  @override
  String get autoLoginServerManagement =>
      'Автоматты түрде кіру, серверді басқару';

  @override
  String get pinCode => 'PIN коды';

  @override
  String get setUpPinCodeProtection => 'PIN кодты қорғауды орнатыңыз';

  @override
  String get parentalControls => 'Ата-ана бақылауы';

  @override
  String get contentRatingRestrictions => 'Мазмұнды бағалауға шектеулер';

  @override
  String get bitRateResolutionBehavior =>
      'Бит жылдамдығы, ажыратымдылық, мінез-құлық';

  @override
  String get languageSizeAppearance => 'Тілі, көлемі, сыртқы түрі';

  @override
  String get qualityStorage => 'Сапа, сақтау';

  @override
  String get serverSyncAndPluginStatus =>
      'Серверді синхрондау және плагин күйі';

  @override
  String get mediaRequestIntegration => 'Медиа сұранысты біріктіру';

  @override
  String get switchServer => 'Серверді ауыстыру';

  @override
  String get signOut => 'Шығу';

  @override
  String get versionLicenses => 'Нұсқа, лицензиялар';

  @override
  String get account => 'Есептік жазба';

  @override
  String get signInAndSecurity => 'Жүйеге кіру және қауіпсіздік';

  @override
  String get administration => 'Әкімшілік';

  @override
  String get serverSettingsUsersLibraries =>
      'Сервер параметрлері, пайдаланушылар, кітапханалар';

  @override
  String get customization => 'Баптау';

  @override
  String get themeAndLayout => 'Тақырып және орналасу';

  @override
  String get videoAndSubtitles => 'Бейне және субтитрлер';

  @override
  String get integrations => 'Интеграциялар';

  @override
  String get pluginAndRequests => 'Плагин және сұраулар';

  @override
  String get customizeAccountPlaybackInterface =>
      'Тіркелгіні, ойнатуды және интерфейс әрекетін теңшеңіз';

  @override
  String optionsCount(int count) {
    return '$count параметр';
  }

  @override
  String get themeAndAppearance => 'Тақырып және сыртқы түрі';

  @override
  String get focusBorderColor => 'Жиек түсі';

  @override
  String get watchedIndicators => 'Қаралған көрсеткіштер';

  @override
  String get always => 'Әрқашан';

  @override
  String get hideUnwatched => 'Қаралмағандарды жасыру';

  @override
  String get episodesOnly => 'Тек эпизодтар';

  @override
  String get never => 'Ешқашан';

  @override
  String get focusExpansionAnimation => 'Фокусты кеңейту анимациясы';

  @override
  String get desktopUiScale =>
      'Жұмыс үстелінің пайдаланушы интерфейсі масштабы';

  @override
  String get scaleFocusedCards =>
      'Фокусталған немесе жылжытылған карталар мен тақтайшаларды масштабтаңыз';

  @override
  String get backgroundBackdrops => 'Фондық фон';

  @override
  String get showBackdropImages => 'Мазмұнның артындағы фон суреттерін көрсету';

  @override
  String get seriesThumbnails => 'Нобайлар сериясы';

  @override
  String get seriesThumbnailsDescription =>
      'Тек эпизодтар: әр жол кескін түріне сәйкес келетін сериялық өнер туындысын пайдаланыңыз';

  @override
  String get homeRowInfoOverlay => 'Басты жол ақпаратының қабаттасуы';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Негізгі жолдарды шолу кезінде тақырып пен метадеректерді көрсету';

  @override
  String get clockDisplay => 'Сағат дисплейі';

  @override
  String get inMenus => 'Мәзірлерде';

  @override
  String get inVideo => 'Бейнеде';

  @override
  String get seasonalEffects => 'Маусымдық әсерлер';

  @override
  String get seasonalEffectsDescription =>
      'Көрнекі әсерлер және маусымдық декорациялар';

  @override
  String get snow => 'Қар';

  @override
  String get fireworks => 'Отшашу';

  @override
  String get confetti => 'Конфетти';

  @override
  String get fallingLeaves => 'Жапырақтардың түсуі';

  @override
  String get themeMusic => 'Тақырыптық музыка';

  @override
  String get playThemeMusicOnDetailPages =>
      'Тақырыптық музыканы егжей-тегжейлі беттерде ойнатыңыз';

  @override
  String get themeMusicVolume => 'Тақырыптық музыка көлемі';

  @override
  String get themeMusicSettingsSubtitle =>
      'Мәліметтер беттері, негізгі бет жолдары және дыбыс деңгейі';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Негізгі қатарлардағы тақырыптық музыка';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Негізгі экранды шолу кезінде ойнату';

  @override
  String get loopThemeMusic => 'Тақырыптық музыканы қайталау';

  @override
  String get loopThemeMusicSubtitle =>
      'Тректі бір рет ойнатудың орнына циклмен қайталау';

  @override
  String get detailsBackgroundBlur => 'Мәліметтер Фонды бұлыңғырлау';

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
    return '$value пикс';
  }

  @override
  String get browsingBackgroundBlur => 'Шолуда фондық бұлыңғыр';

  @override
  String get maxStreamingBitrate => 'Ағынның максималды бит жылдамдығы';

  @override
  String get maxResolution => 'Максималды ажыратымдылық';

  @override
  String get playerZoomMode => 'Ойыншының масштабтау режимі';

  @override
  String get settingsScrollWheelAction => 'Тінтуір дөңгелегі';

  @override
  String get settingsScrollWheelActionDescription =>
      'Ойнату кезінде бейне үстінде тінтуір дөңгелегін айналдыру не істейтінін таңдаңыз.';

  @override
  String get scrollWheelActionOff => 'Өшірулі';

  @override
  String get scrollWheelActionSeek => 'Айналдыру (алға / артқа)';

  @override
  String get scrollWheelActionVolume => 'Дыбыс деңгейі';

  @override
  String get playerTooltipVolume => 'Дыбыс деңгейі';

  @override
  String get fit => 'Сәйкес';

  @override
  String get autoCrop => 'Автоматты қию';

  @override
  String get stretch => 'Созылу';

  @override
  String get refreshRateSwitching => 'Жаңарту жылдамдығын ауыстыру';

  @override
  String get disabled => 'Өшірілген';

  @override
  String get scaleOnTv => 'Теледидарда масштабтау';

  @override
  String get scaleOnDevice => 'Құрылғыдағы масштабтау';

  @override
  String get trickPlay => 'Трик ойнау';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Іздеу кезінде алдын ала қарау нобайларын көрсетіңіз';

  @override
  String get showDescriptionOnPause => 'Сипаттаманы кідіртуде көрсету';

  @override
  String get dimVideoShowOverview =>
      'Бейнені күңгірттеңіз және кідірту кезінде шолу мәтінін көрсетіңіз';

  @override
  String get osdLockButton => 'OSD құлыптау түймесі';

  @override
  String get osdLockButtonDescription =>
      'Ұзақ басылғанша сенсорлық енгізуді блоктайтын құлыптау түймесін көрсетіңіз';

  @override
  String get audioBehavior => 'Аудио мінез-құлық';

  @override
  String get downmixToStereo => 'Стереоға дейін араластырыңыз';

  @override
  String get defaultAudioLanguage => 'Әдепкі аудио тілі';

  @override
  String get fallbackAudioLanguage => 'Резервтік аудио тілі';

  @override
  String get preferDefaultAudioTrack => 'Әдепкі аудиотрек таңдалсын';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Локализацияланған дубляждың орнына түпнұсқа аудиотректі таңдау.';

  @override
  String get preferAudioDescription => 'Аудиосипаттама тректері таңдалсын';

  @override
  String get preferAudioDescriptionDescription =>
      'Қарапайым тректердің орнына аудиосипаттама тректерін таңдау.';

  @override
  String get transcodingAudio => 'Транскодтау (аудио)';

  @override
  String get directStreamRemux => 'Тікелей ағын (ремукс)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскодтау (битрейт немесе ажыратымдылық)';

  @override
  String get transcodingVideoAndAudio => 'Транскодтау (бейне және аудио)';

  @override
  String get transcodingVideo => 'Транскодтау (бейне)';

  @override
  String get autoServerDefault => 'Авто (Сервердің әдепкі)';

  @override
  String get english => 'Ағылшын';

  @override
  String get spanish => 'испан';

  @override
  String get french => 'француз';

  @override
  String get german => 'неміс';

  @override
  String get italian => 'итальян';

  @override
  String get portuguese => 'португал';

  @override
  String get japanese => 'жапон';

  @override
  String get korean => 'корей';

  @override
  String get chinese => 'қытай';

  @override
  String get russian => 'орыс';

  @override
  String get arabic => 'араб';

  @override
  String get hindi => 'хинди';

  @override
  String get dutch => 'голланд';

  @override
  String get swedish => 'швед';

  @override
  String get norwegian => 'норвег';

  @override
  String get danish => 'дат';

  @override
  String get finnish => 'фин';

  @override
  String get polish => 'поляк';

  @override
  String get ac3Passthrough => 'AC3 өту жолы';

  @override
  String get dtsPassthrough => 'DTS өту жолы';

  @override
  String get trueHdSupport => 'TrueHD қолдауы';

  @override
  String get enableDtsPassthrough =>
      'DTS дыбысының биттік ағыны тек AVR үшін; ресивер қолдауын және DTS бастапқы жолын қажет етеді';

  @override
  String get enableTrueHdAudio =>
      'TrueHD дыбысын қосу (барлық платформаларда жұмыс істемеуі мүмкін)';

  @override
  String get settingsAudioOutputMode => 'Аудио шығысының режимі';

  @override
  String get settingsAudioOutputModeDescription =>
      'Аудионың қалай декодталатынын таңдаңыз. AVR Passthrough өңделмеген Dolby/DTS ағындарын ресиверіңізге жібереді, ал «Авто» мен «Араластыру» жергілікті түрде декодтайды.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Резервтік аудиокодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Бастапқы ағынды тікелей ойнату немесе транзитпен жіберу мүмкін болмағанда, көпарналы аудионы транскодтайтын мақсатты пішімді таңдаңыз.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Автоанықтау\n(ұсынылады)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(әдепкі)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(шығынсыз)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(тек стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(үнемді)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(шығынсыз)';

  @override
  String get settingsMaxAudioChannels => 'Ең көп аудиоарна';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Аудиожүйеңіздің ең көп арна санын реттеңіз. Осы шектен асатын көпарналы ағындар араластырылады немесе транскодталады.';

  @override
  String get settingsMaxAudioChannelsAuto => 'Автоанықтау\n(жабдық әдепкісі)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрофониялық';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Көлемді дыбыс';

  @override
  String get settingsAudioPassthroughAdvanced => 'Транзит (кеңейтілген)';

  @override
  String get settingsAudioCodecPassthrough => 'Кодек транзиті';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Тек AVR немесе HDMI қабылдағышыңыз қолдайтын пішімдерді қосыңыз.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 транзиті';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) транзиті';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core транзиті';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA транзиті';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD транзиті';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos транзиті';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) битағынын сыртқы декодерге жіберу.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) арқылы Dolby Atmos битағынын сыртқы декодерге жіберу.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS Core қоса) битағынын сыртқы декодерге жіберу.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos метадеректері бар Dolby TrueHD битағынын сыртқы декодерге жіберу.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Анықталған аудио мүмкіндіктері';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Орындалу кезіндегі мүмкіндіктер туралы дерек әзірге жоқ.';

  @override
  String get settingsAudioRouteLabel => 'Бағыт';

  @override
  String get settingsAudioDecodeLabel => 'Декодтау';

  @override
  String get settingsAudioPassthroughLabel => 'Транзит';

  @override
  String get settingsAudioHdRoute => 'HD аудио бағыты';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Динамик';

  @override
  String get settingsAudioRouteHeadphones => 'Құлаққап';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count арна PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Диагностика';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Бейне деңгейі';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Бейне ауқымы';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Субтитр кодегі';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Рұқсат етілген аудиокодектер';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS аудиокодектері';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 аудиокодектері';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif транзиті';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Белсенді аудио бағыты';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Бағыттың HD аудио қолдауы';

  @override
  String get nightMode => 'Түнгі режим';

  @override
  String get compressDynamicRange => 'Динамикалық диапазонды қысу';

  @override
  String get advancedMpv => 'Жетілдірілген mpv';

  @override
  String get enableCustomMpvConf => 'Custom mpv.conf мүмкіндігін қосыңыз';

  @override
  String get applyMpvConfBeforePlayback =>
      'Ойнату басталғанға дейін пайдаланушы көрсеткен mpv.conf файлын қолданыңыз';

  @override
  String get unsafeAdvancedMpvOptions => 'Қауіпті кеңейтілген mpv опциялары';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv опцияларының кеңірек жинағына рұқсат етіңіз. Ойнату әрекетін бұзуы мүмкін.';

  @override
  String get hardwareDecoding => 'Аппараттық құралдарды декодтау';

  @override
  String get hardwareDecodingSubtitle =>
      'Өнімділікті жақсартуы мүмкін, бірақ кейбір құрылғыларда ойнату мәселелерін тудыруы мүмкін.';

  @override
  String get nextUpAndQueuing => 'Келесі және кезек';

  @override
  String get nextUpDisplay => 'Келесі дисплей';

  @override
  String get extended => 'Ұзартылған';

  @override
  String get minimal => 'Минималды';

  @override
  String get nextUpTimeout => 'Келесі күту уақыты';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing => 'БАҚ кезегі';

  @override
  String get autoQueueNextEpisodes =>
      'Келесі эпизодтарды автоматты түрде кезекке қою';

  @override
  String get stillWatchingPrompt => 'Сұрау әлі де қаралуда';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes эпизодтан / $hours сағаттан кейін';
  }

  @override
  String get resumeAndSkip => 'Жалғастыру және өткізіп жіберу';

  @override
  String get resumeRewind => 'Артқа айналдыруды жалғастыру';

  @override
  String get unpauseRewind => 'Артқа айналдыруды тоқтату';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Артқа ұзындықты өткізіп жіберу';

  @override
  String get skipForwardLength => 'Алға ұзындықты өткізіп жіберу';

  @override
  String get customMpvConfPath => 'Теңшелетін mpv.conf жолы';

  @override
  String get notSetMpvConf =>
      'Орнатылмаған. Moonfin қолданба/деректер қалталарында әдепкі mpv.conf файлын қолданып көреді.';

  @override
  String get selectMpvConf => 'mpv.conf таңдаңыз';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Мәнер параметрлері (өлшем, түс, офсет) мәтінге негізделген субтитрлерге (SRT, VTT, TTML) қолданылады. ASS/SSA субтитрлері \"ASS/SSA Direct Play\" өшірілмейінше, өздерінің кірістірілген стилін пайдаланады. Растрлық субтитрлерді (PGS, DVB, VobSub) қайта стильдеу мүмкін емес.';

  @override
  String get defaultSubtitleLanguage => 'Әдепкі субтитр тілі';

  @override
  String get defaultToNoSubtitles => 'Әдепкі бойынша Субтитрлер жоқ';

  @override
  String get turnOffSubtitlesByDefault =>
      'Әдепкі бойынша субтитрлерді өшіріңіз';

  @override
  String get subtitleSize => 'Субтитр өлшемі';

  @override
  String get textFillColor => 'Мәтінді толтыру түсі';

  @override
  String get backgroundColor => 'Фон түсі';

  @override
  String get textStrokeColor => 'Мәтін штрих түсі';

  @override
  String get subtitleCustomization => 'Субтитрді теңшеу';

  @override
  String get subtitleCustomizationDescription => 'Субтитр көрінісін реттеңіз';

  @override
  String get subtitleMode => 'Субтитр режимі';

  @override
  String get subtitleModeFlagged => 'Белгіленген';

  @override
  String get subtitleModeAlways => 'Әрқашан';

  @override
  String get subtitleModeForeign => 'Шет тіліндегі';

  @override
  String get subtitleModeForced => 'Мәжбүрлі';

  @override
  String get subtitleModeFlaggedDescription =>
      'Медиафайл метадеректерінде «default» немесе «forced» деп белгіленген тректерді ойнатады.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Бейне басталған сайын субтитрлерді автоматты түрде жүктеп көрсетеді.';

  @override
  String get subtitleModeForeignDescription =>
      'Әдепкі аудиотрек шет тілінде болса, субтитрлерді автоматты түрде қосады.';

  @override
  String get subtitleModeForcedDescription =>
      'Тек метадеректерде forced деп белгіленген субтитрлерді жүктейді.';

  @override
  String get subtitleModeNoneDescription =>
      'Субтитрлерді автоматты жүктеуді толығымен өшіреді.';

  @override
  String get fallbackSubtitleLanguage => 'Резервтік субтитр тілі';

  @override
  String get subtitleStream => 'Субтитр ағыны';

  @override
  String get subtitlePreviewText =>
      'Жылдам қоңыр түлкі жалқау иттің үстінен секіреді';

  @override
  String get verticalOffset => 'Тік ығысу';

  @override
  String get pgsDirectPlay => 'PGS тікелей ойнату';

  @override
  String get directPlayPgsSubtitles => 'PGS субтитрлерін тікелей ойнату';

  @override
  String get assSsaDirectPlay => 'ASS/SSA тікелей ойнату';

  @override
  String get directPlayAssSsaSubtitles => 'ASS/SSA субтитрлерін тікелей ойнату';

  @override
  String get white => 'Ақ';

  @override
  String get black => 'Қара';

  @override
  String get yellow => 'Сары';

  @override
  String get green => 'Жасыл';

  @override
  String get cyan => 'Көгілдір';

  @override
  String get red => 'Қызыл';

  @override
  String get transparent => 'Мөлдір';

  @override
  String get semiTransparentBlack => 'Жартылай мөлдір қара';

  @override
  String get global => 'Ғаламдық';

  @override
  String get desktop => 'Жұмыс үстелі';

  @override
  String get mobile => 'Ұялы';

  @override
  String get tv => 'теледидар';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile профилінің параметрлері жүктелді.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile профилінің параметрлерін жүктеу мүмкін болмады.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Жергілікті параметрлер $profile профиліне синхрондалды.';
  }

  @override
  String get customizationProfile => 'Теңшеу профилі';

  @override
  String get customizationProfileDescription =>
      'Жүктеу, өңдеу және синхрондау үшін профильді таңдаңыз. Құрылғы профилі оны қайта анықтамайынша, ғаламдық барлық жерде қолданылады. Жасыл нүкте ағымдағы құрылғы профилін белгілейді.';

  @override
  String get loadProfile => 'Профильді жүктеңіз';

  @override
  String get syncing => 'Синхрондалуда...';

  @override
  String get syncToProfile => 'Профильге синхрондау';

  @override
  String get profileSyncHidden => 'Профильді синхрондау жасырын';

  @override
  String get enablePluginSyncDescription =>
      'Профильді басқару элементтерін осы жерде көрсету үшін Плагин параметрлерінде Сервер плагинін синхрондауды қосыңыз.';

  @override
  String get quality => 'Сапасы';

  @override
  String get defaultDownloadQuality => 'Әдепкі жүктеп алу сапасы';

  @override
  String get network => 'Желі';

  @override
  String get wifiOnlyDownloads => 'Тек WiFi жүктеп алулар';

  @override
  String get reportDownloadsActivity => 'Жүктеулерді серверде көрсету';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Сервер әкімшісіне басқару тақтасында транскодталған жүктеулеріңізді көруге рұқсат ету';

  @override
  String get onlyDownloadOnWifi =>
      'WiFi желісіне қосылған кезде ғана жүктеп алыңыз';

  @override
  String get storage => 'Сақтау';

  @override
  String get storageUsed => 'Қолданылатын сақтау орны';

  @override
  String get manage => 'Басқару';

  @override
  String get calculating => 'Есептелуде...';

  @override
  String get downloadLocation => 'Орын жүктеп алыңыз';

  @override
  String get defaultLabel => 'Әдепкі';

  @override
  String get saveToDownloadsFolder => 'Жүктеулер қалтасына сақтаңыз';

  @override
  String get downloadsVisibleToOtherApps =>
      'Жүктеулер/Moonfin — басқа қолданбаларға көрінеді';

  @override
  String get dangerZone => 'Қауіпті аймақ';

  @override
  String get clearAllDownloads => 'Барлық жүктеп алынғандарды өшіріңіз';

  @override
  String get original => 'Түпнұсқа';

  @override
  String get changeDownloadLocation => 'Жүктеп алу орнын өзгерту';

  @override
  String get changeDownloadLocationDescription =>
      'Жаңа жүктеп алынғандар таңдалған қалтаға сақталады. Бар жүктеп алынған файлдар ағымдағы орнында қалады және оларды Жад параметрлерінен басқаруға болады.';

  @override
  String get confirm => 'Растау';

  @override
  String get cannotWriteToFolder =>
      'Таңдалған қалтаға жазу мүмкін емес. Басқа орынды таңдаңыз немесе сақтау рұқсаттарын беріңіз.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Жүктеулер қалтасына сақтау керек пе?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Жүктеп алынған медиа құрылғыңыздағы Жүктеулер/Moonfin ішіне сақталады. Бұл файлдар галерея немесе музыка ойнатқышы сияқты басқа қолданбаларға көрінеді.\n\nБар жүктеп алынған файлдар ағымдағы орнында қалады.';

  @override
  String get enable => 'Қосу';

  @override
  String get clearAllDownloadsWarning =>
      'Бұл барлық жүктеп алынған медианы жояды және оны кері қайтару мүмкін емес.';

  @override
  String get clearAll => 'Барлығын өшіру';

  @override
  String get navigationStyle => 'Навигация стилі';

  @override
  String get topBar => 'Жоғарғы жолақ';

  @override
  String get leftSidebar => 'Сол жақ бүйірлік тақта';

  @override
  String get showShuffleButton => 'Араластыру түймешігін көрсету';

  @override
  String get showGenresButton => 'Жанрларды көрсету түймесі';

  @override
  String get showFavoritesButton => 'Таңдаулыларды көрсету түймесі';

  @override
  String get showLibrariesInToolbar =>
      'Құралдар тақтасында кітапханаларды көрсету';

  @override
  String get navbarAlwaysExpanded =>
      'Навигация жолағының белгілері әрқашан жайылсын';

  @override
  String get showSeerrButton => 'Seerr түймесін көрсету';

  @override
  String get navbarOpacity => 'Шарлау тақтасының мөлдірлігі';

  @override
  String get navbarColor => 'Шарлау тақтасының түсі';

  @override
  String get gray => 'Сұр';

  @override
  String get darkBlue => 'Қою көк';

  @override
  String get purple => 'Күлгін';

  @override
  String get teal => 'Қызғылт';

  @override
  String get navy => 'Әскери-теңіз күштері';

  @override
  String get charcoal => 'Көмір';

  @override
  String get brown => 'Қоңыр';

  @override
  String get darkRed => 'Қою қызыл';

  @override
  String get darkGreen => 'Қою жасыл';

  @override
  String get slate => 'Шифер';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Кітапхана дисплейі';

  @override
  String get posterLabel => 'Постер';

  @override
  String get thumbnailLabel => 'Нобай';

  @override
  String get bannerLabel => 'Баннер';

  @override
  String get overridePerLibrarySettings =>
      'Әр кітапхана параметрлерін қайта анықтау';

  @override
  String get applyImageTypeToAllLibraries =>
      'Кескін түрін барлық кітапханаларға қолданыңыз';

  @override
  String get multiServerLibraries => 'Көп серверлік кітапханалар';

  @override
  String get showLibrariesFromAllServers =>
      'Барлық қосылған серверлерден кітапханаларды көрсету';

  @override
  String get enableFolderView => 'Қалта көрінісін қосыңыз';

  @override
  String get showFolderBrowsingOption => 'Қалтаны шолу опциясын көрсету';

  @override
  String get groupItemsIntoCollections => 'Элементтерді жинақтарға топтау';

  @override
  String get hideCollectionAssociatedItems =>
      'Кітапханаларды шолу кезінде жинаққа байланысты элементтерді жасыру';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Кітапхананы топтау туралы ескертпе';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Бұл параметрді пайдалану үшін Jellyfin немесе Emby серверіңіздегі кітапхананың «Көрсету» параметрлерінде «Фильмдерді жинақтарға топтау» және/немесе «Сериалдарды жинақтарға топтау» параметрлерінің қосулы екеніне көз жеткізіңіз.';

  @override
  String get libraryVisibility => 'Кітапхананың көрінуі';

  @override
  String get libraryVisibilityDescription =>
      'Әрбір кітапхананың басты бетінің көріну мүмкіндігін ауыстырып-қосқыш. Өзгерістердің күшіне енуі үшін Moonfin қолданбасын қайта іске қосыңыз.';

  @override
  String get showInNavigation => 'Навигацияда көрсету';

  @override
  String get showInLatestMedia => 'Соңғы медиада көрсету';

  @override
  String get sourceLibraries => 'Бастапқы кітапханалар';

  @override
  String get sourceCollections => 'Бастапқы жинақтар';

  @override
  String get excludedGenres => 'Шығарылған жанрлар';

  @override
  String get selectAll => 'Барлығын таңдаңыз';

  @override
  String itemsSelected(int count) {
    return '$count таңдалды';
  }

  @override
  String get mediaBar => 'Медиа жолағы';

  @override
  String get mediaSources => 'БАҚ көздері';

  @override
  String get behavior => 'Мінез-құлық';

  @override
  String get seconds => 'секунд';

  @override
  String get localPreviews => 'Жергілікті алдын ала қараулар';

  @override
  String get localPreviewsDescription =>
      'Трейлер, медиа және аудио алдын ала қарауды конфигурациялаңыз.';

  @override
  String get mediaBarMode => 'Медиа жолақ стилі';

  @override
  String get mediaBarModeDescription =>
      'Түрлі медиа жолақ мәнерлерінің бірін таңдаңыз немесе медиа жолағын өшіріңіз';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Өшірулі';

  @override
  String get enableMediaBar => 'Медиа жолағын қосыңыз';

  @override
  String get showFeaturedContentSlideshow =>
      'Үйде таңдаулы мазмұн слайдшоуын көрсету';

  @override
  String get contentType => 'Мазмұн түрі';

  @override
  String get moviesAndTvShows => 'Фильмдер мен телешоулар';

  @override
  String get moviesOnly => 'Тек фильмдер';

  @override
  String get tvShowsOnly => 'Тек телешоулар';

  @override
  String get itemCount => 'Элемент саны';

  @override
  String get noneSelected => 'Ешқайсысы таңдалмаған';

  @override
  String get noneExcluded => 'Ешқайсысы алынып тасталмаған';

  @override
  String get autoAdvance => 'Автоматты алға жылжыту';

  @override
  String get autoAdvanceSlides => 'Келесі слайдқа автоматты түрде жылжытыңыз';

  @override
  String get autoAdvanceInterval => 'Автоматты ілгерілету аралығы';

  @override
  String get trailerPreview => 'Трейлерді алдын ала қарау';

  @override
  String get autoPlayTrailers =>
      '3 секундтан кейін медиа жолағында трейлерлерді автоматты түрде ойнату';

  @override
  String get trailerAudio => 'Трейлер дыбысы';

  @override
  String get enableTrailerAudio =>
      'Медиажолақтағы трейлерлер үшін дыбысты қосу';

  @override
  String get episodePreview => 'Эпизодты алдын ала қарау';

  @override
  String get mediaPreview => 'Медиа алдын ала қарау';

  @override
  String get episodePreviewDescription =>
      'Фокусталған, меңзердегі немесе ұзақ басылған карталарда 30 секундтық кірістірілген алдын ала қарауды ойнатыңыз';

  @override
  String get mediaPreviewDescription =>
      'Фокусталған, жылжытылған немесе ұзақ басылған карталарда 30 секундтық кірістірілген алдын ала қарауды ойнатыңыз';

  @override
  String get previewAudio => 'Аудионы алдын ала қарау';

  @override
  String get enablePreviewAudio =>
      'Трейлер мен эпизодты алдын ала қарау үшін дыбысты қосыңыз';

  @override
  String get latestMedia => 'Соңғы БАҚ';

  @override
  String get recentlyReleased => 'Жақында шығарылған';

  @override
  String get myMedia => 'Менің медиам';

  @override
  String get myMediaSmall => 'Менің медиам (шағын)';

  @override
  String get continueWatching => 'Көруді жалғастыру';

  @override
  String get resumeAudio => 'Аудионы жалғастыру';

  @override
  String get resumeBooks => 'Түйіндеме кітаптары';

  @override
  String get activeRecordings => 'Белсенді жазбалар';

  @override
  String get playlists => 'Ойнату тізімдері';

  @override
  String get liveTV => 'Тікелей теледидар';

  @override
  String get homeSections => 'Үй бөлімдері';

  @override
  String get resetToDefaults => 'Әдепкі мәндерге қайта орнату';

  @override
  String get homeRowPosterSize => 'Негізгі қатардағы постер өлшемі';

  @override
  String get perRowImageTypeSelection => 'Әр жолдағы кескін түрін таңдау';

  @override
  String get configureImageTypeForEachRow =>
      'Әрбір қосылған басты жол үшін кескін түрін конфигурациялаңыз';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Біріктіру «Көруді жалғастыру» және «Келесі';

  @override
  String get combineBothRows => 'Екі жолды бір үй бөліміне біріктіріңіз';

  @override
  String get fullScreenRows => 'Жайылған негізгі бет жолдары';

  @override
  String get fullScreenRowsDescription =>
      'Негізгі бет жолдарын әр экранға бір жолмен шектеу';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Әр жолдағы кескін түрі';

  @override
  String get perRowSettings => 'Әр жол параметрлері';

  @override
  String get autoLogin => 'Автоматты түрде кіру';

  @override
  String get lastUser => 'Соңғы пайдаланушы';

  @override
  String get currentUser => 'Ағымдағы пайдаланушы';

  @override
  String get alwaysAuthenticate => 'Әрқашан аутентификация';

  @override
  String get requirePasswordWithToken =>
      'Сақталған таңбалауыш болса да құпия сөзді талап етіңіз';

  @override
  String get confirmExit => 'Шығуды растау';

  @override
  String get showConfirmationBeforeExiting =>
      'Шығу алдында растауды көрсетіңіз';

  @override
  String get blockContentWithRatings =>
      'Келесі рейтингтері бар мазмұнды блоктау:';

  @override
  String get noContentRatingsFound =>
      'Бұл серверде әлі мазмұн рейтингтері табылмады.';

  @override
  String get couldNotLoadServerRatings =>
      'Сервер рейтингтерін жүктеу мүмкін болмады. Тек сақталған рейтингтерді көрсету.';

  @override
  String get couldNotRefreshRatings =>
      'Серверден бағалауларды жаңарту мүмкін болмады. Сақталған рейтингтер көрсетілуде.';

  @override
  String get enablePinCode => 'PIN кодын қосыңыз';

  @override
  String get requirePinToAccess =>
      'Тіркелгіңізге кіру үшін PIN кодын талап етіңіз';

  @override
  String get changePin => 'PIN кодын өзгерту';

  @override
  String get setNewPinCode => 'Жаңа PIN кодын орнатыңыз';

  @override
  String get removePin => 'PIN кодын жою';

  @override
  String get removePinProtection => 'PIN кодты қорғауды алып тастаңыз';

  @override
  String get screensaver => 'Скринсейвер';

  @override
  String get inAppScreensaver => 'Қолданба ішіндегі скринсейвер';

  @override
  String get enableBuiltInScreensaver =>
      'Кірістірілген экран сақтағышын қосыңыз';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Кітапхана өнері';

  @override
  String get logo => 'Логотип';

  @override
  String get clock => 'Сағат';

  @override
  String get timeout => 'Үзіліс';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Күңгірттеу деңгейі';

  @override
  String get maxAgeRating => 'Максималды жас рейтингі';

  @override
  String get any => 'Кез келген';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Жас рейтингін талап етеді';

  @override
  String get onlyShowRatedContent => 'Тек бағаланған мазмұнды көрсетіңіз';

  @override
  String get showClock => 'Сағатты көрсету';

  @override
  String get displayClockDuringScreensaver =>
      'Скринсейвер кезінде сағатты көрсету';

  @override
  String get clockModeStatic => 'Тұрақты';

  @override
  String get clockModeBouncing => 'Секіретін';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (сыншылар)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (аудитория)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритикалық';

  @override
  String get metacriticUser => 'Metacritic (пайдаланушы)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Қауымдастық рейтингі';

  @override
  String get ratings => 'Рейтингтер';

  @override
  String get additionalRatings => 'Қосымша рейтингтер';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList және TMDB рейтингтерін көрсету';

  @override
  String get ratingLabels => 'Бағалау белгілері';

  @override
  String get showLabelsNextToIcons =>
      'Бағалау белгішелерінің жанында белгілерді көрсетіңіз';

  @override
  String get ratingBadges => 'Баға белгілері';

  @override
  String get showDecorativeBadges =>
      'Бағалардың артында сәндік белгілерді көрсетіңіз';

  @override
  String get episodeRatings => 'Эпизод рейтингтері';

  @override
  String get showRatingsOnEpisodes =>
      'Жеке эпизодтар бойынша рейтингтерді көрсету';

  @override
  String get ratingSources => 'Бағалау көздері';

  @override
  String get ratingSourcesDescription =>
      'Қолданбада көрсетілген бағалау көздерін қосыңыз және қайта реттеңіз';

  @override
  String get pluginLabel => 'Moonbase плагині';

  @override
  String get pluginDetected => 'Плагин анықталды';

  @override
  String get pluginNotDetected => 'Плагин анықталмады';

  @override
  String get pluginDetectedDescription =>
      'Сервер плагині анықталды. Синхрондау плагин бірінші рет табылған кезде автоматты түрде қосылады.';

  @override
  String get pluginNotDetectedDescription =>
      'Сервер плагині қазір анықталмаған. Жергілікті параметрлер әлі де өздерінің сақталған мәндерін немесе кірістірілген әдепкі параметрлерді пайдаланады.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nНұсқасы: $version';
  }

  @override
  String get availableServices => 'Қолжетімді қызметтер';

  @override
  String get serverPluginSync => 'Сервер плагиндерін синхрондау';

  @override
  String get syncSettingsWithPlugin =>
      'Параметрлерді сервер плагинімен синхрондаңыз';

  @override
  String get whatSyncControls => 'Қандай синхрондауды басқарады';

  @override
  String get syncControlsDescription =>
      'Синхрондау тек плагин қолдайтын параметрлердің серверге итерілуін және серверден алынуын басқарады. Профильді таңдау және профильді синхрондау әрекеттері плагинді синхрондау қосылған кезде Теңшеу параметрлерінде болады.';

  @override
  String get recentRequests => 'Соңғы сұраулар';

  @override
  String get recentlyAdded => 'Жақында қосылған';

  @override
  String get trending => 'Тренд';

  @override
  String get popularMovies => 'Танымал фильмдер';

  @override
  String get movieGenres => 'Фильм жанрлары';

  @override
  String get upcomingMovies => 'Алдағы фильмдер';

  @override
  String get studios => 'Студиялар';

  @override
  String get popularSeries => 'Танымал сериялар';

  @override
  String get seriesGenres => 'Серия жанрлары';

  @override
  String get upcomingSeries => 'Алдағы серия';

  @override
  String get networks => 'Желілер';

  @override
  String get seerrDiscoveryRows => 'Seerr ашу жолдары';

  @override
  String get resetRowsToDefaults => 'Жолдарды әдепкі мәндерге қайтарыңыз';

  @override
  String get enableSeerr => 'Seerr қосыңыз';

  @override
  String get showSeerrInNavigation =>
      'Навигацияда Seerr көрсету (сервер плагинін қажет етеді)';

  @override
  String get seerrUnavailable =>
      'Қолжетімсіз, себебі сервер плагині Seerr қолдауы өшірілген.';

  @override
  String get nsfwFilter => 'NSFW сүзгісі';

  @override
  String get hideAdultContent =>
      'Нәтижелерде ересектерге арналған мазмұнды жасыру';

  @override
  String get seerrNotificationsSection => 'Хабарландырулар';

  @override
  String get seerrNotifyNewRequestsTitle => 'Жаңа сұраныс хабарландырулары';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Біреу сұраныс жібергенде маған хабарлау';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Сұраныс жаңартулары';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Мақұлданды, қабылданбады және кітапханаңызға қосылды';

  @override
  String get seerrNotifyIssuesTitle => 'Мәселе жаңартулары';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Жаңа мәселелер, жауаптар және шешімдер';

  @override
  String loggedInAs(String username) {
    return 'Кірген пайдаланушы: $username';
  }

  @override
  String get discoverRows => 'Seerr ашу беті';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr негізгі бетінде көрсетілетін жолдарды қосыңыз. Ретін өзгерту үшін сүйреңіз. Жеке рет Moonbase-пен синхрондалады.';

  @override
  String get discoverRowsDescription =>
      'Seerr негізгі бетінде көрсетілетін жолдарды қосыңыз. Ретін өзгерту үшін сүйреңіз. Жеке рет Moonbase-пен синхрондалады.';

  @override
  String get enabled => 'Қосылған';

  @override
  String get hidden => 'Жасырын';

  @override
  String get aboutTitle => 'туралы';

  @override
  String versionValue(String version) {
    return '$version нұсқасы';
  }

  @override
  String get openSourceLicenses => 'Ашық бастапқы лицензиялар';

  @override
  String get sourceCode => 'Бастапқы код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Қазір жаңартуларды тексеріңіз';

  @override
  String get checksLatestDesktopRelease =>
      'Осы платформа үшін соңғы жұмыс үстелі шығарылымын тексереді';

  @override
  String get youAreUpToDate => 'Сіз жаңасыз.';

  @override
  String get couldNotCheckForUpdates =>
      'Дәл қазір жаңартуларды тексеру мүмкін емес.';

  @override
  String get noCompatibleUpdate =>
      'Бұл платформа үшін үйлесімді жаңарту бумасы табылмады.';

  @override
  String get updateChecksNotSupported =>
      'Бұл платформада жаңартуды тексеруге қолдау көрсетілмейді.';

  @override
  String get updateNotificationsDisabled =>
      'Жаңарту хабарландырулары өшірілген.';

  @override
  String get pleaseWaitBeforeChecking => 'Қайта тексермес бұрын күте тұрыңыз.';

  @override
  String get latestUpdateAlreadyShown => 'Соңғы жаңарту әлдеқашан көрсетілді.';

  @override
  String get updateAvailable => 'Жаңарту қолжетімді.';

  @override
  String updateAvailableVersion(String version) {
    return 'Жаңарту қолжетімді: v$version';
  }

  @override
  String get updateNotifications => 'Хабарландыруларды жаңарту';

  @override
  String get showWhenUpdatesAvailable =>
      'Жаңартулар қолжетімді болған кезде көрсету';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version қолжетімді';
  }

  @override
  String get readReleaseNotes => 'Шығарылым жазбаларын оқыңыз';

  @override
  String get downloadingUpdate => 'Жаңарту жүктеп алынуда...';

  @override
  String get updateDownloadFailed => 'Жаңарту жүктелмеді. Қайталап көріңіз.';

  @override
  String get openReleasesPage => 'Шығармалар бетін ашыңыз';

  @override
  String get navigation => 'Навигация';

  @override
  String get watchedIndicatorsBackdrops => 'Қаралған көрсеткіштер, фон';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Фокус түсі, қаралған индикаторлар, фон';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar стилі, құралдар тақтасының түймелері, сыртқы түрі';

  @override
  String get reorderToggleHomeRows =>
      'Бастапқы жолдардың ретін өзгертіңіз және ауыстырыңыз';

  @override
  String get featuredContentAppearance => 'Таңдаулы мазмұн, сыртқы түрі';

  @override
  String get posterSizeImageTypeFolderView =>
      'Постер өлшемі, сурет түрі, қалта көрінісі';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB және бағалау көздері';

  @override
  String gbValue(String value) {
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Кескін кэшінің шегі';

  @override
  String get clearImageCache => 'Кескін кэшін тазалау';

  @override
  String get imageCacheCleared => 'Кескін кэші тазаланды';

  @override
  String get clear => 'Тазалау';

  @override
  String get browse => 'Шолу';

  @override
  String get noResults => 'Нәтиже жоқ';

  @override
  String get seerrAvailableStatus => 'Қол жетімді';

  @override
  String get seerrRequestedStatus => 'Сұралған';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Жүктелуде · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Импортталуда';

  @override
  String itemsCount(int count) {
    return '$count Элемент';
  }

  @override
  String get seerrSettings => 'Seerr параметрлері';

  @override
  String get requestMore => 'Қосымша сұрау';

  @override
  String get request => 'Сұраныс';

  @override
  String get cancelRequest => 'Сұраныстан бас тарту';

  @override
  String get playInMoonfin => 'Moonfin ойынында ойнаңыз';

  @override
  String requestedByName(String name) {
    return 'Сұраған: $name';
  }

  @override
  String get approve => 'Мақұлдау';

  @override
  String get declineAction => 'Бас тарту';

  @override
  String get similar => 'Ұқсас';

  @override
  String get recommendations => 'Ұсыныстар';

  @override
  String cancelRequestForTitle(String title) {
    return '«$title» сұранысы болдырылмасын ба?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '«$title» үшін $count сұраныс болдырылмасын ба?';
  }

  @override
  String get keep => 'Сақтау';

  @override
  String get itemNotFoundInLibrary =>
      'Элемент Moonfin кітапханасынан табылмады';

  @override
  String get errorSearchingLibrary => 'Кітапхананы іздеу қатесі';

  @override
  String budgetAmount(String amount) {
    return 'Бюджеті: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Табысы: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type сұрау';
  }

  @override
  String get submitRequest => 'Сұраныс жіберу';

  @override
  String get allSeasons => 'Барлық маусымдар';

  @override
  String get advancedOptions => 'Қосымша опциялар';

  @override
  String get noServiceServersConfigured =>
      'Ешбір қызмет серверлері конфигурацияланбаған';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Сапа профилі';

  @override
  String get rootFolder => 'Түбірлік қалта';

  @override
  String get showMore => 'Көбірек көрсету';

  @override
  String get appearances => 'Фильмография';

  @override
  String get crewSection => 'Экипаж';

  @override
  String ageValue(int age) {
    return 'жасы $age';
  }

  @override
  String get noRequests => 'Сұраныс жоқ';

  @override
  String get pendingStatus => 'Күтуде';

  @override
  String get declinedStatus => 'Қабылданбады';

  @override
  String get partiallyAvailable => 'Ішінара қол жетімді';

  @override
  String get downloadingStatus => 'Жүктеп алынуда';

  @override
  String get approvedStatus => 'Бекітілді';

  @override
  String get notRequestedStatus => 'Сұралған жоқ';

  @override
  String get blocklistedStatus => 'Тізімге тыйым салынған';

  @override
  String get deletedStatus => 'Жойылды';

  @override
  String get failedStatus => 'Сәтсіз';

  @override
  String get processingStatus => 'Өңделуде';

  @override
  String modifiedByName(String name) {
    return 'Өзгерткен: $name';
  }

  @override
  String get completedStatus => 'Аяқталды';

  @override
  String get requestErrorDuplicate => 'Бұл атау бұрын сұралған';

  @override
  String get requestErrorQuota => 'Сұраныс шегіне жетті';

  @override
  String get requestErrorBlocklisted => 'Бұл атау бұғаттау тізімінде';

  @override
  String get requestErrorNoSeasons => 'Сұрауға маусым қалмады';

  @override
  String get requestErrorPermission => 'Бұл сұранысты жасауға рұқсатыңыз жоқ';

  @override
  String get seerrRequestsTitle => 'Сұраныстар';

  @override
  String get seerrIssuesTitle => 'Мәселелер';

  @override
  String get sortNewest => 'Ең жаңа';

  @override
  String get sortLastModified => 'Соңғы өзгертілген';

  @override
  String get noIssues => 'Мәселе жоқ';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit фильм сұранысының $remaining қалды';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit маусым сұранысының $remaining қалды';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name құрамында';
  }

  @override
  String get viewCollection => 'Жинақты ашу';

  @override
  String get requestCollection => 'Жинақты сұрау';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total фильм · $available қолжетімді';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count фильм сұрау';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total ішінен $current сұралуда...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count фильм сұралды';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total фильмнің $ok сұралды';
  }

  @override
  String get collectionAllRequested =>
      'Барлық фильмдер қолжетімді немесе сұралып қойған';

  @override
  String get reportIssue => 'Мәселе туралы хабарлау';

  @override
  String get issueTypeVideo => 'Бейне';

  @override
  String get issueTypeAudio => 'Аудио';

  @override
  String get whatsWrong => 'Не дұрыс емес?';

  @override
  String get allEpisodes => 'Барлық эпизодтар';

  @override
  String get episode => 'Эпизод';

  @override
  String get openStatus => 'Ашық';

  @override
  String get resolvedStatus => 'Шешілді';

  @override
  String get resolveAction => 'Шешу';

  @override
  String get reopenAction => 'Қайта ашу';

  @override
  String reportedByName(String name) {
    return 'Хабарлаған: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count пікір';
  }

  @override
  String get addComment => 'Пікір қосу';

  @override
  String get deleteIssueConfirm => 'Бұл мәселе жойылсын ба?';

  @override
  String get submitReport => 'Хабарламаны жіберу';

  @override
  String get tmdbScore => 'TMDB ұпайы';

  @override
  String get releaseDateLabel => 'Шығарылған күні';

  @override
  String get firstAirDateLabel => 'Алғашқы эфир күні';

  @override
  String get revenueLabel => 'Кіріс';

  @override
  String get runtimeLabel => 'Орындалу уақыты';

  @override
  String get budgetLabel => 'Бюджет';

  @override
  String get originalLanguageLabel => 'Түпнұсқа тілі';

  @override
  String get seasonsLabel => 'Маусымдар';

  @override
  String get episodesLabel => 'Эпизодтар';

  @override
  String get access => 'Қол жеткізу';

  @override
  String get add => 'Қосу';

  @override
  String get address => 'Мекенжай';

  @override
  String get analytics => 'Аналитика';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Мазмұны';

  @override
  String get copy => 'Көшіру';

  @override
  String get create => 'Жасау';

  @override
  String get disable => 'Өшіру';

  @override
  String get done => 'Дайын';

  @override
  String get edit => 'Өңдеу';

  @override
  String get encoding => 'Кодтау';

  @override
  String get error => 'Қате';

  @override
  String get forward => 'Алға';

  @override
  String get general => 'Жалпы';

  @override
  String get go => 'Бар';

  @override
  String get install => 'Орнату';

  @override
  String get installed => 'Орнатылған';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Аты';

  @override
  String get networking => 'Желі құру';

  @override
  String get next => 'Келесі';

  @override
  String get path => 'Жол';

  @override
  String get paused => 'Кідіртілді';

  @override
  String get permissions => 'Рұқсаттар';

  @override
  String get processing => 'Өңдеу';

  @override
  String get profile => 'Профиль';

  @override
  String get provider => 'Провайдер';

  @override
  String get refresh => 'Жаңарту';

  @override
  String get remote => 'Қашықтағы';

  @override
  String get rename => 'Атын өзгерту';

  @override
  String get revoke => 'Күшін жою';

  @override
  String get role => 'Рөл';

  @override
  String get root => 'Түбір';

  @override
  String get run => 'Жүгіру';

  @override
  String get search => 'Іздеу';

  @override
  String get select => 'таңдаңыз';

  @override
  String get send => 'Жіберу';

  @override
  String get sessions => 'Сеанстар';

  @override
  String get set => 'Орнату';

  @override
  String get status => 'Күй';

  @override
  String get stop => 'Тоқтату';

  @override
  String get streaming => 'Ағын';

  @override
  String get time => 'Уақыт';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Жою';

  @override
  String get up => 'Жоғары';

  @override
  String get update => 'Жаңарту';

  @override
  String get upload => 'Жүктеп салу';

  @override
  String get unmute => 'Дыбысты қосу';

  @override
  String get mute => 'Дыбысты өшіру';

  @override
  String get branding => 'Брендинг';

  @override
  String get adminDrawerDashboard => 'Бақылау тақтасы';

  @override
  String get adminDrawerAnalytics => 'Аналитика';

  @override
  String get adminDrawerSettings => 'Параметрлер';

  @override
  String get adminDrawerBranding => 'Брендинг';

  @override
  String get adminDrawerUsers => 'Пайдаланушылар';

  @override
  String get adminDrawerLibraries => 'Медиатекалар';

  @override
  String get adminDrawerDisplay => 'Көрсету';

  @override
  String get adminDrawerMetadata => 'Метадеректер';

  @override
  String get adminDrawerNfo => 'NFO параметрлері';

  @override
  String get adminDrawerTranscoding => 'Транскодтау';

  @override
  String get adminDrawerResume => 'Жалғастыру';

  @override
  String get adminDrawerStreaming => 'Ағын';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Құрылғылар';

  @override
  String get adminDrawerActivity => 'Белсенділік';

  @override
  String get adminDrawerNetworking => 'Желі құру';

  @override
  String get adminDrawerApiKeys => 'API кілттері';

  @override
  String get adminDrawerBackups => 'Сақтық көшірмелер';

  @override
  String get adminDrawerLogs => 'Журналдар';

  @override
  String get adminDrawerScheduledTasks => 'Жоспарланған тапсырмалар';

  @override
  String get adminDrawerPlugins => 'Плагиндер';

  @override
  String get adminDrawerRepositories => 'Репозиторийлер';

  @override
  String get adminDrawerLiveTv => 'Тікелей теледидар';

  @override
  String get adminExitTooltip => 'Әкімшіден шығыңыз';

  @override
  String get adminDashboardLoadFailed => 'Бақылау тақтасы жүктелмеді';

  @override
  String get adminMediaOverview => 'Бұқаралық ақпарат құралдарына шолу';

  @override
  String get adminMediaTotalsError =>
      'Сервер медиасының жиынтықтары жүктелмеді.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Бұл серверде қанша мазмұн бар екенін жылдам оқу.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Қолжетімді плагин жаңартулары: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Қайта іске қосуды қажет ететін плагиндер: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Орындалмаған жоспарлы тапсырмалар: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Соңғы ескерту/қате жазбалары: $count';
  }

  @override
  String get analyticsMediaDistribution => 'БАҚ тарату';

  @override
  String get analyticsVideoCodecs => 'Бейне кодектер';

  @override
  String get analyticsAudioCodecs => 'Аудио кодектер';

  @override
  String get analyticsContainers => 'Контейнерлер';

  @override
  String get analyticsTopGenres => 'Үздік жанрлар';

  @override
  String get analyticsReleaseYears => 'Шығарылған жылдар';

  @override
  String get analyticsContentRatings => 'Мазмұн рейтингтері';

  @override
  String get analyticsRuntimeBuckets => 'Орындау уақыты шелектері';

  @override
  String get analyticsFileFormats => 'Файл пішімдері';

  @override
  String get analyticsNoData => 'Деректер жоқ.';

  @override
  String get adminServerInfo => 'Сервер ақпараты';

  @override
  String get adminRestartPending => 'Қайта бастау Күтуде';

  @override
  String get adminServerPaths => 'Сервер жолдары';

  @override
  String get adminServerActions => 'Сервер әрекеттері';

  @override
  String get adminRestartServer => 'Серверді қайта іске қосыңыз';

  @override
  String get adminShutdownServer => 'Серверді өшіру';

  @override
  String get adminScanLibraries => 'Кітапханаларды сканерлеу';

  @override
  String get adminLibraryScanStarted => 'Кітапхананы сканерлеу басталды';

  @override
  String errorGeneric(String error) {
    return 'Қате: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Серверді қайта жүктеу орындалуда';

  @override
  String get adminServerRebootMessage =>
      'Сервер қайта жүктелуде, Moonfin қайта іске қосыңыз';

  @override
  String get adminActiveSessions => 'Белсенді сессиялар';

  @override
  String get adminSessionsLoadFailed => 'Сеанстарды жүктеу сәтсіз аяқталды';

  @override
  String get adminNoActiveSessions => 'Белсенді сеанстар жоқ';

  @override
  String get adminRecentActivity => 'Соңғы әрекет';

  @override
  String get adminNoRecentActivity => 'Соңғы әрекет жоқ';

  @override
  String adminCommandFailed(String error) {
    return 'Пәрмен орындалмады: $error';
  }

  @override
  String get adminSendMessage => 'Хабар жіберу';

  @override
  String get adminMessageTextHint => 'Хабарлама мәтіні';

  @override
  String get adminSetVolume => 'Дыбыс деңгейін орнату';

  @override
  String get sessionPrev => 'Алдыңғы';

  @override
  String get sessionRewind => 'Артқа айналдыру';

  @override
  String get sessionForward => 'Алға айналдыру';

  @override
  String get sessionNext => 'Келесі';

  @override
  String get sessionVolumeDown => 'Том –';

  @override
  String get sessionVolumeUp => '+ том';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Қазір ойнатылады';

  @override
  String get volume => 'Дыбыс деңгейі';

  @override
  String get actions => 'Әрекеттер';

  @override
  String get videoCodec => 'Бейне кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'Аппараттық үдету';

  @override
  String get completion => 'Аяқтау';

  @override
  String get direct => 'Тікелей';

  @override
  String get adminDisconnect => 'Ажырату';

  @override
  String get adminClearDates => 'Күндерді тазалау';

  @override
  String get adminActivitySeverityAll => 'Барлық деңгейлер';

  @override
  String get adminActivityDateRange => 'Күн ауқымы';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Әрекеттер журналын жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoActivityEntries => 'Әрекет жазбалары жоқ';

  @override
  String get adminEditDeviceName => 'Құрылғы атауын өңдеу';

  @override
  String get adminCustomName => 'Пайдаланушы аты';

  @override
  String get adminDeviceNameUpdated => 'Құрылғы атауы жаңартылды';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Құрылғыны жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminDeleteDevice => 'Құрылғыны жою';

  @override
  String get adminDeviceDeleted => 'Құрылғы жойылды';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Құрылғыны жою мүмкін болмады: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '«$name» құрылғысы жойылсын ба? Пайдаланушыға осы құрылғыда қайта кіру қажет болады.';
  }

  @override
  String get adminDeleteAllDevices => 'Барлық құрылғыны жою';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count құрылғы жойылсын ба? Тиісті пайдаланушыларға қайта кіру қажет болады. Ағымдағы құрылғыңызға әсер етпейді.';
  }

  @override
  String get adminDevicesDeletedAll => 'Құрылғылар жойылды';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Кейбір құрылғылар жойылды; $count құрылғыны жою мүмкін болмады.';
  }

  @override
  String get adminDevicesLoadFailed => 'Құрылғылар жүктелмеді';

  @override
  String get adminSearchDevices => 'Құрылғыларды іздеу';

  @override
  String get adminThisDevice => 'Бұл құрылғы';

  @override
  String get adminEditName => 'Атауды өңдеу';

  @override
  String get adminLibrariesLoadFailed => 'Кітапханалар жүктелмеді';

  @override
  String get adminNoLibraries => 'Бірде-бір кітапхана конфигурацияланбаған';

  @override
  String get adminScanAllLibraries => 'Барлық кітапханаларды сканерлеу';

  @override
  String get adminAddLibrary => 'Кітапхана қосу';

  @override
  String adminScanFailed(String error) {
    return 'Сканерлеуді бастау мүмкін болмады: $error';
  }

  @override
  String get adminRenameLibrary => 'Кітапхананың атын өзгерту';

  @override
  String get adminNewName => 'Жаңа атау';

  @override
  String adminLibraryRenamed(String name) {
    return 'Кітапхана «$name» деп өзгертілді';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Атын өзгерту мүмкін болмады: $error';
  }

  @override
  String get adminDeleteLibrary => 'Кітапхананы жою';

  @override
  String adminLibraryDeleted(String name) {
    return '«$name» кітапханасы жойылды';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Кітапхананы жою мүмкін болмады: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Жолды қосу мүмкін болмады: $error';
  }

  @override
  String get adminRemovePath => 'Жолды жою';

  @override
  String adminRemovePathConfirm(String path) {
    return '«$path» осы кітапханадан жойылсын ба?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Жолды жою мүмкін болмады: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Кітапхана опциялары сақталды';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Параметрлерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Кітапхана жүктелмеді';

  @override
  String get adminNoMediaPaths => 'Ешбір медиа жолы конфигурацияланбаған';

  @override
  String get adminAddPath => 'Жол қосу';

  @override
  String get adminBrowseFilesystem => 'Сервер файлдық жүйесін шолу:';

  @override
  String get adminSaveOptions => 'Параметрлерді сақтау';

  @override
  String get adminPreferredMetadataLanguage => 'Таңдаулы метадеректер тілі';

  @override
  String get adminMetadataLanguageHint => 'мысалы en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Метадеректер ел коды';

  @override
  String get adminMetadataCountryHint => 'мысалы АҚШ, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Жолдар';

  @override
  String get adminLibraryTabOptions => 'Параметрлер';

  @override
  String get adminLibraryTabDownloaders => 'Жүктеушілер';

  @override
  String get adminLibMetadataSavers => 'Метадеректерді сақтаушылар';

  @override
  String get adminLibSubtitleDownloaders => 'Субтитр жүктеушілері';

  @override
  String get adminLibLyricDownloaders => 'Ән мәтінін жүктеушілер';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Метадеректерді жүктеушілер: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Кескін көздері: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Бұл сервер кітапхананың осы түрі үшін жүктеушілер ұсынбайды.';

  @override
  String get adminLibrarySectionGeneral => 'Жалпы';

  @override
  String get adminLibrarySectionMetadata => 'Метадеректер';

  @override
  String get adminLibrarySectionEmbedded => 'Кірістірілген мәліметтер';

  @override
  String get adminLibrarySectionSubtitles => 'Субтитрлер';

  @override
  String get adminLibrarySectionImages => 'Кескіндер';

  @override
  String get adminLibrarySectionSeries => 'Сериалдар';

  @override
  String get adminLibrarySectionMusic => 'Музыка';

  @override
  String get adminLibrarySectionMovies => 'Фильмдер';

  @override
  String get adminLibRealtimeMonitor => 'Нақты уақыттағы бақылауды қосу';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Файл өзгерістерін анықтап, оларды автоматты түрде өңдеу.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Архивтерді медиафайл ретінде қарастыру';

  @override
  String get adminLibEnablePhotos => 'Фотосуреттерді көрсету';

  @override
  String get adminLibSaveLocalMetadata => 'Мұқабаларды медиақалталарға сақтау';

  @override
  String get adminLibRefreshInterval => 'Метадеректерді автоматты жаңарту';

  @override
  String get adminLibRefreshNever => 'Ешқашан';

  @override
  String get adminLibDefault => 'Әдепкі';

  @override
  String get adminLibDisplayTitle => 'Көрсету';

  @override
  String get adminLibDisplaySection => 'Кітапхананы көрсету';

  @override
  String get adminLibFolderView =>
      'Қарапайым медиақалталарды көрсету үшін қалталар көрінісін пайдалану';

  @override
  String get adminLibSpecialsInSeasons =>
      'Арнайы шығарылымдарды шыққан маусымдарында көрсету';

  @override
  String get adminLibGroupMovies => 'Фильмдерді жинақтарға топтау';

  @override
  String get adminLibGroupShows => 'Сериалдарды жинақтарға топтау';

  @override
  String get adminLibExternalSuggestions =>
      'Ұсыныстарда сыртқы мазмұнды көрсету';

  @override
  String get adminLibDateAddedSection => 'Қосылған күн әрекеті';

  @override
  String get adminLibDateAddedLabel => 'Қосылған күнді мына көзден алу';

  @override
  String get adminLibDateAddedImport => 'Кітапханаға сканерленген күн';

  @override
  String get adminLibDateAddedFile => 'Файл жасалған күн';

  @override
  String get adminLibMetadataTitle => 'Метадеректер және кескіндер';

  @override
  String get adminLibMetadataLangSection => 'Қалаулы метадерек тілі';

  @override
  String get adminLibChaptersSection => 'Тараулар';

  @override
  String get adminLibDummyChapterDuration =>
      'Жасанды тараудың ұзақтығы (секунд)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Тараулары жоқ медиа үшін жасалатын тараулардың ұзақтығы. Өшіру үшін 0 мәнін қойыңыз.';

  @override
  String get adminLibChapterImageResolution =>
      'Тарау кескінінің ажыратымдылығы';

  @override
  String get adminLibNfoTitle => 'NFO параметрлері';

  @override
  String get adminLibNfoHelp =>
      'NFO метадеректері Kodi және ұқсас клиенттермен үйлесімді. Параметрлер NFO метадеректерін сақтайтын барлық кітапханаға қолданылады.';

  @override
  String get adminLibKodiUser =>
      'NFO файлдарында көру деректері сақталатын пайдаланушы';

  @override
  String get adminLibSaveImagePaths => 'Кескін жолдарын NFO файлдарында сақтау';

  @override
  String get adminLibPathSubstitution =>
      'NFO кескін жолдары үшін жолды алмастыруды қосу';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart кескіндерін extrathumbs қалтасына көшіру';

  @override
  String get adminLibNone => 'Жоқ';

  @override
  String adminLibRefreshDays(int days) {
    return '$days күн';
  }

  @override
  String get adminLibEmbeddedTitles => 'Кірістірілген атауларды пайдалану';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Қосымшалар үшін кірістірілген атауларды пайдалану';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Кірістірілген эпизод мәліметтерін пайдалану';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Кірістірілген субтитрлерге рұқсат ету';

  @override
  String get adminLibEmbeddedAllowAll => 'Барлығына рұқсат ету';

  @override
  String get adminLibEmbeddedAllowText => 'Тек мәтіндік';

  @override
  String get adminLibEmbeddedAllowImage => 'Тек кескіндік';

  @override
  String get adminLibEmbeddedAllowNone => 'Жоқ';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Кірістірілген субтитрлер болса, жүктеуді өткізіп жіберу';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Аудиотрек жүктеу тіліне сәйкес келсе, жүктеуді өткізіп жіберу';

  @override
  String get adminLibRequirePerfectMatch =>
      'Субтитрлердің дәл сәйкестігін талап ету';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Субтитрлерді медиақалталарға сақтау';

  @override
  String get adminLibChapterImageExtraction => 'Тарау кескіндерін шығарып алу';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Кітапхананы сканерлеу кезінде тарау кескіндерін шығарып алу';

  @override
  String get adminLibTrickplayExtraction =>
      'trickplay кескіндерін шығарып алуды қосу';

  @override
  String get adminLibTrickplayDuringScan =>
      'Кітапхананы сканерлеу кезінде trickplay кескіндерін шығарып алу';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'trickplay кескіндерін медиақалталарға сақтау';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Бірнеше қалтаға таралған сериалдарды автоматты түрде біріктіру';

  @override
  String get adminLibSeasonZeroName => 'Нөлінші маусымның көрсетілетін атауы';

  @override
  String get adminLibLufsScan =>
      'Дыбысты қалыпқа келтіру үшін LUFS сканерлеуін қосу';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Стандартты емес орындаушылар тегін таңдау';

  @override
  String get adminLibAutoAddToCollection =>
      'Фильмдерді жинақтарға автоматты түрде қосу';

  @override
  String get adminLibraryNameRequired => 'Кітапхана атауы қажет';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Кітапхана жасау мүмкін болмады: $error';
  }

  @override
  String get adminLibraryName => 'Кітапхана аты';

  @override
  String get adminSelectedPaths => 'Таңдалған жолдар:';

  @override
  String get adminNoPathsAdded => 'Жолдар қосылмаған (кейінірек қосуға болады)';

  @override
  String get adminCreateLibrary => 'Кітапхана жасау';

  @override
  String get paths => 'Жолдар:';

  @override
  String get adminDisableUser => 'Пайдаланушыны өшіру';

  @override
  String get adminEnableUser => 'Пайдаланушыны қосыңыз';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name өшірілсін бе? Ол кіре алмайтын болады.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name қосылсын ба? Ол қайта кіре алатын болады.';
  }

  @override
  String adminUserDisabled(String name) {
    return '«$name» пайдаланушысы өшірілді';
  }

  @override
  String adminUserEnabled(String name) {
    return '«$name» пайдаланушысы қосылды';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Пайдаланушы саясатын жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Пайдаланушыларды жүктеу мүмкін болмады';

  @override
  String get adminSearchUsers => 'Пайдаланушыларды іздеу';

  @override
  String get adminEditUser => 'Пайдаланушыны өңдеу';

  @override
  String get adminAddUser => 'Пайдаланушы қосу';

  @override
  String adminUserCreateFailed(String error) {
    return 'Пайдаланушы жасау мүмкін болмады: $error';
  }

  @override
  String get adminCreateUser => 'Пайдаланушы жасау';

  @override
  String get adminPasswordOptional => 'Құпия сөз (міндетті емес)';

  @override
  String get adminUsernameRequired => 'Пайдаланушы аты бос болмауы керек';

  @override
  String get adminNoProfileChanges => 'Сақталатын профиль өзгерістері жоқ';

  @override
  String get adminProfileSaved => 'Профиль сақталды';

  @override
  String adminSaveFailed(String error) {
    return 'Сақтау мүмкін болмады: $error';
  }

  @override
  String get adminPermissionsSaved => 'Рұқсаттар сақталды';

  @override
  String get adminPasswordsMismatch => 'Құпия сөздер сәйкес келмейді';

  @override
  String adminFailed(String error) {
    return 'Сәтсіз: $error';
  }

  @override
  String get adminUserLoadFailed => 'Пайдаланушы жүктелмеді';

  @override
  String get adminBackToUsers => 'Пайдаланушылар дегенге қайта келу';

  @override
  String get adminSaveProfile => 'Профильді сақтау';

  @override
  String get adminDeleteUser => 'Пайдаланушыны жою';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Әкімшілер серверге толық қол жеткізе алады. Сақтықпен беріңіз.';

  @override
  String get administrator => 'Әкімші';

  @override
  String get adminHiddenUser => 'Жасырын пайдаланушы';

  @override
  String get adminAllowMediaPlayback => 'Медиа ойнатуға рұқсат беріңіз';

  @override
  String get adminAllowAudioTranscoding =>
      'Дыбысты қайта кодтауға рұқсат етіңіз';

  @override
  String get adminAllowVideoTranscoding =>
      'Бейнені қайта кодтауға рұқсат беріңіз';

  @override
  String get adminAllowRemuxing => 'Ремукс жасауға рұқсат етіңіз';

  @override
  String get adminForceRemoteTranscoding =>
      'Қашықтағы дереккөзді қайта кодтауды мәжбүрлеу';

  @override
  String get adminAllowContentDeletion => 'Мазмұнды жоюға рұқсат беріңіз';

  @override
  String get adminAllowContentDownloading =>
      'Мазмұнды жүктеп алуға рұқсат беріңіз';

  @override
  String get adminAllowPublicSharing => 'Жалпыға ортақ бөлісуге рұқсат беріңіз';

  @override
  String get adminAllowRemoteControl =>
      'Басқа пайдаланушыларды қашықтан басқаруға рұқсат ету';

  @override
  String get adminAllowSharedDeviceControl =>
      'Ортақ құрылғыны басқаруға рұқсат етіңіз';

  @override
  String get adminAllowRemoteAccess => 'Қашықтан кіруге рұқсат беріңіз';

  @override
  String get adminRemoteBitrateLimit =>
      'Қашықтағы клиенттің бит жылдамдығының шегі (бит/с)';

  @override
  String get adminLeaveEmptyNoLimit => 'Шектеусіз бос қалдырыңыз';

  @override
  String get adminMaxActiveSessions => 'Максималды белсенді сеанстар';

  @override
  String get adminAllowLiveTvAccess =>
      'Тікелей теледидарға кіруге рұқсат беріңіз';

  @override
  String get adminAllowLiveTvManagement => 'Live TV басқаруына рұқсат беріңіз';

  @override
  String get adminAllowCollectionManagement =>
      'Коллекцияны басқаруға рұқсат етіңіз';

  @override
  String get adminAllowSubtitleManagement =>
      'Субтитрлерді басқаруға рұқсат беріңіз';

  @override
  String get adminAllowLyricManagement => 'Лириканы басқаруға рұқсат етіңіз';

  @override
  String get adminSavePermissions => 'Рұқсаттарды сақтау';

  @override
  String get adminEnableAllLibraryAccess =>
      'Барлық кітапханаларға кіру мүмкіндігін қосыңыз';

  @override
  String get adminSaveAccess => 'Access сақтау';

  @override
  String get adminChangePassword => 'Құпия сөзді өзгерту';

  @override
  String get adminNewPassword => 'Жаңа құпия сөз';

  @override
  String get adminConfirmPassword => 'Құпия сөзді Растау';

  @override
  String get adminSetPassword => 'Құпия сөзді орнату';

  @override
  String get adminResetPassword => 'Құпия сөзді қалпына келтіру';

  @override
  String get adminPasswordReset => 'Құпия сөзді қалпына келтіру';

  @override
  String get adminPasswordUpdated => 'Құпия сөз жаңартылды';

  @override
  String get adminUserSettings => 'Пайдаланушы параметрлері';

  @override
  String get adminLibraryAccess => 'Кітапханаға кіру';

  @override
  String get adminDeviceAndChannelAccess => 'Құрылғы мен арнаға кіру';

  @override
  String get adminEnableAllDevices =>
      'Барлық құрылғыларға кіру мүмкіндігін қосыңыз';

  @override
  String get adminEnableAllChannels => 'Барлық арналарға кіруді қосыңыз';

  @override
  String get adminParentalControl => 'Ата-ана бақылауы';

  @override
  String get adminMaxParentalRating => 'Рұқсат етілген ең жоғары жас шектеуі';

  @override
  String get adminMaxParentalRatingHint =>
      'Одан жоғары шектеуі бар мазмұн бұл пайдаланушыдан жасырылады.';

  @override
  String get adminParentalRatingNone => 'Жоқ';

  @override
  String get adminBlockUnratedItems =>
      'Шектеу туралы мәліметі жоқ немесе танылмаған элементтерді бұғаттау';

  @override
  String get adminUnratedBook => 'Кітаптар';

  @override
  String get adminUnratedChannelContent => 'Арналар';

  @override
  String get adminUnratedLiveTvChannel => 'Тікелей теледидар';

  @override
  String get adminUnratedMovie => 'Фильмдер';

  @override
  String get adminUnratedMusic => 'Музыка';

  @override
  String get adminUnratedTrailer => 'Трейлерлер';

  @override
  String get adminUnratedSeries => 'Сериалдар';

  @override
  String get adminAccessSchedules => 'Қатынау кестелері';

  @override
  String get adminAccessSchedulesHint =>
      'Қатынауға тек төмендегі кесте бойынша рұқсат ету. Кесте орнатылмаса, қатынауға күні бойы рұқсат етіледі.';

  @override
  String get adminAddSchedule => 'Кесте қосу';

  @override
  String get adminScheduleDay => 'Күн';

  @override
  String get adminScheduleStart => 'Басталуы';

  @override
  String get adminScheduleEnd => 'Аяқталуы';

  @override
  String get adminDayEveryday => 'Күн сайын';

  @override
  String get adminDayWeekday => 'Жұмыс күні';

  @override
  String get adminDayWeekend => 'Демалыс күні';

  @override
  String get adminDaySunday => 'Жексенбі';

  @override
  String get adminDayMonday => 'Дүйсенбі';

  @override
  String get adminDayTuesday => 'Сейсенбі';

  @override
  String get adminDayWednesday => 'Сәрсенбі';

  @override
  String get adminDayThursday => 'Бейсенбі';

  @override
  String get adminDayFriday => 'Жұма';

  @override
  String get adminDaySaturday => 'Сенбі';

  @override
  String get adminAllowedTags => 'Рұқсат етілген тегтер';

  @override
  String get adminAllowedTagsHint =>
      'Тек осы тегтері бар мазмұн көрсетіледі. Барлығына рұқсат ету үшін бос қалдырыңыз.';

  @override
  String get adminBlockedTags => 'Бұғатталған тегтер';

  @override
  String get adminBlockedTagsHint =>
      'Осы тегтері бар мазмұн бұл пайдаланушыдан жасырылады.';

  @override
  String get adminAddTag => 'Тег қосу';

  @override
  String get adminEnabledDevices => 'Қосылған құрылғылар';

  @override
  String get adminEnabledChannels => 'Қосылған арналар';

  @override
  String get adminAuthProvider => 'Аутентификация провайдері';

  @override
  String get adminPasswordResetProvider => 'Құпия сөзді ысыру провайдері';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Бұғаттауға дейінгі сәтсіз кіру әрекеттерінің ең көп саны';

  @override
  String get adminLoginAttemptsHint =>
      'Әдепкі мән үшін 0, бұғаттауды өшіру үшін -1 қойыңыз.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay қатынауы';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Топтар жасауға және оларға қосылуға рұқсат ету';

  @override
  String get adminSyncPlayJoin => 'Топтарға қосылуға рұқсат ету';

  @override
  String get adminSyncPlayNone => 'Қатынау жоқ';

  @override
  String get adminContentDeletionFolders => 'Мазмұнды жоюға рұқсат ету көзі';

  @override
  String get adminResetPasswordWarning =>
      'Бұл құпия сөзді жояды. Пайдаланушы парольсіз жүйеге кіре алады.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер HTTP $status қайтарды';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name жойылсын ба?';
  }

  @override
  String adminUserDeleted(String name) {
    return '«$name» пайдаланушысы жойылды';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Пайдаланушыны жою мүмкін болмады: $error';
  }

  @override
  String get adminCreateApiKey => 'API кілтін жасау';

  @override
  String get adminAppName => 'Қолданба атауы';

  @override
  String get adminApiKeyCreated => 'API кілті жасалды';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Кілт сәтті жасалды. Сервер таңбалауышты қайтармады. Сервер API кілттерін тексеріңіз.';

  @override
  String get adminKeyCopied => 'Перне алмасу буферіне көшірілді';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Кілт жасау мүмкін болмады: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Сервер жауабында кілт таңбалауышы жоқ';

  @override
  String get adminRevokeApiKey => 'API кілтін қайтарып алу';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name үшін кілт кері қайтарылсын ба?';
  }

  @override
  String get adminApiKeyRevoked => 'API кілті кері қайтарылды';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Кілтті кері қайтару мүмкін болмады: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API кілттері жүктелмеді';

  @override
  String get adminApiKeysTitle => 'API кілттері';

  @override
  String get adminCreateKey => 'Кілт жасау';

  @override
  String get adminNoApiKeys => 'API кілттері табылмады';

  @override
  String get adminUnknownApp => 'Белгісіз қолданба';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nЖасалды: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Сақтық көшірме жасау';

  @override
  String get adminBackupInclude => 'Сақтық көшірмеге не кіретінін таңдаңыз.';

  @override
  String get adminBackupDatabase => 'Дерекқор';

  @override
  String get adminBackupDatabaseAlways => 'Әрқашан қосылады';

  @override
  String get adminBackupMetadata => 'Метадеректер';

  @override
  String get adminBackupSubtitles => 'Субтитрлер';

  @override
  String get adminBackupTrickplay => 'Trickplay кескіндері';

  @override
  String get adminCreatingBackup => 'Сақтық көшірме жасалуда...';

  @override
  String get adminBackupCreated => 'Сақтық көшірме сәтті жасалды';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Сақтық көшірме жасау мүмкін болмады: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Сервер жауабында сақтық көшірме жолы жоқ';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Манифестті жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminConfirmRestore => 'Қалпына келтіруді растаңыз';

  @override
  String get adminRestoringBackup => 'Сақтық көшірме қалпына келтірілуде...';

  @override
  String adminRestoreFailed(String error) {
    return 'Сақтық көшірмеден қалпына келтіру мүмкін болмады: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Сақтық көшірмелер жүктелмеді';

  @override
  String get adminCreateBackup => 'Сақтық көшірме жасау';

  @override
  String get adminNoBackups => 'Сақтық көшірмелер табылмады';

  @override
  String get adminViewDetails => 'Мәліметтерді көру';

  @override
  String get restore => 'Қалпына келтіру';

  @override
  String get adminLogsLoadFailed => 'Сервер журналдарын жүктеу сәтсіз аяқталды';

  @override
  String get adminNoLogFiles => 'Ешбір журнал файлдары табылмады';

  @override
  String get adminLogCopied => 'Журнал алмасу буферіне көшірілді';

  @override
  String get adminSaveLogFile => 'Журнал файлын сақтаңыз';

  @override
  String adminSavedTo(String path) {
    return '$path орнына сақталды';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Файлды сақтау мүмкін болмады: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName жүктеу мүмкін болмады';
  }

  @override
  String get adminSearchInLog => 'Журналда іздеу';

  @override
  String get adminNoMatchingLines => 'Сәйкес сызықтар жоқ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Тапсырмаларды жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Жоспарланған тапсырмалар табылмады';

  @override
  String get adminNoTasksMatchFilter =>
      'Ағымдағы сүзгіге сәйкес тапсырмалар жоқ';

  @override
  String adminTaskStartFailed(String error) {
    return 'Тапсырманы бастау мүмкін болмады: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Тапсырманы тоқтату мүмкін болмады: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Тапсырманы жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminRunNow => 'Қазір іске қосыңыз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Триггерді жою мүмкін болмады: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Триггер қосу мүмкін болмады: $error';
  }

  @override
  String get adminLastExecution => 'Соңғы орындалу';

  @override
  String get adminTriggers => 'Триггерлер';

  @override
  String get adminAddTrigger => 'Триггерді қосыңыз';

  @override
  String get adminNoTriggers => 'Триггерлер конфигурацияланбаған';

  @override
  String get adminTriggerType => 'Триггер түрі';

  @override
  String get adminTimeLimit => 'Уақыт шегі (міндетті емес)';

  @override
  String get adminNoLimit => 'Шектеу жоқ';

  @override
  String adminHours(String hours) {
    return '$hours сағат';
  }

  @override
  String get adminDayOfWeek => 'Аптаның күні';

  @override
  String get adminSearchPlugins => 'Плагиндерді іздеу...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Плагинді ауыстыру мүмкін болмады: $error';
  }

  @override
  String get adminUninstallPlugin => 'Плагинді жою';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Плагинді жою мүмкін болмады: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Пакетті орнату мүмкін болмады: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Жаңартуды орнату мүмкін болмады: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Плагиндерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Іздеуіңізге сәйкес келетін плагиндер жоқ';

  @override
  String get adminNoPluginsInstalled => 'Ешқандай плагин орнатылмаған';

  @override
  String adminInstallUpdate(String version) {
    return 'Жаңартуды орнату (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Каталогты жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Іздеуіңізге сәйкес пакеттер жоқ';

  @override
  String get adminNoPackagesAvailable => 'Қолжетімді пакеттер жоқ';

  @override
  String get adminExperimentalIntegration => 'Эксперименттік интеграция';

  @override
  String get adminExperimentalWarning =>
      'Плагин параметрлерін біріктіру әлі эксперименталды. Кейбір параметрлер беттері дұрыс көрсетілмеуі мүмкін.';

  @override
  String get continueAction => 'Жалғастыру';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '«$name» сервер қайта іске қосылғаннан кейін жойылады';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Жою мүмкін болмады: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '«$name» v$version нұсқасына жаңартылуда...';
  }

  @override
  String get adminMissingAuthToken =>
      'Параметрлерді ашу мүмкін емес: аутентификация белгісі жоқ.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Плагинді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагин табылмады';

  @override
  String adminPluginVersion(String version) {
    return '$version нұсқасы';
  }

  @override
  String get adminEnablePlugin => 'Плагинді қосыңыз';

  @override
  String get adminPluginSettingsPage => 'Плагин параметрлері беті';

  @override
  String get adminRevisionHistory => 'Қайта қарау тарихы';

  @override
  String get adminNoChangelog => 'Өзгеріс журналы жоқ.';

  @override
  String get adminRemoveRepository => 'Репозиторийді жою';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Репозиторийлерді сақтау мүмкін болмады: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Репозиторийлерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminRepositoryNameHint => 'мысалы Jellyfin Тұрақты';

  @override
  String get adminRepositoryUrl => 'Репозиторий URL';

  @override
  String get adminAddEntry => 'Жазба қосу';

  @override
  String get adminInvalidUrl => 'Жарамсыз URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Плагин параметрлерін жүктеу мүмкін емес: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ашу мүмкін болмады';
  }

  @override
  String get adminOpenInBrowser => 'Браузерде ашыңыз';

  @override
  String get adminOpenExternally => 'Сырттай ашыңыз';

  @override
  String get adminGeneralSettings => 'Жалпы параметрлер';

  @override
  String get adminServerName => 'Сервер атауы';

  @override
  String get adminPreferredMetadataCountry => 'Таңдаулы метадеректер елі';

  @override
  String get adminCachePath => 'Кэш жолы';

  @override
  String get adminMetadataPath => 'Метадеректер жолы';

  @override
  String get adminLibraryScanConcurrency =>
      'Кітапхананы сканерлеудің параллельдігі';

  @override
  String get adminParallelImageEncodingLimit =>
      'Параллель кескінді кодтау шегі';

  @override
  String get adminSlowResponseThreshold => 'Баяу жауап шегі (мс)';

  @override
  String get adminBrandingSaved => 'Брендинг параметрлері сақталды';

  @override
  String get adminBrandingLoadFailed => 'Бренд параметрлері жүктелмеді';

  @override
  String get adminLoginDisclaimer => 'Жүйеге кіруден бас тарту';

  @override
  String get adminLoginDisclaimerHint =>
      'Жүйеге кіру пішінінің астында HTML көрсетіледі';

  @override
  String get adminCustomCss => 'Арнаулы CSS';

  @override
  String get adminCustomCssHint =>
      'Веб-интерфейске қолданылған пайдаланушы CSS';

  @override
  String get adminEnableSplashScreen => 'Экранды қосу';

  @override
  String get adminStreamingSaved => 'Трансляция параметрлері сақталды';

  @override
  String get adminStreamingLoadFailed =>
      'Ағындық параметрлерді жүктеу мүмкін болмады';

  @override
  String get adminStreamingDescription =>
      'Қашықтағы қосылымдар үшін жаһандық ағындық бит жылдамдығы шектеулерін орнатыңыз.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Қашықтағы клиенттің бит жылдамдығының шегі (Мбит/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Бос қалдырыңыз немесе шектеусіз үшін 0 қалдырыңыз';

  @override
  String get adminPlaybackSaved => 'Ойнату параметрлері сақталды';

  @override
  String get adminPlaybackLoadFailed => 'Ойнату параметрлері жүктелмеді';

  @override
  String get adminPlaybackTranscoding => 'Ойнату / қайта кодтау';

  @override
  String get adminHardwareAcceleration => 'Аппараттық жеделдету';

  @override
  String get adminVaapiDevice => 'VA-API құрылғысы';

  @override
  String get adminEnableHardwareEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminEnableHardwareDecoding =>
      'Аппараттық құралдардың декодтауын қосыңыз:';

  @override
  String get adminEncodingThreads => 'Жіптерді кодтау';

  @override
  String get adminAutomatic => '0 = автоматты';

  @override
  String get adminTranscodingTempPath => 'Транскодтау уақытша жол';

  @override
  String get adminEnableFallbackFont => 'Қосымша қаріпті қосыңыз';

  @override
  String get adminFallbackFontPath => 'Қайта қаріп жолы';

  @override
  String get adminAllowSegmentDeletion => 'Сегментті жоюға рұқсат ету';

  @override
  String get adminSegmentKeepSeconds => 'Сегменттерді сақтау (секундтар)';

  @override
  String get adminThrottleBuffering => 'Дроссельді буферлеу';

  @override
  String get adminTrickplaySaved => 'Trickplay параметрлері сақталды';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay параметрлерін жүктеу мүмкін болмады';

  @override
  String get adminEnableHardwareAcceleration =>
      'Аппараттық жеделдетуді қосыңыз';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Тек негізгі кадрды шығаруды қосыңыз';

  @override
  String get adminKeyFrameSubtitle => 'Жылдамырақ, бірақ дәлдігі төмен';

  @override
  String get adminScanBehavior => 'Тәртіпті сканерлеу';

  @override
  String get adminProcessPriority => 'Процесс басымдығы';

  @override
  String get adminImageSettings => 'Кескін параметрлері';

  @override
  String get adminIntervalMs => 'Аралық (мс)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Жақтауларды қаншалықты жиі түсіру керек';

  @override
  String get adminWidthResolutions => 'Ені ажыратымдылықтары';

  @override
  String get adminTileWidth => 'Плитка ені';

  @override
  String get adminTileHeight => 'Плитка биіктігі';

  @override
  String get adminQualitySubtitle =>
      'Төменгі мәндер = жақсы сапа, үлкенірек файлдар';

  @override
  String get adminProcessThreads => 'Жіптерді өңдеу';

  @override
  String get adminResumeSaved => 'Параметрлерді жалғастыру сақталды';

  @override
  String get adminResumeLoadFailed => 'Жалғастыру параметрлері жүктелмеді';

  @override
  String get adminResumeDescription =>
      'Мазмұнның қашан жартылай ойнатылатын немесе толық ойнатылатыны белгіленетінін конфигурациялаңыз.';

  @override
  String get adminMinResumePercentage => 'Резюменің минималды пайызы';

  @override
  String get adminMinResumeSubtitle =>
      'Прогрессті сақтау үшін мазмұн осы пайыздан жоғары ойнатылуы керек';

  @override
  String get adminMaxResumePercentage => 'Резюменің максималды пайызы';

  @override
  String get adminMaxResumeSubtitle =>
      'Осы пайыздан кейін мазмұн толығымен ойнатылды деп саналады';

  @override
  String get adminMinResumeDuration => 'Ең аз түйіндеме ұзақтығы (секунд)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Бұдан қысқа элементтерді қалпына келтіру мүмкін емес';

  @override
  String get adminMinAudiobookResume =>
      'Аудиокітап түйіндемесінің ең аз пайызы';

  @override
  String get adminMaxAudiobookResume =>
      'Аудиокітап түйіндемесінің максималды пайызы';

  @override
  String get adminNetworkingSaved =>
      'Желі параметрлері сақталды. Серверді қайта іске қосу қажет болуы мүмкін.';

  @override
  String get adminNetworkingLoadFailed => 'Желі параметрлері жүктелмеді';

  @override
  String get adminNetworkingWarning =>
      'Желі параметрлерін өзгерту серверді қайта іске қосуды қажет етуі мүмкін.';

  @override
  String get adminEnableRemoteAccess => 'Қашықтан қол жеткізуді қосыңыз';

  @override
  String get ports => 'Порттар';

  @override
  String get adminHttpPort => 'HTTP порты';

  @override
  String get adminHttpsPort => 'HTTPS порты';

  @override
  String get adminPublicHttpsPort => 'Қоғамдық HTTPS порты';

  @override
  String get adminBaseUrl => 'Негізгі URL';

  @override
  String get adminBaseUrlHint => 'мыс. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS қосыңыз';

  @override
  String get adminLocalNetwork => 'Жергілікті желі';

  @override
  String get adminLocalNetworkAddresses => 'Жергілікті желі мекенжайлары';

  @override
  String get adminKnownProxies => 'Белгілі проксилер';

  @override
  String get adminRemoteIpFilter => 'Қашықтағы IP сүзгісі';

  @override
  String get adminRemoteIpFilterEntries => 'Қашықтағы IP сүзгісі';

  @override
  String get adminCertificatePath => 'Сертификат жолы';

  @override
  String get whitelist => 'Ақ тізім';

  @override
  String get blacklist => 'Қара тізім';

  @override
  String get notSet => 'Орнатылмаған';

  @override
  String get adminMetadataSaved => 'Метадеректер сақталды';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Метадеректерді жүктеу мүмкін болмады: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Метадеректерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminRefreshMetadata => 'Метадеректерді жаңарту';

  @override
  String get recursive => 'Рекурсивті';

  @override
  String get adminReplaceAllMetadata => 'Барлық метадеректерді ауыстырыңыз';

  @override
  String get adminReplaceAllImages => 'Барлық кескіндерді ауыстырыңыз';

  @override
  String get adminMetadataRefreshRequested => 'Метадеректерді жаңарту сұралды';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Метадеректерді жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Қашықтағы сәйкестіктер табылмады';

  @override
  String get adminRemoteResults => 'Қашықтағы нәтижелер';

  @override
  String get adminRemoteMetadataApplied => 'Қашықтағы метадеректер қолданылды';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Қашықтан іздеу орындалмады: $error';
  }

  @override
  String get adminUpdateContentType => 'Мазмұн түрін жаңарту';

  @override
  String get adminContentType => 'Мазмұн түрі';

  @override
  String get adminContentTypeUpdated => 'Мазмұн түрі жаңартылды';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Мазмұн түрін жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Метадеректер өңдегішін жүктеу сәтсіз аяқталды';

  @override
  String get adminNoPeopleEntries => 'Ешқандай адам жоқ';

  @override
  String get adminNoExternalIds => 'Сыртқы идентификаторлар жоқ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType кескіні жаңартылды';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Кескінді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Қолдау көрсетілмейтін кескін пішімі';

  @override
  String get adminImageReadFailed => 'Таңдалған кескінді оқу мүмкін болмады';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType кескіні жүктеп салынды';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType кескінін жою';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType кескіні жойылды';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String get adminAllProviders => 'Барлық провайдерлер';

  @override
  String get adminNoRemoteImages => 'Ешқандай қашықтағы кескіндер табылмады';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Тюнерді табу мүмкін болмады: $error';
  }

  @override
  String get adminAddTuner => 'Тюнер қосыңыз';

  @override
  String get adminEditTuner => 'Тюнерді өңдеу';

  @override
  String get adminTunerTypeM3u => 'M3U тюнері';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл немесе URL';

  @override
  String get adminTunerIpAddress => 'Тюнердің IP мекенжайы';

  @override
  String get adminTunerFriendlyName => 'Ыңғайлы атауы';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Бір мезгілдегі қосылым шегі';

  @override
  String get adminTunerCountHelp =>
      'Тюнер бір мезгілде рұқсат ететін ағындардың ең көп саны. Шектеусіз ету үшін 0 қойыңыз.';

  @override
  String get adminTunerFallbackBitrate => 'Резервтік ең жоғары ағын битрейті';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Тек таңдаулы арналарды импорттау';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Аппараттық транскодтауға рұқсат ету';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 транскодтау контейнеріне рұқсат ету';

  @override
  String get adminTunerAllowStreamSharing =>
      'Ағынды бірлесіп пайдалануға рұқсат ету';

  @override
  String get adminTunerEnableStreamLooping => 'Ағынды циклмен қайталауды қосу';

  @override
  String get adminTunerIgnoreDts => 'DTS елемеу';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Кірісті бастапқы кадр жиілігімен оқу';

  @override
  String get adminEditProvider => 'Провайдерді өңдеу';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл немесе URL';

  @override
  String get adminXmltvMoviePrefix => 'Фильм префиксі';

  @override
  String get adminXmltvMovieCategories => 'Фильм санаттары';

  @override
  String get adminXmltvCategoriesHelp =>
      'Бірнеше санатты тік сызықпен бөліңіз.';

  @override
  String get adminXmltvKidsCategories => 'Балалар санаттары';

  @override
  String get adminXmltvNewsCategories => 'Жаңалықтар санаттары';

  @override
  String get adminXmltvSportsCategories => 'Спорт санаттары';

  @override
  String get adminSdUsername => 'Пайдаланушы аты';

  @override
  String get adminSdPassword => 'Құпия сөз';

  @override
  String get adminSdCountry => 'Ел';

  @override
  String get adminSdCountrySelect => 'Елді таңдаңыз';

  @override
  String get adminSdPostalCode => 'Пошта индексі';

  @override
  String get adminSdGetListings => 'Бағдарламаны алу';

  @override
  String get adminSdListings => 'Бағдарлама';

  @override
  String get adminEnableAllTuners => 'Барлық тюнерді қосу';

  @override
  String get adminTunerType => 'Тюнер түрі';

  @override
  String get adminTunerAdded => 'Тюнер қосылды';

  @override
  String adminTunerAddFailed(String error) {
    return 'Тюнер қосу мүмкін болмады: $error';
  }

  @override
  String get adminAddGuideProvider => 'Гид провайдерін қосыңыз';

  @override
  String get adminProviderType => 'Провайдер түрі';

  @override
  String get adminProviderAdded => 'Провайдер қосылды';

  @override
  String adminProviderAddFailed(String error) {
    return 'Провайдер қосу мүмкін болмады: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Тюнерді жою мүмкін болмады: $error';
  }

  @override
  String get adminTunerResetRequested => 'Тюнерді қалпына келтіру сұралды';

  @override
  String adminTunerResetFailed(String error) {
    return 'Тюнерді ысыру мүмкін болмады: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Тюнердің бұл түрі ысыруды қолдамайды.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Провайдерді жою мүмкін болмады: $error';
  }

  @override
  String get adminRecordingSettings => 'Жазу параметрлері';

  @override
  String get adminPrePadding => 'Алдын ала толтыру (минут)';

  @override
  String get adminPostPadding => 'Толтырудан кейінгі (минут)';

  @override
  String get adminRecordingPath => 'Жазу жолы';

  @override
  String get adminSeriesRecordingPath => 'Сериялық жазу жолы';

  @override
  String get adminMovieRecordingPath => 'Фильм жазбасының жолы';

  @override
  String get adminGuideDays => 'Бағдарлама деректерінің күндері';

  @override
  String get adminGuideDaysAuto => 'Автоматты';

  @override
  String adminGuideDaysValue(int days) {
    return '$days күн';
  }

  @override
  String get adminRecordingPostProcessor => 'Кейінгі өңдеу қолданбасының жолы';

  @override
  String get adminRecordingPostProcessorArgs => 'Кейінгі өңдеу аргументтері';

  @override
  String get adminSaveRecordingNfo => 'Жазбаның NFO метадеректерін сақтау';

  @override
  String get adminSaveRecordingImages => 'Жазба кескіндерін сақтау';

  @override
  String get adminLiveTvSectionTiming => 'Уақыт';

  @override
  String get adminLiveTvSectionPaths => 'Жазба жолдары';

  @override
  String get adminLiveTvSectionPostProcessing => 'Кейінгі өңдеу';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Бағдарлама деректері: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Жазу параметрлері сақталды';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Параметрлерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminSetChannelMappings => 'Арна салыстыруларын орнату';

  @override
  String get adminMappingJson => 'JSON салыстыру';

  @override
  String get adminMappingJsonHint =>
      'Мысал: JSON пайдалы жүктемесін салыстырады';

  @override
  String get adminChannelMappingsUpdated => 'Арналарды салыстыру жаңартылды';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Салыстыруларды жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Live TV әкімшілігі жүктелмеді';

  @override
  String get adminTunerDevices => 'Тюнер құрылғылары';

  @override
  String get adminNoTunerHosts => 'Тюнер хосттары конфигурацияланбаған';

  @override
  String get adminGuideProviders => 'Гид провайдерлері';

  @override
  String get adminRefreshGuideData => 'Бағдарлама деректерін жаңарту';

  @override
  String get adminGuideRefreshStarted =>
      'Бағдарлама деректерін жаңарту басталды';

  @override
  String get adminGuideRefreshUnavailable =>
      'Бағдарламаны жаңарту тапсырмасы бұл серверде қолжетімсіз.';

  @override
  String get adminAddProvider => 'Провайдерді қосу';

  @override
  String get adminNoListingProviders =>
      'Листинг провайдерлері конфигурацияланбаған';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Жазба жолы: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Сериал жолы: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Алдыңғы қор: $minutes мин';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Соңғы қор: $minutes мин';
  }

  @override
  String get adminTunerDiscovery => 'Тюнерді табу';

  @override
  String get adminChannelMappings => 'Арналарды салыстыру';

  @override
  String get adminNoDiscoveredTuners => 'Әлі табылған тюнер жоқ';

  @override
  String get adminSettingsSaved => 'Параметрлер сақталды';

  @override
  String get adminBackupsNotAvailable =>
      'Бұл сервер құрылымында сақтық көшірмелер қол жетімді емес.';

  @override
  String get adminRestoreWarning1 =>
      'Қалпына келтіру БАРЛЫҚ ағымдағы сервер деректерін сақтық көшірме деректерімен ауыстырады.';

  @override
  String get adminRestoreWarning2 =>
      'Ағымдағы сервер параметрлері, пайдаланушылар және кітапхана деректері қайта жазылады.';

  @override
  String get adminRestoreWarning3 =>
      'Қалпына келтіруден кейін сервер қайта іске қосылады.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name сақтық көшірмесі қазір қалпына келтірілсін бе?';
  }

  @override
  String get adminRestoreRequested =>
      'Қалпына келтіру сұралды. Серверді қайта іске қосу бұл сеансты ажыратуы мүмкін.';

  @override
  String get adminBackupsTitle => 'Сақтық көшірмелер';

  @override
  String get adminUnknownDate => 'Белгісіз күн';

  @override
  String get adminUnnamedBackup => 'Аты жоқ сақтық көшірме';

  @override
  String get adminLiveTvNotAvailable =>
      'Тікелей теледидар әкімшілігі бұл сервер құрастыруында қолжетімді емес.';

  @override
  String get adminLiveTvTitle => 'Тікелей теледидар әкімшілігі';

  @override
  String get adminApply => 'Қолдану';

  @override
  String get adminNotSet => 'Орнатылмаған';

  @override
  String get adminReset => 'Қалпына келтіру';

  @override
  String get adminLogsTitle => 'Сервер журналдары';

  @override
  String get adminLogsNewestFirst => 'Ең жаңасы Бірінші';

  @override
  String get adminLogsOldestFirst => 'Ең ескі Бірінші';

  @override
  String get adminLogsJustNow => 'Жаңа ғана';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes мин бұрын';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours сағ бұрын';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days күн бұрын';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName жүктеу мүмкін болмады';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count сәйкестік';
  }

  @override
  String get adminLogViewerNoMatches => 'Сәйкес сызықтар жоқ';

  @override
  String get adminMetadataEditorTitle => 'Метадеректер редакторы';

  @override
  String get adminMetadataIdentify => 'Анықтау';

  @override
  String get adminMetadataType => 'Түр';

  @override
  String get adminMetadataDetails => 'Мәліметтер';

  @override
  String get adminMetadataExternalIds => 'Сыртқы идентификаторлар';

  @override
  String get adminMetadataImages => 'Суреттер';

  @override
  String get adminMetadataFieldTitle => 'Атауы';

  @override
  String get adminMetadataFieldSortTitle => 'Тақырыпты сұрыптау';

  @override
  String get adminMetadataFieldOriginalTitle => 'Түпнұсқа атауы';

  @override
  String get adminMetadataFieldPremiereDate => 'Премьера күні (ЖЖЖЖ-АА-КК)';

  @override
  String get adminMetadataFieldEndDate => 'Аяқталу күні (ЖЖЖЖ-АА-КК)';

  @override
  String get adminMetadataFieldProductionYear => 'Өндіріс жылы';

  @override
  String get adminMetadataFieldOfficialRating => 'Ресми рейтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Қауымдастық рейтингі';

  @override
  String get adminMetadataFieldCriticRating => 'Сыни бағалау';

  @override
  String get adminMetadataFieldTagline => 'Таглайн';

  @override
  String get adminMetadataFieldOverview => 'Шолу';

  @override
  String get adminMetadataGenres => 'Жанрлар';

  @override
  String get adminMetadataTags => 'Тегтер';

  @override
  String get adminMetadataStudios => 'Студиялар';

  @override
  String get adminMetadataPeople => 'Адамдар';

  @override
  String get adminMetadataAddGenre => 'Жанр қосыңыз';

  @override
  String get adminMetadataAddTag => 'Тег қосыңыз';

  @override
  String get adminMetadataAddStudio => 'Студия қосыңыз';

  @override
  String get adminMetadataAddPerson => 'Адам қосу';

  @override
  String get adminMetadataEditPerson => 'Адамды өңдеу';

  @override
  String get adminMetadataRole => 'Рөл';

  @override
  String get adminMetadataImagePrimary => 'Негізгі';

  @override
  String get adminMetadataImageBackdrop => 'Фон';

  @override
  String get adminMetadataImageLogo => 'Логотип';

  @override
  String get adminMetadataImageBanner => 'Баннер';

  @override
  String get adminMetadataImageThumb => 'Бас бармақ';

  @override
  String get adminMetadataRecursive => 'Рекурсивті';

  @override
  String get adminMetadataProvider => 'Провайдер';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType кескіні жаңартылды';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType кескіні жүктеп салынды';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType кескіні жойылды';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Кескінді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Таңдалған кескінді оқу мүмкін болмады';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType кескінін жою';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Бұл элементтен ағымдағы кескінді жояды.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType кескінін таңдау';
  }

  @override
  String get adminMetadataUpload => 'Жүктеп салу';

  @override
  String get adminMetadataUpdate => 'Жаңарту';

  @override
  String get adminMetadataRemoteImage => 'Қашықтағы кескін';

  @override
  String get adminPluginsInstalled => 'Орнатылған';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Белсенді';

  @override
  String get adminPluginsRestart => 'Қайтадан қосу';

  @override
  String get adminPluginsNoSearchResults =>
      'Іздеуіңізге сәйкес келетін плагиндер жоқ';

  @override
  String get adminPluginsNoneInstalled => 'Ешқандай плагин орнатылмаған';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Жаңарту қолжетімді: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Жаңарту қолжетімді';

  @override
  String get adminPluginsPendingRemoval =>
      'Қайта іске қосқаннан кейін жою күтілуде';

  @override
  String get adminPluginsChangesPending =>
      'Қайта іске қосуды күткен өзгерістер';

  @override
  String get adminPluginsEnable => 'Қосу';

  @override
  String get adminPluginsDisable => 'Өшіру';

  @override
  String get adminPluginsInstallUpdate => 'Жаңартуды орнату';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Жаңартуды орнату (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Іздеуіңізге сәйкес пакеттер жоқ';

  @override
  String get adminPluginsCatalogEmpty => 'Қолжетімді пакеттер жоқ';

  @override
  String adminPluginsInstalling(String name) {
    return '«$name» орнатылуда...';
  }

  @override
  String get adminPluginDetailExperimental => 'Эксперименттік интеграция';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Плагин параметрлерін біріктіру әлі эксперименталды. Кейбір өрістер немесе орналасулар әлі дұрыс көрсетілмеуі мүмкін.';

  @override
  String get adminPluginDetailToggle404 =>
      'Плагинді ауыстырып қосу мүмкін болмады. Сервер бұл плагин нұсқасын таба алмады. Плагиндерді жаңартып көріңіз, содан кейін әрекетті қайталаңыз.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Плагинді ауыстырып қосу мүмкін болмады. Мәліметтер алу үшін сервер журналдарын тексеріңіз.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name параметрлері';
  }

  @override
  String get adminPluginDetailDetails => 'Мәліметтер';

  @override
  String get adminPluginDetailDeveloper => 'Әзірлеуші';

  @override
  String get adminPluginDetailRepository => 'Репозиторий';

  @override
  String get adminPluginDetailBundled => 'Жинақталған';

  @override
  String get adminPluginDetailEnablePlugin => 'Плагинді қосыңыз';

  @override
  String get adminPluginDetailRestartRequired =>
      'Өзгерістердің күшіне енуі үшін серверді қайта іске қосу қажет.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Бұл плагин серверді қайта іске қосқаннан кейін жойылады.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Бұл плагин дұрыс жұмыс істемеді және дұрыс жұмыс істемеуі мүмкін.';

  @override
  String get adminPluginDetailNotSupported =>
      'Бұл плагинге ағымдағы сервер нұсқасы қолдау көрсетпейді.';

  @override
  String get adminPluginDetailSuperseded =>
      'Бұл плагин жаңарақ нұсқасымен ауыстырылды.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Репозиторийлерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Репозиторийді жою';

  @override
  String adminReposRemoveConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String get adminReposRemove => 'Алып тастау';

  @override
  String adminReposSaveFailed(String error) {
    return 'Репозиторийлерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminReposEmpty => 'Репозиторийлер конфигурацияланбаған';

  @override
  String get adminReposEmptySubtitle =>
      'Қол жетімді плагиндерді шолу үшін репозиторий қосыңыз';

  @override
  String get adminReposUnnamed => '(аты жоқ)';

  @override
  String get adminReposEditTitle => 'Репозиторийді өңдеу';

  @override
  String get adminReposAddTitle => 'Репозиторий қосу';

  @override
  String get adminReposUrl => 'Репозиторий URL';

  @override
  String get adminReposNameHint => 'мысалы Jellyfin Тұрақты';

  @override
  String get adminPluginSettingsInvalidUrl => 'Жарамсыз URL';

  @override
  String get adminGeneralSettingsTitle => 'Жалпы параметрлер';

  @override
  String get adminGeneralMetadataLanguage => 'Таңдаулы метадеректер тілі';

  @override
  String get adminGeneralMetadataLanguageHint => 'мысалы en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Таңдаулы метадеректер елі';

  @override
  String get adminGeneralMetadataCountryHint => 'мысалы АҚШ, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Кітапхананы сканерлеудің параллельдігі';

  @override
  String get adminGeneralImageEncodingLimit => 'Параллель кескінді кодтау шегі';

  @override
  String get adminUnknownError => 'Белгісіз қате';

  @override
  String get adminBrowse => 'Шолу';

  @override
  String get adminCloseBrowser => 'Браузерді жабыңыз';

  @override
  String get adminNetworkingTitle => 'Желі құру';

  @override
  String get adminNetworkingRestartWarning =>
      'Желі параметрлерін өзгерту серверді қайта іске қосуды қажет етуі мүмкін.';

  @override
  String get adminNetworkingRemoteAccess => 'Қашықтан қол жеткізуді қосыңыз';

  @override
  String get adminNetworkingPorts => 'Порттар';

  @override
  String get adminNetworkingHttpPort => 'HTTP порты';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS порты';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS қосыңыз';

  @override
  String get adminNetworkingLocalNetwork => 'Жергілікті желі';

  @override
  String get adminNetworkingLocalAddresses => 'Жергілікті желі мекенжайлары';

  @override
  String get adminNetworkingAddressHint => 'мысалы 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Белгілі проксилер';

  @override
  String get adminNetworkingProxyHint => 'мысалы 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Ақ тізім';

  @override
  String get adminNetworkingBlacklist => 'Қара тізім';

  @override
  String get adminNetworkingAddEntry => 'Жазба қосу';

  @override
  String get adminBrandingTitle => 'Брендинг';

  @override
  String get adminBrandingLoginDisclaimer => 'Жүйеге кіруден бас тарту';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'Жүйеге кіру пішінінің астында HTML көрсетіледі';

  @override
  String get adminBrandingCustomCss => 'Арнаулы CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Веб-интерфейске қолданылған пайдаланушы CSS';

  @override
  String get adminBrandingEnableSplash => 'Экранды қосу';

  @override
  String get adminBrandingSplashUpload => 'Кескінді жүктеп салу';

  @override
  String get adminBrandingSplashUploaded => 'Бастау экраны жаңартылды';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Бастау экранын жүктеп салу мүмкін болмады';

  @override
  String get adminBrandingSplashDeleted => 'Бастау экраны жойылды';

  @override
  String get adminBrandingNoSplash => 'Жеке бастау экраны жоқ';

  @override
  String get adminPlaybackHwAccel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackHwAccelLabel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackEnableHwEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Аппараттық құралдардың декодтауын қосыңыз:';

  @override
  String get adminPlaybackQsvDevice => 'QSV құрылғысы';

  @override
  String get adminPlaybackEnhancedNvdec => 'Кеңейтілген NVDEC декодерін қосу';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Жүйенің өз аппараттық декодерін таңдау';

  @override
  String get adminPlaybackColorDepth => 'Аппараттық декодтаудың түс тереңдігі';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 биттік HEVC декодтауы';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 биттік VP9 декодтауы';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 биттік декодтауы';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 биттік декодтауы';

  @override
  String get adminPlaybackHwEncodingSection => 'Аппараттық кодтау';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC кодтауына рұқсат ету';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 кодтауына рұқсат ету';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel аз қуатты H.264 кодерін қосу';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel аз қуатты HEVC кодерін қосу';

  @override
  String get adminPlaybackToneMapping => 'Тон салыстыру';

  @override
  String get adminPlaybackEnableTonemapping => 'Тон салыстыруды қосу';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP тон салыстыруын қосу';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox тон салыстыруын қосу';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Тон салыстыру алгоритмі';

  @override
  String get adminPlaybackTonemappingMode => 'Тон салыстыру режимі';

  @override
  String get adminPlaybackTonemappingRange => 'Тон салыстыру ауқымы';

  @override
  String get adminPlaybackTonemappingDesat => 'Тон салыстыру десатурациясы';

  @override
  String get adminPlaybackTonemappingPeak => 'Тон салыстыру шыңы';

  @override
  String get adminPlaybackTonemappingParam => 'Тон салыстыру параметрі';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP тон салыстыруының жарықтығы';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP тон салыстыруының контрасты';

  @override
  String get adminPlaybackPresetsQuality => 'Дайын баптаулар және сапа';

  @override
  String get adminPlaybackEncoderPreset => 'Кодер баптауы';

  @override
  String get adminPlaybackH264Crf => 'H.264 кодтауының CRF мәні';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) кодтауының CRF мәні';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Деинтерлейс әдісі';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Деинтерлейс кезінде кадр жиілігін екі есе арттыру';

  @override
  String get adminPlaybackAudioSection => 'Аудио';

  @override
  String get adminPlaybackEnableAudioVbr => 'VBR аудиокодтауын қосу';

  @override
  String get adminPlaybackDownmixBoost =>
      'Аудионы араластыру кезіндегі күшейту';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Стереоға араластыру алгоритмі';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Мультиплекстеу кезегінің ең үлкен өлшемі';

  @override
  String get adminPlaybackAutoOption => 'Авто';

  @override
  String get adminPlaybackEncoding => 'Кодтау';

  @override
  String get adminPlaybackEncodingThreads => 'Жіптерді кодтау';

  @override
  String get adminPlaybackFallbackFont => 'Қосымша қаріпті қосыңыз';

  @override
  String get adminPlaybackFallbackFontPath => 'Қайта қаріп жолы';

  @override
  String get adminPlaybackStreaming => 'Ағын';

  @override
  String get adminResumeVideo => 'Бейне';

  @override
  String get adminResumeAudiobooks => 'Аудиокітаптар';

  @override
  String get adminResumeMinAudiobookPct =>
      'Аудиокітап түйіндемесінің ең аз пайызы';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Аудиокітап түйіндемесінің максималды пайызы';

  @override
  String get adminStreamingBitrateLimit =>
      'Қашықтағы клиенттің бит жылдамдығының шегі (Мбит/с)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Бос қалдырыңыз немесе шектеусіз үшін 0 қалдырыңыз';

  @override
  String get adminTrickplayHwAccel => 'Аппараттық жеделдетуді қосыңыз';

  @override
  String get adminTrickplayHwEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Тек негізгі кадрды шығаруды қосыңыз';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Жылдамырақ, бірақ дәлдігі төмен';

  @override
  String get adminTrickplayNonBlocking => 'Блокталмайтын';

  @override
  String get adminTrickplayBlocking => 'Блоктау';

  @override
  String get adminTrickplayPriorityHigh => 'Жоғары';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Қалыптыдан жоғары';

  @override
  String get adminTrickplayPriorityNormal => 'Қалыпты';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Қалыптыдан төмен';

  @override
  String get adminTrickplayPriorityIdle => 'Бос';

  @override
  String get adminTrickplayImageSettings => 'Кескін параметрлері';

  @override
  String get adminTrickplayInterval => 'Аралық (мс)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Жақтауларды қаншалықты жиі түсіру керек';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Үтірмен бөлінген пиксель ені (мысалы, 320)';

  @override
  String get adminTrickplayQuality => 'Сапасы';

  @override
  String get adminTrickplayQScale => 'Сапа шкаласы';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Төменгі мәндер = жақсы сапа, үлкенірек файлдар';

  @override
  String get adminTrickplayJpegQuality => 'JPEG сапасы';

  @override
  String get adminTrickplayProcessing => 'Өңдеу';

  @override
  String get adminTasksEmpty => 'Жоспарланған тапсырмалар табылмады';

  @override
  String get adminTasksNoFilterMatch =>
      'Ағымдағы сүзгіге сәйкес тапсырмалар жоқ';

  @override
  String get adminTaskCancelling => 'Бас тартуда...';

  @override
  String get adminTaskRunning => 'Жүгіру...';

  @override
  String get adminTaskNeverRun => 'Ешқашан жүгірме';

  @override
  String get adminTaskStop => 'Тоқтату';

  @override
  String get adminRunningTasks => 'Орындалып жатқан тапсырмалар';

  @override
  String get adminTaskRun => 'Жүгіру';

  @override
  String get adminTaskDetailLastExecution => 'Соңғы орындалу';

  @override
  String get adminTaskDetailStarted => 'Басталды';

  @override
  String get adminTaskDetailEnded => 'Аяқталды';

  @override
  String get adminTaskDetailDuration => 'Ұзақтығы';

  @override
  String get adminTaskDetailErrorLabel => 'Қате:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Күн сайын $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Әр $day сайын $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Әр $duration сайын';
  }

  @override
  String get adminTaskTriggerStartup => 'Қолданбаны іске қосу кезінде';

  @override
  String get adminTaskTriggerTypeDaily => 'Күнделікті';

  @override
  String get adminTaskTriggerTypeWeekly => 'Апта сайын';

  @override
  String get adminTaskTriggerTypeInterval => 'Аралықта';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Әр сағат сайын';

  @override
  String get adminTaskTriggerEvery6Hours => 'Әр 6 сағат сайын';

  @override
  String get adminTaskTriggerEvery12Hours => 'Әр 12 сағат сайын';

  @override
  String get adminTaskTriggerEvery24Hours => 'Әр 24 сағат сайын';

  @override
  String get adminTaskTriggerEvery2Days => 'Әр 2 күн сайын';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сағат',
      one: '$count сағат',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Уақыт';

  @override
  String get adminTaskTriggerNoLimit => 'Шектеу жоқ';

  @override
  String get adminActivityJustNow => 'Жаңа ғана';

  @override
  String get adminActivityLastHour => 'Соңғы сағат';

  @override
  String get adminActivityToday => 'Бүгін';

  @override
  String get adminActivityYesterday => 'Кеше';

  @override
  String get adminActivityOlder => 'Үлкенірек';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days күн бұрын';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours сағ бұрын';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes мин бұрын';
  }

  @override
  String get adminActivityNow => 'қазір';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours сағ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days күн';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Айналдыру кезіндегі алдын ала қарау нобайлары үшін trickplay кескіндерін жасауды реттеңіз.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Қоғамдық HTTPS порты';

  @override
  String get adminNetworkingBaseUrl => 'Негізгі URL';

  @override
  String get adminNetworkingBaseUrlHint => 'мыс. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Ашық HTTP порты';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS талап ету';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Барлық қашықтағы сұраныстарды HTTPS-ке бағыттау. Серверде жарамды сертификат болмаса, әсер етпейді.';

  @override
  String get adminNetworkingCertPassword => 'Сертификат құпия сөзі';

  @override
  String get adminNetworkingIpSettings => 'IP параметрлері';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 қосу';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 қосу';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Порттарды автоматты салыстыруды қосу';

  @override
  String get adminNetworkingLocalSubnets => 'LAN желілері';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Жергілікті желіде деп саналатын IP мекенжайлардың немесе CIDR ішкі желілерінің үтірмен не жол бойынша бөлінген тізімі.';

  @override
  String get adminNetworkingPublishedUris =>
      'Жарияланған сервер URI мекенжайлары';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Ішкі желіні немесе мекенжайды жарияланған URL-ге салыстырыңыз, мыс. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Сертификат жолы';

  @override
  String get adminNetworkingRemoteIpFilter => 'Қашықтағы IP сүзгісі';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Қашықтағы IP сүзгісі';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API құрылғысы';

  @override
  String get adminPlaybackAutomatic => '0 = автоматты';

  @override
  String get adminPlaybackTranscodeTempPath => 'Транскодтау уақытша жол';

  @override
  String get adminPlaybackSegmentDeletion => 'Сегментті жоюға рұқсат ету';

  @override
  String get adminPlaybackSegmentKeep => 'Сегменттерді сақтау (секундтар)';

  @override
  String get adminPlaybackThrottleBuffering => 'Дроссельді буферлеу';

  @override
  String get adminPlaybackThrottleDelay => 'Ағынды шектеу кідірісі (секунд)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Субтитрлерді жүріп жатқанда шығарып алуға рұқсат ету';

  @override
  String get adminResumeMinPct => 'Резюменің минималды пайызы';

  @override
  String get adminResumeMinPctSubtitle =>
      'Прогрессті сақтау үшін мазмұн осы пайыздан жоғары ойнатылуы керек';

  @override
  String get adminResumeMaxPct => 'Резюменің максималды пайызы';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Осы пайыздан кейін мазмұн толығымен ойнатылды деп саналады';

  @override
  String get adminResumeMinDuration => 'Ең аз түйіндеме ұзақтығы (секунд)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Бұдан қысқа элементтерді қалпына келтіру мүмкін емес';

  @override
  String get adminTrickplayScanBehavior => 'Тәртіпті сканерлеу';

  @override
  String get adminTrickplayProcessPriority => 'Процесс басымдығы';

  @override
  String get adminTrickplayTileWidth => 'Плитка ені';

  @override
  String get adminTrickplayTileHeight => 'Плитка биіктігі';

  @override
  String get adminTrickplayProcessThreads => 'Жіптерді өңдеу';

  @override
  String get adminTrickplayWidthResolutions => 'Ені ажыратымдылықтары';

  @override
  String get adminMetadataDefault => 'Әдепкі';

  @override
  String get adminMetadataContentTypeUpdated => 'Мазмұн түрі жаңартылды';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Мазмұн түрін жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Баяу жауап шегі (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Баяу жауап туралы ескертулерді қосу';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect қосу';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метадеректер';

  @override
  String get adminGeneralSectionPaths => 'Жолдар';

  @override
  String get adminGeneralSectionPerformance => 'Өнімділік';

  @override
  String get adminGeneralCachePath => 'Кэш жолы';

  @override
  String get adminGeneralMetadataPath => 'Метадеректер жолы';

  @override
  String get adminGeneralServerName => 'Сервер атауы';

  @override
  String get adminGeneralDisplayLanguage => 'Қалаулы көрсету тілі';

  @override
  String get adminSettingsLoadFailed => 'Параметрлерді жүктеу сәтсіз аяқталды';

  @override
  String get adminDiscover => 'Ашу';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Салыстыруларды жаңарту мүмкін болмады: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Уақыт шегі: $duration';
  }

  @override
  String get folders => 'Қалталар';

  @override
  String get libraries => 'Медиатекалар';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay өшірілген';

  @override
  String get syncPlayDisabledMessage =>
      'Синхрондалған ойнатуды пайдалану үшін SyncPlay параметрін Параметрлерде қосыңыз.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Серверге қолдау көрсетілмейді';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay үшін Jellyfin сервері қажет. Ағымдағы сервер оны қолдамайды.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay тобы';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay тобы';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# қатысушы',
      one: '# қатысушы',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Күтуді елемеу';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Бұл құрылғы буферленген кезде топты жоғары ұстамаңыз';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Баяу мүшелерді күтпестен жергілікті жерде жалғастырыңыз';

  @override
  String get syncPlayRepeat => 'Қайталау';

  @override
  String get syncPlayRepeatOne => 'Бір';

  @override
  String get syncPlayShuffleModeShuffled => 'Аралас';

  @override
  String get syncPlayShuffleModeSorted => 'Сұрыпталған';

  @override
  String get syncPlaySyncCurrentQueue => 'Ағымдағы ойнату кезегін синхрондау';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Топтық кезекті жергілікті жерде ойнайтын нәрсемен ауыстырыңыз';

  @override
  String get syncPlayLeaveGroup => 'Топтан шығу';

  @override
  String get syncPlayGroupQueue => 'Топтық кезек';

  @override
  String syncPlayQueueItemFallback(int index) {
    return '$index-элемент';
  }

  @override
  String get syncPlayPlayNow => 'Қазір ойнаңыз';

  @override
  String get syncPlayCreateNewGroup => 'Жаңа топ құру';

  @override
  String get syncPlayGroupName => 'Топ аты';

  @override
  String get syncPlayDefaultGroupName => 'Менің SyncPlay тобым';

  @override
  String get syncPlayCreateGroup => 'Топ құру';

  @override
  String get syncPlayAvailableGroups => 'Қолжетімді топтар';

  @override
  String get syncPlayNoGroupsAvailable => 'Топтар жоқ';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay тобына қосылу керек пе?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay тобына қосылу ағымдағы ойнату кезегін ауыстыруы мүмкін. Жалғастыру керек пе?';

  @override
  String get syncPlayJoin => 'Қосылыңыз';

  @override
  String get syncPlayStateIdle => 'Бос';

  @override
  String get syncPlayStateWaiting => 'Күтуде';

  @override
  String get syncPlayStatePaused => 'Кідіртілді';

  @override
  String get syncPlayStatePlaying => 'Ойнап жатыр';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay тобына қосылды';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay тобынан шықты';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay кіруге тыйым салынды';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Осы SyncPlay тобындағы бір немесе бірнеше элементтерге кіру рұқсатыңыз жоқ. Топ иесінен кітапхана рұқсаттарын тексеруді немесе басқа кезекті таңдауды сұраңыз.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Ойнату $groupName тобымен синхрондалуда';
  }

  @override
  String get voiceSearchUnavailable => 'Дауыспен іздеу қолжетімсіз.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision тікелей ойнату сәтсіз аяқталды';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Осы Dolby Vision ағыны үшін тікелей ойнатуды бастау мүмкін болмады. Серверді қайта кодтау арқылы қайталап көріңіз бе?';

  @override
  String get retryWithTranscode => 'Транскод арқылы қайталап көріңіз';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision қолданбасына қолдау көрсетілмейді';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Бұл құрылғы Dolby Vision мазмұнын тікелей шеше алмайды. HDR10 қалпына келтіру нұсқасын пайдаланыңыз немесе серверді қайта кодтауды сұраңыз.';

  @override
  String get rememberMyChoice => 'Менің таңдауымды есте сақтаңыз';

  @override
  String get playHdr10Fallback => 'HDR10 нұсқасын ойнату';

  @override
  String get requestTranscode => 'Транскодты сұрау';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# жол табылды',
      one: '# жол табылды',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Барлығын көру';

  @override
  String get noItems => 'Элементтер жоқ';

  @override
  String get switchUser => 'Пайдаланушыны ауыстыру';

  @override
  String get remoteControl => 'Қашықтан басқару құралы';

  @override
  String get mediaBarLoading => 'Медиа жолағы жүктелуде...';

  @override
  String get mediaBarError => 'Медиа жолақ жүктелмеді';

  @override
  String get offlineServerUnavailable =>
      'Интернетке қосылған, бірақ ағымдағы сервер қолжетімсіз.';

  @override
  String get offlineNoInternet =>
      'Сіз желіден тыссыз. Тек жүктеп алынған мазмұн қолжетімді.';

  @override
  String get offlineFileNotAvailable => 'Файл қолжетімді емес';

  @override
  String get offlineSwitchServer => 'Серверді ауыстыру';

  @override
  String get offlineSavedMedia => 'Сақталған медиа';

  @override
  String get offlineBannerTitle => 'Желіден тыссыз';

  @override
  String get offlineBannerSubtitle => 'Жүктеулеріңіз көрсетілуде';

  @override
  String get offlineBannerAction => 'Жүктеулер';

  @override
  String get serverUnreachableBannerTitle => 'Серверге қосылу мүмкін емес';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Ол қайта қосылғанша жүктеулерден ойнатылуда';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Қашықтан ойнату';

  @override
  String castControlFailed(String error) {
    return 'Cast басқаруы орындалмады: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind басқару элементтері';
  }

  @override
  String get castDeviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get castVolumeUnavailable => 'Қолжетімсіз';

  @override
  String castStopKind(String kind) {
    return '$kind тоқтату';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Субтитрлер';

  @override
  String get pinConfirmTitle => 'PIN кодын растаңыз';

  @override
  String get pinSetTitle => 'PIN кодын орнату';

  @override
  String get pinEnterTitle => 'PIN кодын енгізіңіз';

  @override
  String get pinReenterToConfirm => 'Растау үшін PIN кодын қайта енгізіңіз';

  @override
  String pinEnterNDigit(int length) {
    return '$length таңбалы PIN енгізіңіз';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length таңбалы PIN кодыңызды енгізіңіз';
  }

  @override
  String get pinIncorrect => 'Қате PIN';

  @override
  String get pinMismatch => 'PIN кодтары сәйкес келмейді';

  @override
  String get pinForgot => 'PIN кодын ұмыттыңыз ба?';

  @override
  String get pinClear => 'Тазалау';

  @override
  String get pinBackspace => 'Жою';

  @override
  String get quickConnectAuthorized => 'Quick Connect сұранысы расталды.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect коды жарамсыз немесе мерзімі өткен.';

  @override
  String get quickConnectNotSupported =>
      'Бұл серверде Quick Connect функциясына қолдау көрсетілмейді.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect кодын растау мүмкін болмады.';

  @override
  String get quickConnectDisabled => 'Бұл серверде Quick Connect өшірілген.';

  @override
  String get quickConnectForbidden =>
      'Тіркелгіңіз осы Quick Connect сұрауына рұқсат бере алмайды.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect коды табылмады. Жаңа кодты байқап көріңіз.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect қатесі: $message';
  }

  @override
  String get quickConnectEnterCode => 'Кодты енгізіңіз';

  @override
  String get quickConnectAuthorize => 'Рұқсат ету';

  @override
  String remoteCommandFailed(String error) {
    return 'Пәрмен орындалмады: $error';
  }

  @override
  String get remoteControlTitle => 'Қашықтан басқару құралы';

  @override
  String get remoteFailedToLoadSessions => 'Сеанстарды жүктеу сәтсіз аяқталды';

  @override
  String get remoteNoSessions => 'Басқарылатын сеанстар жоқ';

  @override
  String get remoteStartPlayback => 'Басқа құрылғыда ойнатуды бастаңыз';

  @override
  String get unknownUser => 'Белгісіз';

  @override
  String get unknownItem => 'Белгісіз';

  @override
  String get remoteNothingPlaying => 'Бұл сеанста ештеңе ойнамайды';

  @override
  String get castingStarted => 'Таңдалған құрылғыда трансляция басталды';

  @override
  String castingFailed(String error) {
    return 'Тасымалдауды бастау мүмкін болмады: $error';
  }

  @override
  String get noRemoteDevices => 'Қашықтан ойнату құрылғылары қолжетімді емес.';

  @override
  String get noRemoteDevicesIos =>
      'Қашықтан ойнату құрылғылары қолжетімді емес.\n\niOS жүйесінде AirPlay мақсаттары симуляторда қолжетімсіз болуы мүмкін.';

  @override
  String get trackActionPlayNext => 'Келесі ойнату';

  @override
  String get trackActionAddToQueue => 'Кезекке қосу';

  @override
  String get trackActionAddToPlaylist => 'Ойнату тізіміне қосу';

  @override
  String get trackActionCancelDownload => 'Жүктеп алудан бас тарту';

  @override
  String get trackActionDeleteFromPlaylist => 'Ойнату тізімінен жою';

  @override
  String get trackActionMoveUp => 'Жоғары жылжыту';

  @override
  String get trackActionMoveDown => 'Төменге жылжытыңыз';

  @override
  String get trackActionRemoveFromFavorites => 'Таңдаулылардан өшіру';

  @override
  String get trackActionAddToFavorites => 'Таңдаулыларға қосу';

  @override
  String get trackActionGoToAlbum => 'Альбомға өтіңіз';

  @override
  String get trackActionGoToArtist => 'Суретшіге өтіңіз';

  @override
  String trackActionDownloading(String name) {
    return '$name жүктелуде...';
  }

  @override
  String get trackActionDeletedFile => 'Жүктеп алынған файл жойылды';

  @override
  String get trackActionDeleteFileFailed =>
      'Жүктеп алынған файлды жою мүмкін болмады';

  @override
  String get shuffleBy => 'Араластыру';

  @override
  String get shuffleSelectLibrary => 'Кітапхана таңдаңыз';

  @override
  String get shuffleSelectGenre => 'Жанр таңдаңыз';

  @override
  String get shuffleLibrary => 'Медиатека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Үйлесімді кітапханалар жоқ.';

  @override
  String get shuffleNoGenres => 'Бұл араластыру режимі үшін жанрлар табылмады.';

  @override
  String get posterDisplayTitle => 'Дисплей';

  @override
  String get posterImageType => 'Кескін түрі';

  @override
  String get imageTypePoster => 'Постер';

  @override
  String get imageTypeThumbnail => 'Нобай';

  @override
  String get imageTypeBanner => 'Баннер';

  @override
  String get playlistAddFailed => 'Ойнату тізіміне қосу мүмкін болмады';

  @override
  String get playlistCreateFailed => 'Ойнату тізімі жасалмады';

  @override
  String get playlistNew => 'Жаңа ойнату тізімі';

  @override
  String get playlistCreate => 'Жасау';

  @override
  String get playlistCreateNew => 'Жаңа ойнату тізімін жасау';

  @override
  String get playlistNoneFound => 'Ойнату тізімдері табылмады';

  @override
  String get addToPlaylist => 'Ойнату тізіміне қосу';

  @override
  String get lyricsNotAvailable => 'Ән мәтіндері жоқ';

  @override
  String get upNext => 'Келесі';

  @override
  String get playNext => 'Келесі ойнату';

  @override
  String get stillWatchingContent =>
      'Ойнату кідіртілді. Сіз әлі қарап отырсыз ба?';

  @override
  String get stillWatchingStop => 'Тоқтату';

  @override
  String get stillWatchingContinue => 'Жалғастыру';

  @override
  String skipSegment(String segment) {
    return '$segment өткізіп жіберу';
  }

  @override
  String get liveTv => 'Тікелей теледидар';

  @override
  String get continueWatchingAndNextUp => 'Көруді және келесіні жалғастыру';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$total ішінен $current жүктелуде — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName жүктелуде';
  }

  @override
  String get nextEpisode => 'Келесі эпизод';

  @override
  String get moreFromThisSeason => 'Осы маусымнан көбірек';

  @override
  String get playerTooltipPlaybackSpeed => 'Ойнату жылдамдығы';

  @override
  String get playerTooltipCastControls => 'Трансляцияны басқару элементтері';

  @override
  String get playerTooltipPlaybackQuality => 'Бит жылдамдығы';

  @override
  String get playerTooltipEnterFullscreen => 'Толық экранға өтіңіз';

  @override
  String get playerTooltipExitFullscreen => 'Толық экраннан шығу';

  @override
  String get playerTooltipFloatOnTop => 'Үстінде қалқыңыз';

  @override
  String get playerTooltipExitFloatOnTop => 'Үстіңгі жағындағы қалқыманы өшіру';

  @override
  String get playerTooltipLockLandscape => 'Пейзажды құлыптау';

  @override
  String get playerTooltipUnlockOrientation => 'Айналдыруға рұқсат етіңіз';

  @override
  String get playerTooltipPrevious => 'Алдыңғы';

  @override
  String get playerTooltipSeekBack => 'Артқа іздеу';

  @override
  String get playerTooltipSeekForward => 'Алға ұмтыл';

  @override
  String get contextMenuMarkWatched => 'Қаралған деп белгілеу';

  @override
  String get contextMenuMarkUnwatched => 'Қаралмаған деп белгілеңіз';

  @override
  String get contextMenuAddToFavorites => 'Таңдаулыларға қосу';

  @override
  String get contextMenuRemoveFromFavorites => 'Таңдаулылардан өшіру';

  @override
  String get contextMenuGoToSeries => 'Серияға өтіңіз';

  @override
  String get contextMenuHideFromContinueWatching =>
      '«Көруді жалғастыру» бөлімінен жасыру';

  @override
  String get contextMenuHideFromNextUp => '«Келесі» бөлімінен жасыру';

  @override
  String get contextMenuAddToCollection => 'Жинаққа қосу';

  @override
  String get settingsAdministrationSubtitle =>
      'Серверді басқару тақтасына қол жеткізіңіз';

  @override
  String get settingsAccountSecurity => 'Есептік жазба және қауіпсіздік';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Аутентификация, PIN коды және ата-ана бақылауы';

  @override
  String get settingsPersonalization => 'Жекелендіру';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тақырып, шарлау, негізгі жолдар және кітапхананың көрінуі';

  @override
  String get settingsDynamicContent => 'Динамикалық мазмұн';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиа жолағы және көрнекі қабаттасмалар';

  @override
  String get settingsPlaybackSyncplay => 'Ойнату және SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Аудио/бейне параметрлері, субтитрлер, жүктеулер және SyncPlay басқару элементтері';

  @override
  String get settingsIntegrationsSubtitle =>
      'Плагинді синхрондау, Seerr, рейтингтер және т.б';

  @override
  String get settingsAboutSubtitle =>
      'Қолданба нұсқасы, заңды ақпарат және несиелер';

  @override
  String get settingsAuthenticationSection => 'АВТЕНТТЕУ';

  @override
  String get settingsSortServersBy => 'Серверлерді сұрыптау';

  @override
  String get settingsLastUsed => 'Соңғы пайдаланылған';

  @override
  String get settingsAlphabetical => 'Алфавиттік';

  @override
  String get settingsConnectionSection => 'ҚОСЫЛЫМ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Өздігінен қол қойылған сертификаттарға рұқсат ету';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Өздігінен қол қойылған немесе жеке ЦС берген TLS сертификаттарын пайдаланатын серверлерге сену. Тек өзіңіз басқаратын серверлер үшін қосыңыз. Бұл барлық қосылым үшін сертификатты тексеруді өшіреді.';

  @override
  String get settingsPrivacyAndSafetySection => 'ҚҰПИЯЛЫҚ ЖӘНЕ ҚАУІПСІЗДІК';

  @override
  String get settingsBlockedRatings => 'Блокталған рейтингтер';

  @override
  String get settingsGeneralStyle => 'Жалпы стиль';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тақырып екпіні, фон, қаралған индикаторлар және тақырыптық музыка';

  @override
  String get settingsDetailsScreen => 'Мәліметтер экраны';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стиль, фонды бұлдырлату және қойынды әрекеті';

  @override
  String get settingsHomePage => 'Негізгі бет';

  @override
  String get settingsHomePageSubtitle =>
      'Бөлімдер, кескін түрлері, қабаттасулар және мультимедианы алдын ала қарау';

  @override
  String get settingsLibrariesSubtitle =>
      'Кітапхананың көрінуі, қалта көрінісі және көп сервер әрекеті';

  @override
  String get settingsTwentyFourHourClock => '24 сағаттық сағат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Сағат көрсетілген жерде 24 сағаттық уақыт пішімдеуін пайдаланыңыз';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Шарлау жолағында араластыру түймесін көрсетіңіз';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Шарлау жолағында жанрлар түймесін көрсетіңіз';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Навигация жолағында таңдаулылар түймесін көрсетіңіз';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Шарлау жолағында кітапханалар түймесін көрсетіңіз';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Навигация жолағында Seerr түймесін көрсету';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Жоғарғы навигация жолағында мәтіндік белгілерді әрқашан көрсету';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Әрбір кітапхананың басты бетінің көріну мүмкіндігін ауыстырып-қосқыш. Өзгерістердің күшіне енуі үшін Moonfin қолданбасын қайта іске қосыңыз.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медиа жолағы және жергілікті алдын ала қараулар';

  @override
  String get settingsVisualOverlays => 'Көрнекі қабаттасулар';

  @override
  String get settingsSeasonalSurprise => 'Маусымдық тосынсый';

  @override
  String get settingsMetadataAndRatings => 'Метадеректер және рейтингтер';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase қосымша бағалау көздерін, Seerr сұрауларын және синхрондалған теңшелімдерді қоса, серверлік интеграцияларға қуат береді.';

  @override
  String get settingsOfflineDownloads => 'Офлайн жүктеп алулар';

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
  String get settingsHigh => 'Жоғары';

  @override
  String get settingsLow => 'Төмен';

  @override
  String get settingsCustomPath => 'Теңшелетін жол';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Жүктеп алу қалтасының жолын енгізіңіз';

  @override
  String get settingsConcurrentDownloads => 'Бір мезгілде жүктеулер';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Бірден жүктеп алуға болатын элементтердің максималды саны.';

  @override
  String get settingsAppInfo => 'ҚОЛДАНБА АҚПАРАТЫ';

  @override
  String get settingsReportAnIssue => 'Мәселе туралы хабарлау';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub жүйесінде мәселені бақылау құралын ашыңыз';

  @override
  String get settingsJoinDiscord => 'Discord-қа қосылыңыз';

  @override
  String get settingsJoinDiscordSubtitle => 'Қауымдастықпен сөйлесу';

  @override
  String get settingsJoinTheDiscord => 'Discord қосылыңыз';

  @override
  String get settingsSupportMoonfin => 'Қолдау Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Әзірлеушіге бір кесе кофеге қайыр беру';

  @override
  String get settingsLegal => 'ЗАҢДЫ';

  @override
  String get settingsLicenses => 'Лицензиялар';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Ашық бастапқы лицензия туралы ескертулер';

  @override
  String get settingsPrivacyPolicy => 'Құпиялылық саясаты';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin деректеріңізді қалай өңдейді';

  @override
  String get settingsCheckForUpdates => 'Жаңартуларды тексеріңіз';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Соңғы Moonfin шығарылымын тексеріңіз';

  @override
  String get settingsPoweredByFlutter => 'Flutter арқылы қуатталған';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# лицензиялық ескертпе',
      one: '# лицензиялық ескертпе',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Екеуі де';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Мазмұн түрі сүзгісін араластыру';

  @override
  String get settingsVideoPlaybackPreferences => 'Бейнені ойнату теңшелімдері';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Негізгі бейне қозғалтқышы және ағын сапасының параметрлері';

  @override
  String get settingsAudioPreferences => 'Аудио теңшелімдері';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио тректер, өңдеу және өту опциялары';

  @override
  String get settingsAutomationAndQueue => 'Автоматтандыру және кезек';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматтандырылған ойнату және реттілік';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Жүктеп алу сапасы, жад шектеулері және кезек өлшемі';

  @override
  String get settingsSyncplaySubtitle =>
      'Топтық сеанстар үшін синхрондау логикасы';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Арнайы ойыншы мүмкіндіктері. Сақтықпен пайдаланыңыз, себебі кейбір опциялар ойнату мәселелерін тудыруы мүмкін';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Кіріспелер мен шығыстарды өткізіп жіберу керек пе?';

  @override
  String get settingsMediaSegmentCountdown => 'Медиасегмент кері санағы';

  @override
  String get settingsProgressBar => 'Прогресс жолағы';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Жоқ';

  @override
  String get settingsPromptUser => 'Шұғыл пайдаланушы';

  @override
  String get settingsSkip => 'Өткізіп жіберу';

  @override
  String get settingsDoNothing => 'Ештеңе жасама';

  @override
  String get settingsMaxBitrateDescription =>
      'Ағынның бит жылдамдығын шектеңіз. Осы шекті мәннен жоғары мазмұн сәйкестендіру үшін қайта кодталады.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ойыншы сұрайтын максималды ажыратымдылықты шектеңіз. Ажыратымдылығы жоғары мазмұн қайта кодталады.';

  @override
  String get settingsPlayerZoomDescription =>
      'Бейнені экранға сыйғызу үшін қалай масштабтау керек.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Ойнату механизмі (Android теледидары)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV құрылғыларында әдепкі ойнату механизмін таңдаңыз. Өзгерістер келесі ойнату сеансына қолданылады.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ұсынылады)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (ескі)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (мұра)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (ұсынылады)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Қайта';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision декодтауы жоқ құрылғылардағы Dolby Vision тақырыптарының әрекеті.';

  @override
  String get settingsAskEachTime => 'Әр жолы сұраңыз';

  @override
  String get settingsPreferHdr10Fallback =>
      'HDR10 қалпына келтіруге артықшылық беріңіз';

  @override
  String get settingsPreferServerTranscode => 'Серверді транскодтауды ұнатыңыз';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision профилі 7 тікелей ойнату';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision профилінің 7 жақсарту қабатының ағындарының тікелей ойнату қажеттігін басқарады.';

  @override
  String get settingsAutoAftkrtEnabled => 'Авто (AFTKRT қосылған)';

  @override
  String get settingsEnabledOnThisDevice => 'Бұл құрылғыда қосылған';

  @override
  String get settingsDisabledPreferTranscode => 'Өшірілген (транскодты таңдау)';

  @override
  String get settingsResumeRewindDescription =>
      'Ойнатуды жалғастырған кезде (Көруді жалғастыру немесе мультимедиа элементі бетінен) қанша секундты кері айналдыру керек?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Кідірту түймесін басқаннан кейін ойнатуды жалғастырған кезде, неше секунд қайта оралу керек?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Артқа айналдыру түймесін басқаннан кейін неше секунд артқа секіру керек.';

  @override
  String get settingsOneSecond => '1 секунд';

  @override
  String get settingsThreeSeconds => '3 секунд';

  @override
  String get settingsFortyFiveSeconds => '45 секунд';

  @override
  String get settingsSixtySeconds => '60 секунд';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Жылдам алға түймесін басқаннан кейін қанша секунд алға секіру керек.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'AC3 биттік ағыны сыртқы декодерге';

  @override
  String get settingsCinemaMode => 'Кинотеатр режимі';

  @override
  String get settingsCinemaModeSubtitle =>
      'Негізгі мүмкіндіктен бұрын трейлерлерді/алдын ала роликтерді ойнату';

  @override
  String get settingsNextUpDisplayDescription =>
      'Кеңейтілген эпизод суреті мен сипаттамасы бар толық картаны көрсетеді. Минималды ықшам кері санақ қабатын көрсетеді. Өшірулі болса шақыруды толығымен жасырады.';

  @override
  String get settingsShort => 'Қысқа';

  @override
  String get settingsLong => 'Ұзақ';

  @override
  String get settingsVeryLong => 'Өте ұзақ';

  @override
  String get settingsVideoStartDelay => 'Бейнені бастаудың кешігуі';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Тікелей тікелей эфир';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Live TV үшін тікелей ойнатуды қосыңыз';

  @override
  String get settingsOpenGroups => 'Топтарды ашыңыз';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay топтарын жасаңыз, қосылыңыз немесе басқарыңыз';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay қосулы';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Топтық көру мүмкіндіктерін қосыңыз';

  @override
  String get settingsSyncplayButton => 'SyncPlay түймесі';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Шарлау жолағында SyncPlay түймесін көрсетіңіз';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Жетілдірілген түзету';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ұқсас синхрондау логикасын қосыңыз';

  @override
  String get settingsSyncplaySyncCorrection => 'Синхронды түзету';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Синхронда болу үшін ойнатуды автоматты түрде реттеңіз';

  @override
  String get settingsSyncplaySpeedToSync => 'Синхрондау жылдамдығы';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Синхрондау үшін ойнату жылдамдығын реттеуді пайдаланыңыз';

  @override
  String get settingsSyncplaySkipToSync => 'Синхрондауға өтіңіз';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Синхрондау үшін іздеуді пайдаланыңыз';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Ең аз жылдамдықты кешіктіру';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Максималды жылдамдықты кешіктіру';

  @override
  String get settingsSyncplaySpeedDuration => 'Жылдамдық ұзақтығы';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Ең аз өткізіп жіберу кешігуі';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay қосымша офсет';

  @override
  String get onNow => 'Қазір қосулы';

  @override
  String get collections => 'Жинақтар';

  @override
  String get lastPlayed => 'Соңғы ойналған';

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
    return 'Жақында шыққан: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Келесі эпизодты автоойнату';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Қолжетімді болғанда келесі эпизодты автоматты түрде ойнату.';

  @override
  String get skipSilenceTitle => 'Үнсіздікті өткізіп жіберу';

  @override
  String get skipSilenceSubtitle =>
      'Ағын қолдаса, үнсіз аудиосегменттерді автоматты түрде өткізіп жіберу.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Сыртқы аудиоәсерлерге рұқсат ету';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Эквалайзер мен әсер қолданбаларына (мыс. Wavelet) Media3 ойнату сеанстарына қосылуға рұқсат ету.';

  @override
  String get disableTunnelingTitle => 'Туннельдеуді өшіру';

  @override
  String get disableTunnelingSubtitle =>
      'Туннельсіз ойнатуды мәжбүрлеу. Туннельдеу кезінде аудио/бейне үзілістері бар құрылғыларда пайдалы.';

  @override
  String get enableTunnelingTitle => 'Туннельдеуді қосу';

  @override
  String get enableTunnelingSubtitle =>
      'Кеңейтілген. Аудио мен бейнені байланысқан аппараттық жол арқылы бағыттайды. Кейбір құрылғыларда аудио/бейне үзілістерін тудыратындықтан әдепкіде өшірулі.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision 7-профилін HEVC-ке салыстыру';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV емес құрылғыларда Dolby Vision 7-профиль ағындарын HDR10-үйлесімді HEVC ретінде ойнату.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Кірістірілген субтитр стильдерін пайдалану';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Субтитр трегіне кірістірілген түстерді, қаріптерді және орналасуды қолдану. Оның орнына өз субтитр стилі параметрлеріңізді пайдалану үшін өшіріңіз.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Кірістірілген субтитр қаріп өлшемдерін пайдалану';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Субтитр трегіне кірістірілген қаріп өлшемі кеңестерін қолдану. Стиль параметрлеріңіздегі субтитр өлшемін пайдалану үшін өшіріңіз.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Медиа мәліметтерін көрсету';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Таңдалған элементтің мәліметтерін кітапхана беттерінің жоғарғы жағында көрсету.';

  @override
  String get hideBackdropsInLibraries =>
      'Шолу кезінде фондық кескіндерді жасыру керек пе?';

  @override
  String get useDetailedSubHeadings => 'Толық ішкі тақырыптарды пайдалану';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Кітапхана беттерінде толық немесе қысқа ішкі жолды көрсету.';

  @override
  String get savedThemesDeleteDialogTitle => 'Сақталған тақырып жойылсын ба?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '«$themeName» осы құрылғының кэшінен жойылсын ба?';
  }

  @override
  String get themeStore => 'Тақырыптар дүкені';

  @override
  String get themeStoreSubtitle => 'Қауымдастық тақырыптарын шолу және сақтау';

  @override
  String get themeStoreDescription =>
      'Тақырыпты басқа сақталған тақырыптарыңыздай пайдалану үшін оны сақтаңыз.';

  @override
  String get themeStoreEmpty => 'Қазір қолжетімді тақырыптар жоқ.';

  @override
  String get themeStoreLoadFailed =>
      'Тақырыптар дүкенін жүктеу мүмкін болмады. Қосылымыңызды тексеріп, қайталап көріңіз.';

  @override
  String get themeStoreSave => 'Сақтау';

  @override
  String get themeStoreSaveAndApply => 'Сақтап, қолдану';

  @override
  String get themeStoreSaved => 'Сақталды';

  @override
  String get themeStoreInvalidMessage => 'Бұл тақырыпты жүктеу мүмкін болмады.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '«$themeName» сақталды.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '«$themeName» осы құрылғыдан жойылды.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '«$themeName» жою мүмкін болмады.';
  }

  @override
  String get savedThemesTitle => 'Сақталған тақырыптар';

  @override
  String get savedThemesDescription =>
      'Бұл — ағымдағы сервер үшін Moonfin плагинінен жүктелген тақырыптар. Жою тек осы жергілікті көшірмені өшіреді.';

  @override
  String get savedThemesEmpty =>
      'Бұл сервер үшін сақталған тақырыптар табылмады.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Қазір белсенді';
  }

  @override
  String get savedThemesDeleteTooltip => 'Сақталған тақырыпты жою';

  @override
  String get savedThemesManageSubtitle =>
      'Осы құрылғыда жүктелген плагин тақырыптарын басқару';

  @override
  String get themeEditor => 'Тақырып өңдегіші';

  @override
  String get themeEditorSubtitle => 'Браузерде Moonfin тақырып өңдегішін ашу';

  @override
  String get homeScreen => 'Негізгі экран';

  @override
  String get bottomBar => 'Төменгі жолақ';

  @override
  String get homeRowsStyleClassic => 'Классикалық';

  @override
  String get homeRowsStyleModern => 'Заманауи';

  @override
  String get homeRowsSection => 'Негізгі бет жолдары';

  @override
  String get homeRowDisplay => 'Негізгі бет жолын көрсету';

  @override
  String get homeRowSections => 'Негізгі бет жолы бөлімдері';

  @override
  String get homeRowToggles => 'Негізгі бет жолы қосқыштары';

  @override
  String get homeRowTogglesSubtitle =>
      'Кітапханаға негізделген негізгі бет жолы санаттарын қосу немесе өшіру';

  @override
  String get homeRowTogglesDescription =>
      'Негізгі бет бөлімдерінде жолдарды көрсету үшін мына қосқыштарды қосыңыз.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      '«Классикалық» әр жолдың кескін түрі мен ақпарат қабатын сақтайды. «Заманауи» тік бағыттан фондық кескінге өтетін жолдарды пайдаланады.';

  @override
  String get displayFavoritesRows => 'Таңдаулылар жолдарын көрсету';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Негізгі бет бөлімдерінде таңдаулы фильмдер, сериалдар және басқа таңдаулы жолдарды көрсету.';

  @override
  String get favoritesRowSorting => 'Таңдаулылар жолын сұрыптау';

  @override
  String get favoritesRowSortingDescription =>
      'Таңдаулылар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get displayCollectionsRows => 'Жинақтар жолдарын көрсету';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Негізгі бет бөлімдерінде жинақтар жолдарын көрсету.';

  @override
  String get collectionsRowSorting => 'Жинақтар жолын сұрыптау';

  @override
  String get collectionsRowSortingDescription =>
      'Жинақтар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get displayGenresRows => 'Жанрлар жолдарын көрсету';

  @override
  String get displayGenresRowsSubtitle =>
      'Негізгі бет бөлімдерінде жанрлар жолдарын көрсету.';

  @override
  String get genresRowSorting => 'Жанрлар жолын сұрыптау';

  @override
  String get genresRowSortingDescription =>
      'Жанрлар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get genresRowItems => 'Жанрлар жолының элементтері';

  @override
  String get genresRowItemsDescription =>
      'Жанрлар жолдарында фильмдерді, сериалдарды немесе екеуін де көрсету.';

  @override
  String get displayPlaylistsRows => 'Ойнату тізімі жолдарын көрсету';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Негізгі бет бөлімдерінде ойнату тізімі жолдарын көрсету.';

  @override
  String get playlistsRowSorting => 'Ойнату тізімі жолын сұрыптау';

  @override
  String get playlistsRowSortingDescription =>
      'Ойнату тізімі жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get displayAudioRows => 'Аудио жолдарын көрсету';

  @override
  String get displayAudioRowsSubtitle =>
      'Негізгі бет бөлімдерінде аудио жолдарын көрсету.';

  @override
  String get audioRowsSorting => 'Аудио жолдарын сұрыптау';

  @override
  String get audioRowsSortingDescription =>
      'Аудио жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get audioPlaylists => 'Аудио ойнату тізімдері';

  @override
  String get appearance => 'Сыртқы түрі';

  @override
  String get layout => 'Қалып';

  @override
  String get theme => 'Тақырып';

  @override
  String get keyboard => 'Пернетақта';

  @override
  String get navButtons => 'Түймелер';

  @override
  String get rendering => 'Рендеринг';

  @override
  String get mpvConfiguration => 'MPV конфигурациясы';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Сыртқы ойнатқыш қолданбасы';

  @override
  String get externalPlayerAppDescription =>
      'Ұзақ басу арқылы ойнату опциясын қосу үшін сыртқы ойнатқышты орнатыңыз';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Ойнату басталғанда қолданба таңдағышын көрсету.';

  @override
  String get loadingInstalledPlayers => 'Орнатылған ойнатқыштар жүктелуде...';

  @override
  String get connection => 'Қосылым';

  @override
  String get audioTranscodeTarget => 'Аудио транскодтау мақсаты';

  @override
  String get passthrough => 'Транзит';

  @override
  String get supportedOnThisDevice => 'Бұл құрылғыда қолдау көрсетіледі';

  @override
  String get notSupportedOnThisDevice => 'Бұл құрылғыда қолдау көрсетілмейді';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) транзиті';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) битағынын сыртқы декодерге жіберу.';

  @override
  String get settingsAudioTrueHdJocPassthrough => 'TrueHD Atmos (JOC) транзиті';

  @override
  String get mediaPlayerBehavior => 'Медиаойнатқыш әрекеті';

  @override
  String get playbackEnhancements => 'Ойнату жақсартулары';

  @override
  String get alwaysOn => 'Әрқашан қосулы.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      '«Титрді өткізу» орнына «Келесі» көрінісін қолдану';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '«Титрді өткізу» түймесінің орнына «Келесі» қабатын көрсету.';

  @override
  String get playerRouting => 'Ойнатқыш бағыттауы';

  @override
  String get preferSoftwareDecoders => 'Бағдарламалық декодерлерді таңдау';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Аппараттық декодерлерден бұрын FFmpeg (аудио) және libgav1 (AV1) пайдалану. HDMI аудио транзиті бұзылса, өшіріңіз.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV-де бейнені таңдалған сыртқы қолданбада ойнату.';

  @override
  String get automaticQueuing => 'Автоматты кезекке қою';

  @override
  String get preferSdhSubtitles => 'SDH субтитрлерін таңдау';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Автоматты таңдау кезінде SDH/CC субтитр тректеріне басымдық беру.';

  @override
  String get webDiagnostics => 'Веб-диагностика';

  @override
  String get webDiagnosticsTitle => 'Moonfin веб-диагностикасы';

  @override
  String get webDiagnosticsIntro =>
      'Браузердің қосылым мәселелерін (CORS, аралас мазмұн және табу параметрлері) диагностикалау үшін осы бетті пайдаланыңыз.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Аралас мазмұн қатесі анықталды';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight қатесі анықталды';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin HTTPS бетінің HTTP сервер URL-іне қоңырау шалу әрекетін анықтады. Браузерлер бұл сұранысты серверіңізге жетпей тұрып бұғаттайды.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin браузер деңгейіндегі сұраныс қатесін анықтады, ол әдетте медиасервердегі CORS немесе preflight тақырыптарының болмауынан туындайды.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Мақсатты URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Мәлімет: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Ағымдағы орындалу контексті';

  @override
  String get webDiagnosticsOrigin => 'Бастапқы көзі';

  @override
  String get webDiagnosticsScheme => 'Схема';

  @override
  String get webDiagnosticsPluginMode => 'Плагин режимі';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC сканерлеуі';

  @override
  String get webDiagnosticsForcedServerUrl => 'Мәжбүрлі сервер URL-і';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Әдепкі сервер URL-і';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Табу прокси URL-і';

  @override
  String get notConfigured => 'конфигурацияланбаған';

  @override
  String get webDiagnosticsMixedContent => 'Аралас мазмұн';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Бұл бет HTTPS арқылы жүктелген, бірақ бір немесе бірнеше конфигурацияланған URL — HTTP. Браузерлер HTTPS беттеріне HTTP API-ге қоңырау шалуды бұғаттайды.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Түзету: медиасерверіңізді немесе прокси нүктеңізді HTTPS арқылы ұсыныңыз, немесе Moonfin-ді HTTP арқылы тек сенімді жергілікті желілерде жүктеңіз.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Ағымдағы орындалу параметрлерінен айқын аралас мазмұн конфигурациясы анықталмады.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS тексеру тізімі';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Браузердің бастапқы көзіне Access-Control-Allow-Origin ішінде рұқсат етіңіз.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers ішіне Authorization, X-Emby-Authorization және X-Emby-Token қосыңыз.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ағын мен айналдыру әрекеті үшін Content-Range және Accept-Ranges ашыңыз.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight сұраныстарына 204 қайтарыңыз.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Тақырып үзіндісінің мысалы (nginx стилінде)';

  @override
  String get note => 'Ескертпе';

  @override
  String get webDiagnosticsNonWebNote =>
      'Бұл диагностика бағыты веб-құрастырылымдарға арналған. Мұны басқа платформада көріп тұрсаңыз, бұл тексерулер қолданылмауы мүмкін.';

  @override
  String get backToServerSelect => 'Сервер таңдауға оралу';

  @override
  String get signOutAllUsers => 'Барлық пайдаланушыны шығару';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Микрофон рұқсаты біржола қабылданбады. Оны жүйе параметрлерінде қосыңыз.';

  @override
  String get voiceSearchPermissionRequired =>
      'Дауыстық іздеу үшін микрофон рұқсаты қажет.';

  @override
  String get voiceSearchNoMatch => 'Түсінбедім. Қайталап көріңіз.';

  @override
  String get voiceSearchNoSpeechDetected => 'Сөйлеу анықталмады.';

  @override
  String get voiceSearchMicrophoneError => 'Микрофон қатесі.';

  @override
  String get voiceSearchNeedsInternet => 'Дауыстық іздеу үшін интернет қажет.';

  @override
  String get voiceSearchServiceBusy =>
      'Дауыстық қызмет бос емес. Қайталап көріңіз.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Микрофон рұқсаты біржола қабылданбады.';

  @override
  String get microphonePermissionDenied => 'Микрофон рұқсаты қабылданбады.';

  @override
  String get speechRecognitionUnavailable =>
      'Сөйлеуді тану бұл құрылғыда қолжетімсіз.';

  @override
  String get openIosRoutePicker => 'iOS бағыт таңдағышын ашу';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay бағыт таңдағышы бұл құрылғыда қолжетімсіз.';

  @override
  String get videos => 'Бейнелер';

  @override
  String get programs => 'Бағдарламалар';

  @override
  String get songs => 'Әндер';

  @override
  String get photoAlbums => 'Фотоальбомдар';

  @override
  String get photos => 'Фотосуреттер';

  @override
  String get people => 'Адамдар';

  @override
  String get recentlyReleasedEpisodes => 'Жақында шыққан эпизодтар';

  @override
  String get watchAgain => 'Қайта көру';

  @override
  String get guestAppearances => 'Қонақ ретінде қатысу';

  @override
  String get appearancesSeerr => 'Қатысуы (Seerr)';

  @override
  String get crewContributionsSeerr => 'Түсіру тобының үлесі (Seerr)';

  @override
  String get watchWithGroup => 'Топпен бірге көру';

  @override
  String get errors => 'Қателер';

  @override
  String get warnings => 'Ескертулер';

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Браузерде ашу';

  @override
  String get embeddedBrowserNotAvailable =>
      'Кірістірілген браузер бұл платформада қолжетімсіз.';

  @override
  String get adminRestartServerConfirmation => 'Сервер қайта іске қосылсын ба?';

  @override
  String get adminShutdownServerConfirmation =>
      'Сервер өшірілсін бе? Оны қолмен қайта іске қосу қажет болады.';

  @override
  String get internal => 'Ішкі';

  @override
  String get idle => 'Бос';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Пайдаланушылар табылмады';

  @override
  String get adminNoUsersMatchSearch => 'Іздеуіңізге сәйкес пайдаланушы жоқ';

  @override
  String get adminNoDevicesFound => 'Құрылғылар табылмады';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ағымдағы сүзгілерге сәйкес құрылғы жоқ';

  @override
  String get passwordSet => 'Құпия сөз орнатылған';

  @override
  String get noPasswordConfigured => 'Құпия сөз конфигурацияланбаған';

  @override
  String get remoteAccess => 'Қашықтан қатынау';

  @override
  String get localOnly => 'Тек жергілікті';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Медиа аналитикасын жүктеу мүмкін болмады';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Барлық медиакітапхана бойынша біріктірілген аналитика.';

  @override
  String get analyticsTopArtists => 'Үздік орындаушылар';

  @override
  String get analyticsTopAuthors => 'Үздік авторлар';

  @override
  String get analyticsTopContributors => 'Үздік үлес қосушылар';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Кітапхана',
      one: '$count Кітапхана',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Бұл таңдау үшін индекстелген медиа қосындылары әзірге қолжетімсіз.';

  @override
  String get analyticsLibraryDetails => 'Кітапхана мәліметтері';

  @override
  String get analyticsLibraryBreakdown => 'Кітапхана бөлінісі';

  @override
  String get analyticsNoLibrariesAvailable => 'Қолжетімді кітапханалар жоқ.';

  @override
  String get adminServerAdministrationTitle => 'Сервер әкімшілігі';

  @override
  String get adminServerPathData => 'Деректер';

  @override
  String get adminServerPathImageCache => 'Кескін кэші';

  @override
  String get adminServerPathCache => 'Кэш';

  @override
  String get adminServerPathLogs => 'Журналдар';

  @override
  String get adminServerPathMetadata => 'Метадеректер';

  @override
  String get adminServerPathTranscode => 'Транскодтау';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Бұл сервер сервер жолдарын қайтармады.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% пайдаланылды';
  }

  @override
  String get userActivity => 'Пайдаланушы әрекеті';

  @override
  String get systemEvents => 'Жүйелік оқиғалар';

  @override
  String get needsAttention => 'Назар аудару қажет';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Ойнату';

  @override
  String get adminDrawerSectionDevices => 'Құрылғылар';

  @override
  String get adminDrawerSectionAdvanced => 'Кеңейтілген';

  @override
  String get adminDrawerSectionPlugins => 'Плагиндер';

  @override
  String get adminDrawerSectionLiveTv => 'Тікелей теледидар';

  @override
  String get homeVideos => 'Үй бейнелері';

  @override
  String get mixedContent => 'Аралас мазмұн';

  @override
  String get homeVideosAndPhotos => 'Үй бейнелері мен фотосуреттер';

  @override
  String get mixedMoviesAndShows => 'Аралас фильмдер мен сериалдар';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Жазбалар табылмады';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension архивінің ішінен кескін беттері табылмады.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Кірістірілген рендерер сәтсіз болды ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB рендерері сәтсіз болды ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Оқу құралы үшін жергілікті файл жоқ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri көзінен кітап деректерін ашу кезінде HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Оқуға болатын кітап нүктесі қолжетімсіз';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Қолдау көрсетілмейтін комикс архивінің пішімі: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR шығарып алу плагині бұл платформада қолжетімсіз.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr архивін шығарып алу мүмкін болмады.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 шығарып алу бұл платформада қолжетімсіз.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 шығарып алу плагині бұл платформада қолжетімсіз.';

  @override
  String get closeGenrePanel => 'Жанр панелін жабу';

  @override
  String get loadingShuffle => 'Араластыру жүктелуде...';

  @override
  String get libraryShuffleLabel => 'КІТАПХАНАНЫ АРАЛАСТЫРУ';

  @override
  String get randomShuffleLabel => 'КЕЗДЕЙСОҚ АРАЛАСТЫРУ';

  @override
  String get genresShuffleLabel => 'ЖАНРЛАРДЫ АРАЛАСТЫРУ';

  @override
  String get autoHdrSwitching => 'Автоматты HDR ауыстыру';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR бейнесін ойнату үшін HDR-ды автоматты түрде қосу және шыққанда дисплей режимін қалпына келтіру.';

  @override
  String get whenFullscreen => 'Толық экран кезінде';

  @override
  String get changeArtwork => 'Мұқабаны өзгерту';

  @override
  String get missing => 'Жоқ';

  @override
  String get transcodingLimits => 'Транскодтау шектеулері';

  @override
  String get clearAllArtworkButton => 'Барлық мұқаба тазалансын ба?';

  @override
  String get clearAllArtworkWarning =>
      'Барлық жүктелген мұқабаны тазалағыңыз келе ме?';

  @override
  String get confirmClear => 'Тазалауды растау';

  @override
  String confirmClearMessage(String itemType) {
    return 'Осы «$itemType» тазалағыңыз келе ме?';
  }

  @override
  String get uploadButton => 'Жүктеп салу керек пе?';

  @override
  String get resolutionLabel => 'Ажыратымдылық: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Мұқабаларды тек интерфейс тілінде көрсету';

  @override
  String get confirmClearAll => 'Барлығын тазалауды растау';

  @override
  String get imageUploadSuccess => 'Кескін сәтті жүктеп салынды!';

  @override
  String imageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Кескінді орнату мүмкін болмады: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Барлық мұқабаны тазалау мүмкін болмады: $error';
  }

  @override
  String get yes => 'Иә';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Фондық кескіндер';

  @override
  String get bannerCategory => 'Баннер';

  @override
  String get logoCategory => 'Логотип';

  @override
  String get thumbnailCategory => 'Нобай';

  @override
  String get artCategory => 'Мұқаба';

  @override
  String get discArtCategory => 'Диск мұқабасы';

  @override
  String get screenshotCategory => 'Скриншот';

  @override
  String get boxCoverCategory => 'Қорап мұқабасы';

  @override
  String get boxRearCoverCategory => 'Қораптың артқы мұқабасы';

  @override
  String get menuArtCategory => 'Мәзір мұқабасы';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'фондық кескін';

  @override
  String get confirmItemBanner => 'баннер';

  @override
  String get confirmItemLogo => 'логотип';

  @override
  String get confirmItemThumbnail => 'нобай';

  @override
  String get confirmItemArt => 'мұқаба';

  @override
  String get confirmItemDiscArt => 'диск мұқабасы';

  @override
  String get confirmItemScreenshot => 'скриншот';

  @override
  String get confirmItemBoxCover => 'қорап мұқабасы';

  @override
  String get confirmItemBoxRearCover => 'қораптың артқы мұқабасы';

  @override
  String get confirmItemMenuArt => 'мәзір мұқабасы';

  @override
  String get resolutionAll => 'Барлығы';

  @override
  String get resolutionHigh => 'Жоғары (1080p+)';

  @override
  String get resolutionMedium => 'Орташа (720p)';

  @override
  String get resolutionLow => 'Төмен (<720p)';

  @override
  String get sources => 'Көздер';

  @override
  String get audiobookChapters => 'Тараулар';

  @override
  String get audiobookBookmarks => 'Бетбелгілер';

  @override
  String get audiobookNotes => 'Ескертпелер';

  @override
  String get audiobookQueue => 'Кезек';

  @override
  String get audiobookTimeline => 'Уақыт шкаласы';

  @override
  String get audiobookTimelineEmpty => 'Уақыт шкаласы бос';

  @override
  String get audiobookWholeBook => 'Бүкіл кітап';

  @override
  String get audiobookFocusedTimeline => 'Фокустелген шкала';

  @override
  String get audiobookExportBookmarks => 'Бетбелгілерді экспорттау';

  @override
  String get audiobookExportNotes => 'Ескертпелерді экспорттау';

  @override
  String get audiobookExportAll => 'Барлығын экспорттау';

  @override
  String audiobookExportSuccess(String path) {
    return '$path орнына экспортталды';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Экспорттау мүмкін болмады: $error';
  }

  @override
  String get audiobookLyrics => 'Мәтін';

  @override
  String get audiobookAddBookmark => 'Бетбелгі қосу';

  @override
  String get audiobookAddNote => 'Ескертпе қосу';

  @override
  String get audiobookEditNote => 'Ескертпені өңдеу';

  @override
  String get audiobookNoteHint => 'Осы сәт үшін ескертпе жазыңыз';

  @override
  String get audiobookSleepTimer => 'Ұйқы таймері';

  @override
  String get audiobookSleepOff => 'Өшірулі';

  @override
  String get audiobookSleepEndOfChapter => 'Тарау соңы';

  @override
  String get audiobookSleepCustom => 'Реттелетін';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining қалды';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      one: '1 мин',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Ойнату жылдамдығы';

  @override
  String get audiobookRemainingTime => 'Қалды';

  @override
  String get audiobookElapsedTime => 'Өтті';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Артқа $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Алға $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Алдыңғы тарау';

  @override
  String get audiobookNextChapter => 'Келесі тарау';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total ішінен $current-тарау';
  }

  @override
  String get audiobookNoChapters => 'Тараулар жоқ';

  @override
  String get audiobookNoBookmarks => 'Әзірге бетбелгілер жоқ';

  @override
  String get audiobookNoNotes => 'Әзірге ескертпелер жоқ';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position орнына бетбелгі қосылды';
  }

  @override
  String get audiobookSpeedReset => '1.0x-ке ысыру';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Сақтау';

  @override
  String get audiobookCancel => 'Болдырмау';

  @override
  String get audiobookDelete => 'Жою';

  @override
  String get subtitlePreferences => 'Субтитр параметрлері';

  @override
  String get subtitlePreferencesDescription =>
      'Субтитр режимдерін, әдепкі тілдерді, сыртқы түрін және көрсету параметрлерін өзгертіңіз.';

  @override
  String get subtitleRendering => 'Субтитрлерді көрсету';

  @override
  String get displayOptions => 'Көрсету параметрлері';

  @override
  String get releaseDateAscending => 'Шығу күні (өсу ретімен)';

  @override
  String get releaseDateDescending => 'Шығу күні (кему ретімен)';

  @override
  String get groupContributions => 'Үлесті топтау';

  @override
  String get groupMultipleRoles => 'Бірнеше рөлді топтау';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Кітапханаға жазу рұқсаты туралы ескерту';

  @override
  String get libraryWriteAccessHowToFix => 'Мұны қалай түзетуге болады:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Серверіңіздегі медиакітапхана қалталары үшін Jellyfin қызметінің пайдаланушысына (мыс. jellyfin немесе Docker PUID/PGID) жазу рұқсатын беріңіз.\n\n2. Немесе Jellyfin басқару тақтасы -> Кітапханалар бөліміне өтіп, осы кітапхананы өңдеп, мұқабаны Jellyfin ішкі дерекқорында сақтау үшін «Мұқабаларды медиақалталарға сақтау» параметрін өшіріңіз.';

  @override
  String get dismiss => 'Жабу';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '«$libraryName» кітапханаңыз мұқабаларды тікелей медиақалталарға сақтауға конфигурацияланған («Мұқабаларды медиақалталарға сақтау» қосулы). Алайда Jellyfin жазу рұқсатын тексерді және осы каталогқа файлдар жазуға рұқсаты жоқ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin мұқабаны жаңарта алмаған сияқты. Кітапханаңыз мұқабаларды тікелей медиақалталарға сақтауға конфигурацияланған («Мұқабаларды медиақалталарға сақтау» қосулы). Бұл қате әдетте Jellyfin сервер процесінің медиакаталогтарыңызға файлдар жазуға рұқсаты болмағанда орын алады.';

  @override
  String get externalLists => 'Сыртқы тізімдер';

  @override
  String get replay => 'Қайта ойнату';

  @override
  String get fileInformation => 'Файл туралы мәлімет';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Өлшемі: $size  •  Пішімі: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Барлық ($count) аудиотректі көрсету';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Барлық ($count) субтитр трегін көрсету';
  }

  @override
  String get checkingDirectPlay => 'Тікелей ойнату мүмкіндігі тексерілуде...';

  @override
  String get directPlayCapabilityLabel => 'Тікелей ойнату мүмкіндігі: ';

  @override
  String get forced => 'Мәжбүрлі';

  @override
  String get transcodeContainerNotSupported =>
      'Контейнер пішімі ойнатқышта қолдау таппайды.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видеокодек қолдау таппайды.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудиокодек қолдау таппайды.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Субтитр пішімі қолдау таппайды (қаттауды қажет етеді).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аудиопрофиль қолдау таппайды.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Видеопрофиль қолдау таппайды.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Бейне деңгейі қолдау таппайды.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Бейне ажыратымдылығы бұл құрылғыда қолдау таппайды.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Бейне түс тереңдігі қолдау таппайды.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Бейне кадр жиілігі қолдау таппайды.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Файл битрейті ойнатқыштың ағын шегінен асады.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Бейне битрейті ағын шегінен асады.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Аудио битрейті ағын шегінен асады.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Аудиоарналар саны қолдау таппайды.';

  @override
  String get sortAlphabetical => 'Әліпби бойынша';

  @override
  String get sortReleaseAscending => 'Шығу реті (өсу ретімен)';

  @override
  String get sortReleaseDescending => 'Шығу реті (кему ретімен)';

  @override
  String get sortCustomDragDrop => 'Реттелетін (сүйреп апару)';

  @override
  String get playlistSortOptions => 'Ойнату тізімін сұрыптау параметрлері';

  @override
  String get resetSort => 'Сұрыптауды ысыру';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'М$season:Э$episode қайта көру';
  }

  @override
  String get rewatchPlaylist => 'Ойнату тізімін қайта көру';

  @override
  String get noSubtitlesFound => 'Субтитрлер табылмады.';

  @override
  String get adminControls => 'Әкімші басқаруы';

  @override
  String get impellerRendering => 'Рендеринг қозғалтқышы (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller — плавнырақ анимациялар мен азырақ кідірістер үшін Flutter-дің заманауи GPU рендерері. Кейбір ТД-приставкаларда және ескі GPU-ларда ол ақаулар немесе қара бейне тудыруы мүмкін; мұны көрсеңіз, өшіріңіз. «Автоматты» құрылғыңызға ең қолайлы әдепкіні таңдайды. Қолдану үшін Moonfin-ді қайта іске қосыңыз.';

  @override
  String get impellerAuto => 'Автоматты';

  @override
  String get impellerOn => 'Қосулы';

  @override
  String get impellerOff => 'Өшірулі';

  @override
  String get impellerRestartTitle => 'Қайта іске қосу қажет';

  @override
  String get impellerRestartMessage =>
      'Рендеринг қозғалтқышын өзгерту үшін Moonfin-ді қайта іске қосу қажет. Қолдану үшін қолданбаны қазір жауып, содан кейін қайта ашыңыз.';

  @override
  String get impellerCloseNow => 'Қолданбаны қазір жабу';

  @override
  String get adminRefreshLibrary => 'Кітапхананы жаңарту';

  @override
  String get adminRefreshAllLibraries => 'Барлық кітапхананы жаңарту';

  @override
  String get adminRepoSortDateOldest => 'Қосылған күні (алдымен ескілері)';

  @override
  String get adminRepoSortDateNewest => 'Қосылған күні (алдымен жаңалары)';

  @override
  String get adminRepoSortNameAsc => 'Әліпби бойынша (А-дан Я-ға)';

  @override
  String get adminRepoSortNameDesc => 'Әліпби бойынша (Я-дан А-ға)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Сервер аналитикасы жүктелуде... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Көзге сәйкес';

  @override
  String get imdbTop250Movies => 'IMDb үздік 250 фильм';

  @override
  String get imdbTop250TvShows => 'IMDb үздік 250 сериал';

  @override
  String get imdbMostPopularMovies => 'IMDb ең танымал фильмдер';

  @override
  String get imdbMostPopularTvShows => 'IMDb ең танымал сериалдар';

  @override
  String get imdbLowestRatedMovies => 'IMDb ең төмен бағаланған фильмдер';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ең жоғары бағаланған ағылшын фильмдері';
}
