// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ПРЕФЕРЕНЦИИ НА СМЕТКАТА';

  @override
  String get interfaceLanguage => 'Јазик на интерфејсот';

  @override
  String get systemLanguageDefault => 'Системски стандард';

  @override
  String get signIn => 'Пријавете се';

  @override
  String get empty => 'Празно';

  @override
  String connectingToServer(String serverName) {
    return 'Поврзување со $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Лозинка';

  @override
  String get username => 'Корисничко име';

  @override
  String get email => 'Е-пошта';

  @override
  String get quickConnectInstruction =>
      'Внесете го овој код на веб-таблата на вашиот сервер:';

  @override
  String get waitingForAuthorization => 'Се чека овластување...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Серверот е недостапен';

  @override
  String get loginFailed => 'Најавата не успеа';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect е недостапен: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect е недостапен ($status): $detail';
  }

  @override
  String get whosWatching => 'Кој гледа?';

  @override
  String get addUser => 'Додај корисник';

  @override
  String get selectServer => 'Изберете Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin верзија $version';
  }

  @override
  String get savedServers => 'Зачувани сервери';

  @override
  String get discoveredServers => 'Откриени сервери';

  @override
  String get noneFound => 'Никој не е пронајден';

  @override
  String get unableToConnectToServer => 'Не може да се поврзе со серверот';

  @override
  String get addServer => 'Додадете сервер';

  @override
  String get embyConnect => 'Emby Поврзете се';

  @override
  String get removeServer => 'Отстранете го серверот';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Да се отстрани „$serverName“ од вашите сервери?';
  }

  @override
  String get cancel => 'Откажи';

  @override
  String get remove => 'Отстрани';

  @override
  String get connectToServer => 'Поврзете се со серверот';

  @override
  String get serverAddress => 'Адреса на серверот';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Поврзете се';

  @override
  String get secureStorageUnavailable => 'Безбедното складирање е недостапно';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin не можеше да пристапи до вашиот системски приклучок. Најавувањето може да продолжи, но сигурното складирање на токени може да биде недостапно додека не се отклучи приклучокот за клучеви.';

  @override
  String get ok => 'Во ред';

  @override
  String get settingsAppearanceTheme => 'Тема на апликацијата';

  @override
  String get detailScreenStyle => 'Стил на екранот со детали';

  @override
  String get detailScreenStyleSubtitle =>
      'Класичен е оригиналниот центриран распоред на Moonfin. Модерен е адаптивен кинематографски распоред.';

  @override
  String get detailScreenStyleMoonfin => 'Класичен';

  @override
  String get detailScreenStyleModern => 'Модерен';

  @override
  String get expandedTabs => 'Проширени јазичиња';

  @override
  String get expandedTabsSubtitle =>
      'Автоматски прикажувај ја содржината на јазичињата при прегледување. Исклучете за рачно отворање и затворање на секое јазиче.';

  @override
  String get showTechnicalDetails => 'Прикажи технички детали?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Прикажувај кодек, резолуција и информации за стримот во резимето на банерот';

  @override
  String get recommendationSystem => 'Систем за препораки';

  @override
  String get recommendationSystemSubtitle =>
      'Користете го алгоритамот Moonfin Recommends за локалната библиотека или онлајн метриките за сличност на TMDb. Забелешка: онлајн препораките бараат интеграција со Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Сличност според TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Примени ограничување според родителска оцена?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ограничи ги предлозите на Moonfin Recommends според родителската оцена на целната содржина';

  @override
  String get interfaceStyle => 'Стил на интерфејсот';

  @override
  String get interfaceStyleSubtitle =>
      'Автоматски се прилагодува на вашиот уред. Изберете Apple или Material за да наметнете изглед.';

  @override
  String get interfaceStyleAutomatic => 'Автоматски';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Квалитет на стаклото';

  @override
  String get glassQualitySubtitle =>
      'Автоматски го избира најдобриот стаклен ефект за овој уред. Целосно наметнува вистинско заматување; Намалено користи лесно стакло што штеди GPU.';

  @override
  String get glassQualityAuto => 'Автоматски';

  @override
  String get glassQualityFull => 'Целосно';

  @override
  String get glassQualityReduced => 'Намалено';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Префрлете се помеѓу Moonfin и Neon Pulse без да ја рестартирате апликацијата';

  @override
  String get customThemeTitle => 'Прилагодена тема';

  @override
  String get customThemeSubtitle =>
      'Прилагодените теми ги менуваат визуелните елементи низ Moonfin. Изберете една од овие опции според вашиот стил.';

  @override
  String get keyboardPreferSystemIme => 'Претпочитај системска тастатура';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Стандардно користи го методот за внес на вашиот уред за внесување текст';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Моменталниот изглед на Moonfin што сите сте го засакале';

  @override
  String get themeNeonPulse => 'Неонски пулс';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave стајлинг со магента сјај, цијан текст и посилен хромиран контраст';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Стил со течно стакло, подвижна градиентна позадина, заматени површини и акцент во Apple сина';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро пиксел-арт стил со дебела палета, блокови рабови, остри сенки и пикселен фонт';

  @override
  String get embyConnectSignInSubtitle =>
      'Најавете се со вашата сметка на Emby Connect';

  @override
  String get emailOrUsername => 'Е-пошта или корисничко име';

  @override
  String get selectAServer => 'Изберете сервер';

  @override
  String get tryAgain => 'Обидете се повторно';

  @override
  String get noLinkedServers =>
      'Нема сервери поврзани со оваа сметка на Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Неважечки акредитиви за Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Неважечко корисничко име или лозинка за Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Серверот не поддржува размена на Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Мрежна грешка при контактирање на Emby Connect или избраниот сервер';

  @override
  String get loadingLinkedServers => 'Се вчитуваат поврзаните сервери...';

  @override
  String get connectingToServerEllipsis => 'Се поврзува со серверот...';

  @override
  String get noReachableAddress => 'Не е наведена достапна адреса';

  @override
  String get invalidServerExchangeResponse =>
      'Неважечки одговор од крајната точка за размена на сервер';

  @override
  String unableToConnectTo(String target) {
    return 'Не може да се поврзе со $target';
  }

  @override
  String get exitApp => 'Излезете од Moonfin?';

  @override
  String get exitAppConfirmation => 'Дали сте сигурни дека сакате да излезете?';

  @override
  String get exit => 'Излезете';

  @override
  String get gameMenu => 'Мени';

  @override
  String get gamePaused => 'Паузирано';

  @override
  String get gameSaveState => 'Зачувај состојба';

  @override
  String get games => 'Игри';

  @override
  String get gameLoadState => 'Вчитај состојба';

  @override
  String get gameFastForward => 'Брзо напред';

  @override
  String get gameEmulatorSettings => 'Поставки на емулаторот';

  @override
  String get gameNoCoreOptions => 'Ова јадро нема прилагодливи опции.';

  @override
  String get gameHoldToOpenMenu => 'Задржете за мени';

  @override
  String get gamePlaybackUnsupported =>
      'Играњето игри сè уште не е поддржано на овој уред.';

  @override
  String get noHomeRowsLoaded => 'Не можеше да се вчитаат почетни редови';

  @override
  String get noHomeRowsHint =>
      'Обидете се да ги освежите или намалите активните домашни секции.';

  @override
  String get retryHomeRows => 'Обидете се повторно со почетните редови';

  @override
  String get guide => 'Водич';

  @override
  String get recordings => 'Снимки';

  @override
  String get schedule => 'Распоред';

  @override
  String get series => 'Серии';

  @override
  String get noItemsFound => 'Не се пронајдени ставки';

  @override
  String get home => 'Почетна';

  @override
  String get browseAll => 'Прелистајте ги сите';

  @override
  String get genres => 'Жанрови';

  @override
  String get collectionPlaceholder => 'Овде ќе се појават ставки од колекција';

  @override
  String get browseByLetter => 'Прелистајте по писмо';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Прелистувањето по азбучен ред ќе се појави овде';

  @override
  String get suggestions => 'Предлози';

  @override
  String get suggestionsPlaceholder => 'Предложените ставки ќе се појават овде';

  @override
  String get failedToLoadLibraries => 'Не успеа да се вчитаат библиотеките';

  @override
  String get noLibrariesFound => 'Не се пронајдени библиотеки';

  @override
  String get library => 'Библиотека';

  @override
  String get displaySettings => 'Поставки за приказ';

  @override
  String get allGenres => 'Сите жанрови';

  @override
  String get noGenresFound => 'Не се пронајдени жанрови';

  @override
  String failedToLoadFolderError(String error) {
    return 'Неуспешно вчитување на папката: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Оваа папка е празна';

  @override
  String itemCountLabel(int count) {
    return '$count ставки';
  }

  @override
  String get failedToLoadFavorites => 'Не успеа да се вчитаат омилените';

  @override
  String get retry => 'Обидете се повторно';

  @override
  String get noFavoritesYet => 'Сè уште нема омилени';

  @override
  String get favorites => 'Омилени';

  @override
  String totalCountItems(int count) {
    return '$count Ставки';
  }

  @override
  String get continuing => 'Продолжувајќи';

  @override
  String get ended => 'Заврши';

  @override
  String get sortAndFilter => 'Сортирање и филтрирање';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Подреди по';

  @override
  String get display => 'Приказ';

  @override
  String get imageType => 'Тип на слика';

  @override
  String get posterSize => 'Големина на постер';

  @override
  String get small => 'Мали';

  @override
  String get medium => 'Средно';

  @override
  String get large => 'Големи';

  @override
  String get extraLarge => 'Екстра голем';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Жанрови';
  }

  @override
  String get views => 'Прегледи';

  @override
  String get albums => 'Албуми';

  @override
  String get albumArtists => 'Изведувачи на албуми';

  @override
  String get artists => 'Изведувачи';

  @override
  String get bookmarks => 'Обележувачи';

  @override
  String get noSavedBookmarks =>
      'Сè уште нема зачувани обележувачи за овој наслов.';

  @override
  String get openBook => 'Отвори книга';

  @override
  String get chapter => 'Поглавје';

  @override
  String get page => 'Страница';

  @override
  String get bookmark => 'Обележете';

  @override
  String get justNow => 'Само сега';

  @override
  String minutesAgo(int count) {
    return 'пред $countм';
  }

  @override
  String hoursAgo(int count) {
    return 'пред $countч';
  }

  @override
  String daysAgo(int count) {
    return 'пред $countд';
  }

  @override
  String get discoverySubjects => 'Предмети за откривање';

  @override
  String get pickDiscoverySubjects =>
      'Изберете која тема ќе се прикаже во Discover.';

  @override
  String get apply => 'Примени';

  @override
  String get openLink => 'Отворете ја врската';

  @override
  String get scanWithYourPhone => 'Скенирајте со вашиот телефон';

  @override
  String get audiobookGenres => 'Жанрови на аудио книги';

  @override
  String get pickAudiobookGenres =>
      'Изберете кои жанрови да се прикажуваат во Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Откријте аудио книги';

  @override
  String get librivoxDescription =>
      'Популарни наслови од јавен домен од LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count наслови';
  }

  @override
  String get scrollLeft => 'Скролувајте лево';

  @override
  String get scrollRight => 'Скролувајте десно';

  @override
  String get couldNotLoadGenre => 'Не може да се вчита овој жанр во моментов.';

  @override
  String get continueReading => 'Продолжи со читање';

  @override
  String get savedHighlights => 'Зачувани Определување';

  @override
  String get continueListening => 'Продолжи со слушање';

  @override
  String get listen => 'Слушај';

  @override
  String get resume => 'Продолжи';

  @override
  String get failedToLoadLibrary => 'Не успеа да се вчита библиотеката';

  @override
  String get popularNow => 'Популарно сега';

  @override
  String get savedForLater => 'Зачувано за подоцна';

  @override
  String get topListens => 'Врвни слушања';

  @override
  String get unreadDiscoveries => 'Непрочитани откритија';

  @override
  String get pickUpAgain => 'Подигнете повторно';

  @override
  String get bookHighlightsDescription =>
      'Вашите книги со најважни моменти, омилени или напредок во читањето.';

  @override
  String get handPickedFromLibrary => 'Рачно избрано од вашата библиотека.';

  @override
  String get handPickedFromListeningQueue =>
      'Рачно избрано од редот за слушање.';

  @override
  String get booksWithHighlights =>
      'Книги со најважни моменти, омилени или напредок во читањето.';

  @override
  String get jumpBackNarration =>
      'Скокни назад во нарацијата без да го бараш своето место.';

  @override
  String get unreadBooksReady =>
      'Непрочитаните книги подготвени за следниот мирен час.';

  @override
  String get quickAccessFavorites =>
      'Брз пристап до книгите на кои постојано се враќате.';

  @override
  String get searchAudiobooks => 'Пребарувајте аудио книги';

  @override
  String get searchYourLibrary => 'Пребарајте ја вашата библиотека';

  @override
  String get pickUpStory =>
      'Продолжете со приказната таму каде што сте застанале';

  @override
  String get savedPlacesChapters =>
      'Вашите зачувани места и недовршени поглавја';

  @override
  String authorsCount(int count) {
    return '$count автори';
  }

  @override
  String genresCount(int count) {
    return '$count жанрови';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% завршено';
  }

  @override
  String get readyWhenYouAre => 'Подготвени кога сте';

  @override
  String get details => 'Детали';

  @override
  String get listeningRoom => 'Соба за слушање';

  @override
  String get bookmarksAndProgress => 'Обележувачи и напредок';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count наслови подредени за прегледување ориентирано кон читање.';
  }

  @override
  String get titles => 'Наслови';

  @override
  String get allTitles => 'Сите титули';

  @override
  String get authors => 'Автори';

  @override
  String get browseByAuthor => 'Прелистувајте по автор';

  @override
  String get browseByGenre => 'Прелистувајте по жанр';

  @override
  String get discover => 'Откријте';

  @override
  String get trendingTitlesOpenLibrary =>
      'Наслови во тренд по тема од Open Library.';

  @override
  String get noBookmarkedItems => 'Сè уште нема обележани ставки';

  @override
  String get nothingMatchesSection =>
      'Сè уште ништо не одговара на овој дел. Обидете се со друга картичка или вратете се откако ќе заврши синхронизацијата на библиотеката.';

  @override
  String get audiobooks => 'Аудио книги';

  @override
  String noLabelFound(String label) {
    return 'Не се пронајдени $label';
  }

  @override
  String get folder => 'Папка';

  @override
  String get filters => 'Филтри';

  @override
  String get readingStatus => 'Статус на читање';

  @override
  String get playedStatus => 'Статус на репродукција';

  @override
  String get readStatus => 'Прочитајте';

  @override
  String get watched => 'Гледано';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Негледано';

  @override
  String get seriesStatus => 'Статус на серијата';

  @override
  String get allLibraries => 'Сите библиотеки';

  @override
  String get books => 'Книги';

  @override
  String get latestBooks => 'Најнови книги';

  @override
  String get latestAudiobooks => 'Најнови аудиокниги';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Книга';

  @override
  String get bookFormatAudiobook => 'Аудиокнига';

  @override
  String bookPercentRead(int percent) {
    return '$percent% прочитано';
  }

  @override
  String bookTimeLeft(String time) {
    return 'уште $time';
  }

  @override
  String get bookHeroRead => 'Читај';

  @override
  String get bookHeroListen => 'Слушај';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Непознат автор';

  @override
  String get uncategorized => 'Некатегоризирано';

  @override
  String get overview => 'Преглед';

  @override
  String get noLibrivoxDescription =>
      'Сè уште нема опис на LibriVox за овој наслов.';

  @override
  String get readers => 'Читатели';

  @override
  String get openLinks => 'Отворете ги врските';

  @override
  String get librivoxPage => 'Страница LibriVox';

  @override
  String get internetArchive => 'Интернет архива';

  @override
  String get rssFeed => 'RSS канал';

  @override
  String get downloadZip => 'Преземете Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count делови';
  }

  @override
  String firstPublished(int year) {
    return 'Првпат објавено $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Сè уште нема достапен преглед од Open Library за овој наслов.';

  @override
  String get subjects => 'Предмети';

  @override
  String get all => 'Сите';

  @override
  String booksCount(int count) {
    return '$count книги';
  }

  @override
  String get couldNotLoadSubject =>
      'Не може да се вчита оваа тема во моментов.';

  @override
  String get audiobookDetails => 'Детали за аудио книга';

  @override
  String authorsCountTitle(int count) {
    return '$count Автори';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудиокниги',
      one: '$count аудиокнига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Листа на песни';

  @override
  String get itemListPlaceholder => 'Списокот со ставки ќе се појави овде';

  @override
  String get failedToLoad => 'Не успеа да се вчита';

  @override
  String get delete => 'Избриши';

  @override
  String get save => 'Зачувај';

  @override
  String get moreLikeThis => 'Повеќе како ова';

  @override
  String get castAndCrew => 'Улоги и екипаж';

  @override
  String get collection => 'Колекција';

  @override
  String get episodes => 'Епизоди';

  @override
  String get nextUp => 'Следно Нагоре';

  @override
  String get seasons => 'Сезони';

  @override
  String get chapters => 'Поглавја';

  @override
  String get features => 'Карактеристики';

  @override
  String get movies => 'Филмови';

  @override
  String get musicVideos => 'Музички видеа';

  @override
  String get other => 'Друго';

  @override
  String get discography => 'Дискографија';

  @override
  String get similarArtists => 'Слични уметници';

  @override
  String get tableOfContents => 'Содржина';

  @override
  String get tracklist => 'Листа на песни';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'Биографија';

  @override
  String get authorDetails => 'Детали за авторот';

  @override
  String get noOverviewAvailable =>
      'Сè уште нема достапен преглед за овој наслов.';

  @override
  String get noBiographyAvailable => 'Нема достапна биографија за овој автор.';

  @override
  String get noBooksFound => 'Не се пронајдени книги за овој автор.';

  @override
  String get unableToLoadAuthorDetails =>
      'Не може да се вчитаат деталите за авторот во моментов.';

  @override
  String published(int year) {
    return 'Објавено $year';
  }

  @override
  String get publicationDateUnknown => 'Непознат датум на објавување';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Сезони',
      one: '$count Сезона',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Завршува во $time';
  }

  @override
  String get items => 'Ставки';

  @override
  String get extras => 'Додатоци';

  @override
  String get behindTheScenes => 'Зад сцената';

  @override
  String get deletedScenes => 'Избришани сцени';

  @override
  String get featurettes => 'Кратки материјали';

  @override
  String get interviews => 'Интервјуа';

  @override
  String get scenes => 'Сцени';

  @override
  String get shorts => 'Краткометражни филмови';

  @override
  String get trailers => 'Трејлери';

  @override
  String timeRemaining(String time) {
    return 'уште $time';
  }

  @override
  String endsIn(String time) {
    return 'Завршува за $time';
  }

  @override
  String get view => 'Прикажи';

  @override
  String get resumeReading => 'Продолжи со читање';

  @override
  String get read => 'Прочитајте';

  @override
  String resumeFrom(String position) {
    return 'Продолжи од $position';
  }

  @override
  String get play => 'Пушти';

  @override
  String get startOver => 'Започнете одново';

  @override
  String get restart => 'Рестартирајте';

  @override
  String get readOffline => 'Прочитајте Офлајн';

  @override
  String get playOffline => 'Играјте офлајн';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Преводи';

  @override
  String get version => 'Верзија';

  @override
  String get cast => 'Емитувај';

  @override
  String get trailer => 'Трејлер';

  @override
  String get finished => 'Завршено';

  @override
  String get favorited => 'Омилени';

  @override
  String get favorite => 'Омилен';

  @override
  String get playlist => 'Плејлиста';

  @override
  String get downloaded => 'Преземено';

  @override
  String get downloadAll => 'Преземете ги сите';

  @override
  String get download => 'Преземи';

  @override
  String get deleteDownloaded => 'Избришете го преземеното';

  @override
  String get goToSeries => 'Одете во Серии';

  @override
  String get editMetadata => 'Уреди метаподатоци';

  @override
  String get less => 'Помалку';

  @override
  String get more => 'Повеќе';

  @override
  String get deleteItem => 'Избриши ставка';

  @override
  String get deletePlaylist => 'Избришете ја плејлистата';

  @override
  String get deletePlaylistMessage =>
      'Да се ​​избрише оваа плејлиста од серверот?';

  @override
  String get deleteItemMessage => 'Да се ​​избрише оваа ставка од серверот?';

  @override
  String get failedToDeletePlaylist => 'Не успеа да се избрише плејлистата';

  @override
  String get failedToDeleteItem => 'Не успеа да се избрише ставката';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Преименувајте ја плејлистата';

  @override
  String get playlistName => 'Име на плејлистата';

  @override
  String get deleteDownloadedAlbum => 'Избришете го преземениот албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Да се избришат преземените песни за „$title“?';
  }

  @override
  String get downloadedTracksDeleted => 'Преземените песни се избришани';

  @override
  String get downloadedTracksDeleteFailed =>
      'Некои преземени песни не може да се избришат';

  @override
  String get noTracksLoaded => 'Нема вчитани песни';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Не се вчитани $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Се презема $title ($count ставки)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Дали сте сигурни дека сакате да го избришете „$name“ од серверот? Ова дејство не може да се врати.';
  }

  @override
  String get itemDeleted => 'Ставката е избришана';

  @override
  String get noPlayableTrailerFound =>
      'Не е пронајдена трејлер за репродукција.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Неподдржан формат на книга: .$extension';
  }

  @override
  String get audioTrack => 'Аудио песна';

  @override
  String get subtitleTrack => 'Песна со титл';

  @override
  String get none => 'Нема';

  @override
  String get downloadSubtitlesLabel => 'Преземете титлови...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Пребарувајте користејќи го приклучокот OpenSubtitles';

  @override
  String get downloadSubtitles => 'Преземете преводи';

  @override
  String get selectedSubtitleInvalid => 'Избраниот титл е неважечки.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Преводот е преземен и избран: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Преводот е преземен. Можеби ќе треба еден момент да се појави додека Jellyfin ја освежува ставката.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Не се пронајдени оддалечени преводи за $language.';
  }

  @override
  String get selectVersion => 'Изберете верзија';

  @override
  String versionNumber(int number) {
    return 'Верзија $number';
  }

  @override
  String get downloadAllQuality => 'Преземи ги сите — Квалитет';

  @override
  String get downloadQuality => 'Квалитет на преземање';

  @override
  String get originalFileNoReencoding =>
      'Оригинална датотека, без повторно кодирање';

  @override
  String get originalFilesNoReencoding =>
      'Оригинални датотеки, без повторно кодирање';

  @override
  String get noEpisodesLoaded => 'Нема вчитани епизоди';

  @override
  String downloadingItem(String name, String quality) {
    return 'Се презема $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Избришете ги преземените датотеки';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Да се избришат локалните датотеки за $typeLabel?\n\nОва ќе ослободи простор за складирање. Можете повторно да преземете подоцна.';
  }

  @override
  String get downloadedFilesDeleted => 'Преземените датотеки се избришани';

  @override
  String get failedToDeleteFiles => 'Не успеа да се избришат датотеките';

  @override
  String get deleteFiles => 'Избришете датотеки';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get directors => 'РЕЖИСЕРИ';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТИ';

  @override
  String get studio => 'СТУДИО';

  @override
  String studioMoreCount(int count) {
    return '+$count повеќе';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Епизоди';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Епизода $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Поглавје $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count песни',
      one: '$count песна',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поглавја',
      one: '$count поглавје',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Роден/а $date';
  }

  @override
  String died(String date) {
    return 'Починал/а $date';
  }

  @override
  String age(int age) {
    return 'Возраст $age';
  }

  @override
  String get showLess => 'Прикажи помалку';

  @override
  String get readMore => 'Прочитај повеќе';

  @override
  String get shuffle => 'Измешај';

  @override
  String get shuffleAllMusic => 'Измешај ја целата музика';

  @override
  String get carSignInPrompt => 'Најавете се на Moonfin на вашиот телефон';

  @override
  String get carServerUnreachable => 'Не може да се пристапи до вашиот сервер';

  @override
  String downloadsCount(int count) {
    return '$count преземања';
  }

  @override
  String get perfectMatch => 'Совршен натпревар';

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
    return '$action на оддалечени преводи бара дозвола за управување со преводи во Jellyfin за овој корисник.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Оваа ставка не може да се најде на серверот за $action на оддалечени преводи.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action на оддалечени преводи не успеа: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action на оддалечени преводи не успеа (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Неуспешно $action на оддалечени преводи.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'сите преземени епизоди за „$name“';
  }

  @override
  String get deleteSeasonFiles => 'сите преземени епизоди во оваа сезона';

  @override
  String get stillWatching => 'Сè уште гледате?';

  @override
  String get unableToLoadTrailerStream =>
      'Не може да се вчита преносот на приколката.';

  @override
  String get trailerTimedOut =>
      'Времето на приколката истече додека се вчитуваше.';

  @override
  String get playbackFailedForTrailer =>
      'Репродукцијата не успеа за оваа трејлер.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Емитувањето е недостапно за време на офлајн репродукција.';

  @override
  String castActionFailed(String label, String error) {
    return 'Дејството $label не успеа: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Неуспешно поставување на волуменот при емитување: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Контроли за $label';
  }

  @override
  String get deviceVolume => 'Јачина на звук на уредот';

  @override
  String get unavailable => 'Недостапно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Синхронизирај позиција';

  @override
  String stopCast(String label) {
    return 'Запри $label';
  }

  @override
  String get queueIsEmpty => 'Редот е празен';

  @override
  String trackNumber(int number) {
    return 'Песна $number';
  }

  @override
  String get remotePlayback => 'Далечинска репродукција';

  @override
  String get castingToGoogleCast => 'Емитување на Google Cast';

  @override
  String get castingViaAirPlay => 'Кастинг преку AirPlay';

  @override
  String get castingViaDlna => 'Кастинг преку DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунди';
  }

  @override
  String get longPressToUnlock => 'Долго притиснете за отклучување';

  @override
  String get off => 'Исклучено';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Автоматски';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Надминување на брзината на битови';

  @override
  String get audioDelay => 'Аудио одложување';

  @override
  String delayMinusMs(int value) {
    return '-$valueмс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$valueмс';
  }

  @override
  String get subtitleDelay => 'Одложување на титловите';

  @override
  String get reset => 'Ресетирај';

  @override
  String get unknown => 'Непознат';

  @override
  String get playbackInformation => 'Информации за репродукција';

  @override
  String get playback => 'Репродукција';

  @override
  String get playMethod => 'Метод на играње';

  @override
  String get directPlay => 'Директна игра';

  @override
  String get directStream => 'Директен тек';

  @override
  String get transcoding => 'Транскодирање';

  @override
  String get transcodeReasons => 'Причини за транскодирање';

  @override
  String get player => 'Плеер';

  @override
  String get container => 'Контејнер';

  @override
  String get bitrate => 'Брзина на битови';

  @override
  String get video => 'Видео';

  @override
  String get resolution => 'Резолуција';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Брзина на битови на видеото';

  @override
  String get track => 'Запис';

  @override
  String get channels => 'Канали';

  @override
  String get audioBitrate => 'Аудио брзина на битови';

  @override
  String get sampleRate => 'Стапка на примерок';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Надворешен';

  @override
  String get embedded => 'Вградени';

  @override
  String castSessionError(String protocol) {
    return 'Грешка во $protocol сесијата';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Неуспешно вчитување на деталите за книгата: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Предавањето EPUB во апликација сè уште не е достапно на оваа платформа.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Овој формат (.$extension) сè уште не може да се прикаже во апликацијата.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Претставувањето на вградените документи е недостапно на оваа платформа.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не може да се отвори надворешниот прегледувач.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Неуспешно отворање на читачот во апликацијата: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Обележувачот е веќе зачуван на $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Додаден обележувач: $label';
  }

  @override
  String get noBookmarksYet =>
      'Сè уште нема обележувачи.\nДопрете ја иконата за обележувачи додека читате за да ја зачувате вашата позиција.';

  @override
  String get noTableOfContentsAvailable => 'Нема достапна табела со содржини';

  @override
  String pageLabel(int number) {
    return 'Страница $number';
  }

  @override
  String get position => 'Позиција';

  @override
  String get bookReader => 'Читач на книги';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% прочитано';
  }

  @override
  String get updating => 'Се ажурира...';

  @override
  String get markUnread => 'Означи непрочитано';

  @override
  String get markAsRead => 'Означи како прочитано';

  @override
  String get reloadReader => 'Вчитај повторно читач';

  @override
  String get noPagesFound => 'Не се пронајдени страници.';

  @override
  String get failedToDecodePageImage =>
      'Не успеа да се декодира сликата на страницата.';

  @override
  String resetZoom(String zoom) {
    return 'Ресетирај го зумот (${zoom}x)';
  }

  @override
  String get singlePage => 'Единечна страница';

  @override
  String get twoPageSpread => 'Ширење на две страници';

  @override
  String get addBookmark => 'Додадете обележувач';

  @override
  String get bookmarksEllipsis => 'Обележувачи...';

  @override
  String get markedAsRead => 'Означено како прочитано';

  @override
  String get markedAsUnread => 'Означено како непрочитано';

  @override
  String failedToUpdateReadState(String error) {
    return 'Неуспешно ажурирање на статусот на читање: $error';
  }

  @override
  String get themeSystem => 'Тема: Систем';

  @override
  String get themeLight => 'Тема: Светлина';

  @override
  String get themeDark => 'Тема: Темно';

  @override
  String get themeSepia => 'Тема: Сепија';

  @override
  String get invertColorsFixedLayout => 'Инвертирај бои (фиксен распоред)';

  @override
  String get invertColorsPdf => 'Инвертирај бои (PDF)';

  @override
  String get preparingInAppReader => 'Се подготвува читач во апликација...';

  @override
  String get pdfDataNotAvailable => 'Податоците за PDF не се достапни.';

  @override
  String get readerFallbackModeActive =>
      'Режимот за враќање на читачот е активен';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Оваа платформа не може да го вгради документскиот погон за $extension датотеки.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Користете Reload Reader откако ќе се префрлите на поддржана цел на платформа (Android, iOS, macOS).';

  @override
  String get openExternally => 'Отвори надворешно';

  @override
  String get noEpubChaptersFound => 'Не се пронајдени поглавја од EPUB.';

  @override
  String get readerNotReady => 'Читачот не е подготвен.';

  @override
  String get seriesRecordings => 'Снимки од серии';

  @override
  String get now => 'Сега';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Вести';

  @override
  String get kids => 'Деца';

  @override
  String get premiere => 'Премиера';

  @override
  String get guideTimeline => 'Водич временска линија';

  @override
  String failedToLoadGuide(String error) {
    return 'Неуспешно вчитување на водичот: $error';
  }

  @override
  String get noChannelsFound => 'Не се пронајдени канали';

  @override
  String get liveBadge => 'ВО ЖИВО';

  @override
  String guideNextProgram(String time, String title) {
    return 'Следно: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'уште $minutes мин';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'уште $hours ч';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'уште $hours ч $minutes мин';
  }

  @override
  String get movie => 'Филм';

  @override
  String get removedFromFavoriteChannels => 'Отстрането од омилените канали';

  @override
  String get addedToFavoriteChannels => 'Додадено во омилените канали';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Не успеа да се ажурира омилениот канал';

  @override
  String get unfavoriteChannel => 'Неомилен канал';

  @override
  String get favoriteChannel => 'Омилен канал';

  @override
  String get record => 'Снимај';

  @override
  String get cancelRecordingAction => 'Откажи снимање';

  @override
  String get programSetToRecord => 'Програмата е закажана за снимање';

  @override
  String get recordingCancelled => 'Снимањето е откажано';

  @override
  String get unableToCreateRecording => 'Не може да се создаде снимка';

  @override
  String get watch => 'Гледај';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Неуспешно пуштање на $name';
  }

  @override
  String get failedToLoadRecordings => 'Не успеа да се вчитаат снимките';

  @override
  String get scheduledInNext24Hours => 'Закажано во следните 24 часа';

  @override
  String get recentRecordings => 'Неодамнешни снимки';

  @override
  String get tvSeries => 'ТВ серии';

  @override
  String get failedToLoadSchedule => 'Не успеа да се вчита распоредот';

  @override
  String get noScheduledRecordings => 'Нема закажани снимки';

  @override
  String get cancelRecording => 'Да се ​​откаже снимањето?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Да се откаже закажаното снимање на „$name“?';
  }

  @override
  String get no => 'Не';

  @override
  String get yesCancel => 'Да, Откажи';

  @override
  String get failedToCancelRecording => 'Не успеа да се откаже снимањето';

  @override
  String get failedToLoadSeriesRecordings =>
      'Не успеа да се вчитаат сериските снимки';

  @override
  String get noSeriesRecordings => 'Нема снимки од серии';

  @override
  String get cancelSeriesRecording => 'Откажете го снимањето на серијата';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Да се ​​откаже снимањето на серијата?';

  @override
  String stopRecordingName(String name) {
    return 'Да се запре снимањето на „$name“?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Не успеа да се откаже снимањето на серијата';

  @override
  String get searchThisLibrary => 'Пребарајте ја оваа библиотека...';

  @override
  String get searchEllipsis => 'Барај...';

  @override
  String noResultsForQuery(String query) {
    return 'Нема резултати за „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Пребарувањето не успеа: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Тип на Seerr сметка';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Локално';

  @override
  String get savedMedia => 'Зачувани медиуми';

  @override
  String get tvShows => 'ТВ емисии';

  @override
  String get music => 'Музика';

  @override
  String get musicAlbums => 'Музички албуми';

  @override
  String get noMediaInFilter => 'Нема медиум во овој филтер';

  @override
  String get noDownloadedMediaYet => 'Сè уште нема преземени медиуми';

  @override
  String get browseLibrary => 'Прелистајте ја библиотеката';

  @override
  String get deleteDownload => 'Избриши преземање';

  @override
  String removeItemAndFiles(String name) {
    return 'Да се отстрани „$name“ и неговите датотеки?';
  }

  @override
  String tracksCount(int count) {
    return '$count песни';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Пушти го албумот';

  @override
  String failedToLoadAlbum(String error) {
    return 'Неуспешно вчитување на албумот: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Не се пронајдени преземени песни за $name.';
  }

  @override
  String get season => 'Сезона';

  @override
  String get errorLoadingEpisodes => 'Грешка при вчитување епизоди';

  @override
  String get noDownloadedEpisodes => 'Нема преземени епизоди';

  @override
  String get deleteEpisode => 'Избришете ја епизодата';

  @override
  String removeName(String name) {
    return 'Да се отстрани „$name“?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'С$season Е$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Епизода $number';
  }

  @override
  String get seriesNotFound => 'Серијата не е пронајдена';

  @override
  String get errorLoadingSeries => 'Грешка при вчитување на серијата';

  @override
  String get downloadedEpisodes => 'Преземени епизоди';

  @override
  String seasonNumber(int number) {
    return 'Сезона $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Специјални';

  @override
  String get deleteSeason => 'Избриши сезона';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Да се избришат сите преземени епизоди во $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизоди',
      one: '$count епизода',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Управување со складирање';

  @override
  String get storageBreakdown => 'Дефект на складирање';

  @override
  String get downloadedItems => 'Преземени ставки';

  @override
  String get storageLimit => 'Ограничување на складирање';

  @override
  String get noLimit => 'Нема ограничување';

  @override
  String get deleteAllDownloads => 'Избришете ги сите преземања';

  @override
  String get deleteAllDownloadsWarning =>
      'Ова ќе ги отстрани сите преземени медиумски датотеки и не може да се врати.';

  @override
  String get deleteAll => 'Избриши ги сите';

  @override
  String get deleteSelected => 'Избриши го избраното';

  @override
  String deleteSelectedCount(int count) {
    return 'Да се избришат $count преземени ставки?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудио книги';

  @override
  String get images => 'Слики';

  @override
  String get database => 'База на податоци';

  @override
  String ofStorageLimit(String limit) {
    return 'од лимитот од $limit';
  }

  @override
  String get settings => 'Поставки';

  @override
  String get authentication => 'Автентикација';

  @override
  String get autoLoginServerManagement =>
      'Автоматско најавување, управување со серверот';

  @override
  String get pinCode => 'ПИН код';

  @override
  String get setUpPinCodeProtection => 'Поставете заштита на PIN кодот';

  @override
  String get parentalControls => 'Родителска контрола';

  @override
  String get contentRatingRestrictions =>
      'Ограничувања за оценување на содржината';

  @override
  String get bitRateResolutionBehavior =>
      'Брзина на битови, резолуција, однесување';

  @override
  String get languageSizeAppearance => 'Јазик, големина, изглед';

  @override
  String get qualityStorage => 'Квалитет, складирање';

  @override
  String get serverSyncAndPluginStatus =>
      'Синхронизација на серверот и статус на приклучокот';

  @override
  String get mediaRequestIntegration => 'Интеграција на барање за медиуми';

  @override
  String get switchServer => 'Префрли сервер';

  @override
  String get signOut => 'Одјавете се';

  @override
  String get versionLicenses => 'Верзија, лиценци';

  @override
  String get account => 'Сметка';

  @override
  String get signInAndSecurity => 'Пријавување и безбедност';

  @override
  String get administration => 'Администрација';

  @override
  String get serverSettingsUsersLibraries =>
      'Поставки на серверот, корисници, библиотеки';

  @override
  String get customization => 'Прилагодување';

  @override
  String get themeAndLayout => 'Тема и распоред';

  @override
  String get videoAndSubtitles => 'Видео и преводи';

  @override
  String get integrations => 'Интеграции';

  @override
  String get pluginAndRequests => 'Приклучок и барања';

  @override
  String get customizeAccountPlaybackInterface =>
      'Приспособете го однесувањето на сметката, репродукцијата и интерфејсот';

  @override
  String optionsCount(int count) {
    return '$count опции';
  }

  @override
  String get themeAndAppearance => 'Тема и изглед';

  @override
  String get focusBorderColor => 'Фокусирајте ја бојата на границата';

  @override
  String get watchedIndicators => 'Гледани индикатори';

  @override
  String get always => 'Секогаш';

  @override
  String get hideUnwatched => 'Сокриј го невиденото';

  @override
  String get episodesOnly => 'Само епизоди';

  @override
  String get never => 'Никогаш';

  @override
  String get focusExpansionAnimation => 'Анимација за проширување на фокусот';

  @override
  String get desktopUiScale => 'Скала за интерфејс на работната површина';

  @override
  String get scaleFocusedCards =>
      'Размерете ги фокусираните или лебдените картички и плочки';

  @override
  String get backgroundBackdrops => 'Позадини во заднина';

  @override
  String get showBackdropImages => 'Прикажи слики од позадина зад содржината';

  @override
  String get seriesThumbnails => 'Сликички од серии';

  @override
  String get seriesThumbnailsDescription =>
      'Само епизоди: користете сериски уметнички дела што одговараат на секој тип на слика на ред';

  @override
  String get homeRowInfoOverlay =>
      'Преклопување на информации за почетниот ред';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Прикажи наслов и метаподатоци при прелистување на почетните редови';

  @override
  String get clockDisplay => 'Приказ на часовник';

  @override
  String get inMenus => 'Во менијата';

  @override
  String get inVideo => 'Во Видео';

  @override
  String get seasonalEffects => 'Сезонски ефекти';

  @override
  String get seasonalEffectsDescription => 'Визуелни ефекти и сезонски украси';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'огномет';

  @override
  String get confetti => 'Конфети';

  @override
  String get fallingLeaves => 'Паѓаат лисја';

  @override
  String get themeMusic => 'Тематска музика';

  @override
  String get playThemeMusicOnDetailPages =>
      'Репродуцирајте музика со теми на страниците со детали';

  @override
  String get themeMusicVolume => 'Јачина на звук на тема музика';

  @override
  String get themeMusicSettingsSubtitle =>
      'Страници со детали, почетни редови и волумен';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематска музика на почетните редови';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Репродуцирајте при прелистување на почетниот екран';

  @override
  String get loopThemeMusic => 'Повторувај ја тематската музика';

  @override
  String get loopThemeMusicSubtitle =>
      'Повторувај ја песната наместо да се пушти еднаш';

  @override
  String get detailsBackgroundBlur => 'Детали Заматување на позадината';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Прелистување замаглување на позадината';

  @override
  String get maxStreamingBitrate => 'Максимална брзина на пренос на битови';

  @override
  String get maxResolution => 'Максимална резолуција';

  @override
  String get playerZoomMode => 'Режим на зумирање на играчот';

  @override
  String get settingsScrollWheelAction => 'Тркалце на глувчето';

  @override
  String get settingsScrollWheelActionDescription =>
      'Изберете што прави движењето на тркалцето на глувчето врз видеото при репродукција.';

  @override
  String get scrollWheelActionOff => 'Исклучено';

  @override
  String get scrollWheelActionSeek => 'Премотување (напред / назад)';

  @override
  String get scrollWheelActionVolume => 'Јачина на звук';

  @override
  String get playerTooltipVolume => 'Јачина на звук';

  @override
  String get fit => 'Се вклопуваат';

  @override
  String get autoCrop => 'Автоматско отсекување';

  @override
  String get stretch => 'Истегнете се';

  @override
  String get refreshRateSwitching => 'Префрлување на стапката на освежување';

  @override
  String get disabled => 'Оневозможено';

  @override
  String get scaleOnTv => 'Скала на ТВ';

  @override
  String get scaleOnDevice => 'Скала на уредот';

  @override
  String get trickPlay => 'Играј со трик';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Прикажи преглед на сликички кога барате';

  @override
  String get showDescriptionOnPause => 'Прикажи опис на пауза';

  @override
  String get dimVideoShowOverview =>
      'Затемнете го видеото и прикажете го текстот за преглед додека е паузиран';

  @override
  String get osdLockButton => 'Копче за заклучување на OSD';

  @override
  String get osdLockButtonDescription =>
      'Прикажи копче за заклучување што го блокира внесувањето на допир додека не се притисне долго';

  @override
  String get audioBehavior => 'Аудио однесување';

  @override
  String get downmixToStereo => 'Спуштање во стерео';

  @override
  String get defaultAudioLanguage => 'Стандарден аудио јазик';

  @override
  String get fallbackAudioLanguage => 'Резервен јазик на аудиото';

  @override
  String get preferDefaultAudioTrack => 'Претпочитај стандарден аудио запис';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Претпочитај го оригиналниот аудио запис наместо локализираната синхронизација.';

  @override
  String get preferAudioDescription => 'Претпочитај записи со аудио опис';

  @override
  String get preferAudioDescriptionDescription =>
      'Претпочитај ги записите со аудио опис наместо обичните записи.';

  @override
  String get transcodingAudio => 'Транскодирање (аудио)';

  @override
  String get directStreamRemux => 'Директен стрим (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскодирање (битрејт или резолуција)';

  @override
  String get transcodingVideoAndAudio => 'Транскодирање (видео и аудио)';

  @override
  String get transcodingVideo => 'Транскодирање (видео)';

  @override
  String get autoServerDefault => 'Автоматски (стандарден сервер)';

  @override
  String get english => 'Англиски јазик';

  @override
  String get spanish => 'шпански';

  @override
  String get french => 'француски';

  @override
  String get german => 'германски';

  @override
  String get italian => 'италијански';

  @override
  String get portuguese => 'португалски';

  @override
  String get japanese => 'јапонски';

  @override
  String get korean => 'корејски';

  @override
  String get chinese => 'кинески';

  @override
  String get russian => 'руски';

  @override
  String get arabic => 'арапски';

  @override
  String get hindi => 'хинди';

  @override
  String get dutch => 'холандски';

  @override
  String get swedish => 'шведски';

  @override
  String get norwegian => 'норвешки';

  @override
  String get danish => 'дански';

  @override
  String get finnish => 'фински';

  @override
  String get polish => 'полски';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'TrueHD поддршка';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS аудио само до AVR; бара поддршка од ресиверот и изворна песна на DTS';

  @override
  String get enableTrueHdAudio =>
      'Овозможи звук TrueHD (може да не работи на сите платформи)';

  @override
  String get settingsAudioOutputMode => 'Режим на аудио излез';

  @override
  String get settingsAudioOutputModeDescription =>
      'Изберете како се декодира аудиото. AVR Passthrough испраќа необработени Dolby/DTS стримови до вашиот ресивер; Автоматски или Downmix декодира локално.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Резервен аудио кодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Изберете го целниот формат за транскодирање на повеќеканално аудио кога изворниот стрим не може да се пушти директно или да помине без обработка.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Автоматско откривање\n(Препорачано)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Стандардно)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Без загуби)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Само стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Ефикасен)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Без загуби)';

  @override
  String get settingsMaxAudioChannels => 'Максимум аудио канали';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Поставете го максималниот број канали на вашиот аудио систем. Повеќеканалните стримови над овој лимит ќе бидат измешани или транскодирани.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Автоматско откривање\n(Стандардно за хардверот)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрофонски';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (напредно)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough на кодеци';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Овозможете ги само форматите што ги поддржува вашиот AVR или HDMI приемник.';

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
      'Испраќај Dolby Digital Plus (EAC3) како битстрим до надворешен декодер.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Испраќај Dolby Atmos преку EAC3 (JOC) како битстрим до надворешен декодер.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Испраќај DTS-HD MA (го вклучува DTS core) како битстрим до надворешен декодер.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Испраќај Dolby TrueHD со Atmos метаподатоци како битстрим до надворешен декодер.';

  @override
  String get settingsDetectedAudioCapabilities => 'Откриени аудио можности';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Сè уште нема достапна снимка од можностите при извршување.';

  @override
  String get settingsAudioRouteLabel => 'Рута';

  @override
  String get settingsAudioDecodeLabel => 'Декодирање';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD аудио рута';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Звучник';

  @override
  String get settingsAudioRouteHeadphones => 'Слушалки';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Дијагностика';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Видео ниво';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Видео опсег';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Кодек на преводот';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Дозволени аудио кодеци';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS аудио кодеци';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 аудио кодеци';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Активна аудио рута';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Поддршка за HD аудио на рутата';

  @override
  String get nightMode => 'Ноќен режим';

  @override
  String get compressDynamicRange => 'Компресирајте го динамичкиот опсег';

  @override
  String get advancedMpv => 'Напредно mpv';

  @override
  String get enableCustomMpvConf => 'Овозможете Прилагодено mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Применете mpv.conf одредена од корисникот пред да започне репродукцијата';

  @override
  String get unsafeAdvancedMpvOptions => 'Небезбедни Напредни опции за mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дозволете поширок сет на опции за mpv. Може да го прекине однесувањето на репродукцијата.';

  @override
  String get hardwareDecoding => 'Хардверско декодирање';

  @override
  String get hardwareDecodingSubtitle =>
      'Може да ги подобри перформансите, но може да предизвика проблеми со репродукцијата на некои уреди.';

  @override
  String get nextUpAndQueuing => 'Следно и редици';

  @override
  String get nextUpDisplay => 'Следно нагоре приказ';

  @override
  String get extended => 'Проширено';

  @override
  String get minimal => 'Минимална';

  @override
  String get nextUpTimeout => 'Следен тајмут';

  @override
  String secondsValue(int value) {
    return '$valueс';
  }

  @override
  String get mediaQueuing => 'Медиумски редици';

  @override
  String get autoQueueNextEpisodes =>
      'Автоматски редицирај ги следните епизоди';

  @override
  String get stillWatchingPrompt => 'Сè уште го гледам промптот';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'По $episodes епизоди / $hoursч';
  }

  @override
  String get resumeAndSkip => 'Продолжи и прескокни';

  @override
  String get resumeRewind => 'Продолжи со премотување назад';

  @override
  String get unpauseRewind => 'Откажете го премотувањето назад';

  @override
  String get fiveSeconds => '5 секунди';

  @override
  String get tenSeconds => '10 секунди';

  @override
  String get fifteenSeconds => '15 секунди';

  @override
  String get thirtySeconds => '30 секунди';

  @override
  String get skipBackLength => 'Прескокнете ја должината на грбот';

  @override
  String get skipForwardLength => 'Прескокнете ја должината нанапред';

  @override
  String get customMpvConfPath => 'Прилагодена патека mpv.conf';

  @override
  String get notSetMpvConf =>
      'Не е поставено. Moonfin ќе проба стандардно mpv.conf во папките со апликации/податоци.';

  @override
  String get selectMpvConf => 'Изберете mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Поставките за стил (големина, боја, поместување) се применуваат на текстуални преводи (SRT, VTT, TTML). Преводите на ASS/SSA користат сопствен вграден стајлинг освен ако „ASS/SSA Direct Play“ не е исклучено. Битмап преводи (PGS, DVB, VobSub) не може да се рестилизираат.';

  @override
  String get defaultSubtitleLanguage => 'Стандарден јазик на преводи';

  @override
  String get defaultToNoSubtitles => 'Стандардно е без преводи';

  @override
  String get turnOffSubtitlesByDefault => 'Стандардно исклучете ги преводите';

  @override
  String get subtitleSize => 'Големина на титл';

  @override
  String get textFillColor => 'Боја за пополнување на текст';

  @override
  String get backgroundColor => 'Боја на позадината';

  @override
  String get textStrokeColor => 'Боја на текстуален удар';

  @override
  String get subtitleCustomization => 'Приспособување на титл';

  @override
  String get subtitleCustomizationDescription =>
      'Приспособете го изгледот на титлите';

  @override
  String get subtitleMode => 'Режим на преводите';

  @override
  String get subtitleModeFlagged => 'Означени';

  @override
  String get subtitleModeAlways => 'Секогаш';

  @override
  String get subtitleModeForeign => 'Странски';

  @override
  String get subtitleModeForced => 'Принудни';

  @override
  String get subtitleModeFlaggedDescription =>
      'Ги пушта записите означени во метаподатоците на медиумската датотека како „стандардни“ или „принудни“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Автоматски вчитува и прикажува преводи секогаш кога започнува видео.';

  @override
  String get subtitleModeForeignDescription =>
      'Автоматски ги вклучува преводите ако стандардниот аудио запис е на странски јазик.';

  @override
  String get subtitleModeForcedDescription =>
      'Вчитува само преводи што се експлицитно означени со принудното знаменце во метаподатоците.';

  @override
  String get subtitleModeNoneDescription =>
      'Целосно го оневозможува автоматското вчитување преводи.';

  @override
  String get fallbackSubtitleLanguage => 'Резервен јазик на преводите';

  @override
  String get subtitleStream => 'Стрим на преводите';

  @override
  String get subtitlePreviewText =>
      'Брзата кафена лисица го прескокнува мрзливото куче';

  @override
  String get verticalOffset => 'Вертикално поместување';

  @override
  String get pgsDirectPlay => 'PGS директно пуштање';

  @override
  String get directPlayPgsSubtitles => 'Директна репродукција на PGS преводи';

  @override
  String get assSsaDirectPlay => 'Директна игра ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Директна репродукција на ASS/SSA преводи';

  @override
  String get white => 'Бело';

  @override
  String get black => 'Црното';

  @override
  String get yellow => 'Жолта';

  @override
  String get green => 'Зелена';

  @override
  String get cyan => 'цијан';

  @override
  String get red => 'Црвено';

  @override
  String get transparent => 'Транспарентен';

  @override
  String get semiTransparentBlack => 'Полупроѕирна црна боја';

  @override
  String get global => 'Глобална';

  @override
  String get desktop => 'Десктоп';

  @override
  String get mobile => 'Мобилен';

  @override
  String get tv => 'ТВ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Вчитани се поставките за профилот $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Неуспешно вчитување на поставките за профилот $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Локалните поставки се синхронизирани со профилот $profile.';
  }

  @override
  String get customizationProfile => 'Профил за приспособување';

  @override
  String get customizationProfileDescription =>
      'Изберете го профилот за вчитување, уредување и синхронизација. Глобалното се применува насекаде, освен ако профилот на уредот не го замени. Зелената точка го означува вашиот тековен профил на уредот.';

  @override
  String get loadProfile => 'Вчитај профил';

  @override
  String get syncing => 'Се синхронизира...';

  @override
  String get syncToProfile => 'Синхронизирај со профилот';

  @override
  String get profileSyncHidden => 'Сокриена синхронизација на профилот';

  @override
  String get enablePluginSyncDescription =>
      'Овозможете Синхронизација на приклучокот за сервер во поставките за приклучоци за да се прикажат контролите на профилот овде.';

  @override
  String get quality => 'Квалитет';

  @override
  String get defaultDownloadQuality => 'Стандарден квалитет на преземање';

  @override
  String get network => 'Мрежа';

  @override
  String get wifiOnlyDownloads => 'Преземања само за WiFi';

  @override
  String get reportDownloadsActivity => 'Прикажи ги преземањата на серверот';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Дозволете му на администраторот на серверот да ги гледа вашите транскодирани преземања во таблата';

  @override
  String get onlyDownloadOnWifi => 'Преземете само кога сте поврзани на WiFi';

  @override
  String get storage => 'Складирање';

  @override
  String get storageUsed => 'Искористено складирање';

  @override
  String get manage => 'Управувај';

  @override
  String get calculating => 'Се пресметува...';

  @override
  String get downloadLocation => 'Локација за преземање';

  @override
  String get defaultLabel => 'Стандардно';

  @override
  String get saveToDownloadsFolder => 'Зачувајте во папката Преземања';

  @override
  String get downloadsVisibleToOtherApps =>
      'Преземања/Moonfin — видливи за други апликации';

  @override
  String get dangerZone => 'Опасна зона';

  @override
  String get clearAllDownloads => 'Исчистете ги сите преземања';

  @override
  String get original => 'Оригинален';

  @override
  String get changeDownloadLocation => 'Променете ја локацијата за преземање';

  @override
  String get changeDownloadLocationDescription =>
      'Новите преземања ќе се зачуваат во избраната папка. Постоечките преземања ќе останат на нивната моментална локација и може да се управуваат од поставките за складирање.';

  @override
  String get confirm => 'Потврди';

  @override
  String get cannotWriteToFolder =>
      'Не може да се запише во избраната папка. Изберете друга локација или доделете дозволи за складирање.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Да се ​​зачува во папката Преземања?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Преземените медиуми ќе се зачуваат во Downloads/Moonfin на вашиот уред. Овие датотеки ќе бидат видливи за други апликации како што се вашата галерија или музички плеер.\n\nПостојните преземања ќе останат на нивната моментална локација.';

  @override
  String get enable => 'Овозможи';

  @override
  String get clearAllDownloadsWarning =>
      'Ова ќе ги избрише сите преземени медиуми и не може да се врати.';

  @override
  String get clearAll => 'Исчисти ги сите';

  @override
  String get navigationStyle => 'Стил на навигација';

  @override
  String get topBar => 'Топ бар';

  @override
  String get leftSidebar => 'Лева странична лента';

  @override
  String get showShuffleButton => 'Прикажи копче за мешање';

  @override
  String get showGenresButton => 'Копче за прикажување жанрови';

  @override
  String get showFavoritesButton => 'Копче за прикажување омилени';

  @override
  String get showLibrariesInToolbar =>
      'Прикажи библиотеки во лентата со алатки';

  @override
  String get navbarAlwaysExpanded =>
      'Секогаш прошируј ги ознаките во навигацијата';

  @override
  String get showSeerrButton => 'Прикажи го копчето Seerr';

  @override
  String get navbarOpacity => 'Непроѕирност на навигација';

  @override
  String get navbarColor => 'Боја на лентата за навигација';

  @override
  String get gray => 'Греј';

  @override
  String get darkBlue => 'Темно сина';

  @override
  String get purple => 'Виолетова';

  @override
  String get teal => 'ТЕАЛ';

  @override
  String get navy => 'Морнарица';

  @override
  String get charcoal => 'Јаглен';

  @override
  String get brown => 'Браун';

  @override
  String get darkRed => 'Темно црвено';

  @override
  String get darkGreen => 'Темно зелена';

  @override
  String get slate => 'Шкрилец';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Приказ на библиотека';

  @override
  String get posterLabel => 'Постер';

  @override
  String get thumbnailLabel => 'Сликичка';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get overridePerLibrarySettings => 'Отфрли ги поставките за библиотека';

  @override
  String get applyImageTypeToAllLibraries =>
      'Применете го типот на слика на сите библиотеки';

  @override
  String get multiServerLibraries => 'Библиотеки со повеќе сервери';

  @override
  String get showLibrariesFromAllServers =>
      'Прикажи библиотеки од сите поврзани сервери';

  @override
  String get enableFolderView => 'Овозможи Преглед на папка';

  @override
  String get showFolderBrowsingOption =>
      'Прикажи ја опцијата за прелистување папки';

  @override
  String get groupItemsIntoCollections => 'Групирај ги ставките во колекции';

  @override
  String get hideCollectionAssociatedItems =>
      'Скриј ги ставките поврзани со колекција при прегледување на библиотеките';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Известување за групирање на библиотеката';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'За да ја користите оваа поставка, проверете дали поставките на библиотеката „Групирај ги филмовите во колекции“ и/или „Групирај ги сериите во колекции“ се овозможени во поставките за приказ на вашата библиотека на вашиот Jellyfin или Emby сервер.';

  @override
  String get libraryVisibility => 'Видливост на библиотеката';

  @override
  String get libraryVisibilityDescription =>
      'Вклучете ја видливоста на почетната страница по библиотека. Рестартирајте го Moonfin за да стапат на сила промените.';

  @override
  String get showInNavigation => 'Прикажи во навигацијата';

  @override
  String get showInLatestMedia => 'Прикажи во најновите медиуми';

  @override
  String get sourceLibraries => 'Изворни библиотеки';

  @override
  String get sourceCollections => 'Изворни колекции';

  @override
  String get excludedGenres => 'Исклучени жанрови';

  @override
  String get selectAll => 'Изберете Сите';

  @override
  String itemsSelected(int count) {
    return '$count избрани';
  }

  @override
  String get mediaBar => 'Медиумска лента';

  @override
  String get mediaSources => 'Извори на медиумите';

  @override
  String get behavior => 'Однесување';

  @override
  String get seconds => 'секунди';

  @override
  String get localPreviews => 'Локални прегледи';

  @override
  String get localPreviewsDescription =>
      'Конфигурирајте ги приколките, медиумите и аудио прегледите.';

  @override
  String get mediaBarMode => 'Стил на медиумска лента';

  @override
  String get mediaBarModeDescription =>
      'Изберете помеѓу различни стилови на медиумска лента или исклучете ја медиумската лента';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Исклучено';

  @override
  String get enableMediaBar => 'Овозможи медиумска лента';

  @override
  String get showFeaturedContentSlideshow =>
      'Прикажи слајдшоу на истакната содржина дома';

  @override
  String get contentType => 'Тип на содржина';

  @override
  String get moviesAndTvShows => 'Филмови и ТВ серии';

  @override
  String get moviesOnly => 'Само филмови';

  @override
  String get tvShowsOnly => 'Само ТВ емисии';

  @override
  String get itemCount => 'Број на ставки';

  @override
  String get noneSelected => 'Никој не е избран';

  @override
  String get noneExcluded => 'Никој исклучен';

  @override
  String get autoAdvance => 'Автоматско напредување';

  @override
  String get autoAdvanceSlides => 'Автоматски преминете на следниот слајд';

  @override
  String get autoAdvanceInterval => 'Интервал за автоматско напредување';

  @override
  String get trailerPreview => 'Преглед на трејлер';

  @override
  String get autoPlayTrailers =>
      'Автоматска репродукција на трејлери во лентата за медиуми по 3 секунди';

  @override
  String get trailerAudio => 'Аудио на трејлерите';

  @override
  String get enableTrailerAudio =>
      'Овозможи аудио за трејлерите во медиумската лента';

  @override
  String get episodePreview => 'Преглед на епизода';

  @override
  String get mediaPreview => 'Преглед на медиуми';

  @override
  String get episodePreviewDescription =>
      'Пуштете 30 секунди внатрешен преглед на фокусирани, лебдечки или долго притиснати картички';

  @override
  String get mediaPreviewDescription =>
      'Пуштете 30 секунди внатрешен преглед на фокусирани, лебдечки или долго притиснати картички';

  @override
  String get previewAudio => 'Преглед на аудио';

  @override
  String get enablePreviewAudio =>
      'Овозможете аудио за преглед на трејлери и епизоди';

  @override
  String get latestMedia => 'Најнови медиуми';

  @override
  String get recentlyReleased => 'Неодамна објавени';

  @override
  String get myMedia => 'Мои медиуми';

  @override
  String get myMediaSmall => 'Мои медиуми (мали)';

  @override
  String get continueWatching => 'Продолжи со гледање';

  @override
  String get resumeAudio => 'Продолжи со аудио';

  @override
  String get resumeBooks => 'Книги за биографија';

  @override
  String get activeRecordings => 'Активни снимки';

  @override
  String get playlists => 'Плејлисти';

  @override
  String get liveTV => 'ТВ во живо';

  @override
  String get homeSections => 'Домашни секции';

  @override
  String get resetToDefaults => 'Ресетирање на стандардните';

  @override
  String get homeRowPosterSize => 'Големина на постер за домашен ред';

  @override
  String get perRowImageTypeSelection => 'Избор на тип на слика по ред';

  @override
  String get configureImageTypeForEachRow =>
      'Конфигурирајте го типот на слика за секој овозможен почетен ред';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Спојте Продолжи со гледање и Следно';

  @override
  String get combineBothRows =>
      'Комбинирајте ги двата реда во еден домашен дел';

  @override
  String get fullScreenRows => 'Проширени почетни редови';

  @override
  String get fullScreenRowsDescription =>
      'Ограничи ги почетните редови на 1 ред по екран';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Тип на слика по ред';

  @override
  String get perRowSettings => 'Поставки по ред';

  @override
  String get autoLogin => 'Автоматско најавување';

  @override
  String get lastUser => 'Последен корисник';

  @override
  String get currentUser => 'Тековен корисник';

  @override
  String get alwaysAuthenticate => 'Секогаш автентицирај';

  @override
  String get requirePasswordWithToken =>
      'Барајте лозинка дури и со зачуван токен';

  @override
  String get confirmExit => 'Потврдете Излез';

  @override
  String get showConfirmationBeforeExiting =>
      'Покажете потврда пред да излезете';

  @override
  String get blockContentWithRatings =>
      'Блокирајте содржини со следните оценки:';

  @override
  String get noContentRatingsFound =>
      'Сè уште не се пронајдени оценки за содржина на овој сервер.';

  @override
  String get couldNotLoadServerRatings =>
      'Не може да се вчитаат оцените на серверот. Се прикажуваат само зачуваните оценки.';

  @override
  String get couldNotRefreshRatings =>
      'Не може да се освежат оценките од серверот. Се прикажуваат зачуваните оценки.';

  @override
  String get enablePinCode => 'Овозможи PIN код';

  @override
  String get requirePinToAccess => 'Потребен е PIN за пристап до вашата сметка';

  @override
  String get changePin => 'Променете го PIN-от';

  @override
  String get setNewPinCode => 'Поставете нов ПИН-код';

  @override
  String get removePin => 'Отстранете го PIN-кодот';

  @override
  String get removePinProtection => 'Отстранете ја заштитата со PIN кодот';

  @override
  String get screensaver => 'Заштитник на екранот';

  @override
  String get inAppScreensaver => 'Заштитник на екран во апликација';

  @override
  String get enableBuiltInScreensaver =>
      'Овозможете го вградениот заштитник на екранот';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Библиотечна уметност';

  @override
  String get logo => 'Лого';

  @override
  String get clock => 'Часовник';

  @override
  String get timeout => 'Тајмаут';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Ниво на затемнување';

  @override
  String get maxAgeRating => 'Максимална возрасна оценка';

  @override
  String get any => 'Било кој';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Потребна оцена за возраста';

  @override
  String get onlyShowRatedContent => 'Прикажи само оценети содржини';

  @override
  String get showClock => 'Прикажи часовник';

  @override
  String get displayClockDuringScreensaver =>
      'Приказ на часовникот за време на заштитниот екран';

  @override
  String get clockModeStatic => 'Статичен';

  @override
  String get clockModeBouncing => 'Отскокнувачки';

  @override
  String get rottenTomatoesCritics => 'Расипани домати (критичари)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (публика)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритик';

  @override
  String get metacriticUser => 'Метакритик (корисник)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Кутија со писмо';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Оценка на заедницата';

  @override
  String get ratings => 'Оценки';

  @override
  String get additionalRatings => 'Дополнителни оценки';

  @override
  String get showMdbListAndTmdbRatings => 'Прикажи оцени од MDBList и TMDB';

  @override
  String get ratingLabels => 'Рејтинг етикети';

  @override
  String get showLabelsNextToIcons => 'Прикажи етикети до иконите за оценување';

  @override
  String get ratingBadges => 'Значки за рејтинг';

  @override
  String get showDecorativeBadges => 'Прикажи украсни значки зад оценките';

  @override
  String get episodeRatings => 'Оценки за епизоди';

  @override
  String get showRatingsOnEpisodes => 'Прикажи оценки за поединечни епизоди';

  @override
  String get ratingSources => 'Извори за рејтинг';

  @override
  String get ratingSourcesDescription =>
      'Овозможете ги и преуредите ги изворите за оценување прикажани низ апликацијата';

  @override
  String get pluginLabel => 'Приклучок Moonbase';

  @override
  String get pluginDetected => 'Откриен е приклучокот';

  @override
  String get pluginNotDetected => 'Приклучокот не е откриен';

  @override
  String get pluginDetectedDescription =>
      'Откриен е приклучокот за сервер. Синхронизацијата е овозможена автоматски првиот пат кога ќе се најде приклучокот.';

  @override
  String get pluginNotDetectedDescription =>
      'Приклучокот за серверот во моментов не е откриен. Локалните поставки сè уште ги користат нивните зачувани вредности или вградените стандардни поставки.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nВерзија: $version';
  }

  @override
  String get availableServices => 'Достапни услуги';

  @override
  String get serverPluginSync => 'Синхронизација на приклучокот за сервер';

  @override
  String get syncSettingsWithPlugin =>
      'Синхронизирајте ги поставките со приклучокот за серверот';

  @override
  String get whatSyncControls => 'Што контролира синхронизацијата';

  @override
  String get syncControlsDescription =>
      '„Синхронизацијата“ контролира само дали поставките поддржани од приклучоци се туркаат и се повлекуваат од серверот. Изборот на профилот и дејствата за синхронизација на профилот се во поставките за приспособување кога е овозможена синхронизацијата на приклучокот.';

  @override
  String get recentRequests => 'Неодамнешни барања';

  @override
  String get recentlyAdded => 'Неодамна додадено';

  @override
  String get trending => 'Во тренд';

  @override
  String get popularMovies => 'Популарни филмови';

  @override
  String get movieGenres => 'Филмски жанрови';

  @override
  String get upcomingMovies => 'Претстојни филмови';

  @override
  String get studios => 'Студија';

  @override
  String get popularSeries => 'Популарни серии';

  @override
  String get seriesGenres => 'Жанрови на серии';

  @override
  String get upcomingSeries => 'Претстојната серија';

  @override
  String get networks => 'Мрежи';

  @override
  String get seerrDiscoveryRows => 'Редови за откривање во Seerr';

  @override
  String get resetRowsToDefaults => 'Ресетирајте ги редовите на стандардни';

  @override
  String get enableSeerr => 'Овозможи Seerr';

  @override
  String get showSeerrInNavigation =>
      'Прикажи Seerr во навигацијата (потребен е приклучок за сервер)';

  @override
  String get seerrUnavailable =>
      'Недостапно затоа што поддршката за Seerr приклучокот за серверот е оневозможена.';

  @override
  String get nsfwFilter => 'NSFW филтер';

  @override
  String get hideAdultContent => 'Сокријте содржини за возрасни во резултатите';

  @override
  String get seerrNotificationsSection => 'Известувања';

  @override
  String get seerrNotifyNewRequestsTitle => 'Известувања за нови барања';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Извести ме кога некој ќе поднесе барање';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Ажурирања на барањата';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Одобрени, одбиени и додадени во вашата библиотека';

  @override
  String get seerrNotifyIssuesTitle => 'Ажурирања на проблемите';

  @override
  String get seerrNotifyIssuesSubtitle => 'Нови проблеми, одговори и решенија';

  @override
  String loggedInAs(String username) {
    return 'Најавен како: $username';
  }

  @override
  String get discoverRows => 'Страница за откривање во Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Овозможете ги редовите што сакате да ги гледате на главната страница на Seerr. Влечете за да ги преуредите. Прилагодениот редослед се синхронизира со Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Овозможете ги редовите што сакате да ги гледате на главната страница на Seerr. Влечете за да ги преуредите. Прилагодениот редослед се синхронизира со Moonbase.';

  @override
  String get enabled => 'Овозможено';

  @override
  String get hidden => 'Скриени';

  @override
  String get aboutTitle => 'За';

  @override
  String versionValue(String version) {
    return 'Верзија $version';
  }

  @override
  String get openSourceLicenses => 'Лиценци со отворен код';

  @override
  String get sourceCode => 'Изворниот код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Проверете дали има ажурирања сега';

  @override
  String get checksLatestDesktopRelease =>
      'Го проверува најновото издание на работната површина за оваа платформа';

  @override
  String get youAreUpToDate => 'Во тек сте.';

  @override
  String get couldNotCheckForUpdates =>
      'Не може да се провери дали има ажурирања во моментов.';

  @override
  String get noCompatibleUpdate =>
      'Не е пронајден компатибилен пакет за ажурирање за оваа платформа.';

  @override
  String get updateChecksNotSupported =>
      'Проверките за ажурирање не се поддржани на оваа платформа.';

  @override
  String get updateNotificationsDisabled =>
      'Известувањата за ажурирање се оневозможени.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Ве молиме почекајте пред повторно да проверите.';

  @override
  String get latestUpdateAlreadyShown =>
      'Последното ажурирање веќе беше прикажано.';

  @override
  String get updateAvailable => 'Достапно е ажурирање.';

  @override
  String updateAvailableVersion(String version) {
    return 'Достапно ажурирање: v$version';
  }

  @override
  String get updateNotifications => 'Ажурирајте ги известувањата';

  @override
  String get showWhenUpdatesAvailable => 'Прикажи кога ажурирањата се достапни';

  @override
  String updateAvailableTitle(String version) {
    return 'Достапна е v$version';
  }

  @override
  String get readReleaseNotes => 'Прочитајте ги Белешките за издавање';

  @override
  String get downloadingUpdate => 'Се презема ажурирањето...';

  @override
  String get updateDownloadFailed =>
      'Преземањето на ажурирањето не успеа. Ве молиме обидете се повторно.';

  @override
  String get openReleasesPage => 'Отворете ја страницата со изданија';

  @override
  String get navigation => 'Навигација';

  @override
  String get watchedIndicatorsBackdrops => 'Гледани индикатори, заднини';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Боја на фокусирање, гледани индикатори, заднини';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стил на лента, копчиња на лентата со алатки, изглед';

  @override
  String get reorderToggleHomeRows =>
      'Повторно нарачајте и префрлете ги почетните редови';

  @override
  String get featuredContentAppearance => 'Избрана содржина, изглед';

  @override
  String get posterSizeImageTypeFolderView =>
      'Големина на постер, тип на слика, приказ на папка';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB и извори на оцени';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Лимит на кешот за слики';

  @override
  String get clearImageCache => 'Исчисти го кешот за слики';

  @override
  String get imageCacheCleared => 'Кешот за слики е исчистен';

  @override
  String get clear => 'Исчисти';

  @override
  String get browse => 'Прелистајте';

  @override
  String get noResults => 'Нема резултати';

  @override
  String get seerrAvailableStatus => 'Достапно';

  @override
  String get seerrRequestedStatus => 'Побарана';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Се презема · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Се увезува';

  @override
  String itemsCount(int count) {
    return '$count Ставки';
  }

  @override
  String get seerrSettings => 'Поставки за Seerr';

  @override
  String get requestMore => 'Побарајте повеќе';

  @override
  String get request => 'Барање';

  @override
  String get cancelRequest => 'Откажете го барањето';

  @override
  String get playInMoonfin => 'Играјте во Moonfin';

  @override
  String requestedByName(String name) {
    return 'Побарано од $name';
  }

  @override
  String get approve => 'Одобри';

  @override
  String get declineAction => 'Одбивање';

  @override
  String get similar => 'Слично';

  @override
  String get recommendations => 'Препораки';

  @override
  String cancelRequestForTitle(String title) {
    return 'Да се откаже барањето за „$title“?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Да се откажат $count барања за „$title“?';
  }

  @override
  String get keep => 'Задржи';

  @override
  String get itemNotFoundInLibrary =>
      'Ставката не е пронајдена во вашата библиотека Moonfin';

  @override
  String get errorSearchingLibrary => 'Грешка при пребарување на библиотеката';

  @override
  String budgetAmount(String amount) {
    return 'Буџет: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Приход: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Побарај $type';
  }

  @override
  String get submitRequest => 'Поднесете барање';

  @override
  String get allSeasons => 'Сите годишни времиња';

  @override
  String get advancedOptions => 'Напредни опции';

  @override
  String get noServiceServersConfigured =>
      'Не се конфигурирани сервери за услуги';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Профил за квалитет';

  @override
  String get rootFolder => 'Коренска папка';

  @override
  String get showMore => 'Прикажи повеќе';

  @override
  String get appearances => 'Појавувања';

  @override
  String get crewSection => 'Екипаж';

  @override
  String ageValue(int age) {
    return 'возраст $age';
  }

  @override
  String get noRequests => 'Нема барања';

  @override
  String get pendingStatus => 'Во очекување';

  @override
  String get declinedStatus => 'Одбиено';

  @override
  String get partiallyAvailable => 'Делумно достапно';

  @override
  String get downloadingStatus => 'Преземање';

  @override
  String get approvedStatus => 'Одобрено';

  @override
  String get notRequestedStatus => 'Не е побарано';

  @override
  String get blocklistedStatus => 'Наведени на блокови';

  @override
  String get deletedStatus => 'Избришано';

  @override
  String get failedStatus => 'Неуспешно';

  @override
  String get processingStatus => 'Се обработува';

  @override
  String modifiedByName(String name) {
    return 'Изменето од $name';
  }

  @override
  String get completedStatus => 'Завршено';

  @override
  String get requestErrorDuplicate => 'Овој наслов е веќе побаран';

  @override
  String get requestErrorQuota => 'Достигнат е лимитот на барања';

  @override
  String get requestErrorBlocklisted =>
      'Овој наслов е на списокот на блокирани';

  @override
  String get requestErrorNoSeasons => 'Не останаа сезони за барање';

  @override
  String get requestErrorPermission =>
      'Немате дозвола да го поднесете ова барање';

  @override
  String get seerrRequestsTitle => 'Барања';

  @override
  String get seerrIssuesTitle => 'Проблеми';

  @override
  String get sortNewest => 'Најнови';

  @override
  String get sortLastModified => 'Последно изменети';

  @override
  String get noIssues => 'Нема проблеми';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Преостанати $remaining од $limit барања за филмови';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Преостанати $remaining од $limit барања за сезони';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Дел од $name';
  }

  @override
  String get viewCollection => 'Прикажи ја колекцијата';

  @override
  String get requestCollection => 'Побарај ја колекцијата';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total филмови · $available достапни';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Побарај $count филмови';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Се бара $current од $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Побарани се $count филмови';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Побарани се $ok од $total филмови';
  }

  @override
  String get collectionAllRequested =>
      'Сите филмови се веќе достапни или побарани';

  @override
  String get reportIssue => 'Пријави проблем';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Аудио';

  @override
  String get whatsWrong => 'Што е проблемот?';

  @override
  String get allEpisodes => 'Сите епизоди';

  @override
  String get episode => 'Епизода';

  @override
  String get openStatus => 'Отворено';

  @override
  String get resolvedStatus => 'Решен';

  @override
  String get resolveAction => 'Реши';

  @override
  String get reopenAction => 'Отвори повторно';

  @override
  String reportedByName(String name) {
    return 'Пријавено од $name';
  }

  @override
  String commentsCount(int count) {
    return '$count коментари';
  }

  @override
  String get addComment => 'Додадете коментар';

  @override
  String get deleteIssueConfirm => 'Да се избрише овој проблем?';

  @override
  String get submitReport => 'Испрати извештај';

  @override
  String get tmdbScore => 'Резултат на TMDB';

  @override
  String get releaseDateLabel => 'Датум на издавање';

  @override
  String get firstAirDateLabel => 'Датум на првиот воздух';

  @override
  String get revenueLabel => 'Приходи';

  @override
  String get runtimeLabel => 'Време на траење';

  @override
  String get budgetLabel => 'Буџет';

  @override
  String get originalLanguageLabel => 'Оригинален јазик';

  @override
  String get seasonsLabel => 'Сезони';

  @override
  String get episodesLabel => 'Епизоди';

  @override
  String get access => 'Пристап';

  @override
  String get add => 'Додај';

  @override
  String get address => 'Адреса';

  @override
  String get analytics => 'Анализа';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Содржина';

  @override
  String get copy => 'Копирај';

  @override
  String get create => 'Креирај';

  @override
  String get disable => 'Оневозможи';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Уреди';

  @override
  String get encoding => 'Кодирање';

  @override
  String get error => 'Грешка';

  @override
  String get forward => 'Напред';

  @override
  String get general => 'Општо';

  @override
  String get go => 'Оди';

  @override
  String get install => 'Инсталирајте';

  @override
  String get installed => 'Инсталиран';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Име';

  @override
  String get networking => 'Вмрежување';

  @override
  String get next => 'Следно';

  @override
  String get path => 'Пат';

  @override
  String get paused => 'Паузирано';

  @override
  String get permissions => 'Дозволи';

  @override
  String get processing => 'Обработка';

  @override
  String get profile => 'Профил';

  @override
  String get provider => 'Провајдер';

  @override
  String get refresh => 'Освежи';

  @override
  String get remote => 'Далечински управувач';

  @override
  String get rename => 'Преименувај';

  @override
  String get revoke => 'Отповикување';

  @override
  String get role => 'Улога';

  @override
  String get root => 'Корен';

  @override
  String get run => 'Трчај';

  @override
  String get search => 'Пребарување';

  @override
  String get select => 'Изберете';

  @override
  String get send => 'Испрати';

  @override
  String get sessions => 'Сесии';

  @override
  String get set => 'Поставете';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Стоп';

  @override
  String get streaming => 'Стриминг';

  @override
  String get time => 'Време';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Деинсталирајте';

  @override
  String get up => 'Горе';

  @override
  String get update => 'Ажурирање';

  @override
  String get upload => 'Поставете';

  @override
  String get unmute => 'Вклучи звук';

  @override
  String get mute => 'Исклучи звук';

  @override
  String get branding => 'Брендирање';

  @override
  String get adminDrawerDashboard => 'Контролна табла';

  @override
  String get adminDrawerAnalytics => 'Анализа';

  @override
  String get adminDrawerSettings => 'Поставки';

  @override
  String get adminDrawerBranding => 'Брендирање';

  @override
  String get adminDrawerUsers => 'Корисници';

  @override
  String get adminDrawerLibraries => 'Библиотеки';

  @override
  String get adminDrawerDisplay => 'Приказ';

  @override
  String get adminDrawerMetadata => 'Метаподатоци';

  @override
  String get adminDrawerNfo => 'NFO поставки';

  @override
  String get adminDrawerTranscoding => 'Транскодирање';

  @override
  String get adminDrawerResume => 'Продолжи';

  @override
  String get adminDrawerStreaming => 'Стриминг';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Уреди';

  @override
  String get adminDrawerActivity => 'Активност';

  @override
  String get adminDrawerNetworking => 'Вмрежување';

  @override
  String get adminDrawerApiKeys => 'API клучеви';

  @override
  String get adminDrawerBackups => 'Резервни копии';

  @override
  String get adminDrawerLogs => 'Дневници';

  @override
  String get adminDrawerScheduledTasks => 'Закажани задачи';

  @override
  String get adminDrawerPlugins => 'Приклучоци';

  @override
  String get adminDrawerRepositories => 'Репозиториуми';

  @override
  String get adminDrawerLiveTv => 'ТВ во живо';

  @override
  String get adminExitTooltip => 'Излезете од администраторот';

  @override
  String get adminDashboardLoadFailed =>
      'Не успеа да се вчита контролната табла';

  @override
  String get adminMediaOverview => 'Преглед на медиуми';

  @override
  String get adminMediaTotalsError =>
      'Не може да се вчитаат збирките на медиумите на серверот.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Брзо читање за тоа колку содржина има на овој сервер.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Достапни ажурирања за приклучоци: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Приклучоци што бараат рестартирање: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Неуспешни закажани задачи: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Скорешни записи со предупредување/грешка: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Медиумска дистрибуција';

  @override
  String get analyticsVideoCodecs => 'Видео кодеци';

  @override
  String get analyticsAudioCodecs => 'Аудио кодеци';

  @override
  String get analyticsContainers => 'Контејнери';

  @override
  String get analyticsTopGenres => 'Врвни жанрови';

  @override
  String get analyticsReleaseYears => 'Години на издавање';

  @override
  String get analyticsContentRatings => 'Оценки за содржина';

  @override
  String get analyticsRuntimeBuckets => 'Кофи за траење';

  @override
  String get analyticsFileFormats => 'Формати на датотеки';

  @override
  String get analyticsNoData => 'Нема достапни податоци.';

  @override
  String get adminServerInfo => 'Информации за серверот';

  @override
  String get adminRestartPending => 'Рестартирај Во очекување';

  @override
  String get adminServerPaths => 'Серверски патеки';

  @override
  String get adminServerActions => 'Дејства на серверот';

  @override
  String get adminRestartServer => 'Рестартирајте го серверот';

  @override
  String get adminShutdownServer => 'Сервер за исклучување';

  @override
  String get adminScanLibraries => 'Скенирајте библиотеки';

  @override
  String get adminLibraryScanStarted => 'Скенирањето на библиотеката започна';

  @override
  String errorGeneric(String error) {
    return 'Грешка: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Во тек е рестартирање на серверот';

  @override
  String get adminServerRebootMessage =>
      'Рестартирањето на серверот е во тек, рестартирајте го Moonfin';

  @override
  String get adminActiveSessions => 'Активни сесии';

  @override
  String get adminSessionsLoadFailed => 'Не успеа да се вчитаат сесиите';

  @override
  String get adminNoActiveSessions => 'Нема активни сесии';

  @override
  String get adminRecentActivity => 'Неодамнешна активност';

  @override
  String get adminNoRecentActivity => 'Нема неодамнешна активност';

  @override
  String adminCommandFailed(String error) {
    return 'Командата не успеа: $error';
  }

  @override
  String get adminSendMessage => 'Испрати порака';

  @override
  String get adminMessageTextHint => 'Текст на пораката';

  @override
  String get adminSetVolume => 'Поставете ја јачината на звукот';

  @override
  String get sessionPrev => 'Прет';

  @override
  String get sessionRewind => 'Премотајте назад';

  @override
  String get sessionForward => 'Напред';

  @override
  String get sessionNext => 'Следно';

  @override
  String get sessionVolumeDown => 'Том -';

  @override
  String get sessionVolumeUp => 'Вол +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Сега се игра';

  @override
  String get volume => 'Јачина на звук';

  @override
  String get actions => 'Акции';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'Хард. забрзување';

  @override
  String get completion => 'Завршување';

  @override
  String get direct => 'Директно';

  @override
  String get adminDisconnect => 'Исклучете се';

  @override
  String get adminClearDates => 'Јасни датуми';

  @override
  String get adminActivitySeverityAll => 'Сите нивоа';

  @override
  String get adminActivityDateRange => 'Временски опсег';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Неуспешно вчитување на дневникот на активности: $error';
  }

  @override
  String get adminNoActivityEntries => 'Нема записи за активност';

  @override
  String get adminEditDeviceName => 'Уредете го името на уредот';

  @override
  String get adminCustomName => 'Прилагодено име';

  @override
  String get adminDeviceNameUpdated => 'Името на уредот е ажурирано';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Неуспешно ажурирање на уредот: $error';
  }

  @override
  String get adminDeleteDevice => 'Избриши Уред';

  @override
  String get adminDeviceDeleted => 'Уредот е избришан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Неуспешно бришење на уредот: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Да се отстрани уредот „$name“? Корисникот ќе треба повторно да се најави на овој уред.';
  }

  @override
  String get adminDeleteAllDevices => 'Избриши ги сите уреди';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Да се отстранат $count уреди? Засегнатите корисници ќе треба повторно да се најават. Вашиот тековен уред не е засегнат.';
  }

  @override
  String get adminDevicesDeletedAll => 'Уредите се отстранети';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Некои уреди се отстранети; $count не можеа да се отстранат.';
  }

  @override
  String get adminDevicesLoadFailed => 'Не успеа да се вчитаат уредите';

  @override
  String get adminSearchDevices => 'Уреди за пребарување';

  @override
  String get adminThisDevice => 'Овој уред';

  @override
  String get adminEditName => 'Уреди име';

  @override
  String get adminLibrariesLoadFailed => 'Не успеа да се вчитаат библиотеките';

  @override
  String get adminNoLibraries => 'Нема конфигурирани библиотеки';

  @override
  String get adminScanAllLibraries => 'Скенирајте ги сите библиотеки';

  @override
  String get adminAddLibrary => 'Додадете библиотека';

  @override
  String adminScanFailed(String error) {
    return 'Неуспешно започнување на скенирањето: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименувај библиотека';

  @override
  String get adminNewName => 'Ново име';

  @override
  String adminLibraryRenamed(String name) {
    return 'Библиотеката е преименувана во „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Неуспешно преименување: $error';
  }

  @override
  String get adminDeleteLibrary => 'Избришете ја библиотеката';

  @override
  String adminLibraryDeleted(String name) {
    return 'Библиотеката „$name“ е избришана';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Неуспешно бришење на библиотеката: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Неуспешно додавање на патеката: $error';
  }

  @override
  String get adminRemovePath => 'Отстранете ја патеката';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Да се отстрани „$path“ од оваа библиотека?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Неуспешно отстранување на патеката: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Опциите на библиотеката се зачувани';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Неуспешно зачувување на опциите: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Не успеа да се вчита библиотеката';

  @override
  String get adminNoMediaPaths => 'Нема конфигурирани медиумски патеки';

  @override
  String get adminAddPath => 'Додадете патека';

  @override
  String get adminBrowseFilesystem =>
      'Прелистајте го датотечен систем на серверот:';

  @override
  String get adminSaveOptions => 'Зачувај опции';

  @override
  String get adminPreferredMetadataLanguage =>
      'Префериран јазик на метаподатоци';

  @override
  String get adminMetadataLanguageHint => 'на пр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Код на земјата на метаподатоци';

  @override
  String get adminMetadataCountryHint => 'на пр. САД, ДЕ, ФР';

  @override
  String get adminLibraryTabPaths => 'Патеки';

  @override
  String get adminLibraryTabOptions => 'Опции';

  @override
  String get adminLibraryTabDownloaders => 'Преземачи';

  @override
  String get adminLibMetadataSavers => 'Зачувувачи на метаподатоци';

  @override
  String get adminLibSubtitleDownloaders => 'Преземачи на преводи';

  @override
  String get adminLibLyricDownloaders => 'Преземачи на текстови';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Преземачи на метаподатоци: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Добавувачи на слики: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Овој сервер не нуди преземачи за овој тип библиотека.';

  @override
  String get adminLibrarySectionGeneral => 'Општо';

  @override
  String get adminLibrarySectionMetadata => 'Метаподатоци';

  @override
  String get adminLibrarySectionEmbedded => 'Вградени информации';

  @override
  String get adminLibrarySectionSubtitles => 'Преводи';

  @override
  String get adminLibrarySectionImages => 'Слики';

  @override
  String get adminLibrarySectionSeries => 'Серии';

  @override
  String get adminLibrarySectionMusic => 'Музика';

  @override
  String get adminLibrarySectionMovies => 'Филмови';

  @override
  String get adminLibRealtimeMonitor => 'Овозможи следење во реално време';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Откривај промени во датотеките и обработувај ги автоматски.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Третирај ги архивите како медиумски датотеки';

  @override
  String get adminLibEnablePhotos => 'Прикажувај фотографии';

  @override
  String get adminLibSaveLocalMetadata =>
      'Зачувувај ги сликите во медиумските папки';

  @override
  String get adminLibRefreshInterval =>
      'Автоматско освежување на метаподатоците';

  @override
  String get adminLibRefreshNever => 'Никогаш';

  @override
  String get adminLibDefault => 'Стандардно';

  @override
  String get adminLibDisplayTitle => 'Приказ';

  @override
  String get adminLibDisplaySection => 'Приказ на библиотеката';

  @override
  String get adminLibFolderView =>
      'Прикажувај приказ со папки за обичните медиумски папки';

  @override
  String get adminLibSpecialsInSeasons =>
      'Прикажувај ги специјалните епизоди во сезоните во кои се емитувани';

  @override
  String get adminLibGroupMovies => 'Групирај ги филмовите во колекции';

  @override
  String get adminLibGroupShows => 'Групирај ги сериите во колекции';

  @override
  String get adminLibExternalSuggestions =>
      'Прикажувај надворешна содржина во предлозите';

  @override
  String get adminLibDateAddedSection => 'Однесување на датумот на додавање';

  @override
  String get adminLibDateAddedLabel => 'Користи датум на додавање од';

  @override
  String get adminLibDateAddedImport => 'Датумот на скенирање во библиотеката';

  @override
  String get adminLibDateAddedFile => 'Датумот на создавање на датотеката';

  @override
  String get adminLibMetadataTitle => 'Метаподатоци и слики';

  @override
  String get adminLibMetadataLangSection =>
      'Претпочитан јазик на метаподатоците';

  @override
  String get adminLibChaptersSection => 'Поглавја';

  @override
  String get adminLibDummyChapterDuration =>
      'Времетраење на фиктивните поглавја (секунди)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Должина на поглавјата генерирани за медиуми што немаат такви. Поставете 0 за оневозможување.';

  @override
  String get adminLibChapterImageResolution =>
      'Резолуција на сликите за поглавјата';

  @override
  String get adminLibNfoTitle => 'NFO поставки';

  @override
  String get adminLibNfoHelp =>
      'NFO метаподатоците се компатибилни со Kodi и слични клиенти. Поставките важат за сите библиотеки што зачувуваат NFO метаподатоци.';

  @override
  String get adminLibKodiUser =>
      'Корисник за кого се зачувуваат податоците за гледање во NFO датотеките';

  @override
  String get adminLibSaveImagePaths =>
      'Зачувувај ги патеките на сликите во NFO датотеките';

  @override
  String get adminLibPathSubstitution =>
      'Овозможи замена на патеките за сликите во NFO датотеките';

  @override
  String get adminLibExtraThumbs =>
      'Копирај ги extrafanart сликите во папка extrathumbs';

  @override
  String get adminLibNone => 'Нема';

  @override
  String adminLibRefreshDays(int days) {
    return '$days дена';
  }

  @override
  String get adminLibEmbeddedTitles => 'Користи ги вградените наслови';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Користи ги вградените наслови за додатоците';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Користи ги вградените информации за епизодите';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Дозволи вградени преводи';

  @override
  String get adminLibEmbeddedAllowAll => 'Сите';

  @override
  String get adminLibEmbeddedAllowText => 'Само текст';

  @override
  String get adminLibEmbeddedAllowImage => 'Само слики';

  @override
  String get adminLibEmbeddedAllowNone => 'Нема';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Прескокни го преземањето ако постојат вградени преводи';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Прескокни го преземањето ако аудио записот се совпаѓа со јазикот за преземање';

  @override
  String get adminLibRequirePerfectMatch =>
      'Барај совршено совпаѓање на преводот';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Зачувувај ги преводите во медиумските папки';

  @override
  String get adminLibChapterImageExtraction => 'Извлекувај слики за поглавјата';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Извлекувај ги сликите за поглавјата при скенирањето на библиотеката';

  @override
  String get adminLibTrickplayExtraction =>
      'Овозможи извлекување на Trickplay слики';

  @override
  String get adminLibTrickplayDuringScan =>
      'Извлекувај ги Trickplay сликите при скенирањето на библиотеката';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Зачувувај ги Trickplay сликите во медиумските папки';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Автоматски спојувај серии што се распространети во повеќе папки';

  @override
  String get adminLibSeasonZeroName => 'Име за приказ на нултата сезона';

  @override
  String get adminLibLufsScan =>
      'Овозможи LUFS скенирање за нормализација на аудиото';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Претпочитај нестандардна ознака за изведувачи';

  @override
  String get adminLibAutoAddToCollection =>
      'Автоматски додавај ги филмовите во колекции';

  @override
  String get adminLibraryNameRequired => 'Потребно е името на библиотеката';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Неуспешно создавање на библиотеката: $error';
  }

  @override
  String get adminLibraryName => 'Име на библиотека';

  @override
  String get adminSelectedPaths => 'Избрани патеки:';

  @override
  String get adminNoPathsAdded =>
      'Нема додадени патеки (може да се додадат подоцна)';

  @override
  String get adminCreateLibrary => 'Креирај библиотека';

  @override
  String get paths => 'Патеки:';

  @override
  String get adminDisableUser => 'Оневозможи корисник';

  @override
  String get adminEnableUser => 'Овозможи корисник';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Да се оневозможи $name? Нема да може да се најави.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Да се овозможи $name? Ќе може повторно да се најави.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Корисникот „$name“ е оневозможен';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Корисникот „$name“ е овозможен';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Неуспешно ажурирање на политиката за корисникот: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Не успеа да се вчитаат корисници';

  @override
  String get adminSearchUsers => 'Пребарувајте корисници';

  @override
  String get adminEditUser => 'Уреди корисник';

  @override
  String get adminAddUser => 'Додај корисник';

  @override
  String adminUserCreateFailed(String error) {
    return 'Неуспешно создавање на корисникот: $error';
  }

  @override
  String get adminCreateUser => 'Креирај корисник';

  @override
  String get adminPasswordOptional => 'Лозинка (изборно)';

  @override
  String get adminUsernameRequired => 'Корисничкото име не може да биде празно';

  @override
  String get adminNoProfileChanges => 'Нема промени на профилот за зачувување';

  @override
  String get adminProfileSaved => 'Профилот е зачуван';

  @override
  String adminSaveFailed(String error) {
    return 'Неуспешно зачувување: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дозволите се зачувани';

  @override
  String get adminPasswordsMismatch => 'Лозинките не се совпаѓаат';

  @override
  String adminFailed(String error) {
    return 'Неуспешно: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не успеа да се вчита корисникот';

  @override
  String get adminBackToUsers => 'Назад на Корисници';

  @override
  String get adminSaveProfile => 'Зачувај профил';

  @override
  String get adminDeleteUser => 'Избриши корисник';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Администраторите имаат целосен пристап до серверот. Доделете со претпазливост.';

  @override
  String get administrator => 'Администратор';

  @override
  String get adminHiddenUser => 'Скриен корисник';

  @override
  String get adminAllowMediaPlayback => 'Дозволете репродукција на медиуми';

  @override
  String get adminAllowAudioTranscoding => 'Дозволете аудио транскодирање';

  @override
  String get adminAllowVideoTranscoding => 'Дозволете транскодирање на видео';

  @override
  String get adminAllowRemuxing => 'Дозволете ремуксирање';

  @override
  String get adminForceRemoteTranscoding =>
      'Принудно транскодирање на далечинскиот извор';

  @override
  String get adminAllowContentDeletion => 'Дозволи бришење содржина';

  @override
  String get adminAllowContentDownloading => 'Дозволете преземање содржина';

  @override
  String get adminAllowPublicSharing => 'Дозволете јавно споделување';

  @override
  String get adminAllowRemoteControl =>
      'Дозволете далечинска контрола на други корисници';

  @override
  String get adminAllowSharedDeviceControl =>
      'Дозволи контрола на споделениот уред';

  @override
  String get adminAllowRemoteAccess => 'Дозволете далечински пристап';

  @override
  String get adminRemoteBitrateLimit =>
      'Ограничување на брзината на далечински клиент (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Оставете празно без ограничување';

  @override
  String get adminMaxActiveSessions => 'Максимални активни сесии';

  @override
  String get adminAllowLiveTvAccess => 'Дозволете пристап до ТВ во живо';

  @override
  String get adminAllowLiveTvManagement => 'Дозволете управување со ТВ во живо';

  @override
  String get adminAllowCollectionManagement =>
      'Дозволете управување со наплатата';

  @override
  String get adminAllowSubtitleManagement => 'Дозволете управување со преводи';

  @override
  String get adminAllowLyricManagement => 'Дозволете управување со лириката';

  @override
  String get adminSavePermissions => 'Зачувај дозволи';

  @override
  String get adminEnableAllLibraryAccess =>
      'Овозможете пристап до сите библиотеки';

  @override
  String get adminSaveAccess => 'Зачувај пристап';

  @override
  String get adminChangePassword => 'Променете ја лозинката';

  @override
  String get adminNewPassword => 'Нова лозинка';

  @override
  String get adminConfirmPassword => 'Потврдете ја лозинката';

  @override
  String get adminSetPassword => 'Поставете лозинка';

  @override
  String get adminResetPassword => 'Ресетирајте ја лозинката';

  @override
  String get adminPasswordReset => 'Ресетирање на лозинката';

  @override
  String get adminPasswordUpdated => 'Лозинката е ажурирана';

  @override
  String get adminUserSettings => 'Кориснички поставки';

  @override
  String get adminLibraryAccess => 'Пристап до библиотека';

  @override
  String get adminDeviceAndChannelAccess => 'Пристап до уред и канал';

  @override
  String get adminEnableAllDevices => 'Овозможете пристап до сите уреди';

  @override
  String get adminEnableAllChannels => 'Овозможете пристап до сите канали';

  @override
  String get adminParentalControl => 'Родителска контрола';

  @override
  String get adminMaxParentalRating => 'Максимална дозволена родителска оцена';

  @override
  String get adminMaxParentalRatingHint =>
      'Содржината со повисока оцена ќе биде скриена од овој корисник.';

  @override
  String get adminParentalRatingNone => 'Нема';

  @override
  String get adminBlockUnratedItems =>
      'Блокирај ставки без или со непрепознаени информации за оцена';

  @override
  String get adminUnratedBook => 'Книги';

  @override
  String get adminUnratedChannelContent => 'Канали';

  @override
  String get adminUnratedLiveTvChannel => 'ТВ во живо';

  @override
  String get adminUnratedMovie => 'Филмови';

  @override
  String get adminUnratedMusic => 'Музика';

  @override
  String get adminUnratedTrailer => 'Трејлери';

  @override
  String get adminUnratedSeries => 'Серии';

  @override
  String get adminAccessSchedules => 'Распореди за пристап';

  @override
  String get adminAccessSchedulesHint =>
      'Дозволи пристап само во закажаните времиња подолу. Кога не е поставен распоред, пристапот е дозволен цел ден.';

  @override
  String get adminAddSchedule => 'Додај распоред';

  @override
  String get adminScheduleDay => 'Ден';

  @override
  String get adminScheduleStart => 'Почеток';

  @override
  String get adminScheduleEnd => 'Крај';

  @override
  String get adminDayEveryday => 'Секој ден';

  @override
  String get adminDayWeekday => 'Работен ден';

  @override
  String get adminDayWeekend => 'Викенд';

  @override
  String get adminDaySunday => 'Недела';

  @override
  String get adminDayMonday => 'Понеделник';

  @override
  String get adminDayTuesday => 'Вторник';

  @override
  String get adminDayWednesday => 'Среда';

  @override
  String get adminDayThursday => 'Четврток';

  @override
  String get adminDayFriday => 'Петок';

  @override
  String get adminDaySaturday => 'Сабота';

  @override
  String get adminAllowedTags => 'Дозволени ознаки';

  @override
  String get adminAllowedTagsHint =>
      'Се прикажува само содржина со овие ознаки. Оставете празно за да дозволите сè.';

  @override
  String get adminBlockedTags => 'Блокирани ознаки';

  @override
  String get adminBlockedTagsHint =>
      'Содржината со овие ознаки е скриена од овој корисник.';

  @override
  String get adminAddTag => 'Додај ознака';

  @override
  String get adminEnabledDevices => 'Овозможени уреди';

  @override
  String get adminEnabledChannels => 'Овозможени канали';

  @override
  String get adminAuthProvider => 'Провајдер за автентикација';

  @override
  String get adminPasswordResetProvider => 'Провајдер за ресетирање лозинка';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максимален број неуспешни обиди за најава пред заклучување';

  @override
  String get adminLoginAttemptsHint =>
      'Поставете 0 за стандардната вредност или -1 за да го оневозможите заклучувањето.';

  @override
  String get adminSyncPlayAccess => 'Пристап до SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Дозволи создавање и придружување кон групи';

  @override
  String get adminSyncPlayJoin => 'Дозволи придружување кон групи';

  @override
  String get adminSyncPlayNone => 'Без пристап';

  @override
  String get adminContentDeletionFolders => 'Дозволи бришење содржина од';

  @override
  String get adminResetPasswordWarning =>
      'Ова ќе ја отстрани лозинката. Корисникот ќе може да се најави без лозинка.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Серверот врати HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Дали сте сигурни дека сакате да го избришете $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Корисникот „$name“ е избришан';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Неуспешно бришење на корисникот: $error';
  }

  @override
  String get adminCreateApiKey => 'Креирај API клуч';

  @override
  String get adminAppName => 'Име на апликацијата';

  @override
  String get adminApiKeyCreated => 'Создаден клуч API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Клучот е успешно создаден. Серверот не го врати токенот. Проверете ги клучевите на API на серверот.';

  @override
  String get adminKeyCopied => 'Клучот е копиран во таблата со исечоци';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Неуспешно создавање на клучот: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Недостасува клучен токен од одговорот на серверот';

  @override
  String get adminRevokeApiKey => 'Отповикајте го клучот на API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Да се отповика клучот за $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Клучот API е отповикан';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Неуспешно отповикување на клучот: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'Не успеа да се вчитаат клучевите на API';

  @override
  String get adminApiKeysTitle => 'API клучеви';

  @override
  String get adminCreateKey => 'Креирај клуч';

  @override
  String get adminNoApiKeys => 'Не се пронајдени клучеви за API';

  @override
  String get adminUnknownApp => 'Непозната апликација';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nСоздаден: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Создај резервна копија';

  @override
  String get adminBackupInclude =>
      'Изберете што да се вклучи во резервната копија.';

  @override
  String get adminBackupDatabase => 'База на податоци';

  @override
  String get adminBackupDatabaseAlways => 'Секогаш вклучена';

  @override
  String get adminBackupMetadata => 'Метаподатоци';

  @override
  String get adminBackupSubtitles => 'Преводи';

  @override
  String get adminBackupTrickplay => 'Trickplay слики';

  @override
  String get adminCreatingBackup => 'Се создава резервна копија...';

  @override
  String get adminBackupCreated => 'Бекапот е направен успешно';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Неуспешно создавање на резервната копија: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Недостасува резервна патека во одговорот на серверот';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Неуспешно вчитување на манифестот: $error';
  }

  @override
  String get adminConfirmRestore => 'Потврдете го обновувањето';

  @override
  String get adminRestoringBackup => 'Се враќа резервната копија...';

  @override
  String adminRestoreFailed(String error) {
    return 'Неуспешно враќање на резервната копија: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Не успеа да се вчитаат бекап';

  @override
  String get adminCreateBackup => 'Направете резервна копија';

  @override
  String get adminNoBackups => 'Не се пронајдени резервни копии';

  @override
  String get adminViewDetails => 'Погледнете ги деталите';

  @override
  String get restore => 'Врати';

  @override
  String get adminLogsLoadFailed =>
      'Не успеа да се вчитаат дневниците на серверот';

  @override
  String get adminNoLogFiles => 'Не се пронајдени датотеки за евиденција';

  @override
  String get adminLogCopied => 'Дневникот е копиран во таблата со исечоци';

  @override
  String get adminSaveLogFile => 'Зачувајте ја датотеката за евиденција';

  @override
  String adminSavedTo(String path) {
    return 'Зачувано во $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Неуспешно зачувување на датотеката: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Неуспешно вчитување на $fileName';
  }

  @override
  String get adminSearchInLog => 'Пребарајте во дневникот';

  @override
  String get adminNoMatchingLines => 'Нема соодветни линии';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Неуспешно вчитување на задачите: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Не се пронајдени закажани задачи';

  @override
  String get adminNoTasksMatchFilter =>
      'Ниту една задача не одговара на тековниот филтер';

  @override
  String adminTaskStartFailed(String error) {
    return 'Неуспешно стартување на задачата: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Неуспешно запирање на задачата: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Неуспешно вчитување на задачата: $error';
  }

  @override
  String get adminRunNow => 'Стартувај сега';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Неуспешно отстранување на активирањето: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Неуспешно додавање на активирање: $error';
  }

  @override
  String get adminLastExecution => 'Последно извршување';

  @override
  String get adminTriggers => 'Предизвикувачи';

  @override
  String get adminAddTrigger => 'Додадете активирач';

  @override
  String get adminNoTriggers => 'Нема конфигурирани предизвикувачи';

  @override
  String get adminTriggerType => 'Тип на активирањето';

  @override
  String get adminTimeLimit => 'Временско ограничување (опционално)';

  @override
  String get adminNoLimit => 'Нема ограничување';

  @override
  String adminHours(String hours) {
    return '$hours час(а)';
  }

  @override
  String get adminDayOfWeek => 'Ден во неделата';

  @override
  String get adminSearchPlugins => 'Пребарајте приклучоци...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Неуспешно префрлање на приклучокот: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирајте го приклучокот';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Дали сте сигурни дека сакате да го деинсталирате „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Неуспешна деинсталација на приклучокот: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Неуспешна инсталација на пакетот: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Неуспешна инсталација на ажурирањето: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Неуспешно вчитување на приклучоците: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Нема додатоци кои одговараат на вашето пребарување';

  @override
  String get adminNoPluginsInstalled => 'Нема инсталирани додатоци';

  @override
  String adminInstallUpdate(String version) {
    return 'Инсталирај ажурирање (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Неуспешно вчитување на каталогот: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Ниту еден пакет не одговара на вашето пребарување';

  @override
  String get adminNoPackagesAvailable => 'Нема достапни пакети';

  @override
  String get adminExperimentalIntegration => 'Експериментална интеграција';

  @override
  String get adminExperimentalWarning =>
      'Интеграцијата на поставките на приклучокот е сè уште експериментална. Некои страници со поставки може да не се прикажуваат правилно.';

  @override
  String get continueAction => 'Продолжи';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name“ ќе биде отстранет по рестартирање на серверот';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Неуспешна деинсталација: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Се ажурира „$name“ на v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Не може да се отворат поставките: недостасува токен за авторизација.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Неуспешно вчитување на приклучокот: $error';
  }

  @override
  String get adminPluginNotFound => 'Приклучокот не е пронајден';

  @override
  String adminPluginVersion(String version) {
    return 'Верзија $version';
  }

  @override
  String get adminEnablePlugin => 'Овозможи приклучок';

  @override
  String get adminPluginSettingsPage => 'Страница за поставки на приклучокот';

  @override
  String get adminRevisionHistory => 'Историја на ревизии';

  @override
  String get adminNoChangelog => 'Нема достапен дневник за промени.';

  @override
  String get adminRemoveRepository => 'Отстранете го складиштето';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Дали сте сигурни дека сакате да го отстраните „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Неуспешно зачувување на складиштата: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Неуспешно вчитување на складиштата: $error';
  }

  @override
  String get adminRepositoryNameHint => 'на пр. Jellyfin Стабилна';

  @override
  String get adminRepositoryUrl => 'URL на складиштето';

  @override
  String get adminAddEntry => 'Додадете запис';

  @override
  String get adminInvalidUrl => 'Неважечка URL-адреса';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Не може да се вчитаат поставките на приклучокот: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Не може да се отвори $uri';
  }

  @override
  String get adminOpenInBrowser => 'Отворете во прелистувачот';

  @override
  String get adminOpenExternally => 'Отворете надворешно';

  @override
  String get adminGeneralSettings => 'Општи поставки';

  @override
  String get adminServerName => 'Име на серверот';

  @override
  String get adminPreferredMetadataCountry =>
      'Претпочитана земја на метаподатоци';

  @override
  String get adminCachePath => 'Патека на кешот';

  @override
  String get adminMetadataPath => 'Патека за метаподатоци';

  @override
  String get adminLibraryScanConcurrency =>
      'Истовремено скенирање на библиотеката';

  @override
  String get adminParallelImageEncodingLimit =>
      'Паралелно ограничување за кодирање на слики';

  @override
  String get adminSlowResponseThreshold => 'Бавен праг на одговор (ms)';

  @override
  String get adminBrandingSaved => 'Поставките за брендирање се зачувани';

  @override
  String get adminBrandingLoadFailed =>
      'Не успеа да се вчитаат поставките за брендирање';

  @override
  String get adminLoginDisclaimer => 'Одрекување за најава';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML прикажан под формуларот за најавување';

  @override
  String get adminCustomCss => 'Прилагодено CSS';

  @override
  String get adminCustomCssHint => 'Прилагодено CSS на веб-интерфејсот';

  @override
  String get adminEnableSplashScreen => 'Овозможи прскање на екранот';

  @override
  String get adminStreamingSaved => 'Поставките за стриминг се зачувани';

  @override
  String get adminStreamingLoadFailed =>
      'Не успеа да се вчитаат поставките за пренос';

  @override
  String get adminStreamingDescription =>
      'Поставете глобални ограничувања на брзината на пренос за далечински врски.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ограничување на брзината на далечински клиент (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Оставете празно или 0 за неограничено';

  @override
  String get adminPlaybackSaved => 'Поставките за репродукција се зачувани';

  @override
  String get adminPlaybackLoadFailed =>
      'Не успеа да се вчитаат поставките за репродукција';

  @override
  String get adminPlaybackTranscoding => 'Репродукција / транскодирање';

  @override
  String get adminHardwareAcceleration => 'Хардверско забрзување';

  @override
  String get adminVaapiDevice => 'VA-API уред';

  @override
  String get adminEnableHardwareEncoding => 'Овозможи хардверско кодирање';

  @override
  String get adminEnableHardwareDecoding =>
      'Овозможете хардверско декодирање за:';

  @override
  String get adminEncodingThreads => 'Нишки за кодирање';

  @override
  String get adminAutomatic => '0 = автоматски';

  @override
  String get adminTranscodingTempPath => 'Температурна патека за транскодирање';

  @override
  String get adminEnableFallbackFont => 'Овозможи резервен фонт';

  @override
  String get adminFallbackFontPath => 'Повторна патека на фонтот';

  @override
  String get adminAllowSegmentDeletion => 'Дозволи бришење сегмент';

  @override
  String get adminSegmentKeepSeconds => 'Задржување на сегментот (секунди)';

  @override
  String get adminThrottleBuffering => 'Пуферирање на гас';

  @override
  String get adminTrickplaySaved => 'Зачувани се поставките за Trickplay';

  @override
  String get adminTrickplayLoadFailed =>
      'Не успеа да се вчитаат поставките за trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Овозможи хардверско забрзување';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Овозможете екстракција само на рамката со клучеви';

  @override
  String get adminKeyFrameSubtitle => 'Побрза, но помала точност';

  @override
  String get adminScanBehavior => 'Скенирајте однесување';

  @override
  String get adminProcessPriority => 'Приоритет на процесот';

  @override
  String get adminImageSettings => 'Поставки за слика';

  @override
  String get adminIntervalMs => 'Интервал (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Колку често да снимате рамки';

  @override
  String get adminWidthResolutions => 'Ширина резолуции';

  @override
  String get adminTileWidth => 'Ширина на плочка';

  @override
  String get adminTileHeight => 'Висина на плочка';

  @override
  String get adminQualitySubtitle =>
      'Пониски вредности = подобар квалитет, поголеми датотеки';

  @override
  String get adminProcessThreads => 'Процес на нишки';

  @override
  String get adminResumeSaved => 'Поставките за продолжување се зачувани';

  @override
  String get adminResumeLoadFailed =>
      'Не успеа да се вчитаат поставките за продолжување';

  @override
  String get adminResumeDescription =>
      'Конфигурирајте кога содржината треба да биде означена како делумно репродуцирана или целосно репродуцирана.';

  @override
  String get adminMinResumePercentage => 'Минимален процент на биографија';

  @override
  String get adminMinResumeSubtitle =>
      'Содржините мора да се репродуцираат над овој процент за да се заштеди напредок';

  @override
  String get adminMaxResumePercentage => 'Максимален процент на биографија';

  @override
  String get adminMaxResumeSubtitle =>
      'Содржините се сметаат за целосно пуштени по овој процент';

  @override
  String get adminMinResumeDuration =>
      'Минимално времетраење на биографија (секунди)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Ставките пократки од ова не се продолжуваат';

  @override
  String get adminMinAudiobookResume =>
      'Минимален процент за продолжување на аудиокнигата';

  @override
  String get adminMaxAudiobookResume =>
      'Максимален процент за продолжување на аудиокнигата';

  @override
  String get adminNetworkingSaved =>
      'Поставките за вмрежување се зачувани. Можеби ќе биде потребно рестартирање на серверот.';

  @override
  String get adminNetworkingLoadFailed =>
      'Не успеа да се вчитаат поставките за мрежа';

  @override
  String get adminNetworkingWarning =>
      'Промените на мрежните поставки може да бараат рестартирање на серверот.';

  @override
  String get adminEnableRemoteAccess => 'Овозможете далечински пристап';

  @override
  String get ports => 'Пристаништа';

  @override
  String get adminHttpPort => 'HTTP порта';

  @override
  String get adminHttpsPort => 'HTTPS порта';

  @override
  String get adminPublicHttpsPort => 'Јавна HTTPS порта';

  @override
  String get adminBaseUrl => 'Основен URL';

  @override
  String get adminBaseUrlHint => 'на пр. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Овозможи HTTPS';

  @override
  String get adminLocalNetwork => 'Локална мрежа';

  @override
  String get adminLocalNetworkAddresses => 'Адреси на локалната мрежа';

  @override
  String get adminKnownProxies => 'Познати полномошници';

  @override
  String get adminRemoteIpFilter => 'Далечински IP филтер';

  @override
  String get adminRemoteIpFilterEntries => 'Далечински IP филтер';

  @override
  String get adminCertificatePath => 'Патека за сертификат';

  @override
  String get whitelist => 'Белата листа';

  @override
  String get blacklist => 'Црна листа';

  @override
  String get notSet => 'Не е поставено';

  @override
  String get adminMetadataSaved => 'Метаподатоците се зачувани';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Неуспешно вчитување на метаподатоците: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Неуспешно зачувување на метаподатоците: $error';
  }

  @override
  String get adminRefreshMetadata => 'Освежете ги метаподатоците';

  @override
  String get recursive => 'Рекурзивен';

  @override
  String get adminReplaceAllMetadata => 'Заменете ги сите метаподатоци';

  @override
  String get adminReplaceAllImages => 'Заменете ги сите слики';

  @override
  String get adminMetadataRefreshRequested =>
      'Побарано е освежување на метаподатоци';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Неуспешно освежување на метаподатоците: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Не се пронајдени далечински совпаѓања';

  @override
  String get adminRemoteResults => 'Далечински резултати';

  @override
  String get adminRemoteMetadataApplied => 'Применети далечински метаподатоци';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Оддалеченото пребарување не успеа: $error';
  }

  @override
  String get adminUpdateContentType => 'Ажурирајте го типот на содржина';

  @override
  String get adminContentType => 'Тип на содржина';

  @override
  String get adminContentTypeUpdated => 'Типот на содржина е ажуриран';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Неуспешно ажурирање на типот содржина: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Не успеа да се вчита уредувачот на метаподатоци';

  @override
  String get adminNoPeopleEntries => 'Нема записи од луѓе';

  @override
  String get adminNoExternalIds => 'Нема достапни надворешни лични карти';

  @override
  String adminImageUpdated(String imageType) {
    return 'Сликата $imageType е ажурирана';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Неуспешно преземање на сликата: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Неподдржан формат на слика';

  @override
  String get adminImageReadFailed => 'Не успеа да се прочита избраната слика';

  @override
  String adminImageUploaded(String imageType) {
    return 'Сликата $imageType е подигната';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Неуспешно подигање на сликата: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Избриши ја сликата $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Сликата $imageType е избришана';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Неуспешно бришење на сликата: $error';
  }

  @override
  String get adminAllProviders => 'Сите провајдери';

  @override
  String get adminNoRemoteImages => 'Не се пронајдени далечински слики';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Откривањето на тјунери не успеа: $error';
  }

  @override
  String get adminAddTuner => 'Додадете тјунер';

  @override
  String get adminEditTuner => 'Уреди тјунер';

  @override
  String get adminTunerTypeM3u => 'M3U тјунер';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Датотека или URL';

  @override
  String get adminTunerIpAddress => 'IP адреса на тјунерот';

  @override
  String get adminTunerFriendlyName => 'Име за приказ';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Лимит на истовремени врски';

  @override
  String get adminTunerCountHelp =>
      'Максималниот број стримови што тјунерот ги дозволува истовремено. Поставете 0 за неограничено.';

  @override
  String get adminTunerFallbackBitrate =>
      'Резервен максимален битрејт за стриминг';

  @override
  String get adminTunerImportFavoritesOnly => 'Увезувај само омилени канали';

  @override
  String get adminTunerAllowHwTranscoding => 'Дозволи хардверско транскодирање';

  @override
  String get adminTunerAllowFmp4 => 'Дозволи fMP4 контејнер за транскодирање';

  @override
  String get adminTunerAllowStreamSharing => 'Дозволи споделување на стримот';

  @override
  String get adminTunerEnableStreamLooping => 'Овозможи повторување на стримот';

  @override
  String get adminTunerIgnoreDts => 'Игнорирај DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Читај го влезот со изворната честота на кадри';

  @override
  String get adminEditProvider => 'Уреди провајдер';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Датотека или URL';

  @override
  String get adminXmltvMoviePrefix => 'Префикс за филмови';

  @override
  String get adminXmltvMovieCategories => 'Категории за филмови';

  @override
  String get adminXmltvCategoriesHelp =>
      'Одделете повеќе категории со вертикална црта.';

  @override
  String get adminXmltvKidsCategories => 'Категории за деца';

  @override
  String get adminXmltvNewsCategories => 'Категории за вести';

  @override
  String get adminXmltvSportsCategories => 'Категории за спорт';

  @override
  String get adminSdUsername => 'Корисничко име';

  @override
  String get adminSdPassword => 'Лозинка';

  @override
  String get adminSdCountry => 'Држава';

  @override
  String get adminSdCountrySelect => 'Изберете држава';

  @override
  String get adminSdPostalCode => 'Поштенски код';

  @override
  String get adminSdGetListings => 'Преземи ја програмата';

  @override
  String get adminSdListings => 'Програма';

  @override
  String get adminEnableAllTuners => 'Овозможи ги сите тјунери';

  @override
  String get adminTunerType => 'Тип на тјунер';

  @override
  String get adminTunerAdded => 'Додаде тјунер';

  @override
  String adminTunerAddFailed(String error) {
    return 'Неуспешно додавање на тјунер: $error';
  }

  @override
  String get adminAddGuideProvider => 'Додадете провајдер на водич';

  @override
  String get adminProviderType => 'Тип на провајдер';

  @override
  String get adminProviderAdded => 'Додаден е провајдер';

  @override
  String adminProviderAddFailed(String error) {
    return 'Неуспешно додавање на провајдер: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Неуспешно отстранување на тјунерот: $error';
  }

  @override
  String get adminTunerResetRequested => 'Побарано е ресетирање на приемникот';

  @override
  String adminTunerResetFailed(String error) {
    return 'Неуспешно ресетирање на тјунерот: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Овој тип тјунер не поддржува ресетирање.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Неуспешно отстранување на провајдерот: $error';
  }

  @override
  String get adminRecordingSettings => 'Поставки за снимање';

  @override
  String get adminPrePadding => 'Пред-пополнување (минути)';

  @override
  String get adminPostPadding => 'По полнењето (минути)';

  @override
  String get adminRecordingPath => 'Патека за снимање';

  @override
  String get adminSeriesRecordingPath => 'Патека за снимање на серии';

  @override
  String get adminMovieRecordingPath => 'Патека за снимките на филмови';

  @override
  String get adminGuideDays => 'Денови со податоци за водичот';

  @override
  String get adminGuideDaysAuto => 'Автоматски';

  @override
  String adminGuideDaysValue(int days) {
    return '$days дена';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Патека до апликацијата за последователна обработка';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Аргументи за последователната обработка';

  @override
  String get adminSaveRecordingNfo => 'Зачувувај NFO метаподатоци за снимките';

  @override
  String get adminSaveRecordingImages => 'Зачувувај слики за снимките';

  @override
  String get adminLiveTvSectionTiming => 'Тајминг';

  @override
  String get adminLiveTvSectionPaths => 'Патеки за снимките';

  @override
  String get adminLiveTvSectionPostProcessing => 'Последователна обработка';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Податоци за водичот: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Поставките за снимање се зачувани';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Неуспешно зачувување на поставките: $error';
  }

  @override
  String get adminSetChannelMappings => 'Поставете мапирања на канали';

  @override
  String get adminMappingJson => 'Мапирање JSON';

  @override
  String get adminMappingJsonHint => 'Пример: пресликување на товар на JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Мапирањата на каналот се ажурирани';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Неуспешно ажурирање на мапирањата: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Не успеа да се вчита администрацијата на ТВ во живо';

  @override
  String get adminTunerDevices => 'Уреди за тјунер';

  @override
  String get adminNoTunerHosts => 'Не се конфигурирани хостови за тјунер';

  @override
  String get adminGuideProviders => 'Даватели на водичи';

  @override
  String get adminRefreshGuideData => 'Освежи ги податоците за водичот';

  @override
  String get adminGuideRefreshStarted =>
      'Освежувањето на податоците за водичот започна';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задачата за освежување на водичот не е достапна на овој сервер.';

  @override
  String get adminAddProvider => 'Додадете провајдер';

  @override
  String get adminNoListingProviders =>
      'Не се конфигурирани даватели на огласи';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Патека за снимки: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Патека за серии: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Време пред снимањето: $minutes мин';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Време по снимањето: $minutes мин';
  }

  @override
  String get adminTunerDiscovery => 'Откривање на тјунер';

  @override
  String get adminChannelMappings => 'Мапирања на канали';

  @override
  String get adminNoDiscoveredTuners => 'Сè уште нема откриени тјунери';

  @override
  String get adminSettingsSaved => 'Поставките се зачувани';

  @override
  String get adminBackupsNotAvailable =>
      'Резервните копии не се достапни на оваа верзија на серверот.';

  @override
  String get adminRestoreWarning1 =>
      'Враќањето ќе ги замени СИТЕ тековни податоци на серверот со резервните податоци.';

  @override
  String get adminRestoreWarning2 =>
      'Тековните поставки на серверот, корисниците и податоците од библиотеката ќе бидат препишани.';

  @override
  String get adminRestoreWarning3 =>
      'Серверот ќе се рестартира по реставрацијата.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Да се врати резервната копија $name сега?';
  }

  @override
  String get adminRestoreRequested =>
      'Побарано е обновување. Рестартирањето на серверот може да ја исклучи оваа сесија.';

  @override
  String get adminBackupsTitle => 'Резервни копии';

  @override
  String get adminUnknownDate => 'Непознат датум';

  @override
  String get adminUnnamedBackup => 'Неименувана резервна копија';

  @override
  String get adminLiveTvNotAvailable =>
      'Администрацијата на ТВ во живо не е достапна на оваа верзија на серверот.';

  @override
  String get adminLiveTvTitle => 'Администрација на ТВ во живо';

  @override
  String get adminApply => 'Примени';

  @override
  String get adminNotSet => 'Не е поставено';

  @override
  String get adminReset => 'Ресетирај';

  @override
  String get adminLogsTitle => 'Дневници на серверот';

  @override
  String get adminLogsNewestFirst => 'Најновото прво';

  @override
  String get adminLogsOldestFirst => 'Прво најстариот';

  @override
  String get adminLogsJustNow => 'Само сега';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'пред $minutesм';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'пред $hoursч';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'пред $daysд';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Неуспешно вчитување на $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count совпаѓања';
  }

  @override
  String get adminLogViewerNoMatches => 'Нема соодветни линии';

  @override
  String get adminMetadataEditorTitle => 'Уредувач на метаподатоци';

  @override
  String get adminMetadataIdentify => 'Идентификувај';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Детали';

  @override
  String get adminMetadataExternalIds => 'Надворешни лични карти';

  @override
  String get adminMetadataImages => 'Слики';

  @override
  String get adminMetadataFieldTitle => 'Наслов';

  @override
  String get adminMetadataFieldSortTitle => 'Подреди наслов';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригинален наслов';

  @override
  String get adminMetadataFieldPremiereDate => 'Датум на премиера (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Датум на завршување (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Година на производство';

  @override
  String get adminMetadataFieldOfficialRating => 'Официјален рејтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Оценка на заедницата';

  @override
  String get adminMetadataFieldCriticRating => 'Оценка на критичарите';

  @override
  String get adminMetadataFieldTagline => 'Ознака';

  @override
  String get adminMetadataFieldOverview => 'Преглед';

  @override
  String get adminMetadataGenres => 'Жанрови';

  @override
  String get adminMetadataTags => 'Тагови';

  @override
  String get adminMetadataStudios => 'Студија';

  @override
  String get adminMetadataPeople => 'Луѓе';

  @override
  String get adminMetadataAddGenre => 'Додадете жанр';

  @override
  String get adminMetadataAddTag => 'Додадете ознака';

  @override
  String get adminMetadataAddStudio => 'Додадете студио';

  @override
  String get adminMetadataAddPerson => 'Додадете лице';

  @override
  String get adminMetadataEditPerson => 'Уреди лице';

  @override
  String get adminMetadataRole => 'Улога';

  @override
  String get adminMetadataImagePrimary => 'Примарен';

  @override
  String get adminMetadataImageBackdrop => 'Заднина';

  @override
  String get adminMetadataImageLogo => 'Лого';

  @override
  String get adminMetadataImageBanner => 'Банер';

  @override
  String get adminMetadataImageThumb => 'Палецот';

  @override
  String get adminMetadataRecursive => 'Рекурзивен';

  @override
  String get adminMetadataProvider => 'Провајдер';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Сликата $imageType е ажурирана';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Сликата $imageType е подигната';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Сликата $imageType е избришана';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Неуспешно преземање на сликата: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Не успеа да се прочита избраната слика';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Неуспешно подигање на сликата: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Избриши ја сликата $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ова ја отстранува моменталната слика од ставката.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Неуспешно бришење на сликата: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Изберете слика $imageType';
  }

  @override
  String get adminMetadataUpload => 'Поставете';

  @override
  String get adminMetadataUpdate => 'Ажурирање';

  @override
  String get adminMetadataRemoteImage => 'Далечинска слика';

  @override
  String get adminPluginsInstalled => 'Инсталиран';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Активен';

  @override
  String get adminPluginsRestart => 'Рестартирајте';

  @override
  String get adminPluginsNoSearchResults =>
      'Нема додатоци кои одговараат на вашето пребарување';

  @override
  String get adminPluginsNoneInstalled => 'Нема инсталирани додатоци';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Достапно ажурирање: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Достапно е ажурирање';

  @override
  String get adminPluginsPendingRemoval =>
      'Во очекување на отстранување по рестартирање';

  @override
  String get adminPluginsChangesPending => 'Промените чекаат на рестартирање';

  @override
  String get adminPluginsEnable => 'Овозможи';

  @override
  String get adminPluginsDisable => 'Оневозможи';

  @override
  String get adminPluginsInstallUpdate => 'Инсталирајте ажурирање';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Инсталирај ажурирање (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ниту еден пакет не одговара на вашето пребарување';

  @override
  String get adminPluginsCatalogEmpty => 'Нема достапни пакети';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name“ се инсталира...';
  }

  @override
  String get adminPluginDetailExperimental => 'Експериментална интеграција';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Интеграцијата на поставките на приклучокот е сè уште експериментална. Некои полиња или распореди можеби сè уште не се прикажуваат правилно.';

  @override
  String get adminPluginDetailToggle404 =>
      'Не успеа да се вклучи приклучокот. Серверот не можеше да ја пронајде оваа верзија на приклучокот. Обидете се да ги освежите приклучоците, а потоа обидете се повторно.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Не успеа да се вклучи приклучокот. Ве молиме проверете ги дневниците на серверот за детали.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Поставки за $name';
  }

  @override
  String get adminPluginDetailDetails => 'Детали';

  @override
  String get adminPluginDetailDeveloper => 'Програмер';

  @override
  String get adminPluginDetailRepository => 'Репозиториум';

  @override
  String get adminPluginDetailBundled => 'Во комплет';

  @override
  String get adminPluginDetailEnablePlugin => 'Овозможи приклучок';

  @override
  String get adminPluginDetailRestartRequired =>
      'Потребно е рестартирање на серверот за да стапат на сила промените.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Овој приклучок ќе се отстрани по рестартирање на серверот.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Овој приклучок не функционираше и може да не работи правилно.';

  @override
  String get adminPluginDetailNotSupported =>
      'Овој приклучок не е поддржан од тековната верзија на серверот.';

  @override
  String get adminPluginDetailSuperseded =>
      'Овој приклучок е заменет со понова верзија.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Неуспешно вчитување на складиштата: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Отстранете го складиштето';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Дали сте сигурни дека сакате да го отстраните „$name“?';
  }

  @override
  String get adminReposRemove => 'Отстрани';

  @override
  String adminReposSaveFailed(String error) {
    return 'Неуспешно зачувување на складиштата: $error';
  }

  @override
  String get adminReposEmpty => 'Нема конфигурирани складишта';

  @override
  String get adminReposEmptySubtitle =>
      'Додајте складиште за да ги пребарувате достапните приклучоци';

  @override
  String get adminReposUnnamed => '(неименуван)';

  @override
  String get adminReposEditTitle => 'Уреди складиште';

  @override
  String get adminReposAddTitle => 'Додадете складиште';

  @override
  String get adminReposUrl => 'URL на складиштето';

  @override
  String get adminReposNameHint => 'на пр. Jellyfin Стабилна';

  @override
  String get adminPluginSettingsInvalidUrl => 'Неважечка URL-адреса';

  @override
  String get adminGeneralSettingsTitle => 'Општи поставки';

  @override
  String get adminGeneralMetadataLanguage => 'Префериран јазик на метаподатоци';

  @override
  String get adminGeneralMetadataLanguageHint => 'на пр. en, de, fr';

  @override
  String get adminGeneralMetadataCountry =>
      'Претпочитана земја на метаподатоци';

  @override
  String get adminGeneralMetadataCountryHint => 'на пр. САД, ДЕ, ФР';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Истовремено скенирање на библиотеката';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Паралелно ограничување за кодирање на слики';

  @override
  String get adminUnknownError => 'Непозната грешка';

  @override
  String get adminBrowse => 'Прелистајте';

  @override
  String get adminCloseBrowser => 'Затворете го прелистувачот';

  @override
  String get adminNetworkingTitle => 'Вмрежување';

  @override
  String get adminNetworkingRestartWarning =>
      'Промените на мрежните поставки може да бараат рестартирање на серверот.';

  @override
  String get adminNetworkingRemoteAccess => 'Овозможете далечински пристап';

  @override
  String get adminNetworkingPorts => 'Пристаништа';

  @override
  String get adminNetworkingHttpPort => 'HTTP порта';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS порта';

  @override
  String get adminNetworkingEnableHttps => 'Овозможи HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Локална мрежа';

  @override
  String get adminNetworkingLocalAddresses => 'Адреси на локалната мрежа';

  @override
  String get adminNetworkingAddressHint => 'на пр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Познати полномошници';

  @override
  String get adminNetworkingProxyHint => 'на пр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Белата листа';

  @override
  String get adminNetworkingBlacklist => 'Црна листа';

  @override
  String get adminNetworkingAddEntry => 'Додадете запис';

  @override
  String get adminBrandingTitle => 'Брендирање';

  @override
  String get adminBrandingLoginDisclaimer => 'Одрекување за најава';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML прикажан под формуларот за најавување';

  @override
  String get adminBrandingCustomCss => 'Прилагодено CSS';

  @override
  String get adminBrandingCustomCssHint => 'Прилагодено CSS на веб-интерфејсот';

  @override
  String get adminBrandingEnableSplash => 'Овозможи прскање на екранот';

  @override
  String get adminBrandingSplashUpload => 'Подигни слика';

  @override
  String get adminBrandingSplashUploaded => 'Почетниот екран е ажуриран';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Неуспешно подигање на почетниот екран';

  @override
  String get adminBrandingSplashDeleted => 'Почетниот екран е отстранет';

  @override
  String get adminBrandingNoSplash => 'Нема прилагоден почетен екран';

  @override
  String get adminPlaybackHwAccel => 'Хардверско забрзување';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардверско забрзување';

  @override
  String get adminPlaybackEnableHwEncoding => 'Овозможи хардверско кодирање';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Овозможете хардверско декодирање за:';

  @override
  String get adminPlaybackQsvDevice => 'QSV уред';

  @override
  String get adminPlaybackEnhancedNvdec => 'Овозможи подобрен NVDEC декодер';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Претпочитај го системскиот хардверски декодер';

  @override
  String get adminPlaybackColorDepth =>
      'Длабочина на бојата при хардверско декодирање';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-битно HEVC декодирање';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-битно VP9 декодирање';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-битно декодирање';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-битно декодирање';

  @override
  String get adminPlaybackHwEncodingSection => 'Хардверско кодирање';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Дозволи HEVC кодирање';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Дозволи AV1 кодирање';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Овозможи Intel нискоенергетски H.264 кодер';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Овозможи Intel нискоенергетски HEVC кодер';

  @override
  String get adminPlaybackToneMapping => 'Тонско мапирање';

  @override
  String get adminPlaybackEnableTonemapping => 'Овозможи тонско мапирање';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Овозможи VPP тонско мапирање';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Овозможи VideoToolbox тонско мапирање';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Алгоритам за тонско мапирање';

  @override
  String get adminPlaybackTonemappingMode => 'Режим на тонско мапирање';

  @override
  String get adminPlaybackTonemappingRange => 'Опсег на тонско мапирање';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Десатурација при тонско мапирање';

  @override
  String get adminPlaybackTonemappingPeak => 'Врв на тонско мапирање';

  @override
  String get adminPlaybackTonemappingParam => 'Параметар за тонско мапирање';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Осветленост при VPP тонско мапирање';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контраст при VPP тонско мапирање';

  @override
  String get adminPlaybackPresetsQuality => 'Пресети и квалитет';

  @override
  String get adminPlaybackEncoderPreset => 'Пресет на кодерот';

  @override
  String get adminPlaybackH264Crf => 'CRF при H.264 кодирање';

  @override
  String get adminPlaybackH265Crf => 'CRF при H.265 (HEVC) кодирање';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод на деинтерлејсинг';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Удвој ја честотата на кадри при деинтерлејсинг';

  @override
  String get adminPlaybackAudioSection => 'Аудио';

  @override
  String get adminPlaybackEnableAudioVbr => 'Овозможи VBR кодирање на аудиото';

  @override
  String get adminPlaybackDownmixBoost => 'Засилување при downmix на аудиото';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгоритам за стерео downmix';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максимална големина на редицата за муксирање';

  @override
  String get adminPlaybackAutoOption => 'Автоматски';

  @override
  String get adminPlaybackEncoding => 'Кодирање';

  @override
  String get adminPlaybackEncodingThreads => 'Нишки за кодирање';

  @override
  String get adminPlaybackFallbackFont => 'Овозможи резервен фонт';

  @override
  String get adminPlaybackFallbackFontPath => 'Повторна патека на фонтот';

  @override
  String get adminPlaybackStreaming => 'Стриминг';

  @override
  String get adminResumeVideo => 'Видео';

  @override
  String get adminResumeAudiobooks => 'Аудио книги';

  @override
  String get adminResumeMinAudiobookPct =>
      'Минимален процент за продолжување на аудиокнигата';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максимален процент за продолжување на аудиокнигата';

  @override
  String get adminStreamingBitrateLimit =>
      'Ограничување на брзината на далечински клиент (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Оставете празно или 0 за неограничено';

  @override
  String get adminTrickplayHwAccel => 'Овозможи хардверско забрзување';

  @override
  String get adminTrickplayHwEncoding => 'Овозможи хардверско кодирање';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Овозможете екстракција само на рамката со клучеви';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Побрза, но помала точност';

  @override
  String get adminTrickplayNonBlocking => 'Не-Блокирање';

  @override
  String get adminTrickplayBlocking => 'Блокирање';

  @override
  String get adminTrickplayPriorityHigh => 'Високо';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Над нормалното';

  @override
  String get adminTrickplayPriorityNormal => 'Нормално';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Под нормалата';

  @override
  String get adminTrickplayPriorityIdle => 'Неактивен';

  @override
  String get adminTrickplayImageSettings => 'Поставки за слика';

  @override
  String get adminTrickplayInterval => 'Интервал (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Колку често да снимате рамки';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Широчини на пиксели разделени со запирки (на пр. 320)';

  @override
  String get adminTrickplayQuality => 'Квалитет';

  @override
  String get adminTrickplayQScale => 'Скала за квалитет';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Пониски вредности = подобар квалитет, поголеми датотеки';

  @override
  String get adminTrickplayJpegQuality => 'JPEG квалитет';

  @override
  String get adminTrickplayProcessing => 'Обработка';

  @override
  String get adminTasksEmpty => 'Не се пронајдени закажани задачи';

  @override
  String get adminTasksNoFilterMatch =>
      'Ниту една задача не одговара на тековниот филтер';

  @override
  String get adminTaskCancelling => 'Се откажува...';

  @override
  String get adminTaskRunning => 'Трчање...';

  @override
  String get adminTaskNeverRun => 'Никогаш не трчај';

  @override
  String get adminTaskStop => 'Стоп';

  @override
  String get adminRunningTasks => 'Активни задачи';

  @override
  String get adminTaskRun => 'Трчај';

  @override
  String get adminTaskDetailLastExecution => 'Последно извршување';

  @override
  String get adminTaskDetailStarted => 'Започна';

  @override
  String get adminTaskDetailEnded => 'Заврши';

  @override
  String get adminTaskDetailDuration => 'Времетраење';

  @override
  String get adminTaskDetailErrorLabel => 'Грешка:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Секој ден во $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Секој $day во $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Секои $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'При стартување на апликацијата';

  @override
  String get adminTaskTriggerTypeDaily => 'Дневно';

  @override
  String get adminTaskTriggerTypeWeekly => 'Неделно';

  @override
  String get adminTaskTriggerTypeInterval => 'На интервал';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Секој час';

  @override
  String get adminTaskTriggerEvery6Hours => 'На секои 6 часа';

  @override
  String get adminTaskTriggerEvery12Hours => 'На секои 12 часа';

  @override
  String get adminTaskTriggerEvery24Hours => 'На секои 24 часа';

  @override
  String get adminTaskTriggerEvery2Days => 'На секои 2 дена';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа',
      one: '$count час',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Време';

  @override
  String get adminTaskTriggerNoLimit => 'Нема ограничување';

  @override
  String get adminActivityJustNow => 'Само сега';

  @override
  String get adminActivityLastHour => 'Последниот час';

  @override
  String get adminActivityToday => 'Денес';

  @override
  String get adminActivityYesterday => 'Вчера';

  @override
  String get adminActivityOlder => 'Постари';

  @override
  String adminActivityDaysAgo(int days) {
    return 'пред $daysд';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'пред $hoursч';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'пред $minutesм';
  }

  @override
  String get adminActivityNow => 'сега';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesм';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursч';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysд';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Конфигурирајте генерирање слики за trickplay за сликички за преглед на пребарување.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Јавна HTTPS порта';

  @override
  String get adminNetworkingBaseUrl => 'Основен URL';

  @override
  String get adminNetworkingBaseUrlHint => 'на пр. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Јавен HTTP порт';

  @override
  String get adminNetworkingRequireHttps => 'Барај HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Пренасочи ги сите оддалечени барања кон HTTPS. Нема ефект ако серверот нема важечки сертификат.';

  @override
  String get adminNetworkingCertPassword => 'Лозинка на сертификатот';

  @override
  String get adminNetworkingIpSettings => 'IP поставки';

  @override
  String get adminNetworkingEnableIpv4 => 'Овозможи IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Овозможи IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Овозможи автоматско мапирање на портови';

  @override
  String get adminNetworkingLocalSubnets => 'LAN мрежи';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Список со IP адреси или CIDR подмрежи, одделени со запирка или нов ред, кои се третираат како дел од локалната мрежа.';

  @override
  String get adminNetworkingPublishedUris => 'Објавени URI адреси на серверот';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Мапирајте подмрежа или адреса кон објавен URL, на пр. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Патека за сертификат';

  @override
  String get adminNetworkingRemoteIpFilter => 'Далечински IP филтер';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Далечински IP филтер';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API уред';

  @override
  String get adminPlaybackAutomatic => '0 = автоматски';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Температурна патека за транскодирање';

  @override
  String get adminPlaybackSegmentDeletion => 'Дозволи бришење сегмент';

  @override
  String get adminPlaybackSegmentKeep => 'Задржување на сегментот (секунди)';

  @override
  String get adminPlaybackThrottleBuffering => 'Пуферирање на гас';

  @override
  String get adminPlaybackThrottleDelay =>
      'Одложување при ограничување (секунди)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Дозволи извлекување на преводи во реално време';

  @override
  String get adminResumeMinPct => 'Минимален процент на биографија';

  @override
  String get adminResumeMinPctSubtitle =>
      'Содржините мора да се репродуцираат над овој процент за да се заштеди напредок';

  @override
  String get adminResumeMaxPct => 'Максимален процент на биографија';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Содржините се сметаат за целосно пуштени по овој процент';

  @override
  String get adminResumeMinDuration =>
      'Минимално времетраење на биографија (секунди)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Ставките пократки од ова не се продолжуваат';

  @override
  String get adminTrickplayScanBehavior => 'Скенирајте однесување';

  @override
  String get adminTrickplayProcessPriority => 'Приоритет на процесот';

  @override
  String get adminTrickplayTileWidth => 'Ширина на плочка';

  @override
  String get adminTrickplayTileHeight => 'Висина на плочка';

  @override
  String get adminTrickplayProcessThreads => 'Процес на нишки';

  @override
  String get adminTrickplayWidthResolutions => 'Ширина резолуции';

  @override
  String get adminMetadataDefault => 'Стандардно';

  @override
  String get adminMetadataContentTypeUpdated => 'Типот на содржина е ажуриран';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Неуспешно ажурирање на типот содржина: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Бавен праг на одговор (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Овозможи предупредувања за бавен одговор';

  @override
  String get adminGeneralQuickConnect => 'Овозможи Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метаподатоци';

  @override
  String get adminGeneralSectionPaths => 'Патеки';

  @override
  String get adminGeneralSectionPerformance => 'Перформанси';

  @override
  String get adminGeneralCachePath => 'Патека на кешот';

  @override
  String get adminGeneralMetadataPath => 'Патека за метаподатоци';

  @override
  String get adminGeneralServerName => 'Име на серверот';

  @override
  String get adminGeneralDisplayLanguage => 'Претпочитан јазик за приказ';

  @override
  String get adminSettingsLoadFailed => 'Не успеа да се вчитаат поставките';

  @override
  String get adminDiscover => 'Откријте';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Неуспешно ажурирање на мапирањата: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Временско ограничување: $duration';
  }

  @override
  String get folders => 'Папки';

  @override
  String get libraries => 'Библиотеки';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay е оневозможен';

  @override
  String get syncPlayDisabledMessage =>
      'Овозможете SyncPlay во Поставки за да користите синхронизирана репродукција.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Серверот не е поддржан';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay бара Jellyfin сервер. Тековниот сервер не го поддржува.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Група';

  @override
  String get syncPlayGroupTooltip => 'Група SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# учесници',
      one: '# учесник',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Игнорирај чекање';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не ја задржувајте групата додека уредов се баферира';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Продолжете локално без да чекате бавни членови';

  @override
  String get syncPlayRepeat => 'Повторете';

  @override
  String get syncPlayRepeatOne => 'Еден';

  @override
  String get syncPlayShuffleModeShuffled => 'Измешано';

  @override
  String get syncPlayShuffleModeSorted => 'Подредени';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронизирајте го тековниот ред за репродукција';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Заменете ја групната редица со она што се игра локално';

  @override
  String get syncPlayLeaveGroup => 'Напуштете ја групата';

  @override
  String get syncPlayGroupQueue => 'Групна редица';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Ставка $index';
  }

  @override
  String get syncPlayPlayNow => 'Играј сега';

  @override
  String get syncPlayCreateNewGroup => 'Направете нова група';

  @override
  String get syncPlayGroupName => 'Име на групата';

  @override
  String get syncPlayDefaultGroupName => 'Мојата група SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Креирај група';

  @override
  String get syncPlayAvailableGroups => 'Достапни групи';

  @override
  String get syncPlayNoGroupsAvailable => 'Нема достапни групи';

  @override
  String get syncPlayJoinGroupQuestion =>
      'Да се ​​придружите на групата SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Приклучувањето на група SyncPlay може да ја замени вашата тековна редица за репродукција. Да продолжиме?';

  @override
  String get syncPlayJoin => 'Приклучи се';

  @override
  String get syncPlayStateIdle => 'Неактивен';

  @override
  String get syncPlayStateWaiting => 'Чекање';

  @override
  String get syncPlayStatePaused => 'Паузирано';

  @override
  String get syncPlayStatePlaying => 'Играње';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName се приклучи на SyncPlay групата';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ја напушти SyncPlay групата';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Пристапот во SyncPlay е одбиен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Немате пристап до една или повеќе ставки во оваа група SyncPlay. Побарајте од сопственикот на групата да ги потврди дозволите за библиотеката или да избере друга редица.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Синхронизирање на репродукцијата со $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовното пребарување е недостапно.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Неуспешно репродукција на Dolby Vision Direct';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Директната репродукција не успеа да започне за овој пренос на Dolby Vision. Обидете се повторно да користите транскод на серверот?';

  @override
  String get retryWithTranscode => 'Обидете се повторно со транскод';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision не е поддржан';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Овој уред не може директно да ја декодира содржината на Dolby Vision. Користете резервен HDR10 или побарајте транскодирање на серверот.';

  @override
  String get rememberMyChoice => 'Запомнете го мојот избор';

  @override
  String get playHdr10Fallback => 'Репродуцирајте го резервниот HDR10';

  @override
  String get requestTranscode => 'Побарајте транскод';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'откриени # редови',
      one: 'откриен # ред',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Види ги сите';

  @override
  String get noItems => 'Нема ставки';

  @override
  String get switchUser => 'Префрли корисник';

  @override
  String get remoteControl => 'Далечински управувач';

  @override
  String get mediaBarLoading => 'Се вчитува медиумската лента...';

  @override
  String get mediaBarError => 'Медиумската лента не успеа да се вчита';

  @override
  String get offlineServerUnavailable =>
      'Поврзан на интернет, но тековниот сервер е недостапен.';

  @override
  String get offlineNoInternet =>
      'Вие сте офлајн. Достапна е само преземената содржина.';

  @override
  String get offlineFileNotAvailable => 'Датотеката не е достапна';

  @override
  String get offlineSwitchServer => 'Префрли сервер';

  @override
  String get offlineSavedMedia => 'Зачувани медиуми';

  @override
  String get offlineBannerTitle => 'Не сте поврзани';

  @override
  String get offlineBannerSubtitle => 'Се прикажуваат вашите преземања';

  @override
  String get offlineBannerAction => 'Преземања';

  @override
  String get serverUnreachableBannerTitle =>
      'Не може да се пристапи до вашиот сервер';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Се пушта од преземањата додека не се врати';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Далечинска репродукција';

  @override
  String castControlFailed(String error) {
    return 'Контролата за емитување не успеа: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Контроли за $kind';
  }

  @override
  String get castDeviceVolume => 'Јачина на звук на уредот';

  @override
  String get castVolumeUnavailable => 'Недостапно';

  @override
  String castStopKind(String kind) {
    return 'Запри $kind';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Преводи';

  @override
  String get pinConfirmTitle => 'Потврдете PIN';

  @override
  String get pinSetTitle => 'Поставете PIN';

  @override
  String get pinEnterTitle => 'Внесете PIN';

  @override
  String get pinReenterToConfirm =>
      'Повторно внесете го вашиот PIN за да потврдите';

  @override
  String pinEnterNDigit(int length) {
    return 'Внесете $length-цифрен PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Внесете го вашиот $length-цифрен PIN';
  }

  @override
  String get pinIncorrect => 'Неточен ПИН';

  @override
  String get pinMismatch => 'PIN-кодовите не се совпаѓаат';

  @override
  String get pinForgot => 'Го заборавивте ПИН-кодот?';

  @override
  String get pinClear => 'Исчисти';

  @override
  String get pinBackspace => 'Бришење';

  @override
  String get quickConnectAuthorized => 'Барањето за Quick Connect е одобрено.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Кодот за Quick Connect е неважечки или истечен.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не е поддржан на овој сервер.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Неуспешно одобрување на кодот за Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect е оневозможен на овој сервер.';

  @override
  String get quickConnectForbidden =>
      'Вашата сметка не може да го одобри ова барање за Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Кодот за Quick Connect не е пронајден. Обидете се со нов код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect не успеа: $message';
  }

  @override
  String get quickConnectEnterCode => 'Внесете код';

  @override
  String get quickConnectAuthorize => 'Овластете';

  @override
  String remoteCommandFailed(String error) {
    return 'Командата не успеа: $error';
  }

  @override
  String get remoteControlTitle => 'Далечински управувач';

  @override
  String get remoteFailedToLoadSessions => 'Не успеа да се вчитаат сесиите';

  @override
  String get remoteNoSessions => 'Нема контролирани сесии';

  @override
  String get remoteStartPlayback => 'Започнете со репродукција на друг уред';

  @override
  String get unknownUser => 'Непознат';

  @override
  String get unknownItem => 'Непознат';

  @override
  String get remoteNothingPlaying => 'Ништо не се игра на оваа сесија';

  @override
  String get castingStarted => 'Емитувањето започна на избраниот уред';

  @override
  String castingFailed(String error) {
    return 'Неуспешно започнување на емитувањето: $error';
  }

  @override
  String get noRemoteDevices =>
      'Нема достапни уреди за далечинско репродукција.';

  @override
  String get noRemoteDevicesIos =>
      'Нема достапни уреди за далечинско репродукција.\n\nНа iOS, целите на AirPlay може да се недостапни во симулаторот.';

  @override
  String get trackActionPlayNext => 'Играј Следно';

  @override
  String get trackActionAddToQueue => 'Додај во редица';

  @override
  String get trackActionAddToPlaylist => 'Додај во плејлиста';

  @override
  String get trackActionCancelDownload => 'Откажи преземање';

  @override
  String get trackActionDeleteFromPlaylist => 'Избриши од плејлиста';

  @override
  String get trackActionMoveUp => 'Движете се нагоре';

  @override
  String get trackActionMoveDown => 'Движете се надолу';

  @override
  String get trackActionRemoveFromFavorites => 'Отстрани од Омилени';

  @override
  String get trackActionAddToFavorites => 'Додај во Омилени';

  @override
  String get trackActionGoToAlbum => 'Одете во албумот';

  @override
  String get trackActionGoToArtist => 'Одете во Уметникот';

  @override
  String trackActionDownloading(String name) {
    return 'Се презема $name...';
  }

  @override
  String get trackActionDeletedFile => 'Избришана преземената датотека';

  @override
  String get trackActionDeleteFileFailed =>
      'Не може да се избрише преземената датотека';

  @override
  String get shuffleBy => 'Мешај од';

  @override
  String get shuffleSelectLibrary => 'Изберете Библиотека';

  @override
  String get shuffleSelectGenre => 'Изберете Жанр';

  @override
  String get shuffleLibrary => 'Библиотека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Нема достапни компатибилни библиотеки.';

  @override
  String get shuffleNoGenres =>
      'Не се најдени жанрови за овој режим на мешање.';

  @override
  String get posterDisplayTitle => 'Приказ';

  @override
  String get posterImageType => 'Тип на слика';

  @override
  String get imageTypePoster => 'Постер';

  @override
  String get imageTypeThumbnail => 'Сликичка';

  @override
  String get imageTypeBanner => 'Банер';

  @override
  String get playlistAddFailed => 'Не успеа да се додаде во плејлистата';

  @override
  String get playlistCreateFailed => 'Не успеа да се создаде плејлиста';

  @override
  String get playlistNew => 'Нова плејлиста';

  @override
  String get playlistCreate => 'Креирај';

  @override
  String get playlistCreateNew => 'Креирајте нова плејлиста';

  @override
  String get playlistNoneFound => 'Не се пронајдени плејлисти';

  @override
  String get addToPlaylist => 'Додај во плејлиста';

  @override
  String get lyricsNotAvailable => 'Нема достапни стихови';

  @override
  String get upNext => 'Напред Следно';

  @override
  String get playNext => 'Играј Следно';

  @override
  String get stillWatchingContent =>
      'Репродукцијата е паузирана. Дали сеуште гледате?';

  @override
  String get stillWatchingStop => 'Стоп';

  @override
  String get stillWatchingContinue => 'Продолжи';

  @override
  String skipSegment(String segment) {
    return 'Прескокни $segment';
  }

  @override
  String get liveTv => 'ТВ во живо';

  @override
  String get continueWatchingAndNextUp => 'Продолжете да гледате и понатаму';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Се презема $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Се презема $fileName';
  }

  @override
  String get nextEpisode => 'Следна епизода';

  @override
  String get moreFromThisSeason => 'Повеќе од оваа сезона';

  @override
  String get playerTooltipPlaybackSpeed => 'Брзина на репродукција';

  @override
  String get playerTooltipCastControls => 'Контроли на Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Брзина на битови';

  @override
  String get playerTooltipEnterFullscreen => 'Влезете на цел екран';

  @override
  String get playerTooltipExitFullscreen => 'Излезете од цел екран';

  @override
  String get playerTooltipFloatOnTop => 'Плови на врвот';

  @override
  String get playerTooltipExitFloatOnTop => 'Оневозможи плови на врвот';

  @override
  String get playerTooltipLockLandscape => 'Пејзаж за заклучување';

  @override
  String get playerTooltipUnlockOrientation => 'Дозволете ротација';

  @override
  String get playerTooltipPrevious => 'Претходно';

  @override
  String get playerTooltipSeekBack => 'Барај назад';

  @override
  String get playerTooltipSeekForward => 'Барајте напред';

  @override
  String get contextMenuMarkWatched => 'Означи како гледано';

  @override
  String get contextMenuMarkUnwatched => 'Означи како невидено';

  @override
  String get contextMenuAddToFavorites => 'Додај во Омилени';

  @override
  String get contextMenuRemoveFromFavorites => 'Отстрани од Омилени';

  @override
  String get contextMenuGoToSeries => 'Одете во Серии';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Скриј од „Продолжи со гледање“';

  @override
  String get contextMenuHideFromNextUp => 'Скриј од „Следно“';

  @override
  String get contextMenuAddToCollection => 'Додај во колекција';

  @override
  String get settingsAdministrationSubtitle =>
      'Пристапете до панелот за администрација на серверот';

  @override
  String get settingsAccountSecurity => 'Сметка и безбедност';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Автентикација, ПИН-код и родителски контроли';

  @override
  String get settingsPersonalization => 'Персонализација';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тема, навигација, почетни редови и видливост на библиотеката';

  @override
  String get settingsDynamicContent => 'Динамичка содржина';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиумска лента и визуелни преклопувања';

  @override
  String get settingsPlaybackSyncplay => 'Репродукција и SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Поставки за аудио/видео, преводи, преземања и контроли на SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронизација на приклучоци, Seerr, оценки и повеќе';

  @override
  String get settingsAboutSubtitle =>
      'Верзија на апликација, правни информации и кредити';

  @override
  String get settingsAuthenticationSection => 'АВТЕНТИКАЦИЈА';

  @override
  String get settingsSortServersBy => 'Подреди сервери по';

  @override
  String get settingsLastUsed => 'Последно користено';

  @override
  String get settingsAlphabetical => 'Азбучно';

  @override
  String get settingsConnectionSection => 'ВРСКА';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дозволи самопотпишани сертификати';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Верувај им на серверите што користат самопотпишани TLS сертификати или сертификати од приватен CA. Овозможете само за сервери што ги контролирате. Ова ја оневозможува проверката на сертификатите за сите врски.';

  @override
  String get settingsPrivacyAndSafetySection => 'ПРИВАТНОСТ И БЕЗБЕДНОСТ';

  @override
  String get settingsBlockedRatings => 'Блокирани рејтинзи';

  @override
  String get settingsGeneralStyle => 'Општ стил';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Акценти на теми, заднини, гледани индикатори и тематска музика';

  @override
  String get settingsDetailsScreen => 'Екран со детали';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стил, заматување на позадината и однесување на јазичињата';

  @override
  String get settingsHomePage => 'Почетна страница';

  @override
  String get settingsHomePageSubtitle =>
      'Секции, типови слики, преклопувања и прегледи на медиуми';

  @override
  String get settingsLibrariesSubtitle =>
      'Видливост на библиотеката, приказ на папки и однесување на повеќе сервери';

  @override
  String get settingsTwentyFourHourClock => '24-часовен часовник';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Користете 24-часовно форматирање на времето каде и да е прикажан часовникот';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Прикажи го копчето за мешање во лентата за навигација';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Прикажи го копчето за жанрови во лентата за навигација';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Прикажи го копчето за омилени во лентата за навигација';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Прикажи го копчето за библиотеки во лентата за навигација';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Прикажи го копчето Seerr во навигациската лента';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Секогаш прикажувај ги текстуалните ознаки во горната навигациска лента';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Вклучете ја видливоста на почетната страница по библиотека. Рестартирајте го Moonfin за да стапат на сила промените.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медиумска лента и локални прегледи';

  @override
  String get settingsVisualOverlays => 'Визуелни преклопувања';

  @override
  String get settingsSeasonalSurprise => 'Сезонско изненадување';

  @override
  String get settingsMetadataAndRatings => 'Метаподатоци и оценки';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ги напојува интеграциите од страна на серверот, вклучувајќи дополнителни извори на оценување, барања на Seerr и синхронизирани параметри.';

  @override
  String get settingsOfflineDownloads => 'Офлајн преземања';

  @override
  String get settingsHigh => 'Високо';

  @override
  String get settingsLow => 'Ниско';

  @override
  String get settingsCustomPath => 'Прилагодена патека';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Внесете ја патеката на папката за преземање';

  @override
  String get settingsConcurrentDownloads => 'Истовремени преземања';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максимален број на ставки за преземање одеднаш.';

  @override
  String get settingsAppInfo => 'ИНФОРМАЦИИ ЗА АПЛИКАЦИЈАТА';

  @override
  String get settingsReportAnIssue => 'Пријавете проблем';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Отворете го следењето на проблеми на GitHub';

  @override
  String get settingsJoinDiscord => 'Придружете се на Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговарајте со заедницата';

  @override
  String get settingsJoinTheDiscord => 'Придружете се на Discord';

  @override
  String get settingsSupportMoonfin => 'Поддржете го Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Почестете го развивачот со кафе';

  @override
  String get settingsLegal => 'ПРАВНИ';

  @override
  String get settingsLicenses => 'Лиценци';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Известувања за лиценци со отворен код';

  @override
  String get settingsPrivacyPolicy => 'Политика за приватност';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Како Moonfin се справува со вашите податоци';

  @override
  String get settingsCheckForUpdates => 'Проверете дали има ажурирања';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверете за најновото издание на Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Овозможено од Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# лиценцни известувања',
      one: '# лиценцно известување',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'И двете';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Измешај го филтерот за тип на содржина';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Поставки за репродукција на видео';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Основен видео мотор и поставки за квалитет на стриминг';

  @override
  String get settingsAudioPreferences => 'Аудио параметри';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Опции за аудио траки, обработка и премин';

  @override
  String get settingsAutomationAndQueue => 'Автоматизација и редица';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматска репродукција и секвенционирање';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Квалитет на преземање, ограничувања за складирање и големина на редот';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика за синхронизација за групни сесии';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Специјализирани карактеристики на плеерот. Користете го со претпазливост, бидејќи некои опции може да предизвикаат проблеми со репродукцијата';

  @override
  String get settingsSkipIntrosAndOutros => 'Прескокнете воведни и аутроси?';

  @override
  String get settingsMediaSegmentCountdown =>
      'Одбројување за медиумските сегменти';

  @override
  String get settingsProgressBar => 'Лента за напредок';

  @override
  String get settingsTimer => 'Тајмер';

  @override
  String get settingsNone => 'Нема';

  @override
  String get settingsPromptUser => 'Пратен корисник';

  @override
  String get settingsSkip => 'Прескокни';

  @override
  String get settingsDoNothing => 'Не правете ништо';

  @override
  String get settingsMaxBitrateDescription =>
      'Отворете ја бит-стапката на стриминг. Содржините над овој праг ќе се транскодираат за да одговараат.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ограничете ја максималната резолуција што ќе ја побара плеерот. Содржините со повисока резолуција ќе бидат транскодирани.';

  @override
  String get settingsPlayerZoomDescription =>
      'Како видеото треба да се скалира за да одговара на екранот.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Мотор за репродукција (Андроид ТВ)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Изберете го стандардниот мотор за репродукција на уредите со Android TV. Промените се применуваат на следната сесија за репродукција.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (препорачано)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (застарено)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (наследство)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (препорачано)';

  @override
  String get settingsDolbyVisionFallback =>
      'Повратни информации за Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Однесување за наслови на Dolby Vision на уреди без декодирање на Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Прашајте секој пат';

  @override
  String get settingsPreferHdr10Fallback => 'Претпочитајте резервен HDR10';

  @override
  String get settingsPreferServerTranscode => 'Претпочита транскод на серверот';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Директна репродукција';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Контролира дали стримовите со подобрувачки слој на профилот на Dolby Vision 7 треба да ја насочуваат репродукцијата.';

  @override
  String get settingsAutoAftkrtEnabled => 'Автоматски (AFTKRT е овозможено)';

  @override
  String get settingsEnabledOnThisDevice => 'Овозможено на овој уред';

  @override
  String get settingsDisabledPreferTranscode =>
      'Оневозможено (претпочитаат транскод)';

  @override
  String get settingsResumeRewindDescription =>
      'Кога продолжувате со репродукцијата (од „Продолжи со гледање“ или од страница со медиумска ставка), колку секунди треба да се преврти?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Кога продолжувате со репродукцијата по притискање на копчето за пауза, колку секунди треба да се преврти?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Колку секунди да скокнете назад откако ќе го притиснете копчето за премотување назад.';

  @override
  String get settingsOneSecond => '1 секунда';

  @override
  String get settingsThreeSeconds => '3 секунди';

  @override
  String get settingsFortyFiveSeconds => '45 секунди';

  @override
  String get settingsSixtySeconds => '60 секунди';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Колку секунди да скокнете напред откако ќе го притиснете копчето за брзо напред.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Битстрим AC3 до надворешен декодер';

  @override
  String get settingsCinemaMode => 'Режим на кино';

  @override
  String get settingsCinemaModeSubtitle =>
      'Репродуцирајте трејлери/прелистувачи пред главната карактеристика';

  @override
  String get settingsNextUpDisplayDescription =>
      'Проширено прикажува целосна картичка со уметнички дела и опис на епизодата. Минималното покажува компактно преклопување на одбројувањето. Оневозможено целосно го крие известувањето.';

  @override
  String get settingsShort => 'Кратко';

  @override
  String get settingsLong => 'Долго';

  @override
  String get settingsVeryLong => 'Многу долго';

  @override
  String get settingsVideoStartDelay => 'Одложување на започнување на видеото';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Директно ТВ во живо';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Овозможете директна репродукција за ТВ во живо';

  @override
  String get settingsOpenGroups => 'Отворете ги групите';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Креирајте, придружете се или управувајте со групи на SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay е овозможено';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Овозможете ги функциите за групно гледање';

  @override
  String get settingsSyncplayButton => 'Копче SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Прикажи го копчето SyncPlay на лентата за навигација';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Напредна корекција';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Овозможете ситно-грануларна логика за синхронизација';

  @override
  String get settingsSyncplaySyncCorrection => 'Корекција на синхронизација';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Автоматски приспособете ја репродукцијата за да останете синхронизирани';

  @override
  String get settingsSyncplaySpeedToSync => 'Брзина за синхронизација';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Користете прилагодување на брзината на репродукција за да се синхронизирате';

  @override
  String get settingsSyncplaySkipToSync => 'Прескокнете на синхронизација';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Користете барање за синхронизација';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Доцнење со минимална брзина';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Доцнење на максимална брзина';

  @override
  String get settingsSyncplaySpeedDuration => 'Времетраење на брзината';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Минимално доцнење со прескокнување';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Дополнително поместување';

  @override
  String get onNow => 'На сега';

  @override
  String get collections => 'Колекции';

  @override
  String get lastPlayed => 'Последно одиграно';

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
    return 'Неодамна издадени $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Автоматски пушти ја следната епизода';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Автоматски пушти ја следната епизода кога е достапна.';

  @override
  String get skipSilenceTitle => 'Прескокни тишина';

  @override
  String get skipSilenceSubtitle =>
      'Автоматски прескокнувај ги тивките аудио сегменти кога стримот го поддржува тоа.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Дозволи надворешни аудио ефекти';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Дозволи им на апликациите за еквилајзер и ефекти (на пр. Wavelet) да се прикачат на Media3 сесиите за репродукција.';

  @override
  String get disableTunnelingTitle => 'Оневозможи тунелирање';

  @override
  String get disableTunnelingSubtitle =>
      'Наметни репродукција без тунелирање. Корисно на уреди со прекини на аудиото/видеото при тунелирање.';

  @override
  String get enableTunnelingTitle => 'Овозможи тунелирање';

  @override
  String get enableTunnelingSubtitle =>
      'За напредни корисници. Го насочува аудиото и видеото преку спрегнат хардверски пат. Стандардно исклучено бидејќи предизвикува прекини на аудиото/видеото на некои уреди.';

  @override
  String get mapDolbyVisionP7Title => 'Мапирај Dolby Vision профил 7 во HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Пуштај ги стримовите со Dolby Vision профил 7 како HDR10-компатибилен HEVC на уреди без DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Користи вградени стилови на преводите';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Применувај ги боите, фонтовите и позиционирањето вградени во преводот. Оневозможете за да ги користите вашите преференции за стил на преводите.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Користи вградени големини на фонтот на преводите';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Применувај ги предлозите за големина на фонтот вградени во преводот. Оневозможете за да ја користите големината на преводите од вашите преференции за стил.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Прикажи детали за медиумот';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Прикажувај детали за избраната ставка на врвот на страниците со библиотеки.';

  @override
  String get hideBackdropsInLibraries =>
      'Скриј ги позадините при прегледување?';

  @override
  String get useDetailedSubHeadings => 'Користи детални поднаслови';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Прикажувај детален или минимален поднаслов на страниците со библиотеки.';

  @override
  String get savedThemesDeleteDialogTitle => 'Да се избрише зачуваната тема?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Да се отстрани „$themeName“ од кешот на овој уред?';
  }

  @override
  String get themeStore => 'Продавница за теми';

  @override
  String get themeStoreSubtitle =>
      'Прегледувајте и зачувувајте теми од заедницата';

  @override
  String get themeStoreDescription =>
      'Зачувајте тема за да ја користите како другите ваши зачувани теми.';

  @override
  String get themeStoreEmpty => 'Во моментот нема достапни теми.';

  @override
  String get themeStoreLoadFailed =>
      'Продавницата за теми не можеше да се вчита. Проверете ја врската и обидете се повторно.';

  @override
  String get themeStoreSave => 'Зачувај';

  @override
  String get themeStoreSaveAndApply => 'Зачувај и примени';

  @override
  String get themeStoreSaved => 'Зачувана';

  @override
  String get themeStoreInvalidMessage => 'Оваа тема не можеше да се вчита.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '„$themeName“ е зачувана.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName“ е избришана од овој уред.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '„$themeName“ не можеше да се избрише.';
  }

  @override
  String get savedThemesTitle => 'Зачувани теми';

  @override
  String get savedThemesDescription =>
      'Ова се теми преземени од приклучокот на Moonfin за тековниот сервер. Бришењето ја отстранува само оваа локална копија.';

  @override
  String get savedThemesEmpty =>
      'Не се пронајдени зачувани теми за овој сервер.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Моментално активна';
  }

  @override
  String get savedThemesDeleteTooltip => 'Избриши ја зачуваната тема';

  @override
  String get savedThemesManageSubtitle =>
      'Управувајте со преземените теми од приклучоци на овој уред';

  @override
  String get themeEditor => 'Уредувач на теми';

  @override
  String get themeEditorSubtitle =>
      'Отворете го уредувачот на теми на Moonfin во вашиот прелистувач';

  @override
  String get homeScreen => 'Почетен екран';

  @override
  String get bottomBar => 'Долна лента';

  @override
  String get homeRowsStyleClassic => 'Класичен';

  @override
  String get homeRowsStyleModern => 'Модерен';

  @override
  String get homeRowsSection => 'Почетни редови';

  @override
  String get homeRowDisplay => 'Приказ на почетните редови';

  @override
  String get homeRowSections => 'Секции на почетните редови';

  @override
  String get homeRowToggles => 'Прекинувачи за почетните редови';

  @override
  String get homeRowTogglesSubtitle =>
      'Овозможете или оневозможете ги категориите почетни редови базирани на библиотеки';

  @override
  String get homeRowTogglesDescription =>
      'Овозможете ги следните прекинувачи за да се прикажуваат редовите во почетните секции.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Класичниот задржува тип на слика по ред и информативен слој. Модерниот користи редови од портрет до позадина.';

  @override
  String get displayFavoritesRows => 'Прикажи редови со омилени';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Прикажувај редови со омилени филмови, серии и други омилени во почетните секции.';

  @override
  String get favoritesRowSorting => 'Подредување на редовите со омилени';

  @override
  String get favoritesRowSortingDescription =>
      'Подредувајте ги редовите со омилени по датум на додавање, датум на издавање, азбучно и повеќе.';

  @override
  String get displayCollectionsRows => 'Прикажи редови со колекции';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Прикажувај редови со колекции во почетните секции.';

  @override
  String get collectionsRowSorting => 'Подредување на редовите со колекции';

  @override
  String get collectionsRowSortingDescription =>
      'Подредувајте ги редовите со колекции по датум на додавање, датум на издавање, азбучно и повеќе.';

  @override
  String get displayGenresRows => 'Прикажи редови со жанрови';

  @override
  String get displayGenresRowsSubtitle =>
      'Прикажувај редови со жанрови во почетните секции.';

  @override
  String get genresRowSorting => 'Подредување на редовите со жанрови';

  @override
  String get genresRowSortingDescription =>
      'Подредувајте ги редовите со жанрови по датум на додавање, датум на издавање, азбучно и повеќе.';

  @override
  String get genresRowItems => 'Ставки во редовите со жанрови';

  @override
  String get genresRowItemsDescription =>
      'Прикажувај филмови, серии или и двете во редовите со жанрови.';

  @override
  String get displayPlaylistsRows => 'Прикажи редови со плејлисти';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Прикажувај редови со плејлисти во почетните секции.';

  @override
  String get playlistsRowSorting => 'Подредување на редовите со плејлисти';

  @override
  String get playlistsRowSortingDescription =>
      'Подредувајте ги редовите со плејлисти по датум на додавање, датум на издавање, азбучно и повеќе.';

  @override
  String get displayAudioRows => 'Прикажи аудио редови';

  @override
  String get displayAudioRowsSubtitle =>
      'Прикажувај аудио редови во почетните секции.';

  @override
  String get audioRowsSorting => 'Подредување на аудио редовите';

  @override
  String get audioRowsSortingDescription =>
      'Подредувајте ги аудио редовите по датум на додавање, датум на издавање, азбучно и повеќе.';

  @override
  String get audioPlaylists => 'Аудио плејлисти';

  @override
  String get appearance => 'Изглед';

  @override
  String get layout => 'Распоред';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Тастатура';

  @override
  String get navButtons => 'Копчиња';

  @override
  String get rendering => 'Рендерирање';

  @override
  String get mpvConfiguration => 'MPV конфигурација';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Надворешна апликација за пуштање';

  @override
  String get externalPlayerAppDescription =>
      'Поставете надворешен плеер за да ја овозможите опцијата за пуштање со долг притисок';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Прикажи избирач на апликации кога започнува репродукцијата.';

  @override
  String get loadingInstalledPlayers => 'Се вчитуваат инсталираните плеери...';

  @override
  String get connection => 'Врска';

  @override
  String get audioTranscodeTarget => 'Цел за транскодирање на аудиото';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Поддржано на овој уред';

  @override
  String get notSupportedOnThisDevice => 'Не е поддржано на овој уред';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Испраќај DTS:X (DTS UHD) како битстрим до надворешен декодер.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD со Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Однесување на медиумскиот плеер';

  @override
  String get playbackEnhancements => 'Подобрувања на репродукцијата';

  @override
  String get alwaysOn => 'Секогаш вклучено.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Замени го „Прескокни ја шпицата“ со приказот „Следно“';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Прикажи го слојот „Следно“ наместо копчето „Прескокни ја шпицата“.';

  @override
  String get playerRouting => 'Насочување на плеерот';

  @override
  String get preferSoftwareDecoders => 'Претпочитај софтверски декодери';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Користи FFmpeg (аудио) и libgav1 (AV1) пред хардверските декодери. Оневозможете ако HDMI аудио passthrough не работи.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Отворај ја видео репродукцијата во избраната надворешна апликација на Android TV.';

  @override
  String get automaticQueuing => 'Автоматско редење';

  @override
  String get preferSdhSubtitles => 'Претпочитај SDH преводи';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Дај приоритет на SDH/CC преводите при автоматски избор.';

  @override
  String get webDiagnostics => 'Веб дијагностика';

  @override
  String get webDiagnosticsTitle => 'Moonfin веб дијагностика';

  @override
  String get webDiagnosticsIntro =>
      'Користете ја оваа страница за да дијагностицирате проблеми со поврзувањето во прелистувачот (CORS, мешана содржина и поставки за откривање).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Откриен е неуспех поради мешана содржина';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Откриен е неуспех на CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin откри HTTPS страница што се обидува да повика HTTP URL на серверот. Прелистувачите го блокираат ова барање пред да стигне до вашиот сервер.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin откри неуспех на барање на ниво на прелистувач, што обично е предизвикано од недостасувачки CORS или preflight заглавја на медиумскиот сервер.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Целен URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Детал: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Тековен контекст на извршување';

  @override
  String get webDiagnosticsOrigin => 'Потекло';

  @override
  String get webDiagnosticsScheme => 'Шема';

  @override
  String get webDiagnosticsPluginMode => 'Режим на приклучок';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC скенирање';

  @override
  String get webDiagnosticsForcedServerUrl => 'Наметнат URL на серверот';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Стандарден URL на серверот';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL на прокси за откривање';

  @override
  String get notConfigured => 'не е конфигурирано';

  @override
  String get webDiagnosticsMixedContent => 'Мешана содржина';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Оваа страница е вчитана преку HTTPS, но една или повеќе конфигурирани URL-адреси се HTTP. Прелистувачите блокираат HTTPS страници да повикуваат HTTP API-ја.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Решение: сервирајте го вашиот медиумски сервер или прокси крајна точка преку HTTPS, или вчитувајте го Moonfin преку HTTP само на доверливи локални мрежи.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Не е откриена очигледна конфигурација со мешана содржина од тековните поставки за извршување.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS список за проверка';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Дозволете го потеклото на прелистувачот во Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Вклучете Authorization, X-Emby-Authorization и X-Emby-Token во Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Изложете Content-Range и Accept-Ranges за стриминг и премотување.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Враќајте 204 на OPTIONS preflight барањата.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Пример за заглавје (nginx-стил)';

  @override
  String get note => 'Забелешка';

  @override
  String get webDiagnosticsNonWebNote =>
      'Оваа рута за дијагностика е наменета за веб верзии. Ако го гледате ова на друга платформа, овие проверки може да не важат.';

  @override
  String get backToServerSelect => 'Назад кон изборот на сервер';

  @override
  String get signOutAllUsers => 'Одјави ги сите корисници';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Дозволата за микрофон е трајно одбиена. Овозможете ја во системските поставки.';

  @override
  String get voiceSearchPermissionRequired =>
      'Потребна е дозвола за микрофон за гласовно пребарување.';

  @override
  String get voiceSearchNoMatch => 'Не разбрав. Обидете се повторно.';

  @override
  String get voiceSearchNoSpeechDetected => 'Не е откриен говор.';

  @override
  String get voiceSearchMicrophoneError => 'Грешка со микрофонот.';

  @override
  String get voiceSearchNeedsInternet =>
      'Гласовното пребарување бара интернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Гласовната услуга е зафатена. Обидете се повторно.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Дозволата за микрофон е трајно одбиена.';

  @override
  String get microphonePermissionDenied => 'Дозволата за микрофон е одбиена.';

  @override
  String get speechRecognitionUnavailable =>
      'Препознавањето на говор не е достапно на овој уред.';

  @override
  String get openIosRoutePicker => 'Отвори го iOS избирачот на рути';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay избирачот на рути не е достапен на овој уред.';

  @override
  String get videos => 'Видеа';

  @override
  String get programs => 'Програми';

  @override
  String get songs => 'Песни';

  @override
  String get photoAlbums => 'Фото албуми';

  @override
  String get photos => 'Фотографии';

  @override
  String get people => 'Луѓе';

  @override
  String get recentlyReleasedEpisodes => 'Неодамна издадени епизоди';

  @override
  String get watchAgain => 'Гледај повторно';

  @override
  String get guestAppearances => 'Гостински појавувања';

  @override
  String get appearancesSeerr => 'Појавувања (Seerr)';

  @override
  String get crewContributionsSeerr => 'Придонеси на екипата (Seerr)';

  @override
  String get watchWithGroup => 'Гледај со група';

  @override
  String get errors => 'Грешки';

  @override
  String get warnings => 'Предупредувања';

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Отвори во прелистувач';

  @override
  String get embeddedBrowserNotAvailable =>
      'Вградениот прелистувач не е достапен на оваа платформа.';

  @override
  String get adminRestartServerConfirmation =>
      'Дали сте сигурни дека сакате да го рестартирате серверот?';

  @override
  String get adminShutdownServerConfirmation =>
      'Дали сте сигурни дека сакате да го исклучите серверот? Ќе треба рачно да го рестартирате.';

  @override
  String get internal => 'Внатрешно';

  @override
  String get idle => 'Неактивно';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Не се пронајдени корисници';

  @override
  String get adminNoUsersMatchSearch =>
      'Ниту еден корисник не одговара на вашето пребарување';

  @override
  String get adminNoDevicesFound => 'Не се пронајдени уреди';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ниту еден уред не одговара на тековните филтри';

  @override
  String get passwordSet => 'Лозинката е поставена';

  @override
  String get noPasswordConfigured => 'Нема конфигурирана лозинка';

  @override
  String get remoteAccess => 'Оддалечен пристап';

  @override
  String get localOnly => 'Само локално';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Неуспешно вчитување на аналитиката за медиуми';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Комбинирана аналитика низ сите медиумски библиотеки.';

  @override
  String get analyticsTopArtists => 'Топ изведувачи';

  @override
  String get analyticsTopAuthors => 'Топ автори';

  @override
  String get analyticsTopContributors => 'Топ придонесувачи';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Библиотеки',
      one: '$count Библиотека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Сè уште нема достапни вкупни индексирани медиуми за овој избор.';

  @override
  String get analyticsLibraryDetails => 'Детали за библиотеката';

  @override
  String get analyticsLibraryBreakdown => 'Распределба по библиотеки';

  @override
  String get analyticsNoLibrariesAvailable => 'Нема достапни библиотеки.';

  @override
  String get adminServerAdministrationTitle => 'Администрација на серверот';

  @override
  String get adminServerPathData => 'Податоци';

  @override
  String get adminServerPathImageCache => 'Кеш за слики';

  @override
  String get adminServerPathCache => 'Кеш';

  @override
  String get adminServerPathLogs => 'Дневници';

  @override
  String get adminServerPathMetadata => 'Метаподатоци';

  @override
  String get adminServerPathTranscode => 'Транскодирање';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'Овој сервер не врати патеки.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% искористено';
  }

  @override
  String get userActivity => 'Активност на корисниците';

  @override
  String get systemEvents => 'Системски настани';

  @override
  String get needsAttention => 'Бара внимание';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Репродукција';

  @override
  String get adminDrawerSectionDevices => 'Уреди';

  @override
  String get adminDrawerSectionAdvanced => 'Напредно';

  @override
  String get adminDrawerSectionPlugins => 'Приклучоци';

  @override
  String get adminDrawerSectionLiveTv => 'ТВ во живо';

  @override
  String get homeVideos => 'Домашни видеа';

  @override
  String get mixedContent => 'Мешана содржина';

  @override
  String get homeVideosAndPhotos => 'Домашни видеа и фотографии';

  @override
  String get mixedMoviesAndShows => 'Мешани филмови и серии';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Не се пронајдени снимки';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Не се пронајдени страници со слики во .$extension архивата.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Вградениот рендерер не успеа ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB рендерерот не успеа ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Недостасува локална датотека за читачот: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status при отворање на податоците за книгата од $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Нема достапна крајна точка за читање на книгата';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Неподдржан формат на архива за стрип: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Приклучокот за извлекување CBR не е достапен на оваа платформа.';

  @override
  String get failedToExtractCbrArchive =>
      'Неуспешно извлекување на .cbr архивата.';

  @override
  String get cb7ExtractionUnavailable =>
      'Извлекувањето на CB7 не е достапно на оваа платформа.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Приклучокот за извлекување CB7 не е достапен на оваа платформа.';

  @override
  String get closeGenrePanel => 'Затвори го панелот со жанрови';

  @override
  String get loadingShuffle => 'Се вчитува мешањето...';

  @override
  String get libraryShuffleLabel => 'МЕШАЊЕ НА БИБЛИОТЕКАТА';

  @override
  String get randomShuffleLabel => 'СЛУЧАЈНО МЕШАЊЕ';

  @override
  String get genresShuffleLabel => 'МЕШАЊЕ ПО ЖАНРОВИ';

  @override
  String get autoHdrSwitching => 'Автоматско префрлање на HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Автоматски овозможи HDR за репродукција на HDR видео и врати го режимот на приказ при излез.';

  @override
  String get whenFullscreen => 'Кога е на цел екран';

  @override
  String get changeArtwork => 'Промени ја сликата';

  @override
  String get missing => 'Недостасува';

  @override
  String get transcodingLimits => 'Ограничувања за транскодирање';

  @override
  String get clearAllArtworkButton => 'Да се исчистат сите слики?';

  @override
  String get clearAllArtworkWarning =>
      'Дали сте сигурни дека сакате да ги исчистите сите преземени слики?';

  @override
  String get confirmClear => 'Потврди го чистењето';

  @override
  String confirmClearMessage(String itemType) {
    return 'Дали сте сигурни дека сакате да го исчистите следново: $itemType?';
  }

  @override
  String get uploadButton => 'Подигање?';

  @override
  String get resolutionLabel => 'Резолуција: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Прикажувај само слики на јазикот на интерфејсот';

  @override
  String get confirmClearAll => 'Потврди чистење на сè';

  @override
  String get imageUploadSuccess => 'Сликата е успешно подигната!';

  @override
  String imageUploadFailed(String error) {
    return 'Неуспешно подигање на сликата: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Неуспешно поставување на сликата: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Неуспешно бришење на сликата: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Неуспешно чистење на сите слики: $error';
  }

  @override
  String get yes => 'Да';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Позадини';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Лого';

  @override
  String get thumbnailCategory => 'Минијатура';

  @override
  String get artCategory => 'Слика';

  @override
  String get discArtCategory => 'Слика на дискот';

  @override
  String get screenshotCategory => 'Слика од екранот';

  @override
  String get boxCoverCategory => 'Предна корица';

  @override
  String get boxRearCoverCategory => 'Задна корица';

  @override
  String get menuArtCategory => 'Слика на менито';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'позадина';

  @override
  String get confirmItemBanner => 'банер';

  @override
  String get confirmItemLogo => 'лого';

  @override
  String get confirmItemThumbnail => 'минијатура';

  @override
  String get confirmItemArt => 'слика';

  @override
  String get confirmItemDiscArt => 'слика на дискот';

  @override
  String get confirmItemScreenshot => 'слика од екранот';

  @override
  String get confirmItemBoxCover => 'предна корица';

  @override
  String get confirmItemBoxRearCover => 'задна корица';

  @override
  String get confirmItemMenuArt => 'слика на менито';

  @override
  String get resolutionAll => 'Сите';

  @override
  String get resolutionHigh => 'Висока (1080p+)';

  @override
  String get resolutionMedium => 'Средна (720p)';

  @override
  String get resolutionLow => 'Ниска (<720p)';

  @override
  String get sources => 'Извори';

  @override
  String get audiobookChapters => 'Поглавја';

  @override
  String get audiobookBookmarks => 'Обележувачи';

  @override
  String get audiobookNotes => 'Белешки';

  @override
  String get audiobookQueue => 'Редица';

  @override
  String get audiobookTimeline => 'Временска линија';

  @override
  String get audiobookTimelineEmpty => 'Временската линија е празна';

  @override
  String get audiobookWholeBook => 'Цела книга';

  @override
  String get audiobookFocusedTimeline => 'Фокусирана временска линија';

  @override
  String get audiobookExportBookmarks => 'Извези ги обележувачите';

  @override
  String get audiobookExportNotes => 'Извези ги белешките';

  @override
  String get audiobookExportAll => 'Извези сè';

  @override
  String audiobookExportSuccess(String path) {
    return 'Извезено во $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Извозот не успеа: $error';
  }

  @override
  String get audiobookLyrics => 'Текст';

  @override
  String get audiobookAddBookmark => 'Додај обележувач';

  @override
  String get audiobookAddNote => 'Додај белешка';

  @override
  String get audiobookEditNote => 'Уреди ја белешката';

  @override
  String get audiobookNoteHint => 'Напишете белешка за овој момент';

  @override
  String get audiobookSleepTimer => 'Тајмер за спиење';

  @override
  String get audiobookSleepOff => 'Исклучено';

  @override
  String get audiobookSleepEndOfChapter => 'Крај на поглавјето';

  @override
  String get audiobookSleepCustom => 'Прилагоден';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'уште $remaining';
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
  String get audiobookPlaybackSpeed => 'Брзина на репродукција';

  @override
  String get audiobookRemainingTime => 'Преостанато';

  @override
  String get audiobookElapsedTime => 'Изминато';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $secondsс';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Напред $secondsс';
  }

  @override
  String get audiobookPreviousChapter => 'Претходно поглавје';

  @override
  String get audiobookNextChapter => 'Следно поглавје';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Поглавје $current од $total';
  }

  @override
  String get audiobookNoChapters => 'Нема поглавја';

  @override
  String get audiobookNoBookmarks => 'Сè уште нема обележувачи';

  @override
  String get audiobookNoNotes => 'Сè уште нема белешки';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Додаден е обележувач на $position';
  }

  @override
  String get audiobookSpeedReset => 'Врати на 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Зачувај';

  @override
  String get audiobookCancel => 'Откажи';

  @override
  String get audiobookDelete => 'Избриши';

  @override
  String get subtitlePreferences => 'Преференции за преводите';

  @override
  String get subtitlePreferencesDescription =>
      'Променете ги режимите на преводите, стандардните јазици, изгледот и опциите за рендерирање.';

  @override
  String get subtitleRendering => 'Рендерирање на преводите';

  @override
  String get displayOptions => 'Опции за приказ';

  @override
  String get releaseDateAscending => 'Датум на издавање (растечки)';

  @override
  String get releaseDateDescending => 'Датум на издавање (опаѓачки)';

  @override
  String get groupContributions => 'Групирај ги придонесите';

  @override
  String get groupMultipleRoles => 'Групирај повеќе улоги';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Предупредување за пристап за запишување во библиотеката';

  @override
  String get libraryWriteAccessHowToFix => 'Како да го поправите ова:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Дајте дозволи за запишување на корисникот на услугата Jellyfin (на пр. jellyfin или Docker PUID/PGID) за папките на вашата медиумска библиотека на серверот.\n\n2. Или, одете во таблата на Jellyfin -> Библиотеки, уредете ја оваа библиотека и оневозможете „Зачувувај ги сликите во медиумските папки“ за сликите да се складираат во внатрешната база на податоци на Jellyfin.';

  @override
  String get dismiss => 'Отфрли';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Вашата библиотека „$libraryName“ е конфигурирана да ги зачувува сликите директно во медиумските папки (овозможено е „Зачувувај ги сликите во медиумските папки“). Меѓутоа, Jellyfin го тестираше пристапот за запишување и нема дозвола да запишува датотеки во овој директориум:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Изгледа дека Jellyfin не успеа да ја ажурира сликата. Вашата библиотека е конфигурирана да ги зачувува сликите директно во медиумските папки (овозможено е „Зачувувај ги сликите во медиумските папки“). Оваа грешка обично се јавува кога процесот на серверот Jellyfin нема дозвола да запишува датотеки во вашите медиумски директориуми.';

  @override
  String get externalLists => 'Надворешни списоци';

  @override
  String get replay => 'Пушти повторно';

  @override
  String get fileInformation => 'Информации за датотеката';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Големина: $size  •  Формат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Прикажи ги сите ($count) аудио записи';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Прикажи ги сите ($count) преводи';
  }

  @override
  String get checkingDirectPlay =>
      'Се проверува можноста за директно пуштање...';

  @override
  String get directPlayCapabilityLabel => 'Можност за директно пуштање: ';

  @override
  String get forced => 'Принудни';

  @override
  String get transcodeContainerNotSupported =>
      'Форматот на контејнерот не е поддржан од плеерот.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видео кодекот не е поддржан.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудио кодекот не е поддржан.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Форматот на преводот не е поддржан (бара втиснување).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аудио профилот не е поддржан.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Видео профилот не е поддржан.';

  @override
  String get transcodeVideoLevelNotSupported => 'Видео нивото не е поддржано.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Видео резолуцијата не е поддржана од овој уред.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Битската длабочина на видеото не е поддржана.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Честотата на кадри не е поддржана.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Битрејтот на датотеката го надминува лимитот за стриминг на плеерот.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Битрејтот на видеото го надминува лимитот за стриминг.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Битрејтот на аудиото го надминува лимитот за стриминг.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Бројот на аудио канали не е поддржан.';

  @override
  String get sortAlphabetical => 'Азбучно';

  @override
  String get sortReleaseAscending => 'Редослед на издавање (растечки)';

  @override
  String get sortReleaseDescending => 'Редослед на издавање (опаѓачки)';

  @override
  String get sortCustomDragDrop => 'Прилагоден (со влечење)';

  @override
  String get playlistSortOptions => 'Опции за подредување на плејлистата';

  @override
  String get resetSort => 'Ресетирај го подредувањето';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Гледај повторно С$season:Е$episode';
  }

  @override
  String get rewatchPlaylist => 'Гледај ја плејлистата повторно';

  @override
  String get noSubtitlesFound => 'Не се пронајдени преводи.';

  @override
  String get adminControls => 'Административни контроли';

  @override
  String get impellerRendering => 'Мотор за рендерирање (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller е модерниот GPU рендерер на Flutter за помазни анимации и помалку засекнувања. На некои TV уреди и постари GPU може да предизвика дефекти или црно видео; исклучете го ако забележите такви. „Автоматски“ ја избира најдобрата стандардна поставка за вашиот уред. Рестартирајте го Moonfin за да се примени.';

  @override
  String get impellerAuto => 'Автоматски';

  @override
  String get impellerOn => 'Вклучено';

  @override
  String get impellerOff => 'Исклучено';

  @override
  String get impellerRestartTitle => 'Потребно е рестартирање';

  @override
  String get impellerRestartMessage =>
      'Moonfin треба да се рестартира за да го смени моторот за рендерирање. Затворете ја апликацијата сега, потоа отворете ја повторно за да се примени.';

  @override
  String get impellerCloseNow => 'Затвори ја апликацијата сега';

  @override
  String get adminRefreshLibrary => 'Освежи ја библиотеката';

  @override
  String get adminRefreshAllLibraries => 'Освежи ги сите библиотеки';

  @override
  String get adminRepoSortDateOldest => 'Датум на додавање (најстарите први)';

  @override
  String get adminRepoSortDateNewest => 'Датум на додавање (најновите први)';

  @override
  String get adminRepoSortNameAsc => 'Азбучно (А до Ш)';

  @override
  String get adminRepoSortNameDesc => 'Азбучно (Ш до А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Се вчитува аналитиката на серверот... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Како изворот';

  @override
  String get imdbTop250Movies => 'IMDb Топ 250 филмови';

  @override
  String get imdbTop250TvShows => 'IMDb Топ 250 ТВ серии';

  @override
  String get imdbMostPopularMovies => 'IMDb Најпопуларни филмови';

  @override
  String get imdbMostPopularTvShows => 'IMDb Најпопуларни ТВ серии';

  @override
  String get imdbLowestRatedMovies => 'IMDb Најниско оценети филмови';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Најдобро оценети филмови на англиски';
}
