// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Ай жүзі';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Кіру';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Жылдам қосылу';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Кім қарап отыр?';

  @override
  String get addUser => 'Пайдаланушы қосу';

  @override
  String get selectServer => 'Серверді таңдаңыз';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Болдырмау';

  @override
  String get remove => 'Жою';

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
  String get settingsAppearanceThemeSubtitle =>
      'Қолданбаны қайта іске қоспай, Moonfin және Neon Pulse арасында ауысыңыз';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Ай жүзі';

  @override
  String get themeMoonfinSubtitle => 'Ағымдағы Moonfin келбеті бәріңізге ұнады';

  @override
  String get themeNeonPulse => 'Неон импульсі';

  @override
  String get themeNeonPulseSubtitle =>
      'Күлгін түсті жарқыл, көгілдір мәтін және күшті хром контрастымен Synthwave стилі';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin шығу керек пе?';

  @override
  String get exitAppConfirmation => 'Шығыңыз келетініне сенімдісіз бе?';

  @override
  String get exit => 'Шығу';

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
  String get series => 'Сериялар';

  @override
  String get noItemsFound => 'Ешбір элемент табылмады';

  @override
  String get home => 'Үй';

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
  String get library => 'Кітапхана';

  @override
  String get displaySettings => 'Дисплей параметрлері';

  @override
  String get allGenres => 'Барлық жанрлар';

  @override
  String get noGenresFound => 'Жанрлар табылмады';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Бұл қалта бос';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
  }

  @override
  String get views => 'Көрулер';

  @override
  String get albums => 'Альбомдар';

  @override
  String get albumArtists => 'Альбом әртістері';

  @override
  String get artists => 'Суретшілер';

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
    return '$count titles';
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
  String get resume => 'Резюме';

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
  String get readyWhenYouAre => 'Бар кезде дайын';

  @override
  String get details => 'Мәліметтер';

  @override
  String get listeningRoom => 'Тыңдау бөлмесі';

  @override
  String get bookmarksAndProgress => 'Бетбелгілер және орындалу барысы';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Бұл тақырыпты дәл қазір жүктеу мүмкін емес.';

  @override
  String get audiobookDetails => 'Аудиокітап туралы мәліметтер';

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
  String get trackList => 'Трек тізімі';

  @override
  String get itemListPlaceholder => 'Элемент тізімі осы жерде пайда болады';

  @override
  String get favoriteTracksPlaceholder =>
      'Таңдаулы тректер осы жерде пайда болады';

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
  String get seasons => 'Жыл мезгілдері';

  @override
  String get chapters => 'тараулар';

  @override
  String get features => 'Ерекше өзгешеліктері';

  @override
  String get movies => 'Фильмдер';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Жарияланатын күні белгісіз';

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
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'Көру';

  @override
  String get resumeReading => 'Оқуды жалғастыру';

  @override
  String get read => 'Оқы';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Ойнау';

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
  String get cast => 'Cast';

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
  String get renamePlaylist => 'Ойнату тізімінің атын өзгерту';

  @override
  String get playlistName => 'Ойнату тізімінің аты';

  @override
  String get deleteDownloadedAlbum => 'Жүктеп алынған альбомды жою';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Элемент жойылды';

  @override
  String get noPlayableTrailerFound => 'Ойналатын трейлер табылмады.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитр жүктеп алынды. Jellyfin элементті жаңартқанда пайда болуына біраз уақыт кетуі мүмкін.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Нұсқа таңдаңыз';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Жүктелген файлдарды жою';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'ЖАЗУШЫЛАР';

  @override
  String get studio => 'СТУДИЯ';

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
  String get showLess => 'Аз көрсету';

  @override
  String get readMore => 'Толығырақ оқу';

  @override
  String get shuffle => 'Араластыру';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Керемет сәйкестік';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

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
  String get deviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get unavailable => 'Қолжетімсіз';

  @override
  String get pause => 'Кідірту';

  @override
  String get syncPosition => 'Синхрондау орны';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Кезек бос';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Ойыншы';

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
  String get codec => 'Codec';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Қолданбада EPUB көрсету бұл платформада әлі қолжетімді емес.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Бұл платформада ендірілген құжатты көрсету мүмкін емес.';

  @override
  String get couldNotOpenExternalViewer =>
      'Сыртқы қарау құралын ашу мүмкін болмады.';

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
      'Әлі бетбелгілер жоқ.\nОрныңызды сақтау үшін оқу кезінде бетбелгі белгішесін түртіңіз.';

  @override
  String get noTableOfContentsAvailable => 'Мазмұны жоқ';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Кітап оқу құралы';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Ешбір арна табылмады';

  @override
  String get liveBadge => 'ТІКЕЛЕЙ ЭФИР';

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
  String get watch => 'Қарау';

  @override
  String get close => 'Жабу';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Көріпкел';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Альбомды ойнату';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Серия табылмады';

  @override
  String get errorLoadingSeries => 'Серияларды жүктеу қатесі';

  @override
  String get downloadedEpisodes => 'Жүктеп алынған эпизодтар';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Ерекшеліктер';

  @override
  String get deleteSeason => 'Маусымды жою';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка және аудиокітаптар';

  @override
  String get images => 'Суреттер';

  @override
  String get database => 'Мәліметтер қоры';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Негізгі қатарлардағы тақырыптық музыка';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Негізгі экранды шолу кезінде ойнату';

  @override
  String get detailsBackgroundBlur => 'Мәліметтер Фонды бұлыңғырлау';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choose what scrolling the mouse wheel over the video does during playback.';

  @override
  String get scrollWheelActionOff => 'Off';

  @override
  String get scrollWheelActionSeek => 'Seek (forward / back)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

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
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get showSeerrButton => 'Show Seerr Button';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'Ай жүзі';

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
  String get perRowImageType => 'Әр жолдағы кескін түрі';

  @override
  String get perRowSettings => 'Әр жол параметрлері';

  @override
  String get autoLogin => 'Автоматты түрде кіру';

  @override
  String get lastUser => 'Соңғы пайдаланушы';

  @override
  String get currentUser => 'Current User';

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
  String get inAppScreensaver => 'In-App Screensaver';

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
    return '$minutes min';
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
  String get trakt => 'Тракт';

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
  String get pluginLabel => 'Плагин';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Жолдарды табу';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Қайта реттеу үшін сүйреңіз. Жолдарды қосу немесе өшіру. Қосылған жол тәртібі Moonfin плагинімен синхрондалады.';

  @override
  String get discoverRowsDescription =>
      'Қайта реттеу үшін сүйреңіз. Жолдарды қосу немесе өшіру.';

  @override
  String get enabled => 'Қосылған';

  @override
  String get hidden => 'Жасырын';

  @override
  String get aboutTitle => 'туралы';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Ашық бастапқы лицензиялар';

  @override
  String get sourceCode => 'Бастапқы код';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Хабарландыруларды жаңарту';

  @override
  String get showWhenUpdatesAvailable =>
      'Жаңартулар қолжетімді болған кезде көрсету';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
    return '$value GB';
  }

  @override
  String get clear => 'Таза';

  @override
  String get browse => 'Шолу';

  @override
  String get noResults => 'Нәтиже жоқ';

  @override
  String get seerrAvailableStatus => 'Қол жетімді';

  @override
  String get seerrRequestedStatus => 'Сұралған';

  @override
  String itemsCount(int count) {
    return '$count Items';
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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get appearances => 'Сыртқы көріністер';

  @override
  String get crewSection => 'Экипаж';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get seasonsLabel => 'Жыл мезгілдері';

  @override
  String get episodesLabel => 'Эпизодтар';

  @override
  String get access => 'Қол жеткізу';

  @override
  String get add => 'қосу';

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
  String get remote => 'Қашықтан';

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
  String get stop => 'Тоқта';

  @override
  String get streaming => 'Ағын';

  @override
  String get time => 'Уақыт';

  @override
  String get trickplay => 'Трикплей';

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
  String get adminDrawerLibraries => 'Кітапханалар';

  @override
  String get adminDrawerTranscoding => 'Транскодтау';

  @override
  String get adminDrawerResume => 'Резюме';

  @override
  String get adminDrawerStreaming => 'Ағын';

  @override
  String get adminDrawerTrickplay => 'Трикплей';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'Алға';

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
  String get volume => 'Көлемі';

  @override
  String get actions => 'Әрекеттер';

  @override
  String get videoCodec => 'Бейне кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Аяқтау';

  @override
  String get direct => 'Тікелей';

  @override
  String get adminDisconnect => 'Ажырату';

  @override
  String get adminClearDates => 'Күндерді тазалау';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Құрылғыны жою';

  @override
  String get adminDeviceDeleted => 'Құрылғы жойылды';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Кітапхананың атын өзгерту';

  @override
  String get adminNewName => 'Жаңа атау';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Кітапхананы жою';

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
  String get adminRemovePath => 'Жолды жою';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Кітапхана опциялары сақталды';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Кітапхана атауы қажет';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Пайдаланушыларды жүктеу мүмкін болмады';

  @override
  String get adminSearchUsers => 'Пайдаланушыларды іздеу';

  @override
  String get adminEditUser => 'Пайдаланушыны өңдеу';

  @override
  String get adminAddUser => 'Пайдаланушы қосу';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Рұқсаттар сақталды';

  @override
  String get adminPasswordsMismatch => 'Құпия сөздер сәйкес келмейді';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Бұл құпия сөзді жояды. Пайдаланушы парольсіз жүйеге кіре алады.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Сервер жауабында кілт таңбалауышы жоқ';

  @override
  String get adminRevokeApiKey => 'API кілтін қайтарып алу';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API кілті кері қайтарылды';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Сақтық көшірме жасалуда...';

  @override
  String get adminBackupCreated => 'Сақтық көшірме сәтті жасалды';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Сервер жауабында сақтық көшірме жолы жоқ';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Қалпына келтіруді растаңыз';

  @override
  String get adminRestoringBackup => 'Сақтық көшірме қалпына келтірілуде...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Журналда іздеу';

  @override
  String get adminNoMatchingLines => 'Сәйкес сызықтар жоқ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Жоспарланған тапсырмалар табылмады';

  @override
  String get adminNoTasksMatchFilter =>
      'Ағымдағы сүзгіге сәйкес тапсырмалар жоқ';

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
  String get adminRunNow => 'Қазір іске қосыңыз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Аптаның күні';

  @override
  String get adminSearchPlugins => 'Плагиндерді іздеу...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Плагинді жою';

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
      'Іздеуіңізге сәйкес келетін плагиндер жоқ';

  @override
  String get adminNoPluginsInstalled => 'Ешқандай плагин орнатылмаған';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
      'Параметрлерді ашу мүмкін емес: аутентификация белгісі жоқ.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагин табылмады';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'мысалы Jellyfin Тұрақты';

  @override
  String get adminRepositoryUrl => 'Репозиторий URL';

  @override
  String get adminAddEntry => 'Жазба қосу';

  @override
  String get adminInvalidUrl => 'Жарамсыз URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
      'Трик-плей параметрлерін жүктеу мүмкін болмады';

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
  String get adminBaseUrlHint => 'мысалы /желлифин';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Қашықтағы адамды іздеу';

  @override
  String get adminNoRemoteMatches => 'Қашықтағы сәйкестіктер табылмады';

  @override
  String get adminRemoteResults => 'Қашықтағы нәтижелер';

  @override
  String get adminRemoteMetadataApplied => 'Қашықтағы метадеректер қолданылды';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Мазмұн түрін жаңарту';

  @override
  String get adminContentType => 'Мазмұн түрі';

  @override
  String get adminContentTypeUpdated => 'Мазмұн түрі жаңартылды';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Қолдау көрсетілмейтін кескін пішімі';

  @override
  String get adminImageReadFailed => 'Таңдалған кескінді оқу мүмкін болмады';

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
  String get adminAllProviders => 'Барлық провайдерлер';

  @override
  String get adminNoRemoteImages => 'Ешқандай қашықтағы кескіндер табылмады';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Тюнер қосыңыз';

  @override
  String get adminTunerType => 'Тюнер түрі';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Басқа';

  @override
  String get adminUrlPath => 'URL/жол';

  @override
  String get adminNameOptional => 'Аты (міндетті емес)';

  @override
  String get adminTunerAdded => 'Тюнер қосылды';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Гид провайдерін қосыңыз';

  @override
  String get adminProviderType => 'Провайдер түрі';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect немесе XMLTV';

  @override
  String get adminUsernameOptional => 'Пайдаланушы аты (міндетті емес)';

  @override
  String get adminRefreshInterval => 'Жаңарту аралығы (сағат)';

  @override
  String get adminProviderAdded => 'Провайдер қосылды';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Тюнерді қалпына келтіру сұралды';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Жазу параметрлері сақталды';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Провайдерді қосу';

  @override
  String get adminNoListingProviders =>
      'Листинг провайдерлері конфигурацияланбаған';

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
    return 'Restore backup $name now?';
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
  String get adminLogViewerNoMatches => 'Сәйкес сызықтар жоқ';

  @override
  String get adminMetadataEditorTitle => 'Метадеректер редакторы';

  @override
  String get adminMetadataRemote => 'Қашықтан';

  @override
  String get adminMetadataType => 'Түр';

  @override
  String get adminMetadataDetails => 'Мәліметтер';

  @override
  String get adminMetadataExternalIds => 'Сыртқы идентификаторлар';

  @override
  String get adminMetadataImages => 'Суреттер';

  @override
  String get adminMetadataFieldTitle => 'Тақырып';

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
      'Таңдалған кескінді оқу мүмкін болмады';

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
      'Бұл элементтен ағымдағы кескінді жояды.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Іздеуіңізге сәйкес пакеттер жоқ';

  @override
  String get adminPluginsCatalogEmpty => 'Қолжетімді пакеттер жоқ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Репозиторийді жою';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Жою';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackHwAccelLabel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackEnableHwEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Аппараттық құралдардың декодтауын қосыңыз:';

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
  String get adminTaskStop => 'Тоқта';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'қазір';

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
      'Алдын ала қарау нобайларын іздеу үшін трик-плей кескінін жасауды конфигурациялаңыз.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Қоғамдық HTTPS порты';

  @override
  String get adminNetworkingBaseUrl => 'Негізгі URL';

  @override
  String get adminNetworkingBaseUrlHint => 'мысалы /желлифин';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Баяу жауап шегі (мс)';

  @override
  String get adminGeneralCachePath => 'Кэш жолы';

  @override
  String get adminGeneralMetadataPath => 'Метадеректер жолы';

  @override
  String get adminGeneralServerName => 'Сервер атауы';

  @override
  String get adminSettingsLoadFailed => 'Параметрлерді жүктеу сәтсіз аяқталды';

  @override
  String get adminDiscover => 'Ашу';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Қалталар';

  @override
  String get libraries => 'Кітапханалар';

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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay кіруге тыйым салынды';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Осы SyncPlay тобындағы бір немесе бірнеше элементтерге кіру рұқсатыңыз жоқ. Топ иесінен кітапхана рұқсаттарын тексеруді немесе басқа кезекті таңдауды сұраңыз.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'IAmParadox27 \"Негізгі экран бөлімдері\" плагині арқылы ашылған жолдарды анықтау. Төменде жолдарды қосуға және ретін өзгертуге болады.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Плагин туралы әлі ешқандай Jellyfin серверлері есеп бермейді.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Ranaldsgift \"KefinTweaks\" плагині арқылы конфигурацияланған жолдарды анықтау. Жақында шығарылған, қайта қарау, маусымдық және кітапханаға жақында қосылған теңшелетін бөлімдер әрбір Jellyfin серверіндегі KefinTweaks конфигурациясынан бейнеленген.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'KefinTweaks туралы хабарлайтын Jellyfin серверлері әлі жоқ.';

  @override
  String get integrationOpenHomeSections => 'Негізгі бөлімдерді ашыңыз';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Жолдарды қосу, өшіру және ретін өзгерту';

  @override
  String get integrationInstalledButDisabled => 'Орнатылған, бірақ өшірілген';

  @override
  String get integrationNotInstalled => 'Орнатылмаған';

  @override
  String integrationSectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sections',
      one: '# section',
    );
    return '$_temp0';
  }

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
  String get jellyseerr => 'Jellyseerr';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Қашықтан ойнату';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get castVolumeUnavailable => 'Қолжетімсіз';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Қате PIN';

  @override
  String get pinMismatch => 'PIN кодтары сәйкес келмейді';

  @override
  String get pinForgot => 'PIN кодын ұмыттыңыз ба?';

  @override
  String get pinClear => 'Таза';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Жылдам қосылу сұрауы рұқсат етілген.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Жылдам қосылу коды жарамсыз немесе мерзімі өтіп кеткен.';

  @override
  String get quickConnectNotSupported =>
      'Бұл серверде Quick Connect функциясына қолдау көрсетілмейді.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Жылдам қосылу кодын авторизациялау мүмкін болмады.';

  @override
  String get quickConnectDisabled => 'Бұл серверде Quick Connect өшірілген.';

  @override
  String get quickConnectForbidden =>
      'Тіркелгіңіз осы Quick Connect сұрауына рұқсат бере алмайды.';

  @override
  String get quickConnectNotFound =>
      'Жылдам қосылу коды табылмады. Жаңа кодты қолданып көріңіз.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Кодты енгізіңіз';

  @override
  String get quickConnectAuthorize => 'Рұқсат ету';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get shuffleLibrary => 'Кітапхана';

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
  String get stillWatchingStop => 'Тоқта';

  @override
  String get stillWatchingContinue => 'Жалғастыру';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Тікелей теледидар';

  @override
  String get continueWatchingAndNextUp => 'Көруді және келесіні жалғастыру';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsPrivacyAndSafetySection => 'ҚҰПИЯЛЫҚ ЖӘНЕ ҚАУІПСІЗДІК';

  @override
  String get settingsBlockedRatings => 'Блокталған рейтингтер';

  @override
  String get settingsGeneralStyle => 'Жалпы стиль';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тақырып екпіні, фон, қаралған индикаторлар және тақырыптық музыка';

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
      'Show the Seerr button in the navigation bar';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (мұра)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
    return '$value ms';
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
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

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
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Home Screen Sections';

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
  String get displayPlaylistsRows => 'Display Playlist Rows';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Show Playlist rows in Home Sections.';

  @override
  String get playlistsRowSorting => 'Playlist Row Sorting';

  @override
  String get playlistsRowSortingDescription =>
      'Sort Playlist rows by date added, release date, alphabetically, and more.';

  @override
  String get displaySeerrRows => 'Display Seerr Discovery Rows';

  @override
  String get displaySeerrRowsSubtitle =>
      'Show Seerr discovery rows in Home Sections.';

  @override
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

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
  String get transcodingLimits => 'Transcoding Limits';
}
